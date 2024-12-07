(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:10:30
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/examples/tree-delete-min/tree_delete_min.vpr
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
(declare-fun MWSF_apply ($MWSF $Snap) $Snap)
; Declaring symbols related to program functions (from program analysis)
(declare-fun val ($Snap $Ref) Int)
(declare-fun val%limited ($Snap $Ref) Int)
(declare-fun val%stateless ($Ref) Bool)
(declare-fun val%precondition ($Snap $Ref) Bool)
(declare-fun vals ($Snap $Ref) Seq<Int>)
(declare-fun vals%limited ($Snap $Ref) Seq<Int>)
(declare-fun vals%stateless ($Ref) Bool)
(declare-fun vals%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
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
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (= (val%limited s@$ x@0@00) (val s@$ x@0@00))
  :pattern ((val s@$ x@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (val%stateless x@0@00)
  :pattern ((val%limited s@$ x@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (=>
    (val%precondition s@$ x@0@00)
    (=
      (val s@$ x@0@00)
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))))
  :pattern ((val s@$ x@0@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  true
  :pattern ((val s@$ x@0@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  (= (vals%limited s@$ x@2@00) (vals s@$ x@2@00))
  :pattern ((vals s@$ x@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  (vals%stateless x@2@00)
  :pattern ((vals%limited s@$ x@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  (=>
    (vals%precondition s@$ x@2@00)
    (=
      (vals s@$ x@2@00)
      (ite
        (= x@2@00 $Ref.null)
        (as Seq_empty  Seq<Int>)
        (Seq_append
          (Seq_append
            (vals%limited ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
            (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first s@$))))
          (vals%limited ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))))))))
  :pattern ((vals s@$ x@2@00))
  :pattern ((vals%stateless x@2@00) (Tree%trigger s@$ x@2@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  (=>
    (vals%precondition s@$ x@2@00)
    (ite
      (= x@2@00 $Ref.null)
      true
      (and
        (vals%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
        (vals%precondition ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
  :pattern ((vals s@$ x@2@00))
  :qid |quant-u-7|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- tree_delete_min ----------
(declare-const x@0@01 $Ref)
(declare-const z@1@01 $Ref)
(declare-const x@2@01 $Ref)
(declare-const z@3@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(assert (= ($Snap.first $t@4@01) $Snap.unit))
; [eval] x != null
(assert (not (= x@2@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@5@01 $Snap)
(assert (= $t@5@01 ($Snap.combine ($Snap.first $t@5@01) ($Snap.second $t@5@01))))
(assert (= ($Snap.second $t@5@01) $Snap.unit))
; [eval] vals(z) == old(vals(x))[1..]
; [eval] vals(z)
(push) ; 3
(assert (vals%precondition ($Snap.first $t@5@01) z@3@01))
(pop) ; 3
; Joined path conditions
(assert (vals%precondition ($Snap.first $t@5@01) z@3@01))
; [eval] old(vals(x))[1..]
; [eval] old(vals(x))
; [eval] vals(x)
(push) ; 3
(assert (vals%precondition ($Snap.second $t@4@01) x@2@01))
(pop) ; 3
; Joined path conditions
(assert (vals%precondition ($Snap.second $t@4@01) x@2@01))
(assert (Seq_equal
  (vals ($Snap.first $t@5@01) z@3@01)
  (Seq_drop (vals ($Snap.second $t@4@01) x@2@01) 1)))
(pop) ; 2
(push) ; 2
; [exec]
; var p: Ref
(declare-const p@6@01 $Ref)
; [exec]
; var plvs: Seq[Int]
(declare-const plvs@7@01 Seq<Int>)
; [exec]
; p := x
; [exec]
; unfold acc(Tree(p), write)
; [eval] x == null
; [then-branch: 0 | x@2@01 == Null | dead]
; [else-branch: 0 | x@2@01 != Null | live]
(push) ; 3
; [else-branch: 0 | x@2@01 != Null]
(assert (=
  ($Snap.second $t@4@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@4@01))
    ($Snap.second ($Snap.second $t@4@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@4@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@4@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))))
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Tree%trigger ($Snap.second $t@4@01) x@2@01))
; [exec]
; plvs := vals(p.l)
; [eval] vals(p.l)
(set-option :timeout 0)
(push) ; 4
(assert (vals%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))
(pop) ; 4
; Joined path conditions
(assert (vals%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))
(declare-const plvs@8@01 Seq<Int>)
(assert (=
  plvs@8@01
  (vals ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))
; [eval] p.l == null
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | First:(Second:(Second:($t@4@01))) == Null | live]
; [else-branch: 1 | First:(Second:(Second:($t@4@01))) != Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 1 | First:(Second:(Second:($t@4@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))
  $Ref.null))
; [exec]
; z := p.r
(declare-const z@9@01 $Ref)
(assert (=
  z@9@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))))
; [exec]
; assert vals(x.l) == Seq[Int]()
; [eval] vals(x.l) == Seq[Int]()
; [eval] vals(x.l)
(push) ; 5
(pop) ; 5
; Joined path conditions
; [eval] Seq[Int]()
(push) ; 5
(assert (not (Seq_equal
  (vals ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
  (as Seq_empty  Seq<Int>))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (vals ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
  (as Seq_empty  Seq<Int>)))
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))
  z@9@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] vals(z) == old(vals(x))[1..]
; [eval] vals(z)
(set-option :timeout 0)
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))
  z@9@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (vals%precondition ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) z@9@01))
(pop) ; 5
; Joined path conditions
(assert (vals%precondition ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) z@9@01))
; [eval] old(vals(x))[1..]
; [eval] old(vals(x))
; [eval] vals(x)
(set-option :timeout 0)
(push) ; 5
(assert (vals%precondition ($Snap.second $t@4@01) x@2@01))
(pop) ; 5
; Joined path conditions
(assert (vals%precondition ($Snap.second $t@4@01) x@2@01))
(push) ; 5
(assert (not (Seq_equal
  (vals ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) z@9@01)
  (Seq_drop (vals ($Snap.second $t@4@01) x@2@01) 1))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (vals ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) z@9@01)
  (Seq_drop (vals ($Snap.second $t@4@01) x@2@01) 1)))
(pop) ; 4
(push) ; 4
; [else-branch: 1 | First:(Second:(Second:($t@4@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))
    $Ref.null)))
(pop) ; 4
; [eval] !(p.l == null)
; [eval] p.l == null
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | First:(Second:(Second:($t@4@01))) != Null | live]
; [else-branch: 2 | First:(Second:(Second:($t@4@01))) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 2 | First:(Second:(Second:($t@4@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))
    $Ref.null)))
; [exec]
; package acc(p.l, write) &&
; (acc(Tree(p.l), write) && vals(p.l) == plvs[1..]) --*
; acc(Tree(x), write) && vals(x) == old(vals(x))[1..] {
;   fold acc(Tree(p), write)
; }
(push) ; 5
(declare-const $t@10@01 $Snap)
(assert (= $t@10@01 ($Snap.combine ($Snap.first $t@10@01) ($Snap.second $t@10@01))))
(assert (=
  ($Snap.second $t@10@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@10@01))
    ($Snap.second ($Snap.second $t@10@01)))))
