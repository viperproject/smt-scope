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
; ---------- FUNCTION length----------
(declare-fun xs@0@00 () $Ref)
(declare-fun result@1@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.second s@$) $Snap.unit))
; [eval] xs != null
(assert (not (= xs@0@00 $Ref.null)))
(declare-const $t@20@00 $Snap)
(assert (= $t@20@00 $Snap.unit))
; [eval] result > 0
(assert (> result@1@00 0))
(pop) ; 1
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
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.second s@$) $Snap.unit))
(assert (not (= xs@0@00 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(list(xs), write) in 1 + (xs.next == null ? 0 : length(xs.next)))
(set-option :timeout 0)
(push) ; 2
(assert (list%trigger ($Snap.first s@$) xs@0@00))
(assert (=
  ($Snap.first s@$)
  ($Snap.combine
    ($Snap.first ($Snap.first s@$))
    ($Snap.second ($Snap.first s@$)))))
(assert (=
  ($Snap.second ($Snap.first s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first s@$)))
    ($Snap.second ($Snap.second ($Snap.first s@$))))))
; [eval] xs.next != null
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | First:(First:(s@$)) != Null | live]
; [else-branch: 0 | First:(First:(s@$)) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | First:(First:(s@$)) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))))
(assert (= ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))) $Snap.unit))
; [eval] xs.next != null
; [eval] 1 + (xs.next == null ? 0 : length(xs.next))
; [eval] (xs.next == null ? 0 : length(xs.next))
; [eval] xs.next == null
(push) ; 4
; [then-branch: 1 | First:(First:(s@$)) == Null | dead]
; [else-branch: 1 | First:(First:(s@$)) != Null | live]
(push) ; 5
; [else-branch: 1 | First:(First:(s@$)) != Null]
; [eval] length(xs.next)
(push) ; 6
; [eval] xs != null
(assert (length%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))))
(pop) ; 6
; Joined path conditions
(assert (length%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
  (length%precondition ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
    $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))))))
(pop) ; 3
(push) ; 3
; [else-branch: 0 | First:(First:(s@$)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.first s@$))) $Snap.unit))
; [eval] 1 + (xs.next == null ? 0 : length(xs.next))
; [eval] (xs.next == null ? 0 : length(xs.next))
; [eval] xs.next == null
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | First:(First:(s@$)) == Null | live]
; [else-branch: 2 | First:(First:(s@$)) != Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 2 | First:(First:(s@$)) == Null]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(pop) ; 3
(pop) ; 2
(declare-fun joined_unfolding@21@00 ($Snap $Ref) Int)
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
  (=
    (joined_unfolding@21@00 s@$ xs@0@00)
    (+
      1
      (length ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
        $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)
  (= (joined_unfolding@21@00 s@$ xs@0@00) 1)))
; Joined path conditions
(assert (and
  (list%trigger ($Snap.first s@$) xs@0@00)
  (=
    ($Snap.first s@$)
    ($Snap.combine
      ($Snap.first ($Snap.first s@$))
      ($Snap.second ($Snap.first s@$))))
  (=
    ($Snap.second ($Snap.first s@$))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first s@$)))
      ($Snap.second ($Snap.second ($Snap.first s@$)))))))
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
  (and
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.first s@$)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))
    (= ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))) $Snap.unit)
    (=>
      (not
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
      (length%precondition ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
        $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))))))))
; Joined path conditions
(assert (and
  (list%trigger ($Snap.first s@$) xs@0@00)
  (=
    ($Snap.first s@$)
    ($Snap.combine
      ($Snap.first ($Snap.first s@$))
      ($Snap.second ($Snap.first s@$))))
  (=
    ($Snap.second ($Snap.first s@$))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first s@$)))
      ($Snap.second ($Snap.second ($Snap.first s@$)))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)
  (and
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)
    (= ($Snap.second ($Snap.second ($Snap.first s@$))) $Snap.unit))))
(assert (or
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))))
(assert (= result@1@00 (joined_unfolding@21@00 s@$ xs@0@00)))
; [eval] result > 0
(push) ; 2
(assert (not (> result@1@00 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (> result@1@00 0))
(pop) ; 1
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
; ---------- FUNCTION head----------
(declare-fun xs@2@00 () $Ref)
(declare-fun result@3@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.second s@$) $Snap.unit))
; [eval] xs != null
(assert (not (= xs@2@00 $Ref.null)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (xs@2@00 $Ref)) (!
  (= (head%limited s@$ xs@2@00) (head s@$ xs@2@00))
  :pattern ((head s@$ xs@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (xs@2@00 $Ref)) (!
  (head%stateless xs@2@00)
  :pattern ((head%limited s@$ xs@2@00))
  :qid |quant-u-3|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.second s@$) $Snap.unit))
(assert (not (= xs@2@00 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(list(xs), write) in xs.val)
(set-option :timeout 0)
(push) ; 2
(assert (list%trigger ($Snap.first s@$) xs@2@00))
(assert (=
  ($Snap.first s@$)
  ($Snap.combine
    ($Snap.first ($Snap.first s@$))
    ($Snap.second ($Snap.first s@$)))))
(assert (=
  ($Snap.second ($Snap.first s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first s@$)))
    ($Snap.second ($Snap.second ($Snap.first s@$))))))
; [eval] xs.next != null
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | First:(First:(s@$)) != Null | live]
; [else-branch: 3 | First:(First:(s@$)) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 3 | First:(First:(s@$)) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))))
(assert (= ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))) $Snap.unit))
; [eval] xs.next != null
(pop) ; 3
(push) ; 3
; [else-branch: 3 | First:(First:(s@$)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.first s@$))) $Snap.unit))
(pop) ; 3
(pop) ; 2
(declare-fun joined_unfolding@22@00 ($Snap $Ref) Int)
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
  (=
    (joined_unfolding@22@00 s@$ xs@2@00)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$)))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)
  (=
    (joined_unfolding@22@00 s@$ xs@2@00)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$)))))))
