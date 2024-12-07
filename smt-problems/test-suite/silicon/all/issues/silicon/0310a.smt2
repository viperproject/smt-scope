(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:54:41
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0310a.vpr
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
(declare-sort Set<$Ref> 0)
(declare-sort Set<$Snap> 0)
(declare-sort $FVF<f> 0)
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
; Declaring additional sort wrappers
(declare-fun $SortWrappers.Set<$Ref>To$Snap (Set<$Ref>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<$Ref> ($Snap) Set<$Ref>)
(assert (forall ((x Set<$Ref>)) (!
    (= x ($SortWrappers.$SnapToSet<$Ref>($SortWrappers.Set<$Ref>To$Snap x)))
    :pattern (($SortWrappers.Set<$Ref>To$Snap x))
    :qid |$Snap.$SnapToSet<$Ref>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<$Ref>To$Snap($SortWrappers.$SnapToSet<$Ref> x)))
    :pattern (($SortWrappers.$SnapToSet<$Ref> x))
    :qid |$Snap.Set<$Ref>To$SnapToSet<$Ref>|
    )))
(declare-fun $SortWrappers.Set<$Snap>To$Snap (Set<$Snap>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<$Snap> ($Snap) Set<$Snap>)
(assert (forall ((x Set<$Snap>)) (!
    (= x ($SortWrappers.$SnapToSet<$Snap>($SortWrappers.Set<$Snap>To$Snap x)))
    :pattern (($SortWrappers.Set<$Snap>To$Snap x))
    :qid |$Snap.$SnapToSet<$Snap>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<$Snap>To$Snap($SortWrappers.$SnapToSet<$Snap> x)))
    :pattern (($SortWrappers.$SnapToSet<$Snap> x))
    :qid |$Snap.Set<$Snap>To$SnapToSet<$Snap>|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.$FVF<f>To$Snap ($FVF<f>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<f> ($Snap) $FVF<f>)
(assert (forall ((x $FVF<f>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<f>($SortWrappers.$FVF<f>To$Snap x)))
    :pattern (($SortWrappers.$FVF<f>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<f>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<f>To$Snap($SortWrappers.$SnapTo$FVF<f> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<f> x))
    :qid |$Snap.$FVF<f>To$SnapTo$FVF<f>|
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
(declare-fun Set_card (Set<$Ref>) Int)
(declare-const Set_empty Set<$Ref>)
(declare-fun Set_in ($Ref Set<$Ref>) Bool)
(declare-fun Set_singleton ($Ref) Set<$Ref>)
(declare-fun Set_unionone (Set<$Ref> $Ref) Set<$Ref>)
(declare-fun Set_union (Set<$Ref> Set<$Ref>) Set<$Ref>)
(declare-fun Set_intersection (Set<$Ref> Set<$Ref>) Set<$Ref>)
(declare-fun Set_difference (Set<$Ref> Set<$Ref>) Set<$Ref>)
(declare-fun Set_subset (Set<$Ref> Set<$Ref>) Bool)
(declare-fun Set_equal (Set<$Ref> Set<$Ref>) Bool)
(declare-fun Set_skolem_diff (Set<$Ref> Set<$Ref>) $Ref)
(declare-fun Set_card (Set<$Snap>) Int)
(declare-const Set_empty Set<$Snap>)
(declare-fun Set_in ($Snap Set<$Snap>) Bool)
(declare-fun Set_singleton ($Snap) Set<$Snap>)
(declare-fun Set_unionone (Set<$Snap> $Snap) Set<$Snap>)
(declare-fun Set_union (Set<$Snap> Set<$Snap>) Set<$Snap>)
(declare-fun Set_intersection (Set<$Snap> Set<$Snap>) Set<$Snap>)
(declare-fun Set_difference (Set<$Snap> Set<$Snap>) Set<$Snap>)
(declare-fun Set_subset (Set<$Snap> Set<$Snap>) Bool)
(declare-fun Set_equal (Set<$Snap> Set<$Snap>) Bool)
(declare-fun Set_skolem_diff (Set<$Snap> Set<$Snap>) $Snap)
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
; /field_value_functions_declarations.smt2 [f: Ref]
(declare-fun $FVF.domain_f ($FVF<f>) Set<$Ref>)
(declare-fun $FVF.lookup_f ($FVF<f> $Ref) $Ref)
(declare-fun $FVF.after_f ($FVF<f> $FVF<f>) Bool)
(declare-fun $FVF.loc_f ($Ref $Ref) Bool)
(declare-fun $FVF.perm_f ($FPM $Ref) $Perm)
(declare-const $fvfTOP_f $FVF<f>)
(declare-fun MWSF_apply ($MWSF $Snap) $Snap)
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
(assert (forall ((s Set<$Ref>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o $Ref)) (!
  (not (Set_in o (as Set_empty  Set<$Ref>)))
  :pattern ((Set_in o (as Set_empty  Set<$Ref>)))
  )))
(assert (forall ((s Set<$Ref>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<$Ref>)))
    (=> (not (= (Set_card s) 0)) (exists ((x $Ref))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r $Ref)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r $Ref) (o $Ref)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r $Ref)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<$Ref>) (x $Ref) (o $Ref)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<$Ref>) (x $Ref)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<$Ref>) (x $Ref) (y $Ref)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<$Ref>) (x $Ref)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<$Ref>) (x $Ref)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>) (o $Ref)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>) (y $Ref)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>) (y $Ref)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>) (o $Ref)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>) (o $Ref)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>) (y $Ref)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
  (and
    (=
      (+
        (+ (Set_card (Set_difference a b)) (Set_card (Set_difference b a)))
        (Set_card (Set_intersection a b)))
      (Set_card (Set_union a b)))
    (=
      (Set_card (Set_difference a b))
      (- (Set_card a) (Set_card (Set_intersection a b)))))
  :pattern ((Set_card (Set_difference a b)))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
  (=
    (Set_subset a b)
    (forall ((o $Ref)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
  (or
    (and (Set_equal a b) (= a b))
    (and
      (not (Set_equal a b))
      (and
        (not (= a b))
        (and
          (= (Set_skolem_diff a b) (Set_skolem_diff b a))
          (not
            (= (Set_in (Set_skolem_diff a b) a) (Set_in (Set_skolem_diff a b) b)))))))
  :pattern ((Set_equal a b))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
  (=> (Set_equal a b) (= a b))
  :pattern ((Set_equal a b))
  )))
(assert (forall ((s Set<$Snap>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o $Snap)) (!
  (not (Set_in o (as Set_empty  Set<$Snap>)))
  :pattern ((Set_in o (as Set_empty  Set<$Snap>)))
  )))
(assert (forall ((s Set<$Snap>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<$Snap>)))
    (=> (not (= (Set_card s) 0)) (exists ((x $Snap))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r $Snap)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r $Snap) (o $Snap)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r $Snap)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<$Snap>) (x $Snap) (o $Snap)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<$Snap>) (x $Snap)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<$Snap>) (x $Snap) (y $Snap)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<$Snap>) (x $Snap)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<$Snap>) (x $Snap)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>) (o $Snap)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>) (y $Snap)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>) (y $Snap)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>) (o $Snap)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>) (o $Snap)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>) (y $Snap)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>)) (!
  (and
    (=
      (+
        (+ (Set_card (Set_difference a b)) (Set_card (Set_difference b a)))
        (Set_card (Set_intersection a b)))
      (Set_card (Set_union a b)))
    (=
      (Set_card (Set_difference a b))
      (- (Set_card a) (Set_card (Set_intersection a b)))))
  :pattern ((Set_card (Set_difference a b)))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>)) (!
  (=
    (Set_subset a b)
    (forall ((o $Snap)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>)) (!
  (or
    (and (Set_equal a b) (= a b))
    (and
      (not (Set_equal a b))
      (and
        (not (= a b))
        (and
          (= (Set_skolem_diff a b) (Set_skolem_diff b a))
          (not
            (= (Set_in (Set_skolem_diff a b) a) (Set_in (Set_skolem_diff a b) b)))))))
  :pattern ((Set_equal a b))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>)) (!
  (=> (Set_equal a b) (= a b))
  :pattern ((Set_equal a b))
  )))
