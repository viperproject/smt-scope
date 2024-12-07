(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:43:18
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/functions/linkedlists.vpr
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
(declare-fun length ($Snap $Ref) Int)
(declare-fun length%limited ($Snap $Ref) Int)
(declare-fun length%stateless ($Ref) Bool)
(declare-fun length%precondition ($Snap $Ref) Bool)
(declare-fun head ($Snap $Ref) Int)
(declare-fun head%limited ($Snap $Ref) Int)
(declare-fun head%stateless ($Ref) Bool)
(declare-fun head%precondition ($Snap $Ref) Bool)
(declare-fun tail ($Snap $Ref) $Ref)
(declare-fun tail%limited ($Snap $Ref) $Ref)
(declare-fun tail%stateless ($Ref) Bool)
(declare-fun tail%precondition ($Snap $Ref) Bool)
(declare-fun get ($Snap $Ref Int) Int)
(declare-fun get%limited ($Snap $Ref Int) Int)
(declare-fun get%stateless ($Ref Int) Bool)
(declare-fun get%precondition ($Snap $Ref Int) Bool)
(declare-fun elems ($Snap $Ref) Seq<Int>)
(declare-fun elems%limited ($Snap $Ref) Seq<Int>)
(declare-fun elems%stateless ($Ref) Bool)
(declare-fun elems%precondition ($Snap $Ref) Bool)
(declare-fun ascending ($Snap $Ref) Bool)
(declare-fun ascending%limited ($Snap $Ref) Bool)
(declare-fun ascending%stateless ($Ref) Bool)
(declare-fun ascending%precondition ($Snap $Ref) Bool)
(declare-fun contains ($Snap $Ref Int) Bool)
(declare-fun contains%limited ($Snap $Ref Int) Bool)
(declare-fun contains%stateless ($Ref Int) Bool)
(declare-fun contains%precondition ($Snap $Ref Int) Bool)
(declare-fun sum ($Snap $Ref) Int)
(declare-fun sum%limited ($Snap $Ref) Int)
(declare-fun sum%stateless ($Ref) Bool)
(declare-fun sum%precondition ($Snap $Ref) Bool)
(declare-fun last ($Snap $Ref) Int)
(declare-fun last%limited ($Snap $Ref) Int)
(declare-fun last%stateless ($Ref) Bool)
(declare-fun last%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun list%trigger ($Snap $Ref) Bool)
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
(declare-fun joined_unfolding@21@00 ($Snap $Ref) Int)
(declare-fun joined_unfolding@22@00 ($Snap $Ref) Int)
(declare-fun joined_unfolding@23@00 ($Snap $Ref) $Ref)
(declare-fun joined_unfolding@24@00 ($Snap $Ref Int) Int)
(declare-fun joined_unfolding@25@00 ($Snap $Ref) Seq<Int>)
(declare-fun joined_unfolding@26@00 ($Snap $Ref) Bool)
(declare-fun joined_unfolding@27@00 ($Snap $Ref Int) Bool)
(declare-fun joined_unfolding@28@00 ($Snap $Ref) Int)
(declare-fun joined_unfolding@29@00 ($Snap $Ref) Int)
(assert (forall ((s@$ $Snap) (xs@0@00 $Ref)) (!
  (= (length%limited s@$ xs@0@00) (length s@$ xs@0@00))
  :pattern ((length s@$ xs@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (xs@0@00 $Ref)) (!
  (length%stateless xs@0@00)
  :pattern ((length%limited s@$ xs@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (xs@0@00 $Ref)) (!
  (let ((result@1@00 (length%limited s@$ xs@0@00))) (=>
    (length%precondition s@$ xs@0@00)
    (> result@1@00 0)))
  :pattern ((length%limited s@$ xs@0@00))
  :qid |quant-u-18|)))
(assert (forall ((s@$ $Snap) (xs@0@00 $Ref)) (!
  (let ((result@1@00 (length%limited s@$ xs@0@00))) true)
  :pattern ((length%limited s@$ xs@0@00))
  :qid |quant-u-19|)))
(assert (forall ((s@$ $Snap) (xs@0@00 $Ref)) (!
  (=>
    (length%precondition s@$ xs@0@00)
    (=
      (length s@$ xs@0@00)
      (+
        1
        (ite
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))
            $Ref.null)
          0
          (length%limited ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
            $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))))))))
  :pattern ((length s@$ xs@0@00))
  :pattern ((length%stateless xs@0@00) (list%trigger ($Snap.first s@$) xs@0@00))
  :qid |quant-u-20|)))
(assert (forall ((s@$ $Snap) (xs@0@00 $Ref)) (!
  (=>
    (length%precondition s@$ xs@0@00)
    (ite
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)
      true
      (length%precondition ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
        $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))))))
  :pattern ((length s@$ xs@0@00))
  :qid |quant-u-21|)))
(assert (forall ((s@$ $Snap) (xs@2@00 $Ref)) (!
  (= (head%limited s@$ xs@2@00) (head s@$ xs@2@00))
  :pattern ((head s@$ xs@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (xs@2@00 $Ref)) (!
  (head%stateless xs@2@00)
  :pattern ((head%limited s@$ xs@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (xs@2@00 $Ref)) (!
  (=>
    (head%precondition s@$ xs@2@00)
    (=
      (head s@$ xs@2@00)
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$))))))
  :pattern ((head s@$ xs@2@00))
  :qid |quant-u-22|)))
(assert (forall ((s@$ $Snap) (xs@2@00 $Ref)) (!
  true
  :pattern ((head s@$ xs@2@00))
  :qid |quant-u-23|)))
(assert (forall ((s@$ $Snap) (xs@4@00 $Ref)) (!
  (= (tail%limited s@$ xs@4@00) (tail s@$ xs@4@00))
  :pattern ((tail s@$ xs@4@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (xs@4@00 $Ref)) (!
  (tail%stateless xs@4@00)
  :pattern ((tail%limited s@$ xs@4@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (xs@4@00 $Ref)) (!
  (=>
    (tail%precondition s@$ xs@4@00)
    (=
      (tail s@$ xs@4@00)
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))))
  :pattern ((tail s@$ xs@4@00))
  :qid |quant-u-24|)))
(assert (forall ((s@$ $Snap) (xs@4@00 $Ref)) (!
  true
  :pattern ((tail s@$ xs@4@00))
  :qid |quant-u-25|)))
(assert (forall ((s@$ $Snap) (xs@6@00 $Ref) (index@7@00 Int)) (!
  (= (get%limited s@$ xs@6@00 index@7@00) (get s@$ xs@6@00 index@7@00))
  :pattern ((get s@$ xs@6@00 index@7@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (xs@6@00 $Ref) (index@7@00 Int)) (!
  (get%stateless xs@6@00 index@7@00)
  :pattern ((get%limited s@$ xs@6@00 index@7@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (xs@6@00 $Ref) (index@7@00 Int)) (!
  (=>
    (get%precondition s@$ xs@6@00 index@7@00)
    (=
      (get s@$ xs@6@00 index@7@00)
      (ite
        (= index@7@00 0)
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$))))
        (get%limited ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) (-
          index@7@00
          1)))))
  :pattern ((get s@$ xs@6@00 index@7@00))
  :pattern ((get%stateless xs@6@00 index@7@00) (list%trigger ($Snap.first s@$) xs@6@00))
  :qid |quant-u-26|)))
(assert (forall ((s@$ $Snap) (xs@6@00 $Ref) (index@7@00 Int)) (!
  (=>
    (get%precondition s@$ xs@6@00 index@7@00)
    (ite
      (= index@7@00 0)
      true
      (get%precondition ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) (-
        index@7@00
        1))))
  :pattern ((get s@$ xs@6@00 index@7@00))
  :qid |quant-u-27|)))
(assert (forall ((s@$ $Snap) (xs@9@00 $Ref)) (!
  (= (elems%limited s@$ xs@9@00) (elems s@$ xs@9@00))
  :pattern ((elems s@$ xs@9@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (xs@9@00 $Ref)) (!
  (elems%stateless xs@9@00)
  :pattern ((elems%limited s@$ xs@9@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (xs@9@00 $Ref)) (!
  (=>
    (elems%precondition s@$ xs@9@00)
    (=
      (elems s@$ xs@9@00)
      (Seq_append
        (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$)))))
        (ite
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))
            $Ref.null)
          (as Seq_empty  Seq<Int>)
          (elems%limited ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
            $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))))))))
  :pattern ((elems s@$ xs@9@00))
  :pattern ((elems%stateless xs@9@00) (list%trigger ($Snap.first s@$) xs@9@00))
  :qid |quant-u-28|)))
(assert (forall ((s@$ $Snap) (xs@9@00 $Ref)) (!
  (=>
    (elems%precondition s@$ xs@9@00)
    (ite
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)
      true
      (elems%precondition ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
        $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))))))
  :pattern ((elems s@$ xs@9@00))
  :qid |quant-u-29|)))
(assert (forall ((s@$ $Snap) (xs@11@00 $Ref)) (!
  (= (ascending%limited s@$ xs@11@00) (ascending s@$ xs@11@00))
  :pattern ((ascending s@$ xs@11@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (xs@11@00 $Ref)) (!
  (ascending%stateless xs@11@00)
  :pattern ((ascending%limited s@$ xs@11@00))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap) (xs@11@00 $Ref)) (!
  (=>
    (ascending%precondition s@$ xs@11@00)
    (=
      (ascending s@$ xs@11@00)
      (or
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)
        (and
          (<=
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$))))
            (head ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
              $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))))
          (ascending%limited ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
            $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))))))))
  :pattern ((ascending s@$ xs@11@00))
  :pattern ((ascending%stateless xs@11@00) (list%trigger ($Snap.first s@$) xs@11@00))
  :qid |quant-u-30|)))
(assert (forall ((s@$ $Snap) (xs@11@00 $Ref)) (!
  (=>
    (and
      (ascending%precondition s@$ xs@11@00)
      (not
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)))
    (and
      (head%precondition ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
        $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))))
      (=>
        (<=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$))))
          (head ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
            $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))))
        (ascending%precondition ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
          $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))))))
  :pattern ((ascending s@$ xs@11@00))
  :qid |quant-u-31|)))
(assert (forall ((s@$ $Snap) (xs@13@00 $Ref) (x@14@00 Int)) (!
  (= (contains%limited s@$ xs@13@00 x@14@00) (contains s@$ xs@13@00 x@14@00))
  :pattern ((contains s@$ xs@13@00 x@14@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (xs@13@00 $Ref) (x@14@00 Int)) (!
  (contains%stateless xs@13@00 x@14@00)
  :pattern ((contains%limited s@$ xs@13@00 x@14@00))
  :qid |quant-u-13|)))
(assert (forall ((s@$ $Snap) (xs@13@00 $Ref) (x@14@00 Int)) (!
  (=>
    (contains%precondition s@$ xs@13@00 x@14@00)
    (=
      (contains s@$ xs@13@00 x@14@00)
      (or
        (=
          x@14@00
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$)))))
        (and
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))
              $Ref.null))
          (contains%limited ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
            $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) x@14@00)))))
  :pattern ((contains s@$ xs@13@00 x@14@00))
  :pattern ((contains%stateless xs@13@00 x@14@00) (list%trigger ($Snap.first s@$) xs@13@00))
  :qid |quant-u-32|)))
(assert (forall ((s@$ $Snap) (xs@13@00 $Ref) (x@14@00 Int)) (!
  (=>
    (and
      (contains%precondition s@$ xs@13@00 x@14@00)
      (and
        (not
          (=
            x@14@00
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$))))))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))
            $Ref.null))))
    (contains%precondition ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) x@14@00))
  :pattern ((contains s@$ xs@13@00 x@14@00))
  :qid |quant-u-33|)))
(assert (forall ((s@$ $Snap) (xs@16@00 $Ref)) (!
  (= (sum%limited s@$ xs@16@00) (sum s@$ xs@16@00))
  :pattern ((sum s@$ xs@16@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (xs@16@00 $Ref)) (!
  (sum%stateless xs@16@00)
  :pattern ((sum%limited s@$ xs@16@00))
  :qid |quant-u-15|)))
(assert (forall ((s@$ $Snap) (xs@16@00 $Ref)) (!
  (=>
    (sum%precondition s@$ xs@16@00)
    (=
      (sum s@$ xs@16@00)
      (+
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$))))
        (ite
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))
            $Ref.null)
          0
          (sum%limited ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
            $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))))))))
  :pattern ((sum s@$ xs@16@00))
  :pattern ((sum%stateless xs@16@00) (list%trigger ($Snap.first s@$) xs@16@00))
  :qid |quant-u-34|)))
(assert (forall ((s@$ $Snap) (xs@16@00 $Ref)) (!
  (=>
    (sum%precondition s@$ xs@16@00)
    (ite
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)
      true
      (sum%precondition ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
        $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))))))
  :pattern ((sum s@$ xs@16@00))
  :qid |quant-u-35|)))
(assert (forall ((s@$ $Snap) (xs@18@00 $Ref)) (!
  (= (last%limited s@$ xs@18@00) (last s@$ xs@18@00))
  :pattern ((last s@$ xs@18@00))
  :qid |quant-u-16|)))
(assert (forall ((s@$ $Snap) (xs@18@00 $Ref)) (!
  (last%stateless xs@18@00)
  :pattern ((last%limited s@$ xs@18@00))
  :qid |quant-u-17|)))
(assert (forall ((s@$ $Snap) (xs@18@00 $Ref)) (!
  (=>
    (last%precondition s@$ xs@18@00)
    (=
      (last s@$ xs@18@00)
      (ite
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$))))
        (last%limited ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
          $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))))))
  :pattern ((last s@$ xs@18@00))
  :pattern ((last%stateless xs@18@00) (list%trigger ($Snap.first s@$) xs@18@00))
  :qid |quant-u-36|)))
(assert (forall ((s@$ $Snap) (xs@18@00 $Ref)) (!
  (=>
    (last%precondition s@$ xs@18@00)
    (ite
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)
      true
      (last%precondition ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
        $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))))))
  :pattern ((last s@$ xs@18@00))
  :qid |quant-u-37|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- prepend ----------
(declare-const xs@0@01 $Ref)
(declare-const y@1@01 Int)
(declare-const ys@2@01 $Ref)
(declare-const xs@3@01 $Ref)
(declare-const y@4@01 Int)
(declare-const ys@5@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 ($Snap.combine ($Snap.first $t@6@01) ($Snap.second $t@6@01))))
(assert (= ($Snap.second $t@6@01) $Snap.unit))
; [eval] xs != null
(assert (not (= xs@3@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@7@01 $Snap)
(assert (= $t@7@01 ($Snap.combine ($Snap.first $t@7@01) ($Snap.second $t@7@01))))
(assert (=
  ($Snap.second $t@7@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@7@01))
    ($Snap.second ($Snap.second $t@7@01)))))
(assert (= ($Snap.first ($Snap.second $t@7@01)) $Snap.unit))
; [eval] ys != null
(assert (not (= ys@5@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second $t@7@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@7@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@7@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@7@01))) $Snap.unit))
; [eval] length(ys) == old(length(xs)) + 1
; [eval] length(ys)
(push) ; 3
; [eval] xs != null
(assert (length%precondition ($Snap.combine ($Snap.first $t@7@01) $Snap.unit) ys@5@01))
(pop) ; 3
; Joined path conditions
(assert (length%precondition ($Snap.combine ($Snap.first $t@7@01) $Snap.unit) ys@5@01))
; [eval] old(length(xs)) + 1
; [eval] old(length(xs))
; [eval] length(xs)
(push) ; 3
; [eval] xs != null
(assert (length%precondition ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))
(pop) ; 3
; Joined path conditions
(assert (length%precondition ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))
(assert (=
  (length ($Snap.combine ($Snap.first $t@7@01) $Snap.unit) ys@5@01)
  (+ (length ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01) 1)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@7@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@7@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@7@01)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@7@01)))) $Snap.unit))
