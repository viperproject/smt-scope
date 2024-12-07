(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:33:25
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/wands/examples_paper/list_insert.vpr
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
(declare-fun head ($Snap $Ref) Int)
(declare-fun head%limited ($Snap $Ref) Int)
(declare-fun head%stateless ($Ref) Bool)
(declare-fun head%precondition ($Snap $Ref) Bool)
(declare-fun elems ($Snap $Ref) Seq<Int>)
(declare-fun elems%limited ($Snap $Ref) Seq<Int>)
(declare-fun elems%stateless ($Ref) Bool)
(declare-fun elems%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun List%trigger ($Snap $Ref) Bool)
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
(declare-fun joined_unfolding@4@00 ($Snap $Ref) Int)
(declare-fun joined_unfolding@5@00 ($Snap $Ref) Seq<Int>)
(assert (forall ((s@$ $Snap) (xs@0@00 $Ref)) (!
  (= (head%limited s@$ xs@0@00) (head s@$ xs@0@00))
  :pattern ((head s@$ xs@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (xs@0@00 $Ref)) (!
  (head%stateless xs@0@00)
  :pattern ((head%limited s@$ xs@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (xs@0@00 $Ref)) (!
  (=>
    (head%precondition s@$ xs@0@00)
    (= (head s@$ xs@0@00) ($SortWrappers.$SnapToInt ($Snap.first s@$))))
  :pattern ((head s@$ xs@0@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (xs@0@00 $Ref)) (!
  true
  :pattern ((head s@$ xs@0@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (xs@2@00 $Ref)) (!
  (= (elems%limited s@$ xs@2@00) (elems s@$ xs@2@00))
  :pattern ((elems s@$ xs@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (xs@2@00 $Ref)) (!
  (elems%stateless xs@2@00)
  :pattern ((elems%limited s@$ xs@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (xs@2@00 $Ref)) (!
  (=>
    (elems%precondition s@$ xs@2@00)
    (=
      (elems s@$ xs@2@00)
      (Seq_append
        (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first s@$)))
        (ite
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            $Ref.null)
          (as Seq_empty  Seq<Int>)
          (elems%limited ($Snap.second ($Snap.second s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))))
  :pattern ((elems s@$ xs@2@00))
  :pattern ((elems%stateless xs@2@00) (List%trigger s@$ xs@2@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (xs@2@00 $Ref)) (!
  (=>
    (elems%precondition s@$ xs@2@00)
    (ite
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)
      true
      (elems%precondition ($Snap.second ($Snap.second s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))
  :pattern ((elems s@$ xs@2@00))
  :qid |quant-u-7|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- insert ----------
(declare-const xs@0@01 $Ref)
(declare-const x@1@01 Int)
(declare-const i@2@01 Int)
(declare-const xs@3@01 $Ref)
(declare-const x@4@01 Int)
(declare-const i@5@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 ($Snap.combine ($Snap.first $t@6@01) ($Snap.second $t@6@01))))
(assert (= ($Snap.second $t@6@01) $Snap.unit))
; [eval] head(xs) < x
; [eval] head(xs)
(push) ; 2
(assert (head%precondition ($Snap.first $t@6@01) xs@3@01))
(pop) ; 2
; Joined path conditions
(assert (head%precondition ($Snap.first $t@6@01) xs@3@01))
(assert (< (head ($Snap.first $t@6@01) xs@3@01) x@4@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@7@01 $Snap)
(assert (= $t@7@01 ($Snap.combine ($Snap.first $t@7@01) ($Snap.second $t@7@01))))
(assert (= ($Snap.second $t@7@01) $Snap.unit))
; [eval] elems(xs) == old(elems(xs))[0..i + 1] ++ Seq(x) ++ old(elems(xs))[i + 1..]
; [eval] elems(xs)
(push) ; 3
(assert (elems%precondition ($Snap.first $t@7@01) xs@3@01))
(pop) ; 3
; Joined path conditions
(assert (elems%precondition ($Snap.first $t@7@01) xs@3@01))
; [eval] old(elems(xs))[0..i + 1] ++ Seq(x) ++ old(elems(xs))[i + 1..]
; [eval] old(elems(xs))[0..i + 1] ++ Seq(x)
; [eval] old(elems(xs))[0..i + 1]
; [eval] old(elems(xs))[..i + 1]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 3
(assert (elems%precondition ($Snap.first $t@6@01) xs@3@01))
(pop) ; 3
; Joined path conditions
(assert (elems%precondition ($Snap.first $t@6@01) xs@3@01))
; [eval] i + 1
; [eval] Seq(x)
(assert (= (Seq_length (Seq_singleton x@4@01)) 1))
; [eval] old(elems(xs))[i + 1..]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 3
(pop) ; 3
; Joined path conditions
; [eval] i + 1
(assert (Seq_equal
  (elems ($Snap.first $t@7@01) xs@3@01)
  (Seq_append
    (Seq_append
      (Seq_drop (Seq_take (elems ($Snap.first $t@6@01) xs@3@01) (+ i@5@01 1)) 0)
      (Seq_singleton x@4@01))
    (Seq_drop (elems ($Snap.first $t@6@01) xs@3@01) (+ i@5@01 1)))))
(pop) ; 2
(push) ; 2
; [exec]
; var crt: Ref
(declare-const crt@8@01 $Ref)
; [exec]
; var nxt: Ref
(declare-const nxt@9@01 $Ref)
; [exec]
; var node: Ref
(declare-const node@10@01 $Ref)
; [exec]
; i := 0
; [exec]
; unfold acc(List(xs), write)
(assert (=
  ($Snap.first $t@6@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@6@01))
    ($Snap.second ($Snap.first $t@6@01)))))
(assert (not (= xs@3@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.first $t@6@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
; [eval] xs.next != null
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  $Ref.null)))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | First:(Second:(First:($t@6@01))) != Null | live]
; [else-branch: 0 | First:(Second:(First:($t@6@01))) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | First:(Second:(First:($t@6@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (List%trigger ($Snap.first $t@6@01) xs@3@01))
; [exec]
; crt := xs
; [exec]
; nxt := xs.next
(declare-const nxt@11@01 $Ref)
(assert (=
  nxt@11@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))))
; [exec]
; package acc(List(crt), write) --*
; acc(List(xs), write) &&
; elems(xs) == old(elems(xs))[0..i] ++ old[lhs](elems(crt)) {
; }
(set-option :timeout 0)
(push) ; 4
(declare-const $t@12@01 $Snap)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
; [eval] elems(xs) == old(elems(xs))[0..i] ++ old[lhs](elems(crt))
; [eval] elems(xs)
(set-option :timeout 0)
(push) ; 5
(assert (elems%precondition $t@12@01 xs@3@01))
(pop) ; 5
; Joined path conditions
(assert (elems%precondition $t@12@01 xs@3@01))
; [eval] old(elems(xs))[0..i] ++ old[lhs](elems(crt))
; [eval] old(elems(xs))[0..i]
; [eval] old(elems(xs))[..i]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 5
(assert (elems%precondition ($Snap.first $t@6@01) xs@3@01))
(pop) ; 5
; Joined path conditions
(assert (elems%precondition ($Snap.first $t@6@01) xs@3@01))
; [eval] old[lhs](elems(crt))
; [eval] elems(crt)
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
(assert (not (Seq_equal
  (elems $t@12@01 xs@3@01)
  (Seq_append
    (Seq_drop (Seq_take (elems ($Snap.first $t@6@01) xs@3@01) 0) 0)
    (elems $t@12@01 xs@3@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (elems $t@12@01 xs@3@01)
  (Seq_append
    (Seq_drop (Seq_take (elems ($Snap.first $t@6@01) xs@3@01) 0) 0)
    (elems $t@12@01 xs@3@01))))
; Create MagicWandSnapFunction for wand acc(List(crt), write) --* acc(List(xs), write) && elems(xs) == old(elems(xs))[0..i] ++ old[lhs](elems(crt))
(declare-const mwsf@13@01 $MWSF)
(assert (forall (($t@12@01 $Snap)) (!
  (= (MWSF_apply mwsf@13@01 $t@12@01) ($Snap.combine $t@12@01 $Snap.unit))
  :pattern ((MWSF_apply mwsf@13@01 $t@12@01))
  :qid |quant-u-8|)))
; [eval] old(elems(xs))[0..i]
; [eval] old(elems(xs))[..i]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 5
(pop) ; 5
; Joined path conditions
(pop) ; 4
(push) ; 4
(assert (forall (($t@12@01 $Snap)) (!
  (= (MWSF_apply mwsf@13@01 $t@12@01) ($Snap.combine $t@12@01 $Snap.unit))
  :pattern ((MWSF_apply mwsf@13@01 $t@12@01))
  :qid |quant-u-9|)))
(assert true)
(declare-const oi@14@01 Int)
(declare-const prev@15@01 $Ref)
(declare-const crt@16@01 $Ref)
(declare-const nxt@17@01 $Ref)
(declare-const i@18@01 Int)
(push) ; 5
; Loop head block: Check well-definedness of invariant
(declare-const $t@19@01 $Snap)
(assert (= $t@19@01 ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01))))
(assert (= ($Snap.first $t@19@01) $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@18@01))
(assert (=
  ($Snap.second $t@19@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@19@01))
    ($Snap.second ($Snap.second $t@19@01)))))
(assert (= ($Snap.first ($Snap.second $t@19@01)) $Snap.unit))
; [eval] i < |old(elems(xs))|
; [eval] |old(elems(xs))|
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 6
(assert (elems%precondition ($Snap.first $t@6@01) xs@3@01))
(pop) ; 6
; Joined path conditions
(assert (elems%precondition ($Snap.first $t@6@01) xs@3@01))
(assert (< i@18@01 (Seq_length (elems ($Snap.first $t@6@01) xs@3@01))))
(assert (=
  ($Snap.second ($Snap.second $t@19@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@19@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@19@01))) $Snap.unit))
; [eval] nxt == null ==> i == |old(elems(xs))| - 1
; [eval] nxt == null
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= nxt@17@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= nxt@17@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | nxt@17@01 == Null | live]
; [else-branch: 1 | nxt@17@01 != Null | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 1 | nxt@17@01 == Null]
(assert (= nxt@17@01 $Ref.null))
; [eval] i == |old(elems(xs))| - 1
; [eval] |old(elems(xs))| - 1
; [eval] |old(elems(xs))|
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 8
(pop) ; 8
; Joined path conditions
(pop) ; 7
(push) ; 7
; [else-branch: 1 | nxt@17@01 != Null]
(assert (not (= nxt@17@01 $Ref.null)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not (= nxt@17@01 $Ref.null)) (= nxt@17@01 $Ref.null)))
(assert (=>
  (= nxt@17@01 $Ref.null)
  (= i@18@01 (- (Seq_length (elems ($Snap.first $t@6@01) xs@3@01)) 1))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@19@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))
(assert (not (= crt@16@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))
  $Snap.unit))
; [eval] nxt == crt.next
(assert (=
  nxt@17@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))
  $Snap.unit))
; [eval] crt.val == old(elems(xs))[i]
; [eval] old(elems(xs))[i]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(assert (not (>= i@18@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))
  (Seq_index (elems ($Snap.first $t@6@01) xs@3@01) i@18@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))))))
; [eval] nxt != null
(push) ; 6
(set-option :timeout 10)
(assert (not (= nxt@17@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= nxt@17@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | nxt@17@01 != Null | live]
; [else-branch: 2 | nxt@17@01 == Null | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 2 | nxt@17@01 != Null]
(assert (not (= nxt@17@01 $Ref.null)))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))))))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))))
  $Snap.unit))