; Joined path conditions
(assert (and
  (list%trigger ($Snap.first s@$) xs@2@00)
  (=
    ($Snap.first s@$)
    ($Snap.combine
      ($Snap.first ($Snap.first s@$))
      ($Snap.second ($Snap.first s@$))))
  (=
    ($Snap.second ($Snap.first s@$))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first s@$)))
      ($Snap.second ($Snap.second ($Snap.first s@$)))))))
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
  (and
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.first s@$)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))
    (= ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))) $Snap.unit))))
; Joined path conditions
(assert (and
  (list%trigger ($Snap.first s@$) xs@2@00)
  (=
    ($Snap.first s@$)
    ($Snap.combine
      ($Snap.first ($Snap.first s@$))
      ($Snap.second ($Snap.first s@$))))
  (=
    ($Snap.second ($Snap.first s@$))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first s@$)))
      ($Snap.second ($Snap.second ($Snap.first s@$)))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)
  (and
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)
    (= ($Snap.second ($Snap.second ($Snap.first s@$))) $Snap.unit))))
(assert (or
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))))
(assert (= result@3@00 (joined_unfolding@22@00 s@$ xs@2@00)))
(pop) ; 1
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
; ---------- FUNCTION tail----------
(declare-fun xs@4@00 () $Ref)
(declare-fun result@5@00 () $Ref)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.second s@$) $Snap.unit))
; [eval] xs != null
(assert (not (= xs@4@00 $Ref.null)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (xs@4@00 $Ref)) (!
  (= (tail%limited s@$ xs@4@00) (tail s@$ xs@4@00))
  :pattern ((tail s@$ xs@4@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (xs@4@00 $Ref)) (!
  (tail%stateless xs@4@00)
  :pattern ((tail%limited s@$ xs@4@00))
  :qid |quant-u-5|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.second s@$) $Snap.unit))
(assert (not (= xs@4@00 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(list(xs), write) in xs.next)
(set-option :timeout 0)
(push) ; 2
(assert (list%trigger ($Snap.first s@$) xs@4@00))
(assert (=
  ($Snap.first s@$)
  ($Snap.combine
    ($Snap.first ($Snap.first s@$))
    ($Snap.second ($Snap.first s@$)))))
(assert (=
  ($Snap.second ($Snap.first s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first s@$)))
    ($Snap.second ($Snap.second ($Snap.first s@$))))))
; [eval] xs.next != null
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | First:(First:(s@$)) != Null | live]
; [else-branch: 4 | First:(First:(s@$)) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 4 | First:(First:(s@$)) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))))
(assert (= ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))) $Snap.unit))
; [eval] xs.next != null
(pop) ; 3
(push) ; 3
; [else-branch: 4 | First:(First:(s@$)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.first s@$))) $Snap.unit))
(pop) ; 3
(pop) ; 2
(declare-fun joined_unfolding@23@00 ($Snap $Ref) $Ref)
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
  (=
    (joined_unfolding@23@00 s@$ xs@4@00)
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)
  (=
    (joined_unfolding@23@00 s@$ xs@4@00)
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))))))
; Joined path conditions
(assert (and
  (list%trigger ($Snap.first s@$) xs@4@00)
  (=
    ($Snap.first s@$)
    ($Snap.combine
      ($Snap.first ($Snap.first s@$))
      ($Snap.second ($Snap.first s@$))))
  (=
    ($Snap.second ($Snap.first s@$))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first s@$)))
      ($Snap.second ($Snap.second ($Snap.first s@$)))))))
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
  (and
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.first s@$)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))
    (= ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))) $Snap.unit))))
; Joined path conditions
(assert (and
  (list%trigger ($Snap.first s@$) xs@4@00)
  (=
    ($Snap.first s@$)
    ($Snap.combine
      ($Snap.first ($Snap.first s@$))
      ($Snap.second ($Snap.first s@$))))
  (=
    ($Snap.second ($Snap.first s@$))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first s@$)))
      ($Snap.second ($Snap.second ($Snap.first s@$)))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)
  (and
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)
    (= ($Snap.second ($Snap.second ($Snap.first s@$))) $Snap.unit))))
