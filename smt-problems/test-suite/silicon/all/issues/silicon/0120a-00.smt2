(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:51:20
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0120a.vpr
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
(declare-sort GlobalKPermission 0)
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
(declare-fun $SortWrappers.GlobalKPermissionTo$Snap (GlobalKPermission) $Snap)
(declare-fun $SortWrappers.$SnapToGlobalKPermission ($Snap) GlobalKPermission)
(assert (forall ((x GlobalKPermission)) (!
    (= x ($SortWrappers.$SnapToGlobalKPermission($SortWrappers.GlobalKPermissionTo$Snap x)))
    :pattern (($SortWrappers.GlobalKPermissionTo$Snap x))
    :qid |$Snap.$SnapToGlobalKPermissionTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.GlobalKPermissionTo$Snap($SortWrappers.$SnapToGlobalKPermission x)))
    :pattern (($SortWrappers.$SnapToGlobalKPermission x))
    :qid |$Snap.GlobalKPermissionTo$SnapToGlobalKPermission|
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
(declare-const globalK$<Perm> $Perm)
; Declaring symbols related to program functions (from program analysis)
(declare-fun Nodereverse_vals$ ($Snap $Ref) Seq<Int>)
(declare-fun Nodereverse_vals$%limited ($Snap $Ref) Seq<Int>)
(declare-fun Nodereverse_vals$%stateless ($Ref) Bool)
(declare-fun Nodereverse_vals$%precondition ($Snap $Ref) Bool)
(declare-fun Nodevals$ ($Snap $Ref) Seq<Int>)
(declare-fun Nodevals$%limited ($Snap $Ref) Seq<Int>)
(declare-fun Nodevals$%stateless ($Ref) Bool)
(declare-fun Nodevals$%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun Node$MonitorInvariant%trigger ($Snap $Ref) Bool)
(declare-fun Nodelist$%trigger ($Snap $Ref) Bool)
; ////////// Uniqueness assumptions from domains
(assert true)
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
(assert (and
  (> (as globalK$<Perm>  $Perm) $Perm.No)
  (> $Perm.Write (as globalK$<Perm>  $Perm))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(declare-fun $k@4@00 () $Perm)
(declare-fun joined_unfolding@8@00 ($Snap $Ref) Seq<Int>)
(declare-fun $k@5@00 () $Perm)
(declare-fun $k@6@00 () $Perm)
(declare-fun $k@7@00 () $Perm)
(declare-fun $k@9@00 () $Perm)
(declare-fun joined_unfolding@13@00 ($Snap $Ref) Seq<Int>)
(declare-fun $k@10@00 () $Perm)
(declare-fun $k@11@00 () $Perm)
(declare-fun $k@12@00 () $Perm)
(assert (forall ((s@$ $Snap) (this$_3@0@00 $Ref)) (!
  (=
    (Nodereverse_vals$%limited s@$ this$_3@0@00)
    (Nodereverse_vals$ s@$ this$_3@0@00))
  :pattern ((Nodereverse_vals$ s@$ this$_3@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (this$_3@0@00 $Ref)) (!
  (Nodereverse_vals$%stateless this$_3@0@00)
  :pattern ((Nodereverse_vals$%limited s@$ this$_3@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (this$_3@0@00 $Ref)) (!
  (and
    ($Perm.isReadVar $k@4@00)
    ($Perm.isReadVar $k@5@00)
    ($Perm.isReadVar $k@6@00)
    ($Perm.isReadVar $k@7@00)
    (=>
      (Nodereverse_vals$%precondition s@$ this$_3@0@00)
      (=
        (Nodereverse_vals$ s@$ this$_3@0@00)
        (ite
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            $Ref.null)
          (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$)))))
          (Seq_append
            (Nodereverse_vals$%limited ($Snap.combine
              $Snap.unit
              ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
            (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))))))))
  :pattern ((Nodereverse_vals$ s@$ this$_3@0@00))
  :pattern ((Nodereverse_vals$%stateless this$_3@0@00) (Nodelist$%trigger ($Snap.second s@$) this$_3@0@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (this$_3@0@00 $Ref)) (!
  (=>
    (Nodereverse_vals$%precondition s@$ this$_3@0@00)
    (ite
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)
      true
      (Nodereverse_vals$%precondition ($Snap.combine
        $Snap.unit
        ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))
  :pattern ((Nodereverse_vals$ s@$ this$_3@0@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (this$_2@2@00 $Ref)) (!
  (= (Nodevals$%limited s@$ this$_2@2@00) (Nodevals$ s@$ this$_2@2@00))
  :pattern ((Nodevals$ s@$ this$_2@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (this$_2@2@00 $Ref)) (!
  (Nodevals$%stateless this$_2@2@00)
  :pattern ((Nodevals$%limited s@$ this$_2@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (this$_2@2@00 $Ref)) (!
  (and
    ($Perm.isReadVar $k@9@00)
    ($Perm.isReadVar $k@10@00)
    ($Perm.isReadVar $k@11@00)
    ($Perm.isReadVar $k@12@00)
    (=>
      (Nodevals$%precondition s@$ this$_2@2@00)
      (=
        (Nodevals$ s@$ this$_2@2@00)
        (ite
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            $Ref.null)
          (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$)))))
          (Seq_append
            (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$)))))
            (Nodevals$%limited ($Snap.combine
              $Snap.unit
              ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))))))
  :pattern ((Nodevals$ s@$ this$_2@2@00))
  :pattern ((Nodevals$%stateless this$_2@2@00) (Nodelist$%trigger ($Snap.second s@$) this$_2@2@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (this$_2@2@00 $Ref)) (!
  (=>
    (Nodevals$%precondition s@$ this$_2@2@00)
    (ite
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)
      true
      (Nodevals$%precondition ($Snap.combine
        $Snap.unit
        ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))
  :pattern ((Nodevals$ s@$ this$_2@2@00))
  :qid |quant-u-7|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- Nodereverse_in_place$ ----------
(declare-const this$_4@0@01 $Ref)
(declare-const k$@1@01 $Perm)
(declare-const r@2@01 $Ref)
(declare-const this$_4@3@01 $Ref)
(declare-const k$@4@01 $Perm)
(declare-const r@5@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 ($Snap.combine ($Snap.first $t@6@01) ($Snap.second $t@6@01))))
(assert (= ($Snap.first $t@6@01) $Snap.unit))
; [eval] this$_4 != null
(assert (not (= this$_4@3@01 $Ref.null)))
(assert (=
  ($Snap.second $t@6@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.second ($Snap.second $t@6@01)))))
(assert (= ($Snap.first ($Snap.second $t@6@01)) $Snap.unit))
; [eval] k$ > none
(assert (> k$@4@01 $Perm.No))
(assert (=
  ($Snap.second ($Snap.second $t@6@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@6@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@6@01))) $Snap.unit))
; [eval] write > k$
(assert (> $Perm.Write k$@4@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@7@01 $Snap)
(assert (= $t@7@01 ($Snap.combine ($Snap.first $t@7@01) ($Snap.second $t@7@01))))
(assert (= ($Snap.first $t@7@01) $Snap.unit))
; [eval] r != null
(assert (not (= r@5@01 $Ref.null)))
(assert (=
  ($Snap.second $t@7@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@7@01))
    ($Snap.second ($Snap.second $t@7@01)))))
(assert (= ($Snap.second ($Snap.second $t@7@01)) $Snap.unit))
; [eval] Nodevals$(r) == old(Nodereverse_vals$(this$_4))
; [eval] Nodevals$(r)
(push) ; 3
; [eval] this$_2 != null
(declare-const $k@8@01 $Perm)
(assert ($Perm.isReadVar $k@8@01))
(assert (< $k@8@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@8@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@8@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Nodevals$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@7@01))) r@5@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@8@01))
(assert (and
  (< $k@8@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@8@01))
  (Nodevals$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second $t@7@01))) r@5@01)))
; [eval] old(Nodereverse_vals$(this$_4))
; [eval] Nodereverse_vals$(this$_4)
(set-option :timeout 0)
(push) ; 3
; [eval] this$_3 != null
(declare-const $k@9@01 $Perm)
(assert ($Perm.isReadVar $k@9@01))
(assert (< $k@9@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@9@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@9@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Nodereverse_vals$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) this$_4@3@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@9@01))
(assert (and
  (< $k@9@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@9@01))
  (Nodereverse_vals$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) this$_4@3@01)))
(assert (Seq_equal
  (Nodevals$ ($Snap.combine $Snap.unit ($Snap.first ($Snap.second $t@7@01))) r@5@01)
  (Nodereverse_vals$ ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) this$_4@3@01)))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; var n$: Ref
(declare-const n$@10@01 $Ref)
; [exec]
; var a$: Ref
(declare-const a$@11@01 $Ref)
; [exec]
; var b$: Ref
(declare-const b$@12@01 $Ref)
; [exec]
; var c$: Ref
(declare-const c$@13@01 $Ref)
; [exec]
; var l: Ref
(declare-const l@14@01 $Ref)
; [exec]
; var y: Ref
(declare-const y@15@01 $Ref)
; [exec]
; l := this$_4
; [exec]
; r := null
(declare-const y@16@01 $Ref)
(declare-const r@17@01 $Ref)
(declare-const l@18@01 $Ref)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@19@01 $Snap)
(assert (= $t@19@01 ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01))))
; [eval] l != null
(push) ; 4
(set-option :timeout 10)
(assert (not (= l@18@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= l@18@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | l@18@01 != Null | live]
; [else-branch: 0 | l@18@01 == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 0 | l@18@01 != Null]
(assert (not (= l@18@01 $Ref.null)))
(assert (=
  ($Snap.second $t@19@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@19@01))
    ($Snap.second ($Snap.second $t@19@01)))))
; [eval] r != null
(push) ; 5
(set-option :timeout 10)
(assert (not (= r@17@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= r@17@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | r@17@01 != Null | live]
; [else-branch: 1 | r@17@01 == Null | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 1 | r@17@01 != Null]
(assert (not (= r@17@01 $Ref.null)))
(push) ; 6
(set-option :timeout 10)
(assert (not (= l@18@01 r@17@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@19@01)) $Snap.unit))
; [eval] old(Nodereverse_vals$(this$_4)) == (l == null ? Seq[Int]() : Nodereverse_vals$(l)) ++ (r == null ? Seq[Int]() : Nodevals$(r))
; [eval] old(Nodereverse_vals$(this$_4))
; [eval] Nodereverse_vals$(this$_4)
(set-option :timeout 0)
(push) ; 6
; [eval] this$_3 != null
(declare-const $k@20@01 $Perm)
(assert ($Perm.isReadVar $k@20@01))
(assert (< $k@20@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@20@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@20@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (Nodereverse_vals$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) this$_4@3@01))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@20@01))
(assert (and
  (< $k@20@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@20@01))
  (Nodereverse_vals$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) this$_4@3@01)))
; [eval] (l == null ? Seq[Int]() : Nodereverse_vals$(l)) ++ (r == null ? Seq[Int]() : Nodevals$(r))
; [eval] (l == null ? Seq[Int]() : Nodereverse_vals$(l))
; [eval] l == null
(set-option :timeout 0)
(push) ; 6
; [then-branch: 2 | l@18@01 == Null | dead]
; [else-branch: 2 | l@18@01 != Null | live]
(push) ; 7
; [else-branch: 2 | l@18@01 != Null]
; [eval] Nodereverse_vals$(l)
(push) ; 8
; [eval] this$_3 != null
(declare-const $k@21@01 $Perm)
(assert ($Perm.isReadVar $k@21@01))
(assert (< $k@21@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@21@01)))
(push) ; 9
(set-option :timeout 10)
(assert (not (< $Perm.No $k@21@01)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (Nodereverse_vals$%precondition ($Snap.combine $Snap.unit ($Snap.first $t@19@01)) l@18@01))
(pop) ; 8
; Joined path conditions
(assert ($Perm.isReadVar $k@21@01))
(assert (and
  (< $k@21@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@21@01))
  (Nodereverse_vals$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first $t@19@01)) l@18@01)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@21@01))
(assert (=>
  (not (= l@18@01 $Ref.null))
  (and
    (< $k@21@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@21@01))
    (Nodereverse_vals$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.first $t@19@01)) l@18@01))))
; [eval] (r == null ? Seq[Int]() : Nodevals$(r))
; [eval] r == null
(set-option :timeout 0)
(push) ; 6
; [then-branch: 3 | r@17@01 == Null | dead]
; [else-branch: 3 | r@17@01 != Null | live]
(push) ; 7
; [else-branch: 3 | r@17@01 != Null]
; [eval] Nodevals$(r)
(push) ; 8
; [eval] this$_2 != null
(declare-const $k@22@01 $Perm)
(assert ($Perm.isReadVar $k@22@01))
(assert (< $k@22@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@22@01)))
(push) ; 9
(set-option :timeout 10)
(assert (not (< $Perm.No $k@22@01)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (Nodevals$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@19@01))) r@17@01))
(pop) ; 8
; Joined path conditions
(assert ($Perm.isReadVar $k@22@01))
(assert (and
  (< $k@22@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@22@01))
  (Nodevals$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second $t@19@01))) r@17@01)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@22@01))
(assert (=>
  (not (= r@17@01 $Ref.null))
  (and
    (< $k@22@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@22@01))
    (Nodevals$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second $t@19@01))) r@17@01))))
(assert (Seq_equal
  (Nodereverse_vals$ ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) this$_4@3@01)
  (Seq_append
    (Nodereverse_vals$ ($Snap.combine $Snap.unit ($Snap.first $t@19@01)) l@18@01)
    (Nodevals$ ($Snap.combine $Snap.unit ($Snap.first ($Snap.second $t@19@01))) r@17@01))))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 1 | r@17@01 == Null]
