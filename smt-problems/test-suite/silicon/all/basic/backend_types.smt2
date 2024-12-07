(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:40:52
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/basic/backend_types.vpr
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
(declare-sort Seq<___FloatingPoint_8_24_> 0)
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
(declare-fun $SortWrappers.Seq<___FloatingPoint_8_24_>To$Snap (Seq<___FloatingPoint_8_24_>) $Snap)
(declare-fun $SortWrappers.$SnapToSeq<___FloatingPoint_8_24_> ($Snap) Seq<___FloatingPoint_8_24_>)
(assert (forall ((x Seq<___FloatingPoint_8_24_>)) (!
    (= x ($SortWrappers.$SnapToSeq<___FloatingPoint_8_24_>($SortWrappers.Seq<___FloatingPoint_8_24_>To$Snap x)))
    :pattern (($SortWrappers.Seq<___FloatingPoint_8_24_>To$Snap x))
    :qid |$Snap.$SnapToSeq<___FloatingPoint_8_24_>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Seq<___FloatingPoint_8_24_>To$Snap($SortWrappers.$SnapToSeq<___FloatingPoint_8_24_> x)))
    :pattern (($SortWrappers.$SnapToSeq<___FloatingPoint_8_24_> x))
    :qid |$Snap.Seq<___FloatingPoint_8_24_>To$SnapToSeq<___FloatingPoint_8_24_>|
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
; ////////// Symbols
(declare-fun Seq_length (Seq<___FloatingPoint_8_24_>) Int)
(declare-const Seq_empty Seq<___FloatingPoint_8_24_>)
(declare-fun Seq_singleton ((_ FloatingPoint 8 24)) Seq<___FloatingPoint_8_24_>)
(declare-fun Seq_append (Seq<___FloatingPoint_8_24_> Seq<___FloatingPoint_8_24_>) Seq<___FloatingPoint_8_24_>)
(declare-fun Seq_index (Seq<___FloatingPoint_8_24_> Int) (_ FloatingPoint 8 24))
(declare-fun Seq_add (Int Int) Int)
(declare-fun Seq_sub (Int Int) Int)
(declare-fun Seq_update (Seq<___FloatingPoint_8_24_> Int (_ FloatingPoint 8 24)) Seq<___FloatingPoint_8_24_>)
(declare-fun Seq_take (Seq<___FloatingPoint_8_24_> Int) Seq<___FloatingPoint_8_24_>)
(declare-fun Seq_drop (Seq<___FloatingPoint_8_24_> Int) Seq<___FloatingPoint_8_24_>)
(declare-fun Seq_contains (Seq<___FloatingPoint_8_24_> (_ FloatingPoint 8 24)) Bool)
(declare-fun Seq_contains_trigger (Seq<___FloatingPoint_8_24_> (_ FloatingPoint 8 24)) Bool)
(declare-fun Seq_skolem (Seq<___FloatingPoint_8_24_> (_ FloatingPoint 8 24)) Int)
(declare-fun Seq_equal (Seq<___FloatingPoint_8_24_> Seq<___FloatingPoint_8_24_>) Bool)
(declare-fun Seq_skolem_diff (Seq<___FloatingPoint_8_24_> Seq<___FloatingPoint_8_24_>) Int)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((s Seq<___FloatingPoint_8_24_>)) (!
  (<= 0 (Seq_length s))
  :pattern ((Seq_length s))
  )))
(assert (= (Seq_length (as Seq_empty  Seq<___FloatingPoint_8_24_>)) 0))
(assert (forall ((s Seq<___FloatingPoint_8_24_>)) (!
  (=> (= (Seq_length s) 0) (= s (as Seq_empty  Seq<___FloatingPoint_8_24_>)))
  :pattern ((Seq_length s))
  )))
(assert (forall ((e (_ FloatingPoint 8 24))) (!
  (= (Seq_length (Seq_singleton e)) 1)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<___FloatingPoint_8_24_>) (s1 Seq<___FloatingPoint_8_24_>)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<___FloatingPoint_8_24_>)))
      (not (= s1 (as Seq_empty  Seq<___FloatingPoint_8_24_>))))
    (= (Seq_length (Seq_append s0 s1)) (+ (Seq_length s0) (Seq_length s1))))
  :pattern ((Seq_length (Seq_append s0 s1)))
  )))