(assert (= ($Snap.second ($Snap.second $t@10@01)) $Snap.unit))
; [eval] vals(p.l) == plvs[1..]
; [eval] vals(p.l)
(push) ; 6
(assert (vals%precondition ($Snap.first ($Snap.second $t@10@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@10@01))))
(pop) ; 6
; Joined path conditions
(assert (vals%precondition ($Snap.first ($Snap.second $t@10@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@10@01))))
; [eval] plvs[1..]
(assert (Seq_equal
  (vals ($Snap.first ($Snap.second $t@10@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@10@01)))
  (Seq_drop plvs@8@01 1)))
; [exec]
; fold acc(Tree(p), write)
; [eval] x == null
; [then-branch: 3 | x@2@01 == Null | dead]
; [else-branch: 3 | x@2@01 != Null | live]
(push) ; 6
; [else-branch: 3 | x@2@01 != Null]
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,01s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first $t@10@01))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (Tree%trigger ($Snap.combine
  ($Snap.first ($Snap.second $t@4@01))
  ($Snap.combine
    ($Snap.first $t@10@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@10@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))))) x@2@01))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; [eval] vals(x) == old(vals(x))[1..]
; [eval] vals(x)
(set-option :timeout 0)
(push) ; 7
(assert (vals%precondition ($Snap.combine
  ($Snap.first ($Snap.second $t@4@01))
  ($Snap.combine
    ($Snap.first $t@10@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@10@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))))) x@2@01))
(pop) ; 7
; Joined path conditions
(assert (vals%precondition ($Snap.combine
  ($Snap.first ($Snap.second $t@4@01))
  ($Snap.combine
    ($Snap.first $t@10@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@10@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))))) x@2@01))