; [eval] elems(ys) == Seq(y) ++ old(elems(xs))
; [eval] elems(ys)
(push) ; 3
; [eval] xs != null
(assert (elems%precondition ($Snap.combine ($Snap.first $t@7@01) $Snap.unit) ys@5@01))
(pop) ; 3
; Joined path conditions
(assert (elems%precondition ($Snap.combine ($Snap.first $t@7@01) $Snap.unit) ys@5@01))
; [eval] Seq(y) ++ old(elems(xs))
; [eval] Seq(y)
(assert (= (Seq_length (Seq_singleton y@4@01)) 1))
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 3
; [eval] xs != null
(assert (elems%precondition ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))
(pop) ; 3
; Joined path conditions
(assert (elems%precondition ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))
(assert (Seq_equal
  (elems ($Snap.combine ($Snap.first $t@7@01) $Snap.unit) ys@5@01)
  (Seq_append
    (Seq_singleton y@4@01)
    (elems ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@7@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@7@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@7@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@7@01)))))
  $Snap.unit))
; [eval] head(ys) == y
; [eval] head(ys)
(push) ; 3
; [eval] xs != null
(assert (head%precondition ($Snap.combine ($Snap.first $t@7@01) $Snap.unit) ys@5@01))
(pop) ; 3
; Joined path conditions
(assert (head%precondition ($Snap.combine ($Snap.first $t@7@01) $Snap.unit) ys@5@01))
(assert (= (head ($Snap.combine ($Snap.first $t@7@01) $Snap.unit) ys@5@01) y@4@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@7@01)))))
  $Snap.unit))
; [eval] old(y <= head(xs) && ascending(xs)) ==> ascending(ys)
; [eval] old(y <= head(xs) && ascending(xs))
; [eval] y <= head(xs) && ascending(xs)
; [eval] y <= head(xs)
; [eval] head(xs)
(push) ; 3
; [eval] xs != null
(assert (head%precondition ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))
(pop) ; 3
; Joined path conditions
(assert (head%precondition ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))
(push) ; 3
; [then-branch: 0 | !(y@4@01 <= head((First:($t@6@01), _), xs@3@01)) | live]
; [else-branch: 0 | y@4@01 <= head((First:($t@6@01), _), xs@3@01) | live]
(push) ; 4
; [then-branch: 0 | !(y@4@01 <= head((First:($t@6@01), _), xs@3@01))]
(assert (not (<= y@4@01 (head ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | y@4@01 <= head((First:($t@6@01), _), xs@3@01)]
(assert (<= y@4@01 (head ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01)))
; [eval] ascending(xs)
(push) ; 5
; [eval] xs != null
(assert (ascending%precondition ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))
(pop) ; 5
; Joined path conditions
(assert (ascending%precondition ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= y@4@01 (head ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))
  (and
    (<= y@4@01 (head ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))
    (ascending%precondition ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))))
(assert (or
  (<= y@4@01 (head ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))
  (not
    (<= y@4@01 (head ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01)))))
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (and
    (<= y@4@01 (head ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))
    (ascending ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (<= y@4@01 (head ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))
  (ascending ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | y@4@01 <= head((First:($t@6@01), _), xs@3@01) && ascending((First:($t@6@01), _), xs@3@01) | live]
; [else-branch: 1 | !(y@4@01 <= head((First:($t@6@01), _), xs@3@01) && ascending((First:($t@6@01), _), xs@3@01)) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 1 | y@4@01 <= head((First:($t@6@01), _), xs@3@01) && ascending((First:($t@6@01), _), xs@3@01)]
(assert (and
  (<= y@4@01 (head ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))
  (ascending ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01)))
; [eval] ascending(ys)
(push) ; 5
; [eval] xs != null
(assert (ascending%precondition ($Snap.combine ($Snap.first $t@7@01) $Snap.unit) ys@5@01))
(pop) ; 5
; Joined path conditions
(assert (ascending%precondition ($Snap.combine ($Snap.first $t@7@01) $Snap.unit) ys@5@01))
(pop) ; 4
(push) ; 4
; [else-branch: 1 | !(y@4@01 <= head((First:($t@6@01), _), xs@3@01) && ascending((First:($t@6@01), _), xs@3@01))]
(assert (not
  (and
    (<= y@4@01 (head ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))
    (ascending ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (<= y@4@01 (head ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))
    (ascending ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))
  (and
    (<= y@4@01 (head ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))
    (ascending ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01)
    (ascending%precondition ($Snap.combine ($Snap.first $t@7@01) $Snap.unit) ys@5@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= y@4@01 (head ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))
      (ascending ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01)))
  (and
    (<= y@4@01 (head ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))
    (ascending ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))))
(assert (=>
  (and
    (<= y@4@01 (head ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))
    (ascending ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))
  (ascending ($Snap.combine ($Snap.first $t@7@01) $Snap.unit) ys@5@01)))
(pop) ; 2
(push) ; 2
; [exec]
; ys := new(val, next)
(declare-const ys@8@01 $Ref)
(assert (not (= ys@8@01 $Ref.null)))
(declare-const val@9@01 Int)
(declare-const next@10@01 $Ref)
(assert (not (= ys@8@01 ys@5@01)))
(assert (not (= ys@8@01 xs@3@01)))
; [exec]
; ys.val := y
; [exec]
; ys.next := xs
; [exec]
; fold acc(list(ys), write)
; [eval] xs.next != null
(push) ; 3
(set-option :timeout 10)
(assert (not (= xs@3@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | xs@3@01 != Null | live]
; [else-branch: 2 | xs@3@01 == Null | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 2 | xs@3@01 != Null]
; [eval] xs.next != null
(assert (list%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap xs@3@01)
  ($Snap.combine
    ($SortWrappers.IntTo$Snap y@4@01)
    ($Snap.combine ($Snap.first $t@6@01) $Snap.unit))) ys@8@01))
; [eval] ys != null
; [eval] length(ys) == old(length(xs)) + 1
; [eval] length(ys)
(push) ; 4
; [eval] xs != null
(assert (length%precondition ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap xs@3@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap y@4@01)
      ($Snap.combine ($Snap.first $t@6@01) $Snap.unit)))
  $Snap.unit) ys@8@01))
(pop) ; 4
; Joined path conditions
(assert (length%precondition ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap xs@3@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap y@4@01)
      ($Snap.combine ($Snap.first $t@6@01) $Snap.unit)))
  $Snap.unit) ys@8@01))
; [eval] old(length(xs)) + 1
; [eval] old(length(xs))
; [eval] length(xs)
(push) ; 4
; [eval] xs != null
(assert (length%precondition ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))
(pop) ; 4
; Joined path conditions
(assert (length%precondition ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))
(push) ; 4
(assert (not (=
  (length ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap xs@3@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap y@4@01)
        ($Snap.combine ($Snap.first $t@6@01) $Snap.unit)))
    $Snap.unit) ys@8@01)
  (+ (length ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01) 1))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  (length ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap xs@3@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap y@4@01)
        ($Snap.combine ($Snap.first $t@6@01) $Snap.unit)))
    $Snap.unit) ys@8@01)
  (+ (length ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01) 1)))
; [eval] elems(ys) == Seq(y) ++ old(elems(xs))
; [eval] elems(ys)
(push) ; 4
; [eval] xs != null
(assert (elems%precondition ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap xs@3@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap y@4@01)
      ($Snap.combine ($Snap.first $t@6@01) $Snap.unit)))
  $Snap.unit) ys@8@01))
(pop) ; 4
; Joined path conditions
(assert (elems%precondition ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap xs@3@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap y@4@01)
      ($Snap.combine ($Snap.first $t@6@01) $Snap.unit)))
  $Snap.unit) ys@8@01))
; [eval] Seq(y) ++ old(elems(xs))
; [eval] Seq(y)
(assert (= (Seq_length (Seq_singleton y@4@01)) 1))
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 4
; [eval] xs != null
(assert (elems%precondition ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))
(pop) ; 4
; Joined path conditions
(assert (elems%precondition ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))
(push) ; 4
(assert (not (Seq_equal
  (elems ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap xs@3@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap y@4@01)
        ($Snap.combine ($Snap.first $t@6@01) $Snap.unit)))
    $Snap.unit) ys@8@01)
  (Seq_append
    (Seq_singleton y@4@01)
    (elems ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (elems ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap xs@3@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap y@4@01)
        ($Snap.combine ($Snap.first $t@6@01) $Snap.unit)))
    $Snap.unit) ys@8@01)
  (Seq_append
    (Seq_singleton y@4@01)
    (elems ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))))
; [eval] head(ys) == y
; [eval] head(ys)
(push) ; 4
; [eval] xs != null
(assert (head%precondition ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap xs@3@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap y@4@01)
      ($Snap.combine ($Snap.first $t@6@01) $Snap.unit)))
  $Snap.unit) ys@8@01))
(pop) ; 4
; Joined path conditions
(assert (head%precondition ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap xs@3@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap y@4@01)
      ($Snap.combine ($Snap.first $t@6@01) $Snap.unit)))
  $Snap.unit) ys@8@01))
(push) ; 4
(assert (not (=
  (head ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap xs@3@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap y@4@01)
        ($Snap.combine ($Snap.first $t@6@01) $Snap.unit)))
    $Snap.unit) ys@8@01)
  y@4@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  (head ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap xs@3@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap y@4@01)
        ($Snap.combine ($Snap.first $t@6@01) $Snap.unit)))
    $Snap.unit) ys@8@01)
  y@4@01))
; [eval] old(y <= head(xs) && ascending(xs)) ==> ascending(ys)
; [eval] old(y <= head(xs) && ascending(xs))
; [eval] y <= head(xs) && ascending(xs)
; [eval] y <= head(xs)
; [eval] head(xs)
(push) ; 4
; [eval] xs != null
(assert (head%precondition ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))
(pop) ; 4
; Joined path conditions
(assert (head%precondition ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))
(push) ; 4
; [then-branch: 3 | !(y@4@01 <= head((First:($t@6@01), _), xs@3@01)) | live]
; [else-branch: 3 | y@4@01 <= head((First:($t@6@01), _), xs@3@01) | live]
(push) ; 5
; [then-branch: 3 | !(y@4@01 <= head((First:($t@6@01), _), xs@3@01))]
(assert (not (<= y@4@01 (head ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 3 | y@4@01 <= head((First:($t@6@01), _), xs@3@01)]
(assert (<= y@4@01 (head ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01)))
; [eval] ascending(xs)
(push) ; 6
; [eval] xs != null
(assert (ascending%precondition ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))
(pop) ; 6
; Joined path conditions
(assert (ascending%precondition ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= y@4@01 (head ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))
  (and
    (<= y@4@01 (head ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))
    (ascending%precondition ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))))
(assert (or
  (<= y@4@01 (head ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))
  (not
    (<= y@4@01 (head ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01)))))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (and
    (<= y@4@01 (head ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))
    (ascending ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (<= y@4@01 (head ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))
  (ascending ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | y@4@01 <= head((First:($t@6@01), _), xs@3@01) && ascending((First:($t@6@01), _), xs@3@01) | live]
; [else-branch: 4 | !(y@4@01 <= head((First:($t@6@01), _), xs@3@01) && ascending((First:($t@6@01), _), xs@3@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 4 | y@4@01 <= head((First:($t@6@01), _), xs@3@01) && ascending((First:($t@6@01), _), xs@3@01)]
(assert (and
  (<= y@4@01 (head ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))
  (ascending ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01)))
; [eval] ascending(ys)
(push) ; 6
; [eval] xs != null
(assert (ascending%precondition ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap xs@3@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap y@4@01)
      ($Snap.combine ($Snap.first $t@6@01) $Snap.unit)))
  $Snap.unit) ys@8@01))
(pop) ; 6
; Joined path conditions
(assert (ascending%precondition ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap xs@3@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap y@4@01)
      ($Snap.combine ($Snap.first $t@6@01) $Snap.unit)))
  $Snap.unit) ys@8@01))
(pop) ; 5
(push) ; 5
; [else-branch: 4 | !(y@4@01 <= head((First:($t@6@01), _), xs@3@01) && ascending((First:($t@6@01), _), xs@3@01))]
(assert (not
  (and
    (<= y@4@01 (head ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))
    (ascending ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (<= y@4@01 (head ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))
    (ascending ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))
  (and
    (<= y@4@01 (head ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))
    (ascending ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01)
    (ascending%precondition ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap xs@3@01)
        ($Snap.combine
          ($SortWrappers.IntTo$Snap y@4@01)
          ($Snap.combine ($Snap.first $t@6@01) $Snap.unit)))
      $Snap.unit) ys@8@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= y@4@01 (head ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))
      (ascending ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01)))
  (and
    (<= y@4@01 (head ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))
    (ascending ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))))
(push) ; 4
(assert (not (=>
  (and
    (<= y@4@01 (head ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))
    (ascending ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))
  (ascending ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap xs@3@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap y@4@01)
        ($Snap.combine ($Snap.first $t@6@01) $Snap.unit)))
    $Snap.unit) ys@8@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (and
    (<= y@4@01 (head ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))
    (ascending ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) xs@3@01))
  (ascending ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap xs@3@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap y@4@01)
        ($Snap.combine ($Snap.first $t@6@01) $Snap.unit)))
    $Snap.unit) ys@8@01)))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- append ----------
(declare-const xs@11@01 $Ref)
(declare-const y@12@01 Int)
(declare-const xs@13@01 $Ref)
(declare-const y@14@01 Int)
(push) ; 1
(declare-const $t@15@01 $Snap)
(assert (= $t@15@01 ($Snap.combine ($Snap.first $t@15@01) ($Snap.second $t@15@01))))
(assert (= ($Snap.second $t@15@01) $Snap.unit))
; [eval] xs != null
(assert (not (= xs@13@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@16@01 $Snap)
(assert (= $t@16@01 ($Snap.combine ($Snap.first $t@16@01) ($Snap.second $t@16@01))))
(assert (=
  ($Snap.second $t@16@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@16@01))
    ($Snap.second ($Snap.second $t@16@01)))))
(assert (= ($Snap.first ($Snap.second $t@16@01)) $Snap.unit))
; [eval] xs != null
(assert (=
  ($Snap.second ($Snap.second $t@16@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@16@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@16@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@16@01))) $Snap.unit))
; [eval] length(xs) == old(length(xs)) + 1
; [eval] length(xs)
(push) ; 3
; [eval] xs != null
(assert (length%precondition ($Snap.combine ($Snap.first $t@16@01) $Snap.unit) xs@13@01))
(pop) ; 3
; Joined path conditions
(assert (length%precondition ($Snap.combine ($Snap.first $t@16@01) $Snap.unit) xs@13@01))
; [eval] old(length(xs)) + 1
; [eval] old(length(xs))
; [eval] length(xs)
(push) ; 3
; [eval] xs != null
(assert (length%precondition ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
(pop) ; 3
; Joined path conditions
(assert (length%precondition ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
(assert (=
  (length ($Snap.combine ($Snap.first $t@16@01) $Snap.unit) xs@13@01)
  (+ (length ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01) 1)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@16@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@16@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@16@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@16@01))))
  $Snap.unit))
; [eval] elems(xs) == old(elems(xs)) ++ Seq(y)
; [eval] elems(xs)
(push) ; 3
; [eval] xs != null
(assert (elems%precondition ($Snap.combine ($Snap.first $t@16@01) $Snap.unit) xs@13@01))
(pop) ; 3
; Joined path conditions
(assert (elems%precondition ($Snap.combine ($Snap.first $t@16@01) $Snap.unit) xs@13@01))
; [eval] old(elems(xs)) ++ Seq(y)
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 3
; [eval] xs != null
(assert (elems%precondition ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
(pop) ; 3
; Joined path conditions
(assert (elems%precondition ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
; [eval] Seq(y)
(assert (= (Seq_length (Seq_singleton y@14@01)) 1))
(assert (Seq_equal
  (elems ($Snap.combine ($Snap.first $t@16@01) $Snap.unit) xs@13@01)
  (Seq_append
    (elems ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01)
    (Seq_singleton y@14@01))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@16@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@16@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@16@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@16@01)))))
  $Snap.unit))