(assert (forall ((s0 Seq<___FloatingPoint_8_24_>) (s1 Seq<___FloatingPoint_8_24_>)) (!
  (and
    (=>
      (= s0 (as Seq_empty  Seq<___FloatingPoint_8_24_>))
      (= (Seq_append s0 s1) s1))
    (=>
      (= s1 (as Seq_empty  Seq<___FloatingPoint_8_24_>))
      (= (Seq_append s0 s1) s0)))
  :pattern ((Seq_append s0 s1))
  )))
(assert (forall ((e (_ FloatingPoint 8 24))) (!
  (= (Seq_index (Seq_singleton e) 0) e)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((i Int) (j Int)) (!
  (= (Seq_add i j) (+ i j))
  :pattern ((Seq_add i j))
  )))
(assert (forall ((i Int) (j Int)) (!
  (= (Seq_sub i j) (- i j))
  :pattern ((Seq_sub i j))
  )))
(assert (forall ((s0 Seq<___FloatingPoint_8_24_>) (s1 Seq<___FloatingPoint_8_24_>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<___FloatingPoint_8_24_>)))
      (and
        (not (= s1 (as Seq_empty  Seq<___FloatingPoint_8_24_>)))
        (and (<= 0 n) (< n (Seq_length s0)))))
    (= (Seq_index (Seq_append s0 s1) n) (Seq_index s0 n)))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  :pattern ((Seq_index s0 n) (Seq_append s0 s1))
  )))
(assert (forall ((s0 Seq<___FloatingPoint_8_24_>) (s1 Seq<___FloatingPoint_8_24_>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<___FloatingPoint_8_24_>)))
      (and
        (not (= s1 (as Seq_empty  Seq<___FloatingPoint_8_24_>)))
        (and (<= (Seq_length s0) n) (< n (Seq_length (Seq_append s0 s1))))))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s0)) (Seq_length s0)) n)
      (=
        (Seq_index (Seq_append s0 s1) n)
        (Seq_index s1 (Seq_sub n (Seq_length s0))))))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  )))
(assert (forall ((s0 Seq<___FloatingPoint_8_24_>) (s1 Seq<___FloatingPoint_8_24_>) (m Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<___FloatingPoint_8_24_>)))
      (and
        (not (= s1 (as Seq_empty  Seq<___FloatingPoint_8_24_>)))
        (and (<= 0 m) (< m (Seq_length s1)))))
    (and
      (= (Seq_sub (Seq_add m (Seq_length s0)) (Seq_length s0)) m)
      (=
        (Seq_index (Seq_append s0 s1) (Seq_add m (Seq_length s0)))
        (Seq_index s1 m))))
  :pattern ((Seq_index s1 m) (Seq_append s0 s1))
  )))
(assert (forall ((s Seq<___FloatingPoint_8_24_>) (i Int) (v (_ FloatingPoint 8 24))) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (= (Seq_length (Seq_update s i v)) (Seq_length s)))
  :pattern ((Seq_length (Seq_update s i v)))
  :pattern ((Seq_length s) (Seq_update s i v))
  )))
(assert (forall ((s Seq<___FloatingPoint_8_24_>) (i Int) (v (_ FloatingPoint 8 24)) (n Int)) (!
  (=>
    (and (<= 0 n) (< n (Seq_length s)))
    (and
      (=> (= i n) (= (Seq_index (Seq_update s i v) n) v))
      (=> (not (= i n)) (= (Seq_index (Seq_update s i v) n) (Seq_index s n)))))
  :pattern ((Seq_index (Seq_update s i v) n))
  :pattern ((Seq_index s n) (Seq_update s i v))
  )))
(assert (forall ((s Seq<___FloatingPoint_8_24_>) (n Int)) (!
  (and
    (=>
      (<= 0 n)
      (and
        (=> (<= n (Seq_length s)) (= (Seq_length (Seq_take s n)) n))
        (=> (< (Seq_length s) n) (= (Seq_length (Seq_take s n)) (Seq_length s)))))
    (=> (< n 0) (= (Seq_length (Seq_take s n)) 0)))
  :pattern ((Seq_length (Seq_take s n)))
  :pattern ((Seq_take s n) (Seq_length s))
  )))
