(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:26:05
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quasihavoc/havoc1.vpr
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
(declare-sort Seq<$Ref> 0)
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
(declare-fun $SortWrappers.Seq<$Ref>To$Snap (Seq<$Ref>) $Snap)
(declare-fun $SortWrappers.$SnapToSeq<$Ref> ($Snap) Seq<$Ref>)
(assert (forall ((x Seq<$Ref>)) (!
    (= x ($SortWrappers.$SnapToSeq<$Ref>($SortWrappers.Seq<$Ref>To$Snap x)))
    :pattern (($SortWrappers.Seq<$Ref>To$Snap x))
    :qid |$Snap.$SnapToSeq<$Ref>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Seq<$Ref>To$Snap($SortWrappers.$SnapToSeq<$Ref> x)))
    :pattern (($SortWrappers.$SnapToSeq<$Ref> x))
    :qid |$Snap.Seq<$Ref>To$SnapToSeq<$Ref>|
    )))
; ////////// Symbols
(declare-fun Seq_length (Seq<$Ref>) Int)
(declare-const Seq_empty Seq<$Ref>)
(declare-fun Seq_singleton ($Ref) Seq<$Ref>)
(declare-fun Seq_append (Seq<$Ref> Seq<$Ref>) Seq<$Ref>)
(declare-fun Seq_index (Seq<$Ref> Int) $Ref)
(declare-fun Seq_add (Int Int) Int)
(declare-fun Seq_sub (Int Int) Int)
(declare-fun Seq_update (Seq<$Ref> Int $Ref) Seq<$Ref>)
(declare-fun Seq_take (Seq<$Ref> Int) Seq<$Ref>)
(declare-fun Seq_drop (Seq<$Ref> Int) Seq<$Ref>)
(declare-fun Seq_contains (Seq<$Ref> $Ref) Bool)
(declare-fun Seq_contains_trigger (Seq<$Ref> $Ref) Bool)
(declare-fun Seq_skolem (Seq<$Ref> $Ref) Int)
(declare-fun Seq_equal (Seq<$Ref> Seq<$Ref>) Bool)
(declare-fun Seq_skolem_diff (Seq<$Ref> Seq<$Ref>) Int)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((s Seq<$Ref>)) (!
  (<= 0 (Seq_length s))
  :pattern ((Seq_length s))
  )))
(assert (= (Seq_length (as Seq_empty  Seq<$Ref>)) 0))
(assert (forall ((s Seq<$Ref>)) (!
  (=> (= (Seq_length s) 0) (= s (as Seq_empty  Seq<$Ref>)))
  :pattern ((Seq_length s))
  )))
(assert (forall ((e $Ref)) (!
  (= (Seq_length (Seq_singleton e)) 1)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<$Ref>) (s1 Seq<$Ref>)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<$Ref>)))
      (not (= s1 (as Seq_empty  Seq<$Ref>))))
    (= (Seq_length (Seq_append s0 s1)) (+ (Seq_length s0) (Seq_length s1))))
  :pattern ((Seq_length (Seq_append s0 s1)))
  )))
(assert (forall ((s0 Seq<$Ref>) (s1 Seq<$Ref>)) (!
  (and
    (=> (= s0 (as Seq_empty  Seq<$Ref>)) (= (Seq_append s0 s1) s1))
    (=> (= s1 (as Seq_empty  Seq<$Ref>)) (= (Seq_append s0 s1) s0)))
  :pattern ((Seq_append s0 s1))
  )))
(assert (forall ((e $Ref)) (!
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
(assert (forall ((s0 Seq<$Ref>) (s1 Seq<$Ref>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<$Ref>)))
      (and
        (not (= s1 (as Seq_empty  Seq<$Ref>)))
        (and (<= 0 n) (< n (Seq_length s0)))))
    (= (Seq_index (Seq_append s0 s1) n) (Seq_index s0 n)))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  :pattern ((Seq_index s0 n) (Seq_append s0 s1))
  )))
(assert (forall ((s0 Seq<$Ref>) (s1 Seq<$Ref>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<$Ref>)))
      (and
        (not (= s1 (as Seq_empty  Seq<$Ref>)))
        (and (<= (Seq_length s0) n) (< n (Seq_length (Seq_append s0 s1))))))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s0)) (Seq_length s0)) n)
      (=
        (Seq_index (Seq_append s0 s1) n)
        (Seq_index s1 (Seq_sub n (Seq_length s0))))))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  )))
