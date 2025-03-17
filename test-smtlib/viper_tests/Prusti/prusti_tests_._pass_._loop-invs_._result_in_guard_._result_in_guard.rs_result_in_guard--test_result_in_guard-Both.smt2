(get-info :version)
; (:version "4.12.1")
; Started: 2023-10-31 14:04:27
; Silicon.version: 1.1-SNAPSHOT (46944a65@dspil_symbenchmarking)
; Input file: /home/pcorrect/repos/benchmarking_general/silicon_tests/prusti_tests_._pass_._loop-invs_._result_in_guard_._result_in_guard.rs_result_in_guard--test_result_in_guard-Both.vpr
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
(declare-sort Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ 0)
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
(declare-fun $SortWrappers.Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_To$Snap (Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_) $Snap)
(declare-fun $SortWrappers.$SnapToSnap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap) Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_)
(assert (forall ((x Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_)) (!
    (= x ($SortWrappers.$SnapToSnap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_($SortWrappers.Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_To$Snap x)))
    :pattern (($SortWrappers.Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_To$Snap x))
    :qid |$Snap.$SnapToSnap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_To$Snap($SortWrappers.$SnapToSnap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ x)))
    :pattern (($SortWrappers.$SnapToSnap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ x))
    :qid |$Snap.Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_To$SnapToSnap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_|
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
(declare-fun discriminant$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$<Int> (Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_) Int)
(declare-fun cons$0$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_<Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_> (Int) Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_)
(declare-fun Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$0$field$f$0__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$<Int> (Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_) Int)
(declare-fun cons$1$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$struct$m_UnexpectedValue$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_<Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_> (Snap$struct$m_UnexpectedValue) Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_)
(declare-fun Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$1$field$f$0__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$struct$m_UnexpectedValue<Snap$struct$m_UnexpectedValue> (Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_) Snap$struct$m_UnexpectedValue)
(declare-fun discriminant$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$<Int> (Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_) Int)
(declare-fun cons$0$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_<Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_> (Bool) Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)
(declare-fun Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$0$field$f$0__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$<Bool> (Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_) Bool)
(declare-fun cons$1$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$struct$m_UnexpectedValue$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_<Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_> (Snap$struct$m_UnexpectedValue) Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)
(declare-fun Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$1$field$f$0__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$struct$m_UnexpectedValue<Snap$struct$m_UnexpectedValue> (Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_) Snap$struct$m_UnexpectedValue)
(declare-fun cons$0$__$TY$__Snap$struct$m_UnexpectedValue$$int$$Snap$struct$m_UnexpectedValue<Snap$struct$m_UnexpectedValue> (Int) Snap$struct$m_UnexpectedValue)
(declare-fun Snap$struct$m_UnexpectedValue$0$field$f$0__$TY$__Snap$struct$m_UnexpectedValue$$int$<Int> (Snap$struct$m_UnexpectedValue) Int)
(declare-fun mirror_simple$m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$<Bool> (Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_) Bool)
(declare-fun mirror_simple$m_get_ok_u32__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$<Int> (Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_) Int)
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
(declare-fun snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap $Ref) Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_)
(declare-fun snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_%limited ($Snap $Ref) Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_)
(declare-fun snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_%stateless ($Ref) Bool)
(declare-fun snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_%precondition ($Snap $Ref) Bool)
(declare-fun builtin$unreach__$TY$__$int$$$int$ ($Snap) Int)
(declare-fun builtin$unreach__$TY$__$int$$$int$%limited ($Snap) Int)
(declare-const builtin$unreach__$TY$__$int$$$int$%stateless Bool)
(declare-fun builtin$unreach__$TY$__$int$$$int$%precondition ($Snap) Bool)
(declare-fun m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_) Bool)
(declare-fun m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited ($Snap Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_) Bool)
(declare-fun m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$%stateless (Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_) Bool)
(declare-fun m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_) Bool)
(declare-fun m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_) Bool)
(declare-fun m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited ($Snap Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_) Bool)
(declare-fun m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%stateless (Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_) Bool)
(declare-fun m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_) Bool)
(declare-fun snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ ($Snap $Ref) Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)
(declare-fun snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%limited ($Snap $Ref) Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)
(declare-fun snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%stateless ($Ref) Bool)
(declare-fun snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%precondition ($Snap $Ref) Bool)
(declare-fun m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_) Bool)
(declare-fun m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited ($Snap Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_) Bool)
(declare-fun m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$%stateless (Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_) Bool)
(declare-fun m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_) Bool)
(declare-fun m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_) Bool)
(declare-fun m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited ($Snap Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_) Bool)
(declare-fun m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%stateless (Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_) Bool)
(declare-fun m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_) Bool)
(declare-fun m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$ ($Snap $Ref) Int)
(declare-fun m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited ($Snap $Ref) Int)
(declare-fun m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%stateless ($Ref) Bool)
(declare-fun m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap $Ref) Bool)
(declare-fun m_get_ok_u32__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$ ($Snap Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_) Int)
(declare-fun m_get_ok_u32__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited ($Snap Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_) Int)
(declare-fun m_get_ok_u32__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%stateless (Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_) Bool)
(declare-fun m_get_ok_u32__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_) Bool)
(declare-fun m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$ ($Snap Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_) Int)
(declare-fun m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited ($Snap Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_) Int)
(declare-fun m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%stateless (Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_) Bool)
(declare-fun m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_) Bool)
(declare-fun m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$ ($Snap $Ref) Int)
(declare-fun m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited ($Snap $Ref) Int)
(declare-fun m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%stateless ($Ref) Bool)
(declare-fun m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap $Ref) Bool)
(declare-fun m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$ ($Snap Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_) Int)
(declare-fun m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited ($Snap Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_) Int)
(declare-fun m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%stateless (Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_) Bool)
(declare-fun m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun DeadBorrowToken$%trigger ($Snap Int) Bool)
(declare-fun bool%trigger ($Snap $Ref) Bool)
(declare-fun m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%trigger ($Snap $Ref) Bool)
(declare-fun m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_Err%trigger ($Snap $Ref) Bool)
(declare-fun m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_Ok%trigger ($Snap $Ref) Bool)
(declare-fun m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_%trigger ($Snap $Ref) Bool)
(declare-fun m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_Err%trigger ($Snap $Ref) Bool)
(declare-fun m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_Ok%trigger ($Snap $Ref) Bool)
(declare-fun struct$m_UnexpectedValue%trigger ($Snap $Ref) Bool)
(declare-fun u32%trigger ($Snap $Ref) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((self Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (and
    (<=
      0
      (discriminant$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$<Int> self))
    (<=
      (discriminant$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$<Int> self)
      1))
  :pattern ((discriminant$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$<Int> self))
  :qid |prog.Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$discriminant_range|)))
(assert (forall ((_l_0 Int) (_r_0 Int)) (!
  (=>
    (=
      (cons$0$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_<Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_> _l_0)
      (cons$0$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_<Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_> _r_0))
    (= _l_0 _r_0))
  :pattern ((cons$0$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_<Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_> _l_0) (cons$0$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_<Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_> _r_0))
  :qid |prog.Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$0$injectivity|)))
(assert (forall ((_0 Int)) (!
  (=
    (discriminant$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$<Int> (cons$0$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_<Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_> _0))
    0)
  :pattern ((cons$0$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_<Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_> _0))
  :qid |prog.Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$0$discriminant_axiom|)))
(assert (forall ((_0 Int)) (!
  (=
    (Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$0$field$f$0__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$<Int> (cons$0$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_<Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_> _0))
    _0)
  :pattern ((Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$0$field$f$0__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$<Int> (cons$0$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_<Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_> _0)))
  :qid |prog.Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$0$field$f$0$axiom|)))
(assert (forall ((self Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (and
    (<=
      0
      (Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$0$field$f$0__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$<Int> self))
    (<=
      (Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$0$field$f$0__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$<Int> self)
      4294967295))
  :pattern ((Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$0$field$f$0__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$<Int> self))
  :qid |prog.Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$0$field$f$0$valid|)))
(assert (forall ((_l_0 Snap$struct$m_UnexpectedValue) (_r_0 Snap$struct$m_UnexpectedValue)) (!
  (=>
    (=
      (cons$1$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$struct$m_UnexpectedValue$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_<Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_> _l_0)
      (cons$1$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$struct$m_UnexpectedValue$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_<Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_> _r_0))
    (= _l_0 _r_0))
  :pattern ((cons$1$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$struct$m_UnexpectedValue$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_<Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_> _l_0) (cons$1$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$struct$m_UnexpectedValue$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_<Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_> _r_0))
  :qid |prog.Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$1$injectivity|)))
(assert (forall ((_0 Snap$struct$m_UnexpectedValue)) (!
  (=
    (discriminant$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$<Int> (cons$1$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$struct$m_UnexpectedValue$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_<Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_> _0))
    1)
  :pattern ((cons$1$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$struct$m_UnexpectedValue$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_<Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_> _0))
  :qid |prog.Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$1$discriminant_axiom|)))
(assert (forall ((_0 Snap$struct$m_UnexpectedValue)) (!
  (=
    (Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$1$field$f$0__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$struct$m_UnexpectedValue<Snap$struct$m_UnexpectedValue> (cons$1$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$struct$m_UnexpectedValue$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_<Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_> _0))
    _0)
  :pattern ((Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$1$field$f$0__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$struct$m_UnexpectedValue<Snap$struct$m_UnexpectedValue> (cons$1$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$struct$m_UnexpectedValue$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_<Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_> _0)))
  :qid |prog.Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$1$field$f$0$axiom|)))
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
(declare-fun joined_unfolding@31@00 ($Snap $Ref) Int)
(declare-fun joined_unfolding@34@00 ($Snap $Ref) Int)
(declare-fun joined_unfolding@39@00 ($Snap $Ref) Int)
(declare-fun joined_unfolding@45@00 ($Snap $Ref) Int)
(declare-fun $unresolved@37@00 () $Snap)
(declare-fun $unresolved@41@00 () $Snap)
(declare-fun $unresolved@43@00 () $Snap)
(declare-fun $unresolved@47@00 () $Snap)
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
  :qid |quant-u-32|)))
(assert (forall ((s@$ $Snap)) (!
  (let ((result@0@00 (read$%limited s@$))) true)
  :pattern ((read$%limited s@$))
  :qid |quant-u-33|)))
(assert (forall ((s@$ $Snap)) (!
  (let ((result@0@00 (read$%limited s@$))) true)
  :pattern ((read$%limited s@$))
  :qid |quant-u-34|)))
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
  :qid |quant-u-35|)))
(assert (forall ((s@$ $Snap) (self@1@00 $Ref)) (!
  true
  :pattern ((snap$__$TY$__Snap$struct$m_UnexpectedValue$struct$m_UnexpectedValue$Snap$struct$m_UnexpectedValue s@$ self@1@00))
  :qid |quant-u-36|)))
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
  :qid |quant-u-37|)))
