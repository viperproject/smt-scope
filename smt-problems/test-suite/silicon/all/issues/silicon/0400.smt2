(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:56:41
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0400.vpr
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
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
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
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test_take_01 ----------
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
; var a: Seq[Int]
(declare-const a@0@01 Seq<Int>)
; [exec]
; a := Seq(1, 4, 5, 7, 8)
; [eval] Seq(1, 4, 5, 7, 8)
(assert (=
  (Seq_length
    (Seq_append
      (Seq_append
        (Seq_append
          (Seq_append (Seq_singleton 1) (Seq_singleton 4))
          (Seq_singleton 5))
        (Seq_singleton 7))
      (Seq_singleton 8)))
  5))
(declare-const a@1@01 Seq<Int>)
(assert (=
  a@1@01
  (Seq_append
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton 1) (Seq_singleton 4))
        (Seq_singleton 5))
      (Seq_singleton 7))
    (Seq_singleton 8))))
; [exec]
; assert a[..0] == Seq[Int]()
; [eval] a[..0] == Seq[Int]()
; [eval] a[..0]
; [eval] Seq[Int]()
(push) ; 3
(assert (not (Seq_equal (Seq_take a@1@01 0) (as Seq_empty  Seq<Int>))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal (Seq_take a@1@01 0) (as Seq_empty  Seq<Int>)))
; [exec]
; assert a[..1] == Seq(1)
; [eval] a[..1] == Seq(1)
; [eval] a[..1]
; [eval] Seq(1)
(assert (= (Seq_length (Seq_singleton 1)) 1))
(push) ; 3
(assert (not (Seq_equal (Seq_take a@1@01 1) (Seq_singleton 1))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal (Seq_take a@1@01 1) (Seq_singleton 1)))
; [exec]
; assert a[..2] == Seq(1, 4)
; [eval] a[..2] == Seq(1, 4)
; [eval] a[..2]
; [eval] Seq(1, 4)
(assert (= (Seq_length (Seq_append (Seq_singleton 1) (Seq_singleton 4))) 2))
(push) ; 3
(assert (not (Seq_equal (Seq_take a@1@01 2) (Seq_append (Seq_singleton 1) (Seq_singleton 4)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal (Seq_take a@1@01 2) (Seq_append (Seq_singleton 1) (Seq_singleton 4))))
; [exec]
; assert a[..5] == a
; [eval] a[..5] == a
; [eval] a[..5]
(push) ; 3
(assert (not (Seq_equal (Seq_take a@1@01 5) a@1@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal (Seq_take a@1@01 5) a@1@01))
(pop) ; 2
(pop) ; 1
; ---------- test_take_length_01 ----------
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
; var a: Seq[Int]
(declare-const a@2@01 Seq<Int>)
; [exec]
; a := Seq(1, 4, 5, 7, 8)
; [eval] Seq(1, 4, 5, 7, 8)
(assert (=
  (Seq_length
    (Seq_append
      (Seq_append
        (Seq_append
          (Seq_append (Seq_singleton 1) (Seq_singleton 4))
          (Seq_singleton 5))
        (Seq_singleton 7))
      (Seq_singleton 8)))
  5))
(declare-const a@3@01 Seq<Int>)
(assert (=
  a@3@01
  (Seq_append
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton 1) (Seq_singleton 4))
        (Seq_singleton 5))
      (Seq_singleton 7))
    (Seq_singleton 8))))
; [exec]
; assert |a[..0]| == 0
; [eval] |a[..0]| == 0
; [eval] |a[..0]|
; [eval] a[..0]
(push) ; 3
(assert (not (= (Seq_length (Seq_take a@3@01 0)) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Seq_length (Seq_take a@3@01 0)) 0))
; [exec]
; assert |a[..1]| == 1
; [eval] |a[..1]| == 1
; [eval] |a[..1]|
; [eval] a[..1]
(push) ; 3
(assert (not (= (Seq_length (Seq_take a@3@01 1)) 1)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Seq_length (Seq_take a@3@01 1)) 1))
; [exec]
; assert |a[..2]| == 2
; [eval] |a[..2]| == 2
; [eval] |a[..2]|
; [eval] a[..2]
(push) ; 3
(assert (not (= (Seq_length (Seq_take a@3@01 2)) 2)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Seq_length (Seq_take a@3@01 2)) 2))
; [exec]
; assert |a[..5]| == |a|
; [eval] |a[..5]| == |a|
; [eval] |a[..5]|
; [eval] a[..5]
; [eval] |a|
(push) ; 3
(assert (not (= (Seq_length (Seq_take a@3@01 5)) (Seq_length a@3@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Seq_length (Seq_take a@3@01 5)) (Seq_length a@3@01)))
(pop) ; 2
(pop) ; 1
; ---------- test_drop_01 ----------
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
; var a: Seq[Int]
(declare-const a@4@01 Seq<Int>)
; [exec]
; a := Seq(1, 4, 5, 7, 8)
; [eval] Seq(1, 4, 5, 7, 8)
(assert (=
  (Seq_length
    (Seq_append
      (Seq_append
        (Seq_append
          (Seq_append (Seq_singleton 1) (Seq_singleton 4))
          (Seq_singleton 5))
        (Seq_singleton 7))
      (Seq_singleton 8)))
  5))
(declare-const a@5@01 Seq<Int>)
(assert (=
  a@5@01
  (Seq_append
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton 1) (Seq_singleton 4))
        (Seq_singleton 5))
      (Seq_singleton 7))
    (Seq_singleton 8))))
