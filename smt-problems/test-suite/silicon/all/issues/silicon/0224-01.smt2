(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:52:55
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0224.vpr
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
(declare-fun length<Int> (IArray) Int)
(declare-fun first<IArray> ($Ref) IArray)
(declare-fun second<Int> ($Ref) Int)
; /field_value_functions_declarations.smt2 [val: Int]
(declare-fun $FVF.domain_val ($FVF<val>) Set<$Ref>)
(declare-fun $FVF.lookup_val ($FVF<val> $Ref) Int)
(declare-fun $FVF.after_val ($FVF<val> $FVF<val>) Bool)
(declare-fun $FVF.loc_val (Int $Ref) Bool)
(declare-fun $FVF.perm_val ($FPM $Ref) $Perm)
(declare-const $fvfTOP_val $FVF<val>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun f_loop ($Snap IArray Int Int Int) Int)
(declare-fun f_loop%limited ($Snap IArray Int Int Int) Int)
(declare-fun f_loop%stateless (IArray Int Int Int) Bool)
(declare-fun f_loop%precondition ($Snap IArray Int Int Int) Bool)
(declare-fun f_loop_simpl ($Snap IArray) Int)
(declare-fun f_loop_simpl%limited ($Snap IArray) Int)
(declare-fun f_loop_simpl%stateless (IArray) Bool)
(declare-fun f_loop_simpl%precondition ($Snap IArray) Bool)
(declare-fun f_lcp ($Snap IArray Int Int) Int)
(declare-fun f_lcp%limited ($Snap IArray Int Int) Int)
(declare-fun f_lcp%stateless (IArray Int Int) Bool)
(declare-fun f_lcp%precondition ($Snap IArray Int Int) Bool)
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
(assert (forall ((a IArray) (i Int)) (!
  (and (= (first<IArray> (loc<Ref> a i)) a) (= (second<Int> (loc<Ref> a i)) i))
  :pattern ((loc<Ref> a i))
  :qid |prog.all_diff|)))
(assert (forall ((a IArray)) (!
  (>= (length<Int> a) 0)
  :pattern ((length<Int> a))
  :qid |prog.length_nonneg|)))
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
; ---------- FUNCTION f_loop----------
(declare-fun a@0@00 () IArray)
(declare-fun x@1@00 () Int)
(declare-fun y@2@00 () Int)
(declare-fun n@3@00 () Int)
(declare-fun result@4@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(declare-const k@11@00 Int)
(push) ; 2
; [eval] 0 <= k && k < length(a)
; [eval] 0 <= k
(push) ; 3
; [then-branch: 0 | !(0 <= k@11@00) | live]
; [else-branch: 0 | 0 <= k@11@00 | live]
(push) ; 4
; [then-branch: 0 | !(0 <= k@11@00)]
(assert (not (<= 0 k@11@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | 0 <= k@11@00]
(assert (<= 0 k@11@00))
; [eval] k < length(a)
; [eval] length(a)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@11@00) (not (<= 0 k@11@00))))
(assert (and (<= 0 k@11@00) (< k@11@00 (length<Int> a@0@00))))
; [eval] loc(a, k)
(pop) ; 2
(declare-fun inv@12@00 ($Snap IArray Int Int Int $Ref) Int)
(declare-fun img@13@00 ($Snap IArray Int Int Int $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@11@00 Int)) (!
  (=>
    (and (<= 0 k@11@00) (< k@11@00 (length<Int> a@0@00)))
    (or (<= 0 k@11@00) (not (<= 0 k@11@00))))
  :pattern ((loc<Ref> a@0@00 k@11@00))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((k1@11@00 Int) (k2@11@00 Int)) (!
  (=>
    (and
      (and (<= 0 k1@11@00) (< k1@11@00 (length<Int> a@0@00)))
      (and (<= 0 k2@11@00) (< k2@11@00 (length<Int> a@0@00)))
      (= (loc<Ref> a@0@00 k1@11@00) (loc<Ref> a@0@00 k2@11@00)))
    (= k1@11@00 k2@11@00))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@11@00 Int)) (!
  (=>
    (and (<= 0 k@11@00) (< k@11@00 (length<Int> a@0@00)))
    (and
      (=
        (inv@12@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 (loc<Ref> a@0@00 k@11@00))
        k@11@00)
      (img@13@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 (loc<Ref> a@0@00 k@11@00))))
  :pattern ((loc<Ref> a@0@00 k@11@00))
  :qid |quant-u-7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r)
      (and
        (<= 0 (inv@12@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r))
        (< (inv@12@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r) (length<Int> a@0@00))))
    (= (loc<Ref> a@0@00 (inv@12@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r)) r))
  :pattern ((inv@12@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((k@11@00 Int)) (!
  (=>
    (and (<= 0 k@11@00) (< k@11@00 (length<Int> a@0@00)))
    (not (= (loc<Ref> a@0@00 k@11@00) $Ref.null)))
  :pattern ((loc<Ref> a@0@00 k@11@00))
  :qid |val-permImpliesNonNull|)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
; [eval] 0 <= x
(assert (<= 0 x@1@00))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] x < length(a)
; [eval] length(a)
(assert (< x@1@00 (length<Int> a@0@00)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit))
; [eval] 0 <= y
(assert (<= 0 y@2@00))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  $Snap.unit))
; [eval] y < length(a)
; [eval] length(a)
(assert (< y@2@00 (length<Int> a@0@00)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  $Snap.unit))
; [eval] 0 <= n
(assert (<= 0 n@3@00))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
  $Snap.unit))
; [eval] x + n <= length(a)
; [eval] x + n
; [eval] length(a)
(assert (<= (+ x@1@00 n@3@00) (length<Int> a@0@00)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
  $Snap.unit))
; [eval] y + n <= length(a)
; [eval] y + n
; [eval] length(a)
(assert (<= (+ y@2@00 n@3@00) (length<Int> a@0@00)))
(declare-const $t@14@00 $Snap)
(assert (= $t@14@00 ($Snap.combine ($Snap.first $t@14@00) ($Snap.second $t@14@00))))
(assert (= ($Snap.first $t@14@00) $Snap.unit))
; [eval] 0 <= result
(assert (<= 0 result@4@00))
(assert (=
  ($Snap.second $t@14@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@14@00))
    ($Snap.second ($Snap.second $t@14@00)))))
(assert (= ($Snap.first ($Snap.second $t@14@00)) $Snap.unit))
; [eval] x + result <= length(a)
; [eval] x + result
; [eval] length(a)
(assert (<= (+ x@1@00 result@4@00) (length<Int> a@0@00)))
(assert (=
  ($Snap.second ($Snap.second $t@14@00))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@14@00)))
    ($Snap.second ($Snap.second ($Snap.second $t@14@00))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@14@00))) $Snap.unit))
; [eval] y + result <= length(a)
; [eval] y + result
; [eval] length(a)
(assert (<= (+ y@2@00 result@4@00) (length<Int> a@0@00)))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@14@00))) $Snap.unit))
; [eval] x + result < length(a) && y + result < length(a) ==> loc(a, x + result).val != loc(a, y + result).val
; [eval] x + result < length(a) && y + result < length(a)
; [eval] x + result < length(a)
; [eval] x + result
; [eval] length(a)
(push) ; 2
; [then-branch: 1 | !(x@1@00 + result@4@00 < length[Int](a@0@00)) | live]
; [else-branch: 1 | x@1@00 + result@4@00 < length[Int](a@0@00) | live]
(push) ; 3
; [then-branch: 1 | !(x@1@00 + result@4@00 < length[Int](a@0@00))]
(assert (not (< (+ x@1@00 result@4@00) (length<Int> a@0@00))))
(pop) ; 3
(push) ; 3
; [else-branch: 1 | x@1@00 + result@4@00 < length[Int](a@0@00)]
(assert (< (+ x@1@00 result@4@00) (length<Int> a@0@00)))
; [eval] y + result < length(a)
; [eval] y + result
; [eval] length(a)
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or
  (< (+ x@1@00 result@4@00) (length<Int> a@0@00))
  (not (< (+ x@1@00 result@4@00) (length<Int> a@0@00)))))
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (and
    (< (+ x@1@00 result@4@00) (length<Int> a@0@00))
    (< (+ y@2@00 result@4@00) (length<Int> a@0@00))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (< (+ x@1@00 result@4@00) (length<Int> a@0@00))
  (< (+ y@2@00 result@4@00) (length<Int> a@0@00)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | x@1@00 + result@4@00 < length[Int](a@0@00) && y@2@00 + result@4@00 < length[Int](a@0@00) | live]
; [else-branch: 2 | !(x@1@00 + result@4@00 < length[Int](a@0@00) && y@2@00 + result@4@00 < length[Int](a@0@00)) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 2 | x@1@00 + result@4@00 < length[Int](a@0@00) && y@2@00 + result@4@00 < length[Int](a@0@00)]
(assert (and
  (< (+ x@1@00 result@4@00) (length<Int> a@0@00))
  (< (+ y@2@00 result@4@00) (length<Int> a@0@00))))
; [eval] loc(a, x + result).val != loc(a, y + result).val
; [eval] loc(a, x + result)
; [eval] x + result
(push) ; 4
(assert (not (and
  (img@13@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 (loc<Ref> a@0@00 (+
    x@1@00
    result@4@00)))
  (and
    (<=
      0
      (inv@12@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 (loc<Ref> a@0@00 (+
        x@1@00
        result@4@00))))
    (<
      (inv@12@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 (loc<Ref> a@0@00 (+
        x@1@00
        result@4@00)))
      (length<Int> a@0@00))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] loc(a, y + result)
; [eval] y + result
(push) ; 4
(assert (not (and
  (img@13@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 (loc<Ref> a@0@00 (+
    y@2@00
    result@4@00)))
  (and
    (<=
      0
      (inv@12@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 (loc<Ref> a@0@00 (+
        y@2@00
        result@4@00))))
    (<
      (inv@12@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 (loc<Ref> a@0@00 (+
        y@2@00
        result@4@00)))
      (length<Int> a@0@00))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(push) ; 3
; [else-branch: 2 | !(x@1@00 + result@4@00 < length[Int](a@0@00) && y@2@00 + result@4@00 < length[Int](a@0@00))]
(assert (not
  (and
    (< (+ x@1@00 result@4@00) (length<Int> a@0@00))
    (< (+ y@2@00 result@4@00) (length<Int> a@0@00)))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (and
      (< (+ x@1@00 result@4@00) (length<Int> a@0@00))
      (< (+ y@2@00 result@4@00) (length<Int> a@0@00))))
  (and
    (< (+ x@1@00 result@4@00) (length<Int> a@0@00))
    (< (+ y@2@00 result@4@00) (length<Int> a@0@00)))))
(assert (=>
  (and
    (< (+ x@1@00 result@4@00) (length<Int> a@0@00))
    (< (+ y@2@00 result@4@00) (length<Int> a@0@00)))
  (not
    (=
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) (loc<Ref> a@0@00 (+
        x@1@00
        result@4@00)))
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) (loc<Ref> a@0@00 (+
        y@2@00
        result@4@00)))))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (a@0@00 IArray) (x@1@00 Int) (y@2@00 Int) (n@3@00 Int)) (!
  (=
    (f_loop%limited s@$ a@0@00 x@1@00 y@2@00 n@3@00)
    (f_loop s@$ a@0@00 x@1@00 y@2@00 n@3@00))
  :pattern ((f_loop s@$ a@0@00 x@1@00 y@2@00 n@3@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (a@0@00 IArray) (x@1@00 Int) (y@2@00 Int) (n@3@00 Int)) (!
  (f_loop%stateless a@0@00 x@1@00 y@2@00 n@3@00)
  :pattern ((f_loop%limited s@$ a@0@00 x@1@00 y@2@00 n@3@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (a@0@00 IArray) (x@1@00 Int) (y@2@00 Int) (n@3@00 Int)) (!
  (let ((result@4@00 (f_loop%limited s@$ a@0@00 x@1@00 y@2@00 n@3@00))) (and
    (forall ((k@11@00 Int)) (!
      (=>
        (and (<= 0 k@11@00) (< k@11@00 (length<Int> a@0@00)))
        (and
          (=
            (inv@12@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 (loc<Ref> a@0@00 k@11@00))
            k@11@00)
          (img@13@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 (loc<Ref> a@0@00 k@11@00))))
      :pattern ((loc<Ref> a@0@00 k@11@00))
      :qid |quant-u-7|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@13@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r)
          (and
            (<= 0 (inv@12@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r))
            (<
              (inv@12@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r)
              (length<Int> a@0@00))))
        (= (loc<Ref> a@0@00 (inv@12@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r)) r))
      :pattern ((inv@12@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r))
      :qid |val-fctOfInv|))
    (=>
      (f_loop%precondition s@$ a@0@00 x@1@00 y@2@00 n@3@00)
      (and
        (and
          (<= 0 result@4@00)
          (and
            (<= (+ x@1@00 result@4@00) (length<Int> a@0@00))
            (<= (+ y@2@00 result@4@00) (length<Int> a@0@00))))
        (=>
          (and
            (< (+ x@1@00 result@4@00) (length<Int> a@0@00))
            (< (+ y@2@00 result@4@00) (length<Int> a@0@00)))
          (not
            (=
              ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) (loc<Ref> a@0@00 (+
                x@1@00
                result@4@00)))
              ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) (loc<Ref> a@0@00 (+
                y@2@00
                result@4@00))))))))))
  :pattern ((f_loop%limited s@$ a@0@00 x@1@00 y@2@00 n@3@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (a@0@00 IArray) (x@1@00 Int) (y@2@00 Int) (n@3@00 Int)) (!
  (let ((result@4@00 (f_loop%limited s@$ a@0@00 x@1@00 y@2@00 n@3@00))) true)
  :pattern ((f_loop%limited s@$ a@0@00 x@1@00 y@2@00 n@3@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (a@0@00 IArray) (x@1@00 Int) (y@2@00 Int) (n@3@00 Int)) (!
  (let ((result@4@00 (f_loop%limited s@$ a@0@00 x@1@00 y@2@00 n@3@00))) true)
  :pattern ((f_loop%limited s@$ a@0@00 x@1@00 y@2@00 n@3@00))
  :qid |quant-u-10|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r)
      (and
        (<= 0 (inv@12@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r))
        (< (inv@12@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r) (length<Int> a@0@00))))
    (= (loc<Ref> a@0@00 (inv@12@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r)) r))
  :pattern ((inv@12@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r))
  :qid |val-fctOfInv|)))
