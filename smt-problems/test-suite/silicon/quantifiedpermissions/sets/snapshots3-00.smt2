(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:20:44
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/sets/snapshots3.vpr
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
(declare-sort Set<$Ref> 0)
(declare-sort Set<Set<$Ref>> 0)
(declare-sort Set<Int> 0)
(declare-sort Set<$Snap> 0)
(declare-sort $FVF<f> 0)
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
(declare-fun $SortWrappers.Set<Set<$Ref>>To$Snap (Set<Set<$Ref>>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<Set<$Ref>> ($Snap) Set<Set<$Ref>>)
(assert (forall ((x Set<Set<$Ref>>)) (!
    (= x ($SortWrappers.$SnapToSet<Set<$Ref>>($SortWrappers.Set<Set<$Ref>>To$Snap x)))
    :pattern (($SortWrappers.Set<Set<$Ref>>To$Snap x))
    :qid |$Snap.$SnapToSet<Set<$Ref>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<Set<$Ref>>To$Snap($SortWrappers.$SnapToSet<Set<$Ref>> x)))
    :pattern (($SortWrappers.$SnapToSet<Set<$Ref>> x))
    :qid |$Snap.Set<Set<$Ref>>To$SnapToSet<Set<$Ref>>|
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
(declare-fun Set_card (Set<Set<$Ref>>) Int)
(declare-const Set_empty Set<Set<$Ref>>)
(declare-fun Set_in (Set<$Ref> Set<Set<$Ref>>) Bool)
(declare-fun Set_singleton (Set<$Ref>) Set<Set<$Ref>>)
(declare-fun Set_unionone (Set<Set<$Ref>> Set<$Ref>) Set<Set<$Ref>>)
(declare-fun Set_union (Set<Set<$Ref>> Set<Set<$Ref>>) Set<Set<$Ref>>)
(declare-fun Set_intersection (Set<Set<$Ref>> Set<Set<$Ref>>) Set<Set<$Ref>>)
(declare-fun Set_difference (Set<Set<$Ref>> Set<Set<$Ref>>) Set<Set<$Ref>>)
(declare-fun Set_subset (Set<Set<$Ref>> Set<Set<$Ref>>) Bool)
(declare-fun Set_equal (Set<Set<$Ref>> Set<Set<$Ref>>) Bool)
(declare-fun Set_skolem_diff (Set<Set<$Ref>> Set<Set<$Ref>>) Set<$Ref>)
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
; /field_value_functions_declarations.smt2 [f: Int]
(declare-fun $FVF.domain_f ($FVF<f>) Set<$Ref>)
(declare-fun $FVF.lookup_f ($FVF<f> $Ref) Int)
(declare-fun $FVF.after_f ($FVF<f> $FVF<f>) Bool)
(declare-fun $FVF.loc_f (Int $Ref) Bool)
(declare-fun $FVF.perm_f ($FPM $Ref) $Perm)
(declare-const $fvfTOP_f $FVF<f>)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun P%trigger ($Snap Set<$Ref>) Bool)
(declare-fun inv%trigger ($Snap $Ref) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
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
(assert (forall ((s Set<Set<$Ref>>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o Set<$Ref>)) (!
  (not (Set_in o (as Set_empty  Set<Set<$Ref>>)))
  :pattern ((Set_in o (as Set_empty  Set<Set<$Ref>>)))
  )))
(assert (forall ((s Set<Set<$Ref>>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<Set<$Ref>>)))
    (=> (not (= (Set_card s) 0)) (exists ((x Set<$Ref>))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r Set<$Ref>)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r Set<$Ref>) (o Set<$Ref>)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r Set<$Ref>)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<Set<$Ref>>) (x Set<$Ref>) (o Set<$Ref>)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<Set<$Ref>>) (x Set<$Ref>)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<Set<$Ref>>) (x Set<$Ref>) (y Set<$Ref>)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<Set<$Ref>>) (x Set<$Ref>)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Set<$Ref>>) (x Set<$Ref>)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Set<$Ref>>) (b Set<Set<$Ref>>) (o Set<$Ref>)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<Set<$Ref>>) (b Set<Set<$Ref>>) (y Set<$Ref>)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<Set<$Ref>>) (b Set<Set<$Ref>>) (y Set<$Ref>)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<Set<$Ref>>) (b Set<Set<$Ref>>) (o Set<$Ref>)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<Set<$Ref>>) (b Set<Set<$Ref>>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<Set<$Ref>>) (b Set<Set<$Ref>>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<Set<$Ref>>) (b Set<Set<$Ref>>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<Set<$Ref>>) (b Set<Set<$Ref>>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<Set<$Ref>>) (b Set<Set<$Ref>>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<Set<$Ref>>) (b Set<Set<$Ref>>) (o Set<$Ref>)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<Set<$Ref>>) (b Set<Set<$Ref>>) (y Set<$Ref>)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<Set<$Ref>>) (b Set<Set<$Ref>>)) (!
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
(assert (forall ((a Set<Set<$Ref>>) (b Set<Set<$Ref>>)) (!
  (=
    (Set_subset a b)
    (forall ((o Set<$Ref>)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<Set<$Ref>>) (b Set<Set<$Ref>>)) (!
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
(assert (forall ((a Set<Set<$Ref>>) (b Set<Set<$Ref>>)) (!
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
; /field_value_functions_axioms.smt2 [f: Int]
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
(assert (forall ((r $Ref) (f Int)) (!
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
(declare-const xs@0@01 Set<$Ref>)
(declare-const y@1@01 $Ref)
(declare-const xs@2@01 Set<$Ref>)
(declare-const y@3@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(declare-const x@5@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Set_in x@5@01 xs@2@01))
(pop) ; 2
(declare-fun inv@6@01 ($Ref) $Ref)
(declare-fun img@7@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@5@01 $Ref) (x2@5@01 $Ref)) (!
  (=>
    (and (Set_in x1@5@01 xs@2@01) (Set_in x2@5@01 xs@2@01) (= x1@5@01 x2@5@01))
    (= x1@5@01 x2@5@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@5@01 $Ref)) (!
  (=>
    (Set_in x@5@01 xs@2@01)
    (and (= (inv@6@01 x@5@01) x@5@01) (img@7@01 x@5@01)))
  :pattern ((Set_in x@5@01 xs@2@01))
  :pattern ((inv@6@01 x@5@01))
  :pattern ((img@7@01 x@5@01))
  :qid |quant-u-5|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01)) (= (inv@6@01 r) r))
  :pattern ((inv@6@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@5@01 $Ref)) (!
  (=> (Set_in x@5@01 xs@2@01) (not (= x@5@01 $Ref.null)))
  :pattern ((Set_in x@5@01 xs@2@01))
  :pattern ((inv@6@01 x@5@01))
  :pattern ((img@7@01 x@5@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@4@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@4@01))
    ($Snap.second ($Snap.second $t@4@01)))))
(assert (= ($Snap.first ($Snap.second $t@4@01)) $Snap.unit))
; [eval] (y in xs)
(assert (Set_in y@3@01 xs@2@01))
(assert (= ($Snap.second ($Snap.second $t@4@01)) $Snap.unit))
; [eval] y.f == 5
(push) ; 2
(assert (not (and (img@7@01 y@3@01) (Set_in (inv@6@01 y@3@01) xs@2@01))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (= ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) y@3@01) 5))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert y.f == 5
; [eval] y.f == 5
(push) ; 3
(assert (not (and (img@7@01 y@3@01) (Set_in (inv@6@01 y@3@01) xs@2@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; fold acc(P(xs), write)
(declare-const x@8@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Set_in x@8@01 xs@2@01))
(pop) ; 3
(declare-fun inv@9@01 ($Ref) $Ref)
(declare-fun img@10@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@8@01 $Ref) (x2@8@01 $Ref)) (!
  (=>
    (and (Set_in x1@8@01 xs@2@01) (Set_in x2@8@01 xs@2@01) (= x1@8@01 x2@8@01))
    (= x1@8@01 x2@8@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@8@01 $Ref)) (!
  (=>
    (Set_in x@8@01 xs@2@01)
    (and (= (inv@9@01 x@8@01) x@8@01) (img@10@01 x@8@01)))
  :pattern ((Set_in x@8@01 xs@2@01))
  :pattern ((inv@9@01 x@8@01))
  :pattern ((img@10@01 x@8@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@10@01 r) (Set_in (inv@9@01 r) xs@2@01)) (= (inv@9@01 r) r))
  :pattern ((inv@9@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@11@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@9@01 r) xs@2@01) (img@10@01 r) (= r (inv@9@01 r)))
    ($Perm.min
      (ite (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01)) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01)) $Perm.Write $Perm.No)
      (pTaken@11@01 r))
    $Perm.No)
  
  :qid |quant-u-8|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@9@01 r) xs@2@01) (img@10@01 r) (= r (inv@9@01 r)))
    (= (- $Perm.Write (pTaken@11@01 r)) $Perm.No))
  
  :qid |quant-u-9|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@12@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@12@01  $FVF<f>)))
      (and (Set_in (inv@9@01 r) xs@2@01) (img@10@01 r)))
    (=>
      (and (Set_in (inv@9@01 r) xs@2@01) (img@10@01 r))
      (Set_in r ($FVF.domain_f (as sm@12@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@12@01  $FVF<f>))))
  :qid |qp.fvfDomDef1|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@9@01 r) xs@2@01) (img@10@01 r))
      (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01)))
    (=
      ($FVF.lookup_f (as sm@12@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
  :pattern (($FVF.lookup_f (as sm@12@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
  :qid |qp.fvfValDef0|)))
(assert (P%trigger ($SortWrappers.$FVF<f>To$Snap (as sm@12@01  $FVF<f>)) xs@2@01))
; [exec]
; unfold acc(P(xs), write)
(declare-const x@13@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs)
(assert (Set_in x@13@01 xs@2@01))
(pop) ; 3
(declare-fun inv@14@01 ($Ref) $Ref)
(declare-fun img@15@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@13@01 $Ref) (x2@13@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@13@01 xs@2@01)
      (Set_in x2@13@01 xs@2@01)
      (= x1@13@01 x2@13@01))
    (= x1@13@01 x2@13@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@13@01 $Ref)) (!
  (=>
    (Set_in x@13@01 xs@2@01)
    (and (= (inv@14@01 x@13@01) x@13@01) (img@15@01 x@13@01)))
  :pattern ((Set_in x@13@01 xs@2@01))
  :pattern ((inv@14@01 x@13@01))
  :pattern ((img@15@01 x@13@01))
  :qid |quant-u-11|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@15@01 r) (Set_in (inv@14@01 r) xs@2@01)) (= (inv@14@01 r) r))
  :pattern ((inv@14@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@13@01 $Ref)) (!
  (=> (Set_in x@13@01 xs@2@01) (not (= x@13@01 $Ref.null)))
  :pattern ((Set_in x@13@01 xs@2@01))
  :pattern ((inv@14@01 x@13@01))
  :pattern ((img@15@01 x@13@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; assert y.f == 5
; [eval] y.f == 5
(set-option :timeout 0)
(push) ; 3
(assert (not (and (img@15@01 y@3@01) (Set_in (inv@14@01 y@3@01) xs@2@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (= ($FVF.lookup_f (as sm@12@01  $FVF<f>) y@3@01) 5)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= ($FVF.lookup_f (as sm@12@01  $FVF<f>) y@3@01) 5))
(pop) ; 2
(pop) ; 1
; ---------- m1 ----------
(declare-const this@16@01 $Ref)
(declare-const this@17@01 $Ref)
(push) ; 1
(declare-const $t@18@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var t: Ref
(declare-const t@19@01 $Ref)
; [exec]
; var a: Int
(declare-const a@20@01 Int)
; [exec]
; unfold acc(inv(this), write)
(assert (= $t@18@01 ($Snap.combine ($Snap.first $t@18@01) ($Snap.second $t@18@01))))
(assert (not (= this@17@01 $Ref.null)))
(declare-const x@21@01 $Ref)
(push) ; 3
; [eval] (x in this.n)
(assert (Set_in x@21@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01))))
(pop) ; 3
(declare-fun inv@22@01 ($Ref) $Ref)
(declare-fun img@23@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@21@01 $Ref) (x2@21@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@21@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01)))
      (Set_in x2@21@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01)))
      (= x1@21@01 x2@21@01))
    (= x1@21@01 x2@21@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@21@01 $Ref)) (!
  (=>
    (Set_in x@21@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01)))
    (and (= (inv@22@01 x@21@01) x@21@01) (img@23@01 x@21@01)))
  :pattern ((Set_in x@21@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01))))
  :pattern ((inv@22@01 x@21@01))
  :pattern ((img@23@01 x@21@01))
  :qid |quant-u-13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@23@01 r)
      (Set_in (inv@22@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01))))
    (= (inv@22@01 r) r))
  :pattern ((inv@22@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@21@01 $Ref)) (!
  (=>
    (Set_in x@21@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01)))
    (not (= x@21@01 $Ref.null)))
  :pattern ((Set_in x@21@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01))))
  :pattern ((inv@22@01 x@21@01))
  :pattern ((img@23@01 x@21@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (inv%trigger $t@18@01 this@17@01))
; [exec]
; inhale (t in this.n)
(declare-const $t@24@01 $Snap)
(assert (= $t@24@01 $Snap.unit))
; [eval] (t in this.n)
(assert (Set_in t@19@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; a := t.f
(set-option :timeout 0)
(push) ; 3
(assert (not (and
  (img@23@01 t@19@01)
  (Set_in (inv@22@01 t@19@01) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const a@25@01 Int)
(assert (=
  a@25@01
  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@18@01)) t@19@01)))
; [exec]
; fold acc(inv(this), write)
(declare-const x@26@01 $Ref)
(push) ; 3
; [eval] (x in this.n)
(assert (Set_in x@26@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01))))
(pop) ; 3
(declare-fun inv@27@01 ($Ref) $Ref)
(declare-fun img@28@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@26@01 $Ref) (x2@26@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@26@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01)))
      (Set_in x2@26@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01)))
      (= x1@26@01 x2@26@01))
    (= x1@26@01 x2@26@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@26@01 $Ref)) (!
  (=>
    (Set_in x@26@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01)))
    (and (= (inv@27@01 x@26@01) x@26@01) (img@28@01 x@26@01)))
  :pattern ((Set_in x@26@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01))))
  :pattern ((inv@27@01 x@26@01))
  :pattern ((img@28@01 x@26@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@01 r)
      (Set_in (inv@27@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01))))
    (= (inv@27@01 r) r))
  :pattern ((inv@27@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@29@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@27@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01)))
      (img@28@01 r)
      (= r (inv@27@01 r)))
    ($Perm.min
      (ite
        (and
          (img@23@01 r)
          (Set_in (inv@22@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01))))
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
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@23@01 r)
          (Set_in (inv@22@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@29@01 r))
    $Perm.No)
  
  :qid |quant-u-16|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@27@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01)))
      (img@28@01 r)
      (= r (inv@27@01 r)))
    (= (- $Perm.Write (pTaken@29@01 r)) $Perm.No))
  
  :qid |quant-u-17|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@30@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@30@01  $FVF<f>)))
      (and
        (Set_in (inv@27@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01)))
        (img@28@01 r)))
    (=>
      (and
        (Set_in (inv@27@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01)))
        (img@28@01 r))
      (Set_in r ($FVF.domain_f (as sm@30@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@30@01  $FVF<f>))))
  :qid |qp.fvfDomDef3|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@27@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01)))
        (img@28@01 r))
      (and
        (img@23@01 r)
        (Set_in (inv@22@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01)))))
    (=
      ($FVF.lookup_f (as sm@30@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@18@01)) r)))
  :pattern (($FVF.lookup_f (as sm@30@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@18@01)) r))
  :qid |qp.fvfValDef2|)))