(assert (forall ((s0 Seq<$Ref>) (s1 Seq<$Ref>) (m Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<$Ref>)))
      (and
        (not (= s1 (as Seq_empty  Seq<$Ref>)))
        (and (<= 0 m) (< m (Seq_length s1)))))
    (and
      (= (Seq_sub (Seq_add m (Seq_length s0)) (Seq_length s0)) m)
      (=
        (Seq_index (Seq_append s0 s1) (Seq_add m (Seq_length s0)))
        (Seq_index s1 m))))
  :pattern ((Seq_index s1 m) (Seq_append s0 s1))
  )))
(assert (forall ((s Seq<$Ref>) (i Int) (v $Ref)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (= (Seq_length (Seq_update s i v)) (Seq_length s)))
  :pattern ((Seq_length (Seq_update s i v)))
  :pattern ((Seq_length s) (Seq_update s i v))
  )))
(assert (forall ((s Seq<$Ref>) (i Int) (v $Ref) (n Int)) (!
  (=>
    (and (<= 0 n) (< n (Seq_length s)))
    (and
      (=> (= i n) (= (Seq_index (Seq_update s i v) n) v))
      (=> (not (= i n)) (= (Seq_index (Seq_update s i v) n) (Seq_index s n)))))
  :pattern ((Seq_index (Seq_update s i v) n))
  :pattern ((Seq_index s n) (Seq_update s i v))
  )))
(assert (forall ((s Seq<$Ref>) (n Int)) (!
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
(assert (forall ((s Seq<$Ref>) (n Int) (j Int)) (!
  (=>
    (and (<= 0 j) (and (< j n) (< j (Seq_length s))))
    (= (Seq_index (Seq_take s n) j) (Seq_index s j)))
  :pattern ((Seq_index (Seq_take s n) j))
  :pattern ((Seq_index s j) (Seq_take s n))
  )))
(assert (forall ((s Seq<$Ref>) (n Int)) (!
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
(assert (forall ((s Seq<$Ref>) (n Int) (j Int)) (!
  (=>
    (and (< 0 n) (and (<= 0 j) (< j (- (Seq_length s) n))))
    (and
      (= (Seq_sub (Seq_add j n) n) j)
      (= (Seq_index (Seq_drop s n) j) (Seq_index s (Seq_add j n)))))
  :pattern ((Seq_index (Seq_drop s n) j))
  )))
(assert (forall ((s Seq<$Ref>) (n Int) (i Int)) (!
  (=>
    (and (< 0 n) (and (<= n i) (< i (Seq_length s))))
    (and
      (= (Seq_add (Seq_sub i n) n) i)
      (= (Seq_index (Seq_drop s n) (Seq_sub i n)) (Seq_index s i))))
  :pattern ((Seq_drop s n) (Seq_index s i))
  )))
(assert (forall ((s Seq<$Ref>) (t Seq<$Ref>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_take (Seq_append s t) n) (Seq_take s n)))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<$Ref>) (t Seq<$Ref>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (=
        (Seq_take (Seq_append s t) n)
        (Seq_append s (Seq_take t (Seq_sub n (Seq_length s)))))))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<$Ref>) (t Seq<$Ref>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_drop (Seq_append s t) n) (Seq_append (Seq_drop s n) t)))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<$Ref>) (t Seq<$Ref>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (= (Seq_drop (Seq_append s t) n) (Seq_drop t (Seq_sub n (Seq_length s))))))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<$Ref>) (n Int)) (!
  (=> (<= n 0) (= (Seq_take s n) (as Seq_empty  Seq<$Ref>)))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<$Ref>) (n Int)) (!
  (=> (<= n 0) (= (Seq_drop s n) s))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<$Ref>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_take s n) s))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<$Ref>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_drop s n) (as Seq_empty  Seq<$Ref>)))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<$Ref>) (x $Ref)) (!
  (=>
    (Seq_contains s x)
    (and
      (<= 0 (Seq_skolem s x))
      (and
        (< (Seq_skolem s x) (Seq_length s))
        (= (Seq_index s (Seq_skolem s x)) x))))
  :pattern ((Seq_contains s x))
  )))
(assert (forall ((s Seq<$Ref>) (x $Ref) (i Int)) (!
  (=>
    (and (<= 0 i) (and (< i (Seq_length s)) (= (Seq_index s i) x)))
    (Seq_contains s x))
  :pattern ((Seq_contains s x) (Seq_index s i))
  )))
