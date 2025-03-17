(get-info :version)
; (:version "4.12.1")
; Started: 2023-10-31 14:10:03
; Silicon.version: 1.1-SNAPSHOT (46944a65@dspil_symbenchmarking)
; Input file: /home/pcorrect/repos/benchmarking_general/silicon_tests/prusti_tests_._pass_._loop-invs_._result_in_guard_._result_in_guard.rs_result_in_guard--done-Both.vpr
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
(declare-sort Snap$struct$m_UnexpectedValue 0)
(declare-sort MirrorDomain 0)
(declare-sort Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ 0)
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
(declare-fun $SortWrappers.Snap$struct$m_UnexpectedValueTo$Snap (Snap$struct$m_UnexpectedValue) $Snap)
(declare-fun $SortWrappers.$SnapToSnap$struct$m_UnexpectedValue ($Snap) Snap$struct$m_UnexpectedValue)
(assert (forall ((x Snap$struct$m_UnexpectedValue)) (!
    (= x ($SortWrappers.$SnapToSnap$struct$m_UnexpectedValue($SortWrappers.Snap$struct$m_UnexpectedValueTo$Snap x)))
    :pattern (($SortWrappers.Snap$struct$m_UnexpectedValueTo$Snap x))
    :qid |$Snap.$SnapToSnap$struct$m_UnexpectedValueTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Snap$struct$m_UnexpectedValueTo$Snap($SortWrappers.$SnapToSnap$struct$m_UnexpectedValue x)))
    :pattern (($SortWrappers.$SnapToSnap$struct$m_UnexpectedValue x))
    :qid |$Snap.Snap$struct$m_UnexpectedValueTo$SnapToSnap$struct$m_UnexpectedValue|
    )))
(declare-fun $SortWrappers.MirrorDomainTo$Snap (MirrorDomain) $Snap)
(declare-fun $SortWrappers.$SnapToMirrorDomain ($Snap) MirrorDomain)
(assert (forall ((x MirrorDomain)) (!
    (= x ($SortWrappers.$SnapToMirrorDomain($SortWrappers.MirrorDomainTo$Snap x)))
    :pattern (($SortWrappers.MirrorDomainTo$Snap x))
    :qid |$Snap.$SnapToMirrorDomainTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.MirrorDomainTo$Snap($SortWrappers.$SnapToMirrorDomain x)))
    :pattern (($SortWrappers.$SnapToMirrorDomain x))
    :qid |$Snap.MirrorDomainTo$SnapToMirrorDomain|
    )))
(declare-fun $SortWrappers.Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_To$Snap (Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_) $Snap)
(declare-fun $SortWrappers.$SnapToSnap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap) Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)
(assert (forall ((x Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)) (!
    (= x ($SortWrappers.$SnapToSnap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($SortWrappers.Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_To$Snap x)))
    :pattern (($SortWrappers.Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_To$Snap x))
    :qid |$Snap.$SnapToSnap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_To$Snap($SortWrappers.$SnapToSnap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ x)))
    :pattern (($SortWrappers.$SnapToSnap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ x))
    :qid |$Snap.Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_To$SnapToSnap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_|
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
(declare-fun discriminant$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$<Int> (Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_) Int)
(declare-fun cons$0$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_<Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_> (Bool) Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)
(declare-fun Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$0$field$f$0__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$<Bool> (Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_) Bool)
(declare-fun cons$1$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$struct$m_UnexpectedValue$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_<Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_> (Snap$struct$m_UnexpectedValue) Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)
(declare-fun Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$1$field$f$0__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$struct$m_UnexpectedValue<Snap$struct$m_UnexpectedValue> (Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_) Snap$struct$m_UnexpectedValue)
(declare-fun cons$0$__$TY$__Snap$struct$m_UnexpectedValue$$int$$Snap$struct$m_UnexpectedValue<Snap$struct$m_UnexpectedValue> (Int) Snap$struct$m_UnexpectedValue)
(declare-fun Snap$struct$m_UnexpectedValue$0$field$f$0__$TY$__Snap$struct$m_UnexpectedValue$$int$<Int> (Snap$struct$m_UnexpectedValue) Int)
(declare-fun mirror_simple$m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$<Bool> (Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_) Bool)
; Declaring symbols related to program functions (from program analysis)
(declare-fun read$ ($Snap) $Perm)
(declare-fun read$%limited ($Snap) $Perm)
(declare-const read$%stateless Bool)
(declare-fun read$%precondition ($Snap) Bool)
(declare-fun snap$__$TY$__Snap$struct$m_UnexpectedValue$struct$m_UnexpectedValue$Snap$struct$m_UnexpectedValue ($Snap $Ref) Snap$struct$m_UnexpectedValue)
(declare-fun snap$__$TY$__Snap$struct$m_UnexpectedValue$struct$m_UnexpectedValue$Snap$struct$m_UnexpectedValue%limited ($Snap $Ref) Snap$struct$m_UnexpectedValue)
(declare-fun snap$__$TY$__Snap$struct$m_UnexpectedValue$struct$m_UnexpectedValue$Snap$struct$m_UnexpectedValue%stateless ($Ref) Bool)
(declare-fun snap$__$TY$__Snap$struct$m_UnexpectedValue$struct$m_UnexpectedValue$Snap$struct$m_UnexpectedValue%precondition ($Snap $Ref) Bool)
(declare-fun builtin$unreach__$TY$__$bool$$$bool$ ($Snap) Bool)
(declare-fun builtin$unreach__$TY$__$bool$$$bool$%limited ($Snap) Bool)
(declare-const builtin$unreach__$TY$__$bool$$$bool$%stateless Bool)
(declare-fun builtin$unreach__$TY$__$bool$$$bool$%precondition ($Snap) Bool)
(declare-fun m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_) Bool)
(declare-fun m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited ($Snap Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_) Bool)
(declare-fun m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%stateless (Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_) Bool)
(declare-fun m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_) Bool)
(declare-fun builtin$unreach__$TY$__$int$$$int$ ($Snap) Int)
(declare-fun builtin$unreach__$TY$__$int$$$int$%limited ($Snap) Int)
(declare-const builtin$unreach__$TY$__$int$$$int$%stateless Bool)
(declare-fun builtin$unreach__$TY$__$int$$$int$%precondition ($Snap) Bool)
(declare-fun m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_) Bool)
(declare-fun m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited ($Snap Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_) Bool)
(declare-fun m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%stateless (Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_) Bool)
(declare-fun m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_) Bool)
(declare-fun snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap $Ref) Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)
(declare-fun snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%limited ($Snap $Ref) Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)
(declare-fun snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%stateless ($Ref) Bool)
(declare-fun snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%precondition ($Snap $Ref) Bool)
(declare-fun m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_) Bool)
(declare-fun m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited ($Snap Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_) Bool)
(declare-fun m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%stateless (Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_) Bool)
(declare-fun m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_) Bool)
(declare-fun m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$ ($Snap Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_) Int)
(declare-fun m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited ($Snap Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_) Int)
(declare-fun m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%stateless (Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_) Bool)
(declare-fun m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_) Bool)
(declare-fun m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$ ($Snap $Ref) Int)
(declare-fun m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited ($Snap $Ref) Int)
(declare-fun m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%stateless ($Ref) Bool)
(declare-fun m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun DeadBorrowToken$%trigger ($Snap Int) Bool)
(declare-fun bool%trigger ($Snap $Ref) Bool)
(declare-fun m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%trigger ($Snap $Ref) Bool)
(declare-fun m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_Err%trigger ($Snap $Ref) Bool)
(declare-fun m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_Ok%trigger ($Snap $Ref) Bool)
(declare-fun struct$m_UnexpectedValue%trigger ($Snap $Ref) Bool)
(declare-fun u32%trigger ($Snap $Ref) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((self Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (and
    (<=
      0
      (discriminant$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$<Int> self))
    (<=
      (discriminant$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$<Int> self)
      1))
  :pattern ((discriminant$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$<Int> self))
  :qid |prog.Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$discriminant_range|)))
(assert (forall ((_l_0 Bool) (_r_0 Bool)) (!
  (=>
    (=
      (cons$0$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_<Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_> _l_0)
      (cons$0$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_<Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_> _r_0))
    (= _l_0 _r_0))
  :pattern ((cons$0$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_<Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_> _l_0) (cons$0$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_<Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_> _r_0))
  :qid |prog.Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$0$injectivity|)))
(assert (forall ((_0 Bool)) (!
  (=
    (discriminant$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$<Int> (cons$0$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_<Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_> _0))
    0)
  :pattern ((cons$0$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_<Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_> _0))
  :qid |prog.Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$0$discriminant_axiom|)))
(assert (forall ((_0 Bool)) (!
  (=
    (Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$0$field$f$0__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$<Bool> (cons$0$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_<Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_> _0))
    _0)
  :pattern ((Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$0$field$f$0__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$<Bool> (cons$0$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_<Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_> _0)))
  :qid |prog.Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$0$field$f$0$axiom|)))
(assert (forall ((_l_0 Snap$struct$m_UnexpectedValue) (_r_0 Snap$struct$m_UnexpectedValue)) (!
  (=>
    (=
      (cons$1$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$struct$m_UnexpectedValue$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_<Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_> _l_0)
      (cons$1$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$struct$m_UnexpectedValue$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_<Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_> _r_0))
    (= _l_0 _r_0))
  :pattern ((cons$1$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$struct$m_UnexpectedValue$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_<Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_> _l_0) (cons$1$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$struct$m_UnexpectedValue$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_<Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_> _r_0))
  :qid |prog.Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$1$injectivity|)))
(assert (forall ((_0 Snap$struct$m_UnexpectedValue)) (!
  (=
    (discriminant$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$<Int> (cons$1$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$struct$m_UnexpectedValue$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_<Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_> _0))
    1)
  :pattern ((cons$1$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$struct$m_UnexpectedValue$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_<Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_> _0))
  :qid |prog.Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$1$discriminant_axiom|)))
(assert (forall ((_0 Snap$struct$m_UnexpectedValue)) (!
  (=
    (Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$1$field$f$0__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$struct$m_UnexpectedValue<Snap$struct$m_UnexpectedValue> (cons$1$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$struct$m_UnexpectedValue$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_<Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_> _0))
    _0)
  :pattern ((Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$1$field$f$0__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$struct$m_UnexpectedValue<Snap$struct$m_UnexpectedValue> (cons$1$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$struct$m_UnexpectedValue$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_<Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_> _0)))
  :qid |prog.Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$1$field$f$0$axiom|)))
(assert (forall ((_l_0 Int) (_r_0 Int)) (!
  (=>
    (=
      (cons$0$__$TY$__Snap$struct$m_UnexpectedValue$$int$$Snap$struct$m_UnexpectedValue<Snap$struct$m_UnexpectedValue> _l_0)
      (cons$0$__$TY$__Snap$struct$m_UnexpectedValue$$int$$Snap$struct$m_UnexpectedValue<Snap$struct$m_UnexpectedValue> _r_0))
    (= _l_0 _r_0))
  :pattern ((cons$0$__$TY$__Snap$struct$m_UnexpectedValue$$int$$Snap$struct$m_UnexpectedValue<Snap$struct$m_UnexpectedValue> _l_0) (cons$0$__$TY$__Snap$struct$m_UnexpectedValue$$int$$Snap$struct$m_UnexpectedValue<Snap$struct$m_UnexpectedValue> _r_0))
  :qid |prog.Snap$struct$m_UnexpectedValue$0$injectivity|)))
(assert (forall ((_0 Int)) (!
  (=
    (Snap$struct$m_UnexpectedValue$0$field$f$0__$TY$__Snap$struct$m_UnexpectedValue$$int$<Int> (cons$0$__$TY$__Snap$struct$m_UnexpectedValue$$int$$Snap$struct$m_UnexpectedValue<Snap$struct$m_UnexpectedValue> _0))
    _0)
  :pattern ((Snap$struct$m_UnexpectedValue$0$field$f$0__$TY$__Snap$struct$m_UnexpectedValue$$int$<Int> (cons$0$__$TY$__Snap$struct$m_UnexpectedValue$$int$$Snap$struct$m_UnexpectedValue<Snap$struct$m_UnexpectedValue> _0)))
  :qid |prog.Snap$struct$m_UnexpectedValue$0$field$f$0$axiom|)))
(assert (forall ((self Snap$struct$m_UnexpectedValue)) (!
  (and
    (<=
      0
      (Snap$struct$m_UnexpectedValue$0$field$f$0__$TY$__Snap$struct$m_UnexpectedValue$$int$<Int> self))
    (<=
      (Snap$struct$m_UnexpectedValue$0$field$f$0__$TY$__Snap$struct$m_UnexpectedValue$$int$<Int> self)
      4294967295))
  :pattern ((Snap$struct$m_UnexpectedValue$0$field$f$0__$TY$__Snap$struct$m_UnexpectedValue$$int$<Int> self))
  :qid |prog.Snap$struct$m_UnexpectedValue$0$field$f$0$valid|)))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(declare-fun joined_unfolding@20@00 ($Snap $Ref) Int)
(declare-fun joined_unfolding@26@00 ($Snap $Ref) Int)
(declare-fun $unresolved@22@00 () $Snap)
(declare-fun $unresolved@24@00 () $Snap)
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
  :qid |quant-u-20|)))
(assert (forall ((s@$ $Snap)) (!
  (let ((result@0@00 (read$%limited s@$))) true)
  :pattern ((read$%limited s@$))
  :qid |quant-u-21|)))
(assert (forall ((s@$ $Snap)) (!
  (let ((result@0@00 (read$%limited s@$))) true)
  :pattern ((read$%limited s@$))
  :qid |quant-u-22|)))
