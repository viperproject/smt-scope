(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:21:09
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/third_party/blom02.vpr
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
(declare-sort Set<Seq<$Ref>> 0)
(declare-sort Set<Int> 0)
(declare-sort Set<$Ref> 0)
(declare-sort Set<$Snap> 0)
(declare-sort $FVF<Map__keys> 0)
(declare-sort $FVF<Ref__Integer_value> 0)
(declare-sort $FVF<Map__values> 0)
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
(declare-fun $SortWrappers.Set<Seq<$Ref>>To$Snap (Set<Seq<$Ref>>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<Seq<$Ref>> ($Snap) Set<Seq<$Ref>>)
(assert (forall ((x Set<Seq<$Ref>>)) (!
    (= x ($SortWrappers.$SnapToSet<Seq<$Ref>>($SortWrappers.Set<Seq<$Ref>>To$Snap x)))
    :pattern (($SortWrappers.Set<Seq<$Ref>>To$Snap x))
    :qid |$Snap.$SnapToSet<Seq<$Ref>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<Seq<$Ref>>To$Snap($SortWrappers.$SnapToSet<Seq<$Ref>> x)))
    :pattern (($SortWrappers.$SnapToSet<Seq<$Ref>> x))
    :qid |$Snap.Set<Seq<$Ref>>To$SnapToSet<Seq<$Ref>>|
    )))
