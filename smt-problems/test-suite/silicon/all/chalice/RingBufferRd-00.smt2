(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:42:11
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/chalice/RingBufferRd.vpr
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
(declare-fun Contents ($Snap $Ref) Seq<Int>)
(declare-fun Contents%limited ($Snap $Ref) Seq<Int>)
(declare-fun Contents%stateless ($Ref) Bool)
(declare-fun Contents%precondition ($Snap $Ref) Bool)
(declare-fun HeadF ($Snap $Ref) Int)
(declare-fun HeadF%limited ($Snap $Ref) Int)
(declare-fun HeadF%stateless ($Ref) Bool)
(declare-fun HeadF%precondition ($Snap $Ref) Bool)
(declare-fun Capacity ($Snap $Ref) Int)
(declare-fun Capacity%limited ($Snap $Ref) Int)
(declare-fun Capacity%stateless ($Ref) Bool)
(declare-fun Capacity%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun Valid%trigger ($Snap $Ref) Bool)
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
(declare-fun $k@6@00 () $Perm)
(declare-fun $k@7@00 () $Perm)
(declare-fun $k@8@00 () $Perm)
(declare-fun $k@9@00 () $Perm)
(declare-fun $k@10@00 () $Perm)
(declare-fun $k@12@00 () $Perm)
(declare-fun $k@13@00 () $Perm)
(declare-fun $k@14@00 () $Perm)
(declare-fun $k@15@00 () $Perm)
(declare-fun $k@16@00 () $Perm)
(declare-fun $k@17@00 () $Perm)
(declare-fun $k@18@00 () $Perm)
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (= (Contents%limited s@$ this@0@00) (Contents s@$ this@0@00))
  :pattern ((Contents s@$ this@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (Contents%stateless this@0@00)
  :pattern ((Contents%limited s@$ this@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (and
    ($Perm.isReadVar $k@6@00)
    ($Perm.isReadVar $k@7@00)
    ($Perm.isReadVar $k@8@00)
    (=>
      (Contents%precondition s@$ this@0@00)
      (=
        (Contents s@$ this@0@00)
        (ite
          (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0)
          (as Seq_empty  Seq<Int>)
          (ite
            (<=
              (+
                ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
                ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$)))))
              (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))))
            (Seq_drop
              (Seq_take
                ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))
                (+
                  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
                  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))))
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))
            (Seq_append
              (Seq_drop
                ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))
                ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))
              (Seq_take
                ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))
                (-
                  (+
                    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
                    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$)))))
                  (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$)))))))))))
  :pattern ((Contents s@$ this@0@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  true
  :pattern ((Contents s@$ this@0@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref)) (!
  (= (HeadF%limited s@$ this@2@00) (HeadF s@$ this@2@00))
  :pattern ((HeadF s@$ this@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref)) (!
  (HeadF%stateless this@2@00)
  :pattern ((HeadF%limited s@$ this@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref)) (!
  (let ((result@3@00 (HeadF%limited s@$ this@2@00))) (and
    ($Perm.isReadVar $k@9@00)
    ($Perm.isReadVar $k@10@00)
    ($Perm.isReadVar $k@12@00)
    (=>
      (HeadF%precondition s@$ this@2@00)
      (= result@3@00 (Seq_index (Contents ($Snap.first s@$) this@2@00) 0)))))
  :pattern ((HeadF%limited s@$ this@2@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref)) (!
  (let ((result@3@00 (HeadF%limited s@$ this@2@00))) (=>
    (HeadF%precondition s@$ this@2@00)
    (Contents%precondition ($Snap.first s@$) this@2@00)))
  :pattern ((HeadF%limited s@$ this@2@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref)) (!
  (and
    ($Perm.isReadVar $k@9@00)
    ($Perm.isReadVar $k@10@00)
    ($Perm.isReadVar $k@13@00)
    ($Perm.isReadVar $k@14@00)
    ($Perm.isReadVar $k@15@00)
    (=>
      (HeadF%precondition s@$ this@2@00)
      (=
        (HeadF s@$ this@2@00)
        (Seq_index
          ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first s@$)))
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$))))))))
  :pattern ((HeadF s@$ this@2@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref)) (!
  true
  :pattern ((HeadF s@$ this@2@00))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap) (this@4@00 $Ref)) (!
  (= (Capacity%limited s@$ this@4@00) (Capacity s@$ this@4@00))
  :pattern ((Capacity s@$ this@4@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (this@4@00 $Ref)) (!
  (Capacity%stateless this@4@00)
  :pattern ((Capacity%limited s@$ this@4@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (this@4@00 $Ref)) (!
  (and
    ($Perm.isReadVar $k@16@00)
    ($Perm.isReadVar $k@17@00)
    ($Perm.isReadVar $k@18@00)
    (=>
      (Capacity%precondition s@$ this@4@00)
      (=
        (Capacity s@$ this@4@00)
        (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))))))
  :pattern ((Capacity s@$ this@4@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (this@4@00 $Ref)) (!
  true
  :pattern ((Capacity s@$ this@4@00))
  :qid |quant-u-13|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- Create ----------
(declare-const this@0@01 $Ref)
(declare-const n@1@01 Int)
(declare-const this@2@01 $Ref)
(declare-const n@3@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(assert (= ($Snap.first $t@4@01) $Snap.unit))
; [eval] 0 <= n
(assert (<= 0 n@3@01))
(assert (=
  ($Snap.second $t@4@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@4@01))
    ($Snap.second ($Snap.second $t@4@01)))))
(assert (not (= this@2@01 $Ref.null)))
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
(assert (=
  ($Snap.second $t@5@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@5@01))
    ($Snap.second ($Snap.second $t@5@01)))))
(assert (= ($Snap.first ($Snap.second $t@5@01)) $Snap.unit))
; [eval] Contents(this) == Seq[Int]()
; [eval] Contents(this)
(push) ; 3
(declare-const $k@6@01 $Perm)
(assert ($Perm.isReadVar $k@6@01))
(assert (< $k@6@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@6@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@6@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Contents%precondition ($Snap.first $t@5@01) this@2@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@6@01))
(assert (and
  (< $k@6@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@6@01))
  (Contents%precondition ($Snap.first $t@5@01) this@2@01)))
; [eval] Seq[Int]()
(assert (Seq_equal (Contents ($Snap.first $t@5@01) this@2@01) (as Seq_empty  Seq<Int>)))
(assert (= ($Snap.second ($Snap.second $t@5@01)) $Snap.unit))
; [eval] Capacity(this) == n
; [eval] Capacity(this)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@7@01 $Perm)
(assert ($Perm.isReadVar $k@7@01))
(assert (< $k@7@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@7@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@7@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Capacity%precondition ($Snap.first $t@5@01) this@2@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@7@01))
(assert (and
  (< $k@7@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@7@01))
  (Capacity%precondition ($Snap.first $t@5@01) this@2@01)))
(assert (= (Capacity ($Snap.first $t@5@01) this@2@01) n@3@01))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; var i: Int
(declare-const i@8@01 Int)
; [exec]
; i := n
; [exec]
; this.data := Seq[Int]()
; [eval] Seq[Int]()
(declare-const i@9@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@10@01 $Snap)
(assert (= $t@10@01 ($Snap.combine ($Snap.first $t@10@01) ($Snap.second $t@10@01))))
(assert (=
  ($Snap.second $t@10@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@10@01))
    ($Snap.second ($Snap.second $t@10@01)))))
(assert (= ($Snap.first ($Snap.second $t@10@01)) $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@9@01))
(assert (= ($Snap.second ($Snap.second $t@10@01)) $Snap.unit))
; [eval] |this.data| == n - i
; [eval] |this.data|
; [eval] n - i
(assert (=
  (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@10@01)))
  (- n@3@01 i@9@01)))
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; [eval] 0 <= i
; [eval] |this.data| == n - i
; [eval] |this.data|
; [eval] n - i
(push) ; 4
(assert (not (= (Seq_length (as Seq_empty  Seq<Int>)) 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (= (Seq_length (as Seq_empty  Seq<Int>)) 0))
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
(assert (= $t@10@01 ($Snap.combine ($Snap.first $t@10@01) ($Snap.second $t@10@01))))
(assert (=
  ($Snap.second $t@10@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@10@01))
    ($Snap.second ($Snap.second $t@10@01)))))
(assert (= ($Snap.first ($Snap.second $t@10@01)) $Snap.unit))
(assert (<= 0 i@9@01))
(assert (= ($Snap.second ($Snap.second $t@10@01)) $Snap.unit))
(assert (=
  (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@10@01)))
  (- n@3@01 i@9@01)))
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
; [eval] 0 < i
(pop) ; 5
(push) ; 5
; [eval] !(0 < i)
; [eval] 0 < i
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] 0 < i
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< 0 i@9@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< 0 i@9@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | 0 < i@9@01 | live]
; [else-branch: 0 | !(0 < i@9@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 0 | 0 < i@9@01]
(assert (< 0 i@9@01))
; [exec]
; this.data := this.data ++ Seq(0)
; [eval] this.data ++ Seq(0)
; [eval] Seq(0)
(assert (= (Seq_length (Seq_singleton 0)) 1))
(declare-const data@11@01 Seq<Int>)
(assert (=
  data@11@01
  (Seq_append
    ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@10@01))
    (Seq_singleton 0))))
; [exec]
; i := i - 1
; [eval] i - 1
(declare-const i@12@01 Int)
(assert (= i@12@01 (- i@9@01 1)))
; Loop head block: Re-establish invariant
; [eval] 0 <= i
(push) ; 6
(assert (not (<= 0 i@12@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 i@12@01))
; [eval] |this.data| == n - i
; [eval] |this.data|
; [eval] n - i
(push) ; 6
(assert (not (= (Seq_length data@11@01) (- n@3@01 i@12@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (= (Seq_length data@11@01) (- n@3@01 i@12@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | !(0 < i@9@01)]
(assert (not (< 0 i@9@01)))
(pop) ; 5
; [eval] !(0 < i)
; [eval] 0 < i
(push) ; 5
(set-option :timeout 10)
(assert (not (< 0 i@9@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< 0 i@9@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | !(0 < i@9@01) | live]
; [else-branch: 1 | 0 < i@9@01 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 1 | !(0 < i@9@01)]
(assert (not (< 0 i@9@01)))
; [exec]
; this.first := 0
; [exec]
; this.len := 0
; [exec]
; fold acc(Valid(this), write)
; [eval] 0 <= this.first
; [eval] 0 <= this.len
; [eval] |this.data| == 0 ==> this.len == 0 && this.first == 0
; [eval] |this.data| == 0
; [eval] |this.data|
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@10@01))) 0))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@10@01))) 0)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | |First:($t@10@01)| == 0 | live]
; [else-branch: 2 | |First:($t@10@01)| != 0 | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 2 | |First:($t@10@01)| == 0]
(assert (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@10@01))) 0))
; [eval] this.len == 0 && this.first == 0
; [eval] this.len == 0
(push) ; 8
; [then-branch: 3 | False | live]
; [else-branch: 3 | True | live]
(push) ; 9
; [then-branch: 3 | False]
(assert false)
(pop) ; 9
(push) ; 9
; [else-branch: 3 | True]
; [eval] this.first == 0
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(pop) ; 7
(push) ; 7
; [else-branch: 2 | |First:($t@10@01)| != 0]
(assert (not (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@10@01))) 0)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (not (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@10@01))) 0))
  (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@10@01))) 0)))
; [eval] |this.data| > 0 ==> this.len <= |this.data| && this.first < |this.data|
; [eval] |this.data| > 0
; [eval] |this.data|
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (not (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@10@01))) 0))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@10@01))) 0)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | |First:($t@10@01)| > 0 | live]
; [else-branch: 4 | !(|First:($t@10@01)| > 0) | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 4 | |First:($t@10@01)| > 0]
(assert (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@10@01))) 0))
; [eval] this.len <= |this.data| && this.first < |this.data|
; [eval] this.len <= |this.data|
; [eval] |this.data|
(push) ; 8
; [then-branch: 5 | !(0 <= |First:($t@10@01)|) | live]
; [else-branch: 5 | 0 <= |First:($t@10@01)| | live]
(push) ; 9
; [then-branch: 5 | !(0 <= |First:($t@10@01)|)]
(assert (not (<= 0 (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@10@01))))))
(pop) ; 9
(push) ; 9
; [else-branch: 5 | 0 <= |First:($t@10@01)|]
(assert (<= 0 (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@10@01)))))
; [eval] this.first < |this.data|
; [eval] |this.data|
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or
  (<= 0 (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@10@01))))
  (not
    (<= 0 (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@10@01)))))))
(pop) ; 7
(push) ; 7
; [else-branch: 4 | !(|First:($t@10@01)| > 0)]
(assert (not (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@10@01))) 0)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@10@01))) 0)
  (and
    (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@10@01))) 0)
    (or
      (<= 0 (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@10@01))))
      (not
        (<=
          0
          (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@10@01)))))))))
; Joined path conditions
(assert (or
  (not (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@10@01))) 0))
  (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@10@01))) 0)))
(push) ; 6
(assert (not (=>
  (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@10@01))) 0)
  (and
    (<= 0 (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@10@01))))
    (< 0 (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@10@01))))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@10@01))) 0)
  (and
    (<= 0 (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@10@01))))
    (< 0 (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@10@01)))))))
(assert (Valid%trigger ($Snap.combine
  ($Snap.first $t@10@01)
  ($Snap.combine
    ($SortWrappers.IntTo$Snap 0)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 0)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@2@01))
; [eval] Contents(this) == Seq[Int]()
; [eval] Contents(this)
(push) ; 6
(declare-const $k@13@01 $Perm)
(assert ($Perm.isReadVar $k@13@01))
(assert (< $k@13@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@13@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@13@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (Contents%precondition ($Snap.combine
  ($Snap.first $t@10@01)
  ($Snap.combine
    ($SortWrappers.IntTo$Snap 0)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 0)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@2@01))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@13@01))
(assert (and
  (< $k@13@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@13@01))
  (Contents%precondition ($Snap.combine
    ($Snap.first $t@10@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 0)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap 0)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@2@01)))
; [eval] Seq[Int]()
(set-option :timeout 0)
(push) ; 6
(assert (not (Seq_equal
  (Contents ($Snap.combine
    ($Snap.first $t@10@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 0)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap 0)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@2@01)
  (as Seq_empty  Seq<Int>))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (Contents ($Snap.combine
    ($Snap.first $t@10@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 0)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap 0)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@2@01)
  (as Seq_empty  Seq<Int>)))
; [eval] Capacity(this) == n
; [eval] Capacity(this)
(push) ; 6
(declare-const $k@14@01 $Perm)
(assert ($Perm.isReadVar $k@14@01))
(assert (< $k@14@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@14@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@14@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (Capacity%precondition ($Snap.combine
  ($Snap.first $t@10@01)
  ($Snap.combine
    ($SortWrappers.IntTo$Snap 0)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 0)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@2@01))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@14@01))
