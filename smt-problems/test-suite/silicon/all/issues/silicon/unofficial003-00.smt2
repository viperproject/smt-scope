(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:58:57
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/unofficial003.vpr
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
; ////////// Symbols
(declare-fun Seq_length (Seq<Int>) Int)
(declare-const Seq_empty Seq<Int>)
(declare-fun Seq_singleton (Int) Seq<Int>)
(declare-fun Seq_append (Seq<Int> Seq<Int>) Seq<Int>)
(declare-fun Seq_index (Seq<Int> Int) Int)
(declare-fun Seq_add (Int Int) Int)
(declare-fun Seq_sub (Int Int) Int)
(declare-fun Seq_update (Seq<Int> Int Int) Seq<Int>)
(declare-fun Seq_take (Seq<Int> Int) Seq<Int>)
(declare-fun Seq_drop (Seq<Int> Int) Seq<Int>)
(declare-fun Seq_contains (Seq<Int> Int) Bool)
(declare-fun Seq_contains_trigger (Seq<Int> Int) Bool)
(declare-fun Seq_skolem (Seq<Int> Int) Int)
(declare-fun Seq_equal (Seq<Int> Seq<Int>) Bool)
(declare-fun Seq_skolem_diff (Seq<Int> Seq<Int>) Int)
(declare-fun Seq_range (Int Int) Seq<Int>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun fun02 ($Snap $Ref Bool) Bool)
(declare-fun fun02%limited ($Snap $Ref Bool) Bool)
(declare-fun fun02%stateless ($Ref Bool) Bool)
(declare-fun fun02%precondition ($Snap $Ref Bool) Bool)
(declare-fun fun01 ($Snap $Ref Bool Bool) Int)
(declare-fun fun01%limited ($Snap $Ref Bool Bool) Int)
(declare-fun fun01%stateless ($Ref Bool Bool) Bool)
(declare-fun fun01%precondition ($Snap $Ref Bool Bool) Bool)
(declare-fun vals ($Snap $Ref) Seq<Int>)
(declare-fun vals%limited ($Snap $Ref) Seq<Int>)
(declare-fun vals%stateless ($Ref) Bool)
(declare-fun vals%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun P01%trigger ($Snap $Ref Bool) Bool)
(declare-fun Tree%trigger ($Snap $Ref) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((s Seq<Int>)) (!
  (<= 0 (Seq_length s))
  :pattern ((Seq_length s))
  )))
(assert (= (Seq_length (as Seq_empty  Seq<Int>)) 0))
(assert (forall ((s Seq<Int>)) (!
  (=> (= (Seq_length s) 0) (= s (as Seq_empty  Seq<Int>)))
  :pattern ((Seq_length s))
  )))
(assert (forall ((e Int)) (!
  (= (Seq_length (Seq_singleton e)) 1)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<Int>) (s1 Seq<Int>)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Int>)))
      (not (= s1 (as Seq_empty  Seq<Int>))))
    (= (Seq_length (Seq_append s0 s1)) (+ (Seq_length s0) (Seq_length s1))))
  :pattern ((Seq_length (Seq_append s0 s1)))
  )))
(assert (forall ((s0 Seq<Int>) (s1 Seq<Int>)) (!
  (and
    (=> (= s0 (as Seq_empty  Seq<Int>)) (= (Seq_append s0 s1) s1))
    (=> (= s1 (as Seq_empty  Seq<Int>)) (= (Seq_append s0 s1) s0)))
  :pattern ((Seq_append s0 s1))
  )))
(assert (forall ((e Int)) (!
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
(assert (forall ((s0 Seq<Int>) (s1 Seq<Int>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Int>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Int>)))
        (and (<= 0 n) (< n (Seq_length s0)))))
    (= (Seq_index (Seq_append s0 s1) n) (Seq_index s0 n)))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  :pattern ((Seq_index s0 n) (Seq_append s0 s1))
  )))
(assert (forall ((s0 Seq<Int>) (s1 Seq<Int>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Int>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Int>)))
        (and (<= (Seq_length s0) n) (< n (Seq_length (Seq_append s0 s1))))))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s0)) (Seq_length s0)) n)
      (=
        (Seq_index (Seq_append s0 s1) n)
        (Seq_index s1 (Seq_sub n (Seq_length s0))))))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  )))