(assert (or
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))))
(assert (= result@5@00 (joined_unfolding@23@00 s@$ xs@4@00)))
(pop) ; 1
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
; ---------- FUNCTION get----------
(declare-fun xs@6@00 () $Ref)
(declare-fun index@7@00 () Int)
(declare-fun result@8@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
; [eval] xs != null
(assert (not (= xs@6@00 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] 0 <= index
(assert (<= 0 index@7@00))
(assert (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] index < length(xs)
; [eval] length(xs)
(push) ; 2
; [eval] xs != null
(assert (length%precondition ($Snap.combine ($Snap.first s@$) $Snap.unit) xs@6@00))
(pop) ; 2
; Joined path conditions
(assert (length%precondition ($Snap.combine ($Snap.first s@$) $Snap.unit) xs@6@00))
(assert (< index@7@00 (length ($Snap.combine ($Snap.first s@$) $Snap.unit) xs@6@00)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (xs@6@00 $Ref) (index@7@00 Int)) (!
  (= (get%limited s@$ xs@6@00 index@7@00) (get s@$ xs@6@00 index@7@00))
  :pattern ((get s@$ xs@6@00 index@7@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (xs@6@00 $Ref) (index@7@00 Int)) (!
  (get%stateless xs@6@00 index@7@00)
  :pattern ((get%limited s@$ xs@6@00 index@7@00))
  :qid |quant-u-7|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
(assert (not (= xs@6@00 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
(assert (<= 0 index@7@00))
(assert (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit))
(assert (length%precondition ($Snap.combine ($Snap.first s@$) $Snap.unit) xs@6@00))
(assert (< index@7@00 (length ($Snap.combine ($Snap.first s@$) $Snap.unit) xs@6@00)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(list(xs), write) in (index == 0 ? xs.val : get(xs.next, index - 1)))
(set-option :timeout 0)
(push) ; 2
(assert (list%trigger ($Snap.first s@$) xs@6@00))
(assert (=
  ($Snap.first s@$)
  ($Snap.combine
    ($Snap.first ($Snap.first s@$))
    ($Snap.second ($Snap.first s@$)))))
(assert (=
  ($Snap.second ($Snap.first s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first s@$)))
    ($Snap.second ($Snap.second ($Snap.first s@$))))))
; [eval] xs.next != null
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | First:(First:(s@$)) != Null | live]
; [else-branch: 5 | First:(First:(s@$)) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 5 | First:(First:(s@$)) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))))
(assert (= ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))) $Snap.unit))
; [eval] xs.next != null
; [eval] (index == 0 ? xs.val : get(xs.next, index - 1))
; [eval] index == 0
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= index@7@00 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= index@7@00 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | index@7@00 == 0 | live]
; [else-branch: 6 | index@7@00 != 0 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 6 | index@7@00 == 0]
(assert (= index@7@00 0))
(pop) ; 5
(push) ; 5
; [else-branch: 6 | index@7@00 != 0]
(assert (not (= index@7@00 0)))
; [eval] get(xs.next, index - 1)
; [eval] index - 1
(push) ; 6
; [eval] xs != null
; [eval] 0 <= index
(push) ; 7
(assert (not (<= 0 (- index@7@00 1))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 (- index@7@00 1)))
; [eval] index < length(xs)
; [eval] length(xs)
(push) ; 7
; [eval] xs != null
(assert (length%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))))
(pop) ; 7
; Joined path conditions
(assert (length%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))))
(push) ; 7
(assert (not (<
  (- index@7@00 1)
  (length ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
    $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<
  (- index@7@00 1)
  (length ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
    $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))))))
(assert (get%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) (-
  index@7@00
  1)))
(pop) ; 6
; Joined path conditions
(assert (and
  (<= 0 (- index@7@00 1))
  (length%precondition ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
    $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))))
  (<
    (- index@7@00 1)
    (length ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))))
  (get%precondition ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) (-
    index@7@00
    1))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= index@7@00 0))
  (and
    (not (= index@7@00 0))
    (<= 0 (- index@7@00 1))
    (length%precondition ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))))
    (<
      (- index@7@00 1)
      (length ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
        $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))))
    (get%precondition ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) (-
      index@7@00
      1)))))
(assert (or (not (= index@7@00 0)) (= index@7@00 0)))
(pop) ; 3
(push) ; 3
; [else-branch: 5 | First:(First:(s@$)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.first s@$))) $Snap.unit))
; [eval] (index == 0 ? xs.val : get(xs.next, index - 1))
; [eval] index == 0
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= index@7@00 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= index@7@00 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | index@7@00 == 0 | live]
; [else-branch: 7 | index@7@00 != 0 | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 7 | index@7@00 == 0]
(assert (= index@7@00 0))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (= index@7@00 0))
(pop) ; 3
(pop) ; 2
(declare-fun joined_unfolding@24@00 ($Snap $Ref Int) Int)
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
  (=
    (joined_unfolding@24@00 s@$ xs@6@00 index@7@00)
    (ite
      (= index@7@00 0)
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$))))
      (get ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) (-
        index@7@00
        1))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)
  (=
    (joined_unfolding@24@00 s@$ xs@6@00 index@7@00)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$)))))))
; Joined path conditions
(assert (and
  (list%trigger ($Snap.first s@$) xs@6@00)
  (=
    ($Snap.first s@$)
    ($Snap.combine
      ($Snap.first ($Snap.first s@$))
      ($Snap.second ($Snap.first s@$))))
  (=
    ($Snap.second ($Snap.first s@$))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first s@$)))
      ($Snap.second ($Snap.second ($Snap.first s@$)))))))
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
  (and
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.first s@$)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))
    (= ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))) $Snap.unit)
    (=>
      (not (= index@7@00 0))
      (and
        (not (= index@7@00 0))
        (<= 0 (- index@7@00 1))
        (length%precondition ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
          $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))))
        (<
          (- index@7@00 1)
          (length ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
            $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))))
        (get%precondition ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) (-
          index@7@00
          1))))
    (or (not (= index@7@00 0)) (= index@7@00 0)))))
; Joined path conditions
(assert (and
  (list%trigger ($Snap.first s@$) xs@6@00)
  (=
    ($Snap.first s@$)
    ($Snap.combine
      ($Snap.first ($Snap.first s@$))
      ($Snap.second ($Snap.first s@$))))
  (=
    ($Snap.second ($Snap.first s@$))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first s@$)))
      ($Snap.second ($Snap.second ($Snap.first s@$)))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)
  (and
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)
    (= ($Snap.second ($Snap.second ($Snap.first s@$))) $Snap.unit)
    (= index@7@00 0))))