(declare-fun $SortWrappers.Set<Int>To$Snap (Set<Int>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<Int> ($Snap) Set<Int>)
(assert (forall ((x Set<Int>)) (!
    (= x ($SortWrappers.$SnapToSet<Int>($SortWrappers.Set<Int>To$Snap x)))
    :pattern (($SortWrappers.Set<Int>To$Snap x))
    :qid |$Snap.$SnapToSet<Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<Int>To$Snap($SortWrappers.$SnapToSet<Int> x)))
    :pattern (($SortWrappers.$SnapToSet<Int> x))
    :qid |$Snap.Set<Int>To$SnapToSet<Int>|
    )))
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
(declare-fun $SortWrappers.$FVF<Map__keys>To$Snap ($FVF<Map__keys>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<Map__keys> ($Snap) $FVF<Map__keys>)
(assert (forall ((x $FVF<Map__keys>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<Map__keys>($SortWrappers.$FVF<Map__keys>To$Snap x)))
    :pattern (($SortWrappers.$FVF<Map__keys>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<Map__keys>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<Map__keys>To$Snap($SortWrappers.$SnapTo$FVF<Map__keys> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<Map__keys> x))
    :qid |$Snap.$FVF<Map__keys>To$SnapTo$FVF<Map__keys>|
    )))
(declare-fun $SortWrappers.$FVF<Ref__Integer_value>To$Snap ($FVF<Ref__Integer_value>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap) $FVF<Ref__Integer_value>)
(assert (forall ((x $FVF<Ref__Integer_value>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<Ref__Integer_value>($SortWrappers.$FVF<Ref__Integer_value>To$Snap x)))
    :pattern (($SortWrappers.$FVF<Ref__Integer_value>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<Ref__Integer_value>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<Ref__Integer_value>To$Snap($SortWrappers.$SnapTo$FVF<Ref__Integer_value> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<Ref__Integer_value> x))
    :qid |$Snap.$FVF<Ref__Integer_value>To$SnapTo$FVF<Ref__Integer_value>|
    )))
(declare-fun $SortWrappers.$FVF<Map__values>To$Snap ($FVF<Map__values>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<Map__values> ($Snap) $FVF<Map__values>)
(assert (forall ((x $FVF<Map__values>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<Map__values>($SortWrappers.$FVF<Map__values>To$Snap x)))
    :pattern (($SortWrappers.$FVF<Map__values>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<Map__values>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<Map__values>To$Snap($SortWrappers.$SnapTo$FVF<Map__values> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<Map__values> x))
    :qid |$Snap.$FVF<Map__values>To$SnapTo$FVF<Map__values>|
    )))
; ////////// Symbols
(declare-fun Set_card (Set<Seq<$Ref>>) Int)
(declare-const Set_empty Set<Seq<$Ref>>)
(declare-fun Set_in (Seq<$Ref> Set<Seq<$Ref>>) Bool)
(declare-fun Set_singleton (Seq<$Ref>) Set<Seq<$Ref>>)
(declare-fun Set_unionone (Set<Seq<$Ref>> Seq<$Ref>) Set<Seq<$Ref>>)
(declare-fun Set_union (Set<Seq<$Ref>> Set<Seq<$Ref>>) Set<Seq<$Ref>>)
(declare-fun Set_intersection (Set<Seq<$Ref>> Set<Seq<$Ref>>) Set<Seq<$Ref>>)
(declare-fun Set_difference (Set<Seq<$Ref>> Set<Seq<$Ref>>) Set<Seq<$Ref>>)
(declare-fun Set_subset (Set<Seq<$Ref>> Set<Seq<$Ref>>) Bool)
(declare-fun Set_equal (Set<Seq<$Ref>> Set<Seq<$Ref>>) Bool)
(declare-fun Set_skolem_diff (Set<Seq<$Ref>> Set<Seq<$Ref>>) Seq<$Ref>)
(declare-fun Set_card (Set<Int>) Int)
(declare-const Set_empty Set<Int>)
(declare-fun Set_in (Int Set<Int>) Bool)
(declare-fun Set_singleton (Int) Set<Int>)
(declare-fun Set_unionone (Set<Int> Int) Set<Int>)
(declare-fun Set_union (Set<Int> Set<Int>) Set<Int>)
(declare-fun Set_intersection (Set<Int> Set<Int>) Set<Int>)
(declare-fun Set_difference (Set<Int> Set<Int>) Set<Int>)
(declare-fun Set_subset (Set<Int> Set<Int>) Bool)
(declare-fun Set_equal (Set<Int> Set<Int>) Bool)
(declare-fun Set_skolem_diff (Set<Int> Set<Int>) Int)
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
; /field_value_functions_declarations.smt2 [Map__keys: Seq[Ref]]
(declare-fun $FVF.domain_Map__keys ($FVF<Map__keys>) Set<$Ref>)
(declare-fun $FVF.lookup_Map__keys ($FVF<Map__keys> $Ref) Seq<$Ref>)
(declare-fun $FVF.after_Map__keys ($FVF<Map__keys> $FVF<Map__keys>) Bool)
(declare-fun $FVF.loc_Map__keys (Seq<$Ref> $Ref) Bool)
(declare-fun $FVF.perm_Map__keys ($FPM $Ref) $Perm)
(declare-const $fvfTOP_Map__keys $FVF<Map__keys>)
; /field_value_functions_declarations.smt2 [Ref__Integer_value: Int]
(declare-fun $FVF.domain_Ref__Integer_value ($FVF<Ref__Integer_value>) Set<$Ref>)
(declare-fun $FVF.lookup_Ref__Integer_value ($FVF<Ref__Integer_value> $Ref) Int)
(declare-fun $FVF.after_Ref__Integer_value ($FVF<Ref__Integer_value> $FVF<Ref__Integer_value>) Bool)
(declare-fun $FVF.loc_Ref__Integer_value (Int $Ref) Bool)
(declare-fun $FVF.perm_Ref__Integer_value ($FPM $Ref) $Perm)
(declare-const $fvfTOP_Ref__Integer_value $FVF<Ref__Integer_value>)
; /field_value_functions_declarations.smt2 [Map__values: Seq[Ref]]
(declare-fun $FVF.domain_Map__values ($FVF<Map__values>) Set<$Ref>)
(declare-fun $FVF.lookup_Map__values ($FVF<Map__values> $Ref) Seq<$Ref>)
(declare-fun $FVF.after_Map__values ($FVF<Map__values> $FVF<Map__values>) Bool)
(declare-fun $FVF.loc_Map__values (Seq<$Ref> $Ref) Bool)
(declare-fun $FVF.perm_Map__values ($FPM $Ref) $Perm)
(declare-const $fvfTOP_Map__values $FVF<Map__values>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun Map__DELETED ($Snap) Int)
(declare-fun Map__DELETED%limited ($Snap) Int)
(declare-const Map__DELETED%stateless Bool)
(declare-fun Map__DELETED%precondition ($Snap) Bool)
(declare-fun Map__EMPTY ($Snap) Int)
(declare-fun Map__EMPTY%limited ($Snap) Int)
(declare-const Map__EMPTY%stateless Bool)
(declare-fun Map__EMPTY%precondition ($Snap) Bool)
(declare-fun Map__indexOfLoop ($Snap $Ref Int Bool Int) Int)
(declare-fun Map__indexOfLoop%limited ($Snap $Ref Int Bool Int) Int)
(declare-fun Map__indexOfLoop%stateless ($Ref Int Bool Int) Bool)
(declare-fun Map__indexOfLoop%precondition ($Snap $Ref Int Bool Int) Bool)
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
(assert (forall ((s Set<Seq<$Ref>>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o Seq<$Ref>)) (!
  (not (Set_in o (as Set_empty  Set<Seq<$Ref>>)))
  :pattern ((Set_in o (as Set_empty  Set<Seq<$Ref>>)))
  )))
(assert (forall ((s Set<Seq<$Ref>>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<Seq<$Ref>>)))
    (=> (not (= (Set_card s) 0)) (exists ((x Seq<$Ref>))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r Seq<$Ref>)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r Seq<$Ref>) (o Seq<$Ref>)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r Seq<$Ref>)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (x Seq<$Ref>) (o Seq<$Ref>)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (x Seq<$Ref>)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (x Seq<$Ref>) (y Seq<$Ref>)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (x Seq<$Ref>)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (x Seq<$Ref>)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>) (o Seq<$Ref>)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>) (y Seq<$Ref>)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>) (y Seq<$Ref>)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>) (o Seq<$Ref>)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>) (o Seq<$Ref>)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>) (y Seq<$Ref>)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>)) (!
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
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>)) (!
  (=
    (Set_subset a b)
    (forall ((o Seq<$Ref>)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>)) (!
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
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>)) (!
  (=> (Set_equal a b) (= a b))
  :pattern ((Set_equal a b))
  )))