(assert (forall ((k@11@00 Int)) (!
  (=>
    (and (<= 0 k@11@00) (< k@11@00 (length<Int> a@0@00)))
    (and
      (=
        (inv@12@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 (loc<Ref> a@0@00 k@11@00))
        k@11@00)
      (img@13@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 (loc<Ref> a@0@00 k@11@00))))
  :pattern ((loc<Ref> a@0@00 k@11@00))
  :qid |quant-u-7|)))
(assert (forall ((k@11@00 Int)) (!
  (=>
    (and (<= 0 k@11@00) (< k@11@00 (length<Int> a@0@00)))
    (not (= (loc<Ref> a@0@00 k@11@00) $Ref.null)))
  :pattern ((loc<Ref> a@0@00 k@11@00))
  :qid |val-permImpliesNonNull|)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
(assert (<= 0 x@1@00))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
(assert (< x@1@00 (length<Int> a@0@00)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit))
(assert (<= 0 y@2@00))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  $Snap.unit))
(assert (< y@2@00 (length<Int> a@0@00)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  $Snap.unit))
(assert (<= 0 n@3@00))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
  $Snap.unit))
(assert (<= (+ x@1@00 n@3@00) (length<Int> a@0@00)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
  $Snap.unit))
(assert (<= (+ y@2@00 n@3@00) (length<Int> a@0@00)))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (forall ((k@11@00 Int)) (!
  (=>
    (and (<= 0 k@11@00) (< k@11@00 (length<Int> a@0@00)))
    (or (<= 0 k@11@00) (not (<= 0 k@11@00))))
  :pattern ((loc<Ref> a@0@00 k@11@00))
  :qid |val-aux|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (x + n < length(a) && (y + n < length(a) && loc(a, x + n).val == loc(a, y + n).val) ? f_loop(a, x, y, n + 1) : n)
; [eval] x + n < length(a) && (y + n < length(a) && loc(a, x + n).val == loc(a, y + n).val)
; [eval] x + n < length(a)
; [eval] x + n
; [eval] length(a)
(set-option :timeout 0)
(push) ; 2
; [then-branch: 3 | !(x@1@00 + n@3@00 < length[Int](a@0@00)) | live]
; [else-branch: 3 | x@1@00 + n@3@00 < length[Int](a@0@00) | live]
(push) ; 3
; [then-branch: 3 | !(x@1@00 + n@3@00 < length[Int](a@0@00))]
(assert (not (< (+ x@1@00 n@3@00) (length<Int> a@0@00))))
(pop) ; 3
(push) ; 3
; [else-branch: 3 | x@1@00 + n@3@00 < length[Int](a@0@00)]
(assert (< (+ x@1@00 n@3@00) (length<Int> a@0@00)))
; [eval] y + n < length(a)
; [eval] y + n
; [eval] length(a)
(push) ; 4
; [then-branch: 4 | !(y@2@00 + n@3@00 < length[Int](a@0@00)) | live]
; [else-branch: 4 | y@2@00 + n@3@00 < length[Int](a@0@00) | live]
(push) ; 5
; [then-branch: 4 | !(y@2@00 + n@3@00 < length[Int](a@0@00))]
(assert (not (< (+ y@2@00 n@3@00) (length<Int> a@0@00))))
(pop) ; 5
(push) ; 5
; [else-branch: 4 | y@2@00 + n@3@00 < length[Int](a@0@00)]
(assert (< (+ y@2@00 n@3@00) (length<Int> a@0@00)))
; [eval] loc(a, x + n).val == loc(a, y + n).val
; [eval] loc(a, x + n)
; [eval] x + n
(push) ; 6
(assert (not (and
  (img@13@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 (loc<Ref> a@0@00 (+ x@1@00 n@3@00)))
  (and
    (<=
      0
      (inv@12@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 (loc<Ref> a@0@00 (+
        x@1@00
        n@3@00))))
    (<
      (inv@12@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 (loc<Ref> a@0@00 (+
        x@1@00
        n@3@00)))
      (length<Int> a@0@00))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] loc(a, y + n)
; [eval] y + n
(push) ; 6
(assert (not (and
  (img@13@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 (loc<Ref> a@0@00 (+ y@2@00 n@3@00)))
  (and
    (<=
      0
      (inv@12@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 (loc<Ref> a@0@00 (+
        y@2@00
        n@3@00))))
    (<
      (inv@12@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 (loc<Ref> a@0@00 (+
        y@2@00
        n@3@00)))
      (length<Int> a@0@00))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (< (+ y@2@00 n@3@00) (length<Int> a@0@00))
  (not (< (+ y@2@00 n@3@00) (length<Int> a@0@00)))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=>
  (< (+ x@1@00 n@3@00) (length<Int> a@0@00))
  (and
    (< (+ x@1@00 n@3@00) (length<Int> a@0@00))
    (or
      (< (+ y@2@00 n@3@00) (length<Int> a@0@00))
      (not (< (+ y@2@00 n@3@00) (length<Int> a@0@00)))))))
(assert (or
  (< (+ x@1@00 n@3@00) (length<Int> a@0@00))
  (not (< (+ x@1@00 n@3@00) (length<Int> a@0@00)))))
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (and
    (< (+ x@1@00 n@3@00) (length<Int> a@0@00))
    (and
      (< (+ y@2@00 n@3@00) (length<Int> a@0@00))
      (=
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) (loc<Ref> a@0@00 (+
          x@1@00
          n@3@00)))
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) (loc<Ref> a@0@00 (+
          y@2@00
          n@3@00)))))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (< (+ x@1@00 n@3@00) (length<Int> a@0@00))
  (and
    (< (+ y@2@00 n@3@00) (length<Int> a@0@00))
    (=
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) (loc<Ref> a@0@00 (+
        x@1@00
        n@3@00)))
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) (loc<Ref> a@0@00 (+
        y@2@00
        n@3@00))))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | x@1@00 + n@3@00 < length[Int](a@0@00) && y@2@00 + n@3@00 < length[Int](a@0@00) && Lookup(val, First:(s@$), loc[Ref](a@0@00, x@1@00 + n@3@00)) == Lookup(val, First:(s@$), loc[Ref](a@0@00, y@2@00 + n@3@00)) | live]
; [else-branch: 5 | !(x@1@00 + n@3@00 < length[Int](a@0@00) && y@2@00 + n@3@00 < length[Int](a@0@00) && Lookup(val, First:(s@$), loc[Ref](a@0@00, x@1@00 + n@3@00)) == Lookup(val, First:(s@$), loc[Ref](a@0@00, y@2@00 + n@3@00))) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 5 | x@1@00 + n@3@00 < length[Int](a@0@00) && y@2@00 + n@3@00 < length[Int](a@0@00) && Lookup(val, First:(s@$), loc[Ref](a@0@00, x@1@00 + n@3@00)) == Lookup(val, First:(s@$), loc[Ref](a@0@00, y@2@00 + n@3@00))]
(assert (and
  (< (+ x@1@00 n@3@00) (length<Int> a@0@00))
  (and
    (< (+ y@2@00 n@3@00) (length<Int> a@0@00))
    (=
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) (loc<Ref> a@0@00 (+
        x@1@00
        n@3@00)))
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) (loc<Ref> a@0@00 (+
        y@2@00
        n@3@00)))))))
