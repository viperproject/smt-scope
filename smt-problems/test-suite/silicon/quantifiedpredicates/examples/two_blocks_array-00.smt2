(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:25:13
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpredicates/examples/two_blocks_array.vpr
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
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(access(a, i), write)
; Precomputing data for removing quantified permissions
(define-fun pTaken@71@01 ((a IArray) (i Int)) $Perm
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
      (pTaken@71@01 a i))
    $Perm.No)
  
  :qid |quant-u-35|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((a IArray) (i Int)) (!
  (= (pTaken@71@01 a i) $Perm.No)
  
  :qid |quant-u-36|))))
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
    (= (- $Perm.Write (pTaken@71@01 a i)) $Perm.No))
  
  :qid |quant-u-37|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@72@01 $PSF<access>)
(declare-const s@73@01 $Snap)
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
      ($PSF.lookup_access (as sm@72@01  $PSF<access>) ($Snap.combine
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
; [then-branch: 23 | i@61@01 % 2 == 0 | live]
; [else-branch: 23 | i@61@01 % 2 != 0 | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 23 | i@61@01 % 2 == 0]
(assert (=
  ($PSF.lookup_access (as sm@72@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap i@61@01)))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_access (as sm@72@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap i@61@01))))
    ($Snap.second ($PSF.lookup_access (as sm@72@01  $PSF<access>) ($Snap.combine
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
(assert (access%trigger ($PSF.lookup_access (as sm@72@01  $PSF<access>) ($Snap.combine
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
; [then-branch: 24 | i@61@01 % 2 == 0 | live]
; [else-branch: 24 | i@61@01 % 2 != 0 | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 24 | i@61@01 % 2 == 0]
; [eval] loc(a, i)
; [eval] loc(a, i + 1)
; [eval] i + 1
(assert (access%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap newVal@62@01)
  ($SortWrappers.IntTo$Snap newVal@62@01)) a@60@01 i@61@01))
(declare-const sm@74@01 $PSF<access>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_access (as sm@74@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap i@61@01)))
  ($Snap.combine
    ($SortWrappers.IntTo$Snap newVal@62@01)
    ($SortWrappers.IntTo$Snap newVal@62@01))))
; [exec]
; assert (unfolding acc(access(a, i), write) in loc(a, i).val == newVal) &&
;   (unfolding acc(access(a, i), write) in loc(a, i + 1).val == newVal)
; [eval] (unfolding acc(access(a, i), write) in loc(a, i).val == newVal)
(push) ; 5
; Precomputing data for removing quantified permissions
(define-fun pTaken@75@01 ((a IArray) (i Int)) $Perm
  (ite
    (and (= a a@60@01) (= i i@61@01))
    ($Perm.min
      (ite (and (= a a@60@01) (= i i@61@01)) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@76@01 ((a IArray) (i Int)) $Perm
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
        (- $Perm.Write (pTaken@71@01 a i))
        $Perm.No)
      (- $Perm.Write (pTaken@75@01 a i)))
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
(assert (not (= (- $Perm.Write (pTaken@75@01 a@60@01 i@61@01)) $Perm.No)))
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
    (and (= a a@60@01) (= i i@61@01))
    (= (- $Perm.Write (pTaken@75@01 a i)) $Perm.No))
  
  :qid |quant-u-40|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@77@01 $PSF<access>)
(declare-const s@78@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (and
  (not
    (=
      ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap i@61@01))
      $Snap.unit))
  (=
    ($PSF.lookup_access (as sm@77@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap i@61@01)))
    ($PSF.lookup_access (as sm@74@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap i@61@01))))))
(assert (=>
  (ite
    (and
      (img@66@01 a@60@01 i@61@01)
      (and
        (>= (inv@65@01 a@60@01 i@61@01) 0)
        (and
          (< (inv@65@01 a@60@01 i@61@01) (len<Int> a@60@01))
          (= (mod (inv@65@01 a@60@01 i@61@01) 2) 0))))
    (< $Perm.No (- $Perm.Write (pTaken@71@01 a@60@01 i@61@01)))
    false)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap i@61@01))
        $Snap.unit))
    (=
      ($PSF.lookup_access (as sm@77@01  $PSF<access>) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap i@61@01)))
      ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@63@01))))) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap i@61@01)))))))
(assert (access%trigger ($PSF.lookup_access (as sm@77@01  $PSF<access>) ($Snap.combine
  ($SortWrappers.IArrayTo$Snap a@60@01)
  ($SortWrappers.IntTo$Snap i@61@01))) a@60@01 i@61@01))
; [eval] i % 2 == 0
; [eval] i % 2
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= (mod i@61@01 2) 0))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 25 | i@61@01 % 2 == 0 | live]
; [else-branch: 25 | i@61@01 % 2 != 0 | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 25 | i@61@01 % 2 == 0]
(assert (=
  ($PSF.lookup_access (as sm@77@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap i@61@01)))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_access (as sm@77@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap i@61@01))))
    ($Snap.second ($PSF.lookup_access (as sm@77@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap i@61@01)))))))
; [eval] loc(a, i)
; [eval] loc(a, i + 1)
; [eval] i + 1
(push) ; 7
(set-option :timeout 10)
(assert (not (= (loc<Ref> a@60@01 i@61@01) (loc<Ref> a@60@01 (+ i@61@01 1)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] loc(a, i).val == newVal
; [eval] loc(a, i)
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (and
  (not
    (=
      ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap i@61@01))
      $Snap.unit))
  (=
    ($PSF.lookup_access (as sm@77@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap i@61@01)))
    ($PSF.lookup_access (as sm@74@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap i@61@01))))
  (=>
    (ite
      (and
        (img@66@01 a@60@01 i@61@01)
        (and
          (>= (inv@65@01 a@60@01 i@61@01) 0)
          (and
            (< (inv@65@01 a@60@01 i@61@01) (len<Int> a@60@01))
            (= (mod (inv@65@01 a@60@01 i@61@01) 2) 0))))
      (< $Perm.No (- $Perm.Write (pTaken@71@01 a@60@01 i@61@01)))
      false)
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.IArrayTo$Snap a@60@01)
            ($SortWrappers.IntTo$Snap i@61@01))
          $Snap.unit))
      (=
        ($PSF.lookup_access (as sm@77@01  $PSF<access>) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap i@61@01)))
        ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@63@01))))) ($Snap.combine
          ($SortWrappers.IArrayTo$Snap a@60@01)
          ($SortWrappers.IntTo$Snap i@61@01))))))
  (access%trigger ($PSF.lookup_access (as sm@77@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap i@61@01))) a@60@01 i@61@01)))
(assert (=>
  (= (mod i@61@01 2) 0)
  (=
    ($PSF.lookup_access (as sm@77@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap i@61@01)))
    ($Snap.combine
      ($Snap.first ($PSF.lookup_access (as sm@77@01  $PSF<access>) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap i@61@01))))
      ($Snap.second ($PSF.lookup_access (as sm@77@01  $PSF<access>) ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap i@61@01))))))))
(set-option :timeout 0)
(push) ; 5
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_access (as sm@77@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap i@61@01)))))
  newVal@62@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_access (as sm@77@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap i@61@01)))))
  newVal@62@01))
; [eval] (unfolding acc(access(a, i), write) in loc(a, i + 1).val == newVal)
(push) ; 5
; Precomputing data for removing quantified permissions
(define-fun pTaken@79@01 ((a IArray) (i Int)) $Perm
  (ite
    (and (= a a@60@01) (= i i@61@01))
    ($Perm.min
      (ite (and (= a a@60@01) (= i i@61@01)) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@80@01 ((a IArray) (i Int)) $Perm
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
        (- $Perm.Write (pTaken@71@01 a i))
        $Perm.No)
      (- $Perm.Write (pTaken@79@01 a i)))
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
(assert (not (= (- $Perm.Write (pTaken@79@01 a@60@01 i@61@01)) $Perm.No)))
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
    (and (= a a@60@01) (= i i@61@01))
    (= (- $Perm.Write (pTaken@79@01 a i)) $Perm.No))
  
  :qid |quant-u-43|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (and
  (not
    (=
      ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap i@61@01))
      $Snap.unit))
  (=
    ($PSF.lookup_access (as sm@77@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap i@61@01)))
    ($PSF.lookup_access (as sm@74@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap i@61@01))))))
; [eval] i % 2 == 0
; [eval] i % 2
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= (mod i@61@01 2) 0))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 26 | i@61@01 % 2 == 0 | live]
; [else-branch: 26 | i@61@01 % 2 != 0 | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 26 | i@61@01 % 2 == 0]
(assert (=
  ($PSF.lookup_access (as sm@77@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap i@61@01)))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_access (as sm@77@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap i@61@01))))
    ($Snap.second ($PSF.lookup_access (as sm@77@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap i@61@01)))))))
; [eval] loc(a, i)
; [eval] loc(a, i + 1)
; [eval] i + 1
(push) ; 7
(set-option :timeout 10)
(assert (not (= (loc<Ref> a@60@01 i@61@01) (loc<Ref> a@60@01 (+ i@61@01 1)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] loc(a, i + 1).val == newVal
; [eval] loc(a, i + 1)
; [eval] i + 1
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (and
  (not
    (=
      ($Snap.combine
        ($SortWrappers.IArrayTo$Snap a@60@01)
        ($SortWrappers.IntTo$Snap i@61@01))
      $Snap.unit))
  (=
    ($PSF.lookup_access (as sm@77@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap i@61@01)))
    ($PSF.lookup_access (as sm@74@01  $PSF<access>) ($Snap.combine
      ($SortWrappers.IArrayTo$Snap a@60@01)
      ($SortWrappers.IntTo$Snap i@61@01))))))
(set-option :timeout 0)
(push) ; 5
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.second ($PSF.lookup_access (as sm@77@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap i@61@01)))))
  newVal@62@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.second ($PSF.lookup_access (as sm@77@01  $PSF<access>) ($Snap.combine
    ($SortWrappers.IArrayTo$Snap a@60@01)
    ($SortWrappers.IntTo$Snap i@61@01)))))
  newVal@62@01))
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
; [then-branch: 27 | i@61@01 + 2 < len[Int](a@60@01) | live]
; [else-branch: 27 | !(i@61@01 + 2 < len[Int](a@60@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 27 | i@61@01 + 2 < len[Int](a@60@01)]
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
(declare-const j@81@01 Int)
(push) ; 6
; [eval] j >= 0 && (j < len(a) && j % 2 == 0)
; [eval] j >= 0
(push) ; 7
; [then-branch: 28 | !(j@81@01 >= 0) | live]
; [else-branch: 28 | j@81@01 >= 0 | live]
(push) ; 8
; [then-branch: 28 | !(j@81@01 >= 0)]
(assert (not (>= j@81@01 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 28 | j@81@01 >= 0]
(assert (>= j@81@01 0))
; [eval] j < len(a)
; [eval] len(a)
(push) ; 9
; [then-branch: 29 | !(j@81@01 < len[Int](a@60@01)) | live]
; [else-branch: 29 | j@81@01 < len[Int](a@60@01) | live]
(push) ; 10
; [then-branch: 29 | !(j@81@01 < len[Int](a@60@01))]
(assert (not (< j@81@01 (len<Int> a@60@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 29 | j@81@01 < len[Int](a@60@01)]
(assert (< j@81@01 (len<Int> a@60@01)))
; [eval] j % 2 == 0
; [eval] j % 2
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< j@81@01 (len<Int> a@60@01)) (not (< j@81@01 (len<Int> a@60@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@81@01 0)
  (and
    (>= j@81@01 0)
    (or (< j@81@01 (len<Int> a@60@01)) (not (< j@81@01 (len<Int> a@60@01)))))))
(assert (or (>= j@81@01 0) (not (>= j@81@01 0))))
(assert (and (>= j@81@01 0) (and (< j@81@01 (len<Int> a@60@01)) (= (mod j@81@01 2) 0))))
(pop) ; 6
(declare-fun inv@82@01 (IArray Int) Int)
(declare-fun img@83@01 (IArray Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@81@01 Int)) (!
  (=>
    (and
      (>= j@81@01 0)
      (and (< j@81@01 (len<Int> a@60@01)) (= (mod j@81@01 2) 0)))
    (and
      (=>
        (>= j@81@01 0)
        (and
          (>= j@81@01 0)
          (or
            (< j@81@01 (len<Int> a@60@01))
            (not (< j@81@01 (len<Int> a@60@01))))))
      (or (>= j@81@01 0) (not (>= j@81@01 0)))))
  :pattern ((inv@82@01 a@60@01 j@81@01))
  :pattern ((img@83@01 a@60@01 j@81@01))
  :qid |access-aux|)))
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((j1@81@01 Int) (j2@81@01 Int)) (!
  (=>
    (and
      (and
        (>= j1@81@01 0)
        (and (< j1@81@01 (len<Int> a@60@01)) (= (mod j1@81@01 2) 0)))
      (and
        (>= j2@81@01 0)
        (and (< j2@81@01 (len<Int> a@60@01)) (= (mod j2@81@01 2) 0)))
      (= j1@81@01 j2@81@01))
    (= j1@81@01 j2@81@01))
  
  :qid |access-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@81@01 Int)) (!
  (=>
    (and
      (>= j@81@01 0)
      (and (< j@81@01 (len<Int> a@60@01)) (= (mod j@81@01 2) 0)))
    (and (= (inv@82@01 a@60@01 j@81@01) j@81@01) (img@83@01 a@60@01 j@81@01)))
  :pattern ((inv@82@01 a@60@01 j@81@01))
  :pattern ((img@83@01 a@60@01 j@81@01))
  :qid |access-invOfFct|)))
(assert (forall ((a IArray) (i Int)) (!
  (=>
    (and
      (img@83@01 a i)
      (and
        (>= (inv@82@01 a i) 0)
        (and
          (< (inv@82@01 a i) (len<Int> a@60@01))
          (= (mod (inv@82@01 a i) 2) 0))))
    (and (= a@60@01 a) (= (inv@82@01 a i) i)))
  :pattern ((inv@82@01 a i))
  :qid |access-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@84@01 ((a IArray) (i Int)) $Perm
  (ite
    (and
      (and
        (>= (inv@82@01 a i) 0)
        (and
          (< (inv@82@01 a i) (len<Int> a@60@01))
          (= (mod (inv@82@01 a i) 2) 0)))
      (img@83@01 a i)
      (and (= a a@60@01) (= i (inv@82@01 a i))))
    ($Perm.min
      (ite
        (and
          (img@66@01 a i)
          (and
            (>= (inv@65@01 a i) 0)
            (and
              (< (inv@65@01 a i) (len<Int> a@60@01))
              (= (mod (inv@65@01 a i) 2) 0))))
        (- $Perm.Write (pTaken@71@01 a i))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@85@01 ((a IArray) (i Int)) $Perm
  (ite
    (and
      (and
        (>= (inv@82@01 a i) 0)
        (and
          (< (inv@82@01 a i) (len<Int> a@60@01))
          (= (mod (inv@82@01 a i) 2) 0)))
      (img@83@01 a i)
      (and (= a a@60@01) (= i (inv@82@01 a i))))
    ($Perm.min
      (ite (and (= a a@60@01) (= i i@61@01)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@84@01 a i)))
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
        (- $Perm.Write (pTaken@71@01 a i))
        $Perm.No)
      (pTaken@84@01 a i))
    $Perm.No)
  
  :qid |quant-u-46|))))
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
        (>= (inv@82@01 a i) 0)
        (and
          (< (inv@82@01 a i) (len<Int> a@60@01))
          (= (mod (inv@82@01 a i) 2) 0)))
      (img@83@01 a i)
      (and (= a a@60@01) (= i (inv@82@01 a i))))
    (= (- $Perm.Write (pTaken@84@01 a i)) $Perm.No))
  
  :qid |quant-u-47|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@85@01 a@60@01 i@61@01)) $Perm.No)))
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
        (>= (inv@82@01 a i) 0)
        (and
          (< (inv@82@01 a i) (len<Int> a@60@01))
          (= (mod (inv@82@01 a i) 2) 0)))
      (img@83@01 a i)
      (and (= a a@60@01) (= i (inv@82@01 a i))))
    (= (- (- $Perm.Write (pTaken@84@01 a i)) (pTaken@85@01 a i)) $Perm.No))
  
  :qid |quant-u-49|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@86@01 $PSF<access>)