; [eval] head(xs) == old(head(xs))
; [eval] head(xs)
(push) ; 3
; [eval] xs != null
(assert (head%precondition ($Snap.combine ($Snap.first $t@16@01) $Snap.unit) xs@13@01))
(pop) ; 3
; Joined path conditions
(assert (head%precondition ($Snap.combine ($Snap.first $t@16@01) $Snap.unit) xs@13@01))
; [eval] old(head(xs))
; [eval] head(xs)
(push) ; 3
; [eval] xs != null
(assert (head%precondition ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
(pop) ; 3
; Joined path conditions
(assert (head%precondition ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
(assert (=
  (head ($Snap.combine ($Snap.first $t@16@01) $Snap.unit) xs@13@01)
  (head ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@16@01)))))
  $Snap.unit))
; [eval] old(y >= last(xs) && ascending(xs)) ==> ascending(xs)
; [eval] old(y >= last(xs) && ascending(xs))
; [eval] y >= last(xs) && ascending(xs)
; [eval] y >= last(xs)
; [eval] last(xs)
(push) ; 3
; [eval] xs != null
(assert (last%precondition ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
(pop) ; 3
; Joined path conditions
(assert (last%precondition ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
(push) ; 3
; [then-branch: 5 | !(y@14@01 >= last((First:($t@15@01), _), xs@13@01)) | live]
; [else-branch: 5 | y@14@01 >= last((First:($t@15@01), _), xs@13@01) | live]
(push) ; 4
; [then-branch: 5 | !(y@14@01 >= last((First:($t@15@01), _), xs@13@01))]
(assert (not
  (>= y@14@01 (last ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))))
(pop) ; 4
(push) ; 4
; [else-branch: 5 | y@14@01 >= last((First:($t@15@01), _), xs@13@01)]
(assert (>= y@14@01 (last ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01)))
; [eval] ascending(xs)
(push) ; 5
; [eval] xs != null
(assert (ascending%precondition ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
(pop) ; 5
; Joined path conditions
(assert (ascending%precondition ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= y@14@01 (last ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
  (and
    (>=
      y@14@01
      (last ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
    (ascending%precondition ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))))
(assert (or
  (>= y@14@01 (last ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
  (not
    (>=
      y@14@01
      (last ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01)))))
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (and
    (>=
      y@14@01
      (last ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
    (ascending ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (>= y@14@01 (last ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
  (ascending ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | y@14@01 >= last((First:($t@15@01), _), xs@13@01) && ascending((First:($t@15@01), _), xs@13@01) | live]
; [else-branch: 6 | !(y@14@01 >= last((First:($t@15@01), _), xs@13@01) && ascending((First:($t@15@01), _), xs@13@01)) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 6 | y@14@01 >= last((First:($t@15@01), _), xs@13@01) && ascending((First:($t@15@01), _), xs@13@01)]
(assert (and
  (>= y@14@01 (last ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
  (ascending ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01)))
; [eval] ascending(xs)
(push) ; 5
; [eval] xs != null
(assert (ascending%precondition ($Snap.combine ($Snap.first $t@16@01) $Snap.unit) xs@13@01))
(pop) ; 5
; Joined path conditions
(assert (ascending%precondition ($Snap.combine ($Snap.first $t@16@01) $Snap.unit) xs@13@01))
(pop) ; 4
(push) ; 4
; [else-branch: 6 | !(y@14@01 >= last((First:($t@15@01), _), xs@13@01) && ascending((First:($t@15@01), _), xs@13@01))]
(assert (not
  (and
    (>=
      y@14@01
      (last ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
    (ascending ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (>=
      y@14@01
      (last ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
    (ascending ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
  (and
    (>=
      y@14@01
      (last ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
    (ascending ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01)
    (ascending%precondition ($Snap.combine ($Snap.first $t@16@01) $Snap.unit) xs@13@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (>=
        y@14@01
        (last ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
      (ascending ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01)))
  (and
    (>=
      y@14@01
      (last ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
    (ascending ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))))
(assert (=>
  (and
    (>=
      y@14@01
      (last ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
    (ascending ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
  (ascending ($Snap.combine ($Snap.first $t@16@01) $Snap.unit) xs@13@01)))
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(list(xs), write)
(assert (=
  ($Snap.first $t@15@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@15@01))
    ($Snap.second ($Snap.first $t@15@01)))))
(assert (=
  ($Snap.second ($Snap.first $t@15@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@15@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@15@01))))))
; [eval] xs.next != null
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | First:(First:($t@15@01)) != Null | live]
; [else-branch: 7 | First:(First:($t@15@01)) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 7 | First:(First:($t@15@01)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01))) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first $t@15@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@15@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@15@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@15@01))))
  $Snap.unit))
; [eval] xs.next != null
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (list%trigger ($Snap.first $t@15@01) xs@13@01))
; [eval] xs.next == null
; [then-branch: 8 | First:(First:($t@15@01)) == Null | dead]
; [else-branch: 8 | First:(First:($t@15@01)) != Null | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 8 | First:(First:($t@15@01)) != Null]
(pop) ; 4
; [eval] !(xs.next == null)
; [eval] xs.next == null
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | First:(First:($t@15@01)) != Null | live]
; [else-branch: 9 | First:(First:($t@15@01)) == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 9 | First:(First:($t@15@01)) != Null]
; [exec]
; append(xs.next, y)
; [eval] xs != null
(declare-const $t@17@01 $Snap)
(assert (= $t@17@01 ($Snap.combine ($Snap.first $t@17@01) ($Snap.second $t@17@01))))
(assert (=
  ($Snap.second $t@17@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@17@01))
    ($Snap.second ($Snap.second $t@17@01)))))
(assert (= ($Snap.first ($Snap.second $t@17@01)) $Snap.unit))
; [eval] xs != null
(assert (=
  ($Snap.second ($Snap.second $t@17@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@17@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@17@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@17@01))) $Snap.unit))
; [eval] length(xs) == old(length(xs)) + 1
; [eval] length(xs)
(push) ; 5
; [eval] xs != null
(assert (length%precondition ($Snap.combine ($Snap.first $t@17@01) $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01)))))
(pop) ; 5
; Joined path conditions
(assert (length%precondition ($Snap.combine ($Snap.first $t@17@01) $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01)))))
; [eval] old(length(xs)) + 1
; [eval] old(length(xs))
; [eval] length(xs)
(push) ; 5
; [eval] xs != null
(assert (length%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@15@01))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01)))))
(pop) ; 5
; Joined path conditions
(assert (length%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@15@01))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01)))))
(assert (=
  (length ($Snap.combine ($Snap.first $t@17@01) $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01))))
  (+
    (length ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@15@01))))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01))))
    1)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@17@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@17@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))
  $Snap.unit))
; [eval] elems(xs) == old(elems(xs)) ++ Seq(y)
; [eval] elems(xs)
(push) ; 5
; [eval] xs != null
(assert (elems%precondition ($Snap.combine ($Snap.first $t@17@01) $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01)))))
(pop) ; 5
; Joined path conditions
(assert (elems%precondition ($Snap.combine ($Snap.first $t@17@01) $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01)))))
; [eval] old(elems(xs)) ++ Seq(y)
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 5
; [eval] xs != null
(assert (elems%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@15@01))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01)))))
(pop) ; 5
; Joined path conditions
(assert (elems%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@15@01))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01)))))
; [eval] Seq(y)
(assert (= (Seq_length (Seq_singleton y@14@01)) 1))
(assert (Seq_equal
  (elems ($Snap.combine ($Snap.first $t@17@01) $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01))))
  (Seq_append
    (elems ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@15@01))))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01))))
    (Seq_singleton y@14@01))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@17@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@17@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@17@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@17@01)))))
  $Snap.unit))
; [eval] head(xs) == old(head(xs))
; [eval] head(xs)
(push) ; 5
; [eval] xs != null
(assert (head%precondition ($Snap.combine ($Snap.first $t@17@01) $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01)))))
(pop) ; 5
; Joined path conditions
(assert (head%precondition ($Snap.combine ($Snap.first $t@17@01) $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01)))))
; [eval] old(head(xs))
; [eval] head(xs)
(push) ; 5
; [eval] xs != null
(assert (head%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@15@01))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01)))))
(pop) ; 5
; Joined path conditions
(assert (head%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@15@01))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01)))))
(assert (=
  (head ($Snap.combine ($Snap.first $t@17@01) $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01))))
  (head ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@15@01))))
    $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@17@01)))))
  $Snap.unit))
; [eval] old(y >= last(xs) && ascending(xs)) ==> ascending(xs)
; [eval] old(y >= last(xs) && ascending(xs))
; [eval] y >= last(xs) && ascending(xs)
; [eval] y >= last(xs)
; [eval] last(xs)
(push) ; 5
; [eval] xs != null
(assert (last%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@15@01))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01)))))
(pop) ; 5
; Joined path conditions
(assert (last%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@15@01))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01)))))
(push) ; 5
; [then-branch: 10 | !(y@14@01 >= last((First:(Second:(Second:(First:($t@15@01)))), _), First:(First:($t@15@01)))) | live]
; [else-branch: 10 | y@14@01 >= last((First:(Second:(Second:(First:($t@15@01)))), _), First:(First:($t@15@01))) | live]
(push) ; 6
; [then-branch: 10 | !(y@14@01 >= last((First:(Second:(Second:(First:($t@15@01)))), _), First:(First:($t@15@01))))]
(assert (not
  (>=
    y@14@01
    (last ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@15@01))))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01)))))))
(pop) ; 6
(push) ; 6
; [else-branch: 10 | y@14@01 >= last((First:(Second:(Second:(First:($t@15@01)))), _), First:(First:($t@15@01)))]
(assert (>=
  y@14@01
  (last ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@15@01))))
    $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01))))))
; [eval] ascending(xs)
(push) ; 7
; [eval] xs != null
(assert (ascending%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@15@01))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01)))))
(pop) ; 7
; Joined path conditions
(assert (ascending%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@15@01))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (>=
    y@14@01
    (last ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@15@01))))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01)))))
  (and
    (>=
      y@14@01
      (last ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@15@01))))
        $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01)))))
    (ascending%precondition ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@15@01))))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01)))))))
(assert (or
  (>=
    y@14@01
    (last ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@15@01))))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01)))))
  (not
    (>=
      y@14@01
      (last ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@15@01))))
        $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01))))))))
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (not
  (and
    (>=
      y@14@01
      (last ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@15@01))))
        $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01)))))
    (ascending ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@15@01))))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01))))))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (>=
    y@14@01
    (last ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@15@01))))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01)))))
  (ascending ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@15@01))))
    $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01)))))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | y@14@01 >= last((First:(Second:(Second:(First:($t@15@01)))), _), First:(First:($t@15@01))) && ascending((First:(Second:(Second:(First:($t@15@01)))), _), First:(First:($t@15@01))) | live]
; [else-branch: 11 | !(y@14@01 >= last((First:(Second:(Second:(First:($t@15@01)))), _), First:(First:($t@15@01))) && ascending((First:(Second:(Second:(First:($t@15@01)))), _), First:(First:($t@15@01)))) | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 11 | y@14@01 >= last((First:(Second:(Second:(First:($t@15@01)))), _), First:(First:($t@15@01))) && ascending((First:(Second:(Second:(First:($t@15@01)))), _), First:(First:($t@15@01)))]
(assert (and
  (>=
    y@14@01
    (last ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@15@01))))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01)))))
  (ascending ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@15@01))))
    $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01))))))
; [eval] ascending(xs)
(push) ; 7
; [eval] xs != null
(assert (ascending%precondition ($Snap.combine ($Snap.first $t@17@01) $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01)))))
(pop) ; 7
; Joined path conditions
(assert (ascending%precondition ($Snap.combine ($Snap.first $t@17@01) $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01)))))
(pop) ; 6
(push) ; 6
; [else-branch: 11 | !(y@14@01 >= last((First:(Second:(Second:(First:($t@15@01)))), _), First:(First:($t@15@01))) && ascending((First:(Second:(Second:(First:($t@15@01)))), _), First:(First:($t@15@01))))]
(assert (not
  (and
    (>=
      y@14@01
      (last ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@15@01))))
        $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01)))))
    (ascending ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@15@01))))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01)))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (>=
      y@14@01
      (last ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@15@01))))
        $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01)))))
    (ascending ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@15@01))))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01)))))
  (and
    (>=
      y@14@01
      (last ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@15@01))))
        $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01)))))
    (ascending ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@15@01))))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01))))
    (ascending%precondition ($Snap.combine ($Snap.first $t@17@01) $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01)))))))
; Joined path conditions
(assert (or
  (not
    (and
      (>=
        y@14@01
        (last ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@15@01))))
          $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01)))))
      (ascending ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@15@01))))
        $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01))))))
  (and
    (>=
      y@14@01
      (last ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@15@01))))
        $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01)))))
    (ascending ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@15@01))))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01)))))))
(assert (=>
  (and
    (>=
      y@14@01
      (last ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@15@01))))
        $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01)))))
    (ascending ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@15@01))))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01)))))
  (ascending ($Snap.combine ($Snap.first $t@17@01) $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; fold acc(list(xs), write)
; [eval] xs.next != null
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | First:(First:($t@15@01)) != Null | live]
; [else-branch: 12 | First:(First:($t@15@01)) == Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 12 | First:(First:($t@15@01)) != Null]
; [eval] xs.next != null
(assert (list%trigger ($Snap.combine
  ($Snap.first ($Snap.first $t@15@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@15@01)))
    ($Snap.combine ($Snap.first $t@17@01) $Snap.unit))) xs@13@01))
; [eval] xs != null
; [eval] length(xs) == old(length(xs)) + 1
; [eval] length(xs)
(push) ; 6
; [eval] xs != null
(assert (length%precondition ($Snap.combine
  ($Snap.combine
    ($Snap.first ($Snap.first $t@15@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@15@01)))
      ($Snap.combine ($Snap.first $t@17@01) $Snap.unit)))
  $Snap.unit) xs@13@01))
(pop) ; 6
; Joined path conditions
(assert (length%precondition ($Snap.combine
  ($Snap.combine
    ($Snap.first ($Snap.first $t@15@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@15@01)))
      ($Snap.combine ($Snap.first $t@17@01) $Snap.unit)))
  $Snap.unit) xs@13@01))
; [eval] old(length(xs)) + 1
; [eval] old(length(xs))
; [eval] length(xs)
(push) ; 6
; [eval] xs != null
(assert (length%precondition ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
(pop) ; 6
; Joined path conditions
(assert (length%precondition ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
(push) ; 6
(assert (not (=
  (length ($Snap.combine
    ($Snap.combine
      ($Snap.first ($Snap.first $t@15@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@15@01)))
        ($Snap.combine ($Snap.first $t@17@01) $Snap.unit)))
    $Snap.unit) xs@13@01)
  (+ (length ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01) 1))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  (length ($Snap.combine
    ($Snap.combine
      ($Snap.first ($Snap.first $t@15@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@15@01)))
        ($Snap.combine ($Snap.first $t@17@01) $Snap.unit)))
    $Snap.unit) xs@13@01)
  (+ (length ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01) 1)))
; [eval] elems(xs) == old(elems(xs)) ++ Seq(y)
; [eval] elems(xs)
(push) ; 6
; [eval] xs != null
(assert (elems%precondition ($Snap.combine
  ($Snap.combine
    ($Snap.first ($Snap.first $t@15@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@15@01)))
      ($Snap.combine ($Snap.first $t@17@01) $Snap.unit)))
  $Snap.unit) xs@13@01))
(pop) ; 6
; Joined path conditions
(assert (elems%precondition ($Snap.combine
  ($Snap.combine
    ($Snap.first ($Snap.first $t@15@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@15@01)))
      ($Snap.combine ($Snap.first $t@17@01) $Snap.unit)))
  $Snap.unit) xs@13@01))