(assert (forall ((s Seq<___FloatingPoint_8_24_>) (n Int) (j Int)) (!
  (=>
    (and (<= 0 j) (and (< j n) (< j (Seq_length s))))
    (= (Seq_index (Seq_take s n) j) (Seq_index s j)))
  :pattern ((Seq_index (Seq_take s n) j))
  :pattern ((Seq_index s j) (Seq_take s n))
  )))
(assert (forall ((s Seq<___FloatingPoint_8_24_>) (n Int)) (!
  (and
    (=>
      (<= 0 n)
      (and
        (=>
          (<= n (Seq_length s))
          (= (Seq_length (Seq_drop s n)) (- (Seq_length s) n)))
        (=> (< (Seq_length s) n) (= (Seq_length (Seq_drop s n)) 0))))
    (=> (< n 0) (= (Seq_length (Seq_drop s n)) (Seq_length s))))
  :pattern ((Seq_length (Seq_drop s n)))
  :pattern ((Seq_length s) (Seq_drop s n))
  )))
(assert (forall ((s Seq<___FloatingPoint_8_24_>) (n Int) (j Int)) (!
  (=>
    (and (< 0 n) (and (<= 0 j) (< j (- (Seq_length s) n))))
    (and
      (= (Seq_sub (Seq_add j n) n) j)
      (= (Seq_index (Seq_drop s n) j) (Seq_index s (Seq_add j n)))))
  :pattern ((Seq_index (Seq_drop s n) j))
  )))
(assert (forall ((s Seq<___FloatingPoint_8_24_>) (n Int) (i Int)) (!
  (=>
    (and (< 0 n) (and (<= n i) (< i (Seq_length s))))
    (and
      (= (Seq_add (Seq_sub i n) n) i)
      (= (Seq_index (Seq_drop s n) (Seq_sub i n)) (Seq_index s i))))
  :pattern ((Seq_drop s n) (Seq_index s i))
  )))
(assert (forall ((s Seq<___FloatingPoint_8_24_>) (t Seq<___FloatingPoint_8_24_>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_take (Seq_append s t) n) (Seq_take s n)))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<___FloatingPoint_8_24_>) (t Seq<___FloatingPoint_8_24_>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (=
        (Seq_take (Seq_append s t) n)
        (Seq_append s (Seq_take t (Seq_sub n (Seq_length s)))))))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<___FloatingPoint_8_24_>) (t Seq<___FloatingPoint_8_24_>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_drop (Seq_append s t) n) (Seq_append (Seq_drop s n) t)))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<___FloatingPoint_8_24_>) (t Seq<___FloatingPoint_8_24_>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (= (Seq_drop (Seq_append s t) n) (Seq_drop t (Seq_sub n (Seq_length s))))))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<___FloatingPoint_8_24_>) (n Int)) (!
  (=> (<= n 0) (= (Seq_take s n) (as Seq_empty  Seq<___FloatingPoint_8_24_>)))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<___FloatingPoint_8_24_>) (n Int)) (!
  (=> (<= n 0) (= (Seq_drop s n) s))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<___FloatingPoint_8_24_>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_take s n) s))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<___FloatingPoint_8_24_>) (n Int)) (!
  (=>
    (>= n (Seq_length s))
    (= (Seq_drop s n) (as Seq_empty  Seq<___FloatingPoint_8_24_>)))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<___FloatingPoint_8_24_>) (x (_ FloatingPoint 8 24))) (!
  (=>
    (Seq_contains s x)
    (and
      (<= 0 (Seq_skolem s x))
      (and
        (< (Seq_skolem s x) (Seq_length s))
        (= (Seq_index s (Seq_skolem s x)) x))))
  :pattern ((Seq_contains s x))
  )))
(assert (forall ((s Seq<___FloatingPoint_8_24_>) (x (_ FloatingPoint 8 24)) (i Int)) (!
  (=>
    (and (<= 0 i) (and (< i (Seq_length s)) (= (Seq_index s i) x)))
    (Seq_contains s x))
  :pattern ((Seq_contains s x) (Seq_index s i))
  )))