(assert (forall ((s0 Seq<Int>) (s1 Seq<Int>) (m Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Int>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Int>)))
        (and (<= 0 m) (< m (Seq_length s1)))))
    (and
      (= (Seq_sub (Seq_add m (Seq_length s0)) (Seq_length s0)) m)
      (=
        (Seq_index (Seq_append s0 s1) (Seq_add m (Seq_length s0)))
        (Seq_index s1 m))))
  :pattern ((Seq_index s1 m) (Seq_append s0 s1))
  )))
(assert (forall ((s Seq<Int>) (i Int) (v Int)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (= (Seq_length (Seq_update s i v)) (Seq_length s)))
  :pattern ((Seq_length (Seq_update s i v)))
  :pattern ((Seq_length s) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Int>) (i Int) (v Int) (n Int)) (!
  (=>
    (and (<= 0 n) (< n (Seq_length s)))
    (and
      (=> (= i n) (= (Seq_index (Seq_update s i v) n) v))
      (=> (not (= i n)) (= (Seq_index (Seq_update s i v) n) (Seq_index s n)))))
  :pattern ((Seq_index (Seq_update s i v) n))
  :pattern ((Seq_index s n) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Int>) (n Int)) (!
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
(assert (forall ((s Seq<Int>) (n Int) (j Int)) (!
  (=>
    (and (<= 0 j) (and (< j n) (< j (Seq_length s))))
    (= (Seq_index (Seq_take s n) j) (Seq_index s j)))
  :pattern ((Seq_index (Seq_take s n) j))
  :pattern ((Seq_index s j) (Seq_take s n))
  )))
(assert (forall ((s Seq<Int>) (n Int)) (!
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
(assert (forall ((s Seq<Int>) (n Int) (j Int)) (!
  (=>
    (and (< 0 n) (and (<= 0 j) (< j (- (Seq_length s) n))))
    (and
      (= (Seq_sub (Seq_add j n) n) j)
      (= (Seq_index (Seq_drop s n) j) (Seq_index s (Seq_add j n)))))
  :pattern ((Seq_index (Seq_drop s n) j))
  )))
(assert (forall ((s Seq<Int>) (n Int) (i Int)) (!
  (=>
    (and (< 0 n) (and (<= n i) (< i (Seq_length s))))
    (and
      (= (Seq_add (Seq_sub i n) n) i)
      (= (Seq_index (Seq_drop s n) (Seq_sub i n)) (Seq_index s i))))
  :pattern ((Seq_drop s n) (Seq_index s i))
  )))
(assert (forall ((s Seq<Int>) (t Seq<Int>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_take (Seq_append s t) n) (Seq_take s n)))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Int>) (t Seq<Int>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (=
        (Seq_take (Seq_append s t) n)
        (Seq_append s (Seq_take t (Seq_sub n (Seq_length s)))))))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Int>) (t Seq<Int>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_drop (Seq_append s t) n) (Seq_append (Seq_drop s n) t)))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Int>) (t Seq<Int>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (= (Seq_drop (Seq_append s t) n) (Seq_drop t (Seq_sub n (Seq_length s))))))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Int>) (n Int)) (!
  (=> (<= n 0) (= (Seq_take s n) (as Seq_empty  Seq<Int>)))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Int>) (n Int)) (!
  (=> (<= n 0) (= (Seq_drop s n) s))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Int>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_take s n) s))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Int>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_drop s n) (as Seq_empty  Seq<Int>)))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Int>) (x Int)) (!
  (=>
    (Seq_contains s x)
    (and
      (<= 0 (Seq_skolem s x))
      (and
        (< (Seq_skolem s x) (Seq_length s))
        (= (Seq_index s (Seq_skolem s x)) x))))
  :pattern ((Seq_contains s x))
  )))
(assert (forall ((s Seq<Int>) (x Int) (i Int)) (!
  (=>
    (and (<= 0 i) (and (< i (Seq_length s)) (= (Seq_index s i) x)))
    (Seq_contains s x))
  :pattern ((Seq_contains s x) (Seq_index s i))
  )))
(assert (forall ((s Seq<Int>) (i Int)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (Seq_contains_trigger s (Seq_index s i)))
  :pattern ((Seq_index s i))
  )))
