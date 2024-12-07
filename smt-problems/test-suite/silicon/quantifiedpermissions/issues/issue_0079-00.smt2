(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:17:07
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0079.vpr
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
(declare-sort Set<Int> 0)
(declare-sort Set<Set<$Ref>> 0)
(declare-sort Set<$Snap> 0)
(declare-sort $FVF<fld> 0)
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
(declare-fun $SortWrappers.$FVF<fld>To$Snap ($FVF<fld>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<fld> ($Snap) $FVF<fld>)
(assert (forall ((x $FVF<fld>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<fld>($SortWrappers.$FVF<fld>To$Snap x)))
    :pattern (($SortWrappers.$FVF<fld>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<fld>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<fld>To$Snap($SortWrappers.$SnapTo$FVF<fld> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<fld> x))
    :qid |$Snap.$FVF<fld>To$SnapTo$FVF<fld>|
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
; /field_value_functions_declarations.smt2 [fld: Int]
(declare-fun $FVF.domain_fld ($FVF<fld>) Set<$Ref>)
(declare-fun $FVF.lookup_fld ($FVF<fld> $Ref) Int)
(declare-fun $FVF.after_fld ($FVF<fld> $FVF<fld>) Bool)
(declare-fun $FVF.loc_fld (Int $Ref) Bool)
(declare-fun $FVF.perm_fld ($FPM $Ref) $Perm)
(declare-const $fvfTOP_fld $FVF<fld>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun getField01 ($Snap Set<$Ref> $Ref) Int)
(declare-fun getField01%limited ($Snap Set<$Ref> $Ref) Int)
(declare-fun getField01%stateless (Set<$Ref> $Ref) Bool)
(declare-fun getField01%precondition ($Snap Set<$Ref> $Ref) Bool)
(declare-fun getField ($Snap $Ref) Int)
(declare-fun getField%limited ($Snap $Ref) Int)
(declare-fun getField%stateless ($Ref) Bool)
(declare-fun getField%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun inv%trigger ($Snap Set<$Ref>) Bool)
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
; /field_value_functions_axioms.smt2 [fld: Int]
(assert (forall ((vs $FVF<fld>) (ws $FVF<fld>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_fld vs) ($FVF.domain_fld ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_fld vs))
            (= ($FVF.lookup_fld vs x) ($FVF.lookup_fld ws x)))
          :pattern (($FVF.lookup_fld vs x) ($FVF.lookup_fld ws x))
          :qid |qp.$FVF<fld>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<fld>To$Snap vs)
              ($SortWrappers.$FVF<fld>To$Snap ws)
              )
    :qid |qp.$FVF<fld>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_fld pm r))
    :pattern (($FVF.perm_fld pm r)))))
