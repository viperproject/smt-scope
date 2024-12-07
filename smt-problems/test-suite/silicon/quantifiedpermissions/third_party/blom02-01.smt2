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
; ---------- FUNCTION Map__DELETED----------
(declare-fun result@0@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(declare-const $t@7@00 $Snap)
(assert (= $t@7@00 $Snap.unit))
; [eval] result == -2
; [eval] -2
(assert (= result@0@00 (- 0 2)))
(pop) ; 1
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
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] -2
(assert (= result@0@00 (- 0 2)))
; [eval] result == -2
; [eval] -2
(pop) ; 1
(assert (forall ((s@$ $Snap)) (!
  (=> (Map__DELETED%precondition s@$) (= (Map__DELETED s@$) (- 0 2)))
  :pattern ((Map__DELETED s@$))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap)) (!
  true
  :pattern ((Map__DELETED s@$))
  :qid |quant-u-9|)))
; ---------- FUNCTION Map__EMPTY----------
(declare-fun result@1@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(declare-const $t@8@00 $Snap)
(assert (= $t@8@00 $Snap.unit))
; [eval] result == -1
; [eval] -1
(assert (= result@1@00 (- 0 1)))
(pop) ; 1
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
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] -1
(assert (= result@1@00 (- 0 1)))
; [eval] result == -1
; [eval] -1
(pop) ; 1
(assert (forall ((s@$ $Snap)) (!
  (=> (Map__EMPTY%precondition s@$) (= (Map__EMPTY s@$) (- 0 1)))
  :pattern ((Map__EMPTY s@$))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap)) (!
  true
  :pattern ((Map__EMPTY s@$))
  :qid |quant-u-13|)))
; ---------- FUNCTION Map__indexOfLoop----------
(declare-fun diz@2@00 () $Ref)
(declare-fun hash@3@00 () Int)
(declare-fun ignoreDeleted@4@00 () Bool)
(declare-fun cap@5@00 () Int)
(declare-fun result@6@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@2@00 $Ref.null)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit))
; [eval] |diz.Map__keys| > 0
; [eval] |diz.Map__keys|
(assert (>
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))
  0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  $Snap.unit))
; [eval] |diz.Map__values| > 0
; [eval] |diz.Map__values|
(assert (>
  (Seq_length
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))
  0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  $Snap.unit))
; [eval] |diz.Map__keys| == |diz.Map__values|
; [eval] |diz.Map__keys|
; [eval] |diz.Map__values|
(assert (=
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))
  (Seq_length
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
  $Snap.unit))