(assert (and
  (< $k@14@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@14@01))
  (Capacity%precondition ($Snap.combine
    ($Snap.first $t@10@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 0)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap 0)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@2@01)))
(set-option :timeout 0)
(push) ; 6
(assert (not (=
  (Capacity ($Snap.combine
    ($Snap.first $t@10@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 0)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap 0)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@2@01)
  n@3@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  (Capacity ($Snap.combine
    ($Snap.first $t@10@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 0)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap 0)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@2@01)
  n@3@01))
(pop) ; 5
(push) ; 5
; [else-branch: 1 | 0 < i@9@01]
(assert (< 0 i@9@01))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- Clear ----------
(declare-const this@15@01 $Ref)
(declare-const this@16@01 $Ref)
(push) ; 1
(declare-const $t@17@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@18@01 $Snap)
(assert (= $t@18@01 ($Snap.combine ($Snap.first $t@18@01) ($Snap.second $t@18@01))))
(assert (=
  ($Snap.second $t@18@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@18@01))
    ($Snap.second ($Snap.second $t@18@01)))))
(assert (= ($Snap.first ($Snap.second $t@18@01)) $Snap.unit))
; [eval] Contents(this) == Seq[Int]()
; [eval] Contents(this)
(push) ; 3
(declare-const $k@19@01 $Perm)
(assert ($Perm.isReadVar $k@19@01))
(assert (< $k@19@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@19@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@19@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Contents%precondition ($Snap.first $t@18@01) this@16@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@19@01))
(assert (and
  (< $k@19@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@19@01))
  (Contents%precondition ($Snap.first $t@18@01) this@16@01)))
; [eval] Seq[Int]()
(assert (Seq_equal (Contents ($Snap.first $t@18@01) this@16@01) (as Seq_empty  Seq<Int>)))
(assert (= ($Snap.second ($Snap.second $t@18@01)) $Snap.unit))
; [eval] Capacity(this) == old(Capacity(this))
; [eval] Capacity(this)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@20@01 $Perm)
(assert ($Perm.isReadVar $k@20@01))
(assert (< $k@20@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@20@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@20@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Capacity%precondition ($Snap.first $t@18@01) this@16@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@20@01))
(assert (and
  (< $k@20@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@20@01))
  (Capacity%precondition ($Snap.first $t@18@01) this@16@01)))
; [eval] old(Capacity(this))
; [eval] Capacity(this)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@21@01 $Perm)
(assert ($Perm.isReadVar $k@21@01))
(assert (< $k@21@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@21@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@21@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Capacity%precondition $t@17@01 this@16@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@21@01))
(assert (and
  (< $k@21@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@21@01))
  (Capacity%precondition $t@17@01 this@16@01)))
(assert (= (Capacity ($Snap.first $t@18@01) this@16@01) (Capacity $t@17@01 this@16@01)))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; unfold acc(Valid(this), write)
(assert (= $t@17@01 ($Snap.combine ($Snap.first $t@17@01) ($Snap.second $t@17@01))))
(assert (not (= this@16@01 $Ref.null)))
(assert (=
  ($Snap.second $t@17@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@17@01))
    ($Snap.second ($Snap.second $t@17@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@17@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@17@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@17@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@17@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@17@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))
  $Snap.unit))
; [eval] 0 <= this.first
(assert (<= 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@17@01)))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@17@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@17@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@17@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@17@01)))))
  $Snap.unit))
; [eval] 0 <= this.len
(assert (<=
  0
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@17@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@17@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@17@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@17@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@17@01))))))
  $Snap.unit))
; [eval] |this.data| == 0 ==> this.len == 0 && this.first == 0
; [eval] |this.data| == 0
; [eval] |this.data|
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@17@01))) 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@17@01))) 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | |First:($t@17@01)| == 0 | live]
; [else-branch: 6 | |First:($t@17@01)| != 0 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 6 | |First:($t@17@01)| == 0]
(assert (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@17@01))) 0))
; [eval] this.len == 0 && this.first == 0
; [eval] this.len == 0
(push) ; 5
; [then-branch: 7 | First:(Second:(Second:($t@17@01))) != 0 | live]
; [else-branch: 7 | First:(Second:(Second:($t@17@01))) == 0 | live]
(push) ; 6
; [then-branch: 7 | First:(Second:(Second:($t@17@01))) != 0]
(assert (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@17@01))))
    0)))
(pop) ; 6
(push) ; 6
; [else-branch: 7 | First:(Second:(Second:($t@17@01))) == 0]
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@17@01))))
  0))
; [eval] this.first == 0
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@17@01))))
    0)
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@17@01))))
      0))))
(pop) ; 4
(push) ; 4
; [else-branch: 6 | |First:($t@17@01)| != 0]
(assert (not (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@17@01))) 0)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@17@01))) 0)
  (and
    (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@17@01))) 0)
    (or
      (=
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@17@01))))
        0)
      (not
        (=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@17@01))))
          0))))))
; Joined path conditions
(assert (or
  (not (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@17@01))) 0))
  (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@17@01))) 0)))
(assert (=>
  (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@17@01))) 0)
  (and
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@17@01))))
      0)
    (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@17@01))) 0))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@17@01))))))
  $Snap.unit))
; [eval] |this.data| > 0 ==> this.len <= |this.data| && this.first < |this.data|
; [eval] |this.data| > 0
; [eval] |this.data|
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@17@01))) 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@17@01))) 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | |First:($t@17@01)| > 0 | live]
; [else-branch: 8 | !(|First:($t@17@01)| > 0) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 8 | |First:($t@17@01)| > 0]
(assert (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@17@01))) 0))
; [eval] this.len <= |this.data| && this.first < |this.data|
; [eval] this.len <= |this.data|
; [eval] |this.data|
(push) ; 5
; [then-branch: 9 | !(First:(Second:(Second:($t@17@01))) <= |First:($t@17@01)|) | live]
; [else-branch: 9 | First:(Second:(Second:($t@17@01))) <= |First:($t@17@01)| | live]
(push) ; 6
; [then-branch: 9 | !(First:(Second:(Second:($t@17@01))) <= |First:($t@17@01)|)]
(assert (not
  (<=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@17@01))))
    (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@17@01))))))
(pop) ; 6
(push) ; 6
; [else-branch: 9 | First:(Second:(Second:($t@17@01))) <= |First:($t@17@01)|]
(assert (<=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@17@01))))
  (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@17@01)))))
; [eval] this.first < |this.data|
; [eval] |this.data|
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (<=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@17@01))))
    (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@17@01))))
  (not
    (<=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@17@01))))
      (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@17@01)))))))
(pop) ; 4
(push) ; 4
; [else-branch: 8 | !(|First:($t@17@01)| > 0)]
(assert (not (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@17@01))) 0)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@17@01))) 0)
  (and
    (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@17@01))) 0)
    (or
      (<=
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@17@01))))
        (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@17@01))))
      (not
        (<=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@17@01))))
          (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@17@01)))))))))
; Joined path conditions
(assert (or
  (not (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@17@01))) 0))
  (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@17@01))) 0)))
(assert (=>
  (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@17@01))) 0)
  (and
    (<=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@17@01))))
      (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@17@01))))
    (<
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@17@01)))
      (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@17@01)))))))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Valid%trigger $t@17@01 this@16@01))
; [exec]
; this.len := 0
; [exec]
; fold acc(Valid(this), write)
; [eval] 0 <= this.first
; [eval] 0 <= this.len
; [eval] |this.data| == 0 ==> this.len == 0 && this.first == 0
; [eval] |this.data| == 0
; [eval] |this.data|
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@17@01))) 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@17@01))) 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | |First:($t@17@01)| == 0 | live]
; [else-branch: 10 | |First:($t@17@01)| != 0 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 10 | |First:($t@17@01)| == 0]
(assert (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@17@01))) 0))
; [eval] this.len == 0 && this.first == 0
; [eval] this.len == 0
(push) ; 5
; [then-branch: 11 | False | live]
; [else-branch: 11 | True | live]
(push) ; 6
; [then-branch: 11 | False]
(assert false)
(pop) ; 6
(push) ; 6
; [else-branch: 11 | True]
; [eval] this.first == 0
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(pop) ; 4
(push) ; 4
; [else-branch: 10 | |First:($t@17@01)| != 0]
(assert (not (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@17@01))) 0)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(push) ; 3
(assert (not (=>
  (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@17@01))) 0)
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@17@01))) 0))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@17@01))) 0)
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@17@01))) 0)))
; [eval] |this.data| > 0 ==> this.len <= |this.data| && this.first < |this.data|
; [eval] |this.data| > 0
; [eval] |this.data|
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@17@01))) 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@17@01))) 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | |First:($t@17@01)| > 0 | live]
; [else-branch: 12 | !(|First:($t@17@01)| > 0) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 12 | |First:($t@17@01)| > 0]
(assert (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@17@01))) 0))
; [eval] this.len <= |this.data| && this.first < |this.data|
; [eval] this.len <= |this.data|
; [eval] |this.data|
(push) ; 5
; [then-branch: 13 | !(0 <= |First:($t@17@01)|) | live]
; [else-branch: 13 | 0 <= |First:($t@17@01)| | live]
(push) ; 6
; [then-branch: 13 | !(0 <= |First:($t@17@01)|)]
(assert (not (<= 0 (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@17@01))))))
(pop) ; 6
(push) ; 6
; [else-branch: 13 | 0 <= |First:($t@17@01)|]
(assert (<= 0 (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@17@01)))))
; [eval] this.first < |this.data|
; [eval] |this.data|
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (<= 0 (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@17@01))))
  (not
    (<= 0 (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@17@01)))))))
(pop) ; 4
(push) ; 4
; [else-branch: 12 | !(|First:($t@17@01)| > 0)]
(assert (not (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@17@01))) 0)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@17@01))) 0)
  (and
    (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@17@01))) 0)
    (or
      (<= 0 (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@17@01))))
      (not
        (<=
          0
          (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@17@01)))))))))
; Joined path conditions
(push) ; 3
(assert (not (=>
  (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@17@01))) 0)
  (and
    (<= 0 (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@17@01))))
    (<
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@17@01)))
      (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@17@01))))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@17@01))) 0)
  (and
    (<= 0 (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@17@01))))
    (<
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@17@01)))
      (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@17@01)))))))
(assert (Valid%trigger ($Snap.combine
  ($Snap.first $t@17@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@17@01))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 0)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@16@01))
; [eval] Contents(this) == Seq[Int]()
; [eval] Contents(this)
(push) ; 3
(declare-const $k@22@01 $Perm)
(assert ($Perm.isReadVar $k@22@01))
(assert (< $k@22@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@22@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@22@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Contents%precondition ($Snap.combine
  ($Snap.first $t@17@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@17@01))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 0)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@16@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@22@01))
(assert (and
  (< $k@22@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@22@01))
  (Contents%precondition ($Snap.combine
    ($Snap.first $t@17@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@17@01))
      ($Snap.combine
        ($SortWrappers.IntTo$Snap 0)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@16@01)))
; [eval] Seq[Int]()
(set-option :timeout 0)
(push) ; 3
(assert (not (Seq_equal
  (Contents ($Snap.combine
    ($Snap.first $t@17@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@17@01))
      ($Snap.combine
        ($SortWrappers.IntTo$Snap 0)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@16@01)
  (as Seq_empty  Seq<Int>))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (Contents ($Snap.combine
    ($Snap.first $t@17@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@17@01))
      ($Snap.combine
        ($SortWrappers.IntTo$Snap 0)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@16@01)
  (as Seq_empty  Seq<Int>)))
; [eval] Capacity(this) == old(Capacity(this))
; [eval] Capacity(this)
(push) ; 3
(declare-const $k@23@01 $Perm)
(assert ($Perm.isReadVar $k@23@01))
(assert (< $k@23@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@23@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@23@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Capacity%precondition ($Snap.combine
  ($Snap.first $t@17@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@17@01))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 0)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@16@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@23@01))
(assert (and
  (< $k@23@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@23@01))
  (Capacity%precondition ($Snap.combine
    ($Snap.first $t@17@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@17@01))
      ($Snap.combine
        ($SortWrappers.IntTo$Snap 0)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@16@01)))
; [eval] old(Capacity(this))
; [eval] Capacity(this)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@24@01 $Perm)
(assert ($Perm.isReadVar $k@24@01))
(assert (< $k@24@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@24@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@24@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Capacity%precondition $t@17@01 this@16@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@24@01))
(assert (and
  (< $k@24@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@24@01))
  (Capacity%precondition $t@17@01 this@16@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (Capacity ($Snap.combine
    ($Snap.first $t@17@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@17@01))
      ($Snap.combine
        ($SortWrappers.IntTo$Snap 0)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@16@01)
  (Capacity $t@17@01 this@16@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (Capacity ($Snap.combine
    ($Snap.first $t@17@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@17@01))
      ($Snap.combine
        ($SortWrappers.IntTo$Snap 0)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@16@01)
  (Capacity $t@17@01 this@16@01)))
(pop) ; 2
(pop) ; 1
; ---------- Head ----------
(declare-const this@25@01 $Ref)
(declare-const x@26@01 Int)
(declare-const this@27@01 $Ref)
(declare-const x@28@01 Int)
(push) ; 1
(declare-const $t@29@01 $Snap)
(assert (= $t@29@01 ($Snap.combine ($Snap.first $t@29@01) ($Snap.second $t@29@01))))
(declare-const $k@30@01 $Perm)
(assert ($Perm.isReadVar $k@30@01))
(assert (<= $Perm.No $k@30@01))
(assert (= ($Snap.second $t@29@01) $Snap.unit))
; [eval] Contents(this) != Seq[Int]()
; [eval] Contents(this)
(push) ; 2
(declare-const $k@31@01 $Perm)
(assert ($Perm.isReadVar $k@31@01))
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@30@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@31@01 $k@30@01))
(assert (<= $Perm.No (- $k@30@01 $k@31@01)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@31@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Contents%precondition ($Snap.first $t@29@01) this@27@01))
(pop) ; 2
; Joined path conditions
(assert ($Perm.isReadVar $k@31@01))
(assert (and
  (< $k@31@01 $k@30@01)
  (<= $Perm.No (- $k@30@01 $k@31@01))
  (Contents%precondition ($Snap.first $t@29@01) this@27@01)))
; [eval] Seq[Int]()
(assert (not
  (Seq_equal
    (Contents ($Snap.first $t@29@01) this@27@01)
    (as Seq_empty  Seq<Int>))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@32@01 $Snap)
(assert (= $t@32@01 ($Snap.combine ($Snap.first $t@32@01) ($Snap.second $t@32@01))))
(declare-const $k@33@01 $Perm)
(assert ($Perm.isReadVar $k@33@01))
(assert (<= $Perm.No $k@33@01))
(assert (=
  ($Snap.second $t@32@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@32@01))
    ($Snap.second ($Snap.second $t@32@01)))))