(assert (forall ((s Seq<$Ref>) (i Int)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (Seq_contains_trigger s (Seq_index s i)))
  :pattern ((Seq_index s i))
  )))
(assert (forall ((s0 Seq<$Ref>) (s1 Seq<$Ref>)) (!
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
(assert (forall ((a Seq<$Ref>) (b Seq<$Ref>)) (!
  (=> (Seq_equal a b) (= a b))
  :pattern ((Seq_equal a b))
  )))
(assert (forall ((x $Ref) (y $Ref)) (!
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
; ---------- foo1 ----------
(declare-const x@0@01 $Ref)
(declare-const y@1@01 $Ref)
(declare-const x@2@01 $Ref)
(declare-const y@3@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(assert (not (= x@2@01 $Ref.null)))
(assert (=
  ($Snap.second $t@4@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@4@01))
    ($Snap.second ($Snap.second $t@4@01)))))
(assert (= ($Snap.first ($Snap.second $t@4@01)) $Snap.unit))
; [eval] x.f == 3
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@4@01)) 3))
(assert (= ($Snap.second ($Snap.second $t@4@01)) $Snap.unit))
; [eval] x != y
(assert (not (= x@2@01 y@3@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; quasihavoc y.f
(declare-const $t@5@01 Int)
; [exec]
; assert x.f == 3
; [eval] x.f == 3
(push) ; 3
(assert (not (=
  (ite
    (= x@2@01 y@3@01)
    $t@5@01
    ($SortWrappers.$SnapToInt ($Snap.first $t@4@01)))
  3)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (ite
    (= x@2@01 y@3@01)
    $t@5@01
    ($SortWrappers.$SnapToInt ($Snap.first $t@4@01)))
  3))
(pop) ; 2
(pop) ; 1
; ---------- foo2 ----------
(declare-const x@6@01 $Ref)
(declare-const y@7@01 $Ref)
(declare-const x@8@01 $Ref)
(declare-const y@9@01 $Ref)
(push) ; 1
(declare-const $t@10@01 $Snap)
(assert (= $t@10@01 ($Snap.combine ($Snap.first $t@10@01) ($Snap.second $t@10@01))))
(assert (not (= x@8@01 $Ref.null)))
(assert (=
  ($Snap.second $t@10@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@10@01))
    ($Snap.second ($Snap.second $t@10@01)))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= x@8@01 y@9@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= y@9@01 $Ref.null)))
(assert (= ($Snap.second ($Snap.second $t@10@01)) $Snap.unit))
; [eval] x.f == 42
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@10@01)) 42))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; quasihavoc y.f
(declare-const $t@11@01 Int)
(declare-const $t@12@01 Int)
; [exec]
; assert x.f == 42
; [eval] x.f == 42
(push) ; 3
(assert (not (=
  (ite
    (= x@8@01 y@9@01)
    $t@11@01
    ($SortWrappers.$SnapToInt ($Snap.first $t@10@01)))
  42)))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@8@01 y@9@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    $t@12@01
    (ite
      (= x@8@01 y@9@01)
      $t@11@01
      ($SortWrappers.$SnapToInt ($Snap.first $t@10@01)))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    (ite
      (= x@8@01 y@9@01)
      $t@11@01
      ($SortWrappers.$SnapToInt ($Snap.first $t@10@01)))
    $t@12@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= y@9@01 x@8@01)) (not (= x@8@01 y@9@01))))
; [eval] x.f == 42
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (ite
    (= x@8@01 y@9@01)
    $t@11@01
    ($SortWrappers.$SnapToInt ($Snap.first $t@10@01)))
  42)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (ite
    (= x@8@01 y@9@01)
    $t@11@01
    ($SortWrappers.$SnapToInt ($Snap.first $t@10@01)))
  42))
(pop) ; 2
(pop) ; 1
; ---------- foo3 ----------
(declare-const x@13@01 $Ref)
(declare-const s@14@01 Seq<$Ref>)
(declare-const x@15@01 $Ref)
(declare-const s@16@01 Seq<$Ref>)
(push) ; 1
(declare-const $t@17@01 $Snap)
(assert (= $t@17@01 ($Snap.combine ($Snap.first $t@17@01) ($Snap.second $t@17@01))))
(assert (= ($Snap.first $t@17@01) $Snap.unit))
; [eval] |s| >= 1
; [eval] |s|
(assert (>= (Seq_length s@16@01) 1))
(assert (=
  ($Snap.second $t@17@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@17@01))
    ($Snap.second ($Snap.second $t@17@01)))))
