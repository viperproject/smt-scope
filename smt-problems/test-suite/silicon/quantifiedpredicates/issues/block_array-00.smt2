(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:25:22
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpredicates/issues/block_array.vpr
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
(declare-sort Set<Int> 0)
(declare-sort Set<$Ref> 0)
(declare-sort Set<$Snap> 0)
(declare-sort IArray 0)
(declare-sort $FVF<val> 0)
(declare-sort $PSF<access> 0)
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
(declare-fun $SortWrappers.IArrayTo$Snap (IArray) $Snap)
(declare-fun $SortWrappers.$SnapToIArray ($Snap) IArray)
(assert (forall ((x IArray)) (!
    (= x ($SortWrappers.$SnapToIArray($SortWrappers.IArrayTo$Snap x)))
    :pattern (($SortWrappers.IArrayTo$Snap x))
    :qid |$Snap.$SnapToIArrayTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.IArrayTo$Snap($SortWrappers.$SnapToIArray x)))
    :pattern (($SortWrappers.$SnapToIArray x))
    :qid |$Snap.IArrayTo$SnapToIArray|
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
; Declaring additional sort wrappers
(declare-fun $SortWrappers.$PSF<access>To$Snap ($PSF<access>) $Snap)
(declare-fun $SortWrappers.$SnapTo$PSF<access> ($Snap) $PSF<access>)
(assert (forall ((x $PSF<access>)) (!
    (= x ($SortWrappers.$SnapTo$PSF<access>($SortWrappers.$PSF<access>To$Snap x)))
    :pattern (($SortWrappers.$PSF<access>To$Snap x))
    :qid |$Snap.$SnapTo$PSF<access>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$PSF<access>To$Snap($SortWrappers.$SnapTo$PSF<access> x)))
    :pattern (($SortWrappers.$SnapTo$PSF<access> x))
    :qid |$Snap.$PSF<access>To$SnapTo$PSF<access>|
    )))
; ////////// Symbols
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
(declare-fun loc<Ref> (IArray Int) $Ref)
(declare-fun len<Int> (IArray) Int)
(declare-fun first<IArray> ($Ref) IArray)
(declare-fun second<Int> ($Ref) Int)
; /field_value_functions_declarations.smt2 [val: Int]
(declare-fun $FVF.domain_val ($FVF<val>) Set<$Ref>)
(declare-fun $FVF.lookup_val ($FVF<val> $Ref) Int)
(declare-fun $FVF.after_val ($FVF<val> $FVF<val>) Bool)
(declare-fun $FVF.loc_val (Int $Ref) Bool)
(declare-fun $FVF.perm_val ($FPM $Ref) $Perm)
(declare-const $fvfTOP_val $FVF<val>)
; /predicate_snap_functions_declarations.smt2 [access: Snap]
(declare-fun $PSF.domain_access ($PSF<access>) Set<$Snap>)
(declare-fun $PSF.lookup_access ($PSF<access> $Snap) $Snap)
(declare-fun $PSF.after_access ($PSF<access> $PSF<access>) Bool)
(declare-fun $PSF.loc_access ($Snap $Snap) Bool)
(declare-fun $PSF.perm_access ($PPM $Snap) $Perm)
(declare-const $psfTOP_access $PSF<access>)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun access%trigger ($Snap IArray Int) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
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
(assert (forall ((a IArray) (i Int)) (!
  (and (= (first<IArray> (loc<Ref> a i)) a) (= (second<Int> (loc<Ref> a i)) i))
  :pattern ((loc<Ref> a i))
  :qid |prog.all_diff|)))
(assert (forall ((a IArray)) (!
  (>= (len<Int> a) 0)
  :pattern ((len<Int> a))
  :qid |prog.len_nonneg|)))
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
; /predicate_snap_functions_axioms.smt2 [access: Snap]
(assert (forall ((vs $PSF<access>) (ws $PSF<access>)) (!
    (=>
      (and
        (Set_equal ($PSF.domain_access vs) ($PSF.domain_access ws))
        (forall ((x $Snap)) (!
          (=>
            (Set_in x ($PSF.domain_access vs))
            (= ($PSF.lookup_access vs x) ($PSF.lookup_access ws x)))
          :pattern (($PSF.lookup_access vs x) ($PSF.lookup_access ws x))
          :qid |qp.$PSF<access>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$PSF<access>To$Snap vs)
              ($SortWrappers.$PSF<access>To$Snap ws)
              )
    :qid |qp.$PSF<access>-eq-outer|
    )))
(assert (forall ((s $Snap) (pm $PPM)) (!
    ($Perm.isValidVar ($PSF.perm_access pm s))
    :pattern (($PSF.perm_access pm s)))))
(assert (forall ((s $Snap) (f $Snap)) (!
    (= ($PSF.loc_access f s) true)
    :pattern (($PSF.loc_access f s)))))
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
; ---------- readTwo ----------
(declare-const a@0@01 IArray)
(declare-const i@1@01 Int)
(declare-const sum@2@01 Int)
(declare-const a@3@01 IArray)
(declare-const i@4@01 Int)
(declare-const sum@5@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 ($Snap.combine ($Snap.first $t@6@01) ($Snap.second $t@6@01))))
(assert (= ($Snap.second $t@6@01) $Snap.unit))
; [eval] i % 2 == 0
; [eval] i % 2
(assert (= (mod i@4@01 2) 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(access(a, i), write)
; [eval] i % 2 == 0
; [eval] i % 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= (mod i@4@01 2) 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | i@4@01 % 2 == 0 | live]
; [else-branch: 0 | i@4@01 % 2 != 0 | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | i@4@01 % 2 == 0]
(assert (=
  ($Snap.first $t@6@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@6@01))
    ($Snap.second ($Snap.first $t@6@01)))))
; [eval] loc(a, i)
(assert (not (= (loc<Ref> a@3@01 i@4@01) $Ref.null)))
; [eval] loc(a, i + 1)
; [eval] i + 1
(push) ; 4
(set-option :timeout 10)
(assert (not (= (loc<Ref> a@3@01 i@4@01) (loc<Ref> a@3@01 (+ i@4@01 1)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not (= (loc<Ref> a@3@01 (+ i@4@01 1)) $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (access%trigger ($Snap.first $t@6@01) a@3@01 i@4@01))
; [exec]
; sum := loc(a, i).val + loc(a, i + 1).val
; [eval] loc(a, i).val + loc(a, i + 1).val
; [eval] loc(a, i)
; [eval] loc(a, i + 1)
; [eval] i + 1
(declare-const sum@7@01 Int)
(assert (=
  sum@7@01
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01)))
    ($SortWrappers.$SnapToInt ($Snap.second ($Snap.first $t@6@01))))))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- totalSum ----------
(declare-const a@8@01 IArray)
(declare-const i@9@01 Int)
(declare-const sum@10@01 Int)
(declare-const a@11@01 IArray)
(declare-const i@12@01 Int)
(declare-const sum@13@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@14@01 $Snap)
(assert (= $t@14@01 ($Snap.combine ($Snap.first $t@14@01) ($Snap.second $t@14@01))))
(assert (= ($Snap.first $t@14@01) $Snap.unit))
; [eval] i >= 0
(assert (>= i@12@01 0))
(assert (=
  ($Snap.second $t@14@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@14@01))
    ($Snap.second ($Snap.second $t@14@01)))))
(assert (= ($Snap.first ($Snap.second $t@14@01)) $Snap.unit))
; [eval] i + 1 < len(a)
; [eval] i + 1
; [eval] len(a)
(assert (< (+ i@12@01 1) (len<Int> a@11@01)))
(assert (=
  ($Snap.second ($Snap.second $t@14@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@14@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@14@01))) $Snap.unit))
; [eval] i % 2 == 0
; [eval] i % 2
(assert (= (mod i@12@01 2) 0))
(declare-const j@15@01 Int)
(push) ; 2
; [eval] j >= 0 && (j < len(a) && j % 2 == 0)
; [eval] j >= 0
(push) ; 3
; [then-branch: 1 | !(j@15@01 >= 0) | live]
; [else-branch: 1 | j@15@01 >= 0 | live]
(push) ; 4
; [then-branch: 1 | !(j@15@01 >= 0)]
(assert (not (>= j@15@01 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 1 | j@15@01 >= 0]
(assert (>= j@15@01 0))
; [eval] j < len(a)
; [eval] len(a)
(push) ; 5
; [then-branch: 2 | !(j@15@01 < len[Int](a@11@01)) | live]
; [else-branch: 2 | j@15@01 < len[Int](a@11@01) | live]
(push) ; 6
; [then-branch: 2 | !(j@15@01 < len[Int](a@11@01))]
(assert (not (< j@15@01 (len<Int> a@11@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 2 | j@15@01 < len[Int](a@11@01)]
(assert (< j@15@01 (len<Int> a@11@01)))
; [eval] j % 2 == 0
; [eval] j % 2
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (< j@15@01 (len<Int> a@11@01)) (not (< j@15@01 (len<Int> a@11@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@15@01 0)
  (and
    (>= j@15@01 0)
    (or (< j@15@01 (len<Int> a@11@01)) (not (< j@15@01 (len<Int> a@11@01)))))))
(assert (or (>= j@15@01 0) (not (>= j@15@01 0))))
(assert (and (>= j@15@01 0) (and (< j@15@01 (len<Int> a@11@01)) (= (mod j@15@01 2) 0))))
(pop) ; 2
(declare-fun inv@16@01 (IArray Int) Int)
(declare-fun img@17@01 (IArray Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@15@01 Int)) (!
  (=>
    (and
      (>= j@15@01 0)
      (and (< j@15@01 (len<Int> a@11@01)) (= (mod j@15@01 2) 0)))
    (and
      (=>
        (>= j@15@01 0)
        (and
          (>= j@15@01 0)
          (or
            (< j@15@01 (len<Int> a@11@01))
            (not (< j@15@01 (len<Int> a@11@01))))))
      (or (>= j@15@01 0) (not (>= j@15@01 0)))))
  :pattern ((inv@16@01 a@11@01 j@15@01))
  :pattern ((img@17@01 a@11@01 j@15@01))
  :qid |access-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((j1@15@01 Int) (j2@15@01 Int)) (!
  (=>
    (and
      (and
        (>= j1@15@01 0)
        (and (< j1@15@01 (len<Int> a@11@01)) (= (mod j1@15@01 2) 0)))
      (and
        (>= j2@15@01 0)
        (and (< j2@15@01 (len<Int> a@11@01)) (= (mod j2@15@01 2) 0)))
      (= j1@15@01 j2@15@01))
    (= j1@15@01 j2@15@01))
  
  :qid |access-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@15@01 Int)) (!
  (=>
    (and
      (>= j@15@01 0)
      (and (< j@15@01 (len<Int> a@11@01)) (= (mod j@15@01 2) 0)))
    (and (= (inv@16@01 a@11@01 j@15@01) j@15@01) (img@17@01 a@11@01 j@15@01)))
  :pattern ((inv@16@01 a@11@01 j@15@01))
  :pattern ((img@17@01 a@11@01 j@15@01))
  :qid |quant-u-1|)))
(assert (forall ((a IArray) (i Int)) (!
  (=>
    (and
      (img@17@01 a i)
      (and
        (>= (inv@16@01 a i) 0)
        (and
          (< (inv@16@01 a i) (len<Int> a@11@01))
          (= (mod (inv@16@01 a i) 2) 0))))
    (and (= a@11@01 a) (= (inv@16@01 a i) i)))
  :pattern ((inv@16@01 a i))
  :qid |access-fctOfInv|)))
; Permissions are non-negative
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@18@01 $Snap)
(assert (= $t@18@01 ($Snap.combine ($Snap.first $t@18@01) ($Snap.second $t@18@01))))
(assert (= ($Snap.first $t@18@01) $Snap.unit))
; [eval] i >= 0
(assert (=
  ($Snap.second $t@18@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@18@01))
    ($Snap.second ($Snap.second $t@18@01)))))
(assert (= ($Snap.first ($Snap.second $t@18@01)) $Snap.unit))
; [eval] i <= len(a)
; [eval] len(a)
(assert (<= i@12@01 (len<Int> a@11@01)))
(declare-const j@19@01 Int)
(push) ; 3
; [eval] j >= 0 && (j < len(a) && j % 2 == 0)
; [eval] j >= 0
(push) ; 4
; [then-branch: 3 | !(j@19@01 >= 0) | live]
; [else-branch: 3 | j@19@01 >= 0 | live]
(push) ; 5
; [then-branch: 3 | !(j@19@01 >= 0)]
(assert (not (>= j@19@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 3 | j@19@01 >= 0]
(assert (>= j@19@01 0))
; [eval] j < len(a)
; [eval] len(a)
(push) ; 6
; [then-branch: 4 | !(j@19@01 < len[Int](a@11@01)) | live]
; [else-branch: 4 | j@19@01 < len[Int](a@11@01) | live]
(push) ; 7
; [then-branch: 4 | !(j@19@01 < len[Int](a@11@01))]
(assert (not (< j@19@01 (len<Int> a@11@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 4 | j@19@01 < len[Int](a@11@01)]
(assert (< j@19@01 (len<Int> a@11@01)))
; [eval] j % 2 == 0
; [eval] j % 2
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (< j@19@01 (len<Int> a@11@01)) (not (< j@19@01 (len<Int> a@11@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@19@01 0)
  (and
    (>= j@19@01 0)
    (or (< j@19@01 (len<Int> a@11@01)) (not (< j@19@01 (len<Int> a@11@01)))))))
(assert (or (>= j@19@01 0) (not (>= j@19@01 0))))
(assert (and (>= j@19@01 0) (and (< j@19@01 (len<Int> a@11@01)) (= (mod j@19@01 2) 0))))
(pop) ; 3
(declare-fun inv@20@01 (IArray Int) Int)
(declare-fun img@21@01 (IArray Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@19@01 Int)) (!
  (=>
    (and
      (>= j@19@01 0)
      (and (< j@19@01 (len<Int> a@11@01)) (= (mod j@19@01 2) 0)))
    (and
      (=>
        (>= j@19@01 0)
        (and
          (>= j@19@01 0)
          (or
            (< j@19@01 (len<Int> a@11@01))
            (not (< j@19@01 (len<Int> a@11@01))))))
      (or (>= j@19@01 0) (not (>= j@19@01 0)))))
  :pattern ((inv@20@01 a@11@01 j@19@01))
  :pattern ((img@21@01 a@11@01 j@19@01))
  :qid |access-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@19@01 Int) (j2@19@01 Int)) (!
  (=>
    (and
      (and
        (>= j1@19@01 0)
        (and (< j1@19@01 (len<Int> a@11@01)) (= (mod j1@19@01 2) 0)))
      (and
        (>= j2@19@01 0)
        (and (< j2@19@01 (len<Int> a@11@01)) (= (mod j2@19@01 2) 0)))
      (= j1@19@01 j2@19@01))
    (= j1@19@01 j2@19@01))
  
  :qid |access-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@19@01 Int)) (!
  (=>
    (and
      (>= j@19@01 0)
      (and (< j@19@01 (len<Int> a@11@01)) (= (mod j@19@01 2) 0)))
    (and (= (inv@20@01 a@11@01 j@19@01) j@19@01) (img@21@01 a@11@01 j@19@01)))
  :pattern ((inv@20@01 a@11@01 j@19@01))
  :pattern ((img@21@01 a@11@01 j@19@01))
  :qid |quant-u-3|)))
(assert (forall ((a IArray) (i Int)) (!
  (=>
    (and
      (img@21@01 a i)
      (and
        (>= (inv@20@01 a i) 0)
        (and
          (< (inv@20@01 a i) (len<Int> a@11@01))
          (= (mod (inv@20@01 a i) 2) 0))))
    (and (= a@11@01 a) (= (inv@20@01 a i) i)))
  :pattern ((inv@20@01 a i))
  :qid |access-fctOfInv|)))
; Permissions are non-negative
(pop) ; 2
(push) ; 2
; [eval] i + 3 < len(a)
; [eval] i + 3
; [eval] len(a)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (< (+ i@12@01 3) (len<Int> a@11@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< (+ i@12@01 3) (len<Int> a@11@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | i@12@01 + 3 < len[Int](a@11@01) | live]
; [else-branch: 5 | !(i@12@01 + 3 < len[Int](a@11@01)) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 5 | i@12@01 + 3 < len[Int](a@11@01)]
(assert (< (+ i@12@01 3) (len<Int> a@11@01)))
; [exec]
; sum := totalSum(a, i + 2)
; [eval] i + 2
; [eval] i >= 0
(push) ; 4
(assert (not (>= (+ i@12@01 2) 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (>= (+ i@12@01 2) 0))
; [eval] i + 1 < len(a)
; [eval] i + 1
; [eval] len(a)
(push) ; 4
(assert (not (< (+ (+ i@12@01 2) 1) (len<Int> a@11@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< (+ (+ i@12@01 2) 1) (len<Int> a@11@01)))
; [eval] i % 2 == 0
; [eval] i % 2
(push) ; 4
(assert (not (= (mod (+ i@12@01 2) 2) 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (= (mod (+ i@12@01 2) 2) 0))
(declare-const j@22@01 Int)
(push) ; 4
; [eval] j >= 0 && (j < len(a) && j % 2 == 0)
; [eval] j >= 0
(push) ; 5
; [then-branch: 6 | !(j@22@01 >= 0) | live]
; [else-branch: 6 | j@22@01 >= 0 | live]
(push) ; 6
; [then-branch: 6 | !(j@22@01 >= 0)]
(assert (not (>= j@22@01 0)))
(pop) ; 6
(push) ; 6
; [else-branch: 6 | j@22@01 >= 0]
(assert (>= j@22@01 0))
; [eval] j < len(a)
; [eval] len(a)
(push) ; 7
; [then-branch: 7 | !(j@22@01 < len[Int](a@11@01)) | live]
; [else-branch: 7 | j@22@01 < len[Int](a@11@01) | live]
(push) ; 8
; [then-branch: 7 | !(j@22@01 < len[Int](a@11@01))]
(assert (not (< j@22@01 (len<Int> a@11@01))))
(pop) ; 8
(push) ; 8
; [else-branch: 7 | j@22@01 < len[Int](a@11@01)]
(assert (< j@22@01 (len<Int> a@11@01)))
; [eval] j % 2 == 0
; [eval] j % 2
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or (< j@22@01 (len<Int> a@11@01)) (not (< j@22@01 (len<Int> a@11@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@22@01 0)
  (and
    (>= j@22@01 0)
    (or (< j@22@01 (len<Int> a@11@01)) (not (< j@22@01 (len<Int> a@11@01)))))))
(assert (or (>= j@22@01 0) (not (>= j@22@01 0))))
(assert (and (>= j@22@01 0) (and (< j@22@01 (len<Int> a@11@01)) (= (mod j@22@01 2) 0))))
(pop) ; 4
(declare-fun inv@23@01 (IArray Int) Int)
(declare-fun img@24@01 (IArray Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@22@01 Int)) (!
  (=>
    (and
      (>= j@22@01 0)
      (and (< j@22@01 (len<Int> a@11@01)) (= (mod j@22@01 2) 0)))
    (and
      (=>
        (>= j@22@01 0)
        (and
          (>= j@22@01 0)
          (or
            (< j@22@01 (len<Int> a@11@01))
            (not (< j@22@01 (len<Int> a@11@01))))))
      (or (>= j@22@01 0) (not (>= j@22@01 0)))))
  :pattern ((inv@23@01 a@11@01 j@22@01))
  :pattern ((img@24@01 a@11@01 j@22@01))
  :qid |access-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((j1@22@01 Int) (j2@22@01 Int)) (!
  (=>
    (and
      (and
        (>= j1@22@01 0)
        (and (< j1@22@01 (len<Int> a@11@01)) (= (mod j1@22@01 2) 0)))
      (and
        (>= j2@22@01 0)
        (and (< j2@22@01 (len<Int> a@11@01)) (= (mod j2@22@01 2) 0)))
      (= j1@22@01 j2@22@01))
    (= j1@22@01 j2@22@01))
  
  :qid |access-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@22@01 Int)) (!
  (=>
    (and
      (>= j@22@01 0)
      (and (< j@22@01 (len<Int> a@11@01)) (= (mod j@22@01 2) 0)))
    (and (= (inv@23@01 a@11@01 j@22@01) j@22@01) (img@24@01 a@11@01 j@22@01)))
  :pattern ((inv@23@01 a@11@01 j@22@01))
  :pattern ((img@24@01 a@11@01 j@22@01))
  :qid |access-invOfFct|)))
(assert (forall ((a IArray) (i Int)) (!
  (=>
    (and
      (img@24@01 a i)
      (and
        (>= (inv@23@01 a i) 0)
        (and
          (< (inv@23@01 a i) (len<Int> a@11@01))
          (= (mod (inv@23@01 a i) 2) 0))))
    (and (= a@11@01 a) (= (inv@23@01 a i) i)))
  :pattern ((inv@23@01 a i))
  :qid |access-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@25@01 ((a IArray) (i Int)) $Perm
  (ite
    (and
      (and
        (>= (inv@23@01 a i) 0)
        (and
          (< (inv@23@01 a i) (len<Int> a@11@01))
          (= (mod (inv@23@01 a i) 2) 0)))
      (img@24@01 a i)
      (and (= a a@11@01) (= i (inv@23@01 a i))))
    ($Perm.min
      (ite
        (and
          (img@17@01 a i)
          (and
            (>= (inv@16@01 a i) 0)
            (and
              (< (inv@16@01 a i) (len<Int> a@11@01))
              (= (mod (inv@16@01 a i) 2) 0))))
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
(assert (not (forall ((a IArray) (i Int)) (!
  (=
    (-
      (ite
        (and
          (img@17@01 a i)
          (and
            (>= (inv@16@01 a i) 0)
            (and
              (< (inv@16@01 a i) (len<Int> a@11@01))
              (= (mod (inv@16@01 a i) 2) 0))))
        $Perm.Write
        $Perm.No)
      (pTaken@25@01 a i))
    $Perm.No)
  
  :qid |quant-u-6|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=>
    (and
      (and
        (>= (inv@23@01 a i) 0)
        (and
          (< (inv@23@01 a i) (len<Int> a@11@01))
          (= (mod (inv@23@01 a i) 2) 0)))
      (img@24@01 a i)
      (and (= a a@11@01) (= i (inv@23@01 a i))))
    (= (- $Perm.Write (pTaken@25@01 a i)) $Perm.No))
  
  :qid |quant-u-7|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@26@01 $PSF<access>)
(declare-const s@27@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@27@01 $Snap)) (!
  (=>
    (and
      (img@17@01 ($SortWrappers.$SnapToIArray ($Snap.first s@27@01)) ($SortWrappers.$SnapToInt ($Snap.second s@27@01)))
      (and
        (>=
          (inv@16@01 ($SortWrappers.$SnapToIArray ($Snap.first s@27@01)) ($SortWrappers.$SnapToInt ($Snap.second s@27@01)))
          0)
        (and
          (<
            (inv@16@01 ($SortWrappers.$SnapToIArray ($Snap.first s@27@01)) ($SortWrappers.$SnapToInt ($Snap.second s@27@01)))
            (len<Int> a@11@01))
          (=
            (mod
              (inv@16@01 ($SortWrappers.$SnapToIArray ($Snap.first s@27@01)) ($SortWrappers.$SnapToInt ($Snap.second s@27@01)))
              2)
            0))))
    (and
      (not (= s@27@01 $Snap.unit))
      (=
        ($PSF.lookup_access (as sm@26@01  $PSF<access>) s@27@01)
        ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.second ($Snap.second ($Snap.second $t@14@01)))) s@27@01))))
  :pattern (($PSF.lookup_access (as sm@26@01  $PSF<access>) s@27@01))
  :pattern (($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.second ($Snap.second ($Snap.second $t@14@01)))) s@27@01))
  :qid |qp.psmValDef0|)))
(declare-const sum@28@01 Int)
(declare-const $t@29@01 $Snap)
(assert (= $t@29@01 ($Snap.combine ($Snap.first $t@29@01) ($Snap.second $t@29@01))))
(assert (= ($Snap.first $t@29@01) $Snap.unit))
; [eval] i >= 0
(assert (=
  ($Snap.second $t@29@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@29@01))
    ($Snap.second ($Snap.second $t@29@01)))))
(assert (= ($Snap.first ($Snap.second $t@29@01)) $Snap.unit))
; [eval] i <= len(a)
; [eval] len(a)
(assert (<= (+ i@12@01 2) (len<Int> a@11@01)))
(declare-const j@30@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] j >= 0 && (j < len(a) && j % 2 == 0)
; [eval] j >= 0
(push) ; 5
; [then-branch: 8 | !(j@30@01 >= 0) | live]
; [else-branch: 8 | j@30@01 >= 0 | live]
(push) ; 6
; [then-branch: 8 | !(j@30@01 >= 0)]
(assert (not (>= j@30@01 0)))
(pop) ; 6
(push) ; 6
; [else-branch: 8 | j@30@01 >= 0]
(assert (>= j@30@01 0))
; [eval] j < len(a)
; [eval] len(a)
(push) ; 7
; [then-branch: 9 | !(j@30@01 < len[Int](a@11@01)) | live]
; [else-branch: 9 | j@30@01 < len[Int](a@11@01) | live]
(push) ; 8
; [then-branch: 9 | !(j@30@01 < len[Int](a@11@01))]
(assert (not (< j@30@01 (len<Int> a@11@01))))
(pop) ; 8
(push) ; 8
; [else-branch: 9 | j@30@01 < len[Int](a@11@01)]
(assert (< j@30@01 (len<Int> a@11@01)))
; [eval] j % 2 == 0
; [eval] j % 2
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or (< j@30@01 (len<Int> a@11@01)) (not (< j@30@01 (len<Int> a@11@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@30@01 0)
  (and
    (>= j@30@01 0)
    (or (< j@30@01 (len<Int> a@11@01)) (not (< j@30@01 (len<Int> a@11@01)))))))
(assert (or (>= j@30@01 0) (not (>= j@30@01 0))))
(assert (and (>= j@30@01 0) (and (< j@30@01 (len<Int> a@11@01)) (= (mod j@30@01 2) 0))))
(pop) ; 4
(declare-fun inv@31@01 (IArray Int) Int)
(declare-fun img@32@01 (IArray Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@30@01 Int)) (!
  (=>
    (and
      (>= j@30@01 0)
      (and (< j@30@01 (len<Int> a@11@01)) (= (mod j@30@01 2) 0)))
    (and
      (=>
        (>= j@30@01 0)
        (and
          (>= j@30@01 0)
          (or
            (< j@30@01 (len<Int> a@11@01))
            (not (< j@30@01 (len<Int> a@11@01))))))
      (or (>= j@30@01 0) (not (>= j@30@01 0)))))
  :pattern ((inv@31@01 a@11@01 j@30@01))
  :pattern ((img@32@01 a@11@01 j@30@01))
  :qid |access-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((j1@30@01 Int) (j2@30@01 Int)) (!
  (=>
    (and
      (and
        (>= j1@30@01 0)
        (and (< j1@30@01 (len<Int> a@11@01)) (= (mod j1@30@01 2) 0)))
      (and
        (>= j2@30@01 0)
        (and (< j2@30@01 (len<Int> a@11@01)) (= (mod j2@30@01 2) 0)))
      (= j1@30@01 j2@30@01))
    (= j1@30@01 j2@30@01))
  
  :qid |access-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@30@01 Int)) (!
  (=>
    (and
      (>= j@30@01 0)
      (and (< j@30@01 (len<Int> a@11@01)) (= (mod j@30@01 2) 0)))
    (and (= (inv@31@01 a@11@01 j@30@01) j@30@01) (img@32@01 a@11@01 j@30@01)))
  :pattern ((inv@31@01 a@11@01 j@30@01))
  :pattern ((img@32@01 a@11@01 j@30@01))
  :qid |quant-u-9|)))
(assert (forall ((a IArray) (i Int)) (!
  (=>
    (and
      (img@32@01 a i)
      (and
        (>= (inv@31@01 a i) 0)
        (and
          (< (inv@31@01 a i) (len<Int> a@11@01))
          (= (mod (inv@31@01 a i) 2) 0))))
    (and (= a@11@01 a) (= (inv@31@01 a i) i)))
  :pattern ((inv@31@01 a i))
  :qid |access-fctOfInv|)))
; Permissions are non-negative
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; unfold acc(access(a, i), write)
; Precomputing data for removing quantified permissions
(define-fun pTaken@33@01 ((a IArray) (i Int)) $Perm
  (ite
    (and (= a a@11@01) (= i i@12@01))
    ($Perm.min
      (ite
        (and
          (img@32@01 a i)
          (and
            (>= (inv@31@01 a i) 0)
            (and
              (< (inv@31@01 a i) (len<Int> a@11@01))
              (= (mod (inv@31@01 a i) 2) 0))))
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
(assert (not (forall ((a IArray) (i Int)) (!
  (=
    (-
      (ite
        (and
          (img@32@01 a i)
          (and
            (>= (inv@31@01 a i) 0)
            (and
              (< (inv@31@01 a i) (len<Int> a@11@01))
              (= (mod (inv@31@01 a i) 2) 0))))
        $Perm.Write
        $Perm.No)
      (pTaken@33@01 a i))
    $Perm.No)
  
  :qid |quant-u-11|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((a IArray) (i Int)) (!
  (= (pTaken@33@01 a i) $Perm.No)
  
  :qid |quant-u-12|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=>
    (and (= a a@11@01) (= i i@12@01))
    (= (- $Perm.Write (pTaken@33@01 a i)) $Perm.No))
  
  :qid |quant-u-13|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@34@01 $PSF<access>)
(declare-const s@35@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@32@01 a@11@01 i@12@01)
    (and
      (>= (inv@31@01 a@11@01 i@12@01) 0)
      (and
        (< (inv@31@01 a@11@01 i@12@01) (len<Int> a@11@01))
        (= (mod (inv@31@01 a@11@01 i@12@01) 2) 0))))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@11@01)
          ($SortWrappers.IntTo$Snap i@12@01))
        $Snap.unit))
    (=
      ($PSF.lookup_access (as sm@34@01  $PSF<access>) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@11@01)
        ($SortWrappers.IntTo$Snap i@12@01)))
      ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.second ($Snap.second $t@29@01))) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@11@01)
        ($SortWrappers.IntTo$Snap i@12@01)))))))
; [eval] i % 2 == 0
; [eval] i % 2
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= (mod i@12@01 2) 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | i@12@01 % 2 == 0 | live]
; [else-branch: 10 | i@12@01 % 2 != 0 | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 10 | i@12@01 % 2 == 0]
(assert (=
  ($PSF.lookup_access (as sm@34@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@11@01)
    ($SortWrappers.IntTo$Snap i@12@01)))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_access (as sm@34@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@11@01)
      ($SortWrappers.IntTo$Snap i@12@01))))
    ($Snap.second ($PSF.lookup_access (as sm@34@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@11@01)
      ($SortWrappers.IntTo$Snap i@12@01)))))))
; [eval] loc(a, i)
(assert (not (= (loc<Ref> a@11@01 i@12@01) $Ref.null)))
; [eval] loc(a, i + 1)
; [eval] i + 1
(push) ; 5
(set-option :timeout 10)
(assert (not (= (loc<Ref> a@11@01 i@12@01) (loc<Ref> a@11@01 (+ i@12@01 1)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (not (= (loc<Ref> a@11@01 (+ i@12@01 1)) $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (access%trigger ($PSF.lookup_access (as sm@34@01  $PSF<access>) ($Snap.combine
  ($SortWrappers.IArrayTo$Snap a@11@01)
  ($SortWrappers.IntTo$Snap i@12@01))) a@11@01 i@12@01))
; [exec]
; sum := sum + loc(a, i).val + loc(a, i + 1).val
; [eval] sum + loc(a, i).val + loc(a, i + 1).val
; [eval] sum + loc(a, i).val
; [eval] loc(a, i)
; [eval] loc(a, i + 1)
; [eval] i + 1
(declare-const sum@36@01 Int)
(assert (=
  sum@36@01
  (+
    (+
      sum@28@01
      ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_access (as sm@34@01  $PSF<access>) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@11@01)
        ($SortWrappers.IntTo$Snap i@12@01))))))
    ($SortWrappers.$SnapToInt ($Snap.second ($PSF.lookup_access (as sm@34@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@11@01)
      ($SortWrappers.IntTo$Snap i@12@01))))))))
; [exec]
; fold acc(access(a, i), write)
; [eval] i % 2 == 0
; [eval] i % 2
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= (mod i@12@01 2) 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | i@12@01 % 2 == 0 | live]
; [else-branch: 11 | i@12@01 % 2 != 0 | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 11 | i@12@01 % 2 == 0]
; [eval] loc(a, i)
; [eval] loc(a, i + 1)
; [eval] i + 1
(assert (access%trigger ($Snap.combine
  ($Snap.first ($PSF.lookup_access (as sm@34@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@11@01)
    ($SortWrappers.IntTo$Snap i@12@01))))
  ($Snap.second ($PSF.lookup_access (as sm@34@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@11@01)
    ($SortWrappers.IntTo$Snap i@12@01))))) a@11@01 i@12@01))
(declare-const sm@37@01 $PSF<access>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_access (as sm@37@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@11@01)
    ($SortWrappers.IntTo$Snap i@12@01)))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_access (as sm@34@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@11@01)
      ($SortWrappers.IntTo$Snap i@12@01))))
    ($Snap.second ($PSF.lookup_access (as sm@34@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@11@01)
      ($SortWrappers.IntTo$Snap i@12@01)))))))