(assert (inv%trigger ($Snap.combine
  ($Snap.first $t@18@01)
  ($SortWrappers.$FVF<f>To$Snap (as sm@30@01  $FVF<f>))) this@17@01))
; [exec]
; unfold acc(inv(this), write)
(declare-const x@31@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in this.n)
(assert (Set_in x@31@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01))))
(pop) ; 3
(declare-fun inv@32@01 ($Ref) $Ref)
(declare-fun img@33@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@31@01 $Ref) (x2@31@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@31@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01)))
      (Set_in x2@31@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01)))
      (= x1@31@01 x2@31@01))
    (= x1@31@01 x2@31@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@31@01 $Ref)) (!
  (=>
    (Set_in x@31@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01)))
    (and (= (inv@32@01 x@31@01) x@31@01) (img@33@01 x@31@01)))
  :pattern ((Set_in x@31@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01))))
  :pattern ((inv@32@01 x@31@01))
  :pattern ((img@33@01 x@31@01))
  :qid |quant-u-19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@33@01 r)
      (Set_in (inv@32@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01))))
    (= (inv@32@01 r) r))
  :pattern ((inv@32@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@31@01 $Ref)) (!
  (=>
    (Set_in x@31@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01)))
    (not (= x@31@01 $Ref.null)))
  :pattern ((Set_in x@31@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01))))
  :pattern ((inv@32@01 x@31@01))
  :pattern ((img@33@01 x@31@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; assert a == t.f
; [eval] a == t.f
(set-option :timeout 0)
(push) ; 3
(assert (not (and
  (img@33@01 t@19@01)
  (Set_in (inv@32@01 t@19@01) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (= a@25@01 ($FVF.lookup_f (as sm@30@01  $FVF<f>) t@19@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= a@25@01 ($FVF.lookup_f (as sm@30@01  $FVF<f>) t@19@01)))
; [exec]
; fold acc(P(this.n), write)
(declare-const x@34@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Set_in x@34@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01))))
(pop) ; 3
(declare-fun inv@35@01 ($Ref) $Ref)
(declare-fun img@36@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@34@01 $Ref) (x2@34@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@34@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01)))
      (Set_in x2@34@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01)))
      (= x1@34@01 x2@34@01))
    (= x1@34@01 x2@34@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@34@01 $Ref)) (!
  (=>
    (Set_in x@34@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01)))
    (and (= (inv@35@01 x@34@01) x@34@01) (img@36@01 x@34@01)))
  :pattern ((Set_in x@34@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01))))
  :pattern ((inv@35@01 x@34@01))
  :pattern ((img@36@01 x@34@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@36@01 r)
      (Set_in (inv@35@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01))))
    (= (inv@35@01 r) r))
  :pattern ((inv@35@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@37@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@35@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01)))
      (img@36@01 r)
      (= r (inv@35@01 r)))
    ($Perm.min
      (ite
        (and
          (img@33@01 r)
          (Set_in (inv@32@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01))))
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
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@33@01 r)
          (Set_in (inv@32@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@37@01 r))
    $Perm.No)
  
  :qid |quant-u-22|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@35@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01)))
      (img@36@01 r)
      (= r (inv@35@01 r)))
    (= (- $Perm.Write (pTaken@37@01 r)) $Perm.No))
  
  :qid |quant-u-23|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@38@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@38@01  $FVF<f>)))
      (and
        (Set_in (inv@35@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01)))
        (img@36@01 r)))
    (=>
      (and
        (Set_in (inv@35@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01)))
        (img@36@01 r))
      (Set_in r ($FVF.domain_f (as sm@38@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@38@01  $FVF<f>))))
  :qid |qp.fvfDomDef5|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@35@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01)))
        (img@36@01 r))
      (and
        (img@33@01 r)
        (Set_in (inv@32@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01)))))
    (=
      ($FVF.lookup_f (as sm@38@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@30@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@38@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@30@01  $FVF<f>) r))
  :qid |qp.fvfValDef4|)))