(assert (forall ((s@$ $Snap) (_1@4@00 Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (let ((result@5@00 (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited s@$ _1@4@00))) true)
  :pattern ((m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited s@$ _1@4@00))
  :qid |quant-u-38|)))
(assert (forall ((s@$ $Snap) (_1@4@00 Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (=>
    (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition s@$ _1@4@00)
    (=
      (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ s@$ _1@4@00)
      (=
        (discriminant$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$<Int> _1@4@00)
        0)))
  :pattern ((m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ s@$ _1@4@00))
  :qid |quant-u-39|)))
(assert (forall ((s@$ $Snap) (_1@4@00 Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)) (!
  true
  :pattern ((m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ s@$ _1@4@00))
  :qid |quant-u-40|)))
(assert (forall ((s@$ $Snap) (self@6@00 $Ref)) (!
  (=
    (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_%limited s@$ self@6@00)
    (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ s@$ self@6@00))
  :pattern ((snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ s@$ self@6@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (self@6@00 $Ref)) (!
  (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_%stateless self@6@00)
  :pattern ((snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_%limited s@$ self@6@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (self@6@00 $Ref)) (!
  (=>
    (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_%precondition s@$ self@6@00)
    (=
      (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ s@$ self@6@00)
      (ite
        (= ($SortWrappers.$SnapToInt ($Snap.first s@$)) 1)
        (cons$1$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$struct$m_UnexpectedValue$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_<Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_> (snap$__$TY$__Snap$struct$m_UnexpectedValue$struct$m_UnexpectedValue$Snap$struct$m_UnexpectedValue ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
        (cons$0$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_<Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_> ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))))
  :pattern ((snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ s@$ self@6@00))
  :pattern ((snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_%stateless self@6@00) (m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_%trigger s@$ self@6@00))
  :qid |quant-u-41|)))
(assert (forall ((s@$ $Snap) (self@6@00 $Ref)) (!
  (=>
    (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_%precondition s@$ self@6@00)
    (ite
      (= ($SortWrappers.$SnapToInt ($Snap.first s@$)) 1)
      (snap$__$TY$__Snap$struct$m_UnexpectedValue$struct$m_UnexpectedValue$Snap$struct$m_UnexpectedValue%precondition ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
      true))
  :pattern ((snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ s@$ self@6@00))
  :qid |quant-u-42|)))
(assert (forall ((s@$ $Snap)) (!
  (=
    (builtin$unreach__$TY$__$int$$$int$%limited s@$)
    (builtin$unreach__$TY$__$int$$$int$ s@$))
  :pattern ((builtin$unreach__$TY$__$int$$$int$ s@$))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap)) (!
  (as builtin$unreach__$TY$__$int$$$int$%stateless  Bool)
  :pattern ((builtin$unreach__$TY$__$int$$$int$%limited s@$))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap) (_1@9@00 Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (=
    (m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited s@$ _1@9@00)
    (m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ s@$ _1@9@00))
  :pattern ((m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ s@$ _1@9@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (_1@9@00 Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$%stateless _1@9@00)
  :pattern ((m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited s@$ _1@9@00))
  :qid |quant-u-13|)))
(assert (forall ((s@$ $Snap) (_1@9@00 Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (let ((result@10@00 (m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited s@$ _1@9@00))) true)
  :pattern ((m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited s@$ _1@9@00))
  :qid |quant-u-43|)))
(assert (forall ((s@$ $Snap) (_1@9@00 Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (let ((result@10@00 (m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited s@$ _1@9@00))) true)
  :pattern ((m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited s@$ _1@9@00))
  :qid |quant-u-44|)))
(assert (forall ((s@$ $Snap) (_1@9@00 Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (=>
    (m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition s@$ _1@9@00)
    (=
      (m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ s@$ _1@9@00)
      (=
        (discriminant$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$<Int> _1@9@00)
        0)))
  :pattern ((m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ s@$ _1@9@00))
  :qid |quant-u-45|)))
(assert (forall ((s@$ $Snap) (_1@9@00 Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_)) (!
  true
  :pattern ((m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ s@$ _1@9@00))
  :qid |quant-u-46|)))
(assert (forall ((s@$ $Snap) (_1@11@00 Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (=
    (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited s@$ _1@11@00)
    (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ s@$ _1@11@00))
  :pattern ((m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ s@$ _1@11@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (_1@11@00 Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%stateless _1@11@00)
  :pattern ((m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited s@$ _1@11@00))
  :qid |quant-u-15|)))
(assert (forall ((s@$ $Snap) (_1@11@00 Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (let ((result@12@00 (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited s@$ _1@11@00))) true)
  :pattern ((m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited s@$ _1@11@00))
  :qid |quant-u-47|)))
(assert (forall ((s@$ $Snap) (_1@11@00 Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (let ((result@12@00 (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited s@$ _1@11@00))) true)
  :pattern ((m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited s@$ _1@11@00))
  :qid |quant-u-48|)))
(assert (forall ((s@$ $Snap) (_1@11@00 Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (=>
    (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition s@$ _1@11@00)
    (=
      (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ s@$ _1@11@00)
      (=
        (discriminant$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$<Int> _1@11@00)
        1)))
  :pattern ((m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ s@$ _1@11@00))
  :qid |quant-u-49|)))
(assert (forall ((s@$ $Snap) (_1@11@00 Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)) (!
  true
  :pattern ((m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ s@$ _1@11@00))
  :qid |quant-u-50|)))
(assert (forall ((s@$ $Snap) (self@13@00 $Ref)) (!
  (=
    (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%limited s@$ self@13@00)
    (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ s@$ self@13@00))
  :pattern ((snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ s@$ self@13@00))
  :qid |quant-u-16|)))
(assert (forall ((s@$ $Snap) (self@13@00 $Ref)) (!
  (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%stateless self@13@00)
  :pattern ((snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%limited s@$ self@13@00))
  :qid |quant-u-17|)))
(assert (forall ((s@$ $Snap) (self@13@00 $Ref)) (!
  (=>
    (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%precondition s@$ self@13@00)
    (=
      (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ s@$ self@13@00)
      (ite
        (= ($SortWrappers.$SnapToInt ($Snap.first s@$)) 1)
        (cons$1$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$struct$m_UnexpectedValue$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_<Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_> (snap$__$TY$__Snap$struct$m_UnexpectedValue$struct$m_UnexpectedValue$Snap$struct$m_UnexpectedValue ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
        (cons$0$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_<Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_> ($SortWrappers.$SnapToBool ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))))
  :pattern ((snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ s@$ self@13@00))
  :pattern ((snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%stateless self@13@00) (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%trigger s@$ self@13@00))
  :qid |quant-u-51|)))
(assert (forall ((s@$ $Snap) (self@13@00 $Ref)) (!
  (=>
    (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%precondition s@$ self@13@00)
    (ite
      (= ($SortWrappers.$SnapToInt ($Snap.first s@$)) 1)
      (snap$__$TY$__Snap$struct$m_UnexpectedValue$struct$m_UnexpectedValue$Snap$struct$m_UnexpectedValue%precondition ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
      true))
  :pattern ((snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ s@$ self@13@00))
  :qid |quant-u-52|)))
(assert (forall ((s@$ $Snap) (_1@15@00 Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (=
    (m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited s@$ _1@15@00)
    (m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ s@$ _1@15@00))
  :pattern ((m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ s@$ _1@15@00))
  :qid |quant-u-18|)))
(assert (forall ((s@$ $Snap) (_1@15@00 Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$%stateless _1@15@00)
  :pattern ((m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited s@$ _1@15@00))
  :qid |quant-u-19|)))
(assert (forall ((s@$ $Snap) (_1@15@00 Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (let ((result@16@00 (m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited s@$ _1@15@00))) true)
  :pattern ((m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited s@$ _1@15@00))
  :qid |quant-u-53|)))
(assert (forall ((s@$ $Snap) (_1@15@00 Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (let ((result@16@00 (m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited s@$ _1@15@00))) true)
  :pattern ((m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited s@$ _1@15@00))
  :qid |quant-u-54|)))
(assert (forall ((s@$ $Snap) (_1@15@00 Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (=>
    (m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition s@$ _1@15@00)
    (=
      (m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ s@$ _1@15@00)
      (=
        (discriminant$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$<Int> _1@15@00)
        1)))
  :pattern ((m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ s@$ _1@15@00))
  :qid |quant-u-55|)))
(assert (forall ((s@$ $Snap) (_1@15@00 Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_)) (!
  true
  :pattern ((m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ s@$ _1@15@00))
  :qid |quant-u-56|)))
(assert (forall ((s@$ $Snap) (_1@17@00 Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (=
    (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited s@$ _1@17@00)
    (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ s@$ _1@17@00))
  :pattern ((m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ s@$ _1@17@00))
  :qid |quant-u-20|)))
(assert (forall ((s@$ $Snap) (_1@17@00 Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%stateless _1@17@00)
  :pattern ((m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited s@$ _1@17@00))
  :qid |quant-u-21|)))
(assert (forall ((s@$ $Snap) (_1@17@00 Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (let ((result@18@00 (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited s@$ _1@17@00))) (=>
    (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition s@$ _1@17@00)
    (=
      result@18@00
      (mirror_simple$m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$<Bool> _1@17@00))))
  :pattern ((m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited s@$ _1@17@00))
  :qid |quant-u-57|)))
(assert (forall ((s@$ $Snap) (_1@17@00 Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (let ((result@18@00 (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited s@$ _1@17@00))) true)
  :pattern ((m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited s@$ _1@17@00))
  :qid |quant-u-58|)))
(assert (forall ((s@$ $Snap) (_1@17@00 Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (let ((result@18@00 (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited s@$ _1@17@00))) true)
  :pattern ((m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%limited s@$ _1@17@00))
  :qid |quant-u-59|)))
(assert (forall ((s@$ $Snap) (_1@17@00 Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (=>
    (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition s@$ _1@17@00)
    (=
      (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ s@$ _1@17@00)
      (and
        (=>
          (=
            (discriminant$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$<Int> _1@17@00)
            0)
          (Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$0$field$f$0__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$<Bool> _1@17@00))
        (=>
          (not
            (=
              (discriminant$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$<Int> _1@17@00)
              0))
          (builtin$unreach__$TY$__$bool$$$bool$ $unresolved@37@00)))))
  :pattern ((m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ s@$ _1@17@00))
  :qid |quant-u-60|)))
(assert (forall ((s@$ $Snap) (_1@17@00 Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (=>
    (and
      (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition s@$ _1@17@00)
      (and
        (=>
          (=
            (discriminant$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$<Int> _1@17@00)
            0)
          (Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$0$field$f$0__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$<Bool> _1@17@00))
        (not
          (=
            (discriminant$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$<Int> _1@17@00)
            0))))
    (builtin$unreach__$TY$__$bool$$$bool$%precondition $unresolved@37@00))
  :pattern ((m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ s@$ _1@17@00))
  :qid |quant-u-61|)))
(assert (forall ((s@$ $Snap) (self@19@00 $Ref)) (!
  (=
    (m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ self@19@00)
    (m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$ s@$ self@19@00))
  :pattern ((m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$ s@$ self@19@00))
  :qid |quant-u-22|)))
(assert (forall ((s@$ $Snap) (self@19@00 $Ref)) (!
  (m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%stateless self@19@00)
  :pattern ((m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ self@19@00))
  :qid |quant-u-23|)))
(assert (forall ((s@$ $Snap) (self@19@00 $Ref)) (!
  (let ((result@20@00 (m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ self@19@00))) (=>
    (m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition s@$ self@19@00)
    (and
      (and (<= 0 result@20@00) (<= result@20@00 1))
      (=
        (discriminant$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$<Int> (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ s@$ self@19@00))
        result@20@00))))
  :pattern ((m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ self@19@00))
  :qid |quant-u-62|)))
(assert (forall ((s@$ $Snap) (self@19@00 $Ref)) (!
  (let ((result@20@00 (m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ self@19@00))) true)
  :pattern ((m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ self@19@00))
  :qid |quant-u-63|)))
(assert (forall ((s@$ $Snap) (self@19@00 $Ref)) (!
  (let ((result@20@00 (m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ self@19@00))) (=>
    (m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition s@$ self@19@00)
    (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_%precondition s@$ self@19@00)))
  :pattern ((m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ self@19@00))
  :qid |quant-u-64|)))
(assert (forall ((s@$ $Snap) (self@19@00 $Ref)) (!
  (=>
    (m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition s@$ self@19@00)
    (=
      (m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$ s@$ self@19@00)
      ($SortWrappers.$SnapToInt ($Snap.first s@$))))
  :pattern ((m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$ s@$ self@19@00))
  :qid |quant-u-65|)))
(assert (forall ((s@$ $Snap) (self@19@00 $Ref)) (!
  true
  :pattern ((m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$ s@$ self@19@00))
  :qid |quant-u-66|)))
(assert (forall ((s@$ $Snap) (_1@21@00 Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (=
    (m_get_ok_u32__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ _1@21@00)
    (m_get_ok_u32__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$ s@$ _1@21@00))
  :pattern ((m_get_ok_u32__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$ s@$ _1@21@00))
  :qid |quant-u-24|)))
(assert (forall ((s@$ $Snap) (_1@21@00 Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (m_get_ok_u32__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%stateless _1@21@00)
  :pattern ((m_get_ok_u32__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ _1@21@00))
  :qid |quant-u-25|)))
(assert (forall ((s@$ $Snap) (_1@21@00 Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (let ((result@22@00 (m_get_ok_u32__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ _1@21@00))) (=>
    (m_get_ok_u32__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition s@$ _1@21@00)
    (and
      (<= 0 result@22@00)
      (=
        result@22@00
        (mirror_simple$m_get_ok_u32__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$<Int> _1@21@00)))))
  :pattern ((m_get_ok_u32__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ _1@21@00))
  :qid |quant-u-67|)))
(assert (forall ((s@$ $Snap) (_1@21@00 Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (let ((result@22@00 (m_get_ok_u32__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ _1@21@00))) true)
  :pattern ((m_get_ok_u32__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ _1@21@00))
  :qid |quant-u-68|)))
(assert (forall ((s@$ $Snap) (_1@21@00 Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (let ((result@22@00 (m_get_ok_u32__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ _1@21@00))) true)
  :pattern ((m_get_ok_u32__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ _1@21@00))
  :qid |quant-u-69|)))
(assert (forall ((s@$ $Snap) (_1@21@00 Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (let ((result@22@00 (m_get_ok_u32__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ _1@21@00))) true)
  :pattern ((m_get_ok_u32__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ _1@21@00))
  :qid |quant-u-70|)))
(assert (forall ((s@$ $Snap) (_1@21@00 Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (=>
    (m_get_ok_u32__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition s@$ _1@21@00)
    (=
      (m_get_ok_u32__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$ s@$ _1@21@00)
      (ite
        (=
          (discriminant$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$<Int> _1@21@00)
          0)
        (Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$0$field$f$0__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$<Int> _1@21@00)
        (builtin$unreach__$TY$__$int$$$int$ $unresolved@41@00))))
  :pattern ((m_get_ok_u32__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$ s@$ _1@21@00))
  :qid |quant-u-71|)))
(assert (forall ((s@$ $Snap) (_1@21@00 Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (=>
    (m_get_ok_u32__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition s@$ _1@21@00)
    (ite
      (=
        (discriminant$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$<Int> _1@21@00)
        0)
      true
      (builtin$unreach__$TY$__$int$$$int$%precondition $unresolved@41@00)))
  :pattern ((m_get_ok_u32__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$ s@$ _1@21@00))
  :qid |quant-u-72|)))
(assert (forall ((s@$ $Snap) (_1@23@00 Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (=
    (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ _1@23@00)
    (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$ s@$ _1@23@00))
  :pattern ((m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$ s@$ _1@23@00))
  :qid |quant-u-26|)))
(assert (forall ((s@$ $Snap) (_1@23@00 Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%stateless _1@23@00)
  :pattern ((m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ _1@23@00))
  :qid |quant-u-27|)))
(assert (forall ((s@$ $Snap) (_1@23@00 Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (let ((result@24@00 (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ _1@23@00))) (=>
    (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition s@$ _1@23@00)
    (<= 0 result@24@00)))
  :pattern ((m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ _1@23@00))
  :qid |quant-u-73|)))
(assert (forall ((s@$ $Snap) (_1@23@00 Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (let ((result@24@00 (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ _1@23@00))) true)
  :pattern ((m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ _1@23@00))
  :qid |quant-u-74|)))
(assert (forall ((s@$ $Snap) (_1@23@00 Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (let ((result@24@00 (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ _1@23@00))) true)
  :pattern ((m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ _1@23@00))
  :qid |quant-u-75|)))
(assert (forall ((s@$ $Snap) (_1@23@00 Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (=>
    (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition s@$ _1@23@00)
    (=
      (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$ s@$ _1@23@00)
      (ite
        (=
          (discriminant$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$<Int> _1@23@00)
          1)
        (Snap$struct$m_UnexpectedValue$0$field$f$0__$TY$__Snap$struct$m_UnexpectedValue$$int$<Int> (Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$1$field$f$0__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$struct$m_UnexpectedValue<Snap$struct$m_UnexpectedValue> _1@23@00))
        (builtin$unreach__$TY$__$int$$$int$ $unresolved@43@00))))
  :pattern ((m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$ s@$ _1@23@00))
  :qid |quant-u-76|)))
(assert (forall ((s@$ $Snap) (_1@23@00 Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (=>
    (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition s@$ _1@23@00)
    (ite
      (=
        (discriminant$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$<Int> _1@23@00)
        1)
      true
      (builtin$unreach__$TY$__$int$$$int$%precondition $unresolved@43@00)))
  :pattern ((m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$ s@$ _1@23@00))
  :qid |quant-u-77|)))
(assert (forall ((s@$ $Snap) (self@25@00 $Ref)) (!
  (=
    (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ self@25@00)
    (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$ s@$ self@25@00))
  :pattern ((m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$ s@$ self@25@00))
  :qid |quant-u-28|)))
(assert (forall ((s@$ $Snap) (self@25@00 $Ref)) (!
  (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%stateless self@25@00)
  :pattern ((m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ self@25@00))
  :qid |quant-u-29|)))
(assert (forall ((s@$ $Snap) (self@25@00 $Ref)) (!
  (let ((result@26@00 (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ self@25@00))) (=>
    (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition s@$ self@25@00)
    (and
      (and (<= 0 result@26@00) (<= result@26@00 1))
      (=
        (discriminant$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$<Int> (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ s@$ self@25@00))
        result@26@00))))
  :pattern ((m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ self@25@00))
  :qid |quant-u-78|)))
(assert (forall ((s@$ $Snap) (self@25@00 $Ref)) (!
  (let ((result@26@00 (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ self@25@00))) true)
  :pattern ((m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ self@25@00))
  :qid |quant-u-79|)))
(assert (forall ((s@$ $Snap) (self@25@00 $Ref)) (!
  (let ((result@26@00 (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ self@25@00))) (=>
    (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition s@$ self@25@00)
    (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%precondition s@$ self@25@00)))
  :pattern ((m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ self@25@00))
  :qid |quant-u-80|)))
(assert (forall ((s@$ $Snap) (self@25@00 $Ref)) (!
  (=>
    (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition s@$ self@25@00)
    (=
      (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$ s@$ self@25@00)
      ($SortWrappers.$SnapToInt ($Snap.first s@$))))
  :pattern ((m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$ s@$ self@25@00))
  :qid |quant-u-81|)))
(assert (forall ((s@$ $Snap) (self@25@00 $Ref)) (!
  true
  :pattern ((m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$ s@$ self@25@00))
  :qid |quant-u-82|)))
(assert (forall ((s@$ $Snap) (_1@27@00 Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (=
    (m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ _1@27@00)
    (m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$ s@$ _1@27@00))
  :pattern ((m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$ s@$ _1@27@00))
  :qid |quant-u-30|)))
(assert (forall ((s@$ $Snap) (_1@27@00 Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%stateless _1@27@00)
  :pattern ((m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ _1@27@00))
  :qid |quant-u-31|)))
(assert (forall ((s@$ $Snap) (_1@27@00 Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (let ((result@28@00 (m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ _1@27@00))) (=>
    (m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition s@$ _1@27@00)
    (<= 0 result@28@00)))
  :pattern ((m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ _1@27@00))
  :qid |quant-u-83|)))
(assert (forall ((s@$ $Snap) (_1@27@00 Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (let ((result@28@00 (m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ _1@27@00))) true)
  :pattern ((m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ _1@27@00))
  :qid |quant-u-84|)))
(assert (forall ((s@$ $Snap) (_1@27@00 Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (let ((result@28@00 (m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ _1@27@00))) true)
  :pattern ((m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%limited s@$ _1@27@00))
  :qid |quant-u-85|)))
(assert (forall ((s@$ $Snap) (_1@27@00 Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (=>
    (m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition s@$ _1@27@00)
    (=
      (m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$ s@$ _1@27@00)
      (ite
        (=
          (discriminant$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$<Int> _1@27@00)
          1)
        (Snap$struct$m_UnexpectedValue$0$field$f$0__$TY$__Snap$struct$m_UnexpectedValue$$int$<Int> (Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$1$field$f$0__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$struct$m_UnexpectedValue<Snap$struct$m_UnexpectedValue> _1@27@00))
        (builtin$unreach__$TY$__$int$$$int$ $unresolved@47@00))))
  :pattern ((m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$ s@$ _1@27@00))
  :qid |quant-u-86|)))
(assert (forall ((s@$ $Snap) (_1@27@00 Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_)) (!
  (=>
    (m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition s@$ _1@27@00)
    (ite
      (=
        (discriminant$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$<Int> _1@27@00)
        1)
      true
      (builtin$unreach__$TY$__$int$$$int$%precondition $unresolved@47@00)))
  :pattern ((m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$ s@$ _1@27@00))
  :qid |quant-u-87|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- m_test_result_in_guard ----------
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
; var __t16: Int
(declare-const __t16@18@01 Int)
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
; var __t20: Int
(declare-const __t20@22@01 Int)
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
; var _1: Ref
(declare-const _1@26@01 $Ref)
; [exec]
; var _2: Ref
(declare-const _2@27@01 $Ref)
; [exec]
; var _5: Ref
(declare-const _5@28@01 $Ref)
; [exec]
; var _6: Ref
(declare-const _6@29@01 $Ref)
; [exec]
; var _7: Ref
(declare-const _7@30@01 $Ref)
; [exec]
; var _8: Ref
(declare-const _8@31@01 $Ref)
; [exec]
; var _9: Int
(declare-const _9@32@01 Int)
; [exec]
; var _10: Ref
(declare-const _10@33@01 $Ref)
; [exec]
; var _12: Ref
(declare-const _12@34@01 $Ref)
; [exec]
; var _13: Ref
(declare-const _13@35@01 $Ref)
; [exec]
; var _15: Ref
(declare-const _15@36@01 $Ref)
; [exec]
; var _18: Ref
(declare-const _18@37@01 $Ref)
; [exec]
; var _23: Ref
(declare-const _23@38@01 $Ref)
; [exec]
; var _24: Ref
(declare-const _24@39@01 $Ref)
; [exec]
; var _25: Int
(declare-const _25@40@01 Int)
; [exec]
; var _27: Ref
(declare-const _27@41@01 $Ref)
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
; inhale acc(u32(_1), write)
(declare-const $t@42@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale true
(declare-const $t@43@01 $Snap)
(assert (= $t@43@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (unfolding acc(u32(_1), write) in 0 <= _1.val_int)
(declare-const $t@44@01 $Snap)
(assert (= $t@44@01 $Snap.unit))
; [eval] (unfolding acc(u32(_1), write) in 0 <= _1.val_int)
(set-option :timeout 0)
(push) ; 3
(assert (u32%trigger $t@42@01 _1@26@01))
(assert (= $t@42@01 ($Snap.combine ($Snap.first $t@42@01) ($Snap.second $t@42@01))))
(assert (not (= _1@26@01 $Ref.null)))
(assert (= ($Snap.second $t@42@01) $Snap.unit))
; [eval] 0 <= self.val_int
(assert (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@42@01))))
; [eval] 0 <= _1.val_int
(pop) ; 3
; Joined path conditions
(assert (and
  (u32%trigger $t@42@01 _1@26@01)
  (= $t@42@01 ($Snap.combine ($Snap.first $t@42@01) ($Snap.second $t@42@01)))
  (not (= _1@26@01 $Ref.null))
  (= ($Snap.second $t@42@01) $Snap.unit)
  (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@42@01)))))
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
(declare-const ret@45@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_2.val_int, write)
(declare-const $t@46@01 Int)
(assert (not (= ret@45@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; unfold acc(u32(_1), write)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@45@01 _1@26@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [eval] 0 <= self.val_int
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; _2.val_int := _1.val_int
(declare-const val_int@47@01 Int)
(assert (= val_int@47@01 ($SortWrappers.$SnapToInt ($Snap.first $t@42@01))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= _1@26@01 ret@45@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l0
; [exec]
; __t1 := true
; [exec]
; __t2 := true
; [exec]
; _8 := builtin$havoc_ref()
(declare-const ret@48@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_8.val_int, write)
(declare-const $t@49@01 Int)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= _1@26@01 ret@48@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@45@01 ret@48@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@48@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _8.val_int := _2.val_int
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@45@01 ret@48@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= _1@26@01 ret@48@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l1
; [exec]
; label l2
; [exec]
; assert 0 <= _8.val_int
; [eval] 0 <= _8.val_int
(set-option :timeout 0)
(push) ; 3
(assert (not (<= 0 val_int@47@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 val_int@47@01))
; [exec]
; assert true
; [exec]
; fold acc(u32(_8), write)
; [eval] 0 <= self.val_int
(assert (u32%trigger ($Snap.combine ($SortWrappers.IntTo$Snap val_int@47@01) $Snap.unit) ret@48@01))
; [exec]
; exhale acc(u32(_8), write)
; [exec]
; _7 := builtin$havoc_ref()
(declare-const ret@50@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7), write)
(declare-const $t@51@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale true
(declare-const $t@52@01 $Snap)
(assert (= $t@52@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (!(old[l2](_8.val_int) > 10) ||
;   m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)) &&
;   m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)) ==
;   old[l2](_8.val_int)) &&
;   ((!m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)) ||
;   m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)) >
;   10) &&
;   ((!(old[l2](_8.val_int) <= 10) ||
;   m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7))) &&
;   ((!m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)) ||
;   old[l2](_8.val_int) <= 10) &&
;   ((old[l2](_8.val_int) < 0 ||
;   (10 <= old[l2](_8.val_int) ||
;   !m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)))) &&
;   ((!m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)) ||
;   (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)) ||
;   0 <= old[l2](_8.val_int) && old[l2](_8.val_int) < 10)) &&
;   ((!(old[l2](_8.val_int) == 10) ||
;   m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7))) &&
;   (!m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)) ||
;   (!m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)) ||
;   old[l2](_8.val_int) == 10))))))))
(declare-const $t@53@01 $Snap)
(assert (= $t@53@01 ($Snap.combine ($Snap.first $t@53@01) ($Snap.second $t@53@01))))
(assert (= ($Snap.first $t@53@01) $Snap.unit))
; [eval] !(old[l2](_8.val_int) > 10) || m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)) && m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)) == old[l2](_8.val_int)
; [eval] !(old[l2](_8.val_int) > 10)
; [eval] old[l2](_8.val_int) > 10
; [eval] old[l2](_8.val_int)
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | !(val_int@47@01 > 10) | live]
; [else-branch: 0 | val_int@47@01 > 10 | live]
(push) ; 4
; [then-branch: 0 | !(val_int@47@01 > 10)]
(assert (not (> val_int@47@01 10)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | val_int@47@01 > 10]
(assert (> val_int@47@01 10))
; [eval] m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)) && m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)) == old[l2](_8.val_int)
; [eval] m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)
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
(assert (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%precondition $t@51@01 ret@50@01))
(pop) ; 5
; Joined path conditions
(assert (and
  (read$%precondition $Snap.unit)
  (<= $Perm.No (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))))
  (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%precondition $t@51@01 ret@50@01)))
(set-option :timeout 0)
(push) ; 5
(assert (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01)))
(pop) ; 5
; Joined path conditions
(assert (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01)))
(push) ; 5
; [then-branch: 1 | m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@51@01, ret@50@01)) | live]
; [else-branch: 1 | !(m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@51@01, ret@50@01))) | live]
(push) ; 6
; [then-branch: 1 | m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@51@01, ret@50@01))]
(assert (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01)))
; [eval] m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)) == old[l2](_8.val_int)
; [eval] m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)
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
; [eval] m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(_1)
(push) ; 8
(pop) ; 8
; Joined path conditions
(assert (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01)))
(pop) ; 7
; Joined path conditions
(assert (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01)))
; [eval] old[l2](_8.val_int)
(pop) ; 6
(push) ; 6
; [else-branch: 1 | !(m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@51@01, ret@50@01)))]
(assert (not
  (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01))
  (and
    (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01))
    (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01)))))
; Joined path conditions
(assert (or
  (not
    (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01)))
  (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (> val_int@47@01 10)
  (and
    (> val_int@47@01 10)
    (read$%precondition $Snap.unit)
    (<= $Perm.No (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))))
    (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%precondition $t@51@01 ret@50@01)
    (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01))
    (=>
      (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01))
      (and
        (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01))
        (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01))))
    (or
      (not
        (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01)))
      (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01))))))