; /field_value_functions_axioms.smt2 [f: Ref]
(assert (forall ((vs $FVF<f>) (ws $FVF<f>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_f vs) ($FVF.domain_f ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_f vs))
            (= ($FVF.lookup_f vs x) ($FVF.lookup_f ws x)))
          :pattern (($FVF.lookup_f vs x) ($FVF.lookup_f ws x))
          :qid |qp.$FVF<f>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<f>To$Snap vs)
              ($SortWrappers.$FVF<f>To$Snap ws)
              )
    :qid |qp.$FVF<f>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_f pm r))
    :pattern (($FVF.perm_f pm r)))))
(assert (forall ((r $Ref) (f $Ref)) (!
    (= ($FVF.loc_f f r) true)
    :pattern (($FVF.loc_f f r)))))
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
; ---------- test01 ----------
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
; var xs: Set[Ref]
(declare-const xs@0@01 Set<$Ref>)
; [exec]
; var oldxs: Set[Ref]
(declare-const oldxs@1@01 Set<$Ref>)
; [exec]
; var y: Ref
(declare-const y@2@01 $Ref)
; [exec]
; oldxs := xs
; [exec]
; inhale (y in xs)
(declare-const $t@3@01 $Snap)
(assert (= $t@3@01 $Snap.unit))
; [eval] (y in xs)
(assert (Set_in y@2@01 xs@0@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x: Ref ::(x in xs) ==> acc(x.f, write))
(declare-const x@4@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs)
(assert (Set_in x@4@01 xs@0@01))
(pop) ; 3
(declare-const $t@5@01 $FVF<f>)
(declare-fun inv@6@01 ($Ref) $Ref)
(declare-fun img@7@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@4@01 $Ref) (x2@4@01 $Ref)) (!
  (=>
    (and (Set_in x1@4@01 xs@0@01) (Set_in x2@4@01 xs@0@01) (= x1@4@01 x2@4@01))
    (= x1@4@01 x2@4@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@4@01 $Ref)) (!
  (=>
    (Set_in x@4@01 xs@0@01)
    (and (= (inv@6@01 x@4@01) x@4@01) (img@7@01 x@4@01)))
  :pattern ((Set_in x@4@01 xs@0@01))
  :pattern ((inv@6@01 x@4@01))
  :pattern ((img@7@01 x@4@01))
  :qid |quant-u-1|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@7@01 r) (Set_in (inv@6@01 r) xs@0@01)) (= (inv@6@01 r) r))
  :pattern ((inv@6@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@4@01 $Ref)) (!
  (=> (Set_in x@4@01 xs@0@01) (not (= x@4@01 $Ref.null)))
  :pattern ((Set_in x@4@01 xs@0@01))
  :pattern ((inv@6@01 x@4@01))
  :pattern ((img@7@01 x@4@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; package (forall x: Ref ::(x in xs) ==> acc(x.f, write)) --*
; (forall x: Ref ::(x in oldxs) ==> acc(x.f, write)) {
; }
(set-option :timeout 0)
(push) ; 3
(declare-const $t@8@01 $Snap)
(declare-const x@9@01 $Ref)
(push) ; 4
; [eval] (x in xs)
(assert (Set_in x@9@01 xs@0@01))
(pop) ; 4
(declare-fun inv@10@01 ($Ref) $Ref)
(declare-fun img@11@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((x1@9@01 $Ref) (x2@9@01 $Ref)) (!
  (=>
    (and (Set_in x1@9@01 xs@0@01) (Set_in x2@9@01 xs@0@01) (= x1@9@01 x2@9@01))
    (= x1@9@01 x2@9@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@9@01 $Ref)) (!
  (=>
    (Set_in x@9@01 xs@0@01)
    (and (= (inv@10@01 x@9@01) x@9@01) (img@11@01 x@9@01)))
  :pattern ((Set_in x@9@01 xs@0@01))
  :pattern ((inv@10@01 x@9@01))
  :pattern ((img@11@01 x@9@01))
  :qid |quant-u-3|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@11@01 r) (Set_in (inv@10@01 r) xs@0@01)) (= (inv@10@01 r) r))
  :pattern ((inv@10@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@9@01 $Ref)) (!
  (=> (Set_in x@9@01 xs@0@01) (not (= x@9@01 $Ref.null)))
  :pattern ((Set_in x@9@01 xs@0@01))
  :pattern ((inv@10@01 x@9@01))
  :pattern ((img@11@01 x@9@01))
  :qid |f-permImpliesNonNull|)))
(declare-const x@12@01 $Ref)
(push) ; 4
; [eval] (x in oldxs)
(assert (Set_in x@12@01 xs@0@01))
(pop) ; 4
(declare-fun inv@13@01 ($Ref) $Ref)
(declare-fun img@14@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((x1@12@01 $Ref) (x2@12@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@12@01 xs@0@01)
      (Set_in x2@12@01 xs@0@01)
      (= x1@12@01 x2@12@01))
    (= x1@12@01 x2@12@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@12@01 $Ref)) (!
  (=>
    (Set_in x@12@01 xs@0@01)
    (and (= (inv@13@01 x@12@01) x@12@01) (img@14@01 x@12@01)))
  :pattern ((Set_in x@12@01 xs@0@01))
  :pattern ((inv@13@01 x@12@01))
  :pattern ((img@14@01 x@12@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@14@01 r) (Set_in (inv@13@01 r) xs@0@01)) (= (inv@13@01 r) r))
  :pattern ((inv@13@01 r))
  :qid |f-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  false
  
  :qid |quant-u-5|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@13@01 r) xs@0@01) (img@14@01 r) (= r (inv@13@01 r)))
    false)
  
  :qid |quant-u-6|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@15@01 $FVF<f>)
; Definitional axioms for snapshot map values
(declare-fun inv@16@01 ($Ref) $Ref)
(declare-fun img@17@01 ($Ref) Bool)
(set-option :timeout 10)
(check-sat)
; unknown
; Precomputing data for removing quantified permissions
(define-fun pTaken@18@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@13@01 r) xs@0@01) (img@14@01 r) (= r (inv@13@01 r)))
    ($Perm.min
      (ite
        (and (img@11@01 r) (Set_in (inv@10@01 r) xs@0@01))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@11@01 r) (Set_in (inv@10@01 r) xs@0@01))
        $Perm.Write
        $Perm.No)
      (pTaken@18@01 r))
    $Perm.No)
  
  :qid |quant-u-8|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@13@01 r) xs@0@01) (img@14@01 r) (= r (inv@13@01 r)))
    (= (- $Perm.Write (pTaken@18@01 r)) $Perm.No))
  
  :qid |quant-u-9|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@19@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@11@01 r) (Set_in (inv@10@01 r) xs@0@01))
    (=
      ($FVF.lookup_f (as sm@19@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> $t@8@01) r)))
  :pattern (($FVF.lookup_f (as sm@19@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> $t@8@01) r))
  :qid |qp.fvfValDef0|)))
