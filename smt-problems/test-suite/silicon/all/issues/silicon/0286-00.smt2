(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:54:14
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0286.vpr
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
(declare-fun lsegelems ($Snap $Ref $Ref) Seq<Int>)
(declare-fun lsegelems%limited ($Snap $Ref $Ref) Seq<Int>)
(declare-fun lsegelems%stateless ($Ref $Ref) Bool)
(declare-fun lsegelems%precondition ($Snap $Ref $Ref) Bool)
(declare-fun elems ($Snap $Ref) Seq<Int>)
(declare-fun elems%limited ($Snap $Ref) Seq<Int>)
(declare-fun elems%stateless ($Ref) Bool)
(declare-fun elems%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun list%trigger ($Snap $Ref) Bool)
(declare-fun lseg%trigger ($Snap $Ref $Ref) Bool)
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
(declare-fun joined_unfolding@5@00 ($Snap $Ref $Ref) Seq<Int>)
(declare-fun joined_unfolding@6@00 ($Snap $Ref) Seq<Int>)
(assert (forall ((s@$ $Snap) (start@0@00 $Ref) (end@1@00 $Ref)) (!
  (=
    (lsegelems%limited s@$ start@0@00 end@1@00)
    (lsegelems s@$ start@0@00 end@1@00))
  :pattern ((lsegelems s@$ start@0@00 end@1@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (start@0@00 $Ref) (end@1@00 $Ref)) (!
  (lsegelems%stateless start@0@00 end@1@00)
  :pattern ((lsegelems%limited s@$ start@0@00 end@1@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (start@0@00 $Ref) (end@1@00 $Ref)) (!
  (=>
    (lsegelems%precondition s@$ start@0@00 end@1@00)
    (=
      (lsegelems s@$ start@0@00 end@1@00)
      (ite
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)
        (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first s@$)))
        (Seq_append
          (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first s@$)))
          (lsegelems%limited ($Snap.second ($Snap.second s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)))))
  :pattern ((lsegelems s@$ start@0@00 end@1@00))
  :pattern ((lsegelems%stateless start@0@00 end@1@00) (lseg%trigger s@$ start@0@00 end@1@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (start@0@00 $Ref) (end@1@00 $Ref)) (!
  (=>
    (lsegelems%precondition s@$ start@0@00 end@1@00)
    (ite
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)
      true
      (lsegelems%precondition ($Snap.second ($Snap.second s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)))
  :pattern ((lsegelems s@$ start@0@00 end@1@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (start@3@00 $Ref)) (!
  (= (elems%limited s@$ start@3@00) (elems s@$ start@3@00))
  :pattern ((elems s@$ start@3@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (start@3@00 $Ref)) (!
  (elems%stateless start@3@00)
  :pattern ((elems%limited s@$ start@3@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (start@3@00 $Ref)) (!
  (=>
    (elems%precondition s@$ start@3@00)
    (=
      (elems s@$ start@3@00)
      (ite
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          $Ref.null)
        (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first s@$)))
        (Seq_append
          (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first s@$)))
          (elems%limited ($Snap.second ($Snap.second s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))))
  :pattern ((elems s@$ start@3@00))
  :pattern ((elems%stateless start@3@00) (list%trigger s@$ start@3@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (start@3@00 $Ref)) (!
  (=>
    (elems%precondition s@$ start@3@00)
    (ite
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)
      true
      (elems%precondition ($Snap.second ($Snap.second s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))
  :pattern ((elems s@$ start@3@00))
  :qid |quant-u-7|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- addAtEnd ----------
(declare-const l1@0@01 $Ref)
(declare-const l2@1@01 $Ref)
(declare-const l1@2@01 $Ref)
(declare-const l2@3@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(assert (=
  ($Snap.second $t@4@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@4@01))
    ($Snap.second ($Snap.second $t@4@01)))))
(assert (not (= l2@3@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second $t@4@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@5@01 $Snap)
(assert (= $t@5@01 ($Snap.combine ($Snap.first $t@5@01) ($Snap.second $t@5@01))))
; [eval] old(l2.next)
(assert (=
  ($Snap.second $t@5@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@5@01))
    ($Snap.second ($Snap.second $t@5@01)))))
; [eval] old(l2.next)
(assert (=
  ($Snap.second ($Snap.second $t@5@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@5@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@5@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@5@01))) $Snap.unit))
; [eval] elems(old(l2.next)) == old(elems(l2.next))
; [eval] elems(old(l2.next))
; [eval] old(l2.next)
(push) ; 3
(assert (elems%precondition ($Snap.first ($Snap.second $t@5@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))
(pop) ; 3
; Joined path conditions
(assert (elems%precondition ($Snap.first ($Snap.second $t@5@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))
; [eval] old(elems(l2.next))
; [eval] elems(l2.next)
(push) ; 3
(assert (elems%precondition ($Snap.second ($Snap.second ($Snap.second $t@4@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))
(pop) ; 3
; Joined path conditions
(assert (elems%precondition ($Snap.second ($Snap.second ($Snap.second $t@4@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))
(assert (Seq_equal
  (elems ($Snap.first ($Snap.second $t@5@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
  (elems ($Snap.second ($Snap.second ($Snap.second $t@4@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@5@01))) $Snap.unit))
; [eval] lsegelems(l1, old(l2.next)) == old(lsegelems(l1, l2)) ++ Seq(old(l2.val))
; [eval] lsegelems(l1, old(l2.next))
; [eval] old(l2.next)
(push) ; 3
(assert (lsegelems%precondition ($Snap.first $t@5@01) l1@2@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))
(pop) ; 3
; Joined path conditions
(assert (lsegelems%precondition ($Snap.first $t@5@01) l1@2@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))
; [eval] old(lsegelems(l1, l2)) ++ Seq(old(l2.val))
; [eval] old(lsegelems(l1, l2))
; [eval] lsegelems(l1, l2)
(push) ; 3
(assert (lsegelems%precondition ($Snap.first $t@4@01) l1@2@01 l2@3@01))
(pop) ; 3
; Joined path conditions
(assert (lsegelems%precondition ($Snap.first $t@4@01) l1@2@01 l2@3@01))
; [eval] Seq(old(l2.val))
; [eval] old(l2.val)
(assert (=
  (Seq_length
    (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@4@01)))))
  1))
(assert (Seq_equal
  (lsegelems ($Snap.first $t@5@01) l1@2@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
  (Seq_append
    (lsegelems ($Snap.first $t@4@01) l1@2@01 l2@3@01)
    (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@4@01)))))))
(pop) ; 2
(push) ; 2
; [exec]
; var end: Ref
(declare-const end@6@01 $Ref)
; [exec]
; unfold acc(lseg(l1, l2), write)
(assert (=
  ($Snap.first $t@4@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@4@01))
    ($Snap.second ($Snap.first $t@4@01)))))
(push) ; 3
(set-option :timeout 10)
(assert (not (= l2@3@01 l1@2@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= l1@2@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.first $t@4@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@4@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@4@01))))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= l2@3@01 l1@2@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] start.next != end
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@4@01))))
  l2@3@01)))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@4@01))))
    l2@3@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | First:(Second:(First:($t@4@01))) != l2@3@01 | live]
; [else-branch: 0 | First:(Second:(First:($t@4@01))) == l2@3@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | First:(Second:(First:($t@4@01))) != l2@3@01]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@4@01))))
    l2@3@01)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (lseg%trigger ($Snap.first $t@4@01) l1@2@01 l2@3@01))
; [exec]
; end := l2.next
(declare-const end@7@01 $Ref)
(assert (=
  end@7@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))
; [exec]
; unfold acc(list(end), write)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))
  end@7@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@4@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= l1@2@01 end@7@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= l2@3@01 end@7@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not (= end@7@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= l1@2@01 end@7@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= l2@3@01 end@7@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] start.next != null
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | First:(Second:(Second:(Second:(Second:($t@4@01))))) != Null | live]
; [else-branch: 1 | First:(Second:(Second:(Second:(Second:($t@4@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 1 | First:(Second:(Second:(Second:(Second:($t@4@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))
    $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (list%trigger ($Snap.second ($Snap.second ($Snap.second $t@4@01))) end@7@01))
; [exec]
; inhale l1.next == l2
(declare-const $t@8@01 $Snap)
(assert (= $t@8@01 $Snap.unit))
; [eval] l1.next == l2
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@4@01))))
  l2@3@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unsat
; [exec]
; fold acc(lseg(l2, end), write)
; [eval] start.next != end
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))
  end@7@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | First:(Second:(Second:($t@4@01))) != end@7@01 | dead]
; [else-branch: 2 | First:(Second:(Second:($t@4@01))) == end@7@01 | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 2 | First:(Second:(Second:($t@4@01))) == end@7@01]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))
  end@7@01))