; [eval] elems(nxt) == old(elems(xs))[i + 1..]
; [eval] elems(nxt)
(push) ; 7
(assert (elems%precondition ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) nxt@17@01))
(pop) ; 7
; Joined path conditions
(assert (elems%precondition ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) nxt@17@01))
; [eval] old(elems(xs))[i + 1..]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 7
(pop) ; 7
; Joined path conditions
; [eval] i + 1
(assert (Seq_equal
  (elems ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) nxt@17@01)
  (Seq_drop (elems ($Snap.first $t@6@01) xs@3@01) (+ i@18@01 1))))
; [eval] old(elems(xs))[0..i]
; [eval] old(elems(xs))[..i]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 7
(pop) ; 7
; Joined path conditions
(pop) ; 6
(push) ; 6
; [else-branch: 2 | nxt@17@01 == Null]
(assert (= nxt@17@01 $Ref.null))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))
  $Snap.unit))
; [eval] old(elems(xs))[0..i]
; [eval] old(elems(xs))[..i]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 7
(pop) ; 7
; Joined path conditions
(pop) ; 6
(pop) ; 5
(push) ; 5
; Loop head block: Establish invariant
; [eval] 0 <= i
; [eval] i < |old(elems(xs))|
; [eval] |old(elems(xs))|
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 6
(assert (elems%precondition ($Snap.first $t@6@01) xs@3@01))
(pop) ; 6
; Joined path conditions
(assert (elems%precondition ($Snap.first $t@6@01) xs@3@01))
(push) ; 6
(assert (not (< 0 (Seq_length (elems ($Snap.first $t@6@01) xs@3@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (< 0 (Seq_length (elems ($Snap.first $t@6@01) xs@3@01))))
; [eval] nxt == null ==> i == |old(elems(xs))| - 1
; [eval] nxt == null
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= nxt@11@01 $Ref.null))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | nxt@11@01 == Null | dead]
; [else-branch: 3 | nxt@11@01 != Null | live]
(set-option :timeout 0)
(push) ; 7
; [else-branch: 3 | nxt@11@01 != Null]
(assert (not (= nxt@11@01 $Ref.null)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (not (= nxt@11@01 $Ref.null)))
; [eval] nxt == crt.next
; [eval] crt.val == old(elems(xs))[i]
; [eval] old(elems(xs))[i]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01)))
  (Seq_index (elems ($Snap.first $t@6@01) xs@3@01) 0))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01)))
  (Seq_index (elems ($Snap.first $t@6@01) xs@3@01) 0)))
; [eval] nxt != null
(push) ; 6
(set-option :timeout 10)
(assert (not (= nxt@11@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | nxt@11@01 != Null | live]
; [else-branch: 4 | nxt@11@01 == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 4 | nxt@11@01 != Null]
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  nxt@11@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] elems(nxt) == old(elems(xs))[i + 1..]
; [eval] elems(nxt)
(set-option :timeout 0)
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  nxt@11@01)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (elems%precondition ($Snap.second ($Snap.second ($Snap.first $t@6@01))) nxt@11@01))
(pop) ; 7
; Joined path conditions
(assert (elems%precondition ($Snap.second ($Snap.second ($Snap.first $t@6@01))) nxt@11@01))
; [eval] old(elems(xs))[i + 1..]
; [eval] old(elems(xs))
; [eval] elems(xs)
(set-option :timeout 0)
(push) ; 7
(pop) ; 7
; Joined path conditions
; [eval] i + 1
(push) ; 7
(assert (not (Seq_equal
  (elems ($Snap.second ($Snap.second ($Snap.first $t@6@01))) nxt@11@01)
  (Seq_drop (elems ($Snap.first $t@6@01) xs@3@01) 1))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (elems ($Snap.second ($Snap.second ($Snap.first $t@6@01))) nxt@11@01)
  (Seq_drop (elems ($Snap.first $t@6@01) xs@3@01) 1)))
; [eval] old(elems(xs))[0..i]
; [eval] old(elems(xs))[..i]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 7
(pop) ; 7
; Joined path conditions
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 7
(assert (not (= nxt@17@01 $Ref.null)))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))))))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))))
  $Snap.unit))
(assert (elems%precondition ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) nxt@17@01))
(assert (Seq_equal
  (elems ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) nxt@17@01)
  (Seq_drop (elems ($Snap.first $t@6@01) xs@3@01) (+ i@18@01 1))))
(assert (= $t@19@01 ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01))))
(assert (= ($Snap.first $t@19@01) $Snap.unit))
(assert (<= 0 i@18@01))
(assert (=
  ($Snap.second $t@19@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@19@01))
    ($Snap.second ($Snap.second $t@19@01)))))
(assert (= ($Snap.first ($Snap.second $t@19@01)) $Snap.unit))
(assert (< i@18@01 (Seq_length (elems ($Snap.first $t@6@01) xs@3@01))))
(assert (=
  ($Snap.second ($Snap.second $t@19@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@19@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@19@01))) $Snap.unit))
(assert (or (not (= nxt@17@01 $Ref.null)) (= nxt@17@01 $Ref.null)))
(assert (=>
  (= nxt@17@01 $Ref.null)
  (= i@18@01 (- (Seq_length (elems ($Snap.first $t@6@01) xs@3@01)) 1))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@19@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))
(assert (not (= crt@16@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))
  $Snap.unit))
(assert (=
  nxt@17@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))
  $Snap.unit))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))
  (Seq_index (elems ($Snap.first $t@6@01) xs@3@01) i@18@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))))))
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
; [eval] nxt != null && head(nxt) < x
; [eval] nxt != null
(push) ; 9
; [then-branch: 5 | nxt@17@01 == Null | live]
; [else-branch: 5 | nxt@17@01 != Null | live]
(push) ; 10
; [then-branch: 5 | nxt@17@01 == Null]
(assert (= nxt@17@01 $Ref.null))
(pop) ; 10
(push) ; 10
; [else-branch: 5 | nxt@17@01 != Null]
; [eval] head(nxt) < x
; [eval] head(nxt)
(push) ; 11
(assert (head%precondition ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) nxt@17@01))
(pop) ; 11
; Joined path conditions
(assert (head%precondition ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) nxt@17@01))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= nxt@17@01 $Ref.null))
  (head%precondition ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) nxt@17@01)))
(pop) ; 8
(push) ; 8
; [eval] !(nxt != null && head(nxt) < x)
; [eval] nxt != null && head(nxt) < x
; [eval] nxt != null
(push) ; 9
; [then-branch: 6 | nxt@17@01 == Null | live]
; [else-branch: 6 | nxt@17@01 != Null | live]
(push) ; 10
; [then-branch: 6 | nxt@17@01 == Null]
(assert (= nxt@17@01 $Ref.null))
(pop) ; 10
(push) ; 10
; [else-branch: 6 | nxt@17@01 != Null]
; [eval] head(nxt) < x
; [eval] head(nxt)
(push) ; 11
(assert (head%precondition ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) nxt@17@01))
(pop) ; 11
; Joined path conditions
(assert (head%precondition ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) nxt@17@01))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= nxt@17@01 $Ref.null))
  (head%precondition ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) nxt@17@01)))
(pop) ; 8
; Loop head block: Follow loop-internal edges
; [eval] nxt != null && head(nxt) < x
; [eval] nxt != null
(push) ; 8
; [then-branch: 7 | nxt@17@01 == Null | live]
; [else-branch: 7 | nxt@17@01 != Null | live]
(push) ; 9
; [then-branch: 7 | nxt@17@01 == Null]
(assert (= nxt@17@01 $Ref.null))
(pop) ; 9
(push) ; 9
; [else-branch: 7 | nxt@17@01 != Null]
; [eval] head(nxt) < x
; [eval] head(nxt)
(push) ; 10
(assert (head%precondition ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) nxt@17@01))
(pop) ; 10
; Joined path conditions
(assert (head%precondition ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) nxt@17@01))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= nxt@17@01 $Ref.null))
  (head%precondition ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) nxt@17@01)))
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (and
    (not (= nxt@17@01 $Ref.null))
    (<
      (head ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) nxt@17@01)
      x@4@01)))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (not (= nxt@17@01 $Ref.null))
  (<
    (head ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) nxt@17@01)
    x@4@01))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | nxt@17@01 != Null && head(First:(First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:($t@19@01))))))))), nxt@17@01) < x@4@01 | live]
; [else-branch: 8 | !(nxt@17@01 != Null && head(First:(First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:($t@19@01))))))))), nxt@17@01) < x@4@01) | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 8 | nxt@17@01 != Null && head(First:(First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:($t@19@01))))))))), nxt@17@01) < x@4@01]
(assert (and
  (not (= nxt@17@01 $Ref.null))
  (<
    (head ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) nxt@17@01)
    x@4@01)))
; [exec]
; var oi: Int
(declare-const oi@20@01 Int)
; [exec]
; var prev: Ref
(declare-const prev@21@01 $Ref)
; [exec]
; assert old(elems(xs))[i + 1] == elems(nxt)[0]
; [eval] old(elems(xs))[i + 1] == elems(nxt)[0]
; [eval] old(elems(xs))[i + 1]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 9
(pop) ; 9
; Joined path conditions
; [eval] i + 1
(push) ; 9
(assert (not (>= (+ i@18@01 1) 0)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (< (+ i@18@01 1) (Seq_length (elems ($Snap.first $t@6@01) xs@3@01)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] elems(nxt)[0]
; [eval] elems(nxt)
(push) ; 9
(pop) ; 9
; Joined path conditions
(push) ; 9
(assert (not (<
  0
  (Seq_length
    (elems ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) nxt@17@01)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (=
  (Seq_index (elems ($Snap.first $t@6@01) xs@3@01) (+ i@18@01 1))
  (Seq_index
    (elems ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) nxt@17@01)
    0))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (=
  (Seq_index (elems ($Snap.first $t@6@01) xs@3@01) (+ i@18@01 1))
  (Seq_index
    (elems ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) nxt@17@01)
    0)))
; [exec]
; oi := i
; [exec]
; prev := crt
; [exec]
; unfold acc(List(nxt), write)
(assert (=
  ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))))
    ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))))))))
