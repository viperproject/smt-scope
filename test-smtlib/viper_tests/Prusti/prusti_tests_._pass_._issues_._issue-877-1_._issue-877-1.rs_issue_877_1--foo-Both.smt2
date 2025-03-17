(get-info :version)
; (:version "4.12.1")
; Started: 2023-10-31 14:17:15
; Silicon.version: 1.1-SNAPSHOT (46944a65@dspil_symbenchmarking)
; Input file: /home/pcorrect/repos/benchmarking_general/silicon_tests/prusti_tests_._pass_._issues_._issue-877-1_._issue-877-1.rs_issue_877_1--foo-Both.vpr
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
(declare-sort Seq<Int> 0)
(declare-sort Snap$Array$3$usize 0)
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
(declare-fun $SortWrappers.Seq<Int>To$Snap (Seq<Int>) $Snap)
(declare-fun $SortWrappers.$SnapToSeq<Int> ($Snap) Seq<Int>)
(assert (forall ((x Seq<Int>)) (!
    (= x ($SortWrappers.$SnapToSeq<Int>($SortWrappers.Seq<Int>To$Snap x)))
    :pattern (($SortWrappers.Seq<Int>To$Snap x))
    :qid |$Snap.$SnapToSeq<Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Seq<Int>To$Snap($SortWrappers.$SnapToSeq<Int> x)))
    :pattern (($SortWrappers.$SnapToSeq<Int> x))
    :qid |$Snap.Seq<Int>To$SnapToSeq<Int>|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.Snap$Array$3$usizeTo$Snap (Snap$Array$3$usize) $Snap)
(declare-fun $SortWrappers.$SnapToSnap$Array$3$usize ($Snap) Snap$Array$3$usize)
(assert (forall ((x Snap$Array$3$usize)) (!
    (= x ($SortWrappers.$SnapToSnap$Array$3$usize($SortWrappers.Snap$Array$3$usizeTo$Snap x)))
    :pattern (($SortWrappers.Snap$Array$3$usizeTo$Snap x))
    :qid |$Snap.$SnapToSnap$Array$3$usizeTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Snap$Array$3$usizeTo$Snap($SortWrappers.$SnapToSnap$Array$3$usize x)))
    :pattern (($SortWrappers.$SnapToSnap$Array$3$usize x))
    :qid |$Snap.Snap$Array$3$usizeTo$SnapToSnap$Array$3$usize|
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
(declare-fun Seq_length (Seq<Int>) Int)
(declare-const Seq_empty Seq<Int>)
(declare-fun Seq_singleton (Int) Seq<Int>)
(declare-fun Seq_build (Seq<Int> Int) Seq<Int>)
(declare-fun Seq_index (Seq<Int> Int) Int)
(declare-fun Seq_append (Seq<Int> Seq<Int>) Seq<Int>)
(declare-fun Seq_update (Seq<Int> Int Int) Seq<Int>)
(declare-fun Seq_contains (Seq<Int> Int) Bool)
(declare-fun Seq_take (Seq<Int> Int) Seq<Int>)
(declare-fun Seq_drop (Seq<Int> Int) Seq<Int>)
(declare-fun Seq_equal (Seq<Int> Seq<Int>) Bool)
(declare-fun Seq_sameuntil (Seq<Int> Seq<Int> Int) Bool)
(declare-fun Seq_range (Int Int) Seq<Int>)
(declare-fun cons$Snap$Array$3$usize$__$TY$__Seq$$int$$Snap$Array$3$usize<Snap$Array$3$usize> (Seq<Int>) Snap$Array$3$usize)
(declare-fun uncons$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$Seq$$int$<Seq<Int>> (Snap$Array$3$usize) Seq<Int>)
(declare-fun read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$<Int> (Snap$Array$3$usize Int) Int)
; Declaring symbols related to program functions (from program analysis)
(declare-fun read$ ($Snap) $Perm)
(declare-fun read$%limited ($Snap) $Perm)
(declare-const read$%stateless Bool)
(declare-fun read$%precondition ($Snap) Bool)
(declare-fun lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$ ($Snap $Ref Int) Int)
(declare-fun lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$%limited ($Snap $Ref Int) Int)
(declare-fun lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$%stateless ($Ref Int) Bool)
(declare-fun lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$%precondition ($Snap $Ref Int) Bool)
(declare-fun seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$ ($Snap $Ref Int) Seq<Int>)
(declare-fun seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$%limited ($Snap $Ref Int) Seq<Int>)
(declare-fun seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$%stateless ($Ref Int) Bool)
(declare-fun seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$%precondition ($Snap $Ref Int) Bool)
(declare-fun snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize ($Snap $Ref) Snap$Array$3$usize)
(declare-fun snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%limited ($Snap $Ref) Snap$Array$3$usize)
(declare-fun snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%stateless ($Ref) Bool)
(declare-fun snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun Array$3$usize%trigger ($Snap $Ref) Bool)
(declare-fun DeadBorrowToken$%trigger ($Snap Int) Bool)
(declare-fun usize%trigger ($Snap $Ref) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((s Seq<Int>)) (!
  (<= 0 (Seq_length s))
  :pattern ((Seq_length s))
  :qid |$Seq[Int]_prog.seq_length_non_negative|)))
(assert (= (Seq_length (as Seq_empty  Seq<Int>)) 0))
(assert (forall ((s Seq<Int>)) (!
  (=> (= (Seq_length s) 0) (= s (as Seq_empty  Seq<Int>)))
  :pattern ((Seq_length s))
  :qid |$Seq[Int]_prog.only_empty_seq_length_zero|)))
(assert (forall ((e Int)) (!
  (= (Seq_length (Seq_singleton e)) 1)
  :pattern ((Seq_length (Seq_singleton e)))
  :qid |$Seq[Int]_prog.length_singleton_seq|)))
(assert (forall ((s Seq<Int>) (e Int)) (!
  (= (Seq_length (Seq_build s e)) (+ 1 (Seq_length s)))
  :pattern ((Seq_length (Seq_build s e)))
  :qid |$Seq[Int]_prog.length_seq_build_inc_by_one|)))
(assert (forall ((s Seq<Int>) (i Int) (e Int)) (!
  (ite
    (= i (Seq_length s))
    (= (Seq_index (Seq_build s e) i) e)
    (= (Seq_index (Seq_build s e) i) (Seq_index s i)))
  :pattern ((Seq_index (Seq_build s e) i))
  :qid |$Seq[Int]_prog.seq_index_over_build|)))
(assert (forall ((s1 Seq<Int>) (s2 Seq<Int>)) (!
  (=>
    (and
      (not (= s1 (as Seq_empty  Seq<Int>)))
      (not (= s2 (as Seq_empty  Seq<Int>))))
    (= (Seq_length (Seq_append s1 s2)) (+ (Seq_length s1) (Seq_length s2))))
  :pattern ((Seq_length (Seq_append s1 s2)))
  :qid |$Seq[Int]_prog.seq_length_over_append|)))
(assert (forall ((e Int)) (!
  (= (Seq_index (Seq_singleton e) 0) e)
  :pattern ((Seq_singleton e))
  :qid |$Seq[Int]_prog.seq_index_over_singleton|)))
(assert (forall ((e1 Int) (e2 Int)) (!
  (= (Seq_contains (Seq_singleton e1) e2) (= e1 e2))
  :pattern ((Seq_contains (Seq_singleton e1) e2))
  :qid |$Seq[Int]_prog.seq_contains_over_singleton|)))
(assert (forall ((s Seq<Int>)) (!
  (= (Seq_append (as Seq_empty  Seq<Int>) s) s)
  :pattern ((Seq_append (as Seq_empty  Seq<Int>) s))
  :qid |$Seq[Int]_prog.seq_append_empty_left|)))
(assert (forall ((s Seq<Int>)) (!
  (= (Seq_append s (as Seq_empty  Seq<Int>)) s)
  :pattern ((Seq_append s (as Seq_empty  Seq<Int>)))
  :qid |$Seq[Int]_prog.seq_append_empty_right|)))
(assert (forall ((s1 Seq<Int>) (s2 Seq<Int>) (i Int)) (!
  (=>
    (and
      (not (= s1 (as Seq_empty  Seq<Int>)))
      (not (= s2 (as Seq_empty  Seq<Int>))))
    (ite
      (< i (Seq_length s1))
      (= (Seq_index (Seq_append s1 s2) i) (Seq_index s1 i))
      (= (Seq_index (Seq_append s1 s2) i) (Seq_index s2 (- i (Seq_length s1))))))
  :pattern ((Seq_index (Seq_append s1 s2) i))
  :pattern ((Seq_index s1 i) (Seq_append s1 s2))
  :qid |$Seq[Int]_prog.seq_index_over_append|)))
(assert (forall ((s Seq<Int>) (i Int) (e Int)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (= (Seq_length (Seq_update s i e)) (Seq_length s)))
  :pattern ((Seq_length (Seq_update s i e)))
  :qid |$Seq[Int]_prog.seq_length_invariant_over_update|)))
(assert (forall ((s Seq<Int>) (i Int) (e Int) (j Int)) (!
  (ite
    (=> (and (<= 0 i) (< i (Seq_length s))) (= i j))
    (= (Seq_index (Seq_update s i e) j) e)
    (= (Seq_index (Seq_update s i e) j) (Seq_index s j)))
  :pattern ((Seq_index (Seq_update s i e) j))
  :qid |$Seq[Int]_prog.seq_index_over_update|)))
(assert (forall ((s Seq<Int>) (e Int)) (!
  (=
    (Seq_contains s e)
    (exists ((i Int)) (!
      (and (<= 0 i) (and (< i (Seq_length s)) (= (Seq_index s i) e)))
      :pattern ((Seq_index s i))
      )))
  :pattern ((Seq_contains s e))
  :qid |$Seq[Int]_prog.seq_element_contains_index_exists|)))
(assert (forall ((e Int)) (!
  (not (Seq_contains (as Seq_empty  Seq<Int>) e))
  :pattern ((Seq_contains (as Seq_empty  Seq<Int>) e))
  :qid |$Seq[Int]_prog.empty_seq_contains_nothing|)))
(assert (forall ((s1 Seq<Int>) (s2 Seq<Int>) (e Int)) (!
  (=
    (Seq_contains (Seq_append s1 s2) e)
    (or (Seq_contains s1 e) (Seq_contains s2 e)))
  :pattern ((Seq_contains (Seq_append s1 s2) e))
  :qid |$Seq[Int]_prog.seq_contains_over_append|)))
(assert (forall ((s Seq<Int>) (e1 Int) (e2 Int)) (!
  (= (Seq_contains (Seq_build s e1) e2) (or (= e1 e2) (Seq_contains s e2)))
  :pattern ((Seq_contains (Seq_build s e1) e2))
  :qid |$Seq[Int]_prog.seq_contains_over_build|)))
(assert (forall ((s Seq<Int>) (n Int)) (!
  (=> (<= n 0) (= (Seq_take s n) (as Seq_empty  Seq<Int>)))
  :pattern ((Seq_take s n))
  :qid |$Seq[Int]_prog.seq_take_negative_length|)))
(assert (forall ((s Seq<Int>) (n Int) (e Int)) (!
  (=
    (Seq_contains (Seq_take s n) e)
    (exists ((i Int)) (!
      (and
        (<= 0 i)
        (and (< i n) (and (< i (Seq_length s)) (= (Seq_index s i) e))))
      :pattern ((Seq_index s i))
      )))
  :pattern ((Seq_contains (Seq_take s n) e))
  :qid |$Seq[Int]_prog.seq_contains_over_take_index_exists|)))
(assert (forall ((s Seq<Int>) (n Int)) (!
  (=> (<= n 0) (= (Seq_drop s n) s))
  :pattern ((Seq_drop s n))
  :qid |$Seq[Int]_prog.seq_drop_negative_length|)))
(assert (forall ((s Seq<Int>) (n Int) (e Int)) (!
  (=
    (Seq_contains (Seq_drop s n) e)
    (exists ((i Int)) (!
      (and
        (<= 0 i)
        (and (<= n i) (and (< i (Seq_length s)) (= (Seq_index s i) e))))
      :pattern ((Seq_index s i))
      )))
  :pattern ((Seq_contains (Seq_drop s n) e))
  :qid |$Seq[Int]_prog.seq_contains_over_drop_index_exists|)))
(assert (forall ((s1 Seq<Int>) (s2 Seq<Int>)) (!
  (=
    (Seq_equal s1 s2)
    (and
      (= (Seq_length s1) (Seq_length s2))
      (forall ((i Int)) (!
        (=>
          (and (<= 0 i) (< i (Seq_length s1)))
          (= (Seq_index s1 i) (Seq_index s2 i)))
        :pattern ((Seq_index s1 i))
        :pattern ((Seq_index s2 i))
        ))))
  :pattern ((Seq_equal s1 s2))
  :qid |$Seq[Int]_prog.extensional_seq_equality|)))
(assert (forall ((s1 Seq<Int>) (s2 Seq<Int>)) (!
  (=> (Seq_equal s1 s2) (= s1 s2))
  :pattern ((Seq_equal s1 s2))
  :qid |$Seq[Int]_prog.seq_equality_identity|)))
(assert (forall ((s1 Seq<Int>) (s2 Seq<Int>) (n Int)) (!
  (=
    (Seq_sameuntil s1 s2 n)
    (forall ((i Int)) (!
      (=> (and (<= 0 i) (< i n)) (= (Seq_index s1 i) (Seq_index s2 i)))
      :pattern ((Seq_index s1 i))
      :pattern ((Seq_index s2 i))
      )))
  :pattern ((Seq_sameuntil s1 s2 n))
  :qid |$Seq[Int]_prog.extensional_seq_equality_prefix|)))
(assert (forall ((s Seq<Int>) (n Int)) (!
  (=>
    (<= 0 n)
    (ite
      (<= n (Seq_length s))
      (= (Seq_length (Seq_take s n)) n)
      (= (Seq_length (Seq_take s n)) (Seq_length s))))
  :pattern ((Seq_length (Seq_take s n)))
  :qid |$Seq[Int]_prog.seq_length_over_take|)))
(assert (forall ((s Seq<Int>) (n Int) (i Int)) (!
  (=>
    (and (<= 0 i) (and (< i n) (< i (Seq_length s))))
    (= (Seq_index (Seq_take s n) i) (Seq_index s i)))
  :pattern ((Seq_index (Seq_take s n) i))
  :pattern ((Seq_index s i) (Seq_take s n))
  :qid |$Seq[Int]_prog.seq_index_over_take|)))
(assert (forall ((s Seq<Int>) (n Int)) (!
  (=>
    (<= 0 n)
    (ite
      (<= n (Seq_length s))
      (= (Seq_length (Seq_drop s n)) (- (Seq_length s) n))
      (= (Seq_length (Seq_drop s n)) 0)))
  :pattern ((Seq_length (Seq_drop s n)))
  :qid |$Seq[Int]_prog.seq_length_over_drop|)))
(assert (forall ((s Seq<Int>) (n Int) (i Int)) (!
  (=>
    (and (<= 0 n) (and (<= 0 i) (< i (- (Seq_length s) n))))
    (= (Seq_index (Seq_drop s n) i) (Seq_index s (+ i n))))
  :pattern ((Seq_index (Seq_drop s n) i))
  :qid |$Seq[Int]_prog.seq_index_over_drop_1|)))
(assert (forall ((s Seq<Int>) (n Int) (i Int)) (!
  (=>
    (and (<= 0 n) (and (<= n i) (< i (Seq_length s))))
    (= (Seq_index (Seq_drop s n) (- i n)) (Seq_index s i)))
  :pattern ((Seq_index s i) (Seq_drop s n))
  :qid |$Seq[Int]_prog.seq_index_over_drop_2|)))
(assert (forall ((s Seq<Int>) (i Int) (e Int) (n Int)) (!
  (=>
    (and (<= 0 i) (and (< i n) (< n (Seq_length s))))
    (= (Seq_take (Seq_update s i e) n) (Seq_update (Seq_take s n) i e)))
  :pattern ((Seq_take (Seq_update s i e) n))
  :qid |$Seq[Int]_prog.seq_take_over_update_1|)))
(assert (forall ((s Seq<Int>) (i Int) (e Int) (n Int)) (!
  (=>
    (and (<= n i) (< i (Seq_length s)))
    (= (Seq_take (Seq_update s i e) n) (Seq_take s n)))
  :pattern ((Seq_take (Seq_update s i e) n))
  :qid |$Seq[Int]_prog.seq_take_over_update_2|)))
(assert (forall ((s Seq<Int>) (i Int) (e Int) (n Int)) (!
  (=>
    (and (<= 0 n) (and (<= n i) (< i (Seq_length s))))
    (= (Seq_drop (Seq_update s i e) n) (Seq_update (Seq_drop s n) (- i n) e)))
  :pattern ((Seq_drop (Seq_update s i e) n))
  :qid |$Seq[Int]_prog.seq_drop_over_update_1|)))
(assert (forall ((s Seq<Int>) (i Int) (e Int) (n Int)) (!
  (=>
    (and (<= 0 i) (and (< i n) (< n (Seq_length s))))
    (= (Seq_drop (Seq_update s i e) n) (Seq_drop s n)))
  :pattern ((Seq_drop (Seq_update s i e) n))
  :qid |$Seq[Int]_prog.seq_drop_over_update_2|)))
(assert (forall ((s Seq<Int>) (e Int) (n Int)) (!
  (=>
    (and (<= 0 n) (<= n (Seq_length s)))
    (= (Seq_drop (Seq_build s e) n) (Seq_build (Seq_drop s n) e)))
  :pattern ((Seq_drop (Seq_build s e) n))
  :qid |$Seq[Int]_prog.seq_drop_over_build|)))
(assert (forall ((min_ Int) (max Int)) (!
  (ite
    (< min_ max)
    (= (Seq_length (Seq_range min_ max)) (- max min_))
    (= (Seq_length (Seq_range min_ max)) 0))
  :pattern ((Seq_length (Seq_range min_ max)))
  :qid |$Seq[Int]_prog.ranged_seq_length|)))
(assert (forall ((min_ Int) (max Int) (i Int)) (!
  (=>
    (and (<= 0 i) (< i (- max min_)))
    (= (Seq_index (Seq_range min_ max) i) (+ min_ i)))
  :pattern ((Seq_index (Seq_range min_ max) i))
  :qid |$Seq[Int]_prog.ranged_seq_index|)))
(assert (forall ((min_ Int) (max Int) (e Int)) (!
  (= (Seq_contains (Seq_range min_ max) e) (and (<= min_ e) (< e max)))
  :pattern ((Seq_contains (Seq_range min_ max) e))
  :qid |$Seq[Int]_prog.ranged_seq_contains|)))
(assert (forall ((data Seq<Int>)) (!
  (Seq_equal
    (uncons$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$Seq$$int$<Seq<Int>> (cons$Snap$Array$3$usize$__$TY$__Seq$$int$$Snap$Array$3$usize<Snap$Array$3$usize> data))
    data)
  :pattern ((cons$Snap$Array$3$usize$__$TY$__Seq$$int$$Snap$Array$3$usize<Snap$Array$3$usize> data))
  :qid |prog.Snap$Array$3$usize$injectivity|)))
(assert (forall ((data Snap$Array$3$usize)) (!
  (=
    (cons$Snap$Array$3$usize$__$TY$__Seq$$int$$Snap$Array$3$usize<Snap$Array$3$usize> (uncons$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$Seq$$int$<Seq<Int>> data))
    data)
  :pattern ((uncons$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$Seq$$int$<Seq<Int>> data))
  :qid |prog.Snap$Array$3$usize$surjectivity|)))
(assert (forall ((_l_data Seq<Int>) (_r_data Seq<Int>)) (!
  (=>
    (Seq_equal _l_data _r_data)
    (=
      (cons$Snap$Array$3$usize$__$TY$__Seq$$int$$Snap$Array$3$usize<Snap$Array$3$usize> _l_data)
      (cons$Snap$Array$3$usize$__$TY$__Seq$$int$$Snap$Array$3$usize<Snap$Array$3$usize> _r_data)))
  :pattern ((cons$Snap$Array$3$usize$__$TY$__Seq$$int$$Snap$Array$3$usize<Snap$Array$3$usize> _l_data) (cons$Snap$Array$3$usize$__$TY$__Seq$$int$$Snap$Array$3$usize<Snap$Array$3$usize> _r_data))
  :qid |prog.Snap$Array$3$usize$extensionality|)))