; [eval] old(vals(x))[1..]
; [eval] old(vals(x))
; [eval] vals(x)
(push) ; 7
(assert (vals%precondition ($Snap.second $t@4@01) x@2@01))
(pop) ; 7
; Joined path conditions
(assert (vals%precondition ($Snap.second $t@4@01) x@2@01))
(push) ; 7
(assert (not (Seq_equal
  (vals ($Snap.combine
    ($Snap.first ($Snap.second $t@4@01))
    ($Snap.combine
      ($Snap.first $t@10@01)
      ($Snap.combine
        ($Snap.first ($Snap.second $t@10@01))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))))) x@2@01)
  (Seq_drop (vals ($Snap.second $t@4@01) x@2@01) 1))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (vals ($Snap.combine
    ($Snap.first ($Snap.second $t@4@01))
    ($Snap.combine
      ($Snap.first $t@10@01)
      ($Snap.combine
        ($Snap.first ($Snap.second $t@10@01))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))))) x@2@01)
  (Seq_drop (vals ($Snap.second $t@4@01) x@2@01) 1)))
; Create MagicWandSnapFunction for wand acc(p.l, write) && (acc(Tree(p.l), write) && vals(p.l) == plvs[1..]) --* acc(Tree(x), write) && vals(x) == old(vals(x))[1..]
(declare-const mwsf@11@01 $MWSF)
(assert (forall (($t@10@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@11@01 $t@10@01)
    ($Snap.combine
      ($Snap.combine
        ($Snap.first ($Snap.second $t@4@01))
        ($Snap.combine
          ($Snap.first $t@10@01)
          ($Snap.combine
            ($Snap.first ($Snap.second $t@10@01))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))
              ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))))))
      $Snap.unit))
  :pattern ((MWSF_apply mwsf@11@01 $t@10@01))
  :qid |quant-u-8|)))
; [eval] plvs[1..]
; [eval] old(vals(x))[1..]
; [eval] old(vals(x))
; [eval] vals(x)
(push) ; 7
(pop) ; 7
; Joined path conditions
(pop) ; 6
(pop) ; 5
(push) ; 5
(assert (and
  (not (= x@2@01 $Ref.null))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))
      $Ref.null))))
(assert (forall (($t@10@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@11@01 $t@10@01)
    ($Snap.combine
      ($Snap.combine
        ($Snap.first ($Snap.second $t@4@01))
        ($Snap.combine
          ($Snap.first $t@10@01)
          ($Snap.combine
            ($Snap.first ($Snap.second $t@10@01))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))
              ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))))))
      $Snap.unit))
  :pattern ((MWSF_apply mwsf@11@01 $t@10@01))
  :qid |quant-u-9|)))
(assert true)
(declare-const oldP@12@01 $Ref)
(declare-const oldPlvs@13@01 Seq<Int>)
(declare-const p@14@01 $Ref)
(declare-const plvs@15@01 Seq<Int>)
(push) ; 6
; Loop head block: Check well-definedness of invariant
(declare-const $t@16@01 $Snap)
(assert (= $t@16@01 ($Snap.combine ($Snap.first $t@16@01) ($Snap.second $t@16@01))))
(assert (= ($Snap.first $t@16@01) $Snap.unit))
; [eval] p != null
(assert (not (= p@14@01 $Ref.null)))
(assert (=
  ($Snap.second $t@16@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@16@01))
    ($Snap.second ($Snap.second $t@16@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@16@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@16@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@16@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@16@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@16@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@16@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@16@01))))
  $Snap.unit))
; [eval] p.l != null
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@16@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@16@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@16@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@16@01)))))
  $Snap.unit))
; [eval] plvs == vals(p.l)
; [eval] vals(p.l)
(push) ; 7
(assert (vals%precondition ($Snap.first ($Snap.second ($Snap.second $t@16@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01)))))
(pop) ; 7
; Joined path conditions
(assert (vals%precondition ($Snap.first ($Snap.second ($Snap.second $t@16@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01)))))
(assert (Seq_equal
  plvs@15@01
  (vals ($Snap.first ($Snap.second ($Snap.second $t@16@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))))))