(assert (forall ((s Set<Int>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o Int)) (!
  (not (Set_in o (as Set_empty  Set<Int>)))
  :pattern ((Set_in o (as Set_empty  Set<Int>)))
  )))
(assert (forall ((s Set<Int>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<Int>)))
    (=> (not (= (Set_card s) 0)) (exists ((x Int))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r Int)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r Int) (o Int)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r Int)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<Int>) (x Int) (o Int)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<Int>) (x Int)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<Int>) (x Int) (y Int)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<Int>) (x Int)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Int>) (x Int)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>) (o Int)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>) (y Int)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>) (y Int)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>) (o Int)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>) (o Int)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>) (y Int)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>)) (!
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
(assert (forall ((a Set<Int>) (b Set<Int>)) (!
  (=
    (Set_subset a b)
    (forall ((o Int)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>)) (!
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
(assert (forall ((a Set<Int>) (b Set<Int>)) (!
  (=> (Set_equal a b) (= a b))
  :pattern ((Set_equal a b))
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
; /field_value_functions_axioms.smt2 [Map__keys: Seq[Ref]]
(assert (forall ((vs $FVF<Map__keys>) (ws $FVF<Map__keys>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_Map__keys vs) ($FVF.domain_Map__keys ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_Map__keys vs))
            (= ($FVF.lookup_Map__keys vs x) ($FVF.lookup_Map__keys ws x)))
          :pattern (($FVF.lookup_Map__keys vs x) ($FVF.lookup_Map__keys ws x))
          :qid |qp.$FVF<Map__keys>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<Map__keys>To$Snap vs)
              ($SortWrappers.$FVF<Map__keys>To$Snap ws)
              )
    :qid |qp.$FVF<Map__keys>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_Map__keys pm r))
    :pattern (($FVF.perm_Map__keys pm r)))))
(assert (forall ((r $Ref) (f Seq<$Ref>)) (!
    (= ($FVF.loc_Map__keys f r) true)
    :pattern (($FVF.loc_Map__keys f r)))))
; /field_value_functions_axioms.smt2 [Ref__Integer_value: Int]
(assert (forall ((vs $FVF<Ref__Integer_value>) (ws $FVF<Ref__Integer_value>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_Ref__Integer_value vs) ($FVF.domain_Ref__Integer_value ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_Ref__Integer_value vs))
            (= ($FVF.lookup_Ref__Integer_value vs x) ($FVF.lookup_Ref__Integer_value ws x)))
          :pattern (($FVF.lookup_Ref__Integer_value vs x) ($FVF.lookup_Ref__Integer_value ws x))
          :qid |qp.$FVF<Ref__Integer_value>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<Ref__Integer_value>To$Snap vs)
              ($SortWrappers.$FVF<Ref__Integer_value>To$Snap ws)
              )
    :qid |qp.$FVF<Ref__Integer_value>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_Ref__Integer_value pm r))
    :pattern (($FVF.perm_Ref__Integer_value pm r)))))