; [eval] i >= 0
; [eval] i <= len(a)
; [eval] len(a)
(push) ; 6
(assert (not (<= i@12@01 (len<Int> a@11@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<= i@12@01 (len<Int> a@11@01)))
(declare-const j@38@01 Int)
(push) ; 6
; [eval] j >= 0 && (j < len(a) && j % 2 == 0)
; [eval] j >= 0
(push) ; 7
; [then-branch: 12 | !(j@38@01 >= 0) | live]
; [else-branch: 12 | j@38@01 >= 0 | live]
(push) ; 8
; [then-branch: 12 | !(j@38@01 >= 0)]
(assert (not (>= j@38@01 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 12 | j@38@01 >= 0]
(assert (>= j@38@01 0))
; [eval] j < len(a)
; [eval] len(a)
(push) ; 9
; [then-branch: 13 | !(j@38@01 < len[Int](a@11@01)) | live]
; [else-branch: 13 | j@38@01 < len[Int](a@11@01) | live]
(push) ; 10
; [then-branch: 13 | !(j@38@01 < len[Int](a@11@01))]
(assert (not (< j@38@01 (len<Int> a@11@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 13 | j@38@01 < len[Int](a@11@01)]
(assert (< j@38@01 (len<Int> a@11@01)))
; [eval] j % 2 == 0
; [eval] j % 2
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< j@38@01 (len<Int> a@11@01)) (not (< j@38@01 (len<Int> a@11@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@38@01 0)
  (and
    (>= j@38@01 0)
    (or (< j@38@01 (len<Int> a@11@01)) (not (< j@38@01 (len<Int> a@11@01)))))))
(assert (or (>= j@38@01 0) (not (>= j@38@01 0))))
(assert (and (>= j@38@01 0) (and (< j@38@01 (len<Int> a@11@01)) (= (mod j@38@01 2) 0))))
(pop) ; 6
(declare-fun inv@39@01 (IArray Int) Int)
(declare-fun img@40@01 (IArray Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@38@01 Int)) (!
  (=>
    (and
      (>= j@38@01 0)
      (and (< j@38@01 (len<Int> a@11@01)) (= (mod j@38@01 2) 0)))
    (and
      (=>
        (>= j@38@01 0)
        (and
          (>= j@38@01 0)
          (or
            (< j@38@01 (len<Int> a@11@01))
            (not (< j@38@01 (len<Int> a@11@01))))))
      (or (>= j@38@01 0) (not (>= j@38@01 0)))))
  :pattern ((inv@39@01 a@11@01 j@38@01))
  :pattern ((img@40@01 a@11@01 j@38@01))
  :qid |access-aux|)))
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((j1@38@01 Int) (j2@38@01 Int)) (!
  (=>
    (and
      (and
        (>= j1@38@01 0)
        (and (< j1@38@01 (len<Int> a@11@01)) (= (mod j1@38@01 2) 0)))
      (and
        (>= j2@38@01 0)
        (and (< j2@38@01 (len<Int> a@11@01)) (= (mod j2@38@01 2) 0)))
      (= j1@38@01 j2@38@01))
    (= j1@38@01 j2@38@01))
  
  :qid |access-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@38@01 Int)) (!
  (=>
    (and
      (>= j@38@01 0)
      (and (< j@38@01 (len<Int> a@11@01)) (= (mod j@38@01 2) 0)))
    (and (= (inv@39@01 a@11@01 j@38@01) j@38@01) (img@40@01 a@11@01 j@38@01)))
  :pattern ((inv@39@01 a@11@01 j@38@01))
  :pattern ((img@40@01 a@11@01 j@38@01))
  :qid |access-invOfFct|)))
(assert (forall ((a IArray) (i Int)) (!
  (=>
    (and
      (img@40@01 a i)
      (and
        (>= (inv@39@01 a i) 0)
        (and
          (< (inv@39@01 a i) (len<Int> a@11@01))
          (= (mod (inv@39@01 a i) 2) 0))))
    (and (= a@11@01 a) (= (inv@39@01 a i) i)))
  :pattern ((inv@39@01 a i))
  :qid |access-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@41@01 ((a IArray) (i Int)) $Perm
  (ite
    (and
      (and
        (>= (inv@39@01 a i) 0)
        (and
          (< (inv@39@01 a i) (len<Int> a@11@01))
          (= (mod (inv@39@01 a i) 2) 0)))
      (img@40@01 a i)
      (and (= a a@11@01) (= i (inv@39@01 a i))))
    ($Perm.min
      (ite
        (and
          (img@32@01 a i)
          (and
            (>= (inv@31@01 a i) 0)
            (and
              (< (inv@31@01 a i) (len<Int> a@11@01))
              (= (mod (inv@31@01 a i) 2) 0))))
        (- $Perm.Write (pTaken@33@01 a i))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@42@01 ((a IArray) (i Int)) $Perm
  (ite
    (and
      (and
        (>= (inv@39@01 a i) 0)
        (and
          (< (inv@39@01 a i) (len<Int> a@11@01))
          (= (mod (inv@39@01 a i) 2) 0)))
      (img@40@01 a i)
      (and (= a a@11@01) (= i (inv@39@01 a i))))
    ($Perm.min
      (ite (and (= a a@11@01) (= i i@12@01)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@41@01 a i)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=
    (-
      (ite
        (and
          (img@32@01 a i)
          (and
            (>= (inv@31@01 a i) 0)
            (and
              (< (inv@31@01 a i) (len<Int> a@11@01))
              (= (mod (inv@31@01 a i) 2) 0))))
        (- $Perm.Write (pTaken@33@01 a i))
        $Perm.No)
      (pTaken@41@01 a i))
    $Perm.No)
  
  :qid |quant-u-16|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=>
    (and
      (and
        (>= (inv@39@01 a i) 0)
        (and
          (< (inv@39@01 a i) (len<Int> a@11@01))
          (= (mod (inv@39@01 a i) 2) 0)))
      (img@40@01 a i)
      (and (= a a@11@01) (= i (inv@39@01 a i))))
    (= (- $Perm.Write (pTaken@41@01 a i)) $Perm.No))
  
  :qid |quant-u-17|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@42@01 a@11@01 i@12@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=>
    (and
      (and
        (>= (inv@39@01 a i) 0)
        (and
          (< (inv@39@01 a i) (len<Int> a@11@01))
          (= (mod (inv@39@01 a i) 2) 0)))
      (img@40@01 a i)
      (and (= a a@11@01) (= i (inv@39@01 a i))))
    (= (- (- $Perm.Write (pTaken@41@01 a i)) (pTaken@42@01 a i)) $Perm.No))
  
  :qid |quant-u-19|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@43@01 $PSF<access>)
(declare-const s@44@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@44@01 $Snap)) (!
  (and
    (=>
      (Set_in s@44@01 ($PSF.domain_access (as sm@43@01  $PSF<access>)))
      (and
        (and
          (>=
            (inv@39@01 ($SortWrappers.$SnapToIArray ($Snap.first s@44@01)) ($SortWrappers.$SnapToInt ($Snap.second s@44@01)))
            0)
          (and
            (<
              (inv@39@01 ($SortWrappers.$SnapToIArray ($Snap.first s@44@01)) ($SortWrappers.$SnapToInt ($Snap.second s@44@01)))
              (len<Int> a@11@01))
            (=
              (mod
                (inv@39@01 ($SortWrappers.$SnapToIArray ($Snap.first s@44@01)) ($SortWrappers.$SnapToInt ($Snap.second s@44@01)))
                2)
              0)))
        (img@40@01 ($SortWrappers.$SnapToIArray ($Snap.first s@44@01)) ($SortWrappers.$SnapToInt ($Snap.second s@44@01)))))
    (=>
      (and
        (and
          (>=
            (inv@39@01 ($SortWrappers.$SnapToIArray ($Snap.first s@44@01)) ($SortWrappers.$SnapToInt ($Snap.second s@44@01)))
            0)
          (and
            (<
              (inv@39@01 ($SortWrappers.$SnapToIArray ($Snap.first s@44@01)) ($SortWrappers.$SnapToInt ($Snap.second s@44@01)))
              (len<Int> a@11@01))
            (=
              (mod
                (inv@39@01 ($SortWrappers.$SnapToIArray ($Snap.first s@44@01)) ($SortWrappers.$SnapToInt ($Snap.second s@44@01)))
                2)
              0)))
        (img@40@01 ($SortWrappers.$SnapToIArray ($Snap.first s@44@01)) ($SortWrappers.$SnapToInt ($Snap.second s@44@01))))
      (Set_in s@44@01 ($PSF.domain_access (as sm@43@01  $PSF<access>)))))
  :pattern ((Set_in s@44@01 ($PSF.domain_access (as sm@43@01  $PSF<access>))))
  :qid |qp.psmDomDef4|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@44@01 $Snap)) (!
  (=>
    (and
      (and
        (and
          (>=
            (inv@39@01 ($SortWrappers.$SnapToIArray ($Snap.first s@44@01)) ($SortWrappers.$SnapToInt ($Snap.second s@44@01)))
            0)
          (and
            (<
              (inv@39@01 ($SortWrappers.$SnapToIArray ($Snap.first s@44@01)) ($SortWrappers.$SnapToInt ($Snap.second s@44@01)))
              (len<Int> a@11@01))
            (=
              (mod
                (inv@39@01 ($SortWrappers.$SnapToIArray ($Snap.first s@44@01)) ($SortWrappers.$SnapToInt ($Snap.second s@44@01)))
                2)
              0)))
        (img@40@01 ($SortWrappers.$SnapToIArray ($Snap.first s@44@01)) ($SortWrappers.$SnapToInt ($Snap.second s@44@01))))
      (and
        (= ($SortWrappers.$SnapToIArray ($Snap.first s@44@01)) a@11@01)
        (= ($SortWrappers.$SnapToInt ($Snap.second s@44@01)) i@12@01)))
    (and
      (not (= s@44@01 $Snap.unit))
      (=
        ($PSF.lookup_access (as sm@43@01  $PSF<access>) s@44@01)
        ($PSF.lookup_access (as sm@37@01  $PSF<access>) s@44@01))))
  :pattern (($PSF.lookup_access (as sm@43@01  $PSF<access>) s@44@01))
  :pattern (($PSF.lookup_access (as sm@37@01  $PSF<access>) s@44@01))
  :qid |qp.psmValDef2|)))
(assert (forall ((s@44@01 $Snap)) (!
  (=>
    (and
      (and
        (and
          (>=
            (inv@39@01 ($SortWrappers.$SnapToIArray ($Snap.first s@44@01)) ($SortWrappers.$SnapToInt ($Snap.second s@44@01)))
            0)
          (and
            (<
              (inv@39@01 ($SortWrappers.$SnapToIArray ($Snap.first s@44@01)) ($SortWrappers.$SnapToInt ($Snap.second s@44@01)))
              (len<Int> a@11@01))
            (=
              (mod
                (inv@39@01 ($SortWrappers.$SnapToIArray ($Snap.first s@44@01)) ($SortWrappers.$SnapToInt ($Snap.second s@44@01)))
                2)
              0)))
        (img@40@01 ($SortWrappers.$SnapToIArray ($Snap.first s@44@01)) ($SortWrappers.$SnapToInt ($Snap.second s@44@01))))
      (ite
        (and
          (img@32@01 ($SortWrappers.$SnapToIArray ($Snap.first s@44@01)) ($SortWrappers.$SnapToInt ($Snap.second s@44@01)))
          (and
            (>=
              (inv@31@01 ($SortWrappers.$SnapToIArray ($Snap.first s@44@01)) ($SortWrappers.$SnapToInt ($Snap.second s@44@01)))
              0)
            (and
              (<
                (inv@31@01 ($SortWrappers.$SnapToIArray ($Snap.first s@44@01)) ($SortWrappers.$SnapToInt ($Snap.second s@44@01)))
                (len<Int> a@11@01))
              (=
                (mod
                  (inv@31@01 ($SortWrappers.$SnapToIArray ($Snap.first s@44@01)) ($SortWrappers.$SnapToInt ($Snap.second s@44@01)))
                  2)
                0))))
        (<
          $Perm.No
          (-
            $Perm.Write
            (pTaken@33@01 ($SortWrappers.$SnapToIArray ($Snap.first s@44@01)) ($SortWrappers.$SnapToInt ($Snap.second s@44@01)))))
        false))
    (and
      (not (= s@44@01 $Snap.unit))
      (=
        ($PSF.lookup_access (as sm@43@01  $PSF<access>) s@44@01)
        ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.second ($Snap.second $t@29@01))) s@44@01))))
  :pattern (($PSF.lookup_access (as sm@43@01  $PSF<access>) s@44@01))
  :pattern (($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.second ($Snap.second $t@29@01))) s@44@01))
  :qid |qp.psmValDef3|)))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 5 | !(i@12@01 + 3 < len[Int](a@11@01))]
(assert (not (< (+ i@12@01 3) (len<Int> a@11@01))))
(pop) ; 3
; [eval] !(i + 3 < len(a))
; [eval] i + 3 < len(a)
; [eval] i + 3
; [eval] len(a)
(push) ; 3
(set-option :timeout 10)
(assert (not (< (+ i@12@01 3) (len<Int> a@11@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (< (+ i@12@01 3) (len<Int> a@11@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 14 | !(i@12@01 + 3 < len[Int](a@11@01)) | live]
; [else-branch: 14 | i@12@01 + 3 < len[Int](a@11@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 14 | !(i@12@01 + 3 < len[Int](a@11@01))]
(assert (not (< (+ i@12@01 3) (len<Int> a@11@01))))
; [exec]
; unfold acc(access(a, i), write)
; Precomputing data for removing quantified permissions
(define-fun pTaken@45@01 ((a IArray) (i Int)) $Perm
  (ite
    (and (= a a@11@01) (= i i@12@01))
    ($Perm.min
      (ite
        (and
          (img@17@01 a i)
          (and
            (>= (inv@16@01 a i) 0)
            (and
              (< (inv@16@01 a i) (len<Int> a@11@01))
              (= (mod (inv@16@01 a i) 2) 0))))
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
(assert (not (forall ((a IArray) (i Int)) (!
  (=
    (-
      (ite
        (and
          (img@17@01 a i)
          (and
            (>= (inv@16@01 a i) 0)
            (and
              (< (inv@16@01 a i) (len<Int> a@11@01))
              (= (mod (inv@16@01 a i) 2) 0))))
        $Perm.Write
        $Perm.No)
      (pTaken@45@01 a i))
    $Perm.No)
  
  :qid |quant-u-21|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((a IArray) (i Int)) (!
  (= (pTaken@45@01 a i) $Perm.No)
  
  :qid |quant-u-22|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=>
    (and (= a a@11@01) (= i i@12@01))
    (= (- $Perm.Write (pTaken@45@01 a i)) $Perm.No))
  
  :qid |quant-u-23|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@46@01 $PSF<access>)
(declare-const s@47@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@17@01 a@11@01 i@12@01)
    (and
      (>= (inv@16@01 a@11@01 i@12@01) 0)
      (and
        (< (inv@16@01 a@11@01 i@12@01) (len<Int> a@11@01))
        (= (mod (inv@16@01 a@11@01 i@12@01) 2) 0))))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@11@01)
          ($SortWrappers.IntTo$Snap i@12@01))
        $Snap.unit))
    (=
      ($PSF.lookup_access (as sm@46@01  $PSF<access>) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@11@01)
        ($SortWrappers.IntTo$Snap i@12@01)))
      ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.second ($Snap.second ($Snap.second $t@14@01)))) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@11@01)
        ($SortWrappers.IntTo$Snap i@12@01)))))))
; [eval] i % 2 == 0
; [eval] i % 2
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= (mod i@12@01 2) 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 15 | i@12@01 % 2 == 0 | live]
; [else-branch: 15 | i@12@01 % 2 != 0 | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 15 | i@12@01 % 2 == 0]
(assert (=
  ($PSF.lookup_access (as sm@46@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@11@01)
    ($SortWrappers.IntTo$Snap i@12@01)))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_access (as sm@46@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@11@01)
      ($SortWrappers.IntTo$Snap i@12@01))))
    ($Snap.second ($PSF.lookup_access (as sm@46@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@11@01)
      ($SortWrappers.IntTo$Snap i@12@01)))))))
; [eval] loc(a, i)
(assert (not (= (loc<Ref> a@11@01 i@12@01) $Ref.null)))
; [eval] loc(a, i + 1)
; [eval] i + 1
(push) ; 5
(set-option :timeout 10)
(assert (not (= (loc<Ref> a@11@01 i@12@01) (loc<Ref> a@11@01 (+ i@12@01 1)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (not (= (loc<Ref> a@11@01 (+ i@12@01 1)) $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (access%trigger ($PSF.lookup_access (as sm@46@01  $PSF<access>) ($Snap.combine
  ($SortWrappers.IArrayTo$Snap a@11@01)
  ($SortWrappers.IntTo$Snap i@12@01))) a@11@01 i@12@01))
; [exec]
; sum := loc(a, i).val + loc(a, i + 1).val
; [eval] loc(a, i).val + loc(a, i + 1).val
; [eval] loc(a, i)
; [eval] loc(a, i + 1)
; [eval] i + 1
(declare-const sum@48@01 Int)
(assert (=
  sum@48@01
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_access (as sm@46@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@11@01)
      ($SortWrappers.IntTo$Snap i@12@01)))))
    ($SortWrappers.$SnapToInt ($Snap.second ($PSF.lookup_access (as sm@46@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@11@01)
      ($SortWrappers.IntTo$Snap i@12@01))))))))
; [exec]
; fold acc(access(a, i), write)
; [eval] i % 2 == 0
; [eval] i % 2
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= (mod i@12@01 2) 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 16 | i@12@01 % 2 == 0 | live]
; [else-branch: 16 | i@12@01 % 2 != 0 | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 16 | i@12@01 % 2 == 0]
; [eval] loc(a, i)
; [eval] loc(a, i + 1)
; [eval] i + 1
(assert (access%trigger ($Snap.combine
  ($Snap.first ($PSF.lookup_access (as sm@46@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@11@01)
    ($SortWrappers.IntTo$Snap i@12@01))))
  ($Snap.second ($PSF.lookup_access (as sm@46@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@11@01)
    ($SortWrappers.IntTo$Snap i@12@01))))) a@11@01 i@12@01))
(declare-const sm@49@01 $PSF<access>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_access (as sm@49@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@11@01)
    ($SortWrappers.IntTo$Snap i@12@01)))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_access (as sm@46@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@11@01)
      ($SortWrappers.IntTo$Snap i@12@01))))
    ($Snap.second ($PSF.lookup_access (as sm@46@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@11@01)
      ($SortWrappers.IntTo$Snap i@12@01)))))))
; [eval] i >= 0
; [eval] i <= len(a)
; [eval] len(a)
(push) ; 6
(assert (not (<= i@12@01 (len<Int> a@11@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<= i@12@01 (len<Int> a@11@01)))
(declare-const j@50@01 Int)
(push) ; 6
; [eval] j >= 0 && (j < len(a) && j % 2 == 0)
; [eval] j >= 0
(push) ; 7
; [then-branch: 17 | !(j@50@01 >= 0) | live]
; [else-branch: 17 | j@50@01 >= 0 | live]
(push) ; 8
; [then-branch: 17 | !(j@50@01 >= 0)]
(assert (not (>= j@50@01 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 17 | j@50@01 >= 0]
(assert (>= j@50@01 0))
; [eval] j < len(a)
; [eval] len(a)
(push) ; 9
; [then-branch: 18 | !(j@50@01 < len[Int](a@11@01)) | live]
; [else-branch: 18 | j@50@01 < len[Int](a@11@01) | live]
(push) ; 10
; [then-branch: 18 | !(j@50@01 < len[Int](a@11@01))]
(assert (not (< j@50@01 (len<Int> a@11@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 18 | j@50@01 < len[Int](a@11@01)]
(assert (< j@50@01 (len<Int> a@11@01)))
; [eval] j % 2 == 0
; [eval] j % 2
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< j@50@01 (len<Int> a@11@01)) (not (< j@50@01 (len<Int> a@11@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@50@01 0)
  (and
    (>= j@50@01 0)
    (or (< j@50@01 (len<Int> a@11@01)) (not (< j@50@01 (len<Int> a@11@01)))))))
(assert (or (>= j@50@01 0) (not (>= j@50@01 0))))
(assert (and (>= j@50@01 0) (and (< j@50@01 (len<Int> a@11@01)) (= (mod j@50@01 2) 0))))
(pop) ; 6
(declare-fun inv@51@01 (IArray Int) Int)
(declare-fun img@52@01 (IArray Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@50@01 Int)) (!
  (=>
    (and
      (>= j@50@01 0)
      (and (< j@50@01 (len<Int> a@11@01)) (= (mod j@50@01 2) 0)))
    (and
      (=>
        (>= j@50@01 0)
        (and
          (>= j@50@01 0)
          (or
            (< j@50@01 (len<Int> a@11@01))
            (not (< j@50@01 (len<Int> a@11@01))))))
      (or (>= j@50@01 0) (not (>= j@50@01 0)))))
  :pattern ((inv@51@01 a@11@01 j@50@01))
  :pattern ((img@52@01 a@11@01 j@50@01))
  :qid |access-aux|)))
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((j1@50@01 Int) (j2@50@01 Int)) (!
  (=>
    (and
      (and
        (>= j1@50@01 0)
        (and (< j1@50@01 (len<Int> a@11@01)) (= (mod j1@50@01 2) 0)))
      (and
        (>= j2@50@01 0)
        (and (< j2@50@01 (len<Int> a@11@01)) (= (mod j2@50@01 2) 0)))
      (= j1@50@01 j2@50@01))
    (= j1@50@01 j2@50@01))
  
  :qid |access-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@50@01 Int)) (!
  (=>
    (and
      (>= j@50@01 0)
      (and (< j@50@01 (len<Int> a@11@01)) (= (mod j@50@01 2) 0)))
    (and (= (inv@51@01 a@11@01 j@50@01) j@50@01) (img@52@01 a@11@01 j@50@01)))
  :pattern ((inv@51@01 a@11@01 j@50@01))
  :pattern ((img@52@01 a@11@01 j@50@01))
  :qid |access-invOfFct|)))
(assert (forall ((a IArray) (i Int)) (!
  (=>
    (and
      (img@52@01 a i)
      (and
        (>= (inv@51@01 a i) 0)
        (and
          (< (inv@51@01 a i) (len<Int> a@11@01))
          (= (mod (inv@51@01 a i) 2) 0))))
    (and (= a@11@01 a) (= (inv@51@01 a i) i)))
  :pattern ((inv@51@01 a i))
  :qid |access-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@53@01 ((a IArray) (i Int)) $Perm
  (ite
    (and
      (and
        (>= (inv@51@01 a i) 0)
        (and
          (< (inv@51@01 a i) (len<Int> a@11@01))
          (= (mod (inv@51@01 a i) 2) 0)))
      (img@52@01 a i)
      (and (= a a@11@01) (= i (inv@51@01 a i))))
    ($Perm.min
      (ite
        (and
          (img@17@01 a i)
          (and
            (>= (inv@16@01 a i) 0)
            (and
              (< (inv@16@01 a i) (len<Int> a@11@01))
              (= (mod (inv@16@01 a i) 2) 0))))
        (- $Perm.Write (pTaken@45@01 a i))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@54@01 ((a IArray) (i Int)) $Perm
  (ite
    (and
      (and
        (>= (inv@51@01 a i) 0)
        (and
          (< (inv@51@01 a i) (len<Int> a@11@01))
          (= (mod (inv@51@01 a i) 2) 0)))
      (img@52@01 a i)
      (and (= a a@11@01) (= i (inv@51@01 a i))))
    ($Perm.min
      (ite (and (= a a@11@01) (= i i@12@01)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@53@01 a i)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=
    (-
      (ite
        (and
          (img@17@01 a i)
          (and
            (>= (inv@16@01 a i) 0)
            (and
              (< (inv@16@01 a i) (len<Int> a@11@01))
              (= (mod (inv@16@01 a i) 2) 0))))
        (- $Perm.Write (pTaken@45@01 a i))
        $Perm.No)
      (pTaken@53@01 a i))
    $Perm.No)
  
  :qid |quant-u-26|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=>
    (and
      (and
        (>= (inv@51@01 a i) 0)
        (and
          (< (inv@51@01 a i) (len<Int> a@11@01))
          (= (mod (inv@51@01 a i) 2) 0)))
      (img@52@01 a i)
      (and (= a a@11@01) (= i (inv@51@01 a i))))
    (= (- $Perm.Write (pTaken@53@01 a i)) $Perm.No))
  
  :qid |quant-u-27|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@54@01 a@11@01 i@12@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=>
    (and
      (and
        (>= (inv@51@01 a i) 0)
        (and
          (< (inv@51@01 a i) (len<Int> a@11@01))
          (= (mod (inv@51@01 a i) 2) 0)))
      (img@52@01 a i)
      (and (= a a@11@01) (= i (inv@51@01 a i))))
    (= (- (- $Perm.Write (pTaken@53@01 a i)) (pTaken@54@01 a i)) $Perm.No))
  
  :qid |quant-u-29|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@55@01 $PSF<access>)
(declare-const s@56@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@56@01 $Snap)) (!
  (and
    (=>
      (Set_in s@56@01 ($PSF.domain_access (as sm@55@01  $PSF<access>)))
      (and
        (and
          (>=
            (inv@51@01 ($SortWrappers.$SnapToIArray ($Snap.first s@56@01)) ($SortWrappers.$SnapToInt ($Snap.second s@56@01)))
            0)
          (and
            (<
              (inv@51@01 ($SortWrappers.$SnapToIArray ($Snap.first s@56@01)) ($SortWrappers.$SnapToInt ($Snap.second s@56@01)))
              (len<Int> a@11@01))
            (=
              (mod
                (inv@51@01 ($SortWrappers.$SnapToIArray ($Snap.first s@56@01)) ($SortWrappers.$SnapToInt ($Snap.second s@56@01)))
                2)
              0)))
        (img@52@01 ($SortWrappers.$SnapToIArray ($Snap.first s@56@01)) ($SortWrappers.$SnapToInt ($Snap.second s@56@01)))))
    (=>
      (and
        (and
          (>=
            (inv@51@01 ($SortWrappers.$SnapToIArray ($Snap.first s@56@01)) ($SortWrappers.$SnapToInt ($Snap.second s@56@01)))
            0)
          (and
            (<
              (inv@51@01 ($SortWrappers.$SnapToIArray ($Snap.first s@56@01)) ($SortWrappers.$SnapToInt ($Snap.second s@56@01)))
              (len<Int> a@11@01))
            (=
              (mod
                (inv@51@01 ($SortWrappers.$SnapToIArray ($Snap.first s@56@01)) ($SortWrappers.$SnapToInt ($Snap.second s@56@01)))
                2)
              0)))
        (img@52@01 ($SortWrappers.$SnapToIArray ($Snap.first s@56@01)) ($SortWrappers.$SnapToInt ($Snap.second s@56@01))))
      (Set_in s@56@01 ($PSF.domain_access (as sm@55@01  $PSF<access>)))))
  :pattern ((Set_in s@56@01 ($PSF.domain_access (as sm@55@01  $PSF<access>))))
  :qid |qp.psmDomDef8|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@56@01 $Snap)) (!
  (=>
    (and
      (and
        (and
          (>=
            (inv@51@01 ($SortWrappers.$SnapToIArray ($Snap.first s@56@01)) ($SortWrappers.$SnapToInt ($Snap.second s@56@01)))
            0)
          (and
            (<
              (inv@51@01 ($SortWrappers.$SnapToIArray ($Snap.first s@56@01)) ($SortWrappers.$SnapToInt ($Snap.second s@56@01)))
              (len<Int> a@11@01))
            (=
              (mod
                (inv@51@01 ($SortWrappers.$SnapToIArray ($Snap.first s@56@01)) ($SortWrappers.$SnapToInt ($Snap.second s@56@01)))
                2)
              0)))
        (img@52@01 ($SortWrappers.$SnapToIArray ($Snap.first s@56@01)) ($SortWrappers.$SnapToInt ($Snap.second s@56@01))))
      (and
        (= ($SortWrappers.$SnapToIArray ($Snap.first s@56@01)) a@11@01)
        (= ($SortWrappers.$SnapToInt ($Snap.second s@56@01)) i@12@01)))
    (and
      (not (= s@56@01 $Snap.unit))
      (=
        ($PSF.lookup_access (as sm@55@01  $PSF<access>) s@56@01)
        ($PSF.lookup_access (as sm@49@01  $PSF<access>) s@56@01))))
  :pattern (($PSF.lookup_access (as sm@55@01  $PSF<access>) s@56@01))
  :pattern (($PSF.lookup_access (as sm@49@01  $PSF<access>) s@56@01))
  :qid |qp.psmValDef6|)))
(assert (forall ((s@56@01 $Snap)) (!
  (=>
    (and
      (and
        (and
          (>=
            (inv@51@01 ($SortWrappers.$SnapToIArray ($Snap.first s@56@01)) ($SortWrappers.$SnapToInt ($Snap.second s@56@01)))
            0)
          (and
            (<
              (inv@51@01 ($SortWrappers.$SnapToIArray ($Snap.first s@56@01)) ($SortWrappers.$SnapToInt ($Snap.second s@56@01)))
              (len<Int> a@11@01))
            (=
              (mod
                (inv@51@01 ($SortWrappers.$SnapToIArray ($Snap.first s@56@01)) ($SortWrappers.$SnapToInt ($Snap.second s@56@01)))
                2)
              0)))
        (img@52@01 ($SortWrappers.$SnapToIArray ($Snap.first s@56@01)) ($SortWrappers.$SnapToInt ($Snap.second s@56@01))))
      (ite
        (and
          (img@17@01 ($SortWrappers.$SnapToIArray ($Snap.first s@56@01)) ($SortWrappers.$SnapToInt ($Snap.second s@56@01)))
          (and
            (>=
              (inv@16@01 ($SortWrappers.$SnapToIArray ($Snap.first s@56@01)) ($SortWrappers.$SnapToInt ($Snap.second s@56@01)))
              0)
            (and
              (<
                (inv@16@01 ($SortWrappers.$SnapToIArray ($Snap.first s@56@01)) ($SortWrappers.$SnapToInt ($Snap.second s@56@01)))
                (len<Int> a@11@01))
              (=
                (mod
                  (inv@16@01 ($SortWrappers.$SnapToIArray ($Snap.first s@56@01)) ($SortWrappers.$SnapToInt ($Snap.second s@56@01)))
                  2)
                0))))
        (<
          $Perm.No
          (-
            $Perm.Write
            (pTaken@45@01 ($SortWrappers.$SnapToIArray ($Snap.first s@56@01)) ($SortWrappers.$SnapToInt ($Snap.second s@56@01)))))
        false))
    (and
      (not (= s@56@01 $Snap.unit))
      (=
        ($PSF.lookup_access (as sm@55@01  $PSF<access>) s@56@01)
        ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.second ($Snap.second ($Snap.second $t@14@01)))) s@56@01))))
  :pattern (($PSF.lookup_access (as sm@55@01  $PSF<access>) s@56@01))
  :pattern (($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.second ($Snap.second ($Snap.second $t@14@01)))) s@56@01))
  :qid |qp.psmValDef7|)))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 14 | i@12@01 + 3 < len[Int](a@11@01)]
(assert (< (+ i@12@01 3) (len<Int> a@11@01)))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- setVal ----------
(declare-const a@57@01 IArray)
(declare-const i@58@01 Int)
(declare-const newVal@59@01 Int)
(declare-const a@60@01 IArray)
(declare-const i@61@01 Int)
(declare-const newVal@62@01 Int)
(push) ; 1
(declare-const $t@63@01 $Snap)
(assert (= $t@63@01 ($Snap.combine ($Snap.first $t@63@01) ($Snap.second $t@63@01))))
(assert (= ($Snap.first $t@63@01) $Snap.unit))
; [eval] i >= 0
(assert (>= i@61@01 0))
(assert (=
  ($Snap.second $t@63@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@63@01))
    ($Snap.second ($Snap.second $t@63@01)))))
(assert (= ($Snap.first ($Snap.second $t@63@01)) $Snap.unit))
; [eval] i < len(a)
; [eval] len(a)
(assert (< i@61@01 (len<Int> a@60@01)))
(assert (=
  ($Snap.second ($Snap.second $t@63@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@63@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@63@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@63@01))) $Snap.unit))
; [eval] i % 2 == 0
; [eval] i % 2
(assert (= (mod i@61@01 2) 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@63@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@63@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@63@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@63@01))))
  $Snap.unit))