(declare-const s@87@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@87@01 $Snap)) (!
  (and
    (=>
      (Set_in s@87@01 ($PSF.domain_access (as sm@86@01  $PSF<access>)))
      (and
        (and
          (>=
            (inv@82@01 ($SortWrappers.$SnapToIArray ($Snap.first s@87@01)) ($SortWrappers.$SnapToInt ($Snap.second s@87@01)))
            0)
          (and
            (<
              (inv@82@01 ($SortWrappers.$SnapToIArray ($Snap.first s@87@01)) ($SortWrappers.$SnapToInt ($Snap.second s@87@01)))
              (len<Int> a@60@01))
            (=
              (mod
                (inv@82@01 ($SortWrappers.$SnapToIArray ($Snap.first s@87@01)) ($SortWrappers.$SnapToInt ($Snap.second s@87@01)))
                2)
              0)))
        (img@83@01 ($SortWrappers.$SnapToIArray ($Snap.first s@87@01)) ($SortWrappers.$SnapToInt ($Snap.second s@87@01)))))
    (=>
      (and
        (and
          (>=
            (inv@82@01 ($SortWrappers.$SnapToIArray ($Snap.first s@87@01)) ($SortWrappers.$SnapToInt ($Snap.second s@87@01)))
            0)
          (and
            (<
              (inv@82@01 ($SortWrappers.$SnapToIArray ($Snap.first s@87@01)) ($SortWrappers.$SnapToInt ($Snap.second s@87@01)))
              (len<Int> a@60@01))
            (=
              (mod
                (inv@82@01 ($SortWrappers.$SnapToIArray ($Snap.first s@87@01)) ($SortWrappers.$SnapToInt ($Snap.second s@87@01)))
                2)
              0)))
        (img@83@01 ($SortWrappers.$SnapToIArray ($Snap.first s@87@01)) ($SortWrappers.$SnapToInt ($Snap.second s@87@01))))
      (Set_in s@87@01 ($PSF.domain_access (as sm@86@01  $PSF<access>)))))
  :pattern ((Set_in s@87@01 ($PSF.domain_access (as sm@86@01  $PSF<access>))))
  :qid |qp.psmDomDef14|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@87@01 $Snap)) (!
  (=>
    (and
      (and
        (and
          (>=
            (inv@82@01 ($SortWrappers.$SnapToIArray ($Snap.first s@87@01)) ($SortWrappers.$SnapToInt ($Snap.second s@87@01)))
            0)
          (and
            (<
              (inv@82@01 ($SortWrappers.$SnapToIArray ($Snap.first s@87@01)) ($SortWrappers.$SnapToInt ($Snap.second s@87@01)))
              (len<Int> a@60@01))
            (=
              (mod
                (inv@82@01 ($SortWrappers.$SnapToIArray ($Snap.first s@87@01)) ($SortWrappers.$SnapToInt ($Snap.second s@87@01)))
                2)
              0)))
        (img@83@01 ($SortWrappers.$SnapToIArray ($Snap.first s@87@01)) ($SortWrappers.$SnapToInt ($Snap.second s@87@01))))
      (and
        (= ($SortWrappers.$SnapToIArray ($Snap.first s@87@01)) a@60@01)
        (= ($SortWrappers.$SnapToInt ($Snap.second s@87@01)) i@61@01)))
    (and
      (not (= s@87@01 $Snap.unit))
      (=
        ($PSF.lookup_access (as sm@86@01  $PSF<access>) s@87@01)
        ($PSF.lookup_access (as sm@74@01  $PSF<access>) s@87@01))))
  :pattern (($PSF.lookup_access (as sm@86@01  $PSF<access>) s@87@01))
  :pattern (($PSF.lookup_access (as sm@74@01  $PSF<access>) s@87@01))
  :qid |qp.psmValDef12|)))
(assert (forall ((s@87@01 $Snap)) (!
  (=>
    (and
      (and
        (and
          (>=
            (inv@82@01 ($SortWrappers.$SnapToIArray ($Snap.first s@87@01)) ($SortWrappers.$SnapToInt ($Snap.second s@87@01)))
            0)
          (and
            (<
              (inv@82@01 ($SortWrappers.$SnapToIArray ($Snap.first s@87@01)) ($SortWrappers.$SnapToInt ($Snap.second s@87@01)))
              (len<Int> a@60@01))
            (=
              (mod
                (inv@82@01 ($SortWrappers.$SnapToIArray ($Snap.first s@87@01)) ($SortWrappers.$SnapToInt ($Snap.second s@87@01)))
                2)
              0)))
        (img@83@01 ($SortWrappers.$SnapToIArray ($Snap.first s@87@01)) ($SortWrappers.$SnapToInt ($Snap.second s@87@01))))
      (ite
        (and
          (img@66@01 ($SortWrappers.$SnapToIArray ($Snap.first s@87@01)) ($SortWrappers.$SnapToInt ($Snap.second s@87@01)))
          (and
            (>=
              (inv@65@01 ($SortWrappers.$SnapToIArray ($Snap.first s@87@01)) ($SortWrappers.$SnapToInt ($Snap.second s@87@01)))
              0)
            (and
              (<
                (inv@65@01 ($SortWrappers.$SnapToIArray ($Snap.first s@87@01)) ($SortWrappers.$SnapToInt ($Snap.second s@87@01)))
                (len<Int> a@60@01))
              (=
                (mod
                  (inv@65@01 ($SortWrappers.$SnapToIArray ($Snap.first s@87@01)) ($SortWrappers.$SnapToInt ($Snap.second s@87@01)))
                  2)
                0))))
        (<
          $Perm.No
          (-
            $Perm.Write
            (pTaken@71@01 ($SortWrappers.$SnapToIArray ($Snap.first s@87@01)) ($SortWrappers.$SnapToInt ($Snap.second s@87@01)))))
        false))
    (and
      (not (= s@87@01 $Snap.unit))
      (=
        ($PSF.lookup_access (as sm@86@01  $PSF<access>) s@87@01)
        ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@63@01))))) s@87@01))))
  :pattern (($PSF.lookup_access (as sm@86@01  $PSF<access>) s@87@01))
  :pattern (($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@63@01))))) s@87@01))
  :qid |qp.psmValDef13|)))
(declare-const $t@88@01 $Snap)
(assert (= $t@88@01 ($Snap.combine ($Snap.first $t@88@01) ($Snap.second $t@88@01))))
(assert (= ($Snap.first $t@88@01) $Snap.unit))
; [eval] i >= 0
(assert (=
  ($Snap.second $t@88@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@88@01))
    ($Snap.second ($Snap.second $t@88@01)))))
(assert (= ($Snap.first ($Snap.second $t@88@01)) $Snap.unit))
; [eval] i < len(a)
; [eval] len(a)
(assert (=
  ($Snap.second ($Snap.second $t@88@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@88@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@88@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@88@01))) $Snap.unit))
; [eval] len(a) % 2 == old(len(a) % 2)
; [eval] len(a) % 2
; [eval] len(a)
; [eval] old(len(a) % 2)
; [eval] len(a) % 2
; [eval] len(a)
(declare-const j@89@01 Int)
(set-option :timeout 0)
(push) ; 6
; [eval] j >= 0 && (j < len(a) && j % 2 == 0)
; [eval] j >= 0
(push) ; 7
; [then-branch: 30 | !(j@89@01 >= 0) | live]
; [else-branch: 30 | j@89@01 >= 0 | live]
(push) ; 8
; [then-branch: 30 | !(j@89@01 >= 0)]
(assert (not (>= j@89@01 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 30 | j@89@01 >= 0]
(assert (>= j@89@01 0))
; [eval] j < len(a)
; [eval] len(a)
(push) ; 9
; [then-branch: 31 | !(j@89@01 < len[Int](a@60@01)) | live]
; [else-branch: 31 | j@89@01 < len[Int](a@60@01) | live]
(push) ; 10
; [then-branch: 31 | !(j@89@01 < len[Int](a@60@01))]
(assert (not (< j@89@01 (len<Int> a@60@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 31 | j@89@01 < len[Int](a@60@01)]
(assert (< j@89@01 (len<Int> a@60@01)))
; [eval] j % 2 == 0
; [eval] j % 2
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< j@89@01 (len<Int> a@60@01)) (not (< j@89@01 (len<Int> a@60@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@89@01 0)
  (and
    (>= j@89@01 0)
    (or (< j@89@01 (len<Int> a@60@01)) (not (< j@89@01 (len<Int> a@60@01)))))))
(assert (or (>= j@89@01 0) (not (>= j@89@01 0))))
(assert (and (>= j@89@01 0) (and (< j@89@01 (len<Int> a@60@01)) (= (mod j@89@01 2) 0))))
(pop) ; 6
(declare-fun inv@90@01 (IArray Int) Int)
(declare-fun img@91@01 (IArray Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@89@01 Int)) (!
  (=>
    (and
      (>= j@89@01 0)
      (and (< j@89@01 (len<Int> a@60@01)) (= (mod j@89@01 2) 0)))
    (and
      (=>
        (>= j@89@01 0)
        (and
          (>= j@89@01 0)
          (or
            (< j@89@01 (len<Int> a@60@01))
            (not (< j@89@01 (len<Int> a@60@01))))))
      (or (>= j@89@01 0) (not (>= j@89@01 0)))))
  :pattern ((inv@90@01 a@60@01 j@89@01))
  :pattern ((img@91@01 a@60@01 j@89@01))
  :qid |access-aux|)))
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((j1@89@01 Int) (j2@89@01 Int)) (!
  (=>
    (and
      (and
        (>= j1@89@01 0)
        (and (< j1@89@01 (len<Int> a@60@01)) (= (mod j1@89@01 2) 0)))
      (and
        (>= j2@89@01 0)
        (and (< j2@89@01 (len<Int> a@60@01)) (= (mod j2@89@01 2) 0)))
      (= j1@89@01 j2@89@01))
    (= j1@89@01 j2@89@01))
  
  :qid |access-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@89@01 Int)) (!
  (=>
    (and
      (>= j@89@01 0)
      (and (< j@89@01 (len<Int> a@60@01)) (= (mod j@89@01 2) 0)))
    (and (= (inv@90@01 a@60@01 j@89@01) j@89@01) (img@91@01 a@60@01 j@89@01)))
  :pattern ((inv@90@01 a@60@01 j@89@01))
  :pattern ((img@91@01 a@60@01 j@89@01))
  :qid |quant-u-51|)))