(assert (P%trigger ($SortWrappers.$FVF<f>To$Snap (as sm@38@01  $FVF<f>)) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01))))
; [exec]
; exhale acc(P(this.n), write)
; [exec]
; inhale acc(P(this.n), write)
(declare-const $t@39@01 $FVF<f>)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; unfold acc(P(this.n), write)
(declare-const x@40@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs)
(assert (Set_in x@40@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01))))
(pop) ; 3
(declare-fun inv@41@01 ($Ref) $Ref)
(declare-fun img@42@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@40@01 $Ref) (x2@40@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@40@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01)))
      (Set_in x2@40@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01)))
      (= x1@40@01 x2@40@01))
    (= x1@40@01 x2@40@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@40@01 $Ref)) (!
  (=>
    (Set_in x@40@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01)))
    (and (= (inv@41@01 x@40@01) x@40@01) (img@42@01 x@40@01)))
  :pattern ((Set_in x@40@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01))))
  :pattern ((inv@41@01 x@40@01))
  :pattern ((img@42@01 x@40@01))
  :qid |quant-u-25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@42@01 r)
      (Set_in (inv@41@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01))))
    (= (inv@41@01 r) r))
  :pattern ((inv@41@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@40@01 $Ref)) (!
  (=>
    (Set_in x@40@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01)))
    (not (= x@40@01 $Ref.null)))
  :pattern ((Set_in x@40@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01))))
  :pattern ((inv@41@01 x@40@01))
  :pattern ((img@42@01 x@40@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (P%trigger ($SortWrappers.$FVF<f>To$Snap $t@39@01) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01))))
