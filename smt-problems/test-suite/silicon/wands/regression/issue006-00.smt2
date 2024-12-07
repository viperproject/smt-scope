(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:35:40
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/wands/regression/issue006.vpr
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
(declare-sort Foo 0)
(declare-sort $MWSF 0)
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
(declare-fun $SortWrappers.FooTo$Snap (Foo) $Snap)
(declare-fun $SortWrappers.$SnapToFoo ($Snap) Foo)
(assert (forall ((x Foo)) (!
    (= x ($SortWrappers.$SnapToFoo($SortWrappers.FooTo$Snap x)))
    :pattern (($SortWrappers.FooTo$Snap x))
    :qid |$Snap.$SnapToFooTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.FooTo$Snap($SortWrappers.$SnapToFoo x)))
    :pattern (($SortWrappers.$SnapToFoo x))
    :qid |$Snap.FooTo$SnapToFoo|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.$MWSFTo$Snap ($MWSF) $Snap)
(declare-fun $SortWrappers.$SnapTo$MWSF ($Snap) $MWSF)
(assert (forall ((x $MWSF)) (!
    (= x ($SortWrappers.$SnapTo$MWSF($SortWrappers.$MWSFTo$Snap x)))
    :pattern (($SortWrappers.$MWSFTo$Snap x))
    :qid |$Snap.$SnapTo$MWSFTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$MWSFTo$Snap($SortWrappers.$SnapTo$MWSF x)))
    :pattern (($SortWrappers.$SnapTo$MWSF x))
    :qid |$Snap.$MWSFTo$SnapTo$MWSF|
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
(declare-fun atMost<Bool> (Int Int) Bool)
(declare-fun MWSF_apply ($MWSF $Snap) $Snap)
; Declaring symbols related to program functions (from program analysis)
(declare-fun sum ($Snap Seq<Int>) Int)
(declare-fun sum%limited ($Snap Seq<Int>) Int)
(declare-fun sum%stateless (Seq<Int>) Bool)
(declare-fun sum%precondition ($Snap Seq<Int>) Bool)
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
(assert (forall ((x Int) (y Int)) (!
  (= (atMost<Bool> x y) (<= x y))
  :pattern ((atMost<Bool> x y))
  :qid |prog.atMost_def|)))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(assert (forall ((s@$ $Snap) (xs@0@00 Seq<Int>)) (!
  (= (sum%limited s@$ xs@0@00) (sum s@$ xs@0@00))
  :pattern ((sum s@$ xs@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (xs@0@00 Seq<Int>)) (!
  (sum%stateless xs@0@00)
  :pattern ((sum%limited s@$ xs@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (xs@0@00 Seq<Int>)) (!
  (=>
    (sum%precondition s@$ xs@0@00)
    (=
      (sum s@$ xs@0@00)
      (ite
        (= (Seq_length xs@0@00) 0)
        0
        (+ (Seq_index xs@0@00 0) (sum%limited $Snap.unit (Seq_drop xs@0@00 1))))))
  :pattern ((sum s@$ xs@0@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (xs@0@00 Seq<Int>)) (!
  (=>
    (sum%precondition s@$ xs@0@00)
    (ite
      (= (Seq_length xs@0@00) 0)
      true
      (sum%precondition $Snap.unit (Seq_drop xs@0@00 1))))
  :pattern ((sum s@$ xs@0@00))
  :qid |quant-u-3|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test03 ----------
(declare-const x@0@01 $Ref)
(declare-const x@1@01 $Ref)
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
; var y: Ref
(declare-const y@2@01 $Ref)
; [exec]
; y := x
; [exec]
; package true --* x == x {
; }
(push) ; 3
(declare-const $t@3@01 $Snap)
(assert (= $t@3@01 $Snap.unit))
; [eval] x == x
; Create MagicWandSnapFunction for wand true --* x == x
(declare-const mwsf@4@01 $MWSF)
(assert (forall (($t@3@01 $Snap)) (!
  (= (MWSF_apply mwsf@4@01 $t@3@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@4@01 $t@3@01))
  :qid |quant-u-4|)))
; [eval] x == x
(pop) ; 3
(push) ; 3
(assert (forall (($t@3@01 $Snap)) (!
  (= (MWSF_apply mwsf@4@01 $t@3@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@4@01 $t@3@01))
  :qid |quant-u-5|)))
; [exec]
; apply true --* x == y
; [eval] x == y
(assert (= (MWSF_apply mwsf@4@01 $Snap.unit) $Snap.unit))
; [eval] x == y
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test04 ----------
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
; var b: Bool
(declare-const b@5@01 Bool)
; [exec]
; b := true
; [exec]
; package b --* true {
; }
(push) ; 3
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 $Snap.unit))
; Create MagicWandSnapFunction for wand b --* true
(declare-const mwsf@7@01 $MWSF)
(assert (forall (($t@6@01 $Snap)) (!
  (= (MWSF_apply mwsf@7@01 $t@6@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@7@01 $t@6@01))
  :qid |quant-u-6|)))
(pop) ; 3
(push) ; 3
(assert (forall (($t@6@01 $Snap)) (!
  (= (MWSF_apply mwsf@7@01 $t@6@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@7@01 $t@6@01))
  :qid |quant-u-7|)))
; [exec]
; b := !b
; [eval] !b
; [exec]
; apply !b --* true
; [eval] !b
; [eval] !b
(assert (= (MWSF_apply mwsf@7@01 $Snap.unit) $Snap.unit))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test05 ----------
(declare-const x@8@01 Int)
(declare-const x@9@01 Int)
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
; var a: Int
(declare-const a@10@01 Int)
; [exec]
; a := x
; [exec]
; package x == a --* true {
; }
(push) ; 3
(declare-const $t@11@01 $Snap)
(assert (= $t@11@01 $Snap.unit))
; [eval] x == a
; Create MagicWandSnapFunction for wand x == a --* true
(declare-const mwsf@12@01 $MWSF)
(assert (forall (($t@11@01 $Snap)) (!
  (= (MWSF_apply mwsf@12@01 $t@11@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@12@01 $t@11@01))
  :qid |quant-u-8|)))
; [eval] x == a
(pop) ; 3
(push) ; 3
(assert (forall (($t@11@01 $Snap)) (!
  (= (MWSF_apply mwsf@12@01 $t@11@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@12@01 $t@11@01))
  :qid |quant-u-9|)))
; [exec]
; a := a + 1
; [eval] a + 1
(declare-const a@13@01 Int)
(assert (= a@13@01 (+ x@9@01 1)))
; [exec]
; apply x == a - 1 --* true
; [eval] x == a - 1
; [eval] a - 1
(push) ; 4
(set-option :timeout 10)
(assert (not (= true (= x@9@01 (- a@13@01 1)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] x == a - 1
; [eval] a - 1
(set-option :timeout 0)
(push) ; 4
(assert (not (= x@9@01 (- a@13@01 1))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (= x@9@01 (- a@13@01 1)))
(assert (= (MWSF_apply mwsf@12@01 $Snap.unit) $Snap.unit))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; package x == a --* true {
; }
(set-option :timeout 0)
(push) ; 4
(declare-const $t@14@01 $Snap)
(assert (= $t@14@01 $Snap.unit))
; [eval] x == a
(assert (= x@9@01 a@13@01))
; Create MagicWandSnapFunction for wand x == a --* true
(declare-const mwsf@15@01 $MWSF)
(assert (forall (($t@14@01 $Snap)) (!
  (= (MWSF_apply mwsf@15@01 $t@14@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@15@01 $t@14@01))
  :qid |quant-u-10|)))
; [eval] x == a
(pop) ; 4
(push) ; 4
(assert (forall (($t@14@01 $Snap)) (!
  (= (MWSF_apply mwsf@15@01 $t@14@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@15@01 $t@14@01))
  :qid |quant-u-11|)))
; [exec]
; a := a + 2
; [eval] a + 2
(declare-const a@16@01 Int)
(assert (= a@16@01 (+ a@13@01 2)))
; [exec]
; apply x == a - 1 --* true
; [eval] x == a - 1
; [eval] a - 1
(push) ; 5
(set-option :timeout 10)
(assert (not (= (= x@9@01 a@13@01) (= x@9@01 (- a@16@01 1)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] x == a - 1
; [eval] a - 1
(set-option :timeout 0)
(push) ; 5
(assert (not (= x@9@01 (- a@16@01 1))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] x == a - 1
; [eval] a - 1
(set-option :timeout 0)
(push) ; 5
(assert (not (= x@9@01 (- a@16@01 1))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] x == a - 1
; [eval] a - 1
(set-option :timeout 0)
(push) ; 5
(assert (not (= x@9@01 (- a@16@01 1))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] x == a - 1
; [eval] a - 1
(set-option :timeout 0)
(push) ; 5
(assert (not (= x@9@01 (- a@16@01 1))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test01 ----------
(declare-const l@17@01 $Ref)
(declare-const l@18@01 $Ref)
(push) ; 1
(declare-const $t@19@01 Int)
(assert (not (= l@18@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var x: Int
(declare-const x@20@01 Int)
; [exec]
; x := l.val
; [exec]
; package acc(l.val, write) && l.val == old(l.val) --* acc(l.val, write) {
; }
(push) ; 3
(declare-const $t@21@01 $Snap)
(assert (= $t@21@01 ($Snap.combine ($Snap.first $t@21@01) ($Snap.second $t@21@01))))
(assert (= ($Snap.second $t@21@01) $Snap.unit))
; [eval] l.val == old(l.val)
; [eval] old(l.val)
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@21@01)) $t@19@01))
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand acc(l.val, write) && l.val == old(l.val) --* acc(l.val, write)
(declare-const mwsf@22@01 $MWSF)
(assert (forall (($t@21@01 $Snap)) (!
  (= (MWSF_apply mwsf@22@01 $t@21@01) ($Snap.first $t@21@01))
  :pattern ((MWSF_apply mwsf@22@01 $t@21@01))
  :qid |quant-u-12|)))
; [eval] old(l.val)
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@21@01 $Snap)) (!
  (= (MWSF_apply mwsf@22@01 $t@21@01) ($Snap.first $t@21@01))
  :pattern ((MWSF_apply mwsf@22@01 $t@21@01))
  :qid |quant-u-13|)))
(assert true)
; [exec]
; apply acc(l.val, write) && l.val == x --* acc(l.val, write)
; [eval] l.val == x
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
(declare-const l@23@01 $Ref)
(declare-const l@24@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@25@01 Int)
(assert (not (= l@24@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var x: Int
(declare-const x@26@01 Int)
; [exec]
; x := l.val
; [exec]
; package acc(l.val, write) && l.val == l.val --* acc(l.val, write) {
; }
(push) ; 3
(declare-const $t@27@01 $Snap)
(assert (= $t@27@01 ($Snap.combine ($Snap.first $t@27@01) ($Snap.second $t@27@01))))
(assert (= ($Snap.second $t@27@01) $Snap.unit))
; [eval] l.val == l.val
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand acc(l.val, write) && l.val == l.val --* acc(l.val, write)
(declare-const mwsf@28@01 $MWSF)
(assert (forall (($t@27@01 $Snap)) (!
  (= (MWSF_apply mwsf@28@01 $t@27@01) ($Snap.first $t@27@01))
  :pattern ((MWSF_apply mwsf@28@01 $t@27@01))
  :qid |quant-u-14|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@27@01 $Snap)) (!
  (= (MWSF_apply mwsf@28@01 $t@27@01) ($Snap.first $t@27@01))
  :pattern ((MWSF_apply mwsf@28@01 $t@27@01))
  :qid |quant-u-15|)))
(assert true)
; [exec]
; apply acc(l.val, write) && l.val == x --* acc(l.val, write)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test06 ----------
(declare-const xs@29@01 Seq<Int>)
(declare-const n@30@01 Int)
(declare-const xs@31@01 Seq<Int>)
(declare-const n@32@01 Int)
(push) ; 1
(declare-const $t@33@01 $Snap)
(assert (= $t@33@01 $Snap.unit))
; [eval] |xs| == n
; [eval] |xs|
(assert (= (Seq_length xs@31@01) n@32@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var ys: Seq[Int]
(declare-const ys@34@01 Seq<Int>)
; [exec]
; package true --* |xs| == n {
; }
(push) ; 3
(declare-const $t@35@01 $Snap)
(assert (= $t@35@01 $Snap.unit))
; [eval] |xs| == n
; [eval] |xs|
; Create MagicWandSnapFunction for wand true --* |xs| == n
(declare-const mwsf@36@01 $MWSF)
(assert (forall (($t@35@01 $Snap)) (!
  (= (MWSF_apply mwsf@36@01 $t@35@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@36@01 $t@35@01))
  :qid |quant-u-16|)))
; [eval] |xs| == n
; [eval] |xs|
(pop) ; 3
(push) ; 3
(assert (forall (($t@35@01 $Snap)) (!
  (= (MWSF_apply mwsf@36@01 $t@35@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@36@01 $t@35@01))
  :qid |quant-u-17|)))
; [exec]
; ys := xs ++ Seq(n)
; [eval] xs ++ Seq(n)
; [eval] Seq(n)
(assert (= (Seq_length (Seq_singleton n@32@01)) 1))
(declare-const ys@37@01 Seq<Int>)
(assert (= ys@37@01 (Seq_append xs@31@01 (Seq_singleton n@32@01))))
; [exec]
; apply true --* |ys| == n + 1
; [eval] |ys| == n + 1
; [eval] |ys|
; [eval] n + 1
(push) ; 4
(set-option :timeout 10)
(assert (not (= (= (Seq_length xs@31@01) n@32@01) (= (Seq_length ys@37@01) (+ n@32@01 1)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (= (MWSF_apply mwsf@36@01 $Snap.unit) $Snap.unit))
; [eval] |ys| == n + 1
; [eval] |ys|
; [eval] n + 1
(assert (= (Seq_length ys@37@01) (+ n@32@01 1)))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test07 ----------
(declare-const xs@38@01 Seq<Int>)
(declare-const n@39@01 Int)
(declare-const xs@40@01 Seq<Int>)
(declare-const n@41@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@42@01 $Snap)
(assert (= $t@42@01 $Snap.unit))
; [eval] sum(xs) == n
; [eval] sum(xs)
(push) ; 2
(assert (sum%precondition $Snap.unit xs@40@01))
(pop) ; 2
; Joined path conditions
(assert (sum%precondition $Snap.unit xs@40@01))
(assert (= (sum $Snap.unit xs@40@01) n@41@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var ys: Seq[Int]
(declare-const ys@43@01 Seq<Int>)
; [exec]
; package true --* sum(xs) == n {
; }
(push) ; 3
(declare-const $t@44@01 $Snap)
(assert (= $t@44@01 $Snap.unit))
; [eval] sum(xs) == n
; [eval] sum(xs)
(push) ; 4
(pop) ; 4
; Joined path conditions
; Create MagicWandSnapFunction for wand true --* sum(xs) == n
(declare-const mwsf@45@01 $MWSF)
(assert (forall (($t@44@01 $Snap)) (!
  (= (MWSF_apply mwsf@45@01 $t@44@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@45@01 $t@44@01))
  :qid |quant-u-18|)))
; [eval] sum(xs) == n
; [eval] sum(xs)
(push) ; 4
(pop) ; 4
; Joined path conditions
(pop) ; 3
(push) ; 3
(assert (forall (($t@44@01 $Snap)) (!
  (= (MWSF_apply mwsf@45@01 $t@44@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@45@01 $t@44@01))
  :qid |quant-u-19|)))
; [exec]
; ys := Seq(n) ++ xs
; [eval] Seq(n) ++ xs
; [eval] Seq(n)
(assert (= (Seq_length (Seq_singleton n@41@01)) 1))
(declare-const ys@46@01 Seq<Int>)
(assert (= ys@46@01 (Seq_append (Seq_singleton n@41@01) xs@40@01)))
; [exec]
; assert xs == ys[1..]
; [eval] xs == ys[1..]
; [eval] ys[1..]
(push) ; 4
(assert (not (Seq_equal xs@40@01 (Seq_drop ys@46@01 1))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal xs@40@01 (Seq_drop ys@46@01 1)))
; [exec]
; apply true --* sum(ys) == 2 * n
; [eval] sum(ys) == 2 * n
; [eval] sum(ys)
(push) ; 4
(assert (sum%precondition $Snap.unit ys@46@01))
(pop) ; 4
; Joined path conditions
(assert (sum%precondition $Snap.unit ys@46@01))
; [eval] 2 * n
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (= (sum $Snap.unit xs@40@01) n@41@01)
  (= (sum $Snap.unit ys@46@01) (* 2 n@41@01)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (= (MWSF_apply mwsf@45@01 $Snap.unit) $Snap.unit))
; [eval] sum(ys) == 2 * n
; [eval] sum(ys)
(set-option :timeout 0)
(push) ; 4
(pop) ; 4
; Joined path conditions
; [eval] 2 * n
(assert (= (sum $Snap.unit ys@46@01) (* 2 n@41@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test08a ----------
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
; var x: Int
(declare-const x@47@01 Int)
; [exec]
; var y: Int
(declare-const y@48@01 Int)
; [exec]
; package x < y --* atMost(x, y) {
; }
(push) ; 3
(declare-const $t@49@01 $Snap)
(assert (= $t@49@01 $Snap.unit))
; [eval] x < y
(assert (< x@47@01 y@48@01))
; [eval] atMost(x, y)
(push) ; 4
(assert (not (atMost<Bool> x@47@01 y@48@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (atMost<Bool> x@47@01 y@48@01))
; Create MagicWandSnapFunction for wand x < y --* atMost(x, y)
(declare-const mwsf@50@01 $MWSF)
(assert (forall (($t@49@01 $Snap)) (!
  (= (MWSF_apply mwsf@50@01 $t@49@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@50@01 $t@49@01))
  :qid |quant-u-20|)))
; [eval] x < y
; [eval] atMost(x, y)
(pop) ; 3
(push) ; 3
(assert (forall (($t@49@01 $Snap)) (!
  (= (MWSF_apply mwsf@50@01 $t@49@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@50@01 $t@49@01))
  :qid |quant-u-21|)))
; [exec]
; apply x < y --* atMost(x, y)
; [eval] x < y
; [eval] atMost(x, y)
; [eval] x < y
(push) ; 4
(assert (not (< x@47@01 y@48@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] x < y
(set-option :timeout 0)
(push) ; 4
(assert (not (< x@47@01 y@48@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] x < y
(set-option :timeout 0)
(push) ; 4
(assert (not (< x@47@01 y@48@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] x < y
(set-option :timeout 0)
(push) ; 4
(assert (not (< x@47@01 y@48@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test08b ----------
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
; var x: Int
(declare-const x@51@01 Int)
; [exec]
; var y: Int
(declare-const y@52@01 Int)
; [exec]
; package x <= y --* atMost(x, y) {
; }
(push) ; 3
(declare-const $t@53@01 $Snap)
(assert (= $t@53@01 $Snap.unit))
; [eval] x <= y
(assert (<= x@51@01 y@52@01))
; [eval] atMost(x, y)
(push) ; 4
(assert (not (atMost<Bool> x@51@01 y@52@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (atMost<Bool> x@51@01 y@52@01))
; Create MagicWandSnapFunction for wand x <= y --* atMost(x, y)
(declare-const mwsf@54@01 $MWSF)
(assert (forall (($t@53@01 $Snap)) (!
  (= (MWSF_apply mwsf@54@01 $t@53@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@54@01 $t@53@01))
  :qid |quant-u-22|)))
; [eval] x <= y
; [eval] atMost(x, y)
(pop) ; 3
(push) ; 3
(assert (forall (($t@53@01 $Snap)) (!
  (= (MWSF_apply mwsf@54@01 $t@53@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@54@01 $t@53@01))
  :qid |quant-u-23|)))
; [exec]
; inhale x < y
(declare-const $t@55@01 $Snap)
(assert (= $t@55@01 $Snap.unit))
; [eval] x < y
(assert (< x@51@01 y@52@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; x := x + 1
; [eval] x + 1
(declare-const x@56@01 Int)
(assert (= x@56@01 (+ x@51@01 1)))
; [exec]
; apply x <= y --* atMost(x, y)
; [eval] x <= y
; [eval] atMost(x, y)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= (<= x@51@01 y@52@01) (<= x@56@01 y@52@01))
  (= (atMost<Bool> x@51@01 y@52@01) (atMost<Bool> x@56@01 y@52@01)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] x <= y
(set-option :timeout 0)
(push) ; 4
(assert (not (<= x@56@01 y@52@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= x@56@01 y@52@01))
(assert (= (MWSF_apply mwsf@54@01 $Snap.unit) $Snap.unit))
; [eval] atMost(x, y)
(assert (atMost<Bool> x@56@01 y@52@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 3
(pop) ; 2
(pop) ; 1