(assert (forall ((a IArray) (i Int)) (!
  (=>
    (and
      (img@91@01 a i)
      (and
        (>= (inv@90@01 a i) 0)
        (and
          (< (inv@90@01 a i) (len<Int> a@60@01))
          (= (mod (inv@90@01 a i) 2) 0))))
    (and (= a@60@01 a) (= (inv@90@01 a i) i)))
  :pattern ((inv@90@01 a i))
  :qid |access-fctOfInv|)))
; Permissions are non-negative
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] i >= 0
; [eval] i < len(a)
; [eval] len(a)
; [eval] len(a) % 2 == old(len(a) % 2)
; [eval] len(a) % 2
; [eval] len(a)
; [eval] old(len(a) % 2)
; [eval] len(a) % 2
; [eval] len(a)
(declare-const j@92@01 Int)
(set-option :timeout 0)
(push) ; 6
; [eval] j >= 0 && (j < len(a) && j % 2 == 0)
; [eval] j >= 0
(push) ; 7
; [then-branch: 32 | !(j@92@01 >= 0) | live]
; [else-branch: 32 | j@92@01 >= 0 | live]
(push) ; 8
; [then-branch: 32 | !(j@92@01 >= 0)]
(assert (not (>= j@92@01 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 32 | j@92@01 >= 0]
(assert (>= j@92@01 0))
; [eval] j < len(a)
; [eval] len(a)
(push) ; 9
; [then-branch: 33 | !(j@92@01 < len[Int](a@60@01)) | live]
; [else-branch: 33 | j@92@01 < len[Int](a@60@01) | live]
(push) ; 10
; [then-branch: 33 | !(j@92@01 < len[Int](a@60@01))]
(assert (not (< j@92@01 (len<Int> a@60@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 33 | j@92@01 < len[Int](a@60@01)]
(assert (< j@92@01 (len<Int> a@60@01)))
; [eval] j % 2 == 0
; [eval] j % 2
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< j@92@01 (len<Int> a@60@01)) (not (< j@92@01 (len<Int> a@60@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@92@01 0)
  (and
    (>= j@92@01 0)
    (or (< j@92@01 (len<Int> a@60@01)) (not (< j@92@01 (len<Int> a@60@01)))))))
(assert (or (>= j@92@01 0) (not (>= j@92@01 0))))
(assert (and (>= j@92@01 0) (and (< j@92@01 (len<Int> a@60@01)) (= (mod j@92@01 2) 0))))
(pop) ; 6
(declare-fun inv@93@01 (IArray Int) Int)
(declare-fun img@94@01 (IArray Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@92@01 Int)) (!
  (=>
    (and
      (>= j@92@01 0)
      (and (< j@92@01 (len<Int> a@60@01)) (= (mod j@92@01 2) 0)))
    (and
      (=>
        (>= j@92@01 0)
        (and
          (>= j@92@01 0)
          (or
            (< j@92@01 (len<Int> a@60@01))
            (not (< j@92@01 (len<Int> a@60@01))))))
      (or (>= j@92@01 0) (not (>= j@92@01 0)))))
  :pattern ((inv@93@01 a@60@01 j@92@01))
  :pattern ((img@94@01 a@60@01 j@92@01))
  :qid |access-aux|)))
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((j1@92@01 Int) (j2@92@01 Int)) (!
  (=>
    (and
      (and
        (>= j1@92@01 0)
        (and (< j1@92@01 (len<Int> a@60@01)) (= (mod j1@92@01 2) 0)))
      (and
        (>= j2@92@01 0)
        (and (< j2@92@01 (len<Int> a@60@01)) (= (mod j2@92@01 2) 0)))
      (= j1@92@01 j2@92@01))
    (= j1@92@01 j2@92@01))
  
  :qid |access-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@92@01 Int)) (!
  (=>
    (and
      (>= j@92@01 0)
      (and (< j@92@01 (len<Int> a@60@01)) (= (mod j@92@01 2) 0)))
    (and (= (inv@93@01 a@60@01 j@92@01) j@92@01) (img@94@01 a@60@01 j@92@01)))
  :pattern ((inv@93@01 a@60@01 j@92@01))
  :pattern ((img@94@01 a@60@01 j@92@01))
  :qid |access-invOfFct|)))
(assert (forall ((a IArray) (i Int)) (!
  (=>
    (and
      (img@94@01 a i)
      (and
        (>= (inv@93@01 a i) 0)
        (and
          (< (inv@93@01 a i) (len<Int> a@60@01))
          (= (mod (inv@93@01 a i) 2) 0))))
    (and (= a@60@01 a) (= (inv@93@01 a i) i)))
  :pattern ((inv@93@01 a i))
  :qid |access-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@95@01 ((a IArray) (i Int)) $Perm
  (ite
    (and
      (and
        (>= (inv@93@01 a i) 0)
        (and
          (< (inv@93@01 a i) (len<Int> a@60@01))
          (= (mod (inv@93@01 a i) 2) 0)))
      (img@94@01 a i)
      (and (= a a@60@01) (= i (inv@93@01 a i))))
    ($Perm.min
      (ite
        (and
          (img@91@01 a i)
          (and
            (>= (inv@90@01 a i) 0)
            (and
              (< (inv@90@01 a i) (len<Int> a@60@01))
              (= (mod (inv@90@01 a i) 2) 0))))
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
          (img@91@01 a i)
          (and
            (>= (inv@90@01 a i) 0)
            (and
              (< (inv@90@01 a i) (len<Int> a@60@01))
              (= (mod (inv@90@01 a i) 2) 0))))
        $Perm.Write
        $Perm.No)
      (pTaken@95@01 a i))
    $Perm.No)
  
  :qid |quant-u-54|))))
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
        (>= (inv@93@01 a i) 0)
        (and
          (< (inv@93@01 a i) (len<Int> a@60@01))
          (= (mod (inv@93@01 a i) 2) 0)))
      (img@94@01 a i)
      (and (= a a@60@01) (= i (inv@93@01 a i))))
    (= (- $Perm.Write (pTaken@95@01 a i)) $Perm.No))
  
  :qid |quant-u-55|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@96@01 $PSF<access>)
(declare-const s@97@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@97@01 $Snap)) (!
  (and
    (=>
      (Set_in s@97@01 ($PSF.domain_access (as sm@96@01  $PSF<access>)))
      (and
        (and
          (>=
            (inv@93@01 ($SortWrappers.$SnapToIArray ($Snap.first s@97@01)) ($SortWrappers.$SnapToInt ($Snap.second s@97@01)))
            0)
          (and
            (<
              (inv@93@01 ($SortWrappers.$SnapToIArray ($Snap.first s@97@01)) ($SortWrappers.$SnapToInt ($Snap.second s@97@01)))
              (len<Int> a@60@01))
            (=
              (mod
                (inv@93@01 ($SortWrappers.$SnapToIArray ($Snap.first s@97@01)) ($SortWrappers.$SnapToInt ($Snap.second s@97@01)))
                2)
              0)))
        (img@94@01 ($SortWrappers.$SnapToIArray ($Snap.first s@97@01)) ($SortWrappers.$SnapToInt ($Snap.second s@97@01)))))
    (=>
      (and
        (and
          (>=
            (inv@93@01 ($SortWrappers.$SnapToIArray ($Snap.first s@97@01)) ($SortWrappers.$SnapToInt ($Snap.second s@97@01)))
            0)
          (and
            (<
              (inv@93@01 ($SortWrappers.$SnapToIArray ($Snap.first s@97@01)) ($SortWrappers.$SnapToInt ($Snap.second s@97@01)))
              (len<Int> a@60@01))
            (=
              (mod
                (inv@93@01 ($SortWrappers.$SnapToIArray ($Snap.first s@97@01)) ($SortWrappers.$SnapToInt ($Snap.second s@97@01)))
                2)
              0)))
        (img@94@01 ($SortWrappers.$SnapToIArray ($Snap.first s@97@01)) ($SortWrappers.$SnapToInt ($Snap.second s@97@01))))
      (Set_in s@97@01 ($PSF.domain_access (as sm@96@01  $PSF<access>)))))
  :pattern ((Set_in s@97@01 ($PSF.domain_access (as sm@96@01  $PSF<access>))))
  :qid |qp.psmDomDef16|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@97@01 $Snap)) (!
  (=>
    (and
      (and
        (and
          (>=
            (inv@93@01 ($SortWrappers.$SnapToIArray ($Snap.first s@97@01)) ($SortWrappers.$SnapToInt ($Snap.second s@97@01)))
            0)
          (and
            (<
              (inv@93@01 ($SortWrappers.$SnapToIArray ($Snap.first s@97@01)) ($SortWrappers.$SnapToInt ($Snap.second s@97@01)))
              (len<Int> a@60@01))
            (=
              (mod
                (inv@93@01 ($SortWrappers.$SnapToIArray ($Snap.first s@97@01)) ($SortWrappers.$SnapToInt ($Snap.second s@97@01)))
                2)
              0)))
        (img@94@01 ($SortWrappers.$SnapToIArray ($Snap.first s@97@01)) ($SortWrappers.$SnapToInt ($Snap.second s@97@01))))
      (and
        (img@91@01 ($SortWrappers.$SnapToIArray ($Snap.first s@97@01)) ($SortWrappers.$SnapToInt ($Snap.second s@97@01)))
        (and
          (>=
            (inv@90@01 ($SortWrappers.$SnapToIArray ($Snap.first s@97@01)) ($SortWrappers.$SnapToInt ($Snap.second s@97@01)))
            0)
          (and
            (<
              (inv@90@01 ($SortWrappers.$SnapToIArray ($Snap.first s@97@01)) ($SortWrappers.$SnapToInt ($Snap.second s@97@01)))
              (len<Int> a@60@01))
            (=
              (mod
                (inv@90@01 ($SortWrappers.$SnapToIArray ($Snap.first s@97@01)) ($SortWrappers.$SnapToInt ($Snap.second s@97@01)))
                2)
              0)))))
    (and
      (not (= s@97@01 $Snap.unit))
      (=
        ($PSF.lookup_access (as sm@96@01  $PSF<access>) s@97@01)
        ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.second ($Snap.second ($Snap.second $t@88@01)))) s@97@01))))
  :pattern (($PSF.lookup_access (as sm@96@01  $PSF<access>) s@97@01))
  :pattern (($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.second ($Snap.second ($Snap.second $t@88@01)))) s@97@01))
  :qid |qp.psmValDef15|)))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 27 | !(i@61@01 + 2 < len[Int](a@60@01))]