(push) ; 9
(set-option :timeout 10)
(assert (not (= crt@16@01 nxt@17@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))))))))
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= crt@16@01 nxt@17@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] xs.next != null
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | First:(Second:(First:(First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:($t@19@01))))))))))) != Null | live]
; [else-branch: 9 | First:(Second:(First:(First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:($t@19@01))))))))))) == Null | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 9 | First:(Second:(First:(First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:($t@19@01))))))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))))))
    $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (List%trigger ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) nxt@17@01))
; [exec]
; crt := nxt
; [exec]
; nxt := nxt.next
(declare-const nxt@22@01 $Ref)
(assert (=
  nxt@22@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))))))))
; [exec]
; i := i + 1
; [eval] i + 1
(declare-const i@23@01 Int)
(assert (= i@23@01 (+ i@18@01 1)))
; [exec]
; package acc(List(crt), write) --*
; acc(List(xs), write) &&
; elems(xs) == old(elems(xs))[0..i] ++ old[lhs](elems(crt)) {
;   fold acc(List(prev), write)
;   apply acc(List(prev), write) --*
;     acc(List(xs), write) &&
;     elems(xs) == old(elems(xs))[0..oi] ++ old[lhs](elems(prev))
; }
(set-option :timeout 0)
(push) ; 10
(declare-const $t@24@01 $Snap)
; [exec]
; fold acc(List(prev), write)
(push) ; 11
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 11
; 0,01s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 11
; 0,01s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
; [eval] xs.next != null
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))
    $Ref.null))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | First:(Second:(Second:(Second:(Second:($t@19@01))))) != Null | live]
; [else-branch: 10 | First:(Second:(Second:(Second:(Second:($t@19@01))))) == Null | dead]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 10 | First:(Second:(Second:(Second:(Second:($t@19@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))
    $Ref.null)))
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
(assert (List%trigger ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))
    $t@24@01)) crt@16@01))
; [exec]
; apply acc(List(prev), write) --*
;   acc(List(xs), write) &&
;   elems(xs) == old(elems(xs))[0..oi] ++ old[lhs](elems(prev))
; [eval] old(elems(xs))[0..oi]
; [eval] old(elems(xs))[..oi]
; [eval] old(elems(xs))
; [eval] elems(xs)
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
; 0,01s
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
; 0,01s
; (get-info :all-statistics)
(check-sat)
; unknown
(assert (=
  (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))
      $t@24@01)))
  ($Snap.combine
    ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))
        $t@24@01))))
    ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))
        $t@24@01)))))))
(assert (=
  ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))
      $t@24@01))))
  $Snap.unit))
; [eval] elems(xs) == old(elems(xs))[0..oi] ++ old[lhs](elems(prev))
; [eval] elems(xs)
(set-option :timeout 0)
(push) ; 12
(assert (elems%precondition ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))
    $t@24@01)))) xs@3@01))
(pop) ; 12
; Joined path conditions
(assert (elems%precondition ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))
    $t@24@01)))) xs@3@01))
; [eval] old(elems(xs))[0..oi] ++ old[lhs](elems(prev))
; [eval] old(elems(xs))[0..oi]
; [eval] old(elems(xs))[..oi]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 12
(pop) ; 12
; Joined path conditions
; [eval] old[lhs](elems(prev))
; [eval] elems(prev)
(push) ; 12
(assert (elems%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))
    $t@24@01)) crt@16@01))
(pop) ; 12
; Joined path conditions
(assert (elems%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))
    $t@24@01)) crt@16@01))
(assert (Seq_equal
  (elems ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))
      $t@24@01)))) xs@3@01)
  (Seq_append
    (Seq_drop (Seq_take (elems ($Snap.first $t@6@01) xs@3@01) i@18@01) 0)
    (elems ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))
        $t@24@01)) crt@16@01))))
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
; [eval] elems(xs) == old(elems(xs))[0..i] ++ old[lhs](elems(crt))
; [eval] elems(xs)
(set-option :timeout 0)
(push) ; 12
(pop) ; 12
; Joined path conditions
; [eval] old(elems(xs))[0..i] ++ old[lhs](elems(crt))
; [eval] old(elems(xs))[0..i]
; [eval] old(elems(xs))[..i]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 12
(pop) ; 12
; Joined path conditions
; [eval] old[lhs](elems(crt))
; [eval] elems(crt)
(push) ; 12
(assert (elems%precondition $t@24@01 nxt@17@01))
(pop) ; 12
; Joined path conditions
(assert (elems%precondition $t@24@01 nxt@17@01))
(push) ; 12
(assert (not (Seq_equal
  (elems ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))
      $t@24@01)))) xs@3@01)
  (Seq_append
    (Seq_drop (Seq_take (elems ($Snap.first $t@6@01) xs@3@01) i@23@01) 0)
    (elems $t@24@01 nxt@17@01)))))
(check-sat)
; unsat
(pop) ; 12
; 0,11s
; (get-info :all-statistics)
(assert (Seq_equal
  (elems ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))
      $t@24@01)))) xs@3@01)
  (Seq_append
    (Seq_drop (Seq_take (elems ($Snap.first $t@6@01) xs@3@01) i@23@01) 0)
    (elems $t@24@01 nxt@17@01))))
; Create MagicWandSnapFunction for wand acc(List(crt), write) --* acc(List(xs), write) && elems(xs) == old(elems(xs))[0..i] ++ old[lhs](elems(crt))
(declare-const mwsf@25@01 $MWSF)
(assert (forall (($t@24@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@25@01 $t@24@01)
    ($Snap.combine
      ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))
          $t@24@01))))
      $Snap.unit))
  :pattern ((MWSF_apply mwsf@25@01 $t@24@01))
  :qid |quant-u-10|)))
; [eval] old(elems(xs))[0..i]
; [eval] old(elems(xs))[..i]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 12
(pop) ; 12
; Joined path conditions
(pop) ; 11
(pop) ; 10
(push) ; 10
(assert (and
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))
      $Ref.null))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))))))
      $Ref.null))
  (and
    (not (= nxt@17@01 $Ref.null))
    (<
      (head ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) nxt@17@01)
      x@4@01))
  (not (= nxt@11@01 $Ref.null))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))))
(assert (forall (($t@24@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@25@01 $t@24@01)
    ($Snap.combine
      ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))
          $t@24@01))))
      $Snap.unit))
  :pattern ((MWSF_apply mwsf@25@01 $t@24@01))
  :qid |quant-u-11|)))
(assert true)
; Loop head block: Re-establish invariant
; [eval] 0 <= i
(push) ; 11
(assert (not (<= 0 i@23@01)))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 i@23@01))
; [eval] i < |old(elems(xs))|
; [eval] |old(elems(xs))|
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 11
(pop) ; 11
; Joined path conditions
(push) ; 11
(assert (not (< i@23@01 (Seq_length (elems ($Snap.first $t@6@01) xs@3@01)))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(assert (< i@23@01 (Seq_length (elems ($Snap.first $t@6@01) xs@3@01))))
; [eval] nxt == null ==> i == |old(elems(xs))| - 1
; [eval] nxt == null
(push) ; 11
(push) ; 12
(set-option :timeout 10)
(assert (not (not (= nxt@22@01 $Ref.null))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | nxt@22@01 == Null | dead]
; [else-branch: 11 | nxt@22@01 != Null | live]
(set-option :timeout 0)
(push) ; 12
; [else-branch: 11 | nxt@22@01 != Null]
(assert (not (= nxt@22@01 $Ref.null)))
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (not (= nxt@22@01 $Ref.null)))
; [eval] nxt == crt.next
; [eval] crt.val == old(elems(xs))[i]
; [eval] old(elems(xs))[i]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 11
(pop) ; 11
; Joined path conditions
(push) ; 11
(assert (not (>= i@23@01 0)))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(push) ; 11
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))))))
  (Seq_index (elems ($Snap.first $t@6@01) xs@3@01) i@23@01))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))))))
  (Seq_index (elems ($Snap.first $t@6@01) xs@3@01) i@23@01)))
; [eval] nxt != null
(push) ; 11
(set-option :timeout 10)
(assert (not (= nxt@22@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | nxt@22@01 != Null | live]
; [else-branch: 12 | nxt@22@01 == Null | dead]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 12 | nxt@22@01 != Null]
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))))))
  nxt@22@01)))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
; [eval] elems(nxt) == old(elems(xs))[i + 1..]
; [eval] elems(nxt)
(set-option :timeout 0)
(push) ; 12
(push) ; 13
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))))))
  nxt@22@01)))
(check-sat)
; unsat
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(assert (elems%precondition ($Snap.second ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))))) nxt@22@01))
(pop) ; 12
; Joined path conditions
(assert (elems%precondition ($Snap.second ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))))) nxt@22@01))
; [eval] old(elems(xs))[i + 1..]
; [eval] old(elems(xs))
; [eval] elems(xs)
(set-option :timeout 0)
(push) ; 12
(pop) ; 12
; Joined path conditions
; [eval] i + 1
(push) ; 12
(assert (not (Seq_equal
  (elems ($Snap.second ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))))) nxt@22@01)
  (Seq_drop (elems ($Snap.first $t@6@01) xs@3@01) (+ i@23@01 1)))))
(check-sat)
; unsat
(pop) ; 12
; 0,02s
; (get-info :all-statistics)
(assert (Seq_equal
  (elems ($Snap.second ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))))) nxt@22@01)
  (Seq_drop (elems ($Snap.first $t@6@01) xs@3@01) (+ i@23@01 1))))
; [eval] old(elems(xs))[0..i]
; [eval] old(elems(xs))[..i]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 12
(pop) ; 12
; Joined path conditions
(pop) ; 11
(pop) ; 10
(pop) ; 9
(push) ; 9
; [else-branch: 9 | First:(Second:(First:(First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:($t@19@01))))))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))))))
  $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (List%trigger ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) nxt@17@01))
; [exec]
; crt := nxt
; [exec]
; nxt := nxt.next
(declare-const nxt@26@01 $Ref)
(assert (=
  nxt@26@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))))))))
; [exec]
; i := i + 1
; [eval] i + 1
(declare-const i@27@01 Int)
(assert (= i@27@01 (+ i@18@01 1)))
; [exec]
; package acc(List(crt), write) --*
; acc(List(xs), write) &&
; elems(xs) == old(elems(xs))[0..i] ++ old[lhs](elems(crt)) {
;   fold acc(List(prev), write)
;   apply acc(List(prev), write) --*
;     acc(List(xs), write) &&
;     elems(xs) == old(elems(xs))[0..oi] ++ old[lhs](elems(prev))
; }
(set-option :timeout 0)
(push) ; 10
(declare-const $t@28@01 $Snap)
; [exec]
; fold acc(List(prev), write)
(push) ; 11
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
; [eval] xs.next != null
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))
    $Ref.null))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 13 | First:(Second:(Second:(Second:(Second:($t@19@01))))) != Null | live]
; [else-branch: 13 | First:(Second:(Second:(Second:(Second:($t@19@01))))) == Null | dead]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 13 | First:(Second:(Second:(Second:(Second:($t@19@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))
    $Ref.null)))
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
(assert (List%trigger ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))
    $t@28@01)) crt@16@01))
