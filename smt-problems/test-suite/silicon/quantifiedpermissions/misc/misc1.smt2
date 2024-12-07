(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:18:50
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/misc/misc1.vpr
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
(declare-sort parallelHeaps 0)
(declare-sort reads 0)
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
(declare-fun $SortWrappers.parallelHeapsTo$Snap (parallelHeaps) $Snap)
(declare-fun $SortWrappers.$SnapToparallelHeaps ($Snap) parallelHeaps)
(assert (forall ((x parallelHeaps)) (!
    (= x ($SortWrappers.$SnapToparallelHeaps($SortWrappers.parallelHeapsTo$Snap x)))
    :pattern (($SortWrappers.parallelHeapsTo$Snap x))
    :qid |$Snap.$SnapToparallelHeapsTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.parallelHeapsTo$Snap($SortWrappers.$SnapToparallelHeaps x)))
    :pattern (($SortWrappers.$SnapToparallelHeaps x))
    :qid |$Snap.parallelHeapsTo$SnapToparallelHeaps|
    )))
(declare-fun $SortWrappers.readsTo$Snap (reads) $Snap)
(declare-fun $SortWrappers.$SnapToreads ($Snap) reads)
(assert (forall ((x reads)) (!
    (= x ($SortWrappers.$SnapToreads($SortWrappers.readsTo$Snap x)))
    :pattern (($SortWrappers.readsTo$Snap x))
    :qid |$Snap.$SnapToreadsTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.readsTo$Snap($SortWrappers.$SnapToreads x)))
    :pattern (($SortWrappers.$SnapToreads x))
    :qid |$Snap.readsTo$SnapToreads|
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
(declare-const rd<Perm> $Perm)
(declare-fun rds<Perm> (Int) $Perm)
(declare-fun up<Ref> ($Ref) $Ref)
(declare-fun down<Ref> ($Ref) $Ref)
(declare-fun up_inv<Ref> ($Ref) $Ref)
(declare-fun down_inv<Ref> ($Ref) $Ref)
(declare-fun temp<Ref> ($Ref) $Ref)
(declare-fun temp_inv<Ref> ($Ref) $Ref)
(declare-fun heap<Int> ($Ref) Int)
(declare-fun is_ghost<Bool> ($Ref) Bool)
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
(assert (forall ((i Int)) (!
  (and
    (= (rds<Perm> 0) $Perm.No)
    (and
      (= (rds<Perm> i) (* (to_real i) (as rd<Perm>  $Perm)))
      (=> (>= i 0) (< (rds<Perm> i) $Perm.Write))))
  :pattern ((rds<Perm> i))
  :qid |prog.some|)))
(assert (> (as rd<Perm>  $Perm) $Perm.No))
(assert (forall ((r $Ref)) (!
  (and
    (= (temp_inv<Ref> (temp<Ref> r)) r)
    (ite
      (is_ghost<Bool> r)
      (= (temp<Ref> r) r)
      (= (heap<Int> (temp<Ref> r)) (- 0 3))))
  :pattern ((temp<Ref> r))
  :qid |prog.inv_temp|)))
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
; ---------- clone ----------
(declare-const data@0@01 $Ref)
(declare-const count@1@01 $Ref)
(declare-const ghost@2@01 $Ref)
(declare-const data@3@01 $Ref)
(declare-const count@4@01 $Ref)
(declare-const ghost@5@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 ($Snap.combine ($Snap.first $t@6@01) ($Snap.second $t@6@01))))
(assert (= ($Snap.first $t@6@01) $Snap.unit))
; [eval] heap(data) == 0
; [eval] heap(data)
(assert (= (heap<Int> data@3@01) 0))
(assert (=
  ($Snap.second $t@6@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.second ($Snap.second $t@6@01)))))