; [eval] (forall i: Int, j: Int :: { diz.Map__keys[i], diz.Map__keys[j] } 0 <= i && (i < |diz.Map__keys| && (0 <= j && (j < |diz.Map__keys| && i != j))) ==> diz.Map__keys[i] != diz.Map__keys[j])
(declare-const i@9@00 Int)
(declare-const j@10@00 Int)
(push) ; 2
; [eval] 0 <= i && (i < |diz.Map__keys| && (0 <= j && (j < |diz.Map__keys| && i != j))) ==> diz.Map__keys[i] != diz.Map__keys[j]
; [eval] 0 <= i && (i < |diz.Map__keys| && (0 <= j && (j < |diz.Map__keys| && i != j)))
; [eval] 0 <= i
(push) ; 3
; [then-branch: 0 | !(0 <= i@9@00) | live]
; [else-branch: 0 | 0 <= i@9@00 | live]
(push) ; 4
; [then-branch: 0 | !(0 <= i@9@00)]
(assert (not (<= 0 i@9@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | 0 <= i@9@00]
(assert (<= 0 i@9@00))
; [eval] i < |diz.Map__keys|
; [eval] |diz.Map__keys|
(push) ; 5
; [then-branch: 1 | !(i@9@00 < |First:(Second:(s@$))|) | live]
; [else-branch: 1 | i@9@00 < |First:(Second:(s@$))| | live]
(push) ; 6
; [then-branch: 1 | !(i@9@00 < |First:(Second:(s@$))|)]
(assert (not
  (<
    i@9@00
    (Seq_length
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | i@9@00 < |First:(Second:(s@$))|]
(assert (<
  i@9@00
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
; [eval] 0 <= j
(push) ; 7
; [then-branch: 2 | !(0 <= j@10@00) | live]
; [else-branch: 2 | 0 <= j@10@00 | live]
(push) ; 8
; [then-branch: 2 | !(0 <= j@10@00)]
(assert (not (<= 0 j@10@00)))
(pop) ; 8
(push) ; 8
; [else-branch: 2 | 0 <= j@10@00]
(assert (<= 0 j@10@00))
; [eval] j < |diz.Map__keys|
; [eval] |diz.Map__keys|
(push) ; 9
; [then-branch: 3 | !(j@10@00 < |First:(Second:(s@$))|) | live]
; [else-branch: 3 | j@10@00 < |First:(Second:(s@$))| | live]
(push) ; 10
; [then-branch: 3 | !(j@10@00 < |First:(Second:(s@$))|)]
(assert (not
  (<
    j@10@00
    (Seq_length
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))))
(pop) ; 10
(push) ; 10
; [else-branch: 3 | j@10@00 < |First:(Second:(s@$))|]
(assert (<
  j@10@00
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
; [eval] i != j
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (<
    j@10@00
    (Seq_length
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
  (not
    (<
      j@10@00
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@10@00)
  (and
    (<= 0 j@10@00)
    (or
      (<
        j@10@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
      (not
        (<
          j@10@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))))))
(assert (or (<= 0 j@10@00) (not (<= 0 j@10@00))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (<
    i@9@00
    (Seq_length
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
  (and
    (<
      i@9@00
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
    (=>
      (<= 0 j@10@00)
      (and
        (<= 0 j@10@00)
        (or
          (<
            j@10@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
          (not
            (<
              j@10@00
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))))))
    (or (<= 0 j@10@00) (not (<= 0 j@10@00))))))
(assert (or
  (<
    i@9@00
    (Seq_length
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
  (not
    (<
      i@9@00
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@9@00)
  (and
    (<= 0 i@9@00)
    (=>
      (<
        i@9@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
      (and
        (<
          i@9@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
        (=>
          (<= 0 j@10@00)
          (and
            (<= 0 j@10@00)
            (or
              (<
                j@10@00
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
              (not
                (<
                  j@10@00
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))))))
        (or (<= 0 j@10@00) (not (<= 0 j@10@00)))))
    (or
      (<
        i@9@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
      (not
        (<
          i@9@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))))))
(assert (or (<= 0 i@9@00) (not (<= 0 i@9@00))))
(push) ; 3
; [then-branch: 4 | 0 <= i@9@00 && i@9@00 < |First:(Second:(s@$))| && 0 <= j@10@00 && j@10@00 < |First:(Second:(s@$))| && i@9@00 != j@10@00 | live]
; [else-branch: 4 | !(0 <= i@9@00 && i@9@00 < |First:(Second:(s@$))| && 0 <= j@10@00 && j@10@00 < |First:(Second:(s@$))| && i@9@00 != j@10@00) | live]
(push) ; 4
; [then-branch: 4 | 0 <= i@9@00 && i@9@00 < |First:(Second:(s@$))| && 0 <= j@10@00 && j@10@00 < |First:(Second:(s@$))| && i@9@00 != j@10@00]
(assert (and
  (<= 0 i@9@00)
  (and
    (<
      i@9@00
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
    (and
      (<= 0 j@10@00)
      (and
        (<
          j@10@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
        (not (= i@9@00 j@10@00)))))))
; [eval] diz.Map__keys[i] != diz.Map__keys[j]
; [eval] diz.Map__keys[i]
(push) ; 5
(assert (not (>= i@9@00 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] diz.Map__keys[j]
(push) ; 5
(assert (not (>= j@10@00 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 4 | !(0 <= i@9@00 && i@9@00 < |First:(Second:(s@$))| && 0 <= j@10@00 && j@10@00 < |First:(Second:(s@$))| && i@9@00 != j@10@00)]
(assert (not
  (and
    (<= 0 i@9@00)
    (and
      (<
        i@9@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
      (and
        (<= 0 j@10@00)
        (and
          (<
            j@10@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
          (not (= i@9@00 j@10@00))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (<= 0 i@9@00)
    (and
      (<
        i@9@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
      (and
        (<= 0 j@10@00)
        (and
          (<
            j@10@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
          (not (= i@9@00 j@10@00))))))
  (and
    (<= 0 i@9@00)
    (<
      i@9@00
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
    (<= 0 j@10@00)
    (<
      j@10@00
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
    (not (= i@9@00 j@10@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@9@00)
      (and
        (<
          i@9@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
        (and
          (<= 0 j@10@00)
          (and
            (<
              j@10@00
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
            (not (= i@9@00 j@10@00)))))))
  (and
    (<= 0 i@9@00)
    (and
      (<
        i@9@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
      (and
        (<= 0 j@10@00)
        (and
          (<
            j@10@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
          (not (= i@9@00 j@10@00))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@9@00 Int) (j@10@00 Int)) (!
  (and
    (=>
      (<= 0 i@9@00)
      (and
        (<= 0 i@9@00)
        (=>
          (<
            i@9@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
          (and
            (<
              i@9@00
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
            (=>
              (<= 0 j@10@00)
              (and
                (<= 0 j@10@00)
                (or
                  (<
                    j@10@00
                    (Seq_length
                      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
                  (not
                    (<
                      j@10@00
                      (Seq_length
                        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))))))
            (or (<= 0 j@10@00) (not (<= 0 j@10@00)))))
        (or
          (<
            i@9@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
          (not
            (<
              i@9@00
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))))))
    (or (<= 0 i@9@00) (not (<= 0 i@9@00)))
    (=>
      (and
        (<= 0 i@9@00)
        (and
          (<
            i@9@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
          (and
            (<= 0 j@10@00)
            (and
              (<
                j@10@00
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
              (not (= i@9@00 j@10@00))))))
      (and
        (<= 0 i@9@00)
        (<
          i@9@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
        (<= 0 j@10@00)
        (<
          j@10@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
        (not (= i@9@00 j@10@00))))
    (or
      (not
        (and
          (<= 0 i@9@00)
          (and
            (<
              i@9@00
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
            (and
              (<= 0 j@10@00)
              (and
                (<
                  j@10@00
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
                (not (= i@9@00 j@10@00)))))))
      (and
        (<= 0 i@9@00)
        (and
          (<
            i@9@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
          (and
            (<= 0 j@10@00)
            (and
              (<
                j@10@00
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
              (not (= i@9@00 j@10@00))))))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
    i@9@00) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
    j@10@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/blom02.vpr@34@12@34@150-aux|)))
(assert (forall ((i@9@00 Int) (j@10@00 Int)) (!
  (=>
    (and
      (<= 0 i@9@00)
      (and
        (<
          i@9@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
        (and
          (<= 0 j@10@00)
          (and
            (<
              j@10@00
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
            (not (= i@9@00 j@10@00))))))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
          i@9@00)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
          j@10@00))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
    i@9@00) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
    j@10@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/blom02.vpr@34@12@34@150|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))))
(declare-const i2@11@00 Int)
(push) ; 2
; [eval] i2 >= 0 && i2 < |diz.Map__keys|
; [eval] i2 >= 0
(push) ; 3
; [then-branch: 5 | !(i2@11@00 >= 0) | live]
; [else-branch: 5 | i2@11@00 >= 0 | live]
(push) ; 4
; [then-branch: 5 | !(i2@11@00 >= 0)]
(assert (not (>= i2@11@00 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 5 | i2@11@00 >= 0]
(assert (>= i2@11@00 0))
; [eval] i2 < |diz.Map__keys|
; [eval] |diz.Map__keys|
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (>= i2@11@00 0) (not (>= i2@11@00 0))))
(assert (and
  (>= i2@11@00 0)
  (<
    i2@11@00
    (Seq_length
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))))
; [eval] diz.Map__keys[i2]
(pop) ; 2
(declare-fun inv@12@00 ($Snap $Ref Int Bool Int $Ref) Int)
(declare-fun img@13@00 ($Snap $Ref Int Bool Int $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i2@11@00 Int)) (!
  (=>
    (and
      (>= i2@11@00 0)
      (<
        i2@11@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
    (or (>= i2@11@00 0) (not (>= i2@11@00 0))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
    i2@11@00))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i21@11@00 Int) (i22@11@00 Int)) (!
  (=>
    (and
      (and
        (>= i21@11@00 0)
        (<
          i21@11@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
      (and
        (>= i22@11@00 0)
        (<
          i22@11@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
          i21@11@00)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
          i22@11@00)))
    (= i21@11@00 i22@11@00))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i2@11@00 Int)) (!
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
  :qid |quant-u-15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
      (and
        (>= (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
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
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i2@11@00 Int)) (!
  (=>
    (and
      (>= i2@11@00 0)
      (<
        i2@11@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
          i2@11@00)
        $Ref.null)))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
    i2@11@00))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
  $Snap.unit))
; [eval] (forall i: Int, j: Int :: { diz.Map__values[i], diz.Map__values[j] } 0 <= i && (i < |diz.Map__values| && (0 <= j && (j < |diz.Map__values| && i != j))) ==> diz.Map__values[i] != diz.Map__values[j])
(declare-const i@14@00 Int)
(declare-const j@15@00 Int)
(push) ; 2
; [eval] 0 <= i && (i < |diz.Map__values| && (0 <= j && (j < |diz.Map__values| && i != j))) ==> diz.Map__values[i] != diz.Map__values[j]
; [eval] 0 <= i && (i < |diz.Map__values| && (0 <= j && (j < |diz.Map__values| && i != j)))
; [eval] 0 <= i
(push) ; 3
; [then-branch: 6 | !(0 <= i@14@00) | live]
; [else-branch: 6 | 0 <= i@14@00 | live]
(push) ; 4
; [then-branch: 6 | !(0 <= i@14@00)]
(assert (not (<= 0 i@14@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 6 | 0 <= i@14@00]
(assert (<= 0 i@14@00))
; [eval] i < |diz.Map__values|
; [eval] |diz.Map__values|
(push) ; 5
; [then-branch: 7 | !(i@14@00 < |First:(Second:(Second:(s@$)))|) | live]
; [else-branch: 7 | i@14@00 < |First:(Second:(Second:(s@$)))| | live]
(push) ; 6
; [then-branch: 7 | !(i@14@00 < |First:(Second:(Second:(s@$)))|)]
(assert (not
  (<
    i@14@00
    (Seq_length
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))))
(pop) ; 6
(push) ; 6
; [else-branch: 7 | i@14@00 < |First:(Second:(Second:(s@$)))|]
(assert (<
  i@14@00
  (Seq_length
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))))
; [eval] 0 <= j
(push) ; 7
; [then-branch: 8 | !(0 <= j@15@00) | live]
; [else-branch: 8 | 0 <= j@15@00 | live]
(push) ; 8
; [then-branch: 8 | !(0 <= j@15@00)]
(assert (not (<= 0 j@15@00)))
(pop) ; 8
(push) ; 8
; [else-branch: 8 | 0 <= j@15@00]
(assert (<= 0 j@15@00))
; [eval] j < |diz.Map__values|
; [eval] |diz.Map__values|
(push) ; 9
; [then-branch: 9 | !(j@15@00 < |First:(Second:(Second:(s@$)))|) | live]
; [else-branch: 9 | j@15@00 < |First:(Second:(Second:(s@$)))| | live]
(push) ; 10
; [then-branch: 9 | !(j@15@00 < |First:(Second:(Second:(s@$)))|)]
(assert (not
  (<
    j@15@00
    (Seq_length
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))))
(pop) ; 10
(push) ; 10
; [else-branch: 9 | j@15@00 < |First:(Second:(Second:(s@$)))|]
(assert (<
  j@15@00
  (Seq_length
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))))
; [eval] i != j
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (<
    j@15@00
    (Seq_length
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
  (not
    (<
      j@15@00
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@15@00)
  (and
    (<= 0 j@15@00)
    (or
      (<
        j@15@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
      (not
        (<
          j@15@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))))))))
(assert (or (<= 0 j@15@00) (not (<= 0 j@15@00))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (<
    i@14@00
    (Seq_length
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
  (and
    (<
      i@14@00
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
    (=>
      (<= 0 j@15@00)
      (and
        (<= 0 j@15@00)
        (or
          (<
            j@15@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
          (not
            (<
              j@15@00
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))))))
    (or (<= 0 j@15@00) (not (<= 0 j@15@00))))))
(assert (or
  (<
    i@14@00
    (Seq_length
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
  (not
    (<
      i@14@00
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@14@00)
  (and
    (<= 0 i@14@00)
    (=>
      (<
        i@14@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
      (and
        (<
          i@14@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
        (=>
          (<= 0 j@15@00)
          (and
            (<= 0 j@15@00)
            (or
              (<
                j@15@00
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
              (not
                (<
                  j@15@00
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))))))
        (or (<= 0 j@15@00) (not (<= 0 j@15@00)))))
    (or
      (<
        i@14@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
      (not
        (<
          i@14@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))))))))
(assert (or (<= 0 i@14@00) (not (<= 0 i@14@00))))
(push) ; 3
; [then-branch: 10 | 0 <= i@14@00 && i@14@00 < |First:(Second:(Second:(s@$)))| && 0 <= j@15@00 && j@15@00 < |First:(Second:(Second:(s@$)))| && i@14@00 != j@15@00 | live]
; [else-branch: 10 | !(0 <= i@14@00 && i@14@00 < |First:(Second:(Second:(s@$)))| && 0 <= j@15@00 && j@15@00 < |First:(Second:(Second:(s@$)))| && i@14@00 != j@15@00) | live]
(push) ; 4
; [then-branch: 10 | 0 <= i@14@00 && i@14@00 < |First:(Second:(Second:(s@$)))| && 0 <= j@15@00 && j@15@00 < |First:(Second:(Second:(s@$)))| && i@14@00 != j@15@00]
(assert (and
  (<= 0 i@14@00)
  (and
    (<
      i@14@00
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
    (and
      (<= 0 j@15@00)
      (and
        (<
          j@15@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
        (not (= i@14@00 j@15@00)))))))
; [eval] diz.Map__values[i] != diz.Map__values[j]
; [eval] diz.Map__values[i]
(push) ; 5
(assert (not (>= i@14@00 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] diz.Map__values[j]
(push) ; 5
(assert (not (>= j@15@00 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 10 | !(0 <= i@14@00 && i@14@00 < |First:(Second:(Second:(s@$)))| && 0 <= j@15@00 && j@15@00 < |First:(Second:(Second:(s@$)))| && i@14@00 != j@15@00)]
(assert (not
  (and
    (<= 0 i@14@00)
    (and
      (<
        i@14@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
      (and
        (<= 0 j@15@00)
        (and
          (<
            j@15@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
          (not (= i@14@00 j@15@00))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (<= 0 i@14@00)
    (and
      (<
        i@14@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
      (and
        (<= 0 j@15@00)
        (and
          (<
            j@15@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
          (not (= i@14@00 j@15@00))))))
  (and
    (<= 0 i@14@00)
    (<
      i@14@00
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
    (<= 0 j@15@00)
    (<
      j@15@00
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
    (not (= i@14@00 j@15@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@14@00)
      (and
        (<
          i@14@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
        (and
          (<= 0 j@15@00)
          (and
            (<
              j@15@00
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
            (not (= i@14@00 j@15@00)))))))
  (and
    (<= 0 i@14@00)
    (and
      (<
        i@14@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
      (and
        (<= 0 j@15@00)
        (and
          (<
            j@15@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
          (not (= i@14@00 j@15@00))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@14@00 Int) (j@15@00 Int)) (!
  (and
    (=>
      (<= 0 i@14@00)
      (and
        (<= 0 i@14@00)
        (=>
          (<
            i@14@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
          (and
            (<
              i@14@00
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
            (=>
              (<= 0 j@15@00)
              (and
                (<= 0 j@15@00)
                (or
                  (<
                    j@15@00
                    (Seq_length
                      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
                  (not
                    (<
                      j@15@00
                      (Seq_length
                        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))))))
            (or (<= 0 j@15@00) (not (<= 0 j@15@00)))))
        (or
          (<
            i@14@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
          (not
            (<
              i@14@00
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))))))
    (or (<= 0 i@14@00) (not (<= 0 i@14@00)))
    (=>
      (and
        (<= 0 i@14@00)
        (and
          (<
            i@14@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
          (and
            (<= 0 j@15@00)
            (and
              (<
                j@15@00
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
              (not (= i@14@00 j@15@00))))))
      (and
        (<= 0 i@14@00)
        (<
          i@14@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
        (<= 0 j@15@00)
        (<
          j@15@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
        (not (= i@14@00 j@15@00))))
    (or
      (not
        (and
          (<= 0 i@14@00)
          (and
            (<
              i@14@00
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
            (and
              (<= 0 j@15@00)
              (and
                (<
                  j@15@00
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
                (not (= i@14@00 j@15@00)))))))
      (and
        (<= 0 i@14@00)
        (and
          (<
            i@14@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
          (and
            (<= 0 j@15@00)
            (and
              (<
                j@15@00
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
              (not (= i@14@00 j@15@00))))))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
    i@14@00) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
    j@15@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/blom02.vpr@36@12@36@158-aux|)))
(assert (forall ((i@14@00 Int) (j@15@00 Int)) (!
  (=>
    (and
      (<= 0 i@14@00)
      (and
        (<
          i@14@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
        (and
          (<= 0 j@15@00)
          (and
            (<
              j@15@00
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
            (not (= i@14@00 j@15@00))))))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
          i@14@00)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
          j@15@00))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
    i@14@00) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
    j@15@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/blom02.vpr@36@12@36@158|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))))))
(declare-const i3@16@00 Int)
(push) ; 2
; [eval] i3 >= 0 && i3 < |diz.Map__values|
; [eval] i3 >= 0
(push) ; 3
; [then-branch: 11 | !(i3@16@00 >= 0) | live]
; [else-branch: 11 | i3@16@00 >= 0 | live]
(push) ; 4
; [then-branch: 11 | !(i3@16@00 >= 0)]
(assert (not (>= i3@16@00 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 11 | i3@16@00 >= 0]
(assert (>= i3@16@00 0))
; [eval] i3 < |diz.Map__values|
; [eval] |diz.Map__values|
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (>= i3@16@00 0) (not (>= i3@16@00 0))))
(assert (and
  (>= i3@16@00 0)
  (<
    i3@16@00
    (Seq_length
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))))
; [eval] diz.Map__values[i3]
(pop) ; 2
(declare-fun inv@17@00 ($Snap $Ref Int Bool Int $Ref) Int)
(declare-fun img@18@00 ($Snap $Ref Int Bool Int $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i3@16@00 Int)) (!
  (=>
    (and
      (>= i3@16@00 0)
      (<
        i3@16@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))))
    (or (>= i3@16@00 0) (not (>= i3@16@00 0))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
    i3@16@00))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i31@16@00 Int) (i32@16@00 Int)) (!
  (=>
    (and
      (and
        (>= i31@16@00 0)
        (<
          i31@16@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))))
      (and
        (>= i32@16@00 0)
        (<
          i32@16@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))))
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
          i31@16@00)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
          i32@16@00)))
    (= i31@16@00 i32@16@00))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i3@16@00 Int)) (!
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
  :qid |quant-u-17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@18@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
      (and
        (>= (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
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
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i3@16@00 Int)) (!
  (=>
    (and
      (>= i3@16@00 0)
      (<
        i3@16@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
          i3@16@00)
        $Ref.null)))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
    i3@16@00))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (=
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
        i3@16@00)
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
        i2@11@00))
    (=
      (and
        (img@18@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
        (and
          (>= (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
          (<
            (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))))
      (and
        (img@13@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
        (and
          (>= (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
          (<
            (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))))))
  
  :qid |quant-u-18|))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))))
  $Snap.unit))
; [eval] (forall i1: Int :: { diz.Map__keys[i1] } i1 >= 0 && i1 < |diz.Map__keys| ==> diz.Map__keys[i1].Ref__Integer_value == Map__EMPTY() || (diz.Map__keys[i1].Ref__Integer_value == Map__DELETED() || diz.Map__keys[i1].Ref__Integer_value >= 0))
(declare-const i1@19@00 Int)
(set-option :timeout 0)
(push) ; 2
; [eval] i1 >= 0 && i1 < |diz.Map__keys| ==> diz.Map__keys[i1].Ref__Integer_value == Map__EMPTY() || (diz.Map__keys[i1].Ref__Integer_value == Map__DELETED() || diz.Map__keys[i1].Ref__Integer_value >= 0)
; [eval] i1 >= 0 && i1 < |diz.Map__keys|
; [eval] i1 >= 0
(push) ; 3
; [then-branch: 12 | !(i1@19@00 >= 0) | live]
; [else-branch: 12 | i1@19@00 >= 0 | live]
(push) ; 4
; [then-branch: 12 | !(i1@19@00 >= 0)]
(assert (not (>= i1@19@00 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 12 | i1@19@00 >= 0]
(assert (>= i1@19@00 0))
; [eval] i1 < |diz.Map__keys|
; [eval] |diz.Map__keys|
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (>= i1@19@00 0) (not (>= i1@19@00 0))))
(push) ; 3
; [then-branch: 13 | i1@19@00 >= 0 && i1@19@00 < |First:(Second:(s@$))| | live]
; [else-branch: 13 | !(i1@19@00 >= 0 && i1@19@00 < |First:(Second:(s@$))|) | live]
(push) ; 4
; [then-branch: 13 | i1@19@00 >= 0 && i1@19@00 < |First:(Second:(s@$))|]
(assert (and
  (>= i1@19@00 0)
  (<
    i1@19@00
    (Seq_length
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))))
; [eval] diz.Map__keys[i1].Ref__Integer_value == Map__EMPTY() || (diz.Map__keys[i1].Ref__Integer_value == Map__DELETED() || diz.Map__keys[i1].Ref__Integer_value >= 0)
; [eval] diz.Map__keys[i1].Ref__Integer_value == Map__EMPTY()
; [eval] diz.Map__keys[i1]
(declare-fun sm@20@00 ($Snap $Ref Int Bool Int) $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
      (and
        (>= (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
        (<
          (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))))
    (=
      ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@18@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
      (and
        (>= (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
        (<
          (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))))
    (=
      ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r))
  :qid |qp.fvfValDef1|)))
(declare-const pm@21@00 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@21@00  $FPM) r)
    (+
      (ite
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
        $Perm.Write
        $Perm.No)
      (ite
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
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@21@00  $FPM) r))
  :qid |qp.resPrmSumDef2|)))
(push) ; 5
(assert (not (<
  $Perm.No
  ($FVF.perm_Ref__Integer_value (as pm@21@00  $FPM) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
    i1@19@00)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] Map__EMPTY()
(push) ; 5
(assert (Map__EMPTY%precondition $Snap.unit))
(pop) ; 5
; Joined path conditions
(assert (Map__EMPTY%precondition $Snap.unit))
(push) ; 5
; [then-branch: 14 | Lookup(Ref__Integer_value, sm@20@00(s@$, diz@2@00, hash@3@00, ignoreDeleted@4@00, cap@5@00), First:(Second:(s@$))[i1@19@00]) == Map__EMPTY(_) | live]
; [else-branch: 14 | Lookup(Ref__Integer_value, sm@20@00(s@$, diz@2@00, hash@3@00, ignoreDeleted@4@00, cap@5@00), First:(Second:(s@$))[i1@19@00]) != Map__EMPTY(_) | live]
(push) ; 6
; [then-branch: 14 | Lookup(Ref__Integer_value, sm@20@00(s@$, diz@2@00, hash@3@00, ignoreDeleted@4@00, cap@5@00), First:(Second:(s@$))[i1@19@00]) == Map__EMPTY(_)]
(assert (=
  ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
    i1@19@00))
  (Map__EMPTY $Snap.unit)))
(pop) ; 6
(push) ; 6
; [else-branch: 14 | Lookup(Ref__Integer_value, sm@20@00(s@$, diz@2@00, hash@3@00, ignoreDeleted@4@00, cap@5@00), First:(Second:(s@$))[i1@19@00]) != Map__EMPTY(_)]
(assert (not
  (=
    ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
      i1@19@00))
    (Map__EMPTY $Snap.unit))))
; [eval] diz.Map__keys[i1].Ref__Integer_value == Map__DELETED()
; [eval] diz.Map__keys[i1]
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@13@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
        (and
          (>= (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
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
          (>= (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
          (<
            (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))))
      (=
        ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r))
    :qid |qp.fvfValDef1|))))
(push) ; 7
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (img@13@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
          i1@19@00))
        (and
          (>=
            (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
              i1@19@00))
            0)
          (<
            (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
              i1@19@00))
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))))
      $Perm.Write
      $Perm.No)
    (ite
      (and
        (img@18@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
          i1@19@00))
        (and
          (>=
            (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
              i1@19@00))
            0)
          (<
            (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
              i1@19@00))
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] Map__DELETED()
(push) ; 7
(assert (Map__DELETED%precondition $Snap.unit))
(pop) ; 7
; Joined path conditions
(assert (Map__DELETED%precondition $Snap.unit))
(push) ; 7
; [then-branch: 15 | Lookup(Ref__Integer_value, sm@20@00(s@$, diz@2@00, hash@3@00, ignoreDeleted@4@00, cap@5@00), First:(Second:(s@$))[i1@19@00]) == Map__DELETED(_) | live]
; [else-branch: 15 | Lookup(Ref__Integer_value, sm@20@00(s@$, diz@2@00, hash@3@00, ignoreDeleted@4@00, cap@5@00), First:(Second:(s@$))[i1@19@00]) != Map__DELETED(_) | live]
(push) ; 8
; [then-branch: 15 | Lookup(Ref__Integer_value, sm@20@00(s@$, diz@2@00, hash@3@00, ignoreDeleted@4@00, cap@5@00), First:(Second:(s@$))[i1@19@00]) == Map__DELETED(_)]
(assert (=
  ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
    i1@19@00))
  (Map__DELETED $Snap.unit)))
(pop) ; 8
(push) ; 8
; [else-branch: 15 | Lookup(Ref__Integer_value, sm@20@00(s@$, diz@2@00, hash@3@00, ignoreDeleted@4@00, cap@5@00), First:(Second:(s@$))[i1@19@00]) != Map__DELETED(_)]
(assert (not
  (=
    ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
      i1@19@00))
    (Map__DELETED $Snap.unit))))
; [eval] diz.Map__keys[i1].Ref__Integer_value >= 0
; [eval] diz.Map__keys[i1]
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@13@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
        (and
          (>= (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
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
          (>= (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
          (<
            (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))))
      (=
        ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r))
    :qid |qp.fvfValDef1|))))
(push) ; 9
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (img@13@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
          i1@19@00))
        (and
          (>=
            (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
              i1@19@00))
            0)
          (<
            (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
              i1@19@00))
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))))
      $Perm.Write
      $Perm.No)
    (ite
      (and
        (img@18@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
          i1@19@00))
        (and
          (>=
            (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
              i1@19@00))
            0)
          (<
            (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
              i1@19@00))
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
      (and
        (>= (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
        (<
          (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))))
    (=
      ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@18@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
      (and
        (>= (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
        (<
          (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))))
    (=
      ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r))
  :qid |qp.fvfValDef1|)))
(assert (or
  (not
    (=
      ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
        i1@19@00))
      (Map__DELETED $Snap.unit)))
  (=
    ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
      i1@19@00))
    (Map__DELETED $Snap.unit))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
      (and
        (>= (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
        (<
          (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))))
    (=
      ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@18@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
      (and
        (>= (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
        (<
          (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))))
    (=
      ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r))
  :qid |qp.fvfValDef1|)))
(assert (=>
  (not
    (=
      ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
        i1@19@00))
      (Map__EMPTY $Snap.unit)))
  (and
    (not
      (=
        ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
          i1@19@00))
        (Map__EMPTY $Snap.unit)))
    (Map__DELETED%precondition $Snap.unit)
    (or
      (not
        (=
          ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
            i1@19@00))
          (Map__DELETED $Snap.unit)))
      (=
        ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
          i1@19@00))
        (Map__DELETED $Snap.unit))))))
(assert (or
  (not
    (=
      ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
        i1@19@00))
      (Map__EMPTY $Snap.unit)))
  (=
    ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
      i1@19@00))
    (Map__EMPTY $Snap.unit))))
(pop) ; 4
(push) ; 4
; [else-branch: 13 | !(i1@19@00 >= 0 && i1@19@00 < |First:(Second:(s@$))|)]
(assert (not
  (and
    (>= i1@19@00 0)
    (<
      i1@19@00
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
      (and
        (>= (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
        (<
          (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))))
    (=
      ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@18@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
      (and
        (>= (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
        (<
          (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))))
    (=
      ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@21@00  $FPM) r)
    (+
      (ite
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
        $Perm.Write
        $Perm.No)
      (ite
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
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@21@00  $FPM) r))
  :qid |qp.resPrmSumDef2|)))
(assert (=>
  (and
    (>= i1@19@00 0)
    (<
      i1@19@00
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
  (and
    (>= i1@19@00 0)
    (<
      i1@19@00
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
    (Map__EMPTY%precondition $Snap.unit)
    (=>
      (not
        (=
          ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
            i1@19@00))
          (Map__EMPTY $Snap.unit)))
      (and
        (not
          (=
            ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
              i1@19@00))
            (Map__EMPTY $Snap.unit)))
        (Map__DELETED%precondition $Snap.unit)
        (or
          (not
            (=
              ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
                i1@19@00))
              (Map__DELETED $Snap.unit)))
          (=
            ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
              i1@19@00))
            (Map__DELETED $Snap.unit)))))
    (or
      (not
        (=
          ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
            i1@19@00))
          (Map__EMPTY $Snap.unit)))
      (=
        ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
          i1@19@00))
        (Map__EMPTY $Snap.unit))))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= i1@19@00 0)
      (<
        i1@19@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))))
  (and
    (>= i1@19@00 0)
    (<
      i1@19@00
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
      (and
        (>= (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
        (<
          (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))))
    (=
      ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@18@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
      (and
        (>= (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
        (<
          (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))))
    (=
      ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@21@00  $FPM) r)
    (+
      (ite
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
        $Perm.Write
        $Perm.No)
      (ite
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
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@21@00  $FPM) r))
  :qid |qp.resPrmSumDef2|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i1@19@00 Int)) (!
  (and
    (or (>= i1@19@00 0) (not (>= i1@19@00 0)))
    (=>
      (and
        (>= i1@19@00 0)
        (<
          i1@19@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
      (and
        (>= i1@19@00 0)
        (<
          i1@19@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
        (Map__EMPTY%precondition $Snap.unit)
        (=>
          (not
            (=
              ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
                i1@19@00))
              (Map__EMPTY $Snap.unit)))
          (and
            (not
              (=
                ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
                  i1@19@00))
                (Map__EMPTY $Snap.unit)))
            (Map__DELETED%precondition $Snap.unit)
            (or
              (not
                (=
                  ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
                    i1@19@00))
                  (Map__DELETED $Snap.unit)))
              (=
                ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
                  i1@19@00))
                (Map__DELETED $Snap.unit)))))
        (or
          (not
            (=
              ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
                i1@19@00))
              (Map__EMPTY $Snap.unit)))
          (=
            ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
              i1@19@00))
            (Map__EMPTY $Snap.unit)))))
    (or
      (not
        (and
          (>= i1@19@00 0)
          (<
            i1@19@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))))
      (and
        (>= i1@19@00 0)
        (<
          i1@19@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
    i1@19@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/blom02.vpr@39@13@39@232-aux|)))
(assert (forall ((i1@19@00 Int)) (!
  (=>
    (and
      (>= i1@19@00 0)
      (<
        i1@19@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
    (or
      (=
        ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
          i1@19@00))
        (Map__EMPTY $Snap.unit))
      (or
        (=
          ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
            i1@19@00))
          (Map__DELETED $Snap.unit))
        (>=
          ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
            i1@19@00))
          0))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
    i1@19@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/blom02.vpr@39@13@39@232|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))))
  $Snap.unit))
; [eval] hash >= 0
(assert (>= hash@3@00 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))))))
  $Snap.unit))
; [eval] hash < |diz.Map__keys|
; [eval] |diz.Map__keys|
(assert (<
  hash@3@00
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))))))
  $Snap.unit))