(assert (forall ((s Seq<___FloatingPoint_8_24_>) (i Int)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (Seq_contains_trigger s (Seq_index s i)))
  :pattern ((Seq_index s i))
  )))
(assert (forall ((s0 Seq<___FloatingPoint_8_24_>) (s1 Seq<___FloatingPoint_8_24_>)) (!
  (or
    (and (= s0 s1) (Seq_equal s0 s1))
    (or
      (and
        (not (= s0 s1))
        (and (not (Seq_equal s0 s1)) (not (= (Seq_length s0) (Seq_length s1)))))
      (and
        (not (= s0 s1))
        (and
          (not (Seq_equal s0 s1))
          (and
            (= (Seq_length s0) (Seq_length s1))
            (and
              (= (Seq_skolem_diff s0 s1) (Seq_skolem_diff s1 s0))
              (and
                (<= 0 (Seq_skolem_diff s0 s1))
                (and
                  (< (Seq_skolem_diff s0 s1) (Seq_length s0))
                  (not
                    (=
                      (Seq_index s0 (Seq_skolem_diff s0 s1))
                      (Seq_index s1 (Seq_skolem_diff s0 s1))))))))))))
  :pattern ((Seq_equal s0 s1))
  )))
(assert (forall ((a Seq<___FloatingPoint_8_24_>) (b Seq<___FloatingPoint_8_24_>)) (!
  (=> (Seq_equal a b) (= a b))
  :pattern ((Seq_equal a b))
  )))