; [eval] len(a) % 2 == 0
; [eval] len(a) % 2
; [eval] len(a)
(assert (= (mod (len<Int> a@60@01) 2) 0))
(declare-const j@64@01 Int)
(push) ; 2
; [eval] j >= 0 && (j < len(a) && j % 2 == 0)
; [eval] j >= 0
(push) ; 3
; [then-branch: 19 | !(j@64@01 >= 0) | live]
; [else-branch: 19 | j@64@01 >= 0 | live]
(push) ; 4
; [then-branch: 19 | !(j@64@01 >= 0)]
(assert (not (>= j@64@01 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 19 | j@64@01 >= 0]
(assert (>= j@64@01 0))
; [eval] j < len(a)
; [eval] len(a)
(push) ; 5
; [then-branch: 20 | !(j@64@01 < len[Int](a@60@01)) | live]
; [else-branch: 20 | j@64@01 < len[Int](a@60@01) | live]
(push) ; 6
; [then-branch: 20 | !(j@64@01 < len[Int](a@60@01))]
(assert (not (< j@64@01 (len<Int> a@60@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 20 | j@64@01 < len[Int](a@60@01)]
(assert (< j@64@01 (len<Int> a@60@01)))
; [eval] j % 2 == 0
; [eval] j % 2
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (< j@64@01 (len<Int> a@60@01)) (not (< j@64@01 (len<Int> a@60@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@64@01 0)
  (and
    (>= j@64@01 0)
    (or (< j@64@01 (len<Int> a@60@01)) (not (< j@64@01 (len<Int> a@60@01)))))))
(assert (or (>= j@64@01 0) (not (>= j@64@01 0))))
(assert (and (>= j@64@01 0) (and (< j@64@01 (len<Int> a@60@01)) (= (mod j@64@01 2) 0))))
(pop) ; 2
(declare-fun inv@65@01 (IArray Int) Int)
(declare-fun img@66@01 (IArray Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@64@01 Int)) (!
  (=>
    (and
      (>= j@64@01 0)
      (and (< j@64@01 (len<Int> a@60@01)) (= (mod j@64@01 2) 0)))
    (and
      (=>
        (>= j@64@01 0)
        (and
          (>= j@64@01 0)
          (or
            (< j@64@01 (len<Int> a@60@01))
            (not (< j@64@01 (len<Int> a@60@01))))))
      (or (>= j@64@01 0) (not (>= j@64@01 0)))))
  :pattern ((inv@65@01 a@60@01 j@64@01))
  :pattern ((img@66@01 a@60@01 j@64@01))
  :qid |access-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((j1@64@01 Int) (j2@64@01 Int)) (!
  (=>
    (and
      (and
        (>= j1@64@01 0)
        (and (< j1@64@01 (len<Int> a@60@01)) (= (mod j1@64@01 2) 0)))
      (and
        (>= j2@64@01 0)
        (and (< j2@64@01 (len<Int> a@60@01)) (= (mod j2@64@01 2) 0)))
      (= j1@64@01 j2@64@01))
    (= j1@64@01 j2@64@01))
  
  :qid |access-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@64@01 Int)) (!
  (=>
    (and
      (>= j@64@01 0)
      (and (< j@64@01 (len<Int> a@60@01)) (= (mod j@64@01 2) 0)))
    (and (= (inv@65@01 a@60@01 j@64@01) j@64@01) (img@66@01 a@60@01 j@64@01)))
  :pattern ((inv@65@01 a@60@01 j@64@01))
  :pattern ((img@66@01 a@60@01 j@64@01))
  :qid |quant-u-31|)))
(assert (forall ((a IArray) (i Int)) (!
  (=>
    (and
      (img@66@01 a i)
      (and
        (>= (inv@65@01 a i) 0)
        (and
          (< (inv@65@01 a i) (len<Int> a@60@01))
          (= (mod (inv@65@01 a i) 2) 0))))
    (and (= a@60@01 a) (= (inv@65@01 a i) i)))
  :pattern ((inv@65@01 a i))
  :qid |access-fctOfInv|)))
; Permissions are non-negative
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@67@01 $Snap)
(assert (= $t@67@01 ($Snap.combine ($Snap.first $t@67@01) ($Snap.second $t@67@01))))
(assert (= ($Snap.first $t@67@01) $Snap.unit))
; [eval] i >= 0
(assert (=
  ($Snap.second $t@67@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@67@01))
    ($Snap.second ($Snap.second $t@67@01)))))
(assert (= ($Snap.first ($Snap.second $t@67@01)) $Snap.unit))
; [eval] i < len(a)
; [eval] len(a)
(assert (=
  ($Snap.second ($Snap.second $t@67@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@67@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@67@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@67@01))) $Snap.unit))
; [eval] len(a) % 2 == old(len(a) % 2)
; [eval] len(a) % 2
; [eval] len(a)
; [eval] old(len(a) % 2)
; [eval] len(a) % 2
; [eval] len(a)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@67@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@67@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@67@01)))))))
(declare-const j@68@01 Int)
(push) ; 3
; [eval] j >= 0 && (j < len(a) && j % 2 == 0)
; [eval] j >= 0
(push) ; 4
; [then-branch: 21 | !(j@68@01 >= 0) | live]
; [else-branch: 21 | j@68@01 >= 0 | live]
(push) ; 5
; [then-branch: 21 | !(j@68@01 >= 0)]
(assert (not (>= j@68@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 21 | j@68@01 >= 0]
(assert (>= j@68@01 0))
; [eval] j < len(a)
; [eval] len(a)
(push) ; 6
; [then-branch: 22 | !(j@68@01 < len[Int](a@60@01)) | live]
; [else-branch: 22 | j@68@01 < len[Int](a@60@01) | live]
(push) ; 7
; [then-branch: 22 | !(j@68@01 < len[Int](a@60@01))]
(assert (not (< j@68@01 (len<Int> a@60@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 22 | j@68@01 < len[Int](a@60@01)]
(assert (< j@68@01 (len<Int> a@60@01)))
; [eval] j % 2 == 0
; [eval] j % 2
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (< j@68@01 (len<Int> a@60@01)) (not (< j@68@01 (len<Int> a@60@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@68@01 0)
  (and
    (>= j@68@01 0)
    (or (< j@68@01 (len<Int> a@60@01)) (not (< j@68@01 (len<Int> a@60@01)))))))
(assert (or (>= j@68@01 0) (not (>= j@68@01 0))))
(assert (and (>= j@68@01 0) (and (< j@68@01 (len<Int> a@60@01)) (= (mod j@68@01 2) 0))))
(pop) ; 3
(declare-fun inv@69@01 (IArray Int) Int)
(declare-fun img@70@01 (IArray Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@68@01 Int)) (!
  (=>
    (and
      (>= j@68@01 0)
      (and (< j@68@01 (len<Int> a@60@01)) (= (mod j@68@01 2) 0)))
    (and
      (=>
        (>= j@68@01 0)
        (and
          (>= j@68@01 0)
          (or
            (< j@68@01 (len<Int> a@60@01))
            (not (< j@68@01 (len<Int> a@60@01))))))
      (or (>= j@68@01 0) (not (>= j@68@01 0)))))
  :pattern ((inv@69@01 a@60@01 j@68@01))
  :pattern ((img@70@01 a@60@01 j@68@01))
  :qid |access-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@68@01 Int) (j2@68@01 Int)) (!
  (=>
    (and
      (and
        (>= j1@68@01 0)
        (and (< j1@68@01 (len<Int> a@60@01)) (= (mod j1@68@01 2) 0)))
      (and
        (>= j2@68@01 0)
        (and (< j2@68@01 (len<Int> a@60@01)) (= (mod j2@68@01 2) 0)))
      (= j1@68@01 j2@68@01))
    (= j1@68@01 j2@68@01))
  
  :qid |access-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@68@01 Int)) (!
  (=>
    (and
      (>= j@68@01 0)
      (and (< j@68@01 (len<Int> a@60@01)) (= (mod j@68@01 2) 0)))
    (and (= (inv@69@01 a@60@01 j@68@01) j@68@01) (img@70@01 a@60@01 j@68@01)))
  :pattern ((inv@69@01 a@60@01 j@68@01))
  :pattern ((img@70@01 a@60@01 j@68@01))
  :qid |quant-u-33|)))
(assert (forall ((a IArray) (i Int)) (!
  (=>
    (and
      (img@70@01 a i)
      (and
        (>= (inv@69@01 a i) 0)
        (and
          (< (inv@69@01 a i) (len<Int> a@60@01))
          (= (mod (inv@69@01 a i) 2) 0))))
    (and (= a@60@01 a) (= (inv@69@01 a i) i)))
  :pattern ((inv@69@01 a i))
  :qid |access-fctOfInv|)))
; Permissions are non-negative
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@67@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@67@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@67@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@67@01)))))
  $Snap.unit))
; [eval] (forall j: Int :: { old(loc(a, j)) } j >= 0 && (j < i && j % 2 == 0) ==> (unfolding acc(access(a, j), write) in loc(a, j).val) == old((unfolding acc(access(a, j), write) in loc(a, j).val)))
(declare-const j@71@01 Int)
(push) ; 3
; [eval] j >= 0 && (j < i && j % 2 == 0) ==> (unfolding acc(access(a, j), write) in loc(a, j).val) == old((unfolding acc(access(a, j), write) in loc(a, j).val))
; [eval] j >= 0 && (j < i && j % 2 == 0)
; [eval] j >= 0
(push) ; 4
; [then-branch: 23 | !(j@71@01 >= 0) | live]
; [else-branch: 23 | j@71@01 >= 0 | live]
(push) ; 5
; [then-branch: 23 | !(j@71@01 >= 0)]
(assert (not (>= j@71@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 23 | j@71@01 >= 0]
(assert (>= j@71@01 0))
; [eval] j < i
(push) ; 6
; [then-branch: 24 | !(j@71@01 < i@61@01) | live]
; [else-branch: 24 | j@71@01 < i@61@01 | live]
(push) ; 7
; [then-branch: 24 | !(j@71@01 < i@61@01)]
(assert (not (< j@71@01 i@61@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 24 | j@71@01 < i@61@01]
(assert (< j@71@01 i@61@01))
; [eval] j % 2 == 0
; [eval] j % 2
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (< j@71@01 i@61@01) (not (< j@71@01 i@61@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@71@01 0)
  (and (>= j@71@01 0) (or (< j@71@01 i@61@01) (not (< j@71@01 i@61@01))))))
(assert (or (>= j@71@01 0) (not (>= j@71@01 0))))
(push) ; 4
; [then-branch: 25 | j@71@01 >= 0 && j@71@01 < i@61@01 && j@71@01 % 2 == 0 | live]
; [else-branch: 25 | !(j@71@01 >= 0 && j@71@01 < i@61@01 && j@71@01 % 2 == 0) | live]
(push) ; 5
; [then-branch: 25 | j@71@01 >= 0 && j@71@01 < i@61@01 && j@71@01 % 2 == 0]
(assert (and (>= j@71@01 0) (and (< j@71@01 i@61@01) (= (mod j@71@01 2) 0))))
; [eval] (unfolding acc(access(a, j), write) in loc(a, j).val) == old((unfolding acc(access(a, j), write) in loc(a, j).val))
; [eval] (unfolding acc(access(a, j), write) in loc(a, j).val)
(push) ; 6
; Precomputing data for removing quantified permissions
(define-fun pTaken@72@01 ((a IArray) (i Int) (j@71@01 Int)) $Perm
  (ite
    (and (= a a@60@01) (= i j@71@01))
    ($Perm.min
      (ite
        (and
          (img@70@01 a i)
          (and
            (>= (inv@69@01 a i) 0)
            (and
              (< (inv@69@01 a i) (len<Int> a@60@01))
              (= (mod (inv@69@01 a i) 2) 0))))
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
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=
    (-
      (ite
        (and
          (img@70@01 a i)
          (and
            (>= (inv@69@01 a i) 0)
            (and
              (< (inv@69@01 a i) (len<Int> a@60@01))
              (= (mod (inv@69@01 a i) 2) 0))))
        $Perm.Write
        $Perm.No)
      (pTaken@72@01 a i j@71@01))
    $Perm.No)
  
  :qid |quant-u-35|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((a IArray) (i Int)) (!
  (= (pTaken@72@01 a i j@71@01) $Perm.No)
  
  :qid |quant-u-36|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=>
    (and (= a a@60@01) (= i j@71@01))
    (= (- $Perm.Write (pTaken@72@01 a i j@71@01)) $Perm.No))
  
  :qid |quant-u-37|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@73@01 $PSF<access>)
(declare-const s@74@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@70@01 a@60@01 j@71@01)
    (and
      (>= (inv@69@01 a@60@01 j@71@01) 0)
      (and
        (< (inv@69@01 a@60@01 j@71@01) (len<Int> a@60@01))
        (= (mod (inv@69@01 a@60@01 j@71@01) 2) 0))))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap j@71@01))
        $Snap.unit))
    (=
      ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap j@71@01)))
      ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@67@01))))) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap j@71@01)))))))
(assert (access%trigger ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
  ($SortWrappers.IArrayTo$Snap a@60@01)
  ($SortWrappers.IntTo$Snap j@71@01))) a@60@01 j@71@01))
; [eval] i % 2 == 0
; [eval] i % 2
; [then-branch: 26 | j@71@01 % 2 == 0 | live]
; [else-branch: 26 | j@71@01 % 2 != 0 | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 26 | j@71@01 % 2 == 0]
(assert (=
  ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap j@71@01)))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap j@71@01))))
    ($Snap.second ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap j@71@01)))))))
; [eval] loc(a, i)
(assert (not (= (loc<Ref> a@60@01 j@71@01) $Ref.null)))
; [eval] loc(a, i + 1)
; [eval] i + 1
(push) ; 8
(set-option :timeout 10)
(assert (not (= (loc<Ref> a@60@01 j@71@01) (loc<Ref> a@60@01 (+ j@71@01 1)))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (not (= (loc<Ref> a@60@01 (+ j@71@01 1)) $Ref.null)))
; [eval] loc(a, j)
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 26 | j@71@01 % 2 != 0]
(assert (not (= (mod j@71@01 2) 0)))
(assert (=
  ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap j@71@01)))
  $Snap.unit))
; [eval] loc(a, j)
(check-sat)
; unsat
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (and
  (=>
    (and
      (img@70@01 a@60@01 j@71@01)
      (and
        (>= (inv@69@01 a@60@01 j@71@01) 0)
        (and
          (< (inv@69@01 a@60@01 j@71@01) (len<Int> a@60@01))
          (= (mod (inv@69@01 a@60@01 j@71@01) 2) 0))))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.IArrayTo$Snap a@60@01)
            ($SortWrappers.IntTo$Snap j@71@01))
          $Snap.unit))
      (=
        ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap j@71@01)))
        ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@67@01))))) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap j@71@01))))))
  (access%trigger ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap j@71@01))) a@60@01 j@71@01)))
(assert (=>
  (= (mod j@71@01 2) 0)
  (and
    (=
      ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap j@71@01)))
      ($Snap.combine
        ($Snap.first ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap j@71@01))))
        ($Snap.second ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap j@71@01))))))
    (not (= (loc<Ref> a@60@01 j@71@01) $Ref.null))
    (not (= (loc<Ref> a@60@01 (+ j@71@01 1)) $Ref.null)))))
; [eval] old((unfolding acc(access(a, j), write) in loc(a, j).val))
; [eval] (unfolding acc(access(a, j), write) in loc(a, j).val)
(push) ; 6
; Precomputing data for removing quantified permissions
(define-fun pTaken@75@01 ((a IArray) (i Int) (j@71@01 Int)) $Perm
  (ite
    (and (= a a@60@01) (= i j@71@01))
    ($Perm.min
      (ite
        (and
          (img@66@01 a i)
          (and
            (>= (inv@65@01 a i) 0)
            (and
              (< (inv@65@01 a i) (len<Int> a@60@01))
              (= (mod (inv@65@01 a i) 2) 0))))
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
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=
    (-
      (ite
        (and
          (img@66@01 a i)
          (and
            (>= (inv@65@01 a i) 0)
            (and
              (< (inv@65@01 a i) (len<Int> a@60@01))
              (= (mod (inv@65@01 a i) 2) 0))))
        $Perm.Write
        $Perm.No)
      (pTaken@75@01 a i j@71@01))
    $Perm.No)
  
  :qid |quant-u-39|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((a IArray) (i Int)) (!
  (= (pTaken@75@01 a i j@71@01) $Perm.No)
  
  :qid |quant-u-40|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=>
    (and (= a a@60@01) (= i j@71@01))
    (= (- $Perm.Write (pTaken@75@01 a i j@71@01)) $Perm.No))
  
  :qid |quant-u-41|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@76@01 $PSF<access>)
(declare-const s@77@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@66@01 a@60@01 j@71@01)
    (and
      (>= (inv@65@01 a@60@01 j@71@01) 0)
      (and
        (< (inv@65@01 a@60@01 j@71@01) (len<Int> a@60@01))
        (= (mod (inv@65@01 a@60@01 j@71@01) 2) 0))))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap j@71@01))
        $Snap.unit))
    (=
      ($PSF.lookup_access (as sm@76@01  $PSF<access>) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap j@71@01)))
      ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@63@01))))) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap j@71@01)))))))
(assert (access%trigger ($PSF.lookup_access (as sm@76@01  $PSF<access>) ($Snap.combine
  ($SortWrappers.IArrayTo$Snap a@60@01)
  ($SortWrappers.IntTo$Snap j@71@01))) a@60@01 j@71@01))
; [eval] i % 2 == 0
; [eval] i % 2
; [then-branch: 27 | j@71@01 % 2 == 0 | live]
; [else-branch: 27 | j@71@01 % 2 != 0 | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 27 | j@71@01 % 2 == 0]
(assert (=
  ($PSF.lookup_access (as sm@76@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap j@71@01)))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_access (as sm@76@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap j@71@01))))
    ($Snap.second ($PSF.lookup_access (as sm@76@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap j@71@01)))))))
; [eval] loc(a, i)
(assert (not (= (loc<Ref> a@60@01 j@71@01) $Ref.null)))
; [eval] loc(a, i + 1)
; [eval] i + 1
(push) ; 8
(set-option :timeout 10)
(assert (not (= (loc<Ref> a@60@01 j@71@01) (loc<Ref> a@60@01 (+ j@71@01 1)))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (not (= (loc<Ref> a@60@01 (+ j@71@01 1)) $Ref.null)))
; [eval] loc(a, j)
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 27 | j@71@01 % 2 != 0]
(assert (not (= (mod j@71@01 2) 0)))
(assert (=
  ($PSF.lookup_access (as sm@76@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap j@71@01)))
  $Snap.unit))
; [eval] loc(a, j)
(check-sat)
; unsat
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (and
  (=>
    (and
      (img@66@01 a@60@01 j@71@01)
      (and
        (>= (inv@65@01 a@60@01 j@71@01) 0)
        (and
          (< (inv@65@01 a@60@01 j@71@01) (len<Int> a@60@01))
          (= (mod (inv@65@01 a@60@01 j@71@01) 2) 0))))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.IArrayTo$Snap a@60@01)
            ($SortWrappers.IntTo$Snap j@71@01))
          $Snap.unit))
      (=
        ($PSF.lookup_access (as sm@76@01  $PSF<access>) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap j@71@01)))
        ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@63@01))))) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap j@71@01))))))
  (access%trigger ($PSF.lookup_access (as sm@76@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap j@71@01))) a@60@01 j@71@01)))
(assert (=>
  (= (mod j@71@01 2) 0)
  (and
    (=
      ($PSF.lookup_access (as sm@76@01  $PSF<access>) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap j@71@01)))
      ($Snap.combine
        ($Snap.first ($PSF.lookup_access (as sm@76@01  $PSF<access>) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap j@71@01))))
        ($Snap.second ($PSF.lookup_access (as sm@76@01  $PSF<access>) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap j@71@01))))))
    (not (= (loc<Ref> a@60@01 j@71@01) $Ref.null))
    (not (= (loc<Ref> a@60@01 (+ j@71@01 1)) $Ref.null)))))
(pop) ; 5
(push) ; 5
; [else-branch: 25 | !(j@71@01 >= 0 && j@71@01 < i@61@01 && j@71@01 % 2 == 0)]
(assert (not (and (>= j@71@01 0) (and (< j@71@01 i@61@01) (= (mod j@71@01 2) 0)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (>= j@71@01 0) (and (< j@71@01 i@61@01) (= (mod j@71@01 2) 0)))
  (and
    (>= j@71@01 0)
    (< j@71@01 i@61@01)
    (= (mod j@71@01 2) 0)
    (=>
      (and
        (img@70@01 a@60@01 j@71@01)
        (and
          (>= (inv@69@01 a@60@01 j@71@01) 0)
          (and
            (< (inv@69@01 a@60@01 j@71@01) (len<Int> a@60@01))
            (= (mod (inv@69@01 a@60@01 j@71@01) 2) 0))))
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.IArrayTo$Snap a@60@01)
              ($SortWrappers.IntTo$Snap j@71@01))
            $Snap.unit))
        (=
          ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
            ($SortWrappers.IArrayTo$Snap a@60@01)
            ($SortWrappers.IntTo$Snap j@71@01)))
          ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@67@01))))) ($Snap.combine
            ($SortWrappers.IArrayTo$Snap a@60@01)
            ($SortWrappers.IntTo$Snap j@71@01))))))
    (access%trigger ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap j@71@01))) a@60@01 j@71@01)
    (=>
      (= (mod j@71@01 2) 0)
      (and
        (=
          ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
            ($SortWrappers.IArrayTo$Snap a@60@01)
            ($SortWrappers.IntTo$Snap j@71@01)))
          ($Snap.combine
            ($Snap.first ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
              ($SortWrappers.IArrayTo$Snap a@60@01)
              ($SortWrappers.IntTo$Snap j@71@01))))
            ($Snap.second ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
              ($SortWrappers.IArrayTo$Snap a@60@01)
              ($SortWrappers.IntTo$Snap j@71@01))))))
        (not (= (loc<Ref> a@60@01 j@71@01) $Ref.null))
        (not (= (loc<Ref> a@60@01 (+ j@71@01 1)) $Ref.null))))
    (=>
      (and
        (img@66@01 a@60@01 j@71@01)
        (and
          (>= (inv@65@01 a@60@01 j@71@01) 0)
          (and
            (< (inv@65@01 a@60@01 j@71@01) (len<Int> a@60@01))
            (= (mod (inv@65@01 a@60@01 j@71@01) 2) 0))))
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.IArrayTo$Snap a@60@01)
              ($SortWrappers.IntTo$Snap j@71@01))
            $Snap.unit))
        (=
          ($PSF.lookup_access (as sm@76@01  $PSF<access>) ($Snap.combine
            ($SortWrappers.IArrayTo$Snap a@60@01)
            ($SortWrappers.IntTo$Snap j@71@01)))
          ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@63@01))))) ($Snap.combine
            ($SortWrappers.IArrayTo$Snap a@60@01)
            ($SortWrappers.IntTo$Snap j@71@01))))))
    (access%trigger ($PSF.lookup_access (as sm@76@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap j@71@01))) a@60@01 j@71@01)
    (=>
      (= (mod j@71@01 2) 0)
      (and
        (=
          ($PSF.lookup_access (as sm@76@01  $PSF<access>) ($Snap.combine
            ($SortWrappers.IArrayTo$Snap a@60@01)
            ($SortWrappers.IntTo$Snap j@71@01)))
          ($Snap.combine
            ($Snap.first ($PSF.lookup_access (as sm@76@01  $PSF<access>) ($Snap.combine
              ($SortWrappers.IArrayTo$Snap a@60@01)
              ($SortWrappers.IntTo$Snap j@71@01))))
            ($Snap.second ($PSF.lookup_access (as sm@76@01  $PSF<access>) ($Snap.combine
              ($SortWrappers.IArrayTo$Snap a@60@01)
              ($SortWrappers.IntTo$Snap j@71@01))))))
        (not (= (loc<Ref> a@60@01 j@71@01) $Ref.null))
        (not (= (loc<Ref> a@60@01 (+ j@71@01 1)) $Ref.null)))))))
; Joined path conditions
(assert (or
  (not (and (>= j@71@01 0) (and (< j@71@01 i@61@01) (= (mod j@71@01 2) 0))))
  (and (>= j@71@01 0) (and (< j@71@01 i@61@01) (= (mod j@71@01 2) 0)))))
; [eval] old(loc(a, j))
; [eval] loc(a, j)
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@71@01 Int)) (!
  (and
    (=>
      (>= j@71@01 0)
      (and (>= j@71@01 0) (or (< j@71@01 i@61@01) (not (< j@71@01 i@61@01)))))
    (or (>= j@71@01 0) (not (>= j@71@01 0)))
    (=>
      (and (>= j@71@01 0) (and (< j@71@01 i@61@01) (= (mod j@71@01 2) 0)))
      (and
        (>= j@71@01 0)
        (< j@71@01 i@61@01)
        (= (mod j@71@01 2) 0)
        (=>
          (and
            (img@70@01 a@60@01 j@71@01)
            (and
              (>= (inv@69@01 a@60@01 j@71@01) 0)
              (and
                (< (inv@69@01 a@60@01 j@71@01) (len<Int> a@60@01))
                (= (mod (inv@69@01 a@60@01 j@71@01) 2) 0))))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.IArrayTo$Snap a@60@01)
                  ($SortWrappers.IntTo$Snap j@71@01))
                $Snap.unit))
            (=
              ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
                ($SortWrappers.IArrayTo$Snap a@60@01)
                ($SortWrappers.IntTo$Snap j@71@01)))
              ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@67@01))))) ($Snap.combine
                ($SortWrappers.IArrayTo$Snap a@60@01)
                ($SortWrappers.IntTo$Snap j@71@01))))))
        (access%trigger ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap j@71@01))) a@60@01 j@71@01)
        (=>
          (= (mod j@71@01 2) 0)
          (and
            (=
              ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
                ($SortWrappers.IArrayTo$Snap a@60@01)
                ($SortWrappers.IntTo$Snap j@71@01)))
              ($Snap.combine
                ($Snap.first ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
                  ($SortWrappers.IArrayTo$Snap a@60@01)
                  ($SortWrappers.IntTo$Snap j@71@01))))
                ($Snap.second ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
                  ($SortWrappers.IArrayTo$Snap a@60@01)
                  ($SortWrappers.IntTo$Snap j@71@01))))))
            (not (= (loc<Ref> a@60@01 j@71@01) $Ref.null))
            (not (= (loc<Ref> a@60@01 (+ j@71@01 1)) $Ref.null))))
        (=>
          (and
            (img@66@01 a@60@01 j@71@01)
            (and
              (>= (inv@65@01 a@60@01 j@71@01) 0)
              (and
                (< (inv@65@01 a@60@01 j@71@01) (len<Int> a@60@01))
                (= (mod (inv@65@01 a@60@01 j@71@01) 2) 0))))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.IArrayTo$Snap a@60@01)
                  ($SortWrappers.IntTo$Snap j@71@01))
                $Snap.unit))
            (=
              ($PSF.lookup_access (as sm@76@01  $PSF<access>) ($Snap.combine
                ($SortWrappers.IArrayTo$Snap a@60@01)
                ($SortWrappers.IntTo$Snap j@71@01)))
              ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@63@01))))) ($Snap.combine
                ($SortWrappers.IArrayTo$Snap a@60@01)
                ($SortWrappers.IntTo$Snap j@71@01))))))
        (access%trigger ($PSF.lookup_access (as sm@76@01  $PSF<access>) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap j@71@01))) a@60@01 j@71@01)
        (=>
          (= (mod j@71@01 2) 0)
          (and
            (=
              ($PSF.lookup_access (as sm@76@01  $PSF<access>) ($Snap.combine
                ($SortWrappers.IArrayTo$Snap a@60@01)
                ($SortWrappers.IntTo$Snap j@71@01)))
              ($Snap.combine
                ($Snap.first ($PSF.lookup_access (as sm@76@01  $PSF<access>) ($Snap.combine
                  ($SortWrappers.IArrayTo$Snap a@60@01)
                  ($SortWrappers.IntTo$Snap j@71@01))))
                ($Snap.second ($PSF.lookup_access (as sm@76@01  $PSF<access>) ($Snap.combine
                  ($SortWrappers.IArrayTo$Snap a@60@01)
                  ($SortWrappers.IntTo$Snap j@71@01))))))
            (not (= (loc<Ref> a@60@01 j@71@01) $Ref.null))
            (not (= (loc<Ref> a@60@01 (+ j@71@01 1)) $Ref.null))))))
    (or
      (not (and (>= j@71@01 0) (and (< j@71@01 i@61@01) (= (mod j@71@01 2) 0))))
      (and (>= j@71@01 0) (and (< j@71@01 i@61@01) (= (mod j@71@01 2) 0)))))
  :pattern ((loc<Ref> a@60@01 j@71@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/issues/block_array.vpr@50@9@50@157-aux|)))
(assert (forall ((j@71@01 Int)) (!
  (=>
    (and (>= j@71@01 0) (and (< j@71@01 i@61@01) (= (mod j@71@01 2) 0)))
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap j@71@01)))))
      ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_access (as sm@76@01  $PSF<access>) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap j@71@01)))))))
  :pattern ((loc<Ref> a@60@01 j@71@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/issues/block_array.vpr@50@9@50@157|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@67@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@67@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@67@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@67@01))))))
  $Snap.unit))
; [eval] (forall __rw_j1: Int :: { old(loc(a, __rw_j1)) } true ==> __rw_j1 - 1 >= 0 && (__rw_j1 - 1 < i && (__rw_j1 - 1) % 2 == 0) ==> (unfolding acc(access(a, __rw_j1 - 1), write) in loc(a, __rw_j1).val) == old((unfolding acc(access(a, __rw_j1 - 1), write) in loc(a, __rw_j1).val)))
(declare-const __rw_j1@78@01 Int)
(push) ; 3
; [eval] true ==> __rw_j1 - 1 >= 0 && (__rw_j1 - 1 < i && (__rw_j1 - 1) % 2 == 0) ==> (unfolding acc(access(a, __rw_j1 - 1), write) in loc(a, __rw_j1).val) == old((unfolding acc(access(a, __rw_j1 - 1), write) in loc(a, __rw_j1).val))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 28 | True | live]
; [else-branch: 28 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 28 | True]
; [eval] __rw_j1 - 1 >= 0 && (__rw_j1 - 1 < i && (__rw_j1 - 1) % 2 == 0) ==> (unfolding acc(access(a, __rw_j1 - 1), write) in loc(a, __rw_j1).val) == old((unfolding acc(access(a, __rw_j1 - 1), write) in loc(a, __rw_j1).val))
; [eval] __rw_j1 - 1 >= 0 && (__rw_j1 - 1 < i && (__rw_j1 - 1) % 2 == 0)
; [eval] __rw_j1 - 1 >= 0
; [eval] __rw_j1 - 1
(push) ; 6
; [then-branch: 29 | !(__rw_j1@78@01 - 1 >= 0) | live]
; [else-branch: 29 | __rw_j1@78@01 - 1 >= 0 | live]
(push) ; 7
; [then-branch: 29 | !(__rw_j1@78@01 - 1 >= 0)]
(assert (not (>= (- __rw_j1@78@01 1) 0)))
(pop) ; 7
(push) ; 7
; [else-branch: 29 | __rw_j1@78@01 - 1 >= 0]
(assert (>= (- __rw_j1@78@01 1) 0))
; [eval] __rw_j1 - 1 < i
; [eval] __rw_j1 - 1
(push) ; 8
; [then-branch: 30 | !(__rw_j1@78@01 - 1 < i@61@01) | live]
; [else-branch: 30 | __rw_j1@78@01 - 1 < i@61@01 | live]
(push) ; 9
; [then-branch: 30 | !(__rw_j1@78@01 - 1 < i@61@01)]
(assert (not (< (- __rw_j1@78@01 1) i@61@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 30 | __rw_j1@78@01 - 1 < i@61@01]
(assert (< (- __rw_j1@78@01 1) i@61@01))
; [eval] (__rw_j1 - 1) % 2 == 0
; [eval] (__rw_j1 - 1) % 2
; [eval] __rw_j1 - 1
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (< (- __rw_j1@78@01 1) i@61@01) (not (< (- __rw_j1@78@01 1) i@61@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= (- __rw_j1@78@01 1) 0)
  (and
    (>= (- __rw_j1@78@01 1) 0)
    (or (< (- __rw_j1@78@01 1) i@61@01) (not (< (- __rw_j1@78@01 1) i@61@01))))))
(assert (or (>= (- __rw_j1@78@01 1) 0) (not (>= (- __rw_j1@78@01 1) 0))))
(push) ; 6
; [then-branch: 31 | __rw_j1@78@01 - 1 >= 0 && __rw_j1@78@01 - 1 < i@61@01 && __rw_j1@78@01 - 1 % 2 == 0 | live]
; [else-branch: 31 | !(__rw_j1@78@01 - 1 >= 0 && __rw_j1@78@01 - 1 < i@61@01 && __rw_j1@78@01 - 1 % 2 == 0) | live]
(push) ; 7
; [then-branch: 31 | __rw_j1@78@01 - 1 >= 0 && __rw_j1@78@01 - 1 < i@61@01 && __rw_j1@78@01 - 1 % 2 == 0]
(assert (and
  (>= (- __rw_j1@78@01 1) 0)
  (and (< (- __rw_j1@78@01 1) i@61@01) (= (mod (- __rw_j1@78@01 1) 2) 0))))
; [eval] (unfolding acc(access(a, __rw_j1 - 1), write) in loc(a, __rw_j1).val) == old((unfolding acc(access(a, __rw_j1 - 1), write) in loc(a, __rw_j1).val))
; [eval] (unfolding acc(access(a, __rw_j1 - 1), write) in loc(a, __rw_j1).val)
; [eval] __rw_j1 - 1
(push) ; 8
; [eval] __rw_j1 - 1
; Precomputing data for removing quantified permissions
(define-fun pTaken@79@01 ((a IArray) (i Int) (__rw_j1@78@01 Int)) $Perm
  (ite
    (and (= a a@60@01) (= i (- __rw_j1@78@01 1)))
    ($Perm.min
      (ite
        (and
          (img@70@01 a i)
          (and
            (>= (inv@69@01 a i) 0)
            (and
              (< (inv@69@01 a i) (len<Int> a@60@01))
              (= (mod (inv@69@01 a i) 2) 0))))
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
(push) ; 9
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=
    (-
      (ite
        (and
          (img@70@01 a i)
          (and
            (>= (inv@69@01 a i) 0)
            (and
              (< (inv@69@01 a i) (len<Int> a@60@01))
              (= (mod (inv@69@01 a i) 2) 0))))
        $Perm.Write
        $Perm.No)
      (pTaken@79@01 a i __rw_j1@78@01))
    $Perm.No)
  
  :qid |quant-u-43|))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (forall ((a IArray) (i Int)) (!
  (= (pTaken@79@01 a i __rw_j1@78@01) $Perm.No)
  
  :qid |quant-u-44|))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=>
    (and (= a a@60@01) (= i (- __rw_j1@78@01 1)))
    (= (- $Perm.Write (pTaken@79@01 a i __rw_j1@78@01)) $Perm.No))
  
  :qid |quant-u-45|))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@70@01 a@60@01 (- __rw_j1@78@01 1))
    (and
      (>= (inv@69@01 a@60@01 (- __rw_j1@78@01 1)) 0)
      (and
        (< (inv@69@01 a@60@01 (- __rw_j1@78@01 1)) (len<Int> a@60@01))
        (= (mod (inv@69@01 a@60@01 (- __rw_j1@78@01 1)) 2) 0))))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1)))
        $Snap.unit))
    (=
      ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1))))
      ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@67@01))))) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1))))))))