; [eval] cap < |diz.Map__keys|
; [eval] |diz.Map__keys|
(assert (<
  cap@5@00
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
(declare-const $t@22@00 $Snap)
(assert (= $t@22@00 $Snap.unit))
; [eval] result == Map__EMPTY() || result >= 0 && result < |diz.Map__keys|
; [eval] result == Map__EMPTY()
; [eval] Map__EMPTY()
(push) ; 2
(assert (Map__EMPTY%precondition $Snap.unit))
(pop) ; 2
; Joined path conditions
(assert (Map__EMPTY%precondition $Snap.unit))
(push) ; 2
; [then-branch: 16 | result@6@00 == Map__EMPTY(_) | live]
; [else-branch: 16 | result@6@00 != Map__EMPTY(_) | live]
(push) ; 3
; [then-branch: 16 | result@6@00 == Map__EMPTY(_)]
(assert (= result@6@00 (Map__EMPTY $Snap.unit)))
(pop) ; 3
(push) ; 3
; [else-branch: 16 | result@6@00 != Map__EMPTY(_)]
(assert (not (= result@6@00 (Map__EMPTY $Snap.unit))))
; [eval] result >= 0 && result < |diz.Map__keys|
; [eval] result >= 0
(push) ; 4
; [then-branch: 17 | !(result@6@00 >= 0) | live]
; [else-branch: 17 | result@6@00 >= 0 | live]
(push) ; 5
; [then-branch: 17 | !(result@6@00 >= 0)]
(assert (not (>= result@6@00 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 17 | result@6@00 >= 0]
(assert (>= result@6@00 0))
; [eval] result < |diz.Map__keys|
; [eval] |diz.Map__keys|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (>= result@6@00 0) (not (>= result@6@00 0))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= result@6@00 (Map__EMPTY $Snap.unit)))
  (and
    (not (= result@6@00 (Map__EMPTY $Snap.unit)))
    (or (>= result@6@00 0) (not (>= result@6@00 0))))))