(assert (= ($Snap.first ($Snap.second $t@6@01)) $Snap.unit))
; [eval] heap(count) == 0
; [eval] heap(count)
(assert (= (heap<Int> count@4@01) 0))
(assert (=
  ($Snap.second ($Snap.second $t@6@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@6@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@6@01))) $Snap.unit))
; [eval] heap(ghost) == 0
; [eval] heap(ghost)
(assert (= (heap<Int> ghost@5@01) 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@6@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) $Snap.unit))
; [eval] is_ghost(ghost)
(assert (is_ghost<Bool> ghost@5@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))))
; [eval] rd()
(push) ; 2
(assert (not (or (= (as rd<Perm>  $Perm) $Perm.No) (< $Perm.No (as rd<Perm>  $Perm)))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(declare-const sm@7@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@7@01  $FVF<val>) data@3@01)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))))
(assert (<= $Perm.No (as rd<Perm>  $Perm)))
(assert (<= (as rd<Perm>  $Perm) $Perm.Write))
(assert (=> (< $Perm.No (as rd<Perm>  $Perm)) (not (= data@3@01 $Ref.null))))
; [eval] rd()
(push) ; 2
(assert (not (or (= (as rd<Perm>  $Perm) $Perm.No) (< $Perm.No (as rd<Perm>  $Perm)))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(declare-const sm@8@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@8@01  $FVF<val>) ghost@5@01)
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= ghost@5@01 data@3@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=> (< $Perm.No (as rd<Perm>  $Perm)) (not (= ghost@5@01 $Ref.null))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var t: Int
(declare-const t@9@01 Int)
; [exec]
; inhale (forall d: Ref ::false ==> acc(d.val, none))
(declare-const d@10@01 $Ref)
(push) ; 3
(assert false)
(pop) ; 3
(declare-const $t@11@01 $FVF<val>)
(declare-fun inv@12@01 ($Ref) $Ref)
(declare-fun img@13@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(temp(ghost).val, write - rds(t))
; [eval] temp(ghost)
; [eval] write - rds(t)
; [eval] rds(t)
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (= (- $Perm.Write (rds<Perm> t@9@01)) $Perm.No)
  (< $Perm.No (- $Perm.Write (rds<Perm> t@9@01))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const $t@14@01 Int)
(declare-const sm@15@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (= ($FVF.lookup_val (as sm@15@01  $FVF<val>) (temp<Ref> ghost@5@01)) $t@14@01))
(push) ; 3
(set-option :timeout 10)
(assert (not (= (temp<Ref> ghost@5@01) ghost@5@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (temp<Ref> ghost@5@01) ghost@5@01))
(declare-const $t@16@01 $FVF<val>)
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (ite (= r ghost@5@01) (< $Perm.No (as rd<Perm>  $Perm)) false)
      (=
        ($FVF.lookup_val $t@16@01 r)
        ($FVF.lookup_val (as sm@8@01  $FVF<val>) r)))
    (=>
      (ite
        (= r (temp<Ref> ghost@5@01))
        (< $Perm.No (- $Perm.Write (rds<Perm> t@9@01)))
        false)
      (=
        ($FVF.lookup_val $t@16@01 r)
        ($FVF.lookup_val (as sm@15@01  $FVF<val>) r))))
  :pattern (($FVF.lookup_val (as sm@8@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@15@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@16@01 r))
  :qid |quant-u-2|)))
(assert (<=
  $Perm.No
  (ite
    (= (temp<Ref> ghost@5@01) (temp<Ref> ghost@5@01))
    (- $Perm.Write (rds<Perm> t@9@01))
    $Perm.No)))
(assert (<=
  (ite
    (= (temp<Ref> ghost@5@01) (temp<Ref> ghost@5@01))
    (- $Perm.Write (rds<Perm> t@9@01))
    $Perm.No)
  $Perm.Write))
