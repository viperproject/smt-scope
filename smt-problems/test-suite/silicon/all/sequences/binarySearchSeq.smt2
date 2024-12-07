(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:07:23
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/sequences/binarySearchSeq.vpr
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
; ---------- binary_search ----------
(declare-const array@0@01 Seq<Int>)
(declare-const key@1@01 Int)
(declare-const index@2@01 Int)
(declare-const array@3@01 Seq<Int>)
(declare-const key@4@01 Int)
(declare-const index@5@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 $Snap.unit))
; [eval] (forall i: Int, j: Int :: { array[i], array[j] } 0 <= i && (j < |array| && i < j) ==> array[i] < array[j])
(declare-const i@7@01 Int)
(declare-const j@8@01 Int)
(push) ; 2
; [eval] 0 <= i && (j < |array| && i < j) ==> array[i] < array[j]
; [eval] 0 <= i && (j < |array| && i < j)
; [eval] 0 <= i
(push) ; 3
; [then-branch: 0 | !(0 <= i@7@01) | live]
; [else-branch: 0 | 0 <= i@7@01 | live]
(push) ; 4
; [then-branch: 0 | !(0 <= i@7@01)]
(assert (not (<= 0 i@7@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | 0 <= i@7@01]
(assert (<= 0 i@7@01))
; [eval] j < |array|
; [eval] |array|
(push) ; 5
; [then-branch: 1 | !(j@8@01 < |array@3@01|) | live]
; [else-branch: 1 | j@8@01 < |array@3@01| | live]
(push) ; 6
; [then-branch: 1 | !(j@8@01 < |array@3@01|)]
(assert (not (< j@8@01 (Seq_length array@3@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | j@8@01 < |array@3@01|]
(assert (< j@8@01 (Seq_length array@3@01)))
; [eval] i < j
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (< j@8@01 (Seq_length array@3@01)) (not (< j@8@01 (Seq_length array@3@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@7@01)
  (and
    (<= 0 i@7@01)
    (or
      (< j@8@01 (Seq_length array@3@01))
      (not (< j@8@01 (Seq_length array@3@01)))))))
(assert (or (<= 0 i@7@01) (not (<= 0 i@7@01))))
(push) ; 3
; [then-branch: 2 | 0 <= i@7@01 && j@8@01 < |array@3@01| && i@7@01 < j@8@01 | live]
; [else-branch: 2 | !(0 <= i@7@01 && j@8@01 < |array@3@01| && i@7@01 < j@8@01) | live]
(push) ; 4
; [then-branch: 2 | 0 <= i@7@01 && j@8@01 < |array@3@01| && i@7@01 < j@8@01]
(assert (and (<= 0 i@7@01) (and (< j@8@01 (Seq_length array@3@01)) (< i@7@01 j@8@01))))
; [eval] array[i] < array[j]
; [eval] array[i]
(push) ; 5
(assert (not (>= i@7@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@7@01 (Seq_length array@3@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] array[j]
(push) ; 5
(assert (not (>= j@8@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 2 | !(0 <= i@7@01 && j@8@01 < |array@3@01| && i@7@01 < j@8@01)]
(assert (not
  (and (<= 0 i@7@01) (and (< j@8@01 (Seq_length array@3@01)) (< i@7@01 j@8@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and (<= 0 i@7@01) (and (< j@8@01 (Seq_length array@3@01)) (< i@7@01 j@8@01)))
  (and (<= 0 i@7@01) (< j@8@01 (Seq_length array@3@01)) (< i@7@01 j@8@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@7@01)
      (and (< j@8@01 (Seq_length array@3@01)) (< i@7@01 j@8@01))))
  (and (<= 0 i@7@01) (and (< j@8@01 (Seq_length array@3@01)) (< i@7@01 j@8@01)))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@7@01 Int) (j@8@01 Int)) (!
  (and
    (=>
      (<= 0 i@7@01)
      (and
        (<= 0 i@7@01)
        (or
          (< j@8@01 (Seq_length array@3@01))
          (not (< j@8@01 (Seq_length array@3@01))))))
    (or (<= 0 i@7@01) (not (<= 0 i@7@01)))
    (=>
      (and
        (<= 0 i@7@01)
        (and (< j@8@01 (Seq_length array@3@01)) (< i@7@01 j@8@01)))
      (and (<= 0 i@7@01) (< j@8@01 (Seq_length array@3@01)) (< i@7@01 j@8@01)))
    (or
      (not
        (and
          (<= 0 i@7@01)
          (and (< j@8@01 (Seq_length array@3@01)) (< i@7@01 j@8@01))))
      (and
        (<= 0 i@7@01)
        (and (< j@8@01 (Seq_length array@3@01)) (< i@7@01 j@8@01)))))
  :pattern ((Seq_index array@3@01 i@7@01) (Seq_index array@3@01 j@8@01))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/binarySearchSeq.vpr@5@13@5@92-aux|)))
(assert (forall ((i@7@01 Int) (j@8@01 Int)) (!
  (=>
    (and
      (<= 0 i@7@01)
      (and (< j@8@01 (Seq_length array@3@01)) (< i@7@01 j@8@01)))
    (< (Seq_index array@3@01 i@7@01) (Seq_index array@3@01 j@8@01)))
  :pattern ((Seq_index array@3@01 i@7@01) (Seq_index array@3@01 j@8@01))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/binarySearchSeq.vpr@5@13@5@92|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@9@01 $Snap)
(assert (= $t@9@01 ($Snap.combine ($Snap.first $t@9@01) ($Snap.second $t@9@01))))
(assert (= ($Snap.first $t@9@01) $Snap.unit))
; [eval] -1 <= index
; [eval] -1
(assert (<= (- 0 1) index@5@01))
(assert (=
  ($Snap.second $t@9@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@9@01))
    ($Snap.second ($Snap.second $t@9@01)))))
(assert (= ($Snap.first ($Snap.second $t@9@01)) $Snap.unit))
; [eval] index < |array|
; [eval] |array|
(assert (< index@5@01 (Seq_length array@3@01)))
(assert (=
  ($Snap.second ($Snap.second $t@9@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@9@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@9@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@9@01))) $Snap.unit))
; [eval] 0 <= index ==> array[index] == key
; [eval] 0 <= index
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (<= 0 index@5@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (<= 0 index@5@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | 0 <= index@5@01 | live]
; [else-branch: 3 | !(0 <= index@5@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 3 | 0 <= index@5@01]
(assert (<= 0 index@5@01))
; [eval] array[index] == key
; [eval] array[index]
(push) ; 5
(assert (not (>= index@5@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 3 | !(0 <= index@5@01)]
(assert (not (<= 0 index@5@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 index@5@01)) (<= 0 index@5@01)))
(assert (=> (<= 0 index@5@01) (= (Seq_index array@3@01 index@5@01) key@4@01)))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@9@01))) $Snap.unit))
; [eval] -1 == index ==> (forall i: Int :: { array[i] } 0 <= i && i < |array| ==> array[i] != key)
; [eval] -1 == index
; [eval] -1
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= (- 0 1) index@5@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (- 0 1) index@5@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | -1 == index@5@01 | live]
; [else-branch: 4 | -1 != index@5@01 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 4 | -1 == index@5@01]
(assert (= (- 0 1) index@5@01))
; [eval] (forall i: Int :: { array[i] } 0 <= i && i < |array| ==> array[i] != key)
(declare-const i@10@01 Int)
(push) ; 5
; [eval] 0 <= i && i < |array| ==> array[i] != key
; [eval] 0 <= i && i < |array|
; [eval] 0 <= i
(push) ; 6
; [then-branch: 5 | !(0 <= i@10@01) | live]
; [else-branch: 5 | 0 <= i@10@01 | live]
(push) ; 7
; [then-branch: 5 | !(0 <= i@10@01)]
(assert (not (<= 0 i@10@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 5 | 0 <= i@10@01]
(assert (<= 0 i@10@01))
; [eval] i < |array|
; [eval] |array|
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@10@01) (not (<= 0 i@10@01))))
(push) ; 6
; [then-branch: 6 | 0 <= i@10@01 && i@10@01 < |array@3@01| | live]
; [else-branch: 6 | !(0 <= i@10@01 && i@10@01 < |array@3@01|) | live]
(push) ; 7
; [then-branch: 6 | 0 <= i@10@01 && i@10@01 < |array@3@01|]
(assert (and (<= 0 i@10@01) (< i@10@01 (Seq_length array@3@01))))
; [eval] array[i] != key
; [eval] array[i]
(push) ; 8
(assert (not (>= i@10@01 0)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(push) ; 7
; [else-branch: 6 | !(0 <= i@10@01 && i@10@01 < |array@3@01|)]
(assert (not (and (<= 0 i@10@01) (< i@10@01 (Seq_length array@3@01)))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= 0 i@10@01) (< i@10@01 (Seq_length array@3@01))))
  (and (<= 0 i@10@01) (< i@10@01 (Seq_length array@3@01)))))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@10@01 Int)) (!
  (and
    (or (<= 0 i@10@01) (not (<= 0 i@10@01)))
    (or
      (not (and (<= 0 i@10@01) (< i@10@01 (Seq_length array@3@01))))
      (and (<= 0 i@10@01) (< i@10@01 (Seq_length array@3@01)))))
  :pattern ((Seq_index array@3@01 i@10@01))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/binarySearchSeq.vpr@8@29@8@87-aux|)))