; [exec]
; assert a == t.f
; [eval] a == t.f
(set-option :timeout 0)
(push) ; 3
(assert (not (and
  (img@42@01 t@19@01)
  (Set_in (inv@41@01 t@19@01) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (= a@25@01 ($FVF.lookup_f $t@39@01 t@19@01))))
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
(declare-const sm@43@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@42@01 r)
      (Set_in (inv@41@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01))))
    (= ($FVF.lookup_f (as sm@43@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@43@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef6|)))
(declare-const pm@44@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@44@01  $FPM) r)
    (ite
      (and
        (img@42@01 r)
        (Set_in (inv@41@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01))))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@44@01  $FPM) r))
  :qid |qp.resPrmSumDef7|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@44@01  $FPM) r) $Perm.Write)
  :pattern ((inv@41@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] a == t.f
(set-option :timeout 0)
(push) ; 3
(assert (not (and
  (img@42@01 t@19@01)
  (Set_in (inv@41@01 t@19@01) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (= a@25@01 ($FVF.lookup_f (as sm@43@01  $FVF<f>) t@19@01))))
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
(declare-const sm@45@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@42@01 r)
      (Set_in (inv@41@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01))))
    (= ($FVF.lookup_f (as sm@45@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@45@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef8|)))
(declare-const pm@46@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@46@01  $FPM) r)
    (ite
      (and
        (img@42@01 r)
        (Set_in (inv@41@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01))))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@46@01  $FPM) r))
  :qid |qp.resPrmSumDef9|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@46@01  $FPM) r) $Perm.Write)
  :pattern ((inv@41@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] a == t.f
(set-option :timeout 0)
(push) ; 3
(assert (not (and
  (img@42@01 t@19@01)
  (Set_in (inv@41@01 t@19@01) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (= a@25@01 ($FVF.lookup_f (as sm@45@01  $FVF<f>) t@19@01))))
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
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] a == t.f
(set-option :timeout 0)
(push) ; 3
(assert (not (and
  (img@42@01 t@19@01)
  (Set_in (inv@41@01 t@19@01) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@18@01))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (= a@25@01 ($FVF.lookup_f (as sm@45@01  $FVF<f>) t@19@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- m1_carbon_regression ----------
(declare-const this@47@01 $Ref)
(declare-const this@48@01 $Ref)
(push) ; 1
(declare-const $t@49@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@50@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; var t: Ref
(declare-const t@51@01 $Ref)
; [exec]
; var a: Int
(declare-const a@52@01 Int)
; [exec]
; unfold acc(inv(this), write)
(assert (= $t@49@01 ($Snap.combine ($Snap.first $t@49@01) ($Snap.second $t@49@01))))
(assert (not (= this@48@01 $Ref.null)))
(declare-const x@53@01 $Ref)
(push) ; 3
; [eval] (x in this.n)
(assert (Set_in x@53@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@49@01))))
(pop) ; 3
(declare-fun inv@54@01 ($Ref) $Ref)
(declare-fun img@55@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@53@01 $Ref) (x2@53@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@53@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@49@01)))
      (Set_in x2@53@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@49@01)))
      (= x1@53@01 x2@53@01))
    (= x1@53@01 x2@53@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@53@01 $Ref)) (!
  (=>
    (Set_in x@53@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@49@01)))
    (and (= (inv@54@01 x@53@01) x@53@01) (img@55@01 x@53@01)))
  :pattern ((Set_in x@53@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@49@01))))
  :pattern ((inv@54@01 x@53@01))
  :pattern ((img@55@01 x@53@01))
  :qid |quant-u-27|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@55@01 r)
      (Set_in (inv@54@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@49@01))))
    (= (inv@54@01 r) r))
  :pattern ((inv@54@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@53@01 $Ref)) (!
  (=>
    (Set_in x@53@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@49@01)))
    (not (= x@53@01 $Ref.null)))
  :pattern ((Set_in x@53@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@49@01))))
  :pattern ((inv@54@01 x@53@01))
  :pattern ((img@55@01 x@53@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (inv%trigger $t@49@01 this@48@01))
; [exec]
; inhale (t in this.n)
(declare-const $t@56@01 $Snap)
(assert (= $t@56@01 $Snap.unit))
; [eval] (t in this.n)
(assert (Set_in t@51@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@49@01))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; a := t.f
(set-option :timeout 0)
(push) ; 3
(assert (not (and
  (img@55@01 t@51@01)
  (Set_in (inv@54@01 t@51@01) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@49@01))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const a@57@01 Int)
(assert (=
  a@57@01
  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@49@01)) t@51@01)))