(assert (or
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))))
(assert (= result@8@00 (joined_unfolding@24@00 s@$ xs@6@00 index@7@00)))
(pop) ; 1
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
; ---------- FUNCTION elems----------
(declare-fun xs@9@00 () $Ref)
(declare-fun result@10@00 () Seq<Int>)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.second s@$) $Snap.unit))
; [eval] xs != null
(assert (not (= xs@9@00 $Ref.null)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (xs@9@00 $Ref)) (!
  (= (elems%limited s@$ xs@9@00) (elems s@$ xs@9@00))
  :pattern ((elems s@$ xs@9@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (xs@9@00 $Ref)) (!
  (elems%stateless xs@9@00)
  :pattern ((elems%limited s@$ xs@9@00))
  :qid |quant-u-9|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.second s@$) $Snap.unit))
(assert (not (= xs@9@00 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(list(xs), write) in Seq(xs.val) ++ (xs.next == null ? Seq[Int]() : elems(xs.next)))
(set-option :timeout 0)
(push) ; 2
(assert (list%trigger ($Snap.first s@$) xs@9@00))
(assert (=
  ($Snap.first s@$)
  ($Snap.combine
    ($Snap.first ($Snap.first s@$))
    ($Snap.second ($Snap.first s@$)))))
(assert (=
  ($Snap.second ($Snap.first s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first s@$)))
    ($Snap.second ($Snap.second ($Snap.first s@$))))))
; [eval] xs.next != null
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | First:(First:(s@$)) != Null | live]
; [else-branch: 8 | First:(First:(s@$)) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 8 | First:(First:(s@$)) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))))
(assert (= ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))) $Snap.unit))
; [eval] xs.next != null
; [eval] Seq(xs.val) ++ (xs.next == null ? Seq[Int]() : elems(xs.next))
; [eval] Seq(xs.val)
(assert (=
  (Seq_length
    (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$))))))
  1))
; [eval] (xs.next == null ? Seq[Int]() : elems(xs.next))
; [eval] xs.next == null
(push) ; 4
; [then-branch: 9 | First:(First:(s@$)) == Null | dead]
; [else-branch: 9 | First:(First:(s@$)) != Null | live]
(push) ; 5
; [else-branch: 9 | First:(First:(s@$)) != Null]
; [eval] elems(xs.next)
(push) ; 6
; [eval] xs != null
(assert (elems%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))))
(pop) ; 6
; Joined path conditions
(assert (elems%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
  (elems%precondition ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
    $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))))))
(pop) ; 3
(push) ; 3
; [else-branch: 8 | First:(First:(s@$)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.first s@$))) $Snap.unit))
; [eval] Seq(xs.val) ++ (xs.next == null ? Seq[Int]() : elems(xs.next))
; [eval] Seq(xs.val)
(assert (=
  (Seq_length
    (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$))))))
  1))
; [eval] (xs.next == null ? Seq[Int]() : elems(xs.next))
; [eval] xs.next == null
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | First:(First:(s@$)) == Null | live]
; [else-branch: 10 | First:(First:(s@$)) != Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 10 | First:(First:(s@$)) == Null]
; [eval] Seq[Int]()
(pop) ; 5
(pop) ; 4
; Joined path conditions
(pop) ; 3
(pop) ; 2
(declare-fun joined_unfolding@25@00 ($Snap $Ref) Seq<Int>)
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
  (=
    (joined_unfolding@25@00 s@$ xs@9@00)
    (Seq_append
      (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$)))))
      (elems ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
        $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)
  (=
    (joined_unfolding@25@00 s@$ xs@9@00)
    (Seq_append
      (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$)))))
      (as Seq_empty  Seq<Int>)))))
; Joined path conditions
(assert (and
  (list%trigger ($Snap.first s@$) xs@9@00)
  (=
    ($Snap.first s@$)
    ($Snap.combine
      ($Snap.first ($Snap.first s@$))
      ($Snap.second ($Snap.first s@$))))
  (=
    ($Snap.second ($Snap.first s@$))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first s@$)))
      ($Snap.second ($Snap.second ($Snap.first s@$)))))))
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
  (and
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.first s@$)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))
    (= ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))) $Snap.unit)
    (=
      (Seq_length
        (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$))))))
      1)
    (=>
      (not
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
      (elems%precondition ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
        $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))))))))
; Joined path conditions
(assert (and
  (list%trigger ($Snap.first s@$) xs@9@00)
  (=
    ($Snap.first s@$)
    ($Snap.combine
      ($Snap.first ($Snap.first s@$))
      ($Snap.second ($Snap.first s@$))))
  (=
    ($Snap.second ($Snap.first s@$))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first s@$)))
      ($Snap.second ($Snap.second ($Snap.first s@$)))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)
  (and
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)
    (= ($Snap.second ($Snap.second ($Snap.first s@$))) $Snap.unit)
    (=
      (Seq_length
        (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$))))))
      1))))