; [eval] f_loop(a, x, y, n + 1)
; [eval] n + 1
(push) ; 4
(declare-const k@15@00 Int)
(push) ; 5
; [eval] 0 <= k && k < length(a)
; [eval] 0 <= k
(push) ; 6
; [then-branch: 6 | !(0 <= k@15@00) | live]
; [else-branch: 6 | 0 <= k@15@00 | live]
(push) ; 7
; [then-branch: 6 | !(0 <= k@15@00)]
(assert (not (<= 0 k@15@00)))
(pop) ; 7
(push) ; 7
; [else-branch: 6 | 0 <= k@15@00]
(assert (<= 0 k@15@00))
; [eval] k < length(a)
; [eval] length(a)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@15@00) (not (<= 0 k@15@00))))
(assert (and (<= 0 k@15@00) (< k@15@00 (length<Int> a@0@00))))
; [eval] loc(a, k)
(pop) ; 5
(declare-fun inv@16@00 ($Snap IArray Int Int Int $Ref) Int)
(declare-fun img@17@00 ($Snap IArray Int Int Int $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@15@00 Int)) (!
  (=>
    (and (<= 0 k@15@00) (< k@15@00 (length<Int> a@0@00)))
    (or (<= 0 k@15@00) (not (<= 0 k@15@00))))
  :pattern ((loc<Ref> a@0@00 k@15@00))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((k1@15@00 Int) (k2@15@00 Int)) (!
  (=>
    (and
      (and (<= 0 k1@15@00) (< k1@15@00 (length<Int> a@0@00)))
      (and (<= 0 k2@15@00) (< k2@15@00 (length<Int> a@0@00)))
      (= (loc<Ref> a@0@00 k1@15@00) (loc<Ref> a@0@00 k2@15@00)))
    (= k1@15@00 k2@15@00))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@15@00 Int)) (!
  (=>
    (and (<= 0 k@15@00) (< k@15@00 (length<Int> a@0@00)))
    (and
      (=
        (inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 (loc<Ref> a@0@00 k@15@00))
        k@15@00)
      (img@17@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 (loc<Ref> a@0@00 k@15@00))))
  :pattern ((loc<Ref> a@0@00 k@15@00))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@17@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r)
      (and
        (<= 0 (inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r))
        (< (inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r) (length<Int> a@0@00))))
    (= (loc<Ref> a@0@00 (inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r)) r))
  :pattern ((inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r))
  :qid |val-fctOfInv|)))
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
          (img@13@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r)
          (and
            (<= 0 (inv@12@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r))
            (<
              (inv@12@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r)
              (length<Int> a@0@00))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (and
            (<= 0 (inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r))
            (<
              (inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r)
              (length<Int> a@0@00)))
          (img@17@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r)
          (= r (loc<Ref> a@0@00 (inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r))))
        ($Perm.min
          (ite
            (and
              (img@13@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r)
              (and
                (<= 0 (inv@12@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r))
                (<
                  (inv@12@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r)
                  (length<Int> a@0@00))))
            $Perm.Write
            $Perm.No)
          $Perm.Write)
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-13|))))
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
        (<= 0 (inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r))
        (< (inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r) (length<Int> a@0@00)))
      (img@17@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r)
      (= r (loc<Ref> a@0@00 (inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r))))
    (=
      (-
        $Perm.Write
        (ite
          (and
            (and
              (<= 0 (inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r))
              (<
                (inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r)
                (length<Int> a@0@00)))
            (img@17@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r)
            (= r (loc<Ref> a@0@00 (inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r))))
          ($Perm.min
            (ite
              (and
                (img@13@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r)
                (and
                  (<= 0 (inv@12@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r))
                  (<
                    (inv@12@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r)
                    (length<Int> a@0@00))))
              $Perm.Write
              $Perm.No)
            $Perm.Write)
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-14|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@18@00 ($Snap IArray Int Int Int) $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (sm@18@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00)))
      (and
        (and
          (<= 0 (inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r))
          (< (inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r) (length<Int> a@0@00)))
        (img@17@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r)))
    (=>
      (and
        (and
          (<= 0 (inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r))
          (< (inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r) (length<Int> a@0@00)))
        (img@17@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r))
      (Set_in r ($FVF.domain_val (sm@18@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00)))))
  :pattern ((Set_in r ($FVF.domain_val (sm@18@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00))))
  :qid |qp.fvfDomDef1|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and
          (<= 0 (inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r))
          (< (inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r) (length<Int> a@0@00)))
        (img@17@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r))
      (and
        (img@13@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r)
        (and
          (<= 0 (inv@12@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r))
          (< (inv@12@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r) (length<Int> a@0@00)))))
    (=
      ($FVF.lookup_val (sm@18@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_val (sm@18@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef0|)))
; [eval] 0 <= x
; [eval] x < length(a)
; [eval] length(a)
; [eval] 0 <= y
; [eval] y < length(a)
; [eval] length(a)
; [eval] 0 <= n
(set-option :timeout 0)
(push) ; 5
(assert (not (<= 0 (+ n@3@00 1))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 (+ n@3@00 1)))
; [eval] x + n <= length(a)
; [eval] x + n
; [eval] length(a)
(push) ; 5
(assert (not (<= (+ x@1@00 (+ n@3@00 1)) (length<Int> a@0@00))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (<= (+ x@1@00 (+ n@3@00 1)) (length<Int> a@0@00)))
; [eval] y + n <= length(a)
; [eval] y + n
; [eval] length(a)
(push) ; 5
(assert (not (<= (+ y@2@00 (+ n@3@00 1)) (length<Int> a@0@00))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (<= (+ y@2@00 (+ n@3@00 1)) (length<Int> a@0@00)))
(assert (f_loop%precondition ($Snap.combine
  ($SortWrappers.$FVF<val>To$Snap (sm@18@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00))
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))))) a@0@00 x@1@00 y@2@00 (+
  n@3@00
  1)))
(pop) ; 4
; Joined path conditions
(assert (forall ((k@15@00 Int)) (!
  (=>
    (and (<= 0 k@15@00) (< k@15@00 (length<Int> a@0@00)))
    (and
      (=
        (inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 (loc<Ref> a@0@00 k@15@00))
        k@15@00)
      (img@17@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 (loc<Ref> a@0@00 k@15@00))))
  :pattern ((loc<Ref> a@0@00 k@15@00))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@17@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r)
      (and
        (<= 0 (inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r))
        (< (inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r) (length<Int> a@0@00))))
    (= (loc<Ref> a@0@00 (inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r)) r))
  :pattern ((inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (sm@18@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00)))
      (and
        (and
          (<= 0 (inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r))
          (< (inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r) (length<Int> a@0@00)))
        (img@17@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r)))
    (=>
      (and
        (and
          (<= 0 (inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r))
          (< (inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r) (length<Int> a@0@00)))
        (img@17@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r))
      (Set_in r ($FVF.domain_val (sm@18@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00)))))
  :pattern ((Set_in r ($FVF.domain_val (sm@18@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00))))
  :qid |qp.fvfDomDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and
          (<= 0 (inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r))
          (< (inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r) (length<Int> a@0@00)))
        (img@17@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r))
      (and
        (img@13@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r)
        (and
          (<= 0 (inv@12@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r))
          (< (inv@12@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r) (length<Int> a@0@00)))))
    (=
      ($FVF.lookup_val (sm@18@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_val (sm@18@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef0|)))
(assert (and
  (forall ((k@15@00 Int)) (!
    (=>
      (and (<= 0 k@15@00) (< k@15@00 (length<Int> a@0@00)))
      (or (<= 0 k@15@00) (not (<= 0 k@15@00))))
    :pattern ((loc<Ref> a@0@00 k@15@00))
    :qid |val-aux|))
  (<= 0 (+ n@3@00 1))
  (<= (+ x@1@00 (+ n@3@00 1)) (length<Int> a@0@00))
  (<= (+ y@2@00 (+ n@3@00 1)) (length<Int> a@0@00))
  (f_loop%precondition ($Snap.combine
    ($SortWrappers.$FVF<val>To$Snap (sm@18@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00))
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))))) a@0@00 x@1@00 y@2@00 (+
    n@3@00
    1))))
(pop) ; 3
(push) ; 3
; [else-branch: 5 | !(x@1@00 + n@3@00 < length[Int](a@0@00) && y@2@00 + n@3@00 < length[Int](a@0@00) && Lookup(val, First:(s@$), loc[Ref](a@0@00, x@1@00 + n@3@00)) == Lookup(val, First:(s@$), loc[Ref](a@0@00, y@2@00 + n@3@00)))]
(assert (not
  (and
    (< (+ x@1@00 n@3@00) (length<Int> a@0@00))
    (and
      (< (+ y@2@00 n@3@00) (length<Int> a@0@00))
      (=
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) (loc<Ref> a@0@00 (+
          x@1@00
          n@3@00)))
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) (loc<Ref> a@0@00 (+
          y@2@00
          n@3@00))))))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (forall ((k@15@00 Int)) (!
  (=>
    (and (<= 0 k@15@00) (< k@15@00 (length<Int> a@0@00)))
    (and
      (=
        (inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 (loc<Ref> a@0@00 k@15@00))
        k@15@00)
      (img@17@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 (loc<Ref> a@0@00 k@15@00))))
  :pattern ((loc<Ref> a@0@00 k@15@00))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@17@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r)
      (and
        (<= 0 (inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r))
        (< (inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r) (length<Int> a@0@00))))
    (= (loc<Ref> a@0@00 (inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r)) r))
  :pattern ((inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (sm@18@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00)))
      (and
        (and
          (<= 0 (inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r))
          (< (inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r) (length<Int> a@0@00)))
        (img@17@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r)))
    (=>
      (and
        (and
          (<= 0 (inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r))
          (< (inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r) (length<Int> a@0@00)))
        (img@17@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r))
      (Set_in r ($FVF.domain_val (sm@18@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00)))))
  :pattern ((Set_in r ($FVF.domain_val (sm@18@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00))))
  :qid |qp.fvfDomDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and
          (<= 0 (inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r))
          (< (inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r) (length<Int> a@0@00)))
        (img@17@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r))
      (and
        (img@13@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r)
        (and
          (<= 0 (inv@12@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r))
          (< (inv@12@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r) (length<Int> a@0@00)))))
    (=
      ($FVF.lookup_val (sm@18@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_val (sm@18@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef0|)))
(assert (=>
  (and
    (< (+ x@1@00 n@3@00) (length<Int> a@0@00))
    (and
      (< (+ y@2@00 n@3@00) (length<Int> a@0@00))
      (=
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) (loc<Ref> a@0@00 (+
          x@1@00
          n@3@00)))
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) (loc<Ref> a@0@00 (+
          y@2@00
          n@3@00))))))
  (and
    (< (+ x@1@00 n@3@00) (length<Int> a@0@00))
    (< (+ y@2@00 n@3@00) (length<Int> a@0@00))
    (=
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) (loc<Ref> a@0@00 (+
        x@1@00
        n@3@00)))
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) (loc<Ref> a@0@00 (+
        y@2@00
        n@3@00))))
    (forall ((k@15@00 Int)) (!
      (=>
        (and (<= 0 k@15@00) (< k@15@00 (length<Int> a@0@00)))
        (or (<= 0 k@15@00) (not (<= 0 k@15@00))))
      :pattern ((loc<Ref> a@0@00 k@15@00))
      :qid |val-aux|))
    (<= 0 (+ n@3@00 1))
    (<= (+ x@1@00 (+ n@3@00 1)) (length<Int> a@0@00))
    (<= (+ y@2@00 (+ n@3@00 1)) (length<Int> a@0@00))
    (f_loop%precondition ($Snap.combine
      ($SortWrappers.$FVF<val>To$Snap (sm@18@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00))
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))))) a@0@00 x@1@00 y@2@00 (+
      n@3@00
      1)))))
