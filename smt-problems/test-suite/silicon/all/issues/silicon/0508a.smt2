(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:57:15
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0508a.vpr
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
(declare-sort Set<Bool> 0)
(declare-sort Set<$Snap> 0)
(declare-sort identity_function<Ref> 0)
(declare-sort $FVF<item> 0)
(declare-sort $FVF<bool_prop> 0)
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
(declare-fun $SortWrappers.Set<Bool>To$Snap (Set<Bool>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<Bool> ($Snap) Set<Bool>)
(assert (forall ((x Set<Bool>)) (!
    (= x ($SortWrappers.$SnapToSet<Bool>($SortWrappers.Set<Bool>To$Snap x)))
    :pattern (($SortWrappers.Set<Bool>To$Snap x))
    :qid |$Snap.$SnapToSet<Bool>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<Bool>To$Snap($SortWrappers.$SnapToSet<Bool> x)))
    :pattern (($SortWrappers.$SnapToSet<Bool> x))
    :qid |$Snap.Set<Bool>To$SnapToSet<Bool>|
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
(declare-fun $SortWrappers.identity_function<Ref>To$Snap (identity_function<Ref>) $Snap)
(declare-fun $SortWrappers.$SnapToidentity_function<Ref> ($Snap) identity_function<Ref>)
(assert (forall ((x identity_function<Ref>)) (!
    (= x ($SortWrappers.$SnapToidentity_function<Ref>($SortWrappers.identity_function<Ref>To$Snap x)))
    :pattern (($SortWrappers.identity_function<Ref>To$Snap x))
    :qid |$Snap.$SnapToidentity_function<Ref>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.identity_function<Ref>To$Snap($SortWrappers.$SnapToidentity_function<Ref> x)))
    :pattern (($SortWrappers.$SnapToidentity_function<Ref> x))
    :qid |$Snap.identity_function<Ref>To$SnapToidentity_function<Ref>|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.$FVF<item>To$Snap ($FVF<item>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<item> ($Snap) $FVF<item>)
(assert (forall ((x $FVF<item>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<item>($SortWrappers.$FVF<item>To$Snap x)))
    :pattern (($SortWrappers.$FVF<item>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<item>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<item>To$Snap($SortWrappers.$SnapTo$FVF<item> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<item> x))
    :qid |$Snap.$FVF<item>To$SnapTo$FVF<item>|
    )))
(declare-fun $SortWrappers.$FVF<bool_prop>To$Snap ($FVF<bool_prop>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<bool_prop> ($Snap) $FVF<bool_prop>)
(assert (forall ((x $FVF<bool_prop>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<bool_prop>($SortWrappers.$FVF<bool_prop>To$Snap x)))
    :pattern (($SortWrappers.$FVF<bool_prop>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<bool_prop>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<bool_prop>To$Snap($SortWrappers.$SnapTo$FVF<bool_prop> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<bool_prop> x))
    :qid |$Snap.$FVF<bool_prop>To$SnapTo$FVF<bool_prop>|
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
(declare-fun Set_card (Set<Bool>) Int)
(declare-const Set_empty Set<Bool>)
(declare-fun Set_in (Bool Set<Bool>) Bool)
(declare-fun Set_singleton (Bool) Set<Bool>)
(declare-fun Set_unionone (Set<Bool> Bool) Set<Bool>)
(declare-fun Set_union (Set<Bool> Set<Bool>) Set<Bool>)
(declare-fun Set_intersection (Set<Bool> Set<Bool>) Set<Bool>)
(declare-fun Set_difference (Set<Bool> Set<Bool>) Set<Bool>)
(declare-fun Set_subset (Set<Bool> Set<Bool>) Bool)
(declare-fun Set_equal (Set<Bool> Set<Bool>) Bool)
(declare-fun Set_skolem_diff (Set<Bool> Set<Bool>) Bool)
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
(declare-fun id<Ref> ($Ref) $Ref)
; /field_value_functions_declarations.smt2 [item: Ref]
(declare-fun $FVF.domain_item ($FVF<item>) Set<$Ref>)
(declare-fun $FVF.lookup_item ($FVF<item> $Ref) $Ref)
(declare-fun $FVF.after_item ($FVF<item> $FVF<item>) Bool)
(declare-fun $FVF.loc_item ($Ref $Ref) Bool)
(declare-fun $FVF.perm_item ($FPM $Ref) $Perm)
(declare-const $fvfTOP_item $FVF<item>)
; /field_value_functions_declarations.smt2 [bool_prop: Bool]
(declare-fun $FVF.domain_bool_prop ($FVF<bool_prop>) Set<$Ref>)
(declare-fun $FVF.lookup_bool_prop ($FVF<bool_prop> $Ref) Bool)
(declare-fun $FVF.after_bool_prop ($FVF<bool_prop> $FVF<bool_prop>) Bool)
(declare-fun $FVF.loc_bool_prop (Bool $Ref) Bool)
(declare-fun $FVF.perm_bool_prop ($FPM $Ref) $Perm)
(declare-const $fvfTOP_bool_prop $FVF<bool_prop>)
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
(assert (forall ((s Set<Bool>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o Bool)) (!
  (not (Set_in o (as Set_empty  Set<Bool>)))
  :pattern ((Set_in o (as Set_empty  Set<Bool>)))
  )))
(assert (forall ((s Set<Bool>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<Bool>)))
    (=> (not (= (Set_card s) 0)) (exists ((x Bool))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r Bool)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r Bool) (o Bool)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r Bool)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<Bool>) (x Bool) (o Bool)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<Bool>) (x Bool)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<Bool>) (x Bool) (y Bool)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<Bool>) (x Bool)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Bool>) (x Bool)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Bool>) (b Set<Bool>) (o Bool)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<Bool>) (b Set<Bool>) (y Bool)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<Bool>) (b Set<Bool>) (y Bool)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<Bool>) (b Set<Bool>) (o Bool)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<Bool>) (b Set<Bool>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<Bool>) (b Set<Bool>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<Bool>) (b Set<Bool>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<Bool>) (b Set<Bool>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<Bool>) (b Set<Bool>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<Bool>) (b Set<Bool>) (o Bool)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<Bool>) (b Set<Bool>) (y Bool)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<Bool>) (b Set<Bool>)) (!
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
(assert (forall ((a Set<Bool>) (b Set<Bool>)) (!
  (=
    (Set_subset a b)
    (forall ((o Bool)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<Bool>) (b Set<Bool>)) (!
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
(assert (forall ((a Set<Bool>) (b Set<Bool>)) (!
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
(assert (forall ((v $Ref)) (!
  (= (id<Ref> v) v)
  :pattern ((id<Ref> v))
  )))
; /field_value_functions_axioms.smt2 [item: Ref]
(assert (forall ((vs $FVF<item>) (ws $FVF<item>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_item vs) ($FVF.domain_item ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_item vs))
            (= ($FVF.lookup_item vs x) ($FVF.lookup_item ws x)))
          :pattern (($FVF.lookup_item vs x) ($FVF.lookup_item ws x))
          :qid |qp.$FVF<item>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<item>To$Snap vs)
              ($SortWrappers.$FVF<item>To$Snap ws)
              )
    :qid |qp.$FVF<item>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_item pm r))
    :pattern (($FVF.perm_item pm r)))))
(assert (forall ((r $Ref) (f $Ref)) (!
    (= ($FVF.loc_item f r) true)
    :pattern (($FVF.loc_item f r)))))
; /field_value_functions_axioms.smt2 [bool_prop: Bool]
(assert (forall ((vs $FVF<bool_prop>) (ws $FVF<bool_prop>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_bool_prop vs) ($FVF.domain_bool_prop ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_bool_prop vs))
            (= ($FVF.lookup_bool_prop vs x) ($FVF.lookup_bool_prop ws x)))
          :pattern (($FVF.lookup_bool_prop vs x) ($FVF.lookup_bool_prop ws x))
          :qid |qp.$FVF<bool_prop>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<bool_prop>To$Snap vs)
              ($SortWrappers.$FVF<bool_prop>To$Snap ws)
              )
    :qid |qp.$FVF<bool_prop>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_bool_prop pm r))
    :pattern (($FVF.perm_bool_prop pm r)))))
(assert (forall ((r $Ref) (f Bool)) (!
    (= ($FVF.loc_bool_prop f r) true)
    :pattern (($FVF.loc_bool_prop f r)))))
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
; ---------- test03a ----------
(declare-const trees@0@01 Set<$Ref>)
(declare-const trees@1@01 Set<$Ref>)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01))))
(declare-const r@3@01 $Ref)
(push) ; 2
; [eval] (r in trees)
(assert (Set_in r@3@01 trees@1@01))
(pop) ; 2
(declare-fun inv@4@01 ($Ref) $Ref)
(declare-fun img@5@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((r1@3@01 $Ref) (r2@3@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@3@01 trees@1@01)
      (Set_in r2@3@01 trees@1@01)
      (= r1@3@01 r2@3@01))
    (= r1@3@01 r2@3@01))
  
  :qid |item-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@3@01 $Ref)) (!
  (=>
    (Set_in r@3@01 trees@1@01)
    (and (= (inv@4@01 r@3@01) r@3@01) (img@5@01 r@3@01)))
  :pattern ((Set_in r@3@01 trees@1@01))
  :qid |quant-u-1|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@5@01 r) (Set_in (inv@4@01 r) trees@1@01)) (= (inv@4@01 r) r))
  :pattern ((inv@4@01 r))
  :qid |item-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((r@3@01 $Ref)) (!
  (=> (Set_in r@3@01 trees@1@01) (not (= r@3@01 $Ref.null)))
  :pattern ((Set_in r@3@01 trees@1@01))
  :qid |item-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@2@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@2@01))
    ($Snap.second ($Snap.second $t@2@01)))))