(assert (= r@17@01 $Ref.null))
(assert (= ($Snap.first ($Snap.second $t@19@01)) $Snap.unit))
(assert (= ($Snap.second ($Snap.second $t@19@01)) $Snap.unit))
; [eval] old(Nodereverse_vals$(this$_4)) == (l == null ? Seq[Int]() : Nodereverse_vals$(l)) ++ (r == null ? Seq[Int]() : Nodevals$(r))
; [eval] old(Nodereverse_vals$(this$_4))
; [eval] Nodereverse_vals$(this$_4)
(push) ; 6
; [eval] this$_3 != null
(declare-const $k@23@01 $Perm)
(assert ($Perm.isReadVar $k@23@01))
(assert (< $k@23@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@23@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@23@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (Nodereverse_vals$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) this$_4@3@01))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@23@01))
(assert (and
  (< $k@23@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@23@01))
  (Nodereverse_vals$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) this$_4@3@01)))
; [eval] (l == null ? Seq[Int]() : Nodereverse_vals$(l)) ++ (r == null ? Seq[Int]() : Nodevals$(r))
; [eval] (l == null ? Seq[Int]() : Nodereverse_vals$(l))
; [eval] l == null
(set-option :timeout 0)
(push) ; 6
; [then-branch: 4 | l@18@01 == Null | dead]
; [else-branch: 4 | l@18@01 != Null | live]
(push) ; 7
; [else-branch: 4 | l@18@01 != Null]
; [eval] Nodereverse_vals$(l)
(push) ; 8
; [eval] this$_3 != null
(declare-const $k@24@01 $Perm)
(assert ($Perm.isReadVar $k@24@01))
(assert (< $k@24@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@24@01)))
(push) ; 9
(set-option :timeout 10)
(assert (not (< $Perm.No $k@24@01)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (Nodereverse_vals$%precondition ($Snap.combine $Snap.unit ($Snap.first $t@19@01)) l@18@01))
(pop) ; 8
; Joined path conditions
(assert ($Perm.isReadVar $k@24@01))
(assert (and
  (< $k@24@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@24@01))
  (Nodereverse_vals$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first $t@19@01)) l@18@01)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@24@01))
(assert (=>
  (not (= l@18@01 $Ref.null))
  (and
    (< $k@24@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@24@01))
    (Nodereverse_vals$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.first $t@19@01)) l@18@01))))
; [eval] (r == null ? Seq[Int]() : Nodevals$(r))
; [eval] r == null
(set-option :timeout 0)
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= r@17@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | r@17@01 == Null | live]
; [else-branch: 5 | r@17@01 != Null | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 5 | r@17@01 == Null]
; [eval] Seq[Int]()
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (Seq_equal
  (Nodereverse_vals$ ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) this$_4@3@01)
  (Seq_append
    (Nodereverse_vals$ ($Snap.combine $Snap.unit ($Snap.first $t@19@01)) l@18@01)
    (as Seq_empty  Seq<Int>))))
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 0 | l@18@01 == Null]
(assert (= l@18@01 $Ref.null))
(assert (= ($Snap.first $t@19@01) $Snap.unit))
(assert (=
  ($Snap.second $t@19@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@19@01))
    ($Snap.second ($Snap.second $t@19@01)))))
; [eval] r != null
(push) ; 5
(set-option :timeout 10)
(assert (not (= r@17@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= r@17@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | r@17@01 != Null | live]
; [else-branch: 6 | r@17@01 == Null | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 6 | r@17@01 != Null]
(assert (not (= r@17@01 $Ref.null)))
(assert (= ($Snap.second ($Snap.second $t@19@01)) $Snap.unit))
; [eval] old(Nodereverse_vals$(this$_4)) == (l == null ? Seq[Int]() : Nodereverse_vals$(l)) ++ (r == null ? Seq[Int]() : Nodevals$(r))
; [eval] old(Nodereverse_vals$(this$_4))
; [eval] Nodereverse_vals$(this$_4)
(push) ; 6
; [eval] this$_3 != null
(declare-const $k@25@01 $Perm)
(assert ($Perm.isReadVar $k@25@01))
(assert (< $k@25@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@25@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@25@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (Nodereverse_vals$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) this$_4@3@01))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@25@01))
(assert (and
  (< $k@25@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@25@01))
  (Nodereverse_vals$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) this$_4@3@01)))
; [eval] (l == null ? Seq[Int]() : Nodereverse_vals$(l)) ++ (r == null ? Seq[Int]() : Nodevals$(r))
; [eval] (l == null ? Seq[Int]() : Nodereverse_vals$(l))
; [eval] l == null
(set-option :timeout 0)
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= l@18@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | l@18@01 == Null | live]
; [else-branch: 7 | l@18@01 != Null | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 7 | l@18@01 == Null]
; [eval] Seq[Int]()
(pop) ; 7
(pop) ; 6
; Joined path conditions
; [eval] (r == null ? Seq[Int]() : Nodevals$(r))
; [eval] r == null
(push) ; 6
; [then-branch: 8 | r@17@01 == Null | dead]
; [else-branch: 8 | r@17@01 != Null | live]
(push) ; 7
; [else-branch: 8 | r@17@01 != Null]
; [eval] Nodevals$(r)
(push) ; 8
; [eval] this$_2 != null
(declare-const $k@26@01 $Perm)
(assert ($Perm.isReadVar $k@26@01))
(assert (< $k@26@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@26@01)))
(push) ; 9
(set-option :timeout 10)
(assert (not (< $Perm.No $k@26@01)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (Nodevals$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@19@01))) r@17@01))
(pop) ; 8
; Joined path conditions
(assert ($Perm.isReadVar $k@26@01))
(assert (and
  (< $k@26@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@26@01))
  (Nodevals$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second $t@19@01))) r@17@01)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@26@01))
(assert (=>
  (not (= r@17@01 $Ref.null))
  (and
    (< $k@26@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@26@01))
    (Nodevals$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second $t@19@01))) r@17@01))))
(assert (Seq_equal
  (Nodereverse_vals$ ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) this$_4@3@01)
  (Seq_append
    (as Seq_empty  Seq<Int>)
    (Nodevals$ ($Snap.combine $Snap.unit ($Snap.first ($Snap.second $t@19@01))) r@17@01))))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 6 | r@17@01 == Null]
(assert (= r@17@01 $Ref.null))
(assert (= ($Snap.first ($Snap.second $t@19@01)) $Snap.unit))
(assert (= ($Snap.second ($Snap.second $t@19@01)) $Snap.unit))
; [eval] old(Nodereverse_vals$(this$_4)) == (l == null ? Seq[Int]() : Nodereverse_vals$(l)) ++ (r == null ? Seq[Int]() : Nodevals$(r))
; [eval] old(Nodereverse_vals$(this$_4))
; [eval] Nodereverse_vals$(this$_4)
(push) ; 6
; [eval] this$_3 != null
(declare-const $k@27@01 $Perm)
(assert ($Perm.isReadVar $k@27@01))
(assert (< $k@27@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@27@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@27@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (Nodereverse_vals$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) this$_4@3@01))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@27@01))
(assert (and
  (< $k@27@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@27@01))
  (Nodereverse_vals$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) this$_4@3@01)))
; [eval] (l == null ? Seq[Int]() : Nodereverse_vals$(l)) ++ (r == null ? Seq[Int]() : Nodevals$(r))
; [eval] (l == null ? Seq[Int]() : Nodereverse_vals$(l))
; [eval] l == null
(set-option :timeout 0)
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= l@18@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | l@18@01 == Null | live]
; [else-branch: 9 | l@18@01 != Null | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 9 | l@18@01 == Null]
; [eval] Seq[Int]()
(pop) ; 7
(pop) ; 6
; Joined path conditions
; [eval] (r == null ? Seq[Int]() : Nodevals$(r))
; [eval] r == null
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= r@17@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | r@17@01 == Null | live]
; [else-branch: 10 | r@17@01 != Null | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 10 | r@17@01 == Null]
; [eval] Seq[Int]()
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (Seq_equal
  (Nodereverse_vals$ ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) this$_4@3@01)
  (Seq_append (as Seq_empty  Seq<Int>) (as Seq_empty  Seq<Int>))))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; [eval] l != null
(push) ; 4
(set-option :timeout 10)
(assert (not (= this$_4@3@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | this$_4@3@01 != Null | live]
; [else-branch: 11 | this$_4@3@01 == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 11 | this$_4@3@01 != Null]
; [eval] r != null
; [then-branch: 12 | False | dead]
; [else-branch: 12 | True | live]
(push) ; 5
; [else-branch: 12 | True]
; [eval] old(Nodereverse_vals$(this$_4)) == (l == null ? Seq[Int]() : Nodereverse_vals$(l)) ++ (r == null ? Seq[Int]() : Nodevals$(r))
; [eval] old(Nodereverse_vals$(this$_4))
; [eval] Nodereverse_vals$(this$_4)
(push) ; 6
; [eval] this$_3 != null
(declare-const $k@28@01 $Perm)
(assert ($Perm.isReadVar $k@28@01))
(assert (< $k@28@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@28@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@28@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (Nodereverse_vals$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) this$_4@3@01))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@28@01))
(assert (and
  (< $k@28@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@28@01))
  (Nodereverse_vals$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) this$_4@3@01)))
; [eval] (l == null ? Seq[Int]() : Nodereverse_vals$(l)) ++ (r == null ? Seq[Int]() : Nodevals$(r))
; [eval] (l == null ? Seq[Int]() : Nodereverse_vals$(l))
; [eval] l == null
(set-option :timeout 0)
(push) ; 6
; [then-branch: 13 | this$_4@3@01 == Null | dead]
; [else-branch: 13 | this$_4@3@01 != Null | live]
(push) ; 7
; [else-branch: 13 | this$_4@3@01 != Null]
; [eval] Nodereverse_vals$(l)
(push) ; 8
; [eval] this$_3 != null
(declare-const $k@29@01 $Perm)
(assert ($Perm.isReadVar $k@29@01))
(assert (< $k@29@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@29@01)))
(push) ; 9
(set-option :timeout 10)
(assert (not (< $Perm.No $k@29@01)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
; Joined path conditions
(assert ($Perm.isReadVar $k@29@01))
(assert (and (< $k@29@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@29@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@29@01))
(assert (=>
  (not (= this$_4@3@01 $Ref.null))
  (and (< $k@29@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@29@01)))))
; [eval] (r == null ? Seq[Int]() : Nodevals$(r))
; [eval] r == null
(set-option :timeout 0)
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 14 | True | live]
; [else-branch: 14 | False | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 14 | True]
; [eval] Seq[Int]()
(pop) ; 7
(pop) ; 6
; Joined path conditions
(push) ; 6
(assert (not (Seq_equal
  (Nodereverse_vals$ ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) this$_4@3@01)
  (Seq_append
    (Nodereverse_vals$ ($Snap.combine
      $Snap.unit
      ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) this$_4@3@01)
    (as Seq_empty  Seq<Int>)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (Nodereverse_vals$ ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) this$_4@3@01)
  (Seq_append
    (Nodereverse_vals$ ($Snap.combine
      $Snap.unit
      ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) this$_4@3@01)
    (as Seq_empty  Seq<Int>))))
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 6
(assert ($Perm.isReadVar $k@20@01))
(assert ($Perm.isReadVar $k@21@01))
(assert ($Perm.isReadVar $k@22@01))
(assert (not (= r@17@01 $Ref.null)))
(assert (= ($Snap.second ($Snap.second $t@19@01)) $Snap.unit))
(assert (< $k@20@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@20@01)))
(assert (=>
  (not (= l@18@01 $Ref.null))
  (and
    (< $k@21@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@21@01))
    (Nodereverse_vals$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.first $t@19@01)) l@18@01))))
(assert (=>
  (not (= r@17@01 $Ref.null))
  (and
    (< $k@22@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@22@01))
    (Nodevals$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second $t@19@01))) r@17@01))))
(assert (Seq_equal
  (Nodereverse_vals$ ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) this$_4@3@01)
  (Seq_append
    (Nodereverse_vals$ ($Snap.combine $Snap.unit ($Snap.first $t@19@01)) l@18@01)
    (Nodevals$ ($Snap.combine $Snap.unit ($Snap.first ($Snap.second $t@19@01))) r@17@01))))
(assert (not (= l@18@01 $Ref.null)))
(assert (=
  ($Snap.second $t@19@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@19@01))
    ($Snap.second ($Snap.second $t@19@01)))))
(assert (= $t@19@01 ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 7
; [eval] l != null
(pop) ; 7
(push) ; 7
; [eval] !(l != null)
; [eval] l != null
(pop) ; 7
; Loop head block: Follow loop-internal edges
; [eval] l != null
(push) ; 7
(set-option :timeout 10)
(assert (not (= l@18@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 15 | l@18@01 != Null | live]
; [else-branch: 15 | l@18@01 == Null | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 15 | l@18@01 != Null]
; [eval] r != null
(push) ; 8
(set-option :timeout 10)
(assert (not (= r@17@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 16 | r@17@01 != Null | live]
; [else-branch: 16 | r@17@01 == Null | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 16 | r@17@01 != Null]
; [exec]
; unfold acc(Nodelist$(r), write)
(assert (=
  ($Snap.first ($Snap.second $t@19@01))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second $t@19@01)))
    ($Snap.second ($Snap.first ($Snap.second $t@19@01))))))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second $t@19@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@19@01))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@19@01)))))))