; [eval] plvs[1..]
; [eval] old(vals(x))[1..]
; [eval] old(vals(x))
; [eval] vals(x)
(push) ; 7
(assert (vals%precondition ($Snap.second $t@4@01) x@2@01))
(pop) ; 7
; Joined path conditions
(assert (vals%precondition ($Snap.second $t@4@01) x@2@01))
(pop) ; 6
(push) ; 6
; Loop head block: Establish invariant
; [eval] p != null
; [eval] p.l != null
; [eval] plvs == vals(p.l)
; [eval] vals(p.l)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(assert (not (Seq_equal
  plvs@8@01
  (vals ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  plvs@8@01
  (vals ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))
; [eval] plvs[1..]
; [eval] old(vals(x))[1..]
; [eval] old(vals(x))
; [eval] vals(x)
(push) ; 7
(assert (vals%precondition ($Snap.second $t@4@01) x@2@01))
(pop) ; 7
; Joined path conditions
(assert (vals%precondition ($Snap.second $t@4@01) x@2@01))
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 7
(assert (= $t@16@01 ($Snap.combine ($Snap.first $t@16@01) ($Snap.second $t@16@01))))
(assert (= ($Snap.first $t@16@01) $Snap.unit))
(assert (not (= p@14@01 $Ref.null)))
(assert (=
  ($Snap.second $t@16@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@16@01))
    ($Snap.second ($Snap.second $t@16@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@16@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@16@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@16@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@16@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@16@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@16@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@16@01))))
  $Snap.unit))
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@16@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@16@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@16@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@16@01)))))
  $Snap.unit))
(assert (vals%precondition ($Snap.first ($Snap.second ($Snap.second $t@16@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01)))))
(assert (Seq_equal
  plvs@15@01
  (vals ($Snap.first ($Snap.second ($Snap.second $t@16@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 8
; [eval] (unfolding acc(Tree(p.l), write) in p.l.l != null)
(push) ; 9
(assert (Tree%trigger ($Snap.first ($Snap.second ($Snap.second $t@16@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01)))))
; [eval] x == null
; [then-branch: 4 | First:(Second:($t@16@01)) == Null | dead]
; [else-branch: 4 | First:(Second:($t@16@01)) != Null | live]
(push) ; 10
; [else-branch: 4 | First:(Second:($t@16@01)) != Null]
(assert (=
  ($Snap.first ($Snap.second ($Snap.second $t@16@01)))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@16@01))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))))
(push) ; 11
(set-option :timeout 10)
(assert (not (= p@14@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))))))
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [eval] p.l.l != null
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (Tree%trigger ($Snap.first ($Snap.second ($Snap.second $t@16@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01)))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01)))
      $Ref.null))
  (and
    (=
      ($Snap.first ($Snap.second ($Snap.second $t@16@01)))
      ($Snap.combine
        ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@16@01))))
        ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
    (=
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))
        ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))))))))
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [eval] !(unfolding acc(Tree(p.l), write) in p.l.l != null)
; [eval] (unfolding acc(Tree(p.l), write) in p.l.l != null)
(push) ; 9
(assert (Tree%trigger ($Snap.first ($Snap.second ($Snap.second $t@16@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01)))))
; [eval] x == null
; [then-branch: 5 | First:(Second:($t@16@01)) == Null | dead]
; [else-branch: 5 | First:(Second:($t@16@01)) != Null | live]
(push) ; 10
; [else-branch: 5 | First:(Second:($t@16@01)) != Null]
(assert (=
  ($Snap.first ($Snap.second ($Snap.second $t@16@01)))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@16@01))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))))
(push) ; 11
(set-option :timeout 10)
(assert (not (= p@14@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))))))
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [eval] p.l.l != null
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (Tree%trigger ($Snap.first ($Snap.second ($Snap.second $t@16@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01)))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01)))
      $Ref.null))
  (and
    (=
      ($Snap.first ($Snap.second ($Snap.second $t@16@01)))
      ($Snap.combine
        ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@16@01))))
        ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
    (=
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))
        ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))))))))
(pop) ; 8
; Loop head block: Follow loop-internal edges
; [eval] (unfolding acc(Tree(p.l), write) in p.l.l != null)
(set-option :timeout 0)
(push) ; 8
(assert (Tree%trigger ($Snap.first ($Snap.second ($Snap.second $t@16@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01)))))
; [eval] x == null
; [then-branch: 6 | First:(Second:($t@16@01)) == Null | dead]
; [else-branch: 6 | First:(Second:($t@16@01)) != Null | live]
(push) ; 9
; [else-branch: 6 | First:(Second:($t@16@01)) != Null]
(assert (=
  ($Snap.first ($Snap.second ($Snap.second $t@16@01)))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@16@01))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))))