(assert (forall ((data Seq<Int>) (idx Int)) (!
  (=
    (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$<Int> (cons$Snap$Array$3$usize$__$TY$__Seq$$int$$Snap$Array$3$usize<Snap$Array$3$usize> data) idx)
    (Seq_index data idx))
  :pattern ((read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$<Int> (cons$Snap$Array$3$usize$__$TY$__Seq$$int$$Snap$Array$3$usize<Snap$Array$3$usize> data) idx))
  :pattern ((Seq_index data idx))
  :qid |prog.Array$3$usize$read_indices|)))
(assert (forall ((self Snap$Array$3$usize) (idx Int)) (!
  (and
    (<=
      0
      (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$<Int> self idx))
    (<=
      (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$<Int> self idx)
      18446744073709551615))
  :pattern ((read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$<Int> self idx))
  :qid |prog.Snap$Array$3$usize$valid|)))
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
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap)) (!
  (let ((result@0@00 (read$%limited s@$))) true)
  :pattern ((read$%limited s@$))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap)) (!
  (let ((result@0@00 (read$%limited s@$))) true)
  :pattern ((read$%limited s@$))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (self@1@00 $Ref) (idx@2@00 Int)) (!
  (=
    (lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$%limited s@$ self@1@00 idx@2@00)
    (lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$ s@$ self@1@00 idx@2@00))
  :pattern ((lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$ s@$ self@1@00 idx@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (self@1@00 $Ref) (idx@2@00 Int)) (!
  (lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$%stateless self@1@00 idx@2@00)
  :pattern ((lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$%limited s@$ self@1@00 idx@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (self@4@00 $Ref) (start@5@00 Int)) (!
  (Seq_equal
    (seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$%limited s@$ self@4@00 start@5@00)
    (seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$ s@$ self@4@00 start@5@00))
  :pattern ((seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$ s@$ self@4@00 start@5@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (self@4@00 $Ref) (start@5@00 Int)) (!
  (seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$%stateless self@4@00 start@5@00)
  :pattern ((seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$%limited s@$ self@4@00 start@5@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (self@4@00 $Ref) (start@5@00 Int)) (!
  (let ((result@6@00 (seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$%limited s@$ self@4@00 start@5@00))) (=>
    (seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$%precondition s@$ self@4@00 start@5@00)
    (and
      (=> (>= start@5@00 3) (Seq_equal result@6@00 (as Seq_empty  Seq<Int>)))
      (=> (< start@5@00 3) (= (Seq_length result@6@00) (- 3 start@5@00)))
      (=>
        (< start@5@00 3)
        (=
          (Seq_index result@6@00 0)
          (lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$ ($Snap.combine
            ($Snap.first s@$)
            ($Snap.combine $Snap.unit $Snap.unit)) self@4@00 start@5@00)))
      (=>
        (< start@5@00 3)
        (forall ((i Int) (j Int)) (!
          (=>
            (and
              (<= start@5@00 i)
              (and
                (< i 3)
                (and
                  (<= 0 j)
                  (and (< j (- 3 start@5@00)) (= i (+ j start@5@00))))))
            (=
              (lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$ ($Snap.combine
                ($Snap.first s@$)
                ($Snap.combine $Snap.unit $Snap.unit)) self@4@00 i)
              (Seq_index result@6@00 j)))
          :pattern ((lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$%limited ($Snap.combine
            ($Snap.first s@$)
            ($Snap.combine $Snap.unit $Snap.unit)) self@4@00 i) (Seq_index
            result@6@00
            j))
          ))))))
  :pattern ((seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$%limited s@$ self@4@00 start@5@00))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap) (self@4@00 $Ref) (start@5@00 Int)) (!
  (let ((result@6@00 (seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$%limited s@$ self@4@00 start@5@00))) true)
  :pattern ((seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$%limited s@$ self@4@00 start@5@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (self@4@00 $Ref) (start@5@00 Int)) (!
  (let ((result@6@00 (seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$%limited s@$ self@4@00 start@5@00))) true)
  :pattern ((seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$%limited s@$ self@4@00 start@5@00))
  :qid |quant-u-13|)))
(assert (forall ((s@$ $Snap) (self@4@00 $Ref) (start@5@00 Int)) (!
  (let ((result@6@00 (seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$%limited s@$ self@4@00 start@5@00))) (=>
    (and
      (seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$%precondition s@$ self@4@00 start@5@00)
      (< start@5@00 3))
    (lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$%precondition ($Snap.combine
      ($Snap.first s@$)
      ($Snap.combine $Snap.unit $Snap.unit)) self@4@00 start@5@00)))
  :pattern ((seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$%limited s@$ self@4@00 start@5@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (self@4@00 $Ref) (start@5@00 Int)) (!
  (let ((result@6@00 (seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$%limited s@$ self@4@00 start@5@00))) (=>
    (and
      (seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$%precondition s@$ self@4@00 start@5@00)
      (< start@5@00 3))
    (forall ((i Int) (j Int)) (!
      (=>
        (and
          (<= start@5@00 i)
          (and
            (< i 3)
            (and (<= 0 j) (and (< j (- 3 start@5@00)) (= i (+ j start@5@00))))))
        (lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$%precondition ($Snap.combine
          ($Snap.first s@$)
          ($Snap.combine $Snap.unit $Snap.unit)) self@4@00 i))
      :pattern ((lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$%limited ($Snap.combine
        ($Snap.first s@$)
        ($Snap.combine $Snap.unit $Snap.unit)) self@4@00 i) (Seq_index
        result@6@00
        j))
      ))))
  :pattern ((seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$%limited s@$ self@4@00 start@5@00))
  :qid |quant-u-15|)))
(assert (forall ((s@$ $Snap) (self@4@00 $Ref) (start@5@00 Int)) (!
  (=>
    (seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$%precondition s@$ self@4@00 start@5@00)
    (Seq_equal
      (seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$ s@$ self@4@00 start@5@00)
      (ite
        (>= start@5@00 3)
        (as Seq_empty  Seq<Int>)
        (Seq_append
          (Seq_singleton (lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$ ($Snap.combine
            ($Snap.first s@$)
            ($Snap.combine $Snap.unit $Snap.unit)) self@4@00 start@5@00))
          (seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$%limited ($Snap.combine
            ($Snap.first s@$)
            $Snap.unit) self@4@00 (+ start@5@00 1))))))
  :pattern ((seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$ s@$ self@4@00 start@5@00))
  :qid |quant-u-16|)))
(assert (forall ((s@$ $Snap) (self@4@00 $Ref) (start@5@00 Int)) (!
  (=>
    (seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$%precondition s@$ self@4@00 start@5@00)
    (ite
      (>= start@5@00 3)
      true
      (and
        (lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$%precondition ($Snap.combine
          ($Snap.first s@$)
          ($Snap.combine $Snap.unit $Snap.unit)) self@4@00 start@5@00)
        (seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$%precondition ($Snap.combine
          ($Snap.first s@$)
          $Snap.unit) self@4@00 (+ start@5@00 1)))))
  :pattern ((seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$ s@$ self@4@00 start@5@00))
  :qid |quant-u-17|)))
(assert (forall ((s@$ $Snap) (self@7@00 $Ref)) (!
  (=
    (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%limited s@$ self@7@00)
    (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize s@$ self@7@00))
  :pattern ((snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize s@$ self@7@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (self@7@00 $Ref)) (!
  (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%stateless self@7@00)
  :pattern ((snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%limited s@$ self@7@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (self@7@00 $Ref)) (!
  (let ((result@8@00 (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%limited s@$ self@7@00))) (=>
    (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition s@$ self@7@00)
    (forall ((i Int)) (!
      (=>
        (and (<= 0 i) (< i 3))
        (=
          (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$<Int> result@8@00 i)
          (lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$ ($Snap.combine
            s@$
            ($Snap.combine $Snap.unit $Snap.unit)) self@7@00 i)))
      :pattern ((read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$<Int> result@8@00 i))
      :pattern ((lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$%limited ($Snap.combine
        s@$
        ($Snap.combine $Snap.unit $Snap.unit)) self@7@00 i))
      ))))
  :pattern ((snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%limited s@$ self@7@00))
  :qid |quant-u-18|)))
(assert (forall ((s@$ $Snap) (self@7@00 $Ref)) (!
  (let ((result@8@00 (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%limited s@$ self@7@00))) (=>
    (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition s@$ self@7@00)
    (forall ((i Int)) (!
      (=>
        (and (<= 0 i) (< i 3))
        (lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$%precondition ($Snap.combine
          s@$
          ($Snap.combine $Snap.unit $Snap.unit)) self@7@00 i))
      :pattern ((read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$<Int> result@8@00 i))
      :pattern ((lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$%limited ($Snap.combine
        s@$
        ($Snap.combine $Snap.unit $Snap.unit)) self@7@00 i))
      ))))
  :pattern ((snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%limited s@$ self@7@00))
  :qid |quant-u-19|)))
(assert (forall ((s@$ $Snap) (self@7@00 $Ref)) (!
  (=>
    (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition s@$ self@7@00)
    (=
      (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize s@$ self@7@00)
      (cons$Snap$Array$3$usize$__$TY$__Seq$$int$$Snap$Array$3$usize<Snap$Array$3$usize> (seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$ ($Snap.combine
        s@$
        $Snap.unit) self@7@00 0))))
  :pattern ((snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize s@$ self@7@00))
  :qid |quant-u-20|)))
(assert (forall ((s@$ $Snap) (self@7@00 $Ref)) (!
  (=>
    (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition s@$ self@7@00)
    (seq_collect$Array$3$usize$__$TY$__Array$3$usize$$int$$Seq$$int$%precondition ($Snap.combine
      s@$
      $Snap.unit) self@7@00 0))
  :pattern ((snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize s@$ self@7@00))
  :qid |quant-u-21|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- m_foo ----------
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
; var __t26: Int
(declare-const __t26@28@01 Int)
; [exec]
; var __t27: Bool
(declare-const __t27@29@01 Bool)
; [exec]
; var __t28: Bool
(declare-const __t28@30@01 Bool)
; [exec]
; var __t29: Ref
(declare-const __t29@31@01 $Ref)
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
; var __t34: Int
(declare-const __t34@36@01 Int)
; [exec]
; var _1: Ref
(declare-const _1@37@01 $Ref)
; [exec]
; var _2: Ref
(declare-const _2@38@01 $Ref)
; [exec]
; var _5: Ref
(declare-const _5@39@01 $Ref)
; [exec]
; var _6: Int
(declare-const _6@40@01 Int)
; [exec]
; var _8: Ref
(declare-const _8@41@01 $Ref)
; [exec]
; var _12: Ref
(declare-const _12@42@01 $Ref)
; [exec]
; var _17: Ref
(declare-const _17@43@01 $Ref)
; [exec]
; var _22: Ref
(declare-const _22@44@01 $Ref)
; [exec]
; var _26: Ref
(declare-const _26@45@01 $Ref)
; [exec]
; var _27: Int
(declare-const _27@46@01 Int)
; [exec]
; var _28: Int
(declare-const _28@47@01 Int)
; [exec]
; var _29: Int
(declare-const _29@48@01 Int)
; [exec]
; var _30: Ref
(declare-const _30@49@01 $Ref)
; [exec]
; var _31: Ref
(declare-const _31@50@01 $Ref)
; [exec]
; var _32: Ref
(declare-const _32@51@01 $Ref)
; [exec]
; var _33: Int
(declare-const _33@52@01 Int)
; [exec]
; var _34: Int
(declare-const _34@53@01 Int)
; [exec]
; var _35: Ref
(declare-const _35@54@01 $Ref)
; [exec]
; var _36: Ref
(declare-const _36@55@01 $Ref)
; [exec]
; var _40: Int
(declare-const _40@56@01 Int)
; [exec]
; var _41: Int
(declare-const _41@57@01 Int)
; [exec]
; var _42: Ref
(declare-const _42@58@01 $Ref)
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
; label pre
; [exec]
; __t0 := true
; [exec]
; _1 := builtin$havoc_ref()
(declare-const ret@59@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(Array$3$usize(_1), write)
(declare-const $t@60@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$(_1,
;   0) ==
;   1
(declare-const $t@61@01 $Snap)
(assert (= $t@61@01 $Snap.unit))
; [eval] lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$(_1, 0) == 1
; [eval] lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$(_1, 0)
(set-option :timeout 0)
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
; [eval] 0 <= idx
; [eval] idx < 3
(assert (lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$%precondition ($Snap.combine
  $t@60@01
  ($Snap.combine $Snap.unit $Snap.unit)) ret@59@01 0))
(pop) ; 3
; Joined path conditions
(assert (and
  (read$%precondition $Snap.unit)
  (<= $Perm.No (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))))
  (lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$%precondition ($Snap.combine
    $t@60@01
    ($Snap.combine $Snap.unit $Snap.unit)) ret@59@01 0)))
(assert (=
  (lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$ ($Snap.combine
    $t@60@01
    ($Snap.combine $Snap.unit $Snap.unit)) ret@59@01 0)
  1))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$(_1,
;   1) ==
;   2
(declare-const $t@62@01 $Snap)
(assert (= $t@62@01 $Snap.unit))
; [eval] lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$(_1, 1) == 2
; [eval] lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$(_1, 1)
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
; [eval] 0 <= idx
; [eval] idx < 3
(assert (lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$%precondition ($Snap.combine
  $t@60@01
  ($Snap.combine $Snap.unit $Snap.unit)) ret@59@01 1))
(pop) ; 3
; Joined path conditions
(assert (lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$%precondition ($Snap.combine
  $t@60@01
  ($Snap.combine $Snap.unit $Snap.unit)) ret@59@01 1))
(assert (=
  (lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$ ($Snap.combine
    $t@60@01
    ($Snap.combine $Snap.unit $Snap.unit)) ret@59@01 1)
  2))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$(_1,
;   2) ==
;   3
(declare-const $t@63@01 $Snap)
(assert (= $t@63@01 $Snap.unit))
; [eval] lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$(_1, 2) == 3
; [eval] lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$(_1, 2)
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
; [eval] 0 <= idx
; [eval] idx < 3
(assert (lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$%precondition ($Snap.combine
  $t@60@01
  ($Snap.combine $Snap.unit $Snap.unit)) ret@59@01 2))
(pop) ; 3
; Joined path conditions
(assert (lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$%precondition ($Snap.combine
  $t@60@01
  ($Snap.combine $Snap.unit $Snap.unit)) ret@59@01 2))
(assert (=
  (lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$ ($Snap.combine
    $t@60@01
    ($Snap.combine $Snap.unit $Snap.unit)) ret@59@01 2)
  3))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _2 := builtin$havoc_ref()
(declare-const ret@64@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_2.val_int, write)
(declare-const $t@65@01 Int)
(assert (not (= ret@64@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _2.val_int := 0
; [exec]
; __t1 := true
; [exec]
; __t2 := true
; [exec]
; _6 := builtin$havoc_int()
(declare-const ret@66@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _6 := _2.val_int
; [exec]
; label l0
; [exec]
; _5 := builtin$havoc_ref()
(declare-const ret@67@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_5.val_bool, write)
(declare-const $t@68@01 Bool)
(assert (not (= ret@67@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _5.val_bool := _6 < 3
; [eval] _6 < 3
; [exec]
; __t18 := _5.val_bool
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
; label bb0
; [exec]
; __t3 := true
; [exec]
; _8 := builtin$havoc_ref()
(declare-const ret@69@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_8.val_bool, write)
(declare-const $t@70@01 Bool)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@67@01 ret@69@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@69@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _8.val_bool := false
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@67@01 ret@69@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t19 := _8.val_bool
; [exec]
; fold acc(usize(_2), write)
; [eval] 0 <= self.val_int
(assert (usize%trigger ($Snap.combine ($SortWrappers.IntTo$Snap 0) $Snap.unit) ret@64@01))
; [exec]
; assert (unfolding acc(usize(_2), write) in _2.val_int) < 3 &&
;   ((unfolding acc(usize(_2), write) in
;     (forall _0_quant_0: Int ::
;       { read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1),
;       _0_quant_0) }
;       0 <= _0_quant_0 ==>
;       !(0 <= _0_quant_0) ||
;       (!(_0_quant_0 < _2.val_int) ||
;       _0_quant_0 < 3 &&
;       read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1),
;       _0_quant_0) <=
;       _0_quant_0 + 2))) &&
;   ((unfolding acc(usize(_2), write) in
;     (let _LET_0 ==
;       (_2.val_int) in
;       (forall _0_quant_0: Int ::
;         { read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1),
;         _0_quant_0) }
;         0 <= _0_quant_0 ==>
;         !(_LET_0 <= _0_quant_0) ||
;         (!(_0_quant_0 < 3) ||
;         _0_quant_0 < 3 &&
;         read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1),
;         _0_quant_0) <=
;         _0_quant_0 + 1)))) &&
;   ((unfolding acc(usize(_2), write) in _2.val_int) < 3 &&
;   read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1),
;   (unfolding acc(usize(_2), write) in _2.val_int)) <=
;   (unfolding acc(usize(_2), write) in _2.val_int) + 1)))
; [eval] (unfolding acc(usize(_2), write) in _2.val_int) < 3
; [eval] (unfolding acc(usize(_2), write) in _2.val_int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= self.val_int
(pop) ; 4
; Joined path conditions
; [eval] (unfolding acc(usize(_2), write) in (forall _0_quant_0: Int :: { read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0) } 0 <= _0_quant_0 ==> !(0 <= _0_quant_0) || (!(_0_quant_0 < _2.val_int) || _0_quant_0 < 3 && read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0) <= _0_quant_0 + 2)))
(push) ; 4
; [eval] 0 <= self.val_int
; [eval] (forall _0_quant_0: Int :: { read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0) } 0 <= _0_quant_0 ==> !(0 <= _0_quant_0) || (!(_0_quant_0 < _2.val_int) || _0_quant_0 < 3 && read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0) <= _0_quant_0 + 2))
(declare-const _0_quant_0@71@01 Int)
(push) ; 5
; [eval] 0 <= _0_quant_0 ==> !(0 <= _0_quant_0) || (!(_0_quant_0 < _2.val_int) || _0_quant_0 < 3 && read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0) <= _0_quant_0 + 2)
; [eval] 0 <= _0_quant_0
(push) ; 6
; [then-branch: 1 | 0 <= _0_quant_0@71@01 | live]
; [else-branch: 1 | !(0 <= _0_quant_0@71@01) | live]
(push) ; 7
; [then-branch: 1 | 0 <= _0_quant_0@71@01]
(assert (<= 0 _0_quant_0@71@01))
; [eval] !(0 <= _0_quant_0) || (!(_0_quant_0 < _2.val_int) || _0_quant_0 < 3 && read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0) <= _0_quant_0 + 2)
; [eval] !(0 <= _0_quant_0)
; [eval] 0 <= _0_quant_0
(push) ; 8
; [then-branch: 2 | !(0 <= _0_quant_0@71@01) | live]
; [else-branch: 2 | 0 <= _0_quant_0@71@01 | live]
(push) ; 9
; [then-branch: 2 | !(0 <= _0_quant_0@71@01)]
(assert (not (<= 0 _0_quant_0@71@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 2 | 0 <= _0_quant_0@71@01]
; [eval] !(_0_quant_0 < _2.val_int)
; [eval] _0_quant_0 < _2.val_int
(push) ; 10
; [then-branch: 3 | !(_0_quant_0@71@01 < 0) | live]
; [else-branch: 3 | _0_quant_0@71@01 < 0 | live]
(push) ; 11
; [then-branch: 3 | !(_0_quant_0@71@01 < 0)]
(assert (not (< _0_quant_0@71@01 0)))
(pop) ; 11
(push) ; 11
; [else-branch: 3 | _0_quant_0@71@01 < 0]
(assert (< _0_quant_0@71@01 0))
; [eval] _0_quant_0 < 3 && read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0) <= _0_quant_0 + 2
; [eval] _0_quant_0 < 3
(push) ; 12
; [then-branch: 4 | _0_quant_0@71@01 < 3 | live]
; [else-branch: 4 | !(_0_quant_0@71@01 < 3) | live]
(push) ; 13
; [then-branch: 4 | _0_quant_0@71@01 < 3]
(assert (< _0_quant_0@71@01 3))
; [eval] read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0) <= _0_quant_0 + 2
; [eval] read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0)
; [eval] snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1)
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
(assert (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition $t@60@01 ret@59@01))
(pop) ; 14
; Joined path conditions
(assert (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition $t@60@01 ret@59@01))
; [eval] _0_quant_0 + 2
(pop) ; 13
(set-option :timeout 0)
(push) ; 13
; [else-branch: 4 | !(_0_quant_0@71@01 < 3)]
(assert (not (< _0_quant_0@71@01 3)))
(pop) ; 13
(pop) ; 12
; Joined path conditions
(assert (=>
  (< _0_quant_0@71@01 3)
  (and
    (< _0_quant_0@71@01 3)
    (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition $t@60@01 ret@59@01))))
; Joined path conditions
(assert (or (not (< _0_quant_0@71@01 3)) (< _0_quant_0@71@01 3)))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (=>
  (< _0_quant_0@71@01 0)
  (and
    (< _0_quant_0@71@01 0)
    (=>
      (< _0_quant_0@71@01 3)
      (and
        (< _0_quant_0@71@01 3)
        (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition $t@60@01 ret@59@01)))
    (or (not (< _0_quant_0@71@01 3)) (< _0_quant_0@71@01 3)))))
(assert (or (< _0_quant_0@71@01 0) (not (< _0_quant_0@71@01 0))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 _0_quant_0@71@01)
  (and
    (=>
      (< _0_quant_0@71@01 0)
      (and
        (< _0_quant_0@71@01 0)
        (=>
          (< _0_quant_0@71@01 3)
          (and
            (< _0_quant_0@71@01 3)
            (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition $t@60@01 ret@59@01)))
        (or (not (< _0_quant_0@71@01 3)) (< _0_quant_0@71@01 3))))
    (or (< _0_quant_0@71@01 0) (not (< _0_quant_0@71@01 0))))))
(assert (or (<= 0 _0_quant_0@71@01) (not (<= 0 _0_quant_0@71@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 1 | !(0 <= _0_quant_0@71@01)]
(assert (not (<= 0 _0_quant_0@71@01)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (<= 0 _0_quant_0@71@01)
  (and
    (<= 0 _0_quant_0@71@01)
    (=>
      (<= 0 _0_quant_0@71@01)
      (and
        (=>
          (< _0_quant_0@71@01 0)
          (and
            (< _0_quant_0@71@01 0)
            (=>
              (< _0_quant_0@71@01 3)
              (and
                (< _0_quant_0@71@01 3)
                (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition $t@60@01 ret@59@01)))
            (or (not (< _0_quant_0@71@01 3)) (< _0_quant_0@71@01 3))))
        (or (< _0_quant_0@71@01 0) (not (< _0_quant_0@71@01 0)))))
    (or (<= 0 _0_quant_0@71@01) (not (<= 0 _0_quant_0@71@01))))))
; Joined path conditions
(assert (or (not (<= 0 _0_quant_0@71@01)) (<= 0 _0_quant_0@71@01)))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((_0_quant_0@71@01 Int)) (!
  (and
    (=>
      (<= 0 _0_quant_0@71@01)
      (and
        (<= 0 _0_quant_0@71@01)
        (=>
          (<= 0 _0_quant_0@71@01)
          (and
            (=>
              (< _0_quant_0@71@01 0)
              (and
                (< _0_quant_0@71@01 0)
                (=>
                  (< _0_quant_0@71@01 3)
                  (and
                    (< _0_quant_0@71@01 3)
                    (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition $t@60@01 ret@59@01)))
                (or (not (< _0_quant_0@71@01 3)) (< _0_quant_0@71@01 3))))
            (or (< _0_quant_0@71@01 0) (not (< _0_quant_0@71@01 0)))))
        (or (<= 0 _0_quant_0@71@01) (not (<= 0 _0_quant_0@71@01)))))
    (or (not (<= 0 _0_quant_0@71@01)) (<= 0 _0_quant_0@71@01)))
  :pattern ((read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$<Int> (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize $t@60@01 ret@59@01) _0_quant_0@71@01))
  :qid |prog.l518-aux|)))
(pop) ; 4
; Joined path conditions
(assert (forall ((_0_quant_0@71@01 Int)) (!
  (and
    (=>
      (<= 0 _0_quant_0@71@01)
      (and
        (<= 0 _0_quant_0@71@01)
        (=>
          (<= 0 _0_quant_0@71@01)
          (and
            (=>
              (< _0_quant_0@71@01 0)
              (and
                (< _0_quant_0@71@01 0)
                (=>
                  (< _0_quant_0@71@01 3)
                  (and
                    (< _0_quant_0@71@01 3)
                    (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition $t@60@01 ret@59@01)))
                (or (not (< _0_quant_0@71@01 3)) (< _0_quant_0@71@01 3))))
            (or (< _0_quant_0@71@01 0) (not (< _0_quant_0@71@01 0)))))
        (or (<= 0 _0_quant_0@71@01) (not (<= 0 _0_quant_0@71@01)))))
    (or (not (<= 0 _0_quant_0@71@01)) (<= 0 _0_quant_0@71@01)))
  :pattern ((read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$<Int> (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize $t@60@01 ret@59@01) _0_quant_0@71@01))
  :qid |prog.l518-aux|)))
(assert (forall ((_0_quant_0@71@01 Int)) (!
  (=>
    (and
      (<= 0 _0_quant_0@71@01)
      (and (<= 0 _0_quant_0@71@01) (< _0_quant_0@71@01 0)))
    (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition $t@60@01 ret@59@01))
  :pattern ((read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$<Int> (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize $t@60@01 ret@59@01) _0_quant_0@71@01))
  :qid |prog.l518_precondition|)))
(push) ; 4
(assert (not (forall ((_0_quant_0@71@01 Int)) (!
  (=>
    (and
      (=>
        (and
          (<= 0 _0_quant_0@71@01)
          (and (<= 0 _0_quant_0@71@01) (< _0_quant_0@71@01 0)))
        (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition $t@60@01 ret@59@01))
      (<= 0 _0_quant_0@71@01))
    (or
      (not (<= 0 _0_quant_0@71@01))
      (or
        (not (< _0_quant_0@71@01 0))
        (and
          (<=
            (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$<Int> (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize $t@60@01 ret@59@01) _0_quant_0@71@01)
            (+ _0_quant_0@71@01 2))
          (< _0_quant_0@71@01 3)))))
  :pattern ((read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$<Int> (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize $t@60@01 ret@59@01) _0_quant_0@71@01))
  :qid |prog.l518|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (forall ((_0_quant_0@71@01 Int)) (!
  (=>
    (<= 0 _0_quant_0@71@01)
    (or
      (not (<= 0 _0_quant_0@71@01))
      (or
        (not (< _0_quant_0@71@01 0))
        (and
          (<=
            (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$<Int> (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize $t@60@01 ret@59@01) _0_quant_0@71@01)
            (+ _0_quant_0@71@01 2))
          (< _0_quant_0@71@01 3)))))
  :pattern ((read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$<Int> (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize $t@60@01 ret@59@01) _0_quant_0@71@01))
  :qid |prog.l518|)))
; [eval] (unfolding acc(usize(_2), write) in (let _LET_0 == (_2.val_int) in (forall _0_quant_0: Int :: { read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0) } 0 <= _0_quant_0 ==> !(_LET_0 <= _0_quant_0) || (!(_0_quant_0 < 3) || _0_quant_0 < 3 && read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0) <= _0_quant_0 + 1))))
(push) ; 4
; [eval] 0 <= self.val_int
; [eval] (let _LET_0 == (_2.val_int) in (forall _0_quant_0: Int :: { read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0) } 0 <= _0_quant_0 ==> !(_LET_0 <= _0_quant_0) || (!(_0_quant_0 < 3) || _0_quant_0 < 3 && read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0) <= _0_quant_0 + 1)))
(declare-const letvar@72@01 Int)
(assert (= (as letvar@72@01  Int) 0))
; [eval] (forall _0_quant_0: Int :: { read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0) } 0 <= _0_quant_0 ==> !(_LET_0 <= _0_quant_0) || (!(_0_quant_0 < 3) || _0_quant_0 < 3 && read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0) <= _0_quant_0 + 1))
(declare-const _0_quant_0@73@01 Int)
(push) ; 5
; [eval] 0 <= _0_quant_0 ==> !(_LET_0 <= _0_quant_0) || (!(_0_quant_0 < 3) || _0_quant_0 < 3 && read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0) <= _0_quant_0 + 1)
; [eval] 0 <= _0_quant_0
(push) ; 6
; [then-branch: 5 | 0 <= _0_quant_0@73@01 | live]
; [else-branch: 5 | !(0 <= _0_quant_0@73@01) | live]
(push) ; 7
; [then-branch: 5 | 0 <= _0_quant_0@73@01]
(assert (<= 0 _0_quant_0@73@01))
; [eval] !(_LET_0 <= _0_quant_0) || (!(_0_quant_0 < 3) || _0_quant_0 < 3 && read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0) <= _0_quant_0 + 1)
; [eval] !(_LET_0 <= _0_quant_0)
; [eval] _LET_0 <= _0_quant_0
(push) ; 8
; [then-branch: 6 | !(0 <= _0_quant_0@73@01) | live]
; [else-branch: 6 | 0 <= _0_quant_0@73@01 | live]
(push) ; 9
; [then-branch: 6 | !(0 <= _0_quant_0@73@01)]
(assert (not (<= 0 _0_quant_0@73@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 6 | 0 <= _0_quant_0@73@01]
; [eval] !(_0_quant_0 < 3)
; [eval] _0_quant_0 < 3
(push) ; 10
; [then-branch: 7 | !(_0_quant_0@73@01 < 3) | live]
; [else-branch: 7 | _0_quant_0@73@01 < 3 | live]
(push) ; 11
; [then-branch: 7 | !(_0_quant_0@73@01 < 3)]
(assert (not (< _0_quant_0@73@01 3)))
(pop) ; 11
(push) ; 11
; [else-branch: 7 | _0_quant_0@73@01 < 3]
(assert (< _0_quant_0@73@01 3))
; [eval] _0_quant_0 < 3 && read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0) <= _0_quant_0 + 1
; [eval] _0_quant_0 < 3
(push) ; 12
; [then-branch: 8 | _0_quant_0@73@01 < 3 | live]
; [else-branch: 8 | !(_0_quant_0@73@01 < 3) | live]
(push) ; 13
; [then-branch: 8 | _0_quant_0@73@01 < 3]
; [eval] read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0) <= _0_quant_0 + 1
; [eval] read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0)
; [eval] snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1)
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
(assert (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition $t@60@01 ret@59@01))
(pop) ; 14
; Joined path conditions
(assert (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition $t@60@01 ret@59@01))
; [eval] _0_quant_0 + 1
(pop) ; 13
(set-option :timeout 0)
(push) ; 13
; [else-branch: 8 | !(_0_quant_0@73@01 < 3)]
(assert (not (< _0_quant_0@73@01 3)))
(pop) ; 13
(pop) ; 12
; Joined path conditions
(assert (=>
  (< _0_quant_0@73@01 3)
  (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition $t@60@01 ret@59@01)))