; Joined path conditions
(assert (or
  (not
    (and
      (< (+ x@1@00 n@3@00) (length<Int> a@0@00))
      (and
        (< (+ y@2@00 n@3@00) (length<Int> a@0@00))
        (=
          ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) (loc<Ref> a@0@00 (+
            x@1@00
            n@3@00)))
          ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) (loc<Ref> a@0@00 (+
            y@2@00
            n@3@00)))))))
  (and
    (< (+ x@1@00 n@3@00) (length<Int> a@0@00))
    (and
      (< (+ y@2@00 n@3@00) (length<Int> a@0@00))
      (=
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) (loc<Ref> a@0@00 (+
          x@1@00
          n@3@00)))
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) (loc<Ref> a@0@00 (+
          y@2@00
          n@3@00))))))))
(assert (=
  result@4@00
  (ite
    (and
      (< (+ x@1@00 n@3@00) (length<Int> a@0@00))
      (and
        (< (+ y@2@00 n@3@00) (length<Int> a@0@00))
        (=
          ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) (loc<Ref> a@0@00 (+
            x@1@00
            n@3@00)))
          ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) (loc<Ref> a@0@00 (+
            y@2@00
            n@3@00))))))
    (f_loop ($Snap.combine
      ($SortWrappers.$FVF<val>To$Snap (sm@18@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00))
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))))) a@0@00 x@1@00 y@2@00 (+
      n@3@00
      1))
    n@3@00)))
; [eval] 0 <= result
(push) ; 2
(assert (not (<= 0 result@4@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 result@4@00))
; [eval] x + result <= length(a)
; [eval] x + result
; [eval] length(a)
(push) ; 2
(assert (not (<= (+ x@1@00 result@4@00) (length<Int> a@0@00))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (<= (+ x@1@00 result@4@00) (length<Int> a@0@00)))
; [eval] y + result <= length(a)
; [eval] y + result
; [eval] length(a)
(push) ; 2
(assert (not (<= (+ y@2@00 result@4@00) (length<Int> a@0@00))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (<= (+ y@2@00 result@4@00) (length<Int> a@0@00)))
; [eval] x + result < length(a) && y + result < length(a) ==> loc(a, x + result).val != loc(a, y + result).val
; [eval] x + result < length(a) && y + result < length(a)
; [eval] x + result < length(a)
; [eval] x + result
; [eval] length(a)
(push) ; 2
; [then-branch: 7 | !(x@1@00 + result@4@00 < length[Int](a@0@00)) | live]
; [else-branch: 7 | x@1@00 + result@4@00 < length[Int](a@0@00) | live]
(push) ; 3
; [then-branch: 7 | !(x@1@00 + result@4@00 < length[Int](a@0@00))]
(assert (not (< (+ x@1@00 result@4@00) (length<Int> a@0@00))))
(pop) ; 3
(push) ; 3
; [else-branch: 7 | x@1@00 + result@4@00 < length[Int](a@0@00)]
(assert (< (+ x@1@00 result@4@00) (length<Int> a@0@00)))
; [eval] y + result < length(a)
; [eval] y + result
; [eval] length(a)
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or
  (< (+ x@1@00 result@4@00) (length<Int> a@0@00))
  (not (< (+ x@1@00 result@4@00) (length<Int> a@0@00)))))
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (and
    (< (+ x@1@00 result@4@00) (length<Int> a@0@00))
    (< (+ y@2@00 result@4@00) (length<Int> a@0@00))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (< (+ x@1@00 result@4@00) (length<Int> a@0@00))
  (< (+ y@2@00 result@4@00) (length<Int> a@0@00)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | x@1@00 + result@4@00 < length[Int](a@0@00) && y@2@00 + result@4@00 < length[Int](a@0@00) | live]
; [else-branch: 8 | !(x@1@00 + result@4@00 < length[Int](a@0@00) && y@2@00 + result@4@00 < length[Int](a@0@00)) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 8 | x@1@00 + result@4@00 < length[Int](a@0@00) && y@2@00 + result@4@00 < length[Int](a@0@00)]
(assert (and
  (< (+ x@1@00 result@4@00) (length<Int> a@0@00))
  (< (+ y@2@00 result@4@00) (length<Int> a@0@00))))
; [eval] loc(a, x + result).val != loc(a, y + result).val
; [eval] loc(a, x + result)
; [eval] x + result
(push) ; 4
(assert (not (and
  (img@13@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 (loc<Ref> a@0@00 (+
    x@1@00
    result@4@00)))
  (and
    (<=
      0
      (inv@12@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 (loc<Ref> a@0@00 (+
        x@1@00
        result@4@00))))
    (<
      (inv@12@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 (loc<Ref> a@0@00 (+
        x@1@00
        result@4@00)))
      (length<Int> a@0@00))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] loc(a, y + result)
; [eval] y + result
(push) ; 4
(assert (not (and
  (img@13@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 (loc<Ref> a@0@00 (+
    y@2@00
    result@4@00)))
  (and
    (<=
      0
      (inv@12@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 (loc<Ref> a@0@00 (+
        y@2@00
        result@4@00))))
    (<
      (inv@12@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 (loc<Ref> a@0@00 (+
        y@2@00
        result@4@00)))
      (length<Int> a@0@00))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(push) ; 3
; [else-branch: 8 | !(x@1@00 + result@4@00 < length[Int](a@0@00) && y@2@00 + result@4@00 < length[Int](a@0@00))]
(assert (not
  (and
    (< (+ x@1@00 result@4@00) (length<Int> a@0@00))
    (< (+ y@2@00 result@4@00) (length<Int> a@0@00)))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (and
      (< (+ x@1@00 result@4@00) (length<Int> a@0@00))
      (< (+ y@2@00 result@4@00) (length<Int> a@0@00))))
  (and
    (< (+ x@1@00 result@4@00) (length<Int> a@0@00))
    (< (+ y@2@00 result@4@00) (length<Int> a@0@00)))))
(push) ; 2
(assert (not (=>
  (and
    (< (+ x@1@00 result@4@00) (length<Int> a@0@00))
    (< (+ y@2@00 result@4@00) (length<Int> a@0@00)))
  (not
    (=
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) (loc<Ref> a@0@00 (+
        x@1@00
        result@4@00)))
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) (loc<Ref> a@0@00 (+
        y@2@00
        result@4@00))))))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (and
    (< (+ x@1@00 result@4@00) (length<Int> a@0@00))
    (< (+ y@2@00 result@4@00) (length<Int> a@0@00)))
  (not
    (=
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) (loc<Ref> a@0@00 (+
        x@1@00
        result@4@00)))
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) (loc<Ref> a@0@00 (+
        y@2@00
        result@4@00)))))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (a@0@00 IArray) (x@1@00 Int) (y@2@00 Int) (n@3@00 Int)) (!
  (and
    (forall ((k@11@00 Int)) (!
      (=>
        (and (<= 0 k@11@00) (< k@11@00 (length<Int> a@0@00)))
        (and
          (=
            (inv@12@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 (loc<Ref> a@0@00 k@11@00))
            k@11@00)
          (img@13@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 (loc<Ref> a@0@00 k@11@00))))
      :pattern ((loc<Ref> a@0@00 k@11@00))
      :qid |quant-u-7|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@13@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r)
          (and
            (<= 0 (inv@12@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r))
            (<
              (inv@12@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r)
              (length<Int> a@0@00))))
        (= (loc<Ref> a@0@00 (inv@12@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r)) r))
      :pattern ((inv@12@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r))
      :qid |val-fctOfInv|))
    (forall ((k@15@00 Int)) (!
      (=>
        (and (<= 0 k@15@00) (< k@15@00 (length<Int> a@0@00)))
        (and
          (=
            (inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 (loc<Ref> a@0@00 k@15@00))
            k@15@00)
          (img@17@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 (loc<Ref> a@0@00 k@15@00))))
      :pattern ((loc<Ref> a@0@00 k@15@00))
      :qid |val-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@17@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r)
          (and
            (<= 0 (inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r))
            (<
              (inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r)
              (length<Int> a@0@00))))
        (= (loc<Ref> a@0@00 (inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r)) r))
      :pattern ((inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r))
      :qid |val-fctOfInv|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_val (sm@18@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00)))
          (and
            (and
              (<= 0 (inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r))
              (<
                (inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r)
                (length<Int> a@0@00)))
            (img@17@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r)))
        (=>
          (and
            (and
              (<= 0 (inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r))
              (<
                (inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r)
                (length<Int> a@0@00)))
            (img@17@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r))
          (Set_in r ($FVF.domain_val (sm@18@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00)))))
      :pattern ((Set_in r ($FVF.domain_val (sm@18@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00))))
      :qid |qp.fvfDomDef1|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (and
              (<= 0 (inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r))
              (<
                (inv@16@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r)
                (length<Int> a@0@00)))
            (img@17@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r))
          (and
            (img@13@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r)
            (and
              (<= 0 (inv@12@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r))
              (<
                (inv@12@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00 r)
                (length<Int> a@0@00)))))
        (=
          ($FVF.lookup_val (sm@18@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00) r)
          ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) r)))
      :pattern (($FVF.lookup_val (sm@18@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00) r))
      :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) r))
      :qid |qp.fvfValDef0|))
    (=>
      (f_loop%precondition s@$ a@0@00 x@1@00 y@2@00 n@3@00)
      (=
        (f_loop s@$ a@0@00 x@1@00 y@2@00 n@3@00)
        (ite
          (and
            (< (+ x@1@00 n@3@00) (length<Int> a@0@00))
            (and
              (< (+ y@2@00 n@3@00) (length<Int> a@0@00))
              (=
                ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) (loc<Ref> a@0@00 (+
                  x@1@00
                  n@3@00)))
                ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) (loc<Ref> a@0@00 (+
                  y@2@00
                  n@3@00))))))
          (f_loop%limited ($Snap.combine
            ($SortWrappers.$FVF<val>To$Snap (sm@18@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00))
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine $Snap.unit $Snap.unit))))))) a@0@00 x@1@00 y@2@00 (+
            n@3@00
            1))
          n@3@00))))
  :pattern ((f_loop s@$ a@0@00 x@1@00 y@2@00 n@3@00))
  :qid |quant-u-15|)))
(assert (forall ((s@$ $Snap) (a@0@00 IArray) (x@1@00 Int) (y@2@00 Int) (n@3@00 Int)) (!
  (=>
    (f_loop%precondition s@$ a@0@00 x@1@00 y@2@00 n@3@00)
    (ite
      (and
        (< (+ x@1@00 n@3@00) (length<Int> a@0@00))
        (and
          (< (+ y@2@00 n@3@00) (length<Int> a@0@00))
          (=
            ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) (loc<Ref> a@0@00 (+
              x@1@00
              n@3@00)))
            ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) (loc<Ref> a@0@00 (+
              y@2@00
              n@3@00))))))
      (f_loop%precondition ($Snap.combine
        ($SortWrappers.$FVF<val>To$Snap (sm@18@00 s@$ a@0@00 x@1@00 y@2@00 n@3@00))
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))))) a@0@00 x@1@00 y@2@00 (+
        n@3@00
        1))
      true))
  :pattern ((f_loop s@$ a@0@00 x@1@00 y@2@00 n@3@00))
  :qid |quant-u-16|)))