; [eval] this$_1.Nodenext$ != null
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@19@01))))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@19@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 17 | First:(First:(Second:($t@19@01))) != Null | live]
; [else-branch: 17 | First:(First:(Second:($t@19@01))) == Null | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 17 | First:(First:(Second:($t@19@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@19@01))))
    $Ref.null)))
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  l@18@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@19@01)))))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Nodelist$%trigger ($Snap.first ($Snap.second $t@19@01)) r@17@01))
; [exec]
; fold acc(Nodelist$(r), write)
; [eval] this$_1.Nodenext$ != null
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@19@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 18 | First:(First:(Second:($t@19@01))) != Null | live]
; [else-branch: 18 | First:(First:(Second:($t@19@01))) == Null | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 18 | First:(First:(Second:($t@19@01))) != Null]
(assert (Nodelist$%trigger ($Snap.combine
  ($Snap.first ($Snap.first ($Snap.second $t@19@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@19@01))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@19@01)))))) r@17@01))
(push) ; 11
(set-option :timeout 10)
(assert (not (= l@18@01 r@17@01)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [exec]
; unfold acc(Nodelist$(l), write)
(assert (=
  ($Snap.first $t@19@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@19@01))
    ($Snap.second ($Snap.first $t@19@01)))))
(assert (=
  ($Snap.second ($Snap.first $t@19@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@19@01))))))
; [eval] this$_1.Nodenext$ != null
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 19 | First:(First:($t@19@01)) != Null | live]
; [else-branch: 19 | First:(First:($t@19@01)) == Null | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 19 | First:(First:($t@19@01)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01))) $Ref.null)))
(push) ; 12
(set-option :timeout 10)
(assert (not (= r@17@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01))))))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Nodelist$%trigger ($Snap.first $t@19@01) l@18@01))
; [eval] l.Nodenext$ != null
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
; [then-branch: 20 | First:(First:($t@19@01)) != Null | live]
; [else-branch: 20 | First:(First:($t@19@01)) == Null | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 20 | First:(First:($t@19@01)) != Null]
; [exec]
; unfold acc(Nodelist$(l.Nodenext$), write)
(assert (=
  ($Snap.second ($Snap.second ($Snap.first $t@19@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))))
(push) ; 13
(set-option :timeout 10)
(assert (not (= l@18@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01))))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01))))))))
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= l@18@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01))))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
; [eval] this$_1.Nodenext$ != null
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
; [then-branch: 21 | First:(Second:(Second:(First:($t@19@01)))) != Null | live]
; [else-branch: 21 | First:(Second:(Second:(First:($t@19@01)))) == Null | live]
(set-option :timeout 0)
(push) ; 13
; [then-branch: 21 | First:(Second:(Second:(First:($t@19@01)))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
    $Ref.null)))
(push) ; 14
(set-option :timeout 10)
(assert (not (=
  r@17@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01))))))))
(check-sat)
; unknown
(pop) ; 14
; 0,00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Nodelist$%trigger ($Snap.second ($Snap.second ($Snap.first $t@19@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01)))))
; [exec]
; fold acc(Nodelist$(l.Nodenext$), write)
; [eval] this$_1.Nodenext$ != null
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 14
; 0,00s
; (get-info :all-statistics)
; [then-branch: 22 | First:(Second:(Second:(First:($t@19@01)))) != Null | live]
; [else-branch: 22 | First:(Second:(Second:(First:($t@19@01)))) == Null | dead]
(set-option :timeout 0)
(push) ; 14
; [then-branch: 22 | First:(Second:(Second:(First:($t@19@01)))) != Null]
(assert (Nodelist$%trigger ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01)))))
(push) ; 15
(set-option :timeout 10)
(assert (not (= r@17@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01))))))
(check-sat)
; unknown
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
; [exec]
; y := l.Nodenext$
(declare-const y@30@01 $Ref)
(assert (= y@30@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01)))))
; [exec]
; l.Nodenext$ := r
; [exec]
; r := l
; [exec]
; fold acc(Nodelist$(r), write)
; [eval] this$_1.Nodenext$ != null
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= r@17@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
; [then-branch: 23 | r@17@01 != Null | live]
; [else-branch: 23 | r@17@01 == Null | dead]
(set-option :timeout 0)
(push) ; 15
; [then-branch: 23 | r@17@01 != Null]
(assert (Nodelist$%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@17@01)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second $t@19@01)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@19@01))))
        ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@19@01)))))))) l@18@01))
(push) ; 16
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01))) l@18@01)))
(check-sat)
; unknown
(pop) ; 16
; 0,00s
; (get-info :all-statistics)
; [exec]
; l := y
; Loop head block: Re-establish invariant
; [eval] l != null
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= y@30@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 16
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (not (= y@30@01 $Ref.null))))
(check-sat)
; unsat
(pop) ; 16
; 0,00s
; (get-info :all-statistics)
; [then-branch: 24 | y@30@01 != Null | live]
; [else-branch: 24 | y@30@01 == Null | dead]
(set-option :timeout 0)
(push) ; 16
; [then-branch: 24 | y@30@01 != Null]
(assert (not (= y@30@01 $Ref.null)))
(push) ; 17
(set-option :timeout 10)
(assert (not (= l@18@01 y@30@01)))
(check-sat)
; unknown
(pop) ; 17
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01))) y@30@01)))
(check-sat)
; unsat
(pop) ; 17
; 0,00s
; (get-info :all-statistics)
; [eval] r != null
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= l@18@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 17
; 0,00s
; (get-info :all-statistics)
; [then-branch: 25 | l@18@01 != Null | live]
; [else-branch: 25 | l@18@01 == Null | dead]
(set-option :timeout 0)
(push) ; 17
; [then-branch: 25 | l@18@01 != Null]
; [eval] old(Nodereverse_vals$(this$_4)) == (l == null ? Seq[Int]() : Nodereverse_vals$(l)) ++ (r == null ? Seq[Int]() : Nodevals$(r))
; [eval] old(Nodereverse_vals$(this$_4))
; [eval] Nodereverse_vals$(this$_4)
(push) ; 18
; [eval] this$_3 != null
(declare-const $k@31@01 $Perm)
(assert ($Perm.isReadVar $k@31@01))
(assert (< $k@31@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@31@01)))
(push) ; 19
(set-option :timeout 10)
(assert (not (< $Perm.No $k@31@01)))
(check-sat)
; unsat
(pop) ; 19
; 0,00s
; (get-info :all-statistics)
(pop) ; 18
; Joined path conditions
(assert ($Perm.isReadVar $k@31@01))
(assert (and (< $k@31@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@31@01))))
; [eval] (l == null ? Seq[Int]() : Nodereverse_vals$(l)) ++ (r == null ? Seq[Int]() : Nodevals$(r))
; [eval] (l == null ? Seq[Int]() : Nodereverse_vals$(l))
; [eval] l == null
(set-option :timeout 0)
(push) ; 18
; [then-branch: 26 | y@30@01 == Null | dead]
; [else-branch: 26 | y@30@01 != Null | live]
(push) ; 19
; [else-branch: 26 | y@30@01 != Null]
; [eval] Nodereverse_vals$(l)
(push) ; 20
; [eval] this$_3 != null
(declare-const $k@32@01 $Perm)
(assert ($Perm.isReadVar $k@32@01))
(push) ; 21
(set-option :timeout 10)
(assert (not (= l@18@01 y@30@01)))
(check-sat)
; unknown
(pop) ; 21
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01))) y@30@01)))
(check-sat)
; unsat
(pop) ; 21
; 0,00s
; (get-info :all-statistics)
(assert (< $k@32@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@32@01)))
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (< $Perm.No $k@32@01)))
(check-sat)
; unsat
(pop) ; 21
; 0,00s
; (get-info :all-statistics)
(assert (Nodereverse_vals$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))))) y@30@01))
(pop) ; 20
; Joined path conditions
(assert ($Perm.isReadVar $k@32@01))
(assert (and
  (< $k@32@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@32@01))
  (Nodereverse_vals$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))))) y@30@01)))
(pop) ; 19
(pop) ; 18
; Joined path conditions
(assert ($Perm.isReadVar $k@32@01))
(assert (=>
  (not (= y@30@01 $Ref.null))
  (and
    (< $k@32@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@32@01))
    (Nodereverse_vals$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))))) y@30@01))))
; [eval] (r == null ? Seq[Int]() : Nodevals$(r))
; [eval] r == null
(set-option :timeout 0)
(push) ; 18
; [then-branch: 27 | l@18@01 == Null | dead]
; [else-branch: 27 | l@18@01 != Null | live]
(push) ; 19
; [else-branch: 27 | l@18@01 != Null]
; [eval] Nodevals$(r)
(push) ; 20
; [eval] this$_2 != null
(declare-const $k@33@01 $Perm)
(assert ($Perm.isReadVar $k@33@01))
(assert (< $k@33@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@33@01)))
(push) ; 21
(set-option :timeout 10)
(assert (not (< $Perm.No $k@33@01)))
(check-sat)
; unsat
(pop) ; 21
; 0,00s
; (get-info :all-statistics)
(assert (Nodevals$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@17@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
      ($Snap.combine
        ($Snap.first ($Snap.first ($Snap.second $t@19@01)))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@19@01))))
          ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@19@01))))))))) l@18@01))
(pop) ; 20
; Joined path conditions
(assert ($Perm.isReadVar $k@33@01))
(assert (and
  (< $k@33@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@33@01))
  (Nodevals$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@17@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
        ($Snap.combine
          ($Snap.first ($Snap.first ($Snap.second $t@19@01)))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@19@01))))
            ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@19@01))))))))) l@18@01)))
(pop) ; 19
(pop) ; 18
; Joined path conditions
(assert ($Perm.isReadVar $k@33@01))
(assert (=>
  (not (= l@18@01 $Ref.null))
  (and
    (< $k@33@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@33@01))
    (Nodevals$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@17@01)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
          ($Snap.combine
            ($Snap.first ($Snap.first ($Snap.second $t@19@01)))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@19@01))))
              ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@19@01))))))))) l@18@01))))
(set-option :timeout 0)
(push) ; 18
(assert (not (Seq_equal
  (Nodereverse_vals$ ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) this$_4@3@01)
  (Seq_append
    (Nodereverse_vals$ ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))))) y@30@01)
    (Nodevals$ ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@17@01)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
          ($Snap.combine
            ($Snap.first ($Snap.first ($Snap.second $t@19@01)))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@19@01))))
              ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@19@01))))))))) l@18@01)))))
(check-sat)
; unsat
(pop) ; 18
; 0,01s
; (get-info :all-statistics)
(assert (Seq_equal
  (Nodereverse_vals$ ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) this$_4@3@01)
  (Seq_append
    (Nodereverse_vals$ ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))))) y@30@01)
    (Nodevals$ ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@17@01)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
          ($Snap.combine
            ($Snap.first ($Snap.first ($Snap.second $t@19@01)))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@19@01))))
              ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@19@01))))))))) l@18@01))))
(pop) ; 17
(pop) ; 16
(pop) ; 15
(pop) ; 14
(pop) ; 13
(push) ; 13
; [else-branch: 21 | First:(Second:(Second:(First:($t@19@01)))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
  $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Nodelist$%trigger ($Snap.second ($Snap.second ($Snap.first $t@19@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01)))))
; [exec]
; fold acc(Nodelist$(l.Nodenext$), write)
; [eval] this$_1.Nodenext$ != null
; [then-branch: 28 | First:(Second:(Second:(First:($t@19@01)))) != Null | dead]
; [else-branch: 28 | First:(Second:(Second:(First:($t@19@01)))) == Null | live]
(set-option :timeout 0)
(push) ; 14
; [else-branch: 28 | First:(Second:(Second:(First:($t@19@01)))) == Null]
(assert (Nodelist$%trigger ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
    $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01)))))
(push) ; 15
(set-option :timeout 10)
(assert (not (= r@17@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01))))))
(check-sat)
; unknown
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
; [exec]
; y := l.Nodenext$
(declare-const y@34@01 $Ref)
(assert (= y@34@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01)))))
; [exec]
; l.Nodenext$ := r
; [exec]
; r := l
; [exec]
; fold acc(Nodelist$(r), write)
; [eval] this$_1.Nodenext$ != null
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= r@17@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
; [then-branch: 29 | r@17@01 != Null | live]
; [else-branch: 29 | r@17@01 == Null | dead]
(set-option :timeout 0)
(push) ; 15
; [then-branch: 29 | r@17@01 != Null]
(assert (Nodelist$%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@17@01)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second $t@19@01)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@19@01))))
        ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@19@01)))))))) l@18@01))