(declare-fun inv@20@01 ($Ref) $Ref)
(declare-fun img@21@01 ($Ref) Bool)
(assert (forall ((r $Ref)) (!
  (=> (and (img@21@01 r) (Set_in (inv@13@01 r) xs@0@01)) (= (inv@20@01 r) r))
  :pattern ((inv@20@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((x@12@01 $Ref)) (!
  (=>
    (Set_in (inv@13@01 x@12@01) xs@0@01)
    (and (= (inv@20@01 x@12@01) x@12@01) (img@21@01 x@12@01)))
  :pattern ((inv@20@01 x@12@01))
  :pattern ((img@21@01 x@12@01))
  :qid |f-invOfFct|)))
(assert (= (as sm@15@01  $FVF<f>) (as sm@19@01  $FVF<f>)))
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (=
    (and (img@21@01 r) (Set_in (inv@13@01 r) xs@0@01))
    (and (img@17@01 r) (Set_in (inv@13@01 r) xs@0@01)))
  
  :qid |quant-u-10|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Create MagicWandSnapFunction for wand (forall x: Ref ::(x in xs) ==> acc(x.f, write)) --* (forall x: Ref ::(x in oldxs) ==> acc(x.f, write))
(declare-const mwsf@22@01 $MWSF)
(assert (forall (($t@8@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@22@01 $t@8@01)
    ($SortWrappers.$FVF<f>To$Snap (as sm@19@01  $FVF<f>)))
  :pattern ((MWSF_apply mwsf@22@01 $t@8@01))
  :qid |quant-u-11|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@8@01 $Snap)) (!
  (and
    (forall ((r $Ref)) (!
      (=>
        (and (img@11@01 r) (Set_in (inv@10@01 r) xs@0@01))
        (=
          ($FVF.lookup_f (as sm@19@01  $FVF<f>) r)
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> $t@8@01) r)))
      :pattern (($FVF.lookup_f (as sm@19@01  $FVF<f>) r))
      :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> $t@8@01) r))
      :qid |qp.fvfValDef0|))
    (=
      (MWSF_apply mwsf@22@01 $t@8@01)
      ($SortWrappers.$FVF<f>To$Snap (as sm@19@01  $FVF<f>))))
  :pattern ((MWSF_apply mwsf@22@01 $t@8@01))
  :qid |quant-u-12|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@11@01 r) (Set_in (inv@10@01 r) xs@0@01)) (= (inv@10@01 r) r))
  :pattern ((inv@10@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((x@9@01 $Ref)) (!
  (=>
    (Set_in x@9@01 xs@0@01)
    (and (= (inv@10@01 x@9@01) x@9@01) (img@11@01 x@9@01)))
  :pattern ((Set_in x@9@01 xs@0@01))
  :pattern ((inv@10@01 x@9@01))
  :pattern ((img@11@01 x@9@01))
  :qid |quant-u-3|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@21@01 r) (Set_in (inv@13@01 r) xs@0@01)) (= (inv@20@01 r) r))
  :pattern ((inv@20@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((x@12@01 $Ref)) (!
  (=>
    (Set_in (inv@13@01 x@12@01) xs@0@01)
    (and (= (inv@20@01 x@12@01) x@12@01) (img@21@01 x@12@01)))
  :pattern ((inv@20@01 x@12@01))
  :pattern ((img@21@01 x@12@01))
  :qid |f-invOfFct|)))
(assert (= (as sm@15@01  $FVF<f>) (as sm@19@01  $FVF<f>)))
; [exec]
; xs := (xs setminus Set(y))
; [eval] (xs setminus Set(y))
; [eval] Set(y)
(declare-const xs@23@01 Set<$Ref>)
(assert (= xs@23@01 (Set_difference xs@0@01 (Set_singleton y@2@01))))
; [exec]
; apply (forall x: Ref ::(x in xs) ==> acc(x.f, write)) --*
;   (forall x: Ref ::(x in oldxs) ==> acc(x.f, write))
(push) ; 4
(set-option :timeout 10)
(assert (not (Set_equal xs@0@01 xs@23@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@24@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@7@01 r) (Set_in (inv@6@01 r) xs@0@01))
    (= ($FVF.lookup_f (as sm@24@01  $FVF<f>) r) ($FVF.lookup_f $t@5@01 r)))
  :pattern (($FVF.lookup_f (as sm@24@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@5@01 r))
  :qid |qp.fvfValDef1|)))
(declare-const pm@25@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@25@01  $FPM) r)
    (ite (and (img@7@01 r) (Set_in (inv@6@01 r) xs@0@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_f (as pm@25@01  $FPM) r))
  :qid |qp.resPrmSumDef2|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@25@01  $FPM) r) $Perm.Write)
  :pattern ((inv@6@01 r))
  :qid |qp-fld-prm-bnd|)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (Set_equal xs@0@01 xs@23@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@26@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@7@01 r) (Set_in (inv@6@01 r) xs@0@01))
    (= ($FVF.lookup_f (as sm@26@01  $FVF<f>) r) ($FVF.lookup_f $t@5@01 r)))
  :pattern (($FVF.lookup_f (as sm@26@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@5@01 r))
  :qid |qp.fvfValDef3|)))
(declare-const pm@27@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@27@01  $FPM) r)
    (ite (and (img@7@01 r) (Set_in (inv@6@01 r) xs@0@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_f (as pm@27@01  $FPM) r))
  :qid |qp.resPrmSumDef4|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@27@01  $FPM) r) $Perm.Write)
  :pattern ((inv@6@01 r))
  :qid |qp-fld-prm-bnd|)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (Set_equal xs@0@01 xs@23@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (Set_equal xs@0@01 xs@23@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test03 ----------
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
; var xs: Set[Ref]
(declare-const xs@28@01 Set<$Ref>)
; [exec]
; var oldxs: Set[Ref]
(declare-const oldxs@29@01 Set<$Ref>)
; [exec]
; var y: Ref
(declare-const y@30@01 $Ref)
; [exec]
; oldxs := xs
; [exec]
; inhale (y in xs)
(declare-const $t@31@01 $Snap)
(assert (= $t@31@01 $Snap.unit))
; [eval] (y in xs)
(assert (Set_in y@30@01 xs@28@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x: Ref ::(x in xs) ==> acc(x.f, write))
(declare-const x@32@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs)
(assert (Set_in x@32@01 xs@28@01))
(pop) ; 3
(declare-const $t@33@01 $FVF<f>)
(declare-fun inv@34@01 ($Ref) $Ref)
(declare-fun img@35@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@32@01 $Ref) (x2@32@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@32@01 xs@28@01)
      (Set_in x2@32@01 xs@28@01)
      (= x1@32@01 x2@32@01))
    (= x1@32@01 x2@32@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@32@01 $Ref)) (!
  (=>
    (Set_in x@32@01 xs@28@01)
    (and (= (inv@34@01 x@32@01) x@32@01) (img@35@01 x@32@01)))
  :pattern ((Set_in x@32@01 xs@28@01))
  :pattern ((inv@34@01 x@32@01))
  :pattern ((img@35@01 x@32@01))
  :qid |quant-u-14|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@35@01 r) (Set_in (inv@34@01 r) xs@28@01)) (= (inv@34@01 r) r))
  :pattern ((inv@34@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@32@01 $Ref)) (!
  (=> (Set_in x@32@01 xs@28@01) (not (= x@32@01 $Ref.null)))
  :pattern ((Set_in x@32@01 xs@28@01))
  :pattern ((inv@34@01 x@32@01))
  :pattern ((img@35@01 x@32@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; package (forall x: Ref ::(x in xs) ==> acc(x.f, write)) --*
; (forall x: Ref ::(x in oldxs) ==> acc(x.f, write)) {
; }
(set-option :timeout 0)
(push) ; 3
(declare-const $t@36@01 $Snap)
(declare-const x@37@01 $Ref)
(push) ; 4
; [eval] (x in xs)
(assert (Set_in x@37@01 xs@28@01))
(pop) ; 4
(declare-fun inv@38@01 ($Ref) $Ref)
(declare-fun img@39@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((x1@37@01 $Ref) (x2@37@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@37@01 xs@28@01)
      (Set_in x2@37@01 xs@28@01)
      (= x1@37@01 x2@37@01))
    (= x1@37@01 x2@37@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@37@01 $Ref)) (!
  (=>
    (Set_in x@37@01 xs@28@01)
    (and (= (inv@38@01 x@37@01) x@37@01) (img@39@01 x@37@01)))
  :pattern ((Set_in x@37@01 xs@28@01))
  :pattern ((inv@38@01 x@37@01))
  :pattern ((img@39@01 x@37@01))
  :qid |quant-u-16|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@39@01 r) (Set_in (inv@38@01 r) xs@28@01)) (= (inv@38@01 r) r))
  :pattern ((inv@38@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@37@01 $Ref)) (!
  (=> (Set_in x@37@01 xs@28@01) (not (= x@37@01 $Ref.null)))
  :pattern ((Set_in x@37@01 xs@28@01))
  :pattern ((inv@38@01 x@37@01))
  :pattern ((img@39@01 x@37@01))
  :qid |f-permImpliesNonNull|)))