(assert (or
  (not (= result@6@00 (Map__EMPTY $Snap.unit)))
  (= result@6@00 (Map__EMPTY $Snap.unit))))
(assert (or
  (= result@6@00 (Map__EMPTY $Snap.unit))
  (and
    (>= result@6@00 0)
    (<
      result@6@00
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))))
(pop) ; 1
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
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@18@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
      (and
        (>= (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
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
  :qid |Ref__Integer_value-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
      (and
        (>= (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
        (<
          (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))))
    (=
      ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@18@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
      (and
        (>= (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
        (<
          (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))))
    (=
      ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@21@00  $FPM) r)
    (+
      (ite
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
        $Perm.Write
        $Perm.No)
      (ite
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
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@21@00  $FPM) r))
  :qid |qp.resPrmSumDef2|)))
(assert (forall ((i3@16@00 Int)) (!
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
  :qid |quant-u-17|)))
(assert (forall ((i3@16@00 Int)) (!
  (=>
    (and
      (>= i3@16@00 0)
      (<
        i3@16@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
          i3@16@00)
        $Ref.null)))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
    i3@16@00))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))))
  $Snap.unit))
(assert (forall ((i1@19@00 Int)) (!
  (and
    (or (>= i1@19@00 0) (not (>= i1@19@00 0)))
    (=>
      (and
        (>= i1@19@00 0)
        (<
          i1@19@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
      (and
        (>= i1@19@00 0)
        (<
          i1@19@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
        (Map__EMPTY%precondition $Snap.unit)
        (=>
          (not
            (=
              ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
                i1@19@00))
              (Map__EMPTY $Snap.unit)))
          (and
            (not
              (=
                ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
                  i1@19@00))
                (Map__EMPTY $Snap.unit)))
            (Map__DELETED%precondition $Snap.unit)
            (or
              (not
                (=
                  ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
                    i1@19@00))
                  (Map__DELETED $Snap.unit)))
              (=
                ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
                  i1@19@00))
                (Map__DELETED $Snap.unit)))))
        (or
          (not
            (=
              ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
                i1@19@00))
              (Map__EMPTY $Snap.unit)))
          (=
            ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
              i1@19@00))
            (Map__EMPTY $Snap.unit)))))
    (or
      (not
        (and
          (>= i1@19@00 0)
          (<
            i1@19@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))))
      (and
        (>= i1@19@00 0)
        (<
          i1@19@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
    i1@19@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/blom02.vpr@39@13@39@232-aux|)))
(assert (forall ((i1@19@00 Int)) (!
  (=>
    (and
      (>= i1@19@00 0)
      (<
        i1@19@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
    (or
      (=
        ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
          i1@19@00))
        (Map__EMPTY $Snap.unit))
      (or
        (=
          ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
            i1@19@00))
          (Map__DELETED $Snap.unit))
        (>=
          ($FVF.lookup_Ref__Integer_value (sm@20@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
            i1@19@00))
          0))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
    i1@19@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/blom02.vpr@39@13@39@232|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))))
  $Snap.unit))
(assert (>= hash@3@00 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))))))
  $Snap.unit))
(assert (<
  hash@3@00
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))))))
  $Snap.unit))
(assert (<
  cap@5@00
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
      (and
        (>= (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
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
  :qid |Ref__Integer_value-fctOfInv|)))
(assert (forall ((i2@11@00 Int)) (!
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
  :qid |quant-u-15|)))
(assert (forall ((i2@11@00 Int)) (!
  (=>
    (and
      (>= i2@11@00 0)
      (<
        i2@11@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
          i2@11@00)
        $Ref.null)))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
    i2@11@00))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
  $Snap.unit))