(assert (lseg%trigger ($Snap.combine
  ($Snap.first ($Snap.second $t@4@01))
  ($Snap.combine ($Snap.first ($Snap.second ($Snap.second $t@4@01))) $Snap.unit)) l2@3@01 end@7@01))
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@4@01))))
    l2@3@01)
  (= l2@3@01 end@7@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.first $t@4@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second $t@4@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
      $Snap.unit))))
; [exec]
; fold acc(lseg(l1, end), write)
; [eval] start.next != end
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@4@01))))
  end@7@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | First:(Second:(First:($t@4@01))) != end@7@01 | dead]
; [else-branch: 3 | First:(Second:(First:($t@4@01))) == end@7@01 | live]
(set-option :timeout 0)
(push) ; 6
; [else-branch: 3 | First:(Second:(First:($t@4@01))) == end@7@01]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@4@01))))
  end@7@01))
(assert (lseg%trigger ($Snap.combine
  ($Snap.first ($Snap.first $t@4@01))
  ($Snap.combine ($Snap.first ($Snap.second ($Snap.first $t@4@01))) $Snap.unit)) l1@2@01 end@7@01))
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@4@01))))
    l1@2@01)
  (= l2@3@01 end@7@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.first $t@4@01)))
  ($Snap.combine
    ($Snap.first ($Snap.first $t@4@01))
    ($Snap.combine ($Snap.first ($Snap.second ($Snap.first $t@4@01))) $Snap.unit))))
