(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:01:14
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silver/0118.vpr
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
(declare-fun zip ($Snap Seq<$Ref> Seq<$Ref>) Seq<$Ref>)
(declare-fun zip%limited ($Snap Seq<$Ref> Seq<$Ref>) Seq<$Ref>)
(declare-fun zip%stateless (Seq<$Ref> Seq<$Ref>) Bool)
(declare-fun zip%precondition ($Snap Seq<$Ref> Seq<$Ref>) Bool)
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
(assert (forall ((s@$ $Snap) (xs@0@00 Seq<$Ref>) (ys@1@00 Seq<$Ref>)) (!
  (= (zip%limited s@$ xs@0@00 ys@1@00) (zip s@$ xs@0@00 ys@1@00))
  :pattern ((zip s@$ xs@0@00 ys@1@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (xs@0@00 Seq<$Ref>) (ys@1@00 Seq<$Ref>)) (!
  (zip%stateless xs@0@00 ys@1@00)
  :pattern ((zip%limited s@$ xs@0@00 ys@1@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (xs@0@00 Seq<$Ref>) (ys@1@00 Seq<$Ref>)) (!
  (=>
    (zip%precondition s@$ xs@0@00 ys@1@00)
    (=
      (zip s@$ xs@0@00 ys@1@00)
      (ite
        (Seq_equal ys@1@00 (as Seq_empty  Seq<$Ref>))
        xs@0@00
        (Seq_append
          (Seq_append
            (Seq_singleton (Seq_index xs@0@00 0))
            (Seq_singleton (Seq_index ys@1@00 0)))
          (zip%limited $Snap.unit (Seq_drop xs@0@00 1) (Seq_drop ys@1@00 1))))))
  :pattern ((zip s@$ xs@0@00 ys@1@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (xs@0@00 Seq<$Ref>) (ys@1@00 Seq<$Ref>)) (!
  (=>
    (zip%precondition s@$ xs@0@00 ys@1@00)
    (ite
      (Seq_equal ys@1@00 (as Seq_empty  Seq<$Ref>))
      true
      (zip%precondition $Snap.unit (Seq_drop xs@0@00 1) (Seq_drop ys@1@00 1))))
  :pattern ((zip s@$ xs@0@00 ys@1@00))
  :qid |quant-u-3|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test02 ----------
(declare-const xs@0@01 Seq<$Ref>)
(declare-const ys@1@01 Seq<$Ref>)
(declare-const x@2@01 $Ref)
(declare-const y@3@01 $Ref)
(declare-const xs@4@01 Seq<$Ref>)
(declare-const ys@5@01 Seq<$Ref>)
(declare-const x@6@01 $Ref)
(declare-const y@7@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@8@01 $Snap)
(assert (= $t@8@01 ($Snap.combine ($Snap.first $t@8@01) ($Snap.second $t@8@01))))
(assert (= ($Snap.first $t@8@01) $Snap.unit))
; [eval] xs == Seq(x)
; [eval] Seq(x)
(assert (= (Seq_length (Seq_singleton x@6@01)) 1))
(assert (Seq_equal xs@4@01 (Seq_singleton x@6@01)))
(assert (= ($Snap.second $t@8@01) $Snap.unit))
; [eval] ys == Seq(y)
; [eval] Seq(y)
(assert (= (Seq_length (Seq_singleton y@7@01)) 1))
(assert (Seq_equal ys@5@01 (Seq_singleton y@7@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@9@01 $Snap)
(assert (= $t@9@01 $Snap.unit))
; [eval] Seq(x, y) == zip(xs, ys)
; [eval] Seq(x, y)
(assert (= (Seq_length (Seq_append (Seq_singleton x@6@01) (Seq_singleton y@7@01))) 2))
; [eval] zip(xs, ys)
(push) ; 3
; [eval] |xs| == |ys| || |xs| == |ys| + 1
; [eval] |xs| == |ys|
; [eval] |xs|
; [eval] |ys|
(push) ; 4
; [then-branch: 0 | |xs@4@01| == |ys@5@01| | live]
; [else-branch: 0 | |xs@4@01| != |ys@5@01| | live]
(push) ; 5
; [then-branch: 0 | |xs@4@01| == |ys@5@01|]
(assert (= (Seq_length xs@4@01) (Seq_length ys@5@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | |xs@4@01| != |ys@5@01|]
(assert (not (= (Seq_length xs@4@01) (Seq_length ys@5@01))))
; [eval] |xs| == |ys| + 1
; [eval] |xs|
; [eval] |ys| + 1
; [eval] |ys|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (= (Seq_length xs@4@01) (Seq_length ys@5@01)))
  (= (Seq_length xs@4@01) (Seq_length ys@5@01))))
(push) ; 4
(assert (not (or
  (= (Seq_length xs@4@01) (Seq_length ys@5@01))
  (= (Seq_length xs@4@01) (+ (Seq_length ys@5@01) 1)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (or
  (= (Seq_length xs@4@01) (Seq_length ys@5@01))
  (= (Seq_length xs@4@01) (+ (Seq_length ys@5@01) 1))))
(assert (zip%precondition $Snap.unit xs@4@01 ys@5@01))
(pop) ; 3
; Joined path conditions
(assert (and
  (or
    (not (= (Seq_length xs@4@01) (Seq_length ys@5@01)))
    (= (Seq_length xs@4@01) (Seq_length ys@5@01)))
  (or
    (= (Seq_length xs@4@01) (Seq_length ys@5@01))
    (= (Seq_length xs@4@01) (+ (Seq_length ys@5@01) 1)))
  (zip%precondition $Snap.unit xs@4@01 ys@5@01)))
(assert (Seq_equal
  (Seq_append (Seq_singleton x@6@01) (Seq_singleton y@7@01))
  (zip $Snap.unit xs@4@01 ys@5@01)))
(pop) ; 2
(push) ; 2
; [eval] Seq(x, y) == zip(xs, ys)
; [eval] Seq(x, y)
(assert (= (Seq_length (Seq_append (Seq_singleton x@6@01) (Seq_singleton y@7@01))) 2))
; [eval] zip(xs, ys)
(push) ; 3
; [eval] |xs| == |ys| || |xs| == |ys| + 1
; [eval] |xs| == |ys|
; [eval] |xs|
; [eval] |ys|
(push) ; 4
; [then-branch: 1 | |xs@4@01| == |ys@5@01| | live]
; [else-branch: 1 | |xs@4@01| != |ys@5@01| | live]
(push) ; 5
; [then-branch: 1 | |xs@4@01| == |ys@5@01|]
(assert (= (Seq_length xs@4@01) (Seq_length ys@5@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 1 | |xs@4@01| != |ys@5@01|]
(assert (not (= (Seq_length xs@4@01) (Seq_length ys@5@01))))
; [eval] |xs| == |ys| + 1
; [eval] |xs|
; [eval] |ys| + 1
; [eval] |ys|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (= (Seq_length xs@4@01) (Seq_length ys@5@01)))
  (= (Seq_length xs@4@01) (Seq_length ys@5@01))))
(push) ; 4
(assert (not (or
  (= (Seq_length xs@4@01) (Seq_length ys@5@01))
  (= (Seq_length xs@4@01) (+ (Seq_length ys@5@01) 1)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (or
  (= (Seq_length xs@4@01) (Seq_length ys@5@01))
  (= (Seq_length xs@4@01) (+ (Seq_length ys@5@01) 1))))
(assert (zip%precondition $Snap.unit xs@4@01 ys@5@01))
(pop) ; 3
; Joined path conditions
(assert (and
  (or
    (not (= (Seq_length xs@4@01) (Seq_length ys@5@01)))
    (= (Seq_length xs@4@01) (Seq_length ys@5@01)))
  (or
    (= (Seq_length xs@4@01) (Seq_length ys@5@01))
    (= (Seq_length xs@4@01) (+ (Seq_length ys@5@01) 1)))
  (zip%precondition $Snap.unit xs@4@01 ys@5@01)))
(push) ; 3
(assert (not (Seq_equal
  (Seq_append (Seq_singleton x@6@01) (Seq_singleton y@7@01))
  (zip $Snap.unit xs@4@01 ys@5@01))))
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
; [eval] Seq(x, y) == zip(xs, ys)
; [eval] Seq(x, y)
; [eval] zip(xs, ys)
(set-option :timeout 0)
(push) ; 3
; [eval] |xs| == |ys| || |xs| == |ys| + 1
; [eval] |xs| == |ys|
; [eval] |xs|
; [eval] |ys|
(push) ; 4
; [then-branch: 2 | |xs@4@01| == |ys@5@01| | live]
; [else-branch: 2 | |xs@4@01| != |ys@5@01| | live]
(push) ; 5
; [then-branch: 2 | |xs@4@01| == |ys@5@01|]
(assert (= (Seq_length xs@4@01) (Seq_length ys@5@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 2 | |xs@4@01| != |ys@5@01|]
(assert (not (= (Seq_length xs@4@01) (Seq_length ys@5@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
; [eval] |xs| == |ys| + 1
; [eval] |xs|
; [eval] |ys| + 1
; [eval] |ys|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(pop) ; 3
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (Seq_equal
  (Seq_append (Seq_singleton x@6@01) (Seq_singleton y@7@01))
  (zip $Snap.unit xs@4@01 ys@5@01))))
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
; [eval] Seq(x, y) == zip(xs, ys)
; [eval] Seq(x, y)
; [eval] zip(xs, ys)
(set-option :timeout 0)
(push) ; 3
; [eval] |xs| == |ys| || |xs| == |ys| + 1
; [eval] |xs| == |ys|
; [eval] |xs|
; [eval] |ys|
(push) ; 4
; [then-branch: 3 | |xs@4@01| == |ys@5@01| | live]
; [else-branch: 3 | |xs@4@01| != |ys@5@01| | live]
(push) ; 5
; [then-branch: 3 | |xs@4@01| == |ys@5@01|]
(assert (= (Seq_length xs@4@01) (Seq_length ys@5@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 3 | |xs@4@01| != |ys@5@01|]
(assert (not (= (Seq_length xs@4@01) (Seq_length ys@5@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
; [eval] |xs| == |ys| + 1
; [eval] |xs|
; [eval] |ys| + 1
; [eval] |ys|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(pop) ; 3
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (Seq_equal
  (Seq_append (Seq_singleton x@6@01) (Seq_singleton y@7@01))
  (zip $Snap.unit xs@4@01 ys@5@01))))
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
; [eval] Seq(x, y) == zip(xs, ys)
; [eval] Seq(x, y)
; [eval] zip(xs, ys)
(set-option :timeout 0)
(push) ; 3
; [eval] |xs| == |ys| || |xs| == |ys| + 1
; [eval] |xs| == |ys|
; [eval] |xs|
; [eval] |ys|
(push) ; 4
; [then-branch: 4 | |xs@4@01| == |ys@5@01| | live]
; [else-branch: 4 | |xs@4@01| != |ys@5@01| | live]
(push) ; 5
; [then-branch: 4 | |xs@4@01| == |ys@5@01|]
(assert (= (Seq_length xs@4@01) (Seq_length ys@5@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 4 | |xs@4@01| != |ys@5@01|]
(assert (not (= (Seq_length xs@4@01) (Seq_length ys@5@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
; [eval] |xs| == |ys| + 1
; [eval] |xs|
; [eval] |ys| + 1
; [eval] |ys|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(pop) ; 3
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (Seq_equal
  (Seq_append (Seq_singleton x@6@01) (Seq_singleton y@7@01))
  (zip $Snap.unit xs@4@01 ys@5@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test01 ----------
(declare-const xs@10@01 Seq<$Ref>)
(declare-const ys@11@01 Seq<$Ref>)
(declare-const xs@12@01 Seq<$Ref>)
(declare-const ys@13@01 Seq<$Ref>)
(push) ; 1
(declare-const $t@14@01 $Snap)
(assert (= $t@14@01 $Snap.unit))
; [eval] |xs| == |ys| || |xs| == |ys| + 1
; [eval] |xs| == |ys|
; [eval] |xs|
; [eval] |ys|
(push) ; 2
; [then-branch: 5 | |xs@12@01| == |ys@13@01| | live]
; [else-branch: 5 | |xs@12@01| != |ys@13@01| | live]
(push) ; 3
; [then-branch: 5 | |xs@12@01| == |ys@13@01|]
(assert (= (Seq_length xs@12@01) (Seq_length ys@13@01)))
(pop) ; 3
(push) ; 3
; [else-branch: 5 | |xs@12@01| != |ys@13@01|]
(assert (not (= (Seq_length xs@12@01) (Seq_length ys@13@01))))
; [eval] |xs| == |ys| + 1
; [eval] |xs|
; [eval] |ys| + 1
; [eval] |ys|
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or
  (not (= (Seq_length xs@12@01) (Seq_length ys@13@01)))
  (= (Seq_length xs@12@01) (Seq_length ys@13@01))))
(assert (or
  (= (Seq_length xs@12@01) (Seq_length ys@13@01))
  (= (Seq_length xs@12@01) (+ (Seq_length ys@13@01) 1))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert zip(xs, ys) ==
;   (ys == Seq[Ref]() ? xs : Seq(xs[0], ys[0]) ++ zip(xs[1..], ys[1..]))
; [eval] zip(xs, ys) == (ys == Seq[Ref]() ? xs : Seq(xs[0], ys[0]) ++ zip(xs[1..], ys[1..]))
; [eval] zip(xs, ys)
(push) ; 3
; [eval] |xs| == |ys| || |xs| == |ys| + 1
; [eval] |xs| == |ys|
; [eval] |xs|
; [eval] |ys|
(push) ; 4
; [then-branch: 6 | |xs@12@01| == |ys@13@01| | live]
; [else-branch: 6 | |xs@12@01| != |ys@13@01| | live]
(push) ; 5
; [then-branch: 6 | |xs@12@01| == |ys@13@01|]
(assert (= (Seq_length xs@12@01) (Seq_length ys@13@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 6 | |xs@12@01| != |ys@13@01|]
(assert (not (= (Seq_length xs@12@01) (Seq_length ys@13@01))))
; [eval] |xs| == |ys| + 1
; [eval] |xs|
; [eval] |ys| + 1
; [eval] |ys|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (zip%precondition $Snap.unit xs@12@01 ys@13@01))
(pop) ; 3
; Joined path conditions
(assert (zip%precondition $Snap.unit xs@12@01 ys@13@01))
; [eval] (ys == Seq[Ref]() ? xs : Seq(xs[0], ys[0]) ++ zip(xs[1..], ys[1..]))
; [eval] ys == Seq[Ref]()
; [eval] Seq[Ref]()
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (Seq_equal ys@13@01 (as Seq_empty  Seq<$Ref>)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (Seq_equal ys@13@01 (as Seq_empty  Seq<$Ref>))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | ys@13@01 === Nil | live]
; [else-branch: 7 | !(ys@13@01 === Nil) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 7 | ys@13@01 === Nil]
(assert (Seq_equal ys@13@01 (as Seq_empty  Seq<$Ref>)))
(pop) ; 4
(push) ; 4
; [else-branch: 7 | !(ys@13@01 === Nil)]
(assert (not (Seq_equal ys@13@01 (as Seq_empty  Seq<$Ref>))))
; [eval] Seq(xs[0], ys[0]) ++ zip(xs[1..], ys[1..])
; [eval] Seq(xs[0], ys[0])
; [eval] xs[0]
(push) ; 5
(assert (not (< 0 (Seq_length xs@12@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] ys[0]
(push) ; 5
(assert (not (< 0 (Seq_length ys@13@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  (Seq_length
    (Seq_append
      (Seq_singleton (Seq_index xs@12@01 0))
      (Seq_singleton (Seq_index ys@13@01 0))))
  2))
; [eval] zip(xs[1..], ys[1..])
; [eval] xs[1..]
; [eval] ys[1..]
(push) ; 5
; [eval] |xs| == |ys| || |xs| == |ys| + 1
; [eval] |xs| == |ys|
; [eval] |xs|
; [eval] |ys|
(push) ; 6
; [then-branch: 8 | |xs@12@01[1:]| == |ys@13@01[1:]| | live]
; [else-branch: 8 | |xs@12@01[1:]| != |ys@13@01[1:]| | live]
(push) ; 7
; [then-branch: 8 | |xs@12@01[1:]| == |ys@13@01[1:]|]
(assert (= (Seq_length (Seq_drop xs@12@01 1)) (Seq_length (Seq_drop ys@13@01 1))))
(pop) ; 7
(push) ; 7
; [else-branch: 8 | |xs@12@01[1:]| != |ys@13@01[1:]|]
(assert (not (= (Seq_length (Seq_drop xs@12@01 1)) (Seq_length (Seq_drop ys@13@01 1)))))
; [eval] |xs| == |ys| + 1
; [eval] |xs|
; [eval] |ys| + 1
; [eval] |ys|
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (not (= (Seq_length (Seq_drop xs@12@01 1)) (Seq_length (Seq_drop ys@13@01 1))))
  (= (Seq_length (Seq_drop xs@12@01 1)) (Seq_length (Seq_drop ys@13@01 1)))))
(push) ; 6
(assert (not (or
  (= (Seq_length (Seq_drop xs@12@01 1)) (Seq_length (Seq_drop ys@13@01 1)))
  (= (Seq_length (Seq_drop xs@12@01 1)) (+ (Seq_length (Seq_drop ys@13@01 1)) 1)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (or
  (= (Seq_length (Seq_drop xs@12@01 1)) (Seq_length (Seq_drop ys@13@01 1)))
  (= (Seq_length (Seq_drop xs@12@01 1)) (+ (Seq_length (Seq_drop ys@13@01 1)) 1))))
(assert (zip%precondition $Snap.unit (Seq_drop xs@12@01 1) (Seq_drop ys@13@01 1)))
(pop) ; 5
; Joined path conditions
(assert (and
  (or
    (not
      (= (Seq_length (Seq_drop xs@12@01 1)) (Seq_length (Seq_drop ys@13@01 1))))
    (= (Seq_length (Seq_drop xs@12@01 1)) (Seq_length (Seq_drop ys@13@01 1))))
  (or
    (= (Seq_length (Seq_drop xs@12@01 1)) (Seq_length (Seq_drop ys@13@01 1)))
    (=
      (Seq_length (Seq_drop xs@12@01 1))
      (+ (Seq_length (Seq_drop ys@13@01 1)) 1)))
  (zip%precondition $Snap.unit (Seq_drop xs@12@01 1) (Seq_drop ys@13@01 1))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (Seq_equal ys@13@01 (as Seq_empty  Seq<$Ref>)))
  (and
    (not (Seq_equal ys@13@01 (as Seq_empty  Seq<$Ref>)))
    (=
      (Seq_length
        (Seq_append
          (Seq_singleton (Seq_index xs@12@01 0))
          (Seq_singleton (Seq_index ys@13@01 0))))
      2)
    (or
      (not
        (= (Seq_length (Seq_drop xs@12@01 1)) (Seq_length (Seq_drop ys@13@01 1))))
      (= (Seq_length (Seq_drop xs@12@01 1)) (Seq_length (Seq_drop ys@13@01 1))))
    (or
      (= (Seq_length (Seq_drop xs@12@01 1)) (Seq_length (Seq_drop ys@13@01 1)))
      (=
        (Seq_length (Seq_drop xs@12@01 1))
        (+ (Seq_length (Seq_drop ys@13@01 1)) 1)))
    (zip%precondition $Snap.unit (Seq_drop xs@12@01 1) (Seq_drop ys@13@01 1)))))
(assert (or
  (not (Seq_equal ys@13@01 (as Seq_empty  Seq<$Ref>)))
  (Seq_equal ys@13@01 (as Seq_empty  Seq<$Ref>))))
(push) ; 3
(assert (not (Seq_equal
  (zip $Snap.unit xs@12@01 ys@13@01)
  (ite
    (Seq_equal ys@13@01 (as Seq_empty  Seq<$Ref>))
    xs@12@01
    (Seq_append
      (Seq_append
        (Seq_singleton (Seq_index xs@12@01 0))
        (Seq_singleton (Seq_index ys@13@01 0)))
      (zip $Snap.unit (Seq_drop xs@12@01 1) (Seq_drop ys@13@01 1)))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (zip $Snap.unit xs@12@01 ys@13@01)
  (ite
    (Seq_equal ys@13@01 (as Seq_empty  Seq<$Ref>))
    xs@12@01
    (Seq_append
      (Seq_append
        (Seq_singleton (Seq_index xs@12@01 0))
        (Seq_singleton (Seq_index ys@13@01 0)))
      (zip $Snap.unit (Seq_drop xs@12@01 1) (Seq_drop ys@13@01 1))))))
(pop) ; 2
(pop) ; 1