(assert (not (< (+ i@61@01 2) (len<Int> a@60@01))))
(pop) ; 5
; [eval] !(i + 2 < len(a))
; [eval] i + 2 < len(a)
; [eval] i + 2
; [eval] len(a)
(push) ; 5
(set-option :timeout 10)
(assert (not (< (+ i@61@01 2) (len<Int> a@60@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< (+ i@61@01 2) (len<Int> a@60@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 34 | !(i@61@01 + 2 < len[Int](a@60@01)) | live]
; [else-branch: 34 | i@61@01 + 2 < len[Int](a@60@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 34 | !(i@61@01 + 2 < len[Int](a@60@01))]
(assert (not (< (+ i@61@01 2) (len<Int> a@60@01))))
; [eval] i >= 0
; [eval] i < len(a)
; [eval] len(a)
; [eval] len(a) % 2 == old(len(a) % 2)
; [eval] len(a) % 2
; [eval] len(a)
; [eval] old(len(a) % 2)
; [eval] len(a) % 2
; [eval] len(a)
(declare-const j@98@01 Int)
(push) ; 6
; [eval] j >= 0 && (j < len(a) && j % 2 == 0)
; [eval] j >= 0
(push) ; 7
; [then-branch: 35 | !(j@98@01 >= 0) | live]
; [else-branch: 35 | j@98@01 >= 0 | live]
(push) ; 8
; [then-branch: 35 | !(j@98@01 >= 0)]
(assert (not (>= j@98@01 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 35 | j@98@01 >= 0]
(assert (>= j@98@01 0))
; [eval] j < len(a)
; [eval] len(a)
(push) ; 9
; [then-branch: 36 | !(j@98@01 < len[Int](a@60@01)) | live]
; [else-branch: 36 | j@98@01 < len[Int](a@60@01) | live]
(push) ; 10
; [then-branch: 36 | !(j@98@01 < len[Int](a@60@01))]
(assert (not (< j@98@01 (len<Int> a@60@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 36 | j@98@01 < len[Int](a@60@01)]
(assert (< j@98@01 (len<Int> a@60@01)))
; [eval] j % 2 == 0
; [eval] j % 2
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< j@98@01 (len<Int> a@60@01)) (not (< j@98@01 (len<Int> a@60@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@98@01 0)
  (and
    (>= j@98@01 0)
    (or (< j@98@01 (len<Int> a@60@01)) (not (< j@98@01 (len<Int> a@60@01)))))))
(assert (or (>= j@98@01 0) (not (>= j@98@01 0))))
(assert (and (>= j@98@01 0) (and (< j@98@01 (len<Int> a@60@01)) (= (mod j@98@01 2) 0))))
(pop) ; 6
(declare-fun inv@99@01 (IArray Int) Int)
(declare-fun img@100@01 (IArray Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@98@01 Int)) (!
  (=>
    (and
      (>= j@98@01 0)
      (and (< j@98@01 (len<Int> a@60@01)) (= (mod j@98@01 2) 0)))
    (and
      (=>
        (>= j@98@01 0)
        (and
          (>= j@98@01 0)
          (or
            (< j@98@01 (len<Int> a@60@01))
            (not (< j@98@01 (len<Int> a@60@01))))))
      (or (>= j@98@01 0) (not (>= j@98@01 0)))))
  :pattern ((inv@99@01 a@60@01 j@98@01))
  :pattern ((img@100@01 a@60@01 j@98@01))
  :qid |access-aux|)))
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((j1@98@01 Int) (j2@98@01 Int)) (!
  (=>
    (and
      (and
        (>= j1@98@01 0)
        (and (< j1@98@01 (len<Int> a@60@01)) (= (mod j1@98@01 2) 0)))
      (and
        (>= j2@98@01 0)
        (and (< j2@98@01 (len<Int> a@60@01)) (= (mod j2@98@01 2) 0)))
      (= j1@98@01 j2@98@01))
    (= j1@98@01 j2@98@01))
  
  :qid |access-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@98@01 Int)) (!
  (=>
    (and
      (>= j@98@01 0)
      (and (< j@98@01 (len<Int> a@60@01)) (= (mod j@98@01 2) 0)))
    (and (= (inv@99@01 a@60@01 j@98@01) j@98@01) (img@100@01 a@60@01 j@98@01)))
  :pattern ((inv@99@01 a@60@01 j@98@01))
  :pattern ((img@100@01 a@60@01 j@98@01))
  :qid |access-invOfFct|)))
(assert (forall ((a IArray) (i Int)) (!
  (=>
    (and
      (img@100@01 a i)
      (and
        (>= (inv@99@01 a i) 0)
        (and
          (< (inv@99@01 a i) (len<Int> a@60@01))
          (= (mod (inv@99@01 a i) 2) 0))))
    (and (= a@60@01 a) (= (inv@99@01 a i) i)))
  :pattern ((inv@99@01 a i))
  :qid |access-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@101@01 ((a IArray) (i Int)) $Perm
  (ite
    (and
      (and
        (>= (inv@99@01 a i) 0)
        (and
          (< (inv@99@01 a i) (len<Int> a@60@01))
          (= (mod (inv@99@01 a i) 2) 0)))
      (img@100@01 a i)
      (and (= a a@60@01) (= i (inv@99@01 a i))))
    ($Perm.min
      (ite
        (and
          (img@66@01 a i)
          (and
            (>= (inv@65@01 a i) 0)
            (and
              (< (inv@65@01 a i) (len<Int> a@60@01))
              (= (mod (inv@65@01 a i) 2) 0))))
        (- $Perm.Write (pTaken@71@01 a i))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@102@01 ((a IArray) (i Int)) $Perm
  (ite
    (and
      (and
        (>= (inv@99@01 a i) 0)
        (and
          (< (inv@99@01 a i) (len<Int> a@60@01))
          (= (mod (inv@99@01 a i) 2) 0)))
      (img@100@01 a i)
      (and (= a a@60@01) (= i (inv@99@01 a i))))
    ($Perm.min
      (ite (and (= a a@60@01) (= i i@61@01)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@101@01 a i)))
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
        (- $Perm.Write (pTaken@71@01 a i))
        $Perm.No)
      (pTaken@101@01 a i))
    $Perm.No)
  
  :qid |quant-u-58|))))
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
        (>= (inv@99@01 a i) 0)
        (and
          (< (inv@99@01 a i) (len<Int> a@60@01))
          (= (mod (inv@99@01 a i) 2) 0)))
      (img@100@01 a i)
      (and (= a a@60@01) (= i (inv@99@01 a i))))
    (= (- $Perm.Write (pTaken@101@01 a i)) $Perm.No))
  
  :qid |quant-u-59|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@102@01 a@60@01 i@61@01)) $Perm.No)))
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
        (>= (inv@99@01 a i) 0)
        (and
          (< (inv@99@01 a i) (len<Int> a@60@01))
          (= (mod (inv@99@01 a i) 2) 0)))
      (img@100@01 a i)
      (and (= a a@60@01) (= i (inv@99@01 a i))))
    (= (- (- $Perm.Write (pTaken@101@01 a i)) (pTaken@102@01 a i)) $Perm.No))
  
  :qid |quant-u-61|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@103@01 $PSF<access>)
(declare-const s@104@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@104@01 $Snap)) (!
  (and
    (=>
      (Set_in s@104@01 ($PSF.domain_access (as sm@103@01  $PSF<access>)))
      (and
        (and
          (>=
            (inv@99@01 ($SortWrappers.$SnapToIArray ($Snap.first s@104@01)) ($SortWrappers.$SnapToInt ($Snap.second s@104@01)))
            0)
          (and
            (<
              (inv@99@01 ($SortWrappers.$SnapToIArray ($Snap.first s@104@01)) ($SortWrappers.$SnapToInt ($Snap.second s@104@01)))
              (len<Int> a@60@01))
            (=
              (mod
                (inv@99@01 ($SortWrappers.$SnapToIArray ($Snap.first s@104@01)) ($SortWrappers.$SnapToInt ($Snap.second s@104@01)))
                2)
              0)))
        (img@100@01 ($SortWrappers.$SnapToIArray ($Snap.first s@104@01)) ($SortWrappers.$SnapToInt ($Snap.second s@104@01)))))
    (=>
      (and
        (and
          (>=
            (inv@99@01 ($SortWrappers.$SnapToIArray ($Snap.first s@104@01)) ($SortWrappers.$SnapToInt ($Snap.second s@104@01)))
            0)
          (and
            (<
              (inv@99@01 ($SortWrappers.$SnapToIArray ($Snap.first s@104@01)) ($SortWrappers.$SnapToInt ($Snap.second s@104@01)))
              (len<Int> a@60@01))
            (=
              (mod
                (inv@99@01 ($SortWrappers.$SnapToIArray ($Snap.first s@104@01)) ($SortWrappers.$SnapToInt ($Snap.second s@104@01)))
                2)
              0)))
        (img@100@01 ($SortWrappers.$SnapToIArray ($Snap.first s@104@01)) ($SortWrappers.$SnapToInt ($Snap.second s@104@01))))
      (Set_in s@104@01 ($PSF.domain_access (as sm@103@01  $PSF<access>)))))
  :pattern ((Set_in s@104@01 ($PSF.domain_access (as sm@103@01  $PSF<access>))))
  :qid |qp.psmDomDef19|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@104@01 $Snap)) (!
  (=>
    (and
      (and
        (and
          (>=
            (inv@99@01 ($SortWrappers.$SnapToIArray ($Snap.first s@104@01)) ($SortWrappers.$SnapToInt ($Snap.second s@104@01)))
            0)
          (and
            (<
              (inv@99@01 ($SortWrappers.$SnapToIArray ($Snap.first s@104@01)) ($SortWrappers.$SnapToInt ($Snap.second s@104@01)))
              (len<Int> a@60@01))
            (=
              (mod
                (inv@99@01 ($SortWrappers.$SnapToIArray ($Snap.first s@104@01)) ($SortWrappers.$SnapToInt ($Snap.second s@104@01)))
                2)
              0)))
        (img@100@01 ($SortWrappers.$SnapToIArray ($Snap.first s@104@01)) ($SortWrappers.$SnapToInt ($Snap.second s@104@01))))
      (and
        (= ($SortWrappers.$SnapToIArray ($Snap.first s@104@01)) a@60@01)
        (= ($SortWrappers.$SnapToInt ($Snap.second s@104@01)) i@61@01)))
    (and
      (not (= s@104@01 $Snap.unit))
      (=
        ($PSF.lookup_access (as sm@103@01  $PSF<access>) s@104@01)
        ($PSF.lookup_access (as sm@74@01  $PSF<access>) s@104@01))))
  :pattern (($PSF.lookup_access (as sm@103@01  $PSF<access>) s@104@01))
  :pattern (($PSF.lookup_access (as sm@74@01  $PSF<access>) s@104@01))
  :qid |qp.psmValDef17|)))
(assert (forall ((s@104@01 $Snap)) (!
  (=>
    (and
      (and
        (and
          (>=
            (inv@99@01 ($SortWrappers.$SnapToIArray ($Snap.first s@104@01)) ($SortWrappers.$SnapToInt ($Snap.second s@104@01)))
            0)
          (and
            (<
              (inv@99@01 ($SortWrappers.$SnapToIArray ($Snap.first s@104@01)) ($SortWrappers.$SnapToInt ($Snap.second s@104@01)))
              (len<Int> a@60@01))
            (=
              (mod
                (inv@99@01 ($SortWrappers.$SnapToIArray ($Snap.first s@104@01)) ($SortWrappers.$SnapToInt ($Snap.second s@104@01)))
                2)
              0)))
        (img@100@01 ($SortWrappers.$SnapToIArray ($Snap.first s@104@01)) ($SortWrappers.$SnapToInt ($Snap.second s@104@01))))
      (ite
        (and
          (img@66@01 ($SortWrappers.$SnapToIArray ($Snap.first s@104@01)) ($SortWrappers.$SnapToInt ($Snap.second s@104@01)))
          (and
            (>=
              (inv@65@01 ($SortWrappers.$SnapToIArray ($Snap.first s@104@01)) ($SortWrappers.$SnapToInt ($Snap.second s@104@01)))
              0)
            (and
              (<
                (inv@65@01 ($SortWrappers.$SnapToIArray ($Snap.first s@104@01)) ($SortWrappers.$SnapToInt ($Snap.second s@104@01)))
                (len<Int> a@60@01))
              (=
                (mod
                  (inv@65@01 ($SortWrappers.$SnapToIArray ($Snap.first s@104@01)) ($SortWrappers.$SnapToInt ($Snap.second s@104@01)))
                  2)
                0))))
        (<
          $Perm.No
          (-
            $Perm.Write
            (pTaken@71@01 ($SortWrappers.$SnapToIArray ($Snap.first s@104@01)) ($SortWrappers.$SnapToInt ($Snap.second s@104@01)))))
        false))
    (and
      (not (= s@104@01 $Snap.unit))
      (=
        ($PSF.lookup_access (as sm@103@01  $PSF<access>) s@104@01)
        ($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@63@01))))) s@104@01))))
  :pattern (($PSF.lookup_access (as sm@103@01  $PSF<access>) s@104@01))
  :pattern (($PSF.lookup_access ($SortWrappers.$SnapTo$PSF<access> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@63@01))))) s@104@01))
  :qid |qp.psmValDef18|)))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 34 | i@61@01 + 2 < len[Int](a@60@01)]
(assert (< (+ i@61@01 2) (len<Int> a@60@01)))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- setVal2 ----------
(declare-const a@105@01 IArray)
(declare-const i@106@01 Int)
(declare-const newVal@107@01 Int)
(declare-const a@108@01 IArray)
(declare-const i@109@01 Int)
(declare-const newVal@110@01 Int)
(push) ; 1
(declare-const $t@111@01 $Snap)
(assert (= $t@111@01 ($Snap.combine ($Snap.first $t@111@01) ($Snap.second $t@111@01))))
(assert (= ($Snap.first $t@111@01) $Snap.unit))
; [eval] i >= 0
(assert (>= i@109@01 0))
(assert (=
  ($Snap.second $t@111@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@111@01))
    ($Snap.second ($Snap.second $t@111@01)))))