(assert (forall ((x (_ FloatingPoint 8 24)) (y (_ FloatingPoint 8 24))) (!
  (= (Seq_contains (Seq_singleton x) y) (= x y))
  :pattern ((Seq_contains (Seq_singleton x) y))
  )))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test ----------
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
; var tmp: myBV
(declare-const tmp@0@01 (_ BitVec 32))
; [exec]
; var r: Ref
(declare-const r@1@01 $Ref)
; [exec]
; var fs: Seq[myFloat]
(declare-const fs@2@01 Seq<___FloatingPoint_8_24_>)
; [exec]
; tmp := toBV32(1081081856)
; [eval] toBV32(1081081856)
(declare-const tmp@3@01 (_ BitVec 32))
(assert (= tmp@3@01 ((_ int2bv 32) 1081081856)))
; [exec]
; r := new(ff)
(declare-const r@4@01 $Ref)
(assert (not (= r@4@01 $Ref.null)))
(declare-const ff@5@01 (_ FloatingPoint 8 24))
(assert (not (= r@4@01 r@1@01)))
; [exec]
; r.ff := tofp(toBV32(1103888384))
; [eval] tofp(toBV32(1103888384))
; [eval] toBV32(1103888384)
(declare-const ff@6@01 (_ FloatingPoint 8 24))
(assert (= ff@6@01 ((_ to_fp 8 24) ((_ int2bv 32) 1103888384))))
; [exec]
; fs := Seq(tofp(toBV32(1081081856)))
; [eval] Seq(tofp(toBV32(1081081856)))
; [eval] tofp(toBV32(1081081856))
; [eval] toBV32(1081081856)
(assert (= (Seq_length (Seq_singleton ((_ to_fp 8 24) ((_ int2bv 32) 1081081856)))) 1))
(declare-const fs@7@01 Seq<___FloatingPoint_8_24_>)
(assert (= fs@7@01 (Seq_singleton ((_ to_fp 8 24) ((_ int2bv 32) 1081081856)))))
; [exec]
; assert fp_eq(fp_min(tofp(tmp), r.ff), fs[0]) &&
;   fp_eq(fp_max(tofp(toBV32(1081081856)), tofp(toBV32(1103888384))), tofp(toBV32(1103888384)))
; [eval] fp_eq(fp_min(tofp(tmp), r.ff), fs[0])
; [eval] fp_min(tofp(tmp), r.ff)
; [eval] tofp(tmp)
; [eval] fs[0]
(push) ; 3
(assert (not (< 0 (Seq_length fs@7@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (fp.eq (fp.min ((_ to_fp 8 24) tmp@3@01) ff@6@01) (Seq_index fs@7@01 0))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (fp.eq (fp.min ((_ to_fp 8 24) tmp@3@01) ff@6@01) (Seq_index fs@7@01 0)))
; [eval] fp_eq(fp_max(tofp(toBV32(1081081856)), tofp(toBV32(1103888384))), tofp(toBV32(1103888384)))
; [eval] fp_max(tofp(toBV32(1081081856)), tofp(toBV32(1103888384)))
; [eval] tofp(toBV32(1081081856))
; [eval] toBV32(1081081856)
; [eval] tofp(toBV32(1103888384))
; [eval] toBV32(1103888384)
; [eval] tofp(toBV32(1103888384))
; [eval] toBV32(1103888384)
(push) ; 3
(assert (not (fp.eq (fp.max ((_ to_fp 8 24) ((_ int2bv 32) 1081081856)) ((_ to_fp 8 24) ((_ int2bv 32) 1103888384))) ((_ to_fp 8 24) ((_ int2bv 32) 1103888384)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (fp.eq (fp.max ((_ to_fp 8 24) ((_ int2bv 32) 1081081856)) ((_ to_fp 8 24) ((_ int2bv 32) 1103888384))) ((_ to_fp 8 24) ((_ int2bv 32) 1103888384))))
; [exec]
; assert fp_eq(fp_min(tofp(tmp), r.ff), fs[0]) &&
;   fp_eq(fp_max(tofp(toBV32(1081081856)), tofp(toBV32(1103888384))), tofp(toBV32(110388838)))
; [eval] fp_eq(fp_min(tofp(tmp), r.ff), fs[0])
; [eval] fp_min(tofp(tmp), r.ff)
; [eval] tofp(tmp)
; [eval] fs[0]
(push) ; 3
(assert (not (< 0 (Seq_length fs@7@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] fp_eq(fp_max(tofp(toBV32(1081081856)), tofp(toBV32(1103888384))), tofp(toBV32(110388838)))
; [eval] fp_max(tofp(toBV32(1081081856)), tofp(toBV32(1103888384)))
; [eval] tofp(toBV32(1081081856))
; [eval] toBV32(1081081856)
; [eval] tofp(toBV32(1103888384))
; [eval] toBV32(1103888384)
; [eval] tofp(toBV32(110388838))
; [eval] toBV32(110388838)
(push) ; 3
(assert (not (fp.eq (fp.max ((_ to_fp 8 24) ((_ int2bv 32) 1081081856)) ((_ to_fp 8 24) ((_ int2bv 32) 1103888384))) ((_ to_fp 8 24) ((_ int2bv 32) 110388838)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] fp_eq(fp_max(tofp(toBV32(1081081856)), tofp(toBV32(1103888384))), tofp(toBV32(110388838)))
; [eval] fp_max(tofp(toBV32(1081081856)), tofp(toBV32(1103888384)))
; [eval] tofp(toBV32(1081081856))
; [eval] toBV32(1081081856)
; [eval] tofp(toBV32(1103888384))
; [eval] toBV32(1103888384)
; [eval] tofp(toBV32(110388838))
; [eval] toBV32(110388838)
(set-option :timeout 0)
(push) ; 3
(assert (not (fp.eq (fp.max ((_ to_fp 8 24) ((_ int2bv 32) 1081081856)) ((_ to_fp 8 24) ((_ int2bv 32) 1103888384))) ((_ to_fp 8 24) ((_ int2bv 32) 110388838)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] fp_eq(fp_max(tofp(toBV32(1081081856)), tofp(toBV32(1103888384))), tofp(toBV32(110388838)))
; [eval] fp_max(tofp(toBV32(1081081856)), tofp(toBV32(1103888384)))
; [eval] tofp(toBV32(1081081856))
; [eval] toBV32(1081081856)
; [eval] tofp(toBV32(1103888384))
; [eval] toBV32(1103888384)
; [eval] tofp(toBV32(110388838))
; [eval] toBV32(110388838)
(set-option :timeout 0)
(push) ; 3
(assert (not (fp.eq (fp.max ((_ to_fp 8 24) ((_ int2bv 32) 1081081856)) ((_ to_fp 8 24) ((_ int2bv 32) 1103888384))) ((_ to_fp 8 24) ((_ int2bv 32) 110388838)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] fp_eq(fp_max(tofp(toBV32(1081081856)), tofp(toBV32(1103888384))), tofp(toBV32(110388838)))
; [eval] fp_max(tofp(toBV32(1081081856)), tofp(toBV32(1103888384)))
; [eval] tofp(toBV32(1081081856))
; [eval] toBV32(1081081856)
; [eval] tofp(toBV32(1103888384))
; [eval] toBV32(1103888384)
; [eval] tofp(toBV32(110388838))
; [eval] toBV32(110388838)
(set-option :timeout 0)
(push) ; 3
(assert (not (fp.eq (fp.max ((_ to_fp 8 24) ((_ int2bv 32) 1081081856)) ((_ to_fp 8 24) ((_ int2bv 32) 1103888384))) ((_ to_fp 8 24) ((_ int2bv 32) 110388838)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- testOp ----------
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
; var first: myFloat
(declare-const first@8@01 (_ FloatingPoint 8 24))
; [exec]
; var second: myFloat
(declare-const second@9@01 (_ FloatingPoint 8 24))
; [exec]
; var res: myFloat
(declare-const res@10@01 (_ FloatingPoint 8 24))
; [exec]
; var zero: myFloat
(declare-const zero@11@01 (_ FloatingPoint 8 24))
; [exec]
; var addition: myFloat
(declare-const addition@12@01 (_ FloatingPoint 8 24))
; [exec]
; var result_addition: myFloat
(declare-const result_addition@13@01 (_ FloatingPoint 8 24))
; [exec]
; first := tofp(toBV32(1081081856))
; [eval] tofp(toBV32(1081081856))
; [eval] toBV32(1081081856)
(declare-const first@14@01 (_ FloatingPoint 8 24))
(assert (= first@14@01 ((_ to_fp 8 24) ((_ int2bv 32) 1081081856))))
; [exec]
; second := tofp(toBV32(1103888384))
; [eval] tofp(toBV32(1103888384))
; [eval] toBV32(1103888384)
(declare-const second@15@01 (_ FloatingPoint 8 24))
(assert (= second@15@01 ((_ to_fp 8 24) ((_ int2bv 32) 1103888384))))
; [exec]
; res := tofp(toBV32(1105854464))
; [eval] tofp(toBV32(1105854464))
; [eval] toBV32(1105854464)
(declare-const res@16@01 (_ FloatingPoint 8 24))
(assert (= res@16@01 ((_ to_fp 8 24) ((_ int2bv 32) 1105854464))))
; [exec]
; zero := tofp(toBV32(0))
; [eval] tofp(toBV32(0))
; [eval] toBV32(0)
(declare-const zero@17@01 (_ FloatingPoint 8 24))
(assert (= zero@17@01 ((_ to_fp 8 24) ((_ int2bv 32) 0))))
; [exec]
; addition := add(first, second)
; [eval] add(first, second)
(declare-const addition@18@01 (_ FloatingPoint 8 24))
(assert (= addition@18@01 (fp.add RNE first@14@01 second@15@01)))
; [exec]
; result_addition := add(res, zero)
; [eval] add(res, zero)
(declare-const result_addition@19@01 (_ FloatingPoint 8 24))
(assert (= result_addition@19@01 (fp.add RNE res@16@01 zero@17@01)))
; [exec]
; assert addition == result_addition
; [eval] addition == result_addition
(push) ; 3
(assert (not (= addition@18@01 result_addition@19@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= addition@18@01 result_addition@19@01))
; [exec]
; assert gt(addition, result_addition)
; [eval] gt(addition, result_addition)
(push) ; 3
(assert (not (fp.gt addition@18@01 result_addition@19@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] gt(addition, result_addition)
(set-option :timeout 0)
(push) ; 3
(assert (not (fp.gt addition@18@01 result_addition@19@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] gt(addition, result_addition)
(set-option :timeout 0)
(push) ; 3
(assert (not (fp.gt addition@18@01 result_addition@19@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] gt(addition, result_addition)
(set-option :timeout 0)
(push) ; 3
(assert (not (fp.gt addition@18@01 result_addition@19@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