(assert (forall ((i@14@00 Int) (j@15@00 Int)) (!
  (and
    (=>
      (<= 0 i@14@00)
      (and
        (<= 0 i@14@00)
        (=>
          (<
            i@14@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
          (and
            (<
              i@14@00
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
            (=>
              (<= 0 j@15@00)
              (and
                (<= 0 j@15@00)
                (or
                  (<
                    j@15@00
                    (Seq_length
                      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
                  (not
                    (<
                      j@15@00
                      (Seq_length
                        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))))))
            (or (<= 0 j@15@00) (not (<= 0 j@15@00)))))
        (or
          (<
            i@14@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
          (not
            (<
              i@14@00
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))))))
    (or (<= 0 i@14@00) (not (<= 0 i@14@00)))
    (=>
      (and
        (<= 0 i@14@00)
        (and
          (<
            i@14@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
          (and
            (<= 0 j@15@00)
            (and
              (<
                j@15@00
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
              (not (= i@14@00 j@15@00))))))
      (and
        (<= 0 i@14@00)
        (<
          i@14@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
        (<= 0 j@15@00)
        (<
          j@15@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
        (not (= i@14@00 j@15@00))))
    (or
      (not
        (and
          (<= 0 i@14@00)
          (and
            (<
              i@14@00
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
            (and
              (<= 0 j@15@00)
              (and
                (<
                  j@15@00
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
                (not (= i@14@00 j@15@00)))))))
      (and
        (<= 0 i@14@00)
        (and
          (<
            i@14@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
          (and
            (<= 0 j@15@00)
            (and
              (<
                j@15@00
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
              (not (= i@14@00 j@15@00))))))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
    i@14@00) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
    j@15@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/blom02.vpr@36@12@36@158-aux|)))
(assert (forall ((i@14@00 Int) (j@15@00 Int)) (!
  (=>
    (and
      (<= 0 i@14@00)
      (and
        (<
          i@14@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
        (and
          (<= 0 j@15@00)
          (and
            (<
              j@15@00
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
            (not (= i@14@00 j@15@00))))))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
          i@14@00)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
          j@15@00))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
    i@14@00) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
    j@15@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/blom02.vpr@36@12@36@158|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))))))
(assert (forall ((i3@16@00 Int)) (!
  (=>
    (and
      (>= i3@16@00 0)
      (<
        i3@16@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))))
    (or (>= i3@16@00 0) (not (>= i3@16@00 0))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
    i3@16@00))
  :qid |Ref__Integer_value-aux|)))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (not (= diz@2@00 $Ref.null)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit))
(assert (>
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))
  0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  $Snap.unit))
(assert (>
  (Seq_length
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))
  0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  $Snap.unit))
(assert (=
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))
  (Seq_length
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
  $Snap.unit))
(assert (forall ((i@9@00 Int) (j@10@00 Int)) (!
  (and
    (=>
      (<= 0 i@9@00)
      (and
        (<= 0 i@9@00)
        (=>
          (<
            i@9@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
          (and
            (<
              i@9@00
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
            (=>
              (<= 0 j@10@00)
              (and
                (<= 0 j@10@00)
                (or
                  (<
                    j@10@00
                    (Seq_length
                      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
                  (not
                    (<
                      j@10@00
                      (Seq_length
                        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))))))
            (or (<= 0 j@10@00) (not (<= 0 j@10@00)))))
        (or
          (<
            i@9@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
          (not
            (<
              i@9@00
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))))))
    (or (<= 0 i@9@00) (not (<= 0 i@9@00)))
    (=>
      (and
        (<= 0 i@9@00)
        (and
          (<
            i@9@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
          (and
            (<= 0 j@10@00)
            (and
              (<
                j@10@00
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
              (not (= i@9@00 j@10@00))))))
      (and
        (<= 0 i@9@00)
        (<
          i@9@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
        (<= 0 j@10@00)
        (<
          j@10@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
        (not (= i@9@00 j@10@00))))
    (or
      (not
        (and
          (<= 0 i@9@00)
          (and
            (<
              i@9@00
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
            (and
              (<= 0 j@10@00)
              (and
                (<
                  j@10@00
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
                (not (= i@9@00 j@10@00)))))))
      (and
        (<= 0 i@9@00)
        (and
          (<
            i@9@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
          (and
            (<= 0 j@10@00)
            (and
              (<
                j@10@00
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
              (not (= i@9@00 j@10@00))))))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
    i@9@00) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
    j@10@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/blom02.vpr@34@12@34@150-aux|)))
(assert (forall ((i@9@00 Int) (j@10@00 Int)) (!
  (=>
    (and
      (<= 0 i@9@00)
      (and
        (<
          i@9@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
        (and
          (<= 0 j@10@00)
          (and
            (<
              j@10@00
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
            (not (= i@9@00 j@10@00))))))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
          i@9@00)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
          j@10@00))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
    i@9@00) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
    j@10@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/blom02.vpr@34@12@34@150|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))))
(assert (forall ((i2@11@00 Int)) (!
  (=>
    (and
      (>= i2@11@00 0)
      (<
        i2@11@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
    (or (>= i2@11@00 0) (not (>= i2@11@00 0))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
    i2@11@00))
  :qid |Ref__Integer_value-aux|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (cap <= 0 ? Map__EMPTY() : Map__indexOfLoop(diz, (hash + 1) % |diz.Map__keys|, ignoreDeleted, cap - 1))
; [eval] cap <= 0
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (<= cap@5@00 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<= cap@5@00 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 18 | cap@5@00 <= 0 | live]
; [else-branch: 18 | !(cap@5@00 <= 0) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 18 | cap@5@00 <= 0]
(assert (<= cap@5@00 0))
; [eval] Map__EMPTY()
(push) ; 4
(assert (Map__EMPTY%precondition $Snap.unit))
(pop) ; 4
; Joined path conditions
(assert (Map__EMPTY%precondition $Snap.unit))
(pop) ; 3
(push) ; 3
; [else-branch: 18 | !(cap@5@00 <= 0)]
(assert (not (<= cap@5@00 0)))
; [eval] Map__indexOfLoop(diz, (hash + 1) % |diz.Map__keys|, ignoreDeleted, cap - 1)
; [eval] (hash + 1) % |diz.Map__keys|
; [eval] hash + 1
; [eval] |diz.Map__keys|
(push) ; 4
(assert (not (not
  (=
    (Seq_length
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))
    0))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] cap - 1
(push) ; 4
; [eval] diz != null
; [eval] |diz.Map__keys| > 0
; [eval] |diz.Map__keys|
; [eval] |diz.Map__values| > 0
; [eval] |diz.Map__values|
; [eval] |diz.Map__keys| == |diz.Map__values|
; [eval] |diz.Map__keys|
; [eval] |diz.Map__values|
; [eval] (forall i: Int, j: Int ::0 <= i && (i < |diz.Map__keys| && (0 <= j && (j < |diz.Map__keys| && i != j))) ==> diz.Map__keys[i] != diz.Map__keys[j])
(declare-const i@23@00 Int)
(declare-const j@24@00 Int)
(push) ; 5
; [eval] 0 <= i && (i < |diz.Map__keys| && (0 <= j && (j < |diz.Map__keys| && i != j))) ==> diz.Map__keys[i] != diz.Map__keys[j]
; [eval] 0 <= i && (i < |diz.Map__keys| && (0 <= j && (j < |diz.Map__keys| && i != j)))
; [eval] 0 <= i
(push) ; 6
; [then-branch: 19 | !(0 <= i@23@00) | live]
; [else-branch: 19 | 0 <= i@23@00 | live]
(push) ; 7
; [then-branch: 19 | !(0 <= i@23@00)]
(assert (not (<= 0 i@23@00)))
(pop) ; 7
(push) ; 7
; [else-branch: 19 | 0 <= i@23@00]
(assert (<= 0 i@23@00))
; [eval] i < |diz.Map__keys|
; [eval] |diz.Map__keys|
(push) ; 8
; [then-branch: 20 | !(i@23@00 < |First:(Second:(s@$))|) | live]
; [else-branch: 20 | i@23@00 < |First:(Second:(s@$))| | live]
(push) ; 9
; [then-branch: 20 | !(i@23@00 < |First:(Second:(s@$))|)]
(assert (not
  (<
    i@23@00
    (Seq_length
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))))
(pop) ; 9
(push) ; 9
; [else-branch: 20 | i@23@00 < |First:(Second:(s@$))|]
(assert (<
  i@23@00
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
; [eval] 0 <= j
(push) ; 10
; [then-branch: 21 | !(0 <= j@24@00) | live]
; [else-branch: 21 | 0 <= j@24@00 | live]
(push) ; 11
; [then-branch: 21 | !(0 <= j@24@00)]
(assert (not (<= 0 j@24@00)))
(pop) ; 11
(push) ; 11
; [else-branch: 21 | 0 <= j@24@00]
(assert (<= 0 j@24@00))
; [eval] j < |diz.Map__keys|
; [eval] |diz.Map__keys|
(push) ; 12
; [then-branch: 22 | !(j@24@00 < |First:(Second:(s@$))|) | live]
; [else-branch: 22 | j@24@00 < |First:(Second:(s@$))| | live]
(push) ; 13
; [then-branch: 22 | !(j@24@00 < |First:(Second:(s@$))|)]
(assert (not
  (<
    j@24@00
    (Seq_length
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))))
(pop) ; 13
(push) ; 13
; [else-branch: 22 | j@24@00 < |First:(Second:(s@$))|]
(assert (<
  j@24@00
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
; [eval] i != j
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (or
  (<
    j@24@00
    (Seq_length
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
  (not
    (<
      j@24@00
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@24@00)
  (and
    (<= 0 j@24@00)
    (or
      (<
        j@24@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
      (not
        (<
          j@24@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))))))
(assert (or (<= 0 j@24@00) (not (<= 0 j@24@00))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (<
    i@23@00
    (Seq_length
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
  (and
    (<
      i@23@00
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
    (=>
      (<= 0 j@24@00)
      (and
        (<= 0 j@24@00)
        (or
          (<
            j@24@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
          (not
            (<
              j@24@00
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))))))
    (or (<= 0 j@24@00) (not (<= 0 j@24@00))))))
(assert (or
  (<
    i@23@00
    (Seq_length
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
  (not
    (<
      i@23@00
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@23@00)
  (and
    (<= 0 i@23@00)
    (=>
      (<
        i@23@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
      (and
        (<
          i@23@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
        (=>
          (<= 0 j@24@00)
          (and
            (<= 0 j@24@00)
            (or
              (<
                j@24@00
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
              (not
                (<
                  j@24@00
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))))))
        (or (<= 0 j@24@00) (not (<= 0 j@24@00)))))
    (or
      (<
        i@23@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
      (not
        (<
          i@23@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))))))
(assert (or (<= 0 i@23@00) (not (<= 0 i@23@00))))
(push) ; 6
; [then-branch: 23 | 0 <= i@23@00 && i@23@00 < |First:(Second:(s@$))| && 0 <= j@24@00 && j@24@00 < |First:(Second:(s@$))| && i@23@00 != j@24@00 | live]
; [else-branch: 23 | !(0 <= i@23@00 && i@23@00 < |First:(Second:(s@$))| && 0 <= j@24@00 && j@24@00 < |First:(Second:(s@$))| && i@23@00 != j@24@00) | live]
(push) ; 7
; [then-branch: 23 | 0 <= i@23@00 && i@23@00 < |First:(Second:(s@$))| && 0 <= j@24@00 && j@24@00 < |First:(Second:(s@$))| && i@23@00 != j@24@00]
(assert (and
  (<= 0 i@23@00)
  (and
    (<
      i@23@00
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
    (and
      (<= 0 j@24@00)
      (and
        (<
          j@24@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
        (not (= i@23@00 j@24@00)))))))
; [eval] diz.Map__keys[i] != diz.Map__keys[j]
; [eval] diz.Map__keys[i]
(push) ; 8
(assert (not (>= i@23@00 0)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [eval] diz.Map__keys[j]
(push) ; 8
(assert (not (>= j@24@00 0)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(push) ; 7
; [else-branch: 23 | !(0 <= i@23@00 && i@23@00 < |First:(Second:(s@$))| && 0 <= j@24@00 && j@24@00 < |First:(Second:(s@$))| && i@23@00 != j@24@00)]
(assert (not
  (and
    (<= 0 i@23@00)
    (and
      (<
        i@23@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
      (and
        (<= 0 j@24@00)
        (and
          (<
            j@24@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
          (not (= i@23@00 j@24@00))))))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (and
    (<= 0 i@23@00)
    (and
      (<
        i@23@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
      (and
        (<= 0 j@24@00)
        (and
          (<
            j@24@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
          (not (= i@23@00 j@24@00))))))
  (and
    (<= 0 i@23@00)
    (<
      i@23@00
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
    (<= 0 j@24@00)
    (<
      j@24@00
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
    (not (= i@23@00 j@24@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@23@00)
      (and
        (<
          i@23@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
        (and
          (<= 0 j@24@00)
          (and
            (<
              j@24@00
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
            (not (= i@23@00 j@24@00)))))))
  (and
    (<= 0 i@23@00)
    (and
      (<
        i@23@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
      (and
        (<= 0 j@24@00)
        (and
          (<
            j@24@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
          (not (= i@23@00 j@24@00))))))))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 5
(assert (not (forall ((i@23@00 Int) (j@24@00 Int)) (!
  (=>
    (and
      (<= 0 i@23@00)
      (and
        (<
          i@23@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
        (and
          (<= 0 j@24@00)
          (and
            (<
              j@24@00
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
            (not (= i@23@00 j@24@00))))))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
          i@23@00)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
          j@24@00))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/blom02.vpr@34@12@34@150|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@23@00 Int) (j@24@00 Int)) (!
  (=>
    (and
      (<= 0 i@23@00)
      (and
        (<
          i@23@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
        (and
          (<= 0 j@24@00)
          (and
            (<
              j@24@00
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
            (not (= i@23@00 j@24@00))))))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
          i@23@00)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
          j@24@00))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/blom02.vpr@34@12@34@150|)))
(declare-const i2@25@00 Int)
(push) ; 5
; [eval] i2 >= 0 && i2 < |diz.Map__keys|
; [eval] i2 >= 0
(push) ; 6
; [then-branch: 24 | !(i2@25@00 >= 0) | live]
; [else-branch: 24 | i2@25@00 >= 0 | live]
(push) ; 7
; [then-branch: 24 | !(i2@25@00 >= 0)]
(assert (not (>= i2@25@00 0)))
(pop) ; 7
(push) ; 7
; [else-branch: 24 | i2@25@00 >= 0]
(assert (>= i2@25@00 0))
; [eval] i2 < |diz.Map__keys|
; [eval] |diz.Map__keys|
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (>= i2@25@00 0) (not (>= i2@25@00 0))))
(assert (and
  (>= i2@25@00 0)
  (<
    i2@25@00
    (Seq_length
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))))
; [eval] diz.Map__keys[i2]
(pop) ; 5
(declare-fun inv@26@00 ($Snap $Ref Int Bool Int $Ref) Int)
(declare-fun img@27@00 ($Snap $Ref Int Bool Int $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i2@25@00 Int)) (!
  (=>
    (and
      (>= i2@25@00 0)
      (<
        i2@25@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
    (or (>= i2@25@00 0) (not (>= i2@25@00 0))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
    i2@25@00))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((i21@25@00 Int) (i22@25@00 Int)) (!
  (=>
    (and
      (and
        (>= i21@25@00 0)
        (<
          i21@25@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
      (and
        (>= i22@25@00 0)
        (<
          i22@25@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
          i21@25@00)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
          i22@25@00)))
    (= i21@25@00 i22@25@00))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i2@25@00 Int)) (!
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
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@27@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
      (and
        (>= (inv@26@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
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
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((i2@25@00 Int)) (!
  (=
    (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
      i2@25@00)
    (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
      i2@25@00))
  
  :qid |quant-u-22|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
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
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (and
            (>=
              (inv@26@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
              0)
            (<
              (inv@26@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
          (img@27@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
          (=
            r
            (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
              (inv@26@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r))))
        ($Perm.min
          (ite
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
            $Perm.Write
            $Perm.No)
          $Perm.Write)
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-24|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (>= (inv@26@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
        (<
          (inv@26@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
      (img@27@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
      (=
        r
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
          (inv@26@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r))))
    (=
      (-
        $Perm.Write
        (ite
          (and
            (and
              (>=
                (inv@26@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
                0)
              (<
                (inv@26@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
            (img@27@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
            (=
              r
              (Seq_index
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
                (inv@26@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r))))
          ($Perm.min
            (ite
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
              $Perm.Write
              $Perm.No)
            $Perm.Write)
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-25|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@28@00 ($Snap $Ref Int Bool Int) $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_Ref__Integer_value (sm@28@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00)))
      (and
        (and
          (>= (inv@26@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
          (<
            (inv@26@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
        (img@27@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)))
    (=>
      (and
        (and
          (>= (inv@26@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
          (<
            (inv@26@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
        (img@27@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r))
      (Set_in r ($FVF.domain_Ref__Integer_value (sm@28@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00)))))
  :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (sm@28@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00))))
  :qid |qp.fvfDomDef5|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and
          (>= (inv@26@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
          (<
            (inv@26@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
        (img@27@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r))
      (and
        (img@13@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
        (and
          (>= (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
          (<
            (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))))
    (=
      ($FVF.lookup_Ref__Integer_value (sm@28@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (sm@28@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and
          (>= (inv@26@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
          (<
            (inv@26@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
        (img@27@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r))
      (and
        (img@18@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
        (and
          (>= (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
          (<
            (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
    (=
      ($FVF.lookup_Ref__Integer_value (sm@28@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (sm@28@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r))
  :qid |qp.fvfValDef4|)))
; [eval] (forall i: Int, j: Int ::0 <= i && (i < |diz.Map__values| && (0 <= j && (j < |diz.Map__values| && i != j))) ==> diz.Map__values[i] != diz.Map__values[j])
(declare-const i@29@00 Int)
(declare-const j@30@00 Int)
(set-option :timeout 0)
(push) ; 5
; [eval] 0 <= i && (i < |diz.Map__values| && (0 <= j && (j < |diz.Map__values| && i != j))) ==> diz.Map__values[i] != diz.Map__values[j]
; [eval] 0 <= i && (i < |diz.Map__values| && (0 <= j && (j < |diz.Map__values| && i != j)))
; [eval] 0 <= i
(push) ; 6
; [then-branch: 25 | !(0 <= i@29@00) | live]
; [else-branch: 25 | 0 <= i@29@00 | live]
(push) ; 7
; [then-branch: 25 | !(0 <= i@29@00)]
(assert (not (<= 0 i@29@00)))
(pop) ; 7
(push) ; 7
; [else-branch: 25 | 0 <= i@29@00]
(assert (<= 0 i@29@00))
; [eval] i < |diz.Map__values|
; [eval] |diz.Map__values|
(push) ; 8
; [then-branch: 26 | !(i@29@00 < |First:(Second:(Second:(s@$)))|) | live]
; [else-branch: 26 | i@29@00 < |First:(Second:(Second:(s@$)))| | live]
(push) ; 9
; [then-branch: 26 | !(i@29@00 < |First:(Second:(Second:(s@$)))|)]
(assert (not
  (<
    i@29@00
    (Seq_length
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))))
(pop) ; 9
(push) ; 9
; [else-branch: 26 | i@29@00 < |First:(Second:(Second:(s@$)))|]
(assert (<
  i@29@00
  (Seq_length
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))))
; [eval] 0 <= j
(push) ; 10
; [then-branch: 27 | !(0 <= j@30@00) | live]
; [else-branch: 27 | 0 <= j@30@00 | live]
(push) ; 11
; [then-branch: 27 | !(0 <= j@30@00)]
(assert (not (<= 0 j@30@00)))
(pop) ; 11
(push) ; 11
; [else-branch: 27 | 0 <= j@30@00]
(assert (<= 0 j@30@00))
; [eval] j < |diz.Map__values|
; [eval] |diz.Map__values|
(push) ; 12
; [then-branch: 28 | !(j@30@00 < |First:(Second:(Second:(s@$)))|) | live]
; [else-branch: 28 | j@30@00 < |First:(Second:(Second:(s@$)))| | live]
(push) ; 13
; [then-branch: 28 | !(j@30@00 < |First:(Second:(Second:(s@$)))|)]
(assert (not
  (<
    j@30@00
    (Seq_length
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))))
(pop) ; 13
(push) ; 13
; [else-branch: 28 | j@30@00 < |First:(Second:(Second:(s@$)))|]
(assert (<
  j@30@00
  (Seq_length
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))))
; [eval] i != j
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (or
  (<
    j@30@00
    (Seq_length
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
  (not
    (<
      j@30@00
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@30@00)
  (and
    (<= 0 j@30@00)
    (or
      (<
        j@30@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
      (not
        (<
          j@30@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))))))))
(assert (or (<= 0 j@30@00) (not (<= 0 j@30@00))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (<
    i@29@00
    (Seq_length
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
  (and
    (<
      i@29@00
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
    (=>
      (<= 0 j@30@00)
      (and
        (<= 0 j@30@00)
        (or
          (<
            j@30@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
          (not
            (<
              j@30@00
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))))))
    (or (<= 0 j@30@00) (not (<= 0 j@30@00))))))
(assert (or
  (<
    i@29@00
    (Seq_length
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
  (not
    (<
      i@29@00
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@29@00)
  (and
    (<= 0 i@29@00)
    (=>
      (<
        i@29@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
      (and
        (<
          i@29@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
        (=>
          (<= 0 j@30@00)
          (and
            (<= 0 j@30@00)
            (or
              (<
                j@30@00
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
              (not
                (<
                  j@30@00
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))))))
        (or (<= 0 j@30@00) (not (<= 0 j@30@00)))))
    (or
      (<
        i@29@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
      (not
        (<
          i@29@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))))))))
(assert (or (<= 0 i@29@00) (not (<= 0 i@29@00))))
(push) ; 6
; [then-branch: 29 | 0 <= i@29@00 && i@29@00 < |First:(Second:(Second:(s@$)))| && 0 <= j@30@00 && j@30@00 < |First:(Second:(Second:(s@$)))| && i@29@00 != j@30@00 | live]
; [else-branch: 29 | !(0 <= i@29@00 && i@29@00 < |First:(Second:(Second:(s@$)))| && 0 <= j@30@00 && j@30@00 < |First:(Second:(Second:(s@$)))| && i@29@00 != j@30@00) | live]
(push) ; 7
; [then-branch: 29 | 0 <= i@29@00 && i@29@00 < |First:(Second:(Second:(s@$)))| && 0 <= j@30@00 && j@30@00 < |First:(Second:(Second:(s@$)))| && i@29@00 != j@30@00]
(assert (and
  (<= 0 i@29@00)
  (and
    (<
      i@29@00
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
    (and
      (<= 0 j@30@00)
      (and
        (<
          j@30@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
        (not (= i@29@00 j@30@00)))))))
; [eval] diz.Map__values[i] != diz.Map__values[j]
; [eval] diz.Map__values[i]
(push) ; 8
(assert (not (>= i@29@00 0)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [eval] diz.Map__values[j]
(push) ; 8
(assert (not (>= j@30@00 0)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(push) ; 7
; [else-branch: 29 | !(0 <= i@29@00 && i@29@00 < |First:(Second:(Second:(s@$)))| && 0 <= j@30@00 && j@30@00 < |First:(Second:(Second:(s@$)))| && i@29@00 != j@30@00)]
(assert (not
  (and
    (<= 0 i@29@00)
    (and
      (<
        i@29@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
      (and
        (<= 0 j@30@00)
        (and
          (<
            j@30@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
          (not (= i@29@00 j@30@00))))))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (and
    (<= 0 i@29@00)
    (and
      (<
        i@29@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
      (and
        (<= 0 j@30@00)
        (and
          (<
            j@30@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
          (not (= i@29@00 j@30@00))))))
  (and
    (<= 0 i@29@00)
    (<
      i@29@00
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
    (<= 0 j@30@00)
    (<
      j@30@00
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
    (not (= i@29@00 j@30@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@29@00)
      (and
        (<
          i@29@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
        (and
          (<= 0 j@30@00)
          (and
            (<
              j@30@00
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
            (not (= i@29@00 j@30@00)))))))
  (and
    (<= 0 i@29@00)
    (and
      (<
        i@29@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
      (and
        (<= 0 j@30@00)
        (and
          (<
            j@30@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
          (not (= i@29@00 j@30@00))))))))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 5
(assert (not (forall ((i@29@00 Int) (j@30@00 Int)) (!
  (=>
    (and
      (<= 0 i@29@00)
      (and
        (<
          i@29@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
        (and
          (<= 0 j@30@00)
          (and
            (<
              j@30@00
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
            (not (= i@29@00 j@30@00))))))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
          i@29@00)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
          j@30@00))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/blom02.vpr@36@12@36@158|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@29@00 Int) (j@30@00 Int)) (!
  (=>
    (and
      (<= 0 i@29@00)
      (and
        (<
          i@29@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
        (and
          (<= 0 j@30@00)
          (and
            (<
              j@30@00
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
            (not (= i@29@00 j@30@00))))))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
          i@29@00)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
          j@30@00))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/blom02.vpr@36@12@36@158|)))
(declare-const i3@31@00 Int)
(push) ; 5
; [eval] i3 >= 0 && i3 < |diz.Map__values|
; [eval] i3 >= 0
(push) ; 6
; [then-branch: 30 | !(i3@31@00 >= 0) | live]
; [else-branch: 30 | i3@31@00 >= 0 | live]
(push) ; 7
; [then-branch: 30 | !(i3@31@00 >= 0)]
(assert (not (>= i3@31@00 0)))
(pop) ; 7
(push) ; 7
; [else-branch: 30 | i3@31@00 >= 0]
(assert (>= i3@31@00 0))
; [eval] i3 < |diz.Map__values|
; [eval] |diz.Map__values|
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (>= i3@31@00 0) (not (>= i3@31@00 0))))
(assert (and
  (>= i3@31@00 0)
  (<
    i3@31@00
    (Seq_length
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))))
; [eval] diz.Map__values[i3]
(pop) ; 5
(declare-fun inv@32@00 ($Snap $Ref Int Bool Int $Ref) Int)
(declare-fun img@33@00 ($Snap $Ref Int Bool Int $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i3@31@00 Int)) (!
  (=>
    (and
      (>= i3@31@00 0)
      (<
        i3@31@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))))
    (or (>= i3@31@00 0) (not (>= i3@31@00 0))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
    i3@31@00))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((i31@31@00 Int) (i32@31@00 Int)) (!
  (=>
    (and
      (and
        (>= i31@31@00 0)
        (<
          i31@31@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))))
      (and
        (>= i32@31@00 0)
        (<
          i32@31@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))))
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
          i31@31@00)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
          i32@31@00)))
    (= i31@31@00 i32@31@00))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i3@31@00 Int)) (!
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
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@33@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
      (and
        (>= (inv@32@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
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
  :qid |Ref__Integer_value-fctOfInv|)))
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
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
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (and
            (>=
              (inv@32@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
              0)
            (<
              (inv@32@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))))
          (img@33@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
          (=
            r
            (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
              (inv@32@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r))))
        ($Perm.min
          (ite
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
            $Perm.Write
            $Perm.No)
          $Perm.Write)
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-28|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (>= (inv@32@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
        (<
          (inv@32@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))))
      (img@33@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
      (=
        r
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
          (inv@32@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r))))
    (=
      (-
        $Perm.Write
        (ite
          (and
            (and
              (>=
                (inv@32@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
                0)
              (<
                (inv@32@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))))
            (img@33@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
            (=
              r
              (Seq_index
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
                (inv@32@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r))))
          ($Perm.min
            (ite
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
              $Perm.Write
              $Perm.No)
            $Perm.Write)
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-29|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@34@00 ($Snap $Ref Int Bool Int) $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_Ref__Integer_value (sm@34@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00)))
      (and
        (and
          (>= (inv@32@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
          (<
            (inv@32@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))))
        (img@33@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)))
    (=>
      (and
        (and
          (>= (inv@32@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
          (<
            (inv@32@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))))
        (img@33@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r))
      (Set_in r ($FVF.domain_Ref__Integer_value (sm@34@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00)))))
  :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (sm@34@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00))))
  :qid |qp.fvfDomDef7|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and
          (>= (inv@32@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
          (<
            (inv@32@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))))
        (img@33@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r))
      (and
        (img@18@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
        (and
          (>= (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
          (<
            (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
    (=
      ($FVF.lookup_Ref__Integer_value (sm@34@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (sm@34@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r))
  :qid |qp.fvfValDef6|)))
; [eval] (forall i1: Int ::i1 >= 0 && i1 < |diz.Map__keys| ==> diz.Map__keys[i1].Ref__Integer_value == Map__EMPTY() || (diz.Map__keys[i1].Ref__Integer_value == Map__DELETED() || diz.Map__keys[i1].Ref__Integer_value >= 0))
(declare-const i1@35@00 Int)
(set-option :timeout 0)
(push) ; 5
; [eval] i1 >= 0 && i1 < |diz.Map__keys| ==> diz.Map__keys[i1].Ref__Integer_value == Map__EMPTY() || (diz.Map__keys[i1].Ref__Integer_value == Map__DELETED() || diz.Map__keys[i1].Ref__Integer_value >= 0)
; [eval] i1 >= 0 && i1 < |diz.Map__keys|
; [eval] i1 >= 0
(push) ; 6
; [then-branch: 31 | !(i1@35@00 >= 0) | live]
; [else-branch: 31 | i1@35@00 >= 0 | live]
(push) ; 7
; [then-branch: 31 | !(i1@35@00 >= 0)]
(assert (not (>= i1@35@00 0)))
(pop) ; 7
(push) ; 7
; [else-branch: 31 | i1@35@00 >= 0]
(assert (>= i1@35@00 0))
; [eval] i1 < |diz.Map__keys|
; [eval] |diz.Map__keys|
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (>= i1@35@00 0) (not (>= i1@35@00 0))))
(push) ; 6
; [then-branch: 32 | i1@35@00 >= 0 && i1@35@00 < |First:(Second:(s@$))| | live]
; [else-branch: 32 | !(i1@35@00 >= 0 && i1@35@00 < |First:(Second:(s@$))|) | live]
(push) ; 7
; [then-branch: 32 | i1@35@00 >= 0 && i1@35@00 < |First:(Second:(s@$))|]
(assert (and
  (>= i1@35@00 0)
  (<
    i1@35@00
    (Seq_length
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))))
; [eval] diz.Map__keys[i1].Ref__Integer_value == Map__EMPTY() || (diz.Map__keys[i1].Ref__Integer_value == Map__DELETED() || diz.Map__keys[i1].Ref__Integer_value >= 0)
; [eval] diz.Map__keys[i1].Ref__Integer_value == Map__EMPTY()
; [eval] diz.Map__keys[i1]
(declare-fun sm@36@00 ($Snap $Ref Int Bool Int) $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
      (and
        (>= (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
        (<
          (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))))
    (=
      ($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@18@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
      (and
        (>= (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
        (<
          (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))))
    (=
      ($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r))
  :qid |qp.fvfValDef9|)))
(declare-const pm@37@00 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@37@00  $FPM) r)
    (+
      (ite
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
        $Perm.Write
        $Perm.No)
      (ite
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
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@37@00  $FPM) r))
  :qid |qp.resPrmSumDef10|)))
(push) ; 8
(assert (not (<
  $Perm.No
  ($FVF.perm_Ref__Integer_value (as pm@37@00  $FPM) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
    i1@35@00)))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [eval] Map__EMPTY()
(push) ; 8
(assert (Map__EMPTY%precondition $Snap.unit))
(pop) ; 8
; Joined path conditions
(assert (Map__EMPTY%precondition $Snap.unit))
(push) ; 8
; [then-branch: 33 | Lookup(Ref__Integer_value, sm@36@00(s@$, diz@2@00, hash@3@00, ignoreDeleted@4@00, cap@5@00), First:(Second:(s@$))[i1@35@00]) == Map__EMPTY(_) | live]
; [else-branch: 33 | Lookup(Ref__Integer_value, sm@36@00(s@$, diz@2@00, hash@3@00, ignoreDeleted@4@00, cap@5@00), First:(Second:(s@$))[i1@35@00]) != Map__EMPTY(_) | live]
(push) ; 9
; [then-branch: 33 | Lookup(Ref__Integer_value, sm@36@00(s@$, diz@2@00, hash@3@00, ignoreDeleted@4@00, cap@5@00), First:(Second:(s@$))[i1@35@00]) == Map__EMPTY(_)]
(assert (=
  ($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
    i1@35@00))
  (Map__EMPTY $Snap.unit)))
(pop) ; 9
(push) ; 9
; [else-branch: 33 | Lookup(Ref__Integer_value, sm@36@00(s@$, diz@2@00, hash@3@00, ignoreDeleted@4@00, cap@5@00), First:(Second:(s@$))[i1@35@00]) != Map__EMPTY(_)]
(assert (not
  (=
    ($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
      i1@35@00))
    (Map__EMPTY $Snap.unit))))
; [eval] diz.Map__keys[i1].Ref__Integer_value == Map__DELETED()
; [eval] diz.Map__keys[i1]
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@13@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
        (and
          (>= (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
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
          (>= (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
          (<
            (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))))
      (=
        ($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r))
    :qid |qp.fvfValDef9|))))
(push) ; 10
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (img@13@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
          i1@35@00))
        (and
          (>=
            (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
              i1@35@00))
            0)
          (<
            (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
              i1@35@00))
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))))
      $Perm.Write
      $Perm.No)
    (ite
      (and
        (img@18@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
          i1@35@00))
        (and
          (>=
            (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
              i1@35@00))
            0)
          (<
            (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
              i1@35@00))
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [eval] Map__DELETED()
(push) ; 10
(assert (Map__DELETED%precondition $Snap.unit))
(pop) ; 10
; Joined path conditions
(assert (Map__DELETED%precondition $Snap.unit))
(push) ; 10
; [then-branch: 34 | Lookup(Ref__Integer_value, sm@36@00(s@$, diz@2@00, hash@3@00, ignoreDeleted@4@00, cap@5@00), First:(Second:(s@$))[i1@35@00]) == Map__DELETED(_) | live]
; [else-branch: 34 | Lookup(Ref__Integer_value, sm@36@00(s@$, diz@2@00, hash@3@00, ignoreDeleted@4@00, cap@5@00), First:(Second:(s@$))[i1@35@00]) != Map__DELETED(_) | live]
(push) ; 11
; [then-branch: 34 | Lookup(Ref__Integer_value, sm@36@00(s@$, diz@2@00, hash@3@00, ignoreDeleted@4@00, cap@5@00), First:(Second:(s@$))[i1@35@00]) == Map__DELETED(_)]
(assert (=
  ($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
    i1@35@00))
  (Map__DELETED $Snap.unit)))
(pop) ; 11
(push) ; 11
; [else-branch: 34 | Lookup(Ref__Integer_value, sm@36@00(s@$, diz@2@00, hash@3@00, ignoreDeleted@4@00, cap@5@00), First:(Second:(s@$))[i1@35@00]) != Map__DELETED(_)]
(assert (not
  (=
    ($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
      i1@35@00))
    (Map__DELETED $Snap.unit))))
; [eval] diz.Map__keys[i1].Ref__Integer_value >= 0
; [eval] diz.Map__keys[i1]
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@13@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
        (and
          (>= (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
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
          (>= (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
          (<
            (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))))
      (=
        ($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r))
    :qid |qp.fvfValDef9|))))
(push) ; 12
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (img@13@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
          i1@35@00))
        (and
          (>=
            (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
              i1@35@00))
            0)
          (<
            (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
              i1@35@00))
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))))
      $Perm.Write
      $Perm.No)
    (ite
      (and
        (img@18@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
          i1@35@00))
        (and
          (>=
            (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
              i1@35@00))
            0)
          (<
            (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
              i1@35@00))
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
      (and
        (>= (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
        (<
          (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))))
    (=
      ($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@18@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
      (and
        (>= (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
        (<
          (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))))
    (=
      ($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r))
  :qid |qp.fvfValDef9|)))
(assert (or
  (not
    (=
      ($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
        i1@35@00))
      (Map__DELETED $Snap.unit)))
  (=
    ($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
      i1@35@00))
    (Map__DELETED $Snap.unit))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
      (and
        (>= (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
        (<
          (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))))
    (=
      ($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@18@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
      (and
        (>= (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
        (<
          (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))))
    (=
      ($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r))
  :qid |qp.fvfValDef9|)))
(assert (=>
  (not
    (=
      ($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
        i1@35@00))
      (Map__EMPTY $Snap.unit)))
  (and
    (not
      (=
        ($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
          i1@35@00))
        (Map__EMPTY $Snap.unit)))
    (Map__DELETED%precondition $Snap.unit)
    (or
      (not
        (=
          ($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
            i1@35@00))
          (Map__DELETED $Snap.unit)))
      (=
        ($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
          i1@35@00))
        (Map__DELETED $Snap.unit))))))
(assert (or
  (not
    (=
      ($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
        i1@35@00))
      (Map__EMPTY $Snap.unit)))
  (=
    ($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
      i1@35@00))
    (Map__EMPTY $Snap.unit))))
(pop) ; 7
(push) ; 7
; [else-branch: 32 | !(i1@35@00 >= 0 && i1@35@00 < |First:(Second:(s@$))|)]
(assert (not
  (and
    (>= i1@35@00 0)
    (<
      i1@35@00
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
      (and
        (>= (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
        (<
          (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))))
    (=
      ($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@18@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
      (and
        (>= (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
        (<
          (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))))
    (=
      ($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@37@00  $FPM) r)
    (+
      (ite
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
        $Perm.Write
        $Perm.No)
      (ite
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
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@37@00  $FPM) r))
  :qid |qp.resPrmSumDef10|)))
(assert (=>
  (and
    (>= i1@35@00 0)
    (<
      i1@35@00
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
  (and
    (>= i1@35@00 0)
    (<
      i1@35@00
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
    (Map__EMPTY%precondition $Snap.unit)
    (=>
      (not
        (=
          ($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
            i1@35@00))
          (Map__EMPTY $Snap.unit)))
      (and
        (not
          (=
            ($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
              i1@35@00))
            (Map__EMPTY $Snap.unit)))
        (Map__DELETED%precondition $Snap.unit)
        (or
          (not
            (=
              ($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
                i1@35@00))
              (Map__DELETED $Snap.unit)))
          (=
            ($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
              i1@35@00))
            (Map__DELETED $Snap.unit)))))
    (or
      (not
        (=
          ($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
            i1@35@00))
          (Map__EMPTY $Snap.unit)))
      (=
        ($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
          i1@35@00))
        (Map__EMPTY $Snap.unit))))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= i1@35@00 0)
      (<
        i1@35@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))))
  (and
    (>= i1@35@00 0)
    (<
      i1@35@00
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
      (and
        (>= (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
        (<
          (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))))
    (=
      ($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@18@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
      (and
        (>= (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
        (<
          (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))))
    (=
      ($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@37@00  $FPM) r)
    (+
      (ite
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
        $Perm.Write
        $Perm.No)
      (ite
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
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@37@00  $FPM) r))
  :qid |qp.resPrmSumDef10|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i1@35@00 Int)) (!
  (=>
    (and
      (>= i1@35@00 0)
      (<
        i1@35@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
    (and
      (Map__EMPTY%precondition $Snap.unit)
      (=>
        (not
          (=
            ($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
              i1@35@00))
            (Map__EMPTY $Snap.unit)))
        (Map__DELETED%precondition $Snap.unit))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/blom02.vpr@39@13@39@232_precondition|)))
(push) ; 5
(assert (not (forall ((i1@35@00 Int)) (!
  (=>
    (and
      (=>
        (and
          (>= i1@35@00 0)
          (<
            i1@35@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
        (and
          (Map__EMPTY%precondition $Snap.unit)
          (=>
            (not
              (=
                ($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
                  i1@35@00))
                (Map__EMPTY $Snap.unit)))
            (Map__DELETED%precondition $Snap.unit))))
      (and
        (>= i1@35@00 0)
        (<
          i1@35@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))))
    (or
      (=
        ($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
          i1@35@00))
        (Map__EMPTY $Snap.unit))
      (or
        (=
          ($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
            i1@35@00))
          (Map__DELETED $Snap.unit))
        (>=
          ($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
            i1@35@00))
          0))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/blom02.vpr@39@13@39@232|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i1@35@00 Int)) (!
  (=>
    (and
      (>= i1@35@00 0)
      (<
        i1@35@00
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
    (or
      (=
        ($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
          i1@35@00))
        (Map__EMPTY $Snap.unit))
      (or
        (=
          ($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
            i1@35@00))
          (Map__DELETED $Snap.unit))
        (>=
          ($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
            i1@35@00))
          0))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/blom02.vpr@39@13@39@232|)))
; [eval] hash >= 0
(push) ; 5
(assert (not (>=
  (mod
    (+ hash@3@00 1)
    (Seq_length
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
  0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (>=
  (mod
    (+ hash@3@00 1)
    (Seq_length
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
  0))
; [eval] hash < |diz.Map__keys|
; [eval] |diz.Map__keys|
(push) ; 5
(assert (not (<
  (mod
    (+ hash@3@00 1)
    (Seq_length
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (<
  (mod
    (+ hash@3@00 1)
    (Seq_length
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
; [eval] cap < |diz.Map__keys|
; [eval] |diz.Map__keys|
(push) ; 5
(assert (not (<
  (- cap@5@00 1)
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (<
  (- cap@5@00 1)
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
(assert (Map__indexOfLoop%precondition ($Snap.combine
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
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))) ignoreDeleted@4@00 (-
  cap@5@00
  1)))
(pop) ; 4
; Joined path conditions
(assert (forall ((i2@25@00 Int)) (!
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
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@27@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
      (and
        (>= (inv@26@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
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
  :qid |Ref__Integer_value-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_Ref__Integer_value (sm@28@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00)))
      (and
        (and
          (>= (inv@26@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
          (<
            (inv@26@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
        (img@27@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)))
    (=>
      (and
        (and
          (>= (inv@26@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
          (<
            (inv@26@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
        (img@27@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r))
      (Set_in r ($FVF.domain_Ref__Integer_value (sm@28@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00)))))
  :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (sm@28@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00))))
  :qid |qp.fvfDomDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and
          (>= (inv@26@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
          (<
            (inv@26@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
        (img@27@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r))
      (and
        (img@13@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
        (and
          (>= (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
          (<
            (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))))
    (=
      ($FVF.lookup_Ref__Integer_value (sm@28@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (sm@28@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and
          (>= (inv@26@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
          (<
            (inv@26@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
        (img@27@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r))
      (and
        (img@18@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
        (and
          (>= (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
          (<
            (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
    (=
      ($FVF.lookup_Ref__Integer_value (sm@28@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (sm@28@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((i3@31@00 Int)) (!
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
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@33@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
      (and
        (>= (inv@32@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
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
  :qid |Ref__Integer_value-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_Ref__Integer_value (sm@34@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00)))
      (and
        (and
          (>= (inv@32@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
          (<
            (inv@32@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))))
        (img@33@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)))
    (=>
      (and
        (and
          (>= (inv@32@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
          (<
            (inv@32@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))))
        (img@33@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r))
      (Set_in r ($FVF.domain_Ref__Integer_value (sm@34@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00)))))
  :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (sm@34@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00))))
  :qid |qp.fvfDomDef7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and
          (>= (inv@32@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
          (<
            (inv@32@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))))
        (img@33@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r))
      (and
        (img@18@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
        (and
          (>= (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
          (<
            (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
    (=
      ($FVF.lookup_Ref__Integer_value (sm@34@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (sm@34@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
      (and
        (>= (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
        (<
          (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))))
    (=
      ($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@18@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
      (and
        (>= (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
        (<
          (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))))
    (=
      ($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@37@00  $FPM) r)
    (+
      (ite
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
        $Perm.Write
        $Perm.No)
      (ite
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
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@37@00  $FPM) r))
  :qid |qp.resPrmSumDef10|)))
(assert (and
  (forall ((i@23@00 Int) (j@24@00 Int)) (!
    (=>
      (and
        (<= 0 i@23@00)
        (and
          (<
            i@23@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
          (and
            (<= 0 j@24@00)
            (and
              (<
                j@24@00
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
              (not (= i@23@00 j@24@00))))))
      (not
        (=
          (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
            i@23@00)
          (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
            j@24@00))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/blom02.vpr@34@12@34@150|))
  (forall ((i2@25@00 Int)) (!
    (=>
      (and
        (>= i2@25@00 0)
        (<
          i2@25@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
      (or (>= i2@25@00 0) (not (>= i2@25@00 0))))
    :pattern ((Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
      i2@25@00))
    :qid |Ref__Integer_value-aux|))
  (forall ((i@29@00 Int) (j@30@00 Int)) (!
    (=>
      (and
        (<= 0 i@29@00)
        (and
          (<
            i@29@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
          (and
            (<= 0 j@30@00)
            (and
              (<
                j@30@00
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
              (not (= i@29@00 j@30@00))))))
      (not
        (=
          (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
            i@29@00)
          (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
            j@30@00))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/blom02.vpr@36@12@36@158|))
  (forall ((i3@31@00 Int)) (!
    (=>
      (and
        (>= i3@31@00 0)
        (<
          i3@31@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))))
      (or (>= i3@31@00 0) (not (>= i3@31@00 0))))
    :pattern ((Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
      i3@31@00))
    :qid |Ref__Integer_value-aux|))
  (forall ((i1@35@00 Int)) (!
    (=>
      (and
        (>= i1@35@00 0)
        (<
          i1@35@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
      (and
        (Map__EMPTY%precondition $Snap.unit)
        (=>
          (not
            (=
              ($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
                i1@35@00))
              (Map__EMPTY $Snap.unit)))
          (Map__DELETED%precondition $Snap.unit))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/blom02.vpr@39@13@39@232_precondition|))
  (forall ((i1@35@00 Int)) (!
    (=>
      (and
        (>= i1@35@00 0)
        (<
          i1@35@00
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
      (or
        (=
          ($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
            i1@35@00))
          (Map__EMPTY $Snap.unit))
        (or
          (=
            ($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
              i1@35@00))
            (Map__DELETED $Snap.unit))
          (>=
            ($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
              i1@35@00))
            0))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/blom02.vpr@39@13@39@232|))
  (>=
    (mod
      (+ hash@3@00 1)
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
    0)
  (<
    (mod
      (+ hash@3@00 1)
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
    (Seq_length
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
  (<
    (- cap@5@00 1)
    (Seq_length
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
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
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (=> (<= cap@5@00 0) (and (<= cap@5@00 0) (Map__EMPTY%precondition $Snap.unit))))
; Joined path conditions
(assert (forall ((i2@25@00 Int)) (!
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
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@27@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
      (and
        (>= (inv@26@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
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
  :qid |Ref__Integer_value-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_Ref__Integer_value (sm@28@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00)))
      (and
        (and
          (>= (inv@26@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
          (<
            (inv@26@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
        (img@27@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)))
    (=>
      (and
        (and
          (>= (inv@26@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
          (<
            (inv@26@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
        (img@27@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r))
      (Set_in r ($FVF.domain_Ref__Integer_value (sm@28@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00)))))
  :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (sm@28@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00))))
  :qid |qp.fvfDomDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and
          (>= (inv@26@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
          (<
            (inv@26@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
        (img@27@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r))
      (and
        (img@13@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
        (and
          (>= (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
          (<
            (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))))
    (=
      ($FVF.lookup_Ref__Integer_value (sm@28@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (sm@28@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and
          (>= (inv@26@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
          (<
            (inv@26@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
        (img@27@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r))
      (and
        (img@18@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
        (and
          (>= (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
          (<
            (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
    (=
      ($FVF.lookup_Ref__Integer_value (sm@28@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (sm@28@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((i3@31@00 Int)) (!
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
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@33@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
      (and
        (>= (inv@32@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
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
  :qid |Ref__Integer_value-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_Ref__Integer_value (sm@34@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00)))
      (and
        (and
          (>= (inv@32@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
          (<
            (inv@32@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))))
        (img@33@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)))
    (=>
      (and
        (and
          (>= (inv@32@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
          (<
            (inv@32@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))))
        (img@33@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r))
      (Set_in r ($FVF.domain_Ref__Integer_value (sm@34@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00)))))
  :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (sm@34@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00))))
  :qid |qp.fvfDomDef7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and
          (>= (inv@32@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
          (<
            (inv@32@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))))
        (img@33@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r))
      (and
        (img@18@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
        (and
          (>= (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
          (<
            (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
    (=
      ($FVF.lookup_Ref__Integer_value (sm@34@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (sm@34@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
      (and
        (>= (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
        (<
          (inv@12@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))))
    (=
      ($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@18@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
      (and
        (>= (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r) 0)
        (<
          (inv@17@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00 r)
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))))
    (=
      ($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@37@00  $FPM) r)
    (+
      (ite
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
        $Perm.Write
        $Perm.No)
      (ite
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
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@37@00  $FPM) r))
  :qid |qp.resPrmSumDef10|)))
(assert (=>
  (not (<= cap@5@00 0))
  (and
    (not (<= cap@5@00 0))
    (forall ((i@23@00 Int) (j@24@00 Int)) (!
      (=>
        (and
          (<= 0 i@23@00)
          (and
            (<
              i@23@00
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
            (and
              (<= 0 j@24@00)
              (and
                (<
                  j@24@00
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
                (not (= i@23@00 j@24@00))))))
        (not
          (=
            (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
              i@23@00)
            (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
              j@24@00))))
      
      :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/blom02.vpr@34@12@34@150|))
    (forall ((i2@25@00 Int)) (!
      (=>
        (and
          (>= i2@25@00 0)
          (<
            i2@25@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
        (or (>= i2@25@00 0) (not (>= i2@25@00 0))))
      :pattern ((Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
        i2@25@00))
      :qid |Ref__Integer_value-aux|))
    (forall ((i@29@00 Int) (j@30@00 Int)) (!
      (=>
        (and
          (<= 0 i@29@00)
          (and
            (<
              i@29@00
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
            (and
              (<= 0 j@30@00)
              (and
                (<
                  j@30@00
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))))
                (not (= i@29@00 j@30@00))))))
        (not
          (=
            (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
              i@29@00)
            (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
              j@30@00))))
      
      :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/blom02.vpr@36@12@36@158|))
    (forall ((i3@31@00 Int)) (!
      (=>
        (and
          (>= i3@31@00 0)
          (<
            i3@31@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))))))
        (or (>= i3@31@00 0) (not (>= i3@31@00 0))))
      :pattern ((Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
        i3@31@00))
      :qid |Ref__Integer_value-aux|))
    (forall ((i1@35@00 Int)) (!
      (=>
        (and
          (>= i1@35@00 0)
          (<
            i1@35@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
        (and
          (Map__EMPTY%precondition $Snap.unit)
          (=>
            (not
              (=
                ($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
                  i1@35@00))
                (Map__EMPTY $Snap.unit)))
            (Map__DELETED%precondition $Snap.unit))))
      
      :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/blom02.vpr@39@13@39@232_precondition|))
    (forall ((i1@35@00 Int)) (!
      (=>
        (and
          (>= i1@35@00 0)
          (<
            i1@35@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))
        (or
          (=
            ($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
              i1@35@00))
            (Map__EMPTY $Snap.unit))
          (or
            (=
              ($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
                i1@35@00))
              (Map__DELETED $Snap.unit))
            (>=
              ($FVF.lookup_Ref__Integer_value (sm@36@00 s@$ diz@2@00 hash@3@00 ignoreDeleted@4@00 cap@5@00) (Seq_index
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))
                i1@35@00))
              0))))
      
      :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/blom02.vpr@39@13@39@232|))
    (>=
      (mod
        (+ hash@3@00 1)
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
      0)
    (<
      (mod
        (+ hash@3@00 1)
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
    (<
      (- cap@5@00 1)
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))
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
      1)))))
(assert (or (not (<= cap@5@00 0)) (<= cap@5@00 0)))
(assert (=
  result@6@00
  (ite
    (<= cap@5@00 0)
    (Map__EMPTY $Snap.unit)
    (Map__indexOfLoop ($Snap.combine
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
      1)))))
; [eval] result == Map__EMPTY() || result >= 0 && result < |diz.Map__keys|
; [eval] result == Map__EMPTY()
; [eval] Map__EMPTY()
(push) ; 2
(assert (Map__EMPTY%precondition $Snap.unit))
(pop) ; 2
; Joined path conditions
(assert (Map__EMPTY%precondition $Snap.unit))
(push) ; 2
; [then-branch: 35 | result@6@00 == Map__EMPTY(_) | live]
; [else-branch: 35 | result@6@00 != Map__EMPTY(_) | live]
(push) ; 3
; [then-branch: 35 | result@6@00 == Map__EMPTY(_)]
(assert (= result@6@00 (Map__EMPTY $Snap.unit)))
(pop) ; 3
(push) ; 3
; [else-branch: 35 | result@6@00 != Map__EMPTY(_)]
(assert (not (= result@6@00 (Map__EMPTY $Snap.unit))))
; [eval] result >= 0 && result < |diz.Map__keys|
; [eval] result >= 0
(push) ; 4
; [then-branch: 36 | !(result@6@00 >= 0) | live]
; [else-branch: 36 | result@6@00 >= 0 | live]
(push) ; 5
; [then-branch: 36 | !(result@6@00 >= 0)]
(assert (not (>= result@6@00 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 36 | result@6@00 >= 0]
(assert (>= result@6@00 0))
; [eval] result < |diz.Map__keys|
; [eval] |diz.Map__keys|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (>= result@6@00 0) (not (>= result@6@00 0))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= result@6@00 (Map__EMPTY $Snap.unit)))
  (and
    (not (= result@6@00 (Map__EMPTY $Snap.unit)))
    (or (>= result@6@00 0) (not (>= result@6@00 0))))))
(assert (or
  (not (= result@6@00 (Map__EMPTY $Snap.unit)))
  (= result@6@00 (Map__EMPTY $Snap.unit))))
(push) ; 2
(assert (not (or
  (= result@6@00 (Map__EMPTY $Snap.unit))
  (and
    (>= result@6@00 0)
    (<
      result@6@00
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$)))))))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (or
  (= result@6@00 (Map__EMPTY $Snap.unit))
  (and
    (>= result@6@00 0)
    (<
      result@6@00
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second s@$))))))))
(pop) ; 1
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