(assert (or
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))))
(assert (= result@10@00 (joined_unfolding@25@00 s@$ xs@9@00)))
(pop) ; 1
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
; ---------- FUNCTION ascending----------
(declare-fun xs@11@00 () $Ref)
(declare-fun result@12@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.second s@$) $Snap.unit))
; [eval] xs != null
(assert (not (= xs@11@00 $Ref.null)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (xs@11@00 $Ref)) (!
  (= (ascending%limited s@$ xs@11@00) (ascending s@$ xs@11@00))
  :pattern ((ascending s@$ xs@11@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (xs@11@00 $Ref)) (!
  (ascending%stateless xs@11@00)
  :pattern ((ascending%limited s@$ xs@11@00))
  :qid |quant-u-11|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.second s@$) $Snap.unit))
(assert (not (= xs@11@00 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(list(xs), write) in xs.next == null || xs.val <= head(xs.next) && ascending(xs.next))
(set-option :timeout 0)
(push) ; 2
(assert (list%trigger ($Snap.first s@$) xs@11@00))
(assert (=
  ($Snap.first s@$)
  ($Snap.combine
    ($Snap.first ($Snap.first s@$))
    ($Snap.second ($Snap.first s@$)))))
(assert (=
  ($Snap.second ($Snap.first s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first s@$)))
    ($Snap.second ($Snap.second ($Snap.first s@$))))))
; [eval] xs.next != null
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | First:(First:(s@$)) != Null | live]
; [else-branch: 11 | First:(First:(s@$)) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 11 | First:(First:(s@$)) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))))
(assert (= ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))) $Snap.unit))
; [eval] xs.next != null
; [eval] xs.next == null || xs.val <= head(xs.next) && ascending(xs.next)
; [eval] xs.next == null
(push) ; 4
; [then-branch: 12 | First:(First:(s@$)) == Null | live]
; [else-branch: 12 | First:(First:(s@$)) != Null | live]
(push) ; 5
; [then-branch: 12 | First:(First:(s@$)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
(pop) ; 5
(push) ; 5
; [else-branch: 12 | First:(First:(s@$)) != Null]
; [eval] xs.val <= head(xs.next) && ascending(xs.next)
; [eval] xs.val <= head(xs.next)
; [eval] head(xs.next)
(push) ; 6
; [eval] xs != null
(assert (head%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))))
(pop) ; 6
; Joined path conditions
(assert (head%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))))
(push) ; 6
; [then-branch: 13 | !(First:(Second:(First:(s@$))) <= head((First:(Second:(Second:(First:(s@$)))), _), First:(First:(s@$)))) | live]
; [else-branch: 13 | First:(Second:(First:(s@$))) <= head((First:(Second:(Second:(First:(s@$)))), _), First:(First:(s@$))) | live]
(push) ; 7
; [then-branch: 13 | !(First:(Second:(First:(s@$))) <= head((First:(Second:(Second:(First:(s@$)))), _), First:(First:(s@$))))]
(assert (not
  (<=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$))))
    (head ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))))))
(pop) ; 7
(push) ; 7
; [else-branch: 13 | First:(Second:(First:(s@$))) <= head((First:(Second:(Second:(First:(s@$)))), _), First:(First:(s@$)))]
(assert (<=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$))))
  (head ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
    $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))))))
; [eval] ascending(xs.next)
(push) ; 8
; [eval] xs != null
(assert (ascending%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))))
(pop) ; 8
; Joined path conditions
(assert (ascending%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (<=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$))))
    (head ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))))
  (and
    (<=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$))))
      (head ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
        $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))))
    (ascending%precondition ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))))))
(assert (or
  (<=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$))))
    (head ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))))
  (not
    (<=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$))))
      (head ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
        $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
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
      (and
        (<=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$))))
          (head ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
            $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))))
        (ascending%precondition ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
          $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))))))
    (or
      (<=
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$))))
        (head ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
          $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))))
      (not
        (<=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$))))
          (head ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
            $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))))))))))
(assert (or
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)))
(pop) ; 3
(push) ; 3
; [else-branch: 11 | First:(First:(s@$)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.first s@$))) $Snap.unit))
; [eval] xs.next == null || xs.val <= head(xs.next) && ascending(xs.next)
; [eval] xs.next == null
(push) ; 4
; [then-branch: 14 | First:(First:(s@$)) == Null | live]
; [else-branch: 14 | First:(First:(s@$)) != Null | live]
(push) ; 5
; [then-branch: 14 | First:(First:(s@$)) == Null]
(pop) ; 5
(push) ; 5
; [else-branch: 14 | First:(First:(s@$)) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)))
; [eval] xs.val <= head(xs.next) && ascending(xs.next)
; [eval] xs.val <= head(xs.next)
; [eval] head(xs.next)
(push) ; 6
(check-sat)
; unsat
(pop) ; 6
(pop) ; 5
(pop) ; 4
; Joined path conditions
(pop) ; 3
(pop) ; 2
(declare-fun joined_unfolding@26@00 ($Snap $Ref) Bool)
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
  (=
    (joined_unfolding@26@00 s@$ xs@11@00)
    (or
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)
      (and
        (<=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$))))
          (head ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
            $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))))
        (ascending ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
          $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)
  (=
    (joined_unfolding@26@00 s@$ xs@11@00)
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))))
; Joined path conditions
(assert (and
  (list%trigger ($Snap.first s@$) xs@11@00)
  (=
    ($Snap.first s@$)
    ($Snap.combine
      ($Snap.first ($Snap.first s@$))
      ($Snap.second ($Snap.first s@$))))
  (=
    ($Snap.second ($Snap.first s@$))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first s@$)))
      ($Snap.second ($Snap.second ($Snap.first s@$)))))))
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
  (and
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.first s@$)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))
    (= ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))) $Snap.unit)
    (=>
      (not
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
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
          (and
            (<=
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$))))
              (head ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
                $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))))
            (ascending%precondition ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
              $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))))))
        (or
          (<=
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$))))
            (head ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
              $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))))
          (not
            (<=
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$))))
              (head ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
                $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))))))))
    (or
      (not
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)))))
; Joined path conditions
(assert (and
  (list%trigger ($Snap.first s@$) xs@11@00)
  (=
    ($Snap.first s@$)
    ($Snap.combine
      ($Snap.first ($Snap.first s@$))
      ($Snap.second ($Snap.first s@$))))
  (=
    ($Snap.second ($Snap.first s@$))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first s@$)))
      ($Snap.second ($Snap.second ($Snap.first s@$)))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)
  (and
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)
    (= ($Snap.second ($Snap.second ($Snap.first s@$))) $Snap.unit))))