(assert (or (> val_int@47@01 10) (not (> val_int@47@01 10))))
(assert (or
  (not (> val_int@47@01 10))
  (and
    (=
      (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01))
      val_int@47@01)
    (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01)))))
(assert (=
  ($Snap.second $t@53@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@53@01))
    ($Snap.second ($Snap.second $t@53@01)))))
(assert (= ($Snap.first ($Snap.second $t@53@01)) $Snap.unit))
; [eval] !m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)) || m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)) > 10
; [eval] !m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7))
; [eval] m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)
(push) ; 3
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
(assert (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%precondition $t@51@01 ret@50@01))
(pop) ; 3
; Joined path conditions
(assert (and
  (read$%precondition $Snap.unit)
  (<= $Perm.No (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))))
  (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%precondition $t@51@01 ret@50@01)))
(set-option :timeout 0)
(push) ; 3
(assert (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01)))
(pop) ; 3
; Joined path conditions
(assert (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01)))
(push) ; 3
; [then-branch: 2 | !(m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@51@01, ret@50@01))) | live]
; [else-branch: 2 | m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@51@01, ret@50@01)) | live]
(push) ; 4
; [then-branch: 2 | !(m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@51@01, ret@50@01)))]
(assert (not
  (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01))))
(pop) ; 4
(push) ; 4
; [else-branch: 2 | m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@51@01, ret@50@01))]
(assert (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01)))
; [eval] m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)) > 10
; [eval] m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)
(push) ; 5
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
(pop) ; 5
; Joined path conditions
(set-option :timeout 0)
(push) ; 5
; [eval] m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(_1)
(push) ; 6
(pop) ; 6
; Joined path conditions
(assert (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01)))
(pop) ; 5
; Joined path conditions
(assert (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01))
  (and
    (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01))
    (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01)))))
(assert (or
  (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01))
  (not
    (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01)))))
(assert (or
  (not
    (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01)))
  (>
    (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01))
    10)))
(assert (=
  ($Snap.second ($Snap.second $t@53@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@53@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@53@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@53@01))) $Snap.unit))
; [eval] !(old[l2](_8.val_int) <= 10) || m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7))
; [eval] !(old[l2](_8.val_int) <= 10)
; [eval] old[l2](_8.val_int) <= 10
; [eval] old[l2](_8.val_int)
(push) ; 3
; [then-branch: 3 | !(val_int@47@01 <= 10) | live]
; [else-branch: 3 | val_int@47@01 <= 10 | live]
(push) ; 4
; [then-branch: 3 | !(val_int@47@01 <= 10)]
(assert (not (<= val_int@47@01 10)))
(pop) ; 4
(push) ; 4
; [else-branch: 3 | val_int@47@01 <= 10]
(assert (<= val_int@47@01 10))
; [eval] m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)
(push) ; 5
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
(pop) ; 5
; Joined path conditions
(set-option :timeout 0)
(push) ; 5
(assert (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01)))
(pop) ; 5
; Joined path conditions
(assert (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= val_int@47@01 10)
  (and
    (<= val_int@47@01 10)
    (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01)))))
(assert (or (<= val_int@47@01 10) (not (<= val_int@47@01 10))))
(assert (or
  (not (<= val_int@47@01 10))
  (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@53@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@53@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@53@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@53@01))))
  $Snap.unit))
; [eval] !m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)) || old[l2](_8.val_int) <= 10
; [eval] !m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7))
; [eval] m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)
(push) ; 3
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
(pop) ; 3
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01)))
(pop) ; 3
; Joined path conditions
(assert (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01)))
(push) ; 3
; [then-branch: 4 | !(m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@51@01, ret@50@01))) | live]
; [else-branch: 4 | m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@51@01, ret@50@01)) | live]
(push) ; 4
; [then-branch: 4 | !(m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@51@01, ret@50@01)))]
(assert (not
  (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01))))
(pop) ; 4
(push) ; 4
; [else-branch: 4 | m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@51@01, ret@50@01))]
(assert (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01)))
; [eval] old[l2](_8.val_int) <= 10
; [eval] old[l2](_8.val_int)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or
  (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01))
  (not
    (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01)))))
(assert (or
  (not
    (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01)))
  (<= val_int@47@01 10)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@53@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@53@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@53@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@53@01)))))
  $Snap.unit))
; [eval] old[l2](_8.val_int) < 0 || (10 <= old[l2](_8.val_int) || !m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)))
; [eval] old[l2](_8.val_int) < 0
; [eval] old[l2](_8.val_int)
(push) ; 3
; [then-branch: 5 | val_int@47@01 < 0 | live]
; [else-branch: 5 | !(val_int@47@01 < 0) | live]
(push) ; 4
; [then-branch: 5 | val_int@47@01 < 0]
(assert (< val_int@47@01 0))
(pop) ; 4
(push) ; 4
; [else-branch: 5 | !(val_int@47@01 < 0)]
(assert (not (< val_int@47@01 0)))
; [eval] 10 <= old[l2](_8.val_int)
; [eval] old[l2](_8.val_int)
(push) ; 5
; [then-branch: 6 | 10 <= val_int@47@01 | live]
; [else-branch: 6 | !(10 <= val_int@47@01) | live]
(push) ; 6
; [then-branch: 6 | 10 <= val_int@47@01]
(assert (<= 10 val_int@47@01))
(pop) ; 6
(push) ; 6
; [else-branch: 6 | !(10 <= val_int@47@01)]
(assert (not (<= 10 val_int@47@01)))
; [eval] !m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7))
; [eval] m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)
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
; [eval] m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(_1)
(push) ; 8
(pop) ; 8
; Joined path conditions
(push) ; 8
(assert (not (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01)))
(assert (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01)))
(pop) ; 7
; Joined path conditions
(assert (and
  (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01))
  (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (<= 10 val_int@47@01))
  (and
    (not (<= 10 val_int@47@01))
    (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01))
    (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01)))))
(assert (or (not (<= 10 val_int@47@01)) (<= 10 val_int@47@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (< val_int@47@01 0))
  (and
    (not (< val_int@47@01 0))
    (=>
      (not (<= 10 val_int@47@01))
      (and
        (not (<= 10 val_int@47@01))
        (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01))
        (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01))))
    (or (not (<= 10 val_int@47@01)) (<= 10 val_int@47@01)))))
(assert (or (not (< val_int@47@01 0)) (< val_int@47@01 0)))
(assert (or
  (< val_int@47@01 0)
  (or
    (<= 10 val_int@47@01)
    (not
      (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@53@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@53@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@53@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@53@01))))))
  $Snap.unit))
; [eval] !m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)) || (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)) || 0 <= old[l2](_8.val_int) && old[l2](_8.val_int) < 10)
; [eval] !m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7))
; [eval] m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)
(push) ; 3
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
(pop) ; 3
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
; [then-branch: 7 | !(m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@51@01, ret@50@01))) | live]
; [else-branch: 7 | m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@51@01, ret@50@01)) | live]
(push) ; 4
; [then-branch: 7 | !(m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@51@01, ret@50@01)))]
(assert (not
  (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01))))
(pop) ; 4
(push) ; 4
; [else-branch: 7 | m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@51@01, ret@50@01))]
(assert (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01)))
; [eval] m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)
(push) ; 5
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
(pop) ; 5
; Joined path conditions
(set-option :timeout 0)
(push) ; 5
; [eval] m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(_1)
(push) ; 6
(pop) ; 6
; Joined path conditions
(assert (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01)))
(pop) ; 5
; Joined path conditions
(assert (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01)))
(push) ; 5
; [then-branch: 8 | m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@51@01, ret@50@01)) | live]
; [else-branch: 8 | !(m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@51@01, ret@50@01))) | live]
(push) ; 6
; [then-branch: 8 | m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@51@01, ret@50@01))]
(assert (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 8 | !(m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@51@01, ret@50@01)))]
(assert (not
  (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01))))
; [eval] 0 <= old[l2](_8.val_int) && old[l2](_8.val_int) < 10
; [eval] 0 <= old[l2](_8.val_int)
; [eval] old[l2](_8.val_int)
(push) ; 7
; [then-branch: 9 | 0 <= val_int@47@01 | live]
; [else-branch: 9 | !(0 <= val_int@47@01) | live]
(push) ; 8
; [then-branch: 9 | 0 <= val_int@47@01]
; [eval] old[l2](_8.val_int) < 10
; [eval] old[l2](_8.val_int)
(pop) ; 8
(push) ; 8
; [else-branch: 9 | !(0 <= val_int@47@01)]
(assert (not (<= 0 val_int@47@01)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 val_int@47@01)) (<= 0 val_int@47@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (not
    (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01)))
  (and
    (not
      (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01)))
    (or (not (<= 0 val_int@47@01)) (<= 0 val_int@47@01)))))
(assert (or
  (not
    (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01)))
  (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01))
  (and
    (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01))
    (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01))
    (=>
      (not
        (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01)))
      (and
        (not
          (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01)))
        (or (not (<= 0 val_int@47@01)) (<= 0 val_int@47@01))))
    (or
      (not
        (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01)))
      (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01))))))
(assert (or
  (not
    (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01)))
  (or
    (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01))
    (and (< val_int@47@01 10) (<= 0 val_int@47@01)))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@53@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@53@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@53@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@53@01)))))))
  $Snap.unit))
; [eval] !(old[l2](_8.val_int) == 10) || m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7))
; [eval] !(old[l2](_8.val_int) == 10)
; [eval] old[l2](_8.val_int) == 10
; [eval] old[l2](_8.val_int)
(push) ; 3
; [then-branch: 10 | val_int@47@01 != 10 | live]
; [else-branch: 10 | val_int@47@01 == 10 | live]
(push) ; 4
; [then-branch: 10 | val_int@47@01 != 10]
(assert (not (= val_int@47@01 10)))
(pop) ; 4
(push) ; 4
; [else-branch: 10 | val_int@47@01 == 10]
(assert (= val_int@47@01 10))
; [eval] m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)
(push) ; 5
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
(pop) ; 5
; Joined path conditions
(set-option :timeout 0)
(push) ; 5
; [eval] m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(_1)
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(assert (not (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01)))
(assert (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01)))
(pop) ; 5
; Joined path conditions
(assert (and
  (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01))
  (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (= val_int@47@01 10)
  (and
    (= val_int@47@01 10)
    (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01))
    (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01)))))
(assert (or (= val_int@47@01 10) (not (= val_int@47@01 10))))
(assert (or
  (not (= val_int@47@01 10))
  (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@53@01)))))))
  $Snap.unit))
; [eval] !m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)) || (!m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)) || old[l2](_8.val_int) == 10)
; [eval] !m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7))
; [eval] m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)
(push) ; 3
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
(pop) ; 3
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
; [then-branch: 11 | !(m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@51@01, ret@50@01))) | live]
; [else-branch: 11 | m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@51@01, ret@50@01)) | live]
(push) ; 4
; [then-branch: 11 | !(m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@51@01, ret@50@01)))]
(assert (not
  (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01))))
(pop) ; 4
(push) ; 4
; [else-branch: 11 | m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@51@01, ret@50@01))]
(assert (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01)))
; [eval] !m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7))
; [eval] m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)
(push) ; 5
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
(pop) ; 5
; Joined path conditions
(set-option :timeout 0)
(push) ; 5
; [eval] m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(_1)
(push) ; 6
(pop) ; 6
; Joined path conditions
(assert (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01)))
(pop) ; 5
; Joined path conditions
(assert (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01)))
(push) ; 5
; [then-branch: 12 | !(m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@51@01, ret@50@01))) | live]
; [else-branch: 12 | m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@51@01, ret@50@01)) | live]
(push) ; 6
; [then-branch: 12 | !(m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@51@01, ret@50@01)))]
(assert (not
  (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 12 | m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@51@01, ret@50@01))]
(assert (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01)))
; [eval] old[l2](_8.val_int) == 10
; [eval] old[l2](_8.val_int)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01))
  (not
    (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01))
  (and
    (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01))
    (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01))
    (or
      (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01))
      (not
        (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01)))))))
(assert (or
  (not
    (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01)))
  (or
    (not
      (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@51@01 ret@50@01)))
    (= val_int@47@01 10))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label l3
; [exec]
; __t3 := true
; [exec]
; _9 := builtin$havoc_int()
(declare-const ret@54@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _9 := m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$(_7)
; [eval] m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$(_7)
(set-option :timeout 0)
(push) ; 3
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
(assert (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition $t@51@01 ret@50@01))
(pop) ; 3
; Joined path conditions
(assert (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition $t@51@01 ret@50@01))
(declare-const _9@55@01 Int)
(assert (=
  _9@55@01
  (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$ $t@51@01 ret@50@01)))
; [exec]
; __t16 := _9
; [eval] __t16 == 0
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= _9@55@01 0))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= _9@55@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [then-branch: 13 | _9@55@01 == 0 | live]
; [else-branch: 13 | _9@55@01 != 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 13 | _9@55@01 == 0]
(assert (= _9@55@01 0))
; [exec]
; label loop1_start
; [exec]
; __t4 := true
; [exec]
; _13 := builtin$havoc_ref()
(declare-const ret@56@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_13.val_bool, write)
(declare-const $t@57@01 Bool)
(assert (not (= ret@56@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; unfold acc(m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7), write)
(assert (= $t@51@01 ($Snap.combine ($Snap.first $t@51@01) ($Snap.second $t@51@01))))
(assert (not (= ret@50@01 $Ref.null)))
(assert (=
  ($Snap.second $t@51@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@51@01))
    ($Snap.second ($Snap.second $t@51@01)))))
(assert (= ($Snap.first ($Snap.second $t@51@01)) $Snap.unit))
; [eval] 0 <= self.discriminant
(assert (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@51@01))))
(assert (=
  ($Snap.second ($Snap.second $t@51@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@51@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@51@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@51@01))) $Snap.unit))
; [eval] self.discriminant <= 1
(assert (<= ($SortWrappers.$SnapToInt ($Snap.first $t@51@01)) 1))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@51@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@51@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01))))))))
; [eval] self.discriminant == 1
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@51@01)) 1))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 14 | First:($t@51@01) == 1 | dead]
; [else-branch: 14 | First:($t@51@01) != 1 | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 14 | First:($t@51@01) != 1]
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@51@01)) 1)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%trigger $t@51@01 ret@50@01))
; [exec]
; unfold acc(m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_Ok(_7.enum_Ok), write)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))))
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))
    $Ref.null)))
; State saturation: after unfold
(check-sat)
; unknown
(assert (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_Ok%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))
; [exec]
; unfold acc(bool(_7.enum_Ok.f$0), write)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ret@56@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01))))))))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))
    $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (bool%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))))
; [exec]
; _13.val_bool := _7.enum_Ok.f$0.val_bool
(declare-const val_bool@58@01 Bool)
(assert (=
  val_bool@58@01
  ($SortWrappers.$SnapToBool ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))
  ret@56@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l6
; [exec]
; _6 := builtin$havoc_ref()
(declare-const ret@59@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_6.val_bool, write)
(declare-const $t@60@01 Bool)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))
  ret@59@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@59@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@59@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _6.val_bool := _13.val_bool
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@59@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))
  ret@59@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l7
; [exec]
; _5 := builtin$havoc_ref()
(declare-const ret@61@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_5.val_bool, write)
(declare-const $t@62@01 Bool)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))
  ret@61@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@59@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@61@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _5.val_bool := !_6.val_bool
; [eval] !_6.val_bool
(declare-const val_bool@63@01 Bool)
(assert (= val_bool@63@01 (not val_bool@58@01)))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@59@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))
  ret@61@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t17 := _5.val_bool
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not val_bool@63@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not val_bool@63@01))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 15 | val_bool@63@01 | live]
; [else-branch: 15 | !(val_bool@63@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 15 | val_bool@63@01]
(assert val_bool@63@01)
; [exec]
; label loop1_group1_bb2
; [exec]
; __t5 := true
; [exec]
; _15 := builtin$havoc_ref()
(declare-const ret@64@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_15.val_bool, write)
(declare-const $t@65@01 Bool)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))
  ret@64@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@64@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@59@01 ret@64@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@64@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@64@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _15.val_bool := false
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@64@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@59@01 ret@64@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@64@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))
  ret@64@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t18 := _15.val_bool