(assert (forall ((s@$ $Snap) (self@1@00 $Ref)) (!
  (=
    (snap$__$TY$__Snap$struct$m_UnexpectedValue$struct$m_UnexpectedValue$Snap$struct$m_UnexpectedValue%limited s@$ self@1@00)
    (snap$__$TY$__Snap$struct$m_UnexpectedValue$struct$m_UnexpectedValue$Snap$struct$m_UnexpectedValue s@$ self@1@00))
  :pattern ((snap$__$TY$__Snap$struct$m_UnexpectedValue$struct$m_UnexpectedValue$Snap$struct$m_UnexpectedValue s@$ self@1@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (self@1@00 $Ref)) (!
  (snap$__$TY$__Snap$struct$m_UnexpectedValue$struct$m_UnexpectedValue$Snap$struct$m_UnexpectedValue%stateless self@1@00)
  :pattern ((snap$__$TY$__Snap$struct$m_UnexpectedValue$struct$m_UnexpectedValue$Snap$struct$m_UnexpectedValue%limited s@$ self@1@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (self@1@00 $Ref)) (!
  (=>
    (snap$__$TY$__Snap$struct$m_UnexpectedValue$struct$m_UnexpectedValue$Snap$struct$m_UnexpectedValue%precondition s@$ self@1@00)
    (=
      (snap$__$TY$__Snap$struct$m_UnexpectedValue$struct$m_UnexpectedValue$Snap$struct$m_UnexpectedValue s@$ self@1@00)
      (cons$0$__$TY$__Snap$struct$m_UnexpectedValue$$int$$Snap$struct$m_UnexpectedValue<Snap$struct$m_UnexpectedValue> ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))))
  :pattern ((snap$__$TY$__Snap$struct$m_UnexpectedValue$struct$m_UnexpectedValue$Snap$struct$m_UnexpectedValue s@$ self@1@00))
  :qid |quant-u-23|)))
(assert (forall ((s@$ $Snap) (self@1@00 $Ref)) (!
  true
  :pattern ((snap$__$TY$__Snap$struct$m_UnexpectedValue$struct$m_UnexpectedValue$Snap$struct$m_UnexpectedValue s@$ self@1@00))
  :qid |quant-u-24|)))
(assert (forall ((s@$ $Snap)) (!
  (=
    (builtin$unreach__$TY$__$bool$$$bool$%limited s@$)
    (builtin$unreach__$TY$__$bool$$$bool$ s@$))
  :pattern ((builtin$unreach__$TY$__$bool$$$bool$ s@$))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap)) (!
  (as builtin$unreach__$TY$__$bool$$$bool$%stateless  Bool)
  :pattern ((builtin$unreach__$TY$__$bool$$$bool$%limited s@$))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (_1@4@00 Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (=
    (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited s@$ _1@4@00)
    (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ s@$ _1@4@00))
  :pattern ((m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ s@$ _1@4@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (_1@4@00 Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%stateless _1@4@00)
  :pattern ((m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited s@$ _1@4@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (_1@4@00 Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (let ((result@5@00 (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited s@$ _1@4@00))) true)
  :pattern ((m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited s@$ _1@4@00))
  :qid |quant-u-25|)))
(assert (forall ((s@$ $Snap) (_1@4@00 Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (let ((result@5@00 (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited s@$ _1@4@00))) true)
  :pattern ((m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited s@$ _1@4@00))
  :qid |quant-u-26|)))
(assert (forall ((s@$ $Snap) (_1@4@00 Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (=>
    (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition s@$ _1@4@00)
    (=
      (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ s@$ _1@4@00)
      (=
        (discriminant$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$<Int> _1@4@00)
        0)))
  :pattern ((m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ s@$ _1@4@00))
  :qid |quant-u-27|)))
(assert (forall ((s@$ $Snap) (_1@4@00 Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)) (!
  true
  :pattern ((m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ s@$ _1@4@00))
  :qid |quant-u-28|)))
(assert (forall ((s@$ $Snap)) (!
  (=
    (builtin$unreach__$TY$__$int$$$int$%limited s@$)
    (builtin$unreach__$TY$__$int$$$int$ s@$))
  :pattern ((builtin$unreach__$TY$__$int$$$int$ s@$))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap)) (!
  (as builtin$unreach__$TY$__$int$$$int$%stateless  Bool)
  :pattern ((builtin$unreach__$TY$__$int$$$int$%limited s@$))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (_1@7@00 Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (=
    (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited s@$ _1@7@00)
    (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ s@$ _1@7@00))
  :pattern ((m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ s@$ _1@7@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (_1@7@00 Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%stateless _1@7@00)
  :pattern ((m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited s@$ _1@7@00))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap) (_1@7@00 Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (let ((result@8@00 (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited s@$ _1@7@00))) true)
  :pattern ((m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited s@$ _1@7@00))
  :qid |quant-u-29|)))
(assert (forall ((s@$ $Snap) (_1@7@00 Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (let ((result@8@00 (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited s@$ _1@7@00))) true)
  :pattern ((m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited s@$ _1@7@00))
  :qid |quant-u-30|)))
(assert (forall ((s@$ $Snap) (_1@7@00 Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (=>
    (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition s@$ _1@7@00)
    (=
      (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ s@$ _1@7@00)
      (=
        (discriminant$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$<Int> _1@7@00)
        1)))
  :pattern ((m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ s@$ _1@7@00))
  :qid |quant-u-31|)))
(assert (forall ((s@$ $Snap) (_1@7@00 Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)) (!
  true
  :pattern ((m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ s@$ _1@7@00))
  :qid |quant-u-32|)))
(assert (forall ((s@$ $Snap) (self@9@00 $Ref)) (!
  (=
    (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%limited s@$ self@9@00)
    (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ s@$ self@9@00))
  :pattern ((snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ s@$ self@9@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (self@9@00 $Ref)) (!
  (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%stateless self@9@00)
  :pattern ((snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%limited s@$ self@9@00))
  :qid |quant-u-13|)))
(assert (forall ((s@$ $Snap) (self@9@00 $Ref)) (!
  (=>
    (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%precondition s@$ self@9@00)
    (=
      (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ s@$ self@9@00)
      (ite
        (= ($SortWrappers.$SnapToInt ($Snap.first s@$)) 1)
        (cons$1$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$struct$m_UnexpectedValue$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_<Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_> (snap$__$TY$__Snap$struct$m_UnexpectedValue$struct$m_UnexpectedValue$Snap$struct$m_UnexpectedValue ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
        (cons$0$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_<Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_> ($SortWrappers.$SnapToBool ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))))
  :pattern ((snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ s@$ self@9@00))
  :pattern ((snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%stateless self@9@00) (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%trigger s@$ self@9@00))
  :qid |quant-u-33|)))
(assert (forall ((s@$ $Snap) (self@9@00 $Ref)) (!
  (=>
    (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%precondition s@$ self@9@00)
    (ite
      (= ($SortWrappers.$SnapToInt ($Snap.first s@$)) 1)
      (snap$__$TY$__Snap$struct$m_UnexpectedValue$struct$m_UnexpectedValue$Snap$struct$m_UnexpectedValue%precondition ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
      true))
  :pattern ((snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ s@$ self@9@00))
  :qid |quant-u-34|)))
(assert (forall ((s@$ $Snap) (_1@11@00 Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (=
    (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited s@$ _1@11@00)
    (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ s@$ _1@11@00))
  :pattern ((m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ s@$ _1@11@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (_1@11@00 Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%stateless _1@11@00)
  :pattern ((m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited s@$ _1@11@00))
  :qid |quant-u-15|)))
(assert (forall ((s@$ $Snap) (_1@11@00 Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (let ((result@12@00 (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited s@$ _1@11@00))) (=>
    (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition s@$ _1@11@00)
    (=
      result@12@00
      (mirror_simple$m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$<Bool> _1@11@00))))
  :pattern ((m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited s@$ _1@11@00))
  :qid |quant-u-35|)))
(assert (forall ((s@$ $Snap) (_1@11@00 Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (let ((result@12@00 (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited s@$ _1@11@00))) true)
  :pattern ((m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited s@$ _1@11@00))
  :qid |quant-u-36|)))
(assert (forall ((s@$ $Snap) (_1@11@00 Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (let ((result@12@00 (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited s@$ _1@11@00))) true)
  :pattern ((m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited s@$ _1@11@00))
  :qid |quant-u-37|)))
(assert (forall ((s@$ $Snap) (_1@11@00 Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (=>
    (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition s@$ _1@11@00)
    (=
      (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ s@$ _1@11@00)
      (and
        (=>
          (=
            (discriminant$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$<Int> _1@11@00)
            0)
          (Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$0$field$f$0__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$<Bool> _1@11@00))
        (=>
          (not
            (=
              (discriminant$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$<Int> _1@11@00)
              0))
          (builtin$unreach__$TY$__$bool$$$bool$ $unresolved@22@00)))))
  :pattern ((m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ s@$ _1@11@00))
  :qid |quant-u-38|)))
(assert (forall ((s@$ $Snap) (_1@11@00 Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (=>
    (and
      (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition s@$ _1@11@00)
      (and
        (=>
          (=
            (discriminant$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$<Int> _1@11@00)
            0)
          (Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$0$field$f$0__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$<Bool> _1@11@00))
        (not
          (=
            (discriminant$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$<Int> _1@11@00)
            0))))
    (builtin$unreach__$TY$__$bool$$$bool$%precondition $unresolved@22@00))
  :pattern ((m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ s@$ _1@11@00))
  :qid |quant-u-39|)))
(assert (forall ((s@$ $Snap) (_1@13@00 Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (=
    (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ _1@13@00)
    (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$ s@$ _1@13@00))
  :pattern ((m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$ s@$ _1@13@00))
  :qid |quant-u-16|)))
(assert (forall ((s@$ $Snap) (_1@13@00 Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%stateless _1@13@00)
  :pattern ((m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ _1@13@00))
  :qid |quant-u-17|)))
(assert (forall ((s@$ $Snap) (_1@13@00 Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (let ((result@14@00 (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ _1@13@00))) (=>
    (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition s@$ _1@13@00)
    (<= 0 result@14@00)))
  :pattern ((m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ _1@13@00))
  :qid |quant-u-40|)))
(assert (forall ((s@$ $Snap) (_1@13@00 Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (let ((result@14@00 (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ _1@13@00))) true)
  :pattern ((m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ _1@13@00))
  :qid |quant-u-41|)))
(assert (forall ((s@$ $Snap) (_1@13@00 Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (let ((result@14@00 (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ _1@13@00))) true)
  :pattern ((m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ _1@13@00))
  :qid |quant-u-42|)))
(assert (forall ((s@$ $Snap) (_1@13@00 Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (=>
    (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition s@$ _1@13@00)
    (=
      (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$ s@$ _1@13@00)
      (ite
        (=
          (discriminant$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$<Int> _1@13@00)
          1)
        (Snap$struct$m_UnexpectedValue$0$field$f$0__$TY$__Snap$struct$m_UnexpectedValue$$int$<Int> (Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$1$field$f$0__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$struct$m_UnexpectedValue<Snap$struct$m_UnexpectedValue> _1@13@00))
        (builtin$unreach__$TY$__$int$$$int$ $unresolved@24@00))))
  :pattern ((m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$ s@$ _1@13@00))
  :qid |quant-u-43|)))
(assert (forall ((s@$ $Snap) (_1@13@00 Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (=>
    (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition s@$ _1@13@00)
    (ite
      (=
        (discriminant$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$<Int> _1@13@00)
        1)
      true
      (builtin$unreach__$TY$__$int$$$int$%precondition $unresolved@24@00)))
  :pattern ((m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$ s@$ _1@13@00))
  :qid |quant-u-44|)))
(assert (forall ((s@$ $Snap) (self@15@00 $Ref)) (!
  (=
    (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ self@15@00)
    (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$ s@$ self@15@00))
  :pattern ((m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$ s@$ self@15@00))
  :qid |quant-u-18|)))
(assert (forall ((s@$ $Snap) (self@15@00 $Ref)) (!
  (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%stateless self@15@00)
  :pattern ((m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ self@15@00))
  :qid |quant-u-19|)))
(assert (forall ((s@$ $Snap) (self@15@00 $Ref)) (!
  (let ((result@16@00 (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ self@15@00))) (=>
    (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition s@$ self@15@00)
    (and
      (and (<= 0 result@16@00) (<= result@16@00 1))
      (=
        (discriminant$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$<Int> (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ s@$ self@15@00))
        result@16@00))))
  :pattern ((m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ self@15@00))
  :qid |quant-u-45|)))
(assert (forall ((s@$ $Snap) (self@15@00 $Ref)) (!
  (let ((result@16@00 (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ self@15@00))) true)
  :pattern ((m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ self@15@00))
  :qid |quant-u-46|)))
(assert (forall ((s@$ $Snap) (self@15@00 $Ref)) (!
  (let ((result@16@00 (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ self@15@00))) (=>
    (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition s@$ self@15@00)
    (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%precondition s@$ self@15@00)))
  :pattern ((m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ self@15@00))
  :qid |quant-u-47|)))
(assert (forall ((s@$ $Snap) (self@15@00 $Ref)) (!
  (=>
    (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition s@$ self@15@00)
    (=
      (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$ s@$ self@15@00)
      ($SortWrappers.$SnapToInt ($Snap.first s@$))))
  :pattern ((m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$ s@$ self@15@00))
  :qid |quant-u-48|)))
(assert (forall ((s@$ $Snap) (self@15@00 $Ref)) (!
  true
  :pattern ((m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$ s@$ self@15@00))
  :qid |quant-u-49|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- m_done ----------
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
; var _1: Ref
(declare-const _1@15@01 $Ref)
; [exec]
; var _2: Ref
(declare-const _2@16@01 $Ref)
; [exec]
; var _3: Ref
(declare-const _3@17@01 $Ref)
; [exec]
; var _4: Int
(declare-const _4@18@01 Int)
; [exec]
; var _5: Ref
(declare-const _5@19@01 $Ref)
; [exec]
; var _6: Int
(declare-const _6@20@01 Int)
; [exec]
; var _7: Ref
(declare-const _7@21@01 $Ref)
; [exec]
; var _8: Int
(declare-const _8@22@01 Int)
; [exec]
; var _9: Ref
(declare-const _9@23@01 $Ref)
; [exec]
; var _10: Ref
(declare-const _10@24@01 $Ref)
; [exec]
; var _11: Ref
(declare-const _11@25@01 $Ref)
; [exec]
; var _13: Ref
(declare-const _13@26@01 $Ref)
; [exec]
; var _14: Ref
(declare-const _14@27@01 $Ref)
; [exec]
; var _15: Ref
(declare-const _15@28@01 $Ref)
; [exec]
; var _16: Ref
(declare-const _16@29@01 $Ref)
; [exec]
; var _17: Ref
(declare-const _17@30@01 $Ref)
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
; inhale acc(u32(_1), write)
(declare-const $t@31@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale true
(declare-const $t@32@01 $Snap)
(assert (= $t@32@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (unfolding acc(u32(_1), write) in 0 <= _1.val_int)
(declare-const $t@33@01 $Snap)
(assert (= $t@33@01 $Snap.unit))
; [eval] (unfolding acc(u32(_1), write) in 0 <= _1.val_int)
(set-option :timeout 0)
(push) ; 3
(assert (u32%trigger $t@31@01 _1@15@01))
(assert (= $t@31@01 ($Snap.combine ($Snap.first $t@31@01) ($Snap.second $t@31@01))))
(assert (not (= _1@15@01 $Ref.null)))
(assert (= ($Snap.second $t@31@01) $Snap.unit))
; [eval] 0 <= self.val_int
(assert (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@31@01))))
; [eval] 0 <= _1.val_int
(pop) ; 3
; Joined path conditions
(assert (and
  (u32%trigger $t@31@01 _1@15@01)
  (= $t@31@01 ($Snap.combine ($Snap.first $t@31@01) ($Snap.second $t@31@01)))
  (not (= _1@15@01 $Ref.null))
  (= ($Snap.second $t@31@01) $Snap.unit)
  (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label pre
; [exec]
; __t0 := true
; [exec]
; _4 := builtin$havoc_int()
(declare-const ret@34@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; unfold acc(u32(_1), write)
; [eval] 0 <= self.val_int
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; _4 := _1.val_int
(declare-const _4@35@01 Int)
(assert (= _4@35@01 ($SortWrappers.$SnapToInt ($Snap.first $t@31@01))))
; [exec]
; label l0
; [exec]
; _3 := builtin$havoc_ref()
(declare-const ret@36@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_3.val_bool, write)
(declare-const $t@37@01 Bool)
(assert (not (= ret@36@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _3.val_bool := 0 <= _4
; [eval] 0 <= _4
(declare-const val_bool@38@01 Bool)
(assert (= val_bool@38@01 (<= 0 _4@35@01)))
; [exec]
; __t10 := _3.val_bool
; [eval] !__t10
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not val_bool@38@01))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [then-branch: 0 | !(val_bool@38@01) | dead]
; [else-branch: 0 | val_bool@38@01 | live]
(set-option :timeout 0)
(push) ; 3
; [else-branch: 0 | val_bool@38@01]
(assert val_bool@38@01)
(pop) ; 3
; [eval] !!__t10
; [eval] !__t10
(push) ; 3
(set-option :timeout 10)
(assert (not (not val_bool@38@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not val_bool@38@01))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [then-branch: 1 | val_bool@38@01 | live]
; [else-branch: 1 | !(val_bool@38@01) | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | val_bool@38@01]
(assert val_bool@38@01)
; [exec]
; label return
; [exec]
; __t1 := true
; [exec]
; _6 := builtin$havoc_int()
(declare-const ret@39@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _6 := _1.val_int
(declare-const _6@40@01 Int)
(assert (= _6@40@01 ($SortWrappers.$SnapToInt ($Snap.first $t@31@01))))
; [exec]
; label l3
; [exec]
; _5 := builtin$havoc_ref()
(declare-const ret@41@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_5.val_bool, write)
(declare-const $t@42@01 Bool)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@36@01 ret@41@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@41@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _5.val_bool := _6 <= 10
; [eval] _6 <= 10
(declare-const val_bool@43@01 Bool)
(assert (= val_bool@43@01 (<= _6@40@01 10)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@36@01 ret@41@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; _2 := _5
; [exec]
; label l4
; [exec]
; label l1
; [exec]
; __t3 := true
; [exec]
; __t11 := _2.val_bool
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not val_bool@43@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not val_bool@43@01))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 2 | val_bool@43@01 | live]
; [else-branch: 2 | !(val_bool@43@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 2 | val_bool@43@01]
(assert val_bool@43@01)
; [exec]
; label bb3
; [exec]
; __t4 := true
; [exec]
; _8 := builtin$havoc_int()
(declare-const ret@44@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _8 := _1.val_int
(declare-const _8@45@01 Int)
(assert (= _8@45@01 ($SortWrappers.$SnapToInt ($Snap.first $t@31@01))))
; [exec]
; label l7
; [exec]
; _7 := builtin$havoc_ref()
(declare-const ret@46@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_7.val_bool, write)
(declare-const $t@47@01 Bool)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@36@01 ret@46@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@41@01 ret@46@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@46@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _7.val_bool := _8 == 10
; [eval] _8 == 10
(declare-const val_bool@48@01 Bool)
(assert (= val_bool@48@01 (= _8@45@01 10)))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@41@01 ret@46@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@36@01 ret@46@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; _0 := builtin$havoc_ref()
(declare-const ret@49@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0), write)
(declare-const $t@50@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$(_0) ==
;   0
(declare-const $t@51@01 $Snap)
(assert (= $t@51@01 $Snap.unit))
; [eval] m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$(_0) == 0
; [eval] m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$(_0)
(set-option :timeout 0)
(push) ; 5
; [eval] read$()
(push) ; 6
(assert (read$%precondition $Snap.unit))
(pop) ; 6
; Joined path conditions
(assert (read$%precondition $Snap.unit))
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
(assert (<= $Perm.No (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))))
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
(assert (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition $t@50@01 ret@49@01))
(pop) ; 5
; Joined path conditions
(assert (and
  (read$%precondition $Snap.unit)
  (<= $Perm.No (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))))
  (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition $t@50@01 ret@49@01)))
(assert (=
  (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$ $t@50@01 ret@49@01)
  0))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; unfold acc(m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0), write)
(assert (= $t@50@01 ($Snap.combine ($Snap.first $t@50@01) ($Snap.second $t@50@01))))
(assert (not (= ret@49@01 $Ref.null)))
(assert (=
  ($Snap.second $t@50@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@50@01))
    ($Snap.second ($Snap.second $t@50@01)))))
(assert (= ($Snap.first ($Snap.second $t@50@01)) $Snap.unit))
; [eval] 0 <= self.discriminant
(assert (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@50@01))))
(assert (=
  ($Snap.second ($Snap.second $t@50@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@50@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@50@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@50@01))) $Snap.unit))
; [eval] self.discriminant <= 1
(assert (<= ($SortWrappers.$SnapToInt ($Snap.first $t@50@01)) 1))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@50@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01))))))))
; [eval] self.discriminant == 1
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@50@01)) 1))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 3 | First:($t@50@01) == 1 | dead]
; [else-branch: 3 | First:($t@50@01) != 1 | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 3 | First:($t@50@01) != 1]
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@50@01)) 1)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%trigger $t@50@01 ret@49@01))
; [exec]
; unfold acc(m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_Ok(_0.enum_Ok), write)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))))))
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
    $Ref.null)))
; State saturation: after unfold
(check-sat)
; unknown
(assert (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_Ok%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))))
; [exec]
; _0.enum_Ok.f$0 := _7
; [exec]
; label l8
; [exec]
; fold acc(bool(_0.enum_Ok.f$0), write)
(assert (bool%trigger ($SortWrappers.BoolTo$Snap val_bool@48@01) ret@46@01))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))))
  ret@46@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_Ok(_0.enum_Ok), write)
(assert (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_Ok%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap ret@46@01)
  ($SortWrappers.BoolTo$Snap val_bool@48@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))))
; [exec]
; fold acc(m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0), write)
; [eval] 0 <= self.discriminant
; [eval] self.discriminant <= 1
; [eval] self.discriminant == 1
; [then-branch: 4 | First:($t@50@01) == 1 | dead]
; [else-branch: 4 | First:($t@50@01) != 1 | live]
(set-option :timeout 0)
(push) ; 6
; [else-branch: 4 | First:($t@50@01) != 1]
(assert (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%trigger ($Snap.combine
  ($Snap.first $t@50@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@46@01)
            ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))
; [exec]
; label l5
; [exec]
; __t9 := true
; [exec]
; label l20
; [exec]
; assert (!(old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) > 10) ||
;   m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)) &&
;   m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)) ==
;   old[pre]((unfolding acc(u32(_1), write) in _1.val_int))) &&
;   ((!m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)) ||
;   m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)) >
;   10) &&
;   ((!(old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) <= 10) ||
;   m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0))) &&
;   ((!m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)) ||
;   old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) <= 10) &&
;   ((old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) < 0 ||
;   (10 <= old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) ||
;   !m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)))) &&
;   ((!m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)) ||
;   (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)) ||
;   0 <= old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) &&
;   old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) < 10)) &&
;   ((!(old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) == 10) ||
;   m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0))) &&
;   (!m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)) ||
;   (!m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)) ||
;   old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) == 10))))))))
; [eval] !(old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) > 10) || m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)) && m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)) == old[pre]((unfolding acc(u32(_1), write) in _1.val_int))
; [eval] !(old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) > 10)
; [eval] old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) > 10
; [eval] old[pre]((unfolding acc(u32(_1), write) in _1.val_int))
; [eval] (unfolding acc(u32(_1), write) in _1.val_int)
(push) ; 7
; [eval] 0 <= self.val_int
(pop) ; 7
; Joined path conditions
(push) ; 7
; [then-branch: 5 | !(First:($t@31@01) > 10) | live]
; [else-branch: 5 | First:($t@31@01) > 10 | live]
(push) ; 8
; [then-branch: 5 | !(First:($t@31@01) > 10)]
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10)))
(pop) ; 8
(push) ; 8
; [else-branch: 5 | First:($t@31@01) > 10]
(assert (> ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10))
; [eval] m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)) && m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)) == old[pre]((unfolding acc(u32(_1), write) in _1.val_int))
; [eval] m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)
(push) ; 9
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
; unsat
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
(assert (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%precondition ($Snap.combine
  ($Snap.first $t@50@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@46@01)
            ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))
(pop) ; 9
; Joined path conditions
(assert (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%precondition ($Snap.combine
  ($Snap.first $t@50@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@46@01)
            ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))
(set-option :timeout 0)
(push) ; 9
(assert (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@50@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@46@01)
            ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))
(pop) ; 9
; Joined path conditions
(assert (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@50@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@46@01)
            ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))
(push) ; 9
; [then-branch: 6 | m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_((First:($t@50@01), (_, (_, (First:(Second:(Second:(Second:($t@50@01)))), (First:(Second:(Second:(Second:(Second:($t@50@01))))), (ret@46@01, val_bool@48@01)))))), ret@49@01)) | live]
; [else-branch: 6 | !(m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_((First:($t@50@01), (_, (_, (First:(Second:(Second:(Second:($t@50@01)))), (First:(Second:(Second:(Second:(Second:($t@50@01))))), (ret@46@01, val_bool@48@01)))))), ret@49@01))) | live]
(push) ; 10
; [then-branch: 6 | m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_((First:($t@50@01), (_, (_, (First:(Second:(Second:(Second:($t@50@01)))), (First:(Second:(Second:(Second:(Second:($t@50@01))))), (ret@46@01, val_bool@48@01)))))), ret@49@01))]
(assert (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@50@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@46@01)
            ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))
; [eval] m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)) == old[pre]((unfolding acc(u32(_1), write) in _1.val_int))
; [eval] m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)
(push) ; 11
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
; unsat
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
(pop) ; 11
; Joined path conditions
(set-option :timeout 0)
(push) ; 11
; [eval] m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(_1)
(push) ; 12
(pop) ; 12
; Joined path conditions
(assert (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@50@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@46@01)
            ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))