; [exec]
; assert a[0..] == a
; [eval] a[0..] == a
; [eval] a[0..]
(push) ; 3
(assert (not (Seq_equal (Seq_drop a@5@01 0) a@5@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal (Seq_drop a@5@01 0) a@5@01))
; [exec]
; assert a[2..] == Seq(5, 7, 8)
; [eval] a[2..] == Seq(5, 7, 8)
; [eval] a[2..]
; [eval] Seq(5, 7, 8)
(assert (=
  (Seq_length
    (Seq_append
      (Seq_append (Seq_singleton 5) (Seq_singleton 7))
      (Seq_singleton 8)))
  3))
(push) ; 3
(assert (not (Seq_equal
  (Seq_drop a@5@01 2)
  (Seq_append (Seq_append (Seq_singleton 5) (Seq_singleton 7)) (Seq_singleton 8)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (Seq_drop a@5@01 2)
  (Seq_append (Seq_append (Seq_singleton 5) (Seq_singleton 7)) (Seq_singleton 8))))
; [exec]
; assert a[4..] == Seq(8)
; [eval] a[4..] == Seq(8)
; [eval] a[4..]
; [eval] Seq(8)
(assert (= (Seq_length (Seq_singleton 8)) 1))
(push) ; 3
(assert (not (Seq_equal (Seq_drop a@5@01 4) (Seq_singleton 8))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal (Seq_drop a@5@01 4) (Seq_singleton 8)))
; [exec]
; assert a[5..] == Seq[Int]()
; [eval] a[5..] == Seq[Int]()
; [eval] a[5..]
; [eval] Seq[Int]()
(push) ; 3
(assert (not (Seq_equal (Seq_drop a@5@01 5) (as Seq_empty  Seq<Int>))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal (Seq_drop a@5@01 5) (as Seq_empty  Seq<Int>)))
(pop) ; 2
(pop) ; 1
; ---------- test_drop_length_01 ----------
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
; var a: Seq[Int]
(declare-const a@6@01 Seq<Int>)
; [exec]
; a := Seq(1, 4, 5, 7, 8)
; [eval] Seq(1, 4, 5, 7, 8)
(assert (=
  (Seq_length
    (Seq_append
      (Seq_append
        (Seq_append
          (Seq_append (Seq_singleton 1) (Seq_singleton 4))
          (Seq_singleton 5))
        (Seq_singleton 7))
      (Seq_singleton 8)))
  5))
(declare-const a@7@01 Seq<Int>)
(assert (=
  a@7@01
  (Seq_append
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton 1) (Seq_singleton 4))
        (Seq_singleton 5))
      (Seq_singleton 7))
    (Seq_singleton 8))))
; [exec]
; assert |a[0..]| == |a|
; [eval] |a[0..]| == |a|
; [eval] |a[0..]|
; [eval] a[0..]
; [eval] |a|
(push) ; 3
(assert (not (= (Seq_length (Seq_drop a@7@01 0)) (Seq_length a@7@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Seq_length (Seq_drop a@7@01 0)) (Seq_length a@7@01)))
; [exec]
; assert |a[2..]| == 3
; [eval] |a[2..]| == 3
; [eval] |a[2..]|
; [eval] a[2..]
(push) ; 3
(assert (not (= (Seq_length (Seq_drop a@7@01 2)) 3)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Seq_length (Seq_drop a@7@01 2)) 3))
; [exec]
; assert |a[4..]| == 1
; [eval] |a[4..]| == 1
; [eval] |a[4..]|
; [eval] a[4..]
(push) ; 3
(assert (not (= (Seq_length (Seq_drop a@7@01 4)) 1)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Seq_length (Seq_drop a@7@01 4)) 1))
; [exec]
; assert |a[5..]| == 0
; [eval] |a[5..]| == 0
; [eval] |a[5..]|
; [eval] a[5..]
(push) ; 3
(assert (not (= (Seq_length (Seq_drop a@7@01 5)) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Seq_length (Seq_drop a@7@01 5)) 0))
(pop) ; 2
(pop) ; 1
; ---------- test_take_drop_01 ----------
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
; var a: Seq[Int]
(declare-const a@8@01 Seq<Int>)
; [exec]
; a := Seq(1, 4, 5, 7, 8)
; [eval] Seq(1, 4, 5, 7, 8)
(assert (=
  (Seq_length
    (Seq_append
      (Seq_append
        (Seq_append
          (Seq_append (Seq_singleton 1) (Seq_singleton 4))
          (Seq_singleton 5))
        (Seq_singleton 7))
      (Seq_singleton 8)))
  5))