; [eval] s[0]
(push) ; 2
(assert (not (< 0 (Seq_length s@16@01))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index s@16@01 0) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second $t@17@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@17@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@17@01))))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= (Seq_index s@16@01 0) x@15@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= x@15@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@17@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@17@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))
  $Snap.unit))
; [eval] x.f == 42
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@17@01))))
  42))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@17@01))))
  $Snap.unit))
; [eval] !((x in s))
; [eval] (x in s)
(assert (not (Seq_contains s@16@01 x@15@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; quasihavoc s[0].f
; [eval] s[0]
(push) ; 3
(assert (not (< 0 (Seq_length s@16@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const $t@18@01 Int)
(declare-const $t@19@01 Int)
; [exec]
; assert x.f == 42
; [eval] x.f == 42
(push) ; 3
(assert (not (=
  (ite
    (= x@15@01 (Seq_index s@16@01 0))
    $t@19@01
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@17@01)))))
  42)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (ite
    (= x@15@01 (Seq_index s@16@01 0))
    $t@19@01
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@17@01)))))
  42))
(pop) ; 2
(pop) ; 1
; ---------- foo4 ----------
(declare-const x@20@01 $Ref)
(declare-const y1@21@01 $Ref)
(declare-const y2@22@01 $Ref)
(declare-const x@23@01 $Ref)
(declare-const y1@24@01 $Ref)
(declare-const y2@25@01 $Ref)
(push) ; 1
(declare-const $t@26@01 $Snap)
(assert (= $t@26@01 ($Snap.combine ($Snap.first $t@26@01) ($Snap.second $t@26@01))))
(assert (not (= y1@24@01 $Ref.null)))
(assert (=
  ($Snap.second $t@26@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@26@01))
    ($Snap.second ($Snap.second $t@26@01)))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= y1@24@01 y2@25@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= y2@25@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second $t@26@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@26@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@26@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@26@01))) $Snap.unit))
; [eval] y1.f == 1
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@26@01)) 1))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@26@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@26@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@26@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@26@01))))
  $Snap.unit))
; [eval] y2.f == 2
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@26@01))) 2))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@26@01))))
  $Snap.unit))
; [eval] x == y1 || x == y2
; [eval] x == y1
(set-option :timeout 0)
(push) ; 2
; [then-branch: 0 | x@23@01 == y1@24@01 | live]
; [else-branch: 0 | x@23@01 != y1@24@01 | live]
(push) ; 3
; [then-branch: 0 | x@23@01 == y1@24@01]
(assert (= x@23@01 y1@24@01))
(pop) ; 3
(push) ; 3
; [else-branch: 0 | x@23@01 != y1@24@01]
(assert (not (= x@23@01 y1@24@01)))
; [eval] x == y2
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or (not (= x@23@01 y1@24@01)) (= x@23@01 y1@24@01)))
(assert (or (= x@23@01 y1@24@01) (= x@23@01 y2@25@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; quasihavoc x.f
(declare-const $t@27@01 Int)
(declare-const $t@28@01 Int)
; [exec]
; assert y1.f == 1 || y2.f == 2
; [eval] y1.f == 1 || y2.f == 2
; [eval] y1.f == 1
(push) ; 3
; [then-branch: 1 | (y1@24@01 == x@23@01 ? $t@27@01 : First:($t@26@01)) == 1 | live]
; [else-branch: 1 | (y1@24@01 == x@23@01 ? $t@27@01 : First:($t@26@01)) != 1 | live]
(push) ; 4
; [then-branch: 1 | (y1@24@01 == x@23@01 ? $t@27@01 : First:($t@26@01)) == 1]
(assert (=
  (ite
    (= y1@24@01 x@23@01)
    $t@27@01
    ($SortWrappers.$SnapToInt ($Snap.first $t@26@01)))
  1))
(pop) ; 4
(push) ; 4
; [else-branch: 1 | (y1@24@01 == x@23@01 ? $t@27@01 : First:($t@26@01)) != 1]
(assert (not
  (=
    (ite
      (= y1@24@01 x@23@01)
      $t@27@01
      ($SortWrappers.$SnapToInt ($Snap.first $t@26@01)))
    1)))
; [eval] y2.f == 2
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (=
      (ite
        (= y1@24@01 x@23@01)
        $t@27@01
        ($SortWrappers.$SnapToInt ($Snap.first $t@26@01)))
      1))
  (=
    (ite
      (= y1@24@01 x@23@01)
      $t@27@01
      ($SortWrappers.$SnapToInt ($Snap.first $t@26@01)))
    1)))