(pop) ; 11
; Joined path conditions
(assert (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@50@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@46@01)
            ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))
; [eval] old[pre]((unfolding acc(u32(_1), write) in _1.val_int))
; [eval] (unfolding acc(u32(_1), write) in _1.val_int)
(push) ; 11
; [eval] 0 <= self.val_int
(pop) ; 11
; Joined path conditions
(pop) ; 10
(push) ; 10
; [else-branch: 6 | !(m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_((First:($t@50@01), (_, (_, (First:(Second:(Second:(Second:($t@50@01)))), (First:(Second:(Second:(Second:(Second:($t@50@01))))), (ret@46@01, val_bool@48@01)))))), ret@49@01)))]
(assert (not
  (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($Snap.first $t@50@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ret@46@01)
              ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($Snap.first $t@50@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ret@46@01)
              ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))
  (and
    (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@50@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@46@01)
                ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))
    (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@50@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@46@01)
                ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))))
; Joined path conditions
(assert (or
  (not
    (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@50@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@46@01)
                ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))
  (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($Snap.first $t@50@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ret@46@01)
              ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (> ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10)
  (and
    (> ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10)
    (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%precondition ($Snap.combine
      ($Snap.first $t@50@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@46@01)
                ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)
    (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@50@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@46@01)
                ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))
    (=>
      (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
        ($Snap.first $t@50@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap ret@46@01)
                  ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))
      (and
        (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
          ($Snap.first $t@50@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap ret@46@01)
                    ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))
        (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
          ($Snap.first $t@50@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap ret@46@01)
                    ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))))
    (or
      (not
        (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
          ($Snap.first $t@50@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap ret@46@01)
                    ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))
      (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
        ($Snap.first $t@50@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap ret@46@01)
                  ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))))))
(assert (or
  (> ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10)
  (not (> ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10))))
(push) ; 7
(assert (not (or
  (not (> ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10))
  (and
    (=
      (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
        ($Snap.first $t@50@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap ret@46@01)
                  ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))
      ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)))
    (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@50@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@46@01)
                ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (or
  (not (> ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10))
  (and
    (=
      (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
        ($Snap.first $t@50@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap ret@46@01)
                  ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))
      ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)))
    (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@50@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@46@01)
                ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))))
; [eval] !m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)) || m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)) > 10
; [eval] !m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)
(push) ; 7
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
(assert (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%precondition ($Snap.combine
  ($Snap.first $t@50@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@46@01)
            ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))
(pop) ; 7
; Joined path conditions
(assert (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%precondition ($Snap.combine
  ($Snap.first $t@50@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@46@01)
            ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))
(set-option :timeout 0)
(push) ; 7
(assert (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@50@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@46@01)
            ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))
(pop) ; 7
; Joined path conditions
(assert (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@50@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@46@01)
            ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))
(push) ; 7
; [then-branch: 7 | !(m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_((First:($t@50@01), (_, (_, (First:(Second:(Second:(Second:($t@50@01)))), (First:(Second:(Second:(Second:(Second:($t@50@01))))), (ret@46@01, val_bool@48@01)))))), ret@49@01))) | live]
; [else-branch: 7 | m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_((First:($t@50@01), (_, (_, (First:(Second:(Second:(Second:($t@50@01)))), (First:(Second:(Second:(Second:(Second:($t@50@01))))), (ret@46@01, val_bool@48@01)))))), ret@49@01)) | live]
(push) ; 8
; [then-branch: 7 | !(m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_((First:($t@50@01), (_, (_, (First:(Second:(Second:(Second:($t@50@01)))), (First:(Second:(Second:(Second:(Second:($t@50@01))))), (ret@46@01, val_bool@48@01)))))), ret@49@01)))]
(assert (not
  (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($Snap.first $t@50@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ret@46@01)
              ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))))
(pop) ; 8
(push) ; 8
; [else-branch: 7 | m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_((First:($t@50@01), (_, (_, (First:(Second:(Second:(Second:($t@50@01)))), (First:(Second:(Second:(Second:(Second:($t@50@01))))), (ret@46@01, val_bool@48@01)))))), ret@49@01))]
(assert (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@50@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@46@01)
            ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))
; [eval] m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)) > 10
; [eval] m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)
(push) ; 9
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
; unsat
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
(pop) ; 9
; Joined path conditions
(set-option :timeout 0)
(push) ; 9
; [eval] m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(_1)
(push) ; 10
(pop) ; 10
; Joined path conditions
(assert (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@50@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@46@01)
            ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))
(pop) ; 9
; Joined path conditions
(assert (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@50@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@46@01)
            ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($Snap.first $t@50@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ret@46@01)
              ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))
  (and
    (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@50@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@46@01)
                ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))
    (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@50@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@46@01)
                ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))))
(assert (or
  (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($Snap.first $t@50@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ret@46@01)
              ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))
  (not
    (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@50@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@46@01)
                ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))))
(push) ; 7
(assert (not (or
  (not
    (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@50@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@46@01)
                ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))
  (>
    (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@50@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@46@01)
                ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))
    10))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (or
  (not
    (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@50@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@46@01)
                ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))
  (>
    (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@50@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@46@01)
                ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))
    10)))
; [eval] !(old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) <= 10) || m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] !(old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) <= 10)
; [eval] old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) <= 10
; [eval] old[pre]((unfolding acc(u32(_1), write) in _1.val_int))
; [eval] (unfolding acc(u32(_1), write) in _1.val_int)
(push) ; 7
; [eval] 0 <= self.val_int
(pop) ; 7
; Joined path conditions
(push) ; 7
; [then-branch: 8 | !(First:($t@31@01) <= 10) | live]
; [else-branch: 8 | First:($t@31@01) <= 10 | live]
(push) ; 8
; [then-branch: 8 | !(First:($t@31@01) <= 10)]
(assert (not (<= ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10)))
(pop) ; 8
(push) ; 8
; [else-branch: 8 | First:($t@31@01) <= 10]
(assert (<= ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10))
; [eval] m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)
(push) ; 9
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
(pop) ; 9
; Joined path conditions
(set-option :timeout 0)
(push) ; 9
(assert (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@50@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@46@01)
            ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))
(pop) ; 9
; Joined path conditions
(assert (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@50@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@46@01)
            ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10)
  (and
    (<= ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10)
    (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@50@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@46@01)
                ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))))
(assert (or
  (<= ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10)
  (not (<= ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10))))
(push) ; 7
(assert (not (or
  (not (<= ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10))
  (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($Snap.first $t@50@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ret@46@01)
              ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (or
  (not (<= ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10))
  (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($Snap.first $t@50@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ret@46@01)
              ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))))
; [eval] !m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)) || old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) <= 10
; [eval] !m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)
(push) ; 7
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
(pop) ; 7
; Joined path conditions
(set-option :timeout 0)
(push) ; 7
(assert (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@50@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@46@01)
            ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))
(pop) ; 7
; Joined path conditions
(assert (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@50@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@46@01)
            ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))
(push) ; 7
; [then-branch: 9 | !(m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_((First:($t@50@01), (_, (_, (First:(Second:(Second:(Second:($t@50@01)))), (First:(Second:(Second:(Second:(Second:($t@50@01))))), (ret@46@01, val_bool@48@01)))))), ret@49@01))) | live]
; [else-branch: 9 | m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_((First:($t@50@01), (_, (_, (First:(Second:(Second:(Second:($t@50@01)))), (First:(Second:(Second:(Second:(Second:($t@50@01))))), (ret@46@01, val_bool@48@01)))))), ret@49@01)) | live]
(push) ; 8
; [then-branch: 9 | !(m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_((First:($t@50@01), (_, (_, (First:(Second:(Second:(Second:($t@50@01)))), (First:(Second:(Second:(Second:(Second:($t@50@01))))), (ret@46@01, val_bool@48@01)))))), ret@49@01)))]
(assert (not
  (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($Snap.first $t@50@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ret@46@01)
              ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))))
(pop) ; 8
(push) ; 8
; [else-branch: 9 | m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_((First:($t@50@01), (_, (_, (First:(Second:(Second:(Second:($t@50@01)))), (First:(Second:(Second:(Second:(Second:($t@50@01))))), (ret@46@01, val_bool@48@01)))))), ret@49@01))]
(assert (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@50@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@46@01)
            ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))
; [eval] old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) <= 10
; [eval] old[pre]((unfolding acc(u32(_1), write) in _1.val_int))
; [eval] (unfolding acc(u32(_1), write) in _1.val_int)
(push) ; 9
; [eval] 0 <= self.val_int
(pop) ; 9
; Joined path conditions
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($Snap.first $t@50@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ret@46@01)
              ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))
  (not
    (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@50@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@46@01)
                ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))))
(push) ; 7
(assert (not (or
  (not
    (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@50@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@46@01)
                ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))
  (<= ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (or
  (not
    (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@50@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@46@01)
                ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))
  (<= ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10)))
; [eval] old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) < 0 || (10 <= old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) || !m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)))
; [eval] old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) < 0
; [eval] old[pre]((unfolding acc(u32(_1), write) in _1.val_int))
; [eval] (unfolding acc(u32(_1), write) in _1.val_int)
(push) ; 7
; [eval] 0 <= self.val_int
(pop) ; 7
; Joined path conditions
(push) ; 7
; [then-branch: 10 | First:($t@31@01) < 0 | live]
; [else-branch: 10 | !(First:($t@31@01) < 0) | live]
(push) ; 8
; [then-branch: 10 | First:($t@31@01) < 0]
(assert (< ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 0))
(pop) ; 8
(push) ; 8
; [else-branch: 10 | !(First:($t@31@01) < 0)]
(assert (not (< ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 0)))
; [eval] 10 <= old[pre]((unfolding acc(u32(_1), write) in _1.val_int))
; [eval] old[pre]((unfolding acc(u32(_1), write) in _1.val_int))
; [eval] (unfolding acc(u32(_1), write) in _1.val_int)
(push) ; 9
; [eval] 0 <= self.val_int
(pop) ; 9
; Joined path conditions
(push) ; 9
; [then-branch: 11 | 10 <= First:($t@31@01) | live]
; [else-branch: 11 | !(10 <= First:($t@31@01)) | live]
(push) ; 10
; [then-branch: 11 | 10 <= First:($t@31@01)]
(assert (<= 10 ($SortWrappers.$SnapToInt ($Snap.first $t@31@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 11 | !(10 <= First:($t@31@01))]
(assert (not (<= 10 ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)))))
; [eval] !m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)
(push) ; 11
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
(pop) ; 11
; Joined path conditions
(set-option :timeout 0)
(push) ; 11
; [eval] m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(_1)
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(assert (not (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@50@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@46@01)
            ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(assert (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@50@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@46@01)
            ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))
(assert (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@50@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@46@01)
            ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))
(pop) ; 11
; Joined path conditions
(assert (and
  (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($Snap.first $t@50@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ret@46@01)
              ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))
  (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($Snap.first $t@50@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ret@46@01)
              ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (<= 10 ($SortWrappers.$SnapToInt ($Snap.first $t@31@01))))
  (and
    (not (<= 10 ($SortWrappers.$SnapToInt ($Snap.first $t@31@01))))
    (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@50@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@46@01)
                ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))
    (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@50@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@46@01)
                ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))))
(assert (or
  (not (<= 10 ($SortWrappers.$SnapToInt ($Snap.first $t@31@01))))
  (<= 10 ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (< ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 0))
  (and
    (not (< ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 0))
    (=>
      (not (<= 10 ($SortWrappers.$SnapToInt ($Snap.first $t@31@01))))
      (and
        (not (<= 10 ($SortWrappers.$SnapToInt ($Snap.first $t@31@01))))
        (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
          ($Snap.first $t@50@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap ret@46@01)
                    ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))
        (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
          ($Snap.first $t@50@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap ret@46@01)
                    ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))))
    (or
      (not (<= 10 ($SortWrappers.$SnapToInt ($Snap.first $t@31@01))))
      (<= 10 ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)))))))
(assert (or
  (not (< ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 0))
  (< ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 0)))
(push) ; 7
(assert (not (or
  (< ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 0)
  (or
    (<= 10 ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)))
    (not
      (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
        ($Snap.first $t@50@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap ret@46@01)
                  ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (or
  (< ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 0)
  (or
    (<= 10 ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)))
    (not
      (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
        ($Snap.first $t@50@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap ret@46@01)
                  ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))))))
; [eval] !m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)) || (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)) || 0 <= old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) && old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) < 10)
; [eval] !m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)
(push) ; 7
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
(pop) ; 7
; Joined path conditions
(set-option :timeout 0)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
; [then-branch: 12 | !(m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_((First:($t@50@01), (_, (_, (First:(Second:(Second:(Second:($t@50@01)))), (First:(Second:(Second:(Second:(Second:($t@50@01))))), (ret@46@01, val_bool@48@01)))))), ret@49@01))) | live]
; [else-branch: 12 | m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_((First:($t@50@01), (_, (_, (First:(Second:(Second:(Second:($t@50@01)))), (First:(Second:(Second:(Second:(Second:($t@50@01))))), (ret@46@01, val_bool@48@01)))))), ret@49@01)) | live]
(push) ; 8
; [then-branch: 12 | !(m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_((First:($t@50@01), (_, (_, (First:(Second:(Second:(Second:($t@50@01)))), (First:(Second:(Second:(Second:(Second:($t@50@01))))), (ret@46@01, val_bool@48@01)))))), ret@49@01)))]
(assert (not
  (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($Snap.first $t@50@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ret@46@01)
              ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))))
(pop) ; 8
(push) ; 8
; [else-branch: 12 | m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_((First:($t@50@01), (_, (_, (First:(Second:(Second:(Second:($t@50@01)))), (First:(Second:(Second:(Second:(Second:($t@50@01))))), (ret@46@01, val_bool@48@01)))))), ret@49@01))]
(assert (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@50@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@46@01)
            ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))
; [eval] m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)
(push) ; 9
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
(pop) ; 9
; Joined path conditions
(set-option :timeout 0)
(push) ; 9
; [eval] m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(_1)
(push) ; 10
(pop) ; 10
; Joined path conditions
(assert (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@50@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@46@01)
            ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))
(pop) ; 9
; Joined path conditions
(assert (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@50@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@46@01)
            ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))
(push) ; 9
; [then-branch: 13 | m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_((First:($t@50@01), (_, (_, (First:(Second:(Second:(Second:($t@50@01)))), (First:(Second:(Second:(Second:(Second:($t@50@01))))), (ret@46@01, val_bool@48@01)))))), ret@49@01)) | live]
; [else-branch: 13 | !(m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_((First:($t@50@01), (_, (_, (First:(Second:(Second:(Second:($t@50@01)))), (First:(Second:(Second:(Second:(Second:($t@50@01))))), (ret@46@01, val_bool@48@01)))))), ret@49@01))) | live]
(push) ; 10
; [then-branch: 13 | m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_((First:($t@50@01), (_, (_, (First:(Second:(Second:(Second:($t@50@01)))), (First:(Second:(Second:(Second:(Second:($t@50@01))))), (ret@46@01, val_bool@48@01)))))), ret@49@01))]
(assert (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@50@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@46@01)
            ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 13 | !(m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_((First:($t@50@01), (_, (_, (First:(Second:(Second:(Second:($t@50@01)))), (First:(Second:(Second:(Second:(Second:($t@50@01))))), (ret@46@01, val_bool@48@01)))))), ret@49@01)))]
(assert (not
  (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($Snap.first $t@50@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ret@46@01)
              ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))))
; [eval] 0 <= old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) && old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) < 10
; [eval] 0 <= old[pre]((unfolding acc(u32(_1), write) in _1.val_int))
; [eval] old[pre]((unfolding acc(u32(_1), write) in _1.val_int))
; [eval] (unfolding acc(u32(_1), write) in _1.val_int)
(push) ; 11
; [eval] 0 <= self.val_int
(pop) ; 11
; Joined path conditions
(push) ; 11
; [then-branch: 14 | 0 <= First:($t@31@01) | live]
; [else-branch: 14 | !(0 <= First:($t@31@01)) | live]
(push) ; 12
; [then-branch: 14 | 0 <= First:($t@31@01)]
; [eval] old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) < 10
; [eval] old[pre]((unfolding acc(u32(_1), write) in _1.val_int))
; [eval] (unfolding acc(u32(_1), write) in _1.val_int)
(push) ; 13
; [eval] 0 <= self.val_int
(pop) ; 13
; Joined path conditions
(pop) ; 12
(push) ; 12
; [else-branch: 14 | !(0 <= First:($t@31@01))]
(assert (not (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)))))
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or
  (not (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@31@01))))
  (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (not
    (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@50@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@46@01)
                ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))
  (and
    (not
      (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
        ($Snap.first $t@50@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap ret@46@01)
                  ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))
    (or
      (not (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@31@01))))
      (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)))))))
(assert (or
  (not
    (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@50@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@46@01)
                ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))
  (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($Snap.first $t@50@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ret@46@01)
              ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($Snap.first $t@50@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ret@46@01)
              ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))
  (and
    (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@50@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@46@01)
                ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))
    (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@50@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@46@01)
                ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))
    (=>
      (not
        (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
          ($Snap.first $t@50@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap ret@46@01)
                    ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))
      (and
        (not
          (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
            ($Snap.first $t@50@01)
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
                    ($Snap.combine
                      ($SortWrappers.$RefTo$Snap ret@46@01)
                      ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))
        (or
          (not (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@31@01))))
          (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@31@01))))))
    (or
      (not
        (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
          ($Snap.first $t@50@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap ret@46@01)
                    ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))
      (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
        ($Snap.first $t@50@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap ret@46@01)
                  ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))))))
(push) ; 7
(assert (not (or
  (not
    (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@50@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@46@01)
                ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))
  (or
    (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@50@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@46@01)
                ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))
    (and
      (< ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10)
      (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@31@01))))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (or
  (not
    (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@50@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@46@01)
                ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))
  (or
    (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@50@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@46@01)
                ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))
    (and
      (< ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10)
      (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)))))))
; [eval] !(old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) == 10) || m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] !(old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) == 10)
; [eval] old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) == 10
; [eval] old[pre]((unfolding acc(u32(_1), write) in _1.val_int))
; [eval] (unfolding acc(u32(_1), write) in _1.val_int)
(push) ; 7
; [eval] 0 <= self.val_int
(pop) ; 7
; Joined path conditions
(push) ; 7
; [then-branch: 15 | First:($t@31@01) != 10 | live]
; [else-branch: 15 | First:($t@31@01) == 10 | live]
(push) ; 8
; [then-branch: 15 | First:($t@31@01) != 10]
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10)))
(pop) ; 8
(push) ; 8
; [else-branch: 15 | First:($t@31@01) == 10]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10))
; [eval] m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)
(push) ; 9
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
(pop) ; 9
; Joined path conditions
(set-option :timeout 0)
(push) ; 9
; [eval] m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(_1)
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(assert (not (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@50@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@46@01)
            ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@50@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@46@01)
            ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))
(assert (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@50@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@46@01)
            ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))
(pop) ; 9
; Joined path conditions
(assert (and
  (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($Snap.first $t@50@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ret@46@01)
              ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))
  (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($Snap.first $t@50@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ret@46@01)
              ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (= ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10)
  (and
    (= ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10)
    (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@50@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@46@01)
                ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))
    (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@50@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@46@01)
                ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))))
(assert (or
  (= ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10)
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10))))
(push) ; 7
(assert (not (or
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10))
  (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($Snap.first $t@50@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ret@46@01)
              ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (or
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10))
  (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($Snap.first $t@50@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ret@46@01)
              ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))))