(assert (= ($Snap.first ($Snap.second $t@111@01)) $Snap.unit))
; [eval] i < len(a)
; [eval] len(a)
(assert (< i@109@01 (len<Int> a@108@01)))
(declare-const j@112@01 Int)
(push) ; 2
; [eval] j >= 0 && j < len(a)
; [eval] j >= 0
(push) ; 3
; [then-branch: 37 | !(j@112@01 >= 0) | live]
; [else-branch: 37 | j@112@01 >= 0 | live]
(push) ; 4
; [then-branch: 37 | !(j@112@01 >= 0)]
(assert (not (>= j@112@01 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 37 | j@112@01 >= 0]
(assert (>= j@112@01 0))
; [eval] j < len(a)
; [eval] len(a)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (>= j@112@01 0) (not (>= j@112@01 0))))
(assert (and (>= j@112@01 0) (< j@112@01 (len<Int> a@108@01))))
; [eval] loc(a, j)
(pop) ; 2
(declare-fun inv@113@01 ($Ref) Int)
(declare-fun img@114@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@112@01 Int)) (!
  (=>
    (and (>= j@112@01 0) (< j@112@01 (len<Int> a@108@01)))
    (or (>= j@112@01 0) (not (>= j@112@01 0))))
  :pattern ((loc<Ref> a@108@01 j@112@01))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((j1@112@01 Int) (j2@112@01 Int)) (!
  (=>
    (and
      (and (>= j1@112@01 0) (< j1@112@01 (len<Int> a@108@01)))
      (and (>= j2@112@01 0) (< j2@112@01 (len<Int> a@108@01)))
      (= (loc<Ref> a@108@01 j1@112@01) (loc<Ref> a@108@01 j2@112@01)))
    (= j1@112@01 j2@112@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@112@01 Int)) (!
  (=>
    (and (>= j@112@01 0) (< j@112@01 (len<Int> a@108@01)))
    (and
      (= (inv@113@01 (loc<Ref> a@108@01 j@112@01)) j@112@01)
      (img@114@01 (loc<Ref> a@108@01 j@112@01))))
  :pattern ((loc<Ref> a@108@01 j@112@01))
  :qid |quant-u-63|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@114@01 r)
      (and (>= (inv@113@01 r) 0) (< (inv@113@01 r) (len<Int> a@108@01))))
    (= (loc<Ref> a@108@01 (inv@113@01 r)) r))
  :pattern ((inv@113@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@112@01 Int)) (!
  (=>
    (and (>= j@112@01 0) (< j@112@01 (len<Int> a@108@01)))
    (not (= (loc<Ref> a@108@01 j@112@01) $Ref.null)))
  :pattern ((loc<Ref> a@108@01 j@112@01))
  :qid |val-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@115@01 $Snap)
(assert (= $t@115@01 ($Snap.combine ($Snap.first $t@115@01) ($Snap.second $t@115@01))))
(assert (= ($Snap.first $t@115@01) $Snap.unit))
; [eval] i >= 0
(assert (=
  ($Snap.second $t@115@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@115@01))
    ($Snap.second ($Snap.second $t@115@01)))))
(assert (= ($Snap.first ($Snap.second $t@115@01)) $Snap.unit))
; [eval] i < len(a)
; [eval] len(a)
(assert (=
  ($Snap.second ($Snap.second $t@115@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@115@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@115@01))))))
(declare-const j@116@01 Int)
(push) ; 3
; [eval] j >= 0 && j < len(a)
; [eval] j >= 0
(push) ; 4
; [then-branch: 38 | !(j@116@01 >= 0) | live]
; [else-branch: 38 | j@116@01 >= 0 | live]
(push) ; 5
; [then-branch: 38 | !(j@116@01 >= 0)]
(assert (not (>= j@116@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 38 | j@116@01 >= 0]
(assert (>= j@116@01 0))
; [eval] j < len(a)
; [eval] len(a)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (>= j@116@01 0) (not (>= j@116@01 0))))
(assert (and (>= j@116@01 0) (< j@116@01 (len<Int> a@108@01))))
; [eval] loc(a, j)
(pop) ; 3
(declare-fun inv@117@01 ($Ref) Int)
(declare-fun img@118@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@116@01 Int)) (!
  (=>
    (and (>= j@116@01 0) (< j@116@01 (len<Int> a@108@01)))
    (or (>= j@116@01 0) (not (>= j@116@01 0))))
  :pattern ((loc<Ref> a@108@01 j@116@01))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@116@01 Int) (j2@116@01 Int)) (!
  (=>
    (and
      (and (>= j1@116@01 0) (< j1@116@01 (len<Int> a@108@01)))
      (and (>= j2@116@01 0) (< j2@116@01 (len<Int> a@108@01)))
      (= (loc<Ref> a@108@01 j1@116@01) (loc<Ref> a@108@01 j2@116@01)))
    (= j1@116@01 j2@116@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@116@01 Int)) (!
  (=>
    (and (>= j@116@01 0) (< j@116@01 (len<Int> a@108@01)))
    (and
      (= (inv@117@01 (loc<Ref> a@108@01 j@116@01)) j@116@01)
      (img@118@01 (loc<Ref> a@108@01 j@116@01))))
  :pattern ((loc<Ref> a@108@01 j@116@01))
  :qid |quant-u-65|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@118@01 r)
      (and (>= (inv@117@01 r) 0) (< (inv@117@01 r) (len<Int> a@108@01))))
    (= (loc<Ref> a@108@01 (inv@117@01 r)) r))
  :pattern ((inv@117@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@116@01 Int)) (!
  (=>
    (and (>= j@116@01 0) (< j@116@01 (len<Int> a@108@01)))
    (not (= (loc<Ref> a@108@01 j@116@01) $Ref.null)))
  :pattern ((loc<Ref> a@108@01 j@116@01))
  :qid |val-permImpliesNonNull|)))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@115@01))) $Snap.unit))
; [eval] (forall j: Int :: { old(loc(a, j)) } j >= 0 && (j < len(a) && j < i) ==> old(loc(a, j).val) == loc(a, j).val)
(declare-const j@119@01 Int)
(push) ; 3
; [eval] j >= 0 && (j < len(a) && j < i) ==> old(loc(a, j).val) == loc(a, j).val
; [eval] j >= 0 && (j < len(a) && j < i)
; [eval] j >= 0
(push) ; 4
; [then-branch: 39 | !(j@119@01 >= 0) | live]
; [else-branch: 39 | j@119@01 >= 0 | live]
(push) ; 5
; [then-branch: 39 | !(j@119@01 >= 0)]
(assert (not (>= j@119@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 39 | j@119@01 >= 0]
(assert (>= j@119@01 0))
; [eval] j < len(a)
; [eval] len(a)
(push) ; 6
; [then-branch: 40 | !(j@119@01 < len[Int](a@108@01)) | live]
; [else-branch: 40 | j@119@01 < len[Int](a@108@01) | live]
(push) ; 7
; [then-branch: 40 | !(j@119@01 < len[Int](a@108@01))]
(assert (not (< j@119@01 (len<Int> a@108@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 40 | j@119@01 < len[Int](a@108@01)]
(assert (< j@119@01 (len<Int> a@108@01)))
; [eval] j < i
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (< j@119@01 (len<Int> a@108@01)) (not (< j@119@01 (len<Int> a@108@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@119@01 0)
  (and
    (>= j@119@01 0)
    (or (< j@119@01 (len<Int> a@108@01)) (not (< j@119@01 (len<Int> a@108@01)))))))
(assert (or (>= j@119@01 0) (not (>= j@119@01 0))))
(push) ; 4
; [then-branch: 41 | j@119@01 >= 0 && j@119@01 < len[Int](a@108@01) && j@119@01 < i@109@01 | live]
; [else-branch: 41 | !(j@119@01 >= 0 && j@119@01 < len[Int](a@108@01) && j@119@01 < i@109@01) | live]
(push) ; 5
; [then-branch: 41 | j@119@01 >= 0 && j@119@01 < len[Int](a@108@01) && j@119@01 < i@109@01]
(assert (and
  (>= j@119@01 0)
  (and (< j@119@01 (len<Int> a@108@01)) (< j@119@01 i@109@01))))
; [eval] old(loc(a, j).val) == loc(a, j).val
; [eval] old(loc(a, j).val)
; [eval] loc(a, j)
(push) ; 6
(assert (not (and
  (img@114@01 (loc<Ref> a@108@01 j@119@01))
  (and
    (>= (inv@113@01 (loc<Ref> a@108@01 j@119@01)) 0)
    (< (inv@113@01 (loc<Ref> a@108@01 j@119@01)) (len<Int> a@108@01))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] loc(a, j)
(push) ; 6
(assert (not (and
  (img@118@01 (loc<Ref> a@108@01 j@119@01))
  (and
    (>= (inv@117@01 (loc<Ref> a@108@01 j@119@01)) 0)
    (< (inv@117@01 (loc<Ref> a@108@01 j@119@01)) (len<Int> a@108@01))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 41 | !(j@119@01 >= 0 && j@119@01 < len[Int](a@108@01) && j@119@01 < i@109@01)]
(assert (not
  (and
    (>= j@119@01 0)
    (and (< j@119@01 (len<Int> a@108@01)) (< j@119@01 i@109@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= j@119@01 0)
    (and (< j@119@01 (len<Int> a@108@01)) (< j@119@01 i@109@01)))
  (and (>= j@119@01 0) (< j@119@01 (len<Int> a@108@01)) (< j@119@01 i@109@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= j@119@01 0)
      (and (< j@119@01 (len<Int> a@108@01)) (< j@119@01 i@109@01))))
  (and
    (>= j@119@01 0)
    (and (< j@119@01 (len<Int> a@108@01)) (< j@119@01 i@109@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@119@01 Int)) (!
  (and
    (=>
      (>= j@119@01 0)
      (and
        (>= j@119@01 0)
        (or
          (< j@119@01 (len<Int> a@108@01))
          (not (< j@119@01 (len<Int> a@108@01))))))
    (or (>= j@119@01 0) (not (>= j@119@01 0)))
    (=>
      (and
        (>= j@119@01 0)
        (and (< j@119@01 (len<Int> a@108@01)) (< j@119@01 i@109@01)))
      (and
        (>= j@119@01 0)
        (< j@119@01 (len<Int> a@108@01))
        (< j@119@01 i@109@01)))
    (or
      (not
        (and
          (>= j@119@01 0)
          (and (< j@119@01 (len<Int> a@108@01)) (< j@119@01 i@109@01))))
      (and
        (>= j@119@01 0)
        (and (< j@119@01 (len<Int> a@108@01)) (< j@119@01 i@109@01)))))
  :pattern ((loc<Ref> a@108@01 j@119@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/two_blocks_array.vpr@66@9@66@94-aux|)))
(assert (forall ((j@119@01 Int)) (!
  (=>
    (and
      (>= j@119@01 0)
      (and (< j@119@01 (len<Int> a@108@01)) (< j@119@01 i@109@01)))
    (=
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second $t@111@01))) (loc<Ref> a@108@01 j@119@01))
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second $t@115@01)))) (loc<Ref> a@108@01 j@119@01))))
  :pattern ((loc<Ref> a@108@01 j@119@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/two_blocks_array.vpr@66@9@66@94|)))
(pop) ; 2
(push) ; 2
; [exec]
; var k: Int
(declare-const k@120@01 Int)
; [exec]
; inhale k >= 0
(declare-const $t@121@01 $Snap)
(assert (= $t@121@01 $Snap.unit))
; [eval] k >= 0
(assert (>= k@120@01 0))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale k < len(a)
(declare-const $t@122@01 $Snap)
(assert (= $t@122@01 $Snap.unit))
; [eval] k < len(a)
; [eval] len(a)
(assert (< k@120@01 (len<Int> a@108@01)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale k % 2 == 0
(declare-const $t@123@01 $Snap)
(assert (= $t@123@01 $Snap.unit))
; [eval] k % 2 == 0
; [eval] k % 2
(assert (= (mod k@120@01 2) 0))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale k != i
(declare-const $t@124@01 $Snap)
(assert (= $t@124@01 $Snap.unit))
; [eval] k != i
(assert (not (= k@120@01 i@109@01)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; loc(a, i).val := newVal
; [eval] loc(a, i)
; Precomputing data for removing quantified permissions
(define-fun pTaken@125@01 ((r $Ref)) $Perm
  (ite
    (= r (loc<Ref> a@108@01 i@109@01))
    ($Perm.min
      (ite
        (and
          (img@114@01 r)
          (and (>= (inv@113@01 r) 0) (< (inv@113@01 r) (len<Int> a@108@01))))
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
          (img@114@01 r)
          (and (>= (inv@113@01 r) 0) (< (inv@113@01 r) (len<Int> a@108@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@125@01 r))
    $Perm.No)
  
  :qid |quant-u-67|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@125@01 r) $Perm.No)
  
  :qid |quant-u-68|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@108@01 i@109@01))
    (= (- $Perm.Write (pTaken@125@01 r)) $Perm.No))
  
  :qid |quant-u-69|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@126@01 $FVF<val>)
; Definitional axioms for singleton-FVF's value
(assert (=
  ($FVF.lookup_val (as sm@126@01  $FVF<val>) (loc<Ref> a@108@01 i@109@01))
  newVal@110@01))
; [eval] i + 2 < len(a)
; [eval] i + 2
; [eval] len(a)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (< (+ i@109@01 2) (len<Int> a@108@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< (+ i@109@01 2) (len<Int> a@108@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 42 | i@109@01 + 2 < len[Int](a@108@01) | live]
; [else-branch: 42 | !(i@109@01 + 2 < len[Int](a@108@01)) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 42 | i@109@01 + 2 < len[Int](a@108@01)]
(assert (< (+ i@109@01 2) (len<Int> a@108@01)))
; [exec]
; setVal2(a, i + 1, newVal)
; [eval] i + 1
; [eval] i >= 0
(push) ; 4
(assert (not (>= (+ i@109@01 1) 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (>= (+ i@109@01 1) 0))
; [eval] i < len(a)
; [eval] len(a)
(push) ; 4
(assert (not (< (+ i@109@01 1) (len<Int> a@108@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< (+ i@109@01 1) (len<Int> a@108@01)))
(declare-const j@127@01 Int)
(push) ; 4
; [eval] j >= 0 && j < len(a)
; [eval] j >= 0
(push) ; 5
; [then-branch: 43 | !(j@127@01 >= 0) | live]
; [else-branch: 43 | j@127@01 >= 0 | live]
(push) ; 6
; [then-branch: 43 | !(j@127@01 >= 0)]
(assert (not (>= j@127@01 0)))
(pop) ; 6
(push) ; 6
; [else-branch: 43 | j@127@01 >= 0]
(assert (>= j@127@01 0))
; [eval] j < len(a)
; [eval] len(a)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (>= j@127@01 0) (not (>= j@127@01 0))))
(assert (and (>= j@127@01 0) (< j@127@01 (len<Int> a@108@01))))
; [eval] loc(a, j)
(pop) ; 4
(declare-fun inv@128@01 ($Ref) Int)
(declare-fun img@129@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@127@01 Int)) (!
  (=>
    (and (>= j@127@01 0) (< j@127@01 (len<Int> a@108@01)))
    (or (>= j@127@01 0) (not (>= j@127@01 0))))
  :pattern ((loc<Ref> a@108@01 j@127@01))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((j1@127@01 Int) (j2@127@01 Int)) (!
  (=>
    (and
      (and (>= j1@127@01 0) (< j1@127@01 (len<Int> a@108@01)))
      (and (>= j2@127@01 0) (< j2@127@01 (len<Int> a@108@01)))
      (= (loc<Ref> a@108@01 j1@127@01) (loc<Ref> a@108@01 j2@127@01)))
    (= j1@127@01 j2@127@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@127@01 Int)) (!
  (=>
    (and (>= j@127@01 0) (< j@127@01 (len<Int> a@108@01)))
    (and
      (= (inv@128@01 (loc<Ref> a@108@01 j@127@01)) j@127@01)
      (img@129@01 (loc<Ref> a@108@01 j@127@01))))
  :pattern ((loc<Ref> a@108@01 j@127@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@129@01 r)
      (and (>= (inv@128@01 r) 0) (< (inv@128@01 r) (len<Int> a@108@01))))
    (= (loc<Ref> a@108@01 (inv@128@01 r)) r))
  :pattern ((inv@128@01 r))
  :qid |val-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@130@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (>= (inv@128@01 r) 0) (< (inv@128@01 r) (len<Int> a@108@01)))
      (img@129@01 r)
      (= r (loc<Ref> a@108@01 (inv@128@01 r))))
    ($Perm.min
      (ite
        (and
          (img@114@01 r)
          (and (>= (inv@113@01 r) 0) (< (inv@113@01 r) (len<Int> a@108@01))))
        (- $Perm.Write (pTaken@125@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@131@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (>= (inv@128@01 r) 0) (< (inv@128@01 r) (len<Int> a@108@01)))
      (img@129@01 r)
      (= r (loc<Ref> a@108@01 (inv@128@01 r))))
    ($Perm.min
      (ite (= r (loc<Ref> a@108@01 i@109@01)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@130@01 r)))
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
        (and
          (img@114@01 r)
          (and (>= (inv@113@01 r) 0) (< (inv@113@01 r) (len<Int> a@108@01))))
        (- $Perm.Write (pTaken@125@01 r))
        $Perm.No)
      (pTaken@130@01 r))
    $Perm.No)
  
  :qid |quant-u-72|))))
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
      (and (>= (inv@128@01 r) 0) (< (inv@128@01 r) (len<Int> a@108@01)))
      (img@129@01 r)
      (= r (loc<Ref> a@108@01 (inv@128@01 r))))
    (= (- $Perm.Write (pTaken@130@01 r)) $Perm.No))
  
  :qid |quant-u-73|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (=
  (-
    (ite
      (= (loc<Ref> a@108@01 i@109@01) (loc<Ref> a@108@01 i@109@01))
      $Perm.Write
      $Perm.No)
    (pTaken@131@01 (loc<Ref> a@108@01 i@109@01)))
  $Perm.No)))
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
      (and (>= (inv@128@01 r) 0) (< (inv@128@01 r) (len<Int> a@108@01)))
      (img@129@01 r)
      (= r (loc<Ref> a@108@01 (inv@128@01 r))))
    (= (- (- $Perm.Write (pTaken@130@01 r)) (pTaken@131@01 r)) $Perm.No))
  
  :qid |quant-u-75|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@132@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@108@01 i@109@01))
    (=
      ($FVF.lookup_val (as sm@132@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@126@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@132@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@126@01  $FVF<val>) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@114@01 r)
        (and (>= (inv@113@01 r) 0) (< (inv@113@01 r) (len<Int> a@108@01))))
      (< $Perm.No (- $Perm.Write (pTaken@125@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@132@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second $t@111@01))) r)))
  :pattern (($FVF.lookup_val (as sm@132@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second $t@111@01))) r))
  :qid |qp.fvfValDef21|)))