(assert (forall ((s0 Seq<Int>) (s1 Seq<Int>)) (!
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
(assert (forall ((a Seq<Int>) (b Seq<Int>)) (!
  (=> (Seq_equal a b) (= a b))
  :pattern ((Seq_equal a b))
  )))
(assert (forall ((x Int) (y Int)) (!
  (= (Seq_contains (Seq_singleton x) y) (= x y))
  :pattern ((Seq_contains (Seq_singleton x) y))
  )))
(assert (forall ((min_ Int) (max Int)) (!
  (and
    (=> (< min_ max) (= (Seq_length (Seq_range min_ max)) (- max min_)))
    (=> (<= max min_) (= (Seq_length (Seq_range min_ max)) 0)))
  :pattern ((Seq_length (Seq_range min_ max)))
  :qid |$Seq[Int]_prog.ranged_seq_length|)))
(assert (forall ((min_ Int) (max Int) (j Int)) (!
  (=>
    (and (<= 0 j) (< j (- max min_)))
    (= (Seq_index (Seq_range min_ max) j) (+ min_ j)))
  :pattern ((Seq_index (Seq_range min_ max) j))
  :qid |$Seq[Int]_prog.ranged_seq_index|)))
(assert (forall ((min_ Int) (max Int) (v Int)) (!
  (= (Seq_contains (Seq_range min_ max) v) (and (<= min_ v) (< v max)))
  :pattern ((Seq_contains (Seq_range min_ max) v))
  :qid |$Seq[Int]_prog.ranged_seq_contains|)))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(declare-fun joined_unfolding@9@00 ($Snap $Ref Bool) Bool)
(declare-fun joined_unfolding@10@00 ($Snap $Ref) Seq<Int>)
(assert (forall ((s@$ $Snap) (x@0@00 $Ref) (b@1@00 Bool)) (!
  (= (fun02%limited s@$ x@0@00 b@1@00) (fun02 s@$ x@0@00 b@1@00))
  :pattern ((fun02 s@$ x@0@00 b@1@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref) (b@1@00 Bool)) (!
  (fun02%stateless x@0@00 b@1@00)
  :pattern ((fun02%limited s@$ x@0@00 b@1@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref) (b@1@00 Bool)) (!
  (=>
    (fun02%precondition s@$ x@0@00 b@1@00)
    (=
      (fun02 s@$ x@0@00 b@1@00)
      (ite
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          $Ref.null)
        b@1@00
        (fun02%limited ($Snap.second ($Snap.second s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) b@1@00))))
  :pattern ((fun02 s@$ x@0@00 b@1@00))
  :pattern ((fun02%stateless x@0@00 b@1@00) (P01%trigger s@$ x@0@00 b@1@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref) (b@1@00 Bool)) (!
  (=>
    (fun02%precondition s@$ x@0@00 b@1@00)
    (ite
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)
      true
      (fun02%precondition ($Snap.second ($Snap.second s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) b@1@00)))
  :pattern ((fun02 s@$ x@0@00 b@1@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (x@3@00 $Ref) (b1@4@00 Bool) (b2@5@00 Bool)) (!
  (=
    (fun01%limited s@$ x@3@00 b1@4@00 b2@5@00)
    (fun01 s@$ x@3@00 b1@4@00 b2@5@00))
  :pattern ((fun01 s@$ x@3@00 b1@4@00 b2@5@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (x@3@00 $Ref) (b1@4@00 Bool) (b2@5@00 Bool)) (!
  (fun01%stateless x@3@00 b1@4@00 b2@5@00)
  :pattern ((fun01%limited s@$ x@3@00 b1@4@00 b2@5@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (x@3@00 $Ref) (b1@4@00 Bool) (b2@5@00 Bool)) (!
  (=>
    (fun01%precondition s@$ x@3@00 b1@4@00 b2@5@00)
    (=
      (fun01 s@$ x@3@00 b1@4@00 b2@5@00)
      ($SortWrappers.$SnapToInt ($Snap.first s@$))))
  :pattern ((fun01 s@$ x@3@00 b1@4@00 b2@5@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (x@3@00 $Ref) (b1@4@00 Bool) (b2@5@00 Bool)) (!
  true
  :pattern ((fun01 s@$ x@3@00 b1@4@00 b2@5@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (x@7@00 $Ref)) (!
  (= (vals%limited s@$ x@7@00) (vals s@$ x@7@00))
  :pattern ((vals s@$ x@7@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (x@7@00 $Ref)) (!
  (vals%stateless x@7@00)
  :pattern ((vals%limited s@$ x@7@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (x@7@00 $Ref)) (!
  (=>
    (vals%precondition s@$ x@7@00)
    (=
      (vals s@$ x@7@00)
      (Seq_append
        (Seq_append
          (ite
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              $Ref.null)
            (as Seq_empty  Seq<Int>)
            (vals%limited ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))
          (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first s@$))))
        (ite
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))))
            $Ref.null)
          (as Seq_empty  Seq<Int>)
          (vals%limited ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))))))))
  :pattern ((vals s@$ x@7@00))
  :pattern ((vals%stateless x@7@00) (Tree%trigger s@$ x@7@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (x@7@00 $Ref)) (!
  (=>
    (vals%precondition s@$ x@7@00)
    (and
      (ite
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          $Ref.null)
        true
        (vals%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))
      (ite
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))))
          $Ref.null)
        true
        (vals%precondition ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
  :pattern ((vals s@$ x@7@00))
  :qid |quant-u-11|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test01 ----------
(declare-const x@0@01 $Ref)
(declare-const b1@1@01 Bool)
(declare-const b2@2@01 Bool)
(declare-const x@3@01 $Ref)
(declare-const b1@4@01 Bool)
(declare-const b2@5@01 Bool)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@6@01 Int)
(assert (not (= x@3@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; x.v := 4
; [exec]
; assert fun01(x, b2, b1) == 4
; [eval] fun01(x, b2, b1) == 4
; [eval] fun01(x, b2, b1)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not b2@5@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b2@5@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | b2@5@01 | live]
; [else-branch: 0 | !(b2@5@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 0 | b2@5@01]
(assert b2@5@01)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not b1@4@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not b1@4@01))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | b1@4@01 | live]
; [else-branch: 1 | !(b1@4@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 1 | b1@4@01]
(assert b1@4@01)
(assert (fun01%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 4)
  ($Snap.combine ($SortWrappers.IntTo$Snap 4) ($SortWrappers.IntTo$Snap 4))) x@3@01 b2@5@01 b1@4@01))
(pop) ; 5
(push) ; 5
; [else-branch: 1 | !(b1@4@01)]
(assert (not b1@4@01))
(assert (fun01%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 4)
  ($Snap.combine ($SortWrappers.IntTo$Snap 4) $Snap.unit)) x@3@01 b2@5@01 b1@4@01))
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 0 | !(b2@5@01)]
(assert (not b2@5@01))
(push) ; 5
(set-option :timeout 10)
(assert (not (not b1@4@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not b1@4@01))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | b1@4@01 | live]
; [else-branch: 2 | !(b1@4@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 2 | b1@4@01]
(assert b1@4@01)
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (fun01%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 4)
  ($Snap.combine $Snap.unit ($SortWrappers.IntTo$Snap 4))) x@3@01 b2@5@01 b1@4@01))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 2 | !(b1@4@01)]
(assert (not b1@4@01))
(assert (fun01%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 4)
  ($Snap.combine $Snap.unit $Snap.unit)) x@3@01 b2@5@01 b1@4@01))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(declare-fun joined_fun01@7@01 ($Ref Bool Bool) Int)
(assert (=>
  (and b1@4@01 b2@5@01)
  (=
    (joined_fun01@7@01 x@3@01 b2@5@01 b1@4@01)
    (fun01 ($Snap.combine
      ($SortWrappers.IntTo$Snap 4)
      ($Snap.combine ($SortWrappers.IntTo$Snap 4) ($SortWrappers.IntTo$Snap 4))) x@3@01 b2@5@01 b1@4@01))))
(assert (=>
  (and (not b1@4@01) b2@5@01)
  (=
    (joined_fun01@7@01 x@3@01 b2@5@01 b1@4@01)
    (fun01 ($Snap.combine
      ($SortWrappers.IntTo$Snap 4)
      ($Snap.combine ($SortWrappers.IntTo$Snap 4) $Snap.unit)) x@3@01 b2@5@01 b1@4@01))))
(assert (=>
  (and b1@4@01 (not b2@5@01))
  (=
    (joined_fun01@7@01 x@3@01 b2@5@01 b1@4@01)
    (fun01 ($Snap.combine
      ($SortWrappers.IntTo$Snap 4)
      ($Snap.combine $Snap.unit ($SortWrappers.IntTo$Snap 4))) x@3@01 b2@5@01 b1@4@01))))
(assert (=>
  (and (not b1@4@01) (not b2@5@01))
  (=
    (joined_fun01@7@01 x@3@01 b2@5@01 b1@4@01)
    (fun01 ($Snap.combine
      ($SortWrappers.IntTo$Snap 4)
      ($Snap.combine $Snap.unit $Snap.unit)) x@3@01 b2@5@01 b1@4@01))))
; Joined path conditions
(assert (=>
  (and b2@5@01 b1@4@01)
  (and
    b1@4@01
    (fun01%precondition ($Snap.combine
      ($SortWrappers.IntTo$Snap 4)
      ($Snap.combine ($SortWrappers.IntTo$Snap 4) ($SortWrappers.IntTo$Snap 4))) x@3@01 b2@5@01 b1@4@01))))
; Joined path conditions
(assert (=>
  (and b2@5@01 (not b1@4@01))
  (and
    (not b1@4@01)
    (fun01%precondition ($Snap.combine
      ($SortWrappers.IntTo$Snap 4)
      ($Snap.combine ($SortWrappers.IntTo$Snap 4) $Snap.unit)) x@3@01 b2@5@01 b1@4@01))))
; Joined path conditions
(assert (=>
  (and (not b2@5@01) b1@4@01)
  (and
    b1@4@01
    (fun01%precondition ($Snap.combine
      ($SortWrappers.IntTo$Snap 4)
      ($Snap.combine $Snap.unit ($SortWrappers.IntTo$Snap 4))) x@3@01 b2@5@01 b1@4@01))))
; Joined path conditions
(assert (=>
  (and (not b2@5@01) (not b1@4@01))
  (and
    (not b1@4@01)
    (fun01%precondition ($Snap.combine
      ($SortWrappers.IntTo$Snap 4)
      ($Snap.combine $Snap.unit $Snap.unit)) x@3@01 b2@5@01 b1@4@01))))
(assert (or
  (and (not b1@4@01) (not b2@5@01))
  (and b1@4@01 (not b2@5@01))
  (and (not b1@4@01) b2@5@01)
  (and b1@4@01 b2@5@01)))
(push) ; 3
(assert (not (= (joined_fun01@7@01 x@3@01 b2@5@01 b1@4@01) 4)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (joined_fun01@7@01 x@3@01 b2@5@01 b1@4@01) 4))
; [exec]
; assert false
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
(declare-const x@8@01 $Ref)
(declare-const b@9@01 Bool)
(declare-const x@10@01 $Ref)
(declare-const b@11@01 Bool)
(push) ; 1
(declare-const $t@12@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(P01(x, b), write)
(assert (= $t@12@01 ($Snap.combine ($Snap.first $t@12@01) ($Snap.second $t@12@01))))
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@11@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not b@11@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | b@11@01 | live]
; [else-branch: 3 | !(b@11@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 3 | b@11@01]
(assert b@11@01)
(assert (not (= x@10@01 $Ref.null)))
(assert (=
  ($Snap.second $t@12@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@12@01))
    ($Snap.second ($Snap.second $t@12@01)))))
; [eval] x.r != null
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@12@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@12@01))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | First:(Second:($t@12@01)) != Null | live]
; [else-branch: 4 | First:(Second:($t@12@01)) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 4 | First:(Second:($t@12@01)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@12@01))) $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (P01%trigger $t@12@01 x@10@01 b@11@01))
; [exec]
; inhale b
(declare-const $t@13@01 $Snap)
(assert (= $t@13@01 $Snap.unit))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale x.r == null
(declare-const $t@14@01 $Snap)
(assert (= $t@14@01 $Snap.unit))
; [eval] x.r == null
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@12@01))) $Ref.null))
; State saturation: after inhale
(check-sat)
; unsat
; [exec]
; fold acc(P01(x, b), write)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@11@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | b@11@01 | dead]
; [else-branch: 5 | !(b@11@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 5 | !(b@11@01)]
(assert (not b@11@01))
; [eval] x.r != null
; [then-branch: 6 | First:(Second:($t@12@01)) != Null | dead]
; [else-branch: 6 | First:(Second:($t@12@01)) == Null | live]
(push) ; 6
; [else-branch: 6 | First:(Second:($t@12@01)) == Null]
(assert (P01%trigger ($Snap.combine
  $Snap.unit
  ($Snap.combine ($Snap.first ($Snap.second $t@12@01)) $Snap.unit)) x@10@01 b@11@01))
(push) ; 7
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@12@01))) x@10@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@12@01))
  ($Snap.combine
    $Snap.unit
    ($Snap.combine ($Snap.first ($Snap.second $t@12@01)) $Snap.unit))))