(assert (access%trigger ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
  ($SortWrappers.IArrayTo$Snap a@60@01)
  ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1)))) a@60@01 (- __rw_j1@78@01 1)))
; [eval] i % 2 == 0
; [eval] i % 2
; [then-branch: 32 | __rw_j1@78@01 - 1 % 2 == 0 | live]
; [else-branch: 32 | __rw_j1@78@01 - 1 % 2 != 0 | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 32 | __rw_j1@78@01 - 1 % 2 == 0]
(assert (=
  ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1))))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1)))))
    ($Snap.second ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1))))))))
; [eval] loc(a, i)
(assert (not (= (loc<Ref> a@60@01 (- __rw_j1@78@01 1)) $Ref.null)))
; [eval] loc(a, i + 1)
; [eval] i + 1
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  (loc<Ref> a@60@01 (- __rw_j1@78@01 1))
  (loc<Ref> a@60@01 (+ (- __rw_j1@78@01 1) 1)))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(assert (not (= (loc<Ref> a@60@01 (+ (- __rw_j1@78@01 1) 1)) $Ref.null)))
; [eval] loc(a, __rw_j1)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= (loc<Ref> a@60@01 (+ (- __rw_j1@78@01 1) 1)) (loc<Ref> a@60@01 __rw_j1@78@01))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
(set-option :timeout 0)
(push) ; 9
; [else-branch: 32 | __rw_j1@78@01 - 1 % 2 != 0]
(assert (not (= (mod (- __rw_j1@78@01 1) 2) 0)))
(assert (=
  ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1))))
  $Snap.unit))
; [eval] loc(a, __rw_j1)
(check-sat)
; unsat
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (and
  (=>
    (and
      (img@70@01 a@60@01 (- __rw_j1@78@01 1))
      (and
        (>= (inv@69@01 a@60@01 (- __rw_j1@78@01 1)) 0)
        (and
          (< (inv@69@01 a@60@01 (- __rw_j1@78@01 1)) (len<Int> a@60@01))
          (= (mod (inv@69@01 a@60@01 (- __rw_j1@78@01 1)) 2) 0))))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.IArrayTo$Snap a@60@01)
            ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1)))
          $Snap.unit))
      (=
        ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1))))
        ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@67@01))))) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1)))))))
  (access%trigger ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1)))) a@60@01 (- __rw_j1@78@01 1))))
(assert (=>
  (= (mod (- __rw_j1@78@01 1) 2) 0)
  (and
    (=
      ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1))))
      ($Snap.combine
        ($Snap.first ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1)))))
        ($Snap.second ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1)))))))
    (not (= (loc<Ref> a@60@01 (- __rw_j1@78@01 1)) $Ref.null))
    (not (= (loc<Ref> a@60@01 (+ (- __rw_j1@78@01 1) 1)) $Ref.null)))))
; [eval] old((unfolding acc(access(a, __rw_j1 - 1), write) in loc(a, __rw_j1).val))
; [eval] (unfolding acc(access(a, __rw_j1 - 1), write) in loc(a, __rw_j1).val)
; [eval] __rw_j1 - 1
(push) ; 8
; [eval] __rw_j1 - 1
; Precomputing data for removing quantified permissions
(define-fun pTaken@80@01 ((a IArray) (i Int) (__rw_j1@78@01 Int)) $Perm
  (ite
    (and (= a a@60@01) (= i (- __rw_j1@78@01 1)))
    ($Perm.min
      (ite
        (and
          (img@66@01 a i)
          (and
            (>= (inv@65@01 a i) 0)
            (and
              (< (inv@65@01 a i) (len<Int> a@60@01))
              (= (mod (inv@65@01 a i) 2) 0))))
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
(push) ; 9
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=
    (-
      (ite
        (and
          (img@66@01 a i)
          (and
            (>= (inv@65@01 a i) 0)
            (and
              (< (inv@65@01 a i) (len<Int> a@60@01))
              (= (mod (inv@65@01 a i) 2) 0))))
        $Perm.Write
        $Perm.No)
      (pTaken@80@01 a i __rw_j1@78@01))
    $Perm.No)
  
  :qid |quant-u-47|))))
(check-sat)
; unknown
(pop) ; 9
; 0,50s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (forall ((a IArray) (i Int)) (!
  (= (pTaken@80@01 a i __rw_j1@78@01) $Perm.No)
  
  :qid |quant-u-48|))))
(check-sat)
; unknown
(pop) ; 9
; 0,01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=>
    (and (= a a@60@01) (= i (- __rw_j1@78@01 1)))
    (= (- $Perm.Write (pTaken@80@01 a i __rw_j1@78@01)) $Perm.No))
  
  :qid |quant-u-49|))))
(check-sat)
; unsat
(pop) ; 9
; 0,02s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@66@01 a@60@01 (- __rw_j1@78@01 1))
    (and
      (>= (inv@65@01 a@60@01 (- __rw_j1@78@01 1)) 0)
      (and
        (< (inv@65@01 a@60@01 (- __rw_j1@78@01 1)) (len<Int> a@60@01))
        (= (mod (inv@65@01 a@60@01 (- __rw_j1@78@01 1)) 2) 0))))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1)))
        $Snap.unit))
    (=
      ($PSF.lookup_access (as sm@76@01  $PSF<access>) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1))))
      ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@63@01))))) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1))))))))
(assert (access%trigger ($PSF.lookup_access (as sm@76@01  $PSF<access>) ($Snap.combine
  ($SortWrappers.IArrayTo$Snap a@60@01)
  ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1)))) a@60@01 (- __rw_j1@78@01 1)))
; [eval] i % 2 == 0
; [eval] i % 2
; [then-branch: 33 | __rw_j1@78@01 - 1 % 2 == 0 | live]
; [else-branch: 33 | __rw_j1@78@01 - 1 % 2 != 0 | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 33 | __rw_j1@78@01 - 1 % 2 == 0]
(assert (=
  ($PSF.lookup_access (as sm@76@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1))))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_access (as sm@76@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1)))))
    ($Snap.second ($PSF.lookup_access (as sm@76@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1))))))))
; [eval] loc(a, i)
(assert (not (= (loc<Ref> a@60@01 (- __rw_j1@78@01 1)) $Ref.null)))
; [eval] loc(a, i + 1)
; [eval] i + 1
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  (loc<Ref> a@60@01 (- __rw_j1@78@01 1))
  (loc<Ref> a@60@01 (+ (- __rw_j1@78@01 1) 1)))))
(check-sat)
; unknown
(pop) ; 10
; 0,01s
; (get-info :all-statistics)
(assert (not (= (loc<Ref> a@60@01 (+ (- __rw_j1@78@01 1) 1)) $Ref.null)))
; [eval] loc(a, __rw_j1)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= (loc<Ref> a@60@01 (+ (- __rw_j1@78@01 1) 1)) (loc<Ref> a@60@01 __rw_j1@78@01))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
(set-option :timeout 0)
(push) ; 9
; [else-branch: 33 | __rw_j1@78@01 - 1 % 2 != 0]
(assert (not (= (mod (- __rw_j1@78@01 1) 2) 0)))
(assert (=
  ($PSF.lookup_access (as sm@76@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1))))
  $Snap.unit))
; [eval] loc(a, __rw_j1)
(check-sat)
; unsat
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (and
  (=>
    (and
      (img@66@01 a@60@01 (- __rw_j1@78@01 1))
      (and
        (>= (inv@65@01 a@60@01 (- __rw_j1@78@01 1)) 0)
        (and
          (< (inv@65@01 a@60@01 (- __rw_j1@78@01 1)) (len<Int> a@60@01))
          (= (mod (inv@65@01 a@60@01 (- __rw_j1@78@01 1)) 2) 0))))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.IArrayTo$Snap a@60@01)
            ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1)))
          $Snap.unit))
      (=
        ($PSF.lookup_access (as sm@76@01  $PSF<access>) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1))))
        ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@63@01))))) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1)))))))
  (access%trigger ($PSF.lookup_access (as sm@76@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1)))) a@60@01 (- __rw_j1@78@01 1))))
(assert (=>
  (= (mod (- __rw_j1@78@01 1) 2) 0)
  (and
    (=
      ($PSF.lookup_access (as sm@76@01  $PSF<access>) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1))))
      ($Snap.combine
        ($Snap.first ($PSF.lookup_access (as sm@76@01  $PSF<access>) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1)))))
        ($Snap.second ($PSF.lookup_access (as sm@76@01  $PSF<access>) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1)))))))
    (not (= (loc<Ref> a@60@01 (- __rw_j1@78@01 1)) $Ref.null))
    (not (= (loc<Ref> a@60@01 (+ (- __rw_j1@78@01 1) 1)) $Ref.null)))))
(pop) ; 7
(push) ; 7
; [else-branch: 31 | !(__rw_j1@78@01 - 1 >= 0 && __rw_j1@78@01 - 1 < i@61@01 && __rw_j1@78@01 - 1 % 2 == 0)]
(assert (not
  (and
    (>= (- __rw_j1@78@01 1) 0)
    (and (< (- __rw_j1@78@01 1) i@61@01) (= (mod (- __rw_j1@78@01 1) 2) 0)))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (and
    (>= (- __rw_j1@78@01 1) 0)
    (and (< (- __rw_j1@78@01 1) i@61@01) (= (mod (- __rw_j1@78@01 1) 2) 0)))
  (and
    (>= (- __rw_j1@78@01 1) 0)
    (< (- __rw_j1@78@01 1) i@61@01)
    (= (mod (- __rw_j1@78@01 1) 2) 0)
    (=>
      (and
        (img@70@01 a@60@01 (- __rw_j1@78@01 1))
        (and
          (>= (inv@69@01 a@60@01 (- __rw_j1@78@01 1)) 0)
          (and
            (< (inv@69@01 a@60@01 (- __rw_j1@78@01 1)) (len<Int> a@60@01))
            (= (mod (inv@69@01 a@60@01 (- __rw_j1@78@01 1)) 2) 0))))
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.IArrayTo$Snap a@60@01)
              ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1)))
            $Snap.unit))
        (=
          ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
            ($SortWrappers.IArrayTo$Snap a@60@01)
            ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1))))
          ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@67@01))))) ($Snap.combine
            ($SortWrappers.IArrayTo$Snap a@60@01)
            ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1)))))))
    (access%trigger ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1)))) a@60@01 (-
      __rw_j1@78@01
      1))
    (=>
      (= (mod (- __rw_j1@78@01 1) 2) 0)
      (and
        (=
          ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
            ($SortWrappers.IArrayTo$Snap a@60@01)
            ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1))))
          ($Snap.combine
            ($Snap.first ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
              ($SortWrappers.IArrayTo$Snap a@60@01)
              ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1)))))
            ($Snap.second ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
              ($SortWrappers.IArrayTo$Snap a@60@01)
              ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1)))))))
        (not (= (loc<Ref> a@60@01 (- __rw_j1@78@01 1)) $Ref.null))
        (not (= (loc<Ref> a@60@01 (+ (- __rw_j1@78@01 1) 1)) $Ref.null))))
    (=>
      (and
        (img@66@01 a@60@01 (- __rw_j1@78@01 1))
        (and
          (>= (inv@65@01 a@60@01 (- __rw_j1@78@01 1)) 0)
          (and
            (< (inv@65@01 a@60@01 (- __rw_j1@78@01 1)) (len<Int> a@60@01))
            (= (mod (inv@65@01 a@60@01 (- __rw_j1@78@01 1)) 2) 0))))
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.IArrayTo$Snap a@60@01)
              ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1)))
            $Snap.unit))
        (=
          ($PSF.lookup_access (as sm@76@01  $PSF<access>) ($Snap.combine
            ($SortWrappers.IArrayTo$Snap a@60@01)
            ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1))))
          ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@63@01))))) ($Snap.combine
            ($SortWrappers.IArrayTo$Snap a@60@01)
            ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1)))))))
    (access%trigger ($PSF.lookup_access (as sm@76@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1)))) a@60@01 (-
      __rw_j1@78@01
      1))
    (=>
      (= (mod (- __rw_j1@78@01 1) 2) 0)
      (and
        (=
          ($PSF.lookup_access (as sm@76@01  $PSF<access>) ($Snap.combine
            ($SortWrappers.IArrayTo$Snap a@60@01)
            ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1))))
          ($Snap.combine
            ($Snap.first ($PSF.lookup_access (as sm@76@01  $PSF<access>) ($Snap.combine
              ($SortWrappers.IArrayTo$Snap a@60@01)
              ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1)))))
            ($Snap.second ($PSF.lookup_access (as sm@76@01  $PSF<access>) ($Snap.combine
              ($SortWrappers.IArrayTo$Snap a@60@01)
              ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1)))))))
        (not (= (loc<Ref> a@60@01 (- __rw_j1@78@01 1)) $Ref.null))
        (not (= (loc<Ref> a@60@01 (+ (- __rw_j1@78@01 1) 1)) $Ref.null)))))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= (- __rw_j1@78@01 1) 0)
      (and (< (- __rw_j1@78@01 1) i@61@01) (= (mod (- __rw_j1@78@01 1) 2) 0))))
  (and
    (>= (- __rw_j1@78@01 1) 0)
    (and (< (- __rw_j1@78@01 1) i@61@01) (= (mod (- __rw_j1@78@01 1) 2) 0)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (and
  (=>
    (>= (- __rw_j1@78@01 1) 0)
    (and
      (>= (- __rw_j1@78@01 1) 0)
      (or (< (- __rw_j1@78@01 1) i@61@01) (not (< (- __rw_j1@78@01 1) i@61@01)))))
  (or (>= (- __rw_j1@78@01 1) 0) (not (>= (- __rw_j1@78@01 1) 0)))
  (=>
    (and
      (>= (- __rw_j1@78@01 1) 0)
      (and (< (- __rw_j1@78@01 1) i@61@01) (= (mod (- __rw_j1@78@01 1) 2) 0)))
    (and
      (>= (- __rw_j1@78@01 1) 0)
      (< (- __rw_j1@78@01 1) i@61@01)
      (= (mod (- __rw_j1@78@01 1) 2) 0)
      (=>
        (and
          (img@70@01 a@60@01 (- __rw_j1@78@01 1))
          (and
            (>= (inv@69@01 a@60@01 (- __rw_j1@78@01 1)) 0)
            (and
              (< (inv@69@01 a@60@01 (- __rw_j1@78@01 1)) (len<Int> a@60@01))
              (= (mod (inv@69@01 a@60@01 (- __rw_j1@78@01 1)) 2) 0))))
        (and
          (not
            (=
              ($Snap.combine
                ($SortWrappers.IArrayTo$Snap a@60@01)
                ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1)))
              $Snap.unit))
          (=
            ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
              ($SortWrappers.IArrayTo$Snap a@60@01)
              ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1))))
            ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@67@01))))) ($Snap.combine
              ($SortWrappers.IArrayTo$Snap a@60@01)
              ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1)))))))
      (access%trigger ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1)))) a@60@01 (-
        __rw_j1@78@01
        1))
      (=>
        (= (mod (- __rw_j1@78@01 1) 2) 0)
        (and
          (=
            ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
              ($SortWrappers.IArrayTo$Snap a@60@01)
              ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1))))
            ($Snap.combine
              ($Snap.first ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
                ($SortWrappers.IArrayTo$Snap a@60@01)
                ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1)))))
              ($Snap.second ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
                ($SortWrappers.IArrayTo$Snap a@60@01)
                ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1)))))))
          (not (= (loc<Ref> a@60@01 (- __rw_j1@78@01 1)) $Ref.null))
          (not (= (loc<Ref> a@60@01 (+ (- __rw_j1@78@01 1) 1)) $Ref.null))))
      (=>
        (and
          (img@66@01 a@60@01 (- __rw_j1@78@01 1))
          (and
            (>= (inv@65@01 a@60@01 (- __rw_j1@78@01 1)) 0)
            (and
              (< (inv@65@01 a@60@01 (- __rw_j1@78@01 1)) (len<Int> a@60@01))
              (= (mod (inv@65@01 a@60@01 (- __rw_j1@78@01 1)) 2) 0))))
        (and
          (not
            (=
              ($Snap.combine
                ($SortWrappers.IArrayTo$Snap a@60@01)
                ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1)))
              $Snap.unit))
          (=
            ($PSF.lookup_access (as sm@76@01  $PSF<access>) ($Snap.combine
              ($SortWrappers.IArrayTo$Snap a@60@01)
              ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1))))
            ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@63@01))))) ($Snap.combine
              ($SortWrappers.IArrayTo$Snap a@60@01)
              ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1)))))))
      (access%trigger ($PSF.lookup_access (as sm@76@01  $PSF<access>) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1)))) a@60@01 (-
        __rw_j1@78@01
        1))
      (=>
        (= (mod (- __rw_j1@78@01 1) 2) 0)
        (and
          (=
            ($PSF.lookup_access (as sm@76@01  $PSF<access>) ($Snap.combine
              ($SortWrappers.IArrayTo$Snap a@60@01)
              ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1))))
            ($Snap.combine
              ($Snap.first ($PSF.lookup_access (as sm@76@01  $PSF<access>) ($Snap.combine
                ($SortWrappers.IArrayTo$Snap a@60@01)
                ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1)))))
              ($Snap.second ($PSF.lookup_access (as sm@76@01  $PSF<access>) ($Snap.combine
                ($SortWrappers.IArrayTo$Snap a@60@01)
                ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1)))))))
          (not (= (loc<Ref> a@60@01 (- __rw_j1@78@01 1)) $Ref.null))
          (not (= (loc<Ref> a@60@01 (+ (- __rw_j1@78@01 1) 1)) $Ref.null))))))
  (or
    (not
      (and
        (>= (- __rw_j1@78@01 1) 0)
        (and (< (- __rw_j1@78@01 1) i@61@01) (= (mod (- __rw_j1@78@01 1) 2) 0))))
    (and
      (>= (- __rw_j1@78@01 1) 0)
      (and (< (- __rw_j1@78@01 1) i@61@01) (= (mod (- __rw_j1@78@01 1) 2) 0))))))
; [eval] old(loc(a, __rw_j1))
; [eval] loc(a, __rw_j1)
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((__rw_j1@78@01 Int)) (!
  (and
    (=>
      (>= (- __rw_j1@78@01 1) 0)
      (and
        (>= (- __rw_j1@78@01 1) 0)
        (or
          (< (- __rw_j1@78@01 1) i@61@01)
          (not (< (- __rw_j1@78@01 1) i@61@01)))))
    (or (>= (- __rw_j1@78@01 1) 0) (not (>= (- __rw_j1@78@01 1) 0)))
    (=>
      (and
        (>= (- __rw_j1@78@01 1) 0)
        (and (< (- __rw_j1@78@01 1) i@61@01) (= (mod (- __rw_j1@78@01 1) 2) 0)))
      (and
        (>= (- __rw_j1@78@01 1) 0)
        (< (- __rw_j1@78@01 1) i@61@01)
        (= (mod (- __rw_j1@78@01 1) 2) 0)
        (=>
          (and
            (img@70@01 a@60@01 (- __rw_j1@78@01 1))
            (and
              (>= (inv@69@01 a@60@01 (- __rw_j1@78@01 1)) 0)
              (and
                (< (inv@69@01 a@60@01 (- __rw_j1@78@01 1)) (len<Int> a@60@01))
                (= (mod (inv@69@01 a@60@01 (- __rw_j1@78@01 1)) 2) 0))))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.IArrayTo$Snap a@60@01)
                  ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1)))
                $Snap.unit))
            (=
              ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
                ($SortWrappers.IArrayTo$Snap a@60@01)
                ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1))))
              ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@67@01))))) ($Snap.combine
                ($SortWrappers.IArrayTo$Snap a@60@01)
                ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1)))))))
        (access%trigger ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1)))) a@60@01 (-
          __rw_j1@78@01
          1))
        (=>
          (= (mod (- __rw_j1@78@01 1) 2) 0)
          (and
            (=
              ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
                ($SortWrappers.IArrayTo$Snap a@60@01)
                ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1))))
              ($Snap.combine
                ($Snap.first ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
                  ($SortWrappers.IArrayTo$Snap a@60@01)
                  ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1)))))
                ($Snap.second ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
                  ($SortWrappers.IArrayTo$Snap a@60@01)
                  ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1)))))))
            (not (= (loc<Ref> a@60@01 (- __rw_j1@78@01 1)) $Ref.null))
            (not (= (loc<Ref> a@60@01 (+ (- __rw_j1@78@01 1) 1)) $Ref.null))))
        (=>
          (and
            (img@66@01 a@60@01 (- __rw_j1@78@01 1))
            (and
              (>= (inv@65@01 a@60@01 (- __rw_j1@78@01 1)) 0)
              (and
                (< (inv@65@01 a@60@01 (- __rw_j1@78@01 1)) (len<Int> a@60@01))
                (= (mod (inv@65@01 a@60@01 (- __rw_j1@78@01 1)) 2) 0))))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.IArrayTo$Snap a@60@01)
                  ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1)))
                $Snap.unit))
            (=
              ($PSF.lookup_access (as sm@76@01  $PSF<access>) ($Snap.combine
                ($SortWrappers.IArrayTo$Snap a@60@01)
                ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1))))
              ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@63@01))))) ($Snap.combine
                ($SortWrappers.IArrayTo$Snap a@60@01)
                ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1)))))))
        (access%trigger ($PSF.lookup_access (as sm@76@01  $PSF<access>) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1)))) a@60@01 (-
          __rw_j1@78@01
          1))
        (=>
          (= (mod (- __rw_j1@78@01 1) 2) 0)
          (and
            (=
              ($PSF.lookup_access (as sm@76@01  $PSF<access>) ($Snap.combine
                ($SortWrappers.IArrayTo$Snap a@60@01)
                ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1))))
              ($Snap.combine
                ($Snap.first ($PSF.lookup_access (as sm@76@01  $PSF<access>) ($Snap.combine
                  ($SortWrappers.IArrayTo$Snap a@60@01)
                  ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1)))))
                ($Snap.second ($PSF.lookup_access (as sm@76@01  $PSF<access>) ($Snap.combine
                  ($SortWrappers.IArrayTo$Snap a@60@01)
                  ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1)))))))
            (not (= (loc<Ref> a@60@01 (- __rw_j1@78@01 1)) $Ref.null))
            (not (= (loc<Ref> a@60@01 (+ (- __rw_j1@78@01 1) 1)) $Ref.null))))))
    (or
      (not
        (and
          (>= (- __rw_j1@78@01 1) 0)
          (and (< (- __rw_j1@78@01 1) i@61@01) (= (mod (- __rw_j1@78@01 1) 2) 0))))
      (and
        (>= (- __rw_j1@78@01 1) 0)
        (and (< (- __rw_j1@78@01 1) i@61@01) (= (mod (- __rw_j1@78@01 1) 2) 0)))))
  :pattern ((loc<Ref> a@60@01 __rw_j1@78@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/issues/block_array.vpr@51@9@51@161-aux|)))
(assert (forall ((__rw_j1@78@01 Int)) (!
  (=>
    (and
      (>= (- __rw_j1@78@01 1) 0)
      (and (< (- __rw_j1@78@01 1) i@61@01) (= (mod (- __rw_j1@78@01 1) 2) 0)))
    (=
      ($SortWrappers.$SnapToInt ($Snap.second ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1))))))
      ($SortWrappers.$SnapToInt ($Snap.second ($PSF.lookup_access (as sm@76@01  $PSF<access>) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap (- __rw_j1@78@01 1))))))))
  :pattern ((loc<Ref> a@60@01 __rw_j1@78@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/issues/block_array.vpr@51@9@51@161|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@67@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@67@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@67@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@67@01)))))))
  $Snap.unit))
; [eval] (unfolding acc(access(a, i), write) in loc(a, i).val == newVal)
(push) ; 3
; Precomputing data for removing quantified permissions
(define-fun pTaken@81@01 ((a IArray) (i Int)) $Perm
  (ite
    (and (= a a@60@01) (= i i@61@01))
    ($Perm.min
      (ite
        (and
          (img@70@01 a i)
          (and
            (>= (inv@69@01 a i) 0)
            (and
              (< (inv@69@01 a i) (len<Int> a@60@01))
              (= (mod (inv@69@01 a i) 2) 0))))
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
(assert (not (forall ((a IArray) (i Int)) (!
  (=
    (-
      (ite
        (and
          (img@70@01 a i)
          (and
            (>= (inv@69@01 a i) 0)
            (and
              (< (inv@69@01 a i) (len<Int> a@60@01))
              (= (mod (inv@69@01 a i) 2) 0))))
        $Perm.Write
        $Perm.No)
      (pTaken@81@01 a i))
    $Perm.No)
  
  :qid |quant-u-51|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((a IArray) (i Int)) (!
  (= (pTaken@81@01 a i) $Perm.No)
  
  :qid |quant-u-52|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=>
    (and (= a a@60@01) (= i i@61@01))
    (= (- $Perm.Write (pTaken@81@01 a i)) $Perm.No))
  
  :qid |quant-u-53|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@70@01 a@60@01 i@61@01)
    (and
      (>= (inv@69@01 a@60@01 i@61@01) 0)
      (and
        (< (inv@69@01 a@60@01 i@61@01) (len<Int> a@60@01))
        (= (mod (inv@69@01 a@60@01 i@61@01) 2) 0))))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap i@61@01))
        $Snap.unit))
    (=
      ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap i@61@01)))
      ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@67@01))))) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap i@61@01)))))))
(assert (access%trigger ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
  ($SortWrappers.IArrayTo$Snap a@60@01)
  ($SortWrappers.IntTo$Snap i@61@01))) a@60@01 i@61@01))
; [eval] i % 2 == 0
; [eval] i % 2
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= (mod i@61@01 2) 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 34 | i@61@01 % 2 == 0 | live]
; [else-branch: 34 | i@61@01 % 2 != 0 | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 34 | i@61@01 % 2 == 0]
(assert (=
  ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap i@61@01)))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap i@61@01))))
    ($Snap.second ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap i@61@01)))))))
; [eval] loc(a, i)
(assert (not (= (loc<Ref> a@60@01 i@61@01) $Ref.null)))
; [eval] loc(a, i + 1)
; [eval] i + 1
(push) ; 5
(set-option :timeout 10)
(assert (not (= (loc<Ref> a@60@01 i@61@01) (loc<Ref> a@60@01 (+ i@61@01 1)))))
(check-sat)
; unknown
(pop) ; 5
; 0,01s
; (get-info :all-statistics)
(assert (not (= (loc<Ref> a@60@01 (+ i@61@01 1)) $Ref.null)))
; [eval] loc(a, i).val == newVal
; [eval] loc(a, i)
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (and
  (=>
    (and
      (img@70@01 a@60@01 i@61@01)
      (and
        (>= (inv@69@01 a@60@01 i@61@01) 0)
        (and
          (< (inv@69@01 a@60@01 i@61@01) (len<Int> a@60@01))
          (= (mod (inv@69@01 a@60@01 i@61@01) 2) 0))))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.IArrayTo$Snap a@60@01)
            ($SortWrappers.IntTo$Snap i@61@01))
          $Snap.unit))
      (=
        ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap i@61@01)))
        ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@67@01))))) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap i@61@01))))))
  (access%trigger ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap i@61@01))) a@60@01 i@61@01)))
(assert (=>
  (= (mod i@61@01 2) 0)
  (and
    (=
      ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap i@61@01)))
      ($Snap.combine
        ($Snap.first ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap i@61@01))))
        ($Snap.second ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap i@61@01))))))
    (not (= (loc<Ref> a@60@01 i@61@01) $Ref.null))
    (not (= (loc<Ref> a@60@01 (+ i@61@01 1)) $Ref.null)))))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap i@61@01)))))
  newVal@62@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@67@01)))))))
  $Snap.unit))
; [eval] (unfolding acc(access(a, i), write) in loc(a, i + 1).val == newVal)
(set-option :timeout 0)
(push) ; 3
; Precomputing data for removing quantified permissions
(define-fun pTaken@82@01 ((a IArray) (i Int)) $Perm
  (ite
    (and (= a a@60@01) (= i i@61@01))
    ($Perm.min
      (ite
        (and
          (img@70@01 a i)
          (and
            (>= (inv@69@01 a i) 0)
            (and
              (< (inv@69@01 a i) (len<Int> a@60@01))
              (= (mod (inv@69@01 a i) 2) 0))))
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
(assert (not (forall ((a IArray) (i Int)) (!
  (=
    (-
      (ite
        (and
          (img@70@01 a i)
          (and
            (>= (inv@69@01 a i) 0)
            (and
              (< (inv@69@01 a i) (len<Int> a@60@01))
              (= (mod (inv@69@01 a i) 2) 0))))
        $Perm.Write
        $Perm.No)
      (pTaken@82@01 a i))
    $Perm.No)
  
  :qid |quant-u-55|))))
(check-sat)
; unknown
(pop) ; 4
; 0,51s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((a IArray) (i Int)) (!
  (= (pTaken@82@01 a i) $Perm.No)
  
  :qid |quant-u-56|))))
(check-sat)
; unknown
(pop) ; 4
; 0,01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=>
    (and (= a a@60@01) (= i i@61@01))
    (= (- $Perm.Write (pTaken@82@01 a i)) $Perm.No))
  
  :qid |quant-u-57|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values (instantiated)
; [eval] i % 2 == 0
; [eval] i % 2
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= (mod i@61@01 2) 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,01s
; (get-info :all-statistics)
; [then-branch: 35 | i@61@01 % 2 == 0 | live]
; [else-branch: 35 | i@61@01 % 2 != 0 | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 35 | i@61@01 % 2 == 0]
(assert (=
  ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap i@61@01)))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap i@61@01))))
    ($Snap.second ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap i@61@01)))))))
; [eval] loc(a, i)
(assert (not (= (loc<Ref> a@60@01 i@61@01) $Ref.null)))
; [eval] loc(a, i + 1)
; [eval] i + 1
(push) ; 5
(set-option :timeout 10)
(assert (not (= (loc<Ref> a@60@01 i@61@01) (loc<Ref> a@60@01 (+ i@61@01 1)))))
(check-sat)
; unknown
(pop) ; 5
; 0,01s
; (get-info :all-statistics)
(assert (not (= (loc<Ref> a@60@01 (+ i@61@01 1)) $Ref.null)))
; [eval] loc(a, i + 1).val == newVal
; [eval] loc(a, i + 1)
; [eval] i + 1
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.second ($PSF.lookup_access (as sm@73@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap i@61@01)))))
  newVal@62@01))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; unfold acc(access(a, i), write)
; Precomputing data for removing quantified permissions
(define-fun pTaken@83@01 ((a IArray) (i Int)) $Perm
  (ite
    (and (= a a@60@01) (= i i@61@01))
    ($Perm.min
      (ite
        (and
          (img@66@01 a i)
          (and
            (>= (inv@65@01 a i) 0)
            (and
              (< (inv@65@01 a i) (len<Int> a@60@01))
              (= (mod (inv@65@01 a i) 2) 0))))
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
(assert (not (forall ((a IArray) (i Int)) (!
  (=
    (-
      (ite
        (and
          (img@66@01 a i)
          (and
            (>= (inv@65@01 a i) 0)
            (and
              (< (inv@65@01 a i) (len<Int> a@60@01))
              (= (mod (inv@65@01 a i) 2) 0))))
        $Perm.Write
        $Perm.No)
      (pTaken@83@01 a i))
    $Perm.No)
  
  :qid |quant-u-59|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((a IArray) (i Int)) (!
  (= (pTaken@83@01 a i) $Perm.No)
  
  :qid |quant-u-60|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=>
    (and (= a a@60@01) (= i i@61@01))
    (= (- $Perm.Write (pTaken@83@01 a i)) $Perm.No))
  
  :qid |quant-u-61|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@84@01 $PSF<access>)
(declare-const s@85@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@66@01 a@60@01 i@61@01)
    (and
      (>= (inv@65@01 a@60@01 i@61@01) 0)
      (and
        (< (inv@65@01 a@60@01 i@61@01) (len<Int> a@60@01))
        (= (mod (inv@65@01 a@60@01 i@61@01) 2) 0))))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap i@61@01))
        $Snap.unit))
    (=
      ($PSF.lookup_access (as sm@84@01  $PSF<access>) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap i@61@01)))
      ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@63@01))))) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap i@61@01)))))))
; [eval] i % 2 == 0
; [eval] i % 2
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= (mod i@61@01 2) 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 36 | i@61@01 % 2 == 0 | live]
; [else-branch: 36 | i@61@01 % 2 != 0 | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 36 | i@61@01 % 2 == 0]
(assert (=
  ($PSF.lookup_access (as sm@84@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap i@61@01)))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_access (as sm@84@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap i@61@01))))
    ($Snap.second ($PSF.lookup_access (as sm@84@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap i@61@01)))))))