; [eval] old(elems(xs)) ++ Seq(y)
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 6
; [eval] xs != null
(assert (elems%precondition ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
(pop) ; 6
; Joined path conditions
(assert (elems%precondition ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
; [eval] Seq(y)
(push) ; 6
(assert (not (Seq_equal
  (elems ($Snap.combine
    ($Snap.combine
      ($Snap.first ($Snap.first $t@15@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@15@01)))
        ($Snap.combine ($Snap.first $t@17@01) $Snap.unit)))
    $Snap.unit) xs@13@01)
  (Seq_append
    (elems ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01)
    (Seq_singleton y@14@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (elems ($Snap.combine
    ($Snap.combine
      ($Snap.first ($Snap.first $t@15@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@15@01)))
        ($Snap.combine ($Snap.first $t@17@01) $Snap.unit)))
    $Snap.unit) xs@13@01)
  (Seq_append
    (elems ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01)
    (Seq_singleton y@14@01))))
; [eval] head(xs) == old(head(xs))
; [eval] head(xs)
(push) ; 6
; [eval] xs != null
(assert (head%precondition ($Snap.combine
  ($Snap.combine
    ($Snap.first ($Snap.first $t@15@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@15@01)))
      ($Snap.combine ($Snap.first $t@17@01) $Snap.unit)))
  $Snap.unit) xs@13@01))
(pop) ; 6
; Joined path conditions
(assert (head%precondition ($Snap.combine
  ($Snap.combine
    ($Snap.first ($Snap.first $t@15@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@15@01)))
      ($Snap.combine ($Snap.first $t@17@01) $Snap.unit)))
  $Snap.unit) xs@13@01))
; [eval] old(head(xs))
; [eval] head(xs)
(push) ; 6
; [eval] xs != null
(assert (head%precondition ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
(pop) ; 6
; Joined path conditions
(assert (head%precondition ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
(push) ; 6
(assert (not (=
  (head ($Snap.combine
    ($Snap.combine
      ($Snap.first ($Snap.first $t@15@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@15@01)))
        ($Snap.combine ($Snap.first $t@17@01) $Snap.unit)))
    $Snap.unit) xs@13@01)
  (head ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  (head ($Snap.combine
    ($Snap.combine
      ($Snap.first ($Snap.first $t@15@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@15@01)))
        ($Snap.combine ($Snap.first $t@17@01) $Snap.unit)))
    $Snap.unit) xs@13@01)
  (head ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01)))
; [eval] old(y >= last(xs) && ascending(xs)) ==> ascending(xs)
; [eval] old(y >= last(xs) && ascending(xs))
; [eval] y >= last(xs) && ascending(xs)
; [eval] y >= last(xs)
; [eval] last(xs)
(push) ; 6
; [eval] xs != null
(assert (last%precondition ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
(pop) ; 6
; Joined path conditions
(assert (last%precondition ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
(push) ; 6
; [then-branch: 13 | !(y@14@01 >= last((First:($t@15@01), _), xs@13@01)) | live]
; [else-branch: 13 | y@14@01 >= last((First:($t@15@01), _), xs@13@01) | live]
(push) ; 7
; [then-branch: 13 | !(y@14@01 >= last((First:($t@15@01), _), xs@13@01))]
(assert (not
  (>= y@14@01 (last ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 13 | y@14@01 >= last((First:($t@15@01), _), xs@13@01)]
(assert (>= y@14@01 (last ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01)))
; [eval] ascending(xs)
(push) ; 8
; [eval] xs != null
(assert (ascending%precondition ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
(pop) ; 8
; Joined path conditions
(assert (ascending%precondition ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= y@14@01 (last ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
  (and
    (>=
      y@14@01
      (last ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
    (ascending%precondition ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))))
(assert (or
  (>= y@14@01 (last ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
  (not
    (>=
      y@14@01
      (last ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01)))))
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (and
    (>=
      y@14@01
      (last ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
    (ascending ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (>= y@14@01 (last ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
  (ascending ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 14 | y@14@01 >= last((First:($t@15@01), _), xs@13@01) && ascending((First:($t@15@01), _), xs@13@01) | live]
; [else-branch: 14 | !(y@14@01 >= last((First:($t@15@01), _), xs@13@01) && ascending((First:($t@15@01), _), xs@13@01)) | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 14 | y@14@01 >= last((First:($t@15@01), _), xs@13@01) && ascending((First:($t@15@01), _), xs@13@01)]
(assert (and
  (>= y@14@01 (last ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
  (ascending ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01)))
; [eval] ascending(xs)
(push) ; 8
; [eval] xs != null
(assert (ascending%precondition ($Snap.combine
  ($Snap.combine
    ($Snap.first ($Snap.first $t@15@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@15@01)))
      ($Snap.combine ($Snap.first $t@17@01) $Snap.unit)))
  $Snap.unit) xs@13@01))
(pop) ; 8
; Joined path conditions
(assert (ascending%precondition ($Snap.combine
  ($Snap.combine
    ($Snap.first ($Snap.first $t@15@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@15@01)))
      ($Snap.combine ($Snap.first $t@17@01) $Snap.unit)))
  $Snap.unit) xs@13@01))
(pop) ; 7
(push) ; 7
; [else-branch: 14 | !(y@14@01 >= last((First:($t@15@01), _), xs@13@01) && ascending((First:($t@15@01), _), xs@13@01))]
(assert (not
  (and
    (>=
      y@14@01
      (last ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
    (ascending ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (and
    (>=
      y@14@01
      (last ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
    (ascending ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
  (and
    (>=
      y@14@01
      (last ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
    (ascending ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01)
    (ascending%precondition ($Snap.combine
      ($Snap.combine
        ($Snap.first ($Snap.first $t@15@01))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.first $t@15@01)))
          ($Snap.combine ($Snap.first $t@17@01) $Snap.unit)))
      $Snap.unit) xs@13@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (>=
        y@14@01
        (last ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
      (ascending ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01)))
  (and
    (>=
      y@14@01
      (last ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
    (ascending ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))))
(push) ; 6
(assert (not (=>
  (and
    (>=
      y@14@01
      (last ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
    (ascending ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
  (ascending ($Snap.combine
    ($Snap.combine
      ($Snap.first ($Snap.first $t@15@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@15@01)))
        ($Snap.combine ($Snap.first $t@17@01) $Snap.unit)))
    $Snap.unit) xs@13@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (and
    (>=
      y@14@01
      (last ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
    (ascending ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
  (ascending ($Snap.combine
    ($Snap.combine
      ($Snap.first ($Snap.first $t@15@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@15@01)))
        ($Snap.combine ($Snap.first $t@17@01) $Snap.unit)))
    $Snap.unit) xs@13@01)))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 7 | First:(First:($t@15@01)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01))) $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.first $t@15@01))) $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (list%trigger ($Snap.first $t@15@01) xs@13@01))
; [eval] xs.next == null
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 15 | First:(First:($t@15@01)) == Null | live]
; [else-branch: 15 | First:(First:($t@15@01)) != Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 15 | First:(First:($t@15@01)) == Null]
; [exec]
; var ys: Ref
(declare-const ys@18@01 $Ref)
; [exec]
; ys := new(val, next)
(declare-const ys@19@01 $Ref)
(assert (not (= ys@19@01 $Ref.null)))
(declare-const val@20@01 Int)
(declare-const next@21@01 $Ref)
(assert (not
  (= ys@19@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@15@01))))))
(assert (not (= ys@19@01 ys@18@01)))
(assert (not (= ys@19@01 xs@13@01)))
; [exec]
; ys.val := y
(push) ; 5
(set-option :timeout 10)
(assert (not (= xs@13@01 ys@19@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [exec]
; ys.next := null
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= xs@13@01 ys@19@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [exec]
; fold acc(list(ys), write)
; [eval] xs.next != null
; [then-branch: 16 | False | dead]
; [else-branch: 16 | True | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 16 | True]
(assert (list%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap $Ref.null)
  ($Snap.combine ($SortWrappers.IntTo$Snap y@14@01) $Snap.unit)) ys@19@01))
; [exec]
; xs.next := ys
; [exec]
; fold acc(list(xs), write)
; [eval] xs.next != null
(push) ; 6
(set-option :timeout 10)
(assert (not (= ys@19@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 17 | ys@19@01 != Null | live]
; [else-branch: 17 | ys@19@01 == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 17 | ys@19@01 != Null]
; [eval] xs.next != null
(assert (list%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap ys@19@01)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@15@01)))
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap $Ref.null)
        ($Snap.combine ($SortWrappers.IntTo$Snap y@14@01) $Snap.unit))
      $Snap.unit))) xs@13@01))
; [eval] xs != null
; [eval] length(xs) == old(length(xs)) + 1
; [eval] length(xs)
(push) ; 7
; [eval] xs != null
(assert (length%precondition ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap ys@19@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@15@01)))
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $Ref.null)
          ($Snap.combine ($SortWrappers.IntTo$Snap y@14@01) $Snap.unit))
        $Snap.unit)))
  $Snap.unit) xs@13@01))
(pop) ; 7
; Joined path conditions
(assert (length%precondition ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap ys@19@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@15@01)))
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $Ref.null)
          ($Snap.combine ($SortWrappers.IntTo$Snap y@14@01) $Snap.unit))
        $Snap.unit)))
  $Snap.unit) xs@13@01))
; [eval] old(length(xs)) + 1
; [eval] old(length(xs))
; [eval] length(xs)
(push) ; 7
; [eval] xs != null
(assert (length%precondition ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
(pop) ; 7
; Joined path conditions
(assert (length%precondition ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
(push) ; 7
(assert (not (=
  (length ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap ys@19@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@15@01)))
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $Ref.null)
            ($Snap.combine ($SortWrappers.IntTo$Snap y@14@01) $Snap.unit))
          $Snap.unit)))
    $Snap.unit) xs@13@01)
  (+ (length ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01) 1))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (=
  (length ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap ys@19@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@15@01)))
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $Ref.null)
            ($Snap.combine ($SortWrappers.IntTo$Snap y@14@01) $Snap.unit))
          $Snap.unit)))
    $Snap.unit) xs@13@01)
  (+ (length ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01) 1)))
; [eval] elems(xs) == old(elems(xs)) ++ Seq(y)
; [eval] elems(xs)
(push) ; 7
; [eval] xs != null
(assert (elems%precondition ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap ys@19@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@15@01)))
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $Ref.null)
          ($Snap.combine ($SortWrappers.IntTo$Snap y@14@01) $Snap.unit))
        $Snap.unit)))
  $Snap.unit) xs@13@01))
(pop) ; 7
; Joined path conditions
(assert (elems%precondition ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap ys@19@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@15@01)))
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $Ref.null)
          ($Snap.combine ($SortWrappers.IntTo$Snap y@14@01) $Snap.unit))
        $Snap.unit)))
  $Snap.unit) xs@13@01))
; [eval] old(elems(xs)) ++ Seq(y)
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 7
; [eval] xs != null
(assert (elems%precondition ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
(pop) ; 7
; Joined path conditions
(assert (elems%precondition ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
; [eval] Seq(y)
(assert (= (Seq_length (Seq_singleton y@14@01)) 1))
(push) ; 7
(assert (not (Seq_equal
  (elems ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap ys@19@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@15@01)))
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $Ref.null)
            ($Snap.combine ($SortWrappers.IntTo$Snap y@14@01) $Snap.unit))
          $Snap.unit)))
    $Snap.unit) xs@13@01)
  (Seq_append
    (elems ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01)
    (Seq_singleton y@14@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (elems ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap ys@19@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@15@01)))
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $Ref.null)
            ($Snap.combine ($SortWrappers.IntTo$Snap y@14@01) $Snap.unit))
          $Snap.unit)))
    $Snap.unit) xs@13@01)
  (Seq_append
    (elems ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01)
    (Seq_singleton y@14@01))))
; [eval] head(xs) == old(head(xs))
; [eval] head(xs)
(push) ; 7
; [eval] xs != null
(assert (head%precondition ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap ys@19@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@15@01)))
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $Ref.null)
          ($Snap.combine ($SortWrappers.IntTo$Snap y@14@01) $Snap.unit))
        $Snap.unit)))
  $Snap.unit) xs@13@01))
(pop) ; 7
; Joined path conditions
(assert (head%precondition ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap ys@19@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@15@01)))
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $Ref.null)
          ($Snap.combine ($SortWrappers.IntTo$Snap y@14@01) $Snap.unit))
        $Snap.unit)))
  $Snap.unit) xs@13@01))
; [eval] old(head(xs))
; [eval] head(xs)
(push) ; 7
; [eval] xs != null
(assert (head%precondition ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
(pop) ; 7
; Joined path conditions
(assert (head%precondition ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
(push) ; 7
(assert (not (=
  (head ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap ys@19@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@15@01)))
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $Ref.null)
            ($Snap.combine ($SortWrappers.IntTo$Snap y@14@01) $Snap.unit))
          $Snap.unit)))
    $Snap.unit) xs@13@01)
  (head ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (=
  (head ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap ys@19@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@15@01)))
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $Ref.null)
            ($Snap.combine ($SortWrappers.IntTo$Snap y@14@01) $Snap.unit))
          $Snap.unit)))
    $Snap.unit) xs@13@01)
  (head ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01)))
; [eval] old(y >= last(xs) && ascending(xs)) ==> ascending(xs)
; [eval] old(y >= last(xs) && ascending(xs))
; [eval] y >= last(xs) && ascending(xs)
; [eval] y >= last(xs)
; [eval] last(xs)
(push) ; 7
; [eval] xs != null
(assert (last%precondition ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
(pop) ; 7
; Joined path conditions
(assert (last%precondition ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
(push) ; 7
; [then-branch: 18 | !(y@14@01 >= last((First:($t@15@01), _), xs@13@01)) | live]
; [else-branch: 18 | y@14@01 >= last((First:($t@15@01), _), xs@13@01) | live]
(push) ; 8
; [then-branch: 18 | !(y@14@01 >= last((First:($t@15@01), _), xs@13@01))]
(assert (not
  (>= y@14@01 (last ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))))
(pop) ; 8
(push) ; 8
; [else-branch: 18 | y@14@01 >= last((First:($t@15@01), _), xs@13@01)]
(assert (>= y@14@01 (last ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01)))
; [eval] ascending(xs)
(push) ; 9
; [eval] xs != null
(assert (ascending%precondition ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
(pop) ; 9
; Joined path conditions
(assert (ascending%precondition ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= y@14@01 (last ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
  (and
    (>=
      y@14@01
      (last ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
    (ascending%precondition ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))))
(assert (or
  (>= y@14@01 (last ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
  (not
    (>=
      y@14@01
      (last ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01)))))
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (and
    (>=
      y@14@01
      (last ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
    (ascending ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01)))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (>= y@14@01 (last ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
  (ascending ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 19 | y@14@01 >= last((First:($t@15@01), _), xs@13@01) && ascending((First:($t@15@01), _), xs@13@01) | live]
; [else-branch: 19 | !(y@14@01 >= last((First:($t@15@01), _), xs@13@01) && ascending((First:($t@15@01), _), xs@13@01)) | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 19 | y@14@01 >= last((First:($t@15@01), _), xs@13@01) && ascending((First:($t@15@01), _), xs@13@01)]
(assert (and
  (>= y@14@01 (last ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
  (ascending ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01)))
; [eval] ascending(xs)
(push) ; 9
; [eval] xs != null
(assert (ascending%precondition ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap ys@19@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@15@01)))
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $Ref.null)
          ($Snap.combine ($SortWrappers.IntTo$Snap y@14@01) $Snap.unit))
        $Snap.unit)))
  $Snap.unit) xs@13@01))
(pop) ; 9
; Joined path conditions
(assert (ascending%precondition ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap ys@19@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@15@01)))
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap $Ref.null)
          ($Snap.combine ($SortWrappers.IntTo$Snap y@14@01) $Snap.unit))
        $Snap.unit)))
  $Snap.unit) xs@13@01))