(assert (or
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))))
(assert (= result@12@00 (joined_unfolding@26@00 s@$ xs@11@00)))
(pop) ; 1
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
; ---------- FUNCTION contains----------
(declare-fun xs@13@00 () $Ref)
(declare-fun x@14@00 () Int)
(declare-fun result@15@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.second s@$) $Snap.unit))
; [eval] xs != null
(assert (not (= xs@13@00 $Ref.null)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (xs@13@00 $Ref) (x@14@00 Int)) (!
  (= (contains%limited s@$ xs@13@00 x@14@00) (contains s@$ xs@13@00 x@14@00))
  :pattern ((contains s@$ xs@13@00 x@14@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (xs@13@00 $Ref) (x@14@00 Int)) (!
  (contains%stateless xs@13@00 x@14@00)
  :pattern ((contains%limited s@$ xs@13@00 x@14@00))
  :qid |quant-u-13|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.second s@$) $Snap.unit))
(assert (not (= xs@13@00 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(list(xs), write) in x == xs.val || xs.next != null && contains(xs.next, x))
(set-option :timeout 0)
(push) ; 2
(assert (list%trigger ($Snap.first s@$) xs@13@00))
(assert (=
  ($Snap.first s@$)
  ($Snap.combine
    ($Snap.first ($Snap.first s@$))
    ($Snap.second ($Snap.first s@$)))))
(assert (=
  ($Snap.second ($Snap.first s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first s@$)))
    ($Snap.second ($Snap.second ($Snap.first s@$))))))
; [eval] xs.next != null
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 15 | First:(First:(s@$)) != Null | live]
; [else-branch: 15 | First:(First:(s@$)) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 15 | First:(First:(s@$)) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))))
(assert (= ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))) $Snap.unit))
; [eval] xs.next != null
; [eval] x == xs.val || xs.next != null && contains(xs.next, x)
; [eval] x == xs.val
(push) ; 4
; [then-branch: 16 | x@14@00 == First:(Second:(First:(s@$))) | live]
; [else-branch: 16 | x@14@00 != First:(Second:(First:(s@$))) | live]
(push) ; 5
; [then-branch: 16 | x@14@00 == First:(Second:(First:(s@$)))]
(assert (=
  x@14@00
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$))))))
(pop) ; 5
(push) ; 5
; [else-branch: 16 | x@14@00 != First:(Second:(First:(s@$)))]
(assert (not
  (=
    x@14@00
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$)))))))
; [eval] xs.next != null && contains(xs.next, x)
; [eval] xs.next != null
(push) ; 6
; [then-branch: 17 | First:(First:(s@$)) == Null | live]
; [else-branch: 17 | First:(First:(s@$)) != Null | live]
(push) ; 7
; [then-branch: 17 | First:(First:(s@$)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
(pop) ; 7
(push) ; 7
; [else-branch: 17 | First:(First:(s@$)) != Null]
; [eval] contains(xs.next, x)
(push) ; 8
; [eval] xs != null
(assert (contains%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) x@14@00))
(pop) ; 8
; Joined path conditions
(assert (contains%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) x@14@00))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
  (contains%precondition ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
    $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) x@14@00)))