; [exec]
; assert fun02(x, b)
; [eval] fun02(x, b)
(set-option :timeout 0)
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@12@01))) x@10@01)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (fun02%precondition ($Snap.second ($Snap.second $t@12@01)) x@10@01 b@11@01))
(pop) ; 7
; Joined path conditions
(assert (fun02%precondition ($Snap.second ($Snap.second $t@12@01)) x@10@01 b@11@01))
(set-option :timeout 0)
(push) ; 7
(assert (not (fun02 ($Snap.second ($Snap.second $t@12@01)) x@10@01 b@11@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (fun02 ($Snap.second ($Snap.second $t@12@01)) x@10@01 b@11@01))
; [exec]
; assert !fun02(x, b)
; [eval] !fun02(x, b)
; [eval] fun02(x, b)
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@12@01))) x@10@01)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
; Joined path conditions
(set-option :timeout 0)
(push) ; 7
(assert (not (not (fun02 ($Snap.second ($Snap.second $t@12@01)) x@10@01 b@11@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (not (fun02 ($Snap.second ($Snap.second $t@12@01)) x@10@01 b@11@01)))
(pop) ; 6
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 4 | First:(Second:($t@12@01)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@12@01))) $Ref.null))
(assert (= ($Snap.second ($Snap.second $t@12@01)) $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (P01%trigger $t@12@01 x@10@01 b@11@01))
; [exec]
; inhale b
(declare-const $t@15@01 $Snap)
(assert (= $t@15@01 $Snap.unit))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale x.r == null
(declare-const $t@16@01 $Snap)
(assert (= $t@16@01 $Snap.unit))
; [eval] x.r == null
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; fold acc(P01(x, b), write)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@11@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | b@11@01 | live]
; [else-branch: 7 | !(b@11@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 7 | b@11@01]
; [eval] x.r != null
; [then-branch: 8 | First:(Second:($t@12@01)) != Null | dead]
; [else-branch: 8 | First:(Second:($t@12@01)) == Null | live]
(push) ; 6
; [else-branch: 8 | First:(Second:($t@12@01)) == Null]
(assert (P01%trigger ($Snap.combine
  ($Snap.first $t@12@01)
  ($Snap.combine ($Snap.first ($Snap.second $t@12@01)) $Snap.unit)) x@10@01 b@11@01))
; [exec]
; assert fun02(x, b)
; [eval] fun02(x, b)
(push) ; 7
(assert (fun02%precondition ($Snap.combine
  ($Snap.first $t@12@01)
  ($Snap.combine ($Snap.first ($Snap.second $t@12@01)) $Snap.unit)) x@10@01 b@11@01))
(pop) ; 7
; Joined path conditions
(assert (fun02%precondition ($Snap.combine
  ($Snap.first $t@12@01)
  ($Snap.combine ($Snap.first ($Snap.second $t@12@01)) $Snap.unit)) x@10@01 b@11@01))
(push) ; 7
(assert (not (fun02 ($Snap.combine
  ($Snap.first $t@12@01)
  ($Snap.combine ($Snap.first ($Snap.second $t@12@01)) $Snap.unit)) x@10@01 b@11@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (fun02 ($Snap.combine
  ($Snap.first $t@12@01)
  ($Snap.combine ($Snap.first ($Snap.second $t@12@01)) $Snap.unit)) x@10@01 b@11@01))
; [exec]
; assert !fun02(x, b)
; [eval] !fun02(x, b)
; [eval] fun02(x, b)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(assert (not (not
  (fun02 ($Snap.combine
    ($Snap.first $t@12@01)
    ($Snap.combine ($Snap.first ($Snap.second $t@12@01)) $Snap.unit)) x@10@01 b@11@01))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] !fun02(x, b)
; [eval] fun02(x, b)
(set-option :timeout 0)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(assert (not (not
  (fun02 ($Snap.combine
    ($Snap.first $t@12@01)
    ($Snap.combine ($Snap.first ($Snap.second $t@12@01)) $Snap.unit)) x@10@01 b@11@01))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] !fun02(x, b)
; [eval] fun02(x, b)
(set-option :timeout 0)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(assert (not (not
  (fun02 ($Snap.combine
    ($Snap.first $t@12@01)
    ($Snap.combine ($Snap.first ($Snap.second $t@12@01)) $Snap.unit)) x@10@01 b@11@01))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] !fun02(x, b)
; [eval] fun02(x, b)
(set-option :timeout 0)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(assert (not (not
  (fun02 ($Snap.combine
    ($Snap.first $t@12@01)
    ($Snap.combine ($Snap.first ($Snap.second $t@12@01)) $Snap.unit)) x@10@01 b@11@01))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test03 ----------
(declare-const x@17@01 $Ref)
(declare-const b@18@01 Bool)
(declare-const x@19@01 $Ref)
(declare-const b@20@01 Bool)
(push) ; 1
(declare-const $t@21@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(P01(x, b), write)
(assert (= $t@21@01 ($Snap.combine ($Snap.first $t@21@01) ($Snap.second $t@21@01))))
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@20@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not b@20@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | b@20@01 | live]
; [else-branch: 9 | !(b@20@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 9 | b@20@01]
(assert b@20@01)
(assert (not (= x@19@01 $Ref.null)))
(assert (=
  ($Snap.second $t@21@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@21@01))
    ($Snap.second ($Snap.second $t@21@01)))))
; [eval] x.r != null
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@21@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@21@01))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | First:(Second:($t@21@01)) != Null | live]
; [else-branch: 10 | First:(Second:($t@21@01)) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 10 | First:(Second:($t@21@01)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@21@01))) $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (P01%trigger $t@21@01 x@19@01 b@20@01))
; [exec]
; inhale b
(declare-const $t@22@01 $Snap)
(assert (= $t@22@01 $Snap.unit))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; fold acc(P01(x, b), write)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@20@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | b@20@01 | live]
; [else-branch: 11 | !(b@20@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 11 | b@20@01]
; [eval] x.r != null
(push) ; 6
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@21@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | First:(Second:($t@21@01)) != Null | live]
; [else-branch: 12 | First:(Second:($t@21@01)) == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 12 | First:(Second:($t@21@01)) != Null]
(assert (P01%trigger ($Snap.combine
  ($Snap.first $t@21@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@21@01))
    ($Snap.second ($Snap.second $t@21@01)))) x@19@01 b@20@01))