(declare-const a@9@01 Seq<Int>)
(assert (=
  a@9@01
  (Seq_append
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton 1) (Seq_singleton 4))
        (Seq_singleton 5))
      (Seq_singleton 7))
    (Seq_singleton 8))))
; [exec]
; assert a[0..2] == a[0..2]
; [eval] a[0..2] == a[0..2]
; [eval] a[0..2]
; [eval] a[..2]
; [eval] a[0..2]
; [eval] a[..2]
; [exec]
; assert a[2..4] == a[2..4]
; [eval] a[2..4] == a[2..4]
; [eval] a[2..4]
; [eval] a[..4]
; [eval] a[2..4]
; [eval] a[..4]
; [exec]
; assert a[0..5] == a[0..5]
; [eval] a[0..5] == a[0..5]
; [eval] a[0..5]
; [eval] a[..5]
; [eval] a[0..5]
; [eval] a[..5]
; [exec]
; assert a[1..1] == a[1..1]
; [eval] a[1..1] == a[1..1]
; [eval] a[1..1]
; [eval] a[..1]
; [eval] a[1..1]
; [eval] a[..1]
(pop) ; 2
(pop) ; 1
; ---------- test_take_drop_length_01 ----------
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
; var a: Seq[Int]
(declare-const a@10@01 Seq<Int>)
; [exec]
; a := Seq(1, 4, 5, 7, 8)
; [eval] Seq(1, 4, 5, 7, 8)
(assert (=
  (Seq_length
    (Seq_append
      (Seq_append
        (Seq_append
          (Seq_append (Seq_singleton 1) (Seq_singleton 4))
          (Seq_singleton 5))
        (Seq_singleton 7))
      (Seq_singleton 8)))
  5))
(declare-const a@11@01 Seq<Int>)
(assert (=
  a@11@01
  (Seq_append
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton 1) (Seq_singleton 4))
        (Seq_singleton 5))
      (Seq_singleton 7))
    (Seq_singleton 8))))
; [exec]
; assert |a[0..2]| == 2
; [eval] |a[0..2]| == 2
; [eval] |a[0..2]|
; [eval] a[0..2]
; [eval] a[..2]
(push) ; 3
(assert (not (= (Seq_length (Seq_drop (Seq_take a@11@01 2) 0)) 2)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Seq_length (Seq_drop (Seq_take a@11@01 2) 0)) 2))
; [exec]
; assert |a[2..4]| == 2
; [eval] |a[2..4]| == 2
; [eval] |a[2..4]|
; [eval] a[2..4]
; [eval] a[..4]
(push) ; 3
(assert (not (= (Seq_length (Seq_drop (Seq_take a@11@01 4) 2)) 2)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Seq_length (Seq_drop (Seq_take a@11@01 4) 2)) 2))
; [exec]
; assert |a[0..5]| == 5
; [eval] |a[0..5]| == 5
; [eval] |a[0..5]|
; [eval] a[0..5]
; [eval] a[..5]
(push) ; 3
(assert (not (= (Seq_length (Seq_drop (Seq_take a@11@01 5) 0)) 5)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Seq_length (Seq_drop (Seq_take a@11@01 5) 0)) 5))
; [exec]
; assert |a[1..1]| == 0
; [eval] |a[1..1]| == 0
; [eval] |a[1..1]|
; [eval] a[1..1]
; [eval] a[..1]
(push) ; 3
(assert (not (= (Seq_length (Seq_drop (Seq_take a@11@01 1) 1)) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Seq_length (Seq_drop (Seq_take a@11@01 1) 1)) 0))
(pop) ; 2
(pop) ; 1
; ---------- test_take_02 ----------
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
; var a: Seq[Int]
(declare-const a@12@01 Seq<Int>)
; [exec]
; var e1: Int
(declare-const e1@13@01 Int)
; [exec]
; var e2: Int
(declare-const e2@14@01 Int)
; [exec]
; a := Seq(1, 4, 5, 7, 8)
; [eval] Seq(1, 4, 5, 7, 8)
(assert (=
  (Seq_length
    (Seq_append
      (Seq_append
        (Seq_append
          (Seq_append (Seq_singleton 1) (Seq_singleton 4))
          (Seq_singleton 5))
        (Seq_singleton 7))
      (Seq_singleton 8)))
  5))