(assert (=>
  (ite
    (= (temp<Ref> ghost@5@01) (temp<Ref> ghost@5@01))
    (< $Perm.No (- $Perm.Write (rds<Perm> t@9@01)))
    false)
  (not (= (temp<Ref> ghost@5@01) $Ref.null))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale t < 1
(declare-const $t@17@01 $Snap)
(assert (= $t@17@01 $Snap.unit))
; [eval] t < 1
(assert (< t@9@01 1))
; State saturation: after inhale
(check-sat)
; unknown
; [eval] t >= 0
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (>= t@9@01 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (>= t@9@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | t@9@01 >= 0 | live]
; [else-branch: 0 | !(t@9@01 >= 0) | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | t@9@01 >= 0]
(assert (>= t@9@01 0))
; [exec]
; exhale acc(up(data).val, write - rds(t + 1) -
;   (write - rds(t + 1) < perm(temp(data).val) ?
;     write - rds(t + 1) :
;     perm(temp(data).val)))
; [eval] up(data)
; [eval] write - rds(t + 1) - (write - rds(t + 1) < perm(temp(data).val) ? write - rds(t + 1) : perm(temp(data).val))
; [eval] write - rds(t + 1)
; [eval] rds(t + 1)
; [eval] t + 1
; [eval] (write - rds(t + 1) < perm(temp(data).val) ? write - rds(t + 1) : perm(temp(data).val))
; [eval] write - rds(t + 1) < perm(temp(data).val)
; [eval] write - rds(t + 1)
; [eval] rds(t + 1)
; [eval] t + 1
; [eval] perm(temp(data).val)
; [eval] temp(data)
(declare-const pm@18@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@18@01  $FPM) r)
    (+
      (ite (= r data@3@01) (as rd<Perm>  $Perm) $Perm.No)
      (ite
        (= r ghost@5@01)
        (+ (as rd<Perm>  $Perm) (- $Perm.Write (rds<Perm> t@9@01)))
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@18@01  $FPM) r))
  :qid |qp.resPrmSumDef0|)))