(declare-const x@40@01 $Ref)
(push) ; 4
; [eval] (x in oldxs)
(assert (Set_in x@40@01 xs@28@01))
(pop) ; 4
(declare-fun inv@41@01 ($Ref) $Ref)
(declare-fun img@42@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((x1@40@01 $Ref) (x2@40@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@40@01 xs@28@01)
      (Set_in x2@40@01 xs@28@01)
      (= x1@40@01 x2@40@01))
    (= x1@40@01 x2@40@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@40@01 $Ref)) (!
  (=>
    (Set_in x@40@01 xs@28@01)
    (and (= (inv@41@01 x@40@01) x@40@01) (img@42@01 x@40@01)))
  :pattern ((Set_in x@40@01 xs@28@01))
  :pattern ((inv@41@01 x@40@01))
  :pattern ((img@42@01 x@40@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@42@01 r) (Set_in (inv@41@01 r) xs@28@01)) (= (inv@41@01 r) r))
  :pattern ((inv@41@01 r))
  :qid |f-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  false
  
  :qid |quant-u-18|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@41@01 r) xs@28@01) (img@42@01 r) (= r (inv@41@01 r)))
    false)
  
  :qid |quant-u-19|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@43@01 $FVF<f>)
; Definitional axioms for snapshot map values
(declare-fun inv@44@01 ($Ref) $Ref)
(declare-fun img@45@01 ($Ref) Bool)
(set-option :timeout 10)
(check-sat)
; unknown
; Precomputing data for removing quantified permissions
(define-fun pTaken@46@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@41@01 r) xs@28@01) (img@42@01 r) (= r (inv@41@01 r)))
    ($Perm.min
      (ite
        (and (img@39@01 r) (Set_in (inv@38@01 r) xs@28@01))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@39@01 r) (Set_in (inv@38@01 r) xs@28@01))
        $Perm.Write
        $Perm.No)
      (pTaken@46@01 r))
    $Perm.No)
  
  :qid |quant-u-21|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@41@01 r) xs@28@01) (img@42@01 r) (= r (inv@41@01 r)))
    (= (- $Perm.Write (pTaken@46@01 r)) $Perm.No))
  
  :qid |quant-u-22|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@47@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@39@01 r) (Set_in (inv@38@01 r) xs@28@01))
    (=
      ($FVF.lookup_f (as sm@47@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> $t@36@01) r)))
  :pattern (($FVF.lookup_f (as sm@47@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> $t@36@01) r))
  :qid |qp.fvfValDef5|)))
(declare-fun inv@48@01 ($Ref) $Ref)
(declare-fun img@49@01 ($Ref) Bool)
(assert (forall ((r $Ref)) (!
  (=> (and (img@49@01 r) (Set_in (inv@41@01 r) xs@28@01)) (= (inv@48@01 r) r))
  :pattern ((inv@48@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((x@40@01 $Ref)) (!
  (=>
    (Set_in (inv@41@01 x@40@01) xs@28@01)
    (and (= (inv@48@01 x@40@01) x@40@01) (img@49@01 x@40@01)))
  :pattern ((inv@48@01 x@40@01))
  :pattern ((img@49@01 x@40@01))
  :qid |f-invOfFct|)))
(assert (= (as sm@43@01  $FVF<f>) (as sm@47@01  $FVF<f>)))
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (=
    (and (img@49@01 r) (Set_in (inv@41@01 r) xs@28@01))
    (and (img@45@01 r) (Set_in (inv@41@01 r) xs@28@01)))
  
  :qid |quant-u-23|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Create MagicWandSnapFunction for wand (forall x: Ref ::(x in xs) ==> acc(x.f, write)) --* (forall x: Ref ::(x in oldxs) ==> acc(x.f, write))
(declare-const mwsf@50@01 $MWSF)
(assert (forall (($t@36@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@50@01 $t@36@01)
    ($SortWrappers.$FVF<f>To$Snap (as sm@47@01  $FVF<f>)))
  :pattern ((MWSF_apply mwsf@50@01 $t@36@01))
  :qid |quant-u-24|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@36@01 $Snap)) (!
  (and
    (forall ((r $Ref)) (!
      (=>
        (and (img@39@01 r) (Set_in (inv@38@01 r) xs@28@01))
        (=
          ($FVF.lookup_f (as sm@47@01  $FVF<f>) r)
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> $t@36@01) r)))
      :pattern (($FVF.lookup_f (as sm@47@01  $FVF<f>) r))
      :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> $t@36@01) r))
      :qid |qp.fvfValDef5|))
    (=
      (MWSF_apply mwsf@50@01 $t@36@01)
      ($SortWrappers.$FVF<f>To$Snap (as sm@47@01  $FVF<f>))))
  :pattern ((MWSF_apply mwsf@50@01 $t@36@01))
  :qid |quant-u-25|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@39@01 r) (Set_in (inv@38@01 r) xs@28@01)) (= (inv@38@01 r) r))
  :pattern ((inv@38@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((x@37@01 $Ref)) (!
  (=>
    (Set_in x@37@01 xs@28@01)
    (and (= (inv@38@01 x@37@01) x@37@01) (img@39@01 x@37@01)))
  :pattern ((Set_in x@37@01 xs@28@01))
  :pattern ((inv@38@01 x@37@01))
  :pattern ((img@39@01 x@37@01))
  :qid |quant-u-16|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@49@01 r) (Set_in (inv@41@01 r) xs@28@01)) (= (inv@48@01 r) r))
  :pattern ((inv@48@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((x@40@01 $Ref)) (!
  (=>
    (Set_in (inv@41@01 x@40@01) xs@28@01)
    (and (= (inv@48@01 x@40@01) x@40@01) (img@49@01 x@40@01)))
  :pattern ((inv@48@01 x@40@01))
  :pattern ((img@49@01 x@40@01))
  :qid |f-invOfFct|)))