; [exec]
; fold acc(list(end), write)
; [eval] start.next != null
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))
  $Ref.null)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | First:(Second:(Second:(Second:(Second:($t@4@01))))) != Null | dead]
; [else-branch: 4 | First:(Second:(Second:(Second:(Second:($t@4@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 7
; [else-branch: 4 | First:(Second:(Second:(Second:(Second:($t@4@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))
  $Ref.null))
(assert (list%trigger ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))
    $Snap.unit)) end@7@01))
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))
  end@7@01)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))
      $Snap.unit))))
; [exec]
; assert lsegelems(l1, old(l2.next)) ==
;   old(lsegelems(l1, l2)) ++ Seq(old(l2.val))
; [eval] lsegelems(l1, old(l2.next)) == old(lsegelems(l1, l2)) ++ Seq(old(l2.val))
; [eval] lsegelems(l1, old(l2.next))
; [eval] old(l2.next)
(set-option :timeout 0)
(push) ; 8
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@4@01))))
    l1@2@01)
  (=
    l2@3@01
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (lsegelems%precondition ($Snap.second ($Snap.second ($Snap.first $t@4@01))) l1@2@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))
(pop) ; 8
; Joined path conditions
(assert (lsegelems%precondition ($Snap.second ($Snap.second ($Snap.first $t@4@01))) l1@2@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))
; [eval] old(lsegelems(l1, l2)) ++ Seq(old(l2.val))
; [eval] old(lsegelems(l1, l2))
; [eval] lsegelems(l1, l2)
(set-option :timeout 0)
(push) ; 8
(assert (lsegelems%precondition ($Snap.first $t@4@01) l1@2@01 l2@3@01))
(pop) ; 8
; Joined path conditions
(assert (lsegelems%precondition ($Snap.first $t@4@01) l1@2@01 l2@3@01))
; [eval] Seq(old(l2.val))
; [eval] old(l2.val)
(assert (=
  (Seq_length
    (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@4@01)))))
  1))
(push) ; 8
(assert (not (Seq_equal
  (lsegelems ($Snap.second ($Snap.second ($Snap.first $t@4@01))) l1@2@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
  (Seq_append
    (lsegelems ($Snap.first $t@4@01) l1@2@01 l2@3@01)
    (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@4@01))))))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (lsegelems ($Snap.second ($Snap.second ($Snap.first $t@4@01))) l1@2@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
  (Seq_append
    (lsegelems ($Snap.first $t@4@01) l1@2@01 l2@3@01)
    (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@4@01)))))))