; [eval] !m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)) || (!m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)) || old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) == 10)
; [eval] !m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)
(push) ; 7
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
(pop) ; 7
; Joined path conditions
(set-option :timeout 0)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
; [then-branch: 16 | !(m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_((First:($t@50@01), (_, (_, (First:(Second:(Second:(Second:($t@50@01)))), (First:(Second:(Second:(Second:(Second:($t@50@01))))), (ret@46@01, val_bool@48@01)))))), ret@49@01))) | live]
; [else-branch: 16 | m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_((First:($t@50@01), (_, (_, (First:(Second:(Second:(Second:($t@50@01)))), (First:(Second:(Second:(Second:(Second:($t@50@01))))), (ret@46@01, val_bool@48@01)))))), ret@49@01)) | live]
(push) ; 8
; [then-branch: 16 | !(m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_((First:($t@50@01), (_, (_, (First:(Second:(Second:(Second:($t@50@01)))), (First:(Second:(Second:(Second:(Second:($t@50@01))))), (ret@46@01, val_bool@48@01)))))), ret@49@01)))]
(assert (not
  (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($Snap.first $t@50@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ret@46@01)
              ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))))
(pop) ; 8
(push) ; 8
; [else-branch: 16 | m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_((First:($t@50@01), (_, (_, (First:(Second:(Second:(Second:($t@50@01)))), (First:(Second:(Second:(Second:(Second:($t@50@01))))), (ret@46@01, val_bool@48@01)))))), ret@49@01))]
(assert (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@50@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@46@01)
            ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))
; [eval] !m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)
(push) ; 9
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
(pop) ; 9
; Joined path conditions
(set-option :timeout 0)
(push) ; 9
; [eval] m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(_1)
(push) ; 10
(pop) ; 10
; Joined path conditions
(assert (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@50@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@46@01)
            ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))
(pop) ; 9
; Joined path conditions
(assert (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@50@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@46@01)
            ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))
(push) ; 9
; [then-branch: 17 | !(m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_((First:($t@50@01), (_, (_, (First:(Second:(Second:(Second:($t@50@01)))), (First:(Second:(Second:(Second:(Second:($t@50@01))))), (ret@46@01, val_bool@48@01)))))), ret@49@01))) | live]
; [else-branch: 17 | m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_((First:($t@50@01), (_, (_, (First:(Second:(Second:(Second:($t@50@01)))), (First:(Second:(Second:(Second:(Second:($t@50@01))))), (ret@46@01, val_bool@48@01)))))), ret@49@01)) | live]
(push) ; 10
; [then-branch: 17 | !(m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_((First:($t@50@01), (_, (_, (First:(Second:(Second:(Second:($t@50@01)))), (First:(Second:(Second:(Second:(Second:($t@50@01))))), (ret@46@01, val_bool@48@01)))))), ret@49@01)))]
(assert (not
  (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($Snap.first $t@50@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ret@46@01)
              ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 17 | m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_((First:($t@50@01), (_, (_, (First:(Second:(Second:(Second:($t@50@01)))), (First:(Second:(Second:(Second:(Second:($t@50@01))))), (ret@46@01, val_bool@48@01)))))), ret@49@01))]
(assert (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@50@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@46@01)
            ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))
; [eval] old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) == 10
; [eval] old[pre]((unfolding acc(u32(_1), write) in _1.val_int))
; [eval] (unfolding acc(u32(_1), write) in _1.val_int)
(push) ; 11
; [eval] 0 <= self.val_int
(pop) ; 11
; Joined path conditions
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($Snap.first $t@50@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ret@46@01)
              ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))
  (not
    (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@50@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@46@01)
                ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($Snap.first $t@50@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ret@46@01)
              ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))
  (and
    (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@50@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@46@01)
                ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))
    (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@50@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@46@01)
                ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))
    (or
      (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
        ($Snap.first $t@50@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap ret@46@01)
                  ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01))
      (not
        (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
          ($Snap.first $t@50@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap ret@46@01)
                    ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))))))
(push) ; 7
(assert (not (or
  (not
    (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@50@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@46@01)
                ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))
  (or
    (not
      (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
        ($Snap.first $t@50@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap ret@46@01)
                  ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))
    (= ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (or
  (not
    (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@50@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@46@01)
                ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))
  (or
    (not
      (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
        ($Snap.first $t@50@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap ret@46@01)
                  ($SortWrappers.BoolTo$Snap val_bool@48@01))))))) ret@49@01)))
    (= ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10))))
; [exec]
; assert true
; [exec]
; exhale acc(m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0), write)
; [exec]
; label end_of_method
(pop) ; 6
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 2 | !(val_bool@43@01)]
(assert (not val_bool@43@01))
(pop) ; 4
; [eval] !__t11
(push) ; 4
(set-option :timeout 10)
(assert (not val_bool@43@01))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not val_bool@43@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 18 | !(val_bool@43@01) | live]
; [else-branch: 18 | val_bool@43@01 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 18 | !(val_bool@43@01)]
(assert (not val_bool@43@01))
; [exec]
; label l2
; [exec]
; __t5 := true
; [exec]
; _11 := builtin$havoc_ref()
(declare-const ret@52@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_11.val_int, write)
(declare-const $t@53@01 Int)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _1@15@01 ret@52@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@52@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _11.val_int := _1.val_int
(declare-const val_int@54@01 Int)
(assert (= val_int@54@01 ($SortWrappers.$SnapToInt ($Snap.first $t@31@01))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _1@15@01 ret@52@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l9
; [exec]
; _10 := builtin$havoc_ref()
(declare-const ret@55@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(struct$m_UnexpectedValue(_10), write)
(declare-const $t@56@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; unfold acc(struct$m_UnexpectedValue(_10), write)
(assert (= $t@56@01 ($Snap.combine ($Snap.first $t@56@01) ($Snap.second $t@56@01))))
(assert (not (= ret@55@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (struct$m_UnexpectedValue%trigger $t@56@01 ret@55@01))
; [exec]
; _10.f$0 := _11
; [exec]
; label l10
; [exec]
; _9 := builtin$havoc_ref()
(declare-const ret@57@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_9), write)
(declare-const $t@58@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$(_9) ==
;   1
(declare-const $t@59@01 $Snap)
(assert (= $t@59@01 $Snap.unit))
; [eval] m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$(_9) == 1
; [eval] m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$(_9)
(set-option :timeout 0)
(push) ; 5
; [eval] read$()
(push) ; 6
(assert (read$%precondition $Snap.unit))
(pop) ; 6
; Joined path conditions
(assert (read$%precondition $Snap.unit))
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
(assert (<= $Perm.No (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))))
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
(assert (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition $t@58@01 ret@57@01))
(pop) ; 5
; Joined path conditions
(assert (and
  (read$%precondition $Snap.unit)
  (<= $Perm.No (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))))
  (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition $t@58@01 ret@57@01)))
(assert (=
  (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$ $t@58@01 ret@57@01)
  1))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; unfold acc(m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_9), write)
(assert (= $t@58@01 ($Snap.combine ($Snap.first $t@58@01) ($Snap.second $t@58@01))))
(assert (not (= ret@57@01 $Ref.null)))
(assert (=
  ($Snap.second $t@58@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@58@01))
    ($Snap.second ($Snap.second $t@58@01)))))
(assert (= ($Snap.first ($Snap.second $t@58@01)) $Snap.unit))
; [eval] 0 <= self.discriminant
(assert (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@58@01))))
(assert (=
  ($Snap.second ($Snap.second $t@58@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@58@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@58@01))) $Snap.unit))
; [eval] self.discriminant <= 1
(assert (<= ($SortWrappers.$SnapToInt ($Snap.first $t@58@01)) 1))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@58@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@58@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))))
; [eval] self.discriminant == 1
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@58@01)) 1))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@58@01)) 1)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 19 | First:($t@58@01) == 1 | live]
; [else-branch: 19 | First:($t@58@01) != 1 | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 19 | First:($t@58@01) == 1]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@58@01)) 1))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%trigger $t@58@01 ret@57@01))
; [exec]
; unfold acc(m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_Err(_9.enum_Err), write)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01)))))))))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ret@55@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01)))))))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))
    $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_Err%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))))
; [exec]
; _9.enum_Err.f$0 := _10
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ret@55@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01)))))))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l11
; [exec]
; _17 := builtin$havoc_ref()
(declare-const ret@60@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_17.val_ref, write)
(declare-const $t@61@01 $Ref)
(assert (not (= ret@60@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _17.val_ref := _9
; [exec]
; exhale acc(_9.discriminant, write - read$())
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
  (not (= ret@57@01 $Ref.null))))
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
; inhale acc(_17.val_ref.discriminant, read$())
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
(declare-const $t@62@01 Int)
(declare-const $t@63@01 Int)
(assert (and
  (=>
    (<
      $Perm.No
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit)))))
    (= $t@63@01 ($SortWrappers.$SnapToInt ($Snap.first $t@58@01))))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@63@01 $t@62@01))))
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
  (not (= ret@57@01 $Ref.null))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(_9.enum_Err, write - read$())
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
; inhale acc(_17.val_ref.enum_Err, read$())
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
(declare-const $t@64@01 $Ref)
(declare-const $t@65@01 $Ref)
(assert (and
  (=>
    (<
      $Perm.No
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit)))))
    (=
      $t@65@01
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@65@01 $t@64@01))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(_9.enum_Err.f$0, write - read$())
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
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))
  $t@65@01)))
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
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))
      $Ref.null))))
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
; inhale acc(_17.val_ref.enum_Err.f$0, read$())
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
(declare-const $t@66@01 $Ref)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))
  $t@65@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(declare-const $t@67@01 $Ref)
(assert (and
  (=>
    (<
      $Perm.No
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit)))))
    (= $t@67@01 ret@55@01))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@67@01 $t@66@01))))
(assert (=>
  (<
    $Perm.No
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))
      $Ref.null))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(_9.enum_Err.f$0.f$0, write - read$())
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
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))
  $t@65@01)))
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
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))
  $t@67@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@55@01 $t@67@01)))
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
  (not (= ret@55@01 $Ref.null))))
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
; inhale acc(_17.val_ref.enum_Err.f$0.f$0, read$())
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
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))
  $t@65@01)))
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
(declare-const $t@68@01 $Ref)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@55@01 $t@67@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(declare-const $t@69@01 $Ref)
(assert (and
  (=>
    (<
      $Perm.No
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit)))))
    (= $t@69@01 ret@52@01))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@69@01 $t@68@01))))
(assert (=>
  (<
    $Perm.No
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit)))
  (not (= ret@55@01 $Ref.null))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(_9.enum_Err.f$0.f$0.val_int, write - read$())
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
(assert (not (= ret@55@01 $t@65@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))
  $t@65@01)))
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
(set-option :timeout 10)
(assert (not (= ret@55@01 $t@67@01)))
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
(assert (not (= ret@52@01 $t@69@01)))
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
  (not (= ret@52@01 $Ref.null))))
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
; inhale acc(_17.val_ref.enum_Err.f$0.f$0.val_int, read$())
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
(assert (not (= ret@55@01 $t@65@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))
  $t@65@01)))
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
(set-option :timeout 10)
(assert (not (= ret@55@01 $t@67@01)))
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
(declare-const $t@70@01 Int)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@52@01 $t@69@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(declare-const $t@71@01 Int)
(assert (and
  (=>
    (<
      $Perm.No
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit)))))
    (= $t@71@01 val_int@54@01))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@71@01 $t@70@01))))
(assert (=>
  (<
    $Perm.No
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit)))
  (not (= ret@52@01 $Ref.null))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label l12
; [exec]
; _16 := builtin$havoc_ref()
(declare-const ret@72@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_16.val_ref, write)
(declare-const $t@73@01 $Ref)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@60@01 ret@72@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@72@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _16.val_ref := _17.val_ref
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@60@01 ret@72@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(_16.val_ref.discriminant, read$())
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
(declare-const $t@74@01 Int)
(declare-const $t@75@01 Int)
(assert (and
  (=>
    (<
      $Perm.No
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit)))
    (= $t@75@01 $t@63@01))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@75@01 $t@74@01))))
(assert (<=
  $Perm.No
  (+
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
    (read$ $Snap.unit))))
(assert (<=
  (+
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
    (read$ $Snap.unit))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (+
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  (not (= ret@57@01 $Ref.null))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_16.val_ref.enum_Err, read$())
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
(declare-const $t@76@01 $Ref)
(declare-const $t@77@01 $Ref)
(assert (and
  (=>
    (<
      $Perm.No
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit)))
    (= $t@77@01 $t@65@01))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@77@01 $t@76@01))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_16.val_ref.enum_Err.f$0, read$())
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
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
(declare-const $t@78@01 $Ref)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@55@01 $t@77@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))
  $t@77@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(declare-const $t@79@01 $Ref)
(assert (and
  (=>
    (<
      $Perm.No
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit)))
    (= $t@79@01 $t@67@01))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@79@01 $t@78@01))))
(assert (=>
  (<
    $Perm.No
    (+
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))
      $Ref.null))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_16.val_ref.enum_Err.f$0.f$0, read$())
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))
  $t@77@01)))
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
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
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
(declare-const $t@80@01 $Ref)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@55@01 $t@79@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(declare-const $t@81@01 $Ref)
(assert (and
  (=>
    (<
      $Perm.No
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit)))
    (= $t@81@01 $t@69@01))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@81@01 $t@80@01))))
(assert (=>
  (<
    $Perm.No
    (+
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  (not (= ret@55@01 $Ref.null))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_16.val_ref.enum_Err.f$0.f$0.val_int, read$())
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@55@01 $t@77@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))
  $t@77@01)))
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
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@55@01 $t@79@01)))
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
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
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
(declare-const $t@82@01 Int)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _1@15@01 $t@81@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@52@01 $t@81@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(declare-const $t@83@01 Int)
(assert (and
  (=>
    (<
      $Perm.No
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit)))
    (= $t@83@01 $t@71@01))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@83@01 $t@82@01))))
(assert (=>
  (<
    $Perm.No
    (+
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  (not (= ret@52@01 $Ref.null))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label l13
; [exec]
; label l14
; [exec]
; _15 := builtin$havoc_ref()
(declare-const ret@84@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(u32(_15), write)
(declare-const $t@85@01 $Snap)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@56@01)) ret@84@01)))
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
; fold acc(u32(_16.val_ref.enum_Err.f$0.f$0), read$())
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@55@01 $t@77@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))
  $t@77@01)))
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
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@55@01 $t@79@01)))
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
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
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
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _1@15@01 $t@81@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@52@01 $t@81@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
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
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))))
(assert (<=
  (-
    (+
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (-
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit))))
  (not (= ret@52@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 6
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
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
; [eval] 0 <= self.val_int
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _1@15@01 $t@81@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@52@01 $t@81@01)))
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
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(assert (not (<= 0 $t@83@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 $t@83@01))
(assert (u32%trigger ($Snap.combine ($SortWrappers.IntTo$Snap $t@83@01) $Snap.unit) $t@81@01))
(push) ; 6
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@56@01)) $t@81@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@84@01 $t@81@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (<= $Perm.No (read$ $Snap.unit)))
; [exec]
; fold acc(struct$m_UnexpectedValue(_16.val_ref.enum_Err.f$0), read$())
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))
  $t@77@01)))
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
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
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
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))
  $t@79@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@55@01 $t@79@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (=>
  (<
    $Perm.No
    (-
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit))))
  (not (= ret@55@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 6
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
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
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))
  $t@79@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@55@01 $t@79@01)))
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
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (struct$m_UnexpectedValue%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap $t@81@01)
  ($Snap.combine ($SortWrappers.IntTo$Snap $t@83@01) $Snap.unit)) $t@79@01))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01)))))))
  $t@79@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_Err(_16.val_ref.enum_Err), read$())
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
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
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@55@01 $t@77@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))
  $t@77@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (=>
  (<
    $Perm.No
    (-
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))
      $Ref.null))))
(set-option :timeout 0)
(push) ; 6
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
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
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@55@01 $t@77@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))
  $t@77@01)))
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
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_Err%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap $t@79@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap $t@81@01)
    ($Snap.combine ($SortWrappers.IntTo$Snap $t@83@01) $Snap.unit))) $t@77@01))
; [exec]
; fold acc(m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_16.val_ref), read$())
; [eval] read$()
(set-option :timeout 0)
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(assert (not (< $Perm.No (read$ $Snap.unit))))
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
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (=>
  (<
    $Perm.No
    (-
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit))))
  (not (= ret@57@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 6
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
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
; [eval] 0 <= self.discriminant
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(assert (not (<= 0 $t@75@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 $t@75@01))
; [eval] self.discriminant <= 1
(push) ; 6
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(assert (not (<= $t@75@01 1)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (<= $t@75@01 1))
(push) ; 6
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (<= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.Write))
(assert (=>
  (< $Perm.No (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))))
  (not (= ret@57@01 $Ref.null))))
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
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (+
        (-
          $Perm.Write
          ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
        (read$ $Snap.unit))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
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
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
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
; [eval] self.discriminant == 1
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= $t@75@01 1))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= $t@75@01 1)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 20 | $t@75@01 == 1 | live]
; [else-branch: 20 | $t@75@01 != 1 | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 20 | $t@75@01 == 1]
(assert (= $t@75@01 1))
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
      (read$ $Snap.unit))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap $t@75@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@58@01))))
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@77@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@79@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@81@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap $t@83@01) $Snap.unit)))))))) ret@57@01))
; [exec]
; inhale (unfolding acc(u32(_15), write) in _15.val_int) ==
;   m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_16.val_ref))
(declare-const $t@86@01 $Snap)
(assert (= $t@86@01 $Snap.unit))
; [eval] (unfolding acc(u32(_15), write) in _15.val_int) == m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_16.val_ref))
; [eval] (unfolding acc(u32(_15), write) in _15.val_int)
(set-option :timeout 0)
(push) ; 7
(assert (u32%trigger $t@85@01 ret@84@01))
(assert (= $t@85@01 ($Snap.combine ($Snap.first $t@85@01) ($Snap.second $t@85@01))))
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@52@01 ret@84@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= _1@15@01 ret@84@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@84@01 $Ref.null)))
(assert (= ($Snap.second $t@85@01) $Snap.unit))
; [eval] 0 <= self.val_int
(assert (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@85@01))))
(pop) ; 7
; Joined path conditions
(assert (and
  (u32%trigger $t@85@01 ret@84@01)
  (= $t@85@01 ($Snap.combine ($Snap.first $t@85@01) ($Snap.second $t@85@01)))
  (not (= ret@84@01 $Ref.null))
  (= ($Snap.second $t@85@01) $Snap.unit)
  (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@85@01)))))
; [eval] m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_16.val_ref))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_16.val_ref)
(set-option :timeout 0)
(push) ; 7
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
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap $t@75@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@58@01))))
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@77@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@79@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@81@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap $t@83@01) $Snap.unit)))))))) ret@57@01))
(pop) ; 7
; Joined path conditions
(assert (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap $t@75@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@58@01))))
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@77@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@79@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@81@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap $t@83@01) $Snap.unit)))))))) ret@57@01))
(set-option :timeout 0)
(push) ; 7
; [eval] m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(_1)
(push) ; 8
(assert (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($SortWrappers.IntTo$Snap $t@75@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@58@01))))
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@77@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@79@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@81@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap $t@83@01) $Snap.unit)))))))) ret@57@01)))
(pop) ; 8
; Joined path conditions
(assert (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($SortWrappers.IntTo$Snap $t@75@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@58@01))))
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@77@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@79@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@81@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap $t@83@01) $Snap.unit)))))))) ret@57@01)))
(push) ; 8
(assert (not (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($SortWrappers.IntTo$Snap $t@75@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@58@01))))
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@77@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@79@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@81@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap $t@83@01) $Snap.unit)))))))) ret@57@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($SortWrappers.IntTo$Snap $t@75@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@58@01))))
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@77@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@79@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@81@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap $t@83@01) $Snap.unit)))))))) ret@57@01)))
(assert (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($SortWrappers.IntTo$Snap $t@75@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@58@01))))
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@77@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@79@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@81@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap $t@83@01) $Snap.unit)))))))) ret@57@01)))
(pop) ; 7
; Joined path conditions
(assert (and
  (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($SortWrappers.IntTo$Snap $t@75@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@58@01))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@77@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@79@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@81@01)
                ($Snap.combine ($SortWrappers.IntTo$Snap $t@83@01) $Snap.unit)))))))) ret@57@01))
  (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($SortWrappers.IntTo$Snap $t@75@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@58@01))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@77@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@79@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@81@01)
                ($Snap.combine ($SortWrappers.IntTo$Snap $t@83@01) $Snap.unit)))))))) ret@57@01))
  (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($SortWrappers.IntTo$Snap $t@75@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@58@01))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@77@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@79@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@81@01)
                ($Snap.combine ($SortWrappers.IntTo$Snap $t@83@01) $Snap.unit)))))))) ret@57@01))))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@85@01))
  (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($SortWrappers.IntTo$Snap $t@75@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@58@01))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@77@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@79@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@81@01)
                ($Snap.combine ($SortWrappers.IntTo$Snap $t@83@01) $Snap.unit)))))))) ret@57@01))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [eval] __t5 && __t5