(assert (forall ((r $Ref) (f Int)) (!
    (= ($FVF.loc_fld f r) true)
    :pattern (($FVF.loc_fld f r)))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(declare-fun inv@6@00 ($Snap Set<$Ref> $Ref $Ref) $Ref)
(declare-fun img@7@00 ($Snap Set<$Ref> $Ref $Ref) Bool)
(declare-fun inv@9@00 ($Snap $Ref $Ref) $Ref)
(declare-fun img@10@00 ($Snap $Ref $Ref) Bool)
(assert (forall ((s@$ $Snap) (xs@0@00 Set<$Ref>) (y@1@00 $Ref)) (!
  (= (getField01%limited s@$ xs@0@00 y@1@00) (getField01 s@$ xs@0@00 y@1@00))
  :pattern ((getField01 s@$ xs@0@00 y@1@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (xs@0@00 Set<$Ref>) (y@1@00 $Ref)) (!
  (getField01%stateless xs@0@00 y@1@00)
  :pattern ((getField01%limited s@$ xs@0@00 y@1@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (xs@0@00 Set<$Ref>) (y@1@00 $Ref)) (!
  (and
    (forall ((x@5@00 $Ref)) (!
      (=>
        (Set_in x@5@00 xs@0@00)
        (and
          (= (inv@6@00 s@$ xs@0@00 y@1@00 x@5@00) x@5@00)
          (img@7@00 s@$ xs@0@00 y@1@00 x@5@00)))
      :pattern ((Set_in x@5@00 xs@0@00))
      :pattern ((inv@6@00 s@$ xs@0@00 y@1@00 x@5@00))
      :pattern ((img@7@00 s@$ xs@0@00 y@1@00 x@5@00))
      :qid |quant-u-5|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@7@00 s@$ xs@0@00 y@1@00 r)
          (Set_in (inv@6@00 s@$ xs@0@00 y@1@00 r) xs@0@00))
        (= (inv@6@00 s@$ xs@0@00 y@1@00 r) r))
      :pattern ((inv@6@00 s@$ xs@0@00 y@1@00 r))
      :qid |fld-fctOfInv|))
    (=>
      (getField01%precondition s@$ xs@0@00 y@1@00)
      (=
        (getField01 s@$ xs@0@00 y@1@00)
        ($FVF.lookup_fld ($SortWrappers.$SnapTo$FVF<fld> ($Snap.first s@$)) y@1@00))))
  :pattern ((getField01 s@$ xs@0@00 y@1@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (xs@0@00 Set<$Ref>) (y@1@00 $Ref)) (!
  true
  :pattern ((getField01 s@$ xs@0@00 y@1@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (this@3@00 $Ref)) (!
  (= (getField%limited s@$ this@3@00) (getField s@$ this@3@00))
  :pattern ((getField s@$ this@3@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (this@3@00 $Ref)) (!
  (getField%stateless this@3@00)
  :pattern ((getField%limited s@$ this@3@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (this@3@00 $Ref)) (!
  (and
    (forall ((x@8@00 $Ref)) (!
      (=>
        (Set_in x@8@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first s@$)))
        (and
          (= (inv@9@00 s@$ this@3@00 x@8@00) x@8@00)
          (img@10@00 s@$ this@3@00 x@8@00)))
      :pattern ((Set_in x@8@00 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first s@$))))
      :pattern ((inv@9@00 s@$ this@3@00 x@8@00))
      :pattern ((img@10@00 s@$ this@3@00 x@8@00))
      :qid |quant-u-9|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@10@00 s@$ this@3@00 r)
          (Set_in (inv@9@00 s@$ this@3@00 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first s@$))))
        (= (inv@9@00 s@$ this@3@00 r) r))
      :pattern ((inv@9@00 s@$ this@3@00 r))
      :qid |fld-fctOfInv|))
    (=>
      (getField%precondition s@$ this@3@00)
      (=
        (getField s@$ this@3@00)
        ($FVF.lookup_fld ($SortWrappers.$SnapTo$FVF<fld> ($Snap.first ($Snap.second s@$))) this@3@00))))
  :pattern ((getField s@$ this@3@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (this@3@00 $Ref)) (!
  true
  :pattern ((getField s@$ this@3@00))
  :qid |quant-u-11|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- foo ----------
(declare-const this@0@01 $Ref)
(declare-const this@1@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01))))
(assert (not (= this@1@01 $Ref.null)))
(assert (=
  ($Snap.second $t@2@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@2@01))
    ($Snap.second ($Snap.second $t@2@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@2@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@2@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@2@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@2@01))) $Snap.unit))
; [eval] (this in this.col)
(assert (Set_in this@1@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@2@01))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@2@01))) $Snap.unit))
; [eval] getField(this) == 5
; [eval] getField(this)
(push) ; 2
; [eval] (this in this.col)
(assert (getField%precondition ($Snap.combine
  ($Snap.first $t@2@01)
  ($Snap.combine ($Snap.first ($Snap.second $t@2@01)) $Snap.unit)) this@1@01))
(pop) ; 2
; Joined path conditions
(assert (getField%precondition ($Snap.combine
  ($Snap.first $t@2@01)
  ($Snap.combine ($Snap.first ($Snap.second $t@2@01)) $Snap.unit)) this@1@01))
(assert (=
  (getField ($Snap.combine
    ($Snap.first $t@2@01)
    ($Snap.combine ($Snap.first ($Snap.second $t@2@01)) $Snap.unit)) this@1@01)
  5))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(inv(this.col), write)