; [exec]
; fold acc(u32(_2), write)
; [eval] 0 <= self.val_int
(assert (u32%trigger ($Snap.combine ($SortWrappers.IntTo$Snap val_int@47@01) $Snap.unit) ret@45@01))
; [exec]
; assert (unfolding acc(u32(_2), write) in
;     0 <= _2.val_int && _2.val_int < 10)
; [eval] (unfolding acc(u32(_2), write) in 0 <= _2.val_int && _2.val_int < 10)
(set-option :timeout 0)
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (= _1@26@01 ret@45@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [eval] 0 <= self.val_int
; [eval] 0 <= _2.val_int && _2.val_int < 10
; [eval] 0 <= _2.val_int
(set-option :timeout 0)
(push) ; 7
; [then-branch: 16 | 0 <= val_int@47@01 | live]
; [else-branch: 16 | !(0 <= val_int@47@01) | live]
(push) ; 8
; [then-branch: 16 | 0 <= val_int@47@01]
; [eval] _2.val_int < 10
(pop) ; 8
(push) ; 8
; [else-branch: 16 | !(0 <= val_int@47@01)]
(assert (not (<= 0 val_int@47@01)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 val_int@47@01)) (<= 0 val_int@47@01)))
(pop) ; 6
; Joined path conditions
(assert (or (not (<= 0 val_int@47@01)) (<= 0 val_int@47@01)))
(push) ; 6
(assert (not (and (< val_int@47@01 10) (<= 0 val_int@47@01))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (and (< val_int@47@01 10) (<= 0 val_int@47@01)))
; [exec]
; assert true
; [exec]
; exhale acc(u32(_2), write)
; [exec]
; _13 := builtin$havoc_ref()
(declare-const ret@66@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _15 := builtin$havoc_ref()
(declare-const ret@67@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _18 := builtin$havoc_ref()
(declare-const ret@68@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _2 := builtin$havoc_ref()
(declare-const ret@69@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _5 := builtin$havoc_ref()
(declare-const ret@70@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _6 := builtin$havoc_ref()
(declare-const ret@71@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _7 := builtin$havoc_ref()
(declare-const ret@72@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _8 := builtin$havoc_ref()
(declare-const ret@73@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _9 := builtin$havoc_int()
(declare-const ret@74@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t1 := builtin$havoc_bool()
(declare-const ret@75@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t19 := builtin$havoc_bool()
(declare-const ret@76@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t2 := builtin$havoc_bool()
(declare-const ret@77@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t20 := builtin$havoc_int()
(declare-const ret@78@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t21 := builtin$havoc_bool()
(declare-const ret@79@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t22 := builtin$havoc_bool()
(declare-const ret@80@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t3 := builtin$havoc_bool()
(declare-const ret@81@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t4 := builtin$havoc_bool()
(declare-const ret@82@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t5 := builtin$havoc_bool()
(declare-const ret@83@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t6 := builtin$havoc_bool()
(declare-const ret@84@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t7 := builtin$havoc_bool()
(declare-const ret@85@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t8 := builtin$havoc_bool()
(declare-const ret@86@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(u32(_2), write)
(declare-const $t@87@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale true
(declare-const $t@88@01 $Snap)
(assert (= $t@88@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (unfolding acc(u32(_2), write) in
;     0 <= _2.val_int && _2.val_int < 10)
(declare-const $t@89@01 $Snap)
(assert (= $t@89@01 $Snap.unit))
; [eval] (unfolding acc(u32(_2), write) in 0 <= _2.val_int && _2.val_int < 10)
(set-option :timeout 0)
(push) ; 6
(assert (u32%trigger $t@87@01 ret@69@01))
(assert (= $t@87@01 ($Snap.combine ($Snap.first $t@87@01) ($Snap.second $t@87@01))))
(push) ; 7
(set-option :timeout 10)
(assert (not (= _1@26@01 ret@69@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@69@01 $Ref.null)))
(assert (= ($Snap.second $t@87@01) $Snap.unit))
; [eval] 0 <= self.val_int
(assert (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@87@01))))
; [eval] 0 <= _2.val_int && _2.val_int < 10
; [eval] 0 <= _2.val_int
(set-option :timeout 0)
(push) ; 7
; [then-branch: 17 | 0 <= First:($t@87@01) | live]
; [else-branch: 17 | !(0 <= First:($t@87@01)) | live]
(push) ; 8
; [then-branch: 17 | 0 <= First:($t@87@01)]
; [eval] _2.val_int < 10
(pop) ; 8
(push) ; 8
; [else-branch: 17 | !(0 <= First:($t@87@01))]
(assert (not (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@87@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (not (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@87@01))))
  (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@87@01)))))
(pop) ; 6
; Joined path conditions
(assert (and
  (u32%trigger $t@87@01 ret@69@01)
  (= $t@87@01 ($Snap.combine ($Snap.first $t@87@01) ($Snap.second $t@87@01)))
  (not (= ret@69@01 $Ref.null))
  (= ($Snap.second $t@87@01) $Snap.unit)
  (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@87@01)))
  (or
    (not (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@87@01))))
    (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@87@01))))))
(assert (and
  (< ($SortWrappers.$SnapToInt ($Snap.first $t@87@01)) 10)
  (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@87@01)))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; __t6 := true
; [exec]
; __t7 := true
; [exec]
; _18 := builtin$havoc_ref()
(declare-const ret@90@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_18.tuple_0, write)
(declare-const $t@91@01 $Ref)
(assert (not (= ret@90@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_18.tuple_0.val_int, write)
(declare-const $t@92@01 Int)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _1@26@01 $t@91@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@91@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_18.tuple_1, write)
(declare-const $t@93@01 $Ref)
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(_18.tuple_1.val_bool, write)
(declare-const $t@94@01 Bool)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@64@01 $t@93@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@61@01 $t@93@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@59@01 $t@93@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@56@01 $t@93@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))
  $t@93@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@93@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; unfold acc(u32(_2), write)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _1@26@01 ret@69@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= $t@91@01 ret@69@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [eval] 0 <= self.val_int
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; _18.tuple_0.val_int := _2.val_int + 1
; [eval] _2.val_int + 1
(declare-const val_int@95@01 Int)
(assert (= val_int@95@01 (+ ($SortWrappers.$SnapToInt ($Snap.first $t@87@01)) 1)))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _1@26@01 $t@91@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@69@01 $t@91@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
; [exec]
; _18.tuple_1.val_bool := false
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))
  $t@93@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@56@01 $t@93@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@59@01 $t@93@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@61@01 $t@93@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@64@01 $t@93@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t19 := _18.tuple_1.val_bool
; [exec]
; assert !__t19
; [eval] !__t19
; [exec]
; __t8 := true
; [exec]
; _2 := _18.tuple_0
; [exec]
; label l10
; [exec]
; __t1 := true
; [exec]
; __t2 := true
; [exec]
; _8 := builtin$havoc_ref()
(declare-const ret@96@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_8.val_int, write)
(declare-const $t@97@01 Int)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= $t@91@01 ret@96@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _1@26@01 ret@96@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@69@01 ret@96@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@96@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _8.val_int := _2.val_int
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@69@01 ret@96@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _1@26@01 ret@96@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= $t@91@01 ret@96@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l11
; [exec]
; label l12
; [exec]
; assert 0 <= _8.val_int
; [eval] 0 <= _8.val_int
(set-option :timeout 0)
(push) ; 6
(assert (not (<= 0 val_int@95@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 val_int@95@01))
; [exec]
; assert true
; [exec]
; fold acc(u32(_8), write)
; [eval] 0 <= self.val_int
(assert (u32%trigger ($Snap.combine ($SortWrappers.IntTo$Snap val_int@95@01) $Snap.unit) ret@96@01))
; [exec]
; exhale acc(u32(_8), write)
; [exec]
; _7 := builtin$havoc_ref()
(declare-const ret@98@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7), write)
(declare-const $t@99@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale true
(declare-const $t@100@01 $Snap)
(assert (= $t@100@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (!(old[l12](_8.val_int) > 10) ||
;   m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)) &&
;   m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)) ==
;   old[l12](_8.val_int)) &&
;   ((!m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)) ||
;   m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)) >
;   10) &&
;   ((!(old[l12](_8.val_int) <= 10) ||
;   m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7))) &&
;   ((!m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)) ||
;   old[l12](_8.val_int) <= 10) &&
;   ((old[l12](_8.val_int) < 0 ||
;   (10 <= old[l12](_8.val_int) ||
;   !m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)))) &&
;   ((!m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)) ||
;   (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)) ||
;   0 <= old[l12](_8.val_int) && old[l12](_8.val_int) < 10)) &&
;   ((!(old[l12](_8.val_int) == 10) ||
;   m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7))) &&
;   (!m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)) ||
;   (!m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)) ||
;   old[l12](_8.val_int) == 10))))))))
(declare-const $t@101@01 $Snap)
(assert (= $t@101@01 ($Snap.combine ($Snap.first $t@101@01) ($Snap.second $t@101@01))))
(assert (= ($Snap.first $t@101@01) $Snap.unit))
; [eval] !(old[l12](_8.val_int) > 10) || m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)) && m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)) == old[l12](_8.val_int)
; [eval] !(old[l12](_8.val_int) > 10)
; [eval] old[l12](_8.val_int) > 10
; [eval] old[l12](_8.val_int)
(set-option :timeout 0)
(push) ; 6
; [then-branch: 18 | !(val_int@95@01 > 10) | live]
; [else-branch: 18 | val_int@95@01 > 10 | live]
(push) ; 7
; [then-branch: 18 | !(val_int@95@01 > 10)]
(assert (not (> val_int@95@01 10)))
(pop) ; 7
(push) ; 7
; [else-branch: 18 | val_int@95@01 > 10]
(assert (> val_int@95@01 10))
; [eval] m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)) && m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)) == old[l12](_8.val_int)
; [eval] m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)
(push) ; 8
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
; unsat
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
(assert (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%precondition $t@99@01 ret@98@01))
(pop) ; 8
; Joined path conditions
(assert (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%precondition $t@99@01 ret@98@01))
(set-option :timeout 0)
(push) ; 8
(assert (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01)))
(pop) ; 8
; Joined path conditions
(assert (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01)))
(push) ; 8
; [then-branch: 19 | m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@99@01, ret@98@01)) | live]
; [else-branch: 19 | !(m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@99@01, ret@98@01))) | live]
(push) ; 9
; [then-branch: 19 | m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@99@01, ret@98@01))]
(assert (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01)))
; [eval] m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)) == old[l12](_8.val_int)
; [eval] m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)
(push) ; 10
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
; unsat
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
(pop) ; 10
; Joined path conditions
(set-option :timeout 0)
(push) ; 10
; [eval] m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(_1)
(push) ; 11
(pop) ; 11
; Joined path conditions
(assert (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01)))
(pop) ; 10
; Joined path conditions
(assert (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01)))
; [eval] old[l12](_8.val_int)
(pop) ; 9
(push) ; 9
; [else-branch: 19 | !(m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@99@01, ret@98@01)))]
(assert (not
  (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01))
  (and
    (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01))
    (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01)))))
; Joined path conditions
(assert (or
  (not
    (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01)))
  (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (> val_int@95@01 10)
  (and
    (> val_int@95@01 10)
    (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%precondition $t@99@01 ret@98@01)
    (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01))
    (=>
      (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01))
      (and
        (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01))
        (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01))))
    (or
      (not
        (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01)))
      (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01))))))
(assert (or (> val_int@95@01 10) (not (> val_int@95@01 10))))
(assert (or
  (not (> val_int@95@01 10))
  (and
    (=
      (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01))
      val_int@95@01)
    (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01)))))
(assert (=
  ($Snap.second $t@101@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@101@01))
    ($Snap.second ($Snap.second $t@101@01)))))
(assert (= ($Snap.first ($Snap.second $t@101@01)) $Snap.unit))
; [eval] !m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)) || m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)) > 10
; [eval] !m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7))
; [eval] m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)
(push) ; 6
; [eval] read$()
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(assert (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%precondition $t@99@01 ret@98@01))
(pop) ; 6
; Joined path conditions
(assert (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%precondition $t@99@01 ret@98@01))
(set-option :timeout 0)
(push) ; 6
(assert (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01)))
(pop) ; 6
; Joined path conditions
(assert (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01)))
(push) ; 6
; [then-branch: 20 | !(m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@99@01, ret@98@01))) | live]
; [else-branch: 20 | m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@99@01, ret@98@01)) | live]
(push) ; 7
; [then-branch: 20 | !(m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@99@01, ret@98@01)))]
(assert (not
  (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 20 | m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@99@01, ret@98@01))]
(assert (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01)))
; [eval] m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)) > 10
; [eval] m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)
(push) ; 8
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
(pop) ; 8
; Joined path conditions
(set-option :timeout 0)
(push) ; 8
; [eval] m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(_1)
(push) ; 9
(pop) ; 9
; Joined path conditions
(assert (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01)))
(pop) ; 8
; Joined path conditions
(assert (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01))
  (and
    (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01))
    (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01)))))
(assert (or
  (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01))
  (not
    (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01)))))
(assert (or
  (not
    (m_is_err__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01)))
  (>
    (m_get_err_value__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01))
    10)))
(assert (=
  ($Snap.second ($Snap.second $t@101@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@101@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@101@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@101@01))) $Snap.unit))
; [eval] !(old[l12](_8.val_int) <= 10) || m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7))
; [eval] !(old[l12](_8.val_int) <= 10)
; [eval] old[l12](_8.val_int) <= 10
; [eval] old[l12](_8.val_int)
(push) ; 6
; [then-branch: 21 | !(val_int@95@01 <= 10) | live]
; [else-branch: 21 | val_int@95@01 <= 10 | live]
(push) ; 7
; [then-branch: 21 | !(val_int@95@01 <= 10)]
(assert (not (<= val_int@95@01 10)))
(pop) ; 7
(push) ; 7
; [else-branch: 21 | val_int@95@01 <= 10]
(assert (<= val_int@95@01 10))
; [eval] m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)
(push) ; 8
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
(pop) ; 8
; Joined path conditions
(set-option :timeout 0)
(push) ; 8
(assert (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01)))
(pop) ; 8
; Joined path conditions
(assert (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= val_int@95@01 10)
  (and
    (<= val_int@95@01 10)
    (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01)))))
(assert (or (<= val_int@95@01 10) (not (<= val_int@95@01 10))))
(assert (or
  (not (<= val_int@95@01 10))
  (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@101@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@101@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@101@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@101@01))))
  $Snap.unit))
; [eval] !m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)) || old[l12](_8.val_int) <= 10
; [eval] !m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7))
; [eval] m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)
(push) ; 6
; [eval] read$()
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(pop) ; 6
; Joined path conditions
(set-option :timeout 0)
(push) ; 6
(assert (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01)))
(pop) ; 6
; Joined path conditions
(assert (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01)))
(push) ; 6
; [then-branch: 22 | !(m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@99@01, ret@98@01))) | live]
; [else-branch: 22 | m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@99@01, ret@98@01)) | live]
(push) ; 7
; [then-branch: 22 | !(m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@99@01, ret@98@01)))]
(assert (not
  (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 22 | m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@99@01, ret@98@01))]
(assert (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01)))
; [eval] old[l12](_8.val_int) <= 10
; [eval] old[l12](_8.val_int)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01))
  (not
    (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01)))))
(assert (or
  (not
    (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01)))
  (<= val_int@95@01 10)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@101@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@101@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@101@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@101@01)))))
  $Snap.unit))
; [eval] old[l12](_8.val_int) < 0 || (10 <= old[l12](_8.val_int) || !m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)))
; [eval] old[l12](_8.val_int) < 0
; [eval] old[l12](_8.val_int)
(push) ; 6
; [then-branch: 23 | val_int@95@01 < 0 | live]
; [else-branch: 23 | !(val_int@95@01 < 0) | live]
(push) ; 7
; [then-branch: 23 | val_int@95@01 < 0]
(assert (< val_int@95@01 0))
(pop) ; 7
(push) ; 7
; [else-branch: 23 | !(val_int@95@01 < 0)]
(assert (not (< val_int@95@01 0)))
; [eval] 10 <= old[l12](_8.val_int)
; [eval] old[l12](_8.val_int)
(push) ; 8
; [then-branch: 24 | 10 <= val_int@95@01 | live]
; [else-branch: 24 | !(10 <= val_int@95@01) | live]
(push) ; 9
; [then-branch: 24 | 10 <= val_int@95@01]
(assert (<= 10 val_int@95@01))
(pop) ; 9
(push) ; 9
; [else-branch: 24 | !(10 <= val_int@95@01)]
(assert (not (<= 10 val_int@95@01)))
; [eval] !m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7))
; [eval] m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)
(push) ; 10
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
(pop) ; 10
; Joined path conditions
(set-option :timeout 0)
(push) ; 10
; [eval] m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(_1)
(push) ; 11
(pop) ; 11
; Joined path conditions
(push) ; 11
(assert (not (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01)))
(assert (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01)))
(pop) ; 10
; Joined path conditions
(assert (and
  (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01))
  (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (<= 10 val_int@95@01))
  (and
    (not (<= 10 val_int@95@01))
    (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01))
    (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01)))))
(assert (or (not (<= 10 val_int@95@01)) (<= 10 val_int@95@01)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (< val_int@95@01 0))
  (and
    (not (< val_int@95@01 0))
    (=>
      (not (<= 10 val_int@95@01))
      (and
        (not (<= 10 val_int@95@01))
        (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01))
        (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01))))
    (or (not (<= 10 val_int@95@01)) (<= 10 val_int@95@01)))))
(assert (or (not (< val_int@95@01 0)) (< val_int@95@01 0)))
(assert (or
  (< val_int@95@01 0)
  (or
    (<= 10 val_int@95@01)
    (not
      (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@101@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@101@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@101@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@101@01))))))
  $Snap.unit))
; [eval] !m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)) || (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)) || 0 <= old[l12](_8.val_int) && old[l12](_8.val_int) < 10)
; [eval] !m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7))
; [eval] m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)
(push) ; 6
; [eval] read$()
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(pop) ; 6
; Joined path conditions
(set-option :timeout 0)
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
; [then-branch: 25 | !(m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@99@01, ret@98@01))) | live]
; [else-branch: 25 | m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@99@01, ret@98@01)) | live]
(push) ; 7
; [then-branch: 25 | !(m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@99@01, ret@98@01)))]
(assert (not
  (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 25 | m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@99@01, ret@98@01))]
(assert (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01)))
; [eval] m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)
(push) ; 8
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
(pop) ; 8
; Joined path conditions
(set-option :timeout 0)
(push) ; 8
; [eval] m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(_1)
(push) ; 9
(pop) ; 9
; Joined path conditions
(assert (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01)))
(pop) ; 8
; Joined path conditions
(assert (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01)))
(push) ; 8
; [then-branch: 26 | m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@99@01, ret@98@01)) | live]
; [else-branch: 26 | !(m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@99@01, ret@98@01))) | live]
(push) ; 9
; [then-branch: 26 | m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@99@01, ret@98@01))]
(assert (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 26 | !(m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@99@01, ret@98@01)))]
(assert (not
  (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01))))