(declare-const a@15@01 Seq<Int>)
(assert (=
  a@15@01
  (Seq_append
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton 1) (Seq_singleton 4))
        (Seq_singleton 5))
      (Seq_singleton 7))
    (Seq_singleton 8))))
; [exec]
; assert a[..-1] == Seq[Int]()
; [eval] a[..-1] == Seq[Int]()
; [eval] a[..-1]
; [eval] -1
; [eval] Seq[Int]()
(push) ; 3
(assert (not (Seq_equal (Seq_take a@15@01 (- 0 1)) (as Seq_empty  Seq<Int>))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal (Seq_take a@15@01 (- 0 1)) (as Seq_empty  Seq<Int>)))
; [exec]
; inhale e1 < -1
(declare-const $t@16@01 $Snap)
(assert (= $t@16@01 $Snap.unit))
; [eval] e1 < -1
; [eval] -1
(assert (< e1@13@01 (- 0 1)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert a[..e1] == Seq[Int]()
; [eval] a[..e1] == Seq[Int]()
; [eval] a[..e1]
; [eval] Seq[Int]()
(set-option :timeout 0)
(push) ; 3
(assert (not (Seq_equal (Seq_take a@15@01 e1@13@01) (as Seq_empty  Seq<Int>))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal (Seq_take a@15@01 e1@13@01) (as Seq_empty  Seq<Int>)))
; [exec]
; assert a[..6] == a
; [eval] a[..6] == a
; [eval] a[..6]
(push) ; 3
(assert (not (Seq_equal (Seq_take a@15@01 6) a@15@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal (Seq_take a@15@01 6) a@15@01))
; [exec]
; inhale 6 < e2
(declare-const $t@17@01 $Snap)
(assert (= $t@17@01 $Snap.unit))
; [eval] 6 < e2
(assert (< 6 e2@14@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert a[..e2] == a
; [eval] a[..e2] == a
; [eval] a[..e2]
(set-option :timeout 0)
(push) ; 3
(assert (not (Seq_equal (Seq_take a@15@01 e2@14@01) a@15@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal (Seq_take a@15@01 e2@14@01) a@15@01))
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
; ---------- test_take_length_02 ----------
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
; var a: Seq[Int]
(declare-const a@18@01 Seq<Int>)
; [exec]
; var e1: Int
(declare-const e1@19@01 Int)
; [exec]
; var e2: Int
(declare-const e2@20@01 Int)
; [exec]
; a := Seq(1, 4, 5, 7, 8)
; [eval] Seq(1, 4, 5, 7, 8)
(assert (=
  (Seq_length
    (Seq_append
      (Seq_append
        (Seq_append
          (Seq_append (Seq_singleton 1) (Seq_singleton 4))
          (Seq_singleton 5))
        (Seq_singleton 7))
      (Seq_singleton 8)))
  5))
(declare-const a@21@01 Seq<Int>)
(assert (=
  a@21@01
  (Seq_append
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton 1) (Seq_singleton 4))
        (Seq_singleton 5))
      (Seq_singleton 7))
    (Seq_singleton 8))))
; [exec]
; assert |a[..-1]| == 0
; [eval] |a[..-1]| == 0
; [eval] |a[..-1]|
; [eval] a[..-1]
; [eval] -1
(push) ; 3
(assert (not (= (Seq_length (Seq_take a@21@01 (- 0 1))) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Seq_length (Seq_take a@21@01 (- 0 1))) 0))
; [exec]
; inhale e1 < -1
(declare-const $t@22@01 $Snap)
(assert (= $t@22@01 $Snap.unit))
; [eval] e1 < -1
; [eval] -1
(assert (< e1@19@01 (- 0 1)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert |a[..e1]| == 0
; [eval] |a[..e1]| == 0
; [eval] |a[..e1]|
; [eval] a[..e1]
(set-option :timeout 0)
(push) ; 3
(assert (not (= (Seq_length (Seq_take a@21@01 e1@19@01)) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Seq_length (Seq_take a@21@01 e1@19@01)) 0))
; [exec]
; assert |a[..6]| == 5
; [eval] |a[..6]| == 5
; [eval] |a[..6]|
; [eval] a[..6]
(push) ; 3
(assert (not (= (Seq_length (Seq_take a@21@01 6)) 5)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Seq_length (Seq_take a@21@01 6)) 5))
; [exec]
; inhale 6 < e2
(declare-const $t@23@01 $Snap)
(assert (= $t@23@01 $Snap.unit))
; [eval] 6 < e2
(assert (< 6 e2@20@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert |a[..e2]| == 5
; [eval] |a[..e2]| == 5
; [eval] |a[..e2]|
; [eval] a[..e2]
(set-option :timeout 0)
(push) ; 3
(assert (not (= (Seq_length (Seq_take a@21@01 e2@20@01)) 5)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Seq_length (Seq_take a@21@01 e2@20@01)) 5))
(pop) ; 2
(pop) ; 1
; ---------- test_take_index_01 ----------
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
; var a: Seq[Int]
(declare-const a@24@01 Seq<Int>)
; [exec]
; a := Seq(1, 4, 5, 7, 8)
; [eval] Seq(1, 4, 5, 7, 8)
(assert (=
  (Seq_length
    (Seq_append
      (Seq_append
        (Seq_append
          (Seq_append (Seq_singleton 1) (Seq_singleton 4))
          (Seq_singleton 5))
        (Seq_singleton 7))
      (Seq_singleton 8)))
  5))
(declare-const a@25@01 Seq<Int>)
(assert (=
  a@25@01
  (Seq_append
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton 1) (Seq_singleton 4))
        (Seq_singleton 5))
      (Seq_singleton 7))
    (Seq_singleton 8))))