; [eval] loc(a, i)
(assert (not (= (loc<Ref> a@60@01 i@61@01) $Ref.null)))
; [eval] loc(a, i + 1)
; [eval] i + 1
(push) ; 4
(set-option :timeout 10)
(assert (not (= (loc<Ref> a@60@01 i@61@01) (loc<Ref> a@60@01 (+ i@61@01 1)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not (= (loc<Ref> a@60@01 (+ i@61@01 1)) $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (access%trigger ($PSF.lookup_access (as sm@84@01  $PSF<access>) ($Snap.combine
  ($SortWrappers.IArrayTo$Snap a@60@01)
  ($SortWrappers.IntTo$Snap i@61@01))) a@60@01 i@61@01))
; [exec]
; loc(a, i).val := newVal
; [eval] loc(a, i)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (loc<Ref> a@60@01 (+ i@61@01 1)) (loc<Ref> a@60@01 i@61@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [exec]
; loc(a, i + 1).val := newVal
; [eval] loc(a, i + 1)
; [eval] i + 1
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (loc<Ref> a@60@01 i@61@01) (loc<Ref> a@60@01 (+ i@61@01 1)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [exec]
; fold acc(access(a, i), write)
; [eval] i % 2 == 0
; [eval] i % 2
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= (mod i@61@01 2) 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 37 | i@61@01 % 2 == 0 | live]
; [else-branch: 37 | i@61@01 % 2 != 0 | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 37 | i@61@01 % 2 == 0]
; [eval] loc(a, i)
; [eval] loc(a, i + 1)
; [eval] i + 1
(assert (access%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap newVal@62@01)
  ($SortWrappers.IntTo$Snap newVal@62@01)) a@60@01 i@61@01))
(declare-const sm@86@01 $PSF<access>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_access (as sm@86@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap i@61@01)))
  ($Snap.combine
    ($SortWrappers.IntTo$Snap newVal@62@01)
    ($SortWrappers.IntTo$Snap newVal@62@01))))
; [eval] i + 2 < len(a)
; [eval] i + 2
; [eval] len(a)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< (+ i@61@01 2) (len<Int> a@60@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< (+ i@61@01 2) (len<Int> a@60@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 38 | i@61@01 + 2 < len[Int](a@60@01) | live]
; [else-branch: 38 | !(i@61@01 + 2 < len[Int](a@60@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 38 | i@61@01 + 2 < len[Int](a@60@01)]
(assert (< (+ i@61@01 2) (len<Int> a@60@01)))
; [exec]
; setVal(a, i + 2, newVal)
; [eval] i + 2
; [eval] i >= 0
(push) ; 6
(assert (not (>= (+ i@61@01 2) 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (>= (+ i@61@01 2) 0))
; [eval] i < len(a)
; [eval] len(a)
; [eval] i % 2 == 0
; [eval] i % 2
(push) ; 6
(assert (not (= (mod (+ i@61@01 2) 2) 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (= (mod (+ i@61@01 2) 2) 0))
; [eval] len(a) % 2 == 0
; [eval] len(a) % 2
; [eval] len(a)
(declare-const j@87@01 Int)
(push) ; 6
; [eval] j >= 0 && (j < len(a) && j % 2 == 0)
; [eval] j >= 0
(push) ; 7
; [then-branch: 39 | !(j@87@01 >= 0) | live]
; [else-branch: 39 | j@87@01 >= 0 | live]
(push) ; 8
; [then-branch: 39 | !(j@87@01 >= 0)]
(assert (not (>= j@87@01 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 39 | j@87@01 >= 0]
(assert (>= j@87@01 0))
; [eval] j < len(a)
; [eval] len(a)
(push) ; 9
; [then-branch: 40 | !(j@87@01 < len[Int](a@60@01)) | live]
; [else-branch: 40 | j@87@01 < len[Int](a@60@01) | live]
(push) ; 10
; [then-branch: 40 | !(j@87@01 < len[Int](a@60@01))]
(assert (not (< j@87@01 (len<Int> a@60@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 40 | j@87@01 < len[Int](a@60@01)]
(assert (< j@87@01 (len<Int> a@60@01)))
; [eval] j % 2 == 0
; [eval] j % 2
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< j@87@01 (len<Int> a@60@01)) (not (< j@87@01 (len<Int> a@60@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@87@01 0)
  (and
    (>= j@87@01 0)
    (or (< j@87@01 (len<Int> a@60@01)) (not (< j@87@01 (len<Int> a@60@01)))))))
(assert (or (>= j@87@01 0) (not (>= j@87@01 0))))
(assert (and (>= j@87@01 0) (and (< j@87@01 (len<Int> a@60@01)) (= (mod j@87@01 2) 0))))
(pop) ; 6
(declare-fun inv@88@01 (IArray Int) Int)
(declare-fun img@89@01 (IArray Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@87@01 Int)) (!
  (=>
    (and
      (>= j@87@01 0)
      (and (< j@87@01 (len<Int> a@60@01)) (= (mod j@87@01 2) 0)))
    (and
      (=>
        (>= j@87@01 0)
        (and
          (>= j@87@01 0)
          (or
            (< j@87@01 (len<Int> a@60@01))
            (not (< j@87@01 (len<Int> a@60@01))))))
      (or (>= j@87@01 0) (not (>= j@87@01 0)))))
  :pattern ((inv@88@01 a@60@01 j@87@01))
  :pattern ((img@89@01 a@60@01 j@87@01))
  :qid |access-aux|)))
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((j1@87@01 Int) (j2@87@01 Int)) (!
  (=>
    (and
      (and
        (>= j1@87@01 0)
        (and (< j1@87@01 (len<Int> a@60@01)) (= (mod j1@87@01 2) 0)))
      (and
        (>= j2@87@01 0)
        (and (< j2@87@01 (len<Int> a@60@01)) (= (mod j2@87@01 2) 0)))
      (= j1@87@01 j2@87@01))
    (= j1@87@01 j2@87@01))
  
  :qid |access-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@87@01 Int)) (!
  (=>
    (and
      (>= j@87@01 0)
      (and (< j@87@01 (len<Int> a@60@01)) (= (mod j@87@01 2) 0)))
    (and (= (inv@88@01 a@60@01 j@87@01) j@87@01) (img@89@01 a@60@01 j@87@01)))
  :pattern ((inv@88@01 a@60@01 j@87@01))
  :pattern ((img@89@01 a@60@01 j@87@01))
  :qid |access-invOfFct|)))
(assert (forall ((a IArray) (i Int)) (!
  (=>
    (and
      (img@89@01 a i)
      (and
        (>= (inv@88@01 a i) 0)
        (and
          (< (inv@88@01 a i) (len<Int> a@60@01))
          (= (mod (inv@88@01 a i) 2) 0))))
    (and (= a@60@01 a) (= (inv@88@01 a i) i)))
  :pattern ((inv@88@01 a i))
  :qid |access-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@90@01 ((a IArray) (i Int)) $Perm
  (ite
    (and
      (and
        (>= (inv@88@01 a i) 0)
        (and
          (< (inv@88@01 a i) (len<Int> a@60@01))
          (= (mod (inv@88@01 a i) 2) 0)))
      (img@89@01 a i)
      (and (= a a@60@01) (= i (inv@88@01 a i))))
    ($Perm.min
      (ite
        (and
          (img@66@01 a i)
          (and
            (>= (inv@65@01 a i) 0)
            (and
              (< (inv@65@01 a i) (len<Int> a@60@01))
              (= (mod (inv@65@01 a i) 2) 0))))
        (- $Perm.Write (pTaken@83@01 a i))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@91@01 ((a IArray) (i Int)) $Perm
  (ite
    (and
      (and
        (>= (inv@88@01 a i) 0)
        (and
          (< (inv@88@01 a i) (len<Int> a@60@01))
          (= (mod (inv@88@01 a i) 2) 0)))
      (img@89@01 a i)
      (and (= a a@60@01) (= i (inv@88@01 a i))))
    ($Perm.min
      (ite (and (= a a@60@01) (= i i@61@01)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@90@01 a i)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=
    (-
      (ite
        (and
          (img@66@01 a i)
          (and
            (>= (inv@65@01 a i) 0)
            (and
              (< (inv@65@01 a i) (len<Int> a@60@01))
              (= (mod (inv@65@01 a i) 2) 0))))
        (- $Perm.Write (pTaken@83@01 a i))
        $Perm.No)
      (pTaken@90@01 a i))
    $Perm.No)
  
  :qid |quant-u-64|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=>
    (and
      (and
        (>= (inv@88@01 a i) 0)
        (and
          (< (inv@88@01 a i) (len<Int> a@60@01))
          (= (mod (inv@88@01 a i) 2) 0)))
      (img@89@01 a i)
      (and (= a a@60@01) (= i (inv@88@01 a i))))
    (= (- $Perm.Write (pTaken@90@01 a i)) $Perm.No))
  
  :qid |quant-u-65|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@91@01 a@60@01 i@61@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=>
    (and
      (and
        (>= (inv@88@01 a i) 0)
        (and
          (< (inv@88@01 a i) (len<Int> a@60@01))
          (= (mod (inv@88@01 a i) 2) 0)))
      (img@89@01 a i)
      (and (= a a@60@01) (= i (inv@88@01 a i))))
    (= (- (- $Perm.Write (pTaken@90@01 a i)) (pTaken@91@01 a i)) $Perm.No))
  
  :qid |quant-u-67|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@92@01 $PSF<access>)
(declare-const s@93@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@93@01 $Snap)) (!
  (and
    (=>
      (Set_in s@93@01 ($PSF.domain_access (as sm@92@01  $PSF<access>)))
      (and
        (and
          (>=
            (inv@88@01 ($SortWrappers.$SnapToIArray ($Snap.first s@93@01)) ($SortWrappers.$SnapToInt ($Snap.second s@93@01)))
            0)
          (and
            (<
              (inv@88@01 ($SortWrappers.$SnapToIArray ($Snap.first s@93@01)) ($SortWrappers.$SnapToInt ($Snap.second s@93@01)))
              (len<Int> a@60@01))
            (=
              (mod
                (inv@88@01 ($SortWrappers.$SnapToIArray ($Snap.first s@93@01)) ($SortWrappers.$SnapToInt ($Snap.second s@93@01)))
                2)
              0)))
        (img@89@01 ($SortWrappers.$SnapToIArray ($Snap.first s@93@01)) ($SortWrappers.$SnapToInt ($Snap.second s@93@01)))))
    (=>
      (and
        (and
          (>=
            (inv@88@01 ($SortWrappers.$SnapToIArray ($Snap.first s@93@01)) ($SortWrappers.$SnapToInt ($Snap.second s@93@01)))
            0)
          (and
            (<
              (inv@88@01 ($SortWrappers.$SnapToIArray ($Snap.first s@93@01)) ($SortWrappers.$SnapToInt ($Snap.second s@93@01)))
              (len<Int> a@60@01))
            (=
              (mod
                (inv@88@01 ($SortWrappers.$SnapToIArray ($Snap.first s@93@01)) ($SortWrappers.$SnapToInt ($Snap.second s@93@01)))
                2)
              0)))
        (img@89@01 ($SortWrappers.$SnapToIArray ($Snap.first s@93@01)) ($SortWrappers.$SnapToInt ($Snap.second s@93@01))))
      (Set_in s@93@01 ($PSF.domain_access (as sm@92@01  $PSF<access>)))))
  :pattern ((Set_in s@93@01 ($PSF.domain_access (as sm@92@01  $PSF<access>))))
  :qid |qp.psmDomDef14|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@93@01 $Snap)) (!
  (=>
    (and
      (and
        (and
          (>=
            (inv@88@01 ($SortWrappers.$SnapToIArray ($Snap.first s@93@01)) ($SortWrappers.$SnapToInt ($Snap.second s@93@01)))
            0)
          (and
            (<
              (inv@88@01 ($SortWrappers.$SnapToIArray ($Snap.first s@93@01)) ($SortWrappers.$SnapToInt ($Snap.second s@93@01)))
              (len<Int> a@60@01))
            (=
              (mod
                (inv@88@01 ($SortWrappers.$SnapToIArray ($Snap.first s@93@01)) ($SortWrappers.$SnapToInt ($Snap.second s@93@01)))
                2)
              0)))
        (img@89@01 ($SortWrappers.$SnapToIArray ($Snap.first s@93@01)) ($SortWrappers.$SnapToInt ($Snap.second s@93@01))))
      (and
        (= ($SortWrappers.$SnapToIArray ($Snap.first s@93@01)) a@60@01)
        (= ($SortWrappers.$SnapToInt ($Snap.second s@93@01)) i@61@01)))
    (and
      (not (= s@93@01 $Snap.unit))
      (=
        ($PSF.lookup_access (as sm@92@01  $PSF<access>) s@93@01)
        ($PSF.lookup_access (as sm@86@01  $PSF<access>) s@93@01))))
  :pattern (($PSF.lookup_access (as sm@92@01  $PSF<access>) s@93@01))
  :pattern (($PSF.lookup_access (as sm@86@01  $PSF<access>) s@93@01))
  :qid |qp.psmValDef12|)))
(assert (forall ((s@93@01 $Snap)) (!
  (=>
    (and
      (and
        (and
          (>=
            (inv@88@01 ($SortWrappers.$SnapToIArray ($Snap.first s@93@01)) ($SortWrappers.$SnapToInt ($Snap.second s@93@01)))
            0)
          (and
            (<
              (inv@88@01 ($SortWrappers.$SnapToIArray ($Snap.first s@93@01)) ($SortWrappers.$SnapToInt ($Snap.second s@93@01)))
              (len<Int> a@60@01))
            (=
              (mod
                (inv@88@01 ($SortWrappers.$SnapToIArray ($Snap.first s@93@01)) ($SortWrappers.$SnapToInt ($Snap.second s@93@01)))
                2)
              0)))
        (img@89@01 ($SortWrappers.$SnapToIArray ($Snap.first s@93@01)) ($SortWrappers.$SnapToInt ($Snap.second s@93@01))))
      (ite
        (and
          (img@66@01 ($SortWrappers.$SnapToIArray ($Snap.first s@93@01)) ($SortWrappers.$SnapToInt ($Snap.second s@93@01)))
          (and
            (>=
              (inv@65@01 ($SortWrappers.$SnapToIArray ($Snap.first s@93@01)) ($SortWrappers.$SnapToInt ($Snap.second s@93@01)))
              0)
            (and
              (<
                (inv@65@01 ($SortWrappers.$SnapToIArray ($Snap.first s@93@01)) ($SortWrappers.$SnapToInt ($Snap.second s@93@01)))
                (len<Int> a@60@01))
              (=
                (mod
                  (inv@65@01 ($SortWrappers.$SnapToIArray ($Snap.first s@93@01)) ($SortWrappers.$SnapToInt ($Snap.second s@93@01)))
                  2)
                0))))
        (<
          $Perm.No
          (-
            $Perm.Write
            (pTaken@83@01 ($SortWrappers.$SnapToIArray ($Snap.first s@93@01)) ($SortWrappers.$SnapToInt ($Snap.second s@93@01)))))
        false))
    (and
      (not (= s@93@01 $Snap.unit))
      (=
        ($PSF.lookup_access (as sm@92@01  $PSF<access>) s@93@01)
        ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@63@01))))) s@93@01))))
  :pattern (($PSF.lookup_access (as sm@92@01  $PSF<access>) s@93@01))
  :pattern (($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@63@01))))) s@93@01))
  :qid |qp.psmValDef13|)))
(declare-const $t@94@01 $Snap)
(assert (= $t@94@01 ($Snap.combine ($Snap.first $t@94@01) ($Snap.second $t@94@01))))
(assert (= ($Snap.first $t@94@01) $Snap.unit))
; [eval] i >= 0
(assert (=
  ($Snap.second $t@94@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@94@01))
    ($Snap.second ($Snap.second $t@94@01)))))
(assert (= ($Snap.first ($Snap.second $t@94@01)) $Snap.unit))
; [eval] i < len(a)
; [eval] len(a)
(assert (=
  ($Snap.second ($Snap.second $t@94@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@94@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@94@01))) $Snap.unit))
; [eval] len(a) % 2 == old(len(a) % 2)
; [eval] len(a) % 2
; [eval] len(a)
; [eval] old(len(a) % 2)
; [eval] len(a) % 2
; [eval] len(a)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@94@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@94@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))
(declare-const j@95@01 Int)
(set-option :timeout 0)
(push) ; 6
; [eval] j >= 0 && (j < len(a) && j % 2 == 0)
; [eval] j >= 0
(push) ; 7
; [then-branch: 41 | !(j@95@01 >= 0) | live]
; [else-branch: 41 | j@95@01 >= 0 | live]
(push) ; 8
; [then-branch: 41 | !(j@95@01 >= 0)]
(assert (not (>= j@95@01 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 41 | j@95@01 >= 0]
(assert (>= j@95@01 0))
; [eval] j < len(a)
; [eval] len(a)
(push) ; 9
; [then-branch: 42 | !(j@95@01 < len[Int](a@60@01)) | live]
; [else-branch: 42 | j@95@01 < len[Int](a@60@01) | live]
(push) ; 10
; [then-branch: 42 | !(j@95@01 < len[Int](a@60@01))]
(assert (not (< j@95@01 (len<Int> a@60@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 42 | j@95@01 < len[Int](a@60@01)]
(assert (< j@95@01 (len<Int> a@60@01)))
; [eval] j % 2 == 0
; [eval] j % 2
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< j@95@01 (len<Int> a@60@01)) (not (< j@95@01 (len<Int> a@60@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@95@01 0)
  (and
    (>= j@95@01 0)
    (or (< j@95@01 (len<Int> a@60@01)) (not (< j@95@01 (len<Int> a@60@01)))))))
(assert (or (>= j@95@01 0) (not (>= j@95@01 0))))
(assert (and (>= j@95@01 0) (and (< j@95@01 (len<Int> a@60@01)) (= (mod j@95@01 2) 0))))
(pop) ; 6
(declare-fun inv@96@01 (IArray Int) Int)
(declare-fun img@97@01 (IArray Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@95@01 Int)) (!
  (=>
    (and
      (>= j@95@01 0)
      (and (< j@95@01 (len<Int> a@60@01)) (= (mod j@95@01 2) 0)))
    (and
      (=>
        (>= j@95@01 0)
        (and
          (>= j@95@01 0)
          (or
            (< j@95@01 (len<Int> a@60@01))
            (not (< j@95@01 (len<Int> a@60@01))))))
      (or (>= j@95@01 0) (not (>= j@95@01 0)))))
  :pattern ((inv@96@01 a@60@01 j@95@01))
  :pattern ((img@97@01 a@60@01 j@95@01))
  :qid |access-aux|)))
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((j1@95@01 Int) (j2@95@01 Int)) (!
  (=>
    (and
      (and
        (>= j1@95@01 0)
        (and (< j1@95@01 (len<Int> a@60@01)) (= (mod j1@95@01 2) 0)))
      (and
        (>= j2@95@01 0)
        (and (< j2@95@01 (len<Int> a@60@01)) (= (mod j2@95@01 2) 0)))
      (= j1@95@01 j2@95@01))
    (= j1@95@01 j2@95@01))
  
  :qid |access-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@95@01 Int)) (!
  (=>
    (and
      (>= j@95@01 0)
      (and (< j@95@01 (len<Int> a@60@01)) (= (mod j@95@01 2) 0)))
    (and (= (inv@96@01 a@60@01 j@95@01) j@95@01) (img@97@01 a@60@01 j@95@01)))
  :pattern ((inv@96@01 a@60@01 j@95@01))
  :pattern ((img@97@01 a@60@01 j@95@01))
  :qid |quant-u-69|)))
(assert (forall ((a IArray) (i Int)) (!
  (=>
    (and
      (img@97@01 a i)
      (and
        (>= (inv@96@01 a i) 0)
        (and
          (< (inv@96@01 a i) (len<Int> a@60@01))
          (= (mod (inv@96@01 a i) 2) 0))))
    (and (= a@60@01 a) (= (inv@96@01 a i) i)))
  :pattern ((inv@96@01 a i))
  :qid |access-fctOfInv|)))
; Permissions are non-negative
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))
  $Snap.unit))
; [eval] (forall j: Int :: { old(loc(a, j)) } j >= 0 && (j < i && j % 2 == 0) ==> (unfolding acc(access(a, j), write) in loc(a, j).val) == old((unfolding acc(access(a, j), write) in loc(a, j).val)))
(declare-const j@98@01 Int)
(push) ; 6
; [eval] j >= 0 && (j < i && j % 2 == 0) ==> (unfolding acc(access(a, j), write) in loc(a, j).val) == old((unfolding acc(access(a, j), write) in loc(a, j).val))
; [eval] j >= 0 && (j < i && j % 2 == 0)
; [eval] j >= 0
(push) ; 7
; [then-branch: 43 | !(j@98@01 >= 0) | live]
; [else-branch: 43 | j@98@01 >= 0 | live]
(push) ; 8
; [then-branch: 43 | !(j@98@01 >= 0)]
(assert (not (>= j@98@01 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 43 | j@98@01 >= 0]
(assert (>= j@98@01 0))
; [eval] j < i
(push) ; 9
; [then-branch: 44 | !(j@98@01 < i@61@01 + 2) | live]
; [else-branch: 44 | j@98@01 < i@61@01 + 2 | live]
(push) ; 10
; [then-branch: 44 | !(j@98@01 < i@61@01 + 2)]
(assert (not (< j@98@01 (+ i@61@01 2))))
(pop) ; 10
(push) ; 10
; [else-branch: 44 | j@98@01 < i@61@01 + 2]
(assert (< j@98@01 (+ i@61@01 2)))
; [eval] j % 2 == 0
; [eval] j % 2
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< j@98@01 (+ i@61@01 2)) (not (< j@98@01 (+ i@61@01 2)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@98@01 0)
  (and
    (>= j@98@01 0)
    (or (< j@98@01 (+ i@61@01 2)) (not (< j@98@01 (+ i@61@01 2)))))))
(assert (or (>= j@98@01 0) (not (>= j@98@01 0))))
(push) ; 7
; [then-branch: 45 | j@98@01 >= 0 && j@98@01 < i@61@01 + 2 && j@98@01 % 2 == 0 | live]
; [else-branch: 45 | !(j@98@01 >= 0 && j@98@01 < i@61@01 + 2 && j@98@01 % 2 == 0) | live]
(push) ; 8
; [then-branch: 45 | j@98@01 >= 0 && j@98@01 < i@61@01 + 2 && j@98@01 % 2 == 0]
(assert (and (>= j@98@01 0) (and (< j@98@01 (+ i@61@01 2)) (= (mod j@98@01 2) 0))))
; [eval] (unfolding acc(access(a, j), write) in loc(a, j).val) == old((unfolding acc(access(a, j), write) in loc(a, j).val))
; [eval] (unfolding acc(access(a, j), write) in loc(a, j).val)
(push) ; 9
; Precomputing data for removing quantified permissions
(define-fun pTaken@99@01 ((a IArray) (i Int) (j@98@01 Int)) $Perm
  (ite
    (and (= a a@60@01) (= i j@98@01))
    ($Perm.min
      (ite
        (and
          (img@97@01 a i)
          (and
            (>= (inv@96@01 a i) 0)
            (and
              (< (inv@96@01 a i) (len<Int> a@60@01))
              (= (mod (inv@96@01 a i) 2) 0))))
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
(push) ; 10
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=
    (-
      (ite
        (and
          (img@97@01 a i)
          (and
            (>= (inv@96@01 a i) 0)
            (and
              (< (inv@96@01 a i) (len<Int> a@60@01))
              (= (mod (inv@96@01 a i) 2) 0))))
        $Perm.Write
        $Perm.No)
      (pTaken@99@01 a i j@98@01))
    $Perm.No)
  
  :qid |quant-u-71|))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (forall ((a IArray) (i Int)) (!
  (= (pTaken@99@01 a i j@98@01) $Perm.No)
  
  :qid |quant-u-72|))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=>
    (and (= a a@60@01) (= i j@98@01))
    (= (- $Perm.Write (pTaken@99@01 a i j@98@01)) $Perm.No))
  
  :qid |quant-u-73|))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@100@01 $PSF<access>)
(declare-const s@101@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@97@01 a@60@01 j@98@01)
    (and
      (>= (inv@96@01 a@60@01 j@98@01) 0)
      (and
        (< (inv@96@01 a@60@01 j@98@01) (len<Int> a@60@01))
        (= (mod (inv@96@01 a@60@01 j@98@01) 2) 0))))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap j@98@01))
        $Snap.unit))
    (=
      ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap j@98@01)))
      ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@94@01))))) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap j@98@01)))))))
(assert (access%trigger ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
  ($SortWrappers.IArrayTo$Snap a@60@01)
  ($SortWrappers.IntTo$Snap j@98@01))) a@60@01 j@98@01))
; [eval] i % 2 == 0
; [eval] i % 2
; [then-branch: 46 | j@98@01 % 2 == 0 | live]
; [else-branch: 46 | j@98@01 % 2 != 0 | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 46 | j@98@01 % 2 == 0]
(assert (=
  ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap j@98@01)))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap j@98@01))))
    ($Snap.second ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap j@98@01)))))))
; [eval] loc(a, i)
(assert (not (= (loc<Ref> a@60@01 j@98@01) $Ref.null)))
; [eval] loc(a, i + 1)
; [eval] i + 1
(push) ; 11
(set-option :timeout 10)
(assert (not (= (loc<Ref> a@60@01 j@98@01) (loc<Ref> a@60@01 (+ j@98@01 1)))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(assert (not (= (loc<Ref> a@60@01 (+ j@98@01 1)) $Ref.null)))
; [eval] loc(a, j)
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 46 | j@98@01 % 2 != 0]
(assert (not (= (mod j@98@01 2) 0)))
(assert (=
  ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap j@98@01)))
  $Snap.unit))
; [eval] loc(a, j)
(check-sat)
; unsat
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (and
  (=>
    (and
      (img@97@01 a@60@01 j@98@01)
      (and
        (>= (inv@96@01 a@60@01 j@98@01) 0)
        (and
          (< (inv@96@01 a@60@01 j@98@01) (len<Int> a@60@01))
          (= (mod (inv@96@01 a@60@01 j@98@01) 2) 0))))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.IArrayTo$Snap a@60@01)
            ($SortWrappers.IntTo$Snap j@98@01))
          $Snap.unit))
      (=
        ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap j@98@01)))
        ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@94@01))))) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap j@98@01))))))
  (access%trigger ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap j@98@01))) a@60@01 j@98@01)))
(assert (=>
  (= (mod j@98@01 2) 0)
  (and
    (=
      ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap j@98@01)))
      ($Snap.combine
        ($Snap.first ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap j@98@01))))
        ($Snap.second ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap j@98@01))))))
    (not (= (loc<Ref> a@60@01 j@98@01) $Ref.null))
    (not (= (loc<Ref> a@60@01 (+ j@98@01 1)) $Ref.null)))))
; [eval] old((unfolding acc(access(a, j), write) in loc(a, j).val))
; [eval] (unfolding acc(access(a, j), write) in loc(a, j).val)
(push) ; 9
(push) ; 10
(set-option :timeout 10)
(assert (not (= i@61@01 j@98@01)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@102@01 ((a IArray) (i Int) (j@98@01 Int)) $Perm
  (ite
    (and (= a a@60@01) (= i j@98@01))
    ($Perm.min
      (ite
        (and
          (img@66@01 a i)
          (and
            (>= (inv@65@01 a i) 0)
            (and
              (< (inv@65@01 a i) (len<Int> a@60@01))
              (= (mod (inv@65@01 a i) 2) 0))))
        (- $Perm.Write (pTaken@83@01 a i))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@103@01 ((a IArray) (i Int) (j@98@01 Int)) $Perm
  (ite
    (and (= a a@60@01) (= i j@98@01))
    ($Perm.min
      (ite (and (= a a@60@01) (= i i@61@01)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@102@01 a i j@98@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=
    (-
      (ite
        (and
          (img@66@01 a i)
          (and
            (>= (inv@65@01 a i) 0)
            (and
              (< (inv@65@01 a i) (len<Int> a@60@01))
              (= (mod (inv@65@01 a i) 2) 0))))
        (- $Perm.Write (pTaken@83@01 a i))
        $Perm.No)
      (pTaken@102@01 a i j@98@01))
    $Perm.No)
  
  :qid |quant-u-75|))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (forall ((a IArray) (i Int)) (!
  (= (pTaken@102@01 a i j@98@01) $Perm.No)
  
  :qid |quant-u-76|))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=>
    (and (= a a@60@01) (= i j@98@01))
    (= (- $Perm.Write (pTaken@102@01 a i j@98@01)) $Perm.No))
  
  :qid |quant-u-77|))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@103@01 a@60@01 i@61@01 j@98@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (forall ((a IArray) (i Int)) (!
  (= (pTaken@103@01 a i j@98@01) $Perm.No)
  
  :qid |quant-u-79|))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=>
    (and (= a a@60@01) (= i j@98@01))
    (=
      (- (- $Perm.Write (pTaken@102@01 a i j@98@01)) (pTaken@103@01 a i j@98@01))
      $Perm.No))
  
  :qid |quant-u-80|))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@104@01 $PSF<access>)
(declare-const s@105@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (= j@98@01 i@61@01)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap j@98@01))
        $Snap.unit))
    (=
      ($PSF.lookup_access (as sm@104@01  $PSF<access>) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap j@98@01)))
      ($PSF.lookup_access (as sm@86@01  $PSF<access>) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap j@98@01)))))))
(assert (=>
  (ite
    (and
      (img@66@01 a@60@01 j@98@01)
      (and
        (>= (inv@65@01 a@60@01 j@98@01) 0)
        (and
          (< (inv@65@01 a@60@01 j@98@01) (len<Int> a@60@01))
          (= (mod (inv@65@01 a@60@01 j@98@01) 2) 0))))
    (< $Perm.No (- $Perm.Write (pTaken@83@01 a@60@01 j@98@01)))
    false)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap j@98@01))
        $Snap.unit))
    (=
      ($PSF.lookup_access (as sm@104@01  $PSF<access>) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap j@98@01)))
      ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@63@01))))) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap j@98@01)))))))
(assert (access%trigger ($PSF.lookup_access (as sm@104@01  $PSF<access>) ($Snap.combine
  ($SortWrappers.IArrayTo$Snap a@60@01)
  ($SortWrappers.IntTo$Snap j@98@01))) a@60@01 j@98@01))
; [eval] i % 2 == 0
; [eval] i % 2
; [then-branch: 47 | j@98@01 % 2 == 0 | live]
; [else-branch: 47 | j@98@01 % 2 != 0 | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 47 | j@98@01 % 2 == 0]
(assert (=
  ($PSF.lookup_access (as sm@104@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap j@98@01)))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_access (as sm@104@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap j@98@01))))
    ($Snap.second ($PSF.lookup_access (as sm@104@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap j@98@01)))))))
; [eval] loc(a, i)
(assert (not (= (loc<Ref> a@60@01 j@98@01) $Ref.null)))
; [eval] loc(a, i + 1)
; [eval] i + 1
(push) ; 11
(set-option :timeout 10)
(assert (not (= (loc<Ref> a@60@01 j@98@01) (loc<Ref> a@60@01 (+ j@98@01 1)))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(assert (not (= (loc<Ref> a@60@01 (+ j@98@01 1)) $Ref.null)))
; [eval] loc(a, j)
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 47 | j@98@01 % 2 != 0]
(assert (not (= (mod j@98@01 2) 0)))
(assert (=
  ($PSF.lookup_access (as sm@104@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap j@98@01)))
  $Snap.unit))
; [eval] loc(a, j)
(check-sat)
; unsat
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (and
  (=>
    (= j@98@01 i@61@01)
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.IArrayTo$Snap a@60@01)
            ($SortWrappers.IntTo$Snap j@98@01))
          $Snap.unit))
      (=
        ($PSF.lookup_access (as sm@104@01  $PSF<access>) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap j@98@01)))
        ($PSF.lookup_access (as sm@86@01  $PSF<access>) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap j@98@01))))))
  (=>
    (ite
      (and
        (img@66@01 a@60@01 j@98@01)
        (and
          (>= (inv@65@01 a@60@01 j@98@01) 0)
          (and
            (< (inv@65@01 a@60@01 j@98@01) (len<Int> a@60@01))
            (= (mod (inv@65@01 a@60@01 j@98@01) 2) 0))))
      (< $Perm.No (- $Perm.Write (pTaken@83@01 a@60@01 j@98@01)))
      false)
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.IArrayTo$Snap a@60@01)
            ($SortWrappers.IntTo$Snap j@98@01))
          $Snap.unit))
      (=
        ($PSF.lookup_access (as sm@104@01  $PSF<access>) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap j@98@01)))
        ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@63@01))))) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap j@98@01))))))
  (access%trigger ($PSF.lookup_access (as sm@104@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap j@98@01))) a@60@01 j@98@01)))
(assert (=>
  (= (mod j@98@01 2) 0)
  (and
    (=
      ($PSF.lookup_access (as sm@104@01  $PSF<access>) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap j@98@01)))
      ($Snap.combine
        ($Snap.first ($PSF.lookup_access (as sm@104@01  $PSF<access>) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap j@98@01))))
        ($Snap.second ($PSF.lookup_access (as sm@104@01  $PSF<access>) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap j@98@01))))))
    (not (= (loc<Ref> a@60@01 j@98@01) $Ref.null))
    (not (= (loc<Ref> a@60@01 (+ j@98@01 1)) $Ref.null)))))