(declare-const $t@133@01 $Snap)
(assert (= $t@133@01 ($Snap.combine ($Snap.first $t@133@01) ($Snap.second $t@133@01))))
(assert (= ($Snap.first $t@133@01) $Snap.unit))
; [eval] i >= 0
(assert (=
  ($Snap.second $t@133@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@133@01))
    ($Snap.second ($Snap.second $t@133@01)))))
(assert (= ($Snap.first ($Snap.second $t@133@01)) $Snap.unit))
; [eval] i < len(a)
; [eval] len(a)
(assert (=
  ($Snap.second ($Snap.second $t@133@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@133@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@133@01))))))
(declare-const j@134@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] j >= 0 && j < len(a)
; [eval] j >= 0
(push) ; 5
; [then-branch: 44 | !(j@134@01 >= 0) | live]
; [else-branch: 44 | j@134@01 >= 0 | live]
(push) ; 6
; [then-branch: 44 | !(j@134@01 >= 0)]
(assert (not (>= j@134@01 0)))
(pop) ; 6
(push) ; 6
; [else-branch: 44 | j@134@01 >= 0]
(assert (>= j@134@01 0))
; [eval] j < len(a)
; [eval] len(a)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (>= j@134@01 0) (not (>= j@134@01 0))))
(assert (and (>= j@134@01 0) (< j@134@01 (len<Int> a@108@01))))
; [eval] loc(a, j)
(pop) ; 4
(declare-fun inv@135@01 ($Ref) Int)
(declare-fun img@136@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@134@01 Int)) (!
  (=>
    (and (>= j@134@01 0) (< j@134@01 (len<Int> a@108@01)))
    (or (>= j@134@01 0) (not (>= j@134@01 0))))
  :pattern ((loc<Ref> a@108@01 j@134@01))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((j1@134@01 Int) (j2@134@01 Int)) (!
  (=>
    (and
      (and (>= j1@134@01 0) (< j1@134@01 (len<Int> a@108@01)))
      (and (>= j2@134@01 0) (< j2@134@01 (len<Int> a@108@01)))
      (= (loc<Ref> a@108@01 j1@134@01) (loc<Ref> a@108@01 j2@134@01)))
    (= j1@134@01 j2@134@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@134@01 Int)) (!
  (=>
    (and (>= j@134@01 0) (< j@134@01 (len<Int> a@108@01)))
    (and
      (= (inv@135@01 (loc<Ref> a@108@01 j@134@01)) j@134@01)
      (img@136@01 (loc<Ref> a@108@01 j@134@01))))
  :pattern ((loc<Ref> a@108@01 j@134@01))
  :qid |quant-u-77|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@136@01 r)
      (and (>= (inv@135@01 r) 0) (< (inv@135@01 r) (len<Int> a@108@01))))
    (= (loc<Ref> a@108@01 (inv@135@01 r)) r))
  :pattern ((inv@135@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@134@01 Int)) (!
  (=>
    (and (>= j@134@01 0) (< j@134@01 (len<Int> a@108@01)))
    (not (= (loc<Ref> a@108@01 j@134@01) $Ref.null)))
  :pattern ((loc<Ref> a@108@01 j@134@01))
  :qid |val-permImpliesNonNull|)))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@133@01))) $Snap.unit))
; [eval] (forall j: Int :: { old(loc(a, j)) } j >= 0 && (j < len(a) && j < i) ==> old(loc(a, j).val) == loc(a, j).val)
(declare-const j@137@01 Int)
(push) ; 4
; [eval] j >= 0 && (j < len(a) && j < i) ==> old(loc(a, j).val) == loc(a, j).val
; [eval] j >= 0 && (j < len(a) && j < i)
; [eval] j >= 0
(push) ; 5
; [then-branch: 45 | !(j@137@01 >= 0) | live]
; [else-branch: 45 | j@137@01 >= 0 | live]
(push) ; 6
; [then-branch: 45 | !(j@137@01 >= 0)]
(assert (not (>= j@137@01 0)))
(pop) ; 6
(push) ; 6
; [else-branch: 45 | j@137@01 >= 0]
(assert (>= j@137@01 0))
; [eval] j < len(a)
; [eval] len(a)
(push) ; 7
; [then-branch: 46 | !(j@137@01 < len[Int](a@108@01)) | live]
; [else-branch: 46 | j@137@01 < len[Int](a@108@01) | live]
(push) ; 8
; [then-branch: 46 | !(j@137@01 < len[Int](a@108@01))]
(assert (not (< j@137@01 (len<Int> a@108@01))))
(pop) ; 8
(push) ; 8
; [else-branch: 46 | j@137@01 < len[Int](a@108@01)]
(assert (< j@137@01 (len<Int> a@108@01)))
; [eval] j < i
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or (< j@137@01 (len<Int> a@108@01)) (not (< j@137@01 (len<Int> a@108@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@137@01 0)
  (and
    (>= j@137@01 0)
    (or (< j@137@01 (len<Int> a@108@01)) (not (< j@137@01 (len<Int> a@108@01)))))))
(assert (or (>= j@137@01 0) (not (>= j@137@01 0))))
(push) ; 5
; [then-branch: 47 | j@137@01 >= 0 && j@137@01 < len[Int](a@108@01) && j@137@01 < i@109@01 + 1 | live]
; [else-branch: 47 | !(j@137@01 >= 0 && j@137@01 < len[Int](a@108@01) && j@137@01 < i@109@01 + 1) | live]
(push) ; 6
; [then-branch: 47 | j@137@01 >= 0 && j@137@01 < len[Int](a@108@01) && j@137@01 < i@109@01 + 1]
(assert (and
  (>= j@137@01 0)
  (and (< j@137@01 (len<Int> a@108@01)) (< j@137@01 (+ i@109@01 1)))))
; [eval] old(loc(a, j).val) == loc(a, j).val
; [eval] old(loc(a, j).val)
; [eval] loc(a, j)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (loc<Ref> a@108@01 i@109@01))
      (=
        ($FVF.lookup_val (as sm@132@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@126@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@132@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@126@01  $FVF<val>) r))
    :qid |qp.fvfValDef20|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@114@01 r)
          (and (>= (inv@113@01 r) 0) (< (inv@113@01 r) (len<Int> a@108@01))))
        (< $Perm.No (- $Perm.Write (pTaken@125@01 r)))
        false)
      (=
        ($FVF.lookup_val (as sm@132@01  $FVF<val>) r)
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second $t@111@01))) r)))
    :pattern (($FVF.lookup_val (as sm@132@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second $t@111@01))) r))
    :qid |qp.fvfValDef21|))))
(push) ; 7
(assert (not (<
  $Perm.No
  (+
    (ite
      (= (loc<Ref> a@108@01 j@137@01) (loc<Ref> a@108@01 i@109@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and
        (img@114@01 (loc<Ref> a@108@01 j@137@01))
        (and
          (>= (inv@113@01 (loc<Ref> a@108@01 j@137@01)) 0)
          (< (inv@113@01 (loc<Ref> a@108@01 j@137@01)) (len<Int> a@108@01))))
      (- $Perm.Write (pTaken@125@01 (loc<Ref> a@108@01 j@137@01)))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] loc(a, j)
(push) ; 7
(assert (not (and
  (img@136@01 (loc<Ref> a@108@01 j@137@01))
  (and
    (>= (inv@135@01 (loc<Ref> a@108@01 j@137@01)) 0)
    (< (inv@135@01 (loc<Ref> a@108@01 j@137@01)) (len<Int> a@108@01))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 47 | !(j@137@01 >= 0 && j@137@01 < len[Int](a@108@01) && j@137@01 < i@109@01 + 1)]
(assert (not
  (and
    (>= j@137@01 0)
    (and (< j@137@01 (len<Int> a@108@01)) (< j@137@01 (+ i@109@01 1))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@108@01 i@109@01))
    (=
      ($FVF.lookup_val (as sm@132@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@126@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@132@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@126@01  $FVF<val>) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@114@01 r)
        (and (>= (inv@113@01 r) 0) (< (inv@113@01 r) (len<Int> a@108@01))))
      (< $Perm.No (- $Perm.Write (pTaken@125@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@132@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second $t@111@01))) r)))
  :pattern (($FVF.lookup_val (as sm@132@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second $t@111@01))) r))
  :qid |qp.fvfValDef21|)))
(assert (=>
  (and
    (>= j@137@01 0)
    (and (< j@137@01 (len<Int> a@108@01)) (< j@137@01 (+ i@109@01 1))))
  (and
    (>= j@137@01 0)
    (< j@137@01 (len<Int> a@108@01))
    (< j@137@01 (+ i@109@01 1)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= j@137@01 0)
      (and (< j@137@01 (len<Int> a@108@01)) (< j@137@01 (+ i@109@01 1)))))
  (and
    (>= j@137@01 0)
    (and (< j@137@01 (len<Int> a@108@01)) (< j@137@01 (+ i@109@01 1))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@108@01 i@109@01))
    (=
      ($FVF.lookup_val (as sm@132@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@126@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@132@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@126@01  $FVF<val>) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@114@01 r)
        (and (>= (inv@113@01 r) 0) (< (inv@113@01 r) (len<Int> a@108@01))))
      (< $Perm.No (- $Perm.Write (pTaken@125@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@132@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second $t@111@01))) r)))
  :pattern (($FVF.lookup_val (as sm@132@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second $t@111@01))) r))
  :qid |qp.fvfValDef21|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@137@01 Int)) (!
  (and
    (=>
      (>= j@137@01 0)
      (and
        (>= j@137@01 0)
        (or
          (< j@137@01 (len<Int> a@108@01))
          (not (< j@137@01 (len<Int> a@108@01))))))
    (or (>= j@137@01 0) (not (>= j@137@01 0)))
    (=>
      (and
        (>= j@137@01 0)
        (and (< j@137@01 (len<Int> a@108@01)) (< j@137@01 (+ i@109@01 1))))
      (and
        (>= j@137@01 0)
        (< j@137@01 (len<Int> a@108@01))
        (< j@137@01 (+ i@109@01 1))))
    (or
      (not
        (and
          (>= j@137@01 0)
          (and (< j@137@01 (len<Int> a@108@01)) (< j@137@01 (+ i@109@01 1)))))
      (and
        (>= j@137@01 0)
        (and (< j@137@01 (len<Int> a@108@01)) (< j@137@01 (+ i@109@01 1))))))
  :pattern ((loc<Ref> a@108@01 j@137@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/two_blocks_array.vpr@66@9@66@94-aux|)))