; [exec]
; apply acc(List(prev), write) --*
;   acc(List(xs), write) &&
;   elems(xs) == old(elems(xs))[0..oi] ++ old[lhs](elems(prev))
; [eval] old(elems(xs))[0..oi]
; [eval] old(elems(xs))[..oi]
; [eval] old(elems(xs))
; [eval] elems(xs)
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
(assert (=
  (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))
      $t@28@01)))
  ($Snap.combine
    ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))
        $t@28@01))))
    ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))
        $t@28@01)))))))
(assert (=
  ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))
      $t@28@01))))
  $Snap.unit))
; [eval] elems(xs) == old(elems(xs))[0..oi] ++ old[lhs](elems(prev))
; [eval] elems(xs)
(set-option :timeout 0)
(push) ; 12
(assert (elems%precondition ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))
    $t@28@01)))) xs@3@01))
(pop) ; 12
; Joined path conditions
(assert (elems%precondition ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))
    $t@28@01)))) xs@3@01))
; [eval] old(elems(xs))[0..oi] ++ old[lhs](elems(prev))
; [eval] old(elems(xs))[0..oi]
; [eval] old(elems(xs))[..oi]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 12
(pop) ; 12
; Joined path conditions
; [eval] old[lhs](elems(prev))
; [eval] elems(prev)
(push) ; 12
(assert (elems%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))
    $t@28@01)) crt@16@01))
(pop) ; 12
; Joined path conditions
(assert (elems%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))
    $t@28@01)) crt@16@01))
(assert (Seq_equal
  (elems ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))
      $t@28@01)))) xs@3@01)
  (Seq_append
    (Seq_drop (Seq_take (elems ($Snap.first $t@6@01) xs@3@01) i@18@01) 0)
    (elems ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))
        $t@28@01)) crt@16@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(assert (not (= nxt@17@01 $Ref.null)))
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
; [eval] elems(xs) == old(elems(xs))[0..i] ++ old[lhs](elems(crt))
; [eval] elems(xs)
(set-option :timeout 0)
(push) ; 12
(pop) ; 12
; Joined path conditions
; [eval] old(elems(xs))[0..i] ++ old[lhs](elems(crt))
; [eval] old(elems(xs))[0..i]
; [eval] old(elems(xs))[..i]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 12
(pop) ; 12
; Joined path conditions
; [eval] old[lhs](elems(crt))
; [eval] elems(crt)
(push) ; 12
(assert (elems%precondition $t@28@01 nxt@17@01))
(pop) ; 12
; Joined path conditions
(assert (elems%precondition $t@28@01 nxt@17@01))
(push) ; 12
(assert (not (Seq_equal
  (elems ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))
      $t@28@01)))) xs@3@01)
  (Seq_append
    (Seq_drop (Seq_take (elems ($Snap.first $t@6@01) xs@3@01) i@27@01) 0)
    (elems $t@28@01 nxt@17@01)))))
(check-sat)
; unsat
(pop) ; 12
; 0,03s
; (get-info :all-statistics)
(assert (Seq_equal
  (elems ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))
      $t@28@01)))) xs@3@01)
  (Seq_append
    (Seq_drop (Seq_take (elems ($Snap.first $t@6@01) xs@3@01) i@27@01) 0)
    (elems $t@28@01 nxt@17@01))))
; Create MagicWandSnapFunction for wand acc(List(crt), write) --* acc(List(xs), write) && elems(xs) == old(elems(xs))[0..i] ++ old[lhs](elems(crt))
(declare-const mwsf@29@01 $MWSF)
(assert (forall (($t@28@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@29@01 $t@28@01)
    ($Snap.combine
      ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))
          $t@28@01))))
      $Snap.unit))
  :pattern ((MWSF_apply mwsf@29@01 $t@28@01))
  :qid |quant-u-12|)))
; [eval] old(elems(xs))[0..i]
; [eval] old(elems(xs))[..i]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 12
(pop) ; 12
; Joined path conditions
(pop) ; 11
(pop) ; 10
(push) ; 10
(assert (and
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))
      $Ref.null))
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))))))
    $Ref.null)
  (and
    (not (= nxt@17@01 $Ref.null))
    (<
      (head ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) nxt@17@01)
      x@4@01))
  (not (= nxt@11@01 $Ref.null))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))))
(assert (forall (($t@28@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@29@01 $t@28@01)
    ($Snap.combine
      ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))
          $t@28@01))))
      $Snap.unit))
  :pattern ((MWSF_apply mwsf@29@01 $t@28@01))
  :qid |quant-u-13|)))
(assert true)
; Loop head block: Re-establish invariant
; [eval] 0 <= i
(push) ; 11
(assert (not (<= 0 i@27@01)))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 i@27@01))
; [eval] i < |old(elems(xs))|
; [eval] |old(elems(xs))|
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 11
(pop) ; 11
; Joined path conditions
(push) ; 11
(assert (not (< i@27@01 (Seq_length (elems ($Snap.first $t@6@01) xs@3@01)))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(assert (< i@27@01 (Seq_length (elems ($Snap.first $t@6@01) xs@3@01))))
; [eval] nxt == null ==> i == |old(elems(xs))| - 1
; [eval] nxt == null
(push) ; 11
(push) ; 12
(set-option :timeout 10)
(assert (not (not (= nxt@26@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= nxt@26@01 $Ref.null)))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
; [then-branch: 14 | nxt@26@01 == Null | live]
; [else-branch: 14 | nxt@26@01 != Null | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 14 | nxt@26@01 == Null]
(assert (= nxt@26@01 $Ref.null))
; [eval] i == |old(elems(xs))| - 1
; [eval] |old(elems(xs))| - 1
; [eval] |old(elems(xs))|
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 13
(pop) ; 13
; Joined path conditions
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (= nxt@26@01 $Ref.null))
(push) ; 11
(assert (not (=>
  (= nxt@26@01 $Ref.null)
  (= i@27@01 (- (Seq_length (elems ($Snap.first $t@6@01) xs@3@01)) 1)))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (= nxt@26@01 $Ref.null)
  (= i@27@01 (- (Seq_length (elems ($Snap.first $t@6@01) xs@3@01)) 1))))
; [eval] nxt == crt.next
; [eval] crt.val == old(elems(xs))[i]
; [eval] old(elems(xs))[i]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 11
(pop) ; 11
; Joined path conditions
(push) ; 11
(assert (not (>= i@27@01 0)))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(push) ; 11
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))))))
  (Seq_index (elems ($Snap.first $t@6@01) xs@3@01) i@27@01))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))))))
  (Seq_index (elems ($Snap.first $t@6@01) xs@3@01) i@27@01)))
; [eval] nxt != null
; [then-branch: 15 | nxt@26@01 != Null | dead]
; [else-branch: 15 | nxt@26@01 == Null | live]
(push) ; 11
; [else-branch: 15 | nxt@26@01 == Null]
; [eval] old(elems(xs))[0..i]
; [eval] old(elems(xs))[..i]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 12
(pop) ; 12
; Joined path conditions
(pop) ; 11
(pop) ; 10
(pop) ; 9
(pop) ; 8
(push) ; 8
; [else-branch: 8 | !(nxt@17@01 != Null && head(First:(First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:($t@19@01))))))))), nxt@17@01) < x@4@01)]
(assert (not
  (and
    (not (= nxt@17@01 $Ref.null))
    (<
      (head ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) nxt@17@01)
      x@4@01))))
(pop) ; 8
; [eval] !(nxt != null && head(nxt) < x)
; [eval] nxt != null && head(nxt) < x
; [eval] nxt != null
(push) ; 8
; [then-branch: 16 | nxt@17@01 == Null | live]
; [else-branch: 16 | nxt@17@01 != Null | live]
(push) ; 9
; [then-branch: 16 | nxt@17@01 == Null]
(assert (= nxt@17@01 $Ref.null))
(pop) ; 9
(push) ; 9
; [else-branch: 16 | nxt@17@01 != Null]
(assert (not (= nxt@17@01 $Ref.null)))
; [eval] head(nxt) < x
; [eval] head(nxt)
(push) ; 10
(assert (head%precondition ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) nxt@17@01))
(pop) ; 10
; Joined path conditions
(assert (head%precondition ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) nxt@17@01))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= nxt@17@01 $Ref.null))
  (and
    (not (= nxt@17@01 $Ref.null))
    (head%precondition ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) nxt@17@01))))
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (not (= nxt@17@01 $Ref.null))
  (<
    (head ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) nxt@17@01)
    x@4@01))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (and
    (not (= nxt@17@01 $Ref.null))
    (<
      (head ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) nxt@17@01)
      x@4@01)))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 17 | !(nxt@17@01 != Null && head(First:(First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:($t@19@01))))))))), nxt@17@01) < x@4@01) | live]
; [else-branch: 17 | nxt@17@01 != Null && head(First:(First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:($t@19@01))))))))), nxt@17@01) < x@4@01 | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 17 | !(nxt@17@01 != Null && head(First:(First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:($t@19@01))))))))), nxt@17@01) < x@4@01)]
(assert (not
  (and
    (not (= nxt@17@01 $Ref.null))
    (<
      (head ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) nxt@17@01)
      x@4@01))))
; [exec]
; node := new(val, next)
(declare-const node@30@01 $Ref)
(assert (not (= node@30@01 $Ref.null)))
(declare-const val@31@01 Int)
(declare-const next@32@01 $Ref)
(assert (not (= node@30@01 crt@16@01)))
(assert (not
  (=
    node@30@01
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))))
(assert (not (= node@30@01 prev@15@01)))
(assert (not (= node@30@01 node@10@01)))
(assert (not (= node@30@01 nxt@17@01)))
(assert (not (= node@30@01 xs@3@01)))
; [exec]
; node.val := x
(push) ; 9
(set-option :timeout 10)
(assert (not (= crt@16@01 node@30@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [exec]
; node.next := nxt
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= crt@16@01 node@30@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [exec]
; fold acc(List(node), write)
; [eval] xs.next != null
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= nxt@17@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= nxt@17@01 $Ref.null))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 18 | nxt@17@01 != Null | live]
; [else-branch: 18 | nxt@17@01 == Null | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 18 | nxt@17@01 != Null]
(assert (not (= nxt@17@01 $Ref.null)))
(assert (List%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap x@4@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap nxt@17@01)
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))))) node@30@01))
; [exec]
; assert elems(node) == Seq(x) ++ old(elems(xs))[i + 1..]
; [eval] elems(node) == Seq(x) ++ old(elems(xs))[i + 1..]
; [eval] elems(node)
(push) ; 10
(assert (elems%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap x@4@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap nxt@17@01)
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))))) node@30@01))
(pop) ; 10
; Joined path conditions
(assert (elems%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap x@4@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap nxt@17@01)
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))))) node@30@01))
; [eval] Seq(x) ++ old(elems(xs))[i + 1..]
; [eval] Seq(x)
(assert (= (Seq_length (Seq_singleton x@4@01)) 1))
; [eval] old(elems(xs))[i + 1..]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 10
(pop) ; 10
; Joined path conditions
; [eval] i + 1
(push) ; 10
(assert (not (Seq_equal
  (elems ($Snap.combine
    ($SortWrappers.IntTo$Snap x@4@01)
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap nxt@17@01)
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))))) node@30@01)
  (Seq_append
    (Seq_singleton x@4@01)
    (Seq_drop (elems ($Snap.first $t@6@01) xs@3@01) (+ i@18@01 1))))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (elems ($Snap.combine
    ($SortWrappers.IntTo$Snap x@4@01)
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap nxt@17@01)
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))))) node@30@01)
  (Seq_append
    (Seq_singleton x@4@01)
    (Seq_drop (elems ($Snap.first $t@6@01) xs@3@01) (+ i@18@01 1)))))