(push) ; 3
(assert (not (or
  (=
    (ite
      (= y1@24@01 x@23@01)
      $t@27@01
      ($SortWrappers.$SnapToInt ($Snap.first $t@26@01)))
    1)
  (=
    (ite
      (= y2@25@01 x@23@01)
      $t@28@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@26@01))))
    2))))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= y1@24@01 y2@25@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    (ite
      (= y2@25@01 x@23@01)
      $t@28@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@26@01))))
    (ite
      (= y1@24@01 x@23@01)
      $t@27@01
      ($SortWrappers.$SnapToInt ($Snap.first $t@26@01)))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    (ite
      (= y1@24@01 x@23@01)
      $t@27@01
      ($SortWrappers.$SnapToInt ($Snap.first $t@26@01)))
    (ite
      (= y2@25@01 x@23@01)
      $t@28@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@26@01))))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= y2@25@01 y1@24@01)) (not (= y1@24@01 y2@25@01))))
; [eval] y1.f == 1 || y2.f == 2
; [eval] y1.f == 1
(set-option :timeout 0)
(push) ; 3
; [then-branch: 2 | (y1@24@01 == x@23@01 ? $t@27@01 : First:($t@26@01)) == 1 | live]
; [else-branch: 2 | (y1@24@01 == x@23@01 ? $t@27@01 : First:($t@26@01)) != 1 | live]
(push) ; 4
; [then-branch: 2 | (y1@24@01 == x@23@01 ? $t@27@01 : First:($t@26@01)) == 1]
(assert (=
  (ite
    (= y1@24@01 x@23@01)
    $t@27@01
    ($SortWrappers.$SnapToInt ($Snap.first $t@26@01)))
  1))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= y2@25@01 y1@24@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    (ite
      (= y1@24@01 x@23@01)
      $t@27@01
      ($SortWrappers.$SnapToInt ($Snap.first $t@26@01)))
    (ite
      (= y2@25@01 x@23@01)
      $t@28@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@26@01))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    (ite
      (= y2@25@01 x@23@01)
      $t@28@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@26@01))))
    (ite
      (= y1@24@01 x@23@01)
      $t@27@01
      ($SortWrappers.$SnapToInt ($Snap.first $t@26@01)))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= y1@24@01 y2@25@01)) (not (= y2@25@01 y1@24@01))))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 2 | (y1@24@01 == x@23@01 ? $t@27@01 : First:($t@26@01)) != 1]
(assert (not
  (=
    (ite
      (= y1@24@01 x@23@01)
      $t@27@01
      ($SortWrappers.$SnapToInt ($Snap.first $t@26@01)))
    1)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= y2@25@01 y1@24@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    (ite
      (= y1@24@01 x@23@01)
      $t@27@01
      ($SortWrappers.$SnapToInt ($Snap.first $t@26@01)))
    (ite
      (= y2@25@01 x@23@01)
      $t@28@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@26@01))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    (ite
      (= y2@25@01 x@23@01)
      $t@28@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@26@01))))
    (ite
      (= y1@24@01 x@23@01)
      $t@27@01
      ($SortWrappers.$SnapToInt ($Snap.first $t@26@01)))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= y1@24@01 y2@25@01)) (not (= y2@25@01 y1@24@01))))
; [eval] y2.f == 2
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (=
    (ite
      (= y1@24@01 x@23@01)
      $t@27@01
      ($SortWrappers.$SnapToInt ($Snap.first $t@26@01)))
    1)
  (and
    (=
      (ite
        (= y1@24@01 x@23@01)
        $t@27@01
        ($SortWrappers.$SnapToInt ($Snap.first $t@26@01)))
      1)
    (not (= y1@24@01 y2@25@01))
    (not (= y2@25@01 y1@24@01)))))