(declare-const x@3@01 $Ref)
(push) ; 3
; [eval] (x in collection)
(assert (Set_in x@3@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@2@01))))
(pop) ; 3
(declare-fun inv@4@01 ($Ref) $Ref)
(declare-fun img@5@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@3@01 $Ref) (x2@3@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@3@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@2@01)))
      (Set_in x2@3@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@2@01)))
      (= x1@3@01 x2@3@01))
    (= x1@3@01 x2@3@01))
  
  :qid |fld-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@3@01 $Ref)) (!
  (=>
    (Set_in x@3@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@2@01)))
    (and (= (inv@4@01 x@3@01) x@3@01) (img@5@01 x@3@01)))
  :pattern ((Set_in x@3@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@2@01))))
  :pattern ((inv@4@01 x@3@01))
  :pattern ((img@5@01 x@3@01))
  :qid |quant-u-15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@5@01 r)
      (Set_in (inv@4@01 r) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@2@01))))
    (= (inv@4@01 r) r))
  :pattern ((inv@4@01 r))
  :qid |fld-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@3@01 $Ref)) (!
  (=>
    (Set_in x@3@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@2@01)))
    (not (= x@3@01 $Ref.null)))
  :pattern ((Set_in x@3@01 ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@2@01))))
  :pattern ((inv@4@01 x@3@01))
  :pattern ((img@5@01 x@3@01))
  :qid |fld-permImpliesNonNull|)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (inv%trigger ($Snap.first ($Snap.second $t@2@01)) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@2@01))))
; [exec]
; assert this.fld == 5
; [eval] this.fld == 5
(set-option :timeout 0)
(push) ; 3
(assert (not (and
  (img@5@01 this@1@01)
  (Set_in (inv@4@01 this@1@01) ($SortWrappers.$SnapToSet<$Ref> ($Snap.first $t@2@01))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (=
  ($FVF.lookup_fld ($SortWrappers.$SnapTo$FVF<fld> ($Snap.first ($Snap.second $t@2@01))) this@1@01)
  5)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($FVF.lookup_fld ($SortWrappers.$SnapTo$FVF<fld> ($Snap.first ($Snap.second $t@2@01))) this@1@01)
  5))
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
(declare-const x@6@01 $Ref)
(declare-const xs@7@01 Set<$Ref>)
(declare-const x@8@01 $Ref)
(declare-const xs@9@01 Set<$Ref>)
(push) ; 1
(declare-const $t@10@01 $Snap)
(assert (= $t@10@01 ($Snap.combine ($Snap.first $t@10@01) ($Snap.second $t@10@01))))
(declare-const y@11@01 $Ref)
(push) ; 2
; [eval] (y in xs)
(assert (Set_in y@11@01 xs@9@01))
(pop) ; 2
(declare-fun inv@12@01 ($Ref) $Ref)
(declare-fun img@13@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((y1@11@01 $Ref) (y2@11@01 $Ref)) (!
  (=>
    (and
      (Set_in y1@11@01 xs@9@01)
      (Set_in y2@11@01 xs@9@01)
      (= y1@11@01 y2@11@01))
    (= y1@11@01 y2@11@01))
  
  :qid |fld-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((y@11@01 $Ref)) (!
  (=>
    (Set_in y@11@01 xs@9@01)
    (and (= (inv@12@01 y@11@01) y@11@01) (img@13@01 y@11@01)))
  :pattern ((Set_in y@11@01 xs@9@01))
  :pattern ((inv@12@01 y@11@01))
  :pattern ((img@13@01 y@11@01))
  :qid |quant-u-17|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@13@01 r) (Set_in (inv@12@01 r) xs@9@01)) (= (inv@12@01 r) r))
  :pattern ((inv@12@01 r))
  :qid |fld-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((y@11@01 $Ref)) (!
  (=> (Set_in y@11@01 xs@9@01) (not (= y@11@01 $Ref.null)))
  :pattern ((Set_in y@11@01 xs@9@01))
  :pattern ((inv@12@01 y@11@01))
  :pattern ((img@13@01 y@11@01))
  :qid |fld-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@10@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@10@01))
    ($Snap.second ($Snap.second $t@10@01)))))