(assert (forall ((r $Ref) (f Int)) (!
    (= ($FVF.loc_Ref__Integer_value f r) true)
    :pattern (($FVF.loc_Ref__Integer_value f r)))))
; /field_value_functions_axioms.smt2 [Map__values: Seq[Ref]]
(assert (forall ((vs $FVF<Map__values>) (ws $FVF<Map__values>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_Map__values vs) ($FVF.domain_Map__values ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_Map__values vs))
            (= ($FVF.lookup_Map__values vs x) ($FVF.lookup_Map__values ws x)))
          :pattern (($FVF.lookup_Map__values vs x) ($FVF.lookup_Map__values ws x))
          :qid |qp.$FVF<Map__values>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<Map__values>To$Snap vs)
              ($SortWrappers.$FVF<Map__values>To$Snap ws)
              )
    :qid |qp.$FVF<Map__values>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_Map__values pm r))
    :pattern (($FVF.perm_Map__values pm r)))))
(assert (forall ((r $Ref) (f Seq<$Ref>)) (!
    (= ($FVF.loc_Map__values f r) true)
    :pattern (($FVF.loc_Map__values f r)))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(declare-fun inv@12@00 ($Snap $Ref Int Bool Int $Ref) Int)
(declare-fun img@13@00 ($Snap $Ref Int Bool Int $Ref) Bool)
(declare-fun inv@17@00 ($Snap $Ref Int Bool Int $Ref) Int)
(declare-fun img@18@00 ($Snap $Ref Int Bool Int $Ref) Bool)
(declare-fun sm@20@00 ($Snap $Ref Int Bool Int) $FVF<Ref__Integer_value>)
(declare-fun inv@26@00 ($Snap $Ref Int Bool Int $Ref) Int)
(declare-fun img@27@00 ($Snap $Ref Int Bool Int $Ref) Bool)
(declare-fun inv@32@00 ($Snap $Ref Int Bool Int $Ref) Int)
(declare-fun img@33@00 ($Snap $Ref Int Bool Int $Ref) Bool)
(declare-fun sm@28@00 ($Snap $Ref Int Bool Int) $FVF<Ref__Integer_value>)
(declare-fun sm@34@00 ($Snap $Ref Int Bool Int) $FVF<Ref__Integer_value>)
(declare-fun sm@36@00 ($Snap $Ref Int Bool Int) $FVF<Ref__Integer_value>)
(assert (forall ((s@$ $Snap)) (!
  (= (Map__DELETED%limited s@$) (Map__DELETED s@$))
  :pattern ((Map__DELETED s@$))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap)) (!
  (as Map__DELETED%stateless  Bool)
  :pattern ((Map__DELETED%limited s@$))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap)) (!
  (let ((result@0@00 (Map__DELETED%limited s@$))) (=>
    (Map__DELETED%precondition s@$)
    (= result@0@00 (- 0 2))))
  :pattern ((Map__DELETED%limited s@$))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap)) (!
  (let ((result@0@00 (Map__DELETED%limited s@$))) true)
  :pattern ((Map__DELETED%limited s@$))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap)) (!
  (=> (Map__DELETED%precondition s@$) (= (Map__DELETED s@$) (- 0 2)))
  :pattern ((Map__DELETED s@$))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap)) (!
  true
  :pattern ((Map__DELETED s@$))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap)) (!
  (= (Map__EMPTY%limited s@$) (Map__EMPTY s@$))
  :pattern ((Map__EMPTY s@$))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap)) (!
  (as Map__EMPTY%stateless  Bool)
  :pattern ((Map__EMPTY%limited s@$))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap)) (!
  (let ((result@1@00 (Map__EMPTY%limited s@$))) (=>
    (Map__EMPTY%precondition s@$)
    (= result@1@00 (- 0 1))))
  :pattern ((Map__EMPTY%limited s@$))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap)) (!
  (let ((result@1@00 (Map__EMPTY%limited s@$))) true)
  :pattern ((Map__EMPTY%limited s@$))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap)) (!
  (=> (Map__EMPTY%precondition s@$) (= (Map__EMPTY s@$) (- 0 1)))
  :pattern ((Map__EMPTY s@$))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap)) (!
  true
  :pattern ((Map__EMPTY s@$))
  :qid |quant-u-13|)))