; [exec]
; crt.next := node
; [exec]
; fold acc(List(crt), write)
; [eval] xs.next != null
(push) ; 10
(set-option :timeout 10)
(assert (not (= node@30@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 19 | node@30@01 != Null | live]
; [else-branch: 19 | node@30@01 == Null | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 19 | node@30@01 != Null]
(assert (List%trigger ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap node@30@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap x@4@01)
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap nxt@17@01)
        ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))))))) crt@16@01))
; [exec]
; apply acc(List(crt), write) --*
;   acc(List(xs), write) &&
;   elems(xs) == old(elems(xs))[0..i] ++ old[lhs](elems(crt))
; [eval] old(elems(xs))[0..i]
; [eval] old(elems(xs))[..i]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 11
(pop) ; 11
; Joined path conditions
(assert (=
  (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap node@30@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap x@4@01)
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap nxt@17@01)
          ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))))))))
  ($Snap.combine
    ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap node@30@01)
        ($Snap.combine
          ($SortWrappers.IntTo$Snap x@4@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap nxt@17@01)
            ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))))))))))
    ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap node@30@01)
        ($Snap.combine
          ($SortWrappers.IntTo$Snap x@4@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap nxt@17@01)
            ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))))))))))))
(assert (=
  ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap node@30@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap x@4@01)
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap nxt@17@01)
          ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))))))))))
  $Snap.unit))
; [eval] elems(xs) == old(elems(xs))[0..i] ++ old[lhs](elems(crt))
; [eval] elems(xs)
(push) ; 11
(assert (elems%precondition ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap node@30@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap x@4@01)
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap nxt@17@01)
        ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))))))))) xs@3@01))
(pop) ; 11
; Joined path conditions
(assert (elems%precondition ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap node@30@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap x@4@01)
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap nxt@17@01)
        ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))))))))) xs@3@01))
; [eval] old(elems(xs))[0..i] ++ old[lhs](elems(crt))
; [eval] old(elems(xs))[0..i]
; [eval] old(elems(xs))[..i]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 11
(pop) ; 11
; Joined path conditions
; [eval] old[lhs](elems(crt))
; [eval] elems(crt)
(push) ; 11
(assert (elems%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap node@30@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap x@4@01)
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap nxt@17@01)
        ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))))))) crt@16@01))
(pop) ; 11
; Joined path conditions
(assert (elems%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap node@30@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap x@4@01)
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap nxt@17@01)
        ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))))))) crt@16@01))
(assert (Seq_equal
  (elems ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap node@30@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap x@4@01)
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap nxt@17@01)
          ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))))))))) xs@3@01)
  (Seq_append
    (Seq_drop (Seq_take (elems ($Snap.first $t@6@01) xs@3@01) i@18@01) 0)
    (elems ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap node@30@01)
        ($Snap.combine
          ($SortWrappers.IntTo$Snap x@4@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap nxt@17@01)
            ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))))))) crt@16@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] elems(xs) == old(elems(xs))[0..i + 1] ++ Seq(x) ++ old(elems(xs))[i + 1..]
; [eval] elems(xs)
(set-option :timeout 0)
(push) ; 11
(pop) ; 11
; Joined path conditions
; [eval] old(elems(xs))[0..i + 1] ++ Seq(x) ++ old(elems(xs))[i + 1..]
; [eval] old(elems(xs))[0..i + 1] ++ Seq(x)
; [eval] old(elems(xs))[0..i + 1]
; [eval] old(elems(xs))[..i + 1]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 11
(pop) ; 11
; Joined path conditions
; [eval] i + 1
; [eval] Seq(x)
; [eval] old(elems(xs))[i + 1..]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 11
(pop) ; 11
; Joined path conditions
; [eval] i + 1
(push) ; 11
(assert (not (Seq_equal
  (elems ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap node@30@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap x@4@01)
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap nxt@17@01)
          ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))))))))) xs@3@01)
  (Seq_append
    (Seq_append
      (Seq_drop (Seq_take (elems ($Snap.first $t@6@01) xs@3@01) (+ i@18@01 1)) 0)
      (Seq_singleton x@4@01))
    (Seq_drop (elems ($Snap.first $t@6@01) xs@3@01) (+ i@18@01 1))))))
(check-sat)
; unsat
(pop) ; 11
; 0,05s
; (get-info :all-statistics)
(assert (Seq_equal
  (elems ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap node@30@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap x@4@01)
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap nxt@17@01)
          ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))))))))) xs@3@01)
  (Seq_append
    (Seq_append
      (Seq_drop (Seq_take (elems ($Snap.first $t@6@01) xs@3@01) (+ i@18@01 1)) 0)
      (Seq_singleton x@4@01))
    (Seq_drop (elems ($Snap.first $t@6@01) xs@3@01) (+ i@18@01 1)))))
(pop) ; 10
(pop) ; 9
(pop) ; 8
(push) ; 8
; [else-branch: 17 | nxt@17@01 != Null && head(First:(First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:($t@19@01))))))))), nxt@17@01) < x@4@01]
(assert (and
  (not (= nxt@17@01 $Ref.null))
  (<
    (head ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) nxt@17@01)
    x@4@01)))
(pop) ; 8
(pop) ; 7
(push) ; 7
(assert (= nxt@17@01 $Ref.null))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))
  $Snap.unit))
(assert (= $t@19@01 ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01))))
(assert (= ($Snap.first $t@19@01) $Snap.unit))
(assert (<= 0 i@18@01))
(assert (=
  ($Snap.second $t@19@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@19@01))
    ($Snap.second ($Snap.second $t@19@01)))))
(assert (= ($Snap.first ($Snap.second $t@19@01)) $Snap.unit))
(assert (< i@18@01 (Seq_length (elems ($Snap.first $t@6@01) xs@3@01))))
(assert (=
  ($Snap.second ($Snap.second $t@19@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@19@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@19@01))) $Snap.unit))
(assert (or (not (= nxt@17@01 $Ref.null)) (= nxt@17@01 $Ref.null)))
(assert (=>
  (= nxt@17@01 $Ref.null)
  (= i@18@01 (- (Seq_length (elems ($Snap.first $t@6@01) xs@3@01)) 1))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@19@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))
(assert (not (= crt@16@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))
  $Snap.unit))
(assert (=
  nxt@17@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))
  $Snap.unit))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))
  (Seq_index (elems ($Snap.first $t@6@01) xs@3@01) i@18@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))))))
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
; [eval] nxt != null && head(nxt) < x
; [eval] nxt != null
(push) ; 9
; [then-branch: 20 | nxt@17@01 == Null | live]
; [else-branch: 20 | nxt@17@01 != Null | live]
(push) ; 10
; [then-branch: 20 | nxt@17@01 == Null]
(pop) ; 10
(push) ; 10
; [else-branch: 20 | nxt@17@01 != Null]
(assert (not (= nxt@17@01 $Ref.null)))
; [eval] head(nxt) < x
; [eval] head(nxt)
(push) ; 11
(check-sat)
; unsat
(pop) ; 11
(pop) ; 10
(pop) ; 9
; Joined path conditions
(pop) ; 8
(push) ; 8
; [eval] !(nxt != null && head(nxt) < x)
; [eval] nxt != null && head(nxt) < x
; [eval] nxt != null
(push) ; 9
; [then-branch: 21 | nxt@17@01 == Null | live]
; [else-branch: 21 | nxt@17@01 != Null | live]
(push) ; 10
; [then-branch: 21 | nxt@17@01 == Null]
(pop) ; 10
(push) ; 10
; [else-branch: 21 | nxt@17@01 != Null]
(assert (not (= nxt@17@01 $Ref.null)))
; [eval] head(nxt) < x
; [eval] head(nxt)
(push) ; 11
(check-sat)
; unsat
(pop) ; 11
(pop) ; 10
(pop) ; 9
; Joined path conditions
(pop) ; 8
; Loop head block: Follow loop-internal edges
; [eval] nxt != null && head(nxt) < x
; [eval] nxt != null
(push) ; 8
; [then-branch: 22 | nxt@17@01 == Null | live]
; [else-branch: 22 | nxt@17@01 != Null | live]
(push) ; 9
; [then-branch: 22 | nxt@17@01 == Null]
(pop) ; 9
(push) ; 9
; [else-branch: 22 | nxt@17@01 != Null]
(assert (not (= nxt@17@01 $Ref.null)))
; [eval] head(nxt) < x
; [eval] head(nxt)
(push) ; 10
(check-sat)
; unsat
(pop) ; 10
(pop) ; 9
(pop) ; 8
; Joined path conditions
; [then-branch: 23 | nxt@17@01 != Null | dead]
; [else-branch: 23 | nxt@17@01 == Null | live]
(push) ; 8
; [else-branch: 23 | nxt@17@01 == Null]
(pop) ; 8
; [eval] !(nxt != null && head(nxt) < x)
; [eval] nxt != null && head(nxt) < x
; [eval] nxt != null
(push) ; 8
; [then-branch: 24 | nxt@17@01 == Null | live]
; [else-branch: 24 | nxt@17@01 != Null | live]
(push) ; 9
; [then-branch: 24 | nxt@17@01 == Null]
(pop) ; 9
(push) ; 9
; [else-branch: 24 | nxt@17@01 != Null]
(assert (not (= nxt@17@01 $Ref.null)))
; [eval] head(nxt) < x
; [eval] head(nxt)
(push) ; 10
(check-sat)
; unsat
(pop) ; 10
(pop) ; 9
(pop) ; 8
; Joined path conditions
(push) ; 8
(set-option :timeout 10)
(assert (not (not (= nxt@17@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 25 | nxt@17@01 == Null | live]
; [else-branch: 25 | nxt@17@01 != Null | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 25 | nxt@17@01 == Null]
; [exec]
; node := new(val, next)
(declare-const node@33@01 $Ref)
(assert (not (= node@33@01 $Ref.null)))
(declare-const val@34@01 Int)
(declare-const next@35@01 $Ref)
(assert (not (= node@33@01 crt@16@01)))
(assert (not
  (=
    node@33@01
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))))
(assert (not (= node@33@01 prev@15@01)))
(assert (not (= node@33@01 node@10@01)))
(assert (not (= node@33@01 nxt@17@01)))
(assert (not (= node@33@01 xs@3@01)))
; [exec]
; node.val := x
(push) ; 9
(set-option :timeout 10)
(assert (not (= crt@16@01 node@33@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [exec]
; node.next := nxt
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= crt@16@01 node@33@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [exec]
; fold acc(List(node), write)
; [eval] xs.next != null
; [then-branch: 26 | nxt@17@01 != Null | dead]
; [else-branch: 26 | nxt@17@01 == Null | live]
(set-option :timeout 0)
(push) ; 9
; [else-branch: 26 | nxt@17@01 == Null]
(assert (List%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap x@4@01)
  ($Snap.combine ($SortWrappers.$RefTo$Snap nxt@17@01) $Snap.unit)) node@33@01))
; [exec]
; assert elems(node) == Seq(x) ++ old(elems(xs))[i + 1..]
; [eval] elems(node) == Seq(x) ++ old(elems(xs))[i + 1..]
; [eval] elems(node)
(push) ; 10
(assert (elems%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap x@4@01)
  ($Snap.combine ($SortWrappers.$RefTo$Snap nxt@17@01) $Snap.unit)) node@33@01))
(pop) ; 10
; Joined path conditions
(assert (elems%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap x@4@01)
  ($Snap.combine ($SortWrappers.$RefTo$Snap nxt@17@01) $Snap.unit)) node@33@01))