; [eval] old(l2.next)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@4@01))))
    l1@2@01)
  (=
    l2@3@01
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))
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
; [eval] old(l2.next)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))
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
; [eval] elems(old(l2.next)) == old(elems(l2.next))
; [eval] elems(old(l2.next))
; [eval] old(l2.next)
(set-option :timeout 0)
(push) ; 8
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (elems%precondition ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))
(pop) ; 8
; Joined path conditions
(assert (elems%precondition ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))
; [eval] old(elems(l2.next))
; [eval] elems(l2.next)
(set-option :timeout 0)
(push) ; 8
(assert (elems%precondition ($Snap.second ($Snap.second ($Snap.second $t@4@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))
(pop) ; 8
; Joined path conditions
(assert (elems%precondition ($Snap.second ($Snap.second ($Snap.second $t@4@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))
(push) ; 8
(assert (not (Seq_equal
  (elems ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
  (elems ($Snap.second ($Snap.second ($Snap.second $t@4@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (elems ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
  (elems ($Snap.second ($Snap.second ($Snap.second $t@4@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))
; [eval] lsegelems(l1, old(l2.next)) == old(lsegelems(l1, l2)) ++ Seq(old(l2.val))
; [eval] lsegelems(l1, old(l2.next))
; [eval] old(l2.next)
(push) ; 8
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@4@01))))
    l1@2@01)
  (=
    l2@3@01
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
; Joined path conditions
; [eval] old(lsegelems(l1, l2)) ++ Seq(old(l2.val))
; [eval] old(lsegelems(l1, l2))
; [eval] lsegelems(l1, l2)
(set-option :timeout 0)
(push) ; 8
(pop) ; 8
; Joined path conditions
; [eval] Seq(old(l2.val))
; [eval] old(l2.val)
(pop) ; 7
(pop) ; 6
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 1 | First:(Second:(Second:(Second:(Second:($t@4@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))
  $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (list%trigger ($Snap.second ($Snap.second ($Snap.second $t@4@01))) end@7@01))
; [exec]
; inhale l1.next == l2
(declare-const $t@9@01 $Snap)
(assert (= $t@9@01 $Snap.unit))
; [eval] l1.next == l2
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@4@01))))
  l2@3@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unsat
; [exec]
; fold acc(lseg(l2, end), write)
; [eval] start.next != end
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))
  end@7@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | First:(Second:(Second:($t@4@01))) != end@7@01 | dead]
; [else-branch: 5 | First:(Second:(Second:($t@4@01))) == end@7@01 | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 5 | First:(Second:(Second:($t@4@01))) == end@7@01]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))
  end@7@01))
(assert (lseg%trigger ($Snap.combine
  ($Snap.first ($Snap.second $t@4@01))
  ($Snap.combine ($Snap.first ($Snap.second ($Snap.second $t@4@01))) $Snap.unit)) l2@3@01 end@7@01))
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@4@01))))
    l2@3@01)
  (= l2@3@01 end@7@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.first $t@4@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second $t@4@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
      $Snap.unit))))
; [exec]
; fold acc(lseg(l1, end), write)
; [eval] start.next != end
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@4@01))))
  end@7@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | First:(Second:(First:($t@4@01))) != end@7@01 | dead]
; [else-branch: 6 | First:(Second:(First:($t@4@01))) == end@7@01 | live]
(set-option :timeout 0)
(push) ; 6
; [else-branch: 6 | First:(Second:(First:($t@4@01))) == end@7@01]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@4@01))))
  end@7@01))
(assert (lseg%trigger ($Snap.combine
  ($Snap.first ($Snap.first $t@4@01))
  ($Snap.combine ($Snap.first ($Snap.second ($Snap.first $t@4@01))) $Snap.unit)) l1@2@01 end@7@01))
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@4@01))))
    l1@2@01)
  (= l2@3@01 end@7@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.first $t@4@01)))
  ($Snap.combine
    ($Snap.first ($Snap.first $t@4@01))
    ($Snap.combine ($Snap.first ($Snap.second ($Snap.first $t@4@01))) $Snap.unit))))