(assert (forall ((s@$ $Snap) (diz@2@00 $Ref) (hash@3@00 Int) (ignoreDeleted@4@00 Bool) (cap@5@00 Int)) (!
  (=
    (Map__indexOfLoop%limited s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00)
    (Map__indexOfLoop s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00))
  :pattern ((Map__indexOfLoop s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (diz@2@00 $Ref) (hash@3@00 Int) (ignoreDeleted@4@00 Bool) (cap@5@00 Int)) (!
  (Map__indexOfLoop%stateless diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00)
  :pattern ((Map__indexOfLoop%limited s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (diz@2@00 $Ref) (hash@3@00 Int) (ignoreDeleted@4@00 Bool) (cap@5@00 Int)) (!
  (let ((result@6@00 (Map__indexOfLoop%limited s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00))) (and
    (forall ((i2@11@00 Int)) (!
      (=>
        (and
          (>= i2@11@00 0)
          (<
            i2@11@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
        (and
          (=
            (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
              i2@11@00))
            i2@11@00)
          (img@13@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
            i2@11@00))))
      :pattern ((Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
        i2@11@00))
      :qid |quant-u-15|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@13@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
          (and
            (>=
              (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
              0)
            (<
              (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))))
        (=
          (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
            (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r))
          r))
      :pattern ((inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r))
      :qid |Ref__Integer_value-fctOfInv|))
    (forall ((i3@16@00 Int)) (!
      (=>
        (and
          (>= i3@16@00 0)
          (<
            i3@16@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))))
        (and
          (=
            (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
              i3@16@00))
            i3@16@00)
          (img@18@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
            i3@16@00))))
      :pattern ((Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
        i3@16@00))
      :qid |quant-u-17|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@18@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
          (and
            (>=
              (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
              0)
            (<
              (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))))
        (=
          (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
            (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r))
          r))
      :pattern ((inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r))
      :qid |Ref__Integer_value-fctOfInv|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@13@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
          (and
            (>=
              (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
              0)
            (<
              (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))))
        (=
          ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r)
          ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))) r)))
      :pattern (($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r))
      :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))) r))
      :qid |qp.fvfValDef0|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@18@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
          (and
            (>=
              (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
              0)
            (<
              (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))))
        (=
          ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r)
          ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r)))
      :pattern (($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r))
      :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r))
      :qid |qp.fvfValDef1|))
    (=>
      (Map__indexOfLoop%precondition s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00)
      (or
        (= result@6@00 (Map__EMPTY $Snap.unit))
        (and
          (>= result@6@00 0)
          (<
            result@6@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))))))
  :pattern ((Map__indexOfLoop%limited s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00))
  :qid |quant-u-19|)))
(assert (forall ((s@$ $Snap) (diz@2@00 $Ref) (hash@3@00 Int) (ignoreDeleted@4@00 Bool) (cap@5@00 Int)) (!
  (let ((result@6@00 (Map__indexOfLoop%limited s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00))) (=>
    (Map__indexOfLoop%precondition s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00)
    (Map__EMPTY%precondition $Snap.unit)))
  :pattern ((Map__indexOfLoop%limited s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00))
  :qid |quant-u-20|)))