(push) ; 10
(set-option :timeout 10)
(assert (not (= p@14@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))))))
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [eval] p.l.l != null
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (Tree%trigger ($Snap.first ($Snap.second ($Snap.second $t@16@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01)))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01)))
      $Ref.null))
  (and
    (=
      ($Snap.first ($Snap.second ($Snap.second $t@16@01)))
      ($Snap.combine
        ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@16@01))))
        ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
    (=
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))
        ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))))))))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | First:(Second:(First:(Second:(Second:($t@16@01))))) != Null | live]
; [else-branch: 7 | First:(Second:(First:(Second:(Second:($t@16@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 7 | First:(Second:(First:(Second:(Second:($t@16@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
    $Ref.null)))
; [exec]
; var oldP: Ref
(declare-const oldP@17@01 $Ref)
; [exec]
; var oldPlvs: Seq[Int]
(declare-const oldPlvs@18@01 Seq<Int>)
; [exec]
; oldP := p
; [exec]
; oldPlvs := plvs
; [exec]
; unfold acc(Tree(p.l), write)
; [eval] x == null
; [then-branch: 8 | First:(Second:($t@16@01)) == Null | dead]
; [else-branch: 8 | First:(Second:($t@16@01)) != Null | live]
(push) ; 9
; [else-branch: 8 | First:(Second:($t@16@01)) != Null]
(assert (=
  ($Snap.first ($Snap.second ($Snap.second $t@16@01)))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@16@01))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))))
(push) ; 10
(set-option :timeout 10)
(assert (not (= p@14@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))))))
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; p := p.l
(declare-const p@19@01 $Ref)
(assert (= p@19@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01)))))
; [exec]
; plvs := vals(p.l)
; [eval] vals(p.l)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))) p@19@01)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(assert (vals%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))))
(pop) ; 10
; Joined path conditions
(assert (vals%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))))
(declare-const plvs@20@01 Seq<Int>)
(assert (=
  plvs@20@01
  (vals ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))))
; [exec]
; package acc(p.l, write) &&
; (acc(Tree(p.l), write) && vals(p.l) == plvs[1..]) --*
; acc(Tree(x), write) && vals(x) == old(vals(x))[1..] {
;   fold acc(Tree(p), write)
;   apply acc(oldP.l, write) &&
;     (acc(Tree(oldP.l), write) && vals(oldP.l) == oldPlvs[1..]) --*
;     acc(Tree(x), write) && vals(x) == old(vals(x))[1..]
; }
(push) ; 10
(declare-const $t@21@01 $Snap)
(assert (= $t@21@01 ($Snap.combine ($Snap.first $t@21@01) ($Snap.second $t@21@01))))
(assert (not (= p@19@01 $Ref.null)))
(assert (=
  ($Snap.second $t@21@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@21@01))
    ($Snap.second ($Snap.second $t@21@01)))))
(assert (= ($Snap.second ($Snap.second $t@21@01)) $Snap.unit))
; [eval] vals(p.l) == plvs[1..]
; [eval] vals(p.l)
(push) ; 11
(assert (vals%precondition ($Snap.first ($Snap.second $t@21@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@21@01))))
(pop) ; 11
; Joined path conditions
(assert (vals%precondition ($Snap.first ($Snap.second $t@21@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@21@01))))
; [eval] plvs[1..]
(assert (Seq_equal
  (vals ($Snap.first ($Snap.second $t@21@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@21@01)))
  (Seq_drop plvs@20@01 1)))
; [exec]
; fold acc(Tree(p), write)
; [eval] x == null
; [then-branch: 9 | p@19@01 == Null | dead]
; [else-branch: 9 | p@19@01 != Null | live]
(push) ; 11
; [else-branch: 9 | p@19@01 != Null]
(push) ; 12
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 12
; 0,01s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))) p@19@01)))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))) p@19@01)))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))) p@19@01)))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first $t@21@01))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))))))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(assert (Tree%trigger ($Snap.combine
  ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@16@01))))
  ($Snap.combine
    ($Snap.first $t@21@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@21@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))))))) p@19@01))
; [exec]
; apply acc(oldP.l, write) &&
;   (acc(Tree(oldP.l), write) && vals(oldP.l) == oldPlvs[1..]) --*
;   acc(Tree(x), write) && vals(x) == old(vals(x))[1..]
; [eval] oldPlvs[1..]
; [eval] old(vals(x))[1..]
; [eval] old(vals(x))
; [eval] vals(x)
(set-option :timeout 0)
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; [eval] vals(oldP.l) == oldPlvs[1..]
; [eval] vals(oldP.l)
(set-option :timeout 0)
(push) ; 12
(assert (vals%precondition ($Snap.combine
  ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@16@01))))
  ($Snap.combine
    ($Snap.first $t@21@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@21@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01)))))