; [eval] 0 <= old[l12](_8.val_int) && old[l12](_8.val_int) < 10
; [eval] 0 <= old[l12](_8.val_int)
; [eval] old[l12](_8.val_int)
(push) ; 10
; [then-branch: 27 | 0 <= val_int@95@01 | live]
; [else-branch: 27 | !(0 <= val_int@95@01) | live]
(push) ; 11
; [then-branch: 27 | 0 <= val_int@95@01]
; [eval] old[l12](_8.val_int) < 10
; [eval] old[l12](_8.val_int)
(pop) ; 11
(push) ; 11
; [else-branch: 27 | !(0 <= val_int@95@01)]
(assert (not (<= 0 val_int@95@01)))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 val_int@95@01)) (<= 0 val_int@95@01)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (not
    (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01)))
  (and
    (not
      (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01)))
    (or (not (<= 0 val_int@95@01)) (<= 0 val_int@95@01)))))
(assert (or
  (not
    (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01)))
  (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01))
  (and
    (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01))
    (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01))
    (=>
      (not
        (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01)))
      (and
        (not
          (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01)))
        (or (not (<= 0 val_int@95@01)) (<= 0 val_int@95@01))))
    (or
      (not
        (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01)))
      (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01))))))
(assert (or
  (not
    (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01)))
  (or
    (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01))
    (and (< val_int@95@01 10) (<= 0 val_int@95@01)))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@101@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@101@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@101@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@101@01)))))))
  $Snap.unit))
; [eval] !(old[l12](_8.val_int) == 10) || m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7))
; [eval] !(old[l12](_8.val_int) == 10)
; [eval] old[l12](_8.val_int) == 10
; [eval] old[l12](_8.val_int)
(push) ; 6
; [then-branch: 28 | val_int@95@01 != 10 | live]
; [else-branch: 28 | val_int@95@01 == 10 | live]
(push) ; 7
; [then-branch: 28 | val_int@95@01 != 10]
(assert (not (= val_int@95@01 10)))
(pop) ; 7
(push) ; 7
; [else-branch: 28 | val_int@95@01 == 10]
(assert (= val_int@95@01 10))
; [eval] m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)
(push) ; 8
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
(pop) ; 8
; Joined path conditions
(set-option :timeout 0)
(push) ; 8
; [eval] m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(_1)
(push) ; 9
(pop) ; 9
; Joined path conditions
(push) ; 9
(assert (not (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01)))
(assert (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01)))
(pop) ; 8
; Joined path conditions
(assert (and
  (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01))
  (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (= val_int@95@01 10)
  (and
    (= val_int@95@01 10)
    (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01))
    (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01)))))
(assert (or (= val_int@95@01 10) (not (= val_int@95@01 10))))
(assert (or
  (not (= val_int@95@01 10))
  (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@101@01)))))))
  $Snap.unit))
; [eval] !m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)) || (!m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)) || old[l12](_8.val_int) == 10)
; [eval] !m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7))
; [eval] m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)
(push) ; 6
; [eval] read$()
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(pop) ; 6
; Joined path conditions
(set-option :timeout 0)
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
; [then-branch: 29 | !(m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@99@01, ret@98@01))) | live]
; [else-branch: 29 | m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@99@01, ret@98@01)) | live]
(push) ; 7
; [then-branch: 29 | !(m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@99@01, ret@98@01)))]
(assert (not
  (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 29 | m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@99@01, ret@98@01))]
(assert (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01)))
; [eval] !m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7))
; [eval] m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7)
(push) ; 8
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
(pop) ; 8
; Joined path conditions
(set-option :timeout 0)
(push) ; 8
; [eval] m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$(_1)
(push) ; 9
(pop) ; 9
; Joined path conditions
(assert (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01)))
(pop) ; 8
; Joined path conditions
(assert (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01)))
(push) ; 8
; [then-branch: 30 | !(m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@99@01, ret@98@01))) | live]
; [else-branch: 30 | m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@99@01, ret@98@01)) | live]
(push) ; 9
; [then-branch: 30 | !(m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@99@01, ret@98@01)))]
(assert (not
  (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01))))
(pop) ; 9
(push) ; 9
; [else-branch: 30 | m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_($t@99@01, ret@98@01))]
(assert (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01)))
; [eval] old[l12](_8.val_int) == 10
; [eval] old[l12](_8.val_int)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or
  (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01))
  (not
    (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01)))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01))
  (and
    (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01))
    (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01))
    (or
      (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01))
      (not
        (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01)))))))
(assert (or
  (not
    (m_is_ok__$TY$__bool$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01)))
  (or
    (not
      (m_get_ok_bool__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_ $t@99@01 ret@98@01)))
    (= val_int@95@01 10))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label l13
; [exec]
; __t3 := true
; [exec]
; _9 := builtin$havoc_int()
(declare-const ret@102@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _9 := m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$(_7)
; [eval] m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$(_7)
(set-option :timeout 0)
(push) ; 6
; [eval] read$()
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 7
; 0.03s
; (get-info :all-statistics)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition $t@99@01 ret@98@01))
(pop) ; 6
; Joined path conditions
(assert (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition $t@99@01 ret@98@01))
(declare-const _9@103@01 Int)
(assert (=
  _9@103@01
  (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_$$int$ $t@99@01 ret@98@01)))
; [exec]
; __t20 := _9
; [eval] __t20 == 0
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= _9@103@01 0))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _9@103@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 31 | _9@103@01 == 0 | live]
; [else-branch: 31 | _9@103@01 != 0 | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 31 | _9@103@01 == 0]
(assert (= _9@103@01 0))
; [exec]
; label l5
; [exec]
; __t4 := true
; [exec]
; _13 := builtin$havoc_ref()
(declare-const ret@104@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_13.val_bool, write)
(declare-const $t@105@01 Bool)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@64@01 ret@104@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@104@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@59@01 ret@104@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@104@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))
  ret@104@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@93@01 ret@104@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@104@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; unfold acc(m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7), write)
(assert (= $t@99@01 ($Snap.combine ($Snap.first $t@99@01) ($Snap.second $t@99@01))))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@50@01 ret@98@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@98@01 $Ref.null)))
(assert (=
  ($Snap.second $t@99@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@99@01))
    ($Snap.second ($Snap.second $t@99@01)))))
(assert (= ($Snap.first ($Snap.second $t@99@01)) $Snap.unit))
; [eval] 0 <= self.discriminant
(assert (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@99@01))))
(assert (=
  ($Snap.second ($Snap.second $t@99@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@99@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@99@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@99@01))) $Snap.unit))
; [eval] self.discriminant <= 1
(assert (<= ($SortWrappers.$SnapToInt ($Snap.first $t@99@01)) 1))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@99@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@99@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@99@01)))))))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@50@01 ret@98@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@99@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@99@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@99@01))))))))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@50@01 ret@98@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [eval] self.discriminant == 1
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@99@01)) 1))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 32 | First:($t@99@01) == 1 | dead]
; [else-branch: 32 | First:($t@99@01) != 1 | live]
(set-option :timeout 0)
(push) ; 7
; [else-branch: 32 | First:($t@99@01) != 1]
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@99@01)) 1)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%trigger $t@99@01 ret@98@01))
; [exec]
; unfold acc(m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_Ok(_7.enum_Ok), write)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@99@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@99@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@99@01)))))))))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@99@01))))))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@99@01)))))
    $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_Ok%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@99@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@99@01)))))))
; [exec]
; unfold acc(bool(_7.enum_Ok.f$0), write)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  $t@93@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@99@01))))))))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@99@01))))))))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ret@56@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@99@01))))))))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ret@59@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@99@01))))))))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ret@61@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@99@01))))))))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ret@64@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@99@01))))))))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ret@104@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@99@01))))))))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@99@01)))))))
    $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (bool%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@99@01)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@99@01)))))))))
; [exec]
; _13.val_bool := _7.enum_Ok.f$0.val_bool
(declare-const val_bool@106@01 Bool)
(assert (=
  val_bool@106@01
  ($SortWrappers.$SnapToBool ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@99@01)))))))))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@64@01 ret@104@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@104@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@59@01 ret@104@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@104@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))
  ret@104@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@93@01 ret@104@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@99@01)))))))
  ret@104@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l16
; [exec]
; _6 := builtin$havoc_ref()
(declare-const ret@107@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_6.val_bool, write)
(declare-const $t@108@01 Bool)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@99@01)))))))
  ret@107@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@93@01 ret@107@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))
  ret@107@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@107@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@59@01 ret@107@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@107@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@64@01 ret@107@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@104@01 ret@107@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@107@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _6.val_bool := _13.val_bool
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@104@01 ret@107@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@64@01 ret@107@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@107@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@59@01 ret@107@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@107@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))
  ret@107@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@93@01 ret@107@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@99@01)))))))
  ret@107@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l17
; [exec]
; _5 := builtin$havoc_ref()
(declare-const ret@109@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_5.val_bool, write)
(declare-const $t@110@01 Bool)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@99@01)))))))
  ret@109@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@93@01 ret@109@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))
  ret@109@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@109@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@59@01 ret@109@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@109@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@64@01 ret@109@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@104@01 ret@109@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@107@01 ret@109@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@109@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _5.val_bool := !_6.val_bool
; [eval] !_6.val_bool
(declare-const val_bool@111@01 Bool)
(assert (= val_bool@111@01 (not val_bool@106@01)))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@107@01 ret@109@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@104@01 ret@109@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@64@01 ret@109@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@109@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@59@01 ret@109@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@109@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))
  ret@109@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@93@01 ret@109@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@99@01)))))))
  ret@109@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t21 := _5.val_bool
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not val_bool@111@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not val_bool@111@01))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 33 | val_bool@111@01 | live]
; [else-branch: 33 | !(val_bool@111@01) | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 33 | val_bool@111@01]
(assert val_bool@111@01)
; [exec]
; label loop1_inv_post_perm
; [exec]
; __t5 := true
; [exec]
; _15 := builtin$havoc_ref()
(declare-const ret@112@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_15.val_bool, write)
(declare-const $t@113@01 Bool)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@99@01)))))))
  ret@112@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@93@01 ret@112@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))
  ret@112@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@112@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@59@01 ret@112@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@112@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@64@01 ret@112@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@104@01 ret@112@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@107@01 ret@112@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@112@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@112@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _15.val_bool := false
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@112@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@107@01 ret@112@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@104@01 ret@112@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@64@01 ret@112@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@112@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@59@01 ret@112@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@112@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))
  ret@112@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@93@01 ret@112@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@99@01)))))))
  ret@112@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t22 := _15.val_bool
; [exec]
; fold acc(u32(_2), write)
; [eval] 0 <= self.val_int
(assert (u32%trigger ($Snap.combine ($SortWrappers.IntTo$Snap val_int@95@01) $Snap.unit) $t@91@01))
; [exec]
; assert (unfolding acc(u32(_2), write) in
;     0 <= _2.val_int && _2.val_int < 10)
; [eval] (unfolding acc(u32(_2), write) in 0 <= _2.val_int && _2.val_int < 10)
(set-option :timeout 0)
(push) ; 9
(push) ; 10
(set-option :timeout 10)
(assert (not (= _1@26@01 $t@91@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@69@01 $t@91@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [eval] 0 <= self.val_int
; [eval] 0 <= _2.val_int && _2.val_int < 10
; [eval] 0 <= _2.val_int
(set-option :timeout 0)
(push) ; 10
; [then-branch: 34 | 0 <= val_int@95@01 | live]
; [else-branch: 34 | !(0 <= val_int@95@01) | live]
(push) ; 11
; [then-branch: 34 | 0 <= val_int@95@01]
; [eval] _2.val_int < 10
(pop) ; 11
(push) ; 11
; [else-branch: 34 | !(0 <= val_int@95@01)]
(assert (not (<= 0 val_int@95@01)))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 val_int@95@01)) (<= 0 val_int@95@01)))
(pop) ; 9
; Joined path conditions
(assert (or (not (<= 0 val_int@95@01)) (<= 0 val_int@95@01)))
(push) ; 9
(assert (not (and (< val_int@95@01 10) (<= 0 val_int@95@01))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (and (< val_int@95@01 10) (<= 0 val_int@95@01)))
; [exec]
; assert true
; [exec]
; exhale acc(u32(_2), write)
; [exec]
; inhale false
(pop) ; 8
(push) ; 8
; [else-branch: 33 | !(val_bool@111@01)]
(assert (not val_bool@111@01))
(pop) ; 8
; [eval] !__t21
(push) ; 8
(set-option :timeout 10)
(assert (not val_bool@111@01))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not val_bool@111@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 35 | !(val_bool@111@01) | live]
; [else-branch: 35 | val_bool@111@01 | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 35 | !(val_bool@111@01)]
(assert (not val_bool@111@01))
; [exec]
; label loop1_group1_bb4
; [exec]
; label l8
; [exec]
; __t9 := true
; [exec]
; _25 := builtin$havoc_int()
(declare-const ret@114@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _25 := _2.val_int
; [exec]
; label l20
; [exec]
; _24 := builtin$havoc_ref()
(declare-const ret@115@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_24.val_bool, write)
(declare-const $t@116@01 Bool)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@99@01)))))))
  ret@115@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@93@01 ret@115@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))
  ret@115@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@115@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@59@01 ret@115@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@115@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@64@01 ret@115@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@104@01 ret@115@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@107@01 ret@115@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@115@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@115@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _24.val_bool := _25 == 10
; [eval] _25 == 10
(declare-const val_bool@117@01 Bool)
(assert (= val_bool@117@01 (= val_int@95@01 10)))
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@115@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@107@01 ret@115@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@104@01 ret@115@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@64@01 ret@115@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@115@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@59@01 ret@115@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@115@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))
  ret@115@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@93@01 ret@115@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@99@01)))))))
  ret@115@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; _23 := builtin$havoc_ref()
(declare-const ret@118@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_23.val_bool, write)
(declare-const $t@119@01 Bool)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@99@01)))))))
  ret@118@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@93@01 ret@118@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))
  ret@118@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@118@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@59@01 ret@118@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@118@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@64@01 ret@118@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@104@01 ret@118@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@107@01 ret@118@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@118@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@118@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@118@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _23.val_bool := !_24.val_bool
; [eval] !_24.val_bool
(declare-const val_bool@120@01 Bool)
(assert (= val_bool@120@01 (not val_bool@117@01)))
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@115@01 ret@118@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@109@01 ret@118@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@107@01 ret@118@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@104@01 ret@118@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@64@01 ret@118@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@118@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@59@01 ret@118@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@118@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))
  ret@118@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@93@01 ret@118@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@99@01)))))))
  ret@118@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t23 := _23.val_bool
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not val_bool@120@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 36 | val_bool@120@01 | dead]
; [else-branch: 36 | !(val_bool@120@01) | live]
(set-option :timeout 0)
(push) ; 9
; [else-branch: 36 | !(val_bool@120@01)]
(assert (not val_bool@120@01))
(pop) ; 9
; [eval] !__t23
(push) ; 9
(set-option :timeout 10)
(assert (not val_bool@120@01))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not val_bool@120@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 37 | !(val_bool@120@01) | live]
; [else-branch: 37 | val_bool@120@01 | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 37 | !(val_bool@120@01)]
(assert (not val_bool@120@01))
; [exec]
; label l9
; [exec]
; __t11 := true
; [exec]
; _27 := builtin$havoc_ref()
(declare-const ret@121@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_27.val_int, write)
(declare-const $t@122@01 Int)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@69@01 ret@121@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= _1@26@01 ret@121@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@91@01 ret@121@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@121@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _27.val_int := _2.val_int
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@91@01 ret@121@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= _1@26@01 ret@121@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@69@01 ret@121@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l23
; [exec]
; _0 := builtin$havoc_ref()
(declare-const ret@123@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0), write)
(declare-const $t@124@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$(_0) ==
;   0
(declare-const $t@125@01 $Snap)
(assert (= $t@125@01 $Snap.unit))
; [eval] m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$(_0) == 0
; [eval] m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$(_0)
(set-option :timeout 0)
(push) ; 10
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
(assert (m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition $t@124@01 ret@123@01))
(pop) ; 10
; Joined path conditions
(assert (m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition $t@124@01 ret@123@01))
(assert (=
  (m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$ $t@124@01 ret@123@01)
  0))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; unfold acc(m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0), write)
(assert (= $t@124@01 ($Snap.combine ($Snap.first $t@124@01) ($Snap.second $t@124@01))))
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@50@01 ret@123@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@98@01 ret@123@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@123@01 $Ref.null)))
(assert (=
  ($Snap.second $t@124@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@124@01))
    ($Snap.second ($Snap.second $t@124@01)))))
(assert (= ($Snap.first ($Snap.second $t@124@01)) $Snap.unit))
; [eval] 0 <= self.discriminant
(assert (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@124@01))))
(assert (=
  ($Snap.second ($Snap.second $t@124@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@124@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@124@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@124@01))) $Snap.unit))
; [eval] self.discriminant <= 1
(assert (<= ($SortWrappers.$SnapToInt ($Snap.first $t@124@01)) 1))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@124@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@124@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))))
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@50@01 ret@123@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@98@01 ret@123@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01))))))))
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@50@01 ret@123@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@98@01 ret@123@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [eval] self.discriminant == 1
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@124@01)) 1))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 38 | First:($t@124@01) == 1 | dead]
; [else-branch: 38 | First:($t@124@01) != 1 | live]
(set-option :timeout 0)
(push) ; 10
; [else-branch: 38 | First:($t@124@01) != 1]
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@124@01)) 1)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_%trigger $t@124@01 ret@123@01))
; [exec]
; unfold acc(m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_Ok(_0.enum_Ok), write)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))))))
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@124@01))))))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@99@01)))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@124@01))))))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))
    $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_Ok%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))))
; [exec]
; _0.enum_Ok.f$0 := _27
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@124@01))))))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@99@01)))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@124@01))))))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l24
; [exec]
; fold acc(bool(_7.enum_Ok.f$0), write)
; [exec]
; fold acc(m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_Ok(_7.enum_Ok), write)
(assert (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_Ok%trigger ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@99@01))))))
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@99@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@99@01)))))))
; [exec]
; fold acc(m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7), write)
; [eval] 0 <= self.discriminant
; [eval] self.discriminant <= 1
; [eval] self.discriminant == 1
; [then-branch: 39 | First:($t@99@01) == 1 | dead]
; [else-branch: 39 | First:($t@99@01) != 1 | live]
(set-option :timeout 0)
(push) ; 11
; [else-branch: 39 | First:($t@99@01) != 1]
(assert (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%trigger ($Snap.combine
  ($Snap.first $t@99@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@99@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@99@01)))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@99@01))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@99@01)))))))))))) ret@98@01))