; Joined path conditions
(assert (or (not (< _0_quant_0@73@01 3)) (< _0_quant_0@73@01 3)))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (=>
  (< _0_quant_0@73@01 3)
  (and
    (< _0_quant_0@73@01 3)
    (=>
      (< _0_quant_0@73@01 3)
      (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition $t@60@01 ret@59@01))
    (or (not (< _0_quant_0@73@01 3)) (< _0_quant_0@73@01 3)))))
(assert (or (< _0_quant_0@73@01 3) (not (< _0_quant_0@73@01 3))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 _0_quant_0@73@01)
  (and
    (=>
      (< _0_quant_0@73@01 3)
      (and
        (< _0_quant_0@73@01 3)
        (=>
          (< _0_quant_0@73@01 3)
          (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition $t@60@01 ret@59@01))
        (or (not (< _0_quant_0@73@01 3)) (< _0_quant_0@73@01 3))))
    (or (< _0_quant_0@73@01 3) (not (< _0_quant_0@73@01 3))))))
(assert (or (<= 0 _0_quant_0@73@01) (not (<= 0 _0_quant_0@73@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 5 | !(0 <= _0_quant_0@73@01)]
(assert (not (<= 0 _0_quant_0@73@01)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (<= 0 _0_quant_0@73@01)
  (and
    (<= 0 _0_quant_0@73@01)
    (=>
      (<= 0 _0_quant_0@73@01)
      (and
        (=>
          (< _0_quant_0@73@01 3)
          (and
            (< _0_quant_0@73@01 3)
            (=>
              (< _0_quant_0@73@01 3)
              (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition $t@60@01 ret@59@01))
            (or (not (< _0_quant_0@73@01 3)) (< _0_quant_0@73@01 3))))
        (or (< _0_quant_0@73@01 3) (not (< _0_quant_0@73@01 3)))))
    (or (<= 0 _0_quant_0@73@01) (not (<= 0 _0_quant_0@73@01))))))
; Joined path conditions
(assert (or (not (<= 0 _0_quant_0@73@01)) (<= 0 _0_quant_0@73@01)))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((_0_quant_0@73@01 Int)) (!
  (and
    (=>
      (<= 0 _0_quant_0@73@01)
      (and
        (<= 0 _0_quant_0@73@01)
        (=>
          (<= 0 _0_quant_0@73@01)
          (and
            (=>
              (< _0_quant_0@73@01 3)
              (and
                (< _0_quant_0@73@01 3)
                (=>
                  (< _0_quant_0@73@01 3)
                  (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition $t@60@01 ret@59@01))
                (or (not (< _0_quant_0@73@01 3)) (< _0_quant_0@73@01 3))))
            (or (< _0_quant_0@73@01 3) (not (< _0_quant_0@73@01 3)))))
        (or (<= 0 _0_quant_0@73@01) (not (<= 0 _0_quant_0@73@01)))))
    (or (not (<= 0 _0_quant_0@73@01)) (<= 0 _0_quant_0@73@01)))
  :pattern ((read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$<Int> (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize $t@60@01 ret@59@01) _0_quant_0@73@01))
  :qid |prog.l531-aux|)))
(pop) ; 4
; Joined path conditions
(assert (and
  (= (as letvar@72@01  Int) 0)
  (forall ((_0_quant_0@73@01 Int)) (!
    (and
      (=>
        (<= 0 _0_quant_0@73@01)
        (and
          (<= 0 _0_quant_0@73@01)
          (=>
            (<= 0 _0_quant_0@73@01)
            (and
              (=>
                (< _0_quant_0@73@01 3)
                (and
                  (< _0_quant_0@73@01 3)
                  (=>
                    (< _0_quant_0@73@01 3)
                    (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition $t@60@01 ret@59@01))
                  (or (not (< _0_quant_0@73@01 3)) (< _0_quant_0@73@01 3))))
              (or (< _0_quant_0@73@01 3) (not (< _0_quant_0@73@01 3)))))
          (or (<= 0 _0_quant_0@73@01) (not (<= 0 _0_quant_0@73@01)))))
      (or (not (<= 0 _0_quant_0@73@01)) (<= 0 _0_quant_0@73@01)))
    :pattern ((read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$<Int> (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize $t@60@01 ret@59@01) _0_quant_0@73@01))
    :qid |prog.l531-aux|))))
(assert (forall ((_0_quant_0@73@01 Int)) (!
  (=>
    (and
      (<= 0 _0_quant_0@73@01)
      (and (<= 0 _0_quant_0@73@01) (< _0_quant_0@73@01 3)))
    (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition $t@60@01 ret@59@01))
  :pattern ((read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$<Int> (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize $t@60@01 ret@59@01) _0_quant_0@73@01))
  :qid |prog.l531_precondition|)))
(push) ; 4
(assert (not (forall ((_0_quant_0@73@01 Int)) (!
  (=>
    (and
      (=>
        (and
          (<= 0 _0_quant_0@73@01)
          (and (<= 0 _0_quant_0@73@01) (< _0_quant_0@73@01 3)))
        (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition $t@60@01 ret@59@01))
      (<= 0 _0_quant_0@73@01))
    (or
      (not (<= 0 _0_quant_0@73@01))
      (or
        (not (< _0_quant_0@73@01 3))
        (and
          (<=
            (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$<Int> (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize $t@60@01 ret@59@01) _0_quant_0@73@01)
            (+ _0_quant_0@73@01 1))
          (< _0_quant_0@73@01 3)))))
  :pattern ((read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$<Int> (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize $t@60@01 ret@59@01) _0_quant_0@73@01))
  :qid |prog.l531|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (forall ((_0_quant_0@73@01 Int)) (!
  (=>
    (<= 0 _0_quant_0@73@01)
    (or
      (not (<= 0 _0_quant_0@73@01))
      (or
        (not (< _0_quant_0@73@01 3))
        (and
          (<=
            (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$<Int> (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize $t@60@01 ret@59@01) _0_quant_0@73@01)
            (+ _0_quant_0@73@01 1))
          (< _0_quant_0@73@01 3)))))
  :pattern ((read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$<Int> (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize $t@60@01 ret@59@01) _0_quant_0@73@01))
  :qid |prog.l531|)))
; [eval] (unfolding acc(usize(_2), write) in _2.val_int) < 3
; [eval] (unfolding acc(usize(_2), write) in _2.val_int)
(push) ; 4
; [eval] 0 <= self.val_int
(pop) ; 4
; Joined path conditions
; [eval] read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), (unfolding acc(usize(_2), write) in _2.val_int)) <= (unfolding acc(usize(_2), write) in _2.val_int) + 1
; [eval] read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), (unfolding acc(usize(_2), write) in _2.val_int))
; [eval] snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1)
(push) ; 4
; [eval] read$()
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(assert (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition $t@60@01 ret@59@01))
(pop) ; 4
; Joined path conditions
(assert (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition $t@60@01 ret@59@01))
; [eval] (unfolding acc(usize(_2), write) in _2.val_int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= self.val_int
(pop) ; 4
; Joined path conditions
; [eval] (unfolding acc(usize(_2), write) in _2.val_int) + 1
; [eval] (unfolding acc(usize(_2), write) in _2.val_int)
(push) ; 4
; [eval] 0 <= self.val_int
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (<=
  (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$<Int> (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize $t@60@01 ret@59@01) 0)
  1)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (<=
  (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$<Int> (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize $t@60@01 ret@59@01) 0)
  1))