(assert (= ($Snap.first ($Snap.second $t@10@01)) $Snap.unit))
; [eval] (x in xs)
(assert (Set_in x@8@01 xs@9@01))
(assert (= ($Snap.second ($Snap.second $t@10@01)) $Snap.unit))
; [eval] x.fld == 0
(push) ; 2
(assert (not (and (img@13@01 x@8@01) (Set_in (inv@12@01 x@8@01) xs@9@01))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($FVF.lookup_fld ($SortWrappers.$SnapTo$FVF<fld> ($Snap.first $t@10@01)) x@8@01)
  0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; fold acc(inv(xs), write)
(declare-const x@14@01 $Ref)
(push) ; 3
; [eval] (x in collection)
(assert (Set_in x@14@01 xs@9@01))
(pop) ; 3
(declare-fun inv@15@01 ($Ref) $Ref)
(declare-fun img@16@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@14@01 $Ref) (x2@14@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@14@01 xs@9@01)
      (Set_in x2@14@01 xs@9@01)
      (= x1@14@01 x2@14@01))
    (= x1@14@01 x2@14@01))
  
  :qid |fld-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@14@01 $Ref)) (!
  (=>
    (Set_in x@14@01 xs@9@01)
    (and (= (inv@15@01 x@14@01) x@14@01) (img@16@01 x@14@01)))
  :pattern ((Set_in x@14@01 xs@9@01))
  :pattern ((inv@15@01 x@14@01))
  :pattern ((img@16@01 x@14@01))
  :qid |fld-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@16@01 r) (Set_in (inv@15@01 r) xs@9@01)) (= (inv@15@01 r) r))
  :pattern ((inv@15@01 r))
  :qid |fld-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@17@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@15@01 r) xs@9@01) (img@16@01 r) (= r (inv@15@01 r)))
    ($Perm.min
      (ite
        (and (img@13@01 r) (Set_in (inv@12@01 r) xs@9@01))
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
        (and (img@13@01 r) (Set_in (inv@12@01 r) xs@9@01))
        $Perm.Write
        $Perm.No)
      (pTaken@17@01 r))
    $Perm.No)
  
  :qid |quant-u-20|))))
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
    (and (Set_in (inv@15@01 r) xs@9@01) (img@16@01 r) (= r (inv@15@01 r)))
    (= (- $Perm.Write (pTaken@17@01 r)) $Perm.No))
  
  :qid |quant-u-21|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@18@01 $FVF<fld>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_fld (as sm@18@01  $FVF<fld>)))
      (and (Set_in (inv@15@01 r) xs@9@01) (img@16@01 r)))
    (=>
      (and (Set_in (inv@15@01 r) xs@9@01) (img@16@01 r))
      (Set_in r ($FVF.domain_fld (as sm@18@01  $FVF<fld>)))))
  :pattern ((Set_in r ($FVF.domain_fld (as sm@18@01  $FVF<fld>))))
  :qid |qp.fvfDomDef1|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@15@01 r) xs@9@01) (img@16@01 r))
      (and (img@13@01 r) (Set_in (inv@12@01 r) xs@9@01)))
    (=
      ($FVF.lookup_fld (as sm@18@01  $FVF<fld>) r)
      ($FVF.lookup_fld ($SortWrappers.$SnapTo$FVF<fld> ($Snap.first $t@10@01)) r)))
  :pattern (($FVF.lookup_fld (as sm@18@01  $FVF<fld>) r))
  :pattern (($FVF.lookup_fld ($SortWrappers.$SnapTo$FVF<fld> ($Snap.first $t@10@01)) r))
  :qid |qp.fvfValDef0|)))
(assert (inv%trigger ($SortWrappers.$FVF<fld>To$Snap (as sm@18@01  $FVF<fld>)) xs@9@01))
; [exec]
; unfold acc(inv(xs), write)
(declare-const x@19@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in collection)
(assert (Set_in x@19@01 xs@9@01))
(pop) ; 3
(declare-fun inv@20@01 ($Ref) $Ref)
(declare-fun img@21@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@19@01 $Ref) (x2@19@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@19@01 xs@9@01)
      (Set_in x2@19@01 xs@9@01)
      (= x1@19@01 x2@19@01))
    (= x1@19@01 x2@19@01))
  
  :qid |fld-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@19@01 $Ref)) (!
  (=>
    (Set_in x@19@01 xs@9@01)
    (and (= (inv@20@01 x@19@01) x@19@01) (img@21@01 x@19@01)))
  :pattern ((Set_in x@19@01 xs@9@01))
  :pattern ((inv@20@01 x@19@01))
  :pattern ((img@21@01 x@19@01))
  :qid |quant-u-23|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@21@01 r) (Set_in (inv@20@01 r) xs@9@01)) (= (inv@20@01 r) r))
  :pattern ((inv@20@01 r))
  :qid |fld-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@19@01 $Ref)) (!
  (=> (Set_in x@19@01 xs@9@01) (not (= x@19@01 $Ref.null)))
  :pattern ((Set_in x@19@01 xs@9@01))
  :pattern ((inv@20@01 x@19@01))
  :pattern ((img@21@01 x@19@01))
  :qid |fld-permImpliesNonNull|)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; assert x.fld == 0