(assert (or
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (not
    (=
      x@14@00
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$))))))
  (and
    (not
      (=
        x@14@00
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$))))))
    (=>
      (not
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
      (contains%precondition ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
        $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) x@14@00))
    (or
      (not
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)))))
(assert (or
  (not
    (=
      x@14@00
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$))))))
  (=
    x@14@00
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$)))))))
(pop) ; 3
(push) ; 3
; [else-branch: 15 | First:(First:(s@$)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.first s@$))) $Snap.unit))
; [eval] x == xs.val || xs.next != null && contains(xs.next, x)
; [eval] x == xs.val
(push) ; 4
; [then-branch: 18 | x@14@00 == First:(Second:(First:(s@$))) | live]
; [else-branch: 18 | x@14@00 != First:(Second:(First:(s@$))) | live]
(push) ; 5
; [then-branch: 18 | x@14@00 == First:(Second:(First:(s@$)))]
(assert (=
  x@14@00
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$))))))
(pop) ; 5
(push) ; 5
; [else-branch: 18 | x@14@00 != First:(Second:(First:(s@$)))]
(assert (not
  (=
    x@14@00
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$)))))))
; [eval] xs.next != null && contains(xs.next, x)
; [eval] xs.next != null
(push) ; 6
; [then-branch: 19 | First:(First:(s@$)) == Null | live]
; [else-branch: 19 | First:(First:(s@$)) != Null | live]
(push) ; 7
; [then-branch: 19 | First:(First:(s@$)) == Null]
(pop) ; 7
(push) ; 7
; [else-branch: 19 | First:(First:(s@$)) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)))
; [eval] contains(xs.next, x)
(push) ; 8
(check-sat)
; unsat
(pop) ; 8
(pop) ; 7
(pop) ; 6
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (=
      x@14@00
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$))))))
  (=
    x@14@00
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$)))))))
(pop) ; 3
(pop) ; 2
(declare-fun joined_unfolding@27@00 ($Snap $Ref Int) Bool)
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
  (=
    (joined_unfolding@27@00 s@$ xs@13@00 x@14@00)
    (or
      (=
        x@14@00
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$)))))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))
            $Ref.null))
        (contains ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
          $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) x@14@00))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)
  (=
    (joined_unfolding@27@00 s@$ xs@13@00 x@14@00)
    (or
      (=
        x@14@00
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$)))))
      (not
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))))))
; Joined path conditions
(assert (and
  (list%trigger ($Snap.first s@$) xs@13@00)
  (=
    ($Snap.first s@$)
    ($Snap.combine
      ($Snap.first ($Snap.first s@$))
      ($Snap.second ($Snap.first s@$))))
  (=
    ($Snap.second ($Snap.first s@$))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first s@$)))
      ($Snap.second ($Snap.second ($Snap.first s@$)))))))
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
  (and
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.first s@$)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))
    (= ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))) $Snap.unit)
    (=>
      (not
        (=
          x@14@00
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$))))))
      (and
        (not
          (=
            x@14@00
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$))))))
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))
              $Ref.null))
          (contains%precondition ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
            $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) x@14@00))
        (or
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))
              $Ref.null))
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))
            $Ref.null))))
    (or
      (not
        (=
          x@14@00
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$))))))
      (=
        x@14@00
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$)))))))))
; Joined path conditions
(assert (and
  (list%trigger ($Snap.first s@$) xs@13@00)
  (=
    ($Snap.first s@$)
    ($Snap.combine
      ($Snap.first ($Snap.first s@$))
      ($Snap.second ($Snap.first s@$))))
  (=
    ($Snap.second ($Snap.first s@$))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first s@$)))
      ($Snap.second ($Snap.second ($Snap.first s@$)))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)
  (and
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)
    (= ($Snap.second ($Snap.second ($Snap.first s@$))) $Snap.unit)
    (or
      (not
        (=
          x@14@00
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$))))))
      (=
        x@14@00
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$)))))))))
(assert (or
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))))
(assert (= result@15@00 (joined_unfolding@27@00 s@$ xs@13@00 x@14@00)))
(pop) ; 1
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
; ---------- FUNCTION sum----------
(declare-fun xs@16@00 () $Ref)
(declare-fun result@17@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.second s@$) $Snap.unit))
; [eval] xs != null
(assert (not (= xs@16@00 $Ref.null)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (xs@16@00 $Ref)) (!
  (= (sum%limited s@$ xs@16@00) (sum s@$ xs@16@00))
  :pattern ((sum s@$ xs@16@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (xs@16@00 $Ref)) (!
  (sum%stateless xs@16@00)
  :pattern ((sum%limited s@$ xs@16@00))
  :qid |quant-u-15|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.second s@$) $Snap.unit))
(assert (not (= xs@16@00 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(list(xs), write) in xs.val + (xs.next == null ? 0 : sum(xs.next)))
(set-option :timeout 0)
(push) ; 2
(assert (list%trigger ($Snap.first s@$) xs@16@00))
(assert (=
  ($Snap.first s@$)
  ($Snap.combine
    ($Snap.first ($Snap.first s@$))
    ($Snap.second ($Snap.first s@$)))))
(assert (=
  ($Snap.second ($Snap.first s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first s@$)))
    ($Snap.second ($Snap.second ($Snap.first s@$))))))
; [eval] xs.next != null
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 20 | First:(First:(s@$)) != Null | live]
; [else-branch: 20 | First:(First:(s@$)) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 20 | First:(First:(s@$)) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))))
(assert (= ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))) $Snap.unit))
; [eval] xs.next != null
; [eval] xs.val + (xs.next == null ? 0 : sum(xs.next))
; [eval] (xs.next == null ? 0 : sum(xs.next))
; [eval] xs.next == null
(push) ; 4
; [then-branch: 21 | First:(First:(s@$)) == Null | dead]
; [else-branch: 21 | First:(First:(s@$)) != Null | live]
(push) ; 5
; [else-branch: 21 | First:(First:(s@$)) != Null]
; [eval] sum(xs.next)
(push) ; 6
; [eval] xs != null
(assert (sum%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))))
(pop) ; 6
; Joined path conditions
(assert (sum%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
  (sum%precondition ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
    $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))))))
(pop) ; 3
(push) ; 3
; [else-branch: 20 | First:(First:(s@$)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.first s@$))) $Snap.unit))
; [eval] xs.val + (xs.next == null ? 0 : sum(xs.next))
; [eval] (xs.next == null ? 0 : sum(xs.next))
; [eval] xs.next == null
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 22 | First:(First:(s@$)) == Null | live]
; [else-branch: 22 | First:(First:(s@$)) != Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 22 | First:(First:(s@$)) == Null]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(pop) ; 3
(pop) ; 2
(declare-fun joined_unfolding@28@00 ($Snap $Ref) Int)
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
  (=
    (joined_unfolding@28@00 s@$ xs@16@00)
    (+
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$))))
      (sum ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
        $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)
  (=
    (joined_unfolding@28@00 s@$ xs@16@00)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$)))))))
; Joined path conditions
(assert (and
  (list%trigger ($Snap.first s@$) xs@16@00)
  (=
    ($Snap.first s@$)
    ($Snap.combine
      ($Snap.first ($Snap.first s@$))
      ($Snap.second ($Snap.first s@$))))
  (=
    ($Snap.second ($Snap.first s@$))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first s@$)))
      ($Snap.second ($Snap.second ($Snap.first s@$)))))))
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
  (and
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.first s@$)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))
    (= ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))) $Snap.unit)
    (=>
      (not
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
      (sum%precondition ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
        $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))))))))
; Joined path conditions
(assert (and
  (list%trigger ($Snap.first s@$) xs@16@00)
  (=
    ($Snap.first s@$)
    ($Snap.combine
      ($Snap.first ($Snap.first s@$))
      ($Snap.second ($Snap.first s@$))))
  (=
    ($Snap.second ($Snap.first s@$))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first s@$)))
      ($Snap.second ($Snap.second ($Snap.first s@$)))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)
  (and
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)
    (= ($Snap.second ($Snap.second ($Snap.first s@$))) $Snap.unit))))