(assert (forall ((s@$ $Snap) (diz@2@00 $Ref) (hash@3@00 Int) (ignoreDeleted@4@00 Bool) (cap@5@00 Int)) (!
  (and
    (forall ((i2@11@00 Int)) (!
      (=>
        (and
          (>= i2@11@00 0)
          (<
            i2@11@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
        (and
          (=
            (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
              i2@11@00))
            i2@11@00)
          (img@13@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
            i2@11@00))))
      :pattern ((Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
        i2@11@00))
      :qid |quant-u-15|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@13@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
          (and
            (>=
              (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
              0)
            (<
              (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))))
        (=
          (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
            (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r))
          r))
      :pattern ((inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r))
      :qid |Ref__Integer_value-fctOfInv|))
    (forall ((i3@16@00 Int)) (!
      (=>
        (and
          (>= i3@16@00 0)
          (<
            i3@16@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))))
        (and
          (=
            (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
              i3@16@00))
            i3@16@00)
          (img@18@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
            i3@16@00))))
      :pattern ((Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
        i3@16@00))
      :qid |quant-u-17|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@18@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
          (and
            (>=
              (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
              0)
            (<
              (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))))
        (=
          (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
            (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r))
          r))
      :pattern ((inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r))
      :qid |Ref__Integer_value-fctOfInv|))
    (forall ((i2@25@00 Int)) (!
      (=>
        (and
          (>= i2@25@00 0)
          (<
            i2@25@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
        (and
          (=
            (inv@26@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
              i2@25@00))
            i2@25@00)
          (img@27@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
            i2@25@00))))
      :pattern ((Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
        i2@25@00))
      :qid |Ref__Integer_value-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@27@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
          (and
            (>=
              (inv@26@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
              0)
            (<
              (inv@26@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))))
        (=
          (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
            (inv@26@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r))
          r))
      :pattern ((inv@26@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r))
      :qid |Ref__Integer_value-fctOfInv|))
    (forall ((i3@31@00 Int)) (!
      (=>
        (and
          (>= i3@31@00 0)
          (<
            i3@31@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))))
        (and
          (=
            (inv@32@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
              i3@31@00))
            i3@31@00)
          (img@33@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
            i3@31@00))))
      :pattern ((Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
        i3@31@00))
      :qid |Ref__Integer_value-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@33@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
          (and
            (>=
              (inv@32@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
              0)
            (<
              (inv@32@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))))
        (=
          (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
            (inv@32@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r))
          r))
      :pattern ((inv@32@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r))
      :qid |Ref__Integer_value-fctOfInv|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@13@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
          (and
            (>=
              (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
              0)
            (<
              (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))))
        (=
          ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r)
          ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))) r)))
      :pattern (($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r))
      :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))) r))
      :qid |qp.fvfValDef0|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@18@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
          (and
            (>=
              (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
              0)
            (<
              (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))))
        (=
          ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r)
          ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r)))
      :pattern (($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r))
      :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r))
      :qid |qp.fvfValDef1|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_Ref__Integer_value (sm@28@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00)))
          (and
            (and
              (>=
                (inv@26@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
                0)
              (<
                (inv@26@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
            (img@27@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)))
        (=>
          (and
            (and
              (>=
                (inv@26@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
                0)
              (<
                (inv@26@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
            (img@27@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r))
          (Set_in r ($FVF.domain_Ref__Integer_value (sm@28@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00)))))
      :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (sm@28@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00))))
      :qid |qp.fvfDomDef5|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (and
              (>=
                (inv@26@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
                0)
              (<
                (inv@26@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
            (img@27@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r))
          (and
            (img@13@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
            (and
              (>=
                (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
                0)
              (<
                (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))))
        (=
          ($FVF.lookup_Ref__Integer_value (sm@28@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r)
          ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))) r)))
      :pattern (($FVF.lookup_Ref__Integer_value (sm@28@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r))
      :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))) r))
      :qid |qp.fvfValDef3|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (and
              (>=
                (inv@26@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
                0)
              (<
                (inv@26@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
            (img@27@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r))
          (and
            (img@18@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
            (and
              (>=
                (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
                0)
              (<
                (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
        (=
          ($FVF.lookup_Ref__Integer_value (sm@28@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r)
          ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r)))
      :pattern (($FVF.lookup_Ref__Integer_value (sm@28@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r))
      :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r))
      :qid |qp.fvfValDef4|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_Ref__Integer_value (sm@34@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00)))
          (and
            (and
              (>=
                (inv@32@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
                0)
              (<
                (inv@32@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))))
            (img@33@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)))
        (=>
          (and
            (and
              (>=
                (inv@32@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
                0)
              (<
                (inv@32@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))))
            (img@33@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r))
          (Set_in r ($FVF.domain_Ref__Integer_value (sm@34@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00)))))
      :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (sm@34@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00))))
      :qid |qp.fvfDomDef7|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (and
              (>=
                (inv@32@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
                0)
              (<
                (inv@32@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))))
            (img@33@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r))
          (and
            (img@18@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
            (and
              (>=
                (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
                0)
              (<
                (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
        (=
          ($FVF.lookup_Ref__Integer_value (sm@34@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r)
          ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r)))
      :pattern (($FVF.lookup_Ref__Integer_value (sm@34@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r))
      :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r))
      :qid |qp.fvfValDef6|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@13@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
          (and
            (>=
              (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
              0)
            (<
              (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))))
        (=
          ($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r)
          ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))) r)))
      :pattern (($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r))
      :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))) r))
      :qid |qp.fvfValDef8|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@18@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
          (and
            (>=
              (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
              0)
            (<
              (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))))
        (=
          ($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r)
          ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r)))
      :pattern (($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r))
      :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r))
      :qid |qp.fvfValDef9|))
    (=>
      (Map__indexOfLoop%precondition s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00)
      (=
        (Map__indexOfLoop s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00)
        (ite
          (<= cap@5@00 0)
          (Map__EMPTY $Snap.unit)
          (Map__indexOfLoop%limited ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($Snap.first ($Snap.second s@$))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second s@$)))
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine
                          ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (sm@28@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00))
                          ($Snap.combine
                            $Snap.unit
                            ($Snap.combine
                              ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (sm@34@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00))
                              ($Snap.combine
                                $Snap.unit
                                ($Snap.combine
                                  $Snap.unit
                                  ($Snap.combine $Snap.unit $Snap.unit))))))))))))) diz@2@00 (mod
            (+ hash@3@00 1)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))) ignoreDeleted@4@00 (-
            cap@5@00
            1))))))
  :pattern ((Map__indexOfLoop s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00))
  :qid |quant-u-30|)))