(pop) ; 8
(push) ; 8
; [else-branch: 19 | !(y@14@01 >= last((First:($t@15@01), _), xs@13@01) && ascending((First:($t@15@01), _), xs@13@01))]
(assert (not
  (and
    (>=
      y@14@01
      (last ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
    (ascending ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (and
    (>=
      y@14@01
      (last ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
    (ascending ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
  (and
    (>=
      y@14@01
      (last ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
    (ascending ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01)
    (ascending%precondition ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap ys@19@01)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.first $t@15@01)))
          ($Snap.combine
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap $Ref.null)
              ($Snap.combine ($SortWrappers.IntTo$Snap y@14@01) $Snap.unit))
            $Snap.unit)))
      $Snap.unit) xs@13@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (>=
        y@14@01
        (last ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
      (ascending ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01)))
  (and
    (>=
      y@14@01
      (last ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
    (ascending ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))))
(push) ; 7
(assert (not (=>
  (and
    (>=
      y@14@01
      (last ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
    (ascending ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
  (ascending ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap ys@19@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@15@01)))
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $Ref.null)
            ($Snap.combine ($SortWrappers.IntTo$Snap y@14@01) $Snap.unit))
          $Snap.unit)))
    $Snap.unit) xs@13@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (and
    (>=
      y@14@01
      (last ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
    (ascending ($Snap.combine ($Snap.first $t@15@01) $Snap.unit) xs@13@01))
  (ascending ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap ys@19@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@15@01)))
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap $Ref.null)
            ($Snap.combine ($SortWrappers.IntTo$Snap y@14@01) $Snap.unit))
          $Snap.unit)))
    $Snap.unit) xs@13@01)))
(pop) ; 6
(pop) ; 5
(pop) ; 4
; [eval] !(xs.next == null)
; [eval] xs.next == null
; [then-branch: 20 | First:(First:($t@15@01)) != Null | dead]
; [else-branch: 20 | First:(First:($t@15@01)) == Null | live]
(push) ; 4
; [else-branch: 20 | First:(First:($t@15@01)) == Null]
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- insert ----------
(declare-const xs@22@01 $Ref)
(declare-const y@23@01 Int)
(declare-const ys@24@01 $Ref)
(declare-const i@25@01 Int)
(declare-const xs@26@01 $Ref)
(declare-const y@27@01 Int)
(declare-const ys@28@01 $Ref)
(declare-const i@29@01 Int)
(push) ; 1
(declare-const $t@30@01 $Snap)
(assert (= $t@30@01 ($Snap.combine ($Snap.first $t@30@01) ($Snap.second $t@30@01))))
(assert (= ($Snap.second $t@30@01) $Snap.unit))
; [eval] xs != null
(assert (not (= xs@26@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@31@01 $Snap)
(assert (= $t@31@01 ($Snap.combine ($Snap.first $t@31@01) ($Snap.second $t@31@01))))
(assert (=
  ($Snap.second $t@31@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@31@01))
    ($Snap.second ($Snap.second $t@31@01)))))
(assert (= ($Snap.first ($Snap.second $t@31@01)) $Snap.unit))
; [eval] ys != null
(assert (not (= ys@28@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second $t@31@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@31@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@31@01))) $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@29@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@31@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@31@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@31@01))))
  $Snap.unit))