; [exec]
; fold acc(list(end), write)
; [eval] start.next != null
; [then-branch: 7 | First:(Second:(Second:(Second:(Second:($t@4@01))))) != Null | dead]
; [else-branch: 7 | First:(Second:(Second:(Second:(Second:($t@4@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 7
; [else-branch: 7 | First:(Second:(Second:(Second:(Second:($t@4@01))))) == Null]
(assert (list%trigger ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))
    $Snap.unit)) end@7@01))
; [exec]
; assert lsegelems(l1, old(l2.next)) ==
;   old(lsegelems(l1, l2)) ++ Seq(old(l2.val))
; [eval] lsegelems(l1, old(l2.next)) == old(lsegelems(l1, l2)) ++ Seq(old(l2.val))
; [eval] lsegelems(l1, old(l2.next))
; [eval] old(l2.next)
(push) ; 8
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@4@01))))
    l1@2@01)
  (=
    l2@3@01
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (lsegelems%precondition ($Snap.second ($Snap.second ($Snap.first $t@4@01))) l1@2@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))
(pop) ; 8
; Joined path conditions
(assert (lsegelems%precondition ($Snap.second ($Snap.second ($Snap.first $t@4@01))) l1@2@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))
; [eval] old(lsegelems(l1, l2)) ++ Seq(old(l2.val))
; [eval] old(lsegelems(l1, l2))
; [eval] lsegelems(l1, l2)
(set-option :timeout 0)
(push) ; 8
(assert (lsegelems%precondition ($Snap.first $t@4@01) l1@2@01 l2@3@01))
(pop) ; 8
; Joined path conditions
(assert (lsegelems%precondition ($Snap.first $t@4@01) l1@2@01 l2@3@01))
; [eval] Seq(old(l2.val))
; [eval] old(l2.val)
(assert (=
  (Seq_length
    (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@4@01)))))
  1))
(push) ; 8
(assert (not (Seq_equal
  (lsegelems ($Snap.second ($Snap.second ($Snap.first $t@4@01))) l1@2@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
  (Seq_append
    (lsegelems ($Snap.first $t@4@01) l1@2@01 l2@3@01)
    (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@4@01))))))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (lsegelems ($Snap.second ($Snap.second ($Snap.first $t@4@01))) l1@2@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
  (Seq_append
    (lsegelems ($Snap.first $t@4@01) l1@2@01 l2@3@01)
    (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@4@01)))))))
; [eval] old(l2.next)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@4@01))))
    l1@2@01)
  (=
    l2@3@01
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))
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
; [eval] old(l2.next)
; [eval] elems(old(l2.next)) == old(elems(l2.next))
; [eval] elems(old(l2.next))
; [eval] old(l2.next)
(set-option :timeout 0)
(push) ; 8
(assert (elems%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))
    $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))
(pop) ; 8
; Joined path conditions
(assert (elems%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))
    $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))
; [eval] old(elems(l2.next))
; [eval] elems(l2.next)
(push) ; 8
(assert (elems%precondition ($Snap.second ($Snap.second ($Snap.second $t@4@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))
(pop) ; 8
; Joined path conditions
(assert (elems%precondition ($Snap.second ($Snap.second ($Snap.second $t@4@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))
(push) ; 8
(assert (not (Seq_equal
  (elems ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))
      $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
  (elems ($Snap.second ($Snap.second ($Snap.second $t@4@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (elems ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))
      $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
  (elems ($Snap.second ($Snap.second ($Snap.second $t@4@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))
; [eval] lsegelems(l1, old(l2.next)) == old(lsegelems(l1, l2)) ++ Seq(old(l2.val))
; [eval] lsegelems(l1, old(l2.next))
; [eval] old(l2.next)
(push) ; 8
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@4@01))))
    l1@2@01)
  (=
    l2@3@01
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
; Joined path conditions
; [eval] old(lsegelems(l1, l2)) ++ Seq(old(l2.val))
; [eval] old(lsegelems(l1, l2))
; [eval] lsegelems(l1, l2)
(set-option :timeout 0)
(push) ; 8
(pop) ; 8
; Joined path conditions
; [eval] Seq(old(l2.val))
; [eval] old(l2.val)
(pop) ; 7
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 0 | First:(Second:(First:($t@4@01))) == l2@3@01]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@4@01))))
  l2@3@01))
(assert (= ($Snap.second ($Snap.second ($Snap.first $t@4@01))) $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (lseg%trigger ($Snap.first $t@4@01) l1@2@01 l2@3@01))
; [exec]
; end := l2.next
(declare-const end@10@01 $Ref)
(assert (=
  end@10@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))
; [exec]
; unfold acc(list(end), write)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))
  end@10@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@4@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= l1@2@01 end@10@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= l2@3@01 end@10@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not (= end@10@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= l1@2@01 end@10@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= l2@3@01 end@10@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] start.next != null
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | First:(Second:(Second:(Second:(Second:($t@4@01))))) != Null | live]
; [else-branch: 8 | First:(Second:(Second:(Second:(Second:($t@4@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 8 | First:(Second:(Second:(Second:(Second:($t@4@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))
    $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (list%trigger ($Snap.second ($Snap.second ($Snap.second $t@4@01))) end@10@01))
; [exec]
; inhale l1.next == l2
(declare-const $t@11@01 $Snap)
(assert (= $t@11@01 $Snap.unit))
; [eval] l1.next == l2
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; fold acc(lseg(l2, end), write)
; [eval] start.next != end
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))
  end@10@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | First:(Second:(Second:($t@4@01))) != end@10@01 | dead]
; [else-branch: 9 | First:(Second:(Second:($t@4@01))) == end@10@01 | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 9 | First:(Second:(Second:($t@4@01))) == end@10@01]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))
  end@10@01))
(assert (lseg%trigger ($Snap.combine
  ($Snap.first ($Snap.second $t@4@01))
  ($Snap.combine ($Snap.first ($Snap.second ($Snap.second $t@4@01))) $Snap.unit)) l2@3@01 end@10@01))
; [exec]
; fold acc(lseg(l1, end), write)
; [eval] start.next != end
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@4@01))))
  end@10@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@4@01))))
    end@10@01))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | First:(Second:(First:($t@4@01))) != end@10@01 | live]