(set-option :timeout 0)
(push) ; 7
; [then-branch: 21 | True | live]
; [else-branch: 21 | False | live]
(push) ; 8
; [then-branch: 21 | True]
(pop) ; 8
(push) ; 8
; [else-branch: 21 | False]
(assert false)
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 22 | True | live]
; [else-branch: 22 | False | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 22 | True]
; [exec]
; unfold acc(m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(old[l13](_16.val_ref)), read$())
; [eval] old[l13](_16.val_ref)
; [eval] read$()
(push) ; 8
(pop) ; 8
; Joined path conditions
(push) ; 8
(assert (not (< $Perm.No (read$ $Snap.unit))))
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
(declare-const $t@87@01 Int)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit))))
    (= $t@87@01 $t@75@01))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@87@01 $t@75@01))))
(assert (<=
  $Perm.No
  (+
    (-
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    (read$ $Snap.unit))))
(assert (<=
  (+
    (-
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    (read$ $Snap.unit))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (+
      (-
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit)))
  (not (= ret@57@01 $Ref.null))))
; [eval] 0 <= self.discriminant
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (-
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 $t@87@01))
; [eval] self.discriminant <= 1
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (-
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (<= $t@87@01 1))
(declare-const $t@88@01 $Ref)
(assert (and
  (=>
    (< $Perm.No (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))))
    (=
      $t@88@01
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@58@01)))))))
  (=>
    (< $Perm.No (read$ $Snap.unit))
    (=
      $t@88@01
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@58@01)))))))))
(assert (<=
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
    (read$ $Snap.unit))))
(assert (<=
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
    (read$ $Snap.unit))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
      (read$ $Snap.unit)))
  (not (= ret@57@01 $Ref.null))))
(declare-const $t@89@01 $Ref)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit))))
    (= $t@89@01 $t@77@01))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@89@01 $t@77@01))))
; [eval] self.discriminant == 1
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (-
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not (= $t@87@01 1))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@87@01 1)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 23 | $t@87@01 == 1 | live]
; [else-branch: 23 | $t@87@01 != 1 | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 23 | $t@87@01 == 1]
(assert (= $t@87@01 1))
(push) ; 9
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (-
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; unfold acc(m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_Err(old[l13](_16.val_ref).enum_Err), read$())
; [eval] old[l13](_16.val_ref)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (-
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
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
(assert (not (< $Perm.No (read$ $Snap.unit))))
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
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))
  $t@89@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(declare-const $t@90@01 $Ref)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit))))
    (= $t@90@01 $t@79@01))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@90@01 $t@79@01))))
(assert (=>
  (<
    $Perm.No
    (+
      (-
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))
      $Ref.null))))
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))
  $t@89@01)))
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
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01)))))))
  $t@90@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_Err%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap $t@79@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap $t@81@01)
    ($Snap.combine ($SortWrappers.IntTo$Snap $t@83@01) $Snap.unit))) $t@89@01))
; [exec]
; unfold acc(struct$m_UnexpectedValue(old[l13](_16.val_ref).enum_Err.f$0), read$())
; [eval] old[l13](_16.val_ref)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (-
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@55@01 $t@89@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))
  $t@89@01)))
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
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
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
(assert (not (< $Perm.No (read$ $Snap.unit))))
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
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))
  $t@90@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@55@01 $t@90@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(declare-const $t@91@01 $Ref)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit))))
    (= $t@91@01 $t@81@01))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@91@01 $t@81@01))))
(assert (=>
  (<
    $Perm.No
    (+
      (-
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit)))
  (not (= ret@55@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@55@01 $t@90@01)))
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
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@84@01 $t@91@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@56@01)) $t@91@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (struct$m_UnexpectedValue%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap $t@81@01)
  ($Snap.combine ($SortWrappers.IntTo$Snap $t@83@01) $Snap.unit)) $t@90@01))
; [exec]
; unfold acc(u32(old[l13](_16.val_ref).enum_Err.f$0.f$0), read$())
; [eval] old[l13](_16.val_ref)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (-
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))
  $t@89@01)))
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
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))
  $t@90@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@55@01 $t@90@01)))
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
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
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
(assert (not (< $Perm.No (read$ $Snap.unit))))
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
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@52@01 $t@91@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(declare-const $t@92@01 Int)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit))))
    (= $t@92@01 $t@83@01))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@92@01 $t@83@01))))
(assert (=>
  (<
    $Perm.No
    (+
      (-
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit)))
  (not (= ret@52@01 $Ref.null))))
; [eval] 0 <= self.val_int
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@52@01 $t@91@01)))
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
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 $t@92@01))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (u32%trigger ($Snap.combine ($SortWrappers.IntTo$Snap $t@83@01) $Snap.unit) $t@91@01))
; [exec]
; exhale acc(old[l13](_16.val_ref).enum_Err.f$0.f$0.val_int, read$())
; [eval] read$()
(set-option :timeout 0)
(push) ; 9
(pop) ; 9
; Joined path conditions
; [eval] old[l13](_16.val_ref)
(push) ; 9
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (-
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@55@01 $t@89@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))
  $t@89@01)))
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
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@55@01 $t@90@01)))
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
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
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
(assert (not (= ret@52@01 $t@91@01)))
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
      (-
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (-
    (+
      (-
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))))
(assert (<=
  (-
    (+
      (-
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (-
      (+
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        (read$ $Snap.unit))))
  (not (= ret@52@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 9
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
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
; exhale acc(old[l13](_16.val_ref).enum_Err.f$0.f$0, read$())
; [eval] read$()
(set-option :timeout 0)
(push) ; 9
(pop) ; 9
; Joined path conditions
; [eval] old[l13](_16.val_ref)
(push) ; 9
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (-
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@55@01 $t@89@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))
  $t@89@01)))
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
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
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
(assert (not (= ret@55@01 $t@90@01)))
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
      (-
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
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
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        (read$ $Snap.unit))))
  (not (= ret@55@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 9
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
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
; exhale acc(old[l13](_16.val_ref).enum_Err.f$0, read$())
; [eval] read$()
(set-option :timeout 0)
(push) ; 9
(pop) ; 9
; Joined path conditions
; [eval] old[l13](_16.val_ref)
(push) ; 9
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (-
      (+
        (+
          (-
            $Perm.Write
            ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
          (read$ $Snap.unit))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
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
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))
  $t@89@01)))
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
      (-
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
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
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        (read$ $Snap.unit))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))
      $Ref.null))))