; [exec]
; assert a[..10][3] == 7
; [eval] a[..10][3] == 7
; [eval] a[..10][3]
; [eval] a[..10]
(push) ; 3
(assert (not (< 3 (Seq_length (Seq_take a@25@01 10)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (= (Seq_index (Seq_take a@25@01 10) 3) 7)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Seq_index (Seq_take a@25@01 10) 3) 7))
(pop) ; 2
(pop) ; 1
; ---------- test_drop_02 ----------
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
; var a: Seq[Int]
(declare-const a@26@01 Seq<Int>)
; [exec]
; var e1: Int
(declare-const e1@27@01 Int)
; [exec]
; var e2: Int
(declare-const e2@28@01 Int)
; [exec]
; a := Seq(1, 4, 5, 7, 8)
; [eval] Seq(1, 4, 5, 7, 8)
(assert (=
  (Seq_length
    (Seq_append
      (Seq_append
        (Seq_append
          (Seq_append (Seq_singleton 1) (Seq_singleton 4))
          (Seq_singleton 5))
        (Seq_singleton 7))
      (Seq_singleton 8)))
  5))
(declare-const a@29@01 Seq<Int>)
(assert (=
  a@29@01
  (Seq_append
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton 1) (Seq_singleton 4))
        (Seq_singleton 5))
      (Seq_singleton 7))
    (Seq_singleton 8))))