; ---------- FUNCTION f_loop_simpl----------
(declare-fun a@5@00 () IArray)
(declare-fun result@6@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const k@19@00 Int)
(push) ; 2
; [eval] 0 <= k && k < length(a)
; [eval] 0 <= k
(push) ; 3
; [then-branch: 9 | !(0 <= k@19@00) | live]
; [else-branch: 9 | 0 <= k@19@00 | live]
(push) ; 4
; [then-branch: 9 | !(0 <= k@19@00)]
(assert (not (<= 0 k@19@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 9 | 0 <= k@19@00]
(assert (<= 0 k@19@00))
; [eval] k < length(a)
; [eval] length(a)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@19@00) (not (<= 0 k@19@00))))
(assert (and (<= 0 k@19@00) (< k@19@00 (length<Int> a@5@00))))
; [eval] loc(a, k)
(pop) ; 2
(declare-fun inv@20@00 ($Snap IArray $Ref) Int)
(declare-fun img@21@00 ($Snap IArray $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@19@00 Int)) (!
  (=>
    (and (<= 0 k@19@00) (< k@19@00 (length<Int> a@5@00)))
    (or (<= 0 k@19@00) (not (<= 0 k@19@00))))
  :pattern ((loc<Ref> a@5@00 k@19@00))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((k1@19@00 Int) (k2@19@00 Int)) (!
  (=>
    (and
      (and (<= 0 k1@19@00) (< k1@19@00 (length<Int> a@5@00)))
      (and (<= 0 k2@19@00) (< k2@19@00 (length<Int> a@5@00)))
      (= (loc<Ref> a@5@00 k1@19@00) (loc<Ref> a@5@00 k2@19@00)))
    (= k1@19@00 k2@19@00))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@19@00 Int)) (!
  (=>
    (and (<= 0 k@19@00) (< k@19@00 (length<Int> a@5@00)))
    (and
      (= (inv@20@00 s@$ a@5@00 (loc<Ref> a@5@00 k@19@00)) k@19@00)
      (img@21@00 s@$ a@5@00 (loc<Ref> a@5@00 k@19@00))))
  :pattern ((loc<Ref> a@5@00 k@19@00))
  :qid |quant-u-18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@21@00 s@$ a@5@00 r)
      (and
        (<= 0 (inv@20@00 s@$ a@5@00 r))
        (< (inv@20@00 s@$ a@5@00 r) (length<Int> a@5@00))))
    (= (loc<Ref> a@5@00 (inv@20@00 s@$ a@5@00 r)) r))
  :pattern ((inv@20@00 s@$ a@5@00 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((k@19@00 Int)) (!
  (=>
    (and (<= 0 k@19@00) (< k@19@00 (length<Int> a@5@00)))
    (not (= (loc<Ref> a@5@00 k@19@00) $Ref.null)))
  :pattern ((loc<Ref> a@5@00 k@19@00))
  :qid |val-permImpliesNonNull|)))
(declare-const $t@22@00 $Snap)
(assert (= $t@22@00 ($Snap.combine ($Snap.first $t@22@00) ($Snap.second $t@22@00))))
(assert (= ($Snap.first $t@22@00) $Snap.unit))
; [eval] 0 < result
(assert (< 0 result@6@00))
(assert (=
  ($Snap.second $t@22@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@22@00))
    ($Snap.second ($Snap.second $t@22@00)))))
(assert (= ($Snap.first ($Snap.second $t@22@00)) $Snap.unit))
; [eval] result < length(a)
; [eval] length(a)
(assert (< result@6@00 (length<Int> a@5@00)))
(assert (= ($Snap.second ($Snap.second $t@22@00)) $Snap.unit))
; [eval] loc(a, result).val != 0
; [eval] loc(a, result)
(push) ; 2
(assert (not (and
  (img@21@00 s@$ a@5@00 (loc<Ref> a@5@00 result@6@00))
  (and
    (<= 0 (inv@20@00 s@$ a@5@00 (loc<Ref> a@5@00 result@6@00)))
    (< (inv@20@00 s@$ a@5@00 (loc<Ref> a@5@00 result@6@00)) (length<Int> a@5@00))))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> s@$) (loc<Ref> a@5@00 result@6@00))
    0)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (a@5@00 IArray)) (!
  (= (f_loop_simpl%limited s@$ a@5@00) (f_loop_simpl s@$ a@5@00))
  :pattern ((f_loop_simpl s@$ a@5@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (a@5@00 IArray)) (!
  (f_loop_simpl%stateless a@5@00)
  :pattern ((f_loop_simpl%limited s@$ a@5@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (a@5@00 IArray)) (!
  (let ((result@6@00 (f_loop_simpl%limited s@$ a@5@00))) (and
    (forall ((k@19@00 Int)) (!
      (=>
        (and (<= 0 k@19@00) (< k@19@00 (length<Int> a@5@00)))
        (and
          (= (inv@20@00 s@$ a@5@00 (loc<Ref> a@5@00 k@19@00)) k@19@00)
          (img@21@00 s@$ a@5@00 (loc<Ref> a@5@00 k@19@00))))
      :pattern ((loc<Ref> a@5@00 k@19@00))
      :qid |quant-u-18|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@21@00 s@$ a@5@00 r)
          (and
            (<= 0 (inv@20@00 s@$ a@5@00 r))
            (< (inv@20@00 s@$ a@5@00 r) (length<Int> a@5@00))))
        (= (loc<Ref> a@5@00 (inv@20@00 s@$ a@5@00 r)) r))
      :pattern ((inv@20@00 s@$ a@5@00 r))
      :qid |val-fctOfInv|))
    (=>
      (f_loop_simpl%precondition s@$ a@5@00)
      (and
        (< 0 result@6@00)
        (and
          (< result@6@00 (length<Int> a@5@00))
          (not
            (=
              ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> s@$) (loc<Ref> a@5@00 result@6@00))
              0)))))))
  :pattern ((f_loop_simpl%limited s@$ a@5@00))
  :qid |quant-u-19|)))
(assert (forall ((s@$ $Snap) (a@5@00 IArray)) (!
  (let ((result@6@00 (f_loop_simpl%limited s@$ a@5@00))) true)
  :pattern ((f_loop_simpl%limited s@$ a@5@00))
  :qid |quant-u-20|)))
; ---------- FUNCTION f_lcp----------
(declare-fun a@7@00 () IArray)
(declare-fun x@8@00 () Int)
(declare-fun y@9@00 () Int)
(declare-fun result@10@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(declare-const k@23@00 Int)
(push) ; 2
; [eval] 0 <= k && k < length(a)
; [eval] 0 <= k
(push) ; 3
; [then-branch: 10 | !(0 <= k@23@00) | live]
; [else-branch: 10 | 0 <= k@23@00 | live]
(push) ; 4
; [then-branch: 10 | !(0 <= k@23@00)]
(assert (not (<= 0 k@23@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 10 | 0 <= k@23@00]
(assert (<= 0 k@23@00))
; [eval] k < length(a)
; [eval] length(a)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@23@00) (not (<= 0 k@23@00))))
(assert (and (<= 0 k@23@00) (< k@23@00 (length<Int> a@7@00))))
; [eval] loc(a, k)
(pop) ; 2
(declare-fun inv@24@00 ($Snap IArray Int Int $Ref) Int)
(declare-fun img@25@00 ($Snap IArray Int Int $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@23@00 Int)) (!
  (=>
    (and (<= 0 k@23@00) (< k@23@00 (length<Int> a@7@00)))
    (or (<= 0 k@23@00) (not (<= 0 k@23@00))))
  :pattern ((loc<Ref> a@7@00 k@23@00))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((k1@23@00 Int) (k2@23@00 Int)) (!
  (=>
    (and
      (and (<= 0 k1@23@00) (< k1@23@00 (length<Int> a@7@00)))
      (and (<= 0 k2@23@00) (< k2@23@00 (length<Int> a@7@00)))
      (= (loc<Ref> a@7@00 k1@23@00) (loc<Ref> a@7@00 k2@23@00)))
    (= k1@23@00 k2@23@00))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@23@00 Int)) (!
  (=>
    (and (<= 0 k@23@00) (< k@23@00 (length<Int> a@7@00)))
    (and
      (= (inv@24@00 s@$ a@7@00 x@8@00 y@9@00 (loc<Ref> a@7@00 k@23@00)) k@23@00)
      (img@25@00 s@$ a@7@00 x@8@00 y@9@00 (loc<Ref> a@7@00 k@23@00))))
  :pattern ((loc<Ref> a@7@00 k@23@00))
  :qid |quant-u-22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@25@00 s@$ a@7@00 x@8@00 y@9@00 r)
      (and
        (<= 0 (inv@24@00 s@$ a@7@00 x@8@00 y@9@00 r))
        (< (inv@24@00 s@$ a@7@00 x@8@00 y@9@00 r) (length<Int> a@7@00))))
    (= (loc<Ref> a@7@00 (inv@24@00 s@$ a@7@00 x@8@00 y@9@00 r)) r))
  :pattern ((inv@24@00 s@$ a@7@00 x@8@00 y@9@00 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((k@23@00 Int)) (!
  (=>
    (and (<= 0 k@23@00) (< k@23@00 (length<Int> a@7@00)))
    (not (= (loc<Ref> a@7@00 k@23@00) $Ref.null)))
  :pattern ((loc<Ref> a@7@00 k@23@00))
  :qid |val-permImpliesNonNull|)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
; [eval] 0 <= x
(assert (<= 0 x@8@00))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] x < length(a)
; [eval] length(a)
(assert (< x@8@00 (length<Int> a@7@00)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit))
; [eval] 0 <= y
(assert (<= 0 y@9@00))
(assert (= ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit))
; [eval] y < length(a)
; [eval] length(a)
(assert (< y@9@00 (length<Int> a@7@00)))
(declare-const $t@26@00 $Snap)
(assert (= $t@26@00 ($Snap.combine ($Snap.first $t@26@00) ($Snap.second $t@26@00))))
(assert (= ($Snap.first $t@26@00) $Snap.unit))
; [eval] 0 <= result
(assert (<= 0 result@10@00))
(assert (=
  ($Snap.second $t@26@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@26@00))
    ($Snap.second ($Snap.second $t@26@00)))))
(assert (= ($Snap.first ($Snap.second $t@26@00)) $Snap.unit))
; [eval] x + result <= length(a)
; [eval] x + result
; [eval] length(a)
(assert (<= (+ x@8@00 result@10@00) (length<Int> a@7@00)))
(assert (=
  ($Snap.second ($Snap.second $t@26@00))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@26@00)))
    ($Snap.second ($Snap.second ($Snap.second $t@26@00))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@26@00))) $Snap.unit))