(set-option :timeout 0)
(push) ; 9
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
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
; exhale acc(old[l13](_16.val_ref).enum_Err, read$())
; [eval] read$()
(set-option :timeout 0)
(push) ; 9
(pop) ; 9
; Joined path conditions
; [eval] old[l13](_16.val_ref)
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
      (-
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
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
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        (read$ $Snap.unit))))
  (not (= ret@57@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 9
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
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
; exhale acc(old[l13](_16.val_ref).discriminant, read$())
; [eval] read$()
(set-option :timeout 0)
(push) ; 9
(pop) ; 9
; Joined path conditions
; [eval] old[l13](_16.val_ref)
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
      (-
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
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
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
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
; [eval] __t5 && (__t5 && __t5)
(set-option :timeout 0)
(push) ; 9
; [then-branch: 24 | True | live]
; [else-branch: 24 | False | live]
(push) ; 10
; [then-branch: 24 | True]
(push) ; 11
; [then-branch: 25 | True | live]
; [else-branch: 25 | False | live]
(push) ; 12
; [then-branch: 25 | True]
(pop) ; 12
(push) ; 12
; [else-branch: 25 | False]
(assert false)
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(pop) ; 10
(push) ; 10
; [else-branch: 24 | False]
(assert false)
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(push) ; 9
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 26 | True | live]
; [else-branch: 26 | False | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 26 | True]
; [exec]
; exhale acc(_17.val_ref.enum_Err.f$0.f$0.val_int, read$())
; [eval] read$()
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (-
    (+
      (-
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))
      (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@55@01 $t@89@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))
  $t@89@01)))
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
  (-
    (+
      (-
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))
      (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@55@01 $t@90@01)))
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
  (-
    (+
      (-
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))
      (read$ $Snap.unit))))))
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
(assert (not (= _1@15@01 $t@91@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@52@01 $t@91@01)))
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
    (-
      (+
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    ($Perm.min
      (-
        (+
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (-
    (-
      (+
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    ($Perm.min
      (-
        (+
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit)))))
(assert (<=
  (-
    (-
      (+
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    ($Perm.min
      (-
        (+
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit)))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (-
      (-
        (+
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      ($Perm.min
        (-
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))))
  (not (= ret@52@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 10
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
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
; exhale acc(_17.val_ref.enum_Err.f$0.f$0, read$())
; [eval] read$()
(set-option :timeout 0)
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (-
    (+
      (-
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))
      (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@55@01 $t@89@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))
  $t@89@01)))
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
  (-
    (+
      (-
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))
      (read$ $Snap.unit))))))
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
(assert (not (= ret@55@01 $t@90@01)))
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
    (-
      (+
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    ($Perm.min
      (-
        (+
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
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
      (-
        (+
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      ($Perm.min
        (-
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))))
  (not (= ret@55@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 10
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
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
; exhale acc(_17.val_ref.enum_Err.f$0, read$())
; [eval] read$()
(set-option :timeout 0)
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (-
    (+
      (-
        (+
          (+
            (-
              $Perm.Write
              ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))
      (read$ $Snap.unit))))))
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
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))
  $t@89@01)))
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
    (-
      (+
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    ($Perm.min
      (-
        (+
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
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
      (-
        (+
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      ($Perm.min
        (-
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))
      $Ref.null))))
(set-option :timeout 0)
(push) ; 10
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
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
; exhale acc(_17.val_ref.enum_Err, read$())
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
    (-
      (+
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    ($Perm.min
      (-
        (+
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
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
      (-
        (+
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      ($Perm.min
        (-
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))))
  (not (= ret@57@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 10
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
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
; exhale acc(_17.val_ref.discriminant, read$())
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
    (-
      (+
        (-
          (+
            (+
              (-
                $Perm.Write
                ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    ($Perm.min
      (-
        (+
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
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
        (-
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
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
; inhale acc(_9.discriminant, write - read$())
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
(declare-const $t@93@01 Int)
(declare-const $t@94@01 Int)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        (-
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        ($Perm.min
          (-
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (-
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  ($Perm.min
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit)))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))))
    (= $t@94@01 $t@87@01))
  (=> (< $Perm.No (- $Perm.Write (read$ $Snap.unit))) (= $t@94@01 $t@93@01))))
(assert (<=
  $Perm.No
  (+
    (-
      (-
        (+
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      ($Perm.min
        (-
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    (- $Perm.Write (read$ $Snap.unit)))))
(assert (<=
  (+
    (-
      (-
        (+
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      ($Perm.min
        (-
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    (- $Perm.Write (read$ $Snap.unit)))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (+
      (-
        (-
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        ($Perm.min
          (-
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (-
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  ($Perm.min
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit)))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit)))
      (- $Perm.Write (read$ $Snap.unit))))
  (not (= ret@57@01 $Ref.null))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_9.enum_Err, write - read$())
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
(declare-const $t@95@01 $Ref)
(declare-const $t@96@01 $Ref)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        (-
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        ($Perm.min
          (-
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (-
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  ($Perm.min
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit)))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))))
    (= $t@96@01 $t@89@01))
  (=> (< $Perm.No (- $Perm.Write (read$ $Snap.unit))) (= $t@96@01 $t@95@01))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_9.enum_Err.f$0, write - read$())
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (-
      (-
        (+
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      ($Perm.min
        (-
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
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
(declare-const $t@97@01 $Ref)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))
  $t@96@01)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(declare-const $t@98@01 $Ref)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        (-
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        ($Perm.min
          (-
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (-
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  ($Perm.min
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit)))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))))
    (= $t@98@01 $t@90@01))
  (=> (< $Perm.No (- $Perm.Write (read$ $Snap.unit))) (= $t@98@01 $t@97@01))))
(assert (=>
  (<
    $Perm.No
    (+
      (-
        (-
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        ($Perm.min
          (-
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (-
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  ($Perm.min
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit)))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit)))
      (- $Perm.Write (read$ $Snap.unit))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))
      $Ref.null))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_9.enum_Err.f$0.f$0, write - read$())
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (-
      (-
        (+
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      ($Perm.min
        (-
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
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
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))
  $t@96@01)))
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
      (-
        (+
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      ($Perm.min
        (-
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
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
(declare-const $t@99@01 $Ref)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@55@01 $t@98@01)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(declare-const $t@100@01 $Ref)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        (-
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        ($Perm.min
          (-
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (-
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  ($Perm.min
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit)))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))))
    (= $t@100@01 $t@91@01))
  (=> (< $Perm.No (- $Perm.Write (read$ $Snap.unit))) (= $t@100@01 $t@99@01))))
(assert (=>
  (<
    $Perm.No
    (+
      (-
        (-
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        ($Perm.min
          (-
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (-
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  ($Perm.min
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit)))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit)))
      (- $Perm.Write (read$ $Snap.unit))))
  (not (= ret@55@01 $Ref.null))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_9.enum_Err.f$0.f$0.val_int, write - read$())
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (-
      (-
        (+
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      ($Perm.min
        (-
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
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
(assert (not (= ret@55@01 $t@96@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))
  $t@96@01)))
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
      (-
        (+
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      ($Perm.min
        (-
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
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
(assert (not (= ret@55@01 $t@98@01)))
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
      (-
        (+
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      ($Perm.min
        (-
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
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
(declare-const $t@101@01 Int)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@52@01 $t@100@01)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(declare-const $t@102@01 Int)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        (-
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        ($Perm.min
          (-
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (-
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  ($Perm.min
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit)))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))))
    (= $t@102@01 $t@92@01))
  (=> (< $Perm.No (- $Perm.Write (read$ $Snap.unit))) (= $t@102@01 $t@101@01))))
(assert (=>
  (<
    $Perm.No
    (+
      (-
        (-
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        ($Perm.min
          (-
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (-
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  ($Perm.min
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit)))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit)))
      (- $Perm.Write (read$ $Snap.unit))))
  (not (= ret@52@01 $Ref.null))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; __t6 := true
; [exec]
; _14 := builtin$havoc_ref()
(declare-const ret@103@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_14.val_bool, write)
(declare-const $t@104@01 Bool)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@41@01 ret@103@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@36@01 ret@103@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@103@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; unfold acc(u32(_15), write)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@52@01 ret@84@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= _1@15@01 ret@84@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [eval] 0 <= self.val_int
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; _14.val_bool := _15.val_int > 10
; [eval] _15.val_int > 10
(declare-const val_bool@105@01 Bool)
(assert (= val_bool@105@01 (> ($SortWrappers.$SnapToInt ($Snap.first $t@85@01)) 10)))
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@41@01 ret@103@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@36@01 ret@103@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [exec]
; _13 := builtin$havoc_ref()
(declare-const ret@106@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_13.val_bool, write)
(declare-const $t@107@01 Bool)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@36@01 ret@106@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@41@01 ret@106@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@103@01 ret@106@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@106@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _13.val_bool := !_14.val_bool
; [eval] !_14.val_bool
(declare-const val_bool@108@01 Bool)
(assert (= val_bool@108@01 (not val_bool@105@01)))
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@103@01 ret@106@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@41@01 ret@106@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@36@01 ret@106@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t12 := _13.val_bool
; [eval] !__t12
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not val_bool@108@01))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not val_bool@108@01)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 27 | !(val_bool@108@01) | live]
; [else-branch: 27 | val_bool@108@01 | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 27 | !(val_bool@108@01)]
(assert (not val_bool@108@01))
; [exec]
; label bb1
; [exec]
; __t8 := true
; [exec]
; _0 := _9
; [exec]
; label l18
; [exec]
; fold acc(u32(_0.enum_Err.f$0.f$0), write)
(push) ; 11
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (-
      (-
        (+
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      ($Perm.min
        (-
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@55@01 $t@96@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))
  $t@96@01)))
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
    (-
      (-
        (+
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      ($Perm.min
        (-
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@55@01 $t@98@01)))
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
    (-
      (-
        (+
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      ($Perm.min
        (-
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= _1@15@01 $t@100@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@52@01 $t@100@01)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (-
        (-
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        ($Perm.min
          (-
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (-
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  ($Perm.min
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit)))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit)))
      (- $Perm.Write (read$ $Snap.unit)))
    ($Perm.min
      (+
        (-
          (-
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (-
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  ($Perm.min
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit)))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          ($Perm.min
            (-
              (+
                (-
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  ($Perm.min
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit)))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (-
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    ($Perm.min
                      (+
                        (+
                          (-
                            $Perm.Write
                            ($Perm.min
                              $Perm.Write
                              (- $Perm.Write (read$ $Snap.unit))))
                          (read$ $Snap.unit))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit)))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit)))
        (- $Perm.Write (read$ $Snap.unit)))
      $Perm.Write))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(assert (not (or
  (=
    (-
      $Perm.Write
      ($Perm.min
        (+
          (-
            (-
              (+
                (-
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  ($Perm.min
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit)))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (-
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    ($Perm.min
                      (+
                        (+
                          (-
                            $Perm.Write
                            ($Perm.min
                              $Perm.Write
                              (- $Perm.Write (read$ $Snap.unit))))
                          (read$ $Snap.unit))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit)))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            ($Perm.min
              (-
                (+
                  (-
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    ($Perm.min
                      (+
                        (+
                          (-
                            $Perm.Write
                            ($Perm.min
                              $Perm.Write
                              (- $Perm.Write (read$ $Snap.unit))))
                          (read$ $Snap.unit))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit)))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (-
                      (+
                        (+
                          (-
                            $Perm.Write
                            ($Perm.min
                              $Perm.Write
                              (- $Perm.Write (read$ $Snap.unit))))
                          (read$ $Snap.unit))
                        (read$ $Snap.unit))
                      ($Perm.min
                        (+
                          (+
                            (-
                              $Perm.Write
                              ($Perm.min
                                $Perm.Write
                                (- $Perm.Write (read$ $Snap.unit))))
                            (read$ $Snap.unit))
                          (read$ $Snap.unit))
                        (read$ $Snap.unit)))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit)))
          (- $Perm.Write (read$ $Snap.unit)))
        $Perm.Write))
    $Perm.No)
  (<
    (-
      $Perm.Write
      ($Perm.min
        (+
          (-
            (-
              (+
                (-
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  ($Perm.min
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit)))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (-
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    ($Perm.min
                      (+
                        (+
                          (-
                            $Perm.Write
                            ($Perm.min
                              $Perm.Write
                              (- $Perm.Write (read$ $Snap.unit))))
                          (read$ $Snap.unit))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit)))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            ($Perm.min
              (-
                (+
                  (-
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    ($Perm.min
                      (+
                        (+
                          (-
                            $Perm.Write
                            ($Perm.min
                              $Perm.Write
                              (- $Perm.Write (read$ $Snap.unit))))
                          (read$ $Snap.unit))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit)))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (-
                      (+
                        (+
                          (-
                            $Perm.Write
                            ($Perm.min
                              $Perm.Write
                              (- $Perm.Write (read$ $Snap.unit))))
                          (read$ $Snap.unit))
                        (read$ $Snap.unit))
                      ($Perm.min
                        (+
                          (+
                            (-
                              $Perm.Write
                              ($Perm.min
                                $Perm.Write
                                (- $Perm.Write (read$ $Snap.unit))))
                            (read$ $Snap.unit))
                          (read$ $Snap.unit))
                        (read$ $Snap.unit)))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit)))
          (- $Perm.Write (read$ $Snap.unit)))
        $Perm.Write))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [eval] 0 <= self.val_int
(push) ; 11
(set-option :timeout 10)
(assert (not (= _1@15@01 $t@100@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@52@01 $t@100@01)))
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
    (-
      (-
        (+
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      ($Perm.min
        (-
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(assert (not (<= 0 $t@102@01)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 $t@102@01))
(assert (u32%trigger ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit) $t@100@01))
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@56@01)) $t@100@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(struct$m_UnexpectedValue(_0.enum_Err.f$0), write)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (-
      (-
        (+
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      ($Perm.min
        (-
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))
  $t@96@01)))
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
    (-
      (-
        (+
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      ($Perm.min
        (-
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))
  $t@98@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@55@01 $t@98@01)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (-
        (-
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        ($Perm.min
          (-
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (-
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  ($Perm.min
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit)))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit)))
      (- $Perm.Write (read$ $Snap.unit)))
    ($Perm.min
      (+
        (-
          (-
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (-
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  ($Perm.min
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit)))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          ($Perm.min
            (-
              (+
                (-
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  ($Perm.min
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit)))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (-
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    ($Perm.min
                      (+
                        (+
                          (-
                            $Perm.Write
                            ($Perm.min
                              $Perm.Write
                              (- $Perm.Write (read$ $Snap.unit))))
                          (read$ $Snap.unit))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit)))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit)))
        (- $Perm.Write (read$ $Snap.unit)))
      $Perm.Write))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(assert (not (or
  (=
    (-
      $Perm.Write
      ($Perm.min
        (+
          (-
            (-
              (+
                (-
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  ($Perm.min
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit)))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (-
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    ($Perm.min
                      (+
                        (+
                          (-
                            $Perm.Write
                            ($Perm.min
                              $Perm.Write
                              (- $Perm.Write (read$ $Snap.unit))))
                          (read$ $Snap.unit))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit)))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            ($Perm.min
              (-
                (+
                  (-
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    ($Perm.min
                      (+
                        (+
                          (-
                            $Perm.Write
                            ($Perm.min
                              $Perm.Write
                              (- $Perm.Write (read$ $Snap.unit))))
                          (read$ $Snap.unit))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit)))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (-
                      (+
                        (+
                          (-
                            $Perm.Write
                            ($Perm.min
                              $Perm.Write
                              (- $Perm.Write (read$ $Snap.unit))))
                          (read$ $Snap.unit))
                        (read$ $Snap.unit))
                      ($Perm.min
                        (+
                          (+
                            (-
                              $Perm.Write
                              ($Perm.min
                                $Perm.Write
                                (- $Perm.Write (read$ $Snap.unit))))
                            (read$ $Snap.unit))
                          (read$ $Snap.unit))
                        (read$ $Snap.unit)))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit)))
          (- $Perm.Write (read$ $Snap.unit)))
        $Perm.Write))
    $Perm.No)
  (<
    (-
      $Perm.Write
      ($Perm.min
        (+
          (-
            (-
              (+
                (-
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  ($Perm.min
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit)))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (-
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    ($Perm.min
                      (+
                        (+
                          (-
                            $Perm.Write
                            ($Perm.min
                              $Perm.Write
                              (- $Perm.Write (read$ $Snap.unit))))
                          (read$ $Snap.unit))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit)))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            ($Perm.min
              (-
                (+
                  (-
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    ($Perm.min
                      (+
                        (+
                          (-
                            $Perm.Write
                            ($Perm.min
                              $Perm.Write
                              (- $Perm.Write (read$ $Snap.unit))))
                          (read$ $Snap.unit))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit)))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (-
                      (+
                        (+
                          (-
                            $Perm.Write
                            ($Perm.min
                              $Perm.Write
                              (- $Perm.Write (read$ $Snap.unit))))
                          (read$ $Snap.unit))
                        (read$ $Snap.unit))
                      ($Perm.min
                        (+
                          (+
                            (-
                              $Perm.Write
                              ($Perm.min
                                $Perm.Write
                                (- $Perm.Write (read$ $Snap.unit))))
                            (read$ $Snap.unit))
                          (read$ $Snap.unit))
                        (read$ $Snap.unit)))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit)))
          (- $Perm.Write (read$ $Snap.unit)))
        $Perm.Write))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))
  $t@98@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@55@01 $t@98@01)))
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
    (-
      (-
        (+
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      ($Perm.min
        (-
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (struct$m_UnexpectedValue%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap $t@100@01)
  ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)) $t@98@01))
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01)))))))
  $t@98@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_Err(_0.enum_Err), write)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (-
      (-
        (+
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      ($Perm.min
        (-
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))
  $t@96@01)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (-
        (-
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        ($Perm.min
          (-
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (-
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  ($Perm.min
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit)))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit)))
      (- $Perm.Write (read$ $Snap.unit)))
    ($Perm.min
      (+
        (-
          (-
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (-
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  ($Perm.min
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit)))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          ($Perm.min
            (-
              (+
                (-
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  ($Perm.min
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit)))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (-
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    ($Perm.min
                      (+
                        (+
                          (-
                            $Perm.Write
                            ($Perm.min
                              $Perm.Write
                              (- $Perm.Write (read$ $Snap.unit))))
                          (read$ $Snap.unit))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit)))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit)))
        (- $Perm.Write (read$ $Snap.unit)))
      $Perm.Write))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(assert (not (or
  (=
    (-
      $Perm.Write
      ($Perm.min
        (+
          (-
            (-
              (+
                (-
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  ($Perm.min
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit)))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (-
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    ($Perm.min
                      (+
                        (+
                          (-
                            $Perm.Write
                            ($Perm.min
                              $Perm.Write
                              (- $Perm.Write (read$ $Snap.unit))))
                          (read$ $Snap.unit))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit)))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            ($Perm.min
              (-
                (+
                  (-
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    ($Perm.min
                      (+
                        (+
                          (-
                            $Perm.Write
                            ($Perm.min
                              $Perm.Write
                              (- $Perm.Write (read$ $Snap.unit))))
                          (read$ $Snap.unit))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit)))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (-
                      (+
                        (+
                          (-
                            $Perm.Write
                            ($Perm.min
                              $Perm.Write
                              (- $Perm.Write (read$ $Snap.unit))))
                          (read$ $Snap.unit))
                        (read$ $Snap.unit))
                      ($Perm.min
                        (+
                          (+
                            (-
                              $Perm.Write
                              ($Perm.min
                                $Perm.Write
                                (- $Perm.Write (read$ $Snap.unit))))
                            (read$ $Snap.unit))
                          (read$ $Snap.unit))
                        (read$ $Snap.unit)))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit)))
          (- $Perm.Write (read$ $Snap.unit)))
        $Perm.Write))
    $Perm.No)
  (<
    (-
      $Perm.Write
      ($Perm.min
        (+
          (-
            (-
              (+
                (-
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  ($Perm.min
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit)))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (-
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    ($Perm.min
                      (+
                        (+
                          (-
                            $Perm.Write
                            ($Perm.min
                              $Perm.Write
                              (- $Perm.Write (read$ $Snap.unit))))
                          (read$ $Snap.unit))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit)))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            ($Perm.min
              (-
                (+
                  (-
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    ($Perm.min
                      (+
                        (+
                          (-
                            $Perm.Write
                            ($Perm.min
                              $Perm.Write
                              (- $Perm.Write (read$ $Snap.unit))))
                          (read$ $Snap.unit))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit)))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (-
                      (+
                        (+
                          (-
                            $Perm.Write
                            ($Perm.min
                              $Perm.Write
                              (- $Perm.Write (read$ $Snap.unit))))
                          (read$ $Snap.unit))
                        (read$ $Snap.unit))
                      ($Perm.min
                        (+
                          (+
                            (-
                              $Perm.Write
                              ($Perm.min
                                $Perm.Write
                                (- $Perm.Write (read$ $Snap.unit))))
                            (read$ $Snap.unit))
                          (read$ $Snap.unit))
                        (read$ $Snap.unit)))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit)))
          (- $Perm.Write (read$ $Snap.unit)))
        $Perm.Write))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))
  $t@96@01)))
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
    (-
      (-
        (+
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      ($Perm.min
        (-
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_Err%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap $t@98@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap $t@100@01)
    ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit))) $t@96@01))
; [exec]
; fold acc(m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0), write)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (-
        (-
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        ($Perm.min
          (-
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (-
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  ($Perm.min
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit)))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit)))
      (- $Perm.Write (read$ $Snap.unit)))
    ($Perm.min
      (+
        (-
          (-
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (-
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  ($Perm.min
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit)))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          ($Perm.min
            (-
              (+
                (-
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  ($Perm.min
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit)))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (-
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    ($Perm.min
                      (+
                        (+
                          (-
                            $Perm.Write
                            ($Perm.min
                              $Perm.Write
                              (- $Perm.Write (read$ $Snap.unit))))
                          (read$ $Snap.unit))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit)))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit)))
        (- $Perm.Write (read$ $Snap.unit)))
      $Perm.Write))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(assert (not (or
  (=
    (-
      $Perm.Write
      ($Perm.min
        (+
          (-
            (-
              (+
                (-
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  ($Perm.min
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit)))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (-
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    ($Perm.min
                      (+
                        (+
                          (-
                            $Perm.Write
                            ($Perm.min
                              $Perm.Write
                              (- $Perm.Write (read$ $Snap.unit))))
                          (read$ $Snap.unit))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit)))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            ($Perm.min
              (-
                (+
                  (-
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    ($Perm.min
                      (+
                        (+
                          (-
                            $Perm.Write
                            ($Perm.min
                              $Perm.Write
                              (- $Perm.Write (read$ $Snap.unit))))
                          (read$ $Snap.unit))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit)))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (-
                      (+
                        (+
                          (-
                            $Perm.Write
                            ($Perm.min
                              $Perm.Write
                              (- $Perm.Write (read$ $Snap.unit))))
                          (read$ $Snap.unit))
                        (read$ $Snap.unit))
                      ($Perm.min
                        (+
                          (+
                            (-
                              $Perm.Write
                              ($Perm.min
                                $Perm.Write
                                (- $Perm.Write (read$ $Snap.unit))))
                            (read$ $Snap.unit))
                          (read$ $Snap.unit))
                        (read$ $Snap.unit)))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit)))
          (- $Perm.Write (read$ $Snap.unit)))
        $Perm.Write))
    $Perm.No)
  (<
    (-
      $Perm.Write
      ($Perm.min
        (+
          (-
            (-
              (+
                (-
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  ($Perm.min
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit)))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (-
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    ($Perm.min
                      (+
                        (+
                          (-
                            $Perm.Write
                            ($Perm.min
                              $Perm.Write
                              (- $Perm.Write (read$ $Snap.unit))))
                          (read$ $Snap.unit))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit)))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            ($Perm.min
              (-
                (+
                  (-
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    ($Perm.min
                      (+
                        (+
                          (-
                            $Perm.Write
                            ($Perm.min
                              $Perm.Write
                              (- $Perm.Write (read$ $Snap.unit))))
                          (read$ $Snap.unit))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit)))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (-
                      (+
                        (+
                          (-
                            $Perm.Write
                            ($Perm.min
                              $Perm.Write
                              (- $Perm.Write (read$ $Snap.unit))))
                          (read$ $Snap.unit))
                        (read$ $Snap.unit))
                      ($Perm.min
                        (+
                          (+
                            (-
                              $Perm.Write
                              ($Perm.min
                                $Perm.Write
                                (- $Perm.Write (read$ $Snap.unit))))
                            (read$ $Snap.unit))
                          (read$ $Snap.unit))
                        (read$ $Snap.unit)))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit)))
          (- $Perm.Write (read$ $Snap.unit)))
        $Perm.Write))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [eval] 0 <= self.discriminant
(push) ; 11
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (-
      (-
        (+
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      ($Perm.min
        (-
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(assert (not (<= 0 $t@94@01)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 $t@94@01))
; [eval] self.discriminant <= 1
(push) ; 11
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (-
      (-
        (+
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      ($Perm.min
        (-
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(assert (not (<= $t@94@01 1)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (<= $t@94@01 1))
(push) ; 11
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
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
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
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (-
        (-
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        ($Perm.min
          (-
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (-
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  ($Perm.min
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit)))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit)))
      (- $Perm.Write (read$ $Snap.unit)))
    ($Perm.min
      (+
        (-
          (-
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (-
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  ($Perm.min
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit)))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          ($Perm.min
            (-
              (+
                (-
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  ($Perm.min
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit)))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (-
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    ($Perm.min
                      (+
                        (+
                          (-
                            $Perm.Write
                            ($Perm.min
                              $Perm.Write
                              (- $Perm.Write (read$ $Snap.unit))))
                          (read$ $Snap.unit))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit)))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit)))
        (- $Perm.Write (read$ $Snap.unit)))
      $Perm.Write))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(assert (not (or
  (=
    (-
      $Perm.Write
      ($Perm.min
        (+
          (-
            (-
              (+
                (-
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  ($Perm.min
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit)))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (-
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    ($Perm.min
                      (+
                        (+
                          (-
                            $Perm.Write
                            ($Perm.min
                              $Perm.Write
                              (- $Perm.Write (read$ $Snap.unit))))
                          (read$ $Snap.unit))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit)))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            ($Perm.min
              (-
                (+
                  (-
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    ($Perm.min
                      (+
                        (+
                          (-
                            $Perm.Write
                            ($Perm.min
                              $Perm.Write
                              (- $Perm.Write (read$ $Snap.unit))))
                          (read$ $Snap.unit))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit)))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (-
                      (+
                        (+
                          (-
                            $Perm.Write
                            ($Perm.min
                              $Perm.Write
                              (- $Perm.Write (read$ $Snap.unit))))
                          (read$ $Snap.unit))
                        (read$ $Snap.unit))
                      ($Perm.min
                        (+
                          (+
                            (-
                              $Perm.Write
                              ($Perm.min
                                $Perm.Write
                                (- $Perm.Write (read$ $Snap.unit))))
                            (read$ $Snap.unit))
                          (read$ $Snap.unit))
                        (read$ $Snap.unit)))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit)))
          (- $Perm.Write (read$ $Snap.unit)))
        $Perm.Write))
    $Perm.No)
  (<
    (-
      $Perm.Write
      ($Perm.min
        (+
          (-
            (-
              (+
                (-
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  ($Perm.min
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit)))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (-
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    ($Perm.min
                      (+
                        (+
                          (-
                            $Perm.Write
                            ($Perm.min
                              $Perm.Write
                              (- $Perm.Write (read$ $Snap.unit))))
                          (read$ $Snap.unit))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit)))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            ($Perm.min
              (-
                (+
                  (-
                    (+
                      (+
                        (-
                          $Perm.Write
                          ($Perm.min
                            $Perm.Write
                            (- $Perm.Write (read$ $Snap.unit))))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit))
                    ($Perm.min
                      (+
                        (+
                          (-
                            $Perm.Write
                            ($Perm.min
                              $Perm.Write
                              (- $Perm.Write (read$ $Snap.unit))))
                          (read$ $Snap.unit))
                        (read$ $Snap.unit))
                      (read$ $Snap.unit)))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (-
                      (+
                        (+
                          (-
                            $Perm.Write
                            ($Perm.min
                              $Perm.Write
                              (- $Perm.Write (read$ $Snap.unit))))
                          (read$ $Snap.unit))
                        (read$ $Snap.unit))
                      ($Perm.min
                        (+
                          (+
                            (-
                              $Perm.Write
                              ($Perm.min
                                $Perm.Write
                                (- $Perm.Write (read$ $Snap.unit))))
                            (read$ $Snap.unit))
                          (read$ $Snap.unit))
                        (read$ $Snap.unit)))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit)))
          (- $Perm.Write (read$ $Snap.unit)))
        $Perm.Write))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [eval] self.discriminant == 1
(push) ; 11
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (-
      (-
        (+
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      ($Perm.min
        (-
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not (= $t@94@01 1))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@94@01 1)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 28 | $t@94@01 == 1 | live]
; [else-branch: 28 | $t@94@01 != 1 | dead]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 28 | $t@94@01 == 1]
(assert (= $t@94@01 1))
(push) ; 12
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (-
      (-
        (+
          (-
            (+
              (+
                (-
                  $Perm.Write
                  ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      ($Perm.min
        (-
          (+
            (-
              (+
                (+
                  (-
                    $Perm.Write
                    ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                  (read$ $Snap.unit))
                (read$ $Snap.unit))
              ($Perm.min
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+
                  (+
                    (-
                      $Perm.Write
                      ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit))))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit))
                ($Perm.min
                  (+
                    (+
                      (-
                        $Perm.Write
                        ($Perm.min
                          $Perm.Write
                          (- $Perm.Write (read$ $Snap.unit))))
                      (read$ $Snap.unit))
                    (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    (- $Perm.Write (read$ $Snap.unit))))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(assert (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap $t@94@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap $t@88@01)
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@96@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@98@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@100@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01))
; [exec]
; label l5
; [exec]
; __t9 := true
; [exec]
; label l20
; [exec]
; assert (!(old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) > 10) ||
;   m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)) &&
;   m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)) ==
;   old[pre]((unfolding acc(u32(_1), write) in _1.val_int))) &&
;   ((!m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)) ||
;   m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)) >
;   10) &&
;   ((!(old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) <= 10) ||
;   m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0))) &&
;   ((!m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)) ||
;   old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) <= 10) &&
;   ((old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) < 0 ||
;   (10 <= old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) ||
;   !m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)))) &&
;   ((!m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)) ||
;   (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)) ||
;   0 <= old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) &&
;   old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) < 10)) &&
;   ((!(old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) == 10) ||
;   m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0))) &&
;   (!m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)) ||
;   (!m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)) ||
;   old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) == 10))))))))
; [eval] !(old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) > 10) || m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)) && m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)) == old[pre]((unfolding acc(u32(_1), write) in _1.val_int))
; [eval] !(old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) > 10)
; [eval] old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) > 10
; [eval] old[pre]((unfolding acc(u32(_1), write) in _1.val_int))
; [eval] (unfolding acc(u32(_1), write) in _1.val_int)
(set-option :timeout 0)
(push) ; 12
; [eval] 0 <= self.val_int
(pop) ; 12
; Joined path conditions
(push) ; 12
; [then-branch: 29 | !(First:($t@31@01) > 10) | live]
; [else-branch: 29 | First:($t@31@01) > 10 | live]
(push) ; 13
; [then-branch: 29 | !(First:($t@31@01) > 10)]
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10)))
(pop) ; 13
(push) ; 13
; [else-branch: 29 | First:($t@31@01) > 10]
(assert (> ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10))
; [eval] m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)) && m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)) == old[pre]((unfolding acc(u32(_1), write) in _1.val_int))
; [eval] m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)
(push) ; 14
; [eval] read$()
(push) ; 15
(pop) ; 15
; Joined path conditions
(push) ; 15
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(push) ; 15
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(push) ; 15
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(assert (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap $t@94@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap $t@88@01)
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@96@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@98@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@100@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01))
(pop) ; 14
; Joined path conditions
(assert (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap $t@94@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap $t@88@01)
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@96@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@98@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@100@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01))
(set-option :timeout 0)
(push) ; 14
(assert (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($SortWrappers.IntTo$Snap $t@94@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap $t@88@01)
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@96@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@98@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@100@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01)))
(pop) ; 14
; Joined path conditions
(assert (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($SortWrappers.IntTo$Snap $t@94@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap $t@88@01)
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@96@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@98@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@100@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01)))
(push) ; 14
; [then-branch: 30 | m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(($t@94@01, (_, (_, ($t@88@01, ($t@96@01, ($t@98@01, ($t@100@01, ($t@102@01, _)))))))), ret@57@01)) | live]
; [else-branch: 30 | !(m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(($t@94@01, (_, (_, ($t@88@01, ($t@96@01, ($t@98@01, ($t@100@01, ($t@102@01, _)))))))), ret@57@01))) | live]
(push) ; 15
; [then-branch: 30 | m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(($t@94@01, (_, (_, ($t@88@01, ($t@96@01, ($t@98@01, ($t@100@01, ($t@102@01, _)))))))), ret@57@01))]
(assert (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($SortWrappers.IntTo$Snap $t@94@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap $t@88@01)
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@96@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@98@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@100@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01)))
; [eval] m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)) == old[pre]((unfolding acc(u32(_1), write) in _1.val_int))
; [eval] m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)
(push) ; 16
; [eval] read$()
(push) ; 17
(pop) ; 17
; Joined path conditions
(push) ; 17
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(push) ; 17
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(push) ; 17
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(pop) ; 16
; Joined path conditions
(set-option :timeout 0)
(push) ; 16
; [eval] m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(_1)
(push) ; 17
(pop) ; 17
; Joined path conditions
(assert (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($SortWrappers.IntTo$Snap $t@94@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap $t@88@01)
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@96@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@98@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@100@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01)))
(pop) ; 16
; Joined path conditions
(assert (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($SortWrappers.IntTo$Snap $t@94@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap $t@88@01)
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@96@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@98@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@100@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01)))
; [eval] old[pre]((unfolding acc(u32(_1), write) in _1.val_int))
; [eval] (unfolding acc(u32(_1), write) in _1.val_int)
(push) ; 16
; [eval] 0 <= self.val_int
(pop) ; 16
; Joined path conditions
(pop) ; 15
(push) ; 15
; [else-branch: 30 | !(m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(($t@94@01, (_, (_, ($t@88@01, ($t@96@01, ($t@98@01, ($t@100@01, ($t@102@01, _)))))))), ret@57@01)))]
(assert (not
  (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($SortWrappers.IntTo$Snap $t@94@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@88@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@96@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@98@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@100@01)
                ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01))))
(pop) ; 15
(pop) ; 14
; Joined path conditions
(assert (=>
  (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($SortWrappers.IntTo$Snap $t@94@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@88@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@96@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@98@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@100@01)
                ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01))
  (and
    (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($SortWrappers.IntTo$Snap $t@94@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@88@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@96@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@98@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@100@01)
                  ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01))
    (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($SortWrappers.IntTo$Snap $t@94@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@88@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@96@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@98@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@100@01)
                  ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01)))))
; Joined path conditions
(assert (or
  (not
    (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($SortWrappers.IntTo$Snap $t@94@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@88@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@96@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@98@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@100@01)
                  ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01)))
  (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($SortWrappers.IntTo$Snap $t@94@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@88@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@96@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@98@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@100@01)
                ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01))))
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (=>
  (> ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10)
  (and
    (> ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10)
    (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%precondition ($Snap.combine
      ($SortWrappers.IntTo$Snap $t@94@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@88@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@96@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@98@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@100@01)
                  ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01)
    (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($SortWrappers.IntTo$Snap $t@94@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@88@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@96@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@98@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@100@01)
                  ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01))
    (=>
      (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
        ($SortWrappers.IntTo$Snap $t@94@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@88@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@96@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@98@01)
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap $t@100@01)
                    ($Snap.combine
                      ($SortWrappers.IntTo$Snap $t@102@01)
                      $Snap.unit)))))))) ret@57@01))
      (and
        (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
          ($SortWrappers.IntTo$Snap $t@94@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@88@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@96@01)
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap $t@98@01)
                    ($Snap.combine
                      ($SortWrappers.$RefTo$Snap $t@100@01)
                      ($Snap.combine
                        ($SortWrappers.IntTo$Snap $t@102@01)
                        $Snap.unit)))))))) ret@57@01))
        (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
          ($SortWrappers.IntTo$Snap $t@94@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@88@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@96@01)
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap $t@98@01)
                    ($Snap.combine
                      ($SortWrappers.$RefTo$Snap $t@100@01)
                      ($Snap.combine
                        ($SortWrappers.IntTo$Snap $t@102@01)
                        $Snap.unit)))))))) ret@57@01))))
    (or
      (not
        (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
          ($SortWrappers.IntTo$Snap $t@94@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@88@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@96@01)
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap $t@98@01)
                    ($Snap.combine
                      ($SortWrappers.$RefTo$Snap $t@100@01)
                      ($Snap.combine
                        ($SortWrappers.IntTo$Snap $t@102@01)
                        $Snap.unit)))))))) ret@57@01)))
      (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
        ($SortWrappers.IntTo$Snap $t@94@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@88@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@96@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@98@01)
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap $t@100@01)
                    ($Snap.combine
                      ($SortWrappers.IntTo$Snap $t@102@01)
                      $Snap.unit)))))))) ret@57@01))))))