(assert (= ($Snap.first ($Snap.second $t@2@01)) $Snap.unit))
; [eval] (forall s1: Ref, s2: Ref :: { (s1 in trees), (s2 in trees) } (s1 in trees) && ((s2 in trees) && s1 != s2) ==> s1.item != s2.item)
(declare-const s1@6@01 $Ref)
(declare-const s2@7@01 $Ref)
(push) ; 2
; [eval] (s1 in trees) && ((s2 in trees) && s1 != s2) ==> s1.item != s2.item
; [eval] (s1 in trees) && ((s2 in trees) && s1 != s2)
; [eval] (s1 in trees)
(push) ; 3
; [then-branch: 0 | !(s1@6@01 in trees@1@01) | live]
; [else-branch: 0 | s1@6@01 in trees@1@01 | live]
(push) ; 4
; [then-branch: 0 | !(s1@6@01 in trees@1@01)]
(assert (not (Set_in s1@6@01 trees@1@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | s1@6@01 in trees@1@01]
(assert (Set_in s1@6@01 trees@1@01))
; [eval] (s2 in trees)
(push) ; 5
; [then-branch: 1 | !(s2@7@01 in trees@1@01) | live]
; [else-branch: 1 | s2@7@01 in trees@1@01 | live]
(push) ; 6
; [then-branch: 1 | !(s2@7@01 in trees@1@01)]
(assert (not (Set_in s2@7@01 trees@1@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | s2@7@01 in trees@1@01]
(assert (Set_in s2@7@01 trees@1@01))
; [eval] s1 != s2
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (Set_in s2@7@01 trees@1@01) (not (Set_in s2@7@01 trees@1@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in s1@6@01 trees@1@01)
  (and
    (Set_in s1@6@01 trees@1@01)
    (or (Set_in s2@7@01 trees@1@01) (not (Set_in s2@7@01 trees@1@01))))))
(assert (or (Set_in s1@6@01 trees@1@01) (not (Set_in s1@6@01 trees@1@01))))
(push) ; 3
; [then-branch: 2 | s1@6@01 in trees@1@01 && s2@7@01 in trees@1@01 && s1@6@01 != s2@7@01 | live]
; [else-branch: 2 | !(s1@6@01 in trees@1@01 && s2@7@01 in trees@1@01 && s1@6@01 != s2@7@01) | live]
(push) ; 4
; [then-branch: 2 | s1@6@01 in trees@1@01 && s2@7@01 in trees@1@01 && s1@6@01 != s2@7@01]
(assert (and
  (Set_in s1@6@01 trees@1@01)
  (and (Set_in s2@7@01 trees@1@01) (not (= s1@6@01 s2@7@01)))))
; [eval] s1.item != s2.item
(push) ; 5
(assert (not (and (img@5@01 s1@6@01) (Set_in (inv@4@01 s1@6@01) trees@1@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (and (img@5@01 s2@7@01) (Set_in (inv@4@01 s2@7@01) trees@1@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 2 | !(s1@6@01 in trees@1@01 && s2@7@01 in trees@1@01 && s1@6@01 != s2@7@01)]
(assert (not
  (and
    (Set_in s1@6@01 trees@1@01)
    (and (Set_in s2@7@01 trees@1@01) (not (= s1@6@01 s2@7@01))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (Set_in s1@6@01 trees@1@01)
    (and (Set_in s2@7@01 trees@1@01) (not (= s1@6@01 s2@7@01))))
  (and
    (Set_in s1@6@01 trees@1@01)
    (Set_in s2@7@01 trees@1@01)
    (not (= s1@6@01 s2@7@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in s1@6@01 trees@1@01)
      (and (Set_in s2@7@01 trees@1@01) (not (= s1@6@01 s2@7@01)))))
  (and
    (Set_in s1@6@01 trees@1@01)
    (and (Set_in s2@7@01 trees@1@01) (not (= s1@6@01 s2@7@01))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((s1@6@01 $Ref) (s2@7@01 $Ref)) (!
  (and
    (=>
      (Set_in s1@6@01 trees@1@01)
      (and
        (Set_in s1@6@01 trees@1@01)
        (or (Set_in s2@7@01 trees@1@01) (not (Set_in s2@7@01 trees@1@01)))))
    (or (Set_in s1@6@01 trees@1@01) (not (Set_in s1@6@01 trees@1@01)))
    (=>
      (and
        (Set_in s1@6@01 trees@1@01)
        (and (Set_in s2@7@01 trees@1@01) (not (= s1@6@01 s2@7@01))))
      (and
        (Set_in s1@6@01 trees@1@01)
        (Set_in s2@7@01 trees@1@01)
        (not (= s1@6@01 s2@7@01))))
    (or
      (not
        (and
          (Set_in s1@6@01 trees@1@01)
          (and (Set_in s2@7@01 trees@1@01) (not (= s1@6@01 s2@7@01)))))
      (and
        (Set_in s1@6@01 trees@1@01)
        (and (Set_in s2@7@01 trees@1@01) (not (= s1@6@01 s2@7@01))))))
  :pattern ((Set_in s1@6@01 trees@1@01) (Set_in s2@7@01 trees@1@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0508a.vpr@16@13@16@103-aux|)))
(assert (forall ((s1@6@01 $Ref) (s2@7@01 $Ref)) (!
  (=>
    (and
      (Set_in s1@6@01 trees@1@01)
      (and (Set_in s2@7@01 trees@1@01) (not (= s1@6@01 s2@7@01))))
    (not
      (=
        ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@2@01)) s1@6@01)
        ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@2@01)) s2@7@01))))
  :pattern ((Set_in s1@6@01 trees@1@01) (Set_in s2@7@01 trees@1@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0508a.vpr@16@13@16@103|)))
(declare-const r@8@01 $Ref)
(push) ; 2
; [eval] (r in trees)
(assert (Set_in r@8@01 trees@1@01))
(push) ; 3
(assert (not (and (img@5@01 r@8@01) (Set_in (inv@4@01 r@8@01) trees@1@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@9@01 ($Ref) $Ref)
(declare-fun img@10@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((r1@8@01 $Ref) (r2@8@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@8@01 trees@1@01)
      (Set_in r2@8@01 trees@1@01)
      (=
        ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@2@01)) r1@8@01)
        ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@2@01)) r2@8@01)))
    (= r1@8@01 r2@8@01))
  
  :qid |bool_prop-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@8@01 $Ref)) (!
  (=>
    (Set_in r@8@01 trees@1@01)
    (and
      (=
        (inv@9@01 ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@2@01)) r@8@01))
        r@8@01)
      (img@10@01 ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@2@01)) r@8@01))))
  :pattern ((Set_in r@8@01 trees@1@01))
  :qid |quant-u-3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@10@01 r) (Set_in (inv@9@01 r) trees@1@01))
    (=
      ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@2@01)) (inv@9@01 r))
      r))
  :pattern ((inv@9@01 r))
  :qid |bool_prop-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((r@8@01 $Ref)) (!
  (=>
    (Set_in r@8@01 trees@1@01)
    (not
      (=
        ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@2@01)) r@8@01)
        $Ref.null)))
  :pattern ((Set_in r@8@01 trees@1@01))
  :qid |bool_prop-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert (forall s: Ref ::
;     { (s in trees) }
;     (s in trees) ==> acc(s.item.bool_prop, wildcard))
(declare-const s@11@01 $Ref)
(push) ; 3
; [eval] (s in trees)
(assert (Set_in s@11@01 trees@1@01))
(declare-const $k@12@01 $Perm)
(assert ($Perm.isReadVar $k@12@01))
(push) ; 4
(assert (not (and (img@5@01 s@11@01) (Set_in (inv@4@01 s@11@01) trees@1@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@13@01 ($Ref) $Ref)
(declare-fun img@14@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@12@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((s@11@01 $Ref)) (!
  (=>
    (Set_in s@11@01 trees@1@01)
    (or (= $k@12@01 $Perm.No) (< $Perm.No $k@12@01)))
  
  :qid |quant-u-4|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((s1@11@01 $Ref) (s2@11@01 $Ref)) (!
  (=>
    (and
      (and (Set_in s1@11@01 trees@1@01) (< $Perm.No $k@12@01))
      (and (Set_in s2@11@01 trees@1@01) (< $Perm.No $k@12@01))
      (=
        ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@2@01)) s1@11@01)
        ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@2@01)) s2@11@01)))
    (= s1@11@01 s2@11@01))
  
  :qid |bool_prop-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((s@11@01 $Ref)) (!
  (=>
    (and (Set_in s@11@01 trees@1@01) (< $Perm.No $k@12@01))
    (and
      (=
        (inv@13@01 ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@2@01)) s@11@01))
        s@11@01)
      (img@14@01 ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@2@01)) s@11@01))))
  :pattern ((Set_in s@11@01 trees@1@01))
  :qid |bool_prop-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@14@01 r)
      (and (Set_in (inv@13@01 r) trees@1@01) (< $Perm.No $k@12@01)))
    (=
      ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@2@01)) (inv@13@01 r))
      r))
  :pattern ((inv@13@01 r))
  :qid |bool_prop-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@15@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@13@01 r) trees@1@01)
      (img@14@01 r)
      (=
        r
        ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@2@01)) (inv@13@01 r))))
    ($Perm.min
      (ite
        (and (img@10@01 r) (Set_in (inv@9@01 r) trees@1@01))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      $k@12@01)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@12@01
(assert (forall ((r $Ref)) (!
  (=>
    (not
      (=
        (ite
          (and (img@10@01 r) (Set_in (inv@9@01 r) trees@1@01))
          (/ (to_real 1) (to_real 2))
          $Perm.No)
        $Perm.No))
    (ite
      (and (img@10@01 r) (Set_in (inv@9@01 r) trees@1@01))
      (<
        (ite
          (and
            (Set_in (inv@13@01 r) trees@1@01)
            (img@14@01 r)
            (=
              r
              ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@2@01)) (inv@13@01 r))))
          $k@12@01
          $Perm.No)
        (/ (to_real 1) (to_real 2)))
      (<
        (ite
          (and
            (Set_in (inv@13@01 r) trees@1@01)
            (img@14@01 r)
            (=
              r
              ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@2@01)) (inv@13@01 r))))
          $k@12@01
          $Perm.No)
        $Perm.No)))
  :pattern ((img@10@01 r))
  :pattern ((Set_in (inv@9@01 r) trees@1@01))
  :pattern ((Set_in (inv@13@01 r) trees@1@01))
  :pattern ((img@14@01 r))
  :pattern (($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@2@01)) (inv@13@01 r)))
  :qid |qp.srp0|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@13@01 r) trees@1@01)
      (img@14@01 r)
      (=
        r
        ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@2@01)) (inv@13@01 r))))
    (= (- $k@12@01 (pTaken@15@01 r)) $Perm.No))
  
  :qid |quant-u-7|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@16@01 $FVF<bool_prop>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@10@01 r) (Set_in (inv@9@01 r) trees@1@01))
    (=
      ($FVF.lookup_bool_prop (as sm@16@01  $FVF<bool_prop>) r)
      ($FVF.lookup_bool_prop ($SortWrappers.$SnapTo$FVF<bool_prop> ($Snap.second ($Snap.second $t@2@01))) r)))
  :pattern (($FVF.lookup_bool_prop (as sm@16@01  $FVF<bool_prop>) r))
  :pattern (($FVF.lookup_bool_prop ($SortWrappers.$SnapTo$FVF<bool_prop> ($Snap.second ($Snap.second $t@2@01))) r))
  :qid |qp.fvfValDef1|)))
(pop) ; 2
(pop) ; 1
; ---------- test03b ----------
(declare-const trees@17@01 Set<$Ref>)
(declare-const trees@18@01 Set<$Ref>)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@19@01 $Snap)
(assert (= $t@19@01 ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01))))
(declare-const r@20@01 $Ref)
(push) ; 2
; [eval] (r in trees)
(assert (Set_in r@20@01 trees@18@01))
; [eval] (id(r): Ref)
(pop) ; 2
(declare-fun inv@21@01 ($Ref) $Ref)
(declare-fun img@22@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((r1@20@01 $Ref) (r2@20@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@20@01 trees@18@01)
      (Set_in r2@20@01 trees@18@01)
      (= (id<Ref> r1@20@01) (id<Ref> r2@20@01)))
    (= r1@20@01 r2@20@01))
  
  :qid |item-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@20@01 $Ref)) (!
  (=>
    (Set_in r@20@01 trees@18@01)
    (and (= (inv@21@01 (id<Ref> r@20@01)) r@20@01) (img@22@01 (id<Ref> r@20@01))))
  :pattern ((id<Ref> r@20@01))
  :qid |quant-u-9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@22@01 r) (Set_in (inv@21@01 r) trees@18@01))
    (= (id<Ref> (inv@21@01 r)) r))
  :pattern ((inv@21@01 r))
  :qid |item-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((r@20@01 $Ref)) (!
  (=> (Set_in r@20@01 trees@18@01) (not (= (id<Ref> r@20@01) $Ref.null)))
  :pattern ((id<Ref> r@20@01))
  :qid |item-permImpliesNonNull|)))
(declare-const r@23@01 $Ref)
(push) ; 2
; [eval] (r in trees)
(assert (Set_in r@23@01 trees@18@01))
; [eval] (id(r): Ref)
(push) ; 3
(assert (not (and
  (img@22@01 (id<Ref> r@23@01))
  (Set_in (inv@21@01 (id<Ref> r@23@01)) trees@18@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@24@01 ($Ref) $Ref)
(declare-fun img@25@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert (forall s: Ref ::
;     { (id(s): Ref) }
;     (s in trees) ==> acc((id(s): Ref).item.bool_prop, wildcard))
(declare-const s@26@01 $Ref)
(push) ; 3
; [eval] (s in trees)
(assert (Set_in s@26@01 trees@18@01))
(declare-const $k@27@01 $Perm)
(assert ($Perm.isReadVar $k@27@01))
; [eval] (id(s): Ref)
(push) ; 4
(assert (not (and
  (img@22@01 (id<Ref> s@26@01))
  (Set_in (inv@21@01 (id<Ref> s@26@01)) trees@18@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@28@01 ($Ref) $Ref)
(declare-fun img@29@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@27@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((s@26@01 $Ref)) (!
  (=>
    (Set_in s@26@01 trees@18@01)
    (or (= $k@27@01 $Perm.No) (< $Perm.No $k@27@01)))
  
  :qid |quant-u-12|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((s1@26@01 $Ref) (s2@26@01 $Ref)) (!
  (=>
    (and
      (and (Set_in s1@26@01 trees@18@01) (< $Perm.No $k@27@01))
      (and (Set_in s2@26@01 trees@18@01) (< $Perm.No $k@27@01))
      (=
        ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@19@01)) (id<Ref> s1@26@01))
        ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@19@01)) (id<Ref> s2@26@01))))
    (= s1@26@01 s2@26@01))
  
  :qid |bool_prop-rcvrInj|))))
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
(declare-const sm@30@01 $FVF<bool_prop>)
; Definitional axioms for snapshot map values
(declare-const pm@31@01 $FPM)
(assert (forall ((r $Ref)) (!
  (= ($FVF.perm_bool_prop (as pm@31@01  $FPM) r) $Perm.No)
  :pattern (($FVF.perm_bool_prop (as pm@31@01  $FPM) r))
  :qid |qp.resPrmSumDef3|)))