; [eval] x.fld == 0
(set-option :timeout 0)
(push) ; 3
(assert (not (and (img@21@01 x@8@01) (Set_in (inv@20@01 x@8@01) xs@9@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (= ($FVF.lookup_fld (as sm@18@01  $FVF<fld>) x@8@01) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= ($FVF.lookup_fld (as sm@18@01  $FVF<fld>) x@8@01) 0))
(pop) ; 2
(pop) ; 1
; ---------- test01 ----------
(declare-const xs@22@01 Set<$Ref>)
(declare-const y@23@01 $Ref)
(declare-const xs@24@01 Set<$Ref>)
(declare-const y@25@01 $Ref)
(push) ; 1
(declare-const $t@26@01 $Snap)
(assert (= $t@26@01 ($Snap.combine ($Snap.first $t@26@01) ($Snap.second $t@26@01))))
(assert (=
  ($Snap.second $t@26@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@26@01))
    ($Snap.second ($Snap.second $t@26@01)))))
(assert (= ($Snap.first ($Snap.second $t@26@01)) $Snap.unit))
; [eval] (y in xs)
(assert (Set_in y@25@01 xs@24@01))
(assert (= ($Snap.second ($Snap.second $t@26@01)) $Snap.unit))
; [eval] getField01(xs, y) == 5
; [eval] getField01(xs, y)
(push) ; 2
; [eval] (y in xs)
(assert (getField01%precondition ($Snap.combine ($Snap.first $t@26@01) $Snap.unit) xs@24@01 y@25@01))
(pop) ; 2
; Joined path conditions
(assert (getField01%precondition ($Snap.combine ($Snap.first $t@26@01) $Snap.unit) xs@24@01 y@25@01))
(assert (=
  (getField01 ($Snap.combine ($Snap.first $t@26@01) $Snap.unit) xs@24@01 y@25@01)
  5))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(inv(xs), write)
(declare-const x@27@01 $Ref)
(push) ; 3
; [eval] (x in collection)
(assert (Set_in x@27@01 xs@24@01))
(pop) ; 3
(declare-fun inv@28@01 ($Ref) $Ref)
(declare-fun img@29@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@27@01 $Ref) (x2@27@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@27@01 xs@24@01)
      (Set_in x2@27@01 xs@24@01)
      (= x1@27@01 x2@27@01))
    (= x1@27@01 x2@27@01))
  
  :qid |fld-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@27@01 $Ref)) (!
  (=>
    (Set_in x@27@01 xs@24@01)
    (and (= (inv@28@01 x@27@01) x@27@01) (img@29@01 x@27@01)))
  :pattern ((Set_in x@27@01 xs@24@01))
  :pattern ((inv@28@01 x@27@01))
  :pattern ((img@29@01 x@27@01))
  :qid |quant-u-25|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@29@01 r) (Set_in (inv@28@01 r) xs@24@01)) (= (inv@28@01 r) r))
  :pattern ((inv@28@01 r))
  :qid |fld-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@27@01 $Ref)) (!
  (=> (Set_in x@27@01 xs@24@01) (not (= x@27@01 $Ref.null)))
  :pattern ((Set_in x@27@01 xs@24@01))
  :pattern ((inv@28@01 x@27@01))
  :pattern ((img@29@01 x@27@01))
  :qid |fld-permImpliesNonNull|)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (inv%trigger ($Snap.first $t@26@01) xs@24@01))
; [exec]
; assert y.fld == 5
; [eval] y.fld == 5
(set-option :timeout 0)
(push) ; 3
(assert (not (and (img@29@01 y@25@01) (Set_in (inv@28@01 y@25@01) xs@24@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (=
  ($FVF.lookup_fld ($SortWrappers.$SnapTo$FVF<fld> ($Snap.first $t@26@01)) y@25@01)
  5)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($FVF.lookup_fld ($SortWrappers.$SnapTo$FVF<fld> ($Snap.first $t@26@01)) y@25@01)
  5))
(pop) ; 2
(pop) ; 1