(assert (or
  (> ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10)
  (not (> ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10))))
(push) ; 12
(assert (not (or
  (not (> ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10))
  (and
    (=
      (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
        ($SortWrappers.IntTo$Snap $t@94@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@88@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@96@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@98@01)
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap $t@100@01)
                    ($Snap.combine
                      ($SortWrappers.IntTo$Snap $t@102@01)
                      $Snap.unit)))))))) ret@57@01))
      ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)))
    (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($SortWrappers.IntTo$Snap $t@94@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@88@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@96@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@98@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@100@01)
                  ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01))))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(assert (or
  (not (> ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10))
  (and
    (=
      (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
        ($SortWrappers.IntTo$Snap $t@94@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@88@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@96@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@98@01)
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap $t@100@01)
                    ($Snap.combine
                      ($SortWrappers.IntTo$Snap $t@102@01)
                      $Snap.unit)))))))) ret@57@01))
      ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)))
    (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($SortWrappers.IntTo$Snap $t@94@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@88@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@96@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@98@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@100@01)
                  ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01)))))
; [eval] !m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)) || m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)) > 10
; [eval] !m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)
(push) ; 12
; [eval] read$()
(push) ; 13
(pop) ; 13
; Joined path conditions
(push) ; 13
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(push) ; 13
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(push) ; 13
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(assert (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap $t@94@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap $t@88@01)
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@96@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@98@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@100@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01))
(pop) ; 12
; Joined path conditions
(assert (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap $t@94@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap $t@88@01)
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@96@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@98@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@100@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01))
(set-option :timeout 0)
(push) ; 12
(assert (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($SortWrappers.IntTo$Snap $t@94@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap $t@88@01)
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@96@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@98@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@100@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01)))
(pop) ; 12
; Joined path conditions
(assert (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($SortWrappers.IntTo$Snap $t@94@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap $t@88@01)
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@96@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@98@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@100@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01)))
(push) ; 12
; [then-branch: 31 | !(m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(($t@94@01, (_, (_, ($t@88@01, ($t@96@01, ($t@98@01, ($t@100@01, ($t@102@01, _)))))))), ret@57@01))) | live]
; [else-branch: 31 | m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(($t@94@01, (_, (_, ($t@88@01, ($t@96@01, ($t@98@01, ($t@100@01, ($t@102@01, _)))))))), ret@57@01)) | live]
(push) ; 13
; [then-branch: 31 | !(m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(($t@94@01, (_, (_, ($t@88@01, ($t@96@01, ($t@98@01, ($t@100@01, ($t@102@01, _)))))))), ret@57@01)))]
(assert (not
  (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($SortWrappers.IntTo$Snap $t@94@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@88@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@96@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@98@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@100@01)
                ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01))))
(pop) ; 13
(push) ; 13
; [else-branch: 31 | m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(($t@94@01, (_, (_, ($t@88@01, ($t@96@01, ($t@98@01, ($t@100@01, ($t@102@01, _)))))))), ret@57@01))]
(assert (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($SortWrappers.IntTo$Snap $t@94@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap $t@88@01)
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@96@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@98@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@100@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01)))
; [eval] m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)) > 10
; [eval] m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)
(push) ; 14
; [eval] read$()
(push) ; 15
(pop) ; 15
; Joined path conditions
(push) ; 15
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(push) ; 15
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(push) ; 15
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(pop) ; 14
; Joined path conditions
(set-option :timeout 0)
(push) ; 14
; [eval] m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(_1)
(push) ; 15
(pop) ; 15
; Joined path conditions
(assert (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($SortWrappers.IntTo$Snap $t@94@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap $t@88@01)
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@96@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@98@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@100@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01)))
(pop) ; 14
; Joined path conditions
(assert (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($SortWrappers.IntTo$Snap $t@94@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap $t@88@01)
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@96@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@98@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@100@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01)))
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (=>
  (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($SortWrappers.IntTo$Snap $t@94@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@88@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@96@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@98@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@100@01)
                ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01))
  (and
    (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($SortWrappers.IntTo$Snap $t@94@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@88@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@96@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@98@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@100@01)
                  ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01))
    (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($SortWrappers.IntTo$Snap $t@94@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@88@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@96@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@98@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@100@01)
                  ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01)))))
(assert (or
  (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($SortWrappers.IntTo$Snap $t@94@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@88@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@96@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@98@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@100@01)
                ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01))
  (not
    (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($SortWrappers.IntTo$Snap $t@94@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@88@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@96@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@98@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@100@01)
                  ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01)))))
(push) ; 12
(assert (not (or
  (not
    (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($SortWrappers.IntTo$Snap $t@94@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@88@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@96@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@98@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@100@01)
                  ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01)))
  (>
    (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($SortWrappers.IntTo$Snap $t@94@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@88@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@96@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@98@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@100@01)
                  ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01))
    10))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(assert (or
  (not
    (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($SortWrappers.IntTo$Snap $t@94@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@88@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@96@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@98@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@100@01)
                  ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01)))
  (>
    (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($SortWrappers.IntTo$Snap $t@94@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@88@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@96@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@98@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@100@01)
                  ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01))
    10)))
; [eval] !(old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) <= 10) || m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] !(old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) <= 10)
; [eval] old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) <= 10
; [eval] old[pre]((unfolding acc(u32(_1), write) in _1.val_int))
; [eval] (unfolding acc(u32(_1), write) in _1.val_int)
(push) ; 12
; [eval] 0 <= self.val_int
(pop) ; 12
; Joined path conditions
(push) ; 12
; [then-branch: 32 | !(First:($t@31@01) <= 10) | live]
; [else-branch: 32 | First:($t@31@01) <= 10 | live]
(push) ; 13
; [then-branch: 32 | !(First:($t@31@01) <= 10)]
(assert (not (<= ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10)))
(pop) ; 13
(push) ; 13
; [else-branch: 32 | First:($t@31@01) <= 10]
(assert (<= ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10))
; [eval] m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)
(push) ; 14
; [eval] read$()
(push) ; 15
(pop) ; 15
; Joined path conditions
(push) ; 15
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(push) ; 15
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(push) ; 15
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(pop) ; 14
; Joined path conditions
(set-option :timeout 0)
(push) ; 14
(assert (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($SortWrappers.IntTo$Snap $t@94@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap $t@88@01)
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@96@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@98@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@100@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01)))
(pop) ; 14
; Joined path conditions
(assert (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($SortWrappers.IntTo$Snap $t@94@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap $t@88@01)
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@96@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@98@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@100@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01)))
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10)
  (and
    (<= ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10)
    (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($SortWrappers.IntTo$Snap $t@94@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@88@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@96@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@98@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@100@01)
                  ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01)))))
(assert (or
  (<= ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10)
  (not (<= ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10))))
(push) ; 12
(assert (not (or
  (not (<= ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10))
  (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($SortWrappers.IntTo$Snap $t@94@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@88@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@96@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@98@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@100@01)
                ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01)))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(assert (or
  (not (<= ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10))
  (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($SortWrappers.IntTo$Snap $t@94@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@88@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@96@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@98@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@100@01)
                ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01))))
; [eval] !m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)) || old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) <= 10
; [eval] !m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)
(push) ; 12
; [eval] read$()
(push) ; 13
(pop) ; 13
; Joined path conditions
(push) ; 13
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(push) ; 13
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(push) ; 13
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(pop) ; 12
; Joined path conditions
(set-option :timeout 0)
(push) ; 12
(assert (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($SortWrappers.IntTo$Snap $t@94@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap $t@88@01)
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@96@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@98@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@100@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01)))
(pop) ; 12
; Joined path conditions
(assert (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($SortWrappers.IntTo$Snap $t@94@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap $t@88@01)
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@96@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@98@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@100@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01)))
(push) ; 12
; [then-branch: 33 | !(m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(($t@94@01, (_, (_, ($t@88@01, ($t@96@01, ($t@98@01, ($t@100@01, ($t@102@01, _)))))))), ret@57@01))) | live]
; [else-branch: 33 | m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(($t@94@01, (_, (_, ($t@88@01, ($t@96@01, ($t@98@01, ($t@100@01, ($t@102@01, _)))))))), ret@57@01)) | live]
(push) ; 13
; [then-branch: 33 | !(m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(($t@94@01, (_, (_, ($t@88@01, ($t@96@01, ($t@98@01, ($t@100@01, ($t@102@01, _)))))))), ret@57@01)))]
(assert (not
  (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($SortWrappers.IntTo$Snap $t@94@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@88@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@96@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@98@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@100@01)
                ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01))))
(pop) ; 13
(push) ; 13
; [else-branch: 33 | m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(($t@94@01, (_, (_, ($t@88@01, ($t@96@01, ($t@98@01, ($t@100@01, ($t@102@01, _)))))))), ret@57@01))]
(assert (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($SortWrappers.IntTo$Snap $t@94@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap $t@88@01)
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@96@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@98@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@100@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01)))
; [eval] old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) <= 10
; [eval] old[pre]((unfolding acc(u32(_1), write) in _1.val_int))
; [eval] (unfolding acc(u32(_1), write) in _1.val_int)
(push) ; 14
; [eval] 0 <= self.val_int
(pop) ; 14
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (or
  (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($SortWrappers.IntTo$Snap $t@94@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@88@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@96@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@98@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@100@01)
                ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01))
  (not
    (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($SortWrappers.IntTo$Snap $t@94@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@88@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@96@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@98@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@100@01)
                  ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01)))))
(push) ; 12
(assert (not (or
  (not
    (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($SortWrappers.IntTo$Snap $t@94@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@88@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@96@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@98@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@100@01)
                  ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01)))
  (<= ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(assert (or
  (not
    (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($SortWrappers.IntTo$Snap $t@94@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@88@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@96@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@98@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@100@01)
                  ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01)))
  (<= ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10)))
; [eval] old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) < 0 || (10 <= old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) || !m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)))
; [eval] old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) < 0
; [eval] old[pre]((unfolding acc(u32(_1), write) in _1.val_int))
; [eval] (unfolding acc(u32(_1), write) in _1.val_int)
(push) ; 12
; [eval] 0 <= self.val_int
(pop) ; 12
; Joined path conditions
(push) ; 12
; [then-branch: 34 | First:($t@31@01) < 0 | live]
; [else-branch: 34 | !(First:($t@31@01) < 0) | live]
(push) ; 13
; [then-branch: 34 | First:($t@31@01) < 0]
(assert (< ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 0))
(pop) ; 13
(push) ; 13
; [else-branch: 34 | !(First:($t@31@01) < 0)]
(assert (not (< ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 0)))
; [eval] 10 <= old[pre]((unfolding acc(u32(_1), write) in _1.val_int))
; [eval] old[pre]((unfolding acc(u32(_1), write) in _1.val_int))
; [eval] (unfolding acc(u32(_1), write) in _1.val_int)
(push) ; 14
; [eval] 0 <= self.val_int
(pop) ; 14
; Joined path conditions
(push) ; 14
; [then-branch: 35 | 10 <= First:($t@31@01) | live]
; [else-branch: 35 | !(10 <= First:($t@31@01)) | live]
(push) ; 15
; [then-branch: 35 | 10 <= First:($t@31@01)]
(assert (<= 10 ($SortWrappers.$SnapToInt ($Snap.first $t@31@01))))
(pop) ; 15
(push) ; 15
; [else-branch: 35 | !(10 <= First:($t@31@01))]
(assert (not (<= 10 ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)))))
; [eval] !m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)
(push) ; 16
; [eval] read$()
(push) ; 17
(pop) ; 17
; Joined path conditions
(push) ; 17
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(push) ; 17
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unsat
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(push) ; 17
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(pop) ; 16
; Joined path conditions
(set-option :timeout 0)
(push) ; 16
; [eval] m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(_1)
(push) ; 17
(pop) ; 17
; Joined path conditions
(push) ; 17
(assert (not (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($SortWrappers.IntTo$Snap $t@94@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap $t@88@01)
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@96@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@98@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@100@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01))))
(check-sat)
; unsat
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
(assert (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($SortWrappers.IntTo$Snap $t@94@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap $t@88@01)
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@96@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@98@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@100@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01)))
(assert (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($SortWrappers.IntTo$Snap $t@94@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap $t@88@01)
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@96@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@98@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@100@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01)))
(pop) ; 16
; Joined path conditions
(assert (and
  (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($SortWrappers.IntTo$Snap $t@94@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@88@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@96@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@98@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@100@01)
                ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01))
  (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($SortWrappers.IntTo$Snap $t@94@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@88@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@96@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@98@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@100@01)
                ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01))))
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (<= 10 ($SortWrappers.$SnapToInt ($Snap.first $t@31@01))))
  (and
    (not (<= 10 ($SortWrappers.$SnapToInt ($Snap.first $t@31@01))))
    (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($SortWrappers.IntTo$Snap $t@94@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@88@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@96@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@98@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@100@01)
                  ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01))
    (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($SortWrappers.IntTo$Snap $t@94@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@88@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@96@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@98@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@100@01)
                  ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01)))))
(assert (or
  (not (<= 10 ($SortWrappers.$SnapToInt ($Snap.first $t@31@01))))
  (<= 10 ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)))))
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (< ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 0))
  (and
    (not (< ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 0))
    (=>
      (not (<= 10 ($SortWrappers.$SnapToInt ($Snap.first $t@31@01))))
      (and
        (not (<= 10 ($SortWrappers.$SnapToInt ($Snap.first $t@31@01))))
        (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
          ($SortWrappers.IntTo$Snap $t@94@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@88@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@96@01)
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap $t@98@01)
                    ($Snap.combine
                      ($SortWrappers.$RefTo$Snap $t@100@01)
                      ($Snap.combine
                        ($SortWrappers.IntTo$Snap $t@102@01)
                        $Snap.unit)))))))) ret@57@01))
        (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
          ($SortWrappers.IntTo$Snap $t@94@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@88@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@96@01)
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap $t@98@01)
                    ($Snap.combine
                      ($SortWrappers.$RefTo$Snap $t@100@01)
                      ($Snap.combine
                        ($SortWrappers.IntTo$Snap $t@102@01)
                        $Snap.unit)))))))) ret@57@01))))
    (or
      (not (<= 10 ($SortWrappers.$SnapToInt ($Snap.first $t@31@01))))
      (<= 10 ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)))))))