; [eval] y + result <= length(a)
; [eval] y + result
; [eval] length(a)
(assert (<= (+ y@9@00 result@10@00) (length<Int> a@7@00)))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@26@00))) $Snap.unit))
; [eval] x + result < length(a) && y + result < length(a) ==> loc(a, x + result).val != loc(a, y + result).val
; [eval] x + result < length(a) && y + result < length(a)
; [eval] x + result < length(a)
; [eval] x + result
; [eval] length(a)
(push) ; 2
; [then-branch: 11 | !(x@8@00 + result@10@00 < length[Int](a@7@00)) | live]
; [else-branch: 11 | x@8@00 + result@10@00 < length[Int](a@7@00) | live]
(push) ; 3
; [then-branch: 11 | !(x@8@00 + result@10@00 < length[Int](a@7@00))]
(assert (not (< (+ x@8@00 result@10@00) (length<Int> a@7@00))))
(pop) ; 3
(push) ; 3
; [else-branch: 11 | x@8@00 + result@10@00 < length[Int](a@7@00)]
(assert (< (+ x@8@00 result@10@00) (length<Int> a@7@00)))
; [eval] y + result < length(a)
; [eval] y + result
; [eval] length(a)
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or
  (< (+ x@8@00 result@10@00) (length<Int> a@7@00))
  (not (< (+ x@8@00 result@10@00) (length<Int> a@7@00)))))
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (and
    (< (+ x@8@00 result@10@00) (length<Int> a@7@00))
    (< (+ y@9@00 result@10@00) (length<Int> a@7@00))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (< (+ x@8@00 result@10@00) (length<Int> a@7@00))
  (< (+ y@9@00 result@10@00) (length<Int> a@7@00)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | x@8@00 + result@10@00 < length[Int](a@7@00) && y@9@00 + result@10@00 < length[Int](a@7@00) | live]
; [else-branch: 12 | !(x@8@00 + result@10@00 < length[Int](a@7@00) && y@9@00 + result@10@00 < length[Int](a@7@00)) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 12 | x@8@00 + result@10@00 < length[Int](a@7@00) && y@9@00 + result@10@00 < length[Int](a@7@00)]
(assert (and
  (< (+ x@8@00 result@10@00) (length<Int> a@7@00))
  (< (+ y@9@00 result@10@00) (length<Int> a@7@00))))
; [eval] loc(a, x + result).val != loc(a, y + result).val
; [eval] loc(a, x + result)
; [eval] x + result
(push) ; 4
(assert (not (and
  (img@25@00 s@$ a@7@00 x@8@00 y@9@00 (loc<Ref> a@7@00 (+ x@8@00 result@10@00)))
  (and
    (<=
      0
      (inv@24@00 s@$ a@7@00 x@8@00 y@9@00 (loc<Ref> a@7@00 (+
        x@8@00
        result@10@00))))
    (<
      (inv@24@00 s@$ a@7@00 x@8@00 y@9@00 (loc<Ref> a@7@00 (+
        x@8@00
        result@10@00)))
      (length<Int> a@7@00))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] loc(a, y + result)
; [eval] y + result
(push) ; 4
(assert (not (and
  (img@25@00 s@$ a@7@00 x@8@00 y@9@00 (loc<Ref> a@7@00 (+ y@9@00 result@10@00)))
  (and
    (<=
      0
      (inv@24@00 s@$ a@7@00 x@8@00 y@9@00 (loc<Ref> a@7@00 (+
        y@9@00
        result@10@00))))
    (<
      (inv@24@00 s@$ a@7@00 x@8@00 y@9@00 (loc<Ref> a@7@00 (+
        y@9@00
        result@10@00)))
      (length<Int> a@7@00))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(push) ; 3
; [else-branch: 12 | !(x@8@00 + result@10@00 < length[Int](a@7@00) && y@9@00 + result@10@00 < length[Int](a@7@00))]
(assert (not
  (and
    (< (+ x@8@00 result@10@00) (length<Int> a@7@00))
    (< (+ y@9@00 result@10@00) (length<Int> a@7@00)))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (and
      (< (+ x@8@00 result@10@00) (length<Int> a@7@00))
      (< (+ y@9@00 result@10@00) (length<Int> a@7@00))))
  (and
    (< (+ x@8@00 result@10@00) (length<Int> a@7@00))
    (< (+ y@9@00 result@10@00) (length<Int> a@7@00)))))
(assert (=>
  (and
    (< (+ x@8@00 result@10@00) (length<Int> a@7@00))
    (< (+ y@9@00 result@10@00) (length<Int> a@7@00)))
  (not
    (=
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) (loc<Ref> a@7@00 (+
        x@8@00
        result@10@00)))
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) (loc<Ref> a@7@00 (+
        y@9@00
        result@10@00)))))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (a@7@00 IArray) (x@8@00 Int) (y@9@00 Int)) (!
  (= (f_lcp%limited s@$ a@7@00 x@8@00 y@9@00) (f_lcp s@$ a@7@00 x@8@00 y@9@00))
  :pattern ((f_lcp s@$ a@7@00 x@8@00 y@9@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (a@7@00 IArray) (x@8@00 Int) (y@9@00 Int)) (!
  (f_lcp%stateless a@7@00 x@8@00 y@9@00)
  :pattern ((f_lcp%limited s@$ a@7@00 x@8@00 y@9@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (a@7@00 IArray) (x@8@00 Int) (y@9@00 Int)) (!
  (let ((result@10@00 (f_lcp%limited s@$ a@7@00 x@8@00 y@9@00))) (and
    (forall ((k@23@00 Int)) (!
      (=>
        (and (<= 0 k@23@00) (< k@23@00 (length<Int> a@7@00)))
        (and
          (=
            (inv@24@00 s@$ a@7@00 x@8@00 y@9@00 (loc<Ref> a@7@00 k@23@00))
            k@23@00)
          (img@25@00 s@$ a@7@00 x@8@00 y@9@00 (loc<Ref> a@7@00 k@23@00))))
      :pattern ((loc<Ref> a@7@00 k@23@00))
      :qid |quant-u-22|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@25@00 s@$ a@7@00 x@8@00 y@9@00 r)
          (and
            (<= 0 (inv@24@00 s@$ a@7@00 x@8@00 y@9@00 r))
            (< (inv@24@00 s@$ a@7@00 x@8@00 y@9@00 r) (length<Int> a@7@00))))
        (= (loc<Ref> a@7@00 (inv@24@00 s@$ a@7@00 x@8@00 y@9@00 r)) r))
      :pattern ((inv@24@00 s@$ a@7@00 x@8@00 y@9@00 r))
      :qid |val-fctOfInv|))
    (=>
      (f_lcp%precondition s@$ a@7@00 x@8@00 y@9@00)
      (and
        (and
          (<= 0 result@10@00)
          (and
            (<= (+ x@8@00 result@10@00) (length<Int> a@7@00))
            (<= (+ y@9@00 result@10@00) (length<Int> a@7@00))))
        (=>
          (and
            (< (+ x@8@00 result@10@00) (length<Int> a@7@00))
            (< (+ y@9@00 result@10@00) (length<Int> a@7@00)))
          (not
            (=
              ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) (loc<Ref> a@7@00 (+
                x@8@00
                result@10@00)))
              ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) (loc<Ref> a@7@00 (+
                y@9@00
                result@10@00))))))))))
  :pattern ((f_lcp%limited s@$ a@7@00 x@8@00 y@9@00))
  :qid |quant-u-23|)))
(assert (forall ((s@$ $Snap) (a@7@00 IArray) (x@8@00 Int) (y@9@00 Int)) (!
  (let ((result@10@00 (f_lcp%limited s@$ a@7@00 x@8@00 y@9@00))) true)
  :pattern ((f_lcp%limited s@$ a@7@00 x@8@00 y@9@00))
  :qid |quant-u-24|)))
(assert (forall ((s@$ $Snap) (a@7@00 IArray) (x@8@00 Int) (y@9@00 Int)) (!
  (let ((result@10@00 (f_lcp%limited s@$ a@7@00 x@8@00 y@9@00))) true)
  :pattern ((f_lcp%limited s@$ a@7@00 x@8@00 y@9@00))
  :qid |quant-u-25|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@25@00 s@$ a@7@00 x@8@00 y@9@00 r)
      (and
        (<= 0 (inv@24@00 s@$ a@7@00 x@8@00 y@9@00 r))
        (< (inv@24@00 s@$ a@7@00 x@8@00 y@9@00 r) (length<Int> a@7@00))))
    (= (loc<Ref> a@7@00 (inv@24@00 s@$ a@7@00 x@8@00 y@9@00 r)) r))
  :pattern ((inv@24@00 s@$ a@7@00 x@8@00 y@9@00 r))
  :qid |val-fctOfInv|)))
(assert (forall ((k@23@00 Int)) (!
  (=>
    (and (<= 0 k@23@00) (< k@23@00 (length<Int> a@7@00)))
    (and
      (= (inv@24@00 s@$ a@7@00 x@8@00 y@9@00 (loc<Ref> a@7@00 k@23@00)) k@23@00)
      (img@25@00 s@$ a@7@00 x@8@00 y@9@00 (loc<Ref> a@7@00 k@23@00))))
  :pattern ((loc<Ref> a@7@00 k@23@00))
  :qid |quant-u-22|)))