(assert (= ($Snap.first ($Snap.second $t@32@01)) $Snap.unit))
; [eval] Contents(this) == old(Contents(this))
; [eval] Contents(this)
(push) ; 3
(declare-const $k@34@01 $Perm)
(assert ($Perm.isReadVar $k@34@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= $k@33@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< $k@34@01 $k@33@01))
(assert (<= $Perm.No (- $k@33@01 $k@34@01)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@34@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Contents%precondition ($Snap.first $t@32@01) this@27@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@34@01))
(assert (and
  (< $k@34@01 $k@33@01)
  (<= $Perm.No (- $k@33@01 $k@34@01))
  (Contents%precondition ($Snap.first $t@32@01) this@27@01)))
; [eval] old(Contents(this))
; [eval] Contents(this)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@35@01 $Perm)
(assert ($Perm.isReadVar $k@35@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= $k@30@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< $k@35@01 $k@30@01))
(assert (<= $Perm.No (- $k@30@01 $k@35@01)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@35@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@35@01))
(assert (and (< $k@35@01 $k@30@01) (<= $Perm.No (- $k@30@01 $k@35@01))))
(assert (Seq_equal
  (Contents ($Snap.first $t@32@01) this@27@01)
  (Contents ($Snap.first $t@29@01) this@27@01)))
(assert (=
  ($Snap.second ($Snap.second $t@32@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@32@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@32@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@32@01))) $Snap.unit))
; [eval] x == Contents(this)[0]
; [eval] Contents(this)[0]
; [eval] Contents(this)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@36@01 $Perm)
(assert ($Perm.isReadVar $k@36@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= $k@33@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< $k@36@01 $k@33@01))
(assert (<= $Perm.No (- $k@33@01 $k@36@01)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@36@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@36@01))
(assert (and (< $k@36@01 $k@33@01) (<= $Perm.No (- $k@33@01 $k@36@01))))
(set-option :timeout 0)
(push) ; 3
(assert (not (< 0 (Seq_length (Contents ($Snap.first $t@32@01) this@27@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= x@28@01 (Seq_index (Contents ($Snap.first $t@32@01) this@27@01) 0)))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@32@01))) $Snap.unit))
; [eval] Capacity(this) == old(Capacity(this))
; [eval] Capacity(this)
(push) ; 3
(declare-const $k@37@01 $Perm)
(assert ($Perm.isReadVar $k@37@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= $k@33@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< $k@37@01 $k@33@01))
(assert (<= $Perm.No (- $k@33@01 $k@37@01)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@37@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Capacity%precondition ($Snap.first $t@32@01) this@27@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@37@01))
(assert (and
  (< $k@37@01 $k@33@01)
  (<= $Perm.No (- $k@33@01 $k@37@01))
  (Capacity%precondition ($Snap.first $t@32@01) this@27@01)))
; [eval] old(Capacity(this))
; [eval] Capacity(this)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@38@01 $Perm)
(assert ($Perm.isReadVar $k@38@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= $k@30@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< $k@38@01 $k@30@01))
(assert (<= $Perm.No (- $k@30@01 $k@38@01)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@38@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Capacity%precondition ($Snap.first $t@29@01) this@27@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@38@01))
(assert (and
  (< $k@38@01 $k@30@01)
  (<= $Perm.No (- $k@30@01 $k@38@01))
  (Capacity%precondition ($Snap.first $t@29@01) this@27@01)))
(assert (=
  (Capacity ($Snap.first $t@32@01) this@27@01)
  (Capacity ($Snap.first $t@29@01) this@27@01)))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; unfold acc(Valid(this), wildcard)
(declare-const $k@39@01 $Perm)
(assert ($Perm.isReadVar $k@39@01))
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@30@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@39@01 $k@30@01))
(assert (<= $Perm.No (- $k@30@01 $k@39@01)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@39@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.first $t@29@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@29@01))
    ($Snap.second ($Snap.first $t@29@01)))))
(assert (<= $Perm.No $k@39@01))
(assert (<= $k@39@01 $Perm.Write))
(assert (=> (< $Perm.No $k@39@01) (not (= this@27@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.first $t@29@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@29@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@29@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first $t@29@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@29@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@29@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@29@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@29@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@29@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@29@01)))))
  $Snap.unit))
; [eval] 0 <= this.first
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@39@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<=
  0
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@29@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@29@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@29@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@29@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@29@01))))))
  $Snap.unit))
; [eval] 0 <= this.len
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@39@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<=
  0
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@29@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@29@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@29@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@29@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@29@01)))))))
  $Snap.unit))
; [eval] |this.data| == 0 ==> this.len == 0 && this.first == 0
; [eval] |this.data| == 0
; [eval] |this.data|
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@39@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    (Seq_length
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@29@01))))
    0))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 14 | |First:(First:($t@29@01))| == 0 | dead]
; [else-branch: 14 | |First:(First:($t@29@01))| != 0 | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 14 | |First:(First:($t@29@01))| != 0]
(assert (not
  (=
    (Seq_length
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@29@01))))
    0)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (not
  (=
    (Seq_length
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@29@01))))
    0)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@29@01)))))))
  $Snap.unit))
; [eval] |this.data| > 0 ==> this.len <= |this.data| && this.first < |this.data|
; [eval] |this.data| > 0
; [eval] |this.data|
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@39@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (>
    (Seq_length
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@29@01))))
    0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (>
  (Seq_length
    ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@29@01))))
  0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 15 | |First:(First:($t@29@01))| > 0 | live]
; [else-branch: 15 | !(|First:(First:($t@29@01))| > 0) | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 15 | |First:(First:($t@29@01))| > 0]
(assert (>
  (Seq_length
    ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@29@01))))
  0))
; [eval] this.len <= |this.data| && this.first < |this.data|
; [eval] this.len <= |this.data|
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@39@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] |this.data|
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@39@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
; [then-branch: 16 | !(First:(Second:(Second:(First:($t@29@01)))) <= |First:(First:($t@29@01))|) | live]
; [else-branch: 16 | First:(Second:(Second:(First:($t@29@01)))) <= |First:(First:($t@29@01))| | live]
(push) ; 6
; [then-branch: 16 | !(First:(Second:(Second:(First:($t@29@01)))) <= |First:(First:($t@29@01))|)]
(assert (not
  (<=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@29@01)))))
    (Seq_length
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@29@01)))))))
(pop) ; 6
(push) ; 6
; [else-branch: 16 | First:(Second:(Second:(First:($t@29@01)))) <= |First:(First:($t@29@01))|]
(assert (<=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@29@01)))))
  (Seq_length
    ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@29@01))))))
; [eval] this.first < |this.data|
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@39@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] |this.data|
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@39@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (<=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@29@01)))))
    (Seq_length
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@29@01)))))
  (not
    (<=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@29@01)))))
      (Seq_length
        ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@29@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (>
    (Seq_length
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@29@01))))
    0)
  (and
    (>
      (Seq_length
        ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@29@01))))
      0)
    (or
      (<=
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@29@01)))))
        (Seq_length
          ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@29@01)))))
      (not
        (<=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@29@01)))))
          (Seq_length
            ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@29@01))))))))))
(assert (>
  (Seq_length
    ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@29@01))))
  0))
(assert (=>
  (>
    (Seq_length
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@29@01))))
    0)
  (and
    (<=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@29@01)))))
      (Seq_length
        ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@29@01)))))
    (<
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@29@01))))
      (Seq_length
        ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@29@01))))))))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Valid%trigger ($Snap.first $t@29@01) this@27@01))
; [exec]
; x := this.data[this.first]
; [eval] this.data[this.first]
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@39@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@39@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(assert (not (>=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@29@01))))
  0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (<
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@29@01))))
  (Seq_length
    ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@29@01)))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const x@40@01 Int)
(assert (=
  x@40@01
  (Seq_index
    ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@29@01)))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@29@01)))))))
; [exec]
; fold acc(Valid(this), wildcard)
(declare-const $k@41@01 $Perm)
(assert ($Perm.isReadVar $k@41@01))
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@39@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@41@01 $k@39@01))
(assert (<= $Perm.No (- $k@39@01 $k@41@01)))
(assert (<= (- $k@39@01 $k@41@01) $Perm.Write))
(assert (=> (< $Perm.No (- $k@39@01 $k@41@01)) (not (= this@27@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@41@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@39@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@41@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@39@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@41@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] 0 <= this.first
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@39@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] 0 <= this.len
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@39@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] |this.data| == 0 ==> this.len == 0 && this.first == 0
; [eval] |this.data| == 0
; [eval] |this.data|
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@39@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
; [then-branch: 17 | |First:(First:($t@29@01))| == 0 | dead]
; [else-branch: 17 | |First:(First:($t@29@01))| != 0 | live]
(push) ; 4
; [else-branch: 17 | |First:(First:($t@29@01))| != 0]
(pop) ; 4
(pop) ; 3
; Joined path conditions
; [eval] |this.data| > 0 ==> this.len <= |this.data| && this.first < |this.data|
; [eval] |this.data| > 0
; [eval] |this.data|
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@39@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (>
    (Seq_length
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@29@01))))
    0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 18 | |First:(First:($t@29@01))| > 0 | live]
; [else-branch: 18 | !(|First:(First:($t@29@01))| > 0) | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 18 | |First:(First:($t@29@01))| > 0]
; [eval] this.len <= |this.data| && this.first < |this.data|
; [eval] this.len <= |this.data|
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@39@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] |this.data|
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@39@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
; [then-branch: 19 | !(First:(Second:(Second:(First:($t@29@01)))) <= |First:(First:($t@29@01))|) | live]
; [else-branch: 19 | First:(Second:(Second:(First:($t@29@01)))) <= |First:(First:($t@29@01))| | live]
(push) ; 6
; [then-branch: 19 | !(First:(Second:(Second:(First:($t@29@01)))) <= |First:(First:($t@29@01))|)]
(assert (not
  (<=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@29@01)))))
    (Seq_length
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@29@01)))))))
(pop) ; 6
(push) ; 6
; [else-branch: 19 | First:(Second:(Second:(First:($t@29@01)))) <= |First:(First:($t@29@01))|]
(assert (<=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@29@01)))))
  (Seq_length
    ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@29@01))))))
; [eval] this.first < |this.data|
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@39@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] |this.data|
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@39@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (<=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@29@01)))))
    (Seq_length
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@29@01)))))
  (not
    (<=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@29@01)))))
      (Seq_length
        ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@29@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (>
    (Seq_length
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@29@01))))
    0)
  (or
    (<=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@29@01)))))
      (Seq_length
        ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@29@01)))))
    (not
      (<=
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@29@01)))))
        (Seq_length
          ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@29@01)))))))))
(assert (Valid%trigger ($Snap.combine
  ($Snap.first ($Snap.first $t@29@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@29@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@29@01))))
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@27@01))
(declare-const $t@42@01 $Snap)
(assert (and
  (=> (< $Perm.No (- $k@30@01 $k@39@01)) (= $t@42@01 ($Snap.first $t@29@01)))
  (=>
    (< $Perm.No $k@41@01)
    (=
      $t@42@01
      ($Snap.combine
        ($Snap.first ($Snap.first $t@29@01))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.first $t@29@01)))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@29@01))))
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))))))))
(assert (<= $Perm.No (+ (- $k@30@01 $k@39@01) $k@41@01)))
(declare-const $k@43@01 $Perm)
(assert ($Perm.isReadVar $k@43@01))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= (+ (- $k@30@01 $k@39@01) $k@41@01) $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@43@01 (+ (- $k@30@01 $k@39@01) $k@41@01)))
(assert (<= $Perm.No (- (+ (- $k@30@01 $k@39@01) $k@41@01) $k@43@01)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@43@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] Contents(this) == old(Contents(this))
; [eval] Contents(this)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@44@01 $Perm)
(assert ($Perm.isReadVar $k@44@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= (+ (- $k@30@01 $k@39@01) $k@41@01) $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< $k@44@01 (+ (- $k@30@01 $k@39@01) $k@41@01)))
(assert (<= $Perm.No (- (+ (- $k@30@01 $k@39@01) $k@41@01) $k@44@01)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@44@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Contents%precondition $t@42@01 this@27@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@44@01))
(assert (and
  (< $k@44@01 (+ (- $k@30@01 $k@39@01) $k@41@01))
  (<= $Perm.No (- (+ (- $k@30@01 $k@39@01) $k@41@01) $k@44@01))
  (Contents%precondition $t@42@01 this@27@01)))