; Assume upper permission bound for field bool_prop
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_bool_prop (as pm@31@01  $FPM) r) $Perm.Write)
  :pattern ((inv@24@01 r))
  :qid |qp-fld-prm-bnd|)))
(declare-const sm@32@01 $FVF<item>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@22@01 r) (Set_in (inv@21@01 r) trees@18@01))
    (=
      ($FVF.lookup_item (as sm@32@01  $FVF<item>) r)
      ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@19@01)) r)))
  :pattern (($FVF.lookup_item (as sm@32@01  $FVF<item>) r))
  :pattern (($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@19@01)) r))
  :qid |qp.fvfValDef4|)))
(declare-const pm@33@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_item (as pm@33@01  $FPM) r)
    (ite
      (and (img@22@01 r) (Set_in (inv@21@01 r) trees@18@01))
      (/ (to_real 1) (to_real 2))
      $Perm.No))
  :pattern (($FVF.perm_item (as pm@33@01  $FPM) r))
  :qid |qp.resPrmSumDef5|)))
; Assume upper permission bound for field item
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_item (as pm@33@01  $FPM) r) $Perm.Write)
  :pattern ((inv@21@01 r))
  :qid |qp-fld-prm-bnd|)))
(declare-const s@34@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (s in trees)
(assert (Set_in s@34@01 trees@18@01))
(declare-const $k@35@01 $Perm)
(assert ($Perm.isReadVar $k@35@01))
; [eval] (id(s): Ref)
(push) ; 4
(assert (not (and
  (img@22@01 (id<Ref> s@34@01))
  (Set_in (inv@21@01 (id<Ref> s@34@01)) trees@18@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@36@01 ($Ref) $Ref)
(declare-fun img@37@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@35@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((s@34@01 $Ref)) (!
  (=>
    (Set_in s@34@01 trees@18@01)
    (or (= $k@35@01 $Perm.No) (< $Perm.No $k@35@01)))
  
  :qid |quant-u-13|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((s1@34@01 $Ref) (s2@34@01 $Ref)) (!
  (=>
    (and
      (and (Set_in s1@34@01 trees@18@01) (< $Perm.No $k@35@01))
      (and (Set_in s2@34@01 trees@18@01) (< $Perm.No $k@35@01))
      (=
        ($FVF.lookup_item (as sm@32@01  $FVF<item>) (id<Ref> s1@34@01))
        ($FVF.lookup_item (as sm@32@01  $FVF<item>) (id<Ref> s2@34@01))))
    (= s1@34@01 s2@34@01))
  
  :qid |bool_prop-rcvrInj|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test03c ----------
(declare-const trees@38@01 Set<$Ref>)
(declare-const trees@39@01 Set<$Ref>)
(push) ; 1
(declare-const $t@40@01 $Snap)
(assert (= $t@40@01 ($Snap.combine ($Snap.first $t@40@01) ($Snap.second $t@40@01))))
(declare-const r@41@01 $Ref)
(push) ; 2
; [eval] (r in trees)
(assert (Set_in r@41@01 trees@39@01))
; [eval] (id(r): Ref)
(pop) ; 2
(declare-fun inv@42@01 ($Ref) $Ref)
(declare-fun img@43@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((r1@41@01 $Ref) (r2@41@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@41@01 trees@39@01)
      (Set_in r2@41@01 trees@39@01)
      (= (id<Ref> r1@41@01) (id<Ref> r2@41@01)))
    (= r1@41@01 r2@41@01))
  
  :qid |item-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@41@01 $Ref)) (!
  (=>
    (Set_in r@41@01 trees@39@01)
    (and (= (inv@42@01 (id<Ref> r@41@01)) r@41@01) (img@43@01 (id<Ref> r@41@01))))
  :pattern ((id<Ref> r@41@01))
  :qid |quant-u-15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@43@01 r) (Set_in (inv@42@01 r) trees@39@01))
    (= (id<Ref> (inv@42@01 r)) r))
  :pattern ((inv@42@01 r))
  :qid |item-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((r@41@01 $Ref)) (!
  (=> (Set_in r@41@01 trees@39@01) (not (= (id<Ref> r@41@01) $Ref.null)))
  :pattern ((id<Ref> r@41@01))
  :qid |item-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@40@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@40@01))
    ($Snap.second ($Snap.second $t@40@01)))))