(assert (forall ((k@23@00 Int)) (!
  (=>
    (and (<= 0 k@23@00) (< k@23@00 (length<Int> a@7@00)))
    (not (= (loc<Ref> a@7@00 k@23@00) $Ref.null)))
  :pattern ((loc<Ref> a@7@00 k@23@00))
  :qid |val-permImpliesNonNull|)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
(assert (<= 0 x@8@00))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
(assert (< x@8@00 (length<Int> a@7@00)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit))
(assert (<= 0 y@9@00))
(assert (= ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit))
(assert (< y@9@00 (length<Int> a@7@00)))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (forall ((k@23@00 Int)) (!
  (=>
    (and (<= 0 k@23@00) (< k@23@00 (length<Int> a@7@00)))
    (or (<= 0 k@23@00) (not (<= 0 k@23@00))))
  :pattern ((loc<Ref> a@7@00 k@23@00))
  :qid |val-aux|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] f_loop(a, x, y, 0)
(set-option :timeout 0)
(push) ; 2
(declare-const k@27@00 Int)
(push) ; 3
; [eval] 0 <= k && k < length(a)
; [eval] 0 <= k
(push) ; 4
; [then-branch: 13 | !(0 <= k@27@00) | live]
; [else-branch: 13 | 0 <= k@27@00 | live]
(push) ; 5
; [then-branch: 13 | !(0 <= k@27@00)]
(assert (not (<= 0 k@27@00)))
(pop) ; 5
(push) ; 5
; [else-branch: 13 | 0 <= k@27@00]
(assert (<= 0 k@27@00))
; [eval] k < length(a)
; [eval] length(a)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@27@00) (not (<= 0 k@27@00))))
(assert (and (<= 0 k@27@00) (< k@27@00 (length<Int> a@7@00))))
; [eval] loc(a, k)
(pop) ; 3
(declare-fun inv@28@00 ($Snap IArray Int Int $Ref) Int)
(declare-fun img@29@00 ($Snap IArray Int Int $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@27@00 Int)) (!
  (=>
    (and (<= 0 k@27@00) (< k@27@00 (length<Int> a@7@00)))
    (or (<= 0 k@27@00) (not (<= 0 k@27@00))))
  :pattern ((loc<Ref> a@7@00 k@27@00))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((k1@27@00 Int) (k2@27@00 Int)) (!
  (=>
    (and
      (and (<= 0 k1@27@00) (< k1@27@00 (length<Int> a@7@00)))
      (and (<= 0 k2@27@00) (< k2@27@00 (length<Int> a@7@00)))
      (= (loc<Ref> a@7@00 k1@27@00) (loc<Ref> a@7@00 k2@27@00)))
    (= k1@27@00 k2@27@00))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@27@00 Int)) (!
  (=>
    (and (<= 0 k@27@00) (< k@27@00 (length<Int> a@7@00)))
    (and
      (= (inv@28@00 s@$ a@7@00 x@8@00 y@9@00 (loc<Ref> a@7@00 k@27@00)) k@27@00)
      (img@29@00 s@$ a@7@00 x@8@00 y@9@00 (loc<Ref> a@7@00 k@27@00))))
  :pattern ((loc<Ref> a@7@00 k@27@00))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@29@00 s@$ a@7@00 x@8@00 y@9@00 r)
      (and
        (<= 0 (inv@28@00 s@$ a@7@00 x@8@00 y@9@00 r))
        (< (inv@28@00 s@$ a@7@00 x@8@00 y@9@00 r) (length<Int> a@7@00))))
    (= (loc<Ref> a@7@00 (inv@28@00 s@$ a@7@00 x@8@00 y@9@00 r)) r))
  :pattern ((inv@28@00 s@$ a@7@00 x@8@00 y@9@00 r))
  :qid |val-fctOfInv|)))
; Precomputing data for removing quantified permissions
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
          (img@25@00 s@$ a@7@00 x@8@00 y@9@00 r)
          (and
            (<= 0 (inv@24@00 s@$ a@7@00 x@8@00 y@9@00 r))
            (< (inv@24@00 s@$ a@7@00 x@8@00 y@9@00 r) (length<Int> a@7@00))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (and
            (<= 0 (inv@28@00 s@$ a@7@00 x@8@00 y@9@00 r))
            (< (inv@28@00 s@$ a@7@00 x@8@00 y@9@00 r) (length<Int> a@7@00)))
          (img@29@00 s@$ a@7@00 x@8@00 y@9@00 r)
          (= r (loc<Ref> a@7@00 (inv@28@00 s@$ a@7@00 x@8@00 y@9@00 r))))
        ($Perm.min
          (ite
            (and
              (img@25@00 s@$ a@7@00 x@8@00 y@9@00 r)
              (and
                (<= 0 (inv@24@00 s@$ a@7@00 x@8@00 y@9@00 r))
                (< (inv@24@00 s@$ a@7@00 x@8@00 y@9@00 r) (length<Int> a@7@00))))
            $Perm.Write
            $Perm.No)
          $Perm.Write)
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-28|))))
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
      (and
        (<= 0 (inv@28@00 s@$ a@7@00 x@8@00 y@9@00 r))
        (< (inv@28@00 s@$ a@7@00 x@8@00 y@9@00 r) (length<Int> a@7@00)))
      (img@29@00 s@$ a@7@00 x@8@00 y@9@00 r)
      (= r (loc<Ref> a@7@00 (inv@28@00 s@$ a@7@00 x@8@00 y@9@00 r))))
    (=
      (-
        $Perm.Write
        (ite
          (and
            (and
              (<= 0 (inv@28@00 s@$ a@7@00 x@8@00 y@9@00 r))
              (< (inv@28@00 s@$ a@7@00 x@8@00 y@9@00 r) (length<Int> a@7@00)))
            (img@29@00 s@$ a@7@00 x@8@00 y@9@00 r)
            (= r (loc<Ref> a@7@00 (inv@28@00 s@$ a@7@00 x@8@00 y@9@00 r))))
          ($Perm.min
            (ite
              (and
                (img@25@00 s@$ a@7@00 x@8@00 y@9@00 r)
                (and
                  (<= 0 (inv@24@00 s@$ a@7@00 x@8@00 y@9@00 r))
                  (< (inv@24@00 s@$ a@7@00 x@8@00 y@9@00 r) (length<Int> a@7@00))))
              $Perm.Write
              $Perm.No)
            $Perm.Write)
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-29|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@30@00 ($Snap IArray Int Int) $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (sm@30@00 s@$ a@7@00 x@8@00 y@9@00)))
      (and
        (and
          (<= 0 (inv@28@00 s@$ a@7@00 x@8@00 y@9@00 r))
          (< (inv@28@00 s@$ a@7@00 x@8@00 y@9@00 r) (length<Int> a@7@00)))
        (img@29@00 s@$ a@7@00 x@8@00 y@9@00 r)))
    (=>
      (and
        (and
          (<= 0 (inv@28@00 s@$ a@7@00 x@8@00 y@9@00 r))
          (< (inv@28@00 s@$ a@7@00 x@8@00 y@9@00 r) (length<Int> a@7@00)))
        (img@29@00 s@$ a@7@00 x@8@00 y@9@00 r))
      (Set_in r ($FVF.domain_val (sm@30@00 s@$ a@7@00 x@8@00 y@9@00)))))
  :pattern ((Set_in r ($FVF.domain_val (sm@30@00 s@$ a@7@00 x@8@00 y@9@00))))
  :qid |qp.fvfDomDef3|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and
          (<= 0 (inv@28@00 s@$ a@7@00 x@8@00 y@9@00 r))
          (< (inv@28@00 s@$ a@7@00 x@8@00 y@9@00 r) (length<Int> a@7@00)))
        (img@29@00 s@$ a@7@00 x@8@00 y@9@00 r))
      (and
        (img@25@00 s@$ a@7@00 x@8@00 y@9@00 r)
        (and
          (<= 0 (inv@24@00 s@$ a@7@00 x@8@00 y@9@00 r))
          (< (inv@24@00 s@$ a@7@00 x@8@00 y@9@00 r) (length<Int> a@7@00)))))
    (=
      ($FVF.lookup_val (sm@30@00 s@$ a@7@00 x@8@00 y@9@00) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_val (sm@30@00 s@$ a@7@00 x@8@00 y@9@00) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef2|)))
; [eval] 0 <= x
; [eval] x < length(a)
; [eval] length(a)
; [eval] 0 <= y
; [eval] y < length(a)
; [eval] length(a)
; [eval] 0 <= n
; [eval] x + n <= length(a)
; [eval] x + n
; [eval] length(a)
(set-option :timeout 0)
(push) ; 3
(assert (not (<= x@8@00 (length<Int> a@7@00))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<= x@8@00 (length<Int> a@7@00)))
; [eval] y + n <= length(a)
; [eval] y + n
; [eval] length(a)
(push) ; 3
(assert (not (<= y@9@00 (length<Int> a@7@00))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<= y@9@00 (length<Int> a@7@00)))
(assert (f_loop%precondition ($Snap.combine
  ($SortWrappers.$FVF<val>To$Snap (sm@30@00 s@$ a@7@00 x@8@00 y@9@00))
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))))) a@7@00 x@8@00 y@9@00 0))
(pop) ; 2
; Joined path conditions
(assert (forall ((k@27@00 Int)) (!
  (=>
    (and (<= 0 k@27@00) (< k@27@00 (length<Int> a@7@00)))
    (and
      (= (inv@28@00 s@$ a@7@00 x@8@00 y@9@00 (loc<Ref> a@7@00 k@27@00)) k@27@00)
      (img@29@00 s@$ a@7@00 x@8@00 y@9@00 (loc<Ref> a@7@00 k@27@00))))
  :pattern ((loc<Ref> a@7@00 k@27@00))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@29@00 s@$ a@7@00 x@8@00 y@9@00 r)
      (and
        (<= 0 (inv@28@00 s@$ a@7@00 x@8@00 y@9@00 r))
        (< (inv@28@00 s@$ a@7@00 x@8@00 y@9@00 r) (length<Int> a@7@00))))
    (= (loc<Ref> a@7@00 (inv@28@00 s@$ a@7@00 x@8@00 y@9@00 r)) r))
  :pattern ((inv@28@00 s@$ a@7@00 x@8@00 y@9@00 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (sm@30@00 s@$ a@7@00 x@8@00 y@9@00)))
      (and
        (and
          (<= 0 (inv@28@00 s@$ a@7@00 x@8@00 y@9@00 r))
          (< (inv@28@00 s@$ a@7@00 x@8@00 y@9@00 r) (length<Int> a@7@00)))
        (img@29@00 s@$ a@7@00 x@8@00 y@9@00 r)))
    (=>
      (and
        (and
          (<= 0 (inv@28@00 s@$ a@7@00 x@8@00 y@9@00 r))
          (< (inv@28@00 s@$ a@7@00 x@8@00 y@9@00 r) (length<Int> a@7@00)))
        (img@29@00 s@$ a@7@00 x@8@00 y@9@00 r))
      (Set_in r ($FVF.domain_val (sm@30@00 s@$ a@7@00 x@8@00 y@9@00)))))
  :pattern ((Set_in r ($FVF.domain_val (sm@30@00 s@$ a@7@00 x@8@00 y@9@00))))
  :qid |qp.fvfDomDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and
          (<= 0 (inv@28@00 s@$ a@7@00 x@8@00 y@9@00 r))
          (< (inv@28@00 s@$ a@7@00 x@8@00 y@9@00 r) (length<Int> a@7@00)))
        (img@29@00 s@$ a@7@00 x@8@00 y@9@00 r))
      (and
        (img@25@00 s@$ a@7@00 x@8@00 y@9@00 r)
        (and
          (<= 0 (inv@24@00 s@$ a@7@00 x@8@00 y@9@00 r))
          (< (inv@24@00 s@$ a@7@00 x@8@00 y@9@00 r) (length<Int> a@7@00)))))
    (=
      ($FVF.lookup_val (sm@30@00 s@$ a@7@00 x@8@00 y@9@00) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_val (sm@30@00 s@$ a@7@00 x@8@00 y@9@00) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef2|)))