; [exec]
; assert a[-1..] == a
; [eval] a[-1..] == a
; [eval] a[-1..]
; [eval] -1
(push) ; 3
(assert (not (Seq_equal (Seq_drop a@29@01 (- 0 1)) a@29@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal (Seq_drop a@29@01 (- 0 1)) a@29@01))
; [exec]
; inhale e1 < -1
(declare-const $t@30@01 $Snap)
(assert (= $t@30@01 $Snap.unit))
; [eval] e1 < -1
; [eval] -1
(assert (< e1@27@01 (- 0 1)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert a[e1..] == a
; [eval] a[e1..] == a
; [eval] a[e1..]
(set-option :timeout 0)
(push) ; 3
(assert (not (Seq_equal (Seq_drop a@29@01 e1@27@01) a@29@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal (Seq_drop a@29@01 e1@27@01) a@29@01))
; [exec]
; assert a[6..] == Seq[Int]()
; [eval] a[6..] == Seq[Int]()
; [eval] a[6..]
; [eval] Seq[Int]()
(push) ; 3
(assert (not (Seq_equal (Seq_drop a@29@01 6) (as Seq_empty  Seq<Int>))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal (Seq_drop a@29@01 6) (as Seq_empty  Seq<Int>)))
; [exec]
; inhale 6 < e2
(declare-const $t@31@01 $Snap)
(assert (= $t@31@01 $Snap.unit))
; [eval] 6 < e2
(assert (< 6 e2@28@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert a[e2..] == Seq[Int]()
; [eval] a[e2..] == Seq[Int]()
; [eval] a[e2..]
; [eval] Seq[Int]()
(set-option :timeout 0)
(push) ; 3
(assert (not (Seq_equal (Seq_drop a@29@01 e2@28@01) (as Seq_empty  Seq<Int>))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal (Seq_drop a@29@01 e2@28@01) (as Seq_empty  Seq<Int>)))
(pop) ; 2
(pop) ; 1
; ---------- test_drop_length_02 ----------
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
; var a: Seq[Int]
(declare-const a@32@01 Seq<Int>)
; [exec]
; var e1: Int
(declare-const e1@33@01 Int)
; [exec]
; var e2: Int
(declare-const e2@34@01 Int)
; [exec]
; a := Seq(1, 4, 5, 7, 8)
; [eval] Seq(1, 4, 5, 7, 8)
(assert (=
  (Seq_length
    (Seq_append
      (Seq_append
        (Seq_append
          (Seq_append (Seq_singleton 1) (Seq_singleton 4))
          (Seq_singleton 5))
        (Seq_singleton 7))
      (Seq_singleton 8)))
  5))
(declare-const a@35@01 Seq<Int>)
(assert (=
  a@35@01
  (Seq_append
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton 1) (Seq_singleton 4))
        (Seq_singleton 5))
      (Seq_singleton 7))
    (Seq_singleton 8))))
; [exec]
; assert |a[-1..]| == 5
; [eval] |a[-1..]| == 5
; [eval] |a[-1..]|
; [eval] a[-1..]
; [eval] -1
(push) ; 3
(assert (not (= (Seq_length (Seq_drop a@35@01 (- 0 1))) 5)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Seq_length (Seq_drop a@35@01 (- 0 1))) 5))
; [exec]
; inhale e1 < -1
(declare-const $t@36@01 $Snap)
(assert (= $t@36@01 $Snap.unit))
; [eval] e1 < -1
; [eval] -1
(assert (< e1@33@01 (- 0 1)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert |a[e1..]| == 5
; [eval] |a[e1..]| == 5
; [eval] |a[e1..]|
; [eval] a[e1..]
(set-option :timeout 0)
(push) ; 3
(assert (not (= (Seq_length (Seq_drop a@35@01 e1@33@01)) 5)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Seq_length (Seq_drop a@35@01 e1@33@01)) 5))
; [exec]
; assert |a[6..]| == 0
; [eval] |a[6..]| == 0
; [eval] |a[6..]|
; [eval] a[6..]
(push) ; 3
(assert (not (= (Seq_length (Seq_drop a@35@01 6)) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Seq_length (Seq_drop a@35@01 6)) 0))
; [exec]
; inhale 6 < e2
(declare-const $t@37@01 $Snap)
(assert (= $t@37@01 $Snap.unit))
; [eval] 6 < e2
(assert (< 6 e2@34@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert |a[e2..]| == 0
; [eval] |a[e2..]| == 0
; [eval] |a[e2..]|
; [eval] a[e2..]
(set-option :timeout 0)
(push) ; 3
(assert (not (= (Seq_length (Seq_drop a@35@01 e2@34@01)) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Seq_length (Seq_drop a@35@01 e2@34@01)) 0))
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
; ---------- test_drop_index_01 ----------
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
; var a: Seq[Int]
(declare-const a@38@01 Seq<Int>)
; [exec]
; a := Seq(1, 4, 5, 7, 8)
; [eval] Seq(1, 4, 5, 7, 8)
(assert (=
  (Seq_length
    (Seq_append
      (Seq_append
        (Seq_append
          (Seq_append (Seq_singleton 1) (Seq_singleton 4))
          (Seq_singleton 5))
        (Seq_singleton 7))
      (Seq_singleton 8)))
  5))
(declare-const a@39@01 Seq<Int>)
(assert (=
  a@39@01
  (Seq_append
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton 1) (Seq_singleton 4))
        (Seq_singleton 5))
      (Seq_singleton 7))
    (Seq_singleton 8))))