; [eval] old(Contents(this))
; [eval] Contents(this)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@45@01 $Perm)
(assert ($Perm.isReadVar $k@45@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= $k@30@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< $k@45@01 $k@30@01))
(assert (<= $Perm.No (- $k@30@01 $k@45@01)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@45@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@45@01))
(assert (and (< $k@45@01 $k@30@01) (<= $Perm.No (- $k@30@01 $k@45@01))))
(set-option :timeout 0)
(push) ; 3
(assert (not (Seq_equal
  (Contents $t@42@01 this@27@01)
  (Contents ($Snap.first $t@29@01) this@27@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (Contents $t@42@01 this@27@01)
  (Contents ($Snap.first $t@29@01) this@27@01)))
; [eval] x == Contents(this)[0]
; [eval] Contents(this)[0]
; [eval] Contents(this)
(push) ; 3
(declare-const $k@46@01 $Perm)
(assert ($Perm.isReadVar $k@46@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= (+ (- $k@30@01 $k@39@01) $k@41@01) $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< $k@46@01 (+ (- $k@30@01 $k@39@01) $k@41@01)))
(assert (<= $Perm.No (- (+ (- $k@30@01 $k@39@01) $k@41@01) $k@46@01)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@46@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@46@01))
(assert (and
  (< $k@46@01 (+ (- $k@30@01 $k@39@01) $k@41@01))
  (<= $Perm.No (- (+ (- $k@30@01 $k@39@01) $k@41@01) $k@46@01))))
(set-option :timeout 0)
(push) ; 3
(assert (not (< 0 (Seq_length (Contents $t@42@01 this@27@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (= x@40@01 (Seq_index (Contents $t@42@01 this@27@01) 0))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= x@40@01 (Seq_index (Contents $t@42@01 this@27@01) 0)))
; [eval] Capacity(this) == old(Capacity(this))
; [eval] Capacity(this)
(push) ; 3
(declare-const $k@47@01 $Perm)
(assert ($Perm.isReadVar $k@47@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= (+ (- $k@30@01 $k@39@01) $k@41@01) $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< $k@47@01 (+ (- $k@30@01 $k@39@01) $k@41@01)))
(assert (<= $Perm.No (- (+ (- $k@30@01 $k@39@01) $k@41@01) $k@47@01)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@47@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Capacity%precondition $t@42@01 this@27@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@47@01))
(assert (and
  (< $k@47@01 (+ (- $k@30@01 $k@39@01) $k@41@01))
  (<= $Perm.No (- (+ (- $k@30@01 $k@39@01) $k@41@01) $k@47@01))
  (Capacity%precondition $t@42@01 this@27@01)))
; [eval] old(Capacity(this))
; [eval] Capacity(this)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@48@01 $Perm)
(assert ($Perm.isReadVar $k@48@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= $k@30@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< $k@48@01 $k@30@01))
(assert (<= $Perm.No (- $k@30@01 $k@48@01)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@48@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Capacity%precondition ($Snap.first $t@29@01) this@27@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@48@01))
(assert (and
  (< $k@48@01 $k@30@01)
  (<= $Perm.No (- $k@30@01 $k@48@01))
  (Capacity%precondition ($Snap.first $t@29@01) this@27@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (= (Capacity $t@42@01 this@27@01) (Capacity ($Snap.first $t@29@01) this@27@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Capacity $t@42@01 this@27@01) (Capacity ($Snap.first $t@29@01) this@27@01)))
(pop) ; 2
(pop) ; 1
; ---------- Push ----------
(declare-const this@49@01 $Ref)
(declare-const x@50@01 Int)
(declare-const this@51@01 $Ref)
(declare-const x@52@01 Int)
(push) ; 1
(declare-const $t@53@01 $Snap)
(assert (= $t@53@01 ($Snap.combine ($Snap.first $t@53@01) ($Snap.second $t@53@01))))
(assert (= ($Snap.second $t@53@01) $Snap.unit))
; [eval] |Contents(this)| != Capacity(this)
; [eval] |Contents(this)|
; [eval] Contents(this)
(push) ; 2
(declare-const $k@54@01 $Perm)
(assert ($Perm.isReadVar $k@54@01))
(assert (< $k@54@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@54@01)))
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@54@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Contents%precondition ($Snap.first $t@53@01) this@51@01))
(pop) ; 2
; Joined path conditions
(assert ($Perm.isReadVar $k@54@01))
(assert (and
  (< $k@54@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@54@01))
  (Contents%precondition ($Snap.first $t@53@01) this@51@01)))
; [eval] Capacity(this)
(set-option :timeout 0)
(push) ; 2
(declare-const $k@55@01 $Perm)
(assert ($Perm.isReadVar $k@55@01))
(assert (< $k@55@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@55@01)))
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@55@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Capacity%precondition ($Snap.first $t@53@01) this@51@01))
(pop) ; 2
; Joined path conditions
(assert ($Perm.isReadVar $k@55@01))
(assert (and
  (< $k@55@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@55@01))
  (Capacity%precondition ($Snap.first $t@53@01) this@51@01)))
(assert (not
  (=
    (Seq_length (Contents ($Snap.first $t@53@01) this@51@01))
    (Capacity ($Snap.first $t@53@01) this@51@01))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@56@01 $Snap)
(assert (= $t@56@01 ($Snap.combine ($Snap.first $t@56@01) ($Snap.second $t@56@01))))
(assert (=
  ($Snap.second $t@56@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@56@01))
    ($Snap.second ($Snap.second $t@56@01)))))
(assert (= ($Snap.first ($Snap.second $t@56@01)) $Snap.unit))
; [eval] Contents(this) == old(Contents(this)) ++ Seq(x)
; [eval] Contents(this)
(push) ; 3
(declare-const $k@57@01 $Perm)
(assert ($Perm.isReadVar $k@57@01))
(assert (< $k@57@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@57@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@57@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Contents%precondition ($Snap.first $t@56@01) this@51@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@57@01))
(assert (and
  (< $k@57@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@57@01))
  (Contents%precondition ($Snap.first $t@56@01) this@51@01)))
; [eval] old(Contents(this)) ++ Seq(x)
; [eval] old(Contents(this))
; [eval] Contents(this)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@58@01 $Perm)
(assert ($Perm.isReadVar $k@58@01))
(assert (< $k@58@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@58@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@58@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@58@01))
(assert (and (< $k@58@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@58@01))))
; [eval] Seq(x)
(assert (= (Seq_length (Seq_singleton x@52@01)) 1))
(assert (Seq_equal
  (Contents ($Snap.first $t@56@01) this@51@01)
  (Seq_append
    (Contents ($Snap.first $t@53@01) this@51@01)
    (Seq_singleton x@52@01))))
(assert (= ($Snap.second ($Snap.second $t@56@01)) $Snap.unit))
; [eval] Capacity(this) == old(Capacity(this))
; [eval] Capacity(this)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@59@01 $Perm)
(assert ($Perm.isReadVar $k@59@01))
(assert (< $k@59@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@59@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@59@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Capacity%precondition ($Snap.first $t@56@01) this@51@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@59@01))
(assert (and
  (< $k@59@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@59@01))
  (Capacity%precondition ($Snap.first $t@56@01) this@51@01)))
; [eval] old(Capacity(this))
; [eval] Capacity(this)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@60@01 $Perm)
(assert ($Perm.isReadVar $k@60@01))
(assert (< $k@60@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@60@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@60@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@60@01))
(assert (and (< $k@60@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@60@01))))
(assert (=
  (Capacity ($Snap.first $t@56@01) this@51@01)
  (Capacity ($Snap.first $t@53@01) this@51@01)))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; var nextEmpty: Int
(declare-const nextEmpty@61@01 Int)
; [exec]
; unfold acc(Valid(this), write)
(assert (=
  ($Snap.first $t@53@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@53@01))
    ($Snap.second ($Snap.first $t@53@01)))))
(assert (not (= this@51@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.first $t@53@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@53@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@53@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first $t@53@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@53@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@53@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@53@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@53@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@53@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@53@01)))))
  $Snap.unit))
; [eval] 0 <= this.first
(assert (<=
  0
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@53@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@53@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@53@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@53@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@53@01))))))
  $Snap.unit))
; [eval] 0 <= this.len
(assert (<=
  0
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@53@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@53@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@53@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@53@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@53@01)))))))
  $Snap.unit))
; [eval] |this.data| == 0 ==> this.len == 0 && this.first == 0
; [eval] |this.data| == 0
; [eval] |this.data|
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    (Seq_length
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@53@01))))
    0))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 20 | |First:(First:($t@53@01))| == 0 | dead]
; [else-branch: 20 | |First:(First:($t@53@01))| != 0 | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 20 | |First:(First:($t@53@01))| != 0]
(assert (not
  (=
    (Seq_length
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@53@01))))
    0)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (not
  (=
    (Seq_length
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@53@01))))
    0)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@53@01)))))))
  $Snap.unit))
; [eval] |this.data| > 0 ==> this.len <= |this.data| && this.first < |this.data|
; [eval] |this.data| > 0
; [eval] |this.data|
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (>
    (Seq_length
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@53@01))))
    0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (>
  (Seq_length
    ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@53@01))))
  0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 21 | |First:(First:($t@53@01))| > 0 | live]
; [else-branch: 21 | !(|First:(First:($t@53@01))| > 0) | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 21 | |First:(First:($t@53@01))| > 0]
(assert (>
  (Seq_length
    ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@53@01))))
  0))
; [eval] this.len <= |this.data| && this.first < |this.data|
; [eval] this.len <= |this.data|
; [eval] |this.data|
(push) ; 5
; [then-branch: 22 | !(First:(Second:(Second:(First:($t@53@01)))) <= |First:(First:($t@53@01))|) | live]
; [else-branch: 22 | First:(Second:(Second:(First:($t@53@01)))) <= |First:(First:($t@53@01))| | live]
(push) ; 6
; [then-branch: 22 | !(First:(Second:(Second:(First:($t@53@01)))) <= |First:(First:($t@53@01))|)]
(assert (not
  (<=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@53@01)))))
    (Seq_length
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@53@01)))))))
(pop) ; 6
(push) ; 6
; [else-branch: 22 | First:(Second:(Second:(First:($t@53@01)))) <= |First:(First:($t@53@01))|]
(assert (<=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@53@01)))))
  (Seq_length
    ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@53@01))))))
; [eval] this.first < |this.data|
; [eval] |this.data|
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (<=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@53@01)))))
    (Seq_length
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@53@01)))))
  (not
    (<=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@53@01)))))
      (Seq_length
        ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@53@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (>
    (Seq_length
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@53@01))))
    0)
  (and
    (>
      (Seq_length
        ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@53@01))))
      0)
    (or
      (<=
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@53@01)))))
        (Seq_length
          ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@53@01)))))
      (not
        (<=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@53@01)))))
          (Seq_length
            ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@53@01))))))))))
(assert (>
  (Seq_length
    ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@53@01))))
  0))
(assert (=>
  (>
    (Seq_length
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@53@01))))
    0)
  (and
    (<=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@53@01)))))
      (Seq_length
        ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@53@01)))))
    (<
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@53@01))))
      (Seq_length
        ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@53@01))))))))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Valid%trigger ($Snap.first $t@53@01) this@51@01))
; [eval] this.first + this.len < |this.data|
; [eval] this.first + this.len
; [eval] |this.data|
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (<
    (+
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@53@01))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@53@01))))))
    (Seq_length
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@53@01))))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@53@01))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@53@01))))))
  (Seq_length
    ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@53@01)))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 23 | First:(Second:(First:($t@53@01))) + First:(Second:(Second:(First:($t@53@01)))) < |First:(First:($t@53@01))| | live]
; [else-branch: 23 | !(First:(Second:(First:($t@53@01))) + First:(Second:(Second:(First:($t@53@01)))) < |First:(First:($t@53@01))|) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 23 | First:(Second:(First:($t@53@01))) + First:(Second:(Second:(First:($t@53@01)))) < |First:(First:($t@53@01))|]
(assert (<
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@53@01))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@53@01))))))
  (Seq_length
    ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@53@01))))))
; [exec]
; nextEmpty := this.first + this.len
; [eval] this.first + this.len
(declare-const nextEmpty@62@01 Int)
(assert (=
  nextEmpty@62@01
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@53@01))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@53@01))))))))
; [exec]
; this.data := this.data[..nextEmpty] ++ Seq(x) ++ this.data[nextEmpty + 1..]
; [eval] this.data[..nextEmpty] ++ Seq(x) ++ this.data[nextEmpty + 1..]
; [eval] this.data[..nextEmpty] ++ Seq(x)
; [eval] this.data[..nextEmpty]
; [eval] Seq(x)
(assert (= (Seq_length (Seq_singleton x@52@01)) 1))
; [eval] this.data[nextEmpty + 1..]
; [eval] nextEmpty + 1
(declare-const data@63@01 Seq<Int>)
(assert (=
  data@63@01
  (Seq_append
    (Seq_append
      (Seq_take
        ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@53@01)))
        nextEmpty@62@01)
      (Seq_singleton x@52@01))
    (Seq_drop
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@53@01)))
      (+ nextEmpty@62@01 1)))))
; [exec]
; this.len := this.len + 1
; [eval] this.len + 1
(declare-const len@64@01 Int)
(assert (=
  len@64@01
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@53@01)))))
    1)))
; [exec]
; fold acc(Valid(this), write)
; [eval] 0 <= this.first
; [eval] 0 <= this.len
(push) ; 4
(assert (not (<= 0 len@64@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 len@64@01))
; [eval] |this.data| == 0 ==> this.len == 0 && this.first == 0
; [eval] |this.data| == 0
; [eval] |this.data|
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= (Seq_length data@63@01) 0))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 24 | |data@63@01| == 0 | dead]
; [else-branch: 24 | |data@63@01| != 0 | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 24 | |data@63@01| != 0]
(assert (not (= (Seq_length data@63@01) 0)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (= (Seq_length data@63@01) 0)))
; [eval] |this.data| > 0 ==> this.len <= |this.data| && this.first < |this.data|
; [eval] |this.data| > 0
; [eval] |this.data|
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> (Seq_length data@63@01) 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (> (Seq_length data@63@01) 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 25 | |data@63@01| > 0 | live]
; [else-branch: 25 | !(|data@63@01| > 0) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 25 | |data@63@01| > 0]
(assert (> (Seq_length data@63@01) 0))
; [eval] this.len <= |this.data| && this.first < |this.data|
; [eval] this.len <= |this.data|
; [eval] |this.data|
(push) ; 6
; [then-branch: 26 | !(len@64@01 <= |data@63@01|) | live]
; [else-branch: 26 | len@64@01 <= |data@63@01| | live]
(push) ; 7
; [then-branch: 26 | !(len@64@01 <= |data@63@01|)]
(assert (not (<= len@64@01 (Seq_length data@63@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 26 | len@64@01 <= |data@63@01|]
(assert (<= len@64@01 (Seq_length data@63@01)))
; [eval] this.first < |this.data|
; [eval] |this.data|
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (<= len@64@01 (Seq_length data@63@01))
  (not (<= len@64@01 (Seq_length data@63@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (> (Seq_length data@63@01) 0)
  (and
    (> (Seq_length data@63@01) 0)
    (or
      (<= len@64@01 (Seq_length data@63@01))
      (not (<= len@64@01 (Seq_length data@63@01)))))))
(assert (> (Seq_length data@63@01) 0))
(push) ; 4
(assert (not (=>
  (> (Seq_length data@63@01) 0)
  (and
    (<= len@64@01 (Seq_length data@63@01))
    (<
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@53@01))))
      (Seq_length data@63@01))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (> (Seq_length data@63@01) 0)
  (and
    (<= len@64@01 (Seq_length data@63@01))
    (<
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@53@01))))
      (Seq_length data@63@01)))))
(assert (Valid%trigger ($Snap.combine
  ($SortWrappers.Seq<Int>To$Snap data@63@01)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@53@01)))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap len@64@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@51@01))
; [eval] Contents(this) == old(Contents(this)) ++ Seq(x)
; [eval] Contents(this)
(push) ; 4
(declare-const $k@65@01 $Perm)
(assert ($Perm.isReadVar $k@65@01))
(assert (< $k@65@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@65@01)))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@65@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (Contents%precondition ($Snap.combine
  ($SortWrappers.Seq<Int>To$Snap data@63@01)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@53@01)))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap len@64@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@51@01))
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@65@01))
(assert (and
  (< $k@65@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@65@01))
  (Contents%precondition ($Snap.combine
    ($SortWrappers.Seq<Int>To$Snap data@63@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@53@01)))
      ($Snap.combine
        ($SortWrappers.IntTo$Snap len@64@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@51@01)))
