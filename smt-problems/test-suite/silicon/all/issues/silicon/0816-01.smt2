(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:58:32
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0816.vpr
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
(declare-sort Set<Option<Ref>> 0)
(declare-sort Set<$Ref> 0)
(declare-sort Set<$Snap> 0)
(declare-sort Option<Ref> 0)
(declare-sort $FVF<keydict_val> 0)
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
(declare-fun $SortWrappers.Set<Option<Ref>>To$Snap (Set<Option<Ref>>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<Option<Ref>> ($Snap) Set<Option<Ref>>)
(assert (forall ((x Set<Option<Ref>>)) (!
    (= x ($SortWrappers.$SnapToSet<Option<Ref>>($SortWrappers.Set<Option<Ref>>To$Snap x)))
    :pattern (($SortWrappers.Set<Option<Ref>>To$Snap x))
    :qid |$Snap.$SnapToSet<Option<Ref>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<Option<Ref>>To$Snap($SortWrappers.$SnapToSet<Option<Ref>> x)))
    :pattern (($SortWrappers.$SnapToSet<Option<Ref>> x))
    :qid |$Snap.Set<Option<Ref>>To$SnapToSet<Option<Ref>>|
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
(declare-fun $SortWrappers.Option<Ref>To$Snap (Option<Ref>) $Snap)
(declare-fun $SortWrappers.$SnapToOption<Ref> ($Snap) Option<Ref>)
(assert (forall ((x Option<Ref>)) (!
    (= x ($SortWrappers.$SnapToOption<Ref>($SortWrappers.Option<Ref>To$Snap x)))
    :pattern (($SortWrappers.Option<Ref>To$Snap x))
    :qid |$Snap.$SnapToOption<Ref>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Option<Ref>To$Snap($SortWrappers.$SnapToOption<Ref> x)))
    :pattern (($SortWrappers.$SnapToOption<Ref> x))
    :qid |$Snap.Option<Ref>To$SnapToOption<Ref>|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.$FVF<keydict_val>To$Snap ($FVF<keydict_val>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<keydict_val> ($Snap) $FVF<keydict_val>)
(assert (forall ((x $FVF<keydict_val>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<keydict_val>($SortWrappers.$FVF<keydict_val>To$Snap x)))
    :pattern (($SortWrappers.$FVF<keydict_val>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<keydict_val>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<keydict_val>To$Snap($SortWrappers.$SnapTo$FVF<keydict_val> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<keydict_val> x))
    :qid |$Snap.$FVF<keydict_val>To$SnapTo$FVF<keydict_val>|
    )))
; ////////// Symbols
(declare-fun Set_card (Set<Option<Ref>>) Int)
(declare-const Set_empty Set<Option<Ref>>)
(declare-fun Set_in (Option<Ref> Set<Option<Ref>>) Bool)
(declare-fun Set_singleton (Option<Ref>) Set<Option<Ref>>)
(declare-fun Set_unionone (Set<Option<Ref>> Option<Ref>) Set<Option<Ref>>)
(declare-fun Set_union (Set<Option<Ref>> Set<Option<Ref>>) Set<Option<Ref>>)
(declare-fun Set_intersection (Set<Option<Ref>> Set<Option<Ref>>) Set<Option<Ref>>)
(declare-fun Set_difference (Set<Option<Ref>> Set<Option<Ref>>) Set<Option<Ref>>)
(declare-fun Set_subset (Set<Option<Ref>> Set<Option<Ref>>) Bool)
(declare-fun Set_equal (Set<Option<Ref>> Set<Option<Ref>>) Bool)
(declare-fun Set_skolem_diff (Set<Option<Ref>> Set<Option<Ref>>) Option<Ref>)
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
(declare-fun Some<Option<Ref>> ($Ref) Option<Ref>)
(declare-const None<Option<Ref>> Option<Ref>)
(declare-fun get_Option_value<Ref> (Option<Ref>) $Ref)
(declare-fun Option_tag<Int> (Option<Ref>) Int)
; /field_value_functions_declarations.smt2 [keydict_val: Option[Ref]]
(declare-fun $FVF.domain_keydict_val ($FVF<keydict_val>) Set<$Ref>)
(declare-fun $FVF.lookup_keydict_val ($FVF<keydict_val> $Ref) Option<Ref>)
(declare-fun $FVF.after_keydict_val ($FVF<keydict_val> $FVF<keydict_val>) Bool)
(declare-fun $FVF.loc_keydict_val (Option<Ref> $Ref) Bool)
(declare-fun $FVF.perm_keydict_val ($FPM $Ref) $Perm)
(declare-const $fvfTOP_keydict_val $FVF<keydict_val>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun keydict___item__inv ($Snap $Ref $Ref) $Ref)
(declare-fun keydict___item__inv%limited ($Snap $Ref $Ref) $Ref)
(declare-fun keydict___item__inv%stateless ($Ref $Ref) Bool)
(declare-fun keydict___item__inv%precondition ($Snap $Ref $Ref) Bool)
(declare-fun keydict___item__ ($Snap $Ref $Ref) $Ref)
(declare-fun keydict___item__%limited ($Snap $Ref $Ref) $Ref)
(declare-fun keydict___item__%stateless ($Ref $Ref) Bool)
(declare-fun keydict___item__%precondition ($Snap $Ref $Ref) Bool)
(declare-fun keydict___contains__ ($Snap $Ref $Ref) Bool)
(declare-fun keydict___contains__%limited ($Snap $Ref $Ref) Bool)
(declare-fun keydict___contains__%stateless ($Ref $Ref) Bool)
(declare-fun keydict___contains__%precondition ($Snap $Ref $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((s Set<Option<Ref>>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o Option<Ref>)) (!
  (not (Set_in o (as Set_empty  Set<Option<Ref>>)))
  :pattern ((Set_in o (as Set_empty  Set<Option<Ref>>)))
  )))
(assert (forall ((s Set<Option<Ref>>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<Option<Ref>>)))
    (=> (not (= (Set_card s) 0)) (exists ((x Option<Ref>))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r Option<Ref>)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r Option<Ref>) (o Option<Ref>)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r Option<Ref>)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<Option<Ref>>) (x Option<Ref>) (o Option<Ref>)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<Option<Ref>>) (x Option<Ref>)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<Option<Ref>>) (x Option<Ref>) (y Option<Ref>)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<Option<Ref>>) (x Option<Ref>)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Option<Ref>>) (x Option<Ref>)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Option<Ref>>) (b Set<Option<Ref>>) (o Option<Ref>)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<Option<Ref>>) (b Set<Option<Ref>>) (y Option<Ref>)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<Option<Ref>>) (b Set<Option<Ref>>) (y Option<Ref>)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<Option<Ref>>) (b Set<Option<Ref>>) (o Option<Ref>)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<Option<Ref>>) (b Set<Option<Ref>>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<Option<Ref>>) (b Set<Option<Ref>>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<Option<Ref>>) (b Set<Option<Ref>>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<Option<Ref>>) (b Set<Option<Ref>>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<Option<Ref>>) (b Set<Option<Ref>>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<Option<Ref>>) (b Set<Option<Ref>>) (o Option<Ref>)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<Option<Ref>>) (b Set<Option<Ref>>) (y Option<Ref>)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<Option<Ref>>) (b Set<Option<Ref>>)) (!
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
(assert (forall ((a Set<Option<Ref>>) (b Set<Option<Ref>>)) (!
  (=
    (Set_subset a b)
    (forall ((o Option<Ref>)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<Option<Ref>>) (b Set<Option<Ref>>)) (!
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
(assert (forall ((a Set<Option<Ref>>) (b Set<Option<Ref>>)) (!
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
(assert (forall ((value $Ref)) (!
  (= value (get_Option_value<Ref> (Some<Option<Ref>> value)))
  :pattern ((Some<Option<Ref>> value))
  )))
(assert (forall ((value $Ref)) (!
  (= (Option_tag<Int> (Some<Option<Ref>> value)) 1)
  :pattern ((Some<Option<Ref>> value))
  )))
(assert (= (Option_tag<Int> (as None<Option<Ref>>  Option<Ref>)) 0))
(assert (forall ((t Option<Ref>)) (!
  (or
    (= t (Some<Option<Ref>> (get_Option_value<Ref> t)))
    (= t (as None<Option<Ref>>  Option<Ref>)))
  :pattern ((Option_tag<Int> t))
  )))
; /field_value_functions_axioms.smt2 [keydict_val: Option[Ref]]
(assert (forall ((vs $FVF<keydict_val>) (ws $FVF<keydict_val>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_keydict_val vs) ($FVF.domain_keydict_val ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_keydict_val vs))
            (= ($FVF.lookup_keydict_val vs x) ($FVF.lookup_keydict_val ws x)))
          :pattern (($FVF.lookup_keydict_val vs x) ($FVF.lookup_keydict_val ws x))
          :qid |qp.$FVF<keydict_val>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<keydict_val>To$Snap vs)
              ($SortWrappers.$FVF<keydict_val>To$Snap ws)
              )
    :qid |qp.$FVF<keydict_val>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_keydict_val pm r))
    :pattern (($FVF.perm_keydict_val pm r)))))
(assert (forall ((r $Ref) (f Option<Ref>)) (!
    (= ($FVF.loc_keydict_val f r) true)
    :pattern (($FVF.loc_keydict_val f r)))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ---------- FUNCTION keydict___item__inv----------
(declare-fun self@0@00 () $Ref)
(declare-fun val_ref@1@00 () $Ref)
(declare-fun result@2@00 () $Ref)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (self@0@00 $Ref) (val_ref@1@00 $Ref)) (!
  (=
    (keydict___item__inv%limited s@$ self@0@00 val_ref@1@00)
    (keydict___item__inv s@$ self@0@00 val_ref@1@00))
  :pattern ((keydict___item__inv s@$ self@0@00 val_ref@1@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (self@0@00 $Ref) (val_ref@1@00 $Ref)) (!
  (keydict___item__inv%stateless self@0@00 val_ref@1@00)
  :pattern ((keydict___item__inv%limited s@$ self@0@00 val_ref@1@00))
  :qid |quant-u-1|)))
; ---------- FUNCTION keydict___item__----------
(declare-fun self@3@00 () $Ref)
(declare-fun key@4@00 () $Ref)
(declare-fun result@5@00 () $Ref)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const $t@9@00 $Snap)
(assert (= $t@9@00 $Snap.unit))
; [eval] keydict___item__inv(self, result) == key
; [eval] keydict___item__inv(self, result)
(push) ; 2
(assert (keydict___item__inv%precondition $Snap.unit self@3@00 result@5@00))
(pop) ; 2
; Joined path conditions
(assert (keydict___item__inv%precondition $Snap.unit self@3@00 result@5@00))
(assert (= (keydict___item__inv $Snap.unit self@3@00 result@5@00) key@4@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (self@3@00 $Ref) (key@4@00 $Ref)) (!
  (=
    (keydict___item__%limited s@$ self@3@00 key@4@00)
    (keydict___item__ s@$ self@3@00 key@4@00))
  :pattern ((keydict___item__ s@$ self@3@00 key@4@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (self@3@00 $Ref) (key@4@00 $Ref)) (!
  (keydict___item__%stateless self@3@00 key@4@00)
  :pattern ((keydict___item__%limited s@$ self@3@00 key@4@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (self@3@00 $Ref) (key@4@00 $Ref)) (!
  (let ((result@5@00 (keydict___item__%limited s@$ self@3@00 key@4@00))) (=>
    (keydict___item__%precondition s@$ self@3@00 key@4@00)
    (= (keydict___item__inv $Snap.unit self@3@00 result@5@00) key@4@00)))
  :pattern ((keydict___item__%limited s@$ self@3@00 key@4@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (self@3@00 $Ref) (key@4@00 $Ref)) (!
  (let ((result@5@00 (keydict___item__%limited s@$ self@3@00 key@4@00))) (=>
    (keydict___item__%precondition s@$ self@3@00 key@4@00)
    (keydict___item__inv%precondition $Snap.unit self@3@00 result@5@00)))
  :pattern ((keydict___item__%limited s@$ self@3@00 key@4@00))
  :qid |quant-u-7|)))
; ---------- FUNCTION keydict___contains__----------
(declare-fun self@6@00 () $Ref)
(declare-fun key@7@00 () $Ref)
(declare-fun result@8@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
; [eval] keydict___item__(self, key)
(push) ; 2
(assert (keydict___item__%precondition $Snap.unit self@6@00 key@7@00))
(pop) ; 2
; Joined path conditions
(assert (keydict___item__%precondition $Snap.unit self@6@00 key@7@00))
(declare-const $k@10@00 $Perm)
(assert ($Perm.isReadVar $k@10@00))
(assert (<= $Perm.No $k@10@00))
(assert (<= $k@10@00 $Perm.Write))
(assert (=>
  (< $Perm.No $k@10@00)
  (not (= (keydict___item__ $Snap.unit self@6@00 key@7@00) $Ref.null))))
(declare-const $t@11@00 $Snap)
(assert (= $t@11@00 $Snap.unit))
; [eval] result == ((Option_tag(keydict___item__(self, key).keydict_val): Int) == 1)
; [eval] (Option_tag(keydict___item__(self, key).keydict_val): Int) == 1
; [eval] (Option_tag(keydict___item__(self, key).keydict_val): Int)
; [eval] keydict___item__(self, key)
(push) ; 2
(pop) ; 2
; Joined path conditions
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@10@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (= result@8@00 (= (Option_tag<Int> ($SortWrappers.$SnapToOption<Ref> s@$)) 1)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (self@6@00 $Ref) (key@7@00 $Ref)) (!
  (=
    (keydict___contains__%limited s@$ self@6@00 key@7@00)
    (keydict___contains__ s@$ self@6@00 key@7@00))
  :pattern ((keydict___contains__ s@$ self@6@00 key@7@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (self@6@00 $Ref) (key@7@00 $Ref)) (!
  (keydict___contains__%stateless self@6@00 key@7@00)
  :pattern ((keydict___contains__%limited s@$ self@6@00 key@7@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (self@6@00 $Ref) (key@7@00 $Ref)) (!
  (let ((result@8@00 (keydict___contains__%limited s@$ self@6@00 key@7@00))) (and
    ($Perm.isReadVar $k@10@00)
    (=>
      (keydict___contains__%precondition s@$ self@6@00 key@7@00)
      (=
        result@8@00
        (= (Option_tag<Int> ($SortWrappers.$SnapToOption<Ref> s@$)) 1)))))
  :pattern ((keydict___contains__%limited s@$ self@6@00 key@7@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (self@6@00 $Ref) (key@7@00 $Ref)) (!
  (let ((result@8@00 (keydict___contains__%limited s@$ self@6@00 key@7@00))) true)
  :pattern ((keydict___contains__%limited s@$ self@6@00 key@7@00))
  :qid |quant-u-9|)))