; [exec]
; fold acc(u32(_0.enum_Ok.f$0), write)
; [eval] 0 <= self.val_int
(push) ; 12
(assert (not (<= 0 val_int@95@01)))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 val_int@95@01))
(assert (u32%trigger ($Snap.combine ($SortWrappers.IntTo$Snap val_int@95@01) $Snap.unit) ret@121@01))
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))))
  ret@121@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_Ok(_0.enum_Ok), write)
(assert (m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_Ok%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap ret@121@01)
  ($Snap.combine ($SortWrappers.IntTo$Snap val_int@95@01) $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))))
; [exec]
; fold acc(m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0), write)
; [eval] 0 <= self.discriminant
; [eval] self.discriminant <= 1
; [eval] self.discriminant == 1
; [then-branch: 40 | First:($t@124@01) == 1 | dead]
; [else-branch: 40 | First:($t@124@01) != 1 | live]
(set-option :timeout 0)
(push) ; 12
; [else-branch: 40 | First:($t@124@01) != 1]
(assert (m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_%trigger ($Snap.combine
  ($Snap.first $t@124@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@124@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@121@01)
            ($Snap.combine ($SortWrappers.IntTo$Snap val_int@95@01) $Snap.unit))))))) ret@123@01))
; [exec]
; label loop1_group2_bb8
; [exec]
; __t15 := true
; [exec]
; label l29
; [exec]
; assert (!m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0)) ||
;   m_get_ok_u32__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0)) ==
;   10) &&
;   (!m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0)) ||
;   m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0)) ==
;   old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) &&
;   old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) > 10)
; [eval] !m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0)) || m_get_ok_u32__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0)) == 10
; [eval] !m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0)
(push) ; 13
; [eval] read$()
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
(assert (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_%precondition ($Snap.combine
  ($Snap.first $t@124@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@124@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@121@01)
            ($Snap.combine ($SortWrappers.IntTo$Snap val_int@95@01) $Snap.unit))))))) ret@123@01))
(pop) ; 13
; Joined path conditions
(assert (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_%precondition ($Snap.combine
  ($Snap.first $t@124@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@124@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@121@01)
            ($Snap.combine ($SortWrappers.IntTo$Snap val_int@95@01) $Snap.unit))))))) ret@123@01))
(set-option :timeout 0)
(push) ; 13
(assert (m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@124@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@124@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@121@01)
            ($Snap.combine ($SortWrappers.IntTo$Snap val_int@95@01) $Snap.unit))))))) ret@123@01)))
(pop) ; 13
; Joined path conditions
(assert (m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@124@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@124@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@121@01)
            ($Snap.combine ($SortWrappers.IntTo$Snap val_int@95@01) $Snap.unit))))))) ret@123@01)))
(push) ; 13
; [then-branch: 41 | !(m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_((First:($t@124@01), (_, (_, (First:(Second:(Second:(Second:($t@124@01)))), (First:(Second:(Second:(Second:(Second:($t@124@01))))), (ret@121@01, (val_int@95@01, _))))))), ret@123@01))) | live]
; [else-branch: 41 | m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_((First:($t@124@01), (_, (_, (First:(Second:(Second:(Second:($t@124@01)))), (First:(Second:(Second:(Second:(Second:($t@124@01))))), (ret@121@01, (val_int@95@01, _))))))), ret@123@01)) | live]
(push) ; 14
; [then-branch: 41 | !(m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_((First:($t@124@01), (_, (_, (First:(Second:(Second:(Second:($t@124@01)))), (First:(Second:(Second:(Second:(Second:($t@124@01))))), (ret@121@01, (val_int@95@01, _))))))), ret@123@01)))]
(assert (not
  (m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($Snap.first $t@124@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@124@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ret@121@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap val_int@95@01) $Snap.unit))))))) ret@123@01))))
(pop) ; 14
(push) ; 14
; [else-branch: 41 | m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_((First:($t@124@01), (_, (_, (First:(Second:(Second:(Second:($t@124@01)))), (First:(Second:(Second:(Second:(Second:($t@124@01))))), (ret@121@01, (val_int@95@01, _))))))), ret@123@01))]
(assert (m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@124@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@124@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@121@01)
            ($Snap.combine ($SortWrappers.IntTo$Snap val_int@95@01) $Snap.unit))))))) ret@123@01)))
; [eval] m_get_ok_u32__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0)) == 10
; [eval] m_get_ok_u32__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0)
(push) ; 15
; [eval] read$()
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(push) ; 16
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(push) ; 16
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(pop) ; 15
; Joined path conditions
(set-option :timeout 0)
(push) ; 15
; [eval] m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$(_1)
(push) ; 16
(pop) ; 16
; Joined path conditions
(assert (m_get_ok_u32__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@124@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@124@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@121@01)
            ($Snap.combine ($SortWrappers.IntTo$Snap val_int@95@01) $Snap.unit))))))) ret@123@01)))
(pop) ; 15
; Joined path conditions
(assert (m_get_ok_u32__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@124@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@124@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@121@01)
            ($Snap.combine ($SortWrappers.IntTo$Snap val_int@95@01) $Snap.unit))))))) ret@123@01)))
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(assert (=>
  (m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($Snap.first $t@124@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@124@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ret@121@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap val_int@95@01) $Snap.unit))))))) ret@123@01))
  (and
    (m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@124@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@124@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@121@01)
                ($Snap.combine
                  ($SortWrappers.IntTo$Snap val_int@95@01)
                  $Snap.unit))))))) ret@123@01))
    (m_get_ok_u32__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@124@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@124@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@121@01)
                ($Snap.combine
                  ($SortWrappers.IntTo$Snap val_int@95@01)
                  $Snap.unit))))))) ret@123@01)))))
(assert (or
  (m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($Snap.first $t@124@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@124@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ret@121@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap val_int@95@01) $Snap.unit))))))) ret@123@01))
  (not
    (m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@124@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@124@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@121@01)
                ($Snap.combine
                  ($SortWrappers.IntTo$Snap val_int@95@01)
                  $Snap.unit))))))) ret@123@01)))))
(push) ; 13
(assert (not (or
  (not
    (m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@124@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@124@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@121@01)
                ($Snap.combine
                  ($SortWrappers.IntTo$Snap val_int@95@01)
                  $Snap.unit))))))) ret@123@01)))
  (=
    (m_get_ok_u32__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@124@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@124@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@121@01)
                ($Snap.combine
                  ($SortWrappers.IntTo$Snap val_int@95@01)
                  $Snap.unit))))))) ret@123@01))
    10))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(assert (or
  (not
    (m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@124@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@124@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@121@01)
                ($Snap.combine
                  ($SortWrappers.IntTo$Snap val_int@95@01)
                  $Snap.unit))))))) ret@123@01)))
  (=
    (m_get_ok_u32__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@124@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@124@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@121@01)
                ($Snap.combine
                  ($SortWrappers.IntTo$Snap val_int@95@01)
                  $Snap.unit))))))) ret@123@01))
    10)))
; [eval] !m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0)) || m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0)) == old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) && old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) > 10
; [eval] !m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0)
(push) ; 13
; [eval] read$()
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
(pop) ; 13
; Joined path conditions
(set-option :timeout 0)
(push) ; 13
(assert (m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@124@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@124@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@121@01)
            ($Snap.combine ($SortWrappers.IntTo$Snap val_int@95@01) $Snap.unit))))))) ret@123@01)))
(pop) ; 13
; Joined path conditions
(assert (m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@124@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@124@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@121@01)
            ($Snap.combine ($SortWrappers.IntTo$Snap val_int@95@01) $Snap.unit))))))) ret@123@01)))
(push) ; 13
; [then-branch: 42 | !(m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_((First:($t@124@01), (_, (_, (First:(Second:(Second:(Second:($t@124@01)))), (First:(Second:(Second:(Second:(Second:($t@124@01))))), (ret@121@01, (val_int@95@01, _))))))), ret@123@01))) | live]
; [else-branch: 42 | m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_((First:($t@124@01), (_, (_, (First:(Second:(Second:(Second:($t@124@01)))), (First:(Second:(Second:(Second:(Second:($t@124@01))))), (ret@121@01, (val_int@95@01, _))))))), ret@123@01)) | live]
(push) ; 14
; [then-branch: 42 | !(m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_((First:($t@124@01), (_, (_, (First:(Second:(Second:(Second:($t@124@01)))), (First:(Second:(Second:(Second:(Second:($t@124@01))))), (ret@121@01, (val_int@95@01, _))))))), ret@123@01)))]
(assert (not
  (m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($Snap.first $t@124@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@124@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ret@121@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap val_int@95@01) $Snap.unit))))))) ret@123@01))))
(pop) ; 14
(push) ; 14
; [else-branch: 42 | m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_((First:($t@124@01), (_, (_, (First:(Second:(Second:(Second:($t@124@01)))), (First:(Second:(Second:(Second:(Second:($t@124@01))))), (ret@121@01, (val_int@95@01, _))))))), ret@123@01))]
(assert (m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@124@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@124@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@121@01)
            ($Snap.combine ($SortWrappers.IntTo$Snap val_int@95@01) $Snap.unit))))))) ret@123@01)))
; [eval] m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0)) == old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) && old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) > 10
; [eval] m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0)) == old[pre]((unfolding acc(u32(_1), write) in _1.val_int))
; [eval] m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0)
(push) ; 15
; [eval] read$()
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(push) ; 16
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(push) ; 16
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(pop) ; 15
; Joined path conditions
(set-option :timeout 0)
(push) ; 15
; [eval] m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$(_1)
(push) ; 16
(pop) ; 16
; Joined path conditions
(assert (m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@124@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@124@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@121@01)
            ($Snap.combine ($SortWrappers.IntTo$Snap val_int@95@01) $Snap.unit))))))) ret@123@01)))
(pop) ; 15
; Joined path conditions
(assert (m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@124@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@124@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@121@01)
            ($Snap.combine ($SortWrappers.IntTo$Snap val_int@95@01) $Snap.unit))))))) ret@123@01)))
; [eval] old[pre]((unfolding acc(u32(_1), write) in _1.val_int))
; [eval] (unfolding acc(u32(_1), write) in _1.val_int)
(push) ; 15
; [eval] 0 <= self.val_int
(pop) ; 15
; Joined path conditions
(push) ; 15
; [then-branch: 43 | m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_((First:($t@124@01), (_, (_, (First:(Second:(Second:(Second:($t@124@01)))), (First:(Second:(Second:(Second:(Second:($t@124@01))))), (ret@121@01, (val_int@95@01, _))))))), ret@123@01)) == First:($t@42@01) | live]
; [else-branch: 43 | m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_((First:($t@124@01), (_, (_, (First:(Second:(Second:(Second:($t@124@01)))), (First:(Second:(Second:(Second:(Second:($t@124@01))))), (ret@121@01, (val_int@95@01, _))))))), ret@123@01)) != First:($t@42@01) | live]
(push) ; 16
; [then-branch: 43 | m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_((First:($t@124@01), (_, (_, (First:(Second:(Second:(Second:($t@124@01)))), (First:(Second:(Second:(Second:(Second:($t@124@01))))), (ret@121@01, (val_int@95@01, _))))))), ret@123@01)) == First:($t@42@01)]
(assert (=
  (m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($Snap.first $t@124@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@124@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ret@121@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap val_int@95@01) $Snap.unit))))))) ret@123@01))
  ($SortWrappers.$SnapToInt ($Snap.first $t@42@01))))
; [eval] old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) > 10
; [eval] old[pre]((unfolding acc(u32(_1), write) in _1.val_int))
; [eval] (unfolding acc(u32(_1), write) in _1.val_int)
(push) ; 17
; [eval] 0 <= self.val_int
(pop) ; 17
; Joined path conditions
(pop) ; 16
(push) ; 16
; [else-branch: 43 | m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_((First:($t@124@01), (_, (_, (First:(Second:(Second:(Second:($t@124@01)))), (First:(Second:(Second:(Second:(Second:($t@124@01))))), (ret@121@01, (val_int@95@01, _))))))), ret@123@01)) != First:($t@42@01)]
(assert (not
  (=
    (m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@124@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@124@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@121@01)
                ($Snap.combine
                  ($SortWrappers.IntTo$Snap val_int@95@01)
                  $Snap.unit))))))) ret@123@01))
    ($SortWrappers.$SnapToInt ($Snap.first $t@42@01)))))
(pop) ; 16
(pop) ; 15
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (=
      (m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
        ($Snap.first $t@124@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@124@01))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap ret@121@01)
                  ($Snap.combine
                    ($SortWrappers.IntTo$Snap val_int@95@01)
                    $Snap.unit))))))) ret@123@01))
      ($SortWrappers.$SnapToInt ($Snap.first $t@42@01))))
  (=
    (m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@124@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@124@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@121@01)
                ($Snap.combine
                  ($SortWrappers.IntTo$Snap val_int@95@01)
                  $Snap.unit))))))) ret@123@01))
    ($SortWrappers.$SnapToInt ($Snap.first $t@42@01)))))
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(assert (=>
  (m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($Snap.first $t@124@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@124@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ret@121@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap val_int@95@01) $Snap.unit))))))) ret@123@01))
  (and
    (m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@124@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@124@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@121@01)
                ($Snap.combine
                  ($SortWrappers.IntTo$Snap val_int@95@01)
                  $Snap.unit))))))) ret@123@01))
    (m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@124@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@124@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@121@01)
                ($Snap.combine
                  ($SortWrappers.IntTo$Snap val_int@95@01)
                  $Snap.unit))))))) ret@123@01))
    (or
      (not
        (=
          (m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
            ($Snap.first $t@124@01)
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@124@01))))
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))
                    ($Snap.combine
                      ($SortWrappers.$RefTo$Snap ret@121@01)
                      ($Snap.combine
                        ($SortWrappers.IntTo$Snap val_int@95@01)
                        $Snap.unit))))))) ret@123@01))
          ($SortWrappers.$SnapToInt ($Snap.first $t@42@01))))
      (=
        (m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
          ($Snap.first $t@124@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@124@01))))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap ret@121@01)
                    ($Snap.combine
                      ($SortWrappers.IntTo$Snap val_int@95@01)
                      $Snap.unit))))))) ret@123@01))
        ($SortWrappers.$SnapToInt ($Snap.first $t@42@01)))))))
(assert (or
  (m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($Snap.first $t@124@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@124@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ret@121@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap val_int@95@01) $Snap.unit))))))) ret@123@01))
  (not
    (m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@124@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@124@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@121@01)
                ($Snap.combine
                  ($SortWrappers.IntTo$Snap val_int@95@01)
                  $Snap.unit))))))) ret@123@01)))))
(push) ; 13
(assert (not (or
  (not
    (m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@124@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@124@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@121@01)
                ($Snap.combine
                  ($SortWrappers.IntTo$Snap val_int@95@01)
                  $Snap.unit))))))) ret@123@01)))
  (and
    (> ($SortWrappers.$SnapToInt ($Snap.first $t@42@01)) 10)
    (=
      (m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
        ($Snap.first $t@124@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@124@01))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap ret@121@01)
                  ($Snap.combine
                    ($SortWrappers.IntTo$Snap val_int@95@01)
                    $Snap.unit))))))) ret@123@01))
      ($SortWrappers.$SnapToInt ($Snap.first $t@42@01)))))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(assert (or
  (not
    (m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@124@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@124@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@121@01)
                ($Snap.combine
                  ($SortWrappers.IntTo$Snap val_int@95@01)
                  $Snap.unit))))))) ret@123@01)))
  (and
    (> ($SortWrappers.$SnapToInt ($Snap.first $t@42@01)) 10)
    (=
      (m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
        ($Snap.first $t@124@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@124@01))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@124@01)))))
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap ret@121@01)
                  ($Snap.combine
                    ($SortWrappers.IntTo$Snap val_int@95@01)
                    $Snap.unit))))))) ret@123@01))
      ($SortWrappers.$SnapToInt ($Snap.first $t@42@01))))))
; [exec]
; assert true
; [exec]
; exhale acc(m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0), write)
; [exec]
; label end_of_method
(pop) ; 12
(pop) ; 11
(pop) ; 10
(pop) ; 9
(pop) ; 8
(push) ; 8
; [else-branch: 35 | val_bool@111@01]
(assert val_bool@111@01)
(pop) ; 8
(pop) ; 7
(pop) ; 6
; [eval] !(__t20 == 0)
; [eval] __t20 == 0
(push) ; 6
(set-option :timeout 10)
(assert (not (= _9@103@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 44 | _9@103@01 != 0 | dead]
; [else-branch: 44 | _9@103@01 == 0 | live]
(set-option :timeout 0)
(push) ; 6
; [else-branch: 44 | _9@103@01 == 0]
(assert (= _9@103@01 0))
(pop) ; 6
(pop) ; 5
(push) ; 5
; [else-branch: 15 | !(val_bool@63@01)]
(assert (not val_bool@63@01))
(pop) ; 5
; [eval] !__t17
(push) ; 5
(set-option :timeout 10)
(assert (not val_bool@63@01))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not val_bool@63@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 45 | !(val_bool@63@01) | live]
; [else-branch: 45 | val_bool@63@01 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 45 | !(val_bool@63@01)]
(assert (not val_bool@63@01))
; [exec]
; label loop1_group1_bb1
; [exec]
; label l8
; [exec]
; __t9 := true
; [exec]
; _25 := builtin$havoc_int()
(declare-const ret@126@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _25 := _2.val_int
; [exec]
; label l20
; [exec]
; _24 := builtin$havoc_ref()
(declare-const ret@127@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_24.val_bool, write)
(declare-const $t@128@01 Bool)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))
  ret@127@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@127@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@59@01 ret@127@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@127@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@127@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _24.val_bool := _25 == 10
; [eval] _25 == 10
(declare-const val_bool@129@01 Bool)
(assert (= val_bool@129@01 (= val_int@47@01 10)))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@127@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@59@01 ret@127@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@127@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))
  ret@127@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; _23 := builtin$havoc_ref()
(declare-const ret@130@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_23.val_bool, write)
(declare-const $t@131@01 Bool)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))
  ret@130@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@130@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@59@01 ret@130@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@130@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@127@01 ret@130@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@130@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _23.val_bool := !_24.val_bool