; perm(temp(data).val)  ~~>  assume upper permission bound
(assert (<= ($FVF.perm_val (as pm@18@01  $FPM) (temp<Ref> data@3@01)) $Perm.Write))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (<
    (- $Perm.Write (rds<Perm> (+ t@9@01 1)))
    ($FVF.perm_val (as pm@18@01  $FPM) (temp<Ref> data@3@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (<
  (- $Perm.Write (rds<Perm> (+ t@9@01 1)))
  ($FVF.perm_val (as pm@18@01  $FPM) (temp<Ref> data@3@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | W - rds[Perm](t@9@01 + 1) < PermLookup(val, pm@18@01, temp[Ref](data@3@01)) | live]
; [else-branch: 1 | !(W - rds[Perm](t@9@01 + 1) < PermLookup(val, pm@18@01, temp[Ref](data@3@01))) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 1 | W - rds[Perm](t@9@01 + 1) < PermLookup(val, pm@18@01, temp[Ref](data@3@01))]
(assert (<
  (- $Perm.Write (rds<Perm> (+ t@9@01 1)))
  ($FVF.perm_val (as pm@18@01  $FPM) (temp<Ref> data@3@01))))
; [eval] write - rds(t + 1)
; [eval] rds(t + 1)
; [eval] t + 1
(pop) ; 5
(push) ; 5
; [else-branch: 1 | !(W - rds[Perm](t@9@01 + 1) < PermLookup(val, pm@18@01, temp[Ref](data@3@01)))]
(assert (not
  (<
    (- $Perm.Write (rds<Perm> (+ t@9@01 1)))
    ($FVF.perm_val (as pm@18@01  $FPM) (temp<Ref> data@3@01)))))
; [eval] perm(temp(data).val)
; [eval] temp(data)
; perm(temp(data).val)  ~~>  assume upper permission bound
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (<
      (- $Perm.Write (rds<Perm> (+ t@9@01 1)))
      ($FVF.perm_val (as pm@18@01  $FPM) (temp<Ref> data@3@01))))
  (<
    (- $Perm.Write (rds<Perm> (+ t@9@01 1)))
    ($FVF.perm_val (as pm@18@01  $FPM) (temp<Ref> data@3@01)))))
(push) ; 4
(set-option :timeout 10)
(assert (not (= data@3@01 (up<Ref> data@3@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ghost@5@01 (up<Ref> data@3@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@19@01 ((r $Ref)) $Perm
  (ite
    (= r (up<Ref> data@3@01))
    ($Perm.min
      $Perm.No
      (-
        (- $Perm.Write (rds<Perm> (+ t@9@01 1)))
        (ite
          (<
            (- $Perm.Write (rds<Perm> (+ t@9@01 1)))
            ($FVF.perm_val (as pm@18@01  $FPM) (temp<Ref> data@3@01)))
          (- $Perm.Write (rds<Perm> (+ t@9@01 1)))
          ($FVF.perm_val (as pm@18@01  $FPM) (temp<Ref> data@3@01)))))
    $Perm.No))
(define-fun pTaken@20@01 ((r $Ref)) $Perm
  (ite
    (= r (up<Ref> data@3@01))
    ($Perm.min
      (ite (= r data@3@01) (as rd<Perm>  $Perm) $Perm.No)
      (-
        (-
          (- $Perm.Write (rds<Perm> (+ t@9@01 1)))
          (ite
            (<
              (- $Perm.Write (rds<Perm> (+ t@9@01 1)))
              ($FVF.perm_val (as pm@18@01  $FPM) (temp<Ref> data@3@01)))
            (- $Perm.Write (rds<Perm> (+ t@9@01 1)))
            ($FVF.perm_val (as pm@18@01  $FPM) (temp<Ref> data@3@01))))
        (pTaken@19@01 r)))
    $Perm.No))
(define-fun pTaken@21@01 ((r $Ref)) $Perm
  (ite
    (= r (up<Ref> data@3@01))
    ($Perm.min
      (ite
        (= r ghost@5@01)
        (+ (as rd<Perm>  $Perm) (- $Perm.Write (rds<Perm> t@9@01)))
        $Perm.No)
      (-
        (-
          (-
            (- $Perm.Write (rds<Perm> (+ t@9@01 1)))
            (ite
              (<
                (- $Perm.Write (rds<Perm> (+ t@9@01 1)))
                ($FVF.perm_val (as pm@18@01  $FPM) (temp<Ref> data@3@01)))
              (- $Perm.Write (rds<Perm> (+ t@9@01 1)))
              ($FVF.perm_val (as pm@18@01  $FPM) (temp<Ref> data@3@01))))
          (pTaken@19@01 r))
        (pTaken@20@01 r)))
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
  (= (- $Perm.No (pTaken@19@01 r)) $Perm.No)
  
  :qid |quant-u-4|))))
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
    (= r (up<Ref> data@3@01))
    (=
      (-
        (-
          (- $Perm.Write (rds<Perm> (+ t@9@01 1)))
          (ite
            (<
              (- $Perm.Write (rds<Perm> (+ t@9@01 1)))
              ($FVF.perm_val (as pm@18@01  $FPM) (temp<Ref> data@3@01)))
            (- $Perm.Write (rds<Perm> (+ t@9@01 1)))
            ($FVF.perm_val (as pm@18@01  $FPM) (temp<Ref> data@3@01))))
        (pTaken@19@01 r))
      $Perm.No))
  
  :qid |quant-u-5|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (= (- (as rd<Perm>  $Perm) (pTaken@20@01 data@3@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@20@01 r) $Perm.No)
  
  :qid |quant-u-7|))))
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
    (= r (up<Ref> data@3@01))
    (=
      (-
        (-
          (-
            (- $Perm.Write (rds<Perm> (+ t@9@01 1)))
            (ite
              (<
                (- $Perm.Write (rds<Perm> (+ t@9@01 1)))
                ($FVF.perm_val (as pm@18@01  $FPM) (temp<Ref> data@3@01)))
              (- $Perm.Write (rds<Perm> (+ t@9@01 1)))
              ($FVF.perm_val (as pm@18@01  $FPM) (temp<Ref> data@3@01))))
          (pTaken@19@01 r))
        (pTaken@20@01 r))
      $Perm.No))
  
  :qid |quant-u-8|))))
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
    (+ (as rd<Perm>  $Perm) (- $Perm.Write (rds<Perm> t@9@01)))
    (pTaken@21@01 ghost@5@01))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@21@01 r) $Perm.No)
  
  :qid |quant-u-10|))))
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
    (= r (up<Ref> data@3@01))
    (=
      (-
        (-
          (-
            (-
              (- $Perm.Write (rds<Perm> (+ t@9@01 1)))
              (ite
                (<
                  (- $Perm.Write (rds<Perm> (+ t@9@01 1)))
                  ($FVF.perm_val (as pm@18@01  $FPM) (temp<Ref> data@3@01)))
                (- $Perm.Write (rds<Perm> (+ t@9@01 1)))
                ($FVF.perm_val (as pm@18@01  $FPM) (temp<Ref> data@3@01))))
            (pTaken@19@01 r))
          (pTaken@20@01 r))
        (pTaken@21@01 r))
      $Perm.No))
  
  :qid |quant-u-11|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (up<Ref> data@3@01))
    (=
      (-
        (-
          (-
            (-
              (- $Perm.Write (rds<Perm> (+ t@9@01 1)))
              (ite
                (<
                  (- $Perm.Write (rds<Perm> (+ t@9@01 1)))
                  ($FVF.perm_val (as pm@18@01  $FPM) (temp<Ref> data@3@01)))
                (- $Perm.Write (rds<Perm> (+ t@9@01 1)))
                ($FVF.perm_val (as pm@18@01  $FPM) (temp<Ref> data@3@01))))
            (pTaken@19@01 r))
          (pTaken@20@01 r))
        (pTaken@21@01 r))
      $Perm.No))
  
  :qid |quant-u-11|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= data@3@01 ghost@5@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (as rd<Perm>  $Perm)
    (+ (as rd<Perm>  $Perm) (- $Perm.Write (rds<Perm> t@9@01)))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (+ (as rd<Perm>  $Perm) (- $Perm.Write (rds<Perm> t@9@01)))
    (as rd<Perm>  $Perm)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (as rd<Perm>  $Perm))
    (< $Perm.No (+ (as rd<Perm>  $Perm) (- $Perm.Write (rds<Perm> t@9@01)))))
  (not
    (=
      ($FVF.lookup_val (as sm@7@01  $FVF<val>) data@3@01)
      ($FVF.lookup_val $t@16@01 ghost@5@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (+ (as rd<Perm>  $Perm) (- $Perm.Write (rds<Perm> t@9@01))))
    (< $Perm.No (as rd<Perm>  $Perm)))
  (not
    (=
      ($FVF.lookup_val $t@16@01 ghost@5@01)
      ($FVF.lookup_val (as sm@7@01  $FVF<val>) data@3@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= data@3@01 ghost@5@01)) (not (= ghost@5@01 data@3@01))))