(assert (and
  (forall ((k@27@00 Int)) (!
    (=>
      (and (<= 0 k@27@00) (< k@27@00 (length<Int> a@7@00)))
      (or (<= 0 k@27@00) (not (<= 0 k@27@00))))
    :pattern ((loc<Ref> a@7@00 k@27@00))
    :qid |val-aux|))
  (<= x@8@00 (length<Int> a@7@00))
  (<= y@9@00 (length<Int> a@7@00))
  (f_loop%precondition ($Snap.combine
    ($SortWrappers.$FVF<val>To$Snap (sm@30@00 s@$ a@7@00 x@8@00 y@9@00))
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))))) a@7@00 x@8@00 y@9@00 0)))
(assert (=
  result@10@00
  (f_loop ($Snap.combine
    ($SortWrappers.$FVF<val>To$Snap (sm@30@00 s@$ a@7@00 x@8@00 y@9@00))
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))))) a@7@00 x@8@00 y@9@00 0)))
; [eval] 0 <= result
(push) ; 2
(assert (not (<= 0 result@10@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 result@10@00))
; [eval] x + result <= length(a)
; [eval] x + result
; [eval] length(a)
(push) ; 2
(assert (not (<= (+ x@8@00 result@10@00) (length<Int> a@7@00))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (<= (+ x@8@00 result@10@00) (length<Int> a@7@00)))
; [eval] y + result <= length(a)
; [eval] y + result
; [eval] length(a)
(push) ; 2
(assert (not (<= (+ y@9@00 result@10@00) (length<Int> a@7@00))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (<= (+ y@9@00 result@10@00) (length<Int> a@7@00)))
; [eval] x + result < length(a) && y + result < length(a) ==> loc(a, x + result).val != loc(a, y + result).val
; [eval] x + result < length(a) && y + result < length(a)
; [eval] x + result < length(a)
; [eval] x + result
; [eval] length(a)
(push) ; 2
; [then-branch: 14 | !(x@8@00 + result@10@00 < length[Int](a@7@00)) | live]
; [else-branch: 14 | x@8@00 + result@10@00 < length[Int](a@7@00) | live]
(push) ; 3
; [then-branch: 14 | !(x@8@00 + result@10@00 < length[Int](a@7@00))]
(assert (not (< (+ x@8@00 result@10@00) (length<Int> a@7@00))))
(pop) ; 3
(push) ; 3
; [else-branch: 14 | x@8@00 + result@10@00 < length[Int](a@7@00)]
(assert (< (+ x@8@00 result@10@00) (length<Int> a@7@00)))
; [eval] y + result < length(a)
; [eval] y + result
; [eval] length(a)
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or
  (< (+ x@8@00 result@10@00) (length<Int> a@7@00))
  (not (< (+ x@8@00 result@10@00) (length<Int> a@7@00)))))
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (and
    (< (+ x@8@00 result@10@00) (length<Int> a@7@00))
    (< (+ y@9@00 result@10@00) (length<Int> a@7@00))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (< (+ x@8@00 result@10@00) (length<Int> a@7@00))
  (< (+ y@9@00 result@10@00) (length<Int> a@7@00)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 15 | x@8@00 + result@10@00 < length[Int](a@7@00) && y@9@00 + result@10@00 < length[Int](a@7@00) | live]
; [else-branch: 15 | !(x@8@00 + result@10@00 < length[Int](a@7@00) && y@9@00 + result@10@00 < length[Int](a@7@00)) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 15 | x@8@00 + result@10@00 < length[Int](a@7@00) && y@9@00 + result@10@00 < length[Int](a@7@00)]
(assert (and
  (< (+ x@8@00 result@10@00) (length<Int> a@7@00))
  (< (+ y@9@00 result@10@00) (length<Int> a@7@00))))
; [eval] loc(a, x + result).val != loc(a, y + result).val
; [eval] loc(a, x + result)
; [eval] x + result
(push) ; 4
(assert (not (and
  (img@25@00 s@$ a@7@00 x@8@00 y@9@00 (loc<Ref> a@7@00 (+ x@8@00 result@10@00)))
  (and
    (<=
      0
      (inv@24@00 s@$ a@7@00 x@8@00 y@9@00 (loc<Ref> a@7@00 (+
        x@8@00
        result@10@00))))
    (<
      (inv@24@00 s@$ a@7@00 x@8@00 y@9@00 (loc<Ref> a@7@00 (+
        x@8@00
        result@10@00)))
      (length<Int> a@7@00))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] loc(a, y + result)
; [eval] y + result
(push) ; 4
(assert (not (and
  (img@25@00 s@$ a@7@00 x@8@00 y@9@00 (loc<Ref> a@7@00 (+ y@9@00 result@10@00)))
  (and
    (<=
      0
      (inv@24@00 s@$ a@7@00 x@8@00 y@9@00 (loc<Ref> a@7@00 (+
        y@9@00
        result@10@00))))
    (<
      (inv@24@00 s@$ a@7@00 x@8@00 y@9@00 (loc<Ref> a@7@00 (+
        y@9@00
        result@10@00)))
      (length<Int> a@7@00))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(push) ; 3
; [else-branch: 15 | !(x@8@00 + result@10@00 < length[Int](a@7@00) && y@9@00 + result@10@00 < length[Int](a@7@00))]
(assert (not
  (and
    (< (+ x@8@00 result@10@00) (length<Int> a@7@00))
    (< (+ y@9@00 result@10@00) (length<Int> a@7@00)))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (and
      (< (+ x@8@00 result@10@00) (length<Int> a@7@00))
      (< (+ y@9@00 result@10@00) (length<Int> a@7@00))))
  (and
    (< (+ x@8@00 result@10@00) (length<Int> a@7@00))
    (< (+ y@9@00 result@10@00) (length<Int> a@7@00)))))
(push) ; 2
(assert (not (=>
  (and
    (< (+ x@8@00 result@10@00) (length<Int> a@7@00))
    (< (+ y@9@00 result@10@00) (length<Int> a@7@00)))
  (not
    (=
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) (loc<Ref> a@7@00 (+
        x@8@00
        result@10@00)))
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) (loc<Ref> a@7@00 (+
        y@9@00
        result@10@00))))))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (and
    (< (+ x@8@00 result@10@00) (length<Int> a@7@00))
    (< (+ y@9@00 result@10@00) (length<Int> a@7@00)))
  (not
    (=
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) (loc<Ref> a@7@00 (+
        x@8@00
        result@10@00)))
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) (loc<Ref> a@7@00 (+
        y@9@00
        result@10@00)))))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (a@7@00 IArray) (x@8@00 Int) (y@9@00 Int)) (!
  (and
    (forall ((k@23@00 Int)) (!
      (=>
        (and (<= 0 k@23@00) (< k@23@00 (length<Int> a@7@00)))
        (and
          (=
            (inv@24@00 s@$ a@7@00 x@8@00 y@9@00 (loc<Ref> a@7@00 k@23@00))
            k@23@00)
          (img@25@00 s@$ a@7@00 x@8@00 y@9@00 (loc<Ref> a@7@00 k@23@00))))
      :pattern ((loc<Ref> a@7@00 k@23@00))
      :qid |quant-u-22|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@25@00 s@$ a@7@00 x@8@00 y@9@00 r)
          (and
            (<= 0 (inv@24@00 s@$ a@7@00 x@8@00 y@9@00 r))
            (< (inv@24@00 s@$ a@7@00 x@8@00 y@9@00 r) (length<Int> a@7@00))))
        (= (loc<Ref> a@7@00 (inv@24@00 s@$ a@7@00 x@8@00 y@9@00 r)) r))
      :pattern ((inv@24@00 s@$ a@7@00 x@8@00 y@9@00 r))
      :qid |val-fctOfInv|))
    (forall ((k@27@00 Int)) (!
      (=>
        (and (<= 0 k@27@00) (< k@27@00 (length<Int> a@7@00)))
        (and
          (=
            (inv@28@00 s@$ a@7@00 x@8@00 y@9@00 (loc<Ref> a@7@00 k@27@00))
            k@27@00)
          (img@29@00 s@$ a@7@00 x@8@00 y@9@00 (loc<Ref> a@7@00 k@27@00))))
      :pattern ((loc<Ref> a@7@00 k@27@00))
      :qid |val-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@29@00 s@$ a@7@00 x@8@00 y@9@00 r)
          (and
            (<= 0 (inv@28@00 s@$ a@7@00 x@8@00 y@9@00 r))
            (< (inv@28@00 s@$ a@7@00 x@8@00 y@9@00 r) (length<Int> a@7@00))))
        (= (loc<Ref> a@7@00 (inv@28@00 s@$ a@7@00 x@8@00 y@9@00 r)) r))
      :pattern ((inv@28@00 s@$ a@7@00 x@8@00 y@9@00 r))
      :qid |val-fctOfInv|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_val (sm@30@00 s@$ a@7@00 x@8@00 y@9@00)))
          (and
            (and
              (<= 0 (inv@28@00 s@$ a@7@00 x@8@00 y@9@00 r))
              (< (inv@28@00 s@$ a@7@00 x@8@00 y@9@00 r) (length<Int> a@7@00)))
            (img@29@00 s@$ a@7@00 x@8@00 y@9@00 r)))
        (=>
          (and
            (and
              (<= 0 (inv@28@00 s@$ a@7@00 x@8@00 y@9@00 r))
              (< (inv@28@00 s@$ a@7@00 x@8@00 y@9@00 r) (length<Int> a@7@00)))
            (img@29@00 s@$ a@7@00 x@8@00 y@9@00 r))
          (Set_in r ($FVF.domain_val (sm@30@00 s@$ a@7@00 x@8@00 y@9@00)))))
      :pattern ((Set_in r ($FVF.domain_val (sm@30@00 s@$ a@7@00 x@8@00 y@9@00))))
      :qid |qp.fvfDomDef3|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (and
              (<= 0 (inv@28@00 s@$ a@7@00 x@8@00 y@9@00 r))
              (< (inv@28@00 s@$ a@7@00 x@8@00 y@9@00 r) (length<Int> a@7@00)))
            (img@29@00 s@$ a@7@00 x@8@00 y@9@00 r))
          (and
            (img@25@00 s@$ a@7@00 x@8@00 y@9@00 r)
            (and
              (<= 0 (inv@24@00 s@$ a@7@00 x@8@00 y@9@00 r))
              (< (inv@24@00 s@$ a@7@00 x@8@00 y@9@00 r) (length<Int> a@7@00)))))
        (=
          ($FVF.lookup_val (sm@30@00 s@$ a@7@00 x@8@00 y@9@00) r)
          ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) r)))
      :pattern (($FVF.lookup_val (sm@30@00 s@$ a@7@00 x@8@00 y@9@00) r))
      :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first s@$)) r))
      :qid |qp.fvfValDef2|))
    (=>
      (f_lcp%precondition s@$ a@7@00 x@8@00 y@9@00)
      (=
        (f_lcp s@$ a@7@00 x@8@00 y@9@00)
        (f_loop ($Snap.combine
          ($SortWrappers.$FVF<val>To$Snap (sm@30@00 s@$ a@7@00 x@8@00 y@9@00))
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))))))) a@7@00 x@8@00 y@9@00 0))))
  :pattern ((f_lcp s@$ a@7@00 x@8@00 y@9@00))
  :qid |quant-u-30|)))
(assert (forall ((s@$ $Snap) (a@7@00 IArray) (x@8@00 Int) (y@9@00 Int)) (!
  (=>
    (f_lcp%precondition s@$ a@7@00 x@8@00 y@9@00)
    (f_loop%precondition ($Snap.combine
      ($SortWrappers.$FVF<val>To$Snap (sm@30@00 s@$ a@7@00 x@8@00 y@9@00))
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))))))) a@7@00 x@8@00 y@9@00 0))
  :pattern ((f_lcp s@$ a@7@00 x@8@00 y@9@00))
  :qid |quant-u-31|)))