; [eval] !_24.val_bool
(declare-const val_bool@132@01 Bool)
(assert (= val_bool@132@01 (not val_bool@129@01)))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@127@01 ret@130@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@130@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@59@01 ret@130@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@130@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))
  ret@130@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t23 := _23.val_bool
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not val_bool@132@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 46 | val_bool@132@01 | dead]
; [else-branch: 46 | !(val_bool@132@01) | live]
(set-option :timeout 0)
(push) ; 6
; [else-branch: 46 | !(val_bool@132@01)]
(assert (not val_bool@132@01))
(pop) ; 6
; [eval] !__t23
(push) ; 6
(set-option :timeout 10)
(assert (not val_bool@132@01))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not val_bool@132@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 47 | !(val_bool@132@01) | live]
; [else-branch: 47 | val_bool@132@01 | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 47 | !(val_bool@132@01)]
(assert (not val_bool@132@01))
; [exec]
; label l9
; [exec]
; __t11 := true
; [exec]
; _27 := builtin$havoc_ref()
(declare-const ret@133@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_27.val_int, write)
(declare-const $t@134@01 Int)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@45@01 ret@133@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _1@26@01 ret@133@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@133@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _27.val_int := _2.val_int
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _1@26@01 ret@133@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@45@01 ret@133@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l23
; [exec]
; _0 := builtin$havoc_ref()
(declare-const ret@135@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0), write)
(declare-const $t@136@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$(_0) ==
;   0
(declare-const $t@137@01 $Snap)
(assert (= $t@137@01 $Snap.unit))
; [eval] m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$(_0) == 0
; [eval] m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$(_0)
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
(assert (m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition $t@136@01 ret@135@01))
(pop) ; 7
; Joined path conditions
(assert (m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition $t@136@01 ret@135@01))
(assert (=
  (m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$ $t@136@01 ret@135@01)
  0))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; unfold acc(m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0), write)
(assert (= $t@136@01 ($Snap.combine ($Snap.first $t@136@01) ($Snap.second $t@136@01))))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@50@01 ret@135@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@135@01 $Ref.null)))
(assert (=
  ($Snap.second $t@136@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@136@01))
    ($Snap.second ($Snap.second $t@136@01)))))
(assert (= ($Snap.first ($Snap.second $t@136@01)) $Snap.unit))
; [eval] 0 <= self.discriminant
(assert (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@136@01))))
(assert (=
  ($Snap.second ($Snap.second $t@136@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@136@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@136@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@136@01))) $Snap.unit))
; [eval] self.discriminant <= 1
(assert (<= ($SortWrappers.$SnapToInt ($Snap.first $t@136@01)) 1))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@136@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@136@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@136@01)))))))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@50@01 ret@135@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@136@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@136@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@136@01))))))))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@50@01 ret@135@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [eval] self.discriminant == 1
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@136@01)) 1))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 48 | First:($t@136@01) == 1 | dead]
; [else-branch: 48 | First:($t@136@01) != 1 | live]
(set-option :timeout 0)
(push) ; 7
; [else-branch: 48 | First:($t@136@01) != 1]
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@136@01)) 1)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_%trigger $t@136@01 ret@135@01))
; [exec]
; unfold acc(m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_Ok(_0.enum_Ok), write)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@136@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@136@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@136@01)))))))))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@136@01))))))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@136@01)))))
    $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_Ok%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@136@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@136@01)))))))
; [exec]
; _0.enum_Ok.f$0 := _27
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@136@01))))))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l24
; [exec]
; fold acc(bool(_7.enum_Ok.f$0), write)
; [exec]
; fold acc(m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_Ok(_7.enum_Ok), write)
(assert (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_Ok%trigger ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01))))))
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))
; [exec]
; fold acc(m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7), write)
; [eval] 0 <= self.discriminant
; [eval] self.discriminant <= 1
; [eval] self.discriminant == 1
; [then-branch: 49 | First:($t@51@01) == 1 | dead]
; [else-branch: 49 | First:($t@51@01) != 1 | live]
(set-option :timeout 0)
(push) ; 8
; [else-branch: 49 | First:($t@51@01) != 1]
(assert (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%trigger ($Snap.combine
  ($Snap.first $t@51@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@51@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))))))) ret@50@01))
; [exec]
; fold acc(u32(_0.enum_Ok.f$0), write)
; [eval] 0 <= self.val_int
(push) ; 9
(assert (not (<= 0 val_int@47@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 val_int@47@01))
(assert (u32%trigger ($Snap.combine ($SortWrappers.IntTo$Snap val_int@47@01) $Snap.unit) ret@133@01))
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@136@01)))))))
  ret@133@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_Ok(_0.enum_Ok), write)
(assert (m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_Ok%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap ret@133@01)
  ($Snap.combine ($SortWrappers.IntTo$Snap val_int@47@01) $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@136@01)))))))
; [exec]
; fold acc(m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0), write)
; [eval] 0 <= self.discriminant
; [eval] self.discriminant <= 1
; [eval] self.discriminant == 1
; [then-branch: 50 | First:($t@136@01) == 1 | dead]
; [else-branch: 50 | First:($t@136@01) != 1 | live]
(set-option :timeout 0)
(push) ; 9
; [else-branch: 50 | First:($t@136@01) != 1]
(assert (m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_%trigger ($Snap.combine
  ($Snap.first $t@136@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@136@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@136@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@133@01)
            ($Snap.combine ($SortWrappers.IntTo$Snap val_int@47@01) $Snap.unit))))))) ret@135@01))
; [exec]
; label loop1_group2_bb8
; [exec]
; __t15 := true
; [exec]
; label l29
; [exec]
; assert (!m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0)) ||
;   m_get_ok_u32__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0)) ==
;   10) &&
;   (!m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0)) ||
;   m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0)) ==
;   old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) &&
;   old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) > 10)
; [eval] !m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0)) || m_get_ok_u32__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0)) == 10
; [eval] !m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0)
(push) ; 10
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
(assert (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_%precondition ($Snap.combine
  ($Snap.first $t@136@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@136@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@136@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@133@01)
            ($Snap.combine ($SortWrappers.IntTo$Snap val_int@47@01) $Snap.unit))))))) ret@135@01))
(pop) ; 10
; Joined path conditions
(assert (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_%precondition ($Snap.combine
  ($Snap.first $t@136@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@136@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@136@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@133@01)
            ($Snap.combine ($SortWrappers.IntTo$Snap val_int@47@01) $Snap.unit))))))) ret@135@01))
(set-option :timeout 0)
(push) ; 10
(assert (m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@136@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@136@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@136@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@133@01)
            ($Snap.combine ($SortWrappers.IntTo$Snap val_int@47@01) $Snap.unit))))))) ret@135@01)))
(pop) ; 10
; Joined path conditions
(assert (m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@136@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@136@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@136@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@133@01)
            ($Snap.combine ($SortWrappers.IntTo$Snap val_int@47@01) $Snap.unit))))))) ret@135@01)))
(push) ; 10
; [then-branch: 51 | !(m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_((First:($t@136@01), (_, (_, (First:(Second:(Second:(Second:($t@136@01)))), (First:(Second:(Second:(Second:(Second:($t@136@01))))), (ret@133@01, (val_int@47@01, _))))))), ret@135@01))) | live]
; [else-branch: 51 | m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_((First:($t@136@01), (_, (_, (First:(Second:(Second:(Second:($t@136@01)))), (First:(Second:(Second:(Second:(Second:($t@136@01))))), (ret@133@01, (val_int@47@01, _))))))), ret@135@01)) | live]
(push) ; 11
; [then-branch: 51 | !(m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_((First:($t@136@01), (_, (_, (First:(Second:(Second:(Second:($t@136@01)))), (First:(Second:(Second:(Second:(Second:($t@136@01))))), (ret@133@01, (val_int@47@01, _))))))), ret@135@01)))]
(assert (not
  (m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($Snap.first $t@136@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@136@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@136@01)))))
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ret@133@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap val_int@47@01) $Snap.unit))))))) ret@135@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 51 | m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_((First:($t@136@01), (_, (_, (First:(Second:(Second:(Second:($t@136@01)))), (First:(Second:(Second:(Second:(Second:($t@136@01))))), (ret@133@01, (val_int@47@01, _))))))), ret@135@01))]
(assert (m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@136@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@136@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@136@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@133@01)
            ($Snap.combine ($SortWrappers.IntTo$Snap val_int@47@01) $Snap.unit))))))) ret@135@01)))
; [eval] m_get_ok_u32__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0)) == 10
; [eval] m_get_ok_u32__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0)
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
; [eval] m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$(_1)
(push) ; 13
(pop) ; 13
; Joined path conditions
(assert (m_get_ok_u32__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@136@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@136@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@136@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@133@01)
            ($Snap.combine ($SortWrappers.IntTo$Snap val_int@47@01) $Snap.unit))))))) ret@135@01)))
(pop) ; 12
; Joined path conditions
(assert (m_get_ok_u32__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@136@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@136@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@136@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@133@01)
            ($Snap.combine ($SortWrappers.IntTo$Snap val_int@47@01) $Snap.unit))))))) ret@135@01)))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (=>
  (m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($Snap.first $t@136@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@136@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@136@01)))))
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ret@133@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap val_int@47@01) $Snap.unit))))))) ret@135@01))
  (and
    (m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@136@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@136@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@136@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@133@01)
                ($Snap.combine
                  ($SortWrappers.IntTo$Snap val_int@47@01)
                  $Snap.unit))))))) ret@135@01))
    (m_get_ok_u32__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@136@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@136@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@136@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@133@01)
                ($Snap.combine
                  ($SortWrappers.IntTo$Snap val_int@47@01)
                  $Snap.unit))))))) ret@135@01)))))
(assert (or
  (m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($Snap.first $t@136@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@136@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@136@01)))))
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ret@133@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap val_int@47@01) $Snap.unit))))))) ret@135@01))
  (not
    (m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@136@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@136@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@136@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@133@01)
                ($Snap.combine
                  ($SortWrappers.IntTo$Snap val_int@47@01)
                  $Snap.unit))))))) ret@135@01)))))
(push) ; 10
(assert (not (or
  (not
    (m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@136@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@136@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@136@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@133@01)
                ($Snap.combine
                  ($SortWrappers.IntTo$Snap val_int@47@01)
                  $Snap.unit))))))) ret@135@01)))
  (=
    (m_get_ok_u32__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@136@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@136@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@136@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@133@01)
                ($Snap.combine
                  ($SortWrappers.IntTo$Snap val_int@47@01)
                  $Snap.unit))))))) ret@135@01))
    10))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (or
  (not
    (m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@136@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@136@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@136@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@133@01)
                ($Snap.combine
                  ($SortWrappers.IntTo$Snap val_int@47@01)
                  $Snap.unit))))))) ret@135@01)))
  (=
    (m_get_ok_u32__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@136@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@136@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@136@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@133@01)
                ($Snap.combine
                  ($SortWrappers.IntTo$Snap val_int@47@01)
                  $Snap.unit))))))) ret@135@01))
    10)))
; [eval] !m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0)) || m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0)) == old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) && old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) > 10
; [eval] !m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0)
(push) ; 10
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
(pop) ; 10
; Joined path conditions
(set-option :timeout 0)
(push) ; 10
(assert (m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@136@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@136@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@136@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@133@01)
            ($Snap.combine ($SortWrappers.IntTo$Snap val_int@47@01) $Snap.unit))))))) ret@135@01)))
(pop) ; 10
; Joined path conditions
(assert (m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@136@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@136@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@136@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@133@01)
            ($Snap.combine ($SortWrappers.IntTo$Snap val_int@47@01) $Snap.unit))))))) ret@135@01)))
(push) ; 10
; [then-branch: 52 | !(m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_((First:($t@136@01), (_, (_, (First:(Second:(Second:(Second:($t@136@01)))), (First:(Second:(Second:(Second:(Second:($t@136@01))))), (ret@133@01, (val_int@47@01, _))))))), ret@135@01))) | live]
; [else-branch: 52 | m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_((First:($t@136@01), (_, (_, (First:(Second:(Second:(Second:($t@136@01)))), (First:(Second:(Second:(Second:(Second:($t@136@01))))), (ret@133@01, (val_int@47@01, _))))))), ret@135@01)) | live]
(push) ; 11
; [then-branch: 52 | !(m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_((First:($t@136@01), (_, (_, (First:(Second:(Second:(Second:($t@136@01)))), (First:(Second:(Second:(Second:(Second:($t@136@01))))), (ret@133@01, (val_int@47@01, _))))))), ret@135@01)))]
(assert (not
  (m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($Snap.first $t@136@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@136@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@136@01)))))
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ret@133@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap val_int@47@01) $Snap.unit))))))) ret@135@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 52 | m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_((First:($t@136@01), (_, (_, (First:(Second:(Second:(Second:($t@136@01)))), (First:(Second:(Second:(Second:(Second:($t@136@01))))), (ret@133@01, (val_int@47@01, _))))))), ret@135@01))]
(assert (m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@136@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@136@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@136@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@133@01)
            ($Snap.combine ($SortWrappers.IntTo$Snap val_int@47@01) $Snap.unit))))))) ret@135@01)))
; [eval] m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0)) == old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) && old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) > 10
; [eval] m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0)) == old[pre]((unfolding acc(u32(_1), write) in _1.val_int))
; [eval] m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0)
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
; unsat
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
; [eval] m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$(_1)
(push) ; 13
(pop) ; 13
; Joined path conditions
(assert (m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@136@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@136@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@136@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@133@01)
            ($Snap.combine ($SortWrappers.IntTo$Snap val_int@47@01) $Snap.unit))))))) ret@135@01)))
(pop) ; 12
; Joined path conditions
(assert (m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@136@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@136@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@136@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ret@133@01)
            ($Snap.combine ($SortWrappers.IntTo$Snap val_int@47@01) $Snap.unit))))))) ret@135@01)))
; [eval] old[pre]((unfolding acc(u32(_1), write) in _1.val_int))
; [eval] (unfolding acc(u32(_1), write) in _1.val_int)
(push) ; 12
; [eval] 0 <= self.val_int
(pop) ; 12
; Joined path conditions
(push) ; 12
; [then-branch: 53 | m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_((First:($t@136@01), (_, (_, (First:(Second:(Second:(Second:($t@136@01)))), (First:(Second:(Second:(Second:(Second:($t@136@01))))), (ret@133@01, (val_int@47@01, _))))))), ret@135@01)) == First:($t@42@01) | live]
; [else-branch: 53 | m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_((First:($t@136@01), (_, (_, (First:(Second:(Second:(Second:($t@136@01)))), (First:(Second:(Second:(Second:(Second:($t@136@01))))), (ret@133@01, (val_int@47@01, _))))))), ret@135@01)) != First:($t@42@01) | live]
(push) ; 13
; [then-branch: 53 | m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_((First:($t@136@01), (_, (_, (First:(Second:(Second:(Second:($t@136@01)))), (First:(Second:(Second:(Second:(Second:($t@136@01))))), (ret@133@01, (val_int@47@01, _))))))), ret@135@01)) == First:($t@42@01)]
(assert (=
  (m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($Snap.first $t@136@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@136@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@136@01)))))
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ret@133@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap val_int@47@01) $Snap.unit))))))) ret@135@01))
  ($SortWrappers.$SnapToInt ($Snap.first $t@42@01))))
; [eval] old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) > 10
; [eval] old[pre]((unfolding acc(u32(_1), write) in _1.val_int))
; [eval] (unfolding acc(u32(_1), write) in _1.val_int)
(push) ; 14
; [eval] 0 <= self.val_int
(pop) ; 14
; Joined path conditions
(pop) ; 13
(push) ; 13
; [else-branch: 53 | m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_((First:($t@136@01), (_, (_, (First:(Second:(Second:(Second:($t@136@01)))), (First:(Second:(Second:(Second:(Second:($t@136@01))))), (ret@133@01, (val_int@47@01, _))))))), ret@135@01)) != First:($t@42@01)]
(assert (not
  (=
    (m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@136@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@136@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@136@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@133@01)
                ($Snap.combine
                  ($SortWrappers.IntTo$Snap val_int@47@01)
                  $Snap.unit))))))) ret@135@01))
    ($SortWrappers.$SnapToInt ($Snap.first $t@42@01)))))
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (=
      (m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
        ($Snap.first $t@136@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@136@01))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@136@01)))))
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap ret@133@01)
                  ($Snap.combine
                    ($SortWrappers.IntTo$Snap val_int@47@01)
                    $Snap.unit))))))) ret@135@01))
      ($SortWrappers.$SnapToInt ($Snap.first $t@42@01))))
  (=
    (m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@136@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@136@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@136@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@133@01)
                ($Snap.combine
                  ($SortWrappers.IntTo$Snap val_int@47@01)
                  $Snap.unit))))))) ret@135@01))
    ($SortWrappers.$SnapToInt ($Snap.first $t@42@01)))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (=>
  (m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($Snap.first $t@136@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@136@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@136@01)))))
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ret@133@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap val_int@47@01) $Snap.unit))))))) ret@135@01))
  (and
    (m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@136@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@136@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@136@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@133@01)
                ($Snap.combine
                  ($SortWrappers.IntTo$Snap val_int@47@01)
                  $Snap.unit))))))) ret@135@01))
    (m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@136@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@136@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@136@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@133@01)
                ($Snap.combine
                  ($SortWrappers.IntTo$Snap val_int@47@01)
                  $Snap.unit))))))) ret@135@01))
    (or
      (not
        (=
          (m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
            ($Snap.first $t@136@01)
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@136@01))))
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@136@01)))))
                    ($Snap.combine
                      ($SortWrappers.$RefTo$Snap ret@133@01)
                      ($Snap.combine
                        ($SortWrappers.IntTo$Snap val_int@47@01)
                        $Snap.unit))))))) ret@135@01))
          ($SortWrappers.$SnapToInt ($Snap.first $t@42@01))))
      (=
        (m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
          ($Snap.first $t@136@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@136@01))))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@136@01)))))
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap ret@133@01)
                    ($Snap.combine
                      ($SortWrappers.IntTo$Snap val_int@47@01)
                      $Snap.unit))))))) ret@135@01))
        ($SortWrappers.$SnapToInt ($Snap.first $t@42@01)))))))
(assert (or
  (m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($Snap.first $t@136@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@136@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@136@01)))))
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ret@133@01)
              ($Snap.combine ($SortWrappers.IntTo$Snap val_int@47@01) $Snap.unit))))))) ret@135@01))
  (not
    (m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@136@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@136@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@136@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@133@01)
                ($Snap.combine
                  ($SortWrappers.IntTo$Snap val_int@47@01)
                  $Snap.unit))))))) ret@135@01)))))
