(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:51:36
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0146.vpr
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
(declare-fun idx00 ($Snap Int Int Int Int) Int)
(declare-fun idx00%limited ($Snap Int Int Int Int) Int)
(declare-fun idx00%stateless (Int Int Int Int) Bool)
(declare-fun idx00%precondition ($Snap Int Int Int Int) Bool)
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
(assert (forall ((s@$ $Snap) (a@0@00 Int) (b@1@00 Int) (c@2@00 Int) (n@3@00 Int)) (!
  (=
    (idx00%limited s@$ a@0@00 b@1@00 c@2@00 n@3@00)
    (idx00 s@$ a@0@00 b@1@00 c@2@00 n@3@00))
  :pattern ((idx00 s@$ a@0@00 b@1@00 c@2@00 n@3@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (a@0@00 Int) (b@1@00 Int) (c@2@00 Int) (n@3@00 Int)) (!
  (idx00%stateless a@0@00 b@1@00 c@2@00 n@3@00)
  :pattern ((idx00%limited s@$ a@0@00 b@1@00 c@2@00 n@3@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (a@0@00 Int) (b@1@00 Int) (c@2@00 Int) (n@3@00 Int)) (!
  (let ((result@4@00 (idx00%limited s@$ a@0@00 b@1@00 c@2@00 n@3@00))) (=>
    (idx00%precondition s@$ a@0@00 b@1@00 c@2@00 n@3@00)
    (and (<= 0 result@4@00) (< result@4@00 n@3@00))))
  :pattern ((idx00%limited s@$ a@0@00 b@1@00 c@2@00 n@3@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (a@0@00 Int) (b@1@00 Int) (c@2@00 Int) (n@3@00 Int)) (!
  (let ((result@4@00 (idx00%limited s@$ a@0@00 b@1@00 c@2@00 n@3@00))) true)
  :pattern ((idx00%limited s@$ a@0@00 b@1@00 c@2@00 n@3@00))
  :qid |quant-u-3|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test00 ----------
(declare-const xs@0@01 Seq<Int>)
(declare-const n@1@01 Int)
(declare-const xs@2@01 Seq<Int>)
(declare-const n@3@01 Int)
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
; inhale 10 < n
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 $Snap.unit))
; [eval] 10 < n
(assert (< 10 n@3@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale n <= |xs|
(declare-const $t@5@01 $Snap)
(assert (= $t@5@01 $Snap.unit))
; [eval] n <= |xs|
; [eval] |xs|
(assert (<= n@3@01 (Seq_length xs@2@01)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int, j: Int, fresh__1: Int ::
;     { xs[idx00(i, j, fresh__1, n)] }
;     0 <= i && (i < n && (0 <= j && j < i)) ==>
;     xs[idx00(i, j, j + 1, n)] == i + j)
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 $Snap.unit))
; [eval] (forall i: Int, j: Int, fresh__1: Int :: { xs[idx00(i, j, fresh__1, n)] } 0 <= i && (i < n && (0 <= j && j < i)) ==> xs[idx00(i, j, j + 1, n)] == i + j)
(declare-const i@7@01 Int)
(declare-const j@8@01 Int)
(declare-const fresh__1@9@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && (i < n && (0 <= j && j < i)) ==> xs[idx00(i, j, j + 1, n)] == i + j
; [eval] 0 <= i && (i < n && (0 <= j && j < i))
; [eval] 0 <= i
(push) ; 4
; [then-branch: 0 | !(0 <= i@7@01) | live]
; [else-branch: 0 | 0 <= i@7@01 | live]
(push) ; 5
; [then-branch: 0 | !(0 <= i@7@01)]
(assert (not (<= 0 i@7@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | 0 <= i@7@01]
(assert (<= 0 i@7@01))
; [eval] i < n
(push) ; 6
; [then-branch: 1 | !(i@7@01 < n@3@01) | live]
; [else-branch: 1 | i@7@01 < n@3@01 | live]
(push) ; 7
; [then-branch: 1 | !(i@7@01 < n@3@01)]
(assert (not (< i@7@01 n@3@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 1 | i@7@01 < n@3@01]
(assert (< i@7@01 n@3@01))
; [eval] 0 <= j
(push) ; 8
; [then-branch: 2 | !(0 <= j@8@01) | live]
; [else-branch: 2 | 0 <= j@8@01 | live]
(push) ; 9
; [then-branch: 2 | !(0 <= j@8@01)]
(assert (not (<= 0 j@8@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 2 | 0 <= j@8@01]
(assert (<= 0 j@8@01))
; [eval] j < i
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@8@01) (not (<= 0 j@8@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@7@01 n@3@01)
  (and (< i@7@01 n@3@01) (or (<= 0 j@8@01) (not (<= 0 j@8@01))))))
(assert (or (< i@7@01 n@3@01) (not (< i@7@01 n@3@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@7@01)
  (and
    (<= 0 i@7@01)
    (=>
      (< i@7@01 n@3@01)
      (and (< i@7@01 n@3@01) (or (<= 0 j@8@01) (not (<= 0 j@8@01)))))
    (or (< i@7@01 n@3@01) (not (< i@7@01 n@3@01))))))
(assert (or (<= 0 i@7@01) (not (<= 0 i@7@01))))
(push) ; 4
; [then-branch: 3 | 0 <= i@7@01 && i@7@01 < n@3@01 && 0 <= j@8@01 && j@8@01 < i@7@01 | live]
; [else-branch: 3 | !(0 <= i@7@01 && i@7@01 < n@3@01 && 0 <= j@8@01 && j@8@01 < i@7@01) | live]
(push) ; 5
; [then-branch: 3 | 0 <= i@7@01 && i@7@01 < n@3@01 && 0 <= j@8@01 && j@8@01 < i@7@01]
(assert (and (<= 0 i@7@01) (and (< i@7@01 n@3@01) (and (<= 0 j@8@01) (< j@8@01 i@7@01)))))
; [eval] xs[idx00(i, j, j + 1, n)] == i + j
; [eval] xs[idx00(i, j, j + 1, n)]
; [eval] idx00(i, j, j + 1, n)
; [eval] j + 1
(push) ; 6
(assert (idx00%precondition $Snap.unit i@7@01 j@8@01 (+ j@8@01 1) n@3@01))
(pop) ; 6
; Joined path conditions
(assert (idx00%precondition $Snap.unit i@7@01 j@8@01 (+ j@8@01 1) n@3@01))
(push) ; 6
(assert (not (>= (idx00 $Snap.unit i@7@01 j@8@01 (+ j@8@01 1) n@3@01) 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< (idx00 $Snap.unit i@7@01 j@8@01 (+ j@8@01 1) n@3@01) (Seq_length xs@2@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] i + j
(pop) ; 5
(push) ; 5
; [else-branch: 3 | !(0 <= i@7@01 && i@7@01 < n@3@01 && 0 <= j@8@01 && j@8@01 < i@7@01)]
(assert (not
  (and
    (<= 0 i@7@01)
    (and (< i@7@01 n@3@01) (and (<= 0 j@8@01) (< j@8@01 i@7@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (<= 0 i@7@01)
    (and (< i@7@01 n@3@01) (and (<= 0 j@8@01) (< j@8@01 i@7@01))))
  (and
    (<= 0 i@7@01)
    (< i@7@01 n@3@01)
    (<= 0 j@8@01)
    (< j@8@01 i@7@01)
    (idx00%precondition $Snap.unit i@7@01 j@8@01 (+ j@8@01 1) n@3@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@7@01)
      (and (< i@7@01 n@3@01) (and (<= 0 j@8@01) (< j@8@01 i@7@01)))))
  (and
    (<= 0 i@7@01)
    (and (< i@7@01 n@3@01) (and (<= 0 j@8@01) (< j@8@01 i@7@01))))))
; [eval] xs[idx00(i, j, fresh__1, n)]
; [eval] idx00(i, j, fresh__1, n)
(push) ; 4
(assert (idx00%precondition $Snap.unit i@7@01 j@8@01 fresh__1@9@01 n@3@01))
(pop) ; 4
; Joined path conditions
(assert (idx00%precondition $Snap.unit i@7@01 j@8@01 fresh__1@9@01 n@3@01))
(push) ; 4
(assert (not (>= (idx00 $Snap.unit i@7@01 j@8@01 fresh__1@9@01 n@3@01) 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< (idx00 $Snap.unit i@7@01 j@8@01 fresh__1@9@01 n@3@01) (Seq_length xs@2@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (idx00%precondition $Snap.unit i@7@01 j@8@01 fresh__1@9@01 n@3@01))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@7@01 Int) (j@8@01 Int) (fresh__1@9@01 Int)) (!
  (and
    (=>
      (<= 0 i@7@01)
      (and
        (<= 0 i@7@01)
        (=>
          (< i@7@01 n@3@01)
          (and (< i@7@01 n@3@01) (or (<= 0 j@8@01) (not (<= 0 j@8@01)))))
        (or (< i@7@01 n@3@01) (not (< i@7@01 n@3@01)))))
    (or (<= 0 i@7@01) (not (<= 0 i@7@01)))
    (=>
      (and
        (<= 0 i@7@01)
        (and (< i@7@01 n@3@01) (and (<= 0 j@8@01) (< j@8@01 i@7@01))))
      (and
        (<= 0 i@7@01)
        (< i@7@01 n@3@01)
        (<= 0 j@8@01)
        (< j@8@01 i@7@01)
        (idx00%precondition $Snap.unit i@7@01 j@8@01 (+ j@8@01 1) n@3@01)))
    (or
      (not
        (and
          (<= 0 i@7@01)
          (and (< i@7@01 n@3@01) (and (<= 0 j@8@01) (< j@8@01 i@7@01)))))
      (and
        (<= 0 i@7@01)
        (and (< i@7@01 n@3@01) (and (<= 0 j@8@01) (< j@8@01 i@7@01)))))
    (idx00%precondition $Snap.unit i@7@01 j@8@01 fresh__1@9@01 n@3@01))
  :pattern ((Seq_index
    xs@2@01
    (idx00 $Snap.unit i@7@01 j@8@01 fresh__1@9@01 n@3@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0146.vpr@13@10@16@41-aux|)))
(assert (forall ((i@7@01 Int) (j@8@01 Int) (fresh__1@9@01 Int)) (!
  (=>
    (and
      (<= 0 i@7@01)
      (and (< i@7@01 n@3@01) (and (<= 0 j@8@01) (< j@8@01 i@7@01))))
    (=
      (Seq_index xs@2@01 (idx00 $Snap.unit i@7@01 j@8@01 (+ j@8@01 1) n@3@01))
      (+ i@7@01 j@8@01)))
  :pattern ((Seq_index
    xs@2@01
    (idx00 $Snap.unit i@7@01 j@8@01 fresh__1@9@01 n@3@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0146.vpr@13@10@16@41|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert xs[idx00(5, 2, 3, n)] == 7
; [eval] xs[idx00(5, 2, 3, n)] == 7
; [eval] xs[idx00(5, 2, 3, n)]
; [eval] idx00(5, 2, 3, n)
(set-option :timeout 0)
(push) ; 3
(assert (idx00%precondition $Snap.unit 5 2 3 n@3@01))
(pop) ; 3
; Joined path conditions
(assert (idx00%precondition $Snap.unit 5 2 3 n@3@01))
(push) ; 3
(assert (not (>= (idx00 $Snap.unit 5 2 3 n@3@01) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< (idx00 $Snap.unit 5 2 3 n@3@01) (Seq_length xs@2@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (= (Seq_index xs@2@01 (idx00 $Snap.unit 5 2 3 n@3@01)) 7)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Seq_index xs@2@01 (idx00 $Snap.unit 5 2 3 n@3@01)) 7))
(pop) ; 2
(pop) ; 1