(pop) ; 4
(push) ; 4
; [else-branch: 4 | -1 != index@5@01]
(assert (not (= (- 0 1) index@5@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (= (- 0 1) index@5@01)
  (and
    (= (- 0 1) index@5@01)
    (forall ((i@10@01 Int)) (!
      (and
        (or (<= 0 i@10@01) (not (<= 0 i@10@01)))
        (or
          (not (and (<= 0 i@10@01) (< i@10@01 (Seq_length array@3@01))))
          (and (<= 0 i@10@01) (< i@10@01 (Seq_length array@3@01)))))
      :pattern ((Seq_index array@3@01 i@10@01))
      :qid |prog./silicon/silver/src/test/resources/all/sequences/binarySearchSeq.vpr@8@29@8@87-aux|)))))
; Joined path conditions
(assert (or (not (= (- 0 1) index@5@01)) (= (- 0 1) index@5@01)))
(assert (=>
  (= (- 0 1) index@5@01)
  (forall ((i@10@01 Int)) (!
    (=>
      (and (<= 0 i@10@01) (< i@10@01 (Seq_length array@3@01)))
      (not (= (Seq_index array@3@01 i@10@01) key@4@01)))
    :pattern ((Seq_index array@3@01 i@10@01))
    :qid |prog./silicon/silver/src/test/resources/all/sequences/binarySearchSeq.vpr@8@29@8@87|))))
(pop) ; 2
(push) ; 2
; [exec]
; var low: Int
(declare-const low@11@01 Int)
; [exec]
; var high: Int
(declare-const high@12@01 Int)
; [exec]
; var mid: Int
(declare-const mid@13@01 Int)
; [exec]
; low := 0
; [exec]
; high := |array|
; [eval] |array|
(declare-const high@14@01 Int)
(assert (= high@14@01 (Seq_length array@3@01)))
; [exec]
; index := -1
; [eval] -1
(declare-const mid@15@01 Int)
(declare-const low@16@01 Int)
(declare-const high@17@01 Int)
(declare-const index@18@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@19@01 $Snap)
(assert (= $t@19@01 ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01))))
(assert (= ($Snap.first $t@19@01) $Snap.unit))
; [eval] 0 <= low
(assert (<= 0 low@16@01))
(assert (=
  ($Snap.second $t@19@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@19@01))
    ($Snap.second ($Snap.second $t@19@01)))))
(assert (= ($Snap.first ($Snap.second $t@19@01)) $Snap.unit))
; [eval] low <= high
(assert (<= low@16@01 high@17@01))
(assert (=
  ($Snap.second ($Snap.second $t@19@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@19@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@19@01))) $Snap.unit))