(declare-const sm@22@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite (= r data@3@01) (< $Perm.No (as rd<Perm>  $Perm)) false)
    (=
      ($FVF.lookup_val (as sm@22@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@7@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@22@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@7@01  $FVF<val>) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (= r ghost@5@01)
      (< $Perm.No (+ (as rd<Perm>  $Perm) (- $Perm.Write (rds<Perm> t@9@01))))
      false)
    (= ($FVF.lookup_val (as sm@22@01  $FVF<val>) r) ($FVF.lookup_val $t@16@01 r)))
  :pattern (($FVF.lookup_val (as sm@22@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@16@01 r))
  :qid |qp.fvfValDef3|)))
(declare-const pm@23@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@23@01  $FPM) r)
    (+
      (ite (= r data@3@01) (as rd<Perm>  $Perm) $Perm.No)
      (ite
        (= r ghost@5@01)
        (+ (as rd<Perm>  $Perm) (- $Perm.Write (rds<Perm> t@9@01)))
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@23@01  $FPM) r))
  :qid |qp.resPrmSumDef4|)))
(assert (<= ($FVF.perm_val (as pm@23@01  $FPM) data@3@01) $Perm.Write))
; Assume upper permission bound for field val
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_val (as pm@23@01  $FPM) r) $Perm.Write)
  :pattern ((inv@12@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_val (as pm@23@01  $FPM) ghost@5@01) $Perm.Write))