(assert (= ($Snap.first ($Snap.second $t@40@01)) $Snap.unit))
; [eval] (forall s1: Ref, s2: Ref :: { (s1 in trees), (s2 in trees) } { (s1 in trees), (id(s2): Ref) } { (s2 in trees), (id(s1): Ref) } { (id(s1): Ref), (id(s2): Ref) } { (id(s2): Ref), (id(s1): Ref) } (s1 in trees) && ((s2 in trees) && (id(s1): Ref) != (id(s2): Ref)) ==> (id(s1): Ref).item != (id(s2): Ref).item)
(declare-const s1@44@01 $Ref)
(declare-const s2@45@01 $Ref)
(push) ; 2
; [eval] (s1 in trees) && ((s2 in trees) && (id(s1): Ref) != (id(s2): Ref)) ==> (id(s1): Ref).item != (id(s2): Ref).item
; [eval] (s1 in trees) && ((s2 in trees) && (id(s1): Ref) != (id(s2): Ref))
; [eval] (s1 in trees)
(push) ; 3
; [then-branch: 3 | !(s1@44@01 in trees@39@01) | live]
; [else-branch: 3 | s1@44@01 in trees@39@01 | live]
(push) ; 4
; [then-branch: 3 | !(s1@44@01 in trees@39@01)]
(assert (not (Set_in s1@44@01 trees@39@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 3 | s1@44@01 in trees@39@01]
(assert (Set_in s1@44@01 trees@39@01))
; [eval] (s2 in trees)
(push) ; 5
; [then-branch: 4 | !(s2@45@01 in trees@39@01) | live]
; [else-branch: 4 | s2@45@01 in trees@39@01 | live]
(push) ; 6
; [then-branch: 4 | !(s2@45@01 in trees@39@01)]
(assert (not (Set_in s2@45@01 trees@39@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 4 | s2@45@01 in trees@39@01]
(assert (Set_in s2@45@01 trees@39@01))
; [eval] (id(s1): Ref) != (id(s2): Ref)
; [eval] (id(s1): Ref)
; [eval] (id(s2): Ref)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (Set_in s2@45@01 trees@39@01) (not (Set_in s2@45@01 trees@39@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in s1@44@01 trees@39@01)
  (and
    (Set_in s1@44@01 trees@39@01)
    (or (Set_in s2@45@01 trees@39@01) (not (Set_in s2@45@01 trees@39@01))))))
(assert (or (Set_in s1@44@01 trees@39@01) (not (Set_in s1@44@01 trees@39@01))))
(push) ; 3
; [then-branch: 5 | s1@44@01 in trees@39@01 && s2@45@01 in trees@39@01 && id[Ref](s1@44@01) != id[Ref](s2@45@01) | live]
; [else-branch: 5 | !(s1@44@01 in trees@39@01 && s2@45@01 in trees@39@01 && id[Ref](s1@44@01) != id[Ref](s2@45@01)) | live]
(push) ; 4
; [then-branch: 5 | s1@44@01 in trees@39@01 && s2@45@01 in trees@39@01 && id[Ref](s1@44@01) != id[Ref](s2@45@01)]
(assert (and
  (Set_in s1@44@01 trees@39@01)
  (and
    (Set_in s2@45@01 trees@39@01)
    (not (= (id<Ref> s1@44@01) (id<Ref> s2@45@01))))))
; [eval] (id(s1): Ref).item != (id(s2): Ref).item
; [eval] (id(s1): Ref)
(push) ; 5
(assert (not (and
  (img@43@01 (id<Ref> s1@44@01))
  (Set_in (inv@42@01 (id<Ref> s1@44@01)) trees@39@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] (id(s2): Ref)
(push) ; 5
(assert (not (and
  (img@43@01 (id<Ref> s2@45@01))
  (Set_in (inv@42@01 (id<Ref> s2@45@01)) trees@39@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 5 | !(s1@44@01 in trees@39@01 && s2@45@01 in trees@39@01 && id[Ref](s1@44@01) != id[Ref](s2@45@01))]
(assert (not
  (and
    (Set_in s1@44@01 trees@39@01)
    (and
      (Set_in s2@45@01 trees@39@01)
      (not (= (id<Ref> s1@44@01) (id<Ref> s2@45@01)))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (Set_in s1@44@01 trees@39@01)
    (and
      (Set_in s2@45@01 trees@39@01)
      (not (= (id<Ref> s1@44@01) (id<Ref> s2@45@01)))))
  (and
    (Set_in s1@44@01 trees@39@01)
    (Set_in s2@45@01 trees@39@01)
    (not (= (id<Ref> s1@44@01) (id<Ref> s2@45@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in s1@44@01 trees@39@01)
      (and
        (Set_in s2@45@01 trees@39@01)
        (not (= (id<Ref> s1@44@01) (id<Ref> s2@45@01))))))
  (and
    (Set_in s1@44@01 trees@39@01)
    (and
      (Set_in s2@45@01 trees@39@01)
      (not (= (id<Ref> s1@44@01) (id<Ref> s2@45@01)))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((s1@44@01 $Ref) (s2@45@01 $Ref)) (!
  (and
    (=>
      (Set_in s1@44@01 trees@39@01)
      (and
        (Set_in s1@44@01 trees@39@01)
        (or (Set_in s2@45@01 trees@39@01) (not (Set_in s2@45@01 trees@39@01)))))
    (or (Set_in s1@44@01 trees@39@01) (not (Set_in s1@44@01 trees@39@01)))
    (=>
      (and
        (Set_in s1@44@01 trees@39@01)
        (and
          (Set_in s2@45@01 trees@39@01)
          (not (= (id<Ref> s1@44@01) (id<Ref> s2@45@01)))))
      (and
        (Set_in s1@44@01 trees@39@01)
        (Set_in s2@45@01 trees@39@01)
        (not (= (id<Ref> s1@44@01) (id<Ref> s2@45@01)))))
    (or
      (not
        (and
          (Set_in s1@44@01 trees@39@01)
          (and
            (Set_in s2@45@01 trees@39@01)
            (not (= (id<Ref> s1@44@01) (id<Ref> s2@45@01))))))
      (and
        (Set_in s1@44@01 trees@39@01)
        (and
          (Set_in s2@45@01 trees@39@01)
          (not (= (id<Ref> s1@44@01) (id<Ref> s2@45@01)))))))
  :pattern ((Set_in s1@44@01 trees@39@01) (Set_in s2@45@01 trees@39@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0508a.vpr@35@14@35@120-aux|)))
(assert (forall ((s1@44@01 $Ref) (s2@45@01 $Ref)) (!
  (and
    (=>
      (Set_in s1@44@01 trees@39@01)
      (and
        (Set_in s1@44@01 trees@39@01)
        (or (Set_in s2@45@01 trees@39@01) (not (Set_in s2@45@01 trees@39@01)))))
    (or (Set_in s1@44@01 trees@39@01) (not (Set_in s1@44@01 trees@39@01)))
    (=>
      (and
        (Set_in s1@44@01 trees@39@01)
        (and
          (Set_in s2@45@01 trees@39@01)
          (not (= (id<Ref> s1@44@01) (id<Ref> s2@45@01)))))
      (and
        (Set_in s1@44@01 trees@39@01)
        (Set_in s2@45@01 trees@39@01)
        (not (= (id<Ref> s1@44@01) (id<Ref> s2@45@01)))))
    (or
      (not
        (and
          (Set_in s1@44@01 trees@39@01)
          (and
            (Set_in s2@45@01 trees@39@01)
            (not (= (id<Ref> s1@44@01) (id<Ref> s2@45@01))))))
      (and
        (Set_in s1@44@01 trees@39@01)
        (and
          (Set_in s2@45@01 trees@39@01)
          (not (= (id<Ref> s1@44@01) (id<Ref> s2@45@01)))))))
  :pattern ((Set_in s1@44@01 trees@39@01) (id<Ref> s2@45@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0508a.vpr@35@14@35@120-aux|)))
(assert (forall ((s1@44@01 $Ref) (s2@45@01 $Ref)) (!
  (and
    (=>
      (Set_in s1@44@01 trees@39@01)
      (and
        (Set_in s1@44@01 trees@39@01)
        (or (Set_in s2@45@01 trees@39@01) (not (Set_in s2@45@01 trees@39@01)))))
    (or (Set_in s1@44@01 trees@39@01) (not (Set_in s1@44@01 trees@39@01)))
    (=>
      (and
        (Set_in s1@44@01 trees@39@01)
        (and
          (Set_in s2@45@01 trees@39@01)
          (not (= (id<Ref> s1@44@01) (id<Ref> s2@45@01)))))
      (and
        (Set_in s1@44@01 trees@39@01)
        (Set_in s2@45@01 trees@39@01)
        (not (= (id<Ref> s1@44@01) (id<Ref> s2@45@01)))))
    (or
      (not
        (and
          (Set_in s1@44@01 trees@39@01)
          (and
            (Set_in s2@45@01 trees@39@01)
            (not (= (id<Ref> s1@44@01) (id<Ref> s2@45@01))))))
      (and
        (Set_in s1@44@01 trees@39@01)
        (and
          (Set_in s2@45@01 trees@39@01)
          (not (= (id<Ref> s1@44@01) (id<Ref> s2@45@01)))))))
  :pattern ((Set_in s2@45@01 trees@39@01) (id<Ref> s1@44@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0508a.vpr@35@14@35@120-aux|)))
(assert (forall ((s1@44@01 $Ref) (s2@45@01 $Ref)) (!
  (and
    (=>
      (Set_in s1@44@01 trees@39@01)
      (and
        (Set_in s1@44@01 trees@39@01)
        (or (Set_in s2@45@01 trees@39@01) (not (Set_in s2@45@01 trees@39@01)))))
    (or (Set_in s1@44@01 trees@39@01) (not (Set_in s1@44@01 trees@39@01)))
    (=>
      (and
        (Set_in s1@44@01 trees@39@01)
        (and
          (Set_in s2@45@01 trees@39@01)
          (not (= (id<Ref> s1@44@01) (id<Ref> s2@45@01)))))
      (and
        (Set_in s1@44@01 trees@39@01)
        (Set_in s2@45@01 trees@39@01)
        (not (= (id<Ref> s1@44@01) (id<Ref> s2@45@01)))))
    (or
      (not
        (and
          (Set_in s1@44@01 trees@39@01)
          (and
            (Set_in s2@45@01 trees@39@01)
            (not (= (id<Ref> s1@44@01) (id<Ref> s2@45@01))))))
      (and
        (Set_in s1@44@01 trees@39@01)
        (and
          (Set_in s2@45@01 trees@39@01)
          (not (= (id<Ref> s1@44@01) (id<Ref> s2@45@01)))))))
  :pattern ((id<Ref> s1@44@01) (id<Ref> s2@45@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0508a.vpr@35@14@35@120-aux|)))
(assert (forall ((s1@44@01 $Ref) (s2@45@01 $Ref)) (!
  (and
    (=>
      (Set_in s1@44@01 trees@39@01)
      (and
        (Set_in s1@44@01 trees@39@01)
        (or (Set_in s2@45@01 trees@39@01) (not (Set_in s2@45@01 trees@39@01)))))
    (or (Set_in s1@44@01 trees@39@01) (not (Set_in s1@44@01 trees@39@01)))
    (=>
      (and
        (Set_in s1@44@01 trees@39@01)
        (and
          (Set_in s2@45@01 trees@39@01)
          (not (= (id<Ref> s1@44@01) (id<Ref> s2@45@01)))))
      (and
        (Set_in s1@44@01 trees@39@01)
        (Set_in s2@45@01 trees@39@01)
        (not (= (id<Ref> s1@44@01) (id<Ref> s2@45@01)))))
    (or
      (not
        (and
          (Set_in s1@44@01 trees@39@01)
          (and
            (Set_in s2@45@01 trees@39@01)
            (not (= (id<Ref> s1@44@01) (id<Ref> s2@45@01))))))
      (and
        (Set_in s1@44@01 trees@39@01)
        (and
          (Set_in s2@45@01 trees@39@01)
          (not (= (id<Ref> s1@44@01) (id<Ref> s2@45@01)))))))
  :pattern ((id<Ref> s2@45@01) (id<Ref> s1@44@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0508a.vpr@35@14@35@120-aux|)))
(assert (forall ((s1@44@01 $Ref) (s2@45@01 $Ref)) (!
  (=>
    (and
      (Set_in s1@44@01 trees@39@01)
      (and
        (Set_in s2@45@01 trees@39@01)
        (not (= (id<Ref> s1@44@01) (id<Ref> s2@45@01)))))
    (not
      (=
        ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@40@01)) (id<Ref> s1@44@01))
        ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@40@01)) (id<Ref> s2@45@01)))))
  :pattern ((Set_in s1@44@01 trees@39@01) (Set_in s2@45@01 trees@39@01))
  :pattern ((Set_in s1@44@01 trees@39@01) (id<Ref> s2@45@01))
  :pattern ((Set_in s2@45@01 trees@39@01) (id<Ref> s1@44@01))
  :pattern ((id<Ref> s1@44@01) (id<Ref> s2@45@01))
  :pattern ((id<Ref> s2@45@01) (id<Ref> s1@44@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0508a.vpr@35@14@35@120|)))
(declare-const r@46@01 $Ref)
(push) ; 2
; [eval] (r in trees)
(assert (Set_in r@46@01 trees@39@01))
; [eval] (id(r): Ref)
(push) ; 3
(assert (not (and
  (img@43@01 (id<Ref> r@46@01))
  (Set_in (inv@42@01 (id<Ref> r@46@01)) trees@39@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@47@01 ($Ref) $Ref)
(declare-fun img@48@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((r1@46@01 $Ref) (r2@46@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@46@01 trees@39@01)
      (Set_in r2@46@01 trees@39@01)
      (=
        ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@40@01)) (id<Ref> r1@46@01))
        ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@40@01)) (id<Ref> r2@46@01))))
    (= r1@46@01 r2@46@01))
  
  :qid |bool_prop-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@46@01 $Ref)) (!
  (=>
    (Set_in r@46@01 trees@39@01)
    (and
      (=
        (inv@47@01 ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@40@01)) (id<Ref> r@46@01)))
        r@46@01)
      (img@48@01 ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@40@01)) (id<Ref> r@46@01)))))
  :pattern ((id<Ref> r@46@01))
  :qid |quant-u-17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@48@01 r) (Set_in (inv@47@01 r) trees@39@01))
    (=
      ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@40@01)) (id<Ref> (inv@47@01 r)))
      r))
  :pattern ((inv@47@01 r))
  :qid |bool_prop-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((r@46@01 $Ref)) (!
  (=>
    (Set_in r@46@01 trees@39@01)
    (not
      (=
        ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@40@01)) (id<Ref> r@46@01))
        $Ref.null)))
  :pattern ((id<Ref> r@46@01))
  :qid |bool_prop-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert (forall s: Ref ::
;     { (id(s): Ref) }
;     (s in trees) ==> acc((id(s): Ref).item.bool_prop, wildcard))
(declare-const s@49@01 $Ref)
(push) ; 3
; [eval] (s in trees)
(assert (Set_in s@49@01 trees@39@01))
(declare-const $k@50@01 $Perm)
(assert ($Perm.isReadVar $k@50@01))
; [eval] (id(s): Ref)
(push) ; 4
(assert (not (and
  (img@43@01 (id<Ref> s@49@01))
  (Set_in (inv@42@01 (id<Ref> s@49@01)) trees@39@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@51@01 ($Ref) $Ref)
(declare-fun img@52@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@50@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((s@49@01 $Ref)) (!
  (=>
    (Set_in s@49@01 trees@39@01)
    (or (= $k@50@01 $Perm.No) (< $Perm.No $k@50@01)))
  
  :qid |quant-u-18|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((s1@49@01 $Ref) (s2@49@01 $Ref)) (!
  (=>
    (and
      (and (Set_in s1@49@01 trees@39@01) (< $Perm.No $k@50@01))
      (and (Set_in s2@49@01 trees@39@01) (< $Perm.No $k@50@01))
      (=
        ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@40@01)) (id<Ref> s1@49@01))
        ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@40@01)) (id<Ref> s2@49@01))))
    (= s1@49@01 s2@49@01))
  
  :qid |bool_prop-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((s@49@01 $Ref)) (!
  (=>
    (and (Set_in s@49@01 trees@39@01) (< $Perm.No $k@50@01))
    (and
      (=
        (inv@51@01 ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@40@01)) (id<Ref> s@49@01)))
        s@49@01)
      (img@52@01 ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@40@01)) (id<Ref> s@49@01)))))
  :pattern ((id<Ref> s@49@01))
  :qid |bool_prop-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@52@01 r)
      (and (Set_in (inv@51@01 r) trees@39@01) (< $Perm.No $k@50@01)))
    (=
      ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@40@01)) (id<Ref> (inv@51@01 r)))
      r))
  :pattern ((inv@51@01 r))
  :qid |bool_prop-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@53@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@51@01 r) trees@39@01)
      (img@52@01 r)
      (=
        r
        ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@40@01)) (id<Ref> (inv@51@01 r)))))
    ($Perm.min
      (ite
        (and (img@48@01 r) (Set_in (inv@47@01 r) trees@39@01))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      $k@50@01)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@50@01
(assert (forall ((r $Ref)) (!
  (=>
    (not
      (=
        (ite
          (and (img@48@01 r) (Set_in (inv@47@01 r) trees@39@01))
          (/ (to_real 1) (to_real 2))
          $Perm.No)
        $Perm.No))
    (ite
      (and (img@48@01 r) (Set_in (inv@47@01 r) trees@39@01))
      (<
        (ite
          (and
            (Set_in (inv@51@01 r) trees@39@01)
            (img@52@01 r)
            (=
              r
              ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@40@01)) (id<Ref> (inv@51@01 r)))))
          $k@50@01
          $Perm.No)
        (/ (to_real 1) (to_real 2)))
      (<
        (ite
          (and
            (Set_in (inv@51@01 r) trees@39@01)
            (img@52@01 r)
            (=
              r
              ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@40@01)) (id<Ref> (inv@51@01 r)))))
          $k@50@01
          $Perm.No)
        $Perm.No)))
  :pattern ((img@48@01 r))
  :pattern ((Set_in (inv@47@01 r) trees@39@01))
  :pattern ((Set_in (inv@51@01 r) trees@39@01))
  :pattern ((img@52@01 r))
  :pattern (($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@40@01)) (id<Ref> (inv@51@01 r))))
  :qid |qp.srp6|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@51@01 r) trees@39@01)
      (img@52@01 r)
      (=
        r
        ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@40@01)) (id<Ref> (inv@51@01 r)))))
    (= (- $k@50@01 (pTaken@53@01 r)) $Perm.No))
  
  :qid |quant-u-21|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@54@01 $FVF<bool_prop>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@48@01 r) (Set_in (inv@47@01 r) trees@39@01))
    (=
      ($FVF.lookup_bool_prop (as sm@54@01  $FVF<bool_prop>) r)
      ($FVF.lookup_bool_prop ($SortWrappers.$SnapTo$FVF<bool_prop> ($Snap.second ($Snap.second $t@40@01))) r)))
  :pattern (($FVF.lookup_bool_prop (as sm@54@01  $FVF<bool_prop>) r))
  :pattern (($FVF.lookup_bool_prop ($SortWrappers.$SnapTo$FVF<bool_prop> ($Snap.second ($Snap.second $t@40@01))) r))
  :qid |qp.fvfValDef7|)))