; [exec]
; assert true
; [exec]
; exhale acc(usize(_2), write) && acc(Array$3$usize(_1), write)
; [exec]
; _12 := builtin$havoc_ref()
(declare-const ret@74@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _17 := builtin$havoc_ref()
(declare-const ret@75@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _2 := builtin$havoc_ref()
(declare-const ret@76@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _22 := builtin$havoc_ref()
(declare-const ret@77@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _26 := builtin$havoc_ref()
(declare-const ret@78@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _27 := builtin$havoc_int()
(declare-const ret@79@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _28 := builtin$havoc_int()
(declare-const ret@80@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _29 := builtin$havoc_int()
(declare-const ret@81@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _30 := builtin$havoc_ref()
(declare-const ret@82@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _31 := builtin$havoc_ref()
(declare-const ret@83@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _32 := builtin$havoc_ref()
(declare-const ret@84@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _33 := builtin$havoc_int()
(declare-const ret@85@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _34 := builtin$havoc_int()
(declare-const ret@86@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _35 := builtin$havoc_ref()
(declare-const ret@87@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _36 := builtin$havoc_ref()
(declare-const ret@88@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _5 := builtin$havoc_ref()
(declare-const ret@89@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _6 := builtin$havoc_int()
(declare-const ret@90@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _8 := builtin$havoc_ref()
(declare-const ret@91@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t1 := builtin$havoc_bool()
(declare-const ret@92@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t10 := builtin$havoc_bool()
(declare-const ret@93@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t11 := builtin$havoc_bool()
(declare-const ret@94@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t12 := builtin$havoc_bool()
(declare-const ret@95@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t13 := builtin$havoc_bool()
(declare-const ret@96@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t14 := builtin$havoc_bool()
(declare-const ret@97@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t15 := builtin$havoc_bool()
(declare-const ret@98@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t2 := builtin$havoc_bool()
(declare-const ret@99@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t20 := builtin$havoc_bool()
(declare-const ret@100@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t21 := builtin$havoc_bool()
(declare-const ret@101@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t22 := builtin$havoc_bool()
(declare-const ret@102@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t23 := builtin$havoc_bool()
(declare-const ret@103@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t24 := builtin$havoc_bool()
(declare-const ret@104@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t25 := builtin$havoc_bool()
(declare-const ret@105@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t26 := builtin$havoc_int()
(declare-const ret@106@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t27 := builtin$havoc_bool()
(declare-const ret@107@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t28 := builtin$havoc_bool()
(declare-const ret@108@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t29 := builtin$havoc_ref()
(declare-const ret@109@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t3 := builtin$havoc_bool()
(declare-const ret@110@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t30 := builtin$havoc_bool()
(declare-const ret@111@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t31 := builtin$havoc_bool()
(declare-const ret@112@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t32 := builtin$havoc_bool()
(declare-const ret@113@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t4 := builtin$havoc_bool()
(declare-const ret@114@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t5 := builtin$havoc_bool()
(declare-const ret@115@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t6 := builtin$havoc_bool()
(declare-const ret@116@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t7 := builtin$havoc_bool()
(declare-const ret@117@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t8 := builtin$havoc_bool()
(declare-const ret@118@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t9 := builtin$havoc_bool()
(declare-const ret@119@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(usize(_2), write) && acc(Array$3$usize(_1), write)
(declare-const $t@120@01 $Snap)
(assert (= $t@120@01 ($Snap.combine ($Snap.first $t@120@01) ($Snap.second $t@120@01))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale true
(declare-const $t@121@01 $Snap)
(assert (= $t@121@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; __t1 := true
; [exec]
; __t2 := true
; [exec]
; _6 := builtin$havoc_int()
(declare-const ret@122@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; unfold acc(usize(_2), write)
(assert (=
  ($Snap.first $t@120@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@120@01))
    ($Snap.second ($Snap.first $t@120@01)))))
(assert (not (= ret@76@01 $Ref.null)))
(assert (= ($Snap.second ($Snap.first $t@120@01)) $Snap.unit))
; [eval] 0 <= self.val_int
(assert (<= 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01)))))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (usize%trigger ($Snap.first $t@120@01) ret@76@01))
; [exec]
; _6 := _2.val_int
(declare-const _6@123@01 Int)
(assert (= _6@123@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01)))))
; [exec]
; label l3
; [exec]
; _5 := builtin$havoc_ref()
(declare-const ret@124@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_5.val_bool, write)
(declare-const $t@125@01 Bool)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@67@01 ret@124@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@69@01 ret@124@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@124@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _5.val_bool := _6 < 3
; [eval] _6 < 3
(declare-const val_bool@126@01 Bool)
(assert (= val_bool@126@01 (< _6@123@01 3)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@69@01 ret@124@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@67@01 ret@124@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t20 := _5.val_bool
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not val_bool@126@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not val_bool@126@01))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 9 | val_bool@126@01 | live]
; [else-branch: 9 | !(val_bool@126@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 9 | val_bool@126@01]
(assert val_bool@126@01)
; [exec]
; label loop1_group1_bb1
; [exec]
; __t3 := true
; [exec]
; _8 := builtin$havoc_ref()
(declare-const ret@127@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_8.val_bool, write)
(declare-const $t@128@01 Bool)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@67@01 ret@127@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@69@01 ret@127@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@124@01 ret@127@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@127@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _8.val_bool := false
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@124@01 ret@127@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@69@01 ret@127@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@67@01 ret@127@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t21 := _8.val_bool
; [exec]
; inhale _2.val_int < 3 &&
;   ((forall _0_quant_0: Int ::
;     { read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1),
;     _0_quant_0) }
;     0 <= _0_quant_0 ==>
;     !(0 <= _0_quant_0) ||
;     (!(_0_quant_0 < _2.val_int) ||
;     _0_quant_0 < 3 &&
;     read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1),
;     _0_quant_0) <=
;     _0_quant_0 + 2)) &&
;   ((let _LET_1 ==
;     (_2.val_int) in
;     (forall _0_quant_0: Int ::
;       { read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1),
;       _0_quant_0) }
;       0 <= _0_quant_0 ==>
;       !(_LET_1 <= _0_quant_0) ||
;       (!(_0_quant_0 < 3) ||
;       _0_quant_0 < 3 &&
;       read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1),
;       _0_quant_0) <=
;       _0_quant_0 + 1))) &&
;   (_2.val_int < 3 &&
;   read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1),
;   _2.val_int) <=
;   _2.val_int + 1)))
(declare-const $t@129@01 $Snap)
(assert (= $t@129@01 ($Snap.combine ($Snap.first $t@129@01) ($Snap.second $t@129@01))))
(assert (= ($Snap.first $t@129@01) $Snap.unit))
; [eval] _2.val_int < 3
(assert (< ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01))) 3))
(assert (=
  ($Snap.second $t@129@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@129@01))
    ($Snap.second ($Snap.second $t@129@01)))))
(assert (= ($Snap.first ($Snap.second $t@129@01)) $Snap.unit))
; [eval] (forall _0_quant_0: Int :: { read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0) } 0 <= _0_quant_0 ==> !(0 <= _0_quant_0) || (!(_0_quant_0 < _2.val_int) || _0_quant_0 < 3 && read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0) <= _0_quant_0 + 2))
(declare-const _0_quant_0@130@01 Int)
(set-option :timeout 0)
(push) ; 5
; [eval] 0 <= _0_quant_0 ==> !(0 <= _0_quant_0) || (!(_0_quant_0 < _2.val_int) || _0_quant_0 < 3 && read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0) <= _0_quant_0 + 2)
; [eval] 0 <= _0_quant_0
(push) ; 6
; [then-branch: 10 | 0 <= _0_quant_0@130@01 | live]
; [else-branch: 10 | !(0 <= _0_quant_0@130@01) | live]
(push) ; 7
; [then-branch: 10 | 0 <= _0_quant_0@130@01]
(assert (<= 0 _0_quant_0@130@01))
; [eval] !(0 <= _0_quant_0) || (!(_0_quant_0 < _2.val_int) || _0_quant_0 < 3 && read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0) <= _0_quant_0 + 2)
; [eval] !(0 <= _0_quant_0)
; [eval] 0 <= _0_quant_0
(push) ; 8
; [then-branch: 11 | !(0 <= _0_quant_0@130@01) | live]
; [else-branch: 11 | 0 <= _0_quant_0@130@01 | live]
(push) ; 9
; [then-branch: 11 | !(0 <= _0_quant_0@130@01)]
(assert (not (<= 0 _0_quant_0@130@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 11 | 0 <= _0_quant_0@130@01]
; [eval] !(_0_quant_0 < _2.val_int)
; [eval] _0_quant_0 < _2.val_int
(push) ; 10
; [then-branch: 12 | !(_0_quant_0@130@01 < First:(First:($t@120@01))) | live]
; [else-branch: 12 | _0_quant_0@130@01 < First:(First:($t@120@01)) | live]
(push) ; 11
; [then-branch: 12 | !(_0_quant_0@130@01 < First:(First:($t@120@01)))]
(assert (not
  (<
    _0_quant_0@130@01
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01))))))
(pop) ; 11
(push) ; 11
; [else-branch: 12 | _0_quant_0@130@01 < First:(First:($t@120@01))]
(assert (<
  _0_quant_0@130@01
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01)))))
; [eval] _0_quant_0 < 3 && read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0) <= _0_quant_0 + 2
; [eval] _0_quant_0 < 3
(push) ; 12
; [then-branch: 13 | _0_quant_0@130@01 < 3 | live]
; [else-branch: 13 | !(_0_quant_0@130@01 < 3) | live]
(push) ; 13
; [then-branch: 13 | _0_quant_0@130@01 < 3]
(assert (< _0_quant_0@130@01 3))
; [eval] read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0) <= _0_quant_0 + 2
; [eval] read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0)
; [eval] snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1)
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
(assert (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition ($Snap.second $t@120@01) ret@59@01))
(pop) ; 14
; Joined path conditions
(assert (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition ($Snap.second $t@120@01) ret@59@01))
; [eval] _0_quant_0 + 2
(pop) ; 13
(set-option :timeout 0)
(push) ; 13
; [else-branch: 13 | !(_0_quant_0@130@01 < 3)]
(assert (not (< _0_quant_0@130@01 3)))
(pop) ; 13
(pop) ; 12
; Joined path conditions
(assert (=>
  (< _0_quant_0@130@01 3)
  (and
    (< _0_quant_0@130@01 3)
    (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition ($Snap.second $t@120@01) ret@59@01))))
; Joined path conditions
(assert (or (not (< _0_quant_0@130@01 3)) (< _0_quant_0@130@01 3)))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (=>
  (<
    _0_quant_0@130@01
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01))))
  (and
    (<
      _0_quant_0@130@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01))))
    (=>
      (< _0_quant_0@130@01 3)
      (and
        (< _0_quant_0@130@01 3)
        (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition ($Snap.second $t@120@01) ret@59@01)))
    (or (not (< _0_quant_0@130@01 3)) (< _0_quant_0@130@01 3)))))
(assert (or
  (<
    _0_quant_0@130@01
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01))))
  (not
    (<
      _0_quant_0@130@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01)))))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 _0_quant_0@130@01)
  (and
    (=>
      (<
        _0_quant_0@130@01
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01))))
      (and
        (<
          _0_quant_0@130@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01))))
        (=>
          (< _0_quant_0@130@01 3)
          (and
            (< _0_quant_0@130@01 3)
            (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition ($Snap.second $t@120@01) ret@59@01)))
        (or (not (< _0_quant_0@130@01 3)) (< _0_quant_0@130@01 3))))
    (or
      (<
        _0_quant_0@130@01
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01))))
      (not
        (<
          _0_quant_0@130@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01)))))))))
(assert (or (<= 0 _0_quant_0@130@01) (not (<= 0 _0_quant_0@130@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 10 | !(0 <= _0_quant_0@130@01)]
(assert (not (<= 0 _0_quant_0@130@01)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (<= 0 _0_quant_0@130@01)
  (and
    (<= 0 _0_quant_0@130@01)
    (=>
      (<= 0 _0_quant_0@130@01)
      (and
        (=>
          (<
            _0_quant_0@130@01
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01))))
          (and
            (<
              _0_quant_0@130@01
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01))))
            (=>
              (< _0_quant_0@130@01 3)
              (and
                (< _0_quant_0@130@01 3)
                (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition ($Snap.second $t@120@01) ret@59@01)))
            (or (not (< _0_quant_0@130@01 3)) (< _0_quant_0@130@01 3))))
        (or
          (<
            _0_quant_0@130@01
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01))))
          (not
            (<
              _0_quant_0@130@01
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01))))))))
    (or (<= 0 _0_quant_0@130@01) (not (<= 0 _0_quant_0@130@01))))))
; Joined path conditions
(assert (or (not (<= 0 _0_quant_0@130@01)) (<= 0 _0_quant_0@130@01)))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((_0_quant_0@130@01 Int)) (!
  (and
    (=>
      (<= 0 _0_quant_0@130@01)
      (and
        (<= 0 _0_quant_0@130@01)
        (=>
          (<= 0 _0_quant_0@130@01)
          (and
            (=>
              (<
                _0_quant_0@130@01
                ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01))))
              (and
                (<
                  _0_quant_0@130@01
                  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01))))
                (=>
                  (< _0_quant_0@130@01 3)
                  (and
                    (< _0_quant_0@130@01 3)
                    (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition ($Snap.second $t@120@01) ret@59@01)))
                (or (not (< _0_quant_0@130@01 3)) (< _0_quant_0@130@01 3))))
            (or
              (<
                _0_quant_0@130@01
                ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01))))
              (not
                (<
                  _0_quant_0@130@01
                  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01))))))))
        (or (<= 0 _0_quant_0@130@01) (not (<= 0 _0_quant_0@130@01)))))
    (or (not (<= 0 _0_quant_0@130@01)) (<= 0 _0_quant_0@130@01)))
  :pattern ((read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$<Int> (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize ($Snap.second $t@120@01) ret@59@01) _0_quant_0@130@01))
  :qid |prog.l753-aux|)))
(assert (forall ((_0_quant_0@130@01 Int)) (!
  (=>
    (<= 0 _0_quant_0@130@01)
    (or
      (not (<= 0 _0_quant_0@130@01))
      (or
        (not
          (<
            _0_quant_0@130@01
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01)))))
        (and
          (<=
            (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$<Int> (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize ($Snap.second $t@120@01) ret@59@01) _0_quant_0@130@01)
            (+ _0_quant_0@130@01 2))
          (< _0_quant_0@130@01 3)))))
  :pattern ((read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$<Int> (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize ($Snap.second $t@120@01) ret@59@01) _0_quant_0@130@01))
  :qid |prog.l753|)))
(assert (=
  ($Snap.second ($Snap.second $t@129@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@129@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@129@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@129@01))) $Snap.unit))
; [eval] (let _LET_1 == (_2.val_int) in (forall _0_quant_0: Int :: { read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0) } 0 <= _0_quant_0 ==> !(_LET_1 <= _0_quant_0) || (!(_0_quant_0 < 3) || _0_quant_0 < 3 && read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0) <= _0_quant_0 + 1)))
(declare-const letvar@131@01 Int)
(assert (=
  (as letvar@131@01  Int)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01)))))
; [eval] (forall _0_quant_0: Int :: { read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0) } 0 <= _0_quant_0 ==> !(_LET_1 <= _0_quant_0) || (!(_0_quant_0 < 3) || _0_quant_0 < 3 && read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0) <= _0_quant_0 + 1))
(declare-const _0_quant_0@132@01 Int)
(push) ; 5
; [eval] 0 <= _0_quant_0 ==> !(_LET_1 <= _0_quant_0) || (!(_0_quant_0 < 3) || _0_quant_0 < 3 && read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0) <= _0_quant_0 + 1)
; [eval] 0 <= _0_quant_0
(push) ; 6
; [then-branch: 14 | 0 <= _0_quant_0@132@01 | live]
; [else-branch: 14 | !(0 <= _0_quant_0@132@01) | live]
(push) ; 7
; [then-branch: 14 | 0 <= _0_quant_0@132@01]
(assert (<= 0 _0_quant_0@132@01))
; [eval] !(_LET_1 <= _0_quant_0) || (!(_0_quant_0 < 3) || _0_quant_0 < 3 && read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0) <= _0_quant_0 + 1)
; [eval] !(_LET_1 <= _0_quant_0)
; [eval] _LET_1 <= _0_quant_0
(push) ; 8
; [then-branch: 15 | !(First:(First:($t@120@01)) <= _0_quant_0@132@01) | live]
; [else-branch: 15 | First:(First:($t@120@01)) <= _0_quant_0@132@01 | live]
(push) ; 9
; [then-branch: 15 | !(First:(First:($t@120@01)) <= _0_quant_0@132@01)]
(assert (not
  (<=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01)))
    _0_quant_0@132@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 15 | First:(First:($t@120@01)) <= _0_quant_0@132@01]
(assert (<=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01)))
  _0_quant_0@132@01))
; [eval] !(_0_quant_0 < 3)
; [eval] _0_quant_0 < 3
(push) ; 10
; [then-branch: 16 | !(_0_quant_0@132@01 < 3) | live]
; [else-branch: 16 | _0_quant_0@132@01 < 3 | live]
(push) ; 11
; [then-branch: 16 | !(_0_quant_0@132@01 < 3)]
(assert (not (< _0_quant_0@132@01 3)))
(pop) ; 11
(push) ; 11
; [else-branch: 16 | _0_quant_0@132@01 < 3]
(assert (< _0_quant_0@132@01 3))
; [eval] _0_quant_0 < 3 && read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0) <= _0_quant_0 + 1
; [eval] _0_quant_0 < 3
(push) ; 12
; [then-branch: 17 | _0_quant_0@132@01 < 3 | live]
; [else-branch: 17 | !(_0_quant_0@132@01 < 3) | live]
(push) ; 13
; [then-branch: 17 | _0_quant_0@132@01 < 3]
; [eval] read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0) <= _0_quant_0 + 1
; [eval] read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0)
; [eval] snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1)
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
(assert (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition ($Snap.second $t@120@01) ret@59@01))
(pop) ; 14
; Joined path conditions
(assert (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition ($Snap.second $t@120@01) ret@59@01))
; [eval] _0_quant_0 + 1
(pop) ; 13
(set-option :timeout 0)
(push) ; 13
; [else-branch: 17 | !(_0_quant_0@132@01 < 3)]
(assert (not (< _0_quant_0@132@01 3)))
(pop) ; 13
(pop) ; 12
; Joined path conditions
(assert (=>
  (< _0_quant_0@132@01 3)
  (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition ($Snap.second $t@120@01) ret@59@01)))
; Joined path conditions
(assert (or (not (< _0_quant_0@132@01 3)) (< _0_quant_0@132@01 3)))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (=>
  (< _0_quant_0@132@01 3)
  (and
    (< _0_quant_0@132@01 3)
    (=>
      (< _0_quant_0@132@01 3)
      (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition ($Snap.second $t@120@01) ret@59@01))
    (or (not (< _0_quant_0@132@01 3)) (< _0_quant_0@132@01 3)))))
(assert (or (< _0_quant_0@132@01 3) (not (< _0_quant_0@132@01 3))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (<=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01)))
    _0_quant_0@132@01)
  (and
    (<=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01)))
      _0_quant_0@132@01)
    (=>
      (< _0_quant_0@132@01 3)
      (and
        (< _0_quant_0@132@01 3)
        (=>
          (< _0_quant_0@132@01 3)
          (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition ($Snap.second $t@120@01) ret@59@01))
        (or (not (< _0_quant_0@132@01 3)) (< _0_quant_0@132@01 3))))
    (or (< _0_quant_0@132@01 3) (not (< _0_quant_0@132@01 3))))))
(assert (or
  (<=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01)))
    _0_quant_0@132@01)
  (not
    (<=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01)))
      _0_quant_0@132@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 14 | !(0 <= _0_quant_0@132@01)]
(assert (not (<= 0 _0_quant_0@132@01)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (<= 0 _0_quant_0@132@01)
  (and
    (<= 0 _0_quant_0@132@01)
    (=>
      (<=
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01)))
        _0_quant_0@132@01)
      (and
        (<=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01)))
          _0_quant_0@132@01)
        (=>
          (< _0_quant_0@132@01 3)
          (and
            (< _0_quant_0@132@01 3)
            (=>
              (< _0_quant_0@132@01 3)
              (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition ($Snap.second $t@120@01) ret@59@01))
            (or (not (< _0_quant_0@132@01 3)) (< _0_quant_0@132@01 3))))
        (or (< _0_quant_0@132@01 3) (not (< _0_quant_0@132@01 3)))))
    (or
      (<=
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01)))
        _0_quant_0@132@01)
      (not
        (<=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01)))
          _0_quant_0@132@01))))))