(push) ; 16
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01))) l@18@01)))
(check-sat)
; unknown
(pop) ; 16
; 0,00s
; (get-info :all-statistics)
; [exec]
; l := y
; Loop head block: Re-establish invariant
; [eval] l != null
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= y@34@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 16
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (not (= y@34@01 $Ref.null))))
(check-sat)
; unsat
(pop) ; 16
; 0,00s
; (get-info :all-statistics)
; [then-branch: 30 | y@34@01 != Null | live]
; [else-branch: 30 | y@34@01 == Null | dead]
(set-option :timeout 0)
(push) ; 16
; [then-branch: 30 | y@34@01 != Null]
(assert (not (= y@34@01 $Ref.null)))
(push) ; 17
(set-option :timeout 10)
(assert (not (= l@18@01 y@34@01)))
(check-sat)
; unknown
(pop) ; 17
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01))) y@34@01)))
(check-sat)
; unsat
(pop) ; 17
; 0,00s
; (get-info :all-statistics)
; [eval] r != null
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= l@18@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 17
; 0,00s
; (get-info :all-statistics)
; [then-branch: 31 | l@18@01 != Null | live]
; [else-branch: 31 | l@18@01 == Null | dead]
(set-option :timeout 0)
(push) ; 17
; [then-branch: 31 | l@18@01 != Null]
; [eval] old(Nodereverse_vals$(this$_4)) == (l == null ? Seq[Int]() : Nodereverse_vals$(l)) ++ (r == null ? Seq[Int]() : Nodevals$(r))
; [eval] old(Nodereverse_vals$(this$_4))
; [eval] Nodereverse_vals$(this$_4)
(push) ; 18
; [eval] this$_3 != null
(declare-const $k@35@01 $Perm)
(assert ($Perm.isReadVar $k@35@01))
(assert (< $k@35@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@35@01)))
(push) ; 19
(set-option :timeout 10)
(assert (not (< $Perm.No $k@35@01)))
(check-sat)
; unsat
(pop) ; 19
; 0,00s
; (get-info :all-statistics)
(pop) ; 18
; Joined path conditions
(assert ($Perm.isReadVar $k@35@01))
(assert (and (< $k@35@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@35@01))))
; [eval] (l == null ? Seq[Int]() : Nodereverse_vals$(l)) ++ (r == null ? Seq[Int]() : Nodevals$(r))
; [eval] (l == null ? Seq[Int]() : Nodereverse_vals$(l))
; [eval] l == null
(set-option :timeout 0)
(push) ; 18
; [then-branch: 32 | y@34@01 == Null | dead]
; [else-branch: 32 | y@34@01 != Null | live]
(push) ; 19
; [else-branch: 32 | y@34@01 != Null]
; [eval] Nodereverse_vals$(l)
(push) ; 20
; [eval] this$_3 != null
(declare-const $k@36@01 $Perm)
(assert ($Perm.isReadVar $k@36@01))
(push) ; 21
(set-option :timeout 10)
(assert (not (= l@18@01 y@34@01)))
(check-sat)
; unknown
(pop) ; 21
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01))) y@34@01)))
(check-sat)
; unsat
(pop) ; 21
; 0,00s
; (get-info :all-statistics)
(assert (< $k@36@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@36@01)))
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (< $Perm.No $k@36@01)))
(check-sat)
; unsat
(pop) ; 21
; 0,00s
; (get-info :all-statistics)
(assert (Nodereverse_vals$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
      $Snap.unit))) y@34@01))
(pop) ; 20
; Joined path conditions
(assert ($Perm.isReadVar $k@36@01))
(assert (and
  (< $k@36@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@36@01))
  (Nodereverse_vals$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
        $Snap.unit))) y@34@01)))
(pop) ; 19
(pop) ; 18
; Joined path conditions
(assert ($Perm.isReadVar $k@36@01))
(assert (=>
  (not (= y@34@01 $Ref.null))
  (and
    (< $k@36@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@36@01))
    (Nodereverse_vals$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
          $Snap.unit))) y@34@01))))
; [eval] (r == null ? Seq[Int]() : Nodevals$(r))
; [eval] r == null
(set-option :timeout 0)
(push) ; 18
; [then-branch: 33 | l@18@01 == Null | dead]
; [else-branch: 33 | l@18@01 != Null | live]
(push) ; 19
; [else-branch: 33 | l@18@01 != Null]
; [eval] Nodevals$(r)
(push) ; 20
; [eval] this$_2 != null
(declare-const $k@37@01 $Perm)
(assert ($Perm.isReadVar $k@37@01))
(assert (< $k@37@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@37@01)))
(push) ; 21
(set-option :timeout 10)
(assert (not (< $Perm.No $k@37@01)))
(check-sat)
; unsat
(pop) ; 21
; 0,00s
; (get-info :all-statistics)
(assert (Nodevals$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@17@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
      ($Snap.combine
        ($Snap.first ($Snap.first ($Snap.second $t@19@01)))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@19@01))))
          ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@19@01))))))))) l@18@01))
(pop) ; 20
; Joined path conditions
(assert ($Perm.isReadVar $k@37@01))
(assert (and
  (< $k@37@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@37@01))
  (Nodevals$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@17@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
        ($Snap.combine
          ($Snap.first ($Snap.first ($Snap.second $t@19@01)))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@19@01))))
            ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@19@01))))))))) l@18@01)))
(pop) ; 19
(pop) ; 18
; Joined path conditions
(assert ($Perm.isReadVar $k@37@01))
(assert (=>
  (not (= l@18@01 $Ref.null))
  (and
    (< $k@37@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@37@01))
    (Nodevals$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@17@01)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
          ($Snap.combine
            ($Snap.first ($Snap.first ($Snap.second $t@19@01)))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@19@01))))
              ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@19@01))))))))) l@18@01))))
(set-option :timeout 0)
(push) ; 18
(assert (not (Seq_equal
  (Nodereverse_vals$ ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) this$_4@3@01)
  (Seq_append
    (Nodereverse_vals$ ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
          $Snap.unit))) y@34@01)
    (Nodevals$ ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@17@01)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
          ($Snap.combine
            ($Snap.first ($Snap.first ($Snap.second $t@19@01)))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@19@01))))
              ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@19@01))))))))) l@18@01)))))
(check-sat)
; unsat
(pop) ; 18
; 0,01s
; (get-info :all-statistics)
(assert (Seq_equal
  (Nodereverse_vals$ ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) this$_4@3@01)
  (Seq_append
    (Nodereverse_vals$ ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
          $Snap.unit))) y@34@01)
    (Nodevals$ ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@17@01)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
          ($Snap.combine
            ($Snap.first ($Snap.first ($Snap.second $t@19@01)))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@19@01))))
              ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@19@01))))))))) l@18@01))))
(pop) ; 17
(pop) ; 16
(pop) ; 15
(pop) ; 14
(pop) ; 13
(pop) ; 12
; [eval] !(l.Nodenext$ != null)
; [eval] l.Nodenext$ != null
; [then-branch: 34 | First:(First:($t@19@01)) == Null | dead]
; [else-branch: 34 | First:(First:($t@19@01)) != Null | live]
(push) ; 12
; [else-branch: 34 | First:(First:($t@19@01)) != Null]
(pop) ; 12
(pop) ; 11
(push) ; 11
; [else-branch: 19 | First:(First:($t@19@01)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01))) $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.first $t@19@01))) $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Nodelist$%trigger ($Snap.first $t@19@01) l@18@01))
; [eval] l.Nodenext$ != null
; [then-branch: 35 | First:(First:($t@19@01)) != Null | dead]
; [else-branch: 35 | First:(First:($t@19@01)) == Null | live]
(set-option :timeout 0)
(push) ; 12
; [else-branch: 35 | First:(First:($t@19@01)) == Null]
(pop) ; 12
; [eval] !(l.Nodenext$ != null)
; [eval] l.Nodenext$ != null
(push) ; 12
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
; [then-branch: 36 | First:(First:($t@19@01)) == Null | live]
; [else-branch: 36 | First:(First:($t@19@01)) != Null | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 36 | First:(First:($t@19@01)) == Null]
; [exec]
; y := l.Nodenext$
(declare-const y@38@01 $Ref)
(assert (= y@38@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01)))))
; [exec]
; l.Nodenext$ := r
; [exec]
; r := l
; [exec]
; fold acc(Nodelist$(r), write)
; [eval] this$_1.Nodenext$ != null
(push) ; 13
(set-option :timeout 10)
(assert (not (= r@17@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
; [then-branch: 37 | r@17@01 != Null | live]
; [else-branch: 37 | r@17@01 == Null | dead]
(set-option :timeout 0)
(push) ; 13
; [then-branch: 37 | r@17@01 != Null]
(assert (Nodelist$%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@17@01)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second $t@19@01)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@19@01))))
        ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@19@01)))))))) l@18@01))
; [exec]
; l := y
; Loop head block: Re-establish invariant
; [eval] l != null
(push) ; 14
(set-option :timeout 10)
(assert (not (= y@38@01 $Ref.null)))
(check-sat)
; unsat
(pop) ; 14
; 0,00s
; (get-info :all-statistics)
; [then-branch: 38 | y@38@01 != Null | dead]
; [else-branch: 38 | y@38@01 == Null | live]
(set-option :timeout 0)
(push) ; 14
; [else-branch: 38 | y@38@01 == Null]
(assert (= y@38@01 $Ref.null))
; [eval] r != null
(push) ; 15
(set-option :timeout 10)
(assert (not (= l@18@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
; [then-branch: 39 | l@18@01 != Null | live]
; [else-branch: 39 | l@18@01 == Null | dead]
(set-option :timeout 0)
(push) ; 15
; [then-branch: 39 | l@18@01 != Null]
; [eval] old(Nodereverse_vals$(this$_4)) == (l == null ? Seq[Int]() : Nodereverse_vals$(l)) ++ (r == null ? Seq[Int]() : Nodevals$(r))
; [eval] old(Nodereverse_vals$(this$_4))
; [eval] Nodereverse_vals$(this$_4)
(push) ; 16
; [eval] this$_3 != null
(declare-const $k@39@01 $Perm)
(assert ($Perm.isReadVar $k@39@01))
(assert (< $k@39@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@39@01)))
(push) ; 17
(set-option :timeout 10)
(assert (not (< $Perm.No $k@39@01)))
(check-sat)
; unsat
(pop) ; 17
; 0,00s
; (get-info :all-statistics)
(pop) ; 16
; Joined path conditions
(assert ($Perm.isReadVar $k@39@01))
(assert (and (< $k@39@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@39@01))))
; [eval] (l == null ? Seq[Int]() : Nodereverse_vals$(l)) ++ (r == null ? Seq[Int]() : Nodevals$(r))
; [eval] (l == null ? Seq[Int]() : Nodereverse_vals$(l))
; [eval] l == null
(set-option :timeout 0)
(push) ; 16
(push) ; 17
(set-option :timeout 10)
(assert (not (not (= y@38@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 17
; 0,00s
; (get-info :all-statistics)
; [then-branch: 40 | y@38@01 == Null | live]
; [else-branch: 40 | y@38@01 != Null | dead]
(set-option :timeout 0)
(push) ; 17
; [then-branch: 40 | y@38@01 == Null]
; [eval] Seq[Int]()
(pop) ; 17
(pop) ; 16
; Joined path conditions
; [eval] (r == null ? Seq[Int]() : Nodevals$(r))
; [eval] r == null
(push) ; 16
; [then-branch: 41 | l@18@01 == Null | dead]
; [else-branch: 41 | l@18@01 != Null | live]
(push) ; 17
; [else-branch: 41 | l@18@01 != Null]
; [eval] Nodevals$(r)
(push) ; 18
; [eval] this$_2 != null
(declare-const $k@40@01 $Perm)
(assert ($Perm.isReadVar $k@40@01))
(assert (< $k@40@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@40@01)))
(push) ; 19
(set-option :timeout 10)
(assert (not (< $Perm.No $k@40@01)))
(check-sat)
; unsat
(pop) ; 19
; 0,00s
; (get-info :all-statistics)
(assert (Nodevals$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@17@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
      ($Snap.combine
        ($Snap.first ($Snap.first ($Snap.second $t@19@01)))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@19@01))))
          ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@19@01))))))))) l@18@01))
(pop) ; 18
; Joined path conditions
(assert ($Perm.isReadVar $k@40@01))
(assert (and
  (< $k@40@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@40@01))
  (Nodevals$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@17@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
        ($Snap.combine
          ($Snap.first ($Snap.first ($Snap.second $t@19@01)))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@19@01))))
            ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@19@01))))))))) l@18@01)))
(pop) ; 17
(pop) ; 16
; Joined path conditions
(assert ($Perm.isReadVar $k@40@01))
(assert (=>
  (not (= l@18@01 $Ref.null))
  (and
    (< $k@40@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@40@01))
    (Nodevals$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@17@01)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
          ($Snap.combine
            ($Snap.first ($Snap.first ($Snap.second $t@19@01)))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@19@01))))
              ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@19@01))))))))) l@18@01))))
(set-option :timeout 0)
(push) ; 16
(assert (not (Seq_equal
  (Nodereverse_vals$ ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) this$_4@3@01)
  (Seq_append
    (as Seq_empty  Seq<Int>)
    (Nodevals$ ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@17@01)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
          ($Snap.combine
            ($Snap.first ($Snap.first ($Snap.second $t@19@01)))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@19@01))))
              ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@19@01))))))))) l@18@01)))))
(check-sat)
; unsat
(pop) ; 16
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (Nodereverse_vals$ ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) this$_4@3@01)
  (Seq_append
    (as Seq_empty  Seq<Int>)
    (Nodevals$ ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@17@01)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
          ($Snap.combine
            ($Snap.first ($Snap.first ($Snap.second $t@19@01)))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@19@01))))
              ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@19@01))))))))) l@18@01))))
(pop) ; 15
(pop) ; 14
(pop) ; 13
(pop) ; 12
(pop) ; 11
(pop) ; 10
(pop) ; 9
(push) ; 9
; [else-branch: 17 | First:(First:(Second:($t@19@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@19@01))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@19@01))))
  $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Nodelist$%trigger ($Snap.first ($Snap.second $t@19@01)) r@17@01))
; [exec]
; fold acc(Nodelist$(r), write)
; [eval] this$_1.Nodenext$ != null
; [then-branch: 42 | First:(First:(Second:($t@19@01))) != Null | dead]
; [else-branch: 42 | First:(First:(Second:($t@19@01))) == Null | live]
(set-option :timeout 0)
(push) ; 10
; [else-branch: 42 | First:(First:(Second:($t@19@01))) == Null]
(assert (Nodelist$%trigger ($Snap.combine
  ($Snap.first ($Snap.first ($Snap.second $t@19@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@19@01))))
    $Snap.unit)) r@17@01))
(push) ; 11
(set-option :timeout 10)
(assert (not (= l@18@01 r@17@01)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [exec]
; unfold acc(Nodelist$(l), write)
(assert (=
  ($Snap.first $t@19@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@19@01))
    ($Snap.second ($Snap.first $t@19@01)))))
(assert (=
  ($Snap.second ($Snap.first $t@19@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@19@01))))))