(assert (= (as sm@43@01  $FVF<f>) (as sm@47@01  $FVF<f>)))
; [exec]
; xs := (xs setminus Set[Ref]())
; [eval] (xs setminus Set[Ref]())
; [eval] Set[Ref]()
(declare-const xs@51@01 Set<$Ref>)
(assert (= xs@51@01 (Set_difference xs@28@01 (as Set_empty  Set<$Ref>))))
; [exec]
; apply (forall x: Ref ::(x in xs) ==> acc(x.f, write)) --*
;   (forall x: Ref ::(x in oldxs) ==> acc(x.f, write))
(push) ; 4
(set-option :timeout 10)
(assert (not (Set_equal xs@28@01 xs@51@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const x@52@01 $Ref)
(set-option :timeout 0)
(push) ; 4
; [eval] (x in xs)
(assert (Set_in x@52@01 xs@51@01))
(pop) ; 4
(declare-fun inv@53@01 ($Ref) $Ref)
(declare-fun img@54@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((x1@52@01 $Ref) (x2@52@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@52@01 xs@51@01)
      (Set_in x2@52@01 xs@51@01)
      (= x1@52@01 x2@52@01))
    (= x1@52@01 x2@52@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@52@01 $Ref)) (!
  (=>
    (Set_in x@52@01 xs@51@01)
    (and (= (inv@53@01 x@52@01) x@52@01) (img@54@01 x@52@01)))
  :pattern ((Set_in x@52@01 xs@51@01))
  :pattern ((inv@53@01 x@52@01))
  :pattern ((img@54@01 x@52@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@54@01 r) (Set_in (inv@53@01 r) xs@51@01)) (= (inv@53@01 r) r))
  :pattern ((inv@53@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@55@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@53@01 r) xs@51@01) (img@54@01 r) (= r (inv@53@01 r)))
    ($Perm.min
      (ite
        (and (img@35@01 r) (Set_in (inv@34@01 r) xs@28@01))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@35@01 r) (Set_in (inv@34@01 r) xs@28@01))
        $Perm.Write
        $Perm.No)
      (pTaken@55@01 r))
    $Perm.No)
  
  :qid |quant-u-28|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@53@01 r) xs@51@01) (img@54@01 r) (= r (inv@53@01 r)))
    (= (- $Perm.Write (pTaken@55@01 r)) $Perm.No))
  
  :qid |quant-u-29|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@56@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@35@01 r) (Set_in (inv@34@01 r) xs@28@01))
    (= ($FVF.lookup_f (as sm@56@01  $FVF<f>) r) ($FVF.lookup_f $t@33@01 r)))
  :pattern (($FVF.lookup_f (as sm@56@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@33@01 r))
  :qid |qp.fvfValDef6|)))
(declare-const x@57@01 $Ref)
(set-option :timeout 0)
(push) ; 4
; [eval] (x in oldxs)
(assert (Set_in x@57@01 xs@28@01))
(pop) ; 4
(declare-fun inv@58@01 ($Ref) $Ref)
(declare-fun img@59@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((x1@57@01 $Ref) (x2@57@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@57@01 xs@28@01)
      (Set_in x2@57@01 xs@28@01)
      (= x1@57@01 x2@57@01))
    (= x1@57@01 x2@57@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@57@01 $Ref)) (!
  (=>
    (Set_in x@57@01 xs@28@01)
    (and (= (inv@58@01 x@57@01) x@57@01) (img@59@01 x@57@01)))
  :pattern ((Set_in x@57@01 xs@28@01))
  :pattern ((inv@58@01 x@57@01))
  :pattern ((img@59@01 x@57@01))
  :qid |quant-u-31|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@59@01 r) (Set_in (inv@58@01 r) xs@28@01)) (= (inv@58@01 r) r))
  :pattern ((inv@58@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@57@01 $Ref)) (!
  (=> (Set_in x@57@01 xs@28@01) (not (= x@57@01 $Ref.null)))
  :pattern ((Set_in x@57@01 xs@28@01))
  :pattern ((inv@58@01 x@57@01))
  :pattern ((img@59@01 x@57@01))
  :qid |f-permImpliesNonNull|)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@60@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@59@01 r) (Set_in (inv@58@01 r) xs@28@01))
    (=
      ($FVF.lookup_f (as sm@60@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> (MWSF_apply mwsf@50@01 ($SortWrappers.$FVF<f>To$Snap (as sm@56@01  $FVF<f>)))) r)))
  :pattern (($FVF.lookup_f (as sm@60@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> (MWSF_apply mwsf@50@01 ($SortWrappers.$FVF<f>To$Snap (as sm@56@01  $FVF<f>)))) r))
  :qid |qp.fvfValDef7|)))