; [exec]
; assert a[0..][3] == 7
; [eval] a[0..][3] == 7
; [eval] a[0..][3]
; [eval] a[0..]
(push) ; 3
(assert (not (< 3 (Seq_length (Seq_drop a@39@01 0)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (= (Seq_index (Seq_drop a@39@01 0) 3) 7)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Seq_index (Seq_drop a@39@01 0) 3) 7))
; [exec]
; assert a[-1..][3] == 7
; [eval] a[-1..][3] == 7
; [eval] a[-1..][3]
; [eval] a[-1..]
; [eval] -1
(push) ; 3
(assert (not (< 3 (Seq_length (Seq_drop a@39@01 (- 0 1))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (= (Seq_index (Seq_drop a@39@01 (- 0 1)) 3) 7)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Seq_index (Seq_drop a@39@01 (- 0 1)) 3) 7))
(pop) ; 2
(pop) ; 1
; ---------- test_take_drop_02 ----------
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
; var a: Seq[Int]
(declare-const a@40@01 Seq<Int>)
; [exec]
; var e1: Int
(declare-const e1@41@01 Int)
; [exec]
; var e2: Int
(declare-const e2@42@01 Int)
; [exec]
; var e3: Int
(declare-const e3@43@01 Int)
; [exec]
; var e4: Int
(declare-const e4@44@01 Int)
; [exec]
; a := Seq(1, 4, 5, 7, 8)
; [eval] Seq(1, 4, 5, 7, 8)
(assert (=
  (Seq_length
    (Seq_append
      (Seq_append
        (Seq_append
          (Seq_append (Seq_singleton 1) (Seq_singleton 4))
          (Seq_singleton 5))
        (Seq_singleton 7))
      (Seq_singleton 8)))
  5))
(declare-const a@45@01 Seq<Int>)
(assert (=
  a@45@01
  (Seq_append
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton 1) (Seq_singleton 4))
        (Seq_singleton 5))
      (Seq_singleton 7))
    (Seq_singleton 8))))