; [eval] this$_1.Nodenext$ != null
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 43 | First:(First:($t@19@01)) != Null | live]
; [else-branch: 43 | First:(First:($t@19@01)) == Null | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 43 | First:(First:($t@19@01)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01))) $Ref.null)))
(push) ; 12
(set-option :timeout 10)
(assert (not (= r@17@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01))))))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Nodelist$%trigger ($Snap.first $t@19@01) l@18@01))
; [eval] l.Nodenext$ != null
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
; [then-branch: 44 | First:(First:($t@19@01)) != Null | live]
; [else-branch: 44 | First:(First:($t@19@01)) == Null | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 44 | First:(First:($t@19@01)) != Null]
; [exec]
; unfold acc(Nodelist$(l.Nodenext$), write)
(assert (=
  ($Snap.second ($Snap.second ($Snap.first $t@19@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))))
(push) ; 13
(set-option :timeout 10)
(assert (not (= l@18@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01))))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01))))))))
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (= l@18@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01))))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
; [eval] this$_1.Nodenext$ != null
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
; [then-branch: 45 | First:(Second:(Second:(First:($t@19@01)))) != Null | live]
; [else-branch: 45 | First:(Second:(Second:(First:($t@19@01)))) == Null | live]
(set-option :timeout 0)
(push) ; 13
; [then-branch: 45 | First:(Second:(Second:(First:($t@19@01)))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
    $Ref.null)))
(push) ; 14
(set-option :timeout 10)
(assert (not (=
  r@17@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01))))))))
(check-sat)
; unknown
(pop) ; 14
; 0,00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Nodelist$%trigger ($Snap.second ($Snap.second ($Snap.first $t@19@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01)))))
; [exec]
; fold acc(Nodelist$(l.Nodenext$), write)
; [eval] this$_1.Nodenext$ != null
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 14
; 0,00s
; (get-info :all-statistics)
; [then-branch: 46 | First:(Second:(Second:(First:($t@19@01)))) != Null | live]
; [else-branch: 46 | First:(Second:(Second:(First:($t@19@01)))) == Null | dead]
(set-option :timeout 0)
(push) ; 14
; [then-branch: 46 | First:(Second:(Second:(First:($t@19@01)))) != Null]
(assert (Nodelist$%trigger ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01)))))
(push) ; 15
(set-option :timeout 10)
(assert (not (= r@17@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01))))))
(check-sat)
; unknown
(pop) ; 15
; 0,01s
; (get-info :all-statistics)
; [exec]
; y := l.Nodenext$
(declare-const y@41@01 $Ref)
(assert (= y@41@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01)))))
; [exec]
; l.Nodenext$ := r
; [exec]
; r := l
; [exec]
; fold acc(Nodelist$(r), write)
; [eval] this$_1.Nodenext$ != null
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= r@17@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
; [then-branch: 47 | r@17@01 != Null | live]
; [else-branch: 47 | r@17@01 == Null | dead]
(set-option :timeout 0)
(push) ; 15
; [then-branch: 47 | r@17@01 != Null]
(assert (Nodelist$%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@17@01)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second $t@19@01)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@19@01))))
        $Snap.unit)))) l@18@01))
(push) ; 16
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01))) l@18@01)))
(check-sat)
; unknown
(pop) ; 16
; 0,00s
; (get-info :all-statistics)
; [exec]
; l := y
; Loop head block: Re-establish invariant
; [eval] l != null
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= y@41@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 16
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (not (= y@41@01 $Ref.null))))
(check-sat)
; unsat
(pop) ; 16
; 0,00s
; (get-info :all-statistics)
; [then-branch: 48 | y@41@01 != Null | live]
; [else-branch: 48 | y@41@01 == Null | dead]
(set-option :timeout 0)
(push) ; 16
; [then-branch: 48 | y@41@01 != Null]
(assert (not (= y@41@01 $Ref.null)))
(push) ; 17
(set-option :timeout 10)
(assert (not (= l@18@01 y@41@01)))
(check-sat)
; unknown
(pop) ; 17
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01))) y@41@01)))
(check-sat)
; unsat
(pop) ; 17
; 0,00s
; (get-info :all-statistics)
; [eval] r != null
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= l@18@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 17
; 0,00s
; (get-info :all-statistics)
; [then-branch: 49 | l@18@01 != Null | live]
; [else-branch: 49 | l@18@01 == Null | dead]
(set-option :timeout 0)
(push) ; 17
; [then-branch: 49 | l@18@01 != Null]
; [eval] old(Nodereverse_vals$(this$_4)) == (l == null ? Seq[Int]() : Nodereverse_vals$(l)) ++ (r == null ? Seq[Int]() : Nodevals$(r))
; [eval] old(Nodereverse_vals$(this$_4))
; [eval] Nodereverse_vals$(this$_4)
(push) ; 18
; [eval] this$_3 != null
(declare-const $k@42@01 $Perm)
(assert ($Perm.isReadVar $k@42@01))
(assert (< $k@42@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@42@01)))
(push) ; 19
(set-option :timeout 10)
(assert (not (< $Perm.No $k@42@01)))
(check-sat)
; unsat
(pop) ; 19
; 0,00s
; (get-info :all-statistics)
(pop) ; 18
; Joined path conditions
(assert ($Perm.isReadVar $k@42@01))
(assert (and (< $k@42@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@42@01))))
; [eval] (l == null ? Seq[Int]() : Nodereverse_vals$(l)) ++ (r == null ? Seq[Int]() : Nodevals$(r))
; [eval] (l == null ? Seq[Int]() : Nodereverse_vals$(l))
; [eval] l == null
(set-option :timeout 0)
(push) ; 18
; [then-branch: 50 | y@41@01 == Null | dead]
; [else-branch: 50 | y@41@01 != Null | live]
(push) ; 19
; [else-branch: 50 | y@41@01 != Null]
; [eval] Nodereverse_vals$(l)
(push) ; 20
; [eval] this$_3 != null
(declare-const $k@43@01 $Perm)
(assert ($Perm.isReadVar $k@43@01))
(push) ; 21
(set-option :timeout 10)
(assert (not (= l@18@01 y@41@01)))
(check-sat)
; unknown
(pop) ; 21
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01))) y@41@01)))
(check-sat)
; unsat
(pop) ; 21
; 0,00s
; (get-info :all-statistics)
(assert (< $k@43@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@43@01)))
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (< $Perm.No $k@43@01)))
(check-sat)
; unsat
(pop) ; 21
; 0,00s
; (get-info :all-statistics)
(assert (Nodereverse_vals$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))))) y@41@01))
(pop) ; 20
; Joined path conditions
(assert ($Perm.isReadVar $k@43@01))
(assert (and
  (< $k@43@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@43@01))
  (Nodereverse_vals$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))))) y@41@01)))
(pop) ; 19
(pop) ; 18
; Joined path conditions
(assert ($Perm.isReadVar $k@43@01))
(assert (=>
  (not (= y@41@01 $Ref.null))
  (and
    (< $k@43@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@43@01))
    (Nodereverse_vals$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))))) y@41@01))))
; [eval] (r == null ? Seq[Int]() : Nodevals$(r))
; [eval] r == null
(set-option :timeout 0)
(push) ; 18
; [then-branch: 51 | l@18@01 == Null | dead]
; [else-branch: 51 | l@18@01 != Null | live]
(push) ; 19
; [else-branch: 51 | l@18@01 != Null]
; [eval] Nodevals$(r)
(push) ; 20
; [eval] this$_2 != null
(declare-const $k@44@01 $Perm)
(assert ($Perm.isReadVar $k@44@01))
(assert (< $k@44@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@44@01)))
(push) ; 21
(set-option :timeout 10)
(assert (not (< $Perm.No $k@44@01)))
(check-sat)
; unsat
(pop) ; 21
; 0,00s
; (get-info :all-statistics)
(assert (Nodevals$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@17@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
      ($Snap.combine
        ($Snap.first ($Snap.first ($Snap.second $t@19@01)))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@19@01))))
          $Snap.unit))))) l@18@01))
(pop) ; 20
; Joined path conditions
(assert ($Perm.isReadVar $k@44@01))
(assert (and
  (< $k@44@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@44@01))
  (Nodevals$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@17@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
        ($Snap.combine
          ($Snap.first ($Snap.first ($Snap.second $t@19@01)))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@19@01))))
            $Snap.unit))))) l@18@01)))
(pop) ; 19
(pop) ; 18
; Joined path conditions
(assert ($Perm.isReadVar $k@44@01))
(assert (=>
  (not (= l@18@01 $Ref.null))
  (and
    (< $k@44@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@44@01))
    (Nodevals$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@17@01)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
          ($Snap.combine
            ($Snap.first ($Snap.first ($Snap.second $t@19@01)))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@19@01))))
              $Snap.unit))))) l@18@01))))
(set-option :timeout 0)
(push) ; 18
(assert (not (Seq_equal
  (Nodereverse_vals$ ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) this$_4@3@01)
  (Seq_append
    (Nodereverse_vals$ ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))))) y@41@01)
    (Nodevals$ ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@17@01)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
          ($Snap.combine
            ($Snap.first ($Snap.first ($Snap.second $t@19@01)))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@19@01))))
              $Snap.unit))))) l@18@01)))))
(check-sat)
; unsat
(pop) ; 18
; 0,01s
; (get-info :all-statistics)
(assert (Seq_equal
  (Nodereverse_vals$ ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) this$_4@3@01)
  (Seq_append
    (Nodereverse_vals$ ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))))) y@41@01)
    (Nodevals$ ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@17@01)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
          ($Snap.combine
            ($Snap.first ($Snap.first ($Snap.second $t@19@01)))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@19@01))))
              $Snap.unit))))) l@18@01))))
(pop) ; 17
(pop) ; 16
(pop) ; 15
(pop) ; 14
(pop) ; 13
(push) ; 13
; [else-branch: 45 | First:(Second:(Second:(First:($t@19@01)))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
  $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Nodelist$%trigger ($Snap.second ($Snap.second ($Snap.first $t@19@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01)))))
; [exec]
; fold acc(Nodelist$(l.Nodenext$), write)
; [eval] this$_1.Nodenext$ != null
; [then-branch: 52 | First:(Second:(Second:(First:($t@19@01)))) != Null | dead]
; [else-branch: 52 | First:(Second:(Second:(First:($t@19@01)))) == Null | live]
(set-option :timeout 0)
(push) ; 14
; [else-branch: 52 | First:(Second:(Second:(First:($t@19@01)))) == Null]
(assert (Nodelist$%trigger ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
    $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01)))))
(push) ; 15
(set-option :timeout 10)
(assert (not (= r@17@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01))))))
(check-sat)
; unknown
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
; [exec]
; y := l.Nodenext$
(declare-const y@45@01 $Ref)
(assert (= y@45@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01)))))
; [exec]
; l.Nodenext$ := r
; [exec]
; r := l
; [exec]
; fold acc(Nodelist$(r), write)
; [eval] this$_1.Nodenext$ != null
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= r@17@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 15
; 0,01s
; (get-info :all-statistics)
; [then-branch: 53 | r@17@01 != Null | live]
; [else-branch: 53 | r@17@01 == Null | dead]
(set-option :timeout 0)
(push) ; 15
; [then-branch: 53 | r@17@01 != Null]
(assert (Nodelist$%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@17@01)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second $t@19@01)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@19@01))))
        $Snap.unit)))) l@18@01))
(push) ; 16
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01))) l@18@01)))
(check-sat)
; unknown
(pop) ; 16
; 0,00s
; (get-info :all-statistics)
; [exec]
; l := y
; Loop head block: Re-establish invariant
; [eval] l != null
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= y@45@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 16
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (not (= y@45@01 $Ref.null))))
(check-sat)
; unsat
(pop) ; 16
; 0,00s
; (get-info :all-statistics)
; [then-branch: 54 | y@45@01 != Null | live]
; [else-branch: 54 | y@45@01 == Null | dead]
(set-option :timeout 0)
(push) ; 16
; [then-branch: 54 | y@45@01 != Null]
(assert (not (= y@45@01 $Ref.null)))
(push) ; 17
(set-option :timeout 10)
(assert (not (= l@18@01 y@45@01)))
(check-sat)
; unknown
(pop) ; 17
; 0,01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01))) y@45@01)))
(check-sat)
; unsat
(pop) ; 17
; 0,00s
; (get-info :all-statistics)
; [eval] r != null
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (= l@18@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 17
; 0,00s
; (get-info :all-statistics)
; [then-branch: 55 | l@18@01 != Null | live]
; [else-branch: 55 | l@18@01 == Null | dead]
(set-option :timeout 0)
(push) ; 17
; [then-branch: 55 | l@18@01 != Null]
; [eval] old(Nodereverse_vals$(this$_4)) == (l == null ? Seq[Int]() : Nodereverse_vals$(l)) ++ (r == null ? Seq[Int]() : Nodevals$(r))
; [eval] old(Nodereverse_vals$(this$_4))
; [eval] Nodereverse_vals$(this$_4)
(push) ; 18
; [eval] this$_3 != null
(declare-const $k@46@01 $Perm)
(assert ($Perm.isReadVar $k@46@01))
(assert (< $k@46@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@46@01)))
(push) ; 19
(set-option :timeout 10)
(assert (not (< $Perm.No $k@46@01)))
(check-sat)
; unsat
(pop) ; 19
; 0,00s
; (get-info :all-statistics)
(pop) ; 18
; Joined path conditions
(assert ($Perm.isReadVar $k@46@01))
(assert (and (< $k@46@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@46@01))))
; [eval] (l == null ? Seq[Int]() : Nodereverse_vals$(l)) ++ (r == null ? Seq[Int]() : Nodevals$(r))
; [eval] (l == null ? Seq[Int]() : Nodereverse_vals$(l))
; [eval] l == null
(set-option :timeout 0)
(push) ; 18
; [then-branch: 56 | y@45@01 == Null | dead]
; [else-branch: 56 | y@45@01 != Null | live]
(push) ; 19
; [else-branch: 56 | y@45@01 != Null]
; [eval] Nodereverse_vals$(l)
(push) ; 20
; [eval] this$_3 != null
(declare-const $k@47@01 $Perm)
(assert ($Perm.isReadVar $k@47@01))
(push) ; 21
(set-option :timeout 10)
(assert (not (= l@18@01 y@45@01)))
(check-sat)
; unknown
(pop) ; 21
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01))) y@45@01)))
(check-sat)
; unsat
(pop) ; 21
; 0,00s
; (get-info :all-statistics)
(assert (< $k@47@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@47@01)))
(set-option :timeout 0)
(push) ; 21
(set-option :timeout 10)
(assert (not (< $Perm.No $k@47@01)))
(check-sat)
; unsat
(pop) ; 21
; 0,00s
; (get-info :all-statistics)
(assert (Nodereverse_vals$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
      $Snap.unit))) y@45@01))