(pop) ; 8
(push) ; 8
; [else-branch: 45 | !(j@98@01 >= 0 && j@98@01 < i@61@01 + 2 && j@98@01 % 2 == 0)]
(assert (not (and (>= j@98@01 0) (and (< j@98@01 (+ i@61@01 2)) (= (mod j@98@01 2) 0)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (and (>= j@98@01 0) (and (< j@98@01 (+ i@61@01 2)) (= (mod j@98@01 2) 0)))
  (and
    (>= j@98@01 0)
    (< j@98@01 (+ i@61@01 2))
    (= (mod j@98@01 2) 0)
    (=>
      (and
        (img@97@01 a@60@01 j@98@01)
        (and
          (>= (inv@96@01 a@60@01 j@98@01) 0)
          (and
            (< (inv@96@01 a@60@01 j@98@01) (len<Int> a@60@01))
            (= (mod (inv@96@01 a@60@01 j@98@01) 2) 0))))
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.IArrayTo$Snap a@60@01)
              ($SortWrappers.IntTo$Snap j@98@01))
            $Snap.unit))
        (=
          ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
            ($SortWrappers.IArrayTo$Snap a@60@01)
            ($SortWrappers.IntTo$Snap j@98@01)))
          ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@94@01))))) ($Snap.combine
            ($SortWrappers.IArrayTo$Snap a@60@01)
            ($SortWrappers.IntTo$Snap j@98@01))))))
    (access%trigger ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap j@98@01))) a@60@01 j@98@01)
    (=>
      (= (mod j@98@01 2) 0)
      (and
        (=
          ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
            ($SortWrappers.IArrayTo$Snap a@60@01)
            ($SortWrappers.IntTo$Snap j@98@01)))
          ($Snap.combine
            ($Snap.first ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
              ($SortWrappers.IArrayTo$Snap a@60@01)
              ($SortWrappers.IntTo$Snap j@98@01))))
            ($Snap.second ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
              ($SortWrappers.IArrayTo$Snap a@60@01)
              ($SortWrappers.IntTo$Snap j@98@01))))))
        (not (= (loc<Ref> a@60@01 j@98@01) $Ref.null))
        (not (= (loc<Ref> a@60@01 (+ j@98@01 1)) $Ref.null))))
    (=>
      (= j@98@01 i@61@01)
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.IArrayTo$Snap a@60@01)
              ($SortWrappers.IntTo$Snap j@98@01))
            $Snap.unit))
        (=
          ($PSF.lookup_access (as sm@104@01  $PSF<access>) ($Snap.combine
            ($SortWrappers.IArrayTo$Snap a@60@01)
            ($SortWrappers.IntTo$Snap j@98@01)))
          ($PSF.lookup_access (as sm@86@01  $PSF<access>) ($Snap.combine
            ($SortWrappers.IArrayTo$Snap a@60@01)
            ($SortWrappers.IntTo$Snap j@98@01))))))
    (=>
      (ite
        (and
          (img@66@01 a@60@01 j@98@01)
          (and
            (>= (inv@65@01 a@60@01 j@98@01) 0)
            (and
              (< (inv@65@01 a@60@01 j@98@01) (len<Int> a@60@01))
              (= (mod (inv@65@01 a@60@01 j@98@01) 2) 0))))
        (< $Perm.No (- $Perm.Write (pTaken@83@01 a@60@01 j@98@01)))
        false)
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.IArrayTo$Snap a@60@01)
              ($SortWrappers.IntTo$Snap j@98@01))
            $Snap.unit))
        (=
          ($PSF.lookup_access (as sm@104@01  $PSF<access>) ($Snap.combine
            ($SortWrappers.IArrayTo$Snap a@60@01)
            ($SortWrappers.IntTo$Snap j@98@01)))
          ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@63@01))))) ($Snap.combine
            ($SortWrappers.IArrayTo$Snap a@60@01)
            ($SortWrappers.IntTo$Snap j@98@01))))))
    (access%trigger ($PSF.lookup_access (as sm@104@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap j@98@01))) a@60@01 j@98@01)
    (=>
      (= (mod j@98@01 2) 0)
      (and
        (=
          ($PSF.lookup_access (as sm@104@01  $PSF<access>) ($Snap.combine
            ($SortWrappers.IArrayTo$Snap a@60@01)
            ($SortWrappers.IntTo$Snap j@98@01)))
          ($Snap.combine
            ($Snap.first ($PSF.lookup_access (as sm@104@01  $PSF<access>) ($Snap.combine
              ($SortWrappers.IArrayTo$Snap a@60@01)
              ($SortWrappers.IntTo$Snap j@98@01))))
            ($Snap.second ($PSF.lookup_access (as sm@104@01  $PSF<access>) ($Snap.combine
              ($SortWrappers.IArrayTo$Snap a@60@01)
              ($SortWrappers.IntTo$Snap j@98@01))))))
        (not (= (loc<Ref> a@60@01 j@98@01) $Ref.null))
        (not (= (loc<Ref> a@60@01 (+ j@98@01 1)) $Ref.null)))))))
; Joined path conditions
(assert (or
  (not
    (and (>= j@98@01 0) (and (< j@98@01 (+ i@61@01 2)) (= (mod j@98@01 2) 0))))
  (and (>= j@98@01 0) (and (< j@98@01 (+ i@61@01 2)) (= (mod j@98@01 2) 0)))))
; [eval] old(loc(a, j))
; [eval] loc(a, j)
(pop) ; 6
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@98@01 Int)) (!
  (and
    (=>
      (>= j@98@01 0)
      (and
        (>= j@98@01 0)
        (or (< j@98@01 (+ i@61@01 2)) (not (< j@98@01 (+ i@61@01 2))))))
    (or (>= j@98@01 0) (not (>= j@98@01 0)))
    (=>
      (and (>= j@98@01 0) (and (< j@98@01 (+ i@61@01 2)) (= (mod j@98@01 2) 0)))
      (and
        (>= j@98@01 0)
        (< j@98@01 (+ i@61@01 2))
        (= (mod j@98@01 2) 0)
        (=>
          (and
            (img@97@01 a@60@01 j@98@01)
            (and
              (>= (inv@96@01 a@60@01 j@98@01) 0)
              (and
                (< (inv@96@01 a@60@01 j@98@01) (len<Int> a@60@01))
                (= (mod (inv@96@01 a@60@01 j@98@01) 2) 0))))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.IArrayTo$Snap a@60@01)
                  ($SortWrappers.IntTo$Snap j@98@01))
                $Snap.unit))
            (=
              ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
                ($SortWrappers.IArrayTo$Snap a@60@01)
                ($SortWrappers.IntTo$Snap j@98@01)))
              ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@94@01))))) ($Snap.combine
                ($SortWrappers.IArrayTo$Snap a@60@01)
                ($SortWrappers.IntTo$Snap j@98@01))))))
        (access%trigger ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap j@98@01))) a@60@01 j@98@01)
        (=>
          (= (mod j@98@01 2) 0)
          (and
            (=
              ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
                ($SortWrappers.IArrayTo$Snap a@60@01)
                ($SortWrappers.IntTo$Snap j@98@01)))
              ($Snap.combine
                ($Snap.first ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
                  ($SortWrappers.IArrayTo$Snap a@60@01)
                  ($SortWrappers.IntTo$Snap j@98@01))))
                ($Snap.second ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
                  ($SortWrappers.IArrayTo$Snap a@60@01)
                  ($SortWrappers.IntTo$Snap j@98@01))))))
            (not (= (loc<Ref> a@60@01 j@98@01) $Ref.null))
            (not (= (loc<Ref> a@60@01 (+ j@98@01 1)) $Ref.null))))
        (=>
          (= j@98@01 i@61@01)
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.IArrayTo$Snap a@60@01)
                  ($SortWrappers.IntTo$Snap j@98@01))
                $Snap.unit))
            (=
              ($PSF.lookup_access (as sm@104@01  $PSF<access>) ($Snap.combine
                ($SortWrappers.IArrayTo$Snap a@60@01)
                ($SortWrappers.IntTo$Snap j@98@01)))
              ($PSF.lookup_access (as sm@86@01  $PSF<access>) ($Snap.combine
                ($SortWrappers.IArrayTo$Snap a@60@01)
                ($SortWrappers.IntTo$Snap j@98@01))))))
        (=>
          (ite
            (and
              (img@66@01 a@60@01 j@98@01)
              (and
                (>= (inv@65@01 a@60@01 j@98@01) 0)
                (and
                  (< (inv@65@01 a@60@01 j@98@01) (len<Int> a@60@01))
                  (= (mod (inv@65@01 a@60@01 j@98@01) 2) 0))))
            (< $Perm.No (- $Perm.Write (pTaken@83@01 a@60@01 j@98@01)))
            false)
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.IArrayTo$Snap a@60@01)
                  ($SortWrappers.IntTo$Snap j@98@01))
                $Snap.unit))
            (=
              ($PSF.lookup_access (as sm@104@01  $PSF<access>) ($Snap.combine
                ($SortWrappers.IArrayTo$Snap a@60@01)
                ($SortWrappers.IntTo$Snap j@98@01)))
              ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@63@01))))) ($Snap.combine
                ($SortWrappers.IArrayTo$Snap a@60@01)
                ($SortWrappers.IntTo$Snap j@98@01))))))
        (access%trigger ($PSF.lookup_access (as sm@104@01  $PSF<access>) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap j@98@01))) a@60@01 j@98@01)
        (=>
          (= (mod j@98@01 2) 0)
          (and
            (=
              ($PSF.lookup_access (as sm@104@01  $PSF<access>) ($Snap.combine
                ($SortWrappers.IArrayTo$Snap a@60@01)
                ($SortWrappers.IntTo$Snap j@98@01)))
              ($Snap.combine
                ($Snap.first ($PSF.lookup_access (as sm@104@01  $PSF<access>) ($Snap.combine
                  ($SortWrappers.IArrayTo$Snap a@60@01)
                  ($SortWrappers.IntTo$Snap j@98@01))))
                ($Snap.second ($PSF.lookup_access (as sm@104@01  $PSF<access>) ($Snap.combine
                  ($SortWrappers.IArrayTo$Snap a@60@01)
                  ($SortWrappers.IntTo$Snap j@98@01))))))
            (not (= (loc<Ref> a@60@01 j@98@01) $Ref.null))
            (not (= (loc<Ref> a@60@01 (+ j@98@01 1)) $Ref.null))))))
    (or
      (not
        (and
          (>= j@98@01 0)
          (and (< j@98@01 (+ i@61@01 2)) (= (mod j@98@01 2) 0))))
      (and (>= j@98@01 0) (and (< j@98@01 (+ i@61@01 2)) (= (mod j@98@01 2) 0)))))
  :pattern ((loc<Ref> a@60@01 j@98@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/issues/block_array.vpr@50@9@50@157-aux|)))
(assert (forall ((j@98@01 Int)) (!
  (=>
    (and (>= j@98@01 0) (and (< j@98@01 (+ i@61@01 2)) (= (mod j@98@01 2) 0)))
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap j@98@01)))))
      ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_access (as sm@104@01  $PSF<access>) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap j@98@01)))))))
  :pattern ((loc<Ref> a@60@01 j@98@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/issues/block_array.vpr@50@9@50@157|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))
  $Snap.unit))
; [eval] (forall __rw_j1: Int :: { old(loc(a, __rw_j1)) } true ==> __rw_j1 - 1 >= 0 && (__rw_j1 - 1 < i && (__rw_j1 - 1) % 2 == 0) ==> (unfolding acc(access(a, __rw_j1 - 1), write) in loc(a, __rw_j1).val) == old((unfolding acc(access(a, __rw_j1 - 1), write) in loc(a, __rw_j1).val)))
(declare-const __rw_j1@106@01 Int)
(push) ; 6
; [eval] true ==> __rw_j1 - 1 >= 0 && (__rw_j1 - 1 < i && (__rw_j1 - 1) % 2 == 0) ==> (unfolding acc(access(a, __rw_j1 - 1), write) in loc(a, __rw_j1).val) == old((unfolding acc(access(a, __rw_j1 - 1), write) in loc(a, __rw_j1).val))
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 48 | True | live]
; [else-branch: 48 | False | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 48 | True]
; [eval] __rw_j1 - 1 >= 0 && (__rw_j1 - 1 < i && (__rw_j1 - 1) % 2 == 0) ==> (unfolding acc(access(a, __rw_j1 - 1), write) in loc(a, __rw_j1).val) == old((unfolding acc(access(a, __rw_j1 - 1), write) in loc(a, __rw_j1).val))
; [eval] __rw_j1 - 1 >= 0 && (__rw_j1 - 1 < i && (__rw_j1 - 1) % 2 == 0)
; [eval] __rw_j1 - 1 >= 0
; [eval] __rw_j1 - 1
(push) ; 9
; [then-branch: 49 | !(__rw_j1@106@01 - 1 >= 0) | live]
; [else-branch: 49 | __rw_j1@106@01 - 1 >= 0 | live]
(push) ; 10
; [then-branch: 49 | !(__rw_j1@106@01 - 1 >= 0)]
(assert (not (>= (- __rw_j1@106@01 1) 0)))
(pop) ; 10
(push) ; 10
; [else-branch: 49 | __rw_j1@106@01 - 1 >= 0]
(assert (>= (- __rw_j1@106@01 1) 0))
; [eval] __rw_j1 - 1 < i
; [eval] __rw_j1 - 1
(push) ; 11
; [then-branch: 50 | !(__rw_j1@106@01 - 1 < i@61@01 + 2) | live]
; [else-branch: 50 | __rw_j1@106@01 - 1 < i@61@01 + 2 | live]
(push) ; 12
; [then-branch: 50 | !(__rw_j1@106@01 - 1 < i@61@01 + 2)]
(assert (not (< (- __rw_j1@106@01 1) (+ i@61@01 2))))
(pop) ; 12
(push) ; 12
; [else-branch: 50 | __rw_j1@106@01 - 1 < i@61@01 + 2]
(assert (< (- __rw_j1@106@01 1) (+ i@61@01 2)))
; [eval] (__rw_j1 - 1) % 2 == 0
; [eval] (__rw_j1 - 1) % 2
; [eval] __rw_j1 - 1
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or
  (< (- __rw_j1@106@01 1) (+ i@61@01 2))
  (not (< (- __rw_j1@106@01 1) (+ i@61@01 2)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= (- __rw_j1@106@01 1) 0)
  (and
    (>= (- __rw_j1@106@01 1) 0)
    (or
      (< (- __rw_j1@106@01 1) (+ i@61@01 2))
      (not (< (- __rw_j1@106@01 1) (+ i@61@01 2)))))))
(assert (or (>= (- __rw_j1@106@01 1) 0) (not (>= (- __rw_j1@106@01 1) 0))))
(push) ; 9
; [then-branch: 51 | __rw_j1@106@01 - 1 >= 0 && __rw_j1@106@01 - 1 < i@61@01 + 2 && __rw_j1@106@01 - 1 % 2 == 0 | live]
; [else-branch: 51 | !(__rw_j1@106@01 - 1 >= 0 && __rw_j1@106@01 - 1 < i@61@01 + 2 && __rw_j1@106@01 - 1 % 2 == 0) | live]
(push) ; 10
; [then-branch: 51 | __rw_j1@106@01 - 1 >= 0 && __rw_j1@106@01 - 1 < i@61@01 + 2 && __rw_j1@106@01 - 1 % 2 == 0]
(assert (and
  (>= (- __rw_j1@106@01 1) 0)
  (and (< (- __rw_j1@106@01 1) (+ i@61@01 2)) (= (mod (- __rw_j1@106@01 1) 2) 0))))
; [eval] (unfolding acc(access(a, __rw_j1 - 1), write) in loc(a, __rw_j1).val) == old((unfolding acc(access(a, __rw_j1 - 1), write) in loc(a, __rw_j1).val))
; [eval] (unfolding acc(access(a, __rw_j1 - 1), write) in loc(a, __rw_j1).val)
; [eval] __rw_j1 - 1
(push) ; 11
; [eval] __rw_j1 - 1
; Precomputing data for removing quantified permissions
(define-fun pTaken@107@01 ((a IArray) (i Int) (__rw_j1@106@01 Int)) $Perm
  (ite
    (and (= a a@60@01) (= i (- __rw_j1@106@01 1)))
    ($Perm.min
      (ite
        (and
          (img@97@01 a i)
          (and
            (>= (inv@96@01 a i) 0)
            (and
              (< (inv@96@01 a i) (len<Int> a@60@01))
              (= (mod (inv@96@01 a i) 2) 0))))
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
(push) ; 12
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=
    (-
      (ite
        (and
          (img@97@01 a i)
          (and
            (>= (inv@96@01 a i) 0)
            (and
              (< (inv@96@01 a i) (len<Int> a@60@01))
              (= (mod (inv@96@01 a i) 2) 0))))
        $Perm.Write
        $Perm.No)
      (pTaken@107@01 a i __rw_j1@106@01))
    $Perm.No)
  
  :qid |quant-u-82|))))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (forall ((a IArray) (i Int)) (!
  (= (pTaken@107@01 a i __rw_j1@106@01) $Perm.No)
  
  :qid |quant-u-83|))))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=>
    (and (= a a@60@01) (= i (- __rw_j1@106@01 1)))
    (= (- $Perm.Write (pTaken@107@01 a i __rw_j1@106@01)) $Perm.No))
  
  :qid |quant-u-84|))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@97@01 a@60@01 (- __rw_j1@106@01 1))
    (and
      (>= (inv@96@01 a@60@01 (- __rw_j1@106@01 1)) 0)
      (and
        (< (inv@96@01 a@60@01 (- __rw_j1@106@01 1)) (len<Int> a@60@01))
        (= (mod (inv@96@01 a@60@01 (- __rw_j1@106@01 1)) 2) 0))))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))
        $Snap.unit))
    (=
      ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1))))
      ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@94@01))))) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1))))))))
(assert (access%trigger ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
  ($SortWrappers.IArrayTo$Snap a@60@01)
  ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))) a@60@01 (- __rw_j1@106@01 1)))
; [eval] i % 2 == 0
; [eval] i % 2
; [then-branch: 52 | __rw_j1@106@01 - 1 % 2 == 0 | live]
; [else-branch: 52 | __rw_j1@106@01 - 1 % 2 != 0 | live]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 52 | __rw_j1@106@01 - 1 % 2 == 0]
(assert (=
  ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1))))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))))
    ($Snap.second ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1))))))))
; [eval] loc(a, i)
(assert (not (= (loc<Ref> a@60@01 (- __rw_j1@106@01 1)) $Ref.null)))
; [eval] loc(a, i + 1)
; [eval] i + 1
(push) ; 13
(set-option :timeout 10)
(assert (not (=
  (loc<Ref> a@60@01 (- __rw_j1@106@01 1))
  (loc<Ref> a@60@01 (+ (- __rw_j1@106@01 1) 1)))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(assert (not (= (loc<Ref> a@60@01 (+ (- __rw_j1@106@01 1) 1)) $Ref.null)))
; [eval] loc(a, __rw_j1)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (=
  (loc<Ref> a@60@01 (+ (- __rw_j1@106@01 1) 1))
  (loc<Ref> a@60@01 __rw_j1@106@01))))
(check-sat)
; unsat
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(pop) ; 12
(set-option :timeout 0)
(push) ; 12
; [else-branch: 52 | __rw_j1@106@01 - 1 % 2 != 0]
(assert (not (= (mod (- __rw_j1@106@01 1) 2) 0)))
(assert (=
  ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1))))
  $Snap.unit))
; [eval] loc(a, __rw_j1)
(check-sat)
; unsat
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (and
  (=>
    (and
      (img@97@01 a@60@01 (- __rw_j1@106@01 1))
      (and
        (>= (inv@96@01 a@60@01 (- __rw_j1@106@01 1)) 0)
        (and
          (< (inv@96@01 a@60@01 (- __rw_j1@106@01 1)) (len<Int> a@60@01))
          (= (mod (inv@96@01 a@60@01 (- __rw_j1@106@01 1)) 2) 0))))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.IArrayTo$Snap a@60@01)
            ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))
          $Snap.unit))
      (=
        ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1))))
        ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@94@01))))) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))))))
  (access%trigger ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))) a@60@01 (-
    __rw_j1@106@01
    1))))
(assert (=>
  (= (mod (- __rw_j1@106@01 1) 2) 0)
  (and
    (=
      ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1))))
      ($Snap.combine
        ($Snap.first ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))))
        ($Snap.second ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))))))
    (not (= (loc<Ref> a@60@01 (- __rw_j1@106@01 1)) $Ref.null))
    (not (= (loc<Ref> a@60@01 (+ (- __rw_j1@106@01 1) 1)) $Ref.null)))))
; [eval] old((unfolding acc(access(a, __rw_j1 - 1), write) in loc(a, __rw_j1).val))
; [eval] (unfolding acc(access(a, __rw_j1 - 1), write) in loc(a, __rw_j1).val)
; [eval] __rw_j1 - 1
(push) ; 11
; [eval] __rw_j1 - 1
(push) ; 12
(set-option :timeout 10)
(assert (not (= i@61@01 (- __rw_j1@106@01 1))))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@108@01 ((a IArray) (i Int) (__rw_j1@106@01 Int)) $Perm
  (ite
    (and (= a a@60@01) (= i (- __rw_j1@106@01 1)))
    ($Perm.min
      (ite
        (and
          (img@66@01 a i)
          (and
            (>= (inv@65@01 a i) 0)
            (and
              (< (inv@65@01 a i) (len<Int> a@60@01))
              (= (mod (inv@65@01 a i) 2) 0))))
        (- $Perm.Write (pTaken@83@01 a i))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@109@01 ((a IArray) (i Int) (__rw_j1@106@01 Int)) $Perm
  (ite
    (and (= a a@60@01) (= i (- __rw_j1@106@01 1)))
    ($Perm.min
      (ite (and (= a a@60@01) (= i i@61@01)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@108@01 a i __rw_j1@106@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=
    (-
      (ite
        (and
          (img@66@01 a i)
          (and
            (>= (inv@65@01 a i) 0)
            (and
              (< (inv@65@01 a i) (len<Int> a@60@01))
              (= (mod (inv@65@01 a i) 2) 0))))
        (- $Perm.Write (pTaken@83@01 a i))
        $Perm.No)
      (pTaken@108@01 a i __rw_j1@106@01))
    $Perm.No)
  
  :qid |quant-u-86|))))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (forall ((a IArray) (i Int)) (!
  (= (pTaken@108@01 a i __rw_j1@106@01) $Perm.No)
  
  :qid |quant-u-87|))))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=>
    (and (= a a@60@01) (= i (- __rw_j1@106@01 1)))
    (= (- $Perm.Write (pTaken@108@01 a i __rw_j1@106@01)) $Perm.No))
  
  :qid |quant-u-88|))))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@109@01 a@60@01 i@61@01 __rw_j1@106@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (forall ((a IArray) (i Int)) (!
  (= (pTaken@109@01 a i __rw_j1@106@01) $Perm.No)
  
  :qid |quant-u-90|))))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=>
    (and (= a a@60@01) (= i (- __rw_j1@106@01 1)))
    (=
      (-
        (- $Perm.Write (pTaken@108@01 a i __rw_j1@106@01))
        (pTaken@109@01 a i __rw_j1@106@01))
      $Perm.No))
  
  :qid |quant-u-91|))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@110@01 $PSF<access>)
(declare-const s@111@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (= (- __rw_j1@106@01 1) i@61@01)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))
        $Snap.unit))
    (=
      ($PSF.lookup_access (as sm@110@01  $PSF<access>) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1))))
      ($PSF.lookup_access (as sm@86@01  $PSF<access>) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1))))))))
(assert (=>
  (ite
    (and
      (img@66@01 a@60@01 (- __rw_j1@106@01 1))
      (and
        (>= (inv@65@01 a@60@01 (- __rw_j1@106@01 1)) 0)
        (and
          (< (inv@65@01 a@60@01 (- __rw_j1@106@01 1)) (len<Int> a@60@01))
          (= (mod (inv@65@01 a@60@01 (- __rw_j1@106@01 1)) 2) 0))))
    (< $Perm.No (- $Perm.Write (pTaken@83@01 a@60@01 (- __rw_j1@106@01 1))))
    false)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))
        $Snap.unit))
    (=
      ($PSF.lookup_access (as sm@110@01  $PSF<access>) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1))))
      ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@63@01))))) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1))))))))
(assert (access%trigger ($PSF.lookup_access (as sm@110@01  $PSF<access>) ($Snap.combine
  ($SortWrappers.IArrayTo$Snap a@60@01)
  ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))) a@60@01 (- __rw_j1@106@01 1)))
; [eval] i % 2 == 0
; [eval] i % 2
; [then-branch: 53 | __rw_j1@106@01 - 1 % 2 == 0 | live]
; [else-branch: 53 | __rw_j1@106@01 - 1 % 2 != 0 | live]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 53 | __rw_j1@106@01 - 1 % 2 == 0]
(assert (=
  ($PSF.lookup_access (as sm@110@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1))))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_access (as sm@110@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))))
    ($Snap.second ($PSF.lookup_access (as sm@110@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1))))))))
; [eval] loc(a, i)
(assert (not (= (loc<Ref> a@60@01 (- __rw_j1@106@01 1)) $Ref.null)))
; [eval] loc(a, i + 1)
; [eval] i + 1
(push) ; 13
(set-option :timeout 10)
(assert (not (=
  (loc<Ref> a@60@01 (- __rw_j1@106@01 1))
  (loc<Ref> a@60@01 (+ (- __rw_j1@106@01 1) 1)))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(assert (not (= (loc<Ref> a@60@01 (+ (- __rw_j1@106@01 1) 1)) $Ref.null)))
; [eval] loc(a, __rw_j1)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (=
  (loc<Ref> a@60@01 (+ (- __rw_j1@106@01 1) 1))
  (loc<Ref> a@60@01 __rw_j1@106@01))))
(check-sat)
; unsat
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(pop) ; 12
(set-option :timeout 0)
(push) ; 12
; [else-branch: 53 | __rw_j1@106@01 - 1 % 2 != 0]
(assert (not (= (mod (- __rw_j1@106@01 1) 2) 0)))
(assert (=
  ($PSF.lookup_access (as sm@110@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1))))
  $Snap.unit))
; [eval] loc(a, __rw_j1)
(check-sat)
; unsat
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (and
  (=>
    (= (- __rw_j1@106@01 1) i@61@01)
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.IArrayTo$Snap a@60@01)
            ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))
          $Snap.unit))
      (=
        ($PSF.lookup_access (as sm@110@01  $PSF<access>) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1))))
        ($PSF.lookup_access (as sm@86@01  $PSF<access>) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))))))
  (=>
    (ite
      (and
        (img@66@01 a@60@01 (- __rw_j1@106@01 1))
        (and
          (>= (inv@65@01 a@60@01 (- __rw_j1@106@01 1)) 0)
          (and
            (< (inv@65@01 a@60@01 (- __rw_j1@106@01 1)) (len<Int> a@60@01))
            (= (mod (inv@65@01 a@60@01 (- __rw_j1@106@01 1)) 2) 0))))
      (< $Perm.No (- $Perm.Write (pTaken@83@01 a@60@01 (- __rw_j1@106@01 1))))
      false)
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.IArrayTo$Snap a@60@01)
            ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))
          $Snap.unit))
      (=
        ($PSF.lookup_access (as sm@110@01  $PSF<access>) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1))))
        ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@63@01))))) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))))))
  (access%trigger ($PSF.lookup_access (as sm@110@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))) a@60@01 (-
    __rw_j1@106@01
    1))))
(assert (=>
  (= (mod (- __rw_j1@106@01 1) 2) 0)
  (and
    (=
      ($PSF.lookup_access (as sm@110@01  $PSF<access>) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1))))
      ($Snap.combine
        ($Snap.first ($PSF.lookup_access (as sm@110@01  $PSF<access>) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))))
        ($Snap.second ($PSF.lookup_access (as sm@110@01  $PSF<access>) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))))))
    (not (= (loc<Ref> a@60@01 (- __rw_j1@106@01 1)) $Ref.null))
    (not (= (loc<Ref> a@60@01 (+ (- __rw_j1@106@01 1) 1)) $Ref.null)))))