; Joined path conditions
(assert (or (not (<= 0 _0_quant_0@132@01)) (<= 0 _0_quant_0@132@01)))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((_0_quant_0@132@01 Int)) (!
  (and
    (=>
      (<= 0 _0_quant_0@132@01)
      (and
        (<= 0 _0_quant_0@132@01)
        (=>
          (<=
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01)))
            _0_quant_0@132@01)
          (and
            (<=
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01)))
              _0_quant_0@132@01)
            (=>
              (< _0_quant_0@132@01 3)
              (and
                (< _0_quant_0@132@01 3)
                (=>
                  (< _0_quant_0@132@01 3)
                  (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition ($Snap.second $t@120@01) ret@59@01))
                (or (not (< _0_quant_0@132@01 3)) (< _0_quant_0@132@01 3))))
            (or (< _0_quant_0@132@01 3) (not (< _0_quant_0@132@01 3)))))
        (or
          (<=
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01)))
            _0_quant_0@132@01)
          (not
            (<=
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01)))
              _0_quant_0@132@01)))))
    (or (not (<= 0 _0_quant_0@132@01)) (<= 0 _0_quant_0@132@01)))
  :pattern ((read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$<Int> (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize ($Snap.second $t@120@01) ret@59@01) _0_quant_0@132@01))
  :qid |prog.l765-aux|)))
(assert (forall ((_0_quant_0@132@01 Int)) (!
  (=>
    (<= 0 _0_quant_0@132@01)
    (or
      (not
        (<=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01)))
          _0_quant_0@132@01))
      (or
        (not (< _0_quant_0@132@01 3))
        (and
          (<=
            (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$<Int> (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize ($Snap.second $t@120@01) ret@59@01) _0_quant_0@132@01)
            (+ _0_quant_0@132@01 1))
          (< _0_quant_0@132@01 3)))))
  :pattern ((read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$<Int> (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize ($Snap.second $t@120@01) ret@59@01) _0_quant_0@132@01))
  :qid |prog.l765|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@129@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@129@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@129@01))))
  $Snap.unit))
; [eval] _2.val_int < 3
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01))))
  $Snap.unit))
; [eval] read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _2.val_int) <= _2.val_int + 1
; [eval] read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _2.val_int)
; [eval] snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1)
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
(assert (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition ($Snap.second $t@120@01) ret@59@01))
(pop) ; 5
; Joined path conditions
(assert (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition ($Snap.second $t@120@01) ret@59@01))
; [eval] _2.val_int + 1
(assert (<=
  (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$<Int> (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize ($Snap.second $t@120@01) ret@59@01) ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01))))
  (+ ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01))) 1)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; __t4 := true
; [exec]
; __t5 := true
; [exec]
; _12 := builtin$havoc_ref()
(declare-const ret@133@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_12.val_bool, write)
(declare-const $t@134@01 Bool)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@67@01 ret@133@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@69@01 ret@133@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@124@01 ret@133@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@127@01 ret@133@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(assert (not (= ret@133@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _12.val_bool := false
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@127@01 ret@133@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@124@01 ret@133@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@69@01 ret@133@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@67@01 ret@133@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
; [exec]
; __t22 := _12.val_bool
; [exec]
; __t6 := true
; [exec]
; __t7 := true
; [exec]
; _17 := builtin$havoc_ref()
(declare-const ret@135@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_17.val_bool, write)
(declare-const $t@136@01 Bool)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@67@01 ret@135@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@69@01 ret@135@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@124@01 ret@135@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@127@01 ret@135@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@135@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@135@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _17.val_bool := false
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@135@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@127@01 ret@135@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@124@01 ret@135@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@69@01 ret@135@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@67@01 ret@135@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
; [exec]
; __t23 := _17.val_bool
; [exec]
; __t8 := true
; [exec]
; __t9 := true
; [exec]
; _22 := builtin$havoc_ref()
(declare-const ret@137@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_22.val_bool, write)
(declare-const $t@138@01 Bool)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@67@01 ret@137@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@69@01 ret@137@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@124@01 ret@137@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@127@01 ret@137@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@137@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@137@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(assert (not (= ret@137@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _22.val_bool := false
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@137@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@137@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@127@01 ret@137@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@124@01 ret@137@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@69@01 ret@137@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@67@01 ret@137@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
; [exec]
; __t24 := _22.val_bool
; [exec]
; __t10 := true
; [exec]
; __t11 := true
; [exec]
; _28 := builtin$havoc_int()
(declare-const ret@139@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _28 := _2.val_int
(declare-const _28@140@01 Int)
(assert (= _28@140@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01)))))
; [exec]
; label l6
; [exec]
; assert acc(Array$3$usize(_1), read$())
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
; _29 := builtin$havoc_int()
(declare-const ret@141@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _29 := 3
; [exec]
; _30 := builtin$havoc_ref()
(declare-const ret@142@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_30.val_bool, write)
(declare-const $t@143@01 Bool)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@67@01 ret@142@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@69@01 ret@142@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@124@01 ret@142@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@127@01 ret@142@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@142@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@142@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@142@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@142@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _30.val_bool := _28 < _29
; [eval] _28 < _29
(declare-const val_bool@144@01 Bool)
(assert (= val_bool@144@01 (< _28@140@01 3)))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@142@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@142@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@142@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@127@01 ret@142@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@124@01 ret@142@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@69@01 ret@142@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@67@01 ret@142@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t25 := _30.val_bool
; [exec]
; assert __t25
(set-option :timeout 0)
(push) ; 5
(assert (not val_bool@144@01))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert val_bool@144@01)
; [exec]
; __t12 := true
; [exec]
; __t26 := builtin$havoc_int()
(declare-const ret@145@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale __t26 >= 0
(declare-const $t@146@01 $Snap)
(assert (= $t@146@01 $Snap.unit))
; [eval] __t26 >= 0
(assert (>= ret@145@01 0))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert acc(Array$3$usize(_1), read$())
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
; inhale lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$(_1,
;   _28) ==
;   __t26
(declare-const $t@147@01 $Snap)
(assert (= $t@147@01 $Snap.unit))
; [eval] lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$(_1, _28) == __t26
; [eval] lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$(_1, _28)
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
; 0.01s
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
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 6
(assert (not (<= 0 _28@140@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 _28@140@01))
; [eval] idx < 3
(push) ; 6
(assert (not (< _28@140@01 3)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (< _28@140@01 3))
(assert (lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$%precondition ($Snap.combine
  ($Snap.second $t@120@01)
  ($Snap.combine $Snap.unit $Snap.unit)) ret@59@01 _28@140@01))
(pop) ; 5
; Joined path conditions
(assert (and
  (<= 0 _28@140@01)
  (< _28@140@01 3)
  (lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$%precondition ($Snap.combine
    ($Snap.second $t@120@01)
    ($Snap.combine $Snap.unit $Snap.unit)) ret@59@01 _28@140@01)))
(assert (=
  (lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$ ($Snap.combine
    ($Snap.second $t@120@01)
    ($Snap.combine $Snap.unit $Snap.unit)) ret@59@01 _28@140@01)
  ret@145@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _27 := builtin$havoc_int()
(declare-const ret@148@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale __t26 >= 0
(declare-const $t@149@01 $Snap)
(assert (= $t@149@01 $Snap.unit))
; [eval] __t26 >= 0
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _27 := __t26
; [exec]
; label l7
; [exec]
; _31 := builtin$havoc_ref()
(declare-const ret@150@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_31.tuple_0, write)
(declare-const $t@151@01 $Ref)
(assert (not (= ret@150@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_31.tuple_0.val_int, write)
(declare-const $t@152@01 Int)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@76@01 $t@151@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@151@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_31.tuple_1, write)
(declare-const $t@153@01 $Ref)
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(_31.tuple_1.val_bool, write)
(declare-const $t@154@01 Bool)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@142@01 $t@153@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@137@01 $t@153@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@135@01 $t@153@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@133@01 $t@153@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@127@01 $t@153@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@124@01 $t@153@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@69@01 $t@153@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@67@01 $t@153@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@153@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _31.tuple_0.val_int := _27 + 1
; [eval] _27 + 1
(declare-const val_int@155@01 Int)
(assert (= val_int@155@01 (+ ret@145@01 1)))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@76@01 $t@151@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
; [exec]
; _31.tuple_1.val_bool := false
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@142@01 $t@153@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@137@01 $t@153@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@135@01 $t@153@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@133@01 $t@153@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@127@01 $t@153@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@124@01 $t@153@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@69@01 $t@153@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@67@01 $t@153@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t27 := _31.tuple_1.val_bool
; [exec]
; assert !__t27
; [eval] !__t27
; [exec]
; __t13 := true
; [exec]
; _26 := _31.tuple_0
; [exec]
; label l8
; [exec]
; _32 := builtin$havoc_ref()
(declare-const ret@156@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_32.val_int, write)
(declare-const $t@157@01 Int)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= $t@151@01 ret@156@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@76@01 ret@156@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(assert (not (= ret@156@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _32.val_int := _26.val_int
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@76@01 ret@156@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= $t@151@01 ret@156@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
; [exec]
; label l9
; [exec]
; _33 := builtin$havoc_int()
(declare-const ret@158@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _33 := _2.val_int
(declare-const _33@159@01 Int)
(assert (= _33@159@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01)))))
; [exec]
; label l10
; [exec]
; assert acc(Array$3$usize(_1), read$())
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
; _34 := builtin$havoc_int()
(declare-const ret@160@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _34 := 3
; [exec]
; _35 := builtin$havoc_ref()
(declare-const ret@161@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_35.val_bool, write)
(declare-const $t@162@01 Bool)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@67@01 ret@161@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@69@01 ret@161@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@124@01 ret@161@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@127@01 ret@161@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@161@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@161@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@161@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@161@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= $t@153@01 ret@161@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@161@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _35.val_bool := _33 < _34
; [eval] _33 < _34
(declare-const val_bool@163@01 Bool)
(assert (= val_bool@163@01 (< _33@159@01 3)))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= $t@153@01 ret@161@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@161@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@161@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@161@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@161@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@127@01 ret@161@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@124@01 ret@161@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@69@01 ret@161@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@67@01 ret@161@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
; [exec]
; __t28 := _35.val_bool
; [exec]
; assert __t28
(set-option :timeout 0)
(push) ; 5
(assert (not val_bool@163@01))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert val_bool@163@01)
; [exec]
; __t14 := true
; [exec]
; label l11
; [exec]
; exhale acc(Array$3$usize(_1), write)
; [exec]
; inhale acc(Array$3$usize(_1), write)
(declare-const $t@164@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (let _LET_2 ==
;     (old[l11](_33)) in
;     (forall i: Int ::
;       { lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$(old[l11](_1),
;       i) }
;       0 <= i && (i < 3 && !(i == _LET_2)) ==>
;       lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$(_1, i) ==
;       old[l11](lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$(_1,
;       i))))
(declare-const $t@165@01 $Snap)
(assert (= $t@165@01 $Snap.unit))
; [eval] (let _LET_2 == (old[l11](_33)) in (forall i: Int :: { lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$(old[l11](_1), i) } 0 <= i && (i < 3 && !(i == _LET_2)) ==> lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$(_1, i) == old[l11](lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$(_1, i))))
; [eval] old[l11](_33)
(declare-const letvar@166@01 Int)
(assert (= (as letvar@166@01  Int) _33@159@01))
; [eval] (forall i: Int :: { lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$(old[l11](_1), i) } 0 <= i && (i < 3 && !(i == _LET_2)) ==> lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$(_1, i) == old[l11](lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$(_1, i)))
(declare-const i@167@01 Int)
(set-option :timeout 0)
(push) ; 5
; [eval] 0 <= i && (i < 3 && !(i == _LET_2)) ==> lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$(_1, i) == old[l11](lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$(_1, i))
; [eval] 0 <= i && (i < 3 && !(i == _LET_2))
; [eval] 0 <= i
(push) ; 6
; [then-branch: 18 | 0 <= i@167@01 | live]
; [else-branch: 18 | !(0 <= i@167@01) | live]
(push) ; 7
; [then-branch: 18 | 0 <= i@167@01]
(assert (<= 0 i@167@01))
; [eval] i < 3
(push) ; 8
; [then-branch: 19 | i@167@01 < 3 | live]
; [else-branch: 19 | !(i@167@01 < 3) | live]
(push) ; 9
; [then-branch: 19 | i@167@01 < 3]
(assert (< i@167@01 3))
; [eval] !(i == _LET_2)
; [eval] i == _LET_2
(pop) ; 9
(push) ; 9
; [else-branch: 19 | !(i@167@01 < 3)]
(assert (not (< i@167@01 3)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (not (< i@167@01 3)) (< i@167@01 3)))
(pop) ; 7
(push) ; 7
; [else-branch: 18 | !(0 <= i@167@01)]
(assert (not (<= 0 i@167@01)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (<= 0 i@167@01)
  (and (<= 0 i@167@01) (or (not (< i@167@01 3)) (< i@167@01 3)))))
; Joined path conditions
(assert (or (not (<= 0 i@167@01)) (<= 0 i@167@01)))
(push) ; 6
; [then-branch: 20 | i@167@01 != _33@159@01 && i@167@01 < 3 && 0 <= i@167@01 | live]
; [else-branch: 20 | !(i@167@01 != _33@159@01 && i@167@01 < 3 && 0 <= i@167@01) | live]
(push) ; 7
; [then-branch: 20 | i@167@01 != _33@159@01 && i@167@01 < 3 && 0 <= i@167@01]
(assert (and (and (not (= i@167@01 _33@159@01)) (< i@167@01 3)) (<= 0 i@167@01)))
; [eval] lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$(_1, i) == old[l11](lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$(_1, i))
; [eval] lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$(_1, i)
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
; 0.01s
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
; [eval] 0 <= idx
; [eval] idx < 3
(assert (lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$%precondition ($Snap.combine
  $t@164@01
  ($Snap.combine $Snap.unit $Snap.unit)) ret@59@01 i@167@01))
(pop) ; 8
; Joined path conditions
(assert (lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$%precondition ($Snap.combine
  $t@164@01
  ($Snap.combine $Snap.unit $Snap.unit)) ret@59@01 i@167@01))
; [eval] old[l11](lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$(_1, i))
; [eval] lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$(_1, i)
(set-option :timeout 0)
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
; [eval] 0 <= idx
; [eval] idx < 3
(assert (lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$%precondition ($Snap.combine
  ($Snap.second $t@120@01)
  ($Snap.combine $Snap.unit $Snap.unit)) ret@59@01 i@167@01))
(pop) ; 8
; Joined path conditions
(assert (lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$%precondition ($Snap.combine
  ($Snap.second $t@120@01)
  ($Snap.combine $Snap.unit $Snap.unit)) ret@59@01 i@167@01))
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 20 | !(i@167@01 != _33@159@01 && i@167@01 < 3 && 0 <= i@167@01)]
(assert (not (and (and (not (= i@167@01 _33@159@01)) (< i@167@01 3)) (<= 0 i@167@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (and (and (not (= i@167@01 _33@159@01)) (< i@167@01 3)) (<= 0 i@167@01))
  (and
    (not (= i@167@01 _33@159@01))
    (< i@167@01 3)
    (<= 0 i@167@01)
    (lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$%precondition ($Snap.combine
      $t@164@01
      ($Snap.combine $Snap.unit $Snap.unit)) ret@59@01 i@167@01)
    (lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$%precondition ($Snap.combine
      ($Snap.second $t@120@01)
      ($Snap.combine $Snap.unit $Snap.unit)) ret@59@01 i@167@01))))
; Joined path conditions
(assert (or
  (not (and (and (not (= i@167@01 _33@159@01)) (< i@167@01 3)) (<= 0 i@167@01)))
  (and (and (not (= i@167@01 _33@159@01)) (< i@167@01 3)) (<= 0 i@167@01))))
; [eval] lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$(old[l11](_1), i)
; [eval] old[l11](_1)
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
; 0.01s
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
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 7
(assert (not (<= 0 i@167@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@161@01 $t@153@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@153@01 ret@142@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@142@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@137@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@153@01 ret@137@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@137@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@135@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@135@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@153@01 ret@135@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@135@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@133@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@133@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@133@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@153@01 ret@133@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@133@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@127@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@127@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@127@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@127@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@153@01 ret@127@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@127@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@127@01 ret@124@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@124@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@124@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@124@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@124@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@153@01 ret@124@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@124@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@156@01 ret@76@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@124@01 ret@69@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@127@01 ret@69@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@69@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@69@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@69@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@69@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@153@01 ret@69@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@69@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@69@01 ret@67@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@124@01 ret@67@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@127@01 ret@67@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@67@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@67@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@67@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@67@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@153@01 ret@67@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@67@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@76@01 $t@151@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@156@01 $t@151@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    val_int@155@01
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01)))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01)))
    val_int@155@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01)))
    val_int@155@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    val_int@155@01
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01)))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= true val_bool@126@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= true val_bool@144@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= true val_bool@163@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@126@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@144@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@163@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@126@01 true))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@126@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@126@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@126@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@126@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@126@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@126@01 val_bool@144@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@126@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@126@01 val_bool@163@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@126@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@144@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@163@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@126@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@144@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@163@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@126@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@144@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@163@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@126@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@144@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@163@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@144@01 true))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@144@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@144@01 val_bool@126@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@144@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@144@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@144@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@144@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@144@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@144@01 val_bool@163@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@126@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@144@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@163@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@163@01 true))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@163@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@163@01 val_bool@126@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@163@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@163@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@163@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@163@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@163@01 val_bool@144@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@163@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and
    (and (not (= $t@151@01 ret@76@01)) (not (= $t@151@01 ret@156@01)))
    (and (not (= ret@76@01 $t@151@01)) (not (= ret@76@01 ret@156@01)))
    (and (not (= ret@156@01 $t@151@01)) (not (= ret@156@01 ret@76@01))))
  (and
    (and
      (not (= ret@67@01 ret@69@01))
      (not (= ret@67@01 ret@124@01))
      (not (= ret@67@01 ret@127@01))
      (not (= ret@67@01 ret@133@01))
      (not (= ret@67@01 ret@135@01))
      (not (= ret@67@01 ret@137@01))
      (not (= ret@67@01 ret@142@01))
      (not (= ret@67@01 $t@153@01))
      (not (= ret@67@01 ret@161@01)))
    (and
      (not (= ret@69@01 ret@67@01))
      (not (= ret@69@01 ret@124@01))
      (not (= ret@69@01 ret@127@01))
      (not (= ret@69@01 ret@133@01))
      (not (= ret@69@01 ret@135@01))
      (not (= ret@69@01 ret@137@01))
      (not (= ret@69@01 ret@142@01))
      (not (= ret@69@01 $t@153@01))
      (not (= ret@69@01 ret@161@01)))
    (and
      (not (= ret@124@01 ret@67@01))
      (not (= ret@124@01 ret@69@01))
      (not (= ret@124@01 ret@127@01))
      (not (= ret@124@01 ret@133@01))
      (not (= ret@124@01 ret@135@01))
      (not (= ret@124@01 ret@137@01))
      (not (= ret@124@01 ret@142@01))
      (not (= ret@124@01 $t@153@01))
      (not (= ret@124@01 ret@161@01)))
    (and
      (not (= ret@127@01 ret@67@01))
      (not (= ret@127@01 ret@69@01))
      (not (= ret@127@01 ret@124@01))
      (not (= ret@127@01 ret@133@01))
      (not (= ret@127@01 ret@135@01))
      (not (= ret@127@01 ret@137@01))
      (not (= ret@127@01 ret@142@01))
      (not (= ret@127@01 $t@153@01))
      (not (= ret@127@01 ret@161@01)))
    (and
      (not (= ret@133@01 ret@67@01))
      (not (= ret@133@01 ret@69@01))
      (not (= ret@133@01 ret@124@01))
      (not (= ret@133@01 ret@127@01))
      (not (= ret@133@01 ret@135@01))
      (not (= ret@133@01 ret@137@01))
      (not (= ret@133@01 ret@142@01))
      (not (= ret@133@01 $t@153@01))
      (not (= ret@133@01 ret@161@01)))
    (and
      (not (= ret@135@01 ret@67@01))
      (not (= ret@135@01 ret@69@01))
      (not (= ret@135@01 ret@124@01))
      (not (= ret@135@01 ret@127@01))
      (not (= ret@135@01 ret@133@01))
      (not (= ret@135@01 ret@137@01))
      (not (= ret@135@01 ret@142@01))
      (not (= ret@135@01 $t@153@01))
      (not (= ret@135@01 ret@161@01)))
    (and
      (not (= ret@137@01 ret@67@01))
      (not (= ret@137@01 ret@69@01))
      (not (= ret@137@01 ret@124@01))
      (not (= ret@137@01 ret@127@01))
      (not (= ret@137@01 ret@133@01))
      (not (= ret@137@01 ret@135@01))
      (not (= ret@137@01 ret@142@01))
      (not (= ret@137@01 $t@153@01))
      (not (= ret@137@01 ret@161@01)))
    (and
      (not (= ret@142@01 ret@67@01))
      (not (= ret@142@01 ret@69@01))
      (not (= ret@142@01 ret@124@01))
      (not (= ret@142@01 ret@127@01))
      (not (= ret@142@01 ret@133@01))
      (not (= ret@142@01 ret@135@01))
      (not (= ret@142@01 ret@137@01))
      (not (= ret@142@01 $t@153@01))
      (not (= ret@142@01 ret@161@01)))
    (and
      (not (= $t@153@01 ret@67@01))
      (not (= $t@153@01 ret@69@01))
      (not (= $t@153@01 ret@124@01))
      (not (= $t@153@01 ret@127@01))
      (not (= $t@153@01 ret@133@01))
      (not (= $t@153@01 ret@135@01))
      (not (= $t@153@01 ret@137@01))
      (not (= $t@153@01 ret@142@01))
      (not (= $t@153@01 ret@161@01)))
    (and
      (not (= ret@161@01 ret@67@01))
      (not (= ret@161@01 ret@69@01))
      (not (= ret@161@01 ret@124@01))
      (not (= ret@161@01 ret@127@01))
      (not (= ret@161@01 ret@133@01))
      (not (= ret@161@01 ret@135@01))
      (not (= ret@161@01 ret@137@01))
      (not (= ret@161@01 ret@142@01))
      (not (= ret@161@01 $t@153@01))))))