; [exec]
; fold acc(inv(this), write)
(declare-const x@58@01 $Ref)
(push) ; 3
; [eval] (x in this.n)
(assert (Set_in x@58@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@49@01))))
(pop) ; 3
(declare-fun inv@59@01 ($Ref) $Ref)
(declare-fun img@60@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@58@01 $Ref) (x2@58@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@58@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@49@01)))
      (Set_in x2@58@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@49@01)))
      (= x1@58@01 x2@58@01))
    (= x1@58@01 x2@58@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@58@01 $Ref)) (!
  (=>
    (Set_in x@58@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@49@01)))
    (and (= (inv@59@01 x@58@01) x@58@01) (img@60@01 x@58@01)))
  :pattern ((Set_in x@58@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@49@01))))
  :pattern ((inv@59@01 x@58@01))
  :pattern ((img@60@01 x@58@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@60@01 r)
      (Set_in (inv@59@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@49@01))))
    (= (inv@59@01 r) r))
  :pattern ((inv@59@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@61@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@59@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@49@01)))
      (img@60@01 r)
      (= r (inv@59@01 r)))
    ($Perm.min
      (ite
        (and
          (img@55@01 r)
          (Set_in (inv@54@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@49@01))))
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
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@55@01 r)
          (Set_in (inv@54@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@49@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@61@01 r))
    $Perm.No)
  
  :qid |quant-u-30|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@59@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@49@01)))
      (img@60@01 r)
      (= r (inv@59@01 r)))
    (= (- $Perm.Write (pTaken@61@01 r)) $Perm.No))
  
  :qid |quant-u-31|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@62@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@62@01  $FVF<f>)))
      (and
        (Set_in (inv@59@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@49@01)))
        (img@60@01 r)))
    (=>
      (and
        (Set_in (inv@59@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@49@01)))
        (img@60@01 r))
      (Set_in r ($FVF.domain_f (as sm@62@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@62@01  $FVF<f>))))
  :qid |qp.fvfDomDef11|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@59@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@49@01)))
        (img@60@01 r))
      (and
        (img@55@01 r)
        (Set_in (inv@54@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@49@01)))))
    (=
      ($FVF.lookup_f (as sm@62@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@49@01)) r)))
  :pattern (($FVF.lookup_f (as sm@62@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@49@01)) r))
  :qid |qp.fvfValDef10|)))