; [eval] i <= old(length(xs))
; [eval] old(length(xs))
; [eval] length(xs)
(push) ; 3
; [eval] xs != null
(assert (length%precondition ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
(pop) ; 3
; Joined path conditions
(assert (length%precondition ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
(assert (<= i@29@01 (length ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))
  $Snap.unit))
; [eval] i > 0 ==> head(ys) == old(head(xs))
; [eval] i > 0
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (> i@29@01 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (> i@29@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 21 | i@29@01 > 0 | live]
; [else-branch: 21 | !(i@29@01 > 0) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 21 | i@29@01 > 0]
(assert (> i@29@01 0))
; [eval] head(ys) == old(head(xs))
; [eval] head(ys)
(push) ; 5
; [eval] xs != null
(assert (head%precondition ($Snap.combine ($Snap.first $t@31@01) $Snap.unit) ys@28@01))
(pop) ; 5
; Joined path conditions
(assert (head%precondition ($Snap.combine ($Snap.first $t@31@01) $Snap.unit) ys@28@01))
; [eval] old(head(xs))
; [eval] head(xs)
(push) ; 5
; [eval] xs != null
(assert (head%precondition ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
(pop) ; 5
; Joined path conditions
(assert (head%precondition ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
(pop) ; 4
(push) ; 4
; [else-branch: 21 | !(i@29@01 > 0)]
(assert (not (> i@29@01 0)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (> i@29@01 0)
  (and
    (> i@29@01 0)
    (head%precondition ($Snap.combine ($Snap.first $t@31@01) $Snap.unit) ys@28@01)
    (head%precondition ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))))
; Joined path conditions
(assert (or (not (> i@29@01 0)) (> i@29@01 0)))
(assert (=>
  (> i@29@01 0)
  (=
    (head ($Snap.combine ($Snap.first $t@31@01) $Snap.unit) ys@28@01)
    (head ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))
  $Snap.unit))
; [eval] i == 0 ==> head(ys) == y
; [eval] i == 0
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= i@29@01 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= i@29@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 22 | i@29@01 == 0 | live]
; [else-branch: 22 | i@29@01 != 0 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 22 | i@29@01 == 0]
(assert (= i@29@01 0))
; [eval] head(ys) == y
; [eval] head(ys)
(push) ; 5
; [eval] xs != null
(assert (head%precondition ($Snap.combine ($Snap.first $t@31@01) $Snap.unit) ys@28@01))
(pop) ; 5
; Joined path conditions
(assert (head%precondition ($Snap.combine ($Snap.first $t@31@01) $Snap.unit) ys@28@01))
(pop) ; 4
(push) ; 4
; [else-branch: 22 | i@29@01 != 0]
(assert (not (= i@29@01 0)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (= i@29@01 0)
  (and
    (= i@29@01 0)
    (head%precondition ($Snap.combine ($Snap.first $t@31@01) $Snap.unit) ys@28@01))))
; Joined path conditions
(assert (or (not (= i@29@01 0)) (= i@29@01 0)))
(assert (=>
  (= i@29@01 0)
  (= (head ($Snap.combine ($Snap.first $t@31@01) $Snap.unit) ys@28@01) y@27@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))
  $Snap.unit))
; [eval] length(ys) == old(length(xs)) + 1
; [eval] length(ys)
(push) ; 3
; [eval] xs != null
(assert (length%precondition ($Snap.combine ($Snap.first $t@31@01) $Snap.unit) ys@28@01))
(pop) ; 3
; Joined path conditions
(assert (length%precondition ($Snap.combine ($Snap.first $t@31@01) $Snap.unit) ys@28@01))
; [eval] old(length(xs)) + 1
; [eval] old(length(xs))
; [eval] length(xs)
(push) ; 3
; [eval] xs != null
(pop) ; 3
; Joined path conditions
(assert (=
  (length ($Snap.combine ($Snap.first $t@31@01) $Snap.unit) ys@28@01)
  (+ (length ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01) 1)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))))
  $Snap.unit))
; [eval] elems(ys) == old(elems(xs))[0..i] ++ Seq(y) ++ old(elems(xs))[i..]
; [eval] elems(ys)
(push) ; 3
; [eval] xs != null
(assert (elems%precondition ($Snap.combine ($Snap.first $t@31@01) $Snap.unit) ys@28@01))
(pop) ; 3
; Joined path conditions
(assert (elems%precondition ($Snap.combine ($Snap.first $t@31@01) $Snap.unit) ys@28@01))
; [eval] old(elems(xs))[0..i] ++ Seq(y) ++ old(elems(xs))[i..]
; [eval] old(elems(xs))[0..i] ++ Seq(y)
; [eval] old(elems(xs))[0..i]
; [eval] old(elems(xs))[..i]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 3
; [eval] xs != null
(assert (elems%precondition ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
(pop) ; 3
; Joined path conditions
(assert (elems%precondition ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
; [eval] Seq(y)
(assert (= (Seq_length (Seq_singleton y@27@01)) 1))
; [eval] old(elems(xs))[i..]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 3
; [eval] xs != null
(pop) ; 3
; Joined path conditions
(assert (Seq_equal
  (elems ($Snap.combine ($Snap.first $t@31@01) $Snap.unit) ys@28@01)
  (Seq_append
    (Seq_append
      (Seq_drop
        (Seq_take
          (elems ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)
          i@29@01)
        0)
      (Seq_singleton y@27@01))
    (Seq_drop
      (elems ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)
      i@29@01))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))))
  $Snap.unit))
; [eval] old(ascending(xs)) ==> ascending(ys)
; [eval] old(ascending(xs))
; [eval] ascending(xs)
(push) ; 3
; [eval] xs != null
(assert (ascending%precondition ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
(pop) ; 3
; Joined path conditions
(assert (ascending%precondition ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (ascending ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (ascending ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 23 | ascending((First:($t@30@01), _), xs@26@01) | live]
; [else-branch: 23 | !(ascending((First:($t@30@01), _), xs@26@01)) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 23 | ascending((First:($t@30@01), _), xs@26@01)]
(assert (ascending ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
; [eval] ascending(ys)
(push) ; 5
; [eval] xs != null
(assert (ascending%precondition ($Snap.combine ($Snap.first $t@31@01) $Snap.unit) ys@28@01))
(pop) ; 5
; Joined path conditions
(assert (ascending%precondition ($Snap.combine ($Snap.first $t@31@01) $Snap.unit) ys@28@01))
(pop) ; 4
(push) ; 4
; [else-branch: 23 | !(ascending((First:($t@30@01), _), xs@26@01))]
(assert (not (ascending ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (ascending ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)
  (and
    (ascending ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)
    (ascending%precondition ($Snap.combine ($Snap.first $t@31@01) $Snap.unit) ys@28@01))))
; Joined path conditions
(assert (or
  (not (ascending ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
  (ascending ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)))
(assert (=>
  (ascending ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)
  (ascending ($Snap.combine ($Snap.first $t@31@01) $Snap.unit) ys@28@01)))
(pop) ; 2
(push) ; 2
; [eval] y <= head(xs)
; [eval] head(xs)
(push) ; 3
; [eval] xs != null
(assert (head%precondition ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
(pop) ; 3
; Joined path conditions
(assert (head%precondition ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (<= y@27@01 (head ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<= y@27@01 (head ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 24 | y@27@01 <= head((First:($t@30@01), _), xs@26@01) | live]
; [else-branch: 24 | !(y@27@01 <= head((First:($t@30@01), _), xs@26@01)) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 24 | y@27@01 <= head((First:($t@30@01), _), xs@26@01)]
(assert (<= y@27@01 (head ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)))
; [exec]
; ys := prepend(xs, y)
; [eval] xs != null
(declare-const ys@32@01 $Ref)
(declare-const $t@33@01 $Snap)
(assert (= $t@33@01 ($Snap.combine ($Snap.first $t@33@01) ($Snap.second $t@33@01))))
(assert (=
  ($Snap.second $t@33@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@33@01))
    ($Snap.second ($Snap.second $t@33@01)))))
(assert (= ($Snap.first ($Snap.second $t@33@01)) $Snap.unit))
; [eval] ys != null
(assert (not (= ys@32@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second $t@33@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@33@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@33@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@33@01))) $Snap.unit))
; [eval] length(ys) == old(length(xs)) + 1
; [eval] length(ys)
(push) ; 4
; [eval] xs != null
(assert (length%precondition ($Snap.combine ($Snap.first $t@33@01) $Snap.unit) ys@32@01))
(pop) ; 4
; Joined path conditions
(assert (length%precondition ($Snap.combine ($Snap.first $t@33@01) $Snap.unit) ys@32@01))
; [eval] old(length(xs)) + 1
; [eval] old(length(xs))
; [eval] length(xs)
(push) ; 4
; [eval] xs != null
(assert (length%precondition ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
(pop) ; 4
; Joined path conditions
(assert (length%precondition ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
(assert (=
  (length ($Snap.combine ($Snap.first $t@33@01) $Snap.unit) ys@32@01)
  (+ (length ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01) 1)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@33@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@33@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@33@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@33@01))))
  $Snap.unit))
; [eval] elems(ys) == Seq(y) ++ old(elems(xs))
; [eval] elems(ys)
(push) ; 4
; [eval] xs != null
(assert (elems%precondition ($Snap.combine ($Snap.first $t@33@01) $Snap.unit) ys@32@01))
(pop) ; 4
; Joined path conditions
(assert (elems%precondition ($Snap.combine ($Snap.first $t@33@01) $Snap.unit) ys@32@01))
; [eval] Seq(y) ++ old(elems(xs))
; [eval] Seq(y)
(assert (= (Seq_length (Seq_singleton y@27@01)) 1))
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 4
; [eval] xs != null
(assert (elems%precondition ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
(pop) ; 4
; Joined path conditions
(assert (elems%precondition ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
(assert (Seq_equal
  (elems ($Snap.combine ($Snap.first $t@33@01) $Snap.unit) ys@32@01)
  (Seq_append
    (Seq_singleton y@27@01)
    (elems ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@33@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@33@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@33@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@33@01)))))
  $Snap.unit))
; [eval] head(ys) == y
; [eval] head(ys)
(push) ; 4
; [eval] xs != null
(assert (head%precondition ($Snap.combine ($Snap.first $t@33@01) $Snap.unit) ys@32@01))
(pop) ; 4
; Joined path conditions
(assert (head%precondition ($Snap.combine ($Snap.first $t@33@01) $Snap.unit) ys@32@01))
(assert (= (head ($Snap.combine ($Snap.first $t@33@01) $Snap.unit) ys@32@01) y@27@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@33@01)))))
  $Snap.unit))
; [eval] old(y <= head(xs) && ascending(xs)) ==> ascending(ys)
; [eval] old(y <= head(xs) && ascending(xs))
; [eval] y <= head(xs) && ascending(xs)
; [eval] y <= head(xs)
; [eval] head(xs)
(push) ; 4
; [eval] xs != null
(pop) ; 4
; Joined path conditions
(push) ; 4
; [then-branch: 25 | !(y@27@01 <= head((First:($t@30@01), _), xs@26@01)) | live]
; [else-branch: 25 | y@27@01 <= head((First:($t@30@01), _), xs@26@01) | live]
(push) ; 5
; [then-branch: 25 | !(y@27@01 <= head((First:($t@30@01), _), xs@26@01))]
(assert (not
  (<= y@27@01 (head ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 25 | y@27@01 <= head((First:($t@30@01), _), xs@26@01)]
; [eval] ascending(xs)
(push) ; 6
; [eval] xs != null
(assert (ascending%precondition ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
(pop) ; 6
; Joined path conditions
(assert (ascending%precondition ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= y@27@01 (head ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
  (ascending%precondition ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)))
(assert (or
  (<= y@27@01 (head ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
  (not
    (<=
      y@27@01
      (head ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)))))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (and
    (<=
      y@27@01
      (head ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
    (ascending ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (<= y@27@01 (head ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
  (ascending ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 26 | y@27@01 <= head((First:($t@30@01), _), xs@26@01) && ascending((First:($t@30@01), _), xs@26@01) | live]
; [else-branch: 26 | !(y@27@01 <= head((First:($t@30@01), _), xs@26@01) && ascending((First:($t@30@01), _), xs@26@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 26 | y@27@01 <= head((First:($t@30@01), _), xs@26@01) && ascending((First:($t@30@01), _), xs@26@01)]
(assert (and
  (<= y@27@01 (head ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
  (ascending ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)))
; [eval] ascending(ys)
(push) ; 6
; [eval] xs != null
(assert (ascending%precondition ($Snap.combine ($Snap.first $t@33@01) $Snap.unit) ys@32@01))
(pop) ; 6
; Joined path conditions
(assert (ascending%precondition ($Snap.combine ($Snap.first $t@33@01) $Snap.unit) ys@32@01))
(pop) ; 5
(push) ; 5
; [else-branch: 26 | !(y@27@01 <= head((First:($t@30@01), _), xs@26@01) && ascending((First:($t@30@01), _), xs@26@01))]
(assert (not
  (and
    (<=
      y@27@01
      (head ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
    (ascending ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (<=
      y@27@01
      (head ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
    (ascending ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
  (and
    (<=
      y@27@01
      (head ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
    (ascending ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)
    (ascending%precondition ($Snap.combine ($Snap.first $t@33@01) $Snap.unit) ys@32@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (<=
        y@27@01
        (head ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
      (ascending ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)))
  (and
    (<=
      y@27@01
      (head ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
    (ascending ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))))
(assert (=>
  (and
    (<=
      y@27@01
      (head ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
    (ascending ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
  (ascending ($Snap.combine ($Snap.first $t@33@01) $Snap.unit) ys@32@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; i := 0
; [eval] ys != null
; [eval] 0 <= i
; [eval] i <= old(length(xs))
; [eval] old(length(xs))
; [eval] length(xs)
(set-option :timeout 0)
(push) ; 4
; [eval] xs != null
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (<= 0 (length ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 (length ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)))
; [eval] i > 0 ==> head(ys) == old(head(xs))
; [eval] i > 0
(push) ; 4
; [then-branch: 27 | False | dead]
; [else-branch: 27 | True | live]
(push) ; 5
; [else-branch: 27 | True]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [eval] i == 0 ==> head(ys) == y
; [eval] i == 0
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 28 | True | live]
; [else-branch: 28 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 28 | True]
; [eval] head(ys) == y
; [eval] head(ys)
(push) ; 6
; [eval] xs != null
(pop) ; 6
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [eval] length(ys) == old(length(xs)) + 1
; [eval] length(ys)
(push) ; 4
; [eval] xs != null
(pop) ; 4
; Joined path conditions
; [eval] old(length(xs)) + 1
; [eval] old(length(xs))
; [eval] length(xs)
(push) ; 4
; [eval] xs != null
(pop) ; 4
; Joined path conditions
; [eval] elems(ys) == old(elems(xs))[0..i] ++ Seq(y) ++ old(elems(xs))[i..]
; [eval] elems(ys)
(push) ; 4
; [eval] xs != null
(pop) ; 4
; Joined path conditions
; [eval] old(elems(xs))[0..i] ++ Seq(y) ++ old(elems(xs))[i..]
; [eval] old(elems(xs))[0..i] ++ Seq(y)
; [eval] old(elems(xs))[0..i]
; [eval] old(elems(xs))[..i]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 4
; [eval] xs != null
(pop) ; 4
; Joined path conditions
; [eval] Seq(y)
; [eval] old(elems(xs))[i..]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 4
; [eval] xs != null
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (Seq_equal
  (elems ($Snap.combine ($Snap.first $t@33@01) $Snap.unit) ys@32@01)
  (Seq_append
    (Seq_append
      (Seq_drop
        (Seq_take
          (elems ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)
          0)
        0)
      (Seq_singleton y@27@01))
    (Seq_drop
      (elems ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)
      0)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (elems ($Snap.combine ($Snap.first $t@33@01) $Snap.unit) ys@32@01)
  (Seq_append
    (Seq_append
      (Seq_drop
        (Seq_take
          (elems ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)
          0)
        0)
      (Seq_singleton y@27@01))
    (Seq_drop
      (elems ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)
      0))))
; [eval] old(ascending(xs)) ==> ascending(ys)
; [eval] old(ascending(xs))
; [eval] ascending(xs)
(push) ; 4
; [eval] xs != null
(assert (ascending%precondition ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
(pop) ; 4
; Joined path conditions
(assert (ascending%precondition ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (ascending ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (ascending ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 29 | ascending((First:($t@30@01), _), xs@26@01) | live]
; [else-branch: 29 | !(ascending((First:($t@30@01), _), xs@26@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 29 | ascending((First:($t@30@01), _), xs@26@01)]
(assert (ascending ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
; [eval] ascending(ys)
(push) ; 6
; [eval] xs != null
(assert (ascending%precondition ($Snap.combine ($Snap.first $t@33@01) $Snap.unit) ys@32@01))
(pop) ; 6
; Joined path conditions
(assert (ascending%precondition ($Snap.combine ($Snap.first $t@33@01) $Snap.unit) ys@32@01))
(pop) ; 5
(push) ; 5
; [else-branch: 29 | !(ascending((First:($t@30@01), _), xs@26@01))]
(assert (not (ascending ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (ascending ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)
  (and
    (ascending ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)
    (ascending%precondition ($Snap.combine ($Snap.first $t@33@01) $Snap.unit) ys@32@01))))
; Joined path conditions
(assert (or
  (not (ascending ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
  (ascending ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)))
(push) ; 4
(assert (not (=>
  (ascending ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)
  (ascending ($Snap.combine ($Snap.first $t@33@01) $Snap.unit) ys@32@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (ascending ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)
  (ascending ($Snap.combine ($Snap.first $t@33@01) $Snap.unit) ys@32@01)))
(pop) ; 3
(push) ; 3
; [else-branch: 24 | !(y@27@01 <= head((First:($t@30@01), _), xs@26@01))]
(assert (not
  (<= y@27@01 (head ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))))
(pop) ; 3
; [eval] !(y <= head(xs))
; [eval] y <= head(xs)
; [eval] head(xs)
(push) ; 3
; [eval] xs != null
(pop) ; 3
; Joined path conditions
(push) ; 3
(set-option :timeout 10)
(assert (not (<= y@27@01 (head ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (<= y@27@01 (head ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 30 | !(y@27@01 <= head((First:($t@30@01), _), xs@26@01)) | live]
; [else-branch: 30 | y@27@01 <= head((First:($t@30@01), _), xs@26@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 30 | !(y@27@01 <= head((First:($t@30@01), _), xs@26@01))]
(assert (not
  (<= y@27@01 (head ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))))
; [eval] tail(xs) == null
; [eval] tail(xs)
(push) ; 4
; [eval] xs != null
(assert (tail%precondition ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
(pop) ; 4
; Joined path conditions
(assert (tail%precondition ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (= (tail ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01) $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (tail ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 31 | tail((First:($t@30@01), _), xs@26@01) == Null | live]
; [else-branch: 31 | tail((First:($t@30@01), _), xs@26@01) != Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 31 | tail((First:($t@30@01), _), xs@26@01) == Null]
(assert (= (tail ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01) $Ref.null))
; [exec]
; inhale head(xs) == last(xs)
(declare-const $t@34@01 $Snap)
(assert (= $t@34@01 $Snap.unit))
; [eval] head(xs) == last(xs)
; [eval] head(xs)
(push) ; 5
; [eval] xs != null
(pop) ; 5
; Joined path conditions
; [eval] last(xs)
(push) ; 5
; [eval] xs != null
(assert (last%precondition ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
(pop) ; 5
; Joined path conditions
(assert (last%precondition ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
(assert (=
  (head ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)
  (last ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale |elems(xs)| == 1
(declare-const $t@35@01 $Snap)
(assert (= $t@35@01 $Snap.unit))
; [eval] |elems(xs)| == 1
; [eval] |elems(xs)|
; [eval] elems(xs)
(set-option :timeout 0)
(push) ; 5
; [eval] xs != null
(assert (elems%precondition ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
(pop) ; 5
; Joined path conditions
(assert (elems%precondition ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
(assert (=
  (Seq_length (elems ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
  1))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; append(xs, y)
; [eval] xs != null
(declare-const $t@36@01 $Snap)
(assert (= $t@36@01 ($Snap.combine ($Snap.first $t@36@01) ($Snap.second $t@36@01))))
(assert (=
  ($Snap.second $t@36@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@36@01))
    ($Snap.second ($Snap.second $t@36@01)))))
(assert (= ($Snap.first ($Snap.second $t@36@01)) $Snap.unit))
; [eval] xs != null
(assert (=
  ($Snap.second ($Snap.second $t@36@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@36@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@36@01))) $Snap.unit))
; [eval] length(xs) == old(length(xs)) + 1
; [eval] length(xs)
(set-option :timeout 0)
(push) ; 5
; [eval] xs != null
(assert (length%precondition ($Snap.combine ($Snap.first $t@36@01) $Snap.unit) xs@26@01))
(pop) ; 5
; Joined path conditions
(assert (length%precondition ($Snap.combine ($Snap.first $t@36@01) $Snap.unit) xs@26@01))
; [eval] old(length(xs)) + 1
; [eval] old(length(xs))
; [eval] length(xs)
(push) ; 5
; [eval] xs != null
(assert (length%precondition ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
(pop) ; 5
; Joined path conditions
(assert (length%precondition ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
(assert (=
  (length ($Snap.combine ($Snap.first $t@36@01) $Snap.unit) xs@26@01)
  (+ (length ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01) 1)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@36@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@36@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@36@01))))
  $Snap.unit))
; [eval] elems(xs) == old(elems(xs)) ++ Seq(y)
; [eval] elems(xs)
(push) ; 5
; [eval] xs != null
(assert (elems%precondition ($Snap.combine ($Snap.first $t@36@01) $Snap.unit) xs@26@01))
(pop) ; 5
; Joined path conditions
(assert (elems%precondition ($Snap.combine ($Snap.first $t@36@01) $Snap.unit) xs@26@01))
; [eval] old(elems(xs)) ++ Seq(y)
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 5
; [eval] xs != null
(pop) ; 5
; Joined path conditions
; [eval] Seq(y)
(assert (= (Seq_length (Seq_singleton y@27@01)) 1))
(assert (Seq_equal
  (elems ($Snap.combine ($Snap.first $t@36@01) $Snap.unit) xs@26@01)
  (Seq_append
    (elems ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)
    (Seq_singleton y@27@01))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))
  $Snap.unit))
; [eval] head(xs) == old(head(xs))
; [eval] head(xs)
(push) ; 5
; [eval] xs != null
(assert (head%precondition ($Snap.combine ($Snap.first $t@36@01) $Snap.unit) xs@26@01))
(pop) ; 5
; Joined path conditions
(assert (head%precondition ($Snap.combine ($Snap.first $t@36@01) $Snap.unit) xs@26@01))
; [eval] old(head(xs))
; [eval] head(xs)
(push) ; 5
; [eval] xs != null
(pop) ; 5
; Joined path conditions
(assert (=
  (head ($Snap.combine ($Snap.first $t@36@01) $Snap.unit) xs@26@01)
  (head ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@01)))))
  $Snap.unit))
; [eval] old(y >= last(xs) && ascending(xs)) ==> ascending(xs)
; [eval] old(y >= last(xs) && ascending(xs))
; [eval] y >= last(xs) && ascending(xs)
; [eval] y >= last(xs)
; [eval] last(xs)
(push) ; 5
; [eval] xs != null
(pop) ; 5
; Joined path conditions
(push) ; 5
; [then-branch: 32 | !(y@27@01 >= last((First:($t@30@01), _), xs@26@01)) | live]
; [else-branch: 32 | y@27@01 >= last((First:($t@30@01), _), xs@26@01) | live]
(push) ; 6
; [then-branch: 32 | !(y@27@01 >= last((First:($t@30@01), _), xs@26@01))]
(assert (not
  (>= y@27@01 (last ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 32 | y@27@01 >= last((First:($t@30@01), _), xs@26@01)]
(assert (>= y@27@01 (last ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)))
; [eval] ascending(xs)
(push) ; 7
; [eval] xs != null
(assert (ascending%precondition ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
(pop) ; 7
; Joined path conditions
(assert (ascending%precondition ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= y@27@01 (last ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
  (and
    (>=
      y@27@01
      (last ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
    (ascending%precondition ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))))
(assert (or
  (>= y@27@01 (last ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
  (not
    (>=
      y@27@01
      (last ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)))))
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (not
  (and
    (>=
      y@27@01
      (last ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
    (ascending ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (>= y@27@01 (last ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
  (ascending ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 33 | y@27@01 >= last((First:($t@30@01), _), xs@26@01) && ascending((First:($t@30@01), _), xs@26@01) | live]
; [else-branch: 33 | !(y@27@01 >= last((First:($t@30@01), _), xs@26@01) && ascending((First:($t@30@01), _), xs@26@01)) | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 33 | y@27@01 >= last((First:($t@30@01), _), xs@26@01) && ascending((First:($t@30@01), _), xs@26@01)]
(assert (and
  (>= y@27@01 (last ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
  (ascending ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)))
; [eval] ascending(xs)
(push) ; 7
; [eval] xs != null
(assert (ascending%precondition ($Snap.combine ($Snap.first $t@36@01) $Snap.unit) xs@26@01))
(pop) ; 7
; Joined path conditions
(assert (ascending%precondition ($Snap.combine ($Snap.first $t@36@01) $Snap.unit) xs@26@01))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (>=
      y@27@01
      (last ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
    (ascending ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
  (and
    (>=
      y@27@01
      (last ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
    (ascending ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)
    (ascending%precondition ($Snap.combine ($Snap.first $t@36@01) $Snap.unit) xs@26@01))))
(assert (and
  (>= y@27@01 (last ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
  (ascending ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)))
(assert (=>
  (and
    (>=
      y@27@01
      (last ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
    (ascending ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
  (ascending ($Snap.combine ($Snap.first $t@36@01) $Snap.unit) xs@26@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; ys := xs
; [exec]
; i := 1
; [eval] ys != null
; [eval] 0 <= i
; [eval] i <= old(length(xs))
; [eval] old(length(xs))
; [eval] length(xs)
(set-option :timeout 0)
(push) ; 5
; [eval] xs != null
(pop) ; 5
; Joined path conditions
(push) ; 5
(assert (not (<= 1 (length ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (<= 1 (length ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)))
; [eval] i > 0 ==> head(ys) == old(head(xs))
; [eval] i > 0
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 34 | True | live]
; [else-branch: 34 | False | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 34 | True]
; [eval] head(ys) == old(head(xs))
; [eval] head(ys)
(push) ; 7
; [eval] xs != null
(pop) ; 7
; Joined path conditions
; [eval] old(head(xs))
; [eval] head(xs)
(push) ; 7
; [eval] xs != null
(pop) ; 7
; Joined path conditions
(pop) ; 6
(pop) ; 5
; Joined path conditions
; [eval] i == 0 ==> head(ys) == y
; [eval] i == 0
(push) ; 5
; [then-branch: 35 | False | dead]
; [else-branch: 35 | True | live]
(push) ; 6
; [else-branch: 35 | True]
(pop) ; 6
(pop) ; 5
; Joined path conditions
; [eval] length(ys) == old(length(xs)) + 1
; [eval] length(ys)
(push) ; 5
; [eval] xs != null
(pop) ; 5
; Joined path conditions
; [eval] old(length(xs)) + 1
; [eval] old(length(xs))
; [eval] length(xs)
(push) ; 5
; [eval] xs != null
(pop) ; 5
; Joined path conditions
; [eval] elems(ys) == old(elems(xs))[0..i] ++ Seq(y) ++ old(elems(xs))[i..]
; [eval] elems(ys)
(push) ; 5
; [eval] xs != null
(pop) ; 5
; Joined path conditions
; [eval] old(elems(xs))[0..i] ++ Seq(y) ++ old(elems(xs))[i..]
; [eval] old(elems(xs))[0..i] ++ Seq(y)
; [eval] old(elems(xs))[0..i]
; [eval] old(elems(xs))[..i]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 5
; [eval] xs != null
(pop) ; 5
; Joined path conditions
; [eval] Seq(y)
; [eval] old(elems(xs))[i..]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 5
; [eval] xs != null
(pop) ; 5
; Joined path conditions
(push) ; 5
(assert (not (Seq_equal
  (elems ($Snap.combine ($Snap.first $t@36@01) $Snap.unit) xs@26@01)
  (Seq_append
    (Seq_append
      (Seq_drop
        (Seq_take
          (elems ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)
          1)
        0)
      (Seq_singleton y@27@01))
    (Seq_drop
      (elems ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)
      1)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (elems ($Snap.combine ($Snap.first $t@36@01) $Snap.unit) xs@26@01)
  (Seq_append
    (Seq_append
      (Seq_drop
        (Seq_take
          (elems ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)
          1)
        0)
      (Seq_singleton y@27@01))
    (Seq_drop
      (elems ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)
      1))))
; [eval] old(ascending(xs)) ==> ascending(ys)
; [eval] old(ascending(xs))
; [eval] ascending(xs)
(push) ; 5
; [eval] xs != null
(assert (ascending%precondition ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
(pop) ; 5
; Joined path conditions
(assert (ascending%precondition ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (not (ascending ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 36 | ascending((First:($t@30@01), _), xs@26@01) | live]
; [else-branch: 36 | !(ascending((First:($t@30@01), _), xs@26@01)) | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 36 | ascending((First:($t@30@01), _), xs@26@01)]
; [eval] ascending(ys)
(push) ; 7
; [eval] xs != null
(assert (ascending%precondition ($Snap.combine ($Snap.first $t@36@01) $Snap.unit) xs@26@01))
(pop) ; 7
; Joined path conditions
(assert (ascending%precondition ($Snap.combine ($Snap.first $t@36@01) $Snap.unit) xs@26@01))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (ascending ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)
  (ascending%precondition ($Snap.combine ($Snap.first $t@36@01) $Snap.unit) xs@26@01)))
(push) ; 5
(assert (not (=>
  (ascending ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)
  (ascending ($Snap.combine ($Snap.first $t@36@01) $Snap.unit) xs@26@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (ascending ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)
  (ascending ($Snap.combine ($Snap.first $t@36@01) $Snap.unit) xs@26@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 31 | tail((First:($t@30@01), _), xs@26@01) != Null]
(assert (not
  (= (tail ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01) $Ref.null)))
(pop) ; 4
; [eval] !(tail(xs) == null)
; [eval] tail(xs) == null
; [eval] tail(xs)
(push) ; 4
; [eval] xs != null
(pop) ; 4
; Joined path conditions
(push) ; 4
(set-option :timeout 10)
(assert (not (= (tail ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (= (tail ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01) $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 37 | tail((First:($t@30@01), _), xs@26@01) != Null | live]
; [else-branch: 37 | tail((First:($t@30@01), _), xs@26@01) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 37 | tail((First:($t@30@01), _), xs@26@01) != Null]
(assert (not
  (= (tail ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01) $Ref.null)))
; [exec]
; unfold acc(list(xs), write)
(assert (=
  ($Snap.first $t@30@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@30@01))
    ($Snap.second ($Snap.first $t@30@01)))))
(assert (=
  ($Snap.second ($Snap.first $t@30@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@30@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@30@01))))))
; [eval] xs.next != null
(push) ; 5
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@30@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@30@01))) $Ref.null))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 38 | First:(First:($t@30@01)) != Null | live]
; [else-branch: 38 | First:(First:($t@30@01)) == Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 38 | First:(First:($t@30@01)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@30@01))) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first $t@30@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@30@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@30@01))))
  $Snap.unit))
; [eval] xs.next != null
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (list%trigger ($Snap.first $t@30@01) xs@26@01))
; [eval] y <= (unfolding acc(list(xs.next), write) in xs.next.val)
; [eval] (unfolding acc(list(xs.next), write) in xs.next.val)
(set-option :timeout 0)
(push) ; 6
(assert (list%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@30@01)))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01)))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))))))
(push) ; 7
(set-option :timeout 10)
(assert (not (= xs@26@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@30@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01)))))))))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= xs@26@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@30@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] xs.next != null
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 39 | First:(First:(Second:(Second:(First:($t@30@01))))) != Null | live]
; [else-branch: 39 | First:(First:(Second:(Second:(First:($t@30@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 39 | First:(First:(Second:(Second:(First:($t@30@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01)))))))
  $Snap.unit))
; [eval] xs.next != null
(pop) ; 7
(push) ; 7
; [else-branch: 39 | First:(First:(Second:(Second:(First:($t@30@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))))
  $Snap.unit))
(pop) ; 7
(pop) ; 6
(declare-const joined_unfolding@37@01 Int)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))))
      $Ref.null))
  (=
    (as joined_unfolding@37@01  Int)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))))
    $Ref.null)
  (=
    (as joined_unfolding@37@01  Int)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))))))))
; Joined path conditions
(assert (and
  (list%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@30@01))))
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01)))))
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01)))))))
  (=
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))))
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))))
        $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01)))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01)))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01)))))))
      $Snap.unit))))
; Joined path conditions
(assert (and
  (list%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@30@01))))
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01)))))
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01)))))))
  (=
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))))
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))))
      $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))))
      $Ref.null))))
(push) ; 6
(set-option :timeout 10)
(assert (not (not (<= y@27@01 (as joined_unfolding@37@01  Int)))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (<= y@27@01 (as joined_unfolding@37@01  Int))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 40 | y@27@01 <= joined_unfolding@37@01 | live]
; [else-branch: 40 | !(y@27@01 <= joined_unfolding@37@01) | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 40 | y@27@01 <= joined_unfolding@37@01]
(assert (<= y@27@01 (as joined_unfolding@37@01  Int)))
; [exec]
; ys := new(val, next)
(declare-const ys@38@01 $Ref)
(assert (not (= ys@38@01 $Ref.null)))
(declare-const val@39@01 Int)
(declare-const next@40@01 $Ref)
(assert (not
  (= ys@38@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@30@01))))))
(assert (not (= ys@38@01 ys@28@01)))
(assert (not (= ys@38@01 xs@26@01)))
; [exec]
; ys.val := y
(push) ; 7
(set-option :timeout 10)
(assert (not (= xs@26@01 ys@38@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [exec]
; ys.next := xs.next
(declare-const next@41@01 $Ref)
(assert (= next@41@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@30@01)))))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= xs@26@01 ys@38@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [exec]
; fold acc(list(ys), write)
; [eval] xs.next != null
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= next@41@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= next@41@01 $Ref.null))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 41 | next@41@01 != Null | live]
; [else-branch: 41 | next@41@01 == Null | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 41 | next@41@01 != Null]
(assert (not (= next@41@01 $Ref.null)))
(push) ; 8
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@30@01))) next@41@01)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [eval] xs.next != null
(assert (list%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap next@41@01)
  ($Snap.combine
    ($SortWrappers.IntTo$Snap y@27@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))
      $Snap.unit))) ys@38@01))