(assert (and
  (and
    (not (= ret@67@01 ret@69@01))
    (not (= ret@67@01 ret@127@01))
    (not (= ret@67@01 ret@133@01))
    (not (= ret@67@01 ret@135@01))
    (not (= ret@67@01 ret@137@01))
    (not (= ret@67@01 $t@153@01)))
  (and
    (not (= ret@69@01 ret@67@01))
    (not (= ret@69@01 ret@124@01))
    (not (= ret@69@01 ret@142@01))
    (not (= ret@69@01 ret@161@01)))
  (and
    (not (= ret@124@01 ret@69@01))
    (not (= ret@124@01 ret@127@01))
    (not (= ret@124@01 ret@133@01))
    (not (= ret@124@01 ret@135@01))
    (not (= ret@124@01 ret@137@01))
    (not (= ret@124@01 $t@153@01)))
  (and
    (not (= ret@127@01 ret@67@01))
    (not (= ret@127@01 ret@124@01))
    (not (= ret@127@01 ret@142@01))
    (not (= ret@127@01 ret@161@01)))
  (and
    (not (= ret@133@01 ret@67@01))
    (not (= ret@133@01 ret@124@01))
    (not (= ret@133@01 ret@142@01))
    (not (= ret@133@01 ret@161@01)))
  (and
    (not (= ret@135@01 ret@67@01))
    (not (= ret@135@01 ret@124@01))
    (not (= ret@135@01 ret@142@01))
    (not (= ret@135@01 ret@161@01)))
  (and
    (not (= ret@137@01 ret@67@01))
    (not (= ret@137@01 ret@124@01))
    (not (= ret@137@01 ret@142@01))
    (not (= ret@137@01 ret@161@01)))
  (and
    (not (= ret@142@01 ret@69@01))
    (not (= ret@142@01 ret@127@01))
    (not (= ret@142@01 ret@133@01))
    (not (= ret@142@01 ret@135@01))
    (not (= ret@142@01 ret@137@01))
    (not (= ret@142@01 $t@153@01)))
  (and
    (not (= $t@153@01 ret@67@01))
    (not (= $t@153@01 ret@124@01))
    (not (= $t@153@01 ret@142@01))
    (not (= $t@153@01 ret@161@01)))
  (and
    (not (= ret@161@01 ret@69@01))
    (not (= ret@161@01 ret@127@01))
    (not (= ret@161@01 ret@133@01))
    (not (= ret@161@01 ret@135@01))
    (not (= ret@161@01 ret@137@01))
    (not (= ret@161@01 $t@153@01)))))
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 7
(assert (not (<= 0 i@167@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@161@01 $t@153@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@153@01 ret@142@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@142@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@137@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@153@01 ret@137@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@137@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@135@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@135@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@153@01 ret@135@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.11s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@135@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@133@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@133@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@133@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@153@01 ret@133@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@133@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@127@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@127@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@127@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@127@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@153@01 ret@127@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@127@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@127@01 ret@124@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@124@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@124@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@124@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@124@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@153@01 ret@124@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@124@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@156@01 ret@76@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@124@01 ret@69@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@127@01 ret@69@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@69@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@69@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@69@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@69@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@153@01 ret@69@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@69@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@69@01 ret@67@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@124@01 ret@67@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@127@01 ret@67@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@67@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@67@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@67@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@67@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@153@01 ret@67@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@67@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@76@01 $t@151@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@156@01 $t@151@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    val_int@155@01
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01)))))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01)))
    val_int@155@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01)))
    val_int@155@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    val_int@155@01
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01)))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= true val_bool@126@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= true val_bool@144@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= true val_bool@163@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@126@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@144@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@163@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@126@01 true))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@126@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@126@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@126@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@126@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@126@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@126@01 val_bool@144@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@126@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@126@01 val_bool@163@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@126@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@144@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@163@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@126@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@144@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@163@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@126@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@144@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@163@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@126@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@144@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@163@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@144@01 true))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@144@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@144@01 val_bool@126@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@144@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@144@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@144@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@144@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@144@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@144@01 val_bool@163@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@126@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@144@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@163@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@163@01 true))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@163@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@163@01 val_bool@126@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@163@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@163@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@163@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@163@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@163@01 val_bool@144@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@163@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and
    (and (not (= $t@151@01 ret@76@01)) (not (= $t@151@01 ret@156@01)))
    (and (not (= ret@76@01 $t@151@01)) (not (= ret@76@01 ret@156@01)))
    (and (not (= ret@156@01 $t@151@01)) (not (= ret@156@01 ret@76@01))))
  (and
    (and
      (not (= ret@67@01 ret@69@01))
      (not (= ret@67@01 ret@124@01))
      (not (= ret@67@01 ret@127@01))
      (not (= ret@67@01 ret@133@01))
      (not (= ret@67@01 ret@135@01))
      (not (= ret@67@01 ret@137@01))
      (not (= ret@67@01 ret@142@01))
      (not (= ret@67@01 $t@153@01))
      (not (= ret@67@01 ret@161@01)))
    (and
      (not (= ret@69@01 ret@67@01))
      (not (= ret@69@01 ret@124@01))
      (not (= ret@69@01 ret@127@01))
      (not (= ret@69@01 ret@133@01))
      (not (= ret@69@01 ret@135@01))
      (not (= ret@69@01 ret@137@01))
      (not (= ret@69@01 ret@142@01))
      (not (= ret@69@01 $t@153@01))
      (not (= ret@69@01 ret@161@01)))
    (and
      (not (= ret@124@01 ret@67@01))
      (not (= ret@124@01 ret@69@01))
      (not (= ret@124@01 ret@127@01))
      (not (= ret@124@01 ret@133@01))
      (not (= ret@124@01 ret@135@01))
      (not (= ret@124@01 ret@137@01))
      (not (= ret@124@01 ret@142@01))
      (not (= ret@124@01 $t@153@01))
      (not (= ret@124@01 ret@161@01)))
    (and
      (not (= ret@127@01 ret@67@01))
      (not (= ret@127@01 ret@69@01))
      (not (= ret@127@01 ret@124@01))
      (not (= ret@127@01 ret@133@01))
      (not (= ret@127@01 ret@135@01))
      (not (= ret@127@01 ret@137@01))
      (not (= ret@127@01 ret@142@01))
      (not (= ret@127@01 $t@153@01))
      (not (= ret@127@01 ret@161@01)))
    (and
      (not (= ret@133@01 ret@67@01))
      (not (= ret@133@01 ret@69@01))
      (not (= ret@133@01 ret@124@01))
      (not (= ret@133@01 ret@127@01))
      (not (= ret@133@01 ret@135@01))
      (not (= ret@133@01 ret@137@01))
      (not (= ret@133@01 ret@142@01))
      (not (= ret@133@01 $t@153@01))
      (not (= ret@133@01 ret@161@01)))
    (and
      (not (= ret@135@01 ret@67@01))
      (not (= ret@135@01 ret@69@01))
      (not (= ret@135@01 ret@124@01))
      (not (= ret@135@01 ret@127@01))
      (not (= ret@135@01 ret@133@01))
      (not (= ret@135@01 ret@137@01))
      (not (= ret@135@01 ret@142@01))
      (not (= ret@135@01 $t@153@01))
      (not (= ret@135@01 ret@161@01)))
    (and
      (not (= ret@137@01 ret@67@01))
      (not (= ret@137@01 ret@69@01))
      (not (= ret@137@01 ret@124@01))
      (not (= ret@137@01 ret@127@01))
      (not (= ret@137@01 ret@133@01))
      (not (= ret@137@01 ret@135@01))
      (not (= ret@137@01 ret@142@01))
      (not (= ret@137@01 $t@153@01))
      (not (= ret@137@01 ret@161@01)))
    (and
      (not (= ret@142@01 ret@67@01))
      (not (= ret@142@01 ret@69@01))
      (not (= ret@142@01 ret@124@01))
      (not (= ret@142@01 ret@127@01))
      (not (= ret@142@01 ret@133@01))
      (not (= ret@142@01 ret@135@01))
      (not (= ret@142@01 ret@137@01))
      (not (= ret@142@01 $t@153@01))
      (not (= ret@142@01 ret@161@01)))
    (and
      (not (= $t@153@01 ret@67@01))
      (not (= $t@153@01 ret@69@01))
      (not (= $t@153@01 ret@124@01))
      (not (= $t@153@01 ret@127@01))
      (not (= $t@153@01 ret@133@01))
      (not (= $t@153@01 ret@135@01))
      (not (= $t@153@01 ret@137@01))
      (not (= $t@153@01 ret@142@01))
      (not (= $t@153@01 ret@161@01)))
    (and
      (not (= ret@161@01 ret@67@01))
      (not (= ret@161@01 ret@69@01))
      (not (= ret@161@01 ret@124@01))
      (not (= ret@161@01 ret@127@01))
      (not (= ret@161@01 ret@133@01))
      (not (= ret@161@01 ret@135@01))
      (not (= ret@161@01 ret@137@01))
      (not (= ret@161@01 ret@142@01))
      (not (= ret@161@01 $t@153@01))))))
(assert (and
  (and
    (not (= ret@67@01 ret@69@01))
    (not (= ret@67@01 ret@127@01))
    (not (= ret@67@01 ret@133@01))
    (not (= ret@67@01 ret@135@01))
    (not (= ret@67@01 ret@137@01))
    (not (= ret@67@01 $t@153@01)))
  (and
    (not (= ret@69@01 ret@67@01))
    (not (= ret@69@01 ret@124@01))
    (not (= ret@69@01 ret@142@01))
    (not (= ret@69@01 ret@161@01)))
  (and
    (not (= ret@124@01 ret@69@01))
    (not (= ret@124@01 ret@127@01))
    (not (= ret@124@01 ret@133@01))
    (not (= ret@124@01 ret@135@01))
    (not (= ret@124@01 ret@137@01))
    (not (= ret@124@01 $t@153@01)))
  (and
    (not (= ret@127@01 ret@67@01))
    (not (= ret@127@01 ret@124@01))
    (not (= ret@127@01 ret@142@01))
    (not (= ret@127@01 ret@161@01)))
  (and
    (not (= ret@133@01 ret@67@01))
    (not (= ret@133@01 ret@124@01))
    (not (= ret@133@01 ret@142@01))
    (not (= ret@133@01 ret@161@01)))
  (and
    (not (= ret@135@01 ret@67@01))
    (not (= ret@135@01 ret@124@01))
    (not (= ret@135@01 ret@142@01))
    (not (= ret@135@01 ret@161@01)))
  (and
    (not (= ret@137@01 ret@67@01))
    (not (= ret@137@01 ret@124@01))
    (not (= ret@137@01 ret@142@01))
    (not (= ret@137@01 ret@161@01)))
  (and
    (not (= ret@142@01 ret@69@01))
    (not (= ret@142@01 ret@127@01))
    (not (= ret@142@01 ret@133@01))
    (not (= ret@142@01 ret@135@01))
    (not (= ret@142@01 ret@137@01))
    (not (= ret@142@01 $t@153@01)))
  (and
    (not (= $t@153@01 ret@67@01))
    (not (= $t@153@01 ret@124@01))
    (not (= $t@153@01 ret@142@01))
    (not (= $t@153@01 ret@161@01)))
  (and
    (not (= ret@161@01 ret@69@01))
    (not (= ret@161@01 ret@127@01))
    (not (= ret@161@01 ret@133@01))
    (not (= ret@161@01 ret@135@01))
    (not (= ret@161@01 ret@137@01))
    (not (= ret@161@01 $t@153@01)))))
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 7
(assert (not (<= 0 i@167@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@161@01 $t@153@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@153@01 ret@142@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@142@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@137@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@153@01 ret@137@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@137@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@135@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@135@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@153@01 ret@135@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@135@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@133@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@133@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@133@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@153@01 ret@133@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@133@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@127@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@127@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@127@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@127@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@153@01 ret@127@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@127@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@127@01 ret@124@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@124@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@124@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@124@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@124@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@153@01 ret@124@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@124@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@156@01 ret@76@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@124@01 ret@69@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@127@01 ret@69@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@69@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@69@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@69@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@69@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@153@01 ret@69@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@69@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@69@01 ret@67@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@124@01 ret@67@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@127@01 ret@67@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@67@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@67@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@67@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@67@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@153@01 ret@67@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@67@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@76@01 $t@151@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@156@01 $t@151@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    val_int@155@01
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01)))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01)))
    val_int@155@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01)))
    val_int@155@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    val_int@155@01
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01)))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= true val_bool@126@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= true val_bool@144@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= true val_bool@163@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@126@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@144@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@163@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@126@01 true))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@126@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@126@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@126@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@126@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@126@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@126@01 val_bool@144@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@126@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@126@01 val_bool@163@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@126@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@144@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@163@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@126@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@144@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@163@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@126@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@144@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@163@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@126@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@144@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@163@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@144@01 true))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@144@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@144@01 val_bool@126@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@144@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@144@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@144@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@144@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@144@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@144@01 val_bool@163@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@126@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@144@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= false val_bool@163@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@163@01 true))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@163@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@163@01 val_bool@126@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@163@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@163@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@163@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@163@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@163@01 val_bool@144@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_bool@163@01 false))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and
    (and (not (= $t@151@01 ret@76@01)) (not (= $t@151@01 ret@156@01)))
    (and (not (= ret@76@01 $t@151@01)) (not (= ret@76@01 ret@156@01)))
    (and (not (= ret@156@01 $t@151@01)) (not (= ret@156@01 ret@76@01))))
  (and
    (and
      (not (= ret@67@01 ret@69@01))
      (not (= ret@67@01 ret@124@01))
      (not (= ret@67@01 ret@127@01))
      (not (= ret@67@01 ret@133@01))
      (not (= ret@67@01 ret@135@01))
      (not (= ret@67@01 ret@137@01))
      (not (= ret@67@01 ret@142@01))
      (not (= ret@67@01 $t@153@01))
      (not (= ret@67@01 ret@161@01)))
    (and
      (not (= ret@69@01 ret@67@01))
      (not (= ret@69@01 ret@124@01))
      (not (= ret@69@01 ret@127@01))
      (not (= ret@69@01 ret@133@01))
      (not (= ret@69@01 ret@135@01))
      (not (= ret@69@01 ret@137@01))
      (not (= ret@69@01 ret@142@01))
      (not (= ret@69@01 $t@153@01))
      (not (= ret@69@01 ret@161@01)))
    (and
      (not (= ret@124@01 ret@67@01))
      (not (= ret@124@01 ret@69@01))
      (not (= ret@124@01 ret@127@01))
      (not (= ret@124@01 ret@133@01))
      (not (= ret@124@01 ret@135@01))
      (not (= ret@124@01 ret@137@01))
      (not (= ret@124@01 ret@142@01))
      (not (= ret@124@01 $t@153@01))
      (not (= ret@124@01 ret@161@01)))
    (and
      (not (= ret@127@01 ret@67@01))
      (not (= ret@127@01 ret@69@01))
      (not (= ret@127@01 ret@124@01))
      (not (= ret@127@01 ret@133@01))
      (not (= ret@127@01 ret@135@01))
      (not (= ret@127@01 ret@137@01))
      (not (= ret@127@01 ret@142@01))
      (not (= ret@127@01 $t@153@01))
      (not (= ret@127@01 ret@161@01)))
    (and
      (not (= ret@133@01 ret@67@01))
      (not (= ret@133@01 ret@69@01))
      (not (= ret@133@01 ret@124@01))
      (not (= ret@133@01 ret@127@01))
      (not (= ret@133@01 ret@135@01))
      (not (= ret@133@01 ret@137@01))
      (not (= ret@133@01 ret@142@01))
      (not (= ret@133@01 $t@153@01))
      (not (= ret@133@01 ret@161@01)))
    (and
      (not (= ret@135@01 ret@67@01))
      (not (= ret@135@01 ret@69@01))
      (not (= ret@135@01 ret@124@01))
      (not (= ret@135@01 ret@127@01))
      (not (= ret@135@01 ret@133@01))
      (not (= ret@135@01 ret@137@01))
      (not (= ret@135@01 ret@142@01))
      (not (= ret@135@01 $t@153@01))
      (not (= ret@135@01 ret@161@01)))
    (and
      (not (= ret@137@01 ret@67@01))
      (not (= ret@137@01 ret@69@01))
      (not (= ret@137@01 ret@124@01))
      (not (= ret@137@01 ret@127@01))
      (not (= ret@137@01 ret@133@01))
      (not (= ret@137@01 ret@135@01))
      (not (= ret@137@01 ret@142@01))
      (not (= ret@137@01 $t@153@01))
      (not (= ret@137@01 ret@161@01)))
    (and
      (not (= ret@142@01 ret@67@01))
      (not (= ret@142@01 ret@69@01))
      (not (= ret@142@01 ret@124@01))
      (not (= ret@142@01 ret@127@01))
      (not (= ret@142@01 ret@133@01))
      (not (= ret@142@01 ret@135@01))
      (not (= ret@142@01 ret@137@01))
      (not (= ret@142@01 $t@153@01))
      (not (= ret@142@01 ret@161@01)))
    (and
      (not (= $t@153@01 ret@67@01))
      (not (= $t@153@01 ret@69@01))
      (not (= $t@153@01 ret@124@01))
      (not (= $t@153@01 ret@127@01))
      (not (= $t@153@01 ret@133@01))
      (not (= $t@153@01 ret@135@01))
      (not (= $t@153@01 ret@137@01))
      (not (= $t@153@01 ret@142@01))
      (not (= $t@153@01 ret@161@01)))
    (and
      (not (= ret@161@01 ret@67@01))
      (not (= ret@161@01 ret@69@01))
      (not (= ret@161@01 ret@124@01))
      (not (= ret@161@01 ret@127@01))
      (not (= ret@161@01 ret@133@01))
      (not (= ret@161@01 ret@135@01))
      (not (= ret@161@01 ret@137@01))
      (not (= ret@161@01 ret@142@01))
      (not (= ret@161@01 $t@153@01))))))