(push) ; 10
(assert (not (or
  (not
    (m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@136@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@136@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@136@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@133@01)
                ($Snap.combine
                  ($SortWrappers.IntTo$Snap val_int@47@01)
                  $Snap.unit))))))) ret@135@01)))
  (and
    (> ($SortWrappers.$SnapToInt ($Snap.first $t@42@01)) 10)
    (=
      (m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
        ($Snap.first $t@136@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@136@01))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@136@01)))))
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap ret@133@01)
                  ($Snap.combine
                    ($SortWrappers.IntTo$Snap val_int@47@01)
                    $Snap.unit))))))) ret@135@01))
      ($SortWrappers.$SnapToInt ($Snap.first $t@42@01)))))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (or
  (not
    (m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@136@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@136@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@136@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap ret@133@01)
                ($Snap.combine
                  ($SortWrappers.IntTo$Snap val_int@47@01)
                  $Snap.unit))))))) ret@135@01)))
  (and
    (> ($SortWrappers.$SnapToInt ($Snap.first $t@42@01)) 10)
    (=
      (m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
        ($Snap.first $t@136@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@136@01))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@136@01)))))
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap ret@133@01)
                  ($Snap.combine
                    ($SortWrappers.IntTo$Snap val_int@47@01)
                    $Snap.unit))))))) ret@135@01))
      ($SortWrappers.$SnapToInt ($Snap.first $t@42@01))))))
; [exec]
; assert true
; [exec]
; exhale acc(m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0), write)
; [exec]
; label end_of_method
(pop) ; 9
(pop) ; 8
(pop) ; 7
(pop) ; 6
(pop) ; 5
(push) ; 5
; [else-branch: 45 | val_bool@63@01]
(assert val_bool@63@01)
(pop) ; 5
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 13 | _9@55@01 != 0]
(assert (not (= _9@55@01 0)))
(pop) ; 3
; [eval] !(__t16 == 0)
; [eval] __t16 == 0
(push) ; 3
(set-option :timeout 10)
(assert (not (= _9@55@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= _9@55@01 0))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [then-branch: 54 | _9@55@01 != 0 | live]
; [else-branch: 54 | _9@55@01 == 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 54 | _9@55@01 != 0]
(assert (not (= _9@55@01 0)))
; [exec]
; label bb0
; [exec]
; label l4
; [exec]
; __t13 := true
; [exec]
; __t14 := true
; [exec]
; unfold acc(m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_(_7), write)
(assert (= $t@51@01 ($Snap.combine ($Snap.first $t@51@01) ($Snap.second $t@51@01))))
(assert (not (= ret@50@01 $Ref.null)))
(assert (=
  ($Snap.second $t@51@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@51@01))
    ($Snap.second ($Snap.second $t@51@01)))))
(assert (= ($Snap.first ($Snap.second $t@51@01)) $Snap.unit))
; [eval] 0 <= self.discriminant
(assert (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@51@01))))
(assert (=
  ($Snap.second ($Snap.second $t@51@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@51@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@51@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@51@01))) $Snap.unit))
; [eval] self.discriminant <= 1
(assert (<= ($SortWrappers.$SnapToInt ($Snap.first $t@51@01)) 1))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@51@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@51@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01))))))))
; [eval] self.discriminant == 1
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@51@01)) 1))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@51@01)) 1)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 55 | First:($t@51@01) == 1 | live]
; [else-branch: 55 | First:($t@51@01) != 1 | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 55 | First:($t@51@01) == 1]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@51@01)) 1))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_%trigger $t@51@01 ret@50@01))
; [exec]
; unfold acc(m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_Err(_7.enum_Err), write)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))))
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01))))))
    $Ref.null)))
; State saturation: after unfold
(check-sat)
; unknown
(assert (m_std$$result$$Result$_beg_$bool$_sep_$struct$m_UnexpectedValue$_end_Err%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01))))))))
; [exec]
; _10 := _7.enum_Err.f$0
(declare-const _10@138@01 $Ref)
(assert (=
  _10@138@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))))
; [exec]
; label l25
; [exec]
; _12 := _10
; [exec]
; label l26
; [exec]
; _0 := builtin$havoc_ref()
(declare-const ret@139@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0), write)
(declare-const $t@140@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$(_0) ==
;   1
(declare-const $t@141@01 $Snap)
(assert (= $t@141@01 $Snap.unit))
; [eval] m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$(_0) == 1
; [eval] m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$(_0)
(set-option :timeout 0)
(push) ; 5
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
(assert (m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition $t@140@01 ret@139@01))
(pop) ; 5
; Joined path conditions
(assert (m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition $t@140@01 ret@139@01))
(assert (=
  (m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$discriminant$$__$TY$__m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$ $t@140@01 ret@139@01)
  1))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; unfold acc(m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0), write)
(assert (= $t@140@01 ($Snap.combine ($Snap.first $t@140@01) ($Snap.second $t@140@01))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@50@01 ret@139@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@139@01 $Ref.null)))
(assert (=
  ($Snap.second $t@140@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@140@01))
    ($Snap.second ($Snap.second $t@140@01)))))
(assert (= ($Snap.first ($Snap.second $t@140@01)) $Snap.unit))
; [eval] 0 <= self.discriminant
(assert (<= 0 ($SortWrappers.$SnapToInt ($Snap.first $t@140@01))))
(assert (=
  ($Snap.second ($Snap.second $t@140@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@140@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@140@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@140@01))) $Snap.unit))
; [eval] self.discriminant <= 1
(assert (<= ($SortWrappers.$SnapToInt ($Snap.first $t@140@01)) 1))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@140@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@140@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01)))))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@50@01 ret@139@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01))))))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@50@01 ret@139@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] self.discriminant == 1
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@140@01)) 1))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@140@01)) 1)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 56 | First:($t@140@01) == 1 | live]
; [else-branch: 56 | First:($t@140@01) != 1 | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 56 | First:($t@140@01) == 1]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@140@01)) 1))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_%trigger $t@140@01 ret@139@01))
; [exec]
; unfold acc(m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_Err(_0.enum_Err), write)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01)))))))))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01)))))))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01))))))
    $Ref.null)))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01))))))))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_Err%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01))))))))
; [exec]
; _0.enum_Err.f$0 := _12
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01)))))))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l27
; [exec]
; fold acc(m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_Err(_0.enum_Err), write)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))
  _10@138@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_Err%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap _10@138@01)
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01))))))))
; [exec]
; fold acc(m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0), write)
; [eval] 0 <= self.discriminant
; [eval] self.discriminant <= 1
; [eval] self.discriminant == 1
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@140@01)) 1))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 57 | First:($t@140@01) == 1 | live]
; [else-branch: 57 | First:($t@140@01) != 1 | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 57 | First:($t@140@01) == 1]
(assert (m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_%trigger ($Snap.combine
  ($Snap.first $t@140@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@140@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap _10@138@01)
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))))))) ret@139@01))
; [exec]
; label loop1_group2_bb8
; [exec]
; __t15 := true
; [exec]
; label l29
; [exec]
; assert (!m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0)) ||
;   m_get_ok_u32__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0)) ==
;   10) &&
;   (!m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0)) ||
;   m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0)) ==
;   old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) &&
;   old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) > 10)
; [eval] !m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0)) || m_get_ok_u32__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0)) == 10
; [eval] !m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0)
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
(assert (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_%precondition ($Snap.combine
  ($Snap.first $t@140@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@140@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap _10@138@01)
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))))))) ret@139@01))
(pop) ; 7
; Joined path conditions
(assert (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_%precondition ($Snap.combine
  ($Snap.first $t@140@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@140@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap _10@138@01)
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))))))) ret@139@01))
(set-option :timeout 0)
(push) ; 7
(assert (m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@140@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@140@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap _10@138@01)
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))))))) ret@139@01)))
(pop) ; 7
; Joined path conditions
(assert (m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@140@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@140@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap _10@138@01)
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))))))) ret@139@01)))
(push) ; 7
; [then-branch: 58 | !(m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_((First:($t@140@01), (_, (_, (First:(Second:(Second:(Second:($t@140@01)))), (First:(Second:(Second:(Second:(Second:($t@140@01))))), (_10@138@01, Second:(Second:(Second:(Second:(Second:(Second:($t@51@01)))))))))))), ret@139@01))) | live]
; [else-branch: 58 | m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_((First:($t@140@01), (_, (_, (First:(Second:(Second:(Second:($t@140@01)))), (First:(Second:(Second:(Second:(Second:($t@140@01))))), (_10@138@01, Second:(Second:(Second:(Second:(Second:(Second:($t@51@01)))))))))))), ret@139@01)) | live]
(push) ; 8
; [then-branch: 58 | !(m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_((First:($t@140@01), (_, (_, (First:(Second:(Second:(Second:($t@140@01)))), (First:(Second:(Second:(Second:(Second:($t@140@01))))), (_10@138@01, Second:(Second:(Second:(Second:(Second:(Second:($t@51@01)))))))))))), ret@139@01)))]
(assert (not
  (m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($Snap.first $t@140@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@140@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01)))))
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap _10@138@01)
              ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))))))) ret@139@01))))
(pop) ; 8
(push) ; 8
; [else-branch: 58 | m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_((First:($t@140@01), (_, (_, (First:(Second:(Second:(Second:($t@140@01)))), (First:(Second:(Second:(Second:(Second:($t@140@01))))), (_10@138@01, Second:(Second:(Second:(Second:(Second:(Second:($t@51@01)))))))))))), ret@139@01))]
(assert (m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@140@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@140@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap _10@138@01)
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))))))) ret@139@01)))
; [eval] m_get_ok_u32__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0)) == 10
; [eval] m_get_ok_u32__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0)
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
; [eval] m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$(_1)
(push) ; 10
(pop) ; 10
; Joined path conditions
(assert (m_get_ok_u32__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@140@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@140@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap _10@138@01)
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))))))) ret@139@01)))
(pop) ; 9
; Joined path conditions
(assert (m_get_ok_u32__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@140@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@140@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap _10@138@01)
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))))))) ret@139@01)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($Snap.first $t@140@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@140@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01)))))
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap _10@138@01)
              ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))))))) ret@139@01))
  (and
    (m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@140@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@140@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap _10@138@01)
                ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))))))) ret@139@01))
    (m_get_ok_u32__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@140@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@140@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap _10@138@01)
                ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))))))) ret@139@01)))))
(assert (or
  (m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($Snap.first $t@140@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@140@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01)))))
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap _10@138@01)
              ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))))))) ret@139@01))
  (not
    (m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@140@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@140@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap _10@138@01)
                ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))))))) ret@139@01)))))
(push) ; 7
(assert (not (or
  (not
    (m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@140@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@140@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap _10@138@01)
                ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))))))) ret@139@01)))
  (=
    (m_get_ok_u32__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@140@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@140@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap _10@138@01)
                ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))))))) ret@139@01))
    10))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (or
  (not
    (m_is_ok__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@140@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@140@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap _10@138@01)
                ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))))))) ret@139@01)))
  (=
    (m_get_ok_u32__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@140@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@140@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap _10@138@01)
                ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))))))) ret@139@01))
    10)))
; [eval] !m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0)) || m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0)) == old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) && old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) > 10
; [eval] !m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0)
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
(assert (m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@140@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@140@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap _10@138@01)
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))))))) ret@139@01)))
(pop) ; 7
; Joined path conditions
(assert (m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@140@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@140@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap _10@138@01)
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))))))) ret@139@01)))
(push) ; 7
; [then-branch: 59 | !(m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_((First:($t@140@01), (_, (_, (First:(Second:(Second:(Second:($t@140@01)))), (First:(Second:(Second:(Second:(Second:($t@140@01))))), (_10@138@01, Second:(Second:(Second:(Second:(Second:(Second:($t@51@01)))))))))))), ret@139@01))) | live]
; [else-branch: 59 | m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_((First:($t@140@01), (_, (_, (First:(Second:(Second:(Second:($t@140@01)))), (First:(Second:(Second:(Second:(Second:($t@140@01))))), (_10@138@01, Second:(Second:(Second:(Second:(Second:(Second:($t@51@01)))))))))))), ret@139@01)) | live]
(push) ; 8
; [then-branch: 59 | !(m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_((First:($t@140@01), (_, (_, (First:(Second:(Second:(Second:($t@140@01)))), (First:(Second:(Second:(Second:(Second:($t@140@01))))), (_10@138@01, Second:(Second:(Second:(Second:(Second:(Second:($t@51@01)))))))))))), ret@139@01)))]
(assert (not
  (m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($Snap.first $t@140@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@140@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01)))))
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap _10@138@01)
              ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))))))) ret@139@01))))
(pop) ; 8
(push) ; 8
; [else-branch: 59 | m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_((First:($t@140@01), (_, (_, (First:(Second:(Second:(Second:($t@140@01)))), (First:(Second:(Second:(Second:(Second:($t@140@01))))), (_10@138@01, Second:(Second:(Second:(Second:(Second:(Second:($t@51@01)))))))))))), ret@139@01))]
(assert (m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@140@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@140@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap _10@138@01)
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))))))) ret@139@01)))
; [eval] m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0)) == old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) && old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) > 10
; [eval] m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0)) == old[pre]((unfolding acc(u32(_1), write) in _1.val_int))
; [eval] m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$(snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0))
; [eval] snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0)
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
; [eval] m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$(_1)
(push) ; 10
(pop) ; 10
; Joined path conditions
(assert (m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@140@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@140@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap _10@138@01)
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))))))) ret@139@01)))
(pop) ; 9
; Joined path conditions
(assert (m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
  ($Snap.first $t@140@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@140@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01)))))
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap _10@138@01)
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))))))) ret@139@01)))
; [eval] old[pre]((unfolding acc(u32(_1), write) in _1.val_int))
; [eval] (unfolding acc(u32(_1), write) in _1.val_int)
(push) ; 9
; [eval] 0 <= self.val_int
(pop) ; 9
; Joined path conditions
(push) ; 9
; [then-branch: 60 | m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_((First:($t@140@01), (_, (_, (First:(Second:(Second:(Second:($t@140@01)))), (First:(Second:(Second:(Second:(Second:($t@140@01))))), (_10@138@01, Second:(Second:(Second:(Second:(Second:(Second:($t@51@01)))))))))))), ret@139@01)) == First:($t@42@01) | live]
; [else-branch: 60 | m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_((First:($t@140@01), (_, (_, (First:(Second:(Second:(Second:($t@140@01)))), (First:(Second:(Second:(Second:(Second:($t@140@01))))), (_10@138@01, Second:(Second:(Second:(Second:(Second:(Second:($t@51@01)))))))))))), ret@139@01)) != First:($t@42@01) | live]
(push) ; 10
; [then-branch: 60 | m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_((First:($t@140@01), (_, (_, (First:(Second:(Second:(Second:($t@140@01)))), (First:(Second:(Second:(Second:(Second:($t@140@01))))), (_10@138@01, Second:(Second:(Second:(Second:(Second:(Second:($t@51@01)))))))))))), ret@139@01)) == First:($t@42@01)]
(assert (=
  (m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($Snap.first $t@140@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@140@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01)))))
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap _10@138@01)
              ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))))))) ret@139@01))
  ($SortWrappers.$SnapToInt ($Snap.first $t@42@01))))
; [eval] old[pre]((unfolding acc(u32(_1), write) in _1.val_int)) > 10
; [eval] old[pre]((unfolding acc(u32(_1), write) in _1.val_int))
; [eval] (unfolding acc(u32(_1), write) in _1.val_int)
(push) ; 11
; [eval] 0 <= self.val_int
(pop) ; 11
; Joined path conditions
(pop) ; 10
(push) ; 10
; [else-branch: 60 | m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$((_, _), snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_((First:($t@140@01), (_, (_, (First:(Second:(Second:(Second:($t@140@01)))), (First:(Second:(Second:(Second:(Second:($t@140@01))))), (_10@138@01, Second:(Second:(Second:(Second:(Second:(Second:($t@51@01)))))))))))), ret@139@01)) != First:($t@42@01)]
(assert (not
  (=
    (m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@140@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@140@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap _10@138@01)
                ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))))))) ret@139@01))
    ($SortWrappers.$SnapToInt ($Snap.first $t@42@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (=
      (m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
        ($Snap.first $t@140@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@140@01))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01)))))
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap _10@138@01)
                  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))))))) ret@139@01))
      ($SortWrappers.$SnapToInt ($Snap.first $t@42@01))))
  (=
    (m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@140@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@140@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap _10@138@01)
                ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))))))) ret@139@01))
    ($SortWrappers.$SnapToInt ($Snap.first $t@42@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($Snap.first $t@140@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@140@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01)))))
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap _10@138@01)
              ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))))))) ret@139@01))
  (and
    (m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@140@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@140@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap _10@138@01)
                ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))))))) ret@139@01))
    (m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$%precondition ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@140@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@140@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap _10@138@01)
                ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))))))) ret@139@01))
    (or
      (not
        (=
          (m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
            ($Snap.first $t@140@01)
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@140@01))))
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01)))))
                    ($Snap.combine
                      ($SortWrappers.$RefTo$Snap _10@138@01)
                      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))))))) ret@139@01))
          ($SortWrappers.$SnapToInt ($Snap.first $t@42@01))))
      (=
        (m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
          ($Snap.first $t@140@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@140@01))))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01)))))
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap _10@138@01)
                    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))))))) ret@139@01))
        ($SortWrappers.$SnapToInt ($Snap.first $t@42@01)))))))
(assert (or
  (m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
    ($Snap.first $t@140@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@140@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01)))))
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap _10@138@01)
              ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))))))) ret@139@01))
  (not
    (m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@140@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@140@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap _10@138@01)
                ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))))))) ret@139@01)))))
(push) ; 7
(assert (not (or
  (not
    (m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@140@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@140@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap _10@138@01)
                ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))))))) ret@139@01)))
  (and
    (> ($SortWrappers.$SnapToInt ($Snap.first $t@42@01)) 10)
    (=
      (m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
        ($Snap.first $t@140@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@140@01))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01)))))
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap _10@138@01)
                  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))))))) ret@139@01))
      ($SortWrappers.$SnapToInt ($Snap.first $t@42@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (or
  (not
    (m_is_err__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$bool$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
      ($Snap.first $t@140@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@140@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01)))))
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap _10@138@01)
                ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))))))) ret@139@01)))
  (and
    (> ($SortWrappers.$SnapToInt ($Snap.first $t@42@01)) 10)
    (=
      (m_get_err_value__$TY$__u32$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_$Snap$m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_ ($Snap.combine
        ($Snap.first $t@140@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@140@01))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@140@01)))))
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap _10@138@01)
                  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@51@01)))))))))))) ret@139@01))
      ($SortWrappers.$SnapToInt ($Snap.first $t@42@01))))))
; [exec]
; assert true
; [exec]
; exhale acc(m_std$$result$$Result$_beg_$u32$_sep_$struct$m_UnexpectedValue$_end_(_0), write)
; [exec]
; label end_of_method
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 54 | _9@55@01 == 0]
(assert (= _9@55@01 0))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- builtin$havoc_bool ----------
(declare-const ret@142@01 Bool)
(declare-const ret@143@01 Bool)
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
(declare-const ret@144@01 Int)
(declare-const ret@145@01 Int)
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
(declare-const ret@146@01 $Ref)
(declare-const ret@147@01 $Ref)
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