; [eval] up(data)
; [eval] write - rds(t + 1) - (write - rds(t + 1) < perm(temp(data).val) ? write - rds(t + 1) : perm(temp(data).val))
; [eval] write - rds(t + 1)
; [eval] rds(t + 1)
; [eval] t + 1
; [eval] (write - rds(t + 1) < perm(temp(data).val) ? write - rds(t + 1) : perm(temp(data).val))
; [eval] write - rds(t + 1) < perm(temp(data).val)
; [eval] write - rds(t + 1)
; [eval] rds(t + 1)
; [eval] t + 1
; [eval] perm(temp(data).val)
; [eval] temp(data)
; perm(temp(data).val)  ~~>  assume upper permission bound
(assert (<= ($FVF.perm_val (as pm@23@01  $FPM) (temp<Ref> data@3@01)) $Perm.Write))
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (<
    (- $Perm.Write (rds<Perm> (+ t@9@01 1)))
    ($FVF.perm_val (as pm@23@01  $FPM) (temp<Ref> data@3@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | W - rds[Perm](t@9@01 + 1) < PermLookup(val, pm@23@01, temp[Ref](data@3@01)) | dead]
; [else-branch: 2 | !(W - rds[Perm](t@9@01 + 1) < PermLookup(val, pm@23@01, temp[Ref](data@3@01))) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 2 | !(W - rds[Perm](t@9@01 + 1) < PermLookup(val, pm@23@01, temp[Ref](data@3@01)))]
(assert (not
  (<
    (- $Perm.Write (rds<Perm> (+ t@9@01 1)))
    ($FVF.perm_val (as pm@23@01  $FPM) (temp<Ref> data@3@01)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= data@3@01 ghost@5@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (= data@3@01 ghost@5@01))
(declare-const $t@24@01 $FVF<val>)
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (ite
        (= r ghost@5@01)
        (< $Perm.No (+ (as rd<Perm>  $Perm) (- $Perm.Write (rds<Perm> t@9@01))))
        false)
      (= ($FVF.lookup_val $t@24@01 r) ($FVF.lookup_val $t@16@01 r)))
    (=>
      (ite (= r data@3@01) (< $Perm.No (as rd<Perm>  $Perm)) false)
      (=
        ($FVF.lookup_val $t@24@01 r)
        ($FVF.lookup_val (as sm@7@01  $FVF<val>) r))))
  :pattern (($FVF.lookup_val $t@16@01 r))
  :pattern (($FVF.lookup_val (as sm@7@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@24@01 r))
  :qid |quant-u-12|)))
(declare-const sm@25@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (= r ghost@5@01)
      (<
        $Perm.No
        (+
          (+ (as rd<Perm>  $Perm) (- $Perm.Write (rds<Perm> t@9@01)))
          (as rd<Perm>  $Perm)))
      false)
    (= ($FVF.lookup_val (as sm@25@01  $FVF<val>) r) ($FVF.lookup_val $t@24@01 r)))
  :pattern (($FVF.lookup_val (as sm@25@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@24@01 r))
  :qid |qp.fvfValDef6|)))