(assert (forall ((j@137@01 Int)) (!
  (=>
    (and
      (>= j@137@01 0)
      (and (< j@137@01 (len<Int> a@108@01)) (< j@137@01 (+ i@109@01 1))))
    (=
      ($FVF.lookup_val (as sm@132@01  $FVF<val>) (loc<Ref> a@108@01 j@137@01))
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second $t@133@01)))) (loc<Ref> a@108@01 j@137@01))))
  :pattern ((loc<Ref> a@108@01 j@137@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/two_blocks_array.vpr@66@9@66@94|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] i >= 0
; [eval] i < len(a)
; [eval] len(a)
(declare-const j@138@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] j >= 0 && j < len(a)
; [eval] j >= 0
(push) ; 5
; [then-branch: 48 | !(j@138@01 >= 0) | live]
; [else-branch: 48 | j@138@01 >= 0 | live]
(push) ; 6
; [then-branch: 48 | !(j@138@01 >= 0)]
(assert (not (>= j@138@01 0)))
(pop) ; 6
(push) ; 6
; [else-branch: 48 | j@138@01 >= 0]
(assert (>= j@138@01 0))
; [eval] j < len(a)
; [eval] len(a)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (>= j@138@01 0) (not (>= j@138@01 0))))
(assert (and (>= j@138@01 0) (< j@138@01 (len<Int> a@108@01))))
; [eval] loc(a, j)
(pop) ; 4
(declare-fun inv@139@01 ($Ref) Int)
(declare-fun img@140@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@138@01 Int)) (!
  (=>
    (and (>= j@138@01 0) (< j@138@01 (len<Int> a@108@01)))
    (or (>= j@138@01 0) (not (>= j@138@01 0))))
  :pattern ((loc<Ref> a@108@01 j@138@01))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((j1@138@01 Int) (j2@138@01 Int)) (!
  (=>
    (and
      (and (>= j1@138@01 0) (< j1@138@01 (len<Int> a@108@01)))
      (and (>= j2@138@01 0) (< j2@138@01 (len<Int> a@108@01)))
      (= (loc<Ref> a@108@01 j1@138@01) (loc<Ref> a@108@01 j2@138@01)))
    (= j1@138@01 j2@138@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@138@01 Int)) (!
  (=>
    (and (>= j@138@01 0) (< j@138@01 (len<Int> a@108@01)))
    (and
      (= (inv@139@01 (loc<Ref> a@108@01 j@138@01)) j@138@01)
      (img@140@01 (loc<Ref> a@108@01 j@138@01))))
  :pattern ((loc<Ref> a@108@01 j@138@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@140@01 r)
      (and (>= (inv@139@01 r) 0) (< (inv@139@01 r) (len<Int> a@108@01))))
    (= (loc<Ref> a@108@01 (inv@139@01 r)) r))
  :pattern ((inv@139@01 r))
  :qid |val-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@141@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (>= (inv@139@01 r) 0) (< (inv@139@01 r) (len<Int> a@108@01)))
      (img@140@01 r)
      (= r (loc<Ref> a@108@01 (inv@139@01 r))))
    ($Perm.min
      (ite
        (and
          (img@136@01 r)
          (and (>= (inv@135@01 r) 0) (< (inv@135@01 r) (len<Int> a@108@01))))
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
        (and
          (img@136@01 r)
          (and (>= (inv@135@01 r) 0) (< (inv@135@01 r) (len<Int> a@108@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@141@01 r))
    $Perm.No)
  
  :qid |quant-u-80|))))
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
      (and (>= (inv@139@01 r) 0) (< (inv@139@01 r) (len<Int> a@108@01)))
      (img@140@01 r)
      (= r (loc<Ref> a@108@01 (inv@139@01 r))))
    (= (- $Perm.Write (pTaken@141@01 r)) $Perm.No))
  
  :qid |quant-u-81|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@142@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@136@01 r)
      (and (>= (inv@135@01 r) 0) (< (inv@135@01 r) (len<Int> a@108@01))))
    (=
      ($FVF.lookup_val (as sm@142@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second $t@133@01)))) r)))
  :pattern (($FVF.lookup_val (as sm@142@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second $t@133@01)))) r))
  :qid |qp.fvfValDef22|)))
; [eval] (forall j: Int :: { old(loc(a, j)) } j >= 0 && (j < len(a) && j < i) ==> old(loc(a, j).val) == loc(a, j).val)
(declare-const j@143@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] j >= 0 && (j < len(a) && j < i) ==> old(loc(a, j).val) == loc(a, j).val
; [eval] j >= 0 && (j < len(a) && j < i)
; [eval] j >= 0
(push) ; 5
; [then-branch: 49 | !(j@143@01 >= 0) | live]
; [else-branch: 49 | j@143@01 >= 0 | live]
(push) ; 6
; [then-branch: 49 | !(j@143@01 >= 0)]
(assert (not (>= j@143@01 0)))
(pop) ; 6
(push) ; 6
; [else-branch: 49 | j@143@01 >= 0]
(assert (>= j@143@01 0))
; [eval] j < len(a)
; [eval] len(a)
(push) ; 7
; [then-branch: 50 | !(j@143@01 < len[Int](a@108@01)) | live]
; [else-branch: 50 | j@143@01 < len[Int](a@108@01) | live]
(push) ; 8
; [then-branch: 50 | !(j@143@01 < len[Int](a@108@01))]
(assert (not (< j@143@01 (len<Int> a@108@01))))
(pop) ; 8
(push) ; 8
; [else-branch: 50 | j@143@01 < len[Int](a@108@01)]
(assert (< j@143@01 (len<Int> a@108@01)))
; [eval] j < i
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or (< j@143@01 (len<Int> a@108@01)) (not (< j@143@01 (len<Int> a@108@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@143@01 0)
  (and
    (>= j@143@01 0)
    (or (< j@143@01 (len<Int> a@108@01)) (not (< j@143@01 (len<Int> a@108@01)))))))
(assert (or (>= j@143@01 0) (not (>= j@143@01 0))))
(push) ; 5
; [then-branch: 51 | j@143@01 >= 0 && j@143@01 < len[Int](a@108@01) && j@143@01 < i@109@01 | live]
; [else-branch: 51 | !(j@143@01 >= 0 && j@143@01 < len[Int](a@108@01) && j@143@01 < i@109@01) | live]
(push) ; 6
; [then-branch: 51 | j@143@01 >= 0 && j@143@01 < len[Int](a@108@01) && j@143@01 < i@109@01]
(assert (and
  (>= j@143@01 0)
  (and (< j@143@01 (len<Int> a@108@01)) (< j@143@01 i@109@01))))
; [eval] old(loc(a, j).val) == loc(a, j).val
; [eval] old(loc(a, j).val)
; [eval] loc(a, j)
(push) ; 7
(assert (not (and
  (img@114@01 (loc<Ref> a@108@01 j@143@01))
  (and
    (>= (inv@113@01 (loc<Ref> a@108@01 j@143@01)) 0)
    (< (inv@113@01 (loc<Ref> a@108@01 j@143@01)) (len<Int> a@108@01))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] loc(a, j)
(push) ; 7
(assert (not (and
  (img@136@01 (loc<Ref> a@108@01 j@143@01))
  (and
    (>= (inv@135@01 (loc<Ref> a@108@01 j@143@01)) 0)
    (< (inv@135@01 (loc<Ref> a@108@01 j@143@01)) (len<Int> a@108@01))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 51 | !(j@143@01 >= 0 && j@143@01 < len[Int](a@108@01) && j@143@01 < i@109@01)]
(assert (not
  (and
    (>= j@143@01 0)
    (and (< j@143@01 (len<Int> a@108@01)) (< j@143@01 i@109@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (>= j@143@01 0)
    (and (< j@143@01 (len<Int> a@108@01)) (< j@143@01 i@109@01)))
  (and (>= j@143@01 0) (< j@143@01 (len<Int> a@108@01)) (< j@143@01 i@109@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= j@143@01 0)
      (and (< j@143@01 (len<Int> a@108@01)) (< j@143@01 i@109@01))))
  (and
    (>= j@143@01 0)
    (and (< j@143@01 (len<Int> a@108@01)) (< j@143@01 i@109@01)))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@143@01 Int)) (!
  (and
    (=>
      (>= j@143@01 0)
      (and
        (>= j@143@01 0)
        (or
          (< j@143@01 (len<Int> a@108@01))
          (not (< j@143@01 (len<Int> a@108@01))))))
    (or (>= j@143@01 0) (not (>= j@143@01 0)))
    (=>
      (and
        (>= j@143@01 0)
        (and (< j@143@01 (len<Int> a@108@01)) (< j@143@01 i@109@01)))
      (and
        (>= j@143@01 0)
        (< j@143@01 (len<Int> a@108@01))
        (< j@143@01 i@109@01)))
    (or
      (not
        (and
          (>= j@143@01 0)
          (and (< j@143@01 (len<Int> a@108@01)) (< j@143@01 i@109@01))))
      (and
        (>= j@143@01 0)
        (and (< j@143@01 (len<Int> a@108@01)) (< j@143@01 i@109@01)))))
  :pattern ((loc<Ref> a@108@01 j@143@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/two_blocks_array.vpr@66@9@66@94-aux|)))
(push) ; 4
(assert (not (forall ((j@143@01 Int)) (!
  (=>
    (and
      (>= j@143@01 0)
      (and (< j@143@01 (len<Int> a@108@01)) (< j@143@01 i@109@01)))
    (=
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second $t@111@01))) (loc<Ref> a@108@01 j@143@01))
      ($FVF.lookup_val (as sm@142@01  $FVF<val>) (loc<Ref> a@108@01 j@143@01))))
  :pattern ((loc<Ref> a@108@01 j@143@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/two_blocks_array.vpr@66@9@66@94|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j@143@01 Int)) (!
  (=>
    (and
      (>= j@143@01 0)
      (and (< j@143@01 (len<Int> a@108@01)) (< j@143@01 i@109@01)))
    (=
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second $t@111@01))) (loc<Ref> a@108@01 j@143@01))
      ($FVF.lookup_val (as sm@142@01  $FVF<val>) (loc<Ref> a@108@01 j@143@01))))
  :pattern ((loc<Ref> a@108@01 j@143@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/two_blocks_array.vpr@66@9@66@94|)))
(pop) ; 3
(push) ; 3
; [else-branch: 42 | !(i@109@01 + 2 < len[Int](a@108@01))]
(assert (not (< (+ i@109@01 2) (len<Int> a@108@01))))
(pop) ; 3
; [eval] !(i + 2 < len(a))
; [eval] i + 2 < len(a)
; [eval] i + 2
; [eval] len(a)
(push) ; 3
(set-option :timeout 10)
(assert (not (< (+ i@109@01 2) (len<Int> a@108@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (< (+ i@109@01 2) (len<Int> a@108@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 52 | !(i@109@01 + 2 < len[Int](a@108@01)) | live]
; [else-branch: 52 | i@109@01 + 2 < len[Int](a@108@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 52 | !(i@109@01 + 2 < len[Int](a@108@01))]
(assert (not (< (+ i@109@01 2) (len<Int> a@108@01))))
; [eval] i >= 0
; [eval] i < len(a)
; [eval] len(a)
(declare-const j@144@01 Int)
(push) ; 4
; [eval] j >= 0 && j < len(a)
; [eval] j >= 0
(push) ; 5
; [then-branch: 53 | !(j@144@01 >= 0) | live]
; [else-branch: 53 | j@144@01 >= 0 | live]
(push) ; 6
; [then-branch: 53 | !(j@144@01 >= 0)]
(assert (not (>= j@144@01 0)))
(pop) ; 6
(push) ; 6
; [else-branch: 53 | j@144@01 >= 0]
(assert (>= j@144@01 0))
; [eval] j < len(a)
; [eval] len(a)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (>= j@144@01 0) (not (>= j@144@01 0))))
(assert (and (>= j@144@01 0) (< j@144@01 (len<Int> a@108@01))))
; [eval] loc(a, j)
(pop) ; 4
(declare-fun inv@145@01 ($Ref) Int)
(declare-fun img@146@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@144@01 Int)) (!
  (=>
    (and (>= j@144@01 0) (< j@144@01 (len<Int> a@108@01)))
    (or (>= j@144@01 0) (not (>= j@144@01 0))))
  :pattern ((loc<Ref> a@108@01 j@144@01))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((j1@144@01 Int) (j2@144@01 Int)) (!
  (=>
    (and
      (and (>= j1@144@01 0) (< j1@144@01 (len<Int> a@108@01)))
      (and (>= j2@144@01 0) (< j2@144@01 (len<Int> a@108@01)))
      (= (loc<Ref> a@108@01 j1@144@01) (loc<Ref> a@108@01 j2@144@01)))
    (= j1@144@01 j2@144@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@144@01 Int)) (!
  (=>
    (and (>= j@144@01 0) (< j@144@01 (len<Int> a@108@01)))
    (and
      (= (inv@145@01 (loc<Ref> a@108@01 j@144@01)) j@144@01)
      (img@146@01 (loc<Ref> a@108@01 j@144@01))))
  :pattern ((loc<Ref> a@108@01 j@144@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@146@01 r)
      (and (>= (inv@145@01 r) 0) (< (inv@145@01 r) (len<Int> a@108@01))))
    (= (loc<Ref> a@108@01 (inv@145@01 r)) r))
  :pattern ((inv@145@01 r))
  :qid |val-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@147@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (>= (inv@145@01 r) 0) (< (inv@145@01 r) (len<Int> a@108@01)))
      (img@146@01 r)
      (= r (loc<Ref> a@108@01 (inv@145@01 r))))
    ($Perm.min
      (ite
        (and
          (img@114@01 r)
          (and (>= (inv@113@01 r) 0) (< (inv@113@01 r) (len<Int> a@108@01))))
        (- $Perm.Write (pTaken@125@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@148@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (>= (inv@145@01 r) 0) (< (inv@145@01 r) (len<Int> a@108@01)))
      (img@146@01 r)
      (= r (loc<Ref> a@108@01 (inv@145@01 r))))
    ($Perm.min
      (ite (= r (loc<Ref> a@108@01 i@109@01)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@147@01 r)))
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
        (and
          (img@114@01 r)
          (and (>= (inv@113@01 r) 0) (< (inv@113@01 r) (len<Int> a@108@01))))
        (- $Perm.Write (pTaken@125@01 r))
        $Perm.No)
      (pTaken@147@01 r))
    $Perm.No)
  
  :qid |quant-u-84|))))
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
      (and (>= (inv@145@01 r) 0) (< (inv@145@01 r) (len<Int> a@108@01)))
      (img@146@01 r)
      (= r (loc<Ref> a@108@01 (inv@145@01 r))))
    (= (- $Perm.Write (pTaken@147@01 r)) $Perm.No))
  
  :qid |quant-u-85|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (=
  (-
    (ite
      (= (loc<Ref> a@108@01 i@109@01) (loc<Ref> a@108@01 i@109@01))
      $Perm.Write
      $Perm.No)
    (pTaken@148@01 (loc<Ref> a@108@01 i@109@01)))
  $Perm.No)))
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
      (and (>= (inv@145@01 r) 0) (< (inv@145@01 r) (len<Int> a@108@01)))
      (img@146@01 r)
      (= r (loc<Ref> a@108@01 (inv@145@01 r))))
    (= (- (- $Perm.Write (pTaken@147@01 r)) (pTaken@148@01 r)) $Perm.No))
  
  :qid |quant-u-87|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@149@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@108@01 i@109@01))
    (=
      ($FVF.lookup_val (as sm@149@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@126@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@149@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@126@01  $FVF<val>) r))
  :qid |qp.fvfValDef23|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@114@01 r)
        (and (>= (inv@113@01 r) 0) (< (inv@113@01 r) (len<Int> a@108@01))))
      (< $Perm.No (- $Perm.Write (pTaken@125@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@149@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second $t@111@01))) r)))
  :pattern (($FVF.lookup_val (as sm@149@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second $t@111@01))) r))
  :qid |qp.fvfValDef24|)))