(pop) ; 20
; Joined path conditions
(assert ($Perm.isReadVar $k@47@01))
(assert (and
  (< $k@47@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@47@01))
  (Nodereverse_vals$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
        $Snap.unit))) y@45@01)))
(pop) ; 19
(pop) ; 18
; Joined path conditions
(assert ($Perm.isReadVar $k@47@01))
(assert (=>
  (not (= y@45@01 $Ref.null))
  (and
    (< $k@47@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@47@01))
    (Nodereverse_vals$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
          $Snap.unit))) y@45@01))))
; [eval] (r == null ? Seq[Int]() : Nodevals$(r))
; [eval] r == null
(set-option :timeout 0)
(push) ; 18
; [then-branch: 57 | l@18@01 == Null | dead]
; [else-branch: 57 | l@18@01 != Null | live]
(push) ; 19
; [else-branch: 57 | l@18@01 != Null]
; [eval] Nodevals$(r)
(push) ; 20
; [eval] this$_2 != null
(declare-const $k@48@01 $Perm)
(assert ($Perm.isReadVar $k@48@01))
(assert (< $k@48@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@48@01)))
(push) ; 21
(set-option :timeout 10)
(assert (not (< $Perm.No $k@48@01)))
(check-sat)
; unsat
(pop) ; 21
; 0,00s
; (get-info :all-statistics)
(assert (Nodevals$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@17@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
      ($Snap.combine
        ($Snap.first ($Snap.first ($Snap.second $t@19@01)))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@19@01))))
          $Snap.unit))))) l@18@01))
(pop) ; 20
; Joined path conditions
(assert ($Perm.isReadVar $k@48@01))
(assert (and
  (< $k@48@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@48@01))
  (Nodevals$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@17@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
        ($Snap.combine
          ($Snap.first ($Snap.first ($Snap.second $t@19@01)))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@19@01))))
            $Snap.unit))))) l@18@01)))
(pop) ; 19
(pop) ; 18
; Joined path conditions
(assert ($Perm.isReadVar $k@48@01))
(assert (=>
  (not (= l@18@01 $Ref.null))
  (and
    (< $k@48@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@48@01))
    (Nodevals$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@17@01)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
          ($Snap.combine
            ($Snap.first ($Snap.first ($Snap.second $t@19@01)))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@19@01))))
              $Snap.unit))))) l@18@01))))
(set-option :timeout 0)
(push) ; 18
(assert (not (Seq_equal
  (Nodereverse_vals$ ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) this$_4@3@01)
  (Seq_append
    (Nodereverse_vals$ ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
          $Snap.unit))) y@45@01)
    (Nodevals$ ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@17@01)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
          ($Snap.combine
            ($Snap.first ($Snap.first ($Snap.second $t@19@01)))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@19@01))))
              $Snap.unit))))) l@18@01)))))
(check-sat)
; unsat
(pop) ; 18
; 0,01s
; (get-info :all-statistics)
(assert (Seq_equal
  (Nodereverse_vals$ ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) this$_4@3@01)
  (Seq_append
    (Nodereverse_vals$ ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
          $Snap.unit))) y@45@01)
    (Nodevals$ ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@17@01)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
          ($Snap.combine
            ($Snap.first ($Snap.first ($Snap.second $t@19@01)))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@19@01))))
              $Snap.unit))))) l@18@01))))
(pop) ; 17
(pop) ; 16
(pop) ; 15
(pop) ; 14
(pop) ; 13
(pop) ; 12
; [eval] !(l.Nodenext$ != null)
; [eval] l.Nodenext$ != null
; [then-branch: 58 | First:(First:($t@19@01)) == Null | dead]
; [else-branch: 58 | First:(First:($t@19@01)) != Null | live]
(push) ; 12
; [else-branch: 58 | First:(First:($t@19@01)) != Null]
(pop) ; 12
(pop) ; 11
(push) ; 11
; [else-branch: 43 | First:(First:($t@19@01)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01))) $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.first $t@19@01))) $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Nodelist$%trigger ($Snap.first $t@19@01) l@18@01))
; [eval] l.Nodenext$ != null
; [then-branch: 59 | First:(First:($t@19@01)) != Null | dead]
; [else-branch: 59 | First:(First:($t@19@01)) == Null | live]
(set-option :timeout 0)
(push) ; 12
; [else-branch: 59 | First:(First:($t@19@01)) == Null]
(pop) ; 12
; [eval] !(l.Nodenext$ != null)
; [eval] l.Nodenext$ != null
(push) ; 12
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 12
; 0,01s
; (get-info :all-statistics)
; [then-branch: 60 | First:(First:($t@19@01)) == Null | live]
; [else-branch: 60 | First:(First:($t@19@01)) != Null | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 60 | First:(First:($t@19@01)) == Null]
; [exec]
; y := l.Nodenext$
(declare-const y@49@01 $Ref)
(assert (= y@49@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01)))))
; [exec]
; l.Nodenext$ := r
; [exec]
; r := l
; [exec]
; fold acc(Nodelist$(r), write)
; [eval] this$_1.Nodenext$ != null
(push) ; 13
(set-option :timeout 10)
(assert (not (= r@17@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 13
; 0,01s
; (get-info :all-statistics)
; [then-branch: 61 | r@17@01 != Null | live]
; [else-branch: 61 | r@17@01 == Null | dead]
(set-option :timeout 0)
(push) ; 13
; [then-branch: 61 | r@17@01 != Null]
(assert (Nodelist$%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@17@01)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second $t@19@01)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@19@01))))
        $Snap.unit)))) l@18@01))
; [exec]
; l := y
; Loop head block: Re-establish invariant
; [eval] l != null
(push) ; 14
(set-option :timeout 10)
(assert (not (= y@49@01 $Ref.null)))
(check-sat)
; unsat
(pop) ; 14
; 0,00s
; (get-info :all-statistics)
; [then-branch: 62 | y@49@01 != Null | dead]
; [else-branch: 62 | y@49@01 == Null | live]
(set-option :timeout 0)
(push) ; 14
; [else-branch: 62 | y@49@01 == Null]
(assert (= y@49@01 $Ref.null))
; [eval] r != null
(push) ; 15
(set-option :timeout 10)
(assert (not (= l@18@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
; [then-branch: 63 | l@18@01 != Null | live]
; [else-branch: 63 | l@18@01 == Null | dead]
(set-option :timeout 0)
(push) ; 15
; [then-branch: 63 | l@18@01 != Null]
; [eval] old(Nodereverse_vals$(this$_4)) == (l == null ? Seq[Int]() : Nodereverse_vals$(l)) ++ (r == null ? Seq[Int]() : Nodevals$(r))
; [eval] old(Nodereverse_vals$(this$_4))
; [eval] Nodereverse_vals$(this$_4)
(push) ; 16
; [eval] this$_3 != null
(declare-const $k@50@01 $Perm)
(assert ($Perm.isReadVar $k@50@01))
(assert (< $k@50@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@50@01)))
(push) ; 17
(set-option :timeout 10)
(assert (not (< $Perm.No $k@50@01)))
(check-sat)
; unsat
(pop) ; 17
; 0,00s
; (get-info :all-statistics)
(pop) ; 16
; Joined path conditions
(assert ($Perm.isReadVar $k@50@01))
(assert (and (< $k@50@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@50@01))))
; [eval] (l == null ? Seq[Int]() : Nodereverse_vals$(l)) ++ (r == null ? Seq[Int]() : Nodevals$(r))
; [eval] (l == null ? Seq[Int]() : Nodereverse_vals$(l))
; [eval] l == null
(set-option :timeout 0)
(push) ; 16
(push) ; 17
(set-option :timeout 10)
(assert (not (not (= y@49@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 17
; 0,00s
; (get-info :all-statistics)
; [then-branch: 64 | y@49@01 == Null | live]
; [else-branch: 64 | y@49@01 != Null | dead]
(set-option :timeout 0)
(push) ; 17
; [then-branch: 64 | y@49@01 == Null]
; [eval] Seq[Int]()
(pop) ; 17
(pop) ; 16
; Joined path conditions
; [eval] (r == null ? Seq[Int]() : Nodevals$(r))
; [eval] r == null
(push) ; 16
; [then-branch: 65 | l@18@01 == Null | dead]
; [else-branch: 65 | l@18@01 != Null | live]
(push) ; 17
; [else-branch: 65 | l@18@01 != Null]
; [eval] Nodevals$(r)
(push) ; 18
; [eval] this$_2 != null
(declare-const $k@51@01 $Perm)
(assert ($Perm.isReadVar $k@51@01))
(assert (< $k@51@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@51@01)))
(push) ; 19
(set-option :timeout 10)
(assert (not (< $Perm.No $k@51@01)))
(check-sat)
; unsat
(pop) ; 19
; 0,00s
; (get-info :all-statistics)
(assert (Nodevals$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@17@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
      ($Snap.combine
        ($Snap.first ($Snap.first ($Snap.second $t@19@01)))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@19@01))))
          $Snap.unit))))) l@18@01))
(pop) ; 18
; Joined path conditions
(assert ($Perm.isReadVar $k@51@01))
(assert (and
  (< $k@51@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@51@01))
  (Nodevals$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@17@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
        ($Snap.combine
          ($Snap.first ($Snap.first ($Snap.second $t@19@01)))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@19@01))))
            $Snap.unit))))) l@18@01)))
(pop) ; 17
(pop) ; 16
; Joined path conditions
(assert ($Perm.isReadVar $k@51@01))
(assert (=>
  (not (= l@18@01 $Ref.null))
  (and
    (< $k@51@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@51@01))
    (Nodevals$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@17@01)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
          ($Snap.combine
            ($Snap.first ($Snap.first ($Snap.second $t@19@01)))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@19@01))))
              $Snap.unit))))) l@18@01))))
(set-option :timeout 0)
(push) ; 16
(assert (not (Seq_equal
  (Nodereverse_vals$ ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) this$_4@3@01)
  (Seq_append
    (as Seq_empty  Seq<Int>)
    (Nodevals$ ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@17@01)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
          ($Snap.combine
            ($Snap.first ($Snap.first ($Snap.second $t@19@01)))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@19@01))))
              $Snap.unit))))) l@18@01)))))
(check-sat)
; unsat
(pop) ; 16
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (Nodereverse_vals$ ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) this$_4@3@01)
  (Seq_append
    (as Seq_empty  Seq<Int>)
    (Nodevals$ ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@17@01)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
          ($Snap.combine
            ($Snap.first ($Snap.first ($Snap.second $t@19@01)))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@19@01))))
              $Snap.unit))))) l@18@01))))
(pop) ; 15
(pop) ; 14
(pop) ; 13
(pop) ; 12
(pop) ; 11
(pop) ; 10
(pop) ; 9
(pop) ; 8
; [eval] !(r != null)
; [eval] r != null
; [then-branch: 66 | r@17@01 == Null | dead]
; [else-branch: 66 | r@17@01 != Null | live]
(push) ; 8
; [else-branch: 66 | r@17@01 != Null]
(pop) ; 8
(pop) ; 7
; [eval] !(l != null)
; [eval] l != null
; [then-branch: 67 | l@18@01 == Null | dead]
; [else-branch: 67 | l@18@01 != Null | live]
(push) ; 7
; [else-branch: 67 | l@18@01 != Null]
(pop) ; 7
(pop) ; 6
(push) ; 6
(assert ($Perm.isReadVar $k@23@01))
(assert ($Perm.isReadVar $k@24@01))
(assert (= r@17@01 $Ref.null))
(assert (= ($Snap.first ($Snap.second $t@19@01)) $Snap.unit))
(assert (= ($Snap.second ($Snap.second $t@19@01)) $Snap.unit))
(assert (< $k@23@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@23@01)))
(assert (=>
  (not (= l@18@01 $Ref.null))
  (and
    (< $k@24@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@24@01))
    (Nodereverse_vals$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.first $t@19@01)) l@18@01))))
(assert (Seq_equal
  (Nodereverse_vals$ ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) this$_4@3@01)
  (Seq_append
    (Nodereverse_vals$ ($Snap.combine $Snap.unit ($Snap.first $t@19@01)) l@18@01)
    (as Seq_empty  Seq<Int>))))
(assert (not (= l@18@01 $Ref.null)))
(assert (=
  ($Snap.second $t@19@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@19@01))
    ($Snap.second ($Snap.second $t@19@01)))))