(declare-const pm@26@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@26@01  $FPM) r)
    (ite
      (= r ghost@5@01)
      (+
        (+ (as rd<Perm>  $Perm) (- $Perm.Write (rds<Perm> t@9@01)))
        (as rd<Perm>  $Perm))
      $Perm.No))
  :pattern (($FVF.perm_val (as pm@26@01  $FPM) r))
  :qid |qp.resPrmSumDef7|)))
; Assume upper permission bound for field val
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_val (as pm@26@01  $FPM) r) $Perm.Write)
  :pattern ((inv@12@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_val (as pm@26@01  $FPM) ghost@5@01) $Perm.Write))
; [eval] perm(temp(data).val)
; [eval] temp(data)
(declare-const pm@27@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@27@01  $FPM) r)
    (ite
      (= r ghost@5@01)
      (+
        (+ (as rd<Perm>  $Perm) (- $Perm.Write (rds<Perm> t@9@01)))
        (as rd<Perm>  $Perm))
      $Perm.No))
  :pattern (($FVF.perm_val (as pm@27@01  $FPM) r))
  :qid |qp.resPrmSumDef8|)))
; perm(temp(data).val)  ~~>  assume upper permission bound
(assert (<= ($FVF.perm_val (as pm@27@01  $FPM) (temp<Ref> data@3@01)) $Perm.Write))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (= r ghost@5@01)
      (<
        $Perm.No
        (+
          (+ (as rd<Perm>  $Perm) (- $Perm.Write (rds<Perm> t@9@01)))
          (as rd<Perm>  $Perm)))
      false)
    (= ($FVF.lookup_val (as sm@25@01  $FVF<val>) r) ($FVF.lookup_val $t@24@01 r)))
  :pattern (($FVF.lookup_val (as sm@25@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@24@01 r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@26@01  $FPM) r)
    (ite
      (= r ghost@5@01)
      (+
        (+ (as rd<Perm>  $Perm) (- $Perm.Write (rds<Perm> t@9@01)))
        (as rd<Perm>  $Perm))
      $Perm.No))
  :pattern (($FVF.perm_val (as pm@26@01  $FPM) r))
  :qid |qp.resPrmSumDef7|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@27@01  $FPM) r)
    (ite
      (= r ghost@5@01)
      (+
        (+ (as rd<Perm>  $Perm) (- $Perm.Write (rds<Perm> t@9@01)))
        (as rd<Perm>  $Perm))
      $Perm.No))
  :pattern (($FVF.perm_val (as pm@27@01  $FPM) r))
  :qid |qp.resPrmSumDef8|)))
(assert (=>
  (not
    (<
      (- $Perm.Write (rds<Perm> (+ t@9@01 1)))
      ($FVF.perm_val (as pm@23@01  $FPM) (temp<Ref> data@3@01))))
  (and
    (not
      (<
        (- $Perm.Write (rds<Perm> (+ t@9@01 1)))
        ($FVF.perm_val (as pm@23@01  $FPM) (temp<Ref> data@3@01))))
    (= data@3@01 ghost@5@01)
    (forall ((r $Ref)) (!
      (and
        (=>
          (ite
            (= r ghost@5@01)
            (<
              $Perm.No
              (+ (as rd<Perm>  $Perm) (- $Perm.Write (rds<Perm> t@9@01))))
            false)
          (= ($FVF.lookup_val $t@24@01 r) ($FVF.lookup_val $t@16@01 r)))
        (=>
          (ite (= r data@3@01) (< $Perm.No (as rd<Perm>  $Perm)) false)
          (=
            ($FVF.lookup_val $t@24@01 r)
            ($FVF.lookup_val (as sm@7@01  $FVF<val>) r))))
      :pattern (($FVF.lookup_val $t@16@01 r))
      :pattern (($FVF.lookup_val (as sm@7@01  $FVF<val>) r))
      :pattern (($FVF.lookup_val $t@24@01 r))
      :qid |quant-u-12|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_val (as pm@26@01  $FPM) r) $Perm.Write)
      :pattern ((inv@12@01 r))
      :qid |qp-fld-prm-bnd|))
    (<= ($FVF.perm_val (as pm@26@01  $FPM) ghost@5@01) $Perm.Write)
    (<= ($FVF.perm_val (as pm@27@01  $FPM) (temp<Ref> data@3@01)) $Perm.Write))))