; [exec]
; xs.next := ys
; [exec]
; ys := xs
; [exec]
; i := 1
; [exec]
; fold acc(list(ys), write)
; [eval] xs.next != null
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ys@38@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 42 | ys@38@01 != Null | live]
; [else-branch: 42 | ys@38@01 == Null | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 42 | ys@38@01 != Null]
; [eval] xs.next != null
(assert (list%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap ys@38@01)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@30@01)))
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap next@41@01)
        ($Snap.combine
          ($SortWrappers.IntTo$Snap y@27@01)
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))
            $Snap.unit)))
      $Snap.unit))) xs@26@01))
; [eval] ys != null
; [eval] 0 <= i
; [eval] i <= old(length(xs))
; [eval] old(length(xs))
; [eval] length(xs)
(push) ; 9
; [eval] xs != null
(assert (length%precondition ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
(pop) ; 9
; Joined path conditions
(assert (length%precondition ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
(push) ; 9
(assert (not (<= 1 (length ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (<= 1 (length ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)))
; [eval] i > 0 ==> head(ys) == old(head(xs))
; [eval] i > 0
(push) ; 9
(push) ; 10
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 43 | True | live]
; [else-branch: 43 | False | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 43 | True]
; [eval] head(ys) == old(head(xs))
; [eval] head(ys)
(push) ; 11
; [eval] xs != null
(assert (head%precondition ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap ys@38@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@30@01)))
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap next@41@01)
          ($Snap.combine
            ($SortWrappers.IntTo$Snap y@27@01)
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))
              $Snap.unit)))
        $Snap.unit)))
  $Snap.unit) xs@26@01))
(pop) ; 11
; Joined path conditions
(assert (head%precondition ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap ys@38@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@30@01)))
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap next@41@01)
          ($Snap.combine
            ($SortWrappers.IntTo$Snap y@27@01)
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))
              $Snap.unit)))
        $Snap.unit)))
  $Snap.unit) xs@26@01))
; [eval] old(head(xs))
; [eval] head(xs)
(push) ; 11
; [eval] xs != null
(pop) ; 11
; Joined path conditions
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (head%precondition ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap ys@38@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@30@01)))
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap next@41@01)
          ($Snap.combine
            ($SortWrappers.IntTo$Snap y@27@01)
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))
              $Snap.unit)))
        $Snap.unit)))
  $Snap.unit) xs@26@01))
(push) ; 9
(assert (not (=
  (head ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap ys@38@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@30@01)))
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap next@41@01)
            ($Snap.combine
              ($SortWrappers.IntTo$Snap y@27@01)
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))
                $Snap.unit)))
          $Snap.unit)))
    $Snap.unit) xs@26@01)
  (head ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (=
  (head ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap ys@38@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@30@01)))
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap next@41@01)
            ($Snap.combine
              ($SortWrappers.IntTo$Snap y@27@01)
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))
                $Snap.unit)))
          $Snap.unit)))
    $Snap.unit) xs@26@01)
  (head ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)))
; [eval] i == 0 ==> head(ys) == y
; [eval] i == 0
(push) ; 9
; [then-branch: 44 | False | dead]
; [else-branch: 44 | True | live]
(push) ; 10
; [else-branch: 44 | True]
(pop) ; 10
(pop) ; 9
; Joined path conditions
; [eval] length(ys) == old(length(xs)) + 1
; [eval] length(ys)
(push) ; 9
; [eval] xs != null
(assert (length%precondition ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap ys@38@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@30@01)))
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap next@41@01)
          ($Snap.combine
            ($SortWrappers.IntTo$Snap y@27@01)
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))
              $Snap.unit)))
        $Snap.unit)))
  $Snap.unit) xs@26@01))
(pop) ; 9
; Joined path conditions
(assert (length%precondition ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap ys@38@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@30@01)))
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap next@41@01)
          ($Snap.combine
            ($SortWrappers.IntTo$Snap y@27@01)
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))
              $Snap.unit)))
        $Snap.unit)))
  $Snap.unit) xs@26@01))
; [eval] old(length(xs)) + 1
; [eval] old(length(xs))
; [eval] length(xs)
(push) ; 9
; [eval] xs != null
(pop) ; 9
; Joined path conditions
(push) ; 9
(assert (not (=
  (length ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap ys@38@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@30@01)))
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap next@41@01)
            ($Snap.combine
              ($SortWrappers.IntTo$Snap y@27@01)
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))
                $Snap.unit)))
          $Snap.unit)))
    $Snap.unit) xs@26@01)
  (+ (length ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01) 1))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (=
  (length ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap ys@38@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@30@01)))
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap next@41@01)
            ($Snap.combine
              ($SortWrappers.IntTo$Snap y@27@01)
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))
                $Snap.unit)))
          $Snap.unit)))
    $Snap.unit) xs@26@01)
  (+ (length ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01) 1)))
; [eval] elems(ys) == old(elems(xs))[0..i] ++ Seq(y) ++ old(elems(xs))[i..]
; [eval] elems(ys)
(push) ; 9
; [eval] xs != null
(assert (elems%precondition ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap ys@38@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@30@01)))
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap next@41@01)
          ($Snap.combine
            ($SortWrappers.IntTo$Snap y@27@01)
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))
              $Snap.unit)))
        $Snap.unit)))
  $Snap.unit) xs@26@01))
(pop) ; 9
; Joined path conditions
(assert (elems%precondition ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap ys@38@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@30@01)))
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap next@41@01)
          ($Snap.combine
            ($SortWrappers.IntTo$Snap y@27@01)
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))
              $Snap.unit)))
        $Snap.unit)))
  $Snap.unit) xs@26@01))
; [eval] old(elems(xs))[0..i] ++ Seq(y) ++ old(elems(xs))[i..]
; [eval] old(elems(xs))[0..i] ++ Seq(y)
; [eval] old(elems(xs))[0..i]
; [eval] old(elems(xs))[..i]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 9
; [eval] xs != null
(assert (elems%precondition ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
(pop) ; 9
; Joined path conditions
(assert (elems%precondition ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
; [eval] Seq(y)
(assert (= (Seq_length (Seq_singleton y@27@01)) 1))
; [eval] old(elems(xs))[i..]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 9
; [eval] xs != null
(pop) ; 9
; Joined path conditions
(push) ; 9
(assert (not (Seq_equal
  (elems ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap ys@38@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@30@01)))
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap next@41@01)
            ($Snap.combine
              ($SortWrappers.IntTo$Snap y@27@01)
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))
                $Snap.unit)))
          $Snap.unit)))
    $Snap.unit) xs@26@01)
  (Seq_append
    (Seq_append
      (Seq_drop
        (Seq_take
          (elems ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)
          1)
        0)
      (Seq_singleton y@27@01))
    (Seq_drop
      (elems ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)
      1)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (elems ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap ys@38@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@30@01)))
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap next@41@01)
            ($Snap.combine
              ($SortWrappers.IntTo$Snap y@27@01)
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))
                $Snap.unit)))
          $Snap.unit)))
    $Snap.unit) xs@26@01)
  (Seq_append
    (Seq_append
      (Seq_drop
        (Seq_take
          (elems ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)
          1)
        0)
      (Seq_singleton y@27@01))
    (Seq_drop
      (elems ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)
      1))))
; [eval] old(ascending(xs)) ==> ascending(ys)
; [eval] old(ascending(xs))
; [eval] ascending(xs)
(push) ; 9
; [eval] xs != null
(assert (ascending%precondition ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
(pop) ; 9
; Joined path conditions
(assert (ascending%precondition ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
(push) ; 9
(push) ; 10
(set-option :timeout 10)
(assert (not (not (ascending ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (ascending ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 45 | ascending((First:($t@30@01), _), xs@26@01) | live]
; [else-branch: 45 | !(ascending((First:($t@30@01), _), xs@26@01)) | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 45 | ascending((First:($t@30@01), _), xs@26@01)]
(assert (ascending ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
; [eval] ascending(ys)
(push) ; 11
; [eval] xs != null
(assert (ascending%precondition ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap ys@38@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@30@01)))
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap next@41@01)
          ($Snap.combine
            ($SortWrappers.IntTo$Snap y@27@01)
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))
              $Snap.unit)))
        $Snap.unit)))
  $Snap.unit) xs@26@01))
(pop) ; 11
; Joined path conditions
(assert (ascending%precondition ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap ys@38@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@30@01)))
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap next@41@01)
          ($Snap.combine
            ($SortWrappers.IntTo$Snap y@27@01)
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))
              $Snap.unit)))
        $Snap.unit)))
  $Snap.unit) xs@26@01))
(pop) ; 10
(push) ; 10
; [else-branch: 45 | !(ascending((First:($t@30@01), _), xs@26@01))]
(assert (not (ascending ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (ascending ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)
  (and
    (ascending ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)
    (ascending%precondition ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap ys@38@01)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.first $t@30@01)))
          ($Snap.combine
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap next@41@01)
              ($Snap.combine
                ($SortWrappers.IntTo$Snap y@27@01)
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))
                  $Snap.unit)))
            $Snap.unit)))
      $Snap.unit) xs@26@01))))
; Joined path conditions
(assert (or
  (not (ascending ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
  (ascending ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)))
(push) ; 9
(assert (not (=>
  (ascending ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)
  (ascending ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap ys@38@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@30@01)))
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap next@41@01)
            ($Snap.combine
              ($SortWrappers.IntTo$Snap y@27@01)
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))
                $Snap.unit)))
          $Snap.unit)))
    $Snap.unit) xs@26@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (ascending ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)
  (ascending ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap ys@38@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@30@01)))
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap next@41@01)
            ($Snap.combine
              ($SortWrappers.IntTo$Snap y@27@01)
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))
                $Snap.unit)))
          $Snap.unit)))
    $Snap.unit) xs@26@01)))