; [eval] Seq(x) ++ old(elems(xs))[i + 1..]
; [eval] Seq(x)
(assert (= (Seq_length (Seq_singleton x@4@01)) 1))
; [eval] old(elems(xs))[i + 1..]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 10
(pop) ; 10
; Joined path conditions
; [eval] i + 1
(push) ; 10
(assert (not (Seq_equal
  (elems ($Snap.combine
    ($SortWrappers.IntTo$Snap x@4@01)
    ($Snap.combine ($SortWrappers.$RefTo$Snap nxt@17@01) $Snap.unit)) node@33@01)
  (Seq_append
    (Seq_singleton x@4@01)
    (Seq_drop (elems ($Snap.first $t@6@01) xs@3@01) (+ i@18@01 1))))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (elems ($Snap.combine
    ($SortWrappers.IntTo$Snap x@4@01)
    ($Snap.combine ($SortWrappers.$RefTo$Snap nxt@17@01) $Snap.unit)) node@33@01)
  (Seq_append
    (Seq_singleton x@4@01)
    (Seq_drop (elems ($Snap.first $t@6@01) xs@3@01) (+ i@18@01 1)))))
; [exec]
; crt.next := node
; [exec]
; fold acc(List(crt), write)
; [eval] xs.next != null
(push) ; 10
(set-option :timeout 10)
(assert (not (= node@33@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 27 | node@33@01 != Null | live]
; [else-branch: 27 | node@33@01 == Null | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 27 | node@33@01 != Null]
(assert (List%trigger ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap node@33@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap x@4@01)
      ($Snap.combine ($SortWrappers.$RefTo$Snap nxt@17@01) $Snap.unit)))) crt@16@01))
; [exec]
; apply acc(List(crt), write) --*
;   acc(List(xs), write) &&
;   elems(xs) == old(elems(xs))[0..i] ++ old[lhs](elems(crt))
; [eval] old(elems(xs))[0..i]
; [eval] old(elems(xs))[..i]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 11
(pop) ; 11
; Joined path conditions
(assert (=
  (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap node@33@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap x@4@01)
        ($Snap.combine ($SortWrappers.$RefTo$Snap nxt@17@01) $Snap.unit)))))
  ($Snap.combine
    ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap node@33@01)
        ($Snap.combine
          ($SortWrappers.IntTo$Snap x@4@01)
          ($Snap.combine ($SortWrappers.$RefTo$Snap nxt@17@01) $Snap.unit))))))
    ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap node@33@01)
        ($Snap.combine
          ($SortWrappers.IntTo$Snap x@4@01)
          ($Snap.combine ($SortWrappers.$RefTo$Snap nxt@17@01) $Snap.unit)))))))))
(assert (=
  ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap node@33@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap x@4@01)
        ($Snap.combine ($SortWrappers.$RefTo$Snap nxt@17@01) $Snap.unit))))))
  $Snap.unit))
; [eval] elems(xs) == old(elems(xs))[0..i] ++ old[lhs](elems(crt))
; [eval] elems(xs)
(push) ; 11
(assert (elems%precondition ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap node@33@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap x@4@01)
      ($Snap.combine ($SortWrappers.$RefTo$Snap nxt@17@01) $Snap.unit)))))) xs@3@01))
(pop) ; 11
; Joined path conditions
(assert (elems%precondition ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap node@33@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap x@4@01)
      ($Snap.combine ($SortWrappers.$RefTo$Snap nxt@17@01) $Snap.unit)))))) xs@3@01))
; [eval] old(elems(xs))[0..i] ++ old[lhs](elems(crt))
; [eval] old(elems(xs))[0..i]
; [eval] old(elems(xs))[..i]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 11
(pop) ; 11
; Joined path conditions
; [eval] old[lhs](elems(crt))
; [eval] elems(crt)
(push) ; 11
(assert (elems%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap node@33@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap x@4@01)
      ($Snap.combine ($SortWrappers.$RefTo$Snap nxt@17@01) $Snap.unit)))) crt@16@01))
(pop) ; 11
; Joined path conditions
(assert (elems%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap node@33@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap x@4@01)
      ($Snap.combine ($SortWrappers.$RefTo$Snap nxt@17@01) $Snap.unit)))) crt@16@01))
(assert (Seq_equal
  (elems ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap node@33@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap x@4@01)
        ($Snap.combine ($SortWrappers.$RefTo$Snap nxt@17@01) $Snap.unit)))))) xs@3@01)
  (Seq_append
    (Seq_drop (Seq_take (elems ($Snap.first $t@6@01) xs@3@01) i@18@01) 0)
    (elems ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap node@33@01)
        ($Snap.combine
          ($SortWrappers.IntTo$Snap x@4@01)
          ($Snap.combine ($SortWrappers.$RefTo$Snap nxt@17@01) $Snap.unit)))) crt@16@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] elems(xs) == old(elems(xs))[0..i + 1] ++ Seq(x) ++ old(elems(xs))[i + 1..]
; [eval] elems(xs)
(set-option :timeout 0)
(push) ; 11
(pop) ; 11
; Joined path conditions
; [eval] old(elems(xs))[0..i + 1] ++ Seq(x) ++ old(elems(xs))[i + 1..]
; [eval] old(elems(xs))[0..i + 1] ++ Seq(x)
; [eval] old(elems(xs))[0..i + 1]
; [eval] old(elems(xs))[..i + 1]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 11
(pop) ; 11
; Joined path conditions
; [eval] i + 1
; [eval] Seq(x)
; [eval] old(elems(xs))[i + 1..]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 11
(pop) ; 11
; Joined path conditions
; [eval] i + 1
(push) ; 11
(assert (not (Seq_equal
  (elems ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap node@33@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap x@4@01)
        ($Snap.combine ($SortWrappers.$RefTo$Snap nxt@17@01) $Snap.unit)))))) xs@3@01)
  (Seq_append
    (Seq_append
      (Seq_drop (Seq_take (elems ($Snap.first $t@6@01) xs@3@01) (+ i@18@01 1)) 0)
      (Seq_singleton x@4@01))
    (Seq_drop (elems ($Snap.first $t@6@01) xs@3@01) (+ i@18@01 1))))))
(check-sat)
; unsat
(pop) ; 11
; 0,01s
; (get-info :all-statistics)
(assert (Seq_equal
  (elems ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))) ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap node@33@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap x@4@01)
        ($Snap.combine ($SortWrappers.$RefTo$Snap nxt@17@01) $Snap.unit)))))) xs@3@01)
  (Seq_append
    (Seq_append
      (Seq_drop (Seq_take (elems ($Snap.first $t@6@01) xs@3@01) (+ i@18@01 1)) 0)
      (Seq_singleton x@4@01))
    (Seq_drop (elems ($Snap.first $t@6@01) xs@3@01) (+ i@18@01 1)))))
(pop) ; 10
(pop) ; 9
(pop) ; 8
(pop) ; 7
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 0 | First:(Second:(First:($t@6@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.first $t@6@01))) $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (List%trigger ($Snap.first $t@6@01) xs@3@01))
; [exec]
; crt := xs
; [exec]
; nxt := xs.next
(declare-const nxt@36@01 $Ref)
(assert (=
  nxt@36@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))))
; [exec]
; package acc(List(crt), write) --*
; acc(List(xs), write) &&
; elems(xs) == old(elems(xs))[0..i] ++ old[lhs](elems(crt)) {
; }
(set-option :timeout 0)
(push) ; 4
(declare-const $t@37@01 $Snap)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
; [eval] elems(xs) == old(elems(xs))[0..i] ++ old[lhs](elems(crt))
; [eval] elems(xs)
(set-option :timeout 0)
(push) ; 5
(assert (elems%precondition $t@37@01 xs@3@01))
(pop) ; 5
; Joined path conditions
(assert (elems%precondition $t@37@01 xs@3@01))
; [eval] old(elems(xs))[0..i] ++ old[lhs](elems(crt))
; [eval] old(elems(xs))[0..i]
; [eval] old(elems(xs))[..i]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 5
(assert (elems%precondition ($Snap.first $t@6@01) xs@3@01))
(pop) ; 5
; Joined path conditions
(assert (elems%precondition ($Snap.first $t@6@01) xs@3@01))
; [eval] old[lhs](elems(crt))
; [eval] elems(crt)
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
(assert (not (Seq_equal
  (elems $t@37@01 xs@3@01)
  (Seq_append
    (Seq_drop (Seq_take (elems ($Snap.first $t@6@01) xs@3@01) 0) 0)
    (elems $t@37@01 xs@3@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (elems $t@37@01 xs@3@01)
  (Seq_append
    (Seq_drop (Seq_take (elems ($Snap.first $t@6@01) xs@3@01) 0) 0)
    (elems $t@37@01 xs@3@01))))
; Create MagicWandSnapFunction for wand acc(List(crt), write) --* acc(List(xs), write) && elems(xs) == old(elems(xs))[0..i] ++ old[lhs](elems(crt))
(declare-const mwsf@38@01 $MWSF)
(assert (forall (($t@37@01 $Snap)) (!
  (= (MWSF_apply mwsf@38@01 $t@37@01) ($Snap.combine $t@37@01 $Snap.unit))
  :pattern ((MWSF_apply mwsf@38@01 $t@37@01))
  :qid |quant-u-14|)))
; [eval] old(elems(xs))[0..i]
; [eval] old(elems(xs))[..i]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 5
(pop) ; 5
; Joined path conditions
(pop) ; 4
(push) ; 4
(assert (forall (($t@37@01 $Snap)) (!
  (= (MWSF_apply mwsf@38@01 $t@37@01) ($Snap.combine $t@37@01 $Snap.unit))
  :pattern ((MWSF_apply mwsf@38@01 $t@37@01))
  :qid |quant-u-15|)))
(assert true)
(declare-const oi@39@01 Int)
(declare-const prev@40@01 $Ref)
(declare-const crt@41@01 $Ref)
(declare-const nxt@42@01 $Ref)
(declare-const i@43@01 Int)
(push) ; 5
; Loop head block: Check well-definedness of invariant
(declare-const $t@44@01 $Snap)
(assert (= $t@44@01 ($Snap.combine ($Snap.first $t@44@01) ($Snap.second $t@44@01))))
(assert (= ($Snap.first $t@44@01) $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@43@01))
(assert (=
  ($Snap.second $t@44@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@44@01))
    ($Snap.second ($Snap.second $t@44@01)))))
(assert (= ($Snap.first ($Snap.second $t@44@01)) $Snap.unit))
; [eval] i < |old(elems(xs))|
; [eval] |old(elems(xs))|
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 6
(assert (elems%precondition ($Snap.first $t@6@01) xs@3@01))
(pop) ; 6
; Joined path conditions
(assert (elems%precondition ($Snap.first $t@6@01) xs@3@01))
(assert (< i@43@01 (Seq_length (elems ($Snap.first $t@6@01) xs@3@01))))
(assert (=
  ($Snap.second ($Snap.second $t@44@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@44@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@44@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@44@01))) $Snap.unit))