; [eval] high <= |array|
; [eval] |array|
(assert (<= high@17@01 (Seq_length array@3@01)))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@19@01))) $Snap.unit))
; [eval] (forall i: Int :: { array[i] } 0 <= i && (i < |array| && !(low <= i && i < high)) ==> array[i] != key)
(declare-const i@20@01 Int)
(push) ; 4
; [eval] 0 <= i && (i < |array| && !(low <= i && i < high)) ==> array[i] != key
; [eval] 0 <= i && (i < |array| && !(low <= i && i < high))
; [eval] 0 <= i
(push) ; 5
; [then-branch: 7 | !(0 <= i@20@01) | live]
; [else-branch: 7 | 0 <= i@20@01 | live]
(push) ; 6
; [then-branch: 7 | !(0 <= i@20@01)]
(assert (not (<= 0 i@20@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 7 | 0 <= i@20@01]
(assert (<= 0 i@20@01))
; [eval] i < |array|
; [eval] |array|
(push) ; 7
; [then-branch: 8 | !(i@20@01 < |array@3@01|) | live]
; [else-branch: 8 | i@20@01 < |array@3@01| | live]
(push) ; 8
; [then-branch: 8 | !(i@20@01 < |array@3@01|)]
(assert (not (< i@20@01 (Seq_length array@3@01))))
(pop) ; 8
(push) ; 8
; [else-branch: 8 | i@20@01 < |array@3@01|]
(assert (< i@20@01 (Seq_length array@3@01)))
; [eval] !(low <= i && i < high)
; [eval] low <= i && i < high
; [eval] low <= i
(push) ; 9
; [then-branch: 9 | !(low@16@01 <= i@20@01) | live]
; [else-branch: 9 | low@16@01 <= i@20@01 | live]
(push) ; 10
; [then-branch: 9 | !(low@16@01 <= i@20@01)]
(assert (not (<= low@16@01 i@20@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 9 | low@16@01 <= i@20@01]
(assert (<= low@16@01 i@20@01))
; [eval] i < high
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (<= low@16@01 i@20@01) (not (<= low@16@01 i@20@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@20@01 (Seq_length array@3@01))
  (and
    (< i@20@01 (Seq_length array@3@01))
    (or (<= low@16@01 i@20@01) (not (<= low@16@01 i@20@01))))))
(assert (or
  (< i@20@01 (Seq_length array@3@01))
  (not (< i@20@01 (Seq_length array@3@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@20@01)
  (and
    (<= 0 i@20@01)
    (=>
      (< i@20@01 (Seq_length array@3@01))
      (and
        (< i@20@01 (Seq_length array@3@01))
        (or (<= low@16@01 i@20@01) (not (<= low@16@01 i@20@01)))))
    (or
      (< i@20@01 (Seq_length array@3@01))
      (not (< i@20@01 (Seq_length array@3@01)))))))
(assert (or (<= 0 i@20@01) (not (<= 0 i@20@01))))
(push) ; 5
; [then-branch: 10 | 0 <= i@20@01 && i@20@01 < |array@3@01| && !(low@16@01 <= i@20@01 && i@20@01 < high@17@01) | live]
; [else-branch: 10 | !(0 <= i@20@01 && i@20@01 < |array@3@01| && !(low@16@01 <= i@20@01 && i@20@01 < high@17@01)) | live]
(push) ; 6
; [then-branch: 10 | 0 <= i@20@01 && i@20@01 < |array@3@01| && !(low@16@01 <= i@20@01 && i@20@01 < high@17@01)]
(assert (and
  (<= 0 i@20@01)
  (and
    (< i@20@01 (Seq_length array@3@01))
    (not (and (<= low@16@01 i@20@01) (< i@20@01 high@17@01))))))
; [eval] array[i] != key
; [eval] array[i]
(push) ; 7
(assert (not (>= i@20@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 10 | !(0 <= i@20@01 && i@20@01 < |array@3@01| && !(low@16@01 <= i@20@01 && i@20@01 < high@17@01))]
(assert (not
  (and
    (<= 0 i@20@01)
    (and
      (< i@20@01 (Seq_length array@3@01))
      (not (and (<= low@16@01 i@20@01) (< i@20@01 high@17@01)))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (<= 0 i@20@01)
    (and
      (< i@20@01 (Seq_length array@3@01))
      (not (and (<= low@16@01 i@20@01) (< i@20@01 high@17@01)))))
  (and
    (<= 0 i@20@01)
    (< i@20@01 (Seq_length array@3@01))
    (not (and (<= low@16@01 i@20@01) (< i@20@01 high@17@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@20@01)
      (and
        (< i@20@01 (Seq_length array@3@01))
        (not (and (<= low@16@01 i@20@01) (< i@20@01 high@17@01))))))
  (and
    (<= 0 i@20@01)
    (and
      (< i@20@01 (Seq_length array@3@01))
      (not (and (<= low@16@01 i@20@01) (< i@20@01 high@17@01)))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@20@01 Int)) (!
  (and
    (=>
      (<= 0 i@20@01)
      (and
        (<= 0 i@20@01)
        (=>
          (< i@20@01 (Seq_length array@3@01))
          (and
            (< i@20@01 (Seq_length array@3@01))
            (or (<= low@16@01 i@20@01) (not (<= low@16@01 i@20@01)))))
        (or
          (< i@20@01 (Seq_length array@3@01))
          (not (< i@20@01 (Seq_length array@3@01))))))
    (or (<= 0 i@20@01) (not (<= 0 i@20@01)))
    (=>
      (and
        (<= 0 i@20@01)
        (and
          (< i@20@01 (Seq_length array@3@01))
          (not (and (<= low@16@01 i@20@01) (< i@20@01 high@17@01)))))
      (and
        (<= 0 i@20@01)
        (< i@20@01 (Seq_length array@3@01))
        (not (and (<= low@16@01 i@20@01) (< i@20@01 high@17@01)))))
    (or
      (not
        (and
          (<= 0 i@20@01)
          (and
            (< i@20@01 (Seq_length array@3@01))
            (not (and (<= low@16@01 i@20@01) (< i@20@01 high@17@01))))))
      (and
        (<= 0 i@20@01)
        (and
          (< i@20@01 (Seq_length array@3@01))
          (not (and (<= low@16@01 i@20@01) (< i@20@01 high@17@01)))))))
  :pattern ((Seq_index array@3@01 i@20@01))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/binarySearchSeq.vpr@17@17@17@104-aux|)))
(assert (forall ((i@20@01 Int)) (!
  (=>
    (and
      (<= 0 i@20@01)
      (and
        (< i@20@01 (Seq_length array@3@01))
        (not (and (<= low@16@01 i@20@01) (< i@20@01 high@17@01)))))
    (not (= (Seq_index array@3@01 i@20@01) key@4@01)))
  :pattern ((Seq_index array@3@01 i@20@01))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/binarySearchSeq.vpr@17@17@17@104|)))
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; [eval] 0 <= low
; [eval] low <= high
(push) ; 4
(assert (not (<= 0 high@14@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 high@14@01))
; [eval] high <= |array|
; [eval] |array|
(push) ; 4
(assert (not (<= high@14@01 (Seq_length array@3@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= high@14@01 (Seq_length array@3@01)))
; [eval] (forall i: Int :: { array[i] } 0 <= i && (i < |array| && !(low <= i && i < high)) ==> array[i] != key)
(declare-const i@21@01 Int)
(push) ; 4
; [eval] 0 <= i && (i < |array| && !(low <= i && i < high)) ==> array[i] != key
; [eval] 0 <= i && (i < |array| && !(low <= i && i < high))
; [eval] 0 <= i
(push) ; 5
; [then-branch: 11 | !(0 <= i@21@01) | live]
; [else-branch: 11 | 0 <= i@21@01 | live]
(push) ; 6
; [then-branch: 11 | !(0 <= i@21@01)]
(assert (not (<= 0 i@21@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 11 | 0 <= i@21@01]
(assert (<= 0 i@21@01))
; [eval] i < |array|
; [eval] |array|
(push) ; 7
; [then-branch: 12 | !(i@21@01 < |array@3@01|) | live]
; [else-branch: 12 | i@21@01 < |array@3@01| | live]
(push) ; 8
; [then-branch: 12 | !(i@21@01 < |array@3@01|)]
(assert (not (< i@21@01 (Seq_length array@3@01))))
(pop) ; 8
(push) ; 8
; [else-branch: 12 | i@21@01 < |array@3@01|]
(assert (< i@21@01 (Seq_length array@3@01)))
; [eval] !(low <= i && i < high)
; [eval] low <= i && i < high
; [eval] low <= i
(push) ; 9
; [then-branch: 13 | !(0 <= i@21@01) | live]
; [else-branch: 13 | 0 <= i@21@01 | live]
(push) ; 10
; [then-branch: 13 | !(0 <= i@21@01)]
(assert (not (<= 0 i@21@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 13 | 0 <= i@21@01]
; [eval] i < high
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@21@01) (not (<= 0 i@21@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@21@01 (Seq_length array@3@01))
  (and
    (< i@21@01 (Seq_length array@3@01))
    (or (<= 0 i@21@01) (not (<= 0 i@21@01))))))
(assert (or
  (< i@21@01 (Seq_length array@3@01))
  (not (< i@21@01 (Seq_length array@3@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@21@01)
  (and
    (<= 0 i@21@01)
    (=>
      (< i@21@01 (Seq_length array@3@01))
      (and
        (< i@21@01 (Seq_length array@3@01))
        (or (<= 0 i@21@01) (not (<= 0 i@21@01)))))
    (or
      (< i@21@01 (Seq_length array@3@01))
      (not (< i@21@01 (Seq_length array@3@01)))))))
(assert (or (<= 0 i@21@01) (not (<= 0 i@21@01))))
(push) ; 5
; [then-branch: 14 | 0 <= i@21@01 && i@21@01 < |array@3@01| && !(0 <= i@21@01 && i@21@01 < high@14@01) | live]
; [else-branch: 14 | !(0 <= i@21@01 && i@21@01 < |array@3@01| && !(0 <= i@21@01 && i@21@01 < high@14@01)) | live]
(push) ; 6
; [then-branch: 14 | 0 <= i@21@01 && i@21@01 < |array@3@01| && !(0 <= i@21@01 && i@21@01 < high@14@01)]
(assert (and
  (<= 0 i@21@01)
  (and
    (< i@21@01 (Seq_length array@3@01))
    (not (and (<= 0 i@21@01) (< i@21@01 high@14@01))))))
; [eval] array[i] != key
; [eval] array[i]
(push) ; 7
(assert (not (>= i@21@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 14 | !(0 <= i@21@01 && i@21@01 < |array@3@01| && !(0 <= i@21@01 && i@21@01 < high@14@01))]
(assert (not
  (and
    (<= 0 i@21@01)
    (and
      (< i@21@01 (Seq_length array@3@01))
      (not (and (<= 0 i@21@01) (< i@21@01 high@14@01)))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (<= 0 i@21@01)
    (and
      (< i@21@01 (Seq_length array@3@01))
      (not (and (<= 0 i@21@01) (< i@21@01 high@14@01)))))
  (and
    (<= 0 i@21@01)
    (< i@21@01 (Seq_length array@3@01))
    (not (and (<= 0 i@21@01) (< i@21@01 high@14@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@21@01)
      (and
        (< i@21@01 (Seq_length array@3@01))
        (not (and (<= 0 i@21@01) (< i@21@01 high@14@01))))))
  (and
    (<= 0 i@21@01)
    (and
      (< i@21@01 (Seq_length array@3@01))
      (not (and (<= 0 i@21@01) (< i@21@01 high@14@01)))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@21@01 Int)) (!
  (and
    (=>
      (<= 0 i@21@01)
      (and
        (<= 0 i@21@01)
        (=>
          (< i@21@01 (Seq_length array@3@01))
          (and
            (< i@21@01 (Seq_length array@3@01))
            (or (<= 0 i@21@01) (not (<= 0 i@21@01)))))
        (or
          (< i@21@01 (Seq_length array@3@01))
          (not (< i@21@01 (Seq_length array@3@01))))))
    (or (<= 0 i@21@01) (not (<= 0 i@21@01)))
    (=>
      (and
        (<= 0 i@21@01)
        (and
          (< i@21@01 (Seq_length array@3@01))
          (not (and (<= 0 i@21@01) (< i@21@01 high@14@01)))))
      (and
        (<= 0 i@21@01)
        (< i@21@01 (Seq_length array@3@01))
        (not (and (<= 0 i@21@01) (< i@21@01 high@14@01)))))
    (or
      (not
        (and
          (<= 0 i@21@01)
          (and
            (< i@21@01 (Seq_length array@3@01))
            (not (and (<= 0 i@21@01) (< i@21@01 high@14@01))))))
      (and
        (<= 0 i@21@01)
        (and
          (< i@21@01 (Seq_length array@3@01))
          (not (and (<= 0 i@21@01) (< i@21@01 high@14@01)))))))
  :pattern ((Seq_index array@3@01 i@21@01))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/binarySearchSeq.vpr@17@17@17@104-aux|)))
(push) ; 4
(assert (not (forall ((i@21@01 Int)) (!
  (=>
    (and
      (<= 0 i@21@01)
      (and
        (< i@21@01 (Seq_length array@3@01))
        (not (and (<= 0 i@21@01) (< i@21@01 high@14@01)))))
    (not (= (Seq_index array@3@01 i@21@01) key@4@01)))
  :pattern ((Seq_index array@3@01 i@21@01))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/binarySearchSeq.vpr@17@17@17@104|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@21@01 Int)) (!
  (=>
    (and
      (<= 0 i@21@01)
      (and
        (< i@21@01 (Seq_length array@3@01))
        (not (and (<= 0 i@21@01) (< i@21@01 high@14@01)))))
    (not (= (Seq_index array@3@01 i@21@01) key@4@01)))
  :pattern ((Seq_index array@3@01 i@21@01))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/binarySearchSeq.vpr@17@17@17@104|)))
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
(assert (= $t@19@01 ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01))))
(assert (= ($Snap.first $t@19@01) $Snap.unit))
(assert (<= 0 low@16@01))
(assert (=
  ($Snap.second $t@19@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@19@01))
    ($Snap.second ($Snap.second $t@19@01)))))
(assert (= ($Snap.first ($Snap.second $t@19@01)) $Snap.unit))
(assert (<= low@16@01 high@17@01))
(assert (=
  ($Snap.second ($Snap.second $t@19@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@19@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@19@01))) $Snap.unit))
(assert (<= high@17@01 (Seq_length array@3@01)))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@19@01))) $Snap.unit))
(assert (forall ((i@20@01 Int)) (!
  (and
    (=>
      (<= 0 i@20@01)
      (and
        (<= 0 i@20@01)
        (=>
          (< i@20@01 (Seq_length array@3@01))
          (and
            (< i@20@01 (Seq_length array@3@01))
            (or (<= low@16@01 i@20@01) (not (<= low@16@01 i@20@01)))))
        (or
          (< i@20@01 (Seq_length array@3@01))
          (not (< i@20@01 (Seq_length array@3@01))))))
    (or (<= 0 i@20@01) (not (<= 0 i@20@01)))
    (=>
      (and
        (<= 0 i@20@01)
        (and
          (< i@20@01 (Seq_length array@3@01))
          (not (and (<= low@16@01 i@20@01) (< i@20@01 high@17@01)))))
      (and
        (<= 0 i@20@01)
        (< i@20@01 (Seq_length array@3@01))
        (not (and (<= low@16@01 i@20@01) (< i@20@01 high@17@01)))))
    (or
      (not
        (and
          (<= 0 i@20@01)
          (and
            (< i@20@01 (Seq_length array@3@01))
            (not (and (<= low@16@01 i@20@01) (< i@20@01 high@17@01))))))
      (and
        (<= 0 i@20@01)
        (and
          (< i@20@01 (Seq_length array@3@01))
          (not (and (<= low@16@01 i@20@01) (< i@20@01 high@17@01)))))))
  :pattern ((Seq_index array@3@01 i@20@01))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/binarySearchSeq.vpr@17@17@17@104-aux|)))
(assert (forall ((i@20@01 Int)) (!
  (=>
    (and
      (<= 0 i@20@01)
      (and
        (< i@20@01 (Seq_length array@3@01))
        (not (and (<= low@16@01 i@20@01) (< i@20@01 high@17@01)))))
    (not (= (Seq_index array@3@01 i@20@01) key@4@01)))
  :pattern ((Seq_index array@3@01 i@20@01))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/binarySearchSeq.vpr@17@17@17@104|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 5
; [eval] low < high
(pop) ; 5
(push) ; 5
; [eval] !(low < high)
; [eval] low < high
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] low < high
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< low@16@01 high@17@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< low@16@01 high@17@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 15 | low@16@01 < high@17@01 | live]
; [else-branch: 15 | !(low@16@01 < high@17@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 15 | low@16@01 < high@17@01]
(assert (< low@16@01 high@17@01))
; [exec]
; mid := (low + high) / 2
; [eval] (low + high) / 2
; [eval] low + high
(declare-const mid@22@01 Int)
(assert (= mid@22@01 (div (+ low@16@01 high@17@01) 2)))
; [eval] array[mid] < key
; [eval] array[mid]
(push) ; 6
(assert (not (>= mid@22@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< mid@22@01 (Seq_length array@3@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (< (Seq_index array@3@01 mid@22@01) key@4@01))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (< (Seq_index array@3@01 mid@22@01) key@4@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 16 | array@3@01[mid@22@01] < key@4@01 | live]
; [else-branch: 16 | !(array@3@01[mid@22@01] < key@4@01) | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 16 | array@3@01[mid@22@01] < key@4@01]
(assert (< (Seq_index array@3@01 mid@22@01) key@4@01))
; [exec]
; low := mid + 1
; [eval] mid + 1
(declare-const low@23@01 Int)
(assert (= low@23@01 (+ mid@22@01 1)))
; Loop head block: Re-establish invariant
; [eval] 0 <= low
(push) ; 7
(assert (not (<= 0 low@23@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 low@23@01))
; [eval] low <= high
(push) ; 7
(assert (not (<= low@23@01 high@17@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<= low@23@01 high@17@01))
; [eval] high <= |array|
; [eval] |array|
; [eval] (forall i: Int :: { array[i] } 0 <= i && (i < |array| && !(low <= i && i < high)) ==> array[i] != key)
(declare-const i@24@01 Int)
(push) ; 7
; [eval] 0 <= i && (i < |array| && !(low <= i && i < high)) ==> array[i] != key
; [eval] 0 <= i && (i < |array| && !(low <= i && i < high))
; [eval] 0 <= i
(push) ; 8
; [then-branch: 17 | !(0 <= i@24@01) | live]
; [else-branch: 17 | 0 <= i@24@01 | live]
(push) ; 9
; [then-branch: 17 | !(0 <= i@24@01)]
(assert (not (<= 0 i@24@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 17 | 0 <= i@24@01]
(assert (<= 0 i@24@01))
; [eval] i < |array|
; [eval] |array|
(push) ; 10
; [then-branch: 18 | !(i@24@01 < |array@3@01|) | live]
; [else-branch: 18 | i@24@01 < |array@3@01| | live]
(push) ; 11
; [then-branch: 18 | !(i@24@01 < |array@3@01|)]
(assert (not (< i@24@01 (Seq_length array@3@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 18 | i@24@01 < |array@3@01|]
(assert (< i@24@01 (Seq_length array@3@01)))
; [eval] !(low <= i && i < high)
; [eval] low <= i && i < high
; [eval] low <= i
(push) ; 12
; [then-branch: 19 | !(low@23@01 <= i@24@01) | live]
; [else-branch: 19 | low@23@01 <= i@24@01 | live]
(push) ; 13
; [then-branch: 19 | !(low@23@01 <= i@24@01)]
(assert (not (<= low@23@01 i@24@01)))
(pop) ; 13
(push) ; 13
; [else-branch: 19 | low@23@01 <= i@24@01]
(assert (<= low@23@01 i@24@01))
; [eval] i < high
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (or (<= low@23@01 i@24@01) (not (<= low@23@01 i@24@01))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@24@01 (Seq_length array@3@01))
  (and
    (< i@24@01 (Seq_length array@3@01))
    (or (<= low@23@01 i@24@01) (not (<= low@23@01 i@24@01))))))
(assert (or
  (< i@24@01 (Seq_length array@3@01))
  (not (< i@24@01 (Seq_length array@3@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@24@01)
  (and
    (<= 0 i@24@01)
    (=>
      (< i@24@01 (Seq_length array@3@01))
      (and
        (< i@24@01 (Seq_length array@3@01))
        (or (<= low@23@01 i@24@01) (not (<= low@23@01 i@24@01)))))
    (or
      (< i@24@01 (Seq_length array@3@01))
      (not (< i@24@01 (Seq_length array@3@01)))))))
(assert (or (<= 0 i@24@01) (not (<= 0 i@24@01))))
(push) ; 8
; [then-branch: 20 | 0 <= i@24@01 && i@24@01 < |array@3@01| && !(low@23@01 <= i@24@01 && i@24@01 < high@17@01) | live]
; [else-branch: 20 | !(0 <= i@24@01 && i@24@01 < |array@3@01| && !(low@23@01 <= i@24@01 && i@24@01 < high@17@01)) | live]
(push) ; 9
; [then-branch: 20 | 0 <= i@24@01 && i@24@01 < |array@3@01| && !(low@23@01 <= i@24@01 && i@24@01 < high@17@01)]
(assert (and
  (<= 0 i@24@01)
  (and
    (< i@24@01 (Seq_length array@3@01))
    (not (and (<= low@23@01 i@24@01) (< i@24@01 high@17@01))))))
; [eval] array[i] != key
; [eval] array[i]
(push) ; 10
(assert (not (>= i@24@01 0)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
(push) ; 9
; [else-branch: 20 | !(0 <= i@24@01 && i@24@01 < |array@3@01| && !(low@23@01 <= i@24@01 && i@24@01 < high@17@01))]
(assert (not
  (and
    (<= 0 i@24@01)
    (and
      (< i@24@01 (Seq_length array@3@01))
      (not (and (<= low@23@01 i@24@01) (< i@24@01 high@17@01)))))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (and
    (<= 0 i@24@01)
    (and
      (< i@24@01 (Seq_length array@3@01))
      (not (and (<= low@23@01 i@24@01) (< i@24@01 high@17@01)))))
  (and
    (<= 0 i@24@01)
    (< i@24@01 (Seq_length array@3@01))
    (not (and (<= low@23@01 i@24@01) (< i@24@01 high@17@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@24@01)
      (and
        (< i@24@01 (Seq_length array@3@01))
        (not (and (<= low@23@01 i@24@01) (< i@24@01 high@17@01))))))
  (and
    (<= 0 i@24@01)
    (and
      (< i@24@01 (Seq_length array@3@01))
      (not (and (<= low@23@01 i@24@01) (< i@24@01 high@17@01)))))))
(pop) ; 7
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@24@01 Int)) (!
  (and
    (=>
      (<= 0 i@24@01)
      (and
        (<= 0 i@24@01)
        (=>
          (< i@24@01 (Seq_length array@3@01))
          (and
            (< i@24@01 (Seq_length array@3@01))
            (or (<= low@23@01 i@24@01) (not (<= low@23@01 i@24@01)))))
        (or
          (< i@24@01 (Seq_length array@3@01))
          (not (< i@24@01 (Seq_length array@3@01))))))
    (or (<= 0 i@24@01) (not (<= 0 i@24@01)))
    (=>
      (and
        (<= 0 i@24@01)
        (and
          (< i@24@01 (Seq_length array@3@01))
          (not (and (<= low@23@01 i@24@01) (< i@24@01 high@17@01)))))
      (and
        (<= 0 i@24@01)
        (< i@24@01 (Seq_length array@3@01))
        (not (and (<= low@23@01 i@24@01) (< i@24@01 high@17@01)))))
    (or
      (not
        (and
          (<= 0 i@24@01)
          (and
            (< i@24@01 (Seq_length array@3@01))
            (not (and (<= low@23@01 i@24@01) (< i@24@01 high@17@01))))))
      (and
        (<= 0 i@24@01)
        (and
          (< i@24@01 (Seq_length array@3@01))
          (not (and (<= low@23@01 i@24@01) (< i@24@01 high@17@01)))))))
  :pattern ((Seq_index array@3@01 i@24@01))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/binarySearchSeq.vpr@17@17@17@104-aux|)))
(push) ; 7
(assert (not (forall ((i@24@01 Int)) (!
  (=>
    (and
      (<= 0 i@24@01)
      (and
        (< i@24@01 (Seq_length array@3@01))
        (not (and (<= low@23@01 i@24@01) (< i@24@01 high@17@01)))))
    (not (= (Seq_index array@3@01 i@24@01) key@4@01)))
  :pattern ((Seq_index array@3@01 i@24@01))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/binarySearchSeq.vpr@17@17@17@104|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@24@01 Int)) (!
  (=>
    (and
      (<= 0 i@24@01)
      (and
        (< i@24@01 (Seq_length array@3@01))
        (not (and (<= low@23@01 i@24@01) (< i@24@01 high@17@01)))))
    (not (= (Seq_index array@3@01 i@24@01) key@4@01)))
  :pattern ((Seq_index array@3@01 i@24@01))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/binarySearchSeq.vpr@17@17@17@104|)))
(pop) ; 6
(push) ; 6
; [else-branch: 16 | !(array@3@01[mid@22@01] < key@4@01)]
(assert (not (< (Seq_index array@3@01 mid@22@01) key@4@01)))
(pop) ; 6
; [eval] !(array[mid] < key)
; [eval] array[mid] < key
; [eval] array[mid]
(push) ; 6
(assert (not (>= mid@22@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< mid@22@01 (Seq_length array@3@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(set-option :timeout 10)
(assert (not (< (Seq_index array@3@01 mid@22@01) key@4@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (< (Seq_index array@3@01 mid@22@01) key@4@01))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 21 | !(array@3@01[mid@22@01] < key@4@01) | live]
; [else-branch: 21 | array@3@01[mid@22@01] < key@4@01 | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 21 | !(array@3@01[mid@22@01] < key@4@01)]
(assert (not (< (Seq_index array@3@01 mid@22@01) key@4@01)))
; [eval] key < array[mid]
; [eval] array[mid]
(push) ; 7
(assert (not (>= mid@22@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< mid@22@01 (Seq_length array@3@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (< key@4@01 (Seq_index array@3@01 mid@22@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< key@4@01 (Seq_index array@3@01 mid@22@01))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 22 | key@4@01 < array@3@01[mid@22@01] | live]
; [else-branch: 22 | !(key@4@01 < array@3@01[mid@22@01]) | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 22 | key@4@01 < array@3@01[mid@22@01]]
(assert (< key@4@01 (Seq_index array@3@01 mid@22@01)))
; [exec]
; high := mid
; Loop head block: Re-establish invariant
; [eval] 0 <= low
; [eval] low <= high
(push) ; 8
(assert (not (<= low@16@01 mid@22@01)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (<= low@16@01 mid@22@01))
; [eval] high <= |array|
; [eval] |array|
(push) ; 8
(assert (not (<= mid@22@01 (Seq_length array@3@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (<= mid@22@01 (Seq_length array@3@01)))
; [eval] (forall i: Int :: { array[i] } 0 <= i && (i < |array| && !(low <= i && i < high)) ==> array[i] != key)
(declare-const i@25@01 Int)
(push) ; 8
; [eval] 0 <= i && (i < |array| && !(low <= i && i < high)) ==> array[i] != key
; [eval] 0 <= i && (i < |array| && !(low <= i && i < high))
; [eval] 0 <= i
(push) ; 9
; [then-branch: 23 | !(0 <= i@25@01) | live]
; [else-branch: 23 | 0 <= i@25@01 | live]
(push) ; 10
; [then-branch: 23 | !(0 <= i@25@01)]
(assert (not (<= 0 i@25@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 23 | 0 <= i@25@01]
(assert (<= 0 i@25@01))
; [eval] i < |array|
; [eval] |array|
(push) ; 11
; [then-branch: 24 | !(i@25@01 < |array@3@01|) | live]
; [else-branch: 24 | i@25@01 < |array@3@01| | live]
(push) ; 12
; [then-branch: 24 | !(i@25@01 < |array@3@01|)]
(assert (not (< i@25@01 (Seq_length array@3@01))))
(pop) ; 12
(push) ; 12
; [else-branch: 24 | i@25@01 < |array@3@01|]
(assert (< i@25@01 (Seq_length array@3@01)))
; [eval] !(low <= i && i < high)
; [eval] low <= i && i < high
; [eval] low <= i
(push) ; 13
; [then-branch: 25 | !(low@16@01 <= i@25@01) | live]
; [else-branch: 25 | low@16@01 <= i@25@01 | live]
(push) ; 14
; [then-branch: 25 | !(low@16@01 <= i@25@01)]
(assert (not (<= low@16@01 i@25@01)))
(pop) ; 14
(push) ; 14
; [else-branch: 25 | low@16@01 <= i@25@01]
(assert (<= low@16@01 i@25@01))
; [eval] i < high
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(assert (or (<= low@16@01 i@25@01) (not (<= low@16@01 i@25@01))))
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@25@01 (Seq_length array@3@01))
  (and
    (< i@25@01 (Seq_length array@3@01))
    (or (<= low@16@01 i@25@01) (not (<= low@16@01 i@25@01))))))
(assert (or
  (< i@25@01 (Seq_length array@3@01))
  (not (< i@25@01 (Seq_length array@3@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@25@01)
  (and
    (<= 0 i@25@01)
    (=>
      (< i@25@01 (Seq_length array@3@01))
      (and
        (< i@25@01 (Seq_length array@3@01))
        (or (<= low@16@01 i@25@01) (not (<= low@16@01 i@25@01)))))
    (or
      (< i@25@01 (Seq_length array@3@01))
      (not (< i@25@01 (Seq_length array@3@01)))))))
(assert (or (<= 0 i@25@01) (not (<= 0 i@25@01))))
(push) ; 9
; [then-branch: 26 | 0 <= i@25@01 && i@25@01 < |array@3@01| && !(low@16@01 <= i@25@01 && i@25@01 < mid@22@01) | live]
; [else-branch: 26 | !(0 <= i@25@01 && i@25@01 < |array@3@01| && !(low@16@01 <= i@25@01 && i@25@01 < mid@22@01)) | live]
(push) ; 10
; [then-branch: 26 | 0 <= i@25@01 && i@25@01 < |array@3@01| && !(low@16@01 <= i@25@01 && i@25@01 < mid@22@01)]
(assert (and
  (<= 0 i@25@01)
  (and
    (< i@25@01 (Seq_length array@3@01))
    (not (and (<= low@16@01 i@25@01) (< i@25@01 mid@22@01))))))
; [eval] array[i] != key
; [eval] array[i]
(push) ; 11
(assert (not (>= i@25@01 0)))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(pop) ; 10
(push) ; 10
; [else-branch: 26 | !(0 <= i@25@01 && i@25@01 < |array@3@01| && !(low@16@01 <= i@25@01 && i@25@01 < mid@22@01))]
(assert (not
  (and
    (<= 0 i@25@01)
    (and
      (< i@25@01 (Seq_length array@3@01))
      (not (and (<= low@16@01 i@25@01) (< i@25@01 mid@22@01)))))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (and
    (<= 0 i@25@01)
    (and
      (< i@25@01 (Seq_length array@3@01))
      (not (and (<= low@16@01 i@25@01) (< i@25@01 mid@22@01)))))
  (and
    (<= 0 i@25@01)
    (< i@25@01 (Seq_length array@3@01))
    (not (and (<= low@16@01 i@25@01) (< i@25@01 mid@22@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@25@01)
      (and
        (< i@25@01 (Seq_length array@3@01))
        (not (and (<= low@16@01 i@25@01) (< i@25@01 mid@22@01))))))
  (and
    (<= 0 i@25@01)
    (and
      (< i@25@01 (Seq_length array@3@01))
      (not (and (<= low@16@01 i@25@01) (< i@25@01 mid@22@01)))))))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@25@01 Int)) (!
  (and
    (=>
      (<= 0 i@25@01)
      (and
        (<= 0 i@25@01)
        (=>
          (< i@25@01 (Seq_length array@3@01))
          (and
            (< i@25@01 (Seq_length array@3@01))
            (or (<= low@16@01 i@25@01) (not (<= low@16@01 i@25@01)))))
        (or
          (< i@25@01 (Seq_length array@3@01))
          (not (< i@25@01 (Seq_length array@3@01))))))
    (or (<= 0 i@25@01) (not (<= 0 i@25@01)))
    (=>
      (and
        (<= 0 i@25@01)
        (and
          (< i@25@01 (Seq_length array@3@01))
          (not (and (<= low@16@01 i@25@01) (< i@25@01 mid@22@01)))))
      (and
        (<= 0 i@25@01)
        (< i@25@01 (Seq_length array@3@01))
        (not (and (<= low@16@01 i@25@01) (< i@25@01 mid@22@01)))))
    (or
      (not
        (and
          (<= 0 i@25@01)
          (and
            (< i@25@01 (Seq_length array@3@01))
            (not (and (<= low@16@01 i@25@01) (< i@25@01 mid@22@01))))))
      (and
        (<= 0 i@25@01)
        (and
          (< i@25@01 (Seq_length array@3@01))
          (not (and (<= low@16@01 i@25@01) (< i@25@01 mid@22@01)))))))
  :pattern ((Seq_index array@3@01 i@25@01))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/binarySearchSeq.vpr@17@17@17@104-aux|)))
(push) ; 8
(assert (not (forall ((i@25@01 Int)) (!
  (=>
    (and
      (<= 0 i@25@01)
      (and
        (< i@25@01 (Seq_length array@3@01))
        (not (and (<= low@16@01 i@25@01) (< i@25@01 mid@22@01)))))
    (not (= (Seq_index array@3@01 i@25@01) key@4@01)))
  :pattern ((Seq_index array@3@01 i@25@01))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/binarySearchSeq.vpr@17@17@17@104|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@25@01 Int)) (!
  (=>
    (and
      (<= 0 i@25@01)
      (and
        (< i@25@01 (Seq_length array@3@01))
        (not (and (<= low@16@01 i@25@01) (< i@25@01 mid@22@01)))))
    (not (= (Seq_index array@3@01 i@25@01) key@4@01)))
  :pattern ((Seq_index array@3@01 i@25@01))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/binarySearchSeq.vpr@17@17@17@104|)))
(pop) ; 7
(push) ; 7
; [else-branch: 22 | !(key@4@01 < array@3@01[mid@22@01])]
(assert (not (< key@4@01 (Seq_index array@3@01 mid@22@01))))
(pop) ; 7
; [eval] !(key < array[mid])
; [eval] key < array[mid]
; [eval] array[mid]
(push) ; 7
(assert (not (>= mid@22@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< mid@22@01 (Seq_length array@3@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(set-option :timeout 10)
(assert (not (< key@4@01 (Seq_index array@3@01 mid@22@01))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (< key@4@01 (Seq_index array@3@01 mid@22@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 27 | !(key@4@01 < array@3@01[mid@22@01]) | live]
; [else-branch: 27 | key@4@01 < array@3@01[mid@22@01] | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 27 | !(key@4@01 < array@3@01[mid@22@01])]
(assert (not (< key@4@01 (Seq_index array@3@01 mid@22@01))))
; [exec]
; index := mid
; Loop head block: Re-establish invariant
; [eval] 0 <= low
; [eval] low <= high
; [eval] high <= |array|
; [eval] |array|
; [eval] (forall i: Int :: { array[i] } 0 <= i && (i < |array| && !(low <= i && i < high)) ==> array[i] != key)
(declare-const i@26@01 Int)
(push) ; 8
; [eval] 0 <= i && (i < |array| && !(low <= i && i < high)) ==> array[i] != key
; [eval] 0 <= i && (i < |array| && !(low <= i && i < high))
; [eval] 0 <= i
(push) ; 9
; [then-branch: 28 | !(0 <= i@26@01) | live]
; [else-branch: 28 | 0 <= i@26@01 | live]
(push) ; 10
; [then-branch: 28 | !(0 <= i@26@01)]
(assert (not (<= 0 i@26@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 28 | 0 <= i@26@01]
(assert (<= 0 i@26@01))
; [eval] i < |array|
; [eval] |array|
(push) ; 11
; [then-branch: 29 | !(i@26@01 < |array@3@01|) | live]
; [else-branch: 29 | i@26@01 < |array@3@01| | live]
(push) ; 12
; [then-branch: 29 | !(i@26@01 < |array@3@01|)]
(assert (not (< i@26@01 (Seq_length array@3@01))))
(pop) ; 12
(push) ; 12
; [else-branch: 29 | i@26@01 < |array@3@01|]
(assert (< i@26@01 (Seq_length array@3@01)))
; [eval] !(low <= i && i < high)
; [eval] low <= i && i < high
; [eval] low <= i
(push) ; 13
; [then-branch: 30 | !(low@16@01 <= i@26@01) | live]
; [else-branch: 30 | low@16@01 <= i@26@01 | live]
(push) ; 14
; [then-branch: 30 | !(low@16@01 <= i@26@01)]
(assert (not (<= low@16@01 i@26@01)))
(pop) ; 14
(push) ; 14
; [else-branch: 30 | low@16@01 <= i@26@01]
(assert (<= low@16@01 i@26@01))
; [eval] i < high
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(assert (or (<= low@16@01 i@26@01) (not (<= low@16@01 i@26@01))))
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@26@01 (Seq_length array@3@01))
  (and
    (< i@26@01 (Seq_length array@3@01))
    (or (<= low@16@01 i@26@01) (not (<= low@16@01 i@26@01))))))
(assert (or
  (< i@26@01 (Seq_length array@3@01))
  (not (< i@26@01 (Seq_length array@3@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@26@01)
  (and
    (<= 0 i@26@01)
    (=>
      (< i@26@01 (Seq_length array@3@01))
      (and
        (< i@26@01 (Seq_length array@3@01))
        (or (<= low@16@01 i@26@01) (not (<= low@16@01 i@26@01)))))
    (or
      (< i@26@01 (Seq_length array@3@01))
      (not (< i@26@01 (Seq_length array@3@01)))))))
(assert (or (<= 0 i@26@01) (not (<= 0 i@26@01))))
(push) ; 9
; [then-branch: 31 | 0 <= i@26@01 && i@26@01 < |array@3@01| && !(low@16@01 <= i@26@01 && i@26@01 < high@17@01) | live]
; [else-branch: 31 | !(0 <= i@26@01 && i@26@01 < |array@3@01| && !(low@16@01 <= i@26@01 && i@26@01 < high@17@01)) | live]
(push) ; 10
; [then-branch: 31 | 0 <= i@26@01 && i@26@01 < |array@3@01| && !(low@16@01 <= i@26@01 && i@26@01 < high@17@01)]
(assert (and
  (<= 0 i@26@01)
  (and
    (< i@26@01 (Seq_length array@3@01))
    (not (and (<= low@16@01 i@26@01) (< i@26@01 high@17@01))))))
; [eval] array[i] != key
; [eval] array[i]
(push) ; 11
(assert (not (>= i@26@01 0)))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(pop) ; 10
(push) ; 10
; [else-branch: 31 | !(0 <= i@26@01 && i@26@01 < |array@3@01| && !(low@16@01 <= i@26@01 && i@26@01 < high@17@01))]
(assert (not
  (and
    (<= 0 i@26@01)
    (and
      (< i@26@01 (Seq_length array@3@01))
      (not (and (<= low@16@01 i@26@01) (< i@26@01 high@17@01)))))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (and
    (<= 0 i@26@01)
    (and
      (< i@26@01 (Seq_length array@3@01))
      (not (and (<= low@16@01 i@26@01) (< i@26@01 high@17@01)))))
  (and
    (<= 0 i@26@01)
    (< i@26@01 (Seq_length array@3@01))
    (not (and (<= low@16@01 i@26@01) (< i@26@01 high@17@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@26@01)
      (and
        (< i@26@01 (Seq_length array@3@01))
        (not (and (<= low@16@01 i@26@01) (< i@26@01 high@17@01))))))
  (and
    (<= 0 i@26@01)
    (and
      (< i@26@01 (Seq_length array@3@01))
      (not (and (<= low@16@01 i@26@01) (< i@26@01 high@17@01)))))))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@26@01 Int)) (!
  (and
    (=>
      (<= 0 i@26@01)
      (and
        (<= 0 i@26@01)
        (=>
          (< i@26@01 (Seq_length array@3@01))
          (and
            (< i@26@01 (Seq_length array@3@01))
            (or (<= low@16@01 i@26@01) (not (<= low@16@01 i@26@01)))))
        (or
          (< i@26@01 (Seq_length array@3@01))
          (not (< i@26@01 (Seq_length array@3@01))))))
    (or (<= 0 i@26@01) (not (<= 0 i@26@01)))
    (=>
      (and
        (<= 0 i@26@01)
        (and
          (< i@26@01 (Seq_length array@3@01))
          (not (and (<= low@16@01 i@26@01) (< i@26@01 high@17@01)))))
      (and
        (<= 0 i@26@01)
        (< i@26@01 (Seq_length array@3@01))
        (not (and (<= low@16@01 i@26@01) (< i@26@01 high@17@01)))))
    (or
      (not
        (and
          (<= 0 i@26@01)
          (and
            (< i@26@01 (Seq_length array@3@01))
            (not (and (<= low@16@01 i@26@01) (< i@26@01 high@17@01))))))
      (and
        (<= 0 i@26@01)
        (and
          (< i@26@01 (Seq_length array@3@01))
          (not (and (<= low@16@01 i@26@01) (< i@26@01 high@17@01)))))))
  :pattern ((Seq_index array@3@01 i@26@01))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/binarySearchSeq.vpr@17@17@17@104-aux|)))
(push) ; 8
(assert (not (forall ((i@26@01 Int)) (!
  (=>
    (and
      (<= 0 i@26@01)
      (and
        (< i@26@01 (Seq_length array@3@01))
        (not (and (<= low@16@01 i@26@01) (< i@26@01 high@17@01)))))
    (not (= (Seq_index array@3@01 i@26@01) key@4@01)))
  :pattern ((Seq_index array@3@01 i@26@01))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/binarySearchSeq.vpr@17@17@17@104|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@26@01 Int)) (!
  (=>
    (and
      (<= 0 i@26@01)
      (and
        (< i@26@01 (Seq_length array@3@01))
        (not (and (<= low@16@01 i@26@01) (< i@26@01 high@17@01)))))
    (not (= (Seq_index array@3@01 i@26@01) key@4@01)))
  :pattern ((Seq_index array@3@01 i@26@01))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/binarySearchSeq.vpr@17@17@17@104|)))
(pop) ; 7
(push) ; 7
; [else-branch: 27 | key@4@01 < array@3@01[mid@22@01]]
(assert (< key@4@01 (Seq_index array@3@01 mid@22@01)))
(pop) ; 7
(pop) ; 6
(push) ; 6
; [else-branch: 21 | array@3@01[mid@22@01] < key@4@01]
(assert (< (Seq_index array@3@01 mid@22@01) key@4@01))
(pop) ; 6
(pop) ; 5
(push) ; 5
; [else-branch: 15 | !(low@16@01 < high@17@01)]
(assert (not (< low@16@01 high@17@01)))
(pop) ; 5
; [eval] !(low < high)
; [eval] low < high
(push) ; 5
(set-option :timeout 10)
(assert (not (< low@16@01 high@17@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< low@16@01 high@17@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 32 | !(low@16@01 < high@17@01) | live]
; [else-branch: 32 | low@16@01 < high@17@01 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 32 | !(low@16@01 < high@17@01)]
(assert (not (< low@16@01 high@17@01)))
; [exec]
; index := -1
; [eval] -1
; [eval] -1 <= index
; [eval] -1
; [eval] index < |array|
; [eval] |array|
(push) ; 6
(assert (not (< (- 0 1) (Seq_length array@3@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (< (- 0 1) (Seq_length array@3@01)))
; [eval] 0 <= index ==> array[index] == key
; [eval] 0 <= index
(push) ; 6
; [then-branch: 33 | False | dead]
; [else-branch: 33 | True | live]
(push) ; 7
; [else-branch: 33 | True]
(pop) ; 7
(pop) ; 6
; Joined path conditions
; [eval] -1 == index ==> (forall i: Int :: { array[i] } 0 <= i && i < |array| ==> array[i] != key)
; [eval] -1 == index
; [eval] -1
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 34 | True | live]
; [else-branch: 34 | False | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 34 | True]
; [eval] (forall i: Int :: { array[i] } 0 <= i && i < |array| ==> array[i] != key)
(declare-const i@27@01 Int)
(push) ; 8
; [eval] 0 <= i && i < |array| ==> array[i] != key
; [eval] 0 <= i && i < |array|
; [eval] 0 <= i
(push) ; 9
; [then-branch: 35 | !(0 <= i@27@01) | live]
; [else-branch: 35 | 0 <= i@27@01 | live]
(push) ; 10
; [then-branch: 35 | !(0 <= i@27@01)]
(assert (not (<= 0 i@27@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 35 | 0 <= i@27@01]
(assert (<= 0 i@27@01))
; [eval] i < |array|
; [eval] |array|
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@27@01) (not (<= 0 i@27@01))))
(push) ; 9
; [then-branch: 36 | 0 <= i@27@01 && i@27@01 < |array@3@01| | live]
; [else-branch: 36 | !(0 <= i@27@01 && i@27@01 < |array@3@01|) | live]
(push) ; 10
; [then-branch: 36 | 0 <= i@27@01 && i@27@01 < |array@3@01|]
(assert (and (<= 0 i@27@01) (< i@27@01 (Seq_length array@3@01))))
; [eval] array[i] != key
; [eval] array[i]
(push) ; 11
(assert (not (>= i@27@01 0)))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(pop) ; 10
(push) ; 10
; [else-branch: 36 | !(0 <= i@27@01 && i@27@01 < |array@3@01|)]
(assert (not (and (<= 0 i@27@01) (< i@27@01 (Seq_length array@3@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= 0 i@27@01) (< i@27@01 (Seq_length array@3@01))))
  (and (<= 0 i@27@01) (< i@27@01 (Seq_length array@3@01)))))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@27@01 Int)) (!
  (and
    (or (<= 0 i@27@01) (not (<= 0 i@27@01)))
    (or
      (not (and (<= 0 i@27@01) (< i@27@01 (Seq_length array@3@01))))
      (and (<= 0 i@27@01) (< i@27@01 (Seq_length array@3@01)))))
  :pattern ((Seq_index array@3@01 i@27@01))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/binarySearchSeq.vpr@8@29@8@87-aux|)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (forall ((i@27@01 Int)) (!
  (and
    (or (<= 0 i@27@01) (not (<= 0 i@27@01)))
    (or
      (not (and (<= 0 i@27@01) (< i@27@01 (Seq_length array@3@01))))
      (and (<= 0 i@27@01) (< i@27@01 (Seq_length array@3@01)))))
  :pattern ((Seq_index array@3@01 i@27@01))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/binarySearchSeq.vpr@8@29@8@87-aux|)))
(push) ; 6
(assert (not (forall ((i@27@01 Int)) (!
  (=>
    (and (<= 0 i@27@01) (< i@27@01 (Seq_length array@3@01)))
    (not (= (Seq_index array@3@01 i@27@01) key@4@01)))
  :pattern ((Seq_index array@3@01 i@27@01))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/binarySearchSeq.vpr@8@29@8@87|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@27@01 Int)) (!
  (=>
    (and (<= 0 i@27@01) (< i@27@01 (Seq_length array@3@01)))
    (not (= (Seq_index array@3@01 i@27@01) key@4@01)))
  :pattern ((Seq_index array@3@01 i@27@01))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/binarySearchSeq.vpr@8@29@8@87|)))
(pop) ; 5
(push) ; 5
; [else-branch: 32 | low@16@01 < high@17@01]
(assert (< low@16@01 high@17@01))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