(assert (forall ((s@$ $Snap) (diz@2@00 $Ref) (hash@3@00 Int) (ignoreDeleted@4@00 Bool) (cap@5@00 Int)) (!
  (=>
    (Map__indexOfLoop%precondition s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00)
    (ite
      (<= cap@5@00 0)
      (Map__EMPTY%precondition $Snap.unit)
      (Map__indexOfLoop%precondition ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second s@$))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second s@$)))
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (sm@28@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00))
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine
                          ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (sm@34@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00))
                          ($Snap.combine
                            $Snap.unit
                            ($Snap.combine
                              $Snap.unit
                              ($Snap.combine $Snap.unit $Snap.unit))))))))))))) diz@2@00 (mod
        (+ hash@3@00 1)
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))) ignoreDeleted@4@00 (-
        cap@5@00
        1))))
  :pattern ((Map__indexOfLoop s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00))
  :qid |quant-u-31|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- Map__Map ----------
(declare-const capacity@0@01 Int)
(declare-const sys__result@1@01 $Ref)
(declare-const capacity@2@01 Int)
(declare-const sys__result@3@01 $Ref)
(set-option :timeout 0)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@3@01 $Ref.null)))
(pop) ; 2
(push) ; 2
; [exec]
; var diz: Ref
(declare-const diz@5@01 $Ref)
; [exec]
; diz := new(Map__keys, Map__values)
(declare-const diz@6@01 $Ref)
(assert (not (= diz@6@01 $Ref.null)))
(declare-const Map__keys@7@01 Seq<$Ref>)
(declare-const Map__values@8@01 Seq<$Ref>)
(assert (not (= diz@6@01 sys__result@3@01)))
(assert (not (= diz@6@01 diz@5@01)))
; [exec]
; sys__result := diz
; [exec]
; assert sys__result != null
; [eval] sys__result != null
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