(pop) ; 12
; Joined path conditions
(assert (vals%precondition ($Snap.combine
  ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@16@01))))
  ($Snap.combine
    ($Snap.first $t@21@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@21@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01)))))
; [eval] oldPlvs[1..]
(push) ; 12
(assert (not (Seq_equal
  (vals ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@16@01))))
    ($Snap.combine
      ($Snap.first $t@21@01)
      ($Snap.combine
        ($Snap.first ($Snap.second $t@21@01))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))))
  (Seq_drop plvs@15@01 1))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (vals ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@16@01))))
    ($Snap.combine
      ($Snap.first $t@21@01)
      ($Snap.combine
        ($Snap.first ($Snap.second $t@21@01))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))))
  (Seq_drop plvs@15@01 1)))
(assert (=
  (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@16@01)))))) ($Snap.combine
    ($Snap.first ($Snap.second $t@16@01))
    ($Snap.combine
      ($Snap.combine
        ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@16@01))))
        ($Snap.combine
          ($Snap.first $t@21@01)
          ($Snap.combine
            ($Snap.first ($Snap.second $t@21@01))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))
              ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))))))
      $Snap.unit)))
  ($Snap.combine
    ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@16@01)))))) ($Snap.combine
      ($Snap.first ($Snap.second $t@16@01))
      ($Snap.combine
        ($Snap.combine
          ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@16@01))))
          ($Snap.combine
            ($Snap.first $t@21@01)
            ($Snap.combine
              ($Snap.first ($Snap.second $t@21@01))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))
                ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))))))
        $Snap.unit))))
    ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@16@01)))))) ($Snap.combine
      ($Snap.first ($Snap.second $t@16@01))
      ($Snap.combine
        ($Snap.combine
          ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@16@01))))
          ($Snap.combine
            ($Snap.first $t@21@01)
            ($Snap.combine
              ($Snap.first ($Snap.second $t@21@01))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))
                ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))))))
        $Snap.unit)))))))
(assert (=
  ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@16@01)))))) ($Snap.combine
    ($Snap.first ($Snap.second $t@16@01))
    ($Snap.combine
      ($Snap.combine
        ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@16@01))))
        ($Snap.combine
          ($Snap.first $t@21@01)
          ($Snap.combine
            ($Snap.first ($Snap.second $t@21@01))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))
              ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))))))
      $Snap.unit))))
  $Snap.unit))
; [eval] vals(x) == old(vals(x))[1..]
; [eval] vals(x)
(push) ; 12
(assert (vals%precondition ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@16@01)))))) ($Snap.combine
  ($Snap.first ($Snap.second $t@16@01))
  ($Snap.combine
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@16@01))))
      ($Snap.combine
        ($Snap.first $t@21@01)
        ($Snap.combine
          ($Snap.first ($Snap.second $t@21@01))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))))))
    $Snap.unit)))) x@2@01))
(pop) ; 12
; Joined path conditions
(assert (vals%precondition ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@16@01)))))) ($Snap.combine
  ($Snap.first ($Snap.second $t@16@01))
  ($Snap.combine
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@16@01))))
      ($Snap.combine
        ($Snap.first $t@21@01)
        ($Snap.combine
          ($Snap.first ($Snap.second $t@21@01))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))))))
    $Snap.unit)))) x@2@01))
; [eval] old(vals(x))[1..]
; [eval] old(vals(x))
; [eval] vals(x)
(push) ; 12
(pop) ; 12
; Joined path conditions
(assert (Seq_equal
  (vals ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@16@01)))))) ($Snap.combine
    ($Snap.first ($Snap.second $t@16@01))
    ($Snap.combine
      ($Snap.combine
        ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@16@01))))
        ($Snap.combine
          ($Snap.first $t@21@01)
          ($Snap.combine
            ($Snap.first ($Snap.second $t@21@01))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))
              ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))))))
      $Snap.unit)))) x@2@01)
  (Seq_drop (vals ($Snap.second $t@4@01) x@2@01) 1)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 12