; [else-branch: 10 | First:(Second:(First:($t@4@01))) == end@10@01 | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 10 | First:(Second:(First:($t@4@01))) != end@10@01]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@4@01))))
    end@10@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  l2@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@4@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (lseg%trigger ($Snap.combine
  ($Snap.first ($Snap.first $t@4@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@4@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second $t@4@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
        $Snap.unit)))) l1@2@01 end@10@01))
; [exec]
; fold acc(list(end), write)
; [eval] start.next != null
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | First:(Second:(Second:(Second:(Second:($t@4@01))))) != Null | live]
; [else-branch: 11 | First:(Second:(Second:(Second:(Second:($t@4@01))))) == Null | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 11 | First:(Second:(Second:(Second:(Second:($t@4@01))))) != Null]
(assert (list%trigger ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))) end@10@01))
; [exec]
; assert lsegelems(l1, old(l2.next)) ==
;   old(lsegelems(l1, l2)) ++ Seq(old(l2.val))
; [eval] lsegelems(l1, old(l2.next)) == old(lsegelems(l1, l2)) ++ Seq(old(l2.val))
; [eval] lsegelems(l1, old(l2.next))
; [eval] old(l2.next)
(push) ; 8
(assert (lsegelems%precondition ($Snap.combine
  ($Snap.first ($Snap.first $t@4@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@4@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second $t@4@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
        $Snap.unit)))) l1@2@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))
(pop) ; 8
; Joined path conditions
(assert (lsegelems%precondition ($Snap.combine
  ($Snap.first ($Snap.first $t@4@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@4@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second $t@4@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
        $Snap.unit)))) l1@2@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))
; [eval] old(lsegelems(l1, l2)) ++ Seq(old(l2.val))
; [eval] old(lsegelems(l1, l2))
; [eval] lsegelems(l1, l2)
(push) ; 8
(assert (lsegelems%precondition ($Snap.first $t@4@01) l1@2@01 l2@3@01))
(pop) ; 8
; Joined path conditions
(assert (lsegelems%precondition ($Snap.first $t@4@01) l1@2@01 l2@3@01))
; [eval] Seq(old(l2.val))
; [eval] old(l2.val)
(assert (=
  (Seq_length
    (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@4@01)))))
  1))
(push) ; 8
(assert (not (Seq_equal
  (lsegelems ($Snap.combine
    ($Snap.first ($Snap.first $t@4@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@4@01)))
      ($Snap.combine
        ($Snap.first ($Snap.second $t@4@01))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
          $Snap.unit)))) l1@2@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
  (Seq_append
    (lsegelems ($Snap.first $t@4@01) l1@2@01 l2@3@01)
    (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@4@01))))))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (lsegelems ($Snap.combine
    ($Snap.first ($Snap.first $t@4@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@4@01)))
      ($Snap.combine
        ($Snap.first ($Snap.second $t@4@01))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
          $Snap.unit)))) l1@2@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
  (Seq_append
    (lsegelems ($Snap.first $t@4@01) l1@2@01 l2@3@01)
    (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@4@01)))))))