(pop) ; 2
(pop) ; 1
; ---------- test04 ----------
(declare-const trees@55@01 Set<$Ref>)
(declare-const trees@56@01 Set<$Ref>)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@57@01 $Snap)
(assert (= $t@57@01 ($Snap.combine ($Snap.first $t@57@01) ($Snap.second $t@57@01))))
(declare-const r@58@01 $Ref)
(push) ; 2
; [eval] (r in trees)
(assert (Set_in r@58@01 trees@56@01))
; [eval] (id(r): Ref)
(pop) ; 2
(declare-fun inv@59@01 ($Ref) $Ref)
(declare-fun img@60@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((r1@58@01 $Ref) (r2@58@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@58@01 trees@56@01)
      (Set_in r2@58@01 trees@56@01)
      (= (id<Ref> r1@58@01) (id<Ref> r2@58@01)))
    (= r1@58@01 r2@58@01))
  
  :qid |item-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@58@01 $Ref)) (!
  (=>
    (Set_in r@58@01 trees@56@01)
    (and (= (inv@59@01 (id<Ref> r@58@01)) r@58@01) (img@60@01 (id<Ref> r@58@01))))
  :pattern ((Set_in r@58@01 trees@56@01))
  :qid |quant-u-23|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@60@01 r) (Set_in (inv@59@01 r) trees@56@01))
    (= (id<Ref> (inv@59@01 r)) r))
  :pattern ((inv@59@01 r))
  :qid |item-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((r@58@01 $Ref)) (!
  (=> (Set_in r@58@01 trees@56@01) (not (= (id<Ref> r@58@01) $Ref.null)))
  :pattern ((Set_in r@58@01 trees@56@01))
  :qid |item-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@57@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@57@01))
    ($Snap.second ($Snap.second $t@57@01)))))
(assert (= ($Snap.first ($Snap.second $t@57@01)) $Snap.unit))
; [eval] (forall s1: Ref, s2: Ref :: { (s1 in trees), (s2 in trees) } { (s1 in trees), (id(s2): Ref) } { (s2 in trees), (id(s1): Ref) } { (id(s1): Ref), (id(s2): Ref) } { (id(s2): Ref), (id(s1): Ref) } (s1 in trees) && ((s2 in trees) && (id(s1): Ref) != (id(s2): Ref)) ==> (id(s1): Ref).item != (id(s2): Ref).item)
(declare-const s1@61@01 $Ref)
(declare-const s2@62@01 $Ref)
(push) ; 2
; [eval] (s1 in trees) && ((s2 in trees) && (id(s1): Ref) != (id(s2): Ref)) ==> (id(s1): Ref).item != (id(s2): Ref).item
; [eval] (s1 in trees) && ((s2 in trees) && (id(s1): Ref) != (id(s2): Ref))
; [eval] (s1 in trees)
(push) ; 3
; [then-branch: 6 | !(s1@61@01 in trees@56@01) | live]
; [else-branch: 6 | s1@61@01 in trees@56@01 | live]
(push) ; 4
; [then-branch: 6 | !(s1@61@01 in trees@56@01)]
(assert (not (Set_in s1@61@01 trees@56@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 6 | s1@61@01 in trees@56@01]
(assert (Set_in s1@61@01 trees@56@01))
; [eval] (s2 in trees)
(push) ; 5
; [then-branch: 7 | !(s2@62@01 in trees@56@01) | live]
; [else-branch: 7 | s2@62@01 in trees@56@01 | live]
(push) ; 6
; [then-branch: 7 | !(s2@62@01 in trees@56@01)]
(assert (not (Set_in s2@62@01 trees@56@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 7 | s2@62@01 in trees@56@01]
(assert (Set_in s2@62@01 trees@56@01))
; [eval] (id(s1): Ref) != (id(s2): Ref)
; [eval] (id(s1): Ref)
; [eval] (id(s2): Ref)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (Set_in s2@62@01 trees@56@01) (not (Set_in s2@62@01 trees@56@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in s1@61@01 trees@56@01)
  (and
    (Set_in s1@61@01 trees@56@01)
    (or (Set_in s2@62@01 trees@56@01) (not (Set_in s2@62@01 trees@56@01))))))
(assert (or (Set_in s1@61@01 trees@56@01) (not (Set_in s1@61@01 trees@56@01))))
(push) ; 3
; [then-branch: 8 | s1@61@01 in trees@56@01 && s2@62@01 in trees@56@01 && id[Ref](s1@61@01) != id[Ref](s2@62@01) | live]
; [else-branch: 8 | !(s1@61@01 in trees@56@01 && s2@62@01 in trees@56@01 && id[Ref](s1@61@01) != id[Ref](s2@62@01)) | live]
(push) ; 4
; [then-branch: 8 | s1@61@01 in trees@56@01 && s2@62@01 in trees@56@01 && id[Ref](s1@61@01) != id[Ref](s2@62@01)]
(assert (and
  (Set_in s1@61@01 trees@56@01)
  (and
    (Set_in s2@62@01 trees@56@01)
    (not (= (id<Ref> s1@61@01) (id<Ref> s2@62@01))))))
; [eval] (id(s1): Ref).item != (id(s2): Ref).item
; [eval] (id(s1): Ref)
(push) ; 5
(assert (not (and
  (img@60@01 (id<Ref> s1@61@01))
  (Set_in (inv@59@01 (id<Ref> s1@61@01)) trees@56@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] (id(s2): Ref)
(push) ; 5
(assert (not (and
  (img@60@01 (id<Ref> s2@62@01))
  (Set_in (inv@59@01 (id<Ref> s2@62@01)) trees@56@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 8 | !(s1@61@01 in trees@56@01 && s2@62@01 in trees@56@01 && id[Ref](s1@61@01) != id[Ref](s2@62@01))]
(assert (not
  (and
    (Set_in s1@61@01 trees@56@01)
    (and
      (Set_in s2@62@01 trees@56@01)
      (not (= (id<Ref> s1@61@01) (id<Ref> s2@62@01)))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (Set_in s1@61@01 trees@56@01)
    (and
      (Set_in s2@62@01 trees@56@01)
      (not (= (id<Ref> s1@61@01) (id<Ref> s2@62@01)))))
  (and
    (Set_in s1@61@01 trees@56@01)
    (Set_in s2@62@01 trees@56@01)
    (not (= (id<Ref> s1@61@01) (id<Ref> s2@62@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in s1@61@01 trees@56@01)
      (and
        (Set_in s2@62@01 trees@56@01)
        (not (= (id<Ref> s1@61@01) (id<Ref> s2@62@01))))))
  (and
    (Set_in s1@61@01 trees@56@01)
    (and
      (Set_in s2@62@01 trees@56@01)
      (not (= (id<Ref> s1@61@01) (id<Ref> s2@62@01)))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((s1@61@01 $Ref) (s2@62@01 $Ref)) (!
  (and
    (=>
      (Set_in s1@61@01 trees@56@01)
      (and
        (Set_in s1@61@01 trees@56@01)
        (or (Set_in s2@62@01 trees@56@01) (not (Set_in s2@62@01 trees@56@01)))))
    (or (Set_in s1@61@01 trees@56@01) (not (Set_in s1@61@01 trees@56@01)))
    (=>
      (and
        (Set_in s1@61@01 trees@56@01)
        (and
          (Set_in s2@62@01 trees@56@01)
          (not (= (id<Ref> s1@61@01) (id<Ref> s2@62@01)))))
      (and
        (Set_in s1@61@01 trees@56@01)
        (Set_in s2@62@01 trees@56@01)
        (not (= (id<Ref> s1@61@01) (id<Ref> s2@62@01)))))
    (or
      (not
        (and
          (Set_in s1@61@01 trees@56@01)
          (and
            (Set_in s2@62@01 trees@56@01)
            (not (= (id<Ref> s1@61@01) (id<Ref> s2@62@01))))))
      (and
        (Set_in s1@61@01 trees@56@01)
        (and
          (Set_in s2@62@01 trees@56@01)
          (not (= (id<Ref> s1@61@01) (id<Ref> s2@62@01)))))))
  :pattern ((Set_in s1@61@01 trees@56@01) (Set_in s2@62@01 trees@56@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0508a.vpr@45@13@45@119-aux|)))
(assert (forall ((s1@61@01 $Ref) (s2@62@01 $Ref)) (!
  (and
    (=>
      (Set_in s1@61@01 trees@56@01)
      (and
        (Set_in s1@61@01 trees@56@01)
        (or (Set_in s2@62@01 trees@56@01) (not (Set_in s2@62@01 trees@56@01)))))
    (or (Set_in s1@61@01 trees@56@01) (not (Set_in s1@61@01 trees@56@01)))
    (=>
      (and
        (Set_in s1@61@01 trees@56@01)
        (and
          (Set_in s2@62@01 trees@56@01)
          (not (= (id<Ref> s1@61@01) (id<Ref> s2@62@01)))))
      (and
        (Set_in s1@61@01 trees@56@01)
        (Set_in s2@62@01 trees@56@01)
        (not (= (id<Ref> s1@61@01) (id<Ref> s2@62@01)))))
    (or
      (not
        (and
          (Set_in s1@61@01 trees@56@01)
          (and
            (Set_in s2@62@01 trees@56@01)
            (not (= (id<Ref> s1@61@01) (id<Ref> s2@62@01))))))
      (and
        (Set_in s1@61@01 trees@56@01)
        (and
          (Set_in s2@62@01 trees@56@01)
          (not (= (id<Ref> s1@61@01) (id<Ref> s2@62@01)))))))
  :pattern ((Set_in s1@61@01 trees@56@01) (id<Ref> s2@62@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0508a.vpr@45@13@45@119-aux|)))
(assert (forall ((s1@61@01 $Ref) (s2@62@01 $Ref)) (!
  (and
    (=>
      (Set_in s1@61@01 trees@56@01)
      (and
        (Set_in s1@61@01 trees@56@01)
        (or (Set_in s2@62@01 trees@56@01) (not (Set_in s2@62@01 trees@56@01)))))
    (or (Set_in s1@61@01 trees@56@01) (not (Set_in s1@61@01 trees@56@01)))
    (=>
      (and
        (Set_in s1@61@01 trees@56@01)
        (and
          (Set_in s2@62@01 trees@56@01)
          (not (= (id<Ref> s1@61@01) (id<Ref> s2@62@01)))))
      (and
        (Set_in s1@61@01 trees@56@01)
        (Set_in s2@62@01 trees@56@01)
        (not (= (id<Ref> s1@61@01) (id<Ref> s2@62@01)))))
    (or
      (not
        (and
          (Set_in s1@61@01 trees@56@01)
          (and
            (Set_in s2@62@01 trees@56@01)
            (not (= (id<Ref> s1@61@01) (id<Ref> s2@62@01))))))
      (and
        (Set_in s1@61@01 trees@56@01)
        (and
          (Set_in s2@62@01 trees@56@01)
          (not (= (id<Ref> s1@61@01) (id<Ref> s2@62@01)))))))
  :pattern ((Set_in s2@62@01 trees@56@01) (id<Ref> s1@61@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0508a.vpr@45@13@45@119-aux|)))
(assert (forall ((s1@61@01 $Ref) (s2@62@01 $Ref)) (!
  (and
    (=>
      (Set_in s1@61@01 trees@56@01)
      (and
        (Set_in s1@61@01 trees@56@01)
        (or (Set_in s2@62@01 trees@56@01) (not (Set_in s2@62@01 trees@56@01)))))
    (or (Set_in s1@61@01 trees@56@01) (not (Set_in s1@61@01 trees@56@01)))
    (=>
      (and
        (Set_in s1@61@01 trees@56@01)
        (and
          (Set_in s2@62@01 trees@56@01)
          (not (= (id<Ref> s1@61@01) (id<Ref> s2@62@01)))))
      (and
        (Set_in s1@61@01 trees@56@01)
        (Set_in s2@62@01 trees@56@01)
        (not (= (id<Ref> s1@61@01) (id<Ref> s2@62@01)))))
    (or
      (not
        (and
          (Set_in s1@61@01 trees@56@01)
          (and
            (Set_in s2@62@01 trees@56@01)
            (not (= (id<Ref> s1@61@01) (id<Ref> s2@62@01))))))
      (and
        (Set_in s1@61@01 trees@56@01)
        (and
          (Set_in s2@62@01 trees@56@01)
          (not (= (id<Ref> s1@61@01) (id<Ref> s2@62@01)))))))
  :pattern ((id<Ref> s1@61@01) (id<Ref> s2@62@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0508a.vpr@45@13@45@119-aux|)))
(assert (forall ((s1@61@01 $Ref) (s2@62@01 $Ref)) (!
  (and
    (=>
      (Set_in s1@61@01 trees@56@01)
      (and
        (Set_in s1@61@01 trees@56@01)
        (or (Set_in s2@62@01 trees@56@01) (not (Set_in s2@62@01 trees@56@01)))))
    (or (Set_in s1@61@01 trees@56@01) (not (Set_in s1@61@01 trees@56@01)))
    (=>
      (and
        (Set_in s1@61@01 trees@56@01)
        (and
          (Set_in s2@62@01 trees@56@01)
          (not (= (id<Ref> s1@61@01) (id<Ref> s2@62@01)))))
      (and
        (Set_in s1@61@01 trees@56@01)
        (Set_in s2@62@01 trees@56@01)
        (not (= (id<Ref> s1@61@01) (id<Ref> s2@62@01)))))
    (or
      (not
        (and
          (Set_in s1@61@01 trees@56@01)
          (and
            (Set_in s2@62@01 trees@56@01)
            (not (= (id<Ref> s1@61@01) (id<Ref> s2@62@01))))))
      (and
        (Set_in s1@61@01 trees@56@01)
        (and
          (Set_in s2@62@01 trees@56@01)
          (not (= (id<Ref> s1@61@01) (id<Ref> s2@62@01)))))))
  :pattern ((id<Ref> s2@62@01) (id<Ref> s1@61@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0508a.vpr@45@13@45@119-aux|)))
(assert (forall ((s1@61@01 $Ref) (s2@62@01 $Ref)) (!
  (=>
    (and
      (Set_in s1@61@01 trees@56@01)
      (and
        (Set_in s2@62@01 trees@56@01)
        (not (= (id<Ref> s1@61@01) (id<Ref> s2@62@01)))))
    (not
      (=
        ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@57@01)) (id<Ref> s1@61@01))
        ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@57@01)) (id<Ref> s2@62@01)))))
  :pattern ((Set_in s1@61@01 trees@56@01) (Set_in s2@62@01 trees@56@01))
  :pattern ((Set_in s1@61@01 trees@56@01) (id<Ref> s2@62@01))
  :pattern ((Set_in s2@62@01 trees@56@01) (id<Ref> s1@61@01))
  :pattern ((id<Ref> s1@61@01) (id<Ref> s2@62@01))
  :pattern ((id<Ref> s2@62@01) (id<Ref> s1@61@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0508a.vpr@45@13@45@119|)))
(declare-const r@63@01 $Ref)
(push) ; 2
; [eval] (r in trees)
(assert (Set_in r@63@01 trees@56@01))
; [eval] (id(r): Ref)
(push) ; 3
(assert (not (and
  (img@60@01 (id<Ref> r@63@01))
  (Set_in (inv@59@01 (id<Ref> r@63@01)) trees@56@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@64@01 ($Ref) $Ref)
(declare-fun img@65@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((r1@63@01 $Ref) (r2@63@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@63@01 trees@56@01)
      (Set_in r2@63@01 trees@56@01)
      (=
        ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@57@01)) (id<Ref> r1@63@01))
        ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@57@01)) (id<Ref> r2@63@01))))
    (= r1@63@01 r2@63@01))
  
  :qid |bool_prop-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@63@01 $Ref)) (!
  (=>
    (Set_in r@63@01 trees@56@01)
    (and
      (=
        (inv@64@01 ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@57@01)) (id<Ref> r@63@01)))
        r@63@01)
      (img@65@01 ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@57@01)) (id<Ref> r@63@01)))))
  :pattern ((Set_in r@63@01 trees@56@01))
  :qid |quant-u-25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@65@01 r) (Set_in (inv@64@01 r) trees@56@01))
    (=
      ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@57@01)) (id<Ref> (inv@64@01 r)))
      r))
  :pattern ((inv@64@01 r))
  :qid |bool_prop-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((r@63@01 $Ref)) (!
  (=>
    (Set_in r@63@01 trees@56@01)
    (not
      (=
        ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@57@01)) (id<Ref> r@63@01))
        $Ref.null)))
  :pattern ((Set_in r@63@01 trees@56@01))
  :qid |bool_prop-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert (forall s: Ref ::
;     { (s in trees) }
;     (s in trees) ==> acc((id(s): Ref).item.bool_prop, wildcard))
(declare-const s@66@01 $Ref)
(push) ; 3
; [eval] (s in trees)
(assert (Set_in s@66@01 trees@56@01))
(declare-const $k@67@01 $Perm)
(assert ($Perm.isReadVar $k@67@01))
; [eval] (id(s): Ref)
(push) ; 4
(assert (not (and
  (img@60@01 (id<Ref> s@66@01))
  (Set_in (inv@59@01 (id<Ref> s@66@01)) trees@56@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@68@01 ($Ref) $Ref)
(declare-fun img@69@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@67@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((s@66@01 $Ref)) (!
  (=>
    (Set_in s@66@01 trees@56@01)
    (or (= $k@67@01 $Perm.No) (< $Perm.No $k@67@01)))
  
  :qid |quant-u-26|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((s1@66@01 $Ref) (s2@66@01 $Ref)) (!
  (=>
    (and
      (and (Set_in s1@66@01 trees@56@01) (< $Perm.No $k@67@01))
      (and (Set_in s2@66@01 trees@56@01) (< $Perm.No $k@67@01))
      (=
        ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@57@01)) (id<Ref> s1@66@01))
        ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@57@01)) (id<Ref> s2@66@01))))
    (= s1@66@01 s2@66@01))
  
  :qid |bool_prop-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((s@66@01 $Ref)) (!
  (=>
    (and (Set_in s@66@01 trees@56@01) (< $Perm.No $k@67@01))
    (and
      (=
        (inv@68@01 ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@57@01)) (id<Ref> s@66@01)))
        s@66@01)
      (img@69@01 ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@57@01)) (id<Ref> s@66@01)))))
  :pattern ((Set_in s@66@01 trees@56@01))
  :qid |bool_prop-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@69@01 r)
      (and (Set_in (inv@68@01 r) trees@56@01) (< $Perm.No $k@67@01)))
    (=
      ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@57@01)) (id<Ref> (inv@68@01 r)))
      r))
  :pattern ((inv@68@01 r))
  :qid |bool_prop-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@70@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@68@01 r) trees@56@01)
      (img@69@01 r)
      (=
        r
        ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@57@01)) (id<Ref> (inv@68@01 r)))))
    ($Perm.min
      (ite
        (and (img@65@01 r) (Set_in (inv@64@01 r) trees@56@01))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      $k@67@01)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@67@01
(assert (forall ((r $Ref)) (!
  (=>
    (not
      (=
        (ite
          (and (img@65@01 r) (Set_in (inv@64@01 r) trees@56@01))
          (/ (to_real 1) (to_real 2))
          $Perm.No)
        $Perm.No))
    (ite
      (and (img@65@01 r) (Set_in (inv@64@01 r) trees@56@01))
      (<
        (ite
          (and
            (Set_in (inv@68@01 r) trees@56@01)
            (img@69@01 r)
            (=
              r
              ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@57@01)) (id<Ref> (inv@68@01 r)))))
          $k@67@01
          $Perm.No)
        (/ (to_real 1) (to_real 2)))
      (<
        (ite
          (and
            (Set_in (inv@68@01 r) trees@56@01)
            (img@69@01 r)
            (=
              r
              ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@57@01)) (id<Ref> (inv@68@01 r)))))
          $k@67@01
          $Perm.No)
        $Perm.No)))
  :pattern ((img@65@01 r))
  :pattern ((Set_in (inv@64@01 r) trees@56@01))
  :pattern ((Set_in (inv@68@01 r) trees@56@01))
  :pattern ((img@69@01 r))
  :pattern (($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@57@01)) (id<Ref> (inv@68@01 r))))
  :qid |qp.srp8|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@68@01 r) trees@56@01)
      (img@69@01 r)
      (=
        r
        ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first $t@57@01)) (id<Ref> (inv@68@01 r)))))
    (= (- $k@67@01 (pTaken@70@01 r)) $Perm.No))
  
  :qid |quant-u-29|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@71@01 $FVF<bool_prop>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@65@01 r) (Set_in (inv@64@01 r) trees@56@01))
    (=
      ($FVF.lookup_bool_prop (as sm@71@01  $FVF<bool_prop>) r)
      ($FVF.lookup_bool_prop ($SortWrappers.$SnapTo$FVF<bool_prop> ($Snap.second ($Snap.second $t@57@01))) r)))
  :pattern (($FVF.lookup_bool_prop (as sm@71@01  $FVF<bool_prop>) r))
  :pattern (($FVF.lookup_bool_prop ($SortWrappers.$SnapTo$FVF<bool_prop> ($Snap.second ($Snap.second $t@57@01))) r))
  :qid |qp.fvfValDef9|)))