; 0,01s
; (get-info :all-statistics)
(check-sat)
; unknown
; [eval] vals(x) == old(vals(x))[1..]
; [eval] vals(x)
(set-option :timeout 0)
(push) ; 12
(pop) ; 12
; Joined path conditions
; [eval] old(vals(x))[1..]
; [eval] old(vals(x))
; [eval] vals(x)
(push) ; 12
(pop) ; 12
; Joined path conditions
; Create MagicWandSnapFunction for wand acc(p.l, write) && (acc(Tree(p.l), write) && vals(p.l) == plvs[1..]) --* acc(Tree(x), write) && vals(x) == old(vals(x))[1..]
(declare-const mwsf@22@01 $MWSF)
(assert (forall (($t@21@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@22@01 $t@21@01)
    ($Snap.combine
      ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@16@01)))))) ($Snap.combine
        ($Snap.first ($Snap.second $t@16@01))
        ($Snap.combine
          ($Snap.combine
            ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@16@01))))
            ($Snap.combine
              ($Snap.first $t@21@01)
              ($Snap.combine
                ($Snap.first ($Snap.second $t@21@01))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))
                  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))))))
          $Snap.unit))))
      $Snap.unit))
  :pattern ((MWSF_apply mwsf@22@01 $t@21@01))
  :qid |quant-u-10|)))
; [eval] plvs[1..]
; [eval] old(vals(x))[1..]
; [eval] old(vals(x))
; [eval] vals(x)
(push) ; 12
(pop) ; 12
; Joined path conditions
(pop) ; 11
(pop) ; 10
(push) ; 10
(assert (and
  (not (= p@19@01 $Ref.null))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01)))
      $Ref.null))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
      $Ref.null))
  (and
    (not (= x@2@01 $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))
        $Ref.null)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))
      $Ref.null))
  (not (= x@2@01 $Ref.null))))
(assert (forall (($t@21@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@22@01 $t@21@01)
    ($Snap.combine
      ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@16@01)))))) ($Snap.combine
        ($Snap.first ($Snap.second $t@16@01))
        ($Snap.combine
          ($Snap.combine
            ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@16@01))))
            ($Snap.combine
              ($Snap.first $t@21@01)
              ($Snap.combine
                ($Snap.first ($Snap.second $t@21@01))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))
                  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))))))
          $Snap.unit))))
      $Snap.unit))
  :pattern ((MWSF_apply mwsf@22@01 $t@21@01))
  :qid |quant-u-11|)))
(assert true)
; Loop head block: Re-establish invariant
; [eval] p != null
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))) p@19@01)))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))) p@19@01)))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [eval] p.l != null
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))) p@19@01)))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [eval] plvs == vals(p.l)
; [eval] vals(p.l)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))) p@19@01)))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(pop) ; 11
; Joined path conditions
(push) ; 11
(assert (not (Seq_equal
  plvs@20@01
  (vals ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  plvs@20@01
  (vals ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))))
; [eval] plvs[1..]
; [eval] old(vals(x))[1..]
; [eval] old(vals(x))
; [eval] vals(x)
(push) ; 11
(pop) ; 11
; Joined path conditions
(pop) ; 10
(pop) ; 9
(pop) ; 8
(push) ; 8
; [else-branch: 7 | First:(Second:(First:(Second:(Second:($t@16@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
  $Ref.null))
(pop) ; 8
; [eval] !(unfolding acc(Tree(p.l), write) in p.l.l != null)
; [eval] (unfolding acc(Tree(p.l), write) in p.l.l != null)
(push) ; 8
; [eval] x == null
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))) $Ref.null))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | First:(Second:($t@16@01)) == Null | dead]
; [else-branch: 10 | First:(Second:($t@16@01)) != Null | live]
(set-option :timeout 0)
(push) ; 9
; [else-branch: 10 | First:(Second:($t@16@01)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))) $Ref.null)))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second $t@16@01)))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@16@01))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))))
(push) ; 10
(set-option :timeout 10)
(assert (not (= p@14@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))))))
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [eval] p.l.l != null
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01)))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01)))
        $Ref.null))
    (=
      ($Snap.first ($Snap.second ($Snap.second $t@16@01)))
      ($Snap.combine
        ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@16@01))))
        ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
    (=
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))
        ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))))))))
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))) $Ref.null)))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | First:(Second:(First:(Second:(Second:($t@16@01))))) == Null | live]
; [else-branch: 11 | First:(Second:(First:(Second:(Second:($t@16@01))))) != Null | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 11 | First:(Second:(First:(Second:(Second:($t@16@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
  $Ref.null))
; [exec]
; unfold acc(Tree(p.l), write)
; [eval] x == null
; [then-branch: 12 | First:(Second:($t@16@01)) == Null | dead]
; [else-branch: 12 | First:(Second:($t@16@01)) != Null | live]
(push) ; 9
; [else-branch: 12 | First:(Second:($t@16@01)) != Null]
(assert (=
  ($Snap.first ($Snap.second ($Snap.second $t@16@01)))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@16@01))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))))