; [eval] (forall j: Int :: { old(loc(a, j)) } j >= 0 && (j < len(a) && j < i) ==> old(loc(a, j).val) == loc(a, j).val)
(declare-const j@150@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] j >= 0 && (j < len(a) && j < i) ==> old(loc(a, j).val) == loc(a, j).val
; [eval] j >= 0 && (j < len(a) && j < i)
; [eval] j >= 0
(push) ; 5
; [then-branch: 54 | !(j@150@01 >= 0) | live]
; [else-branch: 54 | j@150@01 >= 0 | live]
(push) ; 6
; [then-branch: 54 | !(j@150@01 >= 0)]
(assert (not (>= j@150@01 0)))
(pop) ; 6
(push) ; 6
; [else-branch: 54 | j@150@01 >= 0]
(assert (>= j@150@01 0))
; [eval] j < len(a)
; [eval] len(a)
(push) ; 7
; [then-branch: 55 | !(j@150@01 < len[Int](a@108@01)) | live]
; [else-branch: 55 | j@150@01 < len[Int](a@108@01) | live]
(push) ; 8
; [then-branch: 55 | !(j@150@01 < len[Int](a@108@01))]
(assert (not (< j@150@01 (len<Int> a@108@01))))
(pop) ; 8
(push) ; 8
; [else-branch: 55 | j@150@01 < len[Int](a@108@01)]
(assert (< j@150@01 (len<Int> a@108@01)))
; [eval] j < i
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or (< j@150@01 (len<Int> a@108@01)) (not (< j@150@01 (len<Int> a@108@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@150@01 0)
  (and
    (>= j@150@01 0)
    (or (< j@150@01 (len<Int> a@108@01)) (not (< j@150@01 (len<Int> a@108@01)))))))
(assert (or (>= j@150@01 0) (not (>= j@150@01 0))))
(push) ; 5
; [then-branch: 56 | j@150@01 >= 0 && j@150@01 < len[Int](a@108@01) && j@150@01 < i@109@01 | live]
; [else-branch: 56 | !(j@150@01 >= 0 && j@150@01 < len[Int](a@108@01) && j@150@01 < i@109@01) | live]
(push) ; 6
; [then-branch: 56 | j@150@01 >= 0 && j@150@01 < len[Int](a@108@01) && j@150@01 < i@109@01]
(assert (and
  (>= j@150@01 0)
  (and (< j@150@01 (len<Int> a@108@01)) (< j@150@01 i@109@01))))
; [eval] old(loc(a, j).val) == loc(a, j).val
; [eval] old(loc(a, j).val)
; [eval] loc(a, j)
(push) ; 7
(assert (not (and
  (img@114@01 (loc<Ref> a@108@01 j@150@01))
  (and
    (>= (inv@113@01 (loc<Ref> a@108@01 j@150@01)) 0)
    (< (inv@113@01 (loc<Ref> a@108@01 j@150@01)) (len<Int> a@108@01))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] loc(a, j)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (loc<Ref> a@108@01 i@109@01))
      (=
        ($FVF.lookup_val (as sm@149@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@126@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@149@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@126@01  $FVF<val>) r))
    :qid |qp.fvfValDef23|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@114@01 r)
          (and (>= (inv@113@01 r) 0) (< (inv@113@01 r) (len<Int> a@108@01))))
        (< $Perm.No (- $Perm.Write (pTaken@125@01 r)))
        false)
      (=
        ($FVF.lookup_val (as sm@149@01  $FVF<val>) r)
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second $t@111@01))) r)))
    :pattern (($FVF.lookup_val (as sm@149@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second $t@111@01))) r))
    :qid |qp.fvfValDef24|))))
(push) ; 7
(assert (not (<
  $Perm.No
  (+
    (ite
      (= (loc<Ref> a@108@01 j@150@01) (loc<Ref> a@108@01 i@109@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and
        (img@114@01 (loc<Ref> a@108@01 j@150@01))
        (and
          (>= (inv@113@01 (loc<Ref> a@108@01 j@150@01)) 0)
          (< (inv@113@01 (loc<Ref> a@108@01 j@150@01)) (len<Int> a@108@01))))
      (- $Perm.Write (pTaken@125@01 (loc<Ref> a@108@01 j@150@01)))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 56 | !(j@150@01 >= 0 && j@150@01 < len[Int](a@108@01) && j@150@01 < i@109@01)]
(assert (not
  (and
    (>= j@150@01 0)
    (and (< j@150@01 (len<Int> a@108@01)) (< j@150@01 i@109@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@108@01 i@109@01))
    (=
      ($FVF.lookup_val (as sm@149@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@126@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@149@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@126@01  $FVF<val>) r))
  :qid |qp.fvfValDef23|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@114@01 r)
        (and (>= (inv@113@01 r) 0) (< (inv@113@01 r) (len<Int> a@108@01))))
      (< $Perm.No (- $Perm.Write (pTaken@125@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@149@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second $t@111@01))) r)))
  :pattern (($FVF.lookup_val (as sm@149@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second $t@111@01))) r))
  :qid |qp.fvfValDef24|)))
(assert (=>
  (and
    (>= j@150@01 0)
    (and (< j@150@01 (len<Int> a@108@01)) (< j@150@01 i@109@01)))
  (and (>= j@150@01 0) (< j@150@01 (len<Int> a@108@01)) (< j@150@01 i@109@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= j@150@01 0)
      (and (< j@150@01 (len<Int> a@108@01)) (< j@150@01 i@109@01))))
  (and
    (>= j@150@01 0)
    (and (< j@150@01 (len<Int> a@108@01)) (< j@150@01 i@109@01)))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@108@01 i@109@01))
    (=
      ($FVF.lookup_val (as sm@149@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@126@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@149@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@126@01  $FVF<val>) r))
  :qid |qp.fvfValDef23|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@114@01 r)
        (and (>= (inv@113@01 r) 0) (< (inv@113@01 r) (len<Int> a@108@01))))
      (< $Perm.No (- $Perm.Write (pTaken@125@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@149@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second $t@111@01))) r)))
  :pattern (($FVF.lookup_val (as sm@149@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second $t@111@01))) r))
  :qid |qp.fvfValDef24|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@150@01 Int)) (!
  (and
    (=>
      (>= j@150@01 0)
      (and
        (>= j@150@01 0)
        (or
          (< j@150@01 (len<Int> a@108@01))
          (not (< j@150@01 (len<Int> a@108@01))))))
    (or (>= j@150@01 0) (not (>= j@150@01 0)))
    (=>
      (and
        (>= j@150@01 0)
        (and (< j@150@01 (len<Int> a@108@01)) (< j@150@01 i@109@01)))
      (and
        (>= j@150@01 0)
        (< j@150@01 (len<Int> a@108@01))
        (< j@150@01 i@109@01)))
    (or
      (not
        (and
          (>= j@150@01 0)
          (and (< j@150@01 (len<Int> a@108@01)) (< j@150@01 i@109@01))))
      (and
        (>= j@150@01 0)
        (and (< j@150@01 (len<Int> a@108@01)) (< j@150@01 i@109@01)))))
  :pattern ((loc<Ref> a@108@01 j@150@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/two_blocks_array.vpr@66@9@66@94-aux|)))
(push) ; 4
(assert (not (forall ((j@150@01 Int)) (!
  (=>
    (and
      (>= j@150@01 0)
      (and (< j@150@01 (len<Int> a@108@01)) (< j@150@01 i@109@01)))
    (=
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second $t@111@01))) (loc<Ref> a@108@01 j@150@01))
      ($FVF.lookup_val (as sm@149@01  $FVF<val>) (loc<Ref> a@108@01 j@150@01))))
  :pattern ((loc<Ref> a@108@01 j@150@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/two_blocks_array.vpr@66@9@66@94|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j@150@01 Int)) (!
  (=>
    (and
      (>= j@150@01 0)
      (and (< j@150@01 (len<Int> a@108@01)) (< j@150@01 i@109@01)))
    (=
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second $t@111@01))) (loc<Ref> a@108@01 j@150@01))
      ($FVF.lookup_val (as sm@149@01  $FVF<val>) (loc<Ref> a@108@01 j@150@01))))
  :pattern ((loc<Ref> a@108@01 j@150@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/examples/two_blocks_array.vpr@66@9@66@94|)))
(pop) ; 3
(push) ; 3
; [else-branch: 52 | i@109@01 + 2 < len[Int](a@108@01)]
(assert (< (+ i@109@01 2) (len<Int> a@108@01)))
(pop) ; 3
(pop) ; 2
(pop) ; 1