; [eval] old(l2.next)
; [eval] old(l2.next)
; [eval] elems(old(l2.next)) == old(elems(l2.next))
; [eval] elems(old(l2.next))
; [eval] old(l2.next)
(push) ; 8
(assert (elems%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))
(pop) ; 8
; Joined path conditions
(assert (elems%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))
; [eval] old(elems(l2.next))
; [eval] elems(l2.next)
(push) ; 8
(assert (elems%precondition ($Snap.second ($Snap.second ($Snap.second $t@4@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))
(pop) ; 8
; Joined path conditions
(assert (elems%precondition ($Snap.second ($Snap.second ($Snap.second $t@4@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))
(push) ; 8
(assert (not (Seq_equal
  (elems ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
  (elems ($Snap.second ($Snap.second ($Snap.second $t@4@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (elems ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
  (elems ($Snap.second ($Snap.second ($Snap.second $t@4@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))
; [eval] lsegelems(l1, old(l2.next)) == old(lsegelems(l1, l2)) ++ Seq(old(l2.val))
; [eval] lsegelems(l1, old(l2.next))
; [eval] old(l2.next)
(push) ; 8
(pop) ; 8
; Joined path conditions
; [eval] old(lsegelems(l1, l2)) ++ Seq(old(l2.val))
; [eval] old(lsegelems(l1, l2))
; [eval] lsegelems(l1, l2)
(push) ; 8
(pop) ; 8
; Joined path conditions
; [eval] Seq(old(l2.val))
; [eval] old(l2.val)
(pop) ; 7
(pop) ; 6
(push) ; 6
; [else-branch: 10 | First:(Second:(First:($t@4@01))) == end@10@01]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@4@01))))
  end@10@01))
(assert (lseg%trigger ($Snap.combine
  ($Snap.first ($Snap.first $t@4@01))
  ($Snap.combine ($Snap.first ($Snap.second ($Snap.first $t@4@01))) $Snap.unit)) l1@2@01 end@10@01))
(push) ; 7
(set-option :timeout 10)
(assert (not (= l2@3@01 l1@2@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [exec]
; fold acc(list(end), write)
; [eval] start.next != null
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | First:(Second:(Second:(Second:(Second:($t@4@01))))) != Null | live]
; [else-branch: 12 | First:(Second:(Second:(Second:(Second:($t@4@01))))) == Null | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 12 | First:(Second:(Second:(Second:(Second:($t@4@01))))) != Null]
(assert (list%trigger ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))) end@10@01))
; [exec]
; assert lsegelems(l1, old(l2.next)) ==
;   old(lsegelems(l1, l2)) ++ Seq(old(l2.val))
; [eval] lsegelems(l1, old(l2.next)) == old(lsegelems(l1, l2)) ++ Seq(old(l2.val))
; [eval] lsegelems(l1, old(l2.next))
; [eval] old(l2.next)
(push) ; 8
(assert (lsegelems%precondition ($Snap.combine
  ($Snap.first ($Snap.first $t@4@01))
  ($Snap.combine ($Snap.first ($Snap.second ($Snap.first $t@4@01))) $Snap.unit)) l1@2@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))
(pop) ; 8
; Joined path conditions
(assert (lsegelems%precondition ($Snap.combine
  ($Snap.first ($Snap.first $t@4@01))
  ($Snap.combine ($Snap.first ($Snap.second ($Snap.first $t@4@01))) $Snap.unit)) l1@2@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))
; [eval] old(lsegelems(l1, l2)) ++ Seq(old(l2.val))
; [eval] old(lsegelems(l1, l2))
; [eval] lsegelems(l1, l2)
(push) ; 8
(assert (lsegelems%precondition ($Snap.first $t@4@01) l1@2@01 l2@3@01))
(pop) ; 8
; Joined path conditions
(assert (lsegelems%precondition ($Snap.first $t@4@01) l1@2@01 l2@3@01))
; [eval] Seq(old(l2.val))
; [eval] old(l2.val)
(assert (=
  (Seq_length
    (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@4@01)))))
  1))
(push) ; 8
(assert (not (Seq_equal
  (lsegelems ($Snap.combine
    ($Snap.first ($Snap.first $t@4@01))
    ($Snap.combine ($Snap.first ($Snap.second ($Snap.first $t@4@01))) $Snap.unit)) l1@2@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
  (Seq_append
    (lsegelems ($Snap.first $t@4@01) l1@2@01 l2@3@01)
    (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@4@01))))))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= l1@2@01 l2@3@01)))
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
    ($Snap.combine
      ($Snap.first ($Snap.second $t@4@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
        $Snap.unit))
    ($Snap.combine
      ($Snap.first ($Snap.first $t@4@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@4@01)))
        $Snap.unit))))))
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
    ($Snap.combine
      ($Snap.first ($Snap.first $t@4@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@4@01)))
        $Snap.unit))
    ($Snap.combine
      ($Snap.first ($Snap.second $t@4@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
        $Snap.unit))))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [eval] lsegelems(l1, old(l2.next)) == old(lsegelems(l1, l2)) ++ Seq(old(l2.val))