(assert (= $t@19@01 ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 7
; [eval] l != null
(pop) ; 7
(push) ; 7
; [eval] !(l != null)
; [eval] l != null
(pop) ; 7
; Loop head block: Follow loop-internal edges
; [eval] l != null
(push) ; 7
(set-option :timeout 10)
(assert (not (= l@18@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 68 | l@18@01 != Null | live]
; [else-branch: 68 | l@18@01 == Null | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 68 | l@18@01 != Null]
; [eval] r != null
; [then-branch: 69 | r@17@01 != Null | dead]
; [else-branch: 69 | r@17@01 == Null | live]
(push) ; 8
; [else-branch: 69 | r@17@01 == Null]
(pop) ; 8
; [eval] !(r != null)
; [eval] r != null
(push) ; 8
(set-option :timeout 10)
(assert (not (not (= r@17@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 70 | r@17@01 == Null | live]
; [else-branch: 70 | r@17@01 != Null | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 70 | r@17@01 == Null]
; [exec]
; unfold acc(Nodelist$(l), write)
(assert (=
  ($Snap.first $t@19@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@19@01))
    ($Snap.second ($Snap.first $t@19@01)))))
(assert (=
  ($Snap.second ($Snap.first $t@19@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@19@01))))))
; [eval] this$_1.Nodenext$ != null
(push) ; 9
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 71 | First:(First:($t@19@01)) != Null | live]
; [else-branch: 71 | First:(First:($t@19@01)) == Null | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 71 | First:(First:($t@19@01)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01))) $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Nodelist$%trigger ($Snap.first $t@19@01) l@18@01))
; [eval] l.Nodenext$ != null
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 72 | First:(First:($t@19@01)) != Null | live]
; [else-branch: 72 | First:(First:($t@19@01)) == Null | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 72 | First:(First:($t@19@01)) != Null]
; [exec]
; unfold acc(Nodelist$(l.Nodenext$), write)
(assert (=
  ($Snap.second ($Snap.second ($Snap.first $t@19@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))))
(push) ; 11
(set-option :timeout 10)
(assert (not (= l@18@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01))))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01))))))))
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= l@18@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01))))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [eval] this$_1.Nodenext$ != null
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 73 | First:(Second:(Second:(First:($t@19@01)))) != Null | live]
; [else-branch: 73 | First:(Second:(Second:(First:($t@19@01)))) == Null | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 73 | First:(Second:(Second:(First:($t@19@01)))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
    $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Nodelist$%trigger ($Snap.second ($Snap.second ($Snap.first $t@19@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01)))))
; [exec]
; fold acc(Nodelist$(l.Nodenext$), write)
; [eval] this$_1.Nodenext$ != null
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
; [then-branch: 74 | First:(Second:(Second:(First:($t@19@01)))) != Null | live]
; [else-branch: 74 | First:(Second:(Second:(First:($t@19@01)))) == Null | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 74 | First:(Second:(Second:(First:($t@19@01)))) != Null]
(assert (Nodelist$%trigger ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01)))))
; [exec]
; y := l.Nodenext$
(declare-const y@52@01 $Ref)
(assert (= y@52@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01)))))
; [exec]
; l.Nodenext$ := r
; [exec]
; r := l
; [exec]
; fold acc(Nodelist$(r), write)
; [eval] this$_1.Nodenext$ != null
; [then-branch: 75 | r@17@01 != Null | dead]
; [else-branch: 75 | r@17@01 == Null | live]
(push) ; 13
; [else-branch: 75 | r@17@01 == Null]
(assert (Nodelist$%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@17@01)
  ($Snap.combine ($Snap.first ($Snap.second ($Snap.first $t@19@01))) $Snap.unit)) l@18@01))
(push) ; 14
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01))) l@18@01)))
(check-sat)
; unknown
(pop) ; 14
; 0,00s
; (get-info :all-statistics)
; [exec]
; l := y
; Loop head block: Re-establish invariant
; [eval] l != null
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= y@52@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 14
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (not (= y@52@01 $Ref.null))))
(check-sat)
; unsat
(pop) ; 14
; 0,00s
; (get-info :all-statistics)
; [then-branch: 76 | y@52@01 != Null | live]
; [else-branch: 76 | y@52@01 == Null | dead]
(set-option :timeout 0)
(push) ; 14
; [then-branch: 76 | y@52@01 != Null]
(assert (not (= y@52@01 $Ref.null)))
(push) ; 15
(set-option :timeout 10)
(assert (not (= l@18@01 y@52@01)))
(check-sat)
; unknown
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01))) y@52@01)))
(check-sat)
; unsat
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
; [eval] r != null
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= l@18@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
; [then-branch: 77 | l@18@01 != Null | live]
; [else-branch: 77 | l@18@01 == Null | dead]
(set-option :timeout 0)
(push) ; 15
; [then-branch: 77 | l@18@01 != Null]
; [eval] old(Nodereverse_vals$(this$_4)) == (l == null ? Seq[Int]() : Nodereverse_vals$(l)) ++ (r == null ? Seq[Int]() : Nodevals$(r))
; [eval] old(Nodereverse_vals$(this$_4))
; [eval] Nodereverse_vals$(this$_4)
(push) ; 16
; [eval] this$_3 != null
(declare-const $k@53@01 $Perm)
(assert ($Perm.isReadVar $k@53@01))
(assert (< $k@53@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@53@01)))
(push) ; 17
(set-option :timeout 10)
(assert (not (< $Perm.No $k@53@01)))
(check-sat)
; unsat
(pop) ; 17
; 0,00s
; (get-info :all-statistics)
(pop) ; 16
; Joined path conditions
(assert ($Perm.isReadVar $k@53@01))
(assert (and (< $k@53@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@53@01))))
; [eval] (l == null ? Seq[Int]() : Nodereverse_vals$(l)) ++ (r == null ? Seq[Int]() : Nodevals$(r))
; [eval] (l == null ? Seq[Int]() : Nodereverse_vals$(l))
; [eval] l == null
(set-option :timeout 0)
(push) ; 16
; [then-branch: 78 | y@52@01 == Null | dead]
; [else-branch: 78 | y@52@01 != Null | live]
(push) ; 17
; [else-branch: 78 | y@52@01 != Null]
; [eval] Nodereverse_vals$(l)
(push) ; 18
; [eval] this$_3 != null
(declare-const $k@54@01 $Perm)
(assert ($Perm.isReadVar $k@54@01))
(push) ; 19
(set-option :timeout 10)
(assert (not (= l@18@01 y@52@01)))
(check-sat)
; unknown
(pop) ; 19
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01))) y@52@01)))
(check-sat)
; unsat
(pop) ; 19
; 0,00s
; (get-info :all-statistics)
(assert (< $k@54@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@54@01)))
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (< $Perm.No $k@54@01)))
(check-sat)
; unsat
(pop) ; 19
; 0,00s
; (get-info :all-statistics)
(assert (Nodereverse_vals$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))))) y@52@01))
(pop) ; 18
; Joined path conditions
(assert ($Perm.isReadVar $k@54@01))
(assert (and
  (< $k@54@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@54@01))
  (Nodereverse_vals$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))))) y@52@01)))
(pop) ; 17
(pop) ; 16
; Joined path conditions
(assert ($Perm.isReadVar $k@54@01))
(assert (=>
  (not (= y@52@01 $Ref.null))
  (and
    (< $k@54@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@54@01))
    (Nodereverse_vals$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))))) y@52@01))))
; [eval] (r == null ? Seq[Int]() : Nodevals$(r))
; [eval] r == null
(set-option :timeout 0)
(push) ; 16
; [then-branch: 79 | l@18@01 == Null | dead]
; [else-branch: 79 | l@18@01 != Null | live]
(push) ; 17
; [else-branch: 79 | l@18@01 != Null]
; [eval] Nodevals$(r)
(push) ; 18
; [eval] this$_2 != null
(declare-const $k@55@01 $Perm)
(assert ($Perm.isReadVar $k@55@01))
(assert (< $k@55@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@55@01)))
(push) ; 19
(set-option :timeout 10)
(assert (not (< $Perm.No $k@55@01)))
(check-sat)
; unsat
(pop) ; 19
; 0,00s
; (get-info :all-statistics)
(assert (Nodevals$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@17@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
      $Snap.unit))) l@18@01))
(pop) ; 18
; Joined path conditions
(assert ($Perm.isReadVar $k@55@01))
(assert (and
  (< $k@55@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@55@01))
  (Nodevals$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@17@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
        $Snap.unit))) l@18@01)))
(pop) ; 17
(pop) ; 16
; Joined path conditions
(assert ($Perm.isReadVar $k@55@01))
(assert (=>
  (not (= l@18@01 $Ref.null))
  (and
    (< $k@55@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@55@01))
    (Nodevals$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@17@01)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
          $Snap.unit))) l@18@01))))
(set-option :timeout 0)
(push) ; 16
(assert (not (Seq_equal
  (Nodereverse_vals$ ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) this$_4@3@01)
  (Seq_append
    (Nodereverse_vals$ ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))))) y@52@01)
    (Nodevals$ ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@17@01)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
          $Snap.unit))) l@18@01)))))
(check-sat)
; unsat
(pop) ; 16
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (Nodereverse_vals$ ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) this$_4@3@01)
  (Seq_append
    (Nodereverse_vals$ ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))))) y@52@01)
    (Nodevals$ ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@17@01)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
          $Snap.unit))) l@18@01))))
(pop) ; 15
(pop) ; 14
(pop) ; 13
(pop) ; 12
(pop) ; 11
(push) ; 11
; [else-branch: 73 | First:(Second:(Second:(First:($t@19@01)))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
  $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Nodelist$%trigger ($Snap.second ($Snap.second ($Snap.first $t@19@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01)))))
; [exec]
; fold acc(Nodelist$(l.Nodenext$), write)
; [eval] this$_1.Nodenext$ != null
; [then-branch: 80 | First:(Second:(Second:(First:($t@19@01)))) != Null | dead]
; [else-branch: 80 | First:(Second:(Second:(First:($t@19@01)))) == Null | live]
(set-option :timeout 0)
(push) ; 12
; [else-branch: 80 | First:(Second:(Second:(First:($t@19@01)))) == Null]
(assert (Nodelist$%trigger ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
    $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01)))))
; [exec]
; y := l.Nodenext$
(declare-const y@56@01 $Ref)
(assert (= y@56@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01)))))
; [exec]
; l.Nodenext$ := r
; [exec]
; r := l
; [exec]
; fold acc(Nodelist$(r), write)
; [eval] this$_1.Nodenext$ != null
; [then-branch: 81 | r@17@01 != Null | dead]
; [else-branch: 81 | r@17@01 == Null | live]
(push) ; 13
; [else-branch: 81 | r@17@01 == Null]
(assert (Nodelist$%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@17@01)
  ($Snap.combine ($Snap.first ($Snap.second ($Snap.first $t@19@01))) $Snap.unit)) l@18@01))
(push) ; 14
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01))) l@18@01)))
(check-sat)
; unknown
(pop) ; 14
; 0,00s
; (get-info :all-statistics)
; [exec]
; l := y
; Loop head block: Re-establish invariant
; [eval] l != null
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (= y@56@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 14
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (not (= y@56@01 $Ref.null))))
(check-sat)
; unsat
(pop) ; 14
; 0,00s
; (get-info :all-statistics)
; [then-branch: 82 | y@56@01 != Null | live]
; [else-branch: 82 | y@56@01 == Null | dead]
(set-option :timeout 0)
(push) ; 14
; [then-branch: 82 | y@56@01 != Null]
(assert (not (= y@56@01 $Ref.null)))
(push) ; 15
(set-option :timeout 10)
(assert (not (= l@18@01 y@56@01)))
(check-sat)
; unknown
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01))) y@56@01)))
(check-sat)
; unsat
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
; [eval] r != null
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= l@18@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
; [then-branch: 83 | l@18@01 != Null | live]
; [else-branch: 83 | l@18@01 == Null | dead]
(set-option :timeout 0)
(push) ; 15
; [then-branch: 83 | l@18@01 != Null]
; [eval] old(Nodereverse_vals$(this$_4)) == (l == null ? Seq[Int]() : Nodereverse_vals$(l)) ++ (r == null ? Seq[Int]() : Nodevals$(r))
; [eval] old(Nodereverse_vals$(this$_4))
; [eval] Nodereverse_vals$(this$_4)
(push) ; 16
; [eval] this$_3 != null
(declare-const $k@57@01 $Perm)
(assert ($Perm.isReadVar $k@57@01))
(assert (< $k@57@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@57@01)))
(push) ; 17
(set-option :timeout 10)
(assert (not (< $Perm.No $k@57@01)))
(check-sat)
; unsat
(pop) ; 17
; 0,00s
; (get-info :all-statistics)
(pop) ; 16
; Joined path conditions
(assert ($Perm.isReadVar $k@57@01))
(assert (and (< $k@57@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@57@01))))
; [eval] (l == null ? Seq[Int]() : Nodereverse_vals$(l)) ++ (r == null ? Seq[Int]() : Nodevals$(r))
; [eval] (l == null ? Seq[Int]() : Nodereverse_vals$(l))
; [eval] l == null
(set-option :timeout 0)
(push) ; 16
; [then-branch: 84 | y@56@01 == Null | dead]
; [else-branch: 84 | y@56@01 != Null | live]
(push) ; 17
; [else-branch: 84 | y@56@01 != Null]
; [eval] Nodereverse_vals$(l)
(push) ; 18
; [eval] this$_3 != null
(declare-const $k@58@01 $Perm)
(assert ($Perm.isReadVar $k@58@01))
(push) ; 19
(set-option :timeout 10)
(assert (not (= l@18@01 y@56@01)))
(check-sat)
; unknown
(pop) ; 19
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01))) y@56@01)))
(check-sat)
; unsat
(pop) ; 19
; 0,00s
; (get-info :all-statistics)
(assert (< $k@58@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@58@01)))
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (< $Perm.No $k@58@01)))
(check-sat)
; unsat
(pop) ; 19
; 0,00s
; (get-info :all-statistics)
(assert (Nodereverse_vals$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
      $Snap.unit))) y@56@01))