(assert (not
  (<
    (- $Perm.Write (rds<Perm> (+ t@9@01 1)))
    ($FVF.perm_val (as pm@23@01  $FPM) (temp<Ref> data@3@01)))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ghost@5@01 (up<Ref> data@3@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@28@01 ((r $Ref)) $Perm
  (ite
    (= r (up<Ref> data@3@01))
    ($Perm.min
      (ite
        (= r ghost@5@01)
        (+ (as rd<Perm>  $Perm) (- $Perm.Write (rds<Perm> t@9@01)))
        $Perm.No)
      (-
        (- $Perm.Write (rds<Perm> (+ t@9@01 1)))
        ($FVF.perm_val (as pm@27@01  $FPM) (temp<Ref> data@3@01))))
    $Perm.No))
(define-fun pTaken@29@01 ((r $Ref)) $Perm
  (ite
    (= r (up<Ref> data@3@01))
    ($Perm.min
      $Perm.No
      (-
        (-
          (- $Perm.Write (rds<Perm> (+ t@9@01 1)))
          ($FVF.perm_val (as pm@27@01  $FPM) (temp<Ref> data@3@01)))
        (pTaken@28@01 r)))
    $Perm.No))
(define-fun pTaken@30@01 ((r $Ref)) $Perm
  (ite
    (= r (up<Ref> data@3@01))
    ($Perm.min
      (ite (= r data@3@01) (as rd<Perm>  $Perm) $Perm.No)
      (-
        (-
          (-
            (- $Perm.Write (rds<Perm> (+ t@9@01 1)))
            ($FVF.perm_val (as pm@27@01  $FPM) (temp<Ref> data@3@01)))
          (pTaken@28@01 r))
        (pTaken@29@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unsat
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (=
  (-
    (+ (as rd<Perm>  $Perm) (- $Perm.Write (rds<Perm> t@9@01)))
    (pTaken@28@01 ghost@5@01))
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
    (= r (up<Ref> data@3@01))
    (=
      (-
        (-
          (- $Perm.Write (rds<Perm> (+ t@9@01 1)))
          ($FVF.perm_val (as pm@27@01  $FPM) (temp<Ref> data@3@01)))
        (pTaken@28@01 r))
      $Perm.No))
  
  :qid |quant-u-15|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@31@01 $FVF<val>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite
    (= (up<Ref> data@3@01) ghost@5@01)
    (< $Perm.No (+ (as rd<Perm>  $Perm) (- $Perm.Write (rds<Perm> t@9@01))))
    false)
  (=
    ($FVF.lookup_val (as sm@31@01  $FVF<val>) (up<Ref> data@3@01))
    ($FVF.lookup_val $t@16@01 (up<Ref> data@3@01)))))
(assert (=>
  (ite (= (up<Ref> data@3@01) data@3@01) (< $Perm.No (as rd<Perm>  $Perm)) false)
  (=
    ($FVF.lookup_val (as sm@31@01  $FVF<val>) (up<Ref> data@3@01))
    ($FVF.lookup_val (as sm@7@01  $FVF<val>) (up<Ref> data@3@01)))))
(pop) ; 3
; [eval] !(t >= 0)
; [eval] t >= 0
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (>= t@9@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | !(t@9@01 >= 0) | dead]
; [else-branch: 3 | t@9@01 >= 0 | live]
(set-option :timeout 0)
(push) ; 3
; [else-branch: 3 | t@9@01 >= 0]
(assert (>= t@9@01 0))
(pop) ; 3
(pop) ; 2
(pop) ; 1