(assert (inv%trigger ($Snap.combine
  ($Snap.first $t@49@01)
  ($SortWrappers.$FVF<f>To$Snap (as sm@62@01  $FVF<f>))) this@48@01))
; [exec]
; unfold acc(inv(this), write)
(declare-const x@63@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in this.n)
(assert (Set_in x@63@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@49@01))))
(pop) ; 3
(declare-fun inv@64@01 ($Ref) $Ref)
(declare-fun img@65@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@63@01 $Ref) (x2@63@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@63@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@49@01)))
      (Set_in x2@63@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@49@01)))
      (= x1@63@01 x2@63@01))
    (= x1@63@01 x2@63@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@63@01 $Ref)) (!
  (=>
    (Set_in x@63@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@49@01)))
    (and (= (inv@64@01 x@63@01) x@63@01) (img@65@01 x@63@01)))
  :pattern ((Set_in x@63@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@49@01))))
  :pattern ((inv@64@01 x@63@01))
  :pattern ((img@65@01 x@63@01))
  :qid |quant-u-33|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@65@01 r)
      (Set_in (inv@64@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@49@01))))
    (= (inv@64@01 r) r))
  :pattern ((inv@64@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@63@01 $Ref)) (!
  (=>
    (Set_in x@63@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@49@01)))
    (not (= x@63@01 $Ref.null)))
  :pattern ((Set_in x@63@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@49@01))))
  :pattern ((inv@64@01 x@63@01))
  :pattern ((img@65@01 x@63@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; assert a == t.f
; [eval] a == t.f
(set-option :timeout 0)
(push) ; 3
(assert (not (and
  (img@65@01 t@51@01)
  (Set_in (inv@64@01 t@51@01) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@49@01))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (= a@57@01 ($FVF.lookup_f (as sm@62@01  $FVF<f>) t@51@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= a@57@01 ($FVF.lookup_f (as sm@62@01  $FVF<f>) t@51@01)))
; [exec]
; fold acc(P(this.n), write)
(declare-const x@66@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Set_in x@66@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@49@01))))
(pop) ; 3
(declare-fun inv@67@01 ($Ref) $Ref)
(declare-fun img@68@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@66@01 $Ref) (x2@66@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@66@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@49@01)))
      (Set_in x2@66@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@49@01)))
      (= x1@66@01 x2@66@01))
    (= x1@66@01 x2@66@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@66@01 $Ref)) (!
  (=>
    (Set_in x@66@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@49@01)))
    (and (= (inv@67@01 x@66@01) x@66@01) (img@68@01 x@66@01)))
  :pattern ((Set_in x@66@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@49@01))))
  :pattern ((inv@67@01 x@66@01))
  :pattern ((img@68@01 x@66@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@68@01 r)
      (Set_in (inv@67@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@49@01))))
    (= (inv@67@01 r) r))
  :pattern ((inv@67@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@69@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@67@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@49@01)))
      (img@68@01 r)
      (= r (inv@67@01 r)))
    ($Perm.min
      (ite
        (and
          (img@65@01 r)
          (Set_in (inv@64@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@49@01))))
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
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@65@01 r)
          (Set_in (inv@64@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@49@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@69@01 r))
    $Perm.No)
  
  :qid |quant-u-36|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@67@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@49@01)))
      (img@68@01 r)
      (= r (inv@67@01 r)))
    (= (- $Perm.Write (pTaken@69@01 r)) $Perm.No))
  
  :qid |quant-u-37|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@70@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@70@01  $FVF<f>)))
      (and
        (Set_in (inv@67@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@49@01)))
        (img@68@01 r)))
    (=>
      (and
        (Set_in (inv@67@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@49@01)))
        (img@68@01 r))
      (Set_in r ($FVF.domain_f (as sm@70@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@70@01  $FVF<f>))))
  :qid |qp.fvfDomDef13|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@67@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@49@01)))
        (img@68@01 r))
      (and
        (img@65@01 r)
        (Set_in (inv@64@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@49@01)))))
    (=
      ($FVF.lookup_f (as sm@70@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@62@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@70@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@62@01  $FVF<f>) r))
  :qid |qp.fvfValDef12|)))
(assert (P%trigger ($SortWrappers.$FVF<f>To$Snap (as sm@70@01  $FVF<f>)) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@49@01))))
; [exec]
; assert false
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