; [eval] nxt == null ==> i == |old(elems(xs))| - 1
; [eval] nxt == null
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= nxt@42@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= nxt@42@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 28 | nxt@42@01 == Null | live]
; [else-branch: 28 | nxt@42@01 != Null | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 28 | nxt@42@01 == Null]
(assert (= nxt@42@01 $Ref.null))
; [eval] i == |old(elems(xs))| - 1
; [eval] |old(elems(xs))| - 1
; [eval] |old(elems(xs))|
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 8
(pop) ; 8
; Joined path conditions
(pop) ; 7
(push) ; 7
; [else-branch: 28 | nxt@42@01 != Null]
(assert (not (= nxt@42@01 $Ref.null)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not (= nxt@42@01 $Ref.null)) (= nxt@42@01 $Ref.null)))
(assert (=>
  (= nxt@42@01 $Ref.null)
  (= i@43@01 (- (Seq_length (elems ($Snap.first $t@6@01) xs@3@01)) 1))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@44@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01)))))))
(assert (not (= crt@41@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01))))))
  $Snap.unit))
; [eval] nxt == crt.next
(assert (=
  nxt@42@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01)))))))
  $Snap.unit))
; [eval] crt.val == old(elems(xs))[i]
; [eval] old(elems(xs))[i]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(assert (not (>= i@43@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01)))))
  (Seq_index (elems ($Snap.first $t@6@01) xs@3@01) i@43@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01)))))))))))
; [eval] nxt != null
(push) ; 6
(set-option :timeout 10)
(assert (not (= nxt@42@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= nxt@42@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 29 | nxt@42@01 != Null | live]
; [else-branch: 29 | nxt@42@01 == Null | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 29 | nxt@42@01 != Null]
(assert (not (= nxt@42@01 $Ref.null)))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01)))))))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01))))))))))))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01)))))))))
  $Snap.unit))
; [eval] elems(nxt) == old(elems(xs))[i + 1..]
; [eval] elems(nxt)
(push) ; 7
(assert (elems%precondition ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01))))))))) nxt@42@01))
(pop) ; 7
; Joined path conditions
(assert (elems%precondition ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01))))))))) nxt@42@01))
; [eval] old(elems(xs))[i + 1..]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 7
(pop) ; 7
; Joined path conditions
; [eval] i + 1
(assert (Seq_equal
  (elems ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01))))))))) nxt@42@01)
  (Seq_drop (elems ($Snap.first $t@6@01) xs@3@01) (+ i@43@01 1))))
; [eval] old(elems(xs))[0..i]
; [eval] old(elems(xs))[..i]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 7
(pop) ; 7
; Joined path conditions
(pop) ; 6
(push) ; 6
; [else-branch: 29 | nxt@42@01 == Null]
(assert (= nxt@42@01 $Ref.null))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01))))))))
  $Snap.unit))
; [eval] old(elems(xs))[0..i]
; [eval] old(elems(xs))[..i]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 7
(pop) ; 7
; Joined path conditions
(pop) ; 6
(pop) ; 5
(push) ; 5
; Loop head block: Establish invariant
; [eval] 0 <= i
; [eval] i < |old(elems(xs))|
; [eval] |old(elems(xs))|
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 6
(assert (elems%precondition ($Snap.first $t@6@01) xs@3@01))
(pop) ; 6
; Joined path conditions
(assert (elems%precondition ($Snap.first $t@6@01) xs@3@01))
(push) ; 6
(assert (not (< 0 (Seq_length (elems ($Snap.first $t@6@01) xs@3@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (< 0 (Seq_length (elems ($Snap.first $t@6@01) xs@3@01))))
; [eval] nxt == null ==> i == |old(elems(xs))| - 1
; [eval] nxt == null
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= nxt@36@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= nxt@36@01 $Ref.null)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 30 | nxt@36@01 == Null | live]
; [else-branch: 30 | nxt@36@01 != Null | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 30 | nxt@36@01 == Null]
(assert (= nxt@36@01 $Ref.null))
; [eval] i == |old(elems(xs))| - 1
; [eval] |old(elems(xs))| - 1
; [eval] |old(elems(xs))|
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 8
(pop) ; 8
; Joined path conditions
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (= nxt@36@01 $Ref.null))
(push) ; 6
(assert (not (=>
  (= nxt@36@01 $Ref.null)
  (= 0 (- (Seq_length (elems ($Snap.first $t@6@01) xs@3@01)) 1)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (= nxt@36@01 $Ref.null)
  (= 0 (- (Seq_length (elems ($Snap.first $t@6@01) xs@3@01)) 1))))
; [eval] nxt == crt.next
; [eval] crt.val == old(elems(xs))[i]
; [eval] old(elems(xs))[i]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01)))
  (Seq_index (elems ($Snap.first $t@6@01) xs@3@01) 0))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01)))
  (Seq_index (elems ($Snap.first $t@6@01) xs@3@01) 0)))
; [eval] nxt != null
; [then-branch: 31 | nxt@36@01 != Null | dead]
; [else-branch: 31 | nxt@36@01 == Null | live]
(push) ; 6
; [else-branch: 31 | nxt@36@01 == Null]
; [eval] old(elems(xs))[0..i]
; [eval] old(elems(xs))[..i]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 7
(pop) ; 7
; Joined path conditions
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 7
(assert (not (= nxt@42@01 $Ref.null)))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01)))))))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01))))))))))))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01)))))))))
  $Snap.unit))
(assert (elems%precondition ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01))))))))) nxt@42@01))
(assert (Seq_equal
  (elems ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01))))))))) nxt@42@01)
  (Seq_drop (elems ($Snap.first $t@6@01) xs@3@01) (+ i@43@01 1))))
(assert (= $t@44@01 ($Snap.combine ($Snap.first $t@44@01) ($Snap.second $t@44@01))))
(assert (= ($Snap.first $t@44@01) $Snap.unit))
(assert (<= 0 i@43@01))
(assert (=
  ($Snap.second $t@44@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@44@01))
    ($Snap.second ($Snap.second $t@44@01)))))
(assert (= ($Snap.first ($Snap.second $t@44@01)) $Snap.unit))
(assert (< i@43@01 (Seq_length (elems ($Snap.first $t@6@01) xs@3@01))))
(assert (=
  ($Snap.second ($Snap.second $t@44@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@44@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@44@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@44@01))) $Snap.unit))
(assert (or (not (= nxt@42@01 $Ref.null)) (= nxt@42@01 $Ref.null)))
(assert (=>
  (= nxt@42@01 $Ref.null)
  (= i@43@01 (- (Seq_length (elems ($Snap.first $t@6@01) xs@3@01)) 1))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@44@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01)))))))
(assert (not (= crt@41@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01))))))
  $Snap.unit))
(assert (=
  nxt@42@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01)))))))
  $Snap.unit))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01)))))
  (Seq_index (elems ($Snap.first $t@6@01) xs@3@01) i@43@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01)))))))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unsat
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
(assert (= nxt@42@01 $Ref.null))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01))))))))
  $Snap.unit))
(assert (= $t@44@01 ($Snap.combine ($Snap.first $t@44@01) ($Snap.second $t@44@01))))
(assert (= ($Snap.first $t@44@01) $Snap.unit))
(assert (<= 0 i@43@01))
(assert (=
  ($Snap.second $t@44@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@44@01))
    ($Snap.second ($Snap.second $t@44@01)))))
(assert (= ($Snap.first ($Snap.second $t@44@01)) $Snap.unit))
(assert (< i@43@01 (Seq_length (elems ($Snap.first $t@6@01) xs@3@01))))
(assert (=
  ($Snap.second ($Snap.second $t@44@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@44@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@44@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@44@01))) $Snap.unit))
(assert (or (not (= nxt@42@01 $Ref.null)) (= nxt@42@01 $Ref.null)))
(assert (=>
  (= nxt@42@01 $Ref.null)
  (= i@43@01 (- (Seq_length (elems ($Snap.first $t@6@01) xs@3@01)) 1))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@44@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01)))))))
(assert (not (= crt@41@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01))))))
  $Snap.unit))