; [exec]
; assert a[2..2] == Seq[Int]()
; [eval] a[2..2] == Seq[Int]()
; [eval] a[2..2]
; [eval] a[..2]
; [eval] Seq[Int]()
(push) ; 3
(assert (not (Seq_equal (Seq_drop (Seq_take a@45@01 2) 2) (as Seq_empty  Seq<Int>))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal (Seq_drop (Seq_take a@45@01 2) 2) (as Seq_empty  Seq<Int>)))
; [exec]
; assert a[3..2] == Seq[Int]()
; [eval] a[3..2] == Seq[Int]()
; [eval] a[3..2]
; [eval] a[..2]
; [eval] Seq[Int]()
(push) ; 3
(assert (not (Seq_equal (Seq_drop (Seq_take a@45@01 2) 3) (as Seq_empty  Seq<Int>))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal (Seq_drop (Seq_take a@45@01 2) 3) (as Seq_empty  Seq<Int>)))
; [exec]
; inhale 0 <= e2
(declare-const $t@46@01 $Snap)
(assert (= $t@46@01 $Snap.unit))
; [eval] 0 <= e2
(assert (<= 0 e2@42@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale e2 <= e1
(declare-const $t@47@01 $Snap)
(assert (= $t@47@01 $Snap.unit))
; [eval] e2 <= e1
(assert (<= e2@42@01 e1@41@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale e1 <= |a|
(declare-const $t@48@01 $Snap)
(assert (= $t@48@01 $Snap.unit))
; [eval] e1 <= |a|
; [eval] |a|
(assert (<= e1@41@01 (Seq_length a@45@01)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; assert a[e1..e2] == Seq[Int]()
; [eval] a[e1..e2] == Seq[Int]()
; [eval] a[e1..e2]
; [eval] a[..e2]
; [eval] Seq[Int]()
(set-option :timeout 0)
(push) ; 3
(assert (not (Seq_equal
  (Seq_drop (Seq_take a@45@01 e2@42@01) e1@41@01)
  (as Seq_empty  Seq<Int>))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (Seq_drop (Seq_take a@45@01 e2@42@01) e1@41@01)
  (as Seq_empty  Seq<Int>)))
; [exec]
; inhale e4 <= e3
(declare-const $t@49@01 $Snap)
(assert (= $t@49@01 $Snap.unit))
; [eval] e4 <= e3
(assert (<= e4@44@01 e3@43@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert a[e3..e4] == Seq[Int]()
; [eval] a[e3..e4] == Seq[Int]()
; [eval] a[e3..e4]
; [eval] a[..e4]
; [eval] Seq[Int]()
(set-option :timeout 0)
(push) ; 3
(assert (not (Seq_equal
  (Seq_drop (Seq_take a@45@01 e4@44@01) e3@43@01)
  (as Seq_empty  Seq<Int>))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (Seq_drop (Seq_take a@45@01 e4@44@01) e3@43@01)
  (as Seq_empty  Seq<Int>)))
(pop) ; 2
(pop) ; 1
; ---------- test_take_drop_length_02 ----------
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
; var a: Seq[Int]
(declare-const a@50@01 Seq<Int>)
; [exec]
; var e1: Int
(declare-const e1@51@01 Int)
; [exec]
; var e2: Int
(declare-const e2@52@01 Int)
; [exec]
; var e3: Int
(declare-const e3@53@01 Int)
; [exec]
; var e4: Int
(declare-const e4@54@01 Int)
; [exec]
; a := Seq(1, 4, 5, 7, 8)
; [eval] Seq(1, 4, 5, 7, 8)
(assert (=
  (Seq_length
    (Seq_append
      (Seq_append
        (Seq_append
          (Seq_append (Seq_singleton 1) (Seq_singleton 4))
          (Seq_singleton 5))
        (Seq_singleton 7))
      (Seq_singleton 8)))
  5))
(declare-const a@55@01 Seq<Int>)
(assert (=
  a@55@01
  (Seq_append
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton 1) (Seq_singleton 4))
        (Seq_singleton 5))
      (Seq_singleton 7))
    (Seq_singleton 8))))
; [exec]
; assert |a[2..2]| == 0
; [eval] |a[2..2]| == 0
; [eval] |a[2..2]|
; [eval] a[2..2]
; [eval] a[..2]
(push) ; 3
(assert (not (= (Seq_length (Seq_drop (Seq_take a@55@01 2) 2)) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Seq_length (Seq_drop (Seq_take a@55@01 2) 2)) 0))
; [exec]
; assert |a[3..2]| == 0
; [eval] |a[3..2]| == 0
; [eval] |a[3..2]|
; [eval] a[3..2]
; [eval] a[..2]
(push) ; 3
(assert (not (= (Seq_length (Seq_drop (Seq_take a@55@01 2) 3)) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Seq_length (Seq_drop (Seq_take a@55@01 2) 3)) 0))
; [exec]
; inhale 0 <= e2
(declare-const $t@56@01 $Snap)
(assert (= $t@56@01 $Snap.unit))
; [eval] 0 <= e2
(assert (<= 0 e2@52@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale e2 <= e1
(declare-const $t@57@01 $Snap)
(assert (= $t@57@01 $Snap.unit))
; [eval] e2 <= e1
(assert (<= e2@52@01 e1@51@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale e1 <= 5
(declare-const $t@58@01 $Snap)
(assert (= $t@58@01 $Snap.unit))
; [eval] e1 <= 5
(assert (<= e1@51@01 5))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; assert |a[e1..e2]| == 0
; [eval] |a[e1..e2]| == 0
; [eval] |a[e1..e2]|
; [eval] a[e1..e2]
; [eval] a[..e2]
(set-option :timeout 0)
(push) ; 3
(assert (not (= (Seq_length (Seq_drop (Seq_take a@55@01 e2@52@01) e1@51@01)) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Seq_length (Seq_drop (Seq_take a@55@01 e2@52@01) e1@51@01)) 0))
; [exec]
; inhale e4 <= e3
(declare-const $t@59@01 $Snap)
(assert (= $t@59@01 $Snap.unit))
; [eval] e4 <= e3
(assert (<= e4@54@01 e3@53@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert |a[e3..e4]| == 0
; [eval] |a[e3..e4]| == 0
; [eval] |a[e3..e4]|
; [eval] a[e3..e4]
; [eval] a[..e4]
(set-option :timeout 0)
(push) ; 3
(assert (not (= (Seq_length (Seq_drop (Seq_take a@55@01 e4@54@01) e3@53@01)) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Seq_length (Seq_drop (Seq_take a@55@01 e4@54@01) e3@53@01)) 0))
(pop) ; 2
(pop) ; 1
; ---------- reported_example ----------
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
; var a: Seq[Int]
(declare-const a@60@01 Seq<Int>)
; [exec]
; a := Seq(1, 4, 5, 7, 8)
; [eval] Seq(1, 4, 5, 7, 8)
(assert (=
  (Seq_length
    (Seq_append
      (Seq_append
        (Seq_append
          (Seq_append (Seq_singleton 1) (Seq_singleton 4))
          (Seq_singleton 5))
        (Seq_singleton 7))
      (Seq_singleton 8)))
  5))
(declare-const a@61@01 Seq<Int>)
(assert (=
  a@61@01
  (Seq_append
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton 1) (Seq_singleton 4))
        (Seq_singleton 5))
      (Seq_singleton 7))
    (Seq_singleton 8))))
; [exec]
; assert a[-1..1] == a[0..1]
; [eval] a[-1..1] == a[0..1]
; [eval] a[-1..1]
; [eval] a[..1]
; [eval] -1
; [eval] a[0..1]
; [eval] a[..1]
(push) ; 3
(assert (not (Seq_equal
  (Seq_drop (Seq_take a@61@01 1) (- 0 1))
  (Seq_drop (Seq_take a@61@01 1) 0))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (Seq_drop (Seq_take a@61@01 1) (- 0 1))
  (Seq_drop (Seq_take a@61@01 1) 0)))
(pop) ; 2
(pop) ; 1