(pop) ; 18
; Joined path conditions
(assert ($Perm.isReadVar $k@58@01))
(assert (and
  (< $k@58@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@58@01))
  (Nodereverse_vals$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
        $Snap.unit))) y@56@01)))
(pop) ; 17
(pop) ; 16
; Joined path conditions
(assert ($Perm.isReadVar $k@58@01))
(assert (=>
  (not (= y@56@01 $Ref.null))
  (and
    (< $k@58@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@58@01))
    (Nodereverse_vals$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
          $Snap.unit))) y@56@01))))
; [eval] (r == null ? Seq[Int]() : Nodevals$(r))
; [eval] r == null
(set-option :timeout 0)
(push) ; 16
; [then-branch: 85 | l@18@01 == Null | dead]
; [else-branch: 85 | l@18@01 != Null | live]
(push) ; 17
; [else-branch: 85 | l@18@01 != Null]
; [eval] Nodevals$(r)
(push) ; 18
; [eval] this$_2 != null
(declare-const $k@59@01 $Perm)
(assert ($Perm.isReadVar $k@59@01))
(assert (< $k@59@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@59@01)))
(push) ; 19
(set-option :timeout 10)
(assert (not (< $Perm.No $k@59@01)))
(check-sat)
; unsat
(pop) ; 19
; 0,00s
; (get-info :all-statistics)
(assert (Nodevals$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@17@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
      $Snap.unit))) l@18@01))
(pop) ; 18
; Joined path conditions
(assert ($Perm.isReadVar $k@59@01))
(assert (and
  (< $k@59@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@59@01))
  (Nodevals$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@17@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
        $Snap.unit))) l@18@01)))
(pop) ; 17
(pop) ; 16
; Joined path conditions
(assert ($Perm.isReadVar $k@59@01))
(assert (=>
  (not (= l@18@01 $Ref.null))
  (and
    (< $k@59@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@59@01))
    (Nodevals$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@17@01)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
          $Snap.unit))) l@18@01))))
(set-option :timeout 0)
(push) ; 16
(assert (not (Seq_equal
  (Nodereverse_vals$ ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) this$_4@3@01)
  (Seq_append
    (Nodereverse_vals$ ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
          $Snap.unit))) y@56@01)
    (Nodevals$ ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@17@01)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
          $Snap.unit))) l@18@01)))))
(check-sat)
; unsat
(pop) ; 16
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (Nodereverse_vals$ ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) this$_4@3@01)
  (Seq_append
    (Nodereverse_vals$ ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
          $Snap.unit))) y@56@01)
    (Nodevals$ ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@17@01)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
          $Snap.unit))) l@18@01))))
(pop) ; 15
(pop) ; 14
(pop) ; 13
(pop) ; 12
(pop) ; 11
(pop) ; 10
; [eval] !(l.Nodenext$ != null)
; [eval] l.Nodenext$ != null
; [then-branch: 86 | First:(First:($t@19@01)) == Null | dead]
; [else-branch: 86 | First:(First:($t@19@01)) != Null | live]
(push) ; 10
; [else-branch: 86 | First:(First:($t@19@01)) != Null]
(pop) ; 10
(pop) ; 9
(push) ; 9
; [else-branch: 71 | First:(First:($t@19@01)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01))) $Ref.null))
(assert (= ($Snap.second ($Snap.second ($Snap.first $t@19@01))) $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Nodelist$%trigger ($Snap.first $t@19@01) l@18@01))
; [eval] l.Nodenext$ != null
; [then-branch: 87 | First:(First:($t@19@01)) != Null | dead]
; [else-branch: 87 | First:(First:($t@19@01)) == Null | live]
(set-option :timeout 0)
(push) ; 10
; [else-branch: 87 | First:(First:($t@19@01)) == Null]
(pop) ; 10
; [eval] !(l.Nodenext$ != null)
; [eval] l.Nodenext$ != null
(push) ; 10
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 88 | First:(First:($t@19@01)) == Null | live]
; [else-branch: 88 | First:(First:($t@19@01)) != Null | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 88 | First:(First:($t@19@01)) == Null]
; [exec]
; y := l.Nodenext$
(declare-const y@60@01 $Ref)
(assert (= y@60@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@19@01)))))
; [exec]
; l.Nodenext$ := r
; [exec]
; r := l
; [exec]
; fold acc(Nodelist$(r), write)
; [eval] this$_1.Nodenext$ != null
; [then-branch: 89 | r@17@01 != Null | dead]
; [else-branch: 89 | r@17@01 == Null | live]
(push) ; 11
; [else-branch: 89 | r@17@01 == Null]
(assert (Nodelist$%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@17@01)
  ($Snap.combine ($Snap.first ($Snap.second ($Snap.first $t@19@01))) $Snap.unit)) l@18@01))
; [exec]
; l := y
; Loop head block: Re-establish invariant
; [eval] l != null
(push) ; 12
(set-option :timeout 10)
(assert (not (= y@60@01 $Ref.null)))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
; [then-branch: 90 | y@60@01 != Null | dead]
; [else-branch: 90 | y@60@01 == Null | live]
(set-option :timeout 0)
(push) ; 12
; [else-branch: 90 | y@60@01 == Null]
(assert (= y@60@01 $Ref.null))
; [eval] r != null
(push) ; 13
(set-option :timeout 10)
(assert (not (= l@18@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
; [then-branch: 91 | l@18@01 != Null | live]
; [else-branch: 91 | l@18@01 == Null | dead]
(set-option :timeout 0)
(push) ; 13
; [then-branch: 91 | l@18@01 != Null]
; [eval] old(Nodereverse_vals$(this$_4)) == (l == null ? Seq[Int]() : Nodereverse_vals$(l)) ++ (r == null ? Seq[Int]() : Nodevals$(r))
; [eval] old(Nodereverse_vals$(this$_4))
; [eval] Nodereverse_vals$(this$_4)
(push) ; 14
; [eval] this$_3 != null
(declare-const $k@61@01 $Perm)
(assert ($Perm.isReadVar $k@61@01))
(assert (< $k@61@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@61@01)))
(push) ; 15
(set-option :timeout 10)
(assert (not (< $Perm.No $k@61@01)))
(check-sat)
; unsat
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
(pop) ; 14
; Joined path conditions
(assert ($Perm.isReadVar $k@61@01))
(assert (and (< $k@61@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@61@01))))
; [eval] (l == null ? Seq[Int]() : Nodereverse_vals$(l)) ++ (r == null ? Seq[Int]() : Nodevals$(r))
; [eval] (l == null ? Seq[Int]() : Nodereverse_vals$(l))
; [eval] l == null
(set-option :timeout 0)
(push) ; 14
(push) ; 15
(set-option :timeout 10)
(assert (not (not (= y@60@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
; [then-branch: 92 | y@60@01 == Null | live]
; [else-branch: 92 | y@60@01 != Null | dead]
(set-option :timeout 0)
(push) ; 15
; [then-branch: 92 | y@60@01 == Null]
; [eval] Seq[Int]()
(pop) ; 15
(pop) ; 14
; Joined path conditions
; [eval] (r == null ? Seq[Int]() : Nodevals$(r))
; [eval] r == null
(push) ; 14
; [then-branch: 93 | l@18@01 == Null | dead]
; [else-branch: 93 | l@18@01 != Null | live]
(push) ; 15
; [else-branch: 93 | l@18@01 != Null]
; [eval] Nodevals$(r)
(push) ; 16
; [eval] this$_2 != null
(declare-const $k@62@01 $Perm)
(assert ($Perm.isReadVar $k@62@01))
(assert (< $k@62@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@62@01)))
(push) ; 17
(set-option :timeout 10)
(assert (not (< $Perm.No $k@62@01)))
(check-sat)
; unsat
(pop) ; 17
; 0,00s
; (get-info :all-statistics)
(assert (Nodevals$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@17@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
      $Snap.unit))) l@18@01))
(pop) ; 16
; Joined path conditions
(assert ($Perm.isReadVar $k@62@01))
(assert (and
  (< $k@62@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@62@01))
  (Nodevals$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@17@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
        $Snap.unit))) l@18@01)))
(pop) ; 15
(pop) ; 14
; Joined path conditions
(assert ($Perm.isReadVar $k@62@01))
(assert (=>
  (not (= l@18@01 $Ref.null))
  (and
    (< $k@62@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@62@01))
    (Nodevals$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@17@01)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
          $Snap.unit))) l@18@01))))
(set-option :timeout 0)
(push) ; 14
(assert (not (Seq_equal
  (Nodereverse_vals$ ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) this$_4@3@01)
  (Seq_append
    (as Seq_empty  Seq<Int>)
    (Nodevals$ ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@17@01)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
          $Snap.unit))) l@18@01)))))
(check-sat)
; unsat
(pop) ; 14
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (Nodereverse_vals$ ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) this$_4@3@01)
  (Seq_append
    (as Seq_empty  Seq<Int>)
    (Nodevals$ ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@17@01)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
          $Snap.unit))) l@18@01))))
(pop) ; 13
(pop) ; 12
(pop) ; 11
(pop) ; 10
(pop) ; 9
(pop) ; 8
(pop) ; 7
; [eval] !(l != null)
; [eval] l != null
; [then-branch: 94 | l@18@01 == Null | dead]
; [else-branch: 94 | l@18@01 != Null | live]
(push) ; 7
; [else-branch: 94 | l@18@01 != Null]
(pop) ; 7
(pop) ; 6
(push) ; 6
(assert ($Perm.isReadVar $k@25@01))
(assert ($Perm.isReadVar $k@26@01))
(assert (not (= r@17@01 $Ref.null)))
(assert (= ($Snap.second ($Snap.second $t@19@01)) $Snap.unit))
(assert (< $k@25@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@25@01)))
(assert (=>
  (not (= r@17@01 $Ref.null))
  (and
    (< $k@26@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@26@01))
    (Nodevals$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second $t@19@01))) r@17@01))))
(assert (Seq_equal
  (Nodereverse_vals$ ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) this$_4@3@01)
  (Seq_append
    (as Seq_empty  Seq<Int>)
    (Nodevals$ ($Snap.combine $Snap.unit ($Snap.first ($Snap.second $t@19@01))) r@17@01))))
(assert (= l@18@01 $Ref.null))
(assert (= ($Snap.first $t@19@01) $Snap.unit))
(assert (=
  ($Snap.second $t@19@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@19@01))
    ($Snap.second ($Snap.second $t@19@01)))))
(assert (= $t@19@01 ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 7
; [eval] l != null
(pop) ; 7
(push) ; 7
; [eval] !(l != null)
; [eval] l != null
(pop) ; 7
; Loop head block: Follow loop-internal edges
; [eval] l != null
; [then-branch: 95 | l@18@01 != Null | dead]
; [else-branch: 95 | l@18@01 == Null | live]
(push) ; 7
; [else-branch: 95 | l@18@01 == Null]
(pop) ; 7
; [eval] !(l != null)
; [eval] l != null
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= l@18@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 96 | l@18@01 == Null | live]
; [else-branch: 96 | l@18@01 != Null | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 96 | l@18@01 == Null]
; [eval] r != null
; [eval] Nodevals$(r) == old(Nodereverse_vals$(this$_4))
; [eval] Nodevals$(r)
(push) ; 8
; [eval] this$_2 != null
(declare-const $k@63@01 $Perm)
(assert ($Perm.isReadVar $k@63@01))
(assert (< $k@63@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@63@01)))
(push) ; 9
(set-option :timeout 10)
(assert (not (< $Perm.No $k@63@01)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (Nodevals$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@19@01))) r@17@01))
(pop) ; 8
; Joined path conditions
(assert ($Perm.isReadVar $k@63@01))
(assert (and
  (< $k@63@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@63@01))
  (Nodevals$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second $t@19@01))) r@17@01)))
; [eval] old(Nodereverse_vals$(this$_4))
; [eval] Nodereverse_vals$(this$_4)
(set-option :timeout 0)
(push) ; 8
; [eval] this$_3 != null
(declare-const $k@64@01 $Perm)
(assert ($Perm.isReadVar $k@64@01))
(assert (< $k@64@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@64@01)))
(push) ; 9
(set-option :timeout 10)
(assert (not (< $Perm.No $k@64@01)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
; Joined path conditions
(assert ($Perm.isReadVar $k@64@01))
(assert (and (< $k@64@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@64@01))))
(set-option :timeout 0)
(push) ; 8
(assert (not (Seq_equal
  (Nodevals$ ($Snap.combine $Snap.unit ($Snap.first ($Snap.second $t@19@01))) r@17@01)
  (Nodereverse_vals$ ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) this$_4@3@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (Nodevals$ ($Snap.combine $Snap.unit ($Snap.first ($Snap.second $t@19@01))) r@17@01)
  (Nodereverse_vals$ ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) this$_4@3@01)))
(pop) ; 7
(pop) ; 6
(push) ; 6
(assert ($Perm.isReadVar $k@27@01))
(assert (= r@17@01 $Ref.null))
(assert (= ($Snap.first ($Snap.second $t@19@01)) $Snap.unit))
(assert (= ($Snap.second ($Snap.second $t@19@01)) $Snap.unit))
(assert (< $k@27@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@27@01)))
(assert (Seq_equal
  (Nodereverse_vals$ ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) this$_4@3@01)
  (Seq_append (as Seq_empty  Seq<Int>) (as Seq_empty  Seq<Int>))))
(assert (= l@18@01 $Ref.null))
(assert (= ($Snap.first $t@19@01) $Snap.unit))
(assert (=
  ($Snap.second $t@19@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@19@01))
    ($Snap.second ($Snap.second $t@19@01)))))
(assert (= $t@19@01 ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unsat
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