(pop) ; 8
(pop) ; 7
(pop) ; 6
(push) ; 6
; [else-branch: 40 | !(y@27@01 <= joined_unfolding@37@01)]
(assert (not (<= y@27@01 (as joined_unfolding@37@01  Int))))
(pop) ; 6
; [eval] !(y <= (unfolding acc(list(xs.next), write) in xs.next.val))
; [eval] y <= (unfolding acc(list(xs.next), write) in xs.next.val)
; [eval] (unfolding acc(list(xs.next), write) in xs.next.val)
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (= xs@26@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@30@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= xs@26@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@30@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] xs.next != null
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 46 | First:(First:(Second:(Second:(First:($t@30@01))))) != Null | live]
; [else-branch: 46 | First:(First:(Second:(Second:(First:($t@30@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 46 | First:(First:(Second:(Second:(First:($t@30@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01)))))))
  $Snap.unit))
; [eval] xs.next != null
(pop) ; 7
(push) ; 7
; [else-branch: 46 | First:(First:(Second:(Second:(First:($t@30@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))))
  $Snap.unit))
(pop) ; 7
(pop) ; 6
(declare-const joined_unfolding@42@01 Int)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))))
      $Ref.null))
  (=
    (as joined_unfolding@42@01  Int)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))))
    $Ref.null)
  (=
    (as joined_unfolding@42@01  Int)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))))))))
; Joined path conditions
; Joined path conditions
(push) ; 6
(set-option :timeout 10)
(assert (not (<= y@27@01 (as joined_unfolding@42@01  Int))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (<= y@27@01 (as joined_unfolding@42@01  Int)))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 47 | !(y@27@01 <= joined_unfolding@42@01) | live]
; [else-branch: 47 | y@27@01 <= joined_unfolding@42@01 | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 47 | !(y@27@01 <= joined_unfolding@42@01)]
(assert (not (<= y@27@01 (as joined_unfolding@42@01  Int))))
; [exec]
; ys, i := insert(xs.next, y)
; [eval] xs != null
(declare-const ys@43@01 $Ref)
(declare-const i@44@01 Int)
(declare-const $t@45@01 $Snap)
(assert (= $t@45@01 ($Snap.combine ($Snap.first $t@45@01) ($Snap.second $t@45@01))))
(assert (=
  ($Snap.second $t@45@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@45@01))
    ($Snap.second ($Snap.second $t@45@01)))))
(assert (= ($Snap.first ($Snap.second $t@45@01)) $Snap.unit))
; [eval] ys != null
(assert (not (= ys@43@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second $t@45@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@45@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@45@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@45@01))) $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@44@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@45@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@45@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@45@01))))
  $Snap.unit))
; [eval] i <= old(length(xs))
; [eval] old(length(xs))
; [eval] length(xs)
(push) ; 7
; [eval] xs != null
(assert (length%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@30@01)))))
(pop) ; 7
; Joined path conditions
(assert (length%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@30@01)))))
(assert (<=
  i@44@01
  (length ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))
    $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@30@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01)))))
  $Snap.unit))
; [eval] i > 0 ==> head(ys) == old(head(xs))
; [eval] i > 0
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not (not (> i@44@01 0))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (> i@44@01 0)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 48 | i@44@01 > 0 | live]
; [else-branch: 48 | !(i@44@01 > 0) | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 48 | i@44@01 > 0]
(assert (> i@44@01 0))
; [eval] head(ys) == old(head(xs))
; [eval] head(ys)
(push) ; 9
; [eval] xs != null
(assert (head%precondition ($Snap.combine ($Snap.first $t@45@01) $Snap.unit) ys@43@01))
(pop) ; 9
; Joined path conditions
(assert (head%precondition ($Snap.combine ($Snap.first $t@45@01) $Snap.unit) ys@43@01))
; [eval] old(head(xs))
; [eval] head(xs)
(push) ; 9
; [eval] xs != null
(assert (head%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@30@01)))))
(pop) ; 9
; Joined path conditions
(assert (head%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@30@01)))))
(pop) ; 8
(push) ; 8
; [else-branch: 48 | !(i@44@01 > 0)]
(assert (not (> i@44@01 0)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (> i@44@01 0)
  (and
    (> i@44@01 0)
    (head%precondition ($Snap.combine ($Snap.first $t@45@01) $Snap.unit) ys@43@01)
    (head%precondition ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@30@01)))))))
; Joined path conditions
(assert (or (not (> i@44@01 0)) (> i@44@01 0)))
(assert (=>
  (> i@44@01 0)
  (=
    (head ($Snap.combine ($Snap.first $t@45@01) $Snap.unit) ys@43@01)
    (head ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@30@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01))))))
  $Snap.unit))
; [eval] i == 0 ==> head(ys) == y
; [eval] i == 0
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not (not (= i@44@01 0))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= i@44@01 0)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 49 | i@44@01 == 0 | live]
; [else-branch: 49 | i@44@01 != 0 | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 49 | i@44@01 == 0]
(assert (= i@44@01 0))
; [eval] head(ys) == y
; [eval] head(ys)
(push) ; 9
; [eval] xs != null
(assert (head%precondition ($Snap.combine ($Snap.first $t@45@01) $Snap.unit) ys@43@01))
(pop) ; 9
; Joined path conditions
(assert (head%precondition ($Snap.combine ($Snap.first $t@45@01) $Snap.unit) ys@43@01))
(pop) ; 8
(push) ; 8
; [else-branch: 49 | i@44@01 != 0]
(assert (not (= i@44@01 0)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (= i@44@01 0)
  (and
    (= i@44@01 0)
    (head%precondition ($Snap.combine ($Snap.first $t@45@01) $Snap.unit) ys@43@01))))
; Joined path conditions
(assert (or (not (= i@44@01 0)) (= i@44@01 0)))
(assert (=>
  (= i@44@01 0)
  (= (head ($Snap.combine ($Snap.first $t@45@01) $Snap.unit) ys@43@01) y@27@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01)))))))
  $Snap.unit))
; [eval] length(ys) == old(length(xs)) + 1
; [eval] length(ys)
(push) ; 7
; [eval] xs != null
(assert (length%precondition ($Snap.combine ($Snap.first $t@45@01) $Snap.unit) ys@43@01))
(pop) ; 7
; Joined path conditions
(assert (length%precondition ($Snap.combine ($Snap.first $t@45@01) $Snap.unit) ys@43@01))
; [eval] old(length(xs)) + 1
; [eval] old(length(xs))
; [eval] length(xs)
(push) ; 7
; [eval] xs != null
(pop) ; 7
; Joined path conditions
(assert (=
  (length ($Snap.combine ($Snap.first $t@45@01) $Snap.unit) ys@43@01)
  (+
    (length ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@30@01))))
    1)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01))))))))
  $Snap.unit))
; [eval] elems(ys) == old(elems(xs))[0..i] ++ Seq(y) ++ old(elems(xs))[i..]
; [eval] elems(ys)
(push) ; 7
; [eval] xs != null
(assert (elems%precondition ($Snap.combine ($Snap.first $t@45@01) $Snap.unit) ys@43@01))
(pop) ; 7
; Joined path conditions
(assert (elems%precondition ($Snap.combine ($Snap.first $t@45@01) $Snap.unit) ys@43@01))
; [eval] old(elems(xs))[0..i] ++ Seq(y) ++ old(elems(xs))[i..]
; [eval] old(elems(xs))[0..i] ++ Seq(y)
; [eval] old(elems(xs))[0..i]
; [eval] old(elems(xs))[..i]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 7
; [eval] xs != null
(assert (elems%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@30@01)))))
(pop) ; 7
; Joined path conditions
(assert (elems%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@30@01)))))
; [eval] Seq(y)
(assert (= (Seq_length (Seq_singleton y@27@01)) 1))
; [eval] old(elems(xs))[i..]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 7
; [eval] xs != null
(pop) ; 7
; Joined path conditions
(assert (Seq_equal
  (elems ($Snap.combine ($Snap.first $t@45@01) $Snap.unit) ys@43@01)
  (Seq_append
    (Seq_append
      (Seq_drop
        (Seq_take
          (elems ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))
            $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@30@01))))
          i@44@01)
        0)
      (Seq_singleton y@27@01))
    (Seq_drop
      (elems ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))
        $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@30@01))))
      i@44@01))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01))))))))
  $Snap.unit))
; [eval] old(ascending(xs)) ==> ascending(ys)
; [eval] old(ascending(xs))
; [eval] ascending(xs)
(push) ; 7
; [eval] xs != null
(assert (ascending%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@30@01)))))
(pop) ; 7
; Joined path conditions
(assert (ascending%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@30@01)))))
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (ascending ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))
    $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@30@01)))))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (ascending ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@30@01))))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 50 | ascending((First:(Second:(Second:(First:($t@30@01)))), _), First:(First:($t@30@01))) | live]
; [else-branch: 50 | !(ascending((First:(Second:(Second:(First:($t@30@01)))), _), First:(First:($t@30@01)))) | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 50 | ascending((First:(Second:(Second:(First:($t@30@01)))), _), First:(First:($t@30@01)))]
(assert (ascending ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@30@01)))))
; [eval] ascending(ys)
(push) ; 9
; [eval] xs != null
(assert (ascending%precondition ($Snap.combine ($Snap.first $t@45@01) $Snap.unit) ys@43@01))
(pop) ; 9
; Joined path conditions
(assert (ascending%precondition ($Snap.combine ($Snap.first $t@45@01) $Snap.unit) ys@43@01))
(pop) ; 8
(push) ; 8
; [else-branch: 50 | !(ascending((First:(Second:(Second:(First:($t@30@01)))), _), First:(First:($t@30@01))))]
(assert (not
  (ascending ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))
    $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@30@01))))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (ascending ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))
    $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@30@01))))
  (and
    (ascending ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@30@01))))
    (ascending%precondition ($Snap.combine ($Snap.first $t@45@01) $Snap.unit) ys@43@01))))
; Joined path conditions
(assert (or
  (not
    (ascending ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@30@01)))))
  (ascending ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))
    $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@30@01))))))
(assert (=>
  (ascending ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@30@01))))
    $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@30@01))))
  (ascending ($Snap.combine ($Snap.first $t@45@01) $Snap.unit) ys@43@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; xs.next := ys
; [exec]
; ys := xs
; [exec]
; i := i + 1
; [eval] i + 1
(declare-const i@46@01 Int)
(assert (= i@46@01 (+ i@44@01 1)))
; [exec]
; fold acc(list(ys), write)
; [eval] xs.next != null
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ys@43@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 51 | ys@43@01 != Null | live]
; [else-branch: 51 | ys@43@01 == Null | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 51 | ys@43@01 != Null]
; [eval] xs.next != null
(assert (list%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap ys@43@01)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@30@01)))
    ($Snap.combine ($Snap.first $t@45@01) $Snap.unit))) xs@26@01))
; [eval] ys != null
; [eval] 0 <= i
(push) ; 8
(assert (not (<= 0 i@46@01)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 i@46@01))
; [eval] i <= old(length(xs))
; [eval] old(length(xs))
; [eval] length(xs)
(push) ; 8
; [eval] xs != null
(assert (length%precondition ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
(pop) ; 8
; Joined path conditions
(assert (length%precondition ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
(push) ; 8
(assert (not (<= i@46@01 (length ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (<= i@46@01 (length ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)))
; [eval] i > 0 ==> head(ys) == old(head(xs))
; [eval] i > 0
(push) ; 8
(push) ; 9
(set-option :timeout 10)
(assert (not (not (> i@46@01 0))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (> i@46@01 0)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 52 | i@46@01 > 0 | live]
; [else-branch: 52 | !(i@46@01 > 0) | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 52 | i@46@01 > 0]
(assert (> i@46@01 0))
; [eval] head(ys) == old(head(xs))
; [eval] head(ys)
(push) ; 10
; [eval] xs != null
(assert (head%precondition ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap ys@43@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@30@01)))
      ($Snap.combine ($Snap.first $t@45@01) $Snap.unit)))
  $Snap.unit) xs@26@01))
(pop) ; 10
; Joined path conditions
(assert (head%precondition ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap ys@43@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@30@01)))
      ($Snap.combine ($Snap.first $t@45@01) $Snap.unit)))
  $Snap.unit) xs@26@01))
; [eval] old(head(xs))
; [eval] head(xs)
(push) ; 10
; [eval] xs != null
(pop) ; 10
; Joined path conditions
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (> i@46@01 0)
  (and
    (> i@46@01 0)
    (head%precondition ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap ys@43@01)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.first $t@30@01)))
          ($Snap.combine ($Snap.first $t@45@01) $Snap.unit)))
      $Snap.unit) xs@26@01))))
(assert (> i@46@01 0))
(push) ; 8
(assert (not (=>
  (> i@46@01 0)
  (=
    (head ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap ys@43@01)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.first $t@30@01)))
          ($Snap.combine ($Snap.first $t@45@01) $Snap.unit)))
      $Snap.unit) xs@26@01)
    (head ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (> i@46@01 0)
  (=
    (head ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap ys@43@01)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.first $t@30@01)))
          ($Snap.combine ($Snap.first $t@45@01) $Snap.unit)))
      $Snap.unit) xs@26@01)
    (head ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))))
; [eval] i == 0 ==> head(ys) == y
; [eval] i == 0
(push) ; 8
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= i@46@01 0))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 53 | i@46@01 == 0 | dead]
; [else-branch: 53 | i@46@01 != 0 | live]
(set-option :timeout 0)
(push) ; 9
; [else-branch: 53 | i@46@01 != 0]
(assert (not (= i@46@01 0)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (not (= i@46@01 0)))
; [eval] length(ys) == old(length(xs)) + 1
; [eval] length(ys)
(push) ; 8
; [eval] xs != null
(assert (length%precondition ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap ys@43@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@30@01)))
      ($Snap.combine ($Snap.first $t@45@01) $Snap.unit)))
  $Snap.unit) xs@26@01))
(pop) ; 8
; Joined path conditions
(assert (length%precondition ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap ys@43@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@30@01)))
      ($Snap.combine ($Snap.first $t@45@01) $Snap.unit)))
  $Snap.unit) xs@26@01))
; [eval] old(length(xs)) + 1
; [eval] old(length(xs))
; [eval] length(xs)
(push) ; 8
; [eval] xs != null
(pop) ; 8
; Joined path conditions
(push) ; 8
(assert (not (=
  (length ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap ys@43@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@30@01)))
        ($Snap.combine ($Snap.first $t@45@01) $Snap.unit)))
    $Snap.unit) xs@26@01)
  (+ (length ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01) 1))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (=
  (length ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap ys@43@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@30@01)))
        ($Snap.combine ($Snap.first $t@45@01) $Snap.unit)))
    $Snap.unit) xs@26@01)
  (+ (length ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01) 1)))
; [eval] elems(ys) == old(elems(xs))[0..i] ++ Seq(y) ++ old(elems(xs))[i..]
; [eval] elems(ys)
(push) ; 8
; [eval] xs != null
(assert (elems%precondition ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap ys@43@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@30@01)))
      ($Snap.combine ($Snap.first $t@45@01) $Snap.unit)))
  $Snap.unit) xs@26@01))
(pop) ; 8
; Joined path conditions
(assert (elems%precondition ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap ys@43@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@30@01)))
      ($Snap.combine ($Snap.first $t@45@01) $Snap.unit)))
  $Snap.unit) xs@26@01))
; [eval] old(elems(xs))[0..i] ++ Seq(y) ++ old(elems(xs))[i..]
; [eval] old(elems(xs))[0..i] ++ Seq(y)
; [eval] old(elems(xs))[0..i]
; [eval] old(elems(xs))[..i]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 8
; [eval] xs != null
(assert (elems%precondition ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
(pop) ; 8
; Joined path conditions
(assert (elems%precondition ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01))
; [eval] Seq(y)
; [eval] old(elems(xs))[i..]
; [eval] old(elems(xs))
; [eval] elems(xs)
(push) ; 8
; [eval] xs != null
(pop) ; 8
; Joined path conditions
(push) ; 8
(assert (not (Seq_equal
  (elems ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap ys@43@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@30@01)))
        ($Snap.combine ($Snap.first $t@45@01) $Snap.unit)))
    $Snap.unit) xs@26@01)
  (Seq_append
    (Seq_append
      (Seq_drop
        (Seq_take
          (elems ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)
          i@46@01)
        0)
      (Seq_singleton y@27@01))
    (Seq_drop
      (elems ($Snap.combine ($Snap.first $t@30@01) $Snap.unit) xs@26@01)
      i@46@01)))))
(check-sat)
; ---------- test01 ----------
(declare-const xs@47@01 $Ref)
; ---------- test02 ----------
(declare-const xs@48@01 $Ref)