(pop) ; 2
(pop) ; 1
; ---------- test01 ----------
(declare-const trees@72@01 Seq<$Ref>)
(declare-const g@73@01 Int)
(declare-const trees@74@01 Seq<$Ref>)
(declare-const g@75@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@76@01 $Snap)
(assert (= $t@76@01 ($Snap.combine ($Snap.first $t@76@01) ($Snap.second $t@76@01))))
(assert (= ($Snap.first $t@76@01) $Snap.unit))
; [eval] 0 < g
(assert (< 0 g@75@01))
(assert (=
  ($Snap.second $t@76@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@76@01))
    ($Snap.second ($Snap.second $t@76@01)))))
(assert (= ($Snap.first ($Snap.second $t@76@01)) $Snap.unit))
; [eval] |trees| == g
; [eval] |trees|
(assert (= (Seq_length trees@74@01) g@75@01))
(assert (=
  ($Snap.second ($Snap.second $t@76@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@76@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@76@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@76@01))) $Snap.unit))
; [eval] (forall i: Int, j: Int :: { trees[i], trees[j] } i >= 0 && (i < g && (j >= 0 && (j < g && i != j))) ==> trees[i] != trees[j])
(declare-const i@77@01 Int)
(declare-const j@78@01 Int)
(push) ; 2
; [eval] i >= 0 && (i < g && (j >= 0 && (j < g && i != j))) ==> trees[i] != trees[j]
; [eval] i >= 0 && (i < g && (j >= 0 && (j < g && i != j)))
; [eval] i >= 0
(push) ; 3
; [then-branch: 9 | !(i@77@01 >= 0) | live]
; [else-branch: 9 | i@77@01 >= 0 | live]
(push) ; 4
; [then-branch: 9 | !(i@77@01 >= 0)]
(assert (not (>= i@77@01 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 9 | i@77@01 >= 0]
(assert (>= i@77@01 0))
; [eval] i < g
(push) ; 5
; [then-branch: 10 | !(i@77@01 < g@75@01) | live]
; [else-branch: 10 | i@77@01 < g@75@01 | live]
(push) ; 6
; [then-branch: 10 | !(i@77@01 < g@75@01)]
(assert (not (< i@77@01 g@75@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 10 | i@77@01 < g@75@01]
(assert (< i@77@01 g@75@01))
; [eval] j >= 0
(push) ; 7
; [then-branch: 11 | !(j@78@01 >= 0) | live]
; [else-branch: 11 | j@78@01 >= 0 | live]
(push) ; 8
; [then-branch: 11 | !(j@78@01 >= 0)]
(assert (not (>= j@78@01 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 11 | j@78@01 >= 0]
(assert (>= j@78@01 0))
; [eval] j < g
(push) ; 9
; [then-branch: 12 | !(j@78@01 < g@75@01) | live]
; [else-branch: 12 | j@78@01 < g@75@01 | live]
(push) ; 10
; [then-branch: 12 | !(j@78@01 < g@75@01)]
(assert (not (< j@78@01 g@75@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 12 | j@78@01 < g@75@01]
(assert (< j@78@01 g@75@01))
; [eval] i != j
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< j@78@01 g@75@01) (not (< j@78@01 g@75@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@78@01 0)
  (and (>= j@78@01 0) (or (< j@78@01 g@75@01) (not (< j@78@01 g@75@01))))))
(assert (or (>= j@78@01 0) (not (>= j@78@01 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@77@01 g@75@01)
  (and
    (< i@77@01 g@75@01)
    (=>
      (>= j@78@01 0)
      (and (>= j@78@01 0) (or (< j@78@01 g@75@01) (not (< j@78@01 g@75@01)))))
    (or (>= j@78@01 0) (not (>= j@78@01 0))))))
(assert (or (< i@77@01 g@75@01) (not (< i@77@01 g@75@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= i@77@01 0)
  (and
    (>= i@77@01 0)
    (=>
      (< i@77@01 g@75@01)
      (and
        (< i@77@01 g@75@01)
        (=>
          (>= j@78@01 0)
          (and (>= j@78@01 0) (or (< j@78@01 g@75@01) (not (< j@78@01 g@75@01)))))
        (or (>= j@78@01 0) (not (>= j@78@01 0)))))
    (or (< i@77@01 g@75@01) (not (< i@77@01 g@75@01))))))
(assert (or (>= i@77@01 0) (not (>= i@77@01 0))))
(push) ; 3
; [then-branch: 13 | i@77@01 >= 0 && i@77@01 < g@75@01 && j@78@01 >= 0 && j@78@01 < g@75@01 && i@77@01 != j@78@01 | live]
; [else-branch: 13 | !(i@77@01 >= 0 && i@77@01 < g@75@01 && j@78@01 >= 0 && j@78@01 < g@75@01 && i@77@01 != j@78@01) | live]
(push) ; 4
; [then-branch: 13 | i@77@01 >= 0 && i@77@01 < g@75@01 && j@78@01 >= 0 && j@78@01 < g@75@01 && i@77@01 != j@78@01]
(assert (and
  (>= i@77@01 0)
  (and
    (< i@77@01 g@75@01)
    (and (>= j@78@01 0) (and (< j@78@01 g@75@01) (not (= i@77@01 j@78@01)))))))
; [eval] trees[i] != trees[j]
; [eval] trees[i]
(push) ; 5
(assert (not (< i@77@01 (Seq_length trees@74@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] trees[j]
(push) ; 5
(assert (not (< j@78@01 (Seq_length trees@74@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 13 | !(i@77@01 >= 0 && i@77@01 < g@75@01 && j@78@01 >= 0 && j@78@01 < g@75@01 && i@77@01 != j@78@01)]
(assert (not
  (and
    (>= i@77@01 0)
    (and
      (< i@77@01 g@75@01)
      (and (>= j@78@01 0) (and (< j@78@01 g@75@01) (not (= i@77@01 j@78@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (>= i@77@01 0)
    (and
      (< i@77@01 g@75@01)
      (and (>= j@78@01 0) (and (< j@78@01 g@75@01) (not (= i@77@01 j@78@01))))))
  (and
    (>= i@77@01 0)
    (< i@77@01 g@75@01)
    (>= j@78@01 0)
    (< j@78@01 g@75@01)
    (not (= i@77@01 j@78@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= i@77@01 0)
      (and
        (< i@77@01 g@75@01)
        (and (>= j@78@01 0) (and (< j@78@01 g@75@01) (not (= i@77@01 j@78@01)))))))
  (and
    (>= i@77@01 0)
    (and
      (< i@77@01 g@75@01)
      (and (>= j@78@01 0) (and (< j@78@01 g@75@01) (not (= i@77@01 j@78@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@77@01 Int) (j@78@01 Int)) (!
  (and
    (=>
      (>= i@77@01 0)
      (and
        (>= i@77@01 0)
        (=>
          (< i@77@01 g@75@01)
          (and
            (< i@77@01 g@75@01)
            (=>
              (>= j@78@01 0)
              (and
                (>= j@78@01 0)
                (or (< j@78@01 g@75@01) (not (< j@78@01 g@75@01)))))
            (or (>= j@78@01 0) (not (>= j@78@01 0)))))
        (or (< i@77@01 g@75@01) (not (< i@77@01 g@75@01)))))
    (or (>= i@77@01 0) (not (>= i@77@01 0)))
    (=>
      (and
        (>= i@77@01 0)
        (and
          (< i@77@01 g@75@01)
          (and
            (>= j@78@01 0)
            (and (< j@78@01 g@75@01) (not (= i@77@01 j@78@01))))))
      (and
        (>= i@77@01 0)
        (< i@77@01 g@75@01)
        (>= j@78@01 0)
        (< j@78@01 g@75@01)
        (not (= i@77@01 j@78@01))))
    (or
      (not
        (and
          (>= i@77@01 0)
          (and
            (< i@77@01 g@75@01)
            (and
              (>= j@78@01 0)
              (and (< j@78@01 g@75@01) (not (= i@77@01 j@78@01)))))))
      (and
        (>= i@77@01 0)
        (and
          (< i@77@01 g@75@01)
          (and
            (>= j@78@01 0)
            (and (< j@78@01 g@75@01) (not (= i@77@01 j@78@01))))))))
  :pattern ((Seq_index trees@74@01 i@77@01) (Seq_index trees@74@01 j@78@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0508a.vpr@55@13@55@107-aux|)))
(assert (forall ((i@77@01 Int) (j@78@01 Int)) (!
  (=>
    (and
      (>= i@77@01 0)
      (and
        (< i@77@01 g@75@01)
        (and (>= j@78@01 0) (and (< j@78@01 g@75@01) (not (= i@77@01 j@78@01))))))
    (not (= (Seq_index trees@74@01 i@77@01) (Seq_index trees@74@01 j@78@01))))
  :pattern ((Seq_index trees@74@01 i@77@01) (Seq_index trees@74@01 j@78@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0508a.vpr@55@13@55@107|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@76@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@76@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))
(declare-const i@79@01 Int)
(push) ; 2
; [eval] 0 <= i && i < g
; [eval] 0 <= i
(push) ; 3
; [then-branch: 14 | !(0 <= i@79@01) | live]
; [else-branch: 14 | 0 <= i@79@01 | live]
(push) ; 4
; [then-branch: 14 | !(0 <= i@79@01)]
(assert (not (<= 0 i@79@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 14 | 0 <= i@79@01]
(assert (<= 0 i@79@01))
; [eval] i < g
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@79@01) (not (<= 0 i@79@01))))
(assert (and (<= 0 i@79@01) (< i@79@01 g@75@01)))
; [eval] trees[i]
(push) ; 3
(assert (not (>= i@79@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@79@01 (Seq_length trees@74@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@80@01 ($Ref) Int)
(declare-fun img@81@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@79@01 Int)) (!
  (=>
    (and (<= 0 i@79@01) (< i@79@01 g@75@01))
    (or (<= 0 i@79@01) (not (<= 0 i@79@01))))
  :pattern ((Seq_index trees@74@01 i@79@01))
  :qid |item-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@79@01 Int) (i2@79@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@79@01) (< i1@79@01 g@75@01))
      (and (<= 0 i2@79@01) (< i2@79@01 g@75@01))
      (= (Seq_index trees@74@01 i1@79@01) (Seq_index trees@74@01 i2@79@01)))
    (= i1@79@01 i2@79@01))
  
  :qid |item-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@79@01 Int)) (!
  (=>
    (and (<= 0 i@79@01) (< i@79@01 g@75@01))
    (and
      (= (inv@80@01 (Seq_index trees@74@01 i@79@01)) i@79@01)
      (img@81@01 (Seq_index trees@74@01 i@79@01))))
  :pattern ((Seq_index trees@74@01 i@79@01))
  :qid |quant-u-31|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@81@01 r) (and (<= 0 (inv@80@01 r)) (< (inv@80@01 r) g@75@01)))
    (= (Seq_index trees@74@01 (inv@80@01 r)) r))
  :pattern ((inv@80@01 r))
  :qid |item-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@79@01 Int)) (!
  (=>
    (and (<= 0 i@79@01) (< i@79@01 g@75@01))
    (not (= (Seq_index trees@74@01 i@79@01) $Ref.null)))
  :pattern ((Seq_index trees@74@01 i@79@01))
  :qid |item-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))
  $Snap.unit))
; [eval] (forall i: Int, j: Int :: { trees[i], trees[j] } i >= 0 && (i < g && (j >= 0 && (j < g && i != j))) ==> trees[i].item != trees[j].item)
(declare-const i@82@01 Int)
(declare-const j@83@01 Int)
(push) ; 2
; [eval] i >= 0 && (i < g && (j >= 0 && (j < g && i != j))) ==> trees[i].item != trees[j].item
; [eval] i >= 0 && (i < g && (j >= 0 && (j < g && i != j)))
; [eval] i >= 0
(push) ; 3
; [then-branch: 15 | !(i@82@01 >= 0) | live]
; [else-branch: 15 | i@82@01 >= 0 | live]
(push) ; 4
; [then-branch: 15 | !(i@82@01 >= 0)]
(assert (not (>= i@82@01 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 15 | i@82@01 >= 0]
(assert (>= i@82@01 0))
; [eval] i < g
(push) ; 5
; [then-branch: 16 | !(i@82@01 < g@75@01) | live]
; [else-branch: 16 | i@82@01 < g@75@01 | live]
(push) ; 6
; [then-branch: 16 | !(i@82@01 < g@75@01)]
(assert (not (< i@82@01 g@75@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 16 | i@82@01 < g@75@01]
(assert (< i@82@01 g@75@01))
; [eval] j >= 0
(push) ; 7
; [then-branch: 17 | !(j@83@01 >= 0) | live]
; [else-branch: 17 | j@83@01 >= 0 | live]
(push) ; 8
; [then-branch: 17 | !(j@83@01 >= 0)]
(assert (not (>= j@83@01 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 17 | j@83@01 >= 0]
(assert (>= j@83@01 0))
; [eval] j < g
(push) ; 9
; [then-branch: 18 | !(j@83@01 < g@75@01) | live]
; [else-branch: 18 | j@83@01 < g@75@01 | live]
(push) ; 10
; [then-branch: 18 | !(j@83@01 < g@75@01)]
(assert (not (< j@83@01 g@75@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 18 | j@83@01 < g@75@01]
(assert (< j@83@01 g@75@01))
; [eval] i != j
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< j@83@01 g@75@01) (not (< j@83@01 g@75@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@83@01 0)
  (and (>= j@83@01 0) (or (< j@83@01 g@75@01) (not (< j@83@01 g@75@01))))))
(assert (or (>= j@83@01 0) (not (>= j@83@01 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@82@01 g@75@01)
  (and
    (< i@82@01 g@75@01)
    (=>
      (>= j@83@01 0)
      (and (>= j@83@01 0) (or (< j@83@01 g@75@01) (not (< j@83@01 g@75@01)))))
    (or (>= j@83@01 0) (not (>= j@83@01 0))))))
(assert (or (< i@82@01 g@75@01) (not (< i@82@01 g@75@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= i@82@01 0)
  (and
    (>= i@82@01 0)
    (=>
      (< i@82@01 g@75@01)
      (and
        (< i@82@01 g@75@01)
        (=>
          (>= j@83@01 0)
          (and (>= j@83@01 0) (or (< j@83@01 g@75@01) (not (< j@83@01 g@75@01)))))
        (or (>= j@83@01 0) (not (>= j@83@01 0)))))
    (or (< i@82@01 g@75@01) (not (< i@82@01 g@75@01))))))
(assert (or (>= i@82@01 0) (not (>= i@82@01 0))))
(push) ; 3
; [then-branch: 19 | i@82@01 >= 0 && i@82@01 < g@75@01 && j@83@01 >= 0 && j@83@01 < g@75@01 && i@82@01 != j@83@01 | live]
; [else-branch: 19 | !(i@82@01 >= 0 && i@82@01 < g@75@01 && j@83@01 >= 0 && j@83@01 < g@75@01 && i@82@01 != j@83@01) | live]
(push) ; 4
; [then-branch: 19 | i@82@01 >= 0 && i@82@01 < g@75@01 && j@83@01 >= 0 && j@83@01 < g@75@01 && i@82@01 != j@83@01]
(assert (and
  (>= i@82@01 0)
  (and
    (< i@82@01 g@75@01)
    (and (>= j@83@01 0) (and (< j@83@01 g@75@01) (not (= i@82@01 j@83@01)))))))
; [eval] trees[i].item != trees[j].item
; [eval] trees[i]
(push) ; 5
(assert (not (< i@82@01 (Seq_length trees@74@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (and
  (img@81@01 (Seq_index trees@74@01 i@82@01))
  (and
    (<= 0 (inv@80@01 (Seq_index trees@74@01 i@82@01)))
    (< (inv@80@01 (Seq_index trees@74@01 i@82@01)) g@75@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] trees[j]
(push) ; 5
(assert (not (< j@83@01 (Seq_length trees@74@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (and
  (img@81@01 (Seq_index trees@74@01 j@83@01))
  (and
    (<= 0 (inv@80@01 (Seq_index trees@74@01 j@83@01)))
    (< (inv@80@01 (Seq_index trees@74@01 j@83@01)) g@75@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 19 | !(i@82@01 >= 0 && i@82@01 < g@75@01 && j@83@01 >= 0 && j@83@01 < g@75@01 && i@82@01 != j@83@01)]
(assert (not
  (and
    (>= i@82@01 0)
    (and
      (< i@82@01 g@75@01)
      (and (>= j@83@01 0) (and (< j@83@01 g@75@01) (not (= i@82@01 j@83@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (>= i@82@01 0)
    (and
      (< i@82@01 g@75@01)
      (and (>= j@83@01 0) (and (< j@83@01 g@75@01) (not (= i@82@01 j@83@01))))))
  (and
    (>= i@82@01 0)
    (< i@82@01 g@75@01)
    (>= j@83@01 0)
    (< j@83@01 g@75@01)
    (not (= i@82@01 j@83@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= i@82@01 0)
      (and
        (< i@82@01 g@75@01)
        (and (>= j@83@01 0) (and (< j@83@01 g@75@01) (not (= i@82@01 j@83@01)))))))
  (and
    (>= i@82@01 0)
    (and
      (< i@82@01 g@75@01)
      (and (>= j@83@01 0) (and (< j@83@01 g@75@01) (not (= i@82@01 j@83@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@82@01 Int) (j@83@01 Int)) (!
  (and
    (=>
      (>= i@82@01 0)
      (and
        (>= i@82@01 0)
        (=>
          (< i@82@01 g@75@01)
          (and
            (< i@82@01 g@75@01)
            (=>
              (>= j@83@01 0)
              (and
                (>= j@83@01 0)
                (or (< j@83@01 g@75@01) (not (< j@83@01 g@75@01)))))
            (or (>= j@83@01 0) (not (>= j@83@01 0)))))
        (or (< i@82@01 g@75@01) (not (< i@82@01 g@75@01)))))
    (or (>= i@82@01 0) (not (>= i@82@01 0)))
    (=>
      (and
        (>= i@82@01 0)
        (and
          (< i@82@01 g@75@01)
          (and
            (>= j@83@01 0)
            (and (< j@83@01 g@75@01) (not (= i@82@01 j@83@01))))))
      (and
        (>= i@82@01 0)
        (< i@82@01 g@75@01)
        (>= j@83@01 0)
        (< j@83@01 g@75@01)
        (not (= i@82@01 j@83@01))))
    (or
      (not
        (and
          (>= i@82@01 0)
          (and
            (< i@82@01 g@75@01)
            (and
              (>= j@83@01 0)
              (and (< j@83@01 g@75@01) (not (= i@82@01 j@83@01)))))))
      (and
        (>= i@82@01 0)
        (and
          (< i@82@01 g@75@01)
          (and
            (>= j@83@01 0)
            (and (< j@83@01 g@75@01) (not (= i@82@01 j@83@01))))))))
  :pattern ((Seq_index trees@74@01 i@82@01) (Seq_index trees@74@01 j@83@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0508a.vpr@57@13@57@117-aux|)))
(assert (forall ((i@82@01 Int) (j@83@01 Int)) (!
  (=>
    (and
      (>= i@82@01 0)
      (and
        (< i@82@01 g@75@01)
        (and (>= j@83@01 0) (and (< j@83@01 g@75@01) (not (= i@82@01 j@83@01))))))
    (not
      (=
        ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@76@01))))) (Seq_index
          trees@74@01
          i@82@01))
        ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@76@01))))) (Seq_index
          trees@74@01
          j@83@01)))))
  :pattern ((Seq_index trees@74@01 i@82@01) (Seq_index trees@74@01 j@83@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0508a.vpr@57@13@57@117|)))
(declare-const i@84@01 Int)
(push) ; 2
; [eval] 0 <= i && i < g
; [eval] 0 <= i
(push) ; 3
; [then-branch: 20 | !(0 <= i@84@01) | live]
; [else-branch: 20 | 0 <= i@84@01 | live]
(push) ; 4
; [then-branch: 20 | !(0 <= i@84@01)]
(assert (not (<= 0 i@84@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 20 | 0 <= i@84@01]
(assert (<= 0 i@84@01))
; [eval] i < g
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@84@01) (not (<= 0 i@84@01))))
(assert (and (<= 0 i@84@01) (< i@84@01 g@75@01)))
; [eval] trees[i]
(push) ; 3
(assert (not (>= i@84@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@84@01 (Seq_length trees@74@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (and
  (img@81@01 (Seq_index trees@74@01 i@84@01))
  (and
    (<= 0 (inv@80@01 (Seq_index trees@74@01 i@84@01)))
    (< (inv@80@01 (Seq_index trees@74@01 i@84@01)) g@75@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@85@01 ($Ref) Int)
(declare-fun img@86@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@84@01 Int)) (!
  (=>
    (and (<= 0 i@84@01) (< i@84@01 g@75@01))
    (or (<= 0 i@84@01) (not (<= 0 i@84@01))))
  :pattern ((Seq_index trees@74@01 i@84@01))
  :qid |bool_prop-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@84@01 Int) (i2@84@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@84@01) (< i1@84@01 g@75@01))
      (and (<= 0 i2@84@01) (< i2@84@01 g@75@01))
      (=
        ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@76@01))))) (Seq_index
          trees@74@01
          i1@84@01))
        ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@76@01))))) (Seq_index
          trees@74@01
          i2@84@01))))
    (= i1@84@01 i2@84@01))
  
  :qid |bool_prop-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@84@01 Int)) (!
  (=>
    (and (<= 0 i@84@01) (< i@84@01 g@75@01))
    (and
      (=
        (inv@85@01 ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@76@01))))) (Seq_index
          trees@74@01
          i@84@01)))
        i@84@01)
      (img@86@01 ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@76@01))))) (Seq_index
        trees@74@01
        i@84@01)))))
  :pattern ((Seq_index trees@74@01 i@84@01))
  :qid |quant-u-33|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@86@01 r) (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) g@75@01)))
    (=
      ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@76@01))))) (Seq_index
        trees@74@01
        (inv@85@01 r)))
      r))
  :pattern ((inv@85@01 r))
  :qid |bool_prop-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@84@01 Int)) (!
  (=>
    (and (<= 0 i@84@01) (< i@84@01 g@75@01))
    (not
      (=
        ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@76@01))))) (Seq_index
          trees@74@01
          i@84@01))
        $Ref.null)))
  :pattern ((Seq_index trees@74@01 i@84@01))
  :qid |bool_prop-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert (forall j: Int ::
;     { trees[j] }
;     0 <= j && j < g ==> acc(trees[j].item.bool_prop, wildcard))
(declare-const j@87@01 Int)
(push) ; 3
; [eval] 0 <= j && j < g
; [eval] 0 <= j
(push) ; 4
; [then-branch: 21 | !(0 <= j@87@01) | live]
; [else-branch: 21 | 0 <= j@87@01 | live]
(push) ; 5
; [then-branch: 21 | !(0 <= j@87@01)]
(assert (not (<= 0 j@87@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 21 | 0 <= j@87@01]
(assert (<= 0 j@87@01))
; [eval] j < g
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@87@01) (not (<= 0 j@87@01))))
(assert (and (<= 0 j@87@01) (< j@87@01 g@75@01)))
(declare-const $k@88@01 $Perm)
(assert ($Perm.isReadVar $k@88@01))
; [eval] trees[j]
(push) ; 4
(assert (not (>= j@87@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@87@01 (Seq_length trees@74@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (and
  (img@81@01 (Seq_index trees@74@01 j@87@01))
  (and
    (<= 0 (inv@80@01 (Seq_index trees@74@01 j@87@01)))
    (< (inv@80@01 (Seq_index trees@74@01 j@87@01)) g@75@01)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@89@01 ($Ref) Int)
(declare-fun img@90@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@88@01))
; Nested auxiliary terms: non-globals
(assert (forall ((j@87@01 Int)) (!
  (=>
    (and (<= 0 j@87@01) (< j@87@01 g@75@01))
    (or (<= 0 j@87@01) (not (<= 0 j@87@01))))
  :pattern ((Seq_index trees@74@01 j@87@01))
  :qid |bool_prop-aux|)))
(push) ; 3
(assert (not (forall ((j@87@01 Int)) (!
  (=>
    (and (<= 0 j@87@01) (< j@87@01 g@75@01))
    (or (= $k@88@01 $Perm.No) (< $Perm.No $k@88@01)))
  
  :qid |quant-u-34|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@87@01 Int) (j2@87@01 Int)) (!
  (=>
    (and
      (and (and (<= 0 j1@87@01) (< j1@87@01 g@75@01)) (< $Perm.No $k@88@01))
      (and (and (<= 0 j2@87@01) (< j2@87@01 g@75@01)) (< $Perm.No $k@88@01))
      (=
        ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@76@01))))) (Seq_index
          trees@74@01
          j1@87@01))
        ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@76@01))))) (Seq_index
          trees@74@01
          j2@87@01))))
    (= j1@87@01 j2@87@01))
  
  :qid |bool_prop-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@87@01 Int)) (!
  (=>
    (and (and (<= 0 j@87@01) (< j@87@01 g@75@01)) (< $Perm.No $k@88@01))
    (and
      (=
        (inv@89@01 ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@76@01))))) (Seq_index
          trees@74@01
          j@87@01)))
        j@87@01)
      (img@90@01 ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@76@01))))) (Seq_index
        trees@74@01
        j@87@01)))))
  :pattern ((Seq_index trees@74@01 j@87@01))
  :qid |bool_prop-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@90@01 r)
      (and
        (and (<= 0 (inv@89@01 r)) (< (inv@89@01 r) g@75@01))
        (< $Perm.No $k@88@01)))
    (=
      ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@76@01))))) (Seq_index
        trees@74@01
        (inv@89@01 r)))
      r))
  :pattern ((inv@89@01 r))
  :qid |bool_prop-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@91@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@89@01 r)) (< (inv@89@01 r) g@75@01))
      (img@90@01 r)
      (=
        r
        ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@76@01))))) (Seq_index
          trees@74@01
          (inv@89@01 r)))))
    ($Perm.min
      (ite
        (and (img@86@01 r) (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) g@75@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      $k@88@01)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@88@01
(assert (forall ((r $Ref)) (!
  (=>
    (not
      (=
        (ite
          (and
            (img@86@01 r)
            (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) g@75@01)))
          (/ (to_real 1) (to_real 2))
          $Perm.No)
        $Perm.No))
    (ite
      (and (img@86@01 r) (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) g@75@01)))
      (<
        (ite
          (and
            (and (<= 0 (inv@89@01 r)) (< (inv@89@01 r) g@75@01))
            (img@90@01 r)
            (=
              r
              ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@76@01))))) (Seq_index
                trees@74@01
                (inv@89@01 r)))))
          $k@88@01
          $Perm.No)
        (/ (to_real 1) (to_real 2)))
      (<
        (ite
          (and
            (and (<= 0 (inv@89@01 r)) (< (inv@89@01 r) g@75@01))
            (img@90@01 r)
            (=
              r
              ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@76@01))))) (Seq_index
                trees@74@01
                (inv@89@01 r)))))
          $k@88@01
          $Perm.No)
        $Perm.No)))
  :pattern ((img@86@01 r))
  :pattern ((inv@85@01 r))
  :pattern ((img@90@01 r))
  :pattern (($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@76@01))))) (Seq_index
    trees@74@01
    (inv@89@01 r))))
  :qid |qp.srp10|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and (<= 0 (inv@89@01 r)) (< (inv@89@01 r) g@75@01))
      (img@90@01 r)
      (=
        r
        ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@76@01))))) (Seq_index
          trees@74@01
          (inv@89@01 r)))))
    (= (- $k@88@01 (pTaken@91@01 r)) $Perm.No))
  
  :qid |quant-u-37|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@92@01 $FVF<bool_prop>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@86@01 r) (and (<= 0 (inv@85@01 r)) (< (inv@85@01 r) g@75@01)))
    (=
      ($FVF.lookup_bool_prop (as sm@92@01  $FVF<bool_prop>) r)
      ($FVF.lookup_bool_prop ($SortWrappers.$SnapTo$FVF<bool_prop> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))) r)))
  :pattern (($FVF.lookup_bool_prop (as sm@92@01  $FVF<bool_prop>) r))
  :pattern (($FVF.lookup_bool_prop ($SortWrappers.$SnapTo$FVF<bool_prop> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))) r))
  :qid |qp.fvfValDef11|)))
(pop) ; 2
(pop) ; 1