(declare-const pm@61@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@61@01  $FPM) r)
    (ite
      (and (img@59@01 r) (Set_in (inv@58@01 r) xs@28@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@61@01  $FPM) r))
  :qid |qp.resPrmSumDef8|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@61@01  $FPM) r) $Perm.Write)
  :pattern ((inv@58@01 r))
  :qid |qp-fld-prm-bnd|)))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
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
; var xs: Seq[Ref]
(declare-const xs@62@01 Seq<$Ref>)
; [exec]
; var oldxs: Seq[Ref]
(declare-const oldxs@63@01 Seq<$Ref>)
; [exec]
; oldxs := xs
; [exec]
; inhale 10 < |xs|
(declare-const $t@64@01 $Snap)
(assert (= $t@64@01 $Snap.unit))
; [eval] 10 < |xs|
; [eval] |xs|
(assert (< 10 (Seq_length xs@62@01)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int, j: Int ::
;     { xs[i], xs[j] }
;     i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==>
;     xs[i] != xs[j])
(declare-const $t@65@01 $Snap)
(assert (= $t@65@01 $Snap.unit))
; [eval] (forall i: Int, j: Int :: { xs[i], xs[j] } i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j])
(declare-const i@66@01 Int)
(declare-const j@67@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j]
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j)))
; [eval] i >= 0
(push) ; 4
; [then-branch: 0 | !(i@66@01 >= 0) | live]
; [else-branch: 0 | i@66@01 >= 0 | live]
(push) ; 5
; [then-branch: 0 | !(i@66@01 >= 0)]
(assert (not (>= i@66@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | i@66@01 >= 0]
(assert (>= i@66@01 0))
; [eval] i < |xs|
; [eval] |xs|
(push) ; 6
; [then-branch: 1 | !(i@66@01 < |xs@62@01|) | live]
; [else-branch: 1 | i@66@01 < |xs@62@01| | live]
(push) ; 7
; [then-branch: 1 | !(i@66@01 < |xs@62@01|)]
(assert (not (< i@66@01 (Seq_length xs@62@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 1 | i@66@01 < |xs@62@01|]
(assert (< i@66@01 (Seq_length xs@62@01)))
; [eval] j >= 0
(push) ; 8
; [then-branch: 2 | !(j@67@01 >= 0) | live]
; [else-branch: 2 | j@67@01 >= 0 | live]
(push) ; 9
; [then-branch: 2 | !(j@67@01 >= 0)]
(assert (not (>= j@67@01 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 2 | j@67@01 >= 0]
(assert (>= j@67@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 10
; [then-branch: 3 | !(j@67@01 < |xs@62@01|) | live]
; [else-branch: 3 | j@67@01 < |xs@62@01| | live]
(push) ; 11
; [then-branch: 3 | !(j@67@01 < |xs@62@01|)]
(assert (not (< j@67@01 (Seq_length xs@62@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 3 | j@67@01 < |xs@62@01|]
(assert (< j@67@01 (Seq_length xs@62@01)))
; [eval] i != j
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (< j@67@01 (Seq_length xs@62@01)) (not (< j@67@01 (Seq_length xs@62@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@67@01 0)
  (and
    (>= j@67@01 0)
    (or
      (< j@67@01 (Seq_length xs@62@01))
      (not (< j@67@01 (Seq_length xs@62@01)))))))
(assert (or (>= j@67@01 0) (not (>= j@67@01 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@66@01 (Seq_length xs@62@01))
  (and
    (< i@66@01 (Seq_length xs@62@01))
    (=>
      (>= j@67@01 0)
      (and
        (>= j@67@01 0)
        (or
          (< j@67@01 (Seq_length xs@62@01))
          (not (< j@67@01 (Seq_length xs@62@01))))))
    (or (>= j@67@01 0) (not (>= j@67@01 0))))))
(assert (or (< i@66@01 (Seq_length xs@62@01)) (not (< i@66@01 (Seq_length xs@62@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= i@66@01 0)
  (and
    (>= i@66@01 0)
    (=>
      (< i@66@01 (Seq_length xs@62@01))
      (and
        (< i@66@01 (Seq_length xs@62@01))
        (=>
          (>= j@67@01 0)
          (and
            (>= j@67@01 0)
            (or
              (< j@67@01 (Seq_length xs@62@01))
              (not (< j@67@01 (Seq_length xs@62@01))))))
        (or (>= j@67@01 0) (not (>= j@67@01 0)))))
    (or
      (< i@66@01 (Seq_length xs@62@01))
      (not (< i@66@01 (Seq_length xs@62@01)))))))
(assert (or (>= i@66@01 0) (not (>= i@66@01 0))))
(push) ; 4
; [then-branch: 4 | i@66@01 >= 0 && i@66@01 < |xs@62@01| && j@67@01 >= 0 && j@67@01 < |xs@62@01| && i@66@01 != j@67@01 | live]
; [else-branch: 4 | !(i@66@01 >= 0 && i@66@01 < |xs@62@01| && j@67@01 >= 0 && j@67@01 < |xs@62@01| && i@66@01 != j@67@01) | live]
(push) ; 5
; [then-branch: 4 | i@66@01 >= 0 && i@66@01 < |xs@62@01| && j@67@01 >= 0 && j@67@01 < |xs@62@01| && i@66@01 != j@67@01]
(assert (and
  (>= i@66@01 0)
  (and
    (< i@66@01 (Seq_length xs@62@01))
    (and
      (>= j@67@01 0)
      (and (< j@67@01 (Seq_length xs@62@01)) (not (= i@66@01 j@67@01)))))))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
; [eval] xs[j]
(pop) ; 5
(push) ; 5
; [else-branch: 4 | !(i@66@01 >= 0 && i@66@01 < |xs@62@01| && j@67@01 >= 0 && j@67@01 < |xs@62@01| && i@66@01 != j@67@01)]
(assert (not
  (and
    (>= i@66@01 0)
    (and
      (< i@66@01 (Seq_length xs@62@01))
      (and
        (>= j@67@01 0)
        (and (< j@67@01 (Seq_length xs@62@01)) (not (= i@66@01 j@67@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= i@66@01 0)
    (and
      (< i@66@01 (Seq_length xs@62@01))
      (and
        (>= j@67@01 0)
        (and (< j@67@01 (Seq_length xs@62@01)) (not (= i@66@01 j@67@01))))))
  (and
    (>= i@66@01 0)
    (< i@66@01 (Seq_length xs@62@01))
    (>= j@67@01 0)
    (< j@67@01 (Seq_length xs@62@01))
    (not (= i@66@01 j@67@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= i@66@01 0)
      (and
        (< i@66@01 (Seq_length xs@62@01))
        (and
          (>= j@67@01 0)
          (and (< j@67@01 (Seq_length xs@62@01)) (not (= i@66@01 j@67@01)))))))
  (and
    (>= i@66@01 0)
    (and
      (< i@66@01 (Seq_length xs@62@01))
      (and
        (>= j@67@01 0)
        (and (< j@67@01 (Seq_length xs@62@01)) (not (= i@66@01 j@67@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@66@01 Int) (j@67@01 Int)) (!
  (and
    (=>
      (>= i@66@01 0)
      (and
        (>= i@66@01 0)
        (=>
          (< i@66@01 (Seq_length xs@62@01))
          (and
            (< i@66@01 (Seq_length xs@62@01))
            (=>
              (>= j@67@01 0)
              (and
                (>= j@67@01 0)
                (or
                  (< j@67@01 (Seq_length xs@62@01))
                  (not (< j@67@01 (Seq_length xs@62@01))))))
            (or (>= j@67@01 0) (not (>= j@67@01 0)))))
        (or
          (< i@66@01 (Seq_length xs@62@01))
          (not (< i@66@01 (Seq_length xs@62@01))))))
    (or (>= i@66@01 0) (not (>= i@66@01 0)))
    (=>
      (and
        (>= i@66@01 0)
        (and
          (< i@66@01 (Seq_length xs@62@01))
          (and
            (>= j@67@01 0)
            (and (< j@67@01 (Seq_length xs@62@01)) (not (= i@66@01 j@67@01))))))
      (and
        (>= i@66@01 0)
        (< i@66@01 (Seq_length xs@62@01))
        (>= j@67@01 0)
        (< j@67@01 (Seq_length xs@62@01))
        (not (= i@66@01 j@67@01))))
    (or
      (not
        (and
          (>= i@66@01 0)
          (and
            (< i@66@01 (Seq_length xs@62@01))
            (and
              (>= j@67@01 0)
              (and (< j@67@01 (Seq_length xs@62@01)) (not (= i@66@01 j@67@01)))))))
      (and
        (>= i@66@01 0)
        (and
          (< i@66@01 (Seq_length xs@62@01))
          (and
            (>= j@67@01 0)
            (and (< j@67@01 (Seq_length xs@62@01)) (not (= i@66@01 j@67@01))))))))
  :pattern ((Seq_index xs@62@01 i@66@01) (Seq_index xs@62@01 j@67@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0310a.vpr@43@10@43@102-aux|)))
(assert (forall ((i@66@01 Int) (j@67@01 Int)) (!
  (=>
    (and
      (>= i@66@01 0)
      (and
        (< i@66@01 (Seq_length xs@62@01))
        (and
          (>= j@67@01 0)
          (and (< j@67@01 (Seq_length xs@62@01)) (not (= i@66@01 j@67@01))))))
    (not (= (Seq_index xs@62@01 i@66@01) (Seq_index xs@62@01 j@67@01))))
  :pattern ((Seq_index xs@62@01 i@66@01) (Seq_index xs@62@01 j@67@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0310a.vpr@43@10@43@102|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int ::0 <= i && i < |xs| ==> acc(xs[i].f, write))
(declare-const i@68@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 4
; [then-branch: 5 | !(0 <= i@68@01) | live]
; [else-branch: 5 | 0 <= i@68@01 | live]
(push) ; 5
; [then-branch: 5 | !(0 <= i@68@01)]
(assert (not (<= 0 i@68@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 5 | 0 <= i@68@01]
(assert (<= 0 i@68@01))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@68@01) (not (<= 0 i@68@01))))
(assert (and (<= 0 i@68@01) (< i@68@01 (Seq_length xs@62@01))))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@68@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-const $t@69@01 $FVF<f>)
(declare-fun inv@70@01 ($Ref) Int)
(declare-fun img@71@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@68@01 Int)) (!
  (=>
    (and (<= 0 i@68@01) (< i@68@01 (Seq_length xs@62@01)))
    (or (<= 0 i@68@01) (not (<= 0 i@68@01))))
  :pattern ((Seq_index xs@62@01 i@68@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@68@01 Int) (i2@68@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@68@01) (< i1@68@01 (Seq_length xs@62@01)))
      (and (<= 0 i2@68@01) (< i2@68@01 (Seq_length xs@62@01)))
      (= (Seq_index xs@62@01 i1@68@01) (Seq_index xs@62@01 i2@68@01)))
    (= i1@68@01 i2@68@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@68@01 Int)) (!
  (=>
    (and (<= 0 i@68@01) (< i@68@01 (Seq_length xs@62@01)))
    (and
      (= (inv@70@01 (Seq_index xs@62@01 i@68@01)) i@68@01)
      (img@71@01 (Seq_index xs@62@01 i@68@01))))
  :pattern ((Seq_index xs@62@01 i@68@01))
  :qid |quant-u-33|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@71@01 r)
      (and (<= 0 (inv@70@01 r)) (< (inv@70@01 r) (Seq_length xs@62@01))))
    (= (Seq_index xs@62@01 (inv@70@01 r)) r))
  :pattern ((inv@70@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@68@01 Int)) (!
  (=>
    (and (<= 0 i@68@01) (< i@68@01 (Seq_length xs@62@01)))
    (not (= (Seq_index xs@62@01 i@68@01) $Ref.null)))
  :pattern ((Seq_index xs@62@01 i@68@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; package (forall i: Int ::0 <= i && i < |xs| ==> acc(xs[i].f, write)) --*
; (forall i: Int ::0 <= i && i < |oldxs| ==> acc(oldxs[i].f, write)) {
; }
(set-option :timeout 0)
(push) ; 3
(declare-const $t@72@01 $Snap)
(declare-const i@73@01 Int)
(push) ; 4
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 5
; [then-branch: 6 | !(0 <= i@73@01) | live]
; [else-branch: 6 | 0 <= i@73@01 | live]
(push) ; 6
; [then-branch: 6 | !(0 <= i@73@01)]
(assert (not (<= 0 i@73@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 6 | 0 <= i@73@01]
(assert (<= 0 i@73@01))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@73@01) (not (<= 0 i@73@01))))
(assert (and (<= 0 i@73@01) (< i@73@01 (Seq_length xs@62@01))))
; [eval] xs[i]
(push) ; 5
(assert (not (>= i@73@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@74@01 ($Ref) Int)
(declare-fun img@75@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@73@01 Int)) (!
  (=>
    (and (<= 0 i@73@01) (< i@73@01 (Seq_length xs@62@01)))
    (or (<= 0 i@73@01) (not (<= 0 i@73@01))))
  :pattern ((Seq_index xs@62@01 i@73@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@73@01 Int) (i2@73@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@73@01) (< i1@73@01 (Seq_length xs@62@01)))
      (and (<= 0 i2@73@01) (< i2@73@01 (Seq_length xs@62@01)))
      (= (Seq_index xs@62@01 i1@73@01) (Seq_index xs@62@01 i2@73@01)))
    (= i1@73@01 i2@73@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@73@01 Int)) (!
  (=>
    (and (<= 0 i@73@01) (< i@73@01 (Seq_length xs@62@01)))
    (and
      (= (inv@74@01 (Seq_index xs@62@01 i@73@01)) i@73@01)
      (img@75@01 (Seq_index xs@62@01 i@73@01))))
  :pattern ((Seq_index xs@62@01 i@73@01))
  :qid |quant-u-35|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@75@01 r)
      (and (<= 0 (inv@74@01 r)) (< (inv@74@01 r) (Seq_length xs@62@01))))
    (= (Seq_index xs@62@01 (inv@74@01 r)) r))
  :pattern ((inv@74@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@73@01 Int)) (!
  (=>
    (and (<= 0 i@73@01) (< i@73@01 (Seq_length xs@62@01)))
    (not (= (Seq_index xs@62@01 i@73@01) $Ref.null)))
  :pattern ((Seq_index xs@62@01 i@73@01))
  :qid |f-permImpliesNonNull|)))
(declare-const i@76@01 Int)
(push) ; 4
; [eval] 0 <= i && i < |oldxs|
; [eval] 0 <= i
(push) ; 5
; [then-branch: 7 | !(0 <= i@76@01) | live]
; [else-branch: 7 | 0 <= i@76@01 | live]
(push) ; 6
; [then-branch: 7 | !(0 <= i@76@01)]
(assert (not (<= 0 i@76@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 7 | 0 <= i@76@01]
(assert (<= 0 i@76@01))
; [eval] i < |oldxs|
; [eval] |oldxs|
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@76@01) (not (<= 0 i@76@01))))
(assert (and (<= 0 i@76@01) (< i@76@01 (Seq_length xs@62@01))))
; [eval] oldxs[i]
(push) ; 5
(assert (not (>= i@76@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@77@01 ($Ref) Int)
(declare-fun img@78@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@76@01 Int)) (!
  (=>
    (and (<= 0 i@76@01) (< i@76@01 (Seq_length xs@62@01)))
    (or (<= 0 i@76@01) (not (<= 0 i@76@01))))
  :pattern ((Seq_index xs@62@01 i@76@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@76@01 Int) (i2@76@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@76@01) (< i1@76@01 (Seq_length xs@62@01)))
      (and (<= 0 i2@76@01) (< i2@76@01 (Seq_length xs@62@01)))
      (= (Seq_index xs@62@01 i1@76@01) (Seq_index xs@62@01 i2@76@01)))
    (= i1@76@01 i2@76@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@76@01 Int)) (!
  (=>
    (and (<= 0 i@76@01) (< i@76@01 (Seq_length xs@62@01)))
    (and
      (= (inv@77@01 (Seq_index xs@62@01 i@76@01)) i@76@01)
      (img@78@01 (Seq_index xs@62@01 i@76@01))))
  :pattern ((Seq_index xs@62@01 i@76@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@78@01 r)
      (and (<= 0 (inv@77@01 r)) (< (inv@77@01 r) (Seq_length xs@62@01))))
    (= (Seq_index xs@62@01 (inv@77@01 r)) r))
  :pattern ((inv@77@01 r))
  :qid |f-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  false
  
  :qid |quant-u-37|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and (<= 0 (inv@77@01 r)) (< (inv@77@01 r) (Seq_length xs@62@01)))
      (img@78@01 r)
      (= r (Seq_index xs@62@01 (inv@77@01 r))))
    false)
  
  :qid |quant-u-38|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@79@01 $FVF<f>)
; Definitional axioms for snapshot map values
(declare-fun inv@80@01 ($Ref) Int)
(declare-fun img@81@01 ($Ref) Bool)
(set-option :timeout 10)
(check-sat)
; unknown
; Precomputing data for removing quantified permissions
(define-fun pTaken@82@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@77@01 r)) (< (inv@77@01 r) (Seq_length xs@62@01)))
      (img@78@01 r)
      (= r (Seq_index xs@62@01 (inv@77@01 r))))
    ($Perm.min
      (ite
        (and
          (img@75@01 r)
          (and (<= 0 (inv@74@01 r)) (< (inv@74@01 r) (Seq_length xs@62@01))))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@75@01 r)
          (and (<= 0 (inv@74@01 r)) (< (inv@74@01 r) (Seq_length xs@62@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@82@01 r))
    $Perm.No)
  
  :qid |quant-u-40|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and (<= 0 (inv@77@01 r)) (< (inv@77@01 r) (Seq_length xs@62@01)))
      (img@78@01 r)
      (= r (Seq_index xs@62@01 (inv@77@01 r))))
    (= (- $Perm.Write (pTaken@82@01 r)) $Perm.No))
  
  :qid |quant-u-41|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@83@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@75@01 r)
      (and (<= 0 (inv@74@01 r)) (< (inv@74@01 r) (Seq_length xs@62@01))))
    (=
      ($FVF.lookup_f (as sm@83@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> $t@72@01) r)))
  :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> $t@72@01) r))
  :qid |qp.fvfValDef9|)))
(declare-fun inv@84@01 ($Ref) Int)
(declare-fun img@85@01 ($Ref) Bool)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@85@01 r)
      (and (<= 0 (inv@77@01 r)) (< (inv@77@01 r) (Seq_length xs@62@01))))
    (= (Seq_index xs@62@01 (inv@84@01 r)) r))
  :pattern ((inv@84@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((i@76@01 Int)) (!
  (=>
    (and
      (<= 0 (inv@77@01 (Seq_index xs@62@01 i@76@01)))
      (< (inv@77@01 (Seq_index xs@62@01 i@76@01)) (Seq_length xs@62@01)))
    (and
      (= (inv@84@01 (Seq_index xs@62@01 i@76@01)) i@76@01)
      (img@85@01 (Seq_index xs@62@01 i@76@01))))
  :pattern ((Seq_index xs@62@01 i@76@01))
  :qid |f-invOfFct|)))