; [eval] lsegelems(l1, old(l2.next))
; [eval] old(l2.next)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 8
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (= l2@3@01 l1@2@01)
  (=
    end@10@01
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
; Joined path conditions
; [eval] old(lsegelems(l1, l2)) ++ Seq(old(l2.val))
; [eval] old(lsegelems(l1, l2))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] lsegelems(l1, l2)
(set-option :timeout 0)
(push) ; 8
(pop) ; 8
; Joined path conditions
; [eval] Seq(old(l2.val))
; [eval] old(l2.val)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 8
(assert (not (Seq_equal
  (lsegelems ($Snap.combine
    ($Snap.first ($Snap.first $t@4@01))
    ($Snap.combine ($Snap.first ($Snap.second ($Snap.first $t@4@01))) $Snap.unit)) l1@2@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
  (Seq_append
    (lsegelems ($Snap.first $t@4@01) l1@2@01 l2@3@01)
    (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@4@01))))))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= l1@2@01 l2@3@01)))
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
    ($Snap.combine
      ($Snap.first ($Snap.second $t@4@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
        $Snap.unit))
    ($Snap.combine
      ($Snap.first ($Snap.first $t@4@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@4@01)))
        $Snap.unit))))))
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
    ($Snap.combine
      ($Snap.first ($Snap.first $t@4@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@4@01)))
        $Snap.unit))
    ($Snap.combine
      ($Snap.first ($Snap.second $t@4@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
        $Snap.unit))))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [eval] lsegelems(l1, old(l2.next)) == old(lsegelems(l1, l2)) ++ Seq(old(l2.val))
; [eval] lsegelems(l1, old(l2.next))
; [eval] old(l2.next)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 8
(pop) ; 8
; Joined path conditions
; [eval] old(lsegelems(l1, l2)) ++ Seq(old(l2.val))
; [eval] old(lsegelems(l1, l2))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] lsegelems(l1, l2)
(set-option :timeout 0)
(push) ; 8
(pop) ; 8
; Joined path conditions
; [eval] Seq(old(l2.val))
; [eval] old(l2.val)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 8
(assert (not (Seq_equal
  (lsegelems ($Snap.combine
    ($Snap.first ($Snap.first $t@4@01))
    ($Snap.combine ($Snap.first ($Snap.second ($Snap.first $t@4@01))) $Snap.unit)) l1@2@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
  (Seq_append
    (lsegelems ($Snap.first $t@4@01) l1@2@01 l2@3@01)
    (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@4@01))))))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= l1@2@01 l2@3@01)))
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
    ($Snap.combine
      ($Snap.first ($Snap.second $t@4@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
        $Snap.unit))
    ($Snap.combine
      ($Snap.first ($Snap.first $t@4@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@4@01)))
        $Snap.unit))))))
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
    ($Snap.combine
      ($Snap.first ($Snap.first $t@4@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@4@01)))
        $Snap.unit))
    ($Snap.combine
      ($Snap.first ($Snap.second $t@4@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
        $Snap.unit))))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [eval] lsegelems(l1, old(l2.next)) == old(lsegelems(l1, l2)) ++ Seq(old(l2.val))
; [eval] lsegelems(l1, old(l2.next))
; [eval] old(l2.next)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 8
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (= l2@3@01 l1@2@01)
  (=
    end@10@01
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
; Joined path conditions
; [eval] old(lsegelems(l1, l2)) ++ Seq(old(l2.val))
; [eval] old(lsegelems(l1, l2))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] lsegelems(l1, l2)
(set-option :timeout 0)
(push) ; 8
(pop) ; 8
; Joined path conditions
; [eval] Seq(old(l2.val))
; [eval] old(l2.val)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 8
(assert (not (Seq_equal
  (lsegelems ($Snap.combine
    ($Snap.first ($Snap.first $t@4@01))
    ($Snap.combine ($Snap.first ($Snap.second ($Snap.first $t@4@01))) $Snap.unit)) l1@2@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
  (Seq_append
    (lsegelems ($Snap.first $t@4@01) l1@2@01 l2@3@01)
    (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@4@01))))))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