(assert (=
  nxt@42@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01)))))))
  $Snap.unit))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01)))))
  (Seq_index (elems ($Snap.first $t@6@01) xs@3@01) i@43@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01)))))))))))
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
; [eval] nxt != null && head(nxt) < x
; [eval] nxt != null
(push) ; 9
; [then-branch: 32 | nxt@42@01 == Null | live]
; [else-branch: 32 | nxt@42@01 != Null | live]
(push) ; 10
; [then-branch: 32 | nxt@42@01 == Null]
(pop) ; 10
(push) ; 10
; [else-branch: 32 | nxt@42@01 != Null]
(assert (not (= nxt@42@01 $Ref.null)))
; [eval] head(nxt) < x
; [eval] head(nxt)
(push) ; 11
(check-sat)
; unsat
(pop) ; 11
(pop) ; 10
(pop) ; 9
; Joined path conditions
(pop) ; 8
(push) ; 8
; [eval] !(nxt != null && head(nxt) < x)
; [eval] nxt != null && head(nxt) < x
; [eval] nxt != null
(push) ; 9
; [then-branch: 33 | nxt@42@01 == Null | live]
; [else-branch: 33 | nxt@42@01 != Null | live]
(push) ; 10
; [then-branch: 33 | nxt@42@01 == Null]
(pop) ; 10
(push) ; 10
; [else-branch: 33 | nxt@42@01 != Null]
(assert (not (= nxt@42@01 $Ref.null)))
; [eval] head(nxt) < x
; [eval] head(nxt)
(push) ; 11
(check-sat)
; unsat
(pop) ; 11
(pop) ; 10
(pop) ; 9
; Joined path conditions
(pop) ; 8
; Loop head block: Follow loop-internal edges
; [eval] nxt != null && head(nxt) < x
; [eval] nxt != null
(push) ; 8
; [then-branch: 34 | nxt@42@01 == Null | live]
; [else-branch: 34 | nxt@42@01 != Null | live]
(push) ; 9
; [then-branch: 34 | nxt@42@01 == Null]
(pop) ; 9
(push) ; 9
; [else-branch: 34 | nxt@42@01 != Null]
(assert (not (= nxt@42@01 $Ref.null)))
; [eval] head(nxt) < x
; [eval] head(nxt)
(push) ; 10
(check-sat)
; unsat
(pop) ; 10
(pop) ; 9
(pop) ; 8
; Joined path conditions
; [then-branch: 35 | nxt@42@01 != Null | dead]
; [else-branch: 35 | nxt@42@01 == Null | live]
(push) ; 8
; [else-branch: 35 | nxt@42@01 == Null]
(pop) ; 8
; [eval] !(nxt != null && head(nxt) < x)
; [eval] nxt != null && head(nxt) < x
; [eval] nxt != null
(push) ; 8
; [then-branch: 36 | nxt@42@01 == Null | live]
; [else-branch: 36 | nxt@42@01 != Null | live]
(push) ; 9
; [then-branch: 36 | nxt@42@01 == Null]
(pop) ; 9
(push) ; 9
; [else-branch: 36 | nxt@42@01 != Null]
(assert (not (= nxt@42@01 $Ref.null)))
; [eval] head(nxt) < x
; [eval] head(nxt)
(push) ; 10
(check-sat)
; unsat
(pop) ; 10
(pop) ; 9
(pop) ; 8
; Joined path conditions
(push) ; 8
(set-option :timeout 10)
(assert (not (not (= nxt@42@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 37 | nxt@42@01 == Null | live]
; [else-branch: 37 | nxt@42@01 != Null | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 37 | nxt@42@01 == Null]
; [exec]
; node := new(val, next)
(declare-const node@45@01 $Ref)
(assert (not (= node@45@01 $Ref.null)))
(declare-const val@46@01 Int)
(declare-const next@47@01 $Ref)
(assert (not (= node@45@01 nxt@42@01)))
(assert (not
  (=
    node@45@01
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01)))))))))
(assert (not (= node@45@01 node@10@01)))
(assert (not (= node@45@01 crt@41@01)))
(assert (not (= node@45@01 xs@3@01)))
(assert (not (= node@45@01 prev@40@01)))
; [exec]
; node.val := x
(push) ; 9
(set-option :timeout 10)
(assert (not (= crt@41@01 node@45@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [exec]
; node.next := nxt
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= crt@41@01 node@45@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [exec]
; fold acc(List(node), write)
; [eval] xs.next != null
; [then-branch: 38 | nxt@42@01 != Null | dead]
; [else-branch: 38 | nxt@42@01 == Null | live]
(set-option :timeout 0)
(push) ; 9
; [else-branch: 38 | nxt@42@01 == Null]
(assert (List%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap x@4@01)
  ($Snap.combine ($SortWrappers.$RefTo$Snap nxt@42@01) $Snap.unit)) node@45@01))
; [exec]
; assert elems(node) == Seq(x) ++ old(elems(xs))[i + 1..]
; [eval] elems(node) == Seq(x) ++ old(elems(xs))[i + 1..]
; [eval] elems(node)
(push) ; 10
(assert (elems%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap x@4@01)
  ($Snap.combine ($SortWrappers.$RefTo$Snap nxt@42@01) $Snap.unit)) node@45@01))
(pop) ; 10
; Joined path conditions
(assert (elems%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap x@4@01)
  ($Snap.combine ($SortWrappers.$RefTo$Snap nxt@42@01) $Snap.unit)) node@45@01))
; [eval] Seq(x) ++ old(elems(xs))[i + 1..]
; [eval] Seq(x)
(assert (= (Seq_length (Seq_singleton x@4@01)) 1))
; [eval] old(elems(xs))[i + 1..]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 10
(pop) ; 10
; Joined path conditions
; [eval] i + 1
(push) ; 10
(assert (not (Seq_equal
  (elems ($Snap.combine
    ($SortWrappers.IntTo$Snap x@4@01)
    ($Snap.combine ($SortWrappers.$RefTo$Snap nxt@42@01) $Snap.unit)) node@45@01)
  (Seq_append
    (Seq_singleton x@4@01)
    (Seq_drop (elems ($Snap.first $t@6@01) xs@3@01) (+ i@43@01 1))))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (elems ($Snap.combine
    ($SortWrappers.IntTo$Snap x@4@01)
    ($Snap.combine ($SortWrappers.$RefTo$Snap nxt@42@01) $Snap.unit)) node@45@01)
  (Seq_append
    (Seq_singleton x@4@01)
    (Seq_drop (elems ($Snap.first $t@6@01) xs@3@01) (+ i@43@01 1)))))
; [exec]
; crt.next := node
; [exec]
; fold acc(List(crt), write)
; [eval] xs.next != null
(push) ; 10
(set-option :timeout 10)
(assert (not (= node@45@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 39 | node@45@01 != Null | live]
; [else-branch: 39 | node@45@01 == Null | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 39 | node@45@01 != Null]
(assert (List%trigger ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01))))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap node@45@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap x@4@01)
      ($Snap.combine ($SortWrappers.$RefTo$Snap nxt@42@01) $Snap.unit)))) crt@41@01))
; [exec]
; apply acc(List(crt), write) --*
;   acc(List(xs), write) &&
;   elems(xs) == old(elems(xs))[0..i] ++ old[lhs](elems(crt))
; [eval] old(elems(xs))[0..i]
; [eval] old(elems(xs))[..i]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 11
(pop) ; 11
; Joined path conditions
(assert (=
  (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01))))))))) ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01))))
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap node@45@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap x@4@01)
        ($Snap.combine ($SortWrappers.$RefTo$Snap nxt@42@01) $Snap.unit)))))
  ($Snap.combine
    ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01))))))))) ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01))))
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap node@45@01)
        ($Snap.combine
          ($SortWrappers.IntTo$Snap x@4@01)
          ($Snap.combine ($SortWrappers.$RefTo$Snap nxt@42@01) $Snap.unit))))))
    ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01))))))))) ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01))))
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap node@45@01)
        ($Snap.combine
          ($SortWrappers.IntTo$Snap x@4@01)
          ($Snap.combine ($SortWrappers.$RefTo$Snap nxt@42@01) $Snap.unit)))))))))
(assert (=
  ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01))))))))) ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01))))
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap node@45@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap x@4@01)
        ($Snap.combine ($SortWrappers.$RefTo$Snap nxt@42@01) $Snap.unit))))))
  $Snap.unit))
; [eval] elems(xs) == old(elems(xs))[0..i] ++ old[lhs](elems(crt))
; [eval] elems(xs)
(push) ; 11
(assert (elems%precondition ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01))))))))) ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01))))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap node@45@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap x@4@01)
      ($Snap.combine ($SortWrappers.$RefTo$Snap nxt@42@01) $Snap.unit)))))) xs@3@01))
(pop) ; 11
; Joined path conditions
(assert (elems%precondition ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01))))))))) ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01))))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap node@45@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap x@4@01)
      ($Snap.combine ($SortWrappers.$RefTo$Snap nxt@42@01) $Snap.unit)))))) xs@3@01))
; [eval] old(elems(xs))[0..i] ++ old[lhs](elems(crt))
; [eval] old(elems(xs))[0..i]
; [eval] old(elems(xs))[..i]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 11
(pop) ; 11
; Joined path conditions
; [eval] old[lhs](elems(crt))
; [eval] elems(crt)
(push) ; 11
(assert (elems%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01))))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap node@45@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap x@4@01)
      ($Snap.combine ($SortWrappers.$RefTo$Snap nxt@42@01) $Snap.unit)))) crt@41@01))
(pop) ; 11
; Joined path conditions
(assert (elems%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01))))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap node@45@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap x@4@01)
      ($Snap.combine ($SortWrappers.$RefTo$Snap nxt@42@01) $Snap.unit)))) crt@41@01))
(assert (Seq_equal
  (elems ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01))))))))) ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01))))
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap node@45@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap x@4@01)
        ($Snap.combine ($SortWrappers.$RefTo$Snap nxt@42@01) $Snap.unit)))))) xs@3@01)
  (Seq_append
    (Seq_drop (Seq_take (elems ($Snap.first $t@6@01) xs@3@01) i@43@01) 0)
    (elems ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01))))
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap node@45@01)
        ($Snap.combine
          ($SortWrappers.IntTo$Snap x@4@01)
          ($Snap.combine ($SortWrappers.$RefTo$Snap nxt@42@01) $Snap.unit)))) crt@41@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] elems(xs) == old(elems(xs))[0..i + 1] ++ Seq(x) ++ old(elems(xs))[i + 1..]
; [eval] elems(xs)
(set-option :timeout 0)
(push) ; 11
(pop) ; 11
; Joined path conditions
; [eval] old(elems(xs))[0..i + 1] ++ Seq(x) ++ old(elems(xs))[i + 1..]
; [eval] old(elems(xs))[0..i + 1] ++ Seq(x)
; [eval] old(elems(xs))[0..i + 1]
; [eval] old(elems(xs))[..i + 1]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 11
(pop) ; 11
; Joined path conditions
; [eval] i + 1
; [eval] Seq(x)
; [eval] old(elems(xs))[i + 1..]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 11
(pop) ; 11
; Joined path conditions
; [eval] i + 1
(push) ; 11
(assert (not (Seq_equal
  (elems ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01))))))))) ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01))))
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap node@45@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap x@4@01)
        ($Snap.combine ($SortWrappers.$RefTo$Snap nxt@42@01) $Snap.unit)))))) xs@3@01)
  (Seq_append
    (Seq_append
      (Seq_drop (Seq_take (elems ($Snap.first $t@6@01) xs@3@01) (+ i@43@01 1)) 0)
      (Seq_singleton x@4@01))
    (Seq_drop (elems ($Snap.first $t@6@01) xs@3@01) (+ i@43@01 1))))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (elems ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01))))))))) ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01))))
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap node@45@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap x@4@01)
        ($Snap.combine ($SortWrappers.$RefTo$Snap nxt@42@01) $Snap.unit)))))) xs@3@01)
  (Seq_append
    (Seq_append
      (Seq_drop (Seq_take (elems ($Snap.first $t@6@01) xs@3@01) (+ i@43@01 1)) 0)
      (Seq_singleton x@4@01))
    (Seq_drop (elems ($Snap.first $t@6@01) xs@3@01) (+ i@43@01 1)))))
(pop) ; 10
(pop) ; 9
(pop) ; 8
(pop) ; 7
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