(assert (and
  (and
    (not (= ret@67@01 ret@69@01))
    (not (= ret@67@01 ret@127@01))
    (not (= ret@67@01 ret@133@01))
    (not (= ret@67@01 ret@135@01))
    (not (= ret@67@01 ret@137@01))
    (not (= ret@67@01 $t@153@01)))
  (and
    (not (= ret@69@01 ret@67@01))
    (not (= ret@69@01 ret@124@01))
    (not (= ret@69@01 ret@142@01))
    (not (= ret@69@01 ret@161@01)))
  (and
    (not (= ret@124@01 ret@69@01))
    (not (= ret@124@01 ret@127@01))
    (not (= ret@124@01 ret@133@01))
    (not (= ret@124@01 ret@135@01))
    (not (= ret@124@01 ret@137@01))
    (not (= ret@124@01 $t@153@01)))
  (and
    (not (= ret@127@01 ret@67@01))
    (not (= ret@127@01 ret@124@01))
    (not (= ret@127@01 ret@142@01))
    (not (= ret@127@01 ret@161@01)))
  (and
    (not (= ret@133@01 ret@67@01))
    (not (= ret@133@01 ret@124@01))
    (not (= ret@133@01 ret@142@01))
    (not (= ret@133@01 ret@161@01)))
  (and
    (not (= ret@135@01 ret@67@01))
    (not (= ret@135@01 ret@124@01))
    (not (= ret@135@01 ret@142@01))
    (not (= ret@135@01 ret@161@01)))
  (and
    (not (= ret@137@01 ret@67@01))
    (not (= ret@137@01 ret@124@01))
    (not (= ret@137@01 ret@142@01))
    (not (= ret@137@01 ret@161@01)))
  (and
    (not (= ret@142@01 ret@69@01))
    (not (= ret@142@01 ret@127@01))
    (not (= ret@142@01 ret@133@01))
    (not (= ret@142@01 ret@135@01))
    (not (= ret@142@01 ret@137@01))
    (not (= ret@142@01 $t@153@01)))
  (and
    (not (= $t@153@01 ret@67@01))
    (not (= $t@153@01 ret@124@01))
    (not (= $t@153@01 ret@142@01))
    (not (= $t@153@01 ret@161@01)))
  (and
    (not (= ret@161@01 ret@69@01))
    (not (= ret@161@01 ret@127@01))
    (not (= ret@161@01 ret@133@01))
    (not (= ret@161@01 ret@135@01))
    (not (= ret@161@01 ret@137@01))
    (not (= ret@161@01 $t@153@01)))))
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 7
(assert (not (<= 0 i@167@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@167@01 Int)) (!
  (and
    (=>
      (<= 0 i@167@01)
      (and (<= 0 i@167@01) (or (not (< i@167@01 3)) (< i@167@01 3))))
    (or (not (<= 0 i@167@01)) (<= 0 i@167@01))
    (=>
      (and (and (not (= i@167@01 _33@159@01)) (< i@167@01 3)) (<= 0 i@167@01))
      (and
        (not (= i@167@01 _33@159@01))
        (< i@167@01 3)
        (<= 0 i@167@01)
        (lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$%precondition ($Snap.combine
          $t@164@01
          ($Snap.combine $Snap.unit $Snap.unit)) ret@59@01 i@167@01)
        (lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$%precondition ($Snap.combine
          ($Snap.second $t@120@01)
          ($Snap.combine $Snap.unit $Snap.unit)) ret@59@01 i@167@01)))
    (or
      (not
        (and (and (not (= i@167@01 _33@159@01)) (< i@167@01 3)) (<= 0 i@167@01)))
      (and (and (not (= i@167@01 _33@159@01)) (< i@167@01 3)) (<= 0 i@167@01))))
  
  :qid |prog.l921-aux|)))
(assert (forall ((i@167@01 Int)) (!
  (=>
    (and (and (not (= i@167@01 _33@159@01)) (< i@167@01 3)) (<= 0 i@167@01))
    (=
      (lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$ ($Snap.combine
        $t@164@01
        ($Snap.combine $Snap.unit $Snap.unit)) ret@59@01 i@167@01)
      (lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$ ($Snap.combine
        ($Snap.second $t@120@01)
        ($Snap.combine $Snap.unit $Snap.unit)) ret@59@01 i@167@01)))
  
  :qid |prog.l921|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; __t29 := _32
; [exec]
; label l12
; [exec]
; inhale lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$(_1,
;   old[l11](_33)) ==
;   __t29.val_int
(declare-const $t@168@01 $Snap)
(assert (= $t@168@01 $Snap.unit))
; [eval] lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$(_1, old[l11](_33)) == __t29.val_int
; [eval] lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$(_1, old[l11](_33))
; [eval] old[l11](_33)
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
; 0.01s
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
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 6
(assert (not (<= 0 _33@159@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 _33@159@01))
; [eval] idx < 3
(push) ; 6
(assert (not (< _33@159@01 3)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (< _33@159@01 3))
(assert (lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$%precondition ($Snap.combine
  $t@164@01
  ($Snap.combine $Snap.unit $Snap.unit)) ret@59@01 _33@159@01))
(pop) ; 5
; Joined path conditions
(assert (and
  (<= 0 _33@159@01)
  (< _33@159@01 3)
  (lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$%precondition ($Snap.combine
    $t@164@01
    ($Snap.combine $Snap.unit $Snap.unit)) ret@59@01 _33@159@01)))
(assert (=
  (lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$ ($Snap.combine
    $t@164@01
    ($Snap.combine $Snap.unit $Snap.unit)) ret@59@01 _33@159@01)
  val_int@155@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _36 := builtin$havoc_ref()
(declare-const ret@169@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_36.tuple_0, write)
(declare-const $t@170@01 $Ref)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@150@01 ret@169@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@169@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_36.tuple_0.val_int, write)
(declare-const $t@171@01 Int)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= $t@151@01 $t@170@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@76@01 $t@170@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@156@01 $t@170@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@170@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_36.tuple_1, write)
(declare-const $t@172@01 $Ref)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@150@01 ret@169@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_36.tuple_1.val_bool, write)
(declare-const $t@173@01 Bool)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@67@01 $t@172@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@69@01 $t@172@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@124@01 $t@172@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@127@01 $t@172@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@133@01 $t@172@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@135@01 $t@172@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@137@01 $t@172@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@142@01 $t@172@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= $t@153@01 $t@172@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@161@01 $t@172@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@172@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _36.tuple_0.val_int := _2.val_int + 1
; [eval] _2.val_int + 1
(declare-const val_int@174@01 Int)
(assert (=
  val_int@174@01
  (+ ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@120@01))) 1)))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@156@01 $t@170@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@76@01 $t@170@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= $t@151@01 $t@170@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; _36.tuple_1.val_bool := false
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@67@01 $t@172@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@69@01 $t@172@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@124@01 $t@172@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@127@01 $t@172@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@133@01 $t@172@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@135@01 $t@172@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@137@01 $t@172@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@142@01 $t@172@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= $t@153@01 $t@172@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@161@01 $t@172@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t30 := _36.tuple_1.val_bool
; [exec]
; assert !__t30
; [eval] !__t30
; [exec]
; __t15 := true
; [exec]
; _2 := _36.tuple_0
; [exec]
; label l13
; [exec]
; __t1 := true
; [exec]
; __t2 := true
; [exec]
; _6 := builtin$havoc_int()
(declare-const ret@175@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _6 := _2.val_int
; [exec]
; label l14
; [exec]
; _5 := builtin$havoc_ref()
(declare-const ret@176@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_5.val_bool, write)
(declare-const $t@177@01 Bool)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@176@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= $t@153@01 ret@176@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@176@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@176@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@176@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@176@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@127@01 ret@176@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@124@01 ret@176@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@69@01 ret@176@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@67@01 ret@176@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= $t@172@01 ret@176@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@176@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _5.val_bool := _6 < 3
; [eval] _6 < 3
(declare-const val_bool@178@01 Bool)
(assert (= val_bool@178@01 (< val_int@174@01 3)))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= $t@172@01 ret@176@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@67@01 ret@176@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@69@01 ret@176@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@124@01 ret@176@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@127@01 ret@176@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@176@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@176@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@176@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@176@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= $t@153@01 ret@176@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@176@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t31 := _5.val_bool
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not val_bool@178@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not val_bool@178@01))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 21 | val_bool@178@01 | live]
; [else-branch: 21 | !(val_bool@178@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 21 | val_bool@178@01]
(assert val_bool@178@01)
; [exec]
; label l2
; [exec]
; __t3 := true
; [exec]
; _8 := builtin$havoc_ref()
(declare-const ret@179@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_8.val_bool, write)
(declare-const $t@180@01 Bool)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= $t@153@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@127@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@124@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@69@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@67@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= $t@172@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@176@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@179@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _8.val_bool := false
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@176@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= $t@172@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@67@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@69@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@124@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@127@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= $t@153@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@179@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t32 := _8.val_bool
; [exec]
; fold acc(usize(_2), write)
; [eval] 0 <= self.val_int
(set-option :timeout 0)
(push) ; 6
(assert (not (<= 0 val_int@174@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 val_int@174@01))
(assert (usize%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap val_int@174@01)
  $Snap.unit) $t@170@01))
; [exec]
; assert (unfolding acc(usize(_2), write) in _2.val_int) < 3 &&
;   ((unfolding acc(usize(_2), write) in
;     (forall _0_quant_0: Int ::
;       { read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1),
;       _0_quant_0) }
;       0 <= _0_quant_0 ==>
;       !(0 <= _0_quant_0) ||
;       (!(_0_quant_0 < _2.val_int) ||
;       _0_quant_0 < 3 &&
;       read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1),
;       _0_quant_0) <=
;       _0_quant_0 + 2))) &&
;   ((unfolding acc(usize(_2), write) in
;     (let _LET_3 ==
;       (_2.val_int) in
;       (forall _0_quant_0: Int ::
;         { read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1),
;         _0_quant_0) }
;         0 <= _0_quant_0 ==>
;         !(_LET_3 <= _0_quant_0) ||
;         (!(_0_quant_0 < 3) ||
;         _0_quant_0 < 3 &&
;         read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1),
;         _0_quant_0) <=
;         _0_quant_0 + 1)))) &&
;   ((unfolding acc(usize(_2), write) in _2.val_int) < 3 &&
;   read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1),
;   (unfolding acc(usize(_2), write) in _2.val_int)) <=
;   (unfolding acc(usize(_2), write) in _2.val_int) + 1)))
; [eval] (unfolding acc(usize(_2), write) in _2.val_int) < 3
; [eval] (unfolding acc(usize(_2), write) in _2.val_int)
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@151@01 $t@170@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@76@01 $t@170@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@156@01 $t@170@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [eval] 0 <= self.val_int
(pop) ; 6
; Joined path conditions
(set-option :timeout 0)
(push) ; 6
(assert (not (< val_int@174@01 3)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (< val_int@174@01 3))
; [eval] (unfolding acc(usize(_2), write) in (forall _0_quant_0: Int :: { read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0) } 0 <= _0_quant_0 ==> !(0 <= _0_quant_0) || (!(_0_quant_0 < _2.val_int) || _0_quant_0 < 3 && read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0) <= _0_quant_0 + 2)))
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@151@01 $t@170@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@76@01 $t@170@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@156@01 $t@170@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [eval] 0 <= self.val_int
; [eval] (forall _0_quant_0: Int :: { read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0) } 0 <= _0_quant_0 ==> !(0 <= _0_quant_0) || (!(_0_quant_0 < _2.val_int) || _0_quant_0 < 3 && read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0) <= _0_quant_0 + 2))
(declare-const _0_quant_0@181@01 Int)
(set-option :timeout 0)
(push) ; 7
; [eval] 0 <= _0_quant_0 ==> !(0 <= _0_quant_0) || (!(_0_quant_0 < _2.val_int) || _0_quant_0 < 3 && read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0) <= _0_quant_0 + 2)
; [eval] 0 <= _0_quant_0
(push) ; 8
; [then-branch: 22 | 0 <= _0_quant_0@181@01 | live]
; [else-branch: 22 | !(0 <= _0_quant_0@181@01) | live]
(push) ; 9
; [then-branch: 22 | 0 <= _0_quant_0@181@01]
(assert (<= 0 _0_quant_0@181@01))
; [eval] !(0 <= _0_quant_0) || (!(_0_quant_0 < _2.val_int) || _0_quant_0 < 3 && read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0) <= _0_quant_0 + 2)
; [eval] !(0 <= _0_quant_0)
; [eval] 0 <= _0_quant_0
(push) ; 10
; [then-branch: 23 | !(0 <= _0_quant_0@181@01) | live]
; [else-branch: 23 | 0 <= _0_quant_0@181@01 | live]
(push) ; 11
; [then-branch: 23 | !(0 <= _0_quant_0@181@01)]
(assert (not (<= 0 _0_quant_0@181@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 23 | 0 <= _0_quant_0@181@01]
; [eval] !(_0_quant_0 < _2.val_int)
; [eval] _0_quant_0 < _2.val_int
(push) ; 12
; [then-branch: 24 | !(_0_quant_0@181@01 < val_int@174@01) | live]
; [else-branch: 24 | _0_quant_0@181@01 < val_int@174@01 | live]
(push) ; 13
; [then-branch: 24 | !(_0_quant_0@181@01 < val_int@174@01)]
(assert (not (< _0_quant_0@181@01 val_int@174@01)))
(pop) ; 13
(push) ; 13
; [else-branch: 24 | _0_quant_0@181@01 < val_int@174@01]
(assert (< _0_quant_0@181@01 val_int@174@01))
; [eval] _0_quant_0 < 3 && read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0) <= _0_quant_0 + 2
; [eval] _0_quant_0 < 3
(push) ; 14
; [then-branch: 25 | _0_quant_0@181@01 < 3 | live]
; [else-branch: 25 | !(_0_quant_0@181@01 < 3) | live]
(push) ; 15
; [then-branch: 25 | _0_quant_0@181@01 < 3]
(assert (< _0_quant_0@181@01 3))
; [eval] read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0) <= _0_quant_0 + 2
; [eval] read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0)
; [eval] snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1)
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
(assert (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition $t@164@01 ret@59@01))
(pop) ; 16
; Joined path conditions
(assert (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition $t@164@01 ret@59@01))
; [eval] _0_quant_0 + 2
(pop) ; 15
(set-option :timeout 0)
(push) ; 15
; [else-branch: 25 | !(_0_quant_0@181@01 < 3)]
(assert (not (< _0_quant_0@181@01 3)))
(pop) ; 15
(pop) ; 14
; Joined path conditions
(assert (=>
  (< _0_quant_0@181@01 3)
  (and
    (< _0_quant_0@181@01 3)
    (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition $t@164@01 ret@59@01))))
; Joined path conditions
(assert (or (not (< _0_quant_0@181@01 3)) (< _0_quant_0@181@01 3)))
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (=>
  (< _0_quant_0@181@01 val_int@174@01)
  (and
    (< _0_quant_0@181@01 val_int@174@01)
    (=>
      (< _0_quant_0@181@01 3)
      (and
        (< _0_quant_0@181@01 3)
        (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition $t@164@01 ret@59@01)))
    (or (not (< _0_quant_0@181@01 3)) (< _0_quant_0@181@01 3)))))
(assert (or
  (< _0_quant_0@181@01 val_int@174@01)
  (not (< _0_quant_0@181@01 val_int@174@01))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 _0_quant_0@181@01)
  (and
    (=>
      (< _0_quant_0@181@01 val_int@174@01)
      (and
        (< _0_quant_0@181@01 val_int@174@01)
        (=>
          (< _0_quant_0@181@01 3)
          (and
            (< _0_quant_0@181@01 3)
            (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition $t@164@01 ret@59@01)))
        (or (not (< _0_quant_0@181@01 3)) (< _0_quant_0@181@01 3))))
    (or
      (< _0_quant_0@181@01 val_int@174@01)
      (not (< _0_quant_0@181@01 val_int@174@01))))))
(assert (or (<= 0 _0_quant_0@181@01) (not (<= 0 _0_quant_0@181@01))))
(pop) ; 9
(push) ; 9
; [else-branch: 22 | !(0 <= _0_quant_0@181@01)]
(assert (not (<= 0 _0_quant_0@181@01)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (<= 0 _0_quant_0@181@01)
  (and
    (<= 0 _0_quant_0@181@01)
    (=>
      (<= 0 _0_quant_0@181@01)
      (and
        (=>
          (< _0_quant_0@181@01 val_int@174@01)
          (and
            (< _0_quant_0@181@01 val_int@174@01)
            (=>
              (< _0_quant_0@181@01 3)
              (and
                (< _0_quant_0@181@01 3)
                (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition $t@164@01 ret@59@01)))
            (or (not (< _0_quant_0@181@01 3)) (< _0_quant_0@181@01 3))))
        (or
          (< _0_quant_0@181@01 val_int@174@01)
          (not (< _0_quant_0@181@01 val_int@174@01)))))
    (or (<= 0 _0_quant_0@181@01) (not (<= 0 _0_quant_0@181@01))))))
; Joined path conditions
(assert (or (not (<= 0 _0_quant_0@181@01)) (<= 0 _0_quant_0@181@01)))
(pop) ; 7
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((_0_quant_0@181@01 Int)) (!
  (and
    (=>
      (<= 0 _0_quant_0@181@01)
      (and
        (<= 0 _0_quant_0@181@01)
        (=>
          (<= 0 _0_quant_0@181@01)
          (and
            (=>
              (< _0_quant_0@181@01 val_int@174@01)
              (and
                (< _0_quant_0@181@01 val_int@174@01)
                (=>
                  (< _0_quant_0@181@01 3)
                  (and
                    (< _0_quant_0@181@01 3)
                    (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition $t@164@01 ret@59@01)))
                (or (not (< _0_quant_0@181@01 3)) (< _0_quant_0@181@01 3))))
            (or
              (< _0_quant_0@181@01 val_int@174@01)
              (not (< _0_quant_0@181@01 val_int@174@01)))))
        (or (<= 0 _0_quant_0@181@01) (not (<= 0 _0_quant_0@181@01)))))
    (or (not (<= 0 _0_quant_0@181@01)) (<= 0 _0_quant_0@181@01)))
  :pattern ((read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$<Int> (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize $t@164@01 ret@59@01) _0_quant_0@181@01))
  :qid |prog.l704-aux|)))
(pop) ; 6
; Joined path conditions
(assert (forall ((_0_quant_0@181@01 Int)) (!
  (and
    (=>
      (<= 0 _0_quant_0@181@01)
      (and
        (<= 0 _0_quant_0@181@01)
        (=>
          (<= 0 _0_quant_0@181@01)
          (and
            (=>
              (< _0_quant_0@181@01 val_int@174@01)
              (and
                (< _0_quant_0@181@01 val_int@174@01)
                (=>
                  (< _0_quant_0@181@01 3)
                  (and
                    (< _0_quant_0@181@01 3)
                    (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition $t@164@01 ret@59@01)))
                (or (not (< _0_quant_0@181@01 3)) (< _0_quant_0@181@01 3))))
            (or
              (< _0_quant_0@181@01 val_int@174@01)
              (not (< _0_quant_0@181@01 val_int@174@01)))))
        (or (<= 0 _0_quant_0@181@01) (not (<= 0 _0_quant_0@181@01)))))
    (or (not (<= 0 _0_quant_0@181@01)) (<= 0 _0_quant_0@181@01)))
  :pattern ((read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$<Int> (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize $t@164@01 ret@59@01) _0_quant_0@181@01))
  :qid |prog.l704-aux|)))
(assert (forall ((_0_quant_0@181@01 Int)) (!
  (=>
    (and
      (<= 0 _0_quant_0@181@01)
      (and (<= 0 _0_quant_0@181@01) (< _0_quant_0@181@01 val_int@174@01)))
    (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition $t@164@01 ret@59@01))
  :pattern ((read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$<Int> (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize $t@164@01 ret@59@01) _0_quant_0@181@01))
  :qid |prog.l704_precondition|)))