; [exec]
; assert fun02(x, b)
; [eval] fun02(x, b)
(push) ; 7
(assert (fun02%precondition ($Snap.combine
  ($Snap.first $t@21@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@21@01))
    ($Snap.second ($Snap.second $t@21@01)))) x@19@01 b@20@01))
(pop) ; 7
; Joined path conditions
(assert (fun02%precondition ($Snap.combine
  ($Snap.first $t@21@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@21@01))
    ($Snap.second ($Snap.second $t@21@01)))) x@19@01 b@20@01))
(push) ; 7
(assert (not (fun02 ($Snap.combine
  ($Snap.first $t@21@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@21@01))
    ($Snap.second ($Snap.second $t@21@01)))) x@19@01 b@20@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] fun02(x, b)
(set-option :timeout 0)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(assert (not (fun02 ($Snap.combine
  ($Snap.first $t@21@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@21@01))
    ($Snap.second ($Snap.second $t@21@01)))) x@19@01 b@20@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] fun02(x, b)
(set-option :timeout 0)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(assert (not (fun02 ($Snap.combine
  ($Snap.first $t@21@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@21@01))
    ($Snap.second ($Snap.second $t@21@01)))) x@19@01 b@20@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] fun02(x, b)
(set-option :timeout 0)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(assert (not (fun02 ($Snap.combine
  ($Snap.first $t@21@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@21@01))
    ($Snap.second ($Snap.second $t@21@01)))) x@19@01 b@20@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