; [eval] old(Contents(this)) ++ Seq(x)
; [eval] old(Contents(this))
; [eval] Contents(this)
(set-option :timeout 0)
(push) ; 4
(declare-const $k@66@01 $Perm)
(assert ($Perm.isReadVar $k@66@01))
(assert (< $k@66@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@66@01)))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@66@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@66@01))
(assert (and (< $k@66@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@66@01))))
; [eval] Seq(x)
(set-option :timeout 0)
(push) ; 4
(assert (not (Seq_equal
  (Contents ($Snap.combine
    ($SortWrappers.Seq<Int>To$Snap data@63@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@53@01)))
      ($Snap.combine
        ($SortWrappers.IntTo$Snap len@64@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@51@01)
  (Seq_append
    (Contents ($Snap.first $t@53@01) this@51@01)
    (Seq_singleton x@52@01)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (Contents ($Snap.combine
    ($SortWrappers.Seq<Int>To$Snap data@63@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@53@01)))
      ($Snap.combine
        ($SortWrappers.IntTo$Snap len@64@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@51@01)
  (Seq_append
    (Contents ($Snap.first $t@53@01) this@51@01)
    (Seq_singleton x@52@01))))
; [eval] Capacity(this) == old(Capacity(this))
; [eval] Capacity(this)
(push) ; 4
(declare-const $k@67@01 $Perm)
(assert ($Perm.isReadVar $k@67@01))
(assert (< $k@67@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@67@01)))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@67@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (Capacity%precondition ($Snap.combine
  ($SortWrappers.Seq<Int>To$Snap data@63@01)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@53@01)))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap len@64@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@51@01))
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@67@01))
(assert (and
  (< $k@67@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@67@01))
  (Capacity%precondition ($Snap.combine
    ($SortWrappers.Seq<Int>To$Snap data@63@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@53@01)))
      ($Snap.combine
        ($SortWrappers.IntTo$Snap len@64@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@51@01)))
; [eval] old(Capacity(this))
; [eval] Capacity(this)
(set-option :timeout 0)
(push) ; 4
(declare-const $k@68@01 $Perm)
(assert ($Perm.isReadVar $k@68@01))
(assert (< $k@68@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@68@01)))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@68@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@68@01))
(assert (and (< $k@68@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@68@01))))
(set-option :timeout 0)
(push) ; 4
(assert (not (=
  (Capacity ($Snap.combine
    ($SortWrappers.Seq<Int>To$Snap data@63@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@53@01)))
      ($Snap.combine
        ($SortWrappers.IntTo$Snap len@64@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@51@01)
  (Capacity ($Snap.first $t@53@01) this@51@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  (Capacity ($Snap.combine
    ($SortWrappers.Seq<Int>To$Snap data@63@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@53@01)))
      ($Snap.combine
        ($SortWrappers.IntTo$Snap len@64@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@51@01)
  (Capacity ($Snap.first $t@53@01) this@51@01)))
(pop) ; 3
(push) ; 3
; [else-branch: 23 | !(First:(Second:(First:($t@53@01))) + First:(Second:(Second:(First:($t@53@01)))) < |First:(First:($t@53@01))|)]
(assert (not
  (<
    (+
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@53@01))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@53@01))))))
    (Seq_length
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@53@01)))))))
(pop) ; 3
; [eval] !(this.first + this.len < |this.data|)
; [eval] this.first + this.len < |this.data|
; [eval] this.first + this.len
; [eval] |this.data|
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@53@01))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@53@01))))))
  (Seq_length
    ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@53@01)))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (<
    (+
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@53@01))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@53@01))))))
    (Seq_length
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@53@01))))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 27 | !(First:(Second:(First:($t@53@01))) + First:(Second:(Second:(First:($t@53@01)))) < |First:(First:($t@53@01))|) | live]
; [else-branch: 27 | First:(Second:(First:($t@53@01))) + First:(Second:(Second:(First:($t@53@01)))) < |First:(First:($t@53@01))| | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 27 | !(First:(Second:(First:($t@53@01))) + First:(Second:(Second:(First:($t@53@01)))) < |First:(First:($t@53@01))|)]
(assert (not
  (<
    (+
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@53@01))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@53@01))))))
    (Seq_length
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@53@01)))))))
; [exec]
; nextEmpty := this.first + this.len - |this.data|
; [eval] this.first + this.len - |this.data|
; [eval] this.first + this.len
; [eval] |this.data|
(declare-const nextEmpty@69@01 Int)
(assert (=
  nextEmpty@69@01
  (-
    (+
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@53@01))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@53@01))))))
    (Seq_length
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@53@01)))))))
; [exec]
; this.data := this.data[..nextEmpty] ++ Seq(x) ++ this.data[nextEmpty + 1..]
; [eval] this.data[..nextEmpty] ++ Seq(x) ++ this.data[nextEmpty + 1..]
; [eval] this.data[..nextEmpty] ++ Seq(x)
; [eval] this.data[..nextEmpty]
; [eval] Seq(x)
(assert (= (Seq_length (Seq_singleton x@52@01)) 1))
; [eval] this.data[nextEmpty + 1..]
; [eval] nextEmpty + 1
(declare-const data@70@01 Seq<Int>)
(assert (=
  data@70@01
  (Seq_append
    (Seq_append
      (Seq_take
        ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@53@01)))
        nextEmpty@69@01)
      (Seq_singleton x@52@01))
    (Seq_drop
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@53@01)))
      (+ nextEmpty@69@01 1)))))
; [exec]
; this.len := this.len + 1
; [eval] this.len + 1
(declare-const len@71@01 Int)
(assert (=
  len@71@01
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@53@01)))))
    1)))
; [exec]
; fold acc(Valid(this), write)
; [eval] 0 <= this.first
; [eval] 0 <= this.len
(push) ; 4
(assert (not (<= 0 len@71@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 len@71@01))
; [eval] |this.data| == 0 ==> this.len == 0 && this.first == 0
; [eval] |this.data| == 0
; [eval] |this.data|
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= (Seq_length data@70@01) 0))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 28 | |data@70@01| == 0 | dead]
; [else-branch: 28 | |data@70@01| != 0 | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 28 | |data@70@01| != 0]
(assert (not (= (Seq_length data@70@01) 0)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (= (Seq_length data@70@01) 0)))
; [eval] |this.data| > 0 ==> this.len <= |this.data| && this.first < |this.data|
; [eval] |this.data| > 0
; [eval] |this.data|
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> (Seq_length data@70@01) 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (> (Seq_length data@70@01) 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 29 | |data@70@01| > 0 | live]
; [else-branch: 29 | !(|data@70@01| > 0) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 29 | |data@70@01| > 0]
(assert (> (Seq_length data@70@01) 0))
; [eval] this.len <= |this.data| && this.first < |this.data|
; [eval] this.len <= |this.data|
; [eval] |this.data|
(push) ; 6
; [then-branch: 30 | !(len@71@01 <= |data@70@01|) | live]
; [else-branch: 30 | len@71@01 <= |data@70@01| | live]
(push) ; 7
; [then-branch: 30 | !(len@71@01 <= |data@70@01|)]
(assert (not (<= len@71@01 (Seq_length data@70@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 30 | len@71@01 <= |data@70@01|]
(assert (<= len@71@01 (Seq_length data@70@01)))
; [eval] this.first < |this.data|
; [eval] |this.data|
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (<= len@71@01 (Seq_length data@70@01))
  (not (<= len@71@01 (Seq_length data@70@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (> (Seq_length data@70@01) 0)
  (and
    (> (Seq_length data@70@01) 0)
    (or
      (<= len@71@01 (Seq_length data@70@01))
      (not (<= len@71@01 (Seq_length data@70@01)))))))
(assert (> (Seq_length data@70@01) 0))
(push) ; 4
(assert (not (=>
  (> (Seq_length data@70@01) 0)
  (and
    (<= len@71@01 (Seq_length data@70@01))
    (<
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@53@01))))
      (Seq_length data@70@01))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (> (Seq_length data@70@01) 0)
  (and
    (<= len@71@01 (Seq_length data@70@01))
    (<
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@53@01))))
      (Seq_length data@70@01)))))
(assert (Valid%trigger ($Snap.combine
  ($SortWrappers.Seq<Int>To$Snap data@70@01)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@53@01)))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap len@71@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@51@01))
; [eval] Contents(this) == old(Contents(this)) ++ Seq(x)
; [eval] Contents(this)
(push) ; 4
(declare-const $k@72@01 $Perm)
(assert ($Perm.isReadVar $k@72@01))
(assert (< $k@72@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@72@01)))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@72@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (Contents%precondition ($Snap.combine
  ($SortWrappers.Seq<Int>To$Snap data@70@01)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@53@01)))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap len@71@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@51@01))
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@72@01))
(assert (and
  (< $k@72@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@72@01))
  (Contents%precondition ($Snap.combine
    ($SortWrappers.Seq<Int>To$Snap data@70@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@53@01)))
      ($Snap.combine
        ($SortWrappers.IntTo$Snap len@71@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@51@01)))
; [eval] old(Contents(this)) ++ Seq(x)
; [eval] old(Contents(this))
; [eval] Contents(this)
(set-option :timeout 0)
(push) ; 4
(declare-const $k@73@01 $Perm)
(assert ($Perm.isReadVar $k@73@01))
(assert (< $k@73@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@73@01)))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@73@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@73@01))
(assert (and (< $k@73@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@73@01))))
; [eval] Seq(x)
(set-option :timeout 0)
(push) ; 4
(assert (not (Seq_equal
  (Contents ($Snap.combine
    ($SortWrappers.Seq<Int>To$Snap data@70@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@53@01)))
      ($Snap.combine
        ($SortWrappers.IntTo$Snap len@71@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@51@01)
  (Seq_append
    (Contents ($Snap.first $t@53@01) this@51@01)
    (Seq_singleton x@52@01)))))
(check-sat)
; unsat
(pop) ; 4
; 0,03s
; (get-info :all-statistics)
(assert (Seq_equal
  (Contents ($Snap.combine
    ($SortWrappers.Seq<Int>To$Snap data@70@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@53@01)))
      ($Snap.combine
        ($SortWrappers.IntTo$Snap len@71@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@51@01)
  (Seq_append
    (Contents ($Snap.first $t@53@01) this@51@01)
    (Seq_singleton x@52@01))))
; [eval] Capacity(this) == old(Capacity(this))
; [eval] Capacity(this)
(push) ; 4
(declare-const $k@74@01 $Perm)
(assert ($Perm.isReadVar $k@74@01))
(assert (< $k@74@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@74@01)))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@74@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (Capacity%precondition ($Snap.combine
  ($SortWrappers.Seq<Int>To$Snap data@70@01)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@53@01)))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap len@71@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@51@01))
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@74@01))
(assert (and
  (< $k@74@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@74@01))
  (Capacity%precondition ($Snap.combine
    ($SortWrappers.Seq<Int>To$Snap data@70@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@53@01)))
      ($Snap.combine
        ($SortWrappers.IntTo$Snap len@71@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@51@01)))
; [eval] old(Capacity(this))
; [eval] Capacity(this)
(set-option :timeout 0)
(push) ; 4
(declare-const $k@75@01 $Perm)
(assert ($Perm.isReadVar $k@75@01))
(assert (< $k@75@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@75@01)))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@75@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@75@01))
(assert (and (< $k@75@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@75@01))))
(set-option :timeout 0)
(push) ; 4
(assert (not (=
  (Capacity ($Snap.combine
    ($SortWrappers.Seq<Int>To$Snap data@70@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@53@01)))
      ($Snap.combine
        ($SortWrappers.IntTo$Snap len@71@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@51@01)
  (Capacity ($Snap.first $t@53@01) this@51@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  (Capacity ($Snap.combine
    ($SortWrappers.Seq<Int>To$Snap data@70@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@53@01)))
      ($Snap.combine
        ($SortWrappers.IntTo$Snap len@71@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@51@01)
  (Capacity ($Snap.first $t@53@01) this@51@01)))
(pop) ; 3
(push) ; 3
; [else-branch: 27 | First:(Second:(First:($t@53@01))) + First:(Second:(Second:(First:($t@53@01)))) < |First:(First:($t@53@01))|]
(assert (<
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@53@01))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@53@01))))))
  (Seq_length
    ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@53@01))))))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- Pop ----------
(declare-const this@76@01 $Ref)
(declare-const x@77@01 Int)
(declare-const this@78@01 $Ref)
(declare-const x@79@01 Int)
(push) ; 1
(declare-const $t@80@01 $Snap)
(assert (= $t@80@01 ($Snap.combine ($Snap.first $t@80@01) ($Snap.second $t@80@01))))
(assert (= ($Snap.second $t@80@01) $Snap.unit))
; [eval] Contents(this) != Seq(1)[1..]
; [eval] Contents(this)
(push) ; 2
(declare-const $k@81@01 $Perm)
(assert ($Perm.isReadVar $k@81@01))
(assert (< $k@81@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@81@01)))
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@81@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Contents%precondition ($Snap.first $t@80@01) this@78@01))
(pop) ; 2
; Joined path conditions
(assert ($Perm.isReadVar $k@81@01))
(assert (and
  (< $k@81@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@81@01))
  (Contents%precondition ($Snap.first $t@80@01) this@78@01)))
; [eval] Seq(1)[1..]
; [eval] Seq(1)
(assert (= (Seq_length (Seq_singleton 1)) 1))
(assert (not
  (Seq_equal
    (Contents ($Snap.first $t@80@01) this@78@01)
    (Seq_drop (Seq_singleton 1) 1))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@82@01 $Snap)
(assert (= $t@82@01 ($Snap.combine ($Snap.first $t@82@01) ($Snap.second $t@82@01))))
(assert (=
  ($Snap.second $t@82@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@82@01))
    ($Snap.second ($Snap.second $t@82@01)))))
(assert (= ($Snap.first ($Snap.second $t@82@01)) $Snap.unit))
; [eval] x == old(Contents(this))[0]
; [eval] old(Contents(this))[0]
; [eval] old(Contents(this))
; [eval] Contents(this)
(push) ; 3
(declare-const $k@83@01 $Perm)
(assert ($Perm.isReadVar $k@83@01))
(assert (< $k@83@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@83@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@83@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@83@01))
(assert (and (< $k@83@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@83@01))))
(set-option :timeout 0)
(push) ; 3
(assert (not (< 0 (Seq_length (Contents ($Snap.first $t@80@01) this@78@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= x@79@01 (Seq_index (Contents ($Snap.first $t@80@01) this@78@01) 0)))
(assert (=
  ($Snap.second ($Snap.second $t@82@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@82@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@82@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@82@01))) $Snap.unit))
; [eval] Contents(this) == old(Contents(this))[1..]
; [eval] Contents(this)
(push) ; 3
(declare-const $k@84@01 $Perm)
(assert ($Perm.isReadVar $k@84@01))
(assert (< $k@84@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@84@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@84@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Contents%precondition ($Snap.first $t@82@01) this@78@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@84@01))
(assert (and
  (< $k@84@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@84@01))
  (Contents%precondition ($Snap.first $t@82@01) this@78@01)))
; [eval] old(Contents(this))[1..]
; [eval] old(Contents(this))
; [eval] Contents(this)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@85@01 $Perm)
(assert ($Perm.isReadVar $k@85@01))
(assert (< $k@85@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@85@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@85@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@85@01))
(assert (and (< $k@85@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@85@01))))
(assert (Seq_equal
  (Contents ($Snap.first $t@82@01) this@78@01)
  (Seq_drop (Contents ($Snap.first $t@80@01) this@78@01) 1)))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@82@01))) $Snap.unit))