(push) ; 10
(set-option :timeout 10)
(assert (not (= p@14@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))))))
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; assert vals(p.l.l) == Seq[Int]()
; [eval] vals(p.l.l) == Seq[Int]()
; [eval] vals(p.l.l)
(set-option :timeout 0)
(push) ; 10
(assert (vals%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))))
(pop) ; 10
; Joined path conditions
(assert (vals%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))))
; [eval] Seq[Int]()
(push) ; 10
(assert (not (Seq_equal
  (vals ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))
  (as Seq_empty  Seq<Int>))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (vals ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))
  (as Seq_empty  Seq<Int>)))
; [exec]
; p.l := p.l.r
(declare-const l@23@01 $Ref)
(assert (=
  l@23@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))))))
(push) ; 10
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@16@01))) p@14@01)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [exec]
; apply acc(p.l, write) && (acc(Tree(p.l), write) && vals(p.l) == plvs[1..]) --*
;   acc(Tree(x), write) && vals(x) == old(vals(x))[1..]
; [eval] plvs[1..]
; [eval] old(vals(x))[1..]
; [eval] old(vals(x))
; [eval] vals(x)
(set-option :timeout 0)
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))))
  l@23@01)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [eval] vals(p.l) == plvs[1..]
; [eval] vals(p.l)
(set-option :timeout 0)
(push) ; 10
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))))
  l@23@01)))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(assert (vals%precondition ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))) l@23@01))
(pop) ; 10
; Joined path conditions
(assert (vals%precondition ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))) l@23@01))
; [eval] plvs[1..]
(set-option :timeout 0)
(push) ; 10
(assert (not (Seq_equal
  (vals ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))) l@23@01)
  (Seq_drop plvs@15@01 1))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (vals ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))) l@23@01)
  (Seq_drop plvs@15@01 1)))
(assert (=
  (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@16@01)))))) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@23@01)
    ($Snap.combine
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))
      $Snap.unit)))
  ($Snap.combine
    ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@16@01)))))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@23@01)
      ($Snap.combine
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))
        $Snap.unit))))
    ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@16@01)))))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@23@01)
      ($Snap.combine
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))
        $Snap.unit)))))))
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
  x@2@01)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@16@01)))))) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@23@01)
    ($Snap.combine
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))
      $Snap.unit))))
  $Snap.unit))
; [eval] vals(x) == old(vals(x))[1..]
; [eval] vals(x)
(set-option :timeout 0)
(push) ; 10
(assert (vals%precondition ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@16@01)))))) ($Snap.combine
  ($SortWrappers.$RefTo$Snap l@23@01)
  ($Snap.combine
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))
    $Snap.unit)))) x@2@01))
(pop) ; 10
; Joined path conditions
(assert (vals%precondition ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@16@01)))))) ($Snap.combine
  ($SortWrappers.$RefTo$Snap l@23@01)
  ($Snap.combine
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))
    $Snap.unit)))) x@2@01))
; [eval] old(vals(x))[1..]
; [eval] old(vals(x))
; [eval] vals(x)
(push) ; 10
(pop) ; 10
; Joined path conditions
(assert (Seq_equal
  (vals ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@16@01)))))) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@23@01)
    ($Snap.combine
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))
      $Snap.unit)))) x@2@01)
  (Seq_drop (vals ($Snap.second $t@4@01) x@2@01) 1)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  x@2@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))))
(check-sat)
; unknown
(pop) ; 10
; 0,01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
    ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@16@01)))))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@23@01)
      ($Snap.combine
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))
        $Snap.unit))))))))
(check-sat)
; unknown
(pop) ; 10
; 0,01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not
  (=
    ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@16@01)))))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@23@01)
      ($Snap.combine
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01)))))))
        $Snap.unit))))
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))))))
(check-sat)
; unknown
(pop) ; 10
; 0,01s
; (get-info :all-statistics)
; [exec]
; z := x
; [eval] vals(z) == old(vals(x))[1..]
; [eval] vals(z)
(set-option :timeout 0)
(push) ; 10
(pop) ; 10
; Joined path conditions
; [eval] old(vals(x))[1..]
; [eval] old(vals(x))
; [eval] vals(x)
(push) ; 10
(pop) ; 10
; Joined path conditions
(pop) ; 9
(pop) ; 8
(push) ; 8
; [else-branch: 11 | First:(Second:(First:(Second:(Second:($t@16@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@16@01))))))
    $Ref.null)))
(pop) ; 8
(pop) ; 7
(pop) ; 6
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 2 | First:(Second:(Second:($t@4@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))
  $Ref.null))
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
