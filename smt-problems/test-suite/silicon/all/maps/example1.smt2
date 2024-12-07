(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:05:47
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/maps/example1.vpr
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
(declare-sort Set<Bool> 0)
(declare-sort Set<Int> 0)
(declare-sort Set<Map<Int~_Bool>> 0)
(declare-sort Set<$Ref> 0)
(declare-sort Set<$Snap> 0)
(declare-sort Map<Int~_Int> 0)
(declare-sort Map<Int~_$Ref> 0)
(declare-sort Map<Int~_Map<Int~_Bool>> 0)
(declare-sort Map<Int~_Bool> 0)
(declare-sort $FVF<val> 0)
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
(declare-fun $SortWrappers.Set<Map<Int~_Bool>>To$Snap (Set<Map<Int~_Bool>>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<Map<Int~_Bool>> ($Snap) Set<Map<Int~_Bool>>)
(assert (forall ((x Set<Map<Int~_Bool>>)) (!
    (= x ($SortWrappers.$SnapToSet<Map<Int~_Bool>>($SortWrappers.Set<Map<Int~_Bool>>To$Snap x)))
    :pattern (($SortWrappers.Set<Map<Int~_Bool>>To$Snap x))
    :qid |$Snap.$SnapToSet<Map<Int~_Bool>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<Map<Int~_Bool>>To$Snap($SortWrappers.$SnapToSet<Map<Int~_Bool>> x)))
    :pattern (($SortWrappers.$SnapToSet<Map<Int~_Bool>> x))
    :qid |$Snap.Set<Map<Int~_Bool>>To$SnapToSet<Map<Int~_Bool>>|
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
(declare-fun $SortWrappers.Map<Int~_Int>To$Snap (Map<Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToMap<Int~_Int> ($Snap) Map<Int~_Int>)
(assert (forall ((x Map<Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToMap<Int~_Int>($SortWrappers.Map<Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.Map<Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToMap<Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Map<Int~_Int>To$Snap($SortWrappers.$SnapToMap<Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToMap<Int~_Int> x))
    :qid |$Snap.Map<Int~_Int>To$SnapToMap<Int~_Int>|
    )))
(declare-fun $SortWrappers.Map<Int~_$Ref>To$Snap (Map<Int~_$Ref>) $Snap)
(declare-fun $SortWrappers.$SnapToMap<Int~_$Ref> ($Snap) Map<Int~_$Ref>)
(assert (forall ((x Map<Int~_$Ref>)) (!
    (= x ($SortWrappers.$SnapToMap<Int~_$Ref>($SortWrappers.Map<Int~_$Ref>To$Snap x)))
    :pattern (($SortWrappers.Map<Int~_$Ref>To$Snap x))
    :qid |$Snap.$SnapToMap<Int~_$Ref>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Map<Int~_$Ref>To$Snap($SortWrappers.$SnapToMap<Int~_$Ref> x)))
    :pattern (($SortWrappers.$SnapToMap<Int~_$Ref> x))
    :qid |$Snap.Map<Int~_$Ref>To$SnapToMap<Int~_$Ref>|
    )))
(declare-fun $SortWrappers.Map<Int~_Map<Int~_Bool>>To$Snap (Map<Int~_Map<Int~_Bool>>) $Snap)
(declare-fun $SortWrappers.$SnapToMap<Int~_Map<Int~_Bool>> ($Snap) Map<Int~_Map<Int~_Bool>>)
(assert (forall ((x Map<Int~_Map<Int~_Bool>>)) (!
    (= x ($SortWrappers.$SnapToMap<Int~_Map<Int~_Bool>>($SortWrappers.Map<Int~_Map<Int~_Bool>>To$Snap x)))
    :pattern (($SortWrappers.Map<Int~_Map<Int~_Bool>>To$Snap x))
    :qid |$Snap.$SnapToMap<Int~_Map<Int~_Bool>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Map<Int~_Map<Int~_Bool>>To$Snap($SortWrappers.$SnapToMap<Int~_Map<Int~_Bool>> x)))
    :pattern (($SortWrappers.$SnapToMap<Int~_Map<Int~_Bool>> x))
    :qid |$Snap.Map<Int~_Map<Int~_Bool>>To$SnapToMap<Int~_Map<Int~_Bool>>|
    )))
(declare-fun $SortWrappers.Map<Int~_Bool>To$Snap (Map<Int~_Bool>) $Snap)
(declare-fun $SortWrappers.$SnapToMap<Int~_Bool> ($Snap) Map<Int~_Bool>)
(assert (forall ((x Map<Int~_Bool>)) (!
    (= x ($SortWrappers.$SnapToMap<Int~_Bool>($SortWrappers.Map<Int~_Bool>To$Snap x)))
    :pattern (($SortWrappers.Map<Int~_Bool>To$Snap x))
    :qid |$Snap.$SnapToMap<Int~_Bool>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Map<Int~_Bool>To$Snap($SortWrappers.$SnapToMap<Int~_Bool> x)))
    :pattern (($SortWrappers.$SnapToMap<Int~_Bool> x))
    :qid |$Snap.Map<Int~_Bool>To$SnapToMap<Int~_Bool>|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.$FVF<val>To$Snap ($FVF<val>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<val> ($Snap) $FVF<val>)
(assert (forall ((x $FVF<val>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<val>($SortWrappers.$FVF<val>To$Snap x)))
    :pattern (($SortWrappers.$FVF<val>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<val>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<val>To$Snap($SortWrappers.$SnapTo$FVF<val> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<val> x))
    :qid |$Snap.$FVF<val>To$SnapTo$FVF<val>|
    )))
; ////////// Symbols
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
(declare-fun Set_card (Set<Map<Int~_Bool>>) Int)
(declare-const Set_empty Set<Map<Int~_Bool>>)
(declare-fun Set_in (Map<Int~_Bool> Set<Map<Int~_Bool>>) Bool)
(declare-fun Set_singleton (Map<Int~_Bool>) Set<Map<Int~_Bool>>)
(declare-fun Set_unionone (Set<Map<Int~_Bool>> Map<Int~_Bool>) Set<Map<Int~_Bool>>)
(declare-fun Set_union (Set<Map<Int~_Bool>> Set<Map<Int~_Bool>>) Set<Map<Int~_Bool>>)
(declare-fun Set_intersection (Set<Map<Int~_Bool>> Set<Map<Int~_Bool>>) Set<Map<Int~_Bool>>)
(declare-fun Set_difference (Set<Map<Int~_Bool>> Set<Map<Int~_Bool>>) Set<Map<Int~_Bool>>)
(declare-fun Set_subset (Set<Map<Int~_Bool>> Set<Map<Int~_Bool>>) Bool)
(declare-fun Set_equal (Set<Map<Int~_Bool>> Set<Map<Int~_Bool>>) Bool)
(declare-fun Set_skolem_diff (Set<Map<Int~_Bool>> Set<Map<Int~_Bool>>) Map<Int~_Bool>)
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
(declare-fun Map_apply (Map<Int~_Int> Int) Int)
(declare-fun Map_card (Map<Int~_Int>) Int)
(declare-fun Map_disjoint (Map<Int~_Int> Map<Int~_Int>) Bool)
(declare-fun Map_domain (Map<Int~_Int>) Set<Int>)
(declare-const Map_empty Map<Int~_Int>)
(declare-fun Map_equal (Map<Int~_Int> Map<Int~_Int>) Bool)
(declare-fun Map_update (Map<Int~_Int> Int Int) Map<Int~_Int>)
(declare-fun Map_values (Map<Int~_Int>) Set<Int>)
(declare-fun Map_range_domain_skolem (Map<Int~_Int> Int) Int)
(declare-fun Map_apply (Map<Int~_$Ref> Int) $Ref)
(declare-fun Map_card (Map<Int~_$Ref>) Int)
(declare-fun Map_disjoint (Map<Int~_$Ref> Map<Int~_$Ref>) Bool)
(declare-fun Map_domain (Map<Int~_$Ref>) Set<Int>)
(declare-const Map_empty Map<Int~_$Ref>)
(declare-fun Map_equal (Map<Int~_$Ref> Map<Int~_$Ref>) Bool)
(declare-fun Map_update (Map<Int~_$Ref> Int $Ref) Map<Int~_$Ref>)
(declare-fun Map_values (Map<Int~_$Ref>) Set<$Ref>)
(declare-fun Map_range_domain_skolem (Map<Int~_$Ref> $Ref) Int)
(declare-fun Map_apply (Map<Int~_Map<Int~_Bool>> Int) Map<Int~_Bool>)
(declare-fun Map_card (Map<Int~_Map<Int~_Bool>>) Int)
(declare-fun Map_disjoint (Map<Int~_Map<Int~_Bool>> Map<Int~_Map<Int~_Bool>>) Bool)
(declare-fun Map_domain (Map<Int~_Map<Int~_Bool>>) Set<Int>)
(declare-const Map_empty Map<Int~_Map<Int~_Bool>>)
(declare-fun Map_equal (Map<Int~_Map<Int~_Bool>> Map<Int~_Map<Int~_Bool>>) Bool)
(declare-fun Map_update (Map<Int~_Map<Int~_Bool>> Int Map<Int~_Bool>) Map<Int~_Map<Int~_Bool>>)
(declare-fun Map_values (Map<Int~_Map<Int~_Bool>>) Set<Map<Int~_Bool>>)
(declare-fun Map_range_domain_skolem (Map<Int~_Map<Int~_Bool>> Map<Int~_Bool>) Int)
(declare-fun Map_apply (Map<Int~_Bool> Int) Bool)
(declare-fun Map_card (Map<Int~_Bool>) Int)
(declare-fun Map_disjoint (Map<Int~_Bool> Map<Int~_Bool>) Bool)
(declare-fun Map_domain (Map<Int~_Bool>) Set<Int>)
(declare-const Map_empty Map<Int~_Bool>)
(declare-fun Map_equal (Map<Int~_Bool> Map<Int~_Bool>) Bool)
(declare-fun Map_update (Map<Int~_Bool> Int Bool) Map<Int~_Bool>)
(declare-fun Map_values (Map<Int~_Bool>) Set<Bool>)
(declare-fun Map_range_domain_skolem (Map<Int~_Bool> Bool) Int)
; /field_value_functions_declarations.smt2 [val: Int]
(declare-fun $FVF.domain_val ($FVF<val>) Set<$Ref>)
(declare-fun $FVF.lookup_val ($FVF<val> $Ref) Int)
(declare-fun $FVF.after_val ($FVF<val> $FVF<val>) Bool)
(declare-fun $FVF.loc_val (Int $Ref) Bool)
(declare-fun $FVF.perm_val ($FPM $Ref) $Perm)
(declare-const $fvfTOP_val $FVF<val>)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
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
(assert (forall ((s Set<Map<Int~_Bool>>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o Map<Int~_Bool>)) (!
  (not (Set_in o (as Set_empty  Set<Map<Int~_Bool>>)))
  :pattern ((Set_in o (as Set_empty  Set<Map<Int~_Bool>>)))
  )))
(assert (forall ((s Set<Map<Int~_Bool>>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<Map<Int~_Bool>>)))
    (=> (not (= (Set_card s) 0)) (exists ((x Map<Int~_Bool>))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r Map<Int~_Bool>)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r Map<Int~_Bool>) (o Map<Int~_Bool>)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r Map<Int~_Bool>)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<Map<Int~_Bool>>) (x Map<Int~_Bool>) (o Map<Int~_Bool>)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<Map<Int~_Bool>>) (x Map<Int~_Bool>)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<Map<Int~_Bool>>) (x Map<Int~_Bool>) (y Map<Int~_Bool>)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<Map<Int~_Bool>>) (x Map<Int~_Bool>)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Map<Int~_Bool>>) (x Map<Int~_Bool>)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Map<Int~_Bool>>) (b Set<Map<Int~_Bool>>) (o Map<Int~_Bool>)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<Map<Int~_Bool>>) (b Set<Map<Int~_Bool>>) (y Map<Int~_Bool>)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<Map<Int~_Bool>>) (b Set<Map<Int~_Bool>>) (y Map<Int~_Bool>)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<Map<Int~_Bool>>) (b Set<Map<Int~_Bool>>) (o Map<Int~_Bool>)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<Map<Int~_Bool>>) (b Set<Map<Int~_Bool>>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<Map<Int~_Bool>>) (b Set<Map<Int~_Bool>>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<Map<Int~_Bool>>) (b Set<Map<Int~_Bool>>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<Map<Int~_Bool>>) (b Set<Map<Int~_Bool>>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<Map<Int~_Bool>>) (b Set<Map<Int~_Bool>>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<Map<Int~_Bool>>) (b Set<Map<Int~_Bool>>) (o Map<Int~_Bool>)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<Map<Int~_Bool>>) (b Set<Map<Int~_Bool>>) (y Map<Int~_Bool>)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<Map<Int~_Bool>>) (b Set<Map<Int~_Bool>>)) (!
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
(assert (forall ((a Set<Map<Int~_Bool>>) (b Set<Map<Int~_Bool>>)) (!
  (=
    (Set_subset a b)
    (forall ((o Map<Int~_Bool>)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<Map<Int~_Bool>>) (b Set<Map<Int~_Bool>>)) (!
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
(assert (forall ((a Set<Map<Int~_Bool>>) (b Set<Map<Int~_Bool>>)) (!
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
(assert (forall ((m Map<Int~_Int>)) (!
  (<= 0 (Map_card m))
  :pattern ((Map_card m))
  )))
(assert (forall ((m Map<Int~_Int>)) (!
  (= (Set_card (Map_domain m)) (Map_card m))
  :pattern ((Set_card (Map_domain m)))
  :pattern ((Map_card m))
  )))
(assert (forall ((m1 Map<Int~_Int>) (m2 Map<Int~_Int>)) (!
  (=>
    (Map_disjoint m1 m2)
    (forall ((k Int)) (!
      (or (not (Set_in k (Map_domain m1))) (not (Set_in k (Map_domain m2))))
      :pattern ((Set_in k (Map_domain m1)))
      :pattern ((Set_in k (Map_domain m2)))
      )))
  :pattern ((Map_disjoint m1 m2))
  )))
(assert (forall ((m1 Map<Int~_Int>) (m2 Map<Int~_Int>)) (!
  (=>
    (not (Map_disjoint m1 m2))
    (exists ((k Int)) 
      (and (Set_in k (Map_domain m1)) (Set_in k (Map_domain m2)))))
  :pattern ((Map_disjoint m1 m2))
  )))
(assert (forall ((k Int)) (!
  (not (Set_in k (Map_domain (as Map_empty  Map<Int~_Int>))))
  :pattern ((Set_in k (Map_domain (as Map_empty  Map<Int~_Int>))))
  )))
(assert (forall ((m Map<Int~_Int>)) (!
  (and
    (= (= (Map_card m) 0) (= m (as Map_empty  Map<Int~_Int>)))
    (and
      (=> (not (= (Map_card m) 0)) (exists ((u Int))  (Set_in u (Map_domain m))))
      (forall ((u Int)) (!
        (=> (Set_in u (Map_domain m)) (not (= (Map_card m) 0)))
        :pattern ((Set_in u (Map_domain m)))
        ))))
  :pattern ((Map_card m))
  )))
(assert (forall ((m1 Map<Int~_Int>) (m2 Map<Int~_Int>)) (!
  (=>
    (and
      (forall ((k Int)) (!
        (= (Set_in k (Map_domain m1)) (Set_in k (Map_domain m2)))
        :pattern ((Set_in k (Map_domain m1)))
        :pattern ((Set_in k (Map_domain m2)))
        ))
      (forall ((k Int)) (!
        (=> (Set_in k (Map_domain m1)) (= (Map_apply m1 k) (Map_apply m2 k)))
        :pattern ((Map_apply m1 k))
        :pattern ((Map_apply m2 k))
        )))
    (Map_equal m1 m2))
  :pattern ((Map_equal m1 m2))
  )))
(assert (forall ((m1 Map<Int~_Int>) (m2 Map<Int~_Int>)) (!
  (=> (Map_equal m1 m2) (= m1 m2))
  :pattern ((Map_equal m1 m2))
  )))
(assert (forall ((m Map<Int~_Int>) (k1 Int) (k2 Int) (v Int)) (!
  (and
    (=>
      (= k1 k2)
      (and
        (Set_in k2 (Map_domain (Map_update m k1 v)))
        (= (Map_apply (Map_update m k1 v) k2) v)))
    (=>
      (not (= k1 k2))
      (and
        (=
          (Set_in k2 (Map_domain (Map_update m k1 v)))
          (Set_in k2 (Map_domain m)))
        (=>
          (Set_in k2 (Map_domain m))
          (= (Map_apply (Map_update m k1 v) k2) (Map_apply m k2))))))
  :pattern ((Set_in k2 (Map_domain (Map_update m k1 v))))
  :pattern ((Set_in k2 (Map_domain m)) (Map_update m k1 v))
  :pattern ((Map_apply (Map_update m k1 v) k2))
  )))
(assert (forall ((m Map<Int~_Int>) (k Int) (v Int)) (!
  (and
    (=> (Set_in k (Map_domain m)) (= (Map_card (Map_update m k v)) (Map_card m)))
    (=>
      (not (Set_in k (Map_domain m)))
      (= (Map_card (Map_update m k v)) (+ (Map_card m) 1))))
  :pattern ((Map_card (Map_update m k v)))
  :pattern ((Map_card m) (Map_update m k v))
  )))
(assert (forall ((m Map<Int~_Int>) (v Int)) (!
  (=>
    (Set_in v (Map_values m))
    (and
      (Set_in (Map_range_domain_skolem m v) (Map_domain m))
      (= v (Map_apply m (Map_range_domain_skolem m v)))))
  :pattern ((Set_in v (Map_values m)))
  )))
(assert (forall ((m Map<Int~_Int>) (k Int)) (!
  (=> (Set_in k (Map_domain m)) (> (Set_card (Map_values m)) 0))
  :pattern ((Map_apply m k))
  :pattern ((Set_in k (Map_domain m)))
  )))
(assert (forall ((m Map<Int~_Int>) (k Int)) (!
  (=> (Set_in k (Map_domain m)) (Set_in (Map_apply m k) (Map_values m)))
  :pattern ((Map_apply m k))
  )))
(assert (forall ((m Map<Int~_$Ref>)) (!
  (<= 0 (Map_card m))
  :pattern ((Map_card m))
  )))
(assert (forall ((m Map<Int~_$Ref>)) (!
  (= (Set_card (Map_domain m)) (Map_card m))
  :pattern ((Set_card (Map_domain m)))
  :pattern ((Map_card m))
  )))
(assert (forall ((m1 Map<Int~_$Ref>) (m2 Map<Int~_$Ref>)) (!
  (=>
    (Map_disjoint m1 m2)
    (forall ((k Int)) (!
      (or (not (Set_in k (Map_domain m1))) (not (Set_in k (Map_domain m2))))
      :pattern ((Set_in k (Map_domain m1)))
      :pattern ((Set_in k (Map_domain m2)))
      )))
  :pattern ((Map_disjoint m1 m2))
  )))
(assert (forall ((m1 Map<Int~_$Ref>) (m2 Map<Int~_$Ref>)) (!
  (=>
    (not (Map_disjoint m1 m2))
    (exists ((k Int)) 
      (and (Set_in k (Map_domain m1)) (Set_in k (Map_domain m2)))))
  :pattern ((Map_disjoint m1 m2))
  )))
(assert (forall ((k Int)) (!
  (not (Set_in k (Map_domain (as Map_empty  Map<Int~_$Ref>))))
  :pattern ((Set_in k (Map_domain (as Map_empty  Map<Int~_$Ref>))))
  )))
(assert (forall ((m Map<Int~_$Ref>)) (!
  (and
    (= (= (Map_card m) 0) (= m (as Map_empty  Map<Int~_$Ref>)))
    (and
      (=> (not (= (Map_card m) 0)) (exists ((u Int))  (Set_in u (Map_domain m))))
      (forall ((u Int)) (!
        (=> (Set_in u (Map_domain m)) (not (= (Map_card m) 0)))
        :pattern ((Set_in u (Map_domain m)))
        ))))
  :pattern ((Map_card m))
  )))
(assert (forall ((m1 Map<Int~_$Ref>) (m2 Map<Int~_$Ref>)) (!
  (=>
    (and
      (forall ((k Int)) (!
        (= (Set_in k (Map_domain m1)) (Set_in k (Map_domain m2)))
        :pattern ((Set_in k (Map_domain m1)))
        :pattern ((Set_in k (Map_domain m2)))
        ))
      (forall ((k Int)) (!
        (=> (Set_in k (Map_domain m1)) (= (Map_apply m1 k) (Map_apply m2 k)))
        :pattern ((Map_apply m1 k))
        :pattern ((Map_apply m2 k))
        )))
    (Map_equal m1 m2))
  :pattern ((Map_equal m1 m2))
  )))
(assert (forall ((m1 Map<Int~_$Ref>) (m2 Map<Int~_$Ref>)) (!
  (=> (Map_equal m1 m2) (= m1 m2))
  :pattern ((Map_equal m1 m2))
  )))
(assert (forall ((m Map<Int~_$Ref>) (k1 Int) (k2 Int) (v $Ref)) (!
  (and
    (=>
      (= k1 k2)
      (and
        (Set_in k2 (Map_domain (Map_update m k1 v)))
        (= (Map_apply (Map_update m k1 v) k2) v)))
    (=>
      (not (= k1 k2))
      (and
        (=
          (Set_in k2 (Map_domain (Map_update m k1 v)))
          (Set_in k2 (Map_domain m)))
        (=>
          (Set_in k2 (Map_domain m))
          (= (Map_apply (Map_update m k1 v) k2) (Map_apply m k2))))))
  :pattern ((Set_in k2 (Map_domain (Map_update m k1 v))))
  :pattern ((Set_in k2 (Map_domain m)) (Map_update m k1 v))
  :pattern ((Map_apply (Map_update m k1 v) k2))
  )))
(assert (forall ((m Map<Int~_$Ref>) (k Int) (v $Ref)) (!
  (and
    (=> (Set_in k (Map_domain m)) (= (Map_card (Map_update m k v)) (Map_card m)))
    (=>
      (not (Set_in k (Map_domain m)))
      (= (Map_card (Map_update m k v)) (+ (Map_card m) 1))))
  :pattern ((Map_card (Map_update m k v)))
  :pattern ((Map_card m) (Map_update m k v))
  )))
(assert (forall ((m Map<Int~_$Ref>) (v $Ref)) (!
  (=>
    (Set_in v (Map_values m))
    (and
      (Set_in (Map_range_domain_skolem m v) (Map_domain m))
      (= v (Map_apply m (Map_range_domain_skolem m v)))))
  :pattern ((Set_in v (Map_values m)))
  )))
(assert (forall ((m Map<Int~_$Ref>) (k Int)) (!
  (=> (Set_in k (Map_domain m)) (> (Set_card (Map_values m)) 0))
  :pattern ((Map_apply m k))
  :pattern ((Set_in k (Map_domain m)))
  )))
(assert (forall ((m Map<Int~_$Ref>) (k Int)) (!
  (=> (Set_in k (Map_domain m)) (Set_in (Map_apply m k) (Map_values m)))
  :pattern ((Map_apply m k))
  )))
(assert (forall ((m Map<Int~_Map<Int~_Bool>>)) (!
  (<= 0 (Map_card m))
  :pattern ((Map_card m))
  )))
(assert (forall ((m Map<Int~_Map<Int~_Bool>>)) (!
  (= (Set_card (Map_domain m)) (Map_card m))
  :pattern ((Set_card (Map_domain m)))
  :pattern ((Map_card m))
  )))
(assert (forall ((m1 Map<Int~_Map<Int~_Bool>>) (m2 Map<Int~_Map<Int~_Bool>>)) (!
  (=>
    (Map_disjoint m1 m2)
    (forall ((k Int)) (!
      (or (not (Set_in k (Map_domain m1))) (not (Set_in k (Map_domain m2))))
      :pattern ((Set_in k (Map_domain m1)))
      :pattern ((Set_in k (Map_domain m2)))
      )))
  :pattern ((Map_disjoint m1 m2))
  )))
(assert (forall ((m1 Map<Int~_Map<Int~_Bool>>) (m2 Map<Int~_Map<Int~_Bool>>)) (!
  (=>
    (not (Map_disjoint m1 m2))
    (exists ((k Int)) 
      (and (Set_in k (Map_domain m1)) (Set_in k (Map_domain m2)))))
  :pattern ((Map_disjoint m1 m2))
  )))
(assert (forall ((k Int)) (!
  (not (Set_in k (Map_domain (as Map_empty  Map<Int~_Map<Int~_Bool>>))))
  :pattern ((Set_in k (Map_domain (as Map_empty  Map<Int~_Map<Int~_Bool>>))))
  )))
(assert (forall ((m Map<Int~_Map<Int~_Bool>>)) (!
  (and
    (= (= (Map_card m) 0) (= m (as Map_empty  Map<Int~_Map<Int~_Bool>>)))
    (and
      (=> (not (= (Map_card m) 0)) (exists ((u Int))  (Set_in u (Map_domain m))))
      (forall ((u Int)) (!
        (=> (Set_in u (Map_domain m)) (not (= (Map_card m) 0)))
        :pattern ((Set_in u (Map_domain m)))
        ))))
  :pattern ((Map_card m))
  )))
(assert (forall ((m1 Map<Int~_Map<Int~_Bool>>) (m2 Map<Int~_Map<Int~_Bool>>)) (!
  (=>
    (and
      (forall ((k Int)) (!
        (= (Set_in k (Map_domain m1)) (Set_in k (Map_domain m2)))
        :pattern ((Set_in k (Map_domain m1)))
        :pattern ((Set_in k (Map_domain m2)))
        ))
      (forall ((k Int)) (!
        (=> (Set_in k (Map_domain m1)) (= (Map_apply m1 k) (Map_apply m2 k)))
        :pattern ((Map_apply m1 k))
        :pattern ((Map_apply m2 k))
        )))
    (Map_equal m1 m2))
  :pattern ((Map_equal m1 m2))
  )))
(assert (forall ((m1 Map<Int~_Map<Int~_Bool>>) (m2 Map<Int~_Map<Int~_Bool>>)) (!
  (=> (Map_equal m1 m2) (= m1 m2))
  :pattern ((Map_equal m1 m2))
  )))
(assert (forall ((m Map<Int~_Map<Int~_Bool>>) (k1 Int) (k2 Int) (v Map<Int~_Bool>)) (!
  (and
    (=>
      (= k1 k2)
      (and
        (Set_in k2 (Map_domain (Map_update m k1 v)))
        (= (Map_apply (Map_update m k1 v) k2) v)))
    (=>
      (not (= k1 k2))
      (and
        (=
          (Set_in k2 (Map_domain (Map_update m k1 v)))
          (Set_in k2 (Map_domain m)))
        (=>
          (Set_in k2 (Map_domain m))
          (= (Map_apply (Map_update m k1 v) k2) (Map_apply m k2))))))
  :pattern ((Set_in k2 (Map_domain (Map_update m k1 v))))
  :pattern ((Set_in k2 (Map_domain m)) (Map_update m k1 v))
  :pattern ((Map_apply (Map_update m k1 v) k2))
  )))
(assert (forall ((m Map<Int~_Map<Int~_Bool>>) (k Int) (v Map<Int~_Bool>)) (!
  (and
    (=> (Set_in k (Map_domain m)) (= (Map_card (Map_update m k v)) (Map_card m)))
    (=>
      (not (Set_in k (Map_domain m)))
      (= (Map_card (Map_update m k v)) (+ (Map_card m) 1))))
  :pattern ((Map_card (Map_update m k v)))
  :pattern ((Map_card m) (Map_update m k v))
  )))
(assert (forall ((m Map<Int~_Map<Int~_Bool>>) (v Map<Int~_Bool>)) (!
  (=>
    (Set_in v (Map_values m))
    (and
      (Set_in (Map_range_domain_skolem m v) (Map_domain m))
      (= v (Map_apply m (Map_range_domain_skolem m v)))))
  :pattern ((Set_in v (Map_values m)))
  )))
(assert (forall ((m Map<Int~_Map<Int~_Bool>>) (k Int)) (!
  (=> (Set_in k (Map_domain m)) (> (Set_card (Map_values m)) 0))
  :pattern ((Map_apply m k))
  :pattern ((Set_in k (Map_domain m)))
  )))
(assert (forall ((m Map<Int~_Map<Int~_Bool>>) (k Int)) (!
  (=> (Set_in k (Map_domain m)) (Set_in (Map_apply m k) (Map_values m)))
  :pattern ((Map_apply m k))
  )))
(assert (forall ((m Map<Int~_Bool>)) (!
  (<= 0 (Map_card m))
  :pattern ((Map_card m))
  )))
(assert (forall ((m Map<Int~_Bool>)) (!
  (= (Set_card (Map_domain m)) (Map_card m))
  :pattern ((Set_card (Map_domain m)))
  :pattern ((Map_card m))
  )))
(assert (forall ((m1 Map<Int~_Bool>) (m2 Map<Int~_Bool>)) (!
  (=>
    (Map_disjoint m1 m2)
    (forall ((k Int)) (!
      (or (not (Set_in k (Map_domain m1))) (not (Set_in k (Map_domain m2))))
      :pattern ((Set_in k (Map_domain m1)))
      :pattern ((Set_in k (Map_domain m2)))
      )))
  :pattern ((Map_disjoint m1 m2))
  )))
(assert (forall ((m1 Map<Int~_Bool>) (m2 Map<Int~_Bool>)) (!
  (=>
    (not (Map_disjoint m1 m2))
    (exists ((k Int)) 
      (and (Set_in k (Map_domain m1)) (Set_in k (Map_domain m2)))))
  :pattern ((Map_disjoint m1 m2))
  )))
(assert (forall ((k Int)) (!
  (not (Set_in k (Map_domain (as Map_empty  Map<Int~_Bool>))))
  :pattern ((Set_in k (Map_domain (as Map_empty  Map<Int~_Bool>))))
  )))
(assert (forall ((m Map<Int~_Bool>)) (!
  (and
    (= (= (Map_card m) 0) (= m (as Map_empty  Map<Int~_Bool>)))
    (and
      (=> (not (= (Map_card m) 0)) (exists ((u Int))  (Set_in u (Map_domain m))))
      (forall ((u Int)) (!
        (=> (Set_in u (Map_domain m)) (not (= (Map_card m) 0)))
        :pattern ((Set_in u (Map_domain m)))
        ))))
  :pattern ((Map_card m))
  )))
(assert (forall ((m1 Map<Int~_Bool>) (m2 Map<Int~_Bool>)) (!
  (=>
    (and
      (forall ((k Int)) (!
        (= (Set_in k (Map_domain m1)) (Set_in k (Map_domain m2)))
        :pattern ((Set_in k (Map_domain m1)))
        :pattern ((Set_in k (Map_domain m2)))
        ))
      (forall ((k Int)) (!
        (=> (Set_in k (Map_domain m1)) (= (Map_apply m1 k) (Map_apply m2 k)))
        :pattern ((Map_apply m1 k))
        :pattern ((Map_apply m2 k))
        )))
    (Map_equal m1 m2))
  :pattern ((Map_equal m1 m2))
  )))
(assert (forall ((m1 Map<Int~_Bool>) (m2 Map<Int~_Bool>)) (!
  (=> (Map_equal m1 m2) (= m1 m2))
  :pattern ((Map_equal m1 m2))
  )))
(assert (forall ((m Map<Int~_Bool>) (k1 Int) (k2 Int) (v Bool)) (!
  (and
    (=>
      (= k1 k2)
      (and
        (Set_in k2 (Map_domain (Map_update m k1 v)))
        (= (Map_apply (Map_update m k1 v) k2) v)))
    (=>
      (not (= k1 k2))
      (and
        (=
          (Set_in k2 (Map_domain (Map_update m k1 v)))
          (Set_in k2 (Map_domain m)))
        (=>
          (Set_in k2 (Map_domain m))
          (= (Map_apply (Map_update m k1 v) k2) (Map_apply m k2))))))
  :pattern ((Set_in k2 (Map_domain (Map_update m k1 v))))
  :pattern ((Set_in k2 (Map_domain m)) (Map_update m k1 v))
  :pattern ((Map_apply (Map_update m k1 v) k2))
  )))
(assert (forall ((m Map<Int~_Bool>) (k Int) (v Bool)) (!
  (and
    (=> (Set_in k (Map_domain m)) (= (Map_card (Map_update m k v)) (Map_card m)))
    (=>
      (not (Set_in k (Map_domain m)))
      (= (Map_card (Map_update m k v)) (+ (Map_card m) 1))))
  :pattern ((Map_card (Map_update m k v)))
  :pattern ((Map_card m) (Map_update m k v))
  )))
(assert (forall ((m Map<Int~_Bool>) (v Bool)) (!
  (=>
    (Set_in v (Map_values m))
    (and
      (Set_in (Map_range_domain_skolem m v) (Map_domain m))
      (= v (Map_apply m (Map_range_domain_skolem m v)))))
  :pattern ((Set_in v (Map_values m)))
  )))
(assert (forall ((m Map<Int~_Bool>) (k Int)) (!
  (=> (Set_in k (Map_domain m)) (> (Set_card (Map_values m)) 0))
  :pattern ((Map_apply m k))
  :pattern ((Set_in k (Map_domain m)))
  )))
(assert (forall ((m Map<Int~_Bool>) (k Int)) (!
  (=> (Set_in k (Map_domain m)) (Set_in (Map_apply m k) (Map_values m)))
  :pattern ((Map_apply m k))
  )))
; /field_value_functions_axioms.smt2 [val: Int]
(assert (forall ((vs $FVF<val>) (ws $FVF<val>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_val vs) ($FVF.domain_val ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_val vs))
            (= ($FVF.lookup_val vs x) ($FVF.lookup_val ws x)))
          :pattern (($FVF.lookup_val vs x) ($FVF.lookup_val ws x))
          :qid |qp.$FVF<val>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<val>To$Snap vs)
              ($SortWrappers.$FVF<val>To$Snap ws)
              )
    :qid |qp.$FVF<val>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_val pm r))
    :pattern (($FVF.perm_val pm r)))))
(assert (forall ((r $Ref) (f Int)) (!
    (= ($FVF.loc_val f r) true)
    :pattern (($FVF.loc_val f r)))))
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
; ---------- test1 ----------
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
; var m: Map[Int,Bool]
(declare-const m@0@01 Map<Int~_Bool>)
; [exec]
; var d: Set[Int]
(declare-const d@1@01 Set<Int>)
; [exec]
; var r: Set[Bool]
(declare-const r@2@01 Set<Bool>)
; [exec]
; m := Map[Int,Bool]()
; [eval] Map[Int,Bool]()
; [exec]
; assert |Map[Int,Bool]()| == 0
; [eval] |Map[Int,Bool]()| == 0
; [eval] |Map[Int,Bool]()|
; [eval] Map[Int,Bool]()
(push) ; 3
(assert (not (= (Map_card (as Map_empty  Map<Int~_Bool>)) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Map_card (as Map_empty  Map<Int~_Bool>)) 0))
; [exec]
; assert |m| == 0
; [eval] |m| == 0
; [eval] |m|
; [exec]
; d := domain(m)
; [eval] domain(m)
(declare-const d@3@01 Set<Int>)
(assert (= d@3@01 (Map_domain (as Map_empty  Map<Int~_Bool>))))
; [exec]
; assert d == Set[Int]()
; [eval] d == Set[Int]()
; [eval] Set[Int]()
(push) ; 3
(assert (not (Set_equal d@3@01 (as Set_empty  Set<Int>))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Set_equal d@3@01 (as Set_empty  Set<Int>)))
; [exec]
; r := range(m)
; [eval] range(m)
(declare-const r@4@01 Set<Bool>)
(assert (= r@4@01 (Map_values (as Map_empty  Map<Int~_Bool>))))
; [exec]
; assert |range(m)| == 0
; [eval] |range(m)| == 0
; [eval] |range(m)|
; [eval] range(m)
(push) ; 3
(assert (not (= (Set_card (Map_values (as Map_empty  Map<Int~_Bool>))) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Set_card (Map_values (as Map_empty  Map<Int~_Bool>))) 0))
(pop) ; 2
(pop) ; 1
; ---------- test2 ----------
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
; var m: Map[Int,Bool]
(declare-const m@5@01 Map<Int~_Bool>)
; [exec]
; m := Map[Int,Bool]()
; [eval] Map[Int,Bool]()
; [exec]
; m := m[2 := true]
; [eval] m[2 := true]
(declare-const m@6@01 Map<Int~_Bool>)
(assert (= m@6@01 (Map_update (as Map_empty  Map<Int~_Bool>) 2 true)))
; [exec]
; assert m[2]
; [eval] m[2]
(push) ; 3
(assert (not (Set_in 2 (Map_domain m@6@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (Map_apply m@6@01 2)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Map_apply m@6@01 2))
; [exec]
; assert domain(m) == Set(2)
; [eval] domain(m) == Set(2)
; [eval] domain(m)
; [eval] Set(2)
(push) ; 3
(assert (not (Set_equal (Map_domain m@6@01) (Set_singleton 2))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Set_equal (Map_domain m@6@01) (Set_singleton 2)))
; [exec]
; assert range(m) == Set(true)
; [eval] range(m) == Set(true)
; [eval] range(m)
; [eval] Set(true)
(push) ; 3
(assert (not (Set_equal (Map_values m@6@01) (Set_singleton true))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Set_equal (Map_values m@6@01) (Set_singleton true)))
(pop) ; 2
(pop) ; 1
; ---------- test3 ----------
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
; var m: Map[Int,Int]
(declare-const m@7@01 Map<Int~_Int>)
; [exec]
; m := Map(2 := 12, 3 := 24, 4 := 36)
; [eval] Map(2 := 12, 3 := 24, 4 := 36)
; [eval] Map[Int,Int]()[2 := 12][3 := 24][4 := 36]
; [eval] Map[Int,Int]()[2 := 12][3 := 24]
; [eval] Map[Int,Int]()[2 := 12]
; [eval] Map[Int,Int]()
(declare-const m@8@01 Map<Int~_Int>)
(assert (=
  m@8@01
  (Map_update (Map_update (Map_update (as Map_empty  Map<Int~_Int>) 2 12) 3 24) 4 36)))
; [exec]
; assert |m| == 3
; [eval] |m| == 3
; [eval] |m|
(push) ; 3
(assert (not (= (Map_card m@8@01) 3)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Map_card m@8@01) 3))
; [exec]
; assert m[2] == 12 && (m[3] == 24 && m[4] == 36)
; [eval] m[2] == 12
; [eval] m[2]
(push) ; 3
(assert (not (Set_in 2 (Map_domain m@8@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (= (Map_apply m@8@01 2) 12)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Map_apply m@8@01 2) 12))
; [eval] m[3] == 24
; [eval] m[3]
(push) ; 3
(assert (not (Set_in 3 (Map_domain m@8@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (= (Map_apply m@8@01 3) 24)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Map_apply m@8@01 3) 24))
; [eval] m[4] == 36
; [eval] m[4]
(push) ; 3
(assert (not (Set_in 4 (Map_domain m@8@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (= (Map_apply m@8@01 4) 36)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Map_apply m@8@01 4) 36))
; [exec]
; assert domain(m) == Set(4, 2, 3)
; [eval] domain(m) == Set(4, 2, 3)
; [eval] domain(m)
; [eval] Set(4, 2, 3)
(push) ; 3
(assert (not (Set_equal (Map_domain m@8@01) (Set_unionone (Set_unionone (Set_singleton 4) 2) 3))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Set_equal (Map_domain m@8@01) (Set_unionone (Set_unionone (Set_singleton 4) 2) 3)))
; [exec]
; assert range(m) == Set(24, 12, 36)
; [eval] range(m) == Set(24, 12, 36)
; [eval] range(m)
; [eval] Set(24, 12, 36)
(push) ; 3
(assert (not (Set_equal (Map_values m@8@01) (Set_unionone (Set_unionone (Set_singleton 24) 12) 36))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Set_equal (Map_values m@8@01) (Set_unionone (Set_unionone (Set_singleton 24) 12) 36)))
; [exec]
; assert (3 in m)
; [eval] (3 in m)
(push) ; 3
(assert (not (Set_in 3 (Map_domain m@8@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Set_in 3 (Map_domain m@8@01)))
; [exec]
; assert !((1 in m))
; [eval] !((1 in m))
; [eval] (1 in m)
(push) ; 3
(assert (not (not (Set_in 1 (Map_domain m@8@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (Set_in 1 (Map_domain m@8@01))))
(pop) ; 2
(pop) ; 1
; ---------- test4 ----------
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
; var m1: Map[Int,Bool]
(declare-const m1@9@01 Map<Int~_Bool>)
; [exec]
; var m2: Map[Int,Bool]
(declare-const m2@10@01 Map<Int~_Bool>)
; [exec]
; m1 := Map(2 := false, 4 := true, 6 := false)
; [eval] Map(2 := false, 4 := true, 6 := false)
; [eval] Map[Int,Bool]()[2 := false][4 := true][6 := false]
; [eval] Map[Int,Bool]()[2 := false][4 := true]
; [eval] Map[Int,Bool]()[2 := false]
; [eval] Map[Int,Bool]()
(declare-const m1@11@01 Map<Int~_Bool>)
(assert (=
  m1@11@01
  (Map_update (Map_update (Map_update (as Map_empty  Map<Int~_Bool>) 2 false) 4 true) 6 false)))
; [exec]
; m2 := Map(6 := false, 2 := false)
; [eval] Map(6 := false, 2 := false)
; [eval] Map[Int,Bool]()[6 := false][2 := false]
; [eval] Map[Int,Bool]()[6 := false]
; [eval] Map[Int,Bool]()
(declare-const m2@12@01 Map<Int~_Bool>)
(assert (=
  m2@12@01
  (Map_update (Map_update (as Map_empty  Map<Int~_Bool>) 6 false) 2 false)))
; [exec]
; assert !((4 in m2))
; [eval] !((4 in m2))
; [eval] (4 in m2)
(push) ; 3
(assert (not (not (Set_in 4 (Map_domain m2@12@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (Set_in 4 (Map_domain m2@12@01))))
; [exec]
; assert m1 != m2
; [eval] m1 != m2
(push) ; 3
(assert (not (not (Map_equal m1@11@01 m2@12@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (Map_equal m1@11@01 m2@12@01)))
; [exec]
; assert m2[4 := true][4]
; [eval] m2[4 := true][4]
; [eval] m2[4 := true]
(push) ; 3
(assert (not (Set_in 4 (Map_domain (Map_update m2@12@01 4 true)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (Map_apply (Map_update m2@12@01 4 true) 4)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Map_apply (Map_update m2@12@01 4 true) 4))
; [exec]
; assert m1 == m1[4 := true]
; [eval] m1 == m1[4 := true]
; [eval] m1[4 := true]
(push) ; 3
(assert (not (Map_equal m1@11@01 (Map_update m1@11@01 4 true))))
(check-sat)
; unsat
(pop) ; 3
; 0,03s
; (get-info :all-statistics)
(assert (Map_equal m1@11@01 (Map_update m1@11@01 4 true)))
; [exec]
; assert m1 == m2[4 := true]
; [eval] m1 == m2[4 := true]
; [eval] m2[4 := true]
(push) ; 3
(assert (not (Map_equal m1@11@01 (Map_update m2@12@01 4 true))))
(check-sat)
; unsat
(pop) ; 3
; 0,02s
; (get-info :all-statistics)
(assert (Map_equal m1@11@01 (Map_update m2@12@01 4 true)))
(pop) ; 2
(pop) ; 1
; ---------- test5 ----------
(declare-const m@13@01 Map<Int~_Map<Int~_Bool>>)
(declare-const m@14@01 Map<Int~_Map<Int~_Bool>>)
(push) ; 1
(declare-const $t@15@01 $Snap)
(assert (= $t@15@01 ($Snap.combine ($Snap.first $t@15@01) ($Snap.second $t@15@01))))
(assert (= ($Snap.first $t@15@01) $Snap.unit))
; [eval] (forall i: Int :: { (i in m) } (0 <= i && i < 4) == (i in m))
(declare-const i@16@01 Int)
(push) ; 2
; [eval] (0 <= i && i < 4) == (i in m)
; [eval] 0 <= i && i < 4
; [eval] 0 <= i
(push) ; 3
; [then-branch: 0 | !(0 <= i@16@01) | live]
; [else-branch: 0 | 0 <= i@16@01 | live]
(push) ; 4
; [then-branch: 0 | !(0 <= i@16@01)]
(assert (not (<= 0 i@16@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | 0 <= i@16@01]
(assert (<= 0 i@16@01))
; [eval] i < 4
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@16@01) (not (<= 0 i@16@01))))
; [eval] (i in m)
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@16@01 Int)) (!
  (or (<= 0 i@16@01) (not (<= 0 i@16@01)))
  :pattern ((Set_in i@16@01 (Map_domain m@14@01)))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example1.vpr@52@12@52@70-aux|)))
(assert (forall ((i@16@01 Int)) (!
  (= (and (<= 0 i@16@01) (< i@16@01 4)) (Set_in i@16@01 (Map_domain m@14@01)))
  :pattern ((Set_in i@16@01 (Map_domain m@14@01)))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example1.vpr@52@12@52@70|)))
(assert (=
  ($Snap.second $t@15@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@15@01))
    ($Snap.second ($Snap.second $t@15@01)))))
(assert (= ($Snap.first ($Snap.second $t@15@01)) $Snap.unit))
; [eval] (forall i: Int, j: Int :: { (j in m[i]) } (i in m) ==> (0 <= j && j < 4) == (j in m[i]))
(declare-const i@17@01 Int)
(declare-const j@18@01 Int)
(push) ; 2
; [eval] (i in m) ==> (0 <= j && j < 4) == (j in m[i])
; [eval] (i in m)
(push) ; 3
; [then-branch: 1 | i@17@01 in domain(m@14@01) | live]
; [else-branch: 1 | !(i@17@01 in domain(m@14@01)) | live]
(push) ; 4
; [then-branch: 1 | i@17@01 in domain(m@14@01)]
(assert (Set_in i@17@01 (Map_domain m@14@01)))
; [eval] (0 <= j && j < 4) == (j in m[i])
; [eval] 0 <= j && j < 4
; [eval] 0 <= j
(push) ; 5
; [then-branch: 2 | !(0 <= j@18@01) | live]
; [else-branch: 2 | 0 <= j@18@01 | live]
(push) ; 6
; [then-branch: 2 | !(0 <= j@18@01)]
(assert (not (<= 0 j@18@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 2 | 0 <= j@18@01]
(assert (<= 0 j@18@01))
; [eval] j < 4
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@18@01) (not (<= 0 j@18@01))))
; [eval] (j in m[i])
; [eval] m[i]
(pop) ; 4
(push) ; 4
; [else-branch: 1 | !(i@17@01 in domain(m@14@01))]
(assert (not (Set_in i@17@01 (Map_domain m@14@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (Set_in i@17@01 (Map_domain m@14@01))
  (and
    (Set_in i@17@01 (Map_domain m@14@01))
    (or (<= 0 j@18@01) (not (<= 0 j@18@01))))))
; Joined path conditions
(assert (or
  (not (Set_in i@17@01 (Map_domain m@14@01)))
  (Set_in i@17@01 (Map_domain m@14@01))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@17@01 Int) (j@18@01 Int)) (!
  (and
    (=>
      (Set_in i@17@01 (Map_domain m@14@01))
      (and
        (Set_in i@17@01 (Map_domain m@14@01))
        (or (<= 0 j@18@01) (not (<= 0 j@18@01)))))
    (or
      (not (Set_in i@17@01 (Map_domain m@14@01)))
      (Set_in i@17@01 (Map_domain m@14@01))))
  :pattern ((Set_in j@18@01 (Map_domain (Map_apply m@14@01 i@17@01))))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example1.vpr@53@12@53@96-aux|)))
(assert (forall ((i@17@01 Int) (j@18@01 Int)) (!
  (=>
    (Set_in i@17@01 (Map_domain m@14@01))
    (=
      (and (<= 0 j@18@01) (< j@18@01 4))
      (Set_in j@18@01 (Map_domain (Map_apply m@14@01 i@17@01)))))
  :pattern ((Set_in j@18@01 (Map_domain (Map_apply m@14@01 i@17@01))))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example1.vpr@53@12@53@96|)))
(assert (= ($Snap.second ($Snap.second $t@15@01)) $Snap.unit))
; [eval] (forall i: Int, j: Int :: { m[i][j] } (i in m) && (j in m) ==> m[i][j] == (i == j))
(declare-const i@19@01 Int)
(declare-const j@20@01 Int)
(push) ; 2
; [eval] (i in m) && (j in m) ==> m[i][j] == (i == j)
; [eval] (i in m) && (j in m)
; [eval] (i in m)
(push) ; 3
; [then-branch: 3 | !(i@19@01 in domain(m@14@01)) | live]
; [else-branch: 3 | i@19@01 in domain(m@14@01) | live]
(push) ; 4
; [then-branch: 3 | !(i@19@01 in domain(m@14@01))]
(assert (not (Set_in i@19@01 (Map_domain m@14@01))))
(pop) ; 4
(push) ; 4
; [else-branch: 3 | i@19@01 in domain(m@14@01)]
(assert (Set_in i@19@01 (Map_domain m@14@01)))
; [eval] (j in m)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in i@19@01 (Map_domain m@14@01))
  (not (Set_in i@19@01 (Map_domain m@14@01)))))
(push) ; 3
; [then-branch: 4 | i@19@01 in domain(m@14@01) && j@20@01 in domain(m@14@01) | live]
; [else-branch: 4 | !(i@19@01 in domain(m@14@01) && j@20@01 in domain(m@14@01)) | live]
(push) ; 4
; [then-branch: 4 | i@19@01 in domain(m@14@01) && j@20@01 in domain(m@14@01)]
(assert (and (Set_in i@19@01 (Map_domain m@14@01)) (Set_in j@20@01 (Map_domain m@14@01))))
; [eval] m[i][j] == (i == j)
; [eval] m[i][j]
; [eval] m[i]
(push) ; 5
(assert (not (Set_in j@20@01 (Map_domain (Map_apply m@14@01 i@19@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] i == j
(pop) ; 4
(push) ; 4
; [else-branch: 4 | !(i@19@01 in domain(m@14@01) && j@20@01 in domain(m@14@01))]
(assert (not
  (and
    (Set_in i@19@01 (Map_domain m@14@01))
    (Set_in j@20@01 (Map_domain m@14@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in i@19@01 (Map_domain m@14@01))
      (Set_in j@20@01 (Map_domain m@14@01))))
  (and
    (Set_in i@19@01 (Map_domain m@14@01))
    (Set_in j@20@01 (Map_domain m@14@01)))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@19@01 Int) (j@20@01 Int)) (!
  (and
    (or
      (Set_in i@19@01 (Map_domain m@14@01))
      (not (Set_in i@19@01 (Map_domain m@14@01))))
    (or
      (not
        (and
          (Set_in i@19@01 (Map_domain m@14@01))
          (Set_in j@20@01 (Map_domain m@14@01))))
      (and
        (Set_in i@19@01 (Map_domain m@14@01))
        (Set_in j@20@01 (Map_domain m@14@01)))))
  :pattern ((Map_apply (Map_apply m@14@01 i@19@01) j@20@01))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example1.vpr@54@12@54@93-aux|)))
(assert (forall ((i@19@01 Int) (j@20@01 Int)) (!
  (=>
    (and
      (Set_in i@19@01 (Map_domain m@14@01))
      (Set_in j@20@01 (Map_domain m@14@01)))
    (= (Map_apply (Map_apply m@14@01 i@19@01) j@20@01) (= i@19@01 j@20@01)))
  :pattern ((Map_apply (Map_apply m@14@01 i@19@01) j@20@01))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example1.vpr@54@12@54@93|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert m[2][2]
; [eval] m[2][2]
; [eval] m[2]
(push) ; 3
(assert (not (Set_in 2 (Map_domain m@14@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (Set_in 2 (Map_domain (Map_apply m@14@01 2)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (Map_apply (Map_apply m@14@01 2) 2)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Map_apply (Map_apply m@14@01 2) 2))
; [exec]
; assert !m[1][2]
; [eval] !m[1][2]
; [eval] m[1][2]
; [eval] m[1]
(push) ; 3
(assert (not (Set_in 1 (Map_domain m@14@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (Set_in 2 (Map_domain (Map_apply m@14@01 1)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (not (Map_apply (Map_apply m@14@01 1) 2))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (Map_apply (Map_apply m@14@01 1) 2)))
; [exec]
; assert domain(m) == Set(0, 1, 2, 3)
; [eval] domain(m) == Set(0, 1, 2, 3)
; [eval] domain(m)
; [eval] Set(0, 1, 2, 3)
(push) ; 3
(assert (not (Set_equal (Map_domain m@14@01) (Set_unionone (Set_unionone (Set_unionone (Set_singleton 0) 1) 2) 3))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Set_equal (Map_domain m@14@01) (Set_unionone (Set_unionone (Set_unionone (Set_singleton 0) 1) 2) 3)))
; [exec]
; assert domain(m[0]) == Set(0, 1, 2, 3)
; [eval] domain(m[0]) == Set(0, 1, 2, 3)
; [eval] domain(m[0])
; [eval] m[0]
(push) ; 3
(assert (not (Set_in 0 (Map_domain m@14@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] Set(0, 1, 2, 3)
(push) ; 3
(assert (not (Set_equal (Map_domain (Map_apply m@14@01 0)) (Set_unionone (Set_unionone (Set_unionone (Set_singleton 0) 1) 2) 3))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Set_equal (Map_domain (Map_apply m@14@01 0)) (Set_unionone (Set_unionone (Set_unionone (Set_singleton 0) 1) 2) 3)))
; [exec]
; assert m[2] == Map(0 := false, 1 := false, 2 := true, 3 := false)
; [eval] m[2] == Map(0 := false, 1 := false, 2 := true, 3 := false)
; [eval] m[2]
(push) ; 3
(assert (not (Set_in 2 (Map_domain m@14@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] Map(0 := false, 1 := false, 2 := true, 3 := false)
; [eval] Map[Int,Bool]()[0 := false][1 := false][2 := true][3 := false]
; [eval] Map[Int,Bool]()[0 := false][1 := false][2 := true]
; [eval] Map[Int,Bool]()[0 := false][1 := false]
; [eval] Map[Int,Bool]()[0 := false]
; [eval] Map[Int,Bool]()
(push) ; 3
(assert (not (Map_equal (Map_apply m@14@01 2) (Map_update (Map_update (Map_update (Map_update (as Map_empty  Map<Int~_Bool>) 0 false) 1 false) 2 true) 3 false))))
(check-sat)
; unsat
(pop) ; 3
; 0,04s
; (get-info :all-statistics)
(assert (Map_equal (Map_apply m@14@01 2) (Map_update (Map_update (Map_update (Map_update (as Map_empty  Map<Int~_Bool>) 0 false) 1 false) 2 true) 3 false)))
; [exec]
; assert (Map(0 := false, 1 := false, 2 := true, 3 := false) in range(m))
; [eval] (Map(0 := false, 1 := false, 2 := true, 3 := false) in range(m))
; [eval] Map(0 := false, 1 := false, 2 := true, 3 := false)
; [eval] Map[Int,Bool]()[0 := false][1 := false][2 := true][3 := false]
; [eval] Map[Int,Bool]()[0 := false][1 := false][2 := true]
; [eval] Map[Int,Bool]()[0 := false][1 := false]
; [eval] Map[Int,Bool]()[0 := false]
; [eval] Map[Int,Bool]()
; [eval] range(m)
(push) ; 3
(assert (not (Set_in (Map_update (Map_update (Map_update (Map_update (as Map_empty  Map<Int~_Bool>) 0 false) 1 false) 2 true) 3 false) (Map_values m@14@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Set_in (Map_update (Map_update (Map_update (Map_update (as Map_empty  Map<Int~_Bool>) 0 false) 1 false) 2 true) 3 false) (Map_values m@14@01)))
(pop) ; 2
(pop) ; 1
; ---------- test6 ----------
(declare-const m@21@01 Map<Int~_$Ref>)
(declare-const x@22@01 Int)
(declare-const m@23@01 Map<Int~_$Ref>)
(declare-const x@24@01 Int)
(push) ; 1
(declare-const $t@25@01 $Snap)
(assert (= $t@25@01 ($Snap.combine ($Snap.first $t@25@01) ($Snap.second $t@25@01))))
(assert (= ($Snap.first $t@25@01) $Snap.unit))
; [eval] (forall i: Int, j: Int :: { (i in m), (j in m) } (i in m) && ((j in m) && i != j) ==> m[i] != m[j])
(declare-const i@26@01 Int)
(declare-const j@27@01 Int)
(push) ; 2
; [eval] (i in m) && ((j in m) && i != j) ==> m[i] != m[j]
; [eval] (i in m) && ((j in m) && i != j)
; [eval] (i in m)
(push) ; 3
; [then-branch: 5 | !(i@26@01 in domain(m@23@01)) | live]
; [else-branch: 5 | i@26@01 in domain(m@23@01) | live]
(push) ; 4
; [then-branch: 5 | !(i@26@01 in domain(m@23@01))]
(assert (not (Set_in i@26@01 (Map_domain m@23@01))))
(pop) ; 4
(push) ; 4
; [else-branch: 5 | i@26@01 in domain(m@23@01)]
(assert (Set_in i@26@01 (Map_domain m@23@01)))
; [eval] (j in m)
(push) ; 5
; [then-branch: 6 | !(j@27@01 in domain(m@23@01)) | live]
; [else-branch: 6 | j@27@01 in domain(m@23@01) | live]
(push) ; 6
; [then-branch: 6 | !(j@27@01 in domain(m@23@01))]
(assert (not (Set_in j@27@01 (Map_domain m@23@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 6 | j@27@01 in domain(m@23@01)]
(assert (Set_in j@27@01 (Map_domain m@23@01)))
; [eval] i != j
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in j@27@01 (Map_domain m@23@01))
  (not (Set_in j@27@01 (Map_domain m@23@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in i@26@01 (Map_domain m@23@01))
  (and
    (Set_in i@26@01 (Map_domain m@23@01))
    (or
      (Set_in j@27@01 (Map_domain m@23@01))
      (not (Set_in j@27@01 (Map_domain m@23@01)))))))
(assert (or
  (Set_in i@26@01 (Map_domain m@23@01))
  (not (Set_in i@26@01 (Map_domain m@23@01)))))
(push) ; 3
; [then-branch: 7 | i@26@01 in domain(m@23@01) && j@27@01 in domain(m@23@01) && i@26@01 != j@27@01 | live]
; [else-branch: 7 | !(i@26@01 in domain(m@23@01) && j@27@01 in domain(m@23@01) && i@26@01 != j@27@01) | live]
(push) ; 4
; [then-branch: 7 | i@26@01 in domain(m@23@01) && j@27@01 in domain(m@23@01) && i@26@01 != j@27@01]
(assert (and
  (Set_in i@26@01 (Map_domain m@23@01))
  (and (Set_in j@27@01 (Map_domain m@23@01)) (not (= i@26@01 j@27@01)))))
; [eval] m[i] != m[j]
; [eval] m[i]
; [eval] m[j]
(pop) ; 4
(push) ; 4
; [else-branch: 7 | !(i@26@01 in domain(m@23@01) && j@27@01 in domain(m@23@01) && i@26@01 != j@27@01)]
(assert (not
  (and
    (Set_in i@26@01 (Map_domain m@23@01))
    (and (Set_in j@27@01 (Map_domain m@23@01)) (not (= i@26@01 j@27@01))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (Set_in i@26@01 (Map_domain m@23@01))
    (and (Set_in j@27@01 (Map_domain m@23@01)) (not (= i@26@01 j@27@01))))
  (and
    (Set_in i@26@01 (Map_domain m@23@01))
    (Set_in j@27@01 (Map_domain m@23@01))
    (not (= i@26@01 j@27@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in i@26@01 (Map_domain m@23@01))
      (and (Set_in j@27@01 (Map_domain m@23@01)) (not (= i@26@01 j@27@01)))))
  (and
    (Set_in i@26@01 (Map_domain m@23@01))
    (and (Set_in j@27@01 (Map_domain m@23@01)) (not (= i@26@01 j@27@01))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@26@01 Int) (j@27@01 Int)) (!
  (and
    (=>
      (Set_in i@26@01 (Map_domain m@23@01))
      (and
        (Set_in i@26@01 (Map_domain m@23@01))
        (or
          (Set_in j@27@01 (Map_domain m@23@01))
          (not (Set_in j@27@01 (Map_domain m@23@01))))))
    (or
      (Set_in i@26@01 (Map_domain m@23@01))
      (not (Set_in i@26@01 (Map_domain m@23@01))))
    (=>
      (and
        (Set_in i@26@01 (Map_domain m@23@01))
        (and (Set_in j@27@01 (Map_domain m@23@01)) (not (= i@26@01 j@27@01))))
      (and
        (Set_in i@26@01 (Map_domain m@23@01))
        (Set_in j@27@01 (Map_domain m@23@01))
        (not (= i@26@01 j@27@01))))
    (or
      (not
        (and
          (Set_in i@26@01 (Map_domain m@23@01))
          (and (Set_in j@27@01 (Map_domain m@23@01)) (not (= i@26@01 j@27@01)))))
      (and
        (Set_in i@26@01 (Map_domain m@23@01))
        (and (Set_in j@27@01 (Map_domain m@23@01)) (not (= i@26@01 j@27@01))))))
  :pattern ((Set_in i@26@01 (Map_domain m@23@01)) (Set_in j@27@01 (Map_domain m@23@01)))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example1.vpr@67@12@67@99-aux|)))
(assert (forall ((i@26@01 Int) (j@27@01 Int)) (!
  (=>
    (and
      (Set_in i@26@01 (Map_domain m@23@01))
      (and (Set_in j@27@01 (Map_domain m@23@01)) (not (= i@26@01 j@27@01))))
    (not (= (Map_apply m@23@01 i@26@01) (Map_apply m@23@01 j@27@01))))
  :pattern ((Set_in i@26@01 (Map_domain m@23@01)) (Set_in j@27@01 (Map_domain m@23@01)))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example1.vpr@67@12@67@99|)))
(declare-const k@28@01 Int)
(push) ; 2
; [eval] (k in m)
(assert (Set_in k@28@01 (Map_domain m@23@01)))
; [eval] m[k]
(pop) ; 2
(declare-fun inv@29@01 ($Ref) Int)
(declare-fun img@30@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((k1@28@01 Int) (k2@28@01 Int)) (!
  (=>
    (and
      (Set_in k1@28@01 (Map_domain m@23@01))
      (Set_in k2@28@01 (Map_domain m@23@01))
      (= (Map_apply m@23@01 k1@28@01) (Map_apply m@23@01 k2@28@01)))
    (= k1@28@01 k2@28@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@28@01 Int)) (!
  (=>
    (Set_in k@28@01 (Map_domain m@23@01))
    (and
      (= (inv@29@01 (Map_apply m@23@01 k@28@01)) k@28@01)
      (img@30@01 (Map_apply m@23@01 k@28@01))))
  :pattern ((Set_in k@28@01 (Map_domain m@23@01)))
  :qid |quant-u-1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@30@01 r) (Set_in (inv@29@01 r) (Map_domain m@23@01)))
    (= (Map_apply m@23@01 (inv@29@01 r)) r))
  :pattern ((inv@29@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((k@28@01 Int)) (!
  (=>
    (Set_in k@28@01 (Map_domain m@23@01))
    (not (= (Map_apply m@23@01 k@28@01) $Ref.null)))
  :pattern ((Set_in k@28@01 (Map_domain m@23@01)))
  :qid |val-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [eval] (x in m)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (Set_in x@24@01 (Map_domain m@23@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (Set_in x@24@01 (Map_domain m@23@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | x@24@01 in domain(m@23@01) | live]
; [else-branch: 8 | !(x@24@01 in domain(m@23@01)) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 8 | x@24@01 in domain(m@23@01)]
(assert (Set_in x@24@01 (Map_domain m@23@01)))
; [exec]
; m[x].val := m[x].val + x
; [eval] m[x]
; [eval] m[x].val + x
; [eval] m[x]
(push) ; 4
(assert (not (and
  (img@30@01 (Map_apply m@23@01 x@24@01))
  (Set_in (inv@29@01 (Map_apply m@23@01 x@24@01)) (Map_domain m@23@01)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@31@01 ((r $Ref)) $Perm
  (ite
    (= r (Map_apply m@23@01 x@24@01))
    ($Perm.min
      (ite
        (and (img@30@01 r) (Set_in (inv@29@01 r) (Map_domain m@23@01)))
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
        (and (img@30@01 r) (Set_in (inv@29@01 r) (Map_domain m@23@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@31@01 r))
    $Perm.No)
  
  :qid |quant-u-3|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@31@01 r) $Perm.No)
  
  :qid |quant-u-4|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (Map_apply m@23@01 x@24@01))
    (= (- $Perm.Write (pTaken@31@01 r)) $Perm.No))
  
  :qid |quant-u-5|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@32@01 $FVF<val>)
; Definitional axioms for singleton-FVF's value
(assert (=
  ($FVF.lookup_val (as sm@32@01  $FVF<val>) (Map_apply m@23@01 x@24@01))
  (+
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@25@01)) (Map_apply m@23@01 x@24@01))
    x@24@01)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 8 | !(x@24@01 in domain(m@23@01))]
(assert (not (Set_in x@24@01 (Map_domain m@23@01))))
(pop) ; 3
; [eval] !((x in m))
; [eval] (x in m)
(push) ; 3
(set-option :timeout 10)
(assert (not (Set_in x@24@01 (Map_domain m@23@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (Set_in x@24@01 (Map_domain m@23@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | !(x@24@01 in domain(m@23@01)) | live]
; [else-branch: 9 | x@24@01 in domain(m@23@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 9 | !(x@24@01 in domain(m@23@01))]
(assert (not (Set_in x@24@01 (Map_domain m@23@01))))
(pop) ; 3
(push) ; 3
; [else-branch: 9 | x@24@01 in domain(m@23@01)]
(assert (Set_in x@24@01 (Map_domain m@23@01)))
(pop) ; 3
(pop) ; 2
(pop) ; 1