; [eval] Capacity(this) == old(Capacity(this))
; [eval] Capacity(this)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@86@01 $Perm)
(assert ($Perm.isReadVar $k@86@01))
(assert (< $k@86@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@86@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@86@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Capacity%precondition ($Snap.first $t@82@01) this@78@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@86@01))
(assert (and
  (< $k@86@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@86@01))
  (Capacity%precondition ($Snap.first $t@82@01) this@78@01)))
; [eval] old(Capacity(this))
; [eval] Capacity(this)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@87@01 $Perm)
(assert ($Perm.isReadVar $k@87@01))
(assert (< $k@87@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@87@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@87@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Capacity%precondition ($Snap.first $t@80@01) this@78@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@87@01))
(assert (and
  (< $k@87@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@87@01))
  (Capacity%precondition ($Snap.first $t@80@01) this@78@01)))
(assert (=
  (Capacity ($Snap.first $t@82@01) this@78@01)
  (Capacity ($Snap.first $t@80@01) this@78@01)))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; unfold acc(Valid(this), write)
(assert (=
  ($Snap.first $t@80@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@80@01))
    ($Snap.second ($Snap.first $t@80@01)))))
(assert (not (= this@78@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.first $t@80@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@80@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@80@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first $t@80@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@80@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@80@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@80@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@80@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@80@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@80@01)))))
  $Snap.unit))
; [eval] 0 <= this.first
(assert (<=
  0
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@80@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@80@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@80@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@80@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@80@01))))))
  $Snap.unit))
; [eval] 0 <= this.len
(assert (<=
  0
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@80@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@80@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@80@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@80@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@80@01)))))))
  $Snap.unit))
; [eval] |this.data| == 0 ==> this.len == 0 && this.first == 0
; [eval] |this.data| == 0
; [eval] |this.data|
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    (Seq_length
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01))))
    0))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 31 | |First:(First:($t@80@01))| == 0 | dead]
; [else-branch: 31 | |First:(First:($t@80@01))| != 0 | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 31 | |First:(First:($t@80@01))| != 0]
(assert (not
  (=
    (Seq_length
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01))))
    0)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (not
  (=
    (Seq_length
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01))))
    0)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@80@01)))))))
  $Snap.unit))
; [eval] |this.data| > 0 ==> this.len <= |this.data| && this.first < |this.data|
; [eval] |this.data| > 0
; [eval] |this.data|
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (>
    (Seq_length
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01))))
    0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (>
  (Seq_length
    ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01))))
  0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 32 | |First:(First:($t@80@01))| > 0 | live]
; [else-branch: 32 | !(|First:(First:($t@80@01))| > 0) | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 32 | |First:(First:($t@80@01))| > 0]
(assert (>
  (Seq_length
    ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01))))
  0))
; [eval] this.len <= |this.data| && this.first < |this.data|
; [eval] this.len <= |this.data|
; [eval] |this.data|
(push) ; 5
; [then-branch: 33 | !(First:(Second:(Second:(First:($t@80@01)))) <= |First:(First:($t@80@01))|) | live]
; [else-branch: 33 | First:(Second:(Second:(First:($t@80@01)))) <= |First:(First:($t@80@01))| | live]
(push) ; 6
; [then-branch: 33 | !(First:(Second:(Second:(First:($t@80@01)))) <= |First:(First:($t@80@01))|)]
(assert (not
  (<=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@80@01)))))
    (Seq_length
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01)))))))
(pop) ; 6
(push) ; 6
; [else-branch: 33 | First:(Second:(Second:(First:($t@80@01)))) <= |First:(First:($t@80@01))|]
(assert (<=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@80@01)))))
  (Seq_length
    ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01))))))
; [eval] this.first < |this.data|
; [eval] |this.data|
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (<=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@80@01)))))
    (Seq_length
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01)))))
  (not
    (<=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@80@01)))))
      (Seq_length
        ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (>
    (Seq_length
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01))))
    0)
  (and
    (>
      (Seq_length
        ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01))))
      0)
    (or
      (<=
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@80@01)))))
        (Seq_length
          ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01)))))
      (not
        (<=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@80@01)))))
          (Seq_length
            ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01))))))))))
(assert (>
  (Seq_length
    ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01))))
  0))
(assert (=>
  (>
    (Seq_length
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01))))
    0)
  (and
    (<=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@80@01)))))
      (Seq_length
        ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01)))))
    (<
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@80@01))))
      (Seq_length
        ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01))))))))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Valid%trigger ($Snap.first $t@80@01) this@78@01))
; [exec]
; x := this.data[this.first]
; [eval] this.data[this.first]
(set-option :timeout 0)
(push) ; 3
(assert (not (>=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@80@01))))
  0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (<
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@80@01))))
  (Seq_length
    ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01)))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const x@88@01 Int)
(assert (=
  x@88@01
  (Seq_index
    ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01)))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@80@01)))))))
; [eval] this.first + 1 == |this.data|
; [eval] this.first + 1
; [eval] |this.data|
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    (+
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@80@01))))
      1)
    (Seq_length
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01))))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@80@01))))
    1)
  (Seq_length
    ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01)))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 34 | First:(Second:(First:($t@80@01))) + 1 == |First:(First:($t@80@01))| | live]
; [else-branch: 34 | First:(Second:(First:($t@80@01))) + 1 != |First:(First:($t@80@01))| | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 34 | First:(Second:(First:($t@80@01))) + 1 == |First:(First:($t@80@01))|]
(assert (=
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@80@01))))
    1)
  (Seq_length
    ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01))))))
; [exec]
; this.first := 0
; [exec]
; this.len := this.len - 1
; [eval] this.len - 1
(declare-const len@89@01 Int)
(assert (=
  len@89@01
  (-
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@80@01)))))
    1)))
; [exec]
; fold acc(Valid(this), write)
; [eval] 0 <= this.first
; [eval] 0 <= this.len
(push) ; 4
(assert (not (<= 0 len@89@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 len@89@01))
; [eval] |this.data| == 0 ==> this.len == 0 && this.first == 0
; [eval] |this.data| == 0
; [eval] |this.data|
(push) ; 4
; [then-branch: 35 | |First:(First:($t@80@01))| == 0 | dead]
; [else-branch: 35 | |First:(First:($t@80@01))| != 0 | live]
(push) ; 5
; [else-branch: 35 | |First:(First:($t@80@01))| != 0]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [eval] |this.data| > 0 ==> this.len <= |this.data| && this.first < |this.data|
; [eval] |this.data| > 0
; [eval] |this.data|
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (>
    (Seq_length
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01))))
    0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 36 | |First:(First:($t@80@01))| > 0 | live]
; [else-branch: 36 | !(|First:(First:($t@80@01))| > 0) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 36 | |First:(First:($t@80@01))| > 0]
; [eval] this.len <= |this.data| && this.first < |this.data|
; [eval] this.len <= |this.data|
; [eval] |this.data|
(push) ; 6
; [then-branch: 37 | !(len@89@01 <= |First:(First:($t@80@01))|) | live]
; [else-branch: 37 | len@89@01 <= |First:(First:($t@80@01))| | live]
(push) ; 7
; [then-branch: 37 | !(len@89@01 <= |First:(First:($t@80@01))|)]
(assert (not
  (<=
    len@89@01
    (Seq_length
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01)))))))
(pop) ; 7
(push) ; 7
; [else-branch: 37 | len@89@01 <= |First:(First:($t@80@01))|]
(assert (<=
  len@89@01
  (Seq_length
    ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01))))))
; [eval] this.first < |this.data|
; [eval] |this.data|
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (<=
    len@89@01
    (Seq_length
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01)))))
  (not
    (<=
      len@89@01
      (Seq_length
        ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (>
    (Seq_length
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01))))
    0)
  (or
    (<=
      len@89@01
      (Seq_length
        ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01)))))
    (not
      (<=
        len@89@01
        (Seq_length
          ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01)))))))))
(push) ; 4
(assert (not (=>
  (>
    (Seq_length
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01))))
    0)
  (and
    (<=
      len@89@01
      (Seq_length
        ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01)))))
    (<
      0
      (Seq_length
        ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01)))))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (>
    (Seq_length
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01))))
    0)
  (and
    (<=
      len@89@01
      (Seq_length
        ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01)))))
    (<
      0
      (Seq_length
        ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01))))))))
(assert (Valid%trigger ($Snap.combine
  ($Snap.first ($Snap.first $t@80@01))
  ($Snap.combine
    ($SortWrappers.IntTo$Snap 0)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap len@89@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@78@01))
; [eval] x == old(Contents(this))[0]
; [eval] old(Contents(this))[0]
; [eval] old(Contents(this))
; [eval] Contents(this)
(push) ; 4
(declare-const $k@90@01 $Perm)
(assert ($Perm.isReadVar $k@90@01))
(assert (< $k@90@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@90@01)))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@90@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@90@01))
(assert (and (< $k@90@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@90@01))))
(set-option :timeout 0)
(push) ; 4
(assert (not (< 0 (Seq_length (Contents ($Snap.first $t@80@01) this@78@01)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (= x@88@01 (Seq_index (Contents ($Snap.first $t@80@01) this@78@01) 0))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (= x@88@01 (Seq_index (Contents ($Snap.first $t@80@01) this@78@01) 0)))
; [eval] Contents(this) == old(Contents(this))[1..]
; [eval] Contents(this)
(push) ; 4
(declare-const $k@91@01 $Perm)
(assert ($Perm.isReadVar $k@91@01))
(assert (< $k@91@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@91@01)))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@91@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (Contents%precondition ($Snap.combine
  ($Snap.first ($Snap.first $t@80@01))
  ($Snap.combine
    ($SortWrappers.IntTo$Snap 0)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap len@89@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@78@01))
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@91@01))
(assert (and
  (< $k@91@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@91@01))
  (Contents%precondition ($Snap.combine
    ($Snap.first ($Snap.first $t@80@01))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 0)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap len@89@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@78@01)))
; [eval] old(Contents(this))[1..]
; [eval] old(Contents(this))
; [eval] Contents(this)
(set-option :timeout 0)
(push) ; 4
(declare-const $k@92@01 $Perm)
(assert ($Perm.isReadVar $k@92@01))
(assert (< $k@92@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@92@01)))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@92@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@92@01))
(assert (and (< $k@92@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@92@01))))
(set-option :timeout 0)
(push) ; 4
(assert (not (Seq_equal
  (Contents ($Snap.combine
    ($Snap.first ($Snap.first $t@80@01))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 0)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap len@89@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@78@01)
  (Seq_drop (Contents ($Snap.first $t@80@01) this@78@01) 1))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (Contents ($Snap.combine
    ($Snap.first ($Snap.first $t@80@01))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 0)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap len@89@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@78@01)
  (Seq_drop (Contents ($Snap.first $t@80@01) this@78@01) 1)))
; [eval] Capacity(this) == old(Capacity(this))
; [eval] Capacity(this)
(push) ; 4
(declare-const $k@93@01 $Perm)
(assert ($Perm.isReadVar $k@93@01))
(assert (< $k@93@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@93@01)))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@93@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (Capacity%precondition ($Snap.combine
  ($Snap.first ($Snap.first $t@80@01))
  ($Snap.combine
    ($SortWrappers.IntTo$Snap 0)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap len@89@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@78@01))
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@93@01))
(assert (and
  (< $k@93@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@93@01))
  (Capacity%precondition ($Snap.combine
    ($Snap.first ($Snap.first $t@80@01))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 0)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap len@89@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@78@01)))
; [eval] old(Capacity(this))
; [eval] Capacity(this)
(set-option :timeout 0)
(push) ; 4
(declare-const $k@94@01 $Perm)
(assert ($Perm.isReadVar $k@94@01))
(assert (< $k@94@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@94@01)))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@94@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (Capacity%precondition ($Snap.first $t@80@01) this@78@01))
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@94@01))
(assert (and
  (< $k@94@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@94@01))
  (Capacity%precondition ($Snap.first $t@80@01) this@78@01)))
(set-option :timeout 0)
(push) ; 4
(assert (not (=
  (Capacity ($Snap.combine
    ($Snap.first ($Snap.first $t@80@01))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 0)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap len@89@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@78@01)
  (Capacity ($Snap.first $t@80@01) this@78@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  (Capacity ($Snap.combine
    ($Snap.first ($Snap.first $t@80@01))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 0)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap len@89@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@78@01)
  (Capacity ($Snap.first $t@80@01) this@78@01)))
(pop) ; 3
(push) ; 3
; [else-branch: 34 | First:(Second:(First:($t@80@01))) + 1 != |First:(First:($t@80@01))|]
(assert (not
  (=
    (+
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@80@01))))
      1)
    (Seq_length
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01)))))))
(pop) ; 3
; [eval] !(this.first + 1 == |this.data|)
; [eval] this.first + 1 == |this.data|
; [eval] this.first + 1
; [eval] |this.data|
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@80@01))))
    1)
  (Seq_length
    ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01)))))))
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
    (+
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@80@01))))
      1)
    (Seq_length
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01))))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 38 | First:(Second:(First:($t@80@01))) + 1 != |First:(First:($t@80@01))| | live]
; [else-branch: 38 | First:(Second:(First:($t@80@01))) + 1 == |First:(First:($t@80@01))| | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 38 | First:(Second:(First:($t@80@01))) + 1 != |First:(First:($t@80@01))|]
(assert (not
  (=
    (+
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@80@01))))
      1)
    (Seq_length
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01)))))))
; [exec]
; this.first := this.first + 1
; [eval] this.first + 1
(declare-const first@95@01 Int)
(assert (=
  first@95@01
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@80@01))))
    1)))
; [exec]
; this.len := this.len - 1
; [eval] this.len - 1
(declare-const len@96@01 Int)
(assert (=
  len@96@01
  (-
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@80@01)))))
    1)))