(pop) ; 10
(push) ; 10
; [else-branch: 51 | !(__rw_j1@106@01 - 1 >= 0 && __rw_j1@106@01 - 1 < i@61@01 + 2 && __rw_j1@106@01 - 1 % 2 == 0)]
(assert (not
  (and
    (>= (- __rw_j1@106@01 1) 0)
    (and
      (< (- __rw_j1@106@01 1) (+ i@61@01 2))
      (= (mod (- __rw_j1@106@01 1) 2) 0)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (and
    (>= (- __rw_j1@106@01 1) 0)
    (and
      (< (- __rw_j1@106@01 1) (+ i@61@01 2))
      (= (mod (- __rw_j1@106@01 1) 2) 0)))
  (and
    (>= (- __rw_j1@106@01 1) 0)
    (< (- __rw_j1@106@01 1) (+ i@61@01 2))
    (= (mod (- __rw_j1@106@01 1) 2) 0)
    (=>
      (and
        (img@97@01 a@60@01 (- __rw_j1@106@01 1))
        (and
          (>= (inv@96@01 a@60@01 (- __rw_j1@106@01 1)) 0)
          (and
            (< (inv@96@01 a@60@01 (- __rw_j1@106@01 1)) (len<Int> a@60@01))
            (= (mod (inv@96@01 a@60@01 (- __rw_j1@106@01 1)) 2) 0))))
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.IArrayTo$Snap a@60@01)
              ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))
            $Snap.unit))
        (=
          ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
            ($SortWrappers.IArrayTo$Snap a@60@01)
            ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1))))
          ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@94@01))))) ($Snap.combine
            ($SortWrappers.IArrayTo$Snap a@60@01)
            ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))))))
    (access%trigger ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))) a@60@01 (-
      __rw_j1@106@01
      1))
    (=>
      (= (mod (- __rw_j1@106@01 1) 2) 0)
      (and
        (=
          ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
            ($SortWrappers.IArrayTo$Snap a@60@01)
            ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1))))
          ($Snap.combine
            ($Snap.first ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
              ($SortWrappers.IArrayTo$Snap a@60@01)
              ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))))
            ($Snap.second ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
              ($SortWrappers.IArrayTo$Snap a@60@01)
              ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))))))
        (not (= (loc<Ref> a@60@01 (- __rw_j1@106@01 1)) $Ref.null))
        (not (= (loc<Ref> a@60@01 (+ (- __rw_j1@106@01 1) 1)) $Ref.null))))
    (=>
      (= (- __rw_j1@106@01 1) i@61@01)
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.IArrayTo$Snap a@60@01)
              ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))
            $Snap.unit))
        (=
          ($PSF.lookup_access (as sm@110@01  $PSF<access>) ($Snap.combine
            ($SortWrappers.IArrayTo$Snap a@60@01)
            ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1))))
          ($PSF.lookup_access (as sm@86@01  $PSF<access>) ($Snap.combine
            ($SortWrappers.IArrayTo$Snap a@60@01)
            ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))))))
    (=>
      (ite
        (and
          (img@66@01 a@60@01 (- __rw_j1@106@01 1))
          (and
            (>= (inv@65@01 a@60@01 (- __rw_j1@106@01 1)) 0)
            (and
              (< (inv@65@01 a@60@01 (- __rw_j1@106@01 1)) (len<Int> a@60@01))
              (= (mod (inv@65@01 a@60@01 (- __rw_j1@106@01 1)) 2) 0))))
        (< $Perm.No (- $Perm.Write (pTaken@83@01 a@60@01 (- __rw_j1@106@01 1))))
        false)
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.IArrayTo$Snap a@60@01)
              ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))
            $Snap.unit))
        (=
          ($PSF.lookup_access (as sm@110@01  $PSF<access>) ($Snap.combine
            ($SortWrappers.IArrayTo$Snap a@60@01)
            ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1))))
          ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@63@01))))) ($Snap.combine
            ($SortWrappers.IArrayTo$Snap a@60@01)
            ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))))))
    (access%trigger ($PSF.lookup_access (as sm@110@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))) a@60@01 (-
      __rw_j1@106@01
      1))
    (=>
      (= (mod (- __rw_j1@106@01 1) 2) 0)
      (and
        (=
          ($PSF.lookup_access (as sm@110@01  $PSF<access>) ($Snap.combine
            ($SortWrappers.IArrayTo$Snap a@60@01)
            ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1))))
          ($Snap.combine
            ($Snap.first ($PSF.lookup_access (as sm@110@01  $PSF<access>) ($Snap.combine
              ($SortWrappers.IArrayTo$Snap a@60@01)
              ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))))
            ($Snap.second ($PSF.lookup_access (as sm@110@01  $PSF<access>) ($Snap.combine
              ($SortWrappers.IArrayTo$Snap a@60@01)
              ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))))))
        (not (= (loc<Ref> a@60@01 (- __rw_j1@106@01 1)) $Ref.null))
        (not (= (loc<Ref> a@60@01 (+ (- __rw_j1@106@01 1) 1)) $Ref.null)))))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= (- __rw_j1@106@01 1) 0)
      (and
        (< (- __rw_j1@106@01 1) (+ i@61@01 2))
        (= (mod (- __rw_j1@106@01 1) 2) 0))))
  (and
    (>= (- __rw_j1@106@01 1) 0)
    (and
      (< (- __rw_j1@106@01 1) (+ i@61@01 2))
      (= (mod (- __rw_j1@106@01 1) 2) 0)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (and
  (=>
    (>= (- __rw_j1@106@01 1) 0)
    (and
      (>= (- __rw_j1@106@01 1) 0)
      (or
        (< (- __rw_j1@106@01 1) (+ i@61@01 2))
        (not (< (- __rw_j1@106@01 1) (+ i@61@01 2))))))
  (or (>= (- __rw_j1@106@01 1) 0) (not (>= (- __rw_j1@106@01 1) 0)))
  (=>
    (and
      (>= (- __rw_j1@106@01 1) 0)
      (and
        (< (- __rw_j1@106@01 1) (+ i@61@01 2))
        (= (mod (- __rw_j1@106@01 1) 2) 0)))
    (and
      (>= (- __rw_j1@106@01 1) 0)
      (< (- __rw_j1@106@01 1) (+ i@61@01 2))
      (= (mod (- __rw_j1@106@01 1) 2) 0)
      (=>
        (and
          (img@97@01 a@60@01 (- __rw_j1@106@01 1))
          (and
            (>= (inv@96@01 a@60@01 (- __rw_j1@106@01 1)) 0)
            (and
              (< (inv@96@01 a@60@01 (- __rw_j1@106@01 1)) (len<Int> a@60@01))
              (= (mod (inv@96@01 a@60@01 (- __rw_j1@106@01 1)) 2) 0))))
        (and
          (not
            (=
              ($Snap.combine
                ($SortWrappers.IArrayTo$Snap a@60@01)
                ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))
              $Snap.unit))
          (=
            ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
              ($SortWrappers.IArrayTo$Snap a@60@01)
              ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1))))
            ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@94@01))))) ($Snap.combine
              ($SortWrappers.IArrayTo$Snap a@60@01)
              ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))))))
      (access%trigger ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))) a@60@01 (-
        __rw_j1@106@01
        1))
      (=>
        (= (mod (- __rw_j1@106@01 1) 2) 0)
        (and
          (=
            ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
              ($SortWrappers.IArrayTo$Snap a@60@01)
              ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1))))
            ($Snap.combine
              ($Snap.first ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
                ($SortWrappers.IArrayTo$Snap a@60@01)
                ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))))
              ($Snap.second ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
                ($SortWrappers.IArrayTo$Snap a@60@01)
                ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))))))
          (not (= (loc<Ref> a@60@01 (- __rw_j1@106@01 1)) $Ref.null))
          (not (= (loc<Ref> a@60@01 (+ (- __rw_j1@106@01 1) 1)) $Ref.null))))
      (=>
        (= (- __rw_j1@106@01 1) i@61@01)
        (and
          (not
            (=
              ($Snap.combine
                ($SortWrappers.IArrayTo$Snap a@60@01)
                ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))
              $Snap.unit))
          (=
            ($PSF.lookup_access (as sm@110@01  $PSF<access>) ($Snap.combine
              ($SortWrappers.IArrayTo$Snap a@60@01)
              ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1))))
            ($PSF.lookup_access (as sm@86@01  $PSF<access>) ($Snap.combine
              ($SortWrappers.IArrayTo$Snap a@60@01)
              ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))))))
      (=>
        (ite
          (and
            (img@66@01 a@60@01 (- __rw_j1@106@01 1))
            (and
              (>= (inv@65@01 a@60@01 (- __rw_j1@106@01 1)) 0)
              (and
                (< (inv@65@01 a@60@01 (- __rw_j1@106@01 1)) (len<Int> a@60@01))
                (= (mod (inv@65@01 a@60@01 (- __rw_j1@106@01 1)) 2) 0))))
          (<
            $Perm.No
            (- $Perm.Write (pTaken@83@01 a@60@01 (- __rw_j1@106@01 1))))
          false)
        (and
          (not
            (=
              ($Snap.combine
                ($SortWrappers.IArrayTo$Snap a@60@01)
                ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))
              $Snap.unit))
          (=
            ($PSF.lookup_access (as sm@110@01  $PSF<access>) ($Snap.combine
              ($SortWrappers.IArrayTo$Snap a@60@01)
              ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1))))
            ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@63@01))))) ($Snap.combine
              ($SortWrappers.IArrayTo$Snap a@60@01)
              ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))))))
      (access%trigger ($PSF.lookup_access (as sm@110@01  $PSF<access>) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))) a@60@01 (-
        __rw_j1@106@01
        1))
      (=>
        (= (mod (- __rw_j1@106@01 1) 2) 0)
        (and
          (=
            ($PSF.lookup_access (as sm@110@01  $PSF<access>) ($Snap.combine
              ($SortWrappers.IArrayTo$Snap a@60@01)
              ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1))))
            ($Snap.combine
              ($Snap.first ($PSF.lookup_access (as sm@110@01  $PSF<access>) ($Snap.combine
                ($SortWrappers.IArrayTo$Snap a@60@01)
                ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))))
              ($Snap.second ($PSF.lookup_access (as sm@110@01  $PSF<access>) ($Snap.combine
                ($SortWrappers.IArrayTo$Snap a@60@01)
                ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))))))
          (not (= (loc<Ref> a@60@01 (- __rw_j1@106@01 1)) $Ref.null))
          (not (= (loc<Ref> a@60@01 (+ (- __rw_j1@106@01 1) 1)) $Ref.null))))))
  (or
    (not
      (and
        (>= (- __rw_j1@106@01 1) 0)
        (and
          (< (- __rw_j1@106@01 1) (+ i@61@01 2))
          (= (mod (- __rw_j1@106@01 1) 2) 0))))
    (and
      (>= (- __rw_j1@106@01 1) 0)
      (and
        (< (- __rw_j1@106@01 1) (+ i@61@01 2))
        (= (mod (- __rw_j1@106@01 1) 2) 0))))))
; [eval] old(loc(a, __rw_j1))
; [eval] loc(a, __rw_j1)
(pop) ; 6
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((__rw_j1@106@01 Int)) (!
  (and
    (=>
      (>= (- __rw_j1@106@01 1) 0)
      (and
        (>= (- __rw_j1@106@01 1) 0)
        (or
          (< (- __rw_j1@106@01 1) (+ i@61@01 2))
          (not (< (- __rw_j1@106@01 1) (+ i@61@01 2))))))
    (or (>= (- __rw_j1@106@01 1) 0) (not (>= (- __rw_j1@106@01 1) 0)))
    (=>
      (and
        (>= (- __rw_j1@106@01 1) 0)
        (and
          (< (- __rw_j1@106@01 1) (+ i@61@01 2))
          (= (mod (- __rw_j1@106@01 1) 2) 0)))
      (and
        (>= (- __rw_j1@106@01 1) 0)
        (< (- __rw_j1@106@01 1) (+ i@61@01 2))
        (= (mod (- __rw_j1@106@01 1) 2) 0)
        (=>
          (and
            (img@97@01 a@60@01 (- __rw_j1@106@01 1))
            (and
              (>= (inv@96@01 a@60@01 (- __rw_j1@106@01 1)) 0)
              (and
                (< (inv@96@01 a@60@01 (- __rw_j1@106@01 1)) (len<Int> a@60@01))
                (= (mod (inv@96@01 a@60@01 (- __rw_j1@106@01 1)) 2) 0))))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.IArrayTo$Snap a@60@01)
                  ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))
                $Snap.unit))
            (=
              ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
                ($SortWrappers.IArrayTo$Snap a@60@01)
                ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1))))
              ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@94@01))))) ($Snap.combine
                ($SortWrappers.IArrayTo$Snap a@60@01)
                ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))))))
        (access%trigger ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))) a@60@01 (-
          __rw_j1@106@01
          1))
        (=>
          (= (mod (- __rw_j1@106@01 1) 2) 0)
          (and
            (=
              ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
                ($SortWrappers.IArrayTo$Snap a@60@01)
                ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1))))
              ($Snap.combine
                ($Snap.first ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
                  ($SortWrappers.IArrayTo$Snap a@60@01)
                  ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))))
                ($Snap.second ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
                  ($SortWrappers.IArrayTo$Snap a@60@01)
                  ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))))))
            (not (= (loc<Ref> a@60@01 (- __rw_j1@106@01 1)) $Ref.null))
            (not (= (loc<Ref> a@60@01 (+ (- __rw_j1@106@01 1) 1)) $Ref.null))))
        (=>
          (= (- __rw_j1@106@01 1) i@61@01)
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.IArrayTo$Snap a@60@01)
                  ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))
                $Snap.unit))
            (=
              ($PSF.lookup_access (as sm@110@01  $PSF<access>) ($Snap.combine
                ($SortWrappers.IArrayTo$Snap a@60@01)
                ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1))))
              ($PSF.lookup_access (as sm@86@01  $PSF<access>) ($Snap.combine
                ($SortWrappers.IArrayTo$Snap a@60@01)
                ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))))))
        (=>
          (ite
            (and
              (img@66@01 a@60@01 (- __rw_j1@106@01 1))
              (and
                (>= (inv@65@01 a@60@01 (- __rw_j1@106@01 1)) 0)
                (and
                  (< (inv@65@01 a@60@01 (- __rw_j1@106@01 1)) (len<Int> a@60@01))
                  (= (mod (inv@65@01 a@60@01 (- __rw_j1@106@01 1)) 2) 0))))
            (<
              $Perm.No
              (- $Perm.Write (pTaken@83@01 a@60@01 (- __rw_j1@106@01 1))))
            false)
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.IArrayTo$Snap a@60@01)
                  ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))
                $Snap.unit))
            (=
              ($PSF.lookup_access (as sm@110@01  $PSF<access>) ($Snap.combine
                ($SortWrappers.IArrayTo$Snap a@60@01)
                ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1))))
              ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@63@01))))) ($Snap.combine
                ($SortWrappers.IArrayTo$Snap a@60@01)
                ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))))))
        (access%trigger ($PSF.lookup_access (as sm@110@01  $PSF<access>) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))) a@60@01 (-
          __rw_j1@106@01
          1))
        (=>
          (= (mod (- __rw_j1@106@01 1) 2) 0)
          (and
            (=
              ($PSF.lookup_access (as sm@110@01  $PSF<access>) ($Snap.combine
                ($SortWrappers.IArrayTo$Snap a@60@01)
                ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1))))
              ($Snap.combine
                ($Snap.first ($PSF.lookup_access (as sm@110@01  $PSF<access>) ($Snap.combine
                  ($SortWrappers.IArrayTo$Snap a@60@01)
                  ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))))
                ($Snap.second ($PSF.lookup_access (as sm@110@01  $PSF<access>) ($Snap.combine
                  ($SortWrappers.IArrayTo$Snap a@60@01)
                  ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1)))))))
            (not (= (loc<Ref> a@60@01 (- __rw_j1@106@01 1)) $Ref.null))
            (not (= (loc<Ref> a@60@01 (+ (- __rw_j1@106@01 1) 1)) $Ref.null))))))
    (or
      (not
        (and
          (>= (- __rw_j1@106@01 1) 0)
          (and
            (< (- __rw_j1@106@01 1) (+ i@61@01 2))
            (= (mod (- __rw_j1@106@01 1) 2) 0))))
      (and
        (>= (- __rw_j1@106@01 1) 0)
        (and
          (< (- __rw_j1@106@01 1) (+ i@61@01 2))
          (= (mod (- __rw_j1@106@01 1) 2) 0)))))
  :pattern ((loc<Ref> a@60@01 __rw_j1@106@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/issues/block_array.vpr@51@9@51@161-aux|)))
(assert (forall ((__rw_j1@106@01 Int)) (!
  (=>
    (and
      (>= (- __rw_j1@106@01 1) 0)
      (and
        (< (- __rw_j1@106@01 1) (+ i@61@01 2))
        (= (mod (- __rw_j1@106@01 1) 2) 0)))
    (=
      ($SortWrappers.$SnapToInt ($Snap.second ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1))))))
      ($SortWrappers.$SnapToInt ($Snap.second ($PSF.lookup_access (as sm@110@01  $PSF<access>) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap (- __rw_j1@106@01 1))))))))
  :pattern ((loc<Ref> a@60@01 __rw_j1@106@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/issues/block_array.vpr@51@9@51@161|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))
  $Snap.unit))
; [eval] (unfolding acc(access(a, i), write) in loc(a, i).val == newVal)
(push) ; 6
; Precomputing data for removing quantified permissions
(define-fun pTaken@112@01 ((a IArray) (i Int)) $Perm
  (ite
    (and (= a a@60@01) (= i (+ i@61@01 2)))
    ($Perm.min
      (ite
        (and
          (img@97@01 a i)
          (and
            (>= (inv@96@01 a i) 0)
            (and
              (< (inv@96@01 a i) (len<Int> a@60@01))
              (= (mod (inv@96@01 a i) 2) 0))))
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
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=
    (-
      (ite
        (and
          (img@97@01 a i)
          (and
            (>= (inv@96@01 a i) 0)
            (and
              (< (inv@96@01 a i) (len<Int> a@60@01))
              (= (mod (inv@96@01 a i) 2) 0))))
        $Perm.Write
        $Perm.No)
      (pTaken@112@01 a i))
    $Perm.No)
  
  :qid |quant-u-93|))))
(check-sat)
; unknown
(pop) ; 7
; 0,51s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((a IArray) (i Int)) (!
  (= (pTaken@112@01 a i) $Perm.No)
  
  :qid |quant-u-94|))))
(check-sat)
; unknown
(pop) ; 7
; 0,01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=>
    (and (= a a@60@01) (= i (+ i@61@01 2)))
    (= (- $Perm.Write (pTaken@112@01 a i)) $Perm.No))
  
  :qid |quant-u-95|))))
(check-sat)
; unknown
(pop) ; 7
; 0,51s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 7
(assert (not (forall ((a IArray) (i Int)) (!
  (=>
    (and (= a a@60@01) (= i (+ i@61@01 2)))
    (= (- $Perm.Write (pTaken@112@01 a i)) $Perm.No))
  
  :qid |quant-u-95|))))
(check-sat)
; unsat
(pop) ; 7
; 1,35s
; (get-info :all-statistics)
; Done removing quantified permissions
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@97@01 a@60@01 (+ i@61@01 2))
    (and
      (>= (inv@96@01 a@60@01 (+ i@61@01 2)) 0)
      (and
        (< (inv@96@01 a@60@01 (+ i@61@01 2)) (len<Int> a@60@01))
        (= (mod (inv@96@01 a@60@01 (+ i@61@01 2)) 2) 0))))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap (+ i@61@01 2)))
        $Snap.unit))
    (=
      ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap (+ i@61@01 2))))
      ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@94@01))))) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap (+ i@61@01 2))))))))
(assert (access%trigger ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
  ($SortWrappers.IArrayTo$Snap a@60@01)
  ($SortWrappers.IntTo$Snap (+ i@61@01 2)))) a@60@01 (+ i@61@01 2)))
; [eval] i % 2 == 0
; [eval] i % 2
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= (mod (+ i@61@01 2) 2) 0))))
(check-sat)
; unknown
(pop) ; 7
; 0,01s
; (get-info :all-statistics)
; [then-branch: 54 | i@61@01 + 2 % 2 == 0 | live]
; [else-branch: 54 | i@61@01 + 2 % 2 != 0 | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 54 | i@61@01 + 2 % 2 == 0]
(assert (=
  ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap (+ i@61@01 2))))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap (+ i@61@01 2)))))
    ($Snap.second ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap (+ i@61@01 2))))))))
; [eval] loc(a, i)
(assert (not (= (loc<Ref> a@60@01 (+ i@61@01 2)) $Ref.null)))
; [eval] loc(a, i + 1)
; [eval] i + 1
(push) ; 8
(set-option :timeout 10)
(assert (not (= (loc<Ref> a@60@01 (+ i@61@01 2)) (loc<Ref> a@60@01 (+ (+ i@61@01 2) 1)))))
(check-sat)
; unknown
(pop) ; 8
; 0,01s
; (get-info :all-statistics)
(assert (not (= (loc<Ref> a@60@01 (+ (+ i@61@01 2) 1)) $Ref.null)))
; [eval] loc(a, i).val == newVal
; [eval] loc(a, i)
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (and
  (=>
    (and
      (img@97@01 a@60@01 (+ i@61@01 2))
      (and
        (>= (inv@96@01 a@60@01 (+ i@61@01 2)) 0)
        (and
          (< (inv@96@01 a@60@01 (+ i@61@01 2)) (len<Int> a@60@01))
          (= (mod (inv@96@01 a@60@01 (+ i@61@01 2)) 2) 0))))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.IArrayTo$Snap a@60@01)
            ($SortWrappers.IntTo$Snap (+ i@61@01 2)))
          $Snap.unit))
      (=
        ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap (+ i@61@01 2))))
        ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@94@01))))) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap (+ i@61@01 2)))))))
  (access%trigger ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap (+ i@61@01 2)))) a@60@01 (+ i@61@01 2))))
(assert (=>
  (= (mod (+ i@61@01 2) 2) 0)
  (and
    (=
      ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap (+ i@61@01 2))))
      ($Snap.combine
        ($Snap.first ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap (+ i@61@01 2)))))
        ($Snap.second ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap (+ i@61@01 2)))))))
    (not (= (loc<Ref> a@60@01 (+ i@61@01 2)) $Ref.null))
    (not (= (loc<Ref> a@60@01 (+ (+ i@61@01 2) 1)) $Ref.null)))))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap (+ i@61@01 2))))))
  newVal@62@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))
  $Snap.unit))
; [eval] (unfolding acc(access(a, i), write) in loc(a, i + 1).val == newVal)
(set-option :timeout 0)
(push) ; 6
; Precomputing data for removing quantified permissions
(define-fun pTaken@113@01 ((a IArray) (i Int)) $Perm
  (ite
    (and (= a a@60@01) (= i (+ i@61@01 2)))
    ($Perm.min
      (ite
        (and
          (img@97@01 a i)
          (and
            (>= (inv@96@01 a i) 0)
            (and
              (< (inv@96@01 a i) (len<Int> a@60@01))
              (= (mod (inv@96@01 a i) 2) 0))))
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
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=
    (-
      (ite
        (and
          (img@97@01 a i)
          (and
            (>= (inv@96@01 a i) 0)
            (and
              (< (inv@96@01 a i) (len<Int> a@60@01))
              (= (mod (inv@96@01 a i) 2) 0))))
        $Perm.Write
        $Perm.No)
      (pTaken@113@01 a i))
    $Perm.No)
  
  :qid |quant-u-97|))))
(check-sat)
; unknown
(pop) ; 7
; 0,50s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((a IArray) (i Int)) (!
  (= (pTaken@113@01 a i) $Perm.No)
  
  :qid |quant-u-98|))))
(check-sat)
; unknown
(pop) ; 7
; 0,01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=>
    (and (= a a@60@01) (= i (+ i@61@01 2)))
    (= (- $Perm.Write (pTaken@113@01 a i)) $Perm.No))
  
  :qid |quant-u-99|))))
(check-sat)
; unknown
(pop) ; 7
; 0,50s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 7
(assert (not (forall ((a IArray) (i Int)) (!
  (=>
    (and (= a a@60@01) (= i (+ i@61@01 2)))
    (= (- $Perm.Write (pTaken@113@01 a i)) $Perm.No))
  
  :qid |quant-u-99|))))
(check-sat)
; unsat
(pop) ; 7
; 4,38s
; (get-info :all-statistics)
; Done removing quantified permissions
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
; [eval] i % 2 == 0
; [eval] i % 2
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= (mod (+ i@61@01 2) 2) 0))))
(check-sat)
; unknown
(pop) ; 7
; 0,01s
; (get-info :all-statistics)
; [then-branch: 55 | i@61@01 + 2 % 2 == 0 | live]
; [else-branch: 55 | i@61@01 + 2 % 2 != 0 | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 55 | i@61@01 + 2 % 2 == 0]
(assert (=
  ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap (+ i@61@01 2))))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap (+ i@61@01 2)))))
    ($Snap.second ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap (+ i@61@01 2))))))))
; [eval] loc(a, i)
(assert (not (= (loc<Ref> a@60@01 (+ i@61@01 2)) $Ref.null)))
; [eval] loc(a, i + 1)
; [eval] i + 1
(push) ; 8
(set-option :timeout 10)
(assert (not (= (loc<Ref> a@60@01 (+ i@61@01 2)) (loc<Ref> a@60@01 (+ (+ i@61@01 2) 1)))))
(check-sat)
; unknown
(pop) ; 8
; 0,01s
; (get-info :all-statistics)
(assert (not (= (loc<Ref> a@60@01 (+ (+ i@61@01 2) 1)) $Ref.null)))
; [eval] loc(a, i + 1).val == newVal
; [eval] loc(a, i + 1)
; [eval] i + 1
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.second ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap (+ i@61@01 2))))))
  newVal@62@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; assert (unfolding acc(access(a, i + 2), write) in
;     loc(a, i + 2).val == newVal) &&
;   (unfolding acc(access(a, i + 2), write) in loc(a, i + 3).val == newVal)
; [eval] (unfolding acc(access(a, i + 2), write) in loc(a, i + 2).val == newVal)
; [eval] i + 2
(set-option :timeout 0)
(push) ; 6
; [eval] i + 2
; Precomputing data for removing quantified permissions
(define-fun pTaken@114@01 ((a IArray) (i Int)) $Perm
  (ite
    (and (= a a@60@01) (= i (+ i@61@01 2)))
    ($Perm.min
      (ite
        (and
          (img@97@01 a i)
          (and
            (>= (inv@96@01 a i) 0)
            (and
              (< (inv@96@01 a i) (len<Int> a@60@01))
              (= (mod (inv@96@01 a i) 2) 0))))
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
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=
    (-
      (ite
        (and
          (img@97@01 a i)
          (and
            (>= (inv@96@01 a i) 0)
            (and
              (< (inv@96@01 a i) (len<Int> a@60@01))
              (= (mod (inv@96@01 a i) 2) 0))))
        $Perm.Write
        $Perm.No)
      (pTaken@114@01 a i))
    $Perm.No)
  
  :qid |quant-u-101|))))
(check-sat)
; unknown
(pop) ; 7
; 0,50s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((a IArray) (i Int)) (!
  (= (pTaken@114@01 a i) $Perm.No)
  
  :qid |quant-u-102|))))
(check-sat)
; unknown
(pop) ; 7
; 0,01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=>
    (and (= a a@60@01) (= i (+ i@61@01 2)))
    (= (- $Perm.Write (pTaken@114@01 a i)) $Perm.No))
  
  :qid |quant-u-103|))))
(check-sat)
; unknown
(pop) ; 7
; 0,51s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 7
(assert (not (forall ((a IArray) (i Int)) (!
  (=>
    (and (= a a@60@01) (= i (+ i@61@01 2)))
    (= (- $Perm.Write (pTaken@114@01 a i)) $Perm.No))
  
  :qid |quant-u-103|))))
(check-sat)
; unsat
(pop) ; 7
; 1,66s
; (get-info :all-statistics)
; Done removing quantified permissions
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
; [eval] i % 2 == 0
; [eval] i % 2
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= (mod (+ i@61@01 2) 2) 0))))
(check-sat)
; unknown
(pop) ; 7
; 0,01s
; (get-info :all-statistics)
; [then-branch: 56 | i@61@01 + 2 % 2 == 0 | live]
; [else-branch: 56 | i@61@01 + 2 % 2 != 0 | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 56 | i@61@01 + 2 % 2 == 0]
(assert (=
  ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap (+ i@61@01 2))))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap (+ i@61@01 2)))))
    ($Snap.second ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap (+ i@61@01 2))))))))
; [eval] loc(a, i)
(assert (not (= (loc<Ref> a@60@01 (+ i@61@01 2)) $Ref.null)))
; [eval] loc(a, i + 1)
; [eval] i + 1
(push) ; 8
(set-option :timeout 10)
(assert (not (= (loc<Ref> a@60@01 (+ i@61@01 2)) (loc<Ref> a@60@01 (+ (+ i@61@01 2) 1)))))
(check-sat)
; unknown
(pop) ; 8
; 0,01s
; (get-info :all-statistics)
(assert (not (= (loc<Ref> a@60@01 (+ (+ i@61@01 2) 1)) $Ref.null)))
; [eval] loc(a, i + 2).val == newVal
; [eval] loc(a, i + 2)
; [eval] i + 2
(pop) ; 7
(pop) ; 6
; Joined path conditions
; [eval] (unfolding acc(access(a, i + 2), write) in loc(a, i + 3).val == newVal)
; [eval] i + 2
(set-option :timeout 0)
(push) ; 6
; [eval] i + 2
; Precomputing data for removing quantified permissions
(define-fun pTaken@115@01 ((a IArray) (i Int)) $Perm
  (ite
    (and (= a a@60@01) (= i (+ i@61@01 2)))
    ($Perm.min
      (ite
        (and
          (img@97@01 a i)
          (and
            (>= (inv@96@01 a i) 0)
            (and
              (< (inv@96@01 a i) (len<Int> a@60@01))
              (= (mod (inv@96@01 a i) 2) 0))))
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
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=
    (-
      (ite
        (and
          (img@97@01 a i)
          (and
            (>= (inv@96@01 a i) 0)
            (and
              (< (inv@96@01 a i) (len<Int> a@60@01))
              (= (mod (inv@96@01 a i) 2) 0))))
        $Perm.Write
        $Perm.No)
      (pTaken@115@01 a i))
    $Perm.No)
  
  :qid |quant-u-105|))))
(check-sat)
; unknown
(pop) ; 7
; 0,50s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((a IArray) (i Int)) (!
  (= (pTaken@115@01 a i) $Perm.No)
  
  :qid |quant-u-106|))))
(check-sat)
; unknown
(pop) ; 7
; 0,01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=>
    (and (= a a@60@01) (= i (+ i@61@01 2)))
    (= (- $Perm.Write (pTaken@115@01 a i)) $Perm.No))
  
  :qid |quant-u-107|))))
(check-sat)
; unknown
(pop) ; 7
; 0,51s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 7
(assert (not (forall ((a IArray) (i Int)) (!
  (=>
    (and (= a a@60@01) (= i (+ i@61@01 2)))
    (= (- $Perm.Write (pTaken@115@01 a i)) $Perm.No))
  
  :qid |quant-u-107|))))
(check-sat)
; unsat
(pop) ; 7
; 1,03s
; (get-info :all-statistics)
; Done removing quantified permissions
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
; [eval] i % 2 == 0
; [eval] i % 2
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= (mod (+ i@61@01 2) 2) 0))))
(check-sat)
; unknown
(pop) ; 7
; 0,01s
; (get-info :all-statistics)
; [then-branch: 57 | i@61@01 + 2 % 2 == 0 | live]
; [else-branch: 57 | i@61@01 + 2 % 2 != 0 | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 57 | i@61@01 + 2 % 2 == 0]
(assert (=
  ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap (+ i@61@01 2))))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap (+ i@61@01 2)))))
    ($Snap.second ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap (+ i@61@01 2))))))))
; [eval] loc(a, i)
(assert (not (= (loc<Ref> a@60@01 (+ i@61@01 2)) $Ref.null)))
; [eval] loc(a, i + 1)
; [eval] i + 1
(push) ; 8
(set-option :timeout 10)
(assert (not (= (loc<Ref> a@60@01 (+ i@61@01 2)) (loc<Ref> a@60@01 (+ (+ i@61@01 2) 1)))))
(check-sat)
; unknown
(pop) ; 8
; 0,01s
; (get-info :all-statistics)
(assert (not (= (loc<Ref> a@60@01 (+ (+ i@61@01 2) 1)) $Ref.null)))
; [eval] loc(a, i + 3).val == newVal
; [eval] loc(a, i + 3)
; [eval] i + 3
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= (loc<Ref> a@60@01 (+ (+ i@61@01 2) 1)) (loc<Ref> a@60@01 (+ i@61@01 3)))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; [exec]
; assert (unfolding acc(access(a, i), write) in loc(a, i).val == newVal) &&
;   (unfolding acc(access(a, i), write) in loc(a, i + 1).val == newVal)
; [eval] (unfolding acc(access(a, i), write) in loc(a, i).val == newVal)
(set-option :timeout 0)
(push) ; 6
; Precomputing data for removing quantified permissions
(define-fun pTaken@116@01 ((a IArray) (i Int)) $Perm
  (ite
    (and (= a a@60@01) (= i i@61@01))
    ($Perm.min
      (ite
        (and
          (img@97@01 a i)
          (and
            (>= (inv@96@01 a i) 0)
            (and
              (< (inv@96@01 a i) (len<Int> a@60@01))
              (= (mod (inv@96@01 a i) 2) 0))))
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
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=
    (-
      (ite
        (and
          (img@97@01 a i)
          (and
            (>= (inv@96@01 a i) 0)
            (and
              (< (inv@96@01 a i) (len<Int> a@60@01))
              (= (mod (inv@96@01 a i) 2) 0))))
        $Perm.Write
        $Perm.No)
      (pTaken@116@01 a i))
    $Perm.No)
  
  :qid |quant-u-109|))))
(check-sat)
; unknown
(pop) ; 7
; 0,51s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((a IArray) (i Int)) (!
  (= (pTaken@116@01 a i) $Perm.No)
  
  :qid |quant-u-110|))))
(check-sat)
; unknown
(pop) ; 7
; 0,01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=>
    (and (= a a@60@01) (= i i@61@01))
    (= (- $Perm.Write (pTaken@116@01 a i)) $Perm.No))
  
  :qid |quant-u-111|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@97@01 a@60@01 i@61@01)
    (and
      (>= (inv@96@01 a@60@01 i@61@01) 0)
      (and
        (< (inv@96@01 a@60@01 i@61@01) (len<Int> a@60@01))
        (= (mod (inv@96@01 a@60@01 i@61@01) 2) 0))))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap i@61@01))
        $Snap.unit))
    (=
      ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap i@61@01)))
      ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@94@01))))) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap i@61@01)))))))
(assert (access%trigger ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
  ($SortWrappers.IArrayTo$Snap a@60@01)
  ($SortWrappers.IntTo$Snap i@61@01))) a@60@01 i@61@01))
; [eval] i % 2 == 0
; [eval] i % 2
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= (mod i@61@01 2) 0))))
(check-sat)
; unknown
(pop) ; 7
; 0,01s
; (get-info :all-statistics)
; [then-branch: 58 | i@61@01 % 2 == 0 | live]
; [else-branch: 58 | i@61@01 % 2 != 0 | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 58 | i@61@01 % 2 == 0]
(assert (=
  ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap i@61@01)))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap i@61@01))))
    ($Snap.second ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap i@61@01)))))))
; [eval] loc(a, i)
; [eval] loc(a, i + 1)
; [eval] i + 1
(push) ; 8
(set-option :timeout 10)
(assert (not (= (loc<Ref> a@60@01 i@61@01) (loc<Ref> a@60@01 (+ i@61@01 1)))))
(check-sat)
; unknown
(pop) ; 8
; 0,01s
; (get-info :all-statistics)
; [eval] loc(a, i).val == newVal
; [eval] loc(a, i)
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (and
  (=>
    (and
      (img@97@01 a@60@01 i@61@01)
      (and
        (>= (inv@96@01 a@60@01 i@61@01) 0)
        (and
          (< (inv@96@01 a@60@01 i@61@01) (len<Int> a@60@01))
          (= (mod (inv@96@01 a@60@01 i@61@01) 2) 0))))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.IArrayTo$Snap a@60@01)
            ($SortWrappers.IntTo$Snap i@61@01))
          $Snap.unit))
      (=
        ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap i@61@01)))
        ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@94@01))))) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap i@61@01))))))
  (access%trigger ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap i@61@01))) a@60@01 i@61@01)))
(assert (=>
  (= (mod i@61@01 2) 0)
  (=
    ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap i@61@01)))
    ($Snap.combine
      ($Snap.first ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap i@61@01))))
      ($Snap.second ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap i@61@01))))))))
(set-option :timeout 0)
(push) ; 6
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap i@61@01)))))
  newVal@62@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap i@61@01)))))
  newVal@62@01))
; [eval] (unfolding acc(access(a, i), write) in loc(a, i + 1).val == newVal)
(push) ; 6
; Precomputing data for removing quantified permissions
(define-fun pTaken@117@01 ((a IArray) (i Int)) $Perm
  (ite
    (and (= a a@60@01) (= i i@61@01))
    ($Perm.min
      (ite
        (and
          (img@97@01 a i)
          (and
            (>= (inv@96@01 a i) 0)
            (and
              (< (inv@96@01 a i) (len<Int> a@60@01))
              (= (mod (inv@96@01 a i) 2) 0))))
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
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=
    (-
      (ite
        (and
          (img@97@01 a i)
          (and
            (>= (inv@96@01 a i) 0)
            (and
              (< (inv@96@01 a i) (len<Int> a@60@01))
              (= (mod (inv@96@01 a i) 2) 0))))
        $Perm.Write
        $Perm.No)
      (pTaken@117@01 a i))
    $Perm.No)
  
  :qid |quant-u-113|))))
(check-sat)
; unknown
(pop) ; 7
; 0,50s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((a IArray) (i Int)) (!
  (= (pTaken@117@01 a i) $Perm.No)
  
  :qid |quant-u-114|))))
(check-sat)
; unknown
(pop) ; 7
; 0,01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=>
    (and (= a a@60@01) (= i i@61@01))
    (= (- $Perm.Write (pTaken@117@01 a i)) $Perm.No))
  
  :qid |quant-u-115|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
; [eval] i % 2 == 0
; [eval] i % 2
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= (mod i@61@01 2) 0))))
(check-sat)
; unknown
(pop) ; 7
; 0,01s
; (get-info :all-statistics)
; [then-branch: 59 | i@61@01 % 2 == 0 | live]
; [else-branch: 59 | i@61@01 % 2 != 0 | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 59 | i@61@01 % 2 == 0]
(assert (=
  ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap i@61@01)))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap i@61@01))))
    ($Snap.second ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap i@61@01)))))))