(assert (= (as sm@79@01  $FVF<f>) (as sm@83@01  $FVF<f>)))
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (=
    (and
      (img@85@01 r)
      (and (<= 0 (inv@77@01 r)) (< (inv@77@01 r) (Seq_length xs@62@01))))
    (and
      (img@81@01 r)
      (and (<= 0 (inv@77@01 r)) (< (inv@77@01 r) (Seq_length xs@62@01)))))
  
  :qid |quant-u-42|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Create MagicWandSnapFunction for wand (forall i: Int ::0 <= i && i < |xs| ==> acc(xs[i].f, write)) --* (forall i: Int ::0 <= i && i < |oldxs| ==> acc(oldxs[i].f, write))
(declare-const mwsf@86@01 $MWSF)
(assert (forall (($t@72@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@86@01 $t@72@01)
    ($SortWrappers.$FVF<f>To$Snap (as sm@83@01  $FVF<f>)))
  :pattern ((MWSF_apply mwsf@86@01 $t@72@01))
  :qid |quant-u-43|)))
; [eval] |xs|
; [eval] |oldxs|
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@72@01 $Snap)) (!
  (and
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@75@01 r)
          (and (<= 0 (inv@74@01 r)) (< (inv@74@01 r) (Seq_length xs@62@01))))
        (=
          ($FVF.lookup_f (as sm@83@01  $FVF<f>) r)
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> $t@72@01) r)))
      :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
      :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> $t@72@01) r))
      :qid |qp.fvfValDef9|))
    (=
      (MWSF_apply mwsf@86@01 $t@72@01)
      ($SortWrappers.$FVF<f>To$Snap (as sm@83@01  $FVF<f>))))
  :pattern ((MWSF_apply mwsf@86@01 $t@72@01))
  :qid |quant-u-44|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@75@01 r)
      (and (<= 0 (inv@74@01 r)) (< (inv@74@01 r) (Seq_length xs@62@01))))
    (= (Seq_index xs@62@01 (inv@74@01 r)) r))
  :pattern ((inv@74@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((i@73@01 Int)) (!
  (=>
    (and (<= 0 i@73@01) (< i@73@01 (Seq_length xs@62@01)))
    (and
      (= (inv@74@01 (Seq_index xs@62@01 i@73@01)) i@73@01)
      (img@75@01 (Seq_index xs@62@01 i@73@01))))
  :pattern ((Seq_index xs@62@01 i@73@01))
  :qid |quant-u-35|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@85@01 r)
      (and (<= 0 (inv@77@01 r)) (< (inv@77@01 r) (Seq_length xs@62@01))))
    (= (Seq_index xs@62@01 (inv@84@01 r)) r))
  :pattern ((inv@84@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((i@76@01 Int)) (!
  (=>
    (and
      (<= 0 (inv@77@01 (Seq_index xs@62@01 i@76@01)))
      (< (inv@77@01 (Seq_index xs@62@01 i@76@01)) (Seq_length xs@62@01)))
    (and
      (= (inv@84@01 (Seq_index xs@62@01 i@76@01)) i@76@01)
      (img@85@01 (Seq_index xs@62@01 i@76@01))))
  :pattern ((Seq_index xs@62@01 i@76@01))
  :qid |f-invOfFct|)))