(assert (or
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))))
(assert (= result@17@00 (joined_unfolding@28@00 s@$ xs@16@00)))
(pop) ; 1
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
; ---------- FUNCTION last----------
(declare-fun xs@18@00 () $Ref)
(declare-fun result@19@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.second s@$) $Snap.unit))
; [eval] xs != null
(assert (not (= xs@18@00 $Ref.null)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (xs@18@00 $Ref)) (!
  (= (last%limited s@$ xs@18@00) (last s@$ xs@18@00))
  :pattern ((last s@$ xs@18@00))
  :qid |quant-u-16|)))
(assert (forall ((s@$ $Snap) (xs@18@00 $Ref)) (!
  (last%stateless xs@18@00)
  :pattern ((last%limited s@$ xs@18@00))
  :qid |quant-u-17|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.second s@$) $Snap.unit))
(assert (not (= xs@18@00 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(list(xs), write) in (xs.next == null ? xs.val : last(xs.next)))
(set-option :timeout 0)
(push) ; 2
(assert (list%trigger ($Snap.first s@$) xs@18@00))
(assert (=
  ($Snap.first s@$)
  ($Snap.combine
    ($Snap.first ($Snap.first s@$))
    ($Snap.second ($Snap.first s@$)))))
(assert (=
  ($Snap.second ($Snap.first s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first s@$)))
    ($Snap.second ($Snap.second ($Snap.first s@$))))))
; [eval] xs.next != null
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 23 | First:(First:(s@$)) != Null | live]
; [else-branch: 23 | First:(First:(s@$)) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 23 | First:(First:(s@$)) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))))
(assert (= ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))) $Snap.unit))
; [eval] xs.next != null
; [eval] (xs.next == null ? xs.val : last(xs.next))
; [eval] xs.next == null
(push) ; 4
; [then-branch: 24 | First:(First:(s@$)) == Null | dead]
; [else-branch: 24 | First:(First:(s@$)) != Null | live]
(push) ; 5
; [else-branch: 24 | First:(First:(s@$)) != Null]
; [eval] last(xs.next)
(push) ; 6
; [eval] xs != null
(assert (last%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))))
(pop) ; 6
; Joined path conditions
(assert (last%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
  (last%precondition ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
    $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))))))
(pop) ; 3
(push) ; 3
; [else-branch: 23 | First:(First:(s@$)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.first s@$))) $Snap.unit))
; [eval] (xs.next == null ? xs.val : last(xs.next))
; [eval] xs.next == null
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 25 | First:(First:(s@$)) == Null | live]
; [else-branch: 25 | First:(First:(s@$)) != Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 25 | First:(First:(s@$)) == Null]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(pop) ; 3
(pop) ; 2
(declare-fun joined_unfolding@29@00 ($Snap $Ref) Int)
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
  (=
    (joined_unfolding@29@00 s@$ xs@18@00)
    (last ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)
  (=
    (joined_unfolding@29@00 s@$ xs@18@00)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$)))))))
; Joined path conditions
(assert (and
  (list%trigger ($Snap.first s@$) xs@18@00)
  (=
    ($Snap.first s@$)
    ($Snap.combine
      ($Snap.first ($Snap.first s@$))
      ($Snap.second ($Snap.first s@$))))
  (=
    ($Snap.second ($Snap.first s@$))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first s@$)))
      ($Snap.second ($Snap.second ($Snap.first s@$)))))))
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
  (and
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.first s@$)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))
    (= ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))) $Snap.unit)
    (=>
      (not
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
      (last%precondition ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
        $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))))))))
; Joined path conditions
(assert (and
  (list%trigger ($Snap.first s@$) xs@18@00)
  (=
    ($Snap.first s@$)
    ($Snap.combine
      ($Snap.first ($Snap.first s@$))
      ($Snap.second ($Snap.first s@$))))
  (=
    ($Snap.second ($Snap.first s@$))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first s@$)))
      ($Snap.second ($Snap.second ($Snap.first s@$)))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)
  (and
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)
    (= ($Snap.second ($Snap.second ($Snap.first s@$))) $Snap.unit))))
(assert (or
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))))
(assert (= result@19@00 (joined_unfolding@29@00 s@$ xs@18@00)))
(pop) ; 1
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
; ---------- list ----------
(declare-const xs@30@00 $Ref)
(push) ; 1
(declare-const $t@31@00 $Snap)
(assert (= $t@31@00 ($Snap.combine ($Snap.first $t@31@00) ($Snap.second $t@31@00))))
(assert (not (= xs@30@00 $Ref.null)))
(assert (=
  ($Snap.second $t@31@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@31@00))
    ($Snap.second ($Snap.second $t@31@00)))))
; [eval] xs.next != null
(push) ; 2
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@00)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@00)) $Ref.null))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 26 | First:($t@31@00) != Null | live]
; [else-branch: 26 | First:($t@31@00) == Null | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 26 | First:($t@31@00) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@00)) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second $t@31@00))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@31@00)))
    ($Snap.second ($Snap.second ($Snap.second $t@31@00))))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@31@00))) $Snap.unit))
; [eval] xs.next != null
(pop) ; 2
(push) ; 2
; [else-branch: 26 | First:($t@31@00) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@00)) $Ref.null))
(assert (= ($Snap.second ($Snap.second $t@31@00)) $Snap.unit))
(pop) ; 2
(pop) ; 1