(push) ; 6
(assert (not (forall ((_0_quant_0@181@01 Int)) (!
  (=>
    (and
      (=>
        (and
          (<= 0 _0_quant_0@181@01)
          (and (<= 0 _0_quant_0@181@01) (< _0_quant_0@181@01 val_int@174@01)))
        (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition $t@164@01 ret@59@01))
      (<= 0 _0_quant_0@181@01))
    (or
      (not (<= 0 _0_quant_0@181@01))
      (or
        (not (< _0_quant_0@181@01 val_int@174@01))
        (and
          (<=
            (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$<Int> (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize $t@164@01 ret@59@01) _0_quant_0@181@01)
            (+ _0_quant_0@181@01 2))
          (< _0_quant_0@181@01 3)))))
  :pattern ((read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$<Int> (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize $t@164@01 ret@59@01) _0_quant_0@181@01))
  :qid |prog.l704|))))
(check-sat)
; unsat
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(assert (forall ((_0_quant_0@181@01 Int)) (!
  (=>
    (<= 0 _0_quant_0@181@01)
    (or
      (not (<= 0 _0_quant_0@181@01))
      (or
        (not (< _0_quant_0@181@01 val_int@174@01))
        (and
          (<=
            (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$<Int> (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize $t@164@01 ret@59@01) _0_quant_0@181@01)
            (+ _0_quant_0@181@01 2))
          (< _0_quant_0@181@01 3)))))
  :pattern ((read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$<Int> (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize $t@164@01 ret@59@01) _0_quant_0@181@01))
  :qid |prog.l704|)))
; [eval] (unfolding acc(usize(_2), write) in (let _LET_3 == (_2.val_int) in (forall _0_quant_0: Int :: { read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0) } 0 <= _0_quant_0 ==> !(_LET_3 <= _0_quant_0) || (!(_0_quant_0 < 3) || _0_quant_0 < 3 && read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0) <= _0_quant_0 + 1))))
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@151@01 $t@170@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@76@01 $t@170@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@156@01 $t@170@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [eval] 0 <= self.val_int
; [eval] (let _LET_3 == (_2.val_int) in (forall _0_quant_0: Int :: { read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0) } 0 <= _0_quant_0 ==> !(_LET_3 <= _0_quant_0) || (!(_0_quant_0 < 3) || _0_quant_0 < 3 && read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0) <= _0_quant_0 + 1)))
(declare-const letvar@182@01 Int)
(assert (= (as letvar@182@01  Int) val_int@174@01))
; [eval] (forall _0_quant_0: Int :: { read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0) } 0 <= _0_quant_0 ==> !(_LET_3 <= _0_quant_0) || (!(_0_quant_0 < 3) || _0_quant_0 < 3 && read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0) <= _0_quant_0 + 1))
(declare-const _0_quant_0@183@01 Int)
(set-option :timeout 0)
(push) ; 7
; [eval] 0 <= _0_quant_0 ==> !(_LET_3 <= _0_quant_0) || (!(_0_quant_0 < 3) || _0_quant_0 < 3 && read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0) <= _0_quant_0 + 1)
; [eval] 0 <= _0_quant_0
(push) ; 8
; [then-branch: 26 | 0 <= _0_quant_0@183@01 | live]
; [else-branch: 26 | !(0 <= _0_quant_0@183@01) | live]
(push) ; 9
; [then-branch: 26 | 0 <= _0_quant_0@183@01]
(assert (<= 0 _0_quant_0@183@01))
; [eval] !(_LET_3 <= _0_quant_0) || (!(_0_quant_0 < 3) || _0_quant_0 < 3 && read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0) <= _0_quant_0 + 1)
; [eval] !(_LET_3 <= _0_quant_0)
; [eval] _LET_3 <= _0_quant_0
(push) ; 10
; [then-branch: 27 | !(val_int@174@01 <= _0_quant_0@183@01) | live]
; [else-branch: 27 | val_int@174@01 <= _0_quant_0@183@01 | live]
(push) ; 11
; [then-branch: 27 | !(val_int@174@01 <= _0_quant_0@183@01)]
(assert (not (<= val_int@174@01 _0_quant_0@183@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 27 | val_int@174@01 <= _0_quant_0@183@01]
(assert (<= val_int@174@01 _0_quant_0@183@01))
; [eval] !(_0_quant_0 < 3)
; [eval] _0_quant_0 < 3
(push) ; 12
; [then-branch: 28 | !(_0_quant_0@183@01 < 3) | live]
; [else-branch: 28 | _0_quant_0@183@01 < 3 | live]
(push) ; 13
; [then-branch: 28 | !(_0_quant_0@183@01 < 3)]
(assert (not (< _0_quant_0@183@01 3)))
(pop) ; 13
(push) ; 13
; [else-branch: 28 | _0_quant_0@183@01 < 3]
(assert (< _0_quant_0@183@01 3))
; [eval] _0_quant_0 < 3 && read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0) <= _0_quant_0 + 1
; [eval] _0_quant_0 < 3
(push) ; 14
; [then-branch: 29 | _0_quant_0@183@01 < 3 | live]
; [else-branch: 29 | !(_0_quant_0@183@01 < 3) | live]
(push) ; 15
; [then-branch: 29 | _0_quant_0@183@01 < 3]
; [eval] read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0) <= _0_quant_0 + 1
; [eval] read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), _0_quant_0)
; [eval] snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1)
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
(assert (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition $t@164@01 ret@59@01))
(pop) ; 16
; Joined path conditions
(assert (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition $t@164@01 ret@59@01))
; [eval] _0_quant_0 + 1
(pop) ; 15
(set-option :timeout 0)
(push) ; 15
; [else-branch: 29 | !(_0_quant_0@183@01 < 3)]
(assert (not (< _0_quant_0@183@01 3)))
(pop) ; 15
(pop) ; 14
; Joined path conditions
(assert (=>
  (< _0_quant_0@183@01 3)
  (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition $t@164@01 ret@59@01)))
; Joined path conditions
(assert (or (not (< _0_quant_0@183@01 3)) (< _0_quant_0@183@01 3)))
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (=>
  (< _0_quant_0@183@01 3)
  (and
    (< _0_quant_0@183@01 3)
    (=>
      (< _0_quant_0@183@01 3)
      (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition $t@164@01 ret@59@01))
    (or (not (< _0_quant_0@183@01 3)) (< _0_quant_0@183@01 3)))))
(assert (or (< _0_quant_0@183@01 3) (not (< _0_quant_0@183@01 3))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= val_int@174@01 _0_quant_0@183@01)
  (and
    (<= val_int@174@01 _0_quant_0@183@01)
    (=>
      (< _0_quant_0@183@01 3)
      (and
        (< _0_quant_0@183@01 3)
        (=>
          (< _0_quant_0@183@01 3)
          (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition $t@164@01 ret@59@01))
        (or (not (< _0_quant_0@183@01 3)) (< _0_quant_0@183@01 3))))
    (or (< _0_quant_0@183@01 3) (not (< _0_quant_0@183@01 3))))))
(assert (or
  (<= val_int@174@01 _0_quant_0@183@01)
  (not (<= val_int@174@01 _0_quant_0@183@01))))
(pop) ; 9
(push) ; 9
; [else-branch: 26 | !(0 <= _0_quant_0@183@01)]
(assert (not (<= 0 _0_quant_0@183@01)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (<= 0 _0_quant_0@183@01)
  (and
    (<= 0 _0_quant_0@183@01)
    (=>
      (<= val_int@174@01 _0_quant_0@183@01)
      (and
        (<= val_int@174@01 _0_quant_0@183@01)
        (=>
          (< _0_quant_0@183@01 3)
          (and
            (< _0_quant_0@183@01 3)
            (=>
              (< _0_quant_0@183@01 3)
              (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition $t@164@01 ret@59@01))
            (or (not (< _0_quant_0@183@01 3)) (< _0_quant_0@183@01 3))))
        (or (< _0_quant_0@183@01 3) (not (< _0_quant_0@183@01 3)))))
    (or
      (<= val_int@174@01 _0_quant_0@183@01)
      (not (<= val_int@174@01 _0_quant_0@183@01))))))
; Joined path conditions
(assert (or (not (<= 0 _0_quant_0@183@01)) (<= 0 _0_quant_0@183@01)))
(pop) ; 7
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((_0_quant_0@183@01 Int)) (!
  (and
    (=>
      (<= 0 _0_quant_0@183@01)
      (and
        (<= 0 _0_quant_0@183@01)
        (=>
          (<= val_int@174@01 _0_quant_0@183@01)
          (and
            (<= val_int@174@01 _0_quant_0@183@01)
            (=>
              (< _0_quant_0@183@01 3)
              (and
                (< _0_quant_0@183@01 3)
                (=>
                  (< _0_quant_0@183@01 3)
                  (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition $t@164@01 ret@59@01))
                (or (not (< _0_quant_0@183@01 3)) (< _0_quant_0@183@01 3))))
            (or (< _0_quant_0@183@01 3) (not (< _0_quant_0@183@01 3)))))
        (or
          (<= val_int@174@01 _0_quant_0@183@01)
          (not (<= val_int@174@01 _0_quant_0@183@01)))))
    (or (not (<= 0 _0_quant_0@183@01)) (<= 0 _0_quant_0@183@01)))
  :pattern ((read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$<Int> (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize $t@164@01 ret@59@01) _0_quant_0@183@01))
  :qid |prog.l717-aux|)))
(pop) ; 6
; Joined path conditions
(assert (and
  (= (as letvar@182@01  Int) val_int@174@01)
  (forall ((_0_quant_0@183@01 Int)) (!
    (and
      (=>
        (<= 0 _0_quant_0@183@01)
        (and
          (<= 0 _0_quant_0@183@01)
          (=>
            (<= val_int@174@01 _0_quant_0@183@01)
            (and
              (<= val_int@174@01 _0_quant_0@183@01)
              (=>
                (< _0_quant_0@183@01 3)
                (and
                  (< _0_quant_0@183@01 3)
                  (=>
                    (< _0_quant_0@183@01 3)
                    (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition $t@164@01 ret@59@01))
                  (or (not (< _0_quant_0@183@01 3)) (< _0_quant_0@183@01 3))))
              (or (< _0_quant_0@183@01 3) (not (< _0_quant_0@183@01 3)))))
          (or
            (<= val_int@174@01 _0_quant_0@183@01)
            (not (<= val_int@174@01 _0_quant_0@183@01)))))
      (or (not (<= 0 _0_quant_0@183@01)) (<= 0 _0_quant_0@183@01)))
    :pattern ((read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$<Int> (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize $t@164@01 ret@59@01) _0_quant_0@183@01))
    :qid |prog.l717-aux|))))
(assert (forall ((_0_quant_0@183@01 Int)) (!
  (=>
    (and
      (<= 0 _0_quant_0@183@01)
      (and (<= val_int@174@01 _0_quant_0@183@01) (< _0_quant_0@183@01 3)))
    (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition $t@164@01 ret@59@01))
  :pattern ((read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$<Int> (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize $t@164@01 ret@59@01) _0_quant_0@183@01))
  :qid |prog.l717_precondition|)))
(push) ; 6
(assert (not (forall ((_0_quant_0@183@01 Int)) (!
  (=>
    (and
      (=>
        (and
          (<= 0 _0_quant_0@183@01)
          (and (<= val_int@174@01 _0_quant_0@183@01) (< _0_quant_0@183@01 3)))
        (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition $t@164@01 ret@59@01))
      (<= 0 _0_quant_0@183@01))
    (or
      (not (<= val_int@174@01 _0_quant_0@183@01))
      (or
        (not (< _0_quant_0@183@01 3))
        (and
          (<=
            (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$<Int> (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize $t@164@01 ret@59@01) _0_quant_0@183@01)
            (+ _0_quant_0@183@01 1))
          (< _0_quant_0@183@01 3)))))
  :pattern ((read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$<Int> (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize $t@164@01 ret@59@01) _0_quant_0@183@01))
  :qid |prog.l717|))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (forall ((_0_quant_0@183@01 Int)) (!
  (=>
    (<= 0 _0_quant_0@183@01)
    (or
      (not (<= val_int@174@01 _0_quant_0@183@01))
      (or
        (not (< _0_quant_0@183@01 3))
        (and
          (<=
            (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$<Int> (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize $t@164@01 ret@59@01) _0_quant_0@183@01)
            (+ _0_quant_0@183@01 1))
          (< _0_quant_0@183@01 3)))))
  :pattern ((read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$<Int> (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize $t@164@01 ret@59@01) _0_quant_0@183@01))
  :qid |prog.l717|)))
; [eval] (unfolding acc(usize(_2), write) in _2.val_int) < 3
; [eval] (unfolding acc(usize(_2), write) in _2.val_int)
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@151@01 $t@170@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@76@01 $t@170@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@156@01 $t@170@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
; [eval] 0 <= self.val_int
(pop) ; 6
; Joined path conditions
; [eval] read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), (unfolding acc(usize(_2), write) in _2.val_int)) <= (unfolding acc(usize(_2), write) in _2.val_int) + 1
; [eval] read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$(snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1), (unfolding acc(usize(_2), write) in _2.val_int))
; [eval] snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize(_1)
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
; 0.01s
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
(assert (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition $t@164@01 ret@59@01))
(pop) ; 6
; Joined path conditions
(assert (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize%precondition $t@164@01 ret@59@01))
; [eval] (unfolding acc(usize(_2), write) in _2.val_int)
(set-option :timeout 0)
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@151@01 $t@170@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@76@01 $t@170@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@156@01 $t@170@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [eval] 0 <= self.val_int
(pop) ; 6
; Joined path conditions
; [eval] (unfolding acc(usize(_2), write) in _2.val_int) + 1
; [eval] (unfolding acc(usize(_2), write) in _2.val_int)
(set-option :timeout 0)
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@151@01 $t@170@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@76@01 $t@170@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@156@01 $t@170@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [eval] 0 <= self.val_int
(pop) ; 6
; Joined path conditions
(set-option :timeout 0)
(push) ; 6
(assert (not (<=
  (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$<Int> (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize $t@164@01 ret@59@01) val_int@174@01)
  (+ val_int@174@01 1))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (<=
  (read$Snap$Array$3$usize$__$TY$__Snap$Array$3$usize$$int$$$int$<Int> (snap$__$TY$__Snap$Array$3$usize$Array$3$usize$Snap$Array$3$usize $t@164@01 ret@59@01) val_int@174@01)
  (+ val_int@174@01 1)))
; [exec]
; assert true
; [exec]
; exhale acc(usize(_2), write) && acc(Array$3$usize(_1), write)
; [exec]
; inhale false
(pop) ; 5
(push) ; 5
; [else-branch: 21 | !(val_bool@178@01)]
(assert (not val_bool@178@01))
(pop) ; 5
; [eval] !__t31
(push) ; 5
(set-option :timeout 10)
(assert (not val_bool@178@01))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not val_bool@178@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
; [then-branch: 30 | !(val_bool@178@01) | live]
; [else-branch: 30 | val_bool@178@01 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 30 | !(val_bool@178@01)]
(assert (not val_bool@178@01))
; [exec]
; label loop1_group1_bb2
; [exec]
; label l1
; [exec]
; __t16 := true
; [exec]
; _40 := builtin$havoc_int()
(declare-const ret@184@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _40 := 1
; [exec]
; assert acc(Array$3$usize(_1), read$())
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
; _41 := builtin$havoc_int()
(declare-const ret@185@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _41 := 3
; [exec]
; _42 := builtin$havoc_ref()
(declare-const ret@186@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_42.val_bool, write)
(declare-const $t@187@01 Bool)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@186@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= $t@153@01 ret@186@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@186@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@186@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@186@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@186@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@127@01 ret@186@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@124@01 ret@186@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@69@01 ret@186@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@67@01 ret@186@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= $t@172@01 ret@186@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@176@01 ret@186@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@186@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _42.val_bool := _40 < _41
; [eval] _40 < _41
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@176@01 ret@186@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= $t@172@01 ret@186@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@67@01 ret@186@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@69@01 ret@186@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@124@01 ret@186@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@127@01 ret@186@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@133@01 ret@186@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@135@01 ret@186@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@186@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@142@01 ret@186@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= $t@153@01 ret@186@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@186@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t33 := _42.val_bool
; [exec]
; assert __t33
; [exec]
; __t17 := true
; [exec]
; __t34 := builtin$havoc_int()
(declare-const ret@188@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale __t34 >= 0
(declare-const $t@189@01 $Snap)
(assert (= $t@189@01 $Snap.unit))
; [eval] __t34 >= 0
(assert (>= ret@188@01 0))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert acc(Array$3$usize(_1), read$())
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
; inhale lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$(_1,
;   _40) ==
;   __t34
(declare-const $t@190@01 $Snap)
(assert (= $t@190@01 $Snap.unit))
; [eval] lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$(_1, _40) == __t34
; [eval] lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$(_1, _40)
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
; [eval] 0 <= idx
; [eval] idx < 3
(assert (lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$%precondition ($Snap.combine
  $t@164@01
  ($Snap.combine $Snap.unit $Snap.unit)) ret@59@01 1))
(pop) ; 6
; Joined path conditions
(assert (lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$%precondition ($Snap.combine
  $t@164@01
  ($Snap.combine $Snap.unit $Snap.unit)) ret@59@01 1))
(assert (=
  (lookup_pure__$TY$__Array$3$usize$usize$Array$3$usize$$int$$$int$ ($Snap.combine
    $t@164@01
    ($Snap.combine $Snap.unit $Snap.unit)) ret@59@01 1)
  ret@188@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _0 := builtin$havoc_ref()
(declare-const ret@191@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_0.val_int, write)
(declare-const $t@192@01 Int)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= $t@170@01 ret@191@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@156@01 ret@191@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@76@01 ret@191@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= $t@151@01 ret@191@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@191@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale __t34 >= 0
(declare-const $t@193@01 $Snap)
(assert (= $t@193@01 $Snap.unit))
; [eval] __t34 >= 0
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; _0.val_int := __t34
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= $t@151@01 ret@191@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@76@01 ret@191@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@156@01 ret@191@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= $t@170@01 ret@191@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l17
; [exec]
; label l19
; [exec]
; fold acc(usize(_0), write)
; [eval] 0 <= self.val_int
(set-option :timeout 0)
(push) ; 6
(assert (not (<= 0 ret@188@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 ret@188@01))
(assert (usize%trigger ($Snap.combine ($SortWrappers.IntTo$Snap ret@188@01) $Snap.unit) ret@191@01))
; [exec]
; assert (unfolding acc(usize(_0), write) in _0.val_int <= 3)
; [eval] (unfolding acc(usize(_0), write) in _0.val_int <= 3)
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@151@01 ret@191@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@76@01 ret@191@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@156@01 ret@191@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@170@01 ret@191@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
; [eval] 0 <= self.val_int
; [eval] _0.val_int <= 3
(pop) ; 6
; Joined path conditions
(set-option :timeout 0)
(push) ; 6
(assert (not (<= ret@188@01 3)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (<= ret@188@01 3))
; [exec]
; assert true
; [exec]
; exhale acc(usize(_0), write)
; [exec]
; label end_of_method
(pop) ; 5
(push) ; 5
; [else-branch: 30 | val_bool@178@01]
(assert val_bool@178@01)
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 9 | !(val_bool@126@01)]
(assert (not val_bool@126@01))
(pop) ; 4
; [eval] !__t20
(push) ; 4
(set-option :timeout 10)
(assert (not val_bool@126@01))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not val_bool@126@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 31 | !(val_bool@126@01) | live]
; [else-branch: 31 | val_bool@126@01 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 31 | !(val_bool@126@01)]
(assert (not val_bool@126@01))
; [exec]
; label loop1_start
; [exec]
; label end_of_method
(pop) ; 4
(push) ; 4
; [else-branch: 31 | val_bool@126@01]
(assert val_bool@126@01)
(pop) ; 4
(pop) ; 3
; [eval] !__t18
; [then-branch: 32 | False | dead]
; [else-branch: 32 | True | live]
(push) ; 3
; [else-branch: 32 | True]
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- builtin$havoc_bool ----------
(declare-const ret@194@01 Bool)
(declare-const ret@195@01 Bool)
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
(declare-const ret@196@01 Int)
(declare-const ret@197@01 Int)
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
(declare-const ret@198@01 $Ref)
(declare-const ret@199@01 $Ref)
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