; Joined path conditions
(assert (=>
  (not
    (=
      (ite
        (= y1@24@01 x@23@01)
        $t@27@01
        ($SortWrappers.$SnapToInt ($Snap.first $t@26@01)))
      1))
  (and
    (not
      (=
        (ite
          (= y1@24@01 x@23@01)
          $t@27@01
          ($SortWrappers.$SnapToInt ($Snap.first $t@26@01)))
        1))
    (not (= y1@24@01 y2@25@01))
    (not (= y2@25@01 y1@24@01)))))
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (=
    (ite
      (= y1@24@01 x@23@01)
      $t@27@01
      ($SortWrappers.$SnapToInt ($Snap.first $t@26@01)))
    1)
  (=
    (ite
      (= y2@25@01 x@23@01)
      $t@28@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@26@01))))
    2))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (or
  (=
    (ite
      (= y1@24@01 x@23@01)
      $t@27@01
      ($SortWrappers.$SnapToInt ($Snap.first $t@26@01)))
    1)
  (=
    (ite
      (= y2@25@01 x@23@01)
      $t@28@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@26@01))))
    2)))
; [eval] x == y1
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= x@23@01 y1@24@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@23@01 y1@24@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | x@23@01 == y1@24@01 | live]
; [else-branch: 3 | x@23@01 != y1@24@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 3 | x@23@01 == y1@24@01]
(assert (= x@23@01 y1@24@01))
; [exec]
; assert y2.f == 2
; [eval] y2.f == 2
(push) ; 4
(assert (not (=
  (ite
    (= y2@25@01 x@23@01)
    $t@28@01
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@26@01))))
  2)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  (ite
    (= y2@25@01 x@23@01)
    $t@28@01
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@26@01))))
  2))
(pop) ; 3
(push) ; 3
; [else-branch: 3 | x@23@01 != y1@24@01]
(assert (not (= x@23@01 y1@24@01)))
(pop) ; 3
; [eval] !(x == y1)
; [eval] x == y1
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@23@01 y1@24@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= x@23@01 y1@24@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | x@23@01 != y1@24@01 | live]
; [else-branch: 4 | x@23@01 == y1@24@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 4 | x@23@01 != y1@24@01]
(assert (not (= x@23@01 y1@24@01)))
; [exec]
; assert y1.f == 1
; [eval] y1.f == 1
(push) ; 4
(assert (not (=
  (ite
    (= y1@24@01 x@23@01)
    $t@27@01
    ($SortWrappers.$SnapToInt ($Snap.first $t@26@01)))
  1)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  (ite
    (= y1@24@01 x@23@01)
    $t@27@01
    ($SortWrappers.$SnapToInt ($Snap.first $t@26@01)))
  1))
(pop) ; 3
(push) ; 3
; [else-branch: 4 | x@23@01 == y1@24@01]
(assert (= x@23@01 y1@24@01))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- foo5 ----------
(declare-const x@29@01 $Ref)
(declare-const x@30@01 $Ref)
(push) ; 1
(declare-const $t@31@01 $Snap)
(assert (= $t@31@01 ($Snap.combine ($Snap.first $t@31@01) ($Snap.second $t@31@01))))
(assert (not (= x@30@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; quasihavoc x.b1
(declare-const $t@32@01 Bool)
; [exec]
; quasihavoc x.b2
(declare-const $t@33@01 Bool)
; [exec]
; assert x.b1 == x.b2 || x.b1 == !x.b2
; [eval] x.b1 == x.b2 || x.b1 == !x.b2
; [eval] x.b1 == x.b2
(push) ; 3
; [then-branch: 5 | $t@32@01 == $t@33@01 | live]
; [else-branch: 5 | $t@32@01 != $t@33@01 | live]
(push) ; 4
; [then-branch: 5 | $t@32@01 == $t@33@01]
(assert (= $t@32@01 $t@33@01))
(pop) ; 4
(push) ; 4
; [else-branch: 5 | $t@32@01 != $t@33@01]
(assert (not (= $t@32@01 $t@33@01)))
; [eval] x.b1 == !x.b2
; [eval] !x.b2
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not (= $t@32@01 $t@33@01)) (= $t@32@01 $t@33@01)))
(push) ; 3
(assert (not (or (= $t@32@01 $t@33@01) (= $t@32@01 (not $t@33@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (or (= $t@32@01 $t@33@01) (= $t@32@01 (not $t@33@01))))
(pop) ; 2
(pop) ; 1