(assert (= (as sm@79@01  $FVF<f>) (as sm@83@01  $FVF<f>)))
; [exec]
; xs := xs[1..]
; [eval] xs[1..]
(declare-const xs@87@01 Seq<$Ref>)
(assert (= xs@87@01 (Seq_drop xs@62@01 1)))
; [exec]
; apply (forall i: Int ::0 <= i && i < |xs| ==> acc(xs[i].f, write)) --*
;   (forall i: Int ::0 <= i && i < |oldxs| ==> acc(oldxs[i].f, write))
; [eval] |xs|
; [eval] |oldxs|
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= (Seq_length xs@62@01) (Seq_length xs@87@01))
  (Seq_equal xs@62@01 xs@87@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@88@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@71@01 r)
      (and (<= 0 (inv@70@01 r)) (< (inv@70@01 r) (Seq_length xs@62@01))))
    (= ($FVF.lookup_f (as sm@88@01  $FVF<f>) r) ($FVF.lookup_f $t@69@01 r)))
  :pattern (($FVF.lookup_f (as sm@88@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@69@01 r))
  :qid |qp.fvfValDef10|)))
(declare-const pm@89@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@89@01  $FPM) r)
    (ite
      (and
        (img@71@01 r)
        (and (<= 0 (inv@70@01 r)) (< (inv@70@01 r) (Seq_length xs@62@01))))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@89@01  $FPM) r))
  :qid |qp.resPrmSumDef11|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@89@01  $FPM) r) $Perm.Write)
  :pattern ((inv@70@01 r))
  :qid |qp-fld-prm-bnd|)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= (Seq_length xs@62@01) (Seq_length xs@87@01))
  (Seq_equal xs@62@01 xs@87@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@90@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@71@01 r)
      (and (<= 0 (inv@70@01 r)) (< (inv@70@01 r) (Seq_length xs@62@01))))
    (= ($FVF.lookup_f (as sm@90@01  $FVF<f>) r) ($FVF.lookup_f $t@69@01 r)))
  :pattern (($FVF.lookup_f (as sm@90@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@69@01 r))
  :qid |qp.fvfValDef12|)))
(declare-const pm@91@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@91@01  $FPM) r)
    (ite
      (and
        (img@71@01 r)
        (and (<= 0 (inv@70@01 r)) (< (inv@70@01 r) (Seq_length xs@62@01))))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@91@01  $FPM) r))
  :qid |qp.resPrmSumDef13|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@91@01  $FPM) r) $Perm.Write)
  :pattern ((inv@70@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] |xs|
; [eval] |oldxs|
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= (Seq_length xs@62@01) (Seq_length xs@87@01))
  (Seq_equal xs@62@01 xs@87@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (= (Seq_length xs@62@01) (Seq_length xs@87@01))
  (Seq_equal xs@62@01 xs@87@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 3
(pop) ; 2
(pop) ; 1