; [exec]
; fold acc(Valid(this), write)
; [eval] 0 <= this.first
(push) ; 4
(assert (not (<= 0 first@95@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 first@95@01))
; [eval] 0 <= this.len
(push) ; 4
(assert (not (<= 0 len@96@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 len@96@01))
; [eval] |this.data| == 0 ==> this.len == 0 && this.first == 0
; [eval] |this.data| == 0
; [eval] |this.data|
(push) ; 4
; [then-branch: 39 | |First:(First:($t@80@01))| == 0 | dead]
; [else-branch: 39 | |First:(First:($t@80@01))| != 0 | live]
(push) ; 5
; [else-branch: 39 | |First:(First:($t@80@01))| != 0]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [eval] |this.data| > 0 ==> this.len <= |this.data| && this.first < |this.data|
; [eval] |this.data| > 0
; [eval] |this.data|
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (>
    (Seq_length
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01))))
    0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 40 | |First:(First:($t@80@01))| > 0 | live]
; [else-branch: 40 | !(|First:(First:($t@80@01))| > 0) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 40 | |First:(First:($t@80@01))| > 0]
; [eval] this.len <= |this.data| && this.first < |this.data|
; [eval] this.len <= |this.data|
; [eval] |this.data|
(push) ; 6
; [then-branch: 41 | !(len@96@01 <= |First:(First:($t@80@01))|) | live]
; [else-branch: 41 | len@96@01 <= |First:(First:($t@80@01))| | live]
(push) ; 7
; [then-branch: 41 | !(len@96@01 <= |First:(First:($t@80@01))|)]
(assert (not
  (<=
    len@96@01
    (Seq_length
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01)))))))
(pop) ; 7
(push) ; 7
; [else-branch: 41 | len@96@01 <= |First:(First:($t@80@01))|]
(assert (<=
  len@96@01
  (Seq_length
    ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01))))))
; [eval] this.first < |this.data|
; [eval] |this.data|
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (<=
    len@96@01
    (Seq_length
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01)))))
  (not
    (<=
      len@96@01
      (Seq_length
        ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (>
    (Seq_length
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01))))
    0)
  (or
    (<=
      len@96@01
      (Seq_length
        ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01)))))
    (not
      (<=
        len@96@01
        (Seq_length
          ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01)))))))))
(push) ; 4
(assert (not (=>
  (>
    (Seq_length
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01))))
    0)
  (and
    (<=
      len@96@01
      (Seq_length
        ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01)))))
    (<
      first@95@01
      (Seq_length
        ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01)))))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (>
    (Seq_length
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01))))
    0)
  (and
    (<=
      len@96@01
      (Seq_length
        ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01)))))
    (<
      first@95@01
      (Seq_length
        ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01))))))))
(assert (Valid%trigger ($Snap.combine
  ($Snap.first ($Snap.first $t@80@01))
  ($Snap.combine
    ($SortWrappers.IntTo$Snap first@95@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap len@96@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@78@01))
; [eval] x == old(Contents(this))[0]
; [eval] old(Contents(this))[0]
; [eval] old(Contents(this))
; [eval] Contents(this)
(push) ; 4
(declare-const $k@97@01 $Perm)
(assert ($Perm.isReadVar $k@97@01))
(assert (< $k@97@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@97@01)))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@97@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@97@01))
(assert (and (< $k@97@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@97@01))))
(set-option :timeout 0)
(push) ; 4
(assert (not (< 0 (Seq_length (Contents ($Snap.first $t@80@01) this@78@01)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (= x@88@01 (Seq_index (Contents ($Snap.first $t@80@01) this@78@01) 0))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (= x@88@01 (Seq_index (Contents ($Snap.first $t@80@01) this@78@01) 0)))
; [eval] Contents(this) == old(Contents(this))[1..]
; [eval] Contents(this)
(push) ; 4
(declare-const $k@98@01 $Perm)
(assert ($Perm.isReadVar $k@98@01))
(assert (< $k@98@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@98@01)))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@98@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (Contents%precondition ($Snap.combine
  ($Snap.first ($Snap.first $t@80@01))
  ($Snap.combine
    ($SortWrappers.IntTo$Snap first@95@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap len@96@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@78@01))
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@98@01))
(assert (and
  (< $k@98@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@98@01))
  (Contents%precondition ($Snap.combine
    ($Snap.first ($Snap.first $t@80@01))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap first@95@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap len@96@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@78@01)))
; [eval] old(Contents(this))[1..]
; [eval] old(Contents(this))
; [eval] Contents(this)
(set-option :timeout 0)
(push) ; 4
(declare-const $k@99@01 $Perm)
(assert ($Perm.isReadVar $k@99@01))
(assert (< $k@99@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@99@01)))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@99@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@99@01))
(assert (and (< $k@99@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@99@01))))
(set-option :timeout 0)
(push) ; 4
(assert (not (Seq_equal
  (Contents ($Snap.combine
    ($Snap.first ($Snap.first $t@80@01))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap first@95@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap len@96@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@78@01)
  (Seq_drop (Contents ($Snap.first $t@80@01) this@78@01) 1))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (Contents ($Snap.combine
    ($Snap.first ($Snap.first $t@80@01))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap first@95@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap len@96@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@78@01)
  (Seq_drop (Contents ($Snap.first $t@80@01) this@78@01) 1)))
; [eval] Capacity(this) == old(Capacity(this))
; [eval] Capacity(this)
(push) ; 4
(declare-const $k@100@01 $Perm)
(assert ($Perm.isReadVar $k@100@01))
(assert (< $k@100@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@100@01)))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@100@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (Capacity%precondition ($Snap.combine
  ($Snap.first ($Snap.first $t@80@01))
  ($Snap.combine
    ($SortWrappers.IntTo$Snap first@95@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap len@96@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@78@01))
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@100@01))
(assert (and
  (< $k@100@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@100@01))
  (Capacity%precondition ($Snap.combine
    ($Snap.first ($Snap.first $t@80@01))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap first@95@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap len@96@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@78@01)))
; [eval] old(Capacity(this))
; [eval] Capacity(this)
(set-option :timeout 0)
(push) ; 4
(declare-const $k@101@01 $Perm)
(assert ($Perm.isReadVar $k@101@01))
(assert (< $k@101@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@101@01)))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@101@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (Capacity%precondition ($Snap.first $t@80@01) this@78@01))
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@101@01))
(assert (and
  (< $k@101@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@101@01))
  (Capacity%precondition ($Snap.first $t@80@01) this@78@01)))
(set-option :timeout 0)
(push) ; 4
(assert (not (=
  (Capacity ($Snap.combine
    ($Snap.first ($Snap.first $t@80@01))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap first@95@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap len@96@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@78@01)
  (Capacity ($Snap.first $t@80@01) this@78@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  (Capacity ($Snap.combine
    ($Snap.first ($Snap.first $t@80@01))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap first@95@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap len@96@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit)))))) this@78@01)
  (Capacity ($Snap.first $t@80@01) this@78@01)))
(pop) ; 3
(push) ; 3
; [else-branch: 38 | First:(Second:(First:($t@80@01))) + 1 == |First:(First:($t@80@01))|]
(assert (=
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@80@01))))
    1)
  (Seq_length
    ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first $t@80@01))))))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- TestHarness ----------
(declare-const x@102@01 Int)
(declare-const y@103@01 Int)
(declare-const z@104@01 Int)
(declare-const x@105@01 Int)
(declare-const y@106@01 Int)
(declare-const z@107@01 Int)
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
; var b: Ref
(declare-const b@108@01 $Ref)
; [exec]
; var h: Int
(declare-const h@109@01 Int)
; [exec]
; b := new(data, first, len)
(declare-const b@110@01 $Ref)
(assert (not (= b@110@01 $Ref.null)))
(declare-const data@111@01 Seq<Int>)
(declare-const first@112@01 Int)
(declare-const len@113@01 Int)
(assert (not (= b@110@01 b@108@01)))
; [exec]
; Create(b, 2)
; [eval] 0 <= n
(declare-const $t@114@01 $Snap)
(assert (= $t@114@01 ($Snap.combine ($Snap.first $t@114@01) ($Snap.second $t@114@01))))
(assert (=
  ($Snap.second $t@114@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@114@01))
    ($Snap.second ($Snap.second $t@114@01)))))
(assert (= ($Snap.first ($Snap.second $t@114@01)) $Snap.unit))
; [eval] Contents(this) == Seq[Int]()
; [eval] Contents(this)
(push) ; 3
(declare-const $k@115@01 $Perm)
(assert ($Perm.isReadVar $k@115@01))
(assert (< $k@115@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@115@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@115@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Contents%precondition ($Snap.first $t@114@01) b@110@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@115@01))
(assert (and
  (< $k@115@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@115@01))
  (Contents%precondition ($Snap.first $t@114@01) b@110@01)))
; [eval] Seq[Int]()
(assert (Seq_equal (Contents ($Snap.first $t@114@01) b@110@01) (as Seq_empty  Seq<Int>)))
(assert (= ($Snap.second ($Snap.second $t@114@01)) $Snap.unit))
; [eval] Capacity(this) == n
; [eval] Capacity(this)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@116@01 $Perm)
(assert ($Perm.isReadVar $k@116@01))
(assert (< $k@116@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@116@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@116@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Capacity%precondition ($Snap.first $t@114@01) b@110@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@116@01))
(assert (and
  (< $k@116@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@116@01))
  (Capacity%precondition ($Snap.first $t@114@01) b@110@01)))
(assert (= (Capacity ($Snap.first $t@114@01) b@110@01) 2))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; Push(b, x)
; [eval] |Contents(this)| != Capacity(this)
; [eval] |Contents(this)|
; [eval] Contents(this)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@117@01 $Perm)
(assert ($Perm.isReadVar $k@117@01))
(assert (< $k@117@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@117@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@117@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@117@01))
(assert (and (< $k@117@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@117@01))))
; [eval] Capacity(this)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@118@01 $Perm)
(assert ($Perm.isReadVar $k@118@01))
(assert (< $k@118@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@118@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@118@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@118@01))
(assert (and (< $k@118@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@118@01))))
(set-option :timeout 0)
(push) ; 3
(assert (not (not
  (=
    (Seq_length (Contents ($Snap.first $t@114@01) b@110@01))
    (Capacity ($Snap.first $t@114@01) b@110@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    (Seq_length (Contents ($Snap.first $t@114@01) b@110@01))
    (Capacity ($Snap.first $t@114@01) b@110@01))))
(declare-const $t@119@01 $Snap)
(assert (= $t@119@01 ($Snap.combine ($Snap.first $t@119@01) ($Snap.second $t@119@01))))
(assert (=
  ($Snap.second $t@119@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@119@01))
    ($Snap.second ($Snap.second $t@119@01)))))
(assert (= ($Snap.first ($Snap.second $t@119@01)) $Snap.unit))
; [eval] Contents(this) == old(Contents(this)) ++ Seq(x)
; [eval] Contents(this)
(push) ; 3
(declare-const $k@120@01 $Perm)
(assert ($Perm.isReadVar $k@120@01))
(assert (< $k@120@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@120@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@120@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Contents%precondition ($Snap.first $t@119@01) b@110@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@120@01))
(assert (and
  (< $k@120@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@120@01))
  (Contents%precondition ($Snap.first $t@119@01) b@110@01)))
; [eval] old(Contents(this)) ++ Seq(x)
; [eval] old(Contents(this))
; [eval] Contents(this)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@121@01 $Perm)
(assert ($Perm.isReadVar $k@121@01))
(assert (< $k@121@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@121@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@121@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@121@01))
(assert (and (< $k@121@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@121@01))))
; [eval] Seq(x)
(assert (= (Seq_length (Seq_singleton x@105@01)) 1))
(assert (Seq_equal
  (Contents ($Snap.first $t@119@01) b@110@01)
  (Seq_append
    (Contents ($Snap.first $t@114@01) b@110@01)
    (Seq_singleton x@105@01))))
(assert (= ($Snap.second ($Snap.second $t@119@01)) $Snap.unit))
; [eval] Capacity(this) == old(Capacity(this))
; [eval] Capacity(this)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@122@01 $Perm)
(assert ($Perm.isReadVar $k@122@01))
(assert (< $k@122@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@122@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@122@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Capacity%precondition ($Snap.first $t@119@01) b@110@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@122@01))
(assert (and
  (< $k@122@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@122@01))
  (Capacity%precondition ($Snap.first $t@119@01) b@110@01)))
; [eval] old(Capacity(this))
; [eval] Capacity(this)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@123@01 $Perm)
(assert ($Perm.isReadVar $k@123@01))
(assert (< $k@123@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@123@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@123@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@123@01))
(assert (and (< $k@123@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@123@01))))
(assert (=
  (Capacity ($Snap.first $t@119@01) b@110@01)
  (Capacity ($Snap.first $t@114@01) b@110@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; Push(b, y)
; [eval] |Contents(this)| != Capacity(this)
; [eval] |Contents(this)|
; [eval] Contents(this)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@124@01 $Perm)
(assert ($Perm.isReadVar $k@124@01))
(assert (< $k@124@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@124@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@124@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@124@01))
(assert (and (< $k@124@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@124@01))))
; [eval] Capacity(this)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@125@01 $Perm)
(assert ($Perm.isReadVar $k@125@01))
(assert (< $k@125@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@125@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@125@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@125@01))
(assert (and (< $k@125@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@125@01))))
(set-option :timeout 0)
(push) ; 3
(assert (not (not
  (=
    (Seq_length (Contents ($Snap.first $t@119@01) b@110@01))
    (Capacity ($Snap.first $t@119@01) b@110@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    (Seq_length (Contents ($Snap.first $t@119@01) b@110@01))
    (Capacity ($Snap.first $t@119@01) b@110@01))))
(declare-const $t@126@01 $Snap)
(assert (= $t@126@01 ($Snap.combine ($Snap.first $t@126@01) ($Snap.second $t@126@01))))
(assert (=
  ($Snap.second $t@126@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@126@01))
    ($Snap.second ($Snap.second $t@126@01)))))
(assert (= ($Snap.first ($Snap.second $t@126@01)) $Snap.unit))
; [eval] Contents(this) == old(Contents(this)) ++ Seq(x)
; [eval] Contents(this)
(push) ; 3
(declare-const $k@127@01 $Perm)
(assert ($Perm.isReadVar $k@127@01))
(assert (< $k@127@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@127@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@127@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Contents%precondition ($Snap.first $t@126@01) b@110@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@127@01))
(assert (and
  (< $k@127@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@127@01))
  (Contents%precondition ($Snap.first $t@126@01) b@110@01)))
; [eval] old(Contents(this)) ++ Seq(x)
; [eval] old(Contents(this))
; [eval] Contents(this)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@128@01 $Perm)
(assert ($Perm.isReadVar $k@128@01))
(assert (< $k@128@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@128@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@128@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@128@01))
(assert (and (< $k@128@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@128@01))))
; [eval] Seq(x)
(assert (= (Seq_length (Seq_singleton y@106@01)) 1))
(assert (Seq_equal
  (Contents ($Snap.first $t@126@01) b@110@01)
  (Seq_append
    (Contents ($Snap.first $t@119@01) b@110@01)
    (Seq_singleton y@106@01))))