; [eval] loc(a, i)
; [eval] loc(a, i + 1)
; [eval] i + 1
(push) ; 8
(set-option :timeout 10)
(assert (not (= (loc<Ref> a@60@01 i@61@01) (loc<Ref> a@60@01 (+ i@61@01 1)))))
(check-sat)
; unknown
(pop) ; 8
; 0,01s
; (get-info :all-statistics)
; [eval] loc(a, i + 1).val == newVal
; [eval] loc(a, i + 1)
; [eval] i + 1
(pop) ; 7
(pop) ; 6
; Joined path conditions
(set-option :timeout 0)
(push) ; 6
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.second ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap i@61@01)))))
  newVal@62@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.second ($PSF.lookup_access (as sm@100@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap i@61@01)))))
  newVal@62@01))
; [eval] i >= 0
; [eval] i < len(a)
; [eval] len(a)
; [eval] len(a) % 2 == old(len(a) % 2)
; [eval] len(a) % 2
; [eval] len(a)
; [eval] old(len(a) % 2)
; [eval] len(a) % 2
; [eval] len(a)
(declare-const j@118@01 Int)
(push) ; 6
; [eval] j >= 0 && (j < len(a) && j % 2 == 0)
; [eval] j >= 0
(push) ; 7
; [then-branch: 60 | !(j@118@01 >= 0) | live]
; [else-branch: 60 | j@118@01 >= 0 | live]
(push) ; 8
; [then-branch: 60 | !(j@118@01 >= 0)]
(assert (not (>= j@118@01 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 60 | j@118@01 >= 0]
(assert (>= j@118@01 0))
; [eval] j < len(a)
; [eval] len(a)
(push) ; 9
; [then-branch: 61 | !(j@118@01 < len[Int](a@60@01)) | live]
; [else-branch: 61 | j@118@01 < len[Int](a@60@01) | live]
(push) ; 10
; [then-branch: 61 | !(j@118@01 < len[Int](a@60@01))]
(assert (not (< j@118@01 (len<Int> a@60@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 61 | j@118@01 < len[Int](a@60@01)]
(assert (< j@118@01 (len<Int> a@60@01)))
; [eval] j % 2 == 0
; [eval] j % 2
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< j@118@01 (len<Int> a@60@01)) (not (< j@118@01 (len<Int> a@60@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@118@01 0)
  (and
    (>= j@118@01 0)
    (or (< j@118@01 (len<Int> a@60@01)) (not (< j@118@01 (len<Int> a@60@01)))))))
(assert (or (>= j@118@01 0) (not (>= j@118@01 0))))
(assert (and
  (>= j@118@01 0)
  (and (< j@118@01 (len<Int> a@60@01)) (= (mod j@118@01 2) 0))))
(pop) ; 6
(declare-fun inv@119@01 (IArray Int) Int)
(declare-fun img@120@01 (IArray Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@118@01 Int)) (!
  (=>
    (and
      (>= j@118@01 0)
      (and (< j@118@01 (len<Int> a@60@01)) (= (mod j@118@01 2) 0)))
    (and
      (=>
        (>= j@118@01 0)
        (and
          (>= j@118@01 0)
          (or
            (< j@118@01 (len<Int> a@60@01))
            (not (< j@118@01 (len<Int> a@60@01))))))
      (or (>= j@118@01 0) (not (>= j@118@01 0)))))
  :pattern ((inv@119@01 a@60@01 j@118@01))
  :pattern ((img@120@01 a@60@01 j@118@01))
  :qid |access-aux|)))
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((j1@118@01 Int) (j2@118@01 Int)) (!
  (=>
    (and
      (and
        (>= j1@118@01 0)
        (and (< j1@118@01 (len<Int> a@60@01)) (= (mod j1@118@01 2) 0)))
      (and
        (>= j2@118@01 0)
        (and (< j2@118@01 (len<Int> a@60@01)) (= (mod j2@118@01 2) 0)))
      (= j1@118@01 j2@118@01))
    (= j1@118@01 j2@118@01))
  
  :qid |access-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@118@01 Int)) (!
  (=>
    (and
      (>= j@118@01 0)
      (and (< j@118@01 (len<Int> a@60@01)) (= (mod j@118@01 2) 0)))
    (and
      (= (inv@119@01 a@60@01 j@118@01) j@118@01)
      (img@120@01 a@60@01 j@118@01)))
  :pattern ((inv@119@01 a@60@01 j@118@01))
  :pattern ((img@120@01 a@60@01 j@118@01))
  :qid |access-invOfFct|)))
(assert (forall ((a IArray) (i Int)) (!
  (=>
    (and
      (img@120@01 a i)
      (and
        (>= (inv@119@01 a i) 0)
        (and
          (< (inv@119@01 a i) (len<Int> a@60@01))
          (= (mod (inv@119@01 a i) 2) 0))))
    (and (= a@60@01 a) (= (inv@119@01 a i) i)))
  :pattern ((inv@119@01 a i))
  :qid |access-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@121@01 ((a IArray) (i Int)) $Perm
  (ite
    (and
      (and
        (>= (inv@119@01 a i) 0)
        (and
          (< (inv@119@01 a i) (len<Int> a@60@01))
          (= (mod (inv@119@01 a i) 2) 0)))
      (img@120@01 a i)
      (and (= a a@60@01) (= i (inv@119@01 a i))))
    ($Perm.min
      (ite
        (and
          (img@97@01 a i)
          (and
            (>= (inv@96@01 a i) 0)
            (and
              (< (inv@96@01 a i) (len<Int> a@60@01))
              (= (mod (inv@96@01 a i) 2) 0))))
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
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=
    (-
      (ite
        (and
          (img@97@01 a i)
          (and
            (>= (inv@96@01 a i) 0)
            (and
              (< (inv@96@01 a i) (len<Int> a@60@01))
              (= (mod (inv@96@01 a i) 2) 0))))
        $Perm.Write
        $Perm.No)
      (pTaken@121@01 a i))
    $Perm.No)
  
  :qid |quant-u-118|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=>
    (and
      (and
        (>= (inv@119@01 a i) 0)
        (and
          (< (inv@119@01 a i) (len<Int> a@60@01))
          (= (mod (inv@119@01 a i) 2) 0)))
      (img@120@01 a i)
      (and (= a a@60@01) (= i (inv@119@01 a i))))
    (= (- $Perm.Write (pTaken@121@01 a i)) $Perm.No))
  
  :qid |quant-u-119|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@122@01 $PSF<access>)
(declare-const s@123@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@123@01 $Snap)) (!
  (and
    (=>
      (Set_in s@123@01 ($PSF.domain_access (as sm@122@01  $PSF<access>)))
      (and
        (and
          (>=
            (inv@119@01 ($SortWrappers.$SnapToIArray ($Snap.first s@123@01)) ($SortWrappers.$SnapToInt ($Snap.second s@123@01)))
            0)
          (and
            (<
              (inv@119@01 ($SortWrappers.$SnapToIArray ($Snap.first s@123@01)) ($SortWrappers.$SnapToInt ($Snap.second s@123@01)))
              (len<Int> a@60@01))
            (=
              (mod
                (inv@119@01 ($SortWrappers.$SnapToIArray ($Snap.first s@123@01)) ($SortWrappers.$SnapToInt ($Snap.second s@123@01)))
                2)
              0)))
        (img@120@01 ($SortWrappers.$SnapToIArray ($Snap.first s@123@01)) ($SortWrappers.$SnapToInt ($Snap.second s@123@01)))))
    (=>
      (and
        (and
          (>=
            (inv@119@01 ($SortWrappers.$SnapToIArray ($Snap.first s@123@01)) ($SortWrappers.$SnapToInt ($Snap.second s@123@01)))
            0)
          (and
            (<
              (inv@119@01 ($SortWrappers.$SnapToIArray ($Snap.first s@123@01)) ($SortWrappers.$SnapToInt ($Snap.second s@123@01)))
              (len<Int> a@60@01))
            (=
              (mod
                (inv@119@01 ($SortWrappers.$SnapToIArray ($Snap.first s@123@01)) ($SortWrappers.$SnapToInt ($Snap.second s@123@01)))
                2)
              0)))
        (img@120@01 ($SortWrappers.$SnapToIArray ($Snap.first s@123@01)) ($SortWrappers.$SnapToInt ($Snap.second s@123@01))))
      (Set_in s@123@01 ($PSF.domain_access (as sm@122@01  $PSF<access>)))))
  :pattern ((Set_in s@123@01 ($PSF.domain_access (as sm@122@01  $PSF<access>))))
  :qid |qp.psmDomDef21|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@123@01 $Snap)) (!
  (=>
    (and
      (and
        (and
          (>=
            (inv@119@01 ($SortWrappers.$SnapToIArray ($Snap.first s@123@01)) ($SortWrappers.$SnapToInt ($Snap.second s@123@01)))
            0)
          (and
            (<
              (inv@119@01 ($SortWrappers.$SnapToIArray ($Snap.first s@123@01)) ($SortWrappers.$SnapToInt ($Snap.second s@123@01)))
              (len<Int> a@60@01))
            (=
              (mod
                (inv@119@01 ($SortWrappers.$SnapToIArray ($Snap.first s@123@01)) ($SortWrappers.$SnapToInt ($Snap.second s@123@01)))
                2)
              0)))
        (img@120@01 ($SortWrappers.$SnapToIArray ($Snap.first s@123@01)) ($SortWrappers.$SnapToInt ($Snap.second s@123@01))))
      (and
        (img@97@01 ($SortWrappers.$SnapToIArray ($Snap.first s@123@01)) ($SortWrappers.$SnapToInt ($Snap.second s@123@01)))
        (and
          (>=
            (inv@96@01 ($SortWrappers.$SnapToIArray ($Snap.first s@123@01)) ($SortWrappers.$SnapToInt ($Snap.second s@123@01)))
            0)
          (and
            (<
              (inv@96@01 ($SortWrappers.$SnapToIArray ($Snap.first s@123@01)) ($SortWrappers.$SnapToInt ($Snap.second s@123@01)))
              (len<Int> a@60@01))
            (=
              (mod
                (inv@96@01 ($SortWrappers.$SnapToIArray ($Snap.first s@123@01)) ($SortWrappers.$SnapToInt ($Snap.second s@123@01)))
                2)
              0)))))
    (and
      (not (= s@123@01 $Snap.unit))
      (=
        ($PSF.lookup_access (as sm@122@01  $PSF<access>) s@123@01)
        ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@94@01))))) s@123@01))))
  :pattern (($PSF.lookup_access (as sm@122@01  $PSF<access>) s@123@01))
  :pattern (($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@94@01))))) s@123@01))
  :qid |qp.psmValDef20|)))
; [eval] (forall j: Int :: { old(loc(a, j)) } j >= 0 && (j < i && j % 2 == 0) ==> (unfolding acc(access(a, j), write) in loc(a, j).val) == old((unfolding acc(access(a, j), write) in loc(a, j).val)))
(declare-const j@124@01 Int)
(set-option :timeout 0)
(push) ; 6
; [eval] j >= 0 && (j < i && j % 2 == 0) ==> (unfolding acc(access(a, j), write) in loc(a, j).val) == old((unfolding acc(access(a, j), write) in loc(a, j).val))
; [eval] j >= 0 && (j < i && j % 2 == 0)
; [eval] j >= 0
(push) ; 7
; [then-branch: 62 | !(j@124@01 >= 0) | live]
; [else-branch: 62 | j@124@01 >= 0 | live]
(push) ; 8
; [then-branch: 62 | !(j@124@01 >= 0)]
(assert (not (>= j@124@01 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 62 | j@124@01 >= 0]
(assert (>= j@124@01 0))
; [eval] j < i
(push) ; 9
; [then-branch: 63 | !(j@124@01 < i@61@01) | live]
; [else-branch: 63 | j@124@01 < i@61@01 | live]
(push) ; 10
; [then-branch: 63 | !(j@124@01 < i@61@01)]
(assert (not (< j@124@01 i@61@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 63 | j@124@01 < i@61@01]
(assert (< j@124@01 i@61@01))
; [eval] j % 2 == 0
; [eval] j % 2
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< j@124@01 i@61@01) (not (< j@124@01 i@61@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@124@01 0)
  (and (>= j@124@01 0) (or (< j@124@01 i@61@01) (not (< j@124@01 i@61@01))))))
(assert (or (>= j@124@01 0) (not (>= j@124@01 0))))
(push) ; 7
; [then-branch: 64 | j@124@01 >= 0 && j@124@01 < i@61@01 && j@124@01 % 2 == 0 | live]
; [else-branch: 64 | !(j@124@01 >= 0 && j@124@01 < i@61@01 && j@124@01 % 2 == 0) | live]
(push) ; 8
; [then-branch: 64 | j@124@01 >= 0 && j@124@01 < i@61@01 && j@124@01 % 2 == 0]
(assert (and (>= j@124@01 0) (and (< j@124@01 i@61@01) (= (mod j@124@01 2) 0))))
; [eval] (unfolding acc(access(a, j), write) in loc(a, j).val) == old((unfolding acc(access(a, j), write) in loc(a, j).val))
; [eval] (unfolding acc(access(a, j), write) in loc(a, j).val)
(push) ; 9
; Precomputing data for removing quantified permissions
(define-fun pTaken@125@01 ((a IArray) (i Int) (j@124@01 Int)) $Perm
  (ite
    (and (= a a@60@01) (= i j@124@01))
    ($Perm.min
      (ite
        (and
          (img@97@01 a i)
          (and
            (>= (inv@96@01 a i) 0)
            (and
              (< (inv@96@01 a i) (len<Int> a@60@01))
              (= (mod (inv@96@01 a i) 2) 0))))
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
(push) ; 10
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=
    (-
      (ite
        (and
          (img@97@01 a i)
          (and
            (>= (inv@96@01 a i) 0)
            (and
              (< (inv@96@01 a i) (len<Int> a@60@01))
              (= (mod (inv@96@01 a i) 2) 0))))
        $Perm.Write
        $Perm.No)
      (pTaken@125@01 a i j@124@01))
    $Perm.No)
  
  :qid |quant-u-121|))))
(check-sat)
; unknown
(pop) ; 10
; 0,50s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (forall ((a IArray) (i Int)) (!
  (= (pTaken@125@01 a i j@124@01) $Perm.No)
  
  :qid |quant-u-122|))))
(check-sat)
; unknown
(pop) ; 10
; 0,01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=>
    (and (= a a@60@01) (= i j@124@01))
    (= (- $Perm.Write (pTaken@125@01 a i j@124@01)) $Perm.No))
  
  :qid |quant-u-123|))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@126@01 $PSF<access>)
(declare-const s@127@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@97@01 a@60@01 j@124@01)
    (and
      (>= (inv@96@01 a@60@01 j@124@01) 0)
      (and
        (< (inv@96@01 a@60@01 j@124@01) (len<Int> a@60@01))
        (= (mod (inv@96@01 a@60@01 j@124@01) 2) 0))))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap j@124@01))
        $Snap.unit))
    (=
      ($PSF.lookup_access (as sm@126@01  $PSF<access>) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap j@124@01)))
      ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@94@01))))) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap j@124@01)))))))
(assert (access%trigger ($PSF.lookup_access (as sm@126@01  $PSF<access>) ($Snap.combine
  ($SortWrappers.IArrayTo$Snap a@60@01)
  ($SortWrappers.IntTo$Snap j@124@01))) a@60@01 j@124@01))
; [eval] i % 2 == 0
; [eval] i % 2
; [then-branch: 65 | j@124@01 % 2 == 0 | live]
; [else-branch: 65 | j@124@01 % 2 != 0 | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 65 | j@124@01 % 2 == 0]
(assert (=
  ($PSF.lookup_access (as sm@126@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap j@124@01)))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_access (as sm@126@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap j@124@01))))
    ($Snap.second ($PSF.lookup_access (as sm@126@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap j@124@01)))))))
; [eval] loc(a, i)
(assert (not (= (loc<Ref> a@60@01 j@124@01) $Ref.null)))
; [eval] loc(a, i + 1)
; [eval] i + 1
(push) ; 11
(set-option :timeout 10)
(assert (not (= (loc<Ref> a@60@01 j@124@01) (loc<Ref> a@60@01 (+ j@124@01 1)))))
(check-sat)
; unknown
(pop) ; 11
; 0,01s
; (get-info :all-statistics)
(assert (not (= (loc<Ref> a@60@01 (+ j@124@01 1)) $Ref.null)))
; [eval] loc(a, j)
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 65 | j@124@01 % 2 != 0]
(assert (not (= (mod j@124@01 2) 0)))
(assert (=
  ($PSF.lookup_access (as sm@126@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap j@124@01)))
  $Snap.unit))
; [eval] loc(a, j)
(check-sat)
; unsat
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (and
  (=>
    (and
      (img@97@01 a@60@01 j@124@01)
      (and
        (>= (inv@96@01 a@60@01 j@124@01) 0)
        (and
          (< (inv@96@01 a@60@01 j@124@01) (len<Int> a@60@01))
          (= (mod (inv@96@01 a@60@01 j@124@01) 2) 0))))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.IArrayTo$Snap a@60@01)
            ($SortWrappers.IntTo$Snap j@124@01))
          $Snap.unit))
      (=
        ($PSF.lookup_access (as sm@126@01  $PSF<access>) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap j@124@01)))
        ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@94@01))))) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap j@124@01))))))
  (access%trigger ($PSF.lookup_access (as sm@126@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap j@124@01))) a@60@01 j@124@01)))
(assert (=>
  (= (mod j@124@01 2) 0)
  (and
    (=
      ($PSF.lookup_access (as sm@126@01  $PSF<access>) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap j@124@01)))
      ($Snap.combine
        ($Snap.first ($PSF.lookup_access (as sm@126@01  $PSF<access>) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap j@124@01))))
        ($Snap.second ($PSF.lookup_access (as sm@126@01  $PSF<access>) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap j@124@01))))))
    (not (= (loc<Ref> a@60@01 j@124@01) $Ref.null))
    (not (= (loc<Ref> a@60@01 (+ j@124@01 1)) $Ref.null)))))
; [eval] old((unfolding acc(access(a, j), write) in loc(a, j).val))
; [eval] (unfolding acc(access(a, j), write) in loc(a, j).val)
(push) ; 9
; Precomputing data for removing quantified permissions
(define-fun pTaken@128@01 ((a IArray) (i Int) (j@124@01 Int)) $Perm
  (ite
    (and (= a a@60@01) (= i j@124@01))
    ($Perm.min
      (ite
        (and
          (img@66@01 a i)
          (and
            (>= (inv@65@01 a i) 0)
            (and
              (< (inv@65@01 a i) (len<Int> a@60@01))
              (= (mod (inv@65@01 a i) 2) 0))))
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
(push) ; 10
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=
    (-
      (ite
        (and
          (img@66@01 a i)
          (and
            (>= (inv@65@01 a i) 0)
            (and
              (< (inv@65@01 a i) (len<Int> a@60@01))
              (= (mod (inv@65@01 a i) 2) 0))))
        $Perm.Write
        $Perm.No)
      (pTaken@128@01 a i j@124@01))
    $Perm.No)
  
  :qid |quant-u-125|))))
(check-sat)
; unknown
(pop) ; 10
; 0,50s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (forall ((a IArray) (i Int)) (!
  (= (pTaken@128@01 a i j@124@01) $Perm.No)
  
  :qid |quant-u-126|))))
(check-sat)
; unknown
(pop) ; 10
; 0,01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (forall ((a IArray) (i Int)) (!
  (=>
    (and (= a a@60@01) (= i j@124@01))
    (= (- $Perm.Write (pTaken@128@01 a i j@124@01)) $Perm.No))
  
  :qid |quant-u-127|))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@66@01 a@60@01 j@124@01)
    (and
      (>= (inv@65@01 a@60@01 j@124@01) 0)
      (and
        (< (inv@65@01 a@60@01 j@124@01) (len<Int> a@60@01))
        (= (mod (inv@65@01 a@60@01 j@124@01) 2) 0))))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap j@124@01))
        $Snap.unit))
    (=
      ($PSF.lookup_access (as sm@84@01  $PSF<access>) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap j@124@01)))
      ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@63@01))))) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap j@124@01)))))))
(assert (access%trigger ($PSF.lookup_access (as sm@84@01  $PSF<access>) ($Snap.combine
  ($SortWrappers.IArrayTo$Snap a@60@01)
  ($SortWrappers.IntTo$Snap j@124@01))) a@60@01 j@124@01))
; [eval] i % 2 == 0
; [eval] i % 2
; [then-branch: 66 | j@124@01 % 2 == 0 | live]
; [else-branch: 66 | j@124@01 % 2 != 0 | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 66 | j@124@01 % 2 == 0]
(assert (=
  ($PSF.lookup_access (as sm@84@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap j@124@01)))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_access (as sm@84@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap j@124@01))))
    ($Snap.second ($PSF.lookup_access (as sm@84@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap j@124@01)))))))
; [eval] loc(a, i)
(assert (not (= (loc<Ref> a@60@01 j@124@01) $Ref.null)))
; [eval] loc(a, i + 1)
; [eval] i + 1
(push) ; 11
(set-option :timeout 10)
(assert (not (= (loc<Ref> a@60@01 j@124@01) (loc<Ref> a@60@01 (+ j@124@01 1)))))
(check-sat)
; unknown
(pop) ; 11
; 0,01s
; (get-info :all-statistics)
(assert (not (= (loc<Ref> a@60@01 (+ j@124@01 1)) $Ref.null)))
; [eval] loc(a, j)
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 66 | j@124@01 % 2 != 0]
(assert (not (= (mod j@124@01 2) 0)))
(assert (=
  ($PSF.lookup_access (as sm@84@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap j@124@01)))
  $Snap.unit))
; [eval] loc(a, j)
(check-sat)
; unsat
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (and
  (=>
    (and
      (img@66@01 a@60@01 j@124@01)
      (and
        (>= (inv@65@01 a@60@01 j@124@01) 0)
        (and
          (< (inv@65@01 a@60@01 j@124@01) (len<Int> a@60@01))
          (= (mod (inv@65@01 a@60@01 j@124@01) 2) 0))))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.IArrayTo$Snap a@60@01)
            ($SortWrappers.IntTo$Snap j@124@01))
          $Snap.unit))
      (=
        ($PSF.lookup_access (as sm@84@01  $PSF<access>) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap j@124@01)))
        ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@63@01))))) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap j@124@01))))))
  (access%trigger ($PSF.lookup_access (as sm@84@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap j@124@01))) a@60@01 j@124@01)))
(assert (=>
  (= (mod j@124@01 2) 0)
  (and
    (=
      ($PSF.lookup_access (as sm@84@01  $PSF<access>) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap j@124@01)))
      ($Snap.combine
        ($Snap.first ($PSF.lookup_access (as sm@84@01  $PSF<access>) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap j@124@01))))
        ($Snap.second ($PSF.lookup_access (as sm@84@01  $PSF<access>) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap j@124@01))))))
    (not (= (loc<Ref> a@60@01 j@124@01) $Ref.null))
    (not (= (loc<Ref> a@60@01 (+ j@124@01 1)) $Ref.null)))))
(pop) ; 8
(push) ; 8
; [else-branch: 64 | !(j@124@01 >= 0 && j@124@01 < i@61@01 && j@124@01 % 2 == 0)]
(assert (not (and (>= j@124@01 0) (and (< j@124@01 i@61@01) (= (mod j@124@01 2) 0)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (and (>= j@124@01 0) (and (< j@124@01 i@61@01) (= (mod j@124@01 2) 0)))
  (and
    (>= j@124@01 0)
    (< j@124@01 i@61@01)
    (= (mod j@124@01 2) 0)
    (=>
      (and
        (img@97@01 a@60@01 j@124@01)
        (and
          (>= (inv@96@01 a@60@01 j@124@01) 0)
          (and
            (< (inv@96@01 a@60@01 j@124@01) (len<Int> a@60@01))
            (= (mod (inv@96@01 a@60@01 j@124@01) 2) 0))))
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.IArrayTo$Snap a@60@01)
              ($SortWrappers.IntTo$Snap j@124@01))
            $Snap.unit))
        (=
          ($PSF.lookup_access (as sm@126@01  $PSF<access>) ($Snap.combine
            ($SortWrappers.IArrayTo$Snap a@60@01)
            ($SortWrappers.IntTo$Snap j@124@01)))
          ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@94@01))))) ($Snap.combine
            ($SortWrappers.IArrayTo$Snap a@60@01)
            ($SortWrappers.IntTo$Snap j@124@01))))))
    (access%trigger ($PSF.lookup_access (as sm@126@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap j@124@01))) a@60@01 j@124@01)
    (=>
      (= (mod j@124@01 2) 0)
      (and
        (=
          ($PSF.lookup_access (as sm@126@01  $PSF<access>) ($Snap.combine
            ($SortWrappers.IArrayTo$Snap a@60@01)
            ($SortWrappers.IntTo$Snap j@124@01)))
          ($Snap.combine
            ($Snap.first ($PSF.lookup_access (as sm@126@01  $PSF<access>) ($Snap.combine
              ($SortWrappers.IArrayTo$Snap a@60@01)
              ($SortWrappers.IntTo$Snap j@124@01))))
            ($Snap.second ($PSF.lookup_access (as sm@126@01  $PSF<access>) ($Snap.combine
              ($SortWrappers.IArrayTo$Snap a@60@01)
              ($SortWrappers.IntTo$Snap j@124@01))))))
        (not (= (loc<Ref> a@60@01 j@124@01) $Ref.null))
        (not (= (loc<Ref> a@60@01 (+ j@124@01 1)) $Ref.null))))
    (=>
      (and
        (img@66@01 a@60@01 j@124@01)
        (and
          (>= (inv@65@01 a@60@01 j@124@01) 0)
          (and
            (< (inv@65@01 a@60@01 j@124@01) (len<Int> a@60@01))
            (= (mod (inv@65@01 a@60@01 j@124@01) 2) 0))))
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.IArrayTo$Snap a@60@01)
              ($SortWrappers.IntTo$Snap j@124@01))
            $Snap.unit))
        (=
          ($PSF.lookup_access (as sm@84@01  $PSF<access>) ($Snap.combine
            ($SortWrappers.IArrayTo$Snap a@60@01)
            ($SortWrappers.IntTo$Snap j@124@01)))
          ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@63@01))))) ($Snap.combine
            ($SortWrappers.IArrayTo$Snap a@60@01)
            ($SortWrappers.IntTo$Snap j@124@01))))))
    (access%trigger ($PSF.lookup_access (as sm@84@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap j@124@01))) a@60@01 j@124@01)
    (=>
      (= (mod j@124@01 2) 0)
      (and
        (=
          ($PSF.lookup_access (as sm@84@01  $PSF<access>) ($Snap.combine
            ($SortWrappers.IArrayTo$Snap a@60@01)
            ($SortWrappers.IntTo$Snap j@124@01)))
          ($Snap.combine
            ($Snap.first ($PSF.lookup_access (as sm@84@01  $PSF<access>) ($Snap.combine
              ($SortWrappers.IArrayTo$Snap a@60@01)
              ($SortWrappers.IntTo$Snap j@124@01))))
            ($Snap.second ($PSF.lookup_access (as sm@84@01  $PSF<access>) ($Snap.combine
              ($SortWrappers.IArrayTo$Snap a@60@01)
              ($SortWrappers.IntTo$Snap j@124@01))))))
        (not (= (loc<Ref> a@60@01 j@124@01) $Ref.null))
        (not (= (loc<Ref> a@60@01 (+ j@124@01 1)) $Ref.null)))))))
; Joined path conditions
(assert (or
  (not (and (>= j@124@01 0) (and (< j@124@01 i@61@01) (= (mod j@124@01 2) 0))))
  (and (>= j@124@01 0) (and (< j@124@01 i@61@01) (= (mod j@124@01 2) 0)))))
; [eval] old(loc(a, j))
; [eval] loc(a, j)
(pop) ; 6
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@124@01 Int)) (!
  (and
    (=>
      (>= j@124@01 0)
      (and (>= j@124@01 0) (or (< j@124@01 i@61@01) (not (< j@124@01 i@61@01)))))
    (or (>= j@124@01 0) (not (>= j@124@01 0)))
    (=>
      (and (>= j@124@01 0) (and (< j@124@01 i@61@01) (= (mod j@124@01 2) 0)))
      (and
        (>= j@124@01 0)
        (< j@124@01 i@61@01)
        (= (mod j@124@01 2) 0)
        (=>
          (and
            (img@97@01 a@60@01 j@124@01)
            (and
              (>= (inv@96@01 a@60@01 j@124@01) 0)
              (and
                (< (inv@96@01 a@60@01 j@124@01) (len<Int> a@60@01))
                (= (mod (inv@96@01 a@60@01 j@124@01) 2) 0))))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.IArrayTo$Snap a@60@01)
                  ($SortWrappers.IntTo$Snap j@124@01))
                $Snap.unit))
            (=
              ($PSF.lookup_access (as sm@126@01  $PSF<access>) ($Snap.combine
                ($SortWrappers.IArrayTo$Snap a@60@01)
                ($SortWrappers.IntTo$Snap j@124@01)))
              ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@94@01))))) ($Snap.combine
                ($SortWrappers.IArrayTo$Snap a@60@01)
                ($SortWrappers.IntTo$Snap j@124@01))))))
        (access%trigger ($PSF.lookup_access (as sm@126@01  $PSF<access>) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap j@124@01))) a@60@01 j@124@01)
        (=>
          (= (mod j@124@01 2) 0)
          (and
            (=
              ($PSF.lookup_access (as sm@126@01  $PSF<access>) ($Snap.combine
                ($SortWrappers.IArrayTo$Snap a@60@01)
                ($SortWrappers.IntTo$Snap j@124@01)))
              ($Snap.combine
                ($Snap.first ($PSF.lookup_access (as sm@126@01  $PSF<access>) ($Snap.combine
                  ($SortWrappers.IArrayTo$Snap a@60@01)
                  ($SortWrappers.IntTo$Snap j@124@01))))
                ($Snap.second ($PSF.lookup_access (as sm@126@01  $PSF<access>) ($Snap.combine
                  ($SortWrappers.IArrayTo$Snap a@60@01)
                  ($SortWrappers.IntTo$Snap j@124@01))))))
            (not (= (loc<Ref> a@60@01 j@124@01) $Ref.null))
            (not (= (loc<Ref> a@60@01 (+ j@124@01 1)) $Ref.null))))
        (=>
          (and
            (img@66@01 a@60@01 j@124@01)
            (and
              (>= (inv@65@01 a@60@01 j@124@01) 0)
              (and
                (< (inv@65@01 a@60@01 j@124@01) (len<Int> a@60@01))
                (= (mod (inv@65@01 a@60@01 j@124@01) 2) 0))))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.IArrayTo$Snap a@60@01)
                  ($SortWrappers.IntTo$Snap j@124@01))
                $Snap.unit))
            (=
              ($PSF.lookup_access (as sm@84@01  $PSF<access>) ($Snap.combine
                ($SortWrappers.IArrayTo$Snap a@60@01)
                ($SortWrappers.IntTo$Snap j@124@01)))
              ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@63@01))))) ($Snap.combine
                ($SortWrappers.IArrayTo$Snap a@60@01)
                ($SortWrappers.IntTo$Snap j@124@01))))))
        (access%trigger ($PSF.lookup_access (as sm@84@01  $PSF<access>) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap j@124@01))) a@60@01 j@124@01)
        (=>
          (= (mod j@124@01 2) 0)
          (and
            (=
              ($PSF.lookup_access (as sm@84@01  $PSF<access>) ($Snap.combine
                ($SortWrappers.IArrayTo$Snap a@60@01)
                ($SortWrappers.IntTo$Snap j@124@01)))
              ($Snap.combine
                ($Snap.first ($PSF.lookup_access (as sm@84@01  $PSF<access>) ($Snap.combine
                  ($SortWrappers.IArrayTo$Snap a@60@01)
                  ($SortWrappers.IntTo$Snap j@124@01))))
                ($Snap.second ($PSF.lookup_access (as sm@84@01  $PSF<access>) ($Snap.combine
                  ($SortWrappers.IArrayTo$Snap a@60@01)
                  ($SortWrappers.IntTo$Snap j@124@01))))))
            (not (= (loc<Ref> a@60@01 j@124@01) $Ref.null))
            (not (= (loc<Ref> a@60@01 (+ j@124@01 1)) $Ref.null))))))
    (or
      (not
        (and (>= j@124@01 0) (and (< j@124@01 i@61@01) (= (mod j@124@01 2) 0))))
      (and (>= j@124@01 0) (and (< j@124@01 i@61@01) (= (mod j@124@01 2) 0)))))
  :pattern ((loc<Ref> a@60@01 j@124@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/issues/block_array.vpr@50@9@50@157-aux|)))
(push) ; 6
(assert (not (forall ((j@124@01 Int)) (!
  (=>
    (and (>= j@124@01 0) (and (< j@124@01 i@61@01) (= (mod j@124@01 2) 0)))
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_access (as sm@126@01  $PSF<access>) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap j@124@01)))))
      ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_access (as sm@84@01  $PSF<access>) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap j@124@01)))))))
  :pattern ((loc<Ref> a@60@01 j@124@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/issues/block_array.vpr@50@9@50@157|))))
(check-sat)
; ---------- setVal2 ----------