(assert (or
  (not (< ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 0))
  (< ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 0)))
(push) ; 12
(assert (not (or
  (< ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 0)
  (or
    (<= 10 ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)))
    (not
      (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
        ($SortWrappers.IntTo$Snap $t@94@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@88@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@96@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@98@01)
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap $t@100@01)
                    ($Snap.combine
                      ($SortWrappers.IntTo$Snap $t@102@01)
                      $Snap.unit)))))))) ret@57@01)))))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(assert (or
  (< ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 0)
  (or
    (<= 10 ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)))
    (not
      (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
        ($SortWrappers.IntTo$Snap $t@94@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@88@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@96@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@98@01)
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap $t@100@01)
                    ($Snap.combine
                      ($SortWrappers.IntTo$Snap $t@102@01)
                      $Snap.unit)))))))) ret@57@01))))))
; [eval] !m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)) || (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)) || 0 <= old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) && old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) < 10)
; [eval] !m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)
(push) ; 12
; [eval] read$()
(push) ; 13
(pop) ; 13
; Joined path conditions
(push) ; 13
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(push) ; 13
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(push) ; 13
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(pop) ; 12
; Joined path conditions
(set-option :timeout 0)
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
; [then-branch: 36 | !(m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(($t@94@01, (_, (_, ($t@88@01, ($t@96@01, ($t@98@01, ($t@100@01, ($t@102@01, _)))))))), ret@57@01))) | live]
; [else-branch: 36 | m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(($t@94@01, (_, (_, ($t@88@01, ($t@96@01, ($t@98@01, ($t@100@01, ($t@102@01, _)))))))), ret@57@01)) | live]
(push) ; 13
; [then-branch: 36 | !(m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(($t@94@01, (_, (_, ($t@88@01, ($t@96@01, ($t@98@01, ($t@100@01, ($t@102@01, _)))))))), ret@57@01)))]
(assert (not
  (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($SortWrappers.IntTo$Snap $t@94@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@88@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@96@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@98@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@100@01)
                ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01))))
(pop) ; 13
(push) ; 13
; [else-branch: 36 | m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(($t@94@01, (_, (_, ($t@88@01, ($t@96@01, ($t@98@01, ($t@100@01, ($t@102@01, _)))))))), ret@57@01))]
(assert (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($SortWrappers.IntTo$Snap $t@94@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap $t@88@01)
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@96@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@98@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@100@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01)))
; [eval] m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)
(push) ; 14
; [eval] read$()
(push) ; 15
(pop) ; 15
; Joined path conditions
(push) ; 15
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(push) ; 15
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(push) ; 15
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(pop) ; 14
; Joined path conditions
(set-option :timeout 0)
(push) ; 14
; [eval] m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(_1)
(push) ; 15
(pop) ; 15
; Joined path conditions
(assert (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($SortWrappers.IntTo$Snap $t@94@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap $t@88@01)
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@96@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@98@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@100@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01)))
(pop) ; 14
; Joined path conditions
(assert (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($SortWrappers.IntTo$Snap $t@94@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap $t@88@01)
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@96@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@98@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@100@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01)))
(push) ; 14
; [then-branch: 37 | m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(($t@94@01, (_, (_, ($t@88@01, ($t@96@01, ($t@98@01, ($t@100@01, ($t@102@01, _)))))))), ret@57@01)) | live]
; [else-branch: 37 | !(m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(($t@94@01, (_, (_, ($t@88@01, ($t@96@01, ($t@98@01, ($t@100@01, ($t@102@01, _)))))))), ret@57@01))) | live]
(push) ; 15
; [then-branch: 37 | m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(($t@94@01, (_, (_, ($t@88@01, ($t@96@01, ($t@98@01, ($t@100@01, ($t@102@01, _)))))))), ret@57@01))]
(assert (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($SortWrappers.IntTo$Snap $t@94@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap $t@88@01)
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@96@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@98@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@100@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01)))
(pop) ; 15
(push) ; 15
; [else-branch: 37 | !(m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(($t@94@01, (_, (_, ($t@88@01, ($t@96@01, ($t@98@01, ($t@100@01, ($t@102@01, _)))))))), ret@57@01)))]
(assert (not
  (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($SortWrappers.IntTo$Snap $t@94@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@88@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@96@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@98@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@100@01)
                ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01))))
; [eval] 0 <= old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) && old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) < 10
; [eval] 0 <= old[pre]((unfolding acc(u32(_1), write) in _1.val_int))
; [eval] old[pre]((unfolding acc(u32(_1), write) in _1.val_int))
; [eval] (unfolding acc(u32(_1), write) in _1.val_int)
(push) ; 16
; [eval] 0 <= self.val_int
(pop) ; 16
; Joined path conditions
(push) ; 16
; [then-branch: 38 | 0 <= First:($t@31@01) | live]
; [else-branch: 38 | !(0 <= First:($t@31@01)) | live]
(push) ; 17
; [then-branch: 38 | 0 <= First:($t@31@01)]
; [eval] old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) < 10
; [eval] old[pre]((unfolding acc(u32(_1), write) in _1.val_int))
; [eval] (unfolding acc(u32(_1), write) in _1.val_int)
(push) ; 18
; [eval] 0 <= self.val_int
(pop) ; 18
; Joined path conditions
(pop) ; 17
(push) ; 17
; [else-branch: 38 | !(0 <= First:($t@31@01))]
(assert (not (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)))))
(pop) ; 17
(pop) ; 16
; Joined path conditions
; Joined path conditions
(assert (or
  (not (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@31@01))))
  (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)))))
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(assert (=>
  (not
    (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($SortWrappers.IntTo$Snap $t@94@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@88@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@96@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@98@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@100@01)
                  ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01)))
  (and
    (not
      (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
        ($SortWrappers.IntTo$Snap $t@94@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@88@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@96@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@98@01)
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap $t@100@01)
                    ($Snap.combine
                      ($SortWrappers.IntTo$Snap $t@102@01)
                      $Snap.unit)))))))) ret@57@01)))
    (or
      (not (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@31@01))))
      (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)))))))
(assert (or
  (not
    (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($SortWrappers.IntTo$Snap $t@94@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@88@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@96@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@98@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@100@01)
                  ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01)))
  (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($SortWrappers.IntTo$Snap $t@94@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@88@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@96@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@98@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@100@01)
                ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01))))
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (=>
  (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($SortWrappers.IntTo$Snap $t@94@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@88@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@96@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@98@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@100@01)
                ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01))
  (and
    (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($SortWrappers.IntTo$Snap $t@94@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@88@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@96@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@98@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@100@01)
                  ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01))
    (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($SortWrappers.IntTo$Snap $t@94@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@88@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@96@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@98@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@100@01)
                  ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01))
    (=>
      (not
        (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
          ($SortWrappers.IntTo$Snap $t@94@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@88@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@96@01)
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap $t@98@01)
                    ($Snap.combine
                      ($SortWrappers.$RefTo$Snap $t@100@01)
                      ($Snap.combine
                        ($SortWrappers.IntTo$Snap $t@102@01)
                        $Snap.unit)))))))) ret@57@01)))
      (and
        (not
          (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
            ($SortWrappers.IntTo$Snap $t@94@01)
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@88@01)
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap $t@96@01)
                    ($Snap.combine
                      ($SortWrappers.$RefTo$Snap $t@98@01)
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap $t@100@01)
                        ($Snap.combine
                          ($SortWrappers.IntTo$Snap $t@102@01)
                          $Snap.unit)))))))) ret@57@01)))
        (or
          (not (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@31@01))))
          (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@31@01))))))
    (or
      (not
        (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
          ($SortWrappers.IntTo$Snap $t@94@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@88@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@96@01)
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap $t@98@01)
                    ($Snap.combine
                      ($SortWrappers.$RefTo$Snap $t@100@01)
                      ($Snap.combine
                        ($SortWrappers.IntTo$Snap $t@102@01)
                        $Snap.unit)))))))) ret@57@01)))
      (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
        ($SortWrappers.IntTo$Snap $t@94@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@88@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@96@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@98@01)
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap $t@100@01)
                    ($Snap.combine
                      ($SortWrappers.IntTo$Snap $t@102@01)
                      $Snap.unit)))))))) ret@57@01))))))
(push) ; 12
(assert (not (or
  (not
    (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($SortWrappers.IntTo$Snap $t@94@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@88@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@96@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@98@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@100@01)
                  ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01)))
  (or
    (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($SortWrappers.IntTo$Snap $t@94@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@88@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@96@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@98@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@100@01)
                  ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01))
    (and
      (< ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10)
      (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@31@01))))))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(assert (or
  (not
    (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($SortWrappers.IntTo$Snap $t@94@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@88@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@96@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@98@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@100@01)
                  ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01)))
  (or
    (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($SortWrappers.IntTo$Snap $t@94@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@88@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@96@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@98@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@100@01)
                  ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01))
    (and
      (< ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10)
      (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)))))))
; [eval] !(old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) == 10) || m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] !(old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) == 10)
; [eval] old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) == 10
; [eval] old[pre]((unfolding acc(u32(_1), write) in _1.val_int))
; [eval] (unfolding acc(u32(_1), write) in _1.val_int)
(push) ; 12
; [eval] 0 <= self.val_int
(pop) ; 12
; Joined path conditions
(push) ; 12
; [then-branch: 39 | First:($t@31@01) != 10 | live]
; [else-branch: 39 | First:($t@31@01) == 10 | live]
(push) ; 13
; [then-branch: 39 | First:($t@31@01) != 10]
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10)))
(pop) ; 13
(push) ; 13
; [else-branch: 39 | First:($t@31@01) == 10]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10))
; [eval] m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)
(push) ; 14
; [eval] read$()
(push) ; 15
(pop) ; 15
; Joined path conditions
(push) ; 15
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(push) ; 15
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(push) ; 15
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(pop) ; 14
; Joined path conditions
(set-option :timeout 0)
(push) ; 14
; [eval] m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(_1)
(push) ; 15
(pop) ; 15
; Joined path conditions
(push) ; 15
(assert (not (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($SortWrappers.IntTo$Snap $t@94@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap $t@88@01)
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@96@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@98@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@100@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(assert (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($SortWrappers.IntTo$Snap $t@94@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap $t@88@01)
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@96@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@98@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@100@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01)))
(assert (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($SortWrappers.IntTo$Snap $t@94@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap $t@88@01)
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@96@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@98@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@100@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01)))
(pop) ; 14
; Joined path conditions
(assert (and
  (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($SortWrappers.IntTo$Snap $t@94@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@88@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@96@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@98@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@100@01)
                ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01))
  (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($SortWrappers.IntTo$Snap $t@94@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@88@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@96@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@98@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@100@01)
                ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01))))
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (=>
  (= ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10)
  (and
    (= ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10)
    (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($SortWrappers.IntTo$Snap $t@94@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@88@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@96@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@98@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@100@01)
                  ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01))
    (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($SortWrappers.IntTo$Snap $t@94@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@88@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@96@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@98@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@100@01)
                  ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01)))))
(assert (or
  (= ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10)
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10))))
(push) ; 12
(assert (not (or
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10))
  (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($SortWrappers.IntTo$Snap $t@94@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@88@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@96@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@98@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@100@01)
                ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01)))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(assert (or
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10))
  (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($SortWrappers.IntTo$Snap $t@94@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@88@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@96@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@98@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@100@01)
                ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01))))
; [eval] !m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)) || (!m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)) || old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) == 10)
; [eval] !m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)
(push) ; 12
; [eval] read$()
(push) ; 13
(pop) ; 13
; Joined path conditions
(push) ; 13
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(push) ; 13
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(push) ; 13
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(pop) ; 12
; Joined path conditions
(set-option :timeout 0)
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
; [then-branch: 40 | !(m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(($t@94@01, (_, (_, ($t@88@01, ($t@96@01, ($t@98@01, ($t@100@01, ($t@102@01, _)))))))), ret@57@01))) | live]
; [else-branch: 40 | m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(($t@94@01, (_, (_, ($t@88@01, ($t@96@01, ($t@98@01, ($t@100@01, ($t@102@01, _)))))))), ret@57@01)) | live]
(push) ; 13
; [then-branch: 40 | !(m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(($t@94@01, (_, (_, ($t@88@01, ($t@96@01, ($t@98@01, ($t@100@01, ($t@102@01, _)))))))), ret@57@01)))]
(assert (not
  (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($SortWrappers.IntTo$Snap $t@94@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@88@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@96@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@98@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@100@01)
                ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01))))
(pop) ; 13
(push) ; 13
; [else-branch: 40 | m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(($t@94@01, (_, (_, ($t@88@01, ($t@96@01, ($t@98@01, ($t@100@01, ($t@102@01, _)))))))), ret@57@01))]
(assert (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($SortWrappers.IntTo$Snap $t@94@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap $t@88@01)
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@96@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@98@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@100@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01)))
; [eval] !m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0)
(push) ; 14
; [eval] read$()
(push) ; 15
(pop) ; 15
; Joined path conditions
(push) ; 15
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(push) ; 15
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(push) ; 15
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(pop) ; 14
; Joined path conditions
(set-option :timeout 0)
(push) ; 14
; [eval] m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(_1)
(push) ; 15
(pop) ; 15
; Joined path conditions
(assert (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($SortWrappers.IntTo$Snap $t@94@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap $t@88@01)
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@96@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@98@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@100@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01)))
(pop) ; 14
; Joined path conditions
(assert (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($SortWrappers.IntTo$Snap $t@94@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap $t@88@01)
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@96@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@98@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@100@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01)))
(push) ; 14
; [then-branch: 41 | !(m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(($t@94@01, (_, (_, ($t@88@01, ($t@96@01, ($t@98@01, ($t@100@01, ($t@102@01, _)))))))), ret@57@01))) | live]
; [else-branch: 41 | m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(($t@94@01, (_, (_, ($t@88@01, ($t@96@01, ($t@98@01, ($t@100@01, ($t@102@01, _)))))))), ret@57@01)) | live]
(push) ; 15
; [then-branch: 41 | !(m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(($t@94@01, (_, (_, ($t@88@01, ($t@96@01, ($t@98@01, ($t@100@01, ($t@102@01, _)))))))), ret@57@01)))]
(assert (not
  (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($SortWrappers.IntTo$Snap $t@94@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@88@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@96@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@98@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@100@01)
                ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01))))
(pop) ; 15
(push) ; 15
; [else-branch: 41 | m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(($t@94@01, (_, (_, ($t@88@01, ($t@96@01, ($t@98@01, ($t@100@01, ($t@102@01, _)))))))), ret@57@01))]
(assert (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($SortWrappers.IntTo$Snap $t@94@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap $t@88@01)
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@96@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@98@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@100@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01)))
; [eval] old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) == 10
; [eval] old[pre]((unfolding acc(u32(_1), write) in _1.val_int))
; [eval] (unfolding acc(u32(_1), write) in _1.val_int)
(push) ; 16
; [eval] 0 <= self.val_int
(pop) ; 16
; Joined path conditions
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(assert (or
  (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($SortWrappers.IntTo$Snap $t@94@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@88@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@96@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@98@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@100@01)
                ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01))
  (not
    (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($SortWrappers.IntTo$Snap $t@94@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@88@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@96@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@98@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@100@01)
                  ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01)))))
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (=>
  (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($SortWrappers.IntTo$Snap $t@94@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $t@88@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@96@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@98@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@100@01)
                ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01))
  (and
    (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($SortWrappers.IntTo$Snap $t@94@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@88@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@96@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@98@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@100@01)
                  ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01))
    (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($SortWrappers.IntTo$Snap $t@94@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@88@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@96@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@98@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@100@01)
                  ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01))
    (or
      (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
        ($SortWrappers.IntTo$Snap $t@94@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@88@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@96@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@98@01)
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap $t@100@01)
                    ($Snap.combine
                      ($SortWrappers.IntTo$Snap $t@102@01)
                      $Snap.unit)))))))) ret@57@01))
      (not
        (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
          ($SortWrappers.IntTo$Snap $t@94@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@88@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@96@01)
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap $t@98@01)
                    ($Snap.combine
                      ($SortWrappers.$RefTo$Snap $t@100@01)
                      ($Snap.combine
                        ($SortWrappers.IntTo$Snap $t@102@01)
                        $Snap.unit)))))))) ret@57@01)))))))
(push) ; 12
(assert (not (or
  (not
    (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($SortWrappers.IntTo$Snap $t@94@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@88@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@96@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@98@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@100@01)
                  ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01)))
  (or
    (not
      (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
        ($SortWrappers.IntTo$Snap $t@94@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@88@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@96@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@98@01)
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap $t@100@01)
                    ($Snap.combine
                      ($SortWrappers.IntTo$Snap $t@102@01)
                      $Snap.unit)))))))) ret@57@01)))
    (= ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10)))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(assert (or
  (not
    (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($SortWrappers.IntTo$Snap $t@94@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $t@88@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@96@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@98@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@100@01)
                  ($Snap.combine ($SortWrappers.IntTo$Snap $t@102@01) $Snap.unit)))))))) ret@57@01)))
  (or
    (not
      (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
        ($SortWrappers.IntTo$Snap $t@94@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $t@88@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap $t@96@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap $t@98@01)
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap $t@100@01)
                    ($Snap.combine
                      ($SortWrappers.IntTo$Snap $t@102@01)
                      $Snap.unit)))))))) ret@57@01)))
    (= ($SortWrappers.$SnapToInt ($Snap.first $t@31@01)) 10))))
; [exec]
; assert true
; [exec]
; exhale acc(m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_0), write)
; [exec]
; label end_of_method
(pop) ; 11
(pop) ; 10
; [eval] !!__t12
; [eval] !__t12
(push) ; 10
(set-option :timeout 10)
(assert (not (not val_bool@108@01)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 42 | val_bool@108@01 | dead]
; [else-branch: 42 | !(val_bool@108@01) | live]
(set-option :timeout 0)
(push) ; 10
; [else-branch: 42 | !(val_bool@108@01)]
(assert (not val_bool@108@01))
(pop) ; 10
(pop) ; 9
; [eval] !(__t5 && (__t5 && __t5))
; [eval] __t5 && (__t5 && __t5)
(push) ; 9
; [then-branch: 43 | True | live]
; [else-branch: 43 | False | live]
(push) ; 10
; [then-branch: 43 | True]
(push) ; 11
; [then-branch: 44 | True | live]
; [else-branch: 44 | False | live]
(push) ; 12
; [then-branch: 44 | True]
(pop) ; 12
(push) ; 12
; [else-branch: 44 | False]
(assert false)
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(pop) ; 10
(push) ; 10
; [else-branch: 43 | False]
(assert false)
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
; [then-branch: 45 | False | dead]
; [else-branch: 45 | True | live]
(push) ; 9
; [else-branch: 45 | True]
(pop) ; 9
(pop) ; 8
(pop) ; 7
; [eval] !(__t5 && __t5)
; [eval] __t5 && __t5
(push) ; 7
; [then-branch: 46 | True | live]
; [else-branch: 46 | False | live]
(push) ; 8
; [then-branch: 46 | True]
(pop) ; 8
(push) ; 8
; [else-branch: 46 | False]
(assert false)
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
; [then-branch: 47 | False | dead]
; [else-branch: 47 | True | live]
(push) ; 7
; [else-branch: 47 | True]
(pop) ; 7
(pop) ; 6
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 18 | val_bool@43@01]
(assert val_bool@43@01)
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- builtin$havoc_bool ----------
(declare-const ret@109@01 Bool)
(declare-const ret@110@01 Bool)
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
(declare-const ret@111@01 Int)
(declare-const ret@112@01 Int)
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
(declare-const ret@113@01 $Ref)
(declare-const ret@114@01 $Ref)
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