(assert (= ($Snap.second ($Snap.second $t@126@01)) $Snap.unit))
; [eval] Capacity(this) == old(Capacity(this))
; [eval] Capacity(this)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@129@01 $Perm)
(assert ($Perm.isReadVar $k@129@01))
(assert (< $k@129@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@129@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@129@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Capacity%precondition ($Snap.first $t@126@01) b@110@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@129@01))
(assert (and
  (< $k@129@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@129@01))
  (Capacity%precondition ($Snap.first $t@126@01) b@110@01)))
; [eval] old(Capacity(this))
; [eval] Capacity(this)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@130@01 $Perm)
(assert ($Perm.isReadVar $k@130@01))
(assert (< $k@130@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@130@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@130@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@130@01))
(assert (and (< $k@130@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@130@01))))
(assert (=
  (Capacity ($Snap.first $t@126@01) b@110@01)
  (Capacity ($Snap.first $t@119@01) b@110@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; h := Pop(b)
; [eval] Contents(this) != Seq(1)[1..]
; [eval] Contents(this)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@131@01 $Perm)
(assert ($Perm.isReadVar $k@131@01))
(assert (< $k@131@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@131@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@131@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@131@01))
(assert (and (< $k@131@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@131@01))))
; [eval] Seq(1)[1..]
; [eval] Seq(1)
(assert (= (Seq_length (Seq_singleton 1)) 1))
(set-option :timeout 0)
(push) ; 3
(assert (not (not
  (Seq_equal
    (Contents ($Snap.first $t@126@01) b@110@01)
    (Seq_drop (Seq_singleton 1) 1)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not
  (Seq_equal
    (Contents ($Snap.first $t@126@01) b@110@01)
    (Seq_drop (Seq_singleton 1) 1))))
(declare-const x@132@01 Int)
(declare-const $t@133@01 $Snap)
(assert (= $t@133@01 ($Snap.combine ($Snap.first $t@133@01) ($Snap.second $t@133@01))))
(assert (=
  ($Snap.second $t@133@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@133@01))
    ($Snap.second ($Snap.second $t@133@01)))))
(assert (= ($Snap.first ($Snap.second $t@133@01)) $Snap.unit))
; [eval] x == old(Contents(this))[0]
; [eval] old(Contents(this))[0]
; [eval] old(Contents(this))
; [eval] Contents(this)
(push) ; 3
(declare-const $k@134@01 $Perm)
(assert ($Perm.isReadVar $k@134@01))
(assert (< $k@134@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@134@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@134@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@134@01))
(assert (and (< $k@134@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@134@01))))
(set-option :timeout 0)
(push) ; 3
(assert (not (< 0 (Seq_length (Contents ($Snap.first $t@126@01) b@110@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= x@132@01 (Seq_index (Contents ($Snap.first $t@126@01) b@110@01) 0)))
(assert (=
  ($Snap.second ($Snap.second $t@133@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@133@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@133@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@133@01))) $Snap.unit))
; [eval] Contents(this) == old(Contents(this))[1..]
; [eval] Contents(this)
(push) ; 3
(declare-const $k@135@01 $Perm)
(assert ($Perm.isReadVar $k@135@01))
(assert (< $k@135@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@135@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@135@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Contents%precondition ($Snap.first $t@133@01) b@110@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@135@01))
(assert (and
  (< $k@135@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@135@01))
  (Contents%precondition ($Snap.first $t@133@01) b@110@01)))
; [eval] old(Contents(this))[1..]
; [eval] old(Contents(this))
; [eval] Contents(this)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@136@01 $Perm)
(assert ($Perm.isReadVar $k@136@01))
(assert (< $k@136@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@136@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@136@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@136@01))
(assert (and (< $k@136@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@136@01))))
(assert (Seq_equal
  (Contents ($Snap.first $t@133@01) b@110@01)
  (Seq_drop (Contents ($Snap.first $t@126@01) b@110@01) 1)))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@133@01))) $Snap.unit))
; [eval] Capacity(this) == old(Capacity(this))
; [eval] Capacity(this)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@137@01 $Perm)
(assert ($Perm.isReadVar $k@137@01))
(assert (< $k@137@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@137@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@137@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Capacity%precondition ($Snap.first $t@133@01) b@110@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@137@01))
(assert (and
  (< $k@137@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@137@01))
  (Capacity%precondition ($Snap.first $t@133@01) b@110@01)))
; [eval] old(Capacity(this))
; [eval] Capacity(this)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@138@01 $Perm)
(assert ($Perm.isReadVar $k@138@01))
(assert (< $k@138@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@138@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@138@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@138@01))
(assert (and (< $k@138@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@138@01))))
(assert (=
  (Capacity ($Snap.first $t@133@01) b@110@01)
  (Capacity ($Snap.first $t@126@01) b@110@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; assert h == x
; [eval] h == x
(set-option :timeout 0)
(push) ; 3
(assert (not (= x@132@01 x@105@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= x@132@01 x@105@01))
; [exec]
; Push(b, z)
; [eval] |Contents(this)| != Capacity(this)
; [eval] |Contents(this)|
; [eval] Contents(this)
(push) ; 3
(declare-const $k@139@01 $Perm)
(assert ($Perm.isReadVar $k@139@01))
(assert (< $k@139@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@139@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@139@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@139@01))
(assert (and (< $k@139@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@139@01))))
; [eval] Capacity(this)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@140@01 $Perm)
(assert ($Perm.isReadVar $k@140@01))
(assert (< $k@140@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@140@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@140@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@140@01))
(assert (and (< $k@140@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@140@01))))
(set-option :timeout 0)
(push) ; 3
(assert (not (not
  (=
    (Seq_length (Contents ($Snap.first $t@133@01) b@110@01))
    (Capacity ($Snap.first $t@133@01) b@110@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    (Seq_length (Contents ($Snap.first $t@133@01) b@110@01))
    (Capacity ($Snap.first $t@133@01) b@110@01))))
(declare-const $t@141@01 $Snap)
(assert (= $t@141@01 ($Snap.combine ($Snap.first $t@141@01) ($Snap.second $t@141@01))))
(assert (=
  ($Snap.second $t@141@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@141@01))
    ($Snap.second ($Snap.second $t@141@01)))))
(assert (= ($Snap.first ($Snap.second $t@141@01)) $Snap.unit))
; [eval] Contents(this) == old(Contents(this)) ++ Seq(x)
; [eval] Contents(this)
(push) ; 3
(declare-const $k@142@01 $Perm)
(assert ($Perm.isReadVar $k@142@01))
(assert (< $k@142@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@142@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@142@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Contents%precondition ($Snap.first $t@141@01) b@110@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@142@01))
(assert (and
  (< $k@142@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@142@01))
  (Contents%precondition ($Snap.first $t@141@01) b@110@01)))
; [eval] old(Contents(this)) ++ Seq(x)
; [eval] old(Contents(this))
; [eval] Contents(this)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@143@01 $Perm)
(assert ($Perm.isReadVar $k@143@01))
(assert (< $k@143@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@143@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@143@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@143@01))
(assert (and (< $k@143@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@143@01))))
; [eval] Seq(x)
(assert (= (Seq_length (Seq_singleton z@107@01)) 1))
(assert (Seq_equal
  (Contents ($Snap.first $t@141@01) b@110@01)
  (Seq_append
    (Contents ($Snap.first $t@133@01) b@110@01)
    (Seq_singleton z@107@01))))
(assert (= ($Snap.second ($Snap.second $t@141@01)) $Snap.unit))
; [eval] Capacity(this) == old(Capacity(this))
; [eval] Capacity(this)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@144@01 $Perm)
(assert ($Perm.isReadVar $k@144@01))
(assert (< $k@144@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@144@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@144@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Capacity%precondition ($Snap.first $t@141@01) b@110@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@144@01))
(assert (and
  (< $k@144@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@144@01))
  (Capacity%precondition ($Snap.first $t@141@01) b@110@01)))
; [eval] old(Capacity(this))
; [eval] Capacity(this)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@145@01 $Perm)
(assert ($Perm.isReadVar $k@145@01))
(assert (< $k@145@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@145@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@145@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@145@01))
(assert (and (< $k@145@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@145@01))))
(assert (=
  (Capacity ($Snap.first $t@141@01) b@110@01)
  (Capacity ($Snap.first $t@133@01) b@110@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; h := Pop(b)
; [eval] Contents(this) != Seq(1)[1..]
; [eval] Contents(this)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@146@01 $Perm)
(assert ($Perm.isReadVar $k@146@01))
(assert (< $k@146@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@146@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@146@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@146@01))
(assert (and (< $k@146@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@146@01))))
; [eval] Seq(1)[1..]
; [eval] Seq(1)
(set-option :timeout 0)
(push) ; 3
(assert (not (not
  (Seq_equal
    (Contents ($Snap.first $t@141@01) b@110@01)
    (Seq_drop (Seq_singleton 1) 1)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not
  (Seq_equal
    (Contents ($Snap.first $t@141@01) b@110@01)
    (Seq_drop (Seq_singleton 1) 1))))
(declare-const x@147@01 Int)
(declare-const $t@148@01 $Snap)
(assert (= $t@148@01 ($Snap.combine ($Snap.first $t@148@01) ($Snap.second $t@148@01))))
(assert (=
  ($Snap.second $t@148@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@148@01))
    ($Snap.second ($Snap.second $t@148@01)))))
(assert (= ($Snap.first ($Snap.second $t@148@01)) $Snap.unit))
; [eval] x == old(Contents(this))[0]
; [eval] old(Contents(this))[0]
; [eval] old(Contents(this))
; [eval] Contents(this)
(push) ; 3
(declare-const $k@149@01 $Perm)
(assert ($Perm.isReadVar $k@149@01))
(assert (< $k@149@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@149@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@149@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@149@01))
(assert (and (< $k@149@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@149@01))))
(set-option :timeout 0)
(push) ; 3
(assert (not (< 0 (Seq_length (Contents ($Snap.first $t@141@01) b@110@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= x@147@01 (Seq_index (Contents ($Snap.first $t@141@01) b@110@01) 0)))
(assert (=
  ($Snap.second ($Snap.second $t@148@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@148@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@148@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@148@01))) $Snap.unit))
; [eval] Contents(this) == old(Contents(this))[1..]
; [eval] Contents(this)
(push) ; 3
(declare-const $k@150@01 $Perm)
(assert ($Perm.isReadVar $k@150@01))
(assert (< $k@150@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@150@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@150@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Contents%precondition ($Snap.first $t@148@01) b@110@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@150@01))
(assert (and
  (< $k@150@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@150@01))
  (Contents%precondition ($Snap.first $t@148@01) b@110@01)))
; [eval] old(Contents(this))[1..]
; [eval] old(Contents(this))
; [eval] Contents(this)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@151@01 $Perm)
(assert ($Perm.isReadVar $k@151@01))
(assert (< $k@151@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@151@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@151@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@151@01))
(assert (and (< $k@151@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@151@01))))
(assert (Seq_equal
  (Contents ($Snap.first $t@148@01) b@110@01)
  (Seq_drop (Contents ($Snap.first $t@141@01) b@110@01) 1)))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@148@01))) $Snap.unit))
; [eval] Capacity(this) == old(Capacity(this))
; [eval] Capacity(this)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@152@01 $Perm)
(assert ($Perm.isReadVar $k@152@01))
(assert (< $k@152@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@152@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@152@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Capacity%precondition ($Snap.first $t@148@01) b@110@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@152@01))
(assert (and
  (< $k@152@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@152@01))
  (Capacity%precondition ($Snap.first $t@148@01) b@110@01)))
; [eval] old(Capacity(this))
; [eval] Capacity(this)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@153@01 $Perm)
(assert ($Perm.isReadVar $k@153@01))
(assert (< $k@153@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@153@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@153@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@153@01))
(assert (and (< $k@153@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@153@01))))
(assert (=
  (Capacity ($Snap.first $t@148@01) b@110@01)
  (Capacity ($Snap.first $t@141@01) b@110@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; assert h == y
; [eval] h == y
(set-option :timeout 0)
(push) ; 3
(assert (not (= x@147@01 y@106@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= x@147@01 y@106@01))
; [exec]
; h := Pop(b)
; [eval] Contents(this) != Seq(1)[1..]
; [eval] Contents(this)
(push) ; 3
(declare-const $k@154@01 $Perm)
(assert ($Perm.isReadVar $k@154@01))
(assert (< $k@154@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@154@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@154@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@154@01))
(assert (and (< $k@154@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@154@01))))
; [eval] Seq(1)[1..]
; [eval] Seq(1)
(set-option :timeout 0)
(push) ; 3
(assert (not (not
  (Seq_equal
    (Contents ($Snap.first $t@148@01) b@110@01)
    (Seq_drop (Seq_singleton 1) 1)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not
  (Seq_equal
    (Contents ($Snap.first $t@148@01) b@110@01)
    (Seq_drop (Seq_singleton 1) 1))))
(declare-const x@155@01 Int)
(declare-const $t@156@01 $Snap)
(assert (= $t@156@01 ($Snap.combine ($Snap.first $t@156@01) ($Snap.second $t@156@01))))
(assert (=
  ($Snap.second $t@156@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@156@01))
    ($Snap.second ($Snap.second $t@156@01)))))
(assert (= ($Snap.first ($Snap.second $t@156@01)) $Snap.unit))
; [eval] x == old(Contents(this))[0]
; [eval] old(Contents(this))[0]
; [eval] old(Contents(this))
; [eval] Contents(this)
(push) ; 3
(declare-const $k@157@01 $Perm)
(assert ($Perm.isReadVar $k@157@01))
(assert (< $k@157@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@157@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@157@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@157@01))
(assert (and (< $k@157@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@157@01))))
(set-option :timeout 0)
(push) ; 3
(assert (not (< 0 (Seq_length (Contents ($Snap.first $t@148@01) b@110@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= x@155@01 (Seq_index (Contents ($Snap.first $t@148@01) b@110@01) 0)))
(assert (=
  ($Snap.second ($Snap.second $t@156@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@156@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@156@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@156@01))) $Snap.unit))
; [eval] Contents(this) == old(Contents(this))[1..]
; [eval] Contents(this)
(push) ; 3
(declare-const $k@158@01 $Perm)
(assert ($Perm.isReadVar $k@158@01))
(assert (< $k@158@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@158@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@158@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Contents%precondition ($Snap.first $t@156@01) b@110@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@158@01))
(assert (and
  (< $k@158@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@158@01))
  (Contents%precondition ($Snap.first $t@156@01) b@110@01)))
; [eval] old(Contents(this))[1..]
; [eval] old(Contents(this))
; [eval] Contents(this)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@159@01 $Perm)
(assert ($Perm.isReadVar $k@159@01))
