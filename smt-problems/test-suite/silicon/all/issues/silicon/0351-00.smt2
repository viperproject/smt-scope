(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:55:45
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0351.vpr
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
(declare-sort Set<$Snap> 0)
(declare-sort $FVF<next> 0)
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
(declare-fun $SortWrappers.$FVF<next>To$Snap ($FVF<next>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<next> ($Snap) $FVF<next>)
(assert (forall ((x $FVF<next>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<next>($SortWrappers.$FVF<next>To$Snap x)))
    :pattern (($SortWrappers.$FVF<next>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<next>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<next>To$Snap($SortWrappers.$SnapTo$FVF<next> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<next> x))
    :qid |$Snap.$FVF<next>To$SnapTo$FVF<next>|
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
; /field_value_functions_declarations.smt2 [next: Ref]
(declare-fun $FVF.domain_next ($FVF<next>) Set<$Ref>)
(declare-fun $FVF.lookup_next ($FVF<next> $Ref) $Ref)
(declare-fun $FVF.after_next ($FVF<next> $FVF<next>) Bool)
(declare-fun $FVF.loc_next ($Ref $Ref) Bool)
(declare-fun $FVF.perm_next ($FPM $Ref) $Perm)
(declare-const $fvfTOP_next $FVF<next>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun dummy ($Snap Bool) Bool)
(declare-fun dummy%limited ($Snap Bool) Bool)
(declare-fun dummy%stateless (Bool) Bool)
(declare-fun dummy%precondition ($Snap Bool) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
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
; /field_value_functions_axioms.smt2 [next: Ref]
(assert (forall ((vs $FVF<next>) (ws $FVF<next>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_next vs) ($FVF.domain_next ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_next vs))
            (= ($FVF.lookup_next vs x) ($FVF.lookup_next ws x)))
          :pattern (($FVF.lookup_next vs x) ($FVF.lookup_next ws x))
          :qid |qp.$FVF<next>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<next>To$Snap vs)
              ($SortWrappers.$FVF<next>To$Snap ws)
              )
    :qid |qp.$FVF<next>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_next pm r))
    :pattern (($FVF.perm_next pm r)))))
(assert (forall ((r $Ref) (f $Ref)) (!
    (= ($FVF.loc_next f r) true)
    :pattern (($FVF.loc_next f r)))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(assert (forall ((s@$ $Snap) (b@0@00 Bool)) (!
  (= (dummy%limited s@$ b@0@00) (dummy s@$ b@0@00))
  :pattern ((dummy s@$ b@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (b@0@00 Bool)) (!
  (dummy%stateless b@0@00)
  :pattern ((dummy%limited s@$ b@0@00))
  :qid |quant-u-1|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- inhExhTestA ----------
(declare-const g@0@01 Set<$Ref>)
(declare-const g@1@01 Set<$Ref>)
(set-option :timeout 0)
(push) ; 1
(declare-const n_0@2@01 $Ref)
(push) ; 2
; [eval] (n_0 in g)
(assert (Set_in n_0@2@01 g@1@01))
(declare-const sm@3@01 $FVF<next>)
; Definitional axioms for snapshot map values
(pop) ; 2
(declare-const $t@4@01 $FVF<next>)
(declare-fun inv@5@01 ($Ref) $Ref)
(declare-fun img@6@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((n_01@2@01 $Ref) (n_02@2@01 $Ref)) (!
  (=>
    (and
      (Set_in n_01@2@01 g@1@01)
      (Set_in n_02@2@01 g@1@01)
      (= n_01@2@01 n_02@2@01))
    (= n_01@2@01 n_02@2@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n_0@2@01 $Ref)) (!
  (=>
    (Set_in n_0@2@01 g@1@01)
    (and (= (inv@5@01 n_0@2@01) n_0@2@01) (img@6@01 n_0@2@01)))
  :pattern (($FVF.loc_next ($FVF.lookup_next $t@4@01 n_0@2@01) n_0@2@01))
  :qid |quant-u-3|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@6@01 r) (Set_in (inv@5@01 r) g@1@01)) (= (inv@5@01 r) r))
  :pattern ((inv@5@01 r))
  :qid |next-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((n_0@2@01 $Ref)) (!
  (=> (Set_in n_0@2@01 g@1@01) (not (= n_0@2@01 $Ref.null)))
  :pattern (($FVF.loc_next ($FVF.lookup_next $t@4@01 n_0@2@01) n_0@2@01))
  :qid |next-permImpliesNonNull|)))
(declare-const sm@7@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@6@01 r) (Set_in (inv@5@01 r) g@1@01))
    (=
      ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)
      ($FVF.lookup_next $t@4@01 r)))
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next $t@4@01 r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next $t@4@01 r) r)
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@5@01 r) g@1@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) r) r))
  :pattern ((inv@5@01 r))
  :qid |quant-u-4|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const n_0@8@01 $Ref)
(push) ; 3
; [eval] (n_0 in g)
(assert (Set_in n_0@8@01 g@1@01))
(declare-const sm@9@01 $FVF<next>)
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-const $t@10@01 $FVF<next>)
(declare-fun inv@11@01 ($Ref) $Ref)
(declare-fun img@12@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((n_01@8@01 $Ref) (n_02@8@01 $Ref)) (!
  (=>
    (and
      (Set_in n_01@8@01 g@1@01)
      (Set_in n_02@8@01 g@1@01)
      (= n_01@8@01 n_02@8@01))
    (= n_01@8@01 n_02@8@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n_0@8@01 $Ref)) (!
  (=>
    (Set_in n_0@8@01 g@1@01)
    (and (= (inv@11@01 n_0@8@01) n_0@8@01) (img@12@01 n_0@8@01)))
  :pattern (($FVF.loc_next ($FVF.lookup_next $t@10@01 n_0@8@01) n_0@8@01))
  :qid |quant-u-6|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@12@01 r) (Set_in (inv@11@01 r) g@1@01)) (= (inv@11@01 r) r))
  :pattern ((inv@11@01 r))
  :qid |next-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((n_0@8@01 $Ref)) (!
  (=> (Set_in n_0@8@01 g@1@01) (not (= n_0@8@01 $Ref.null)))
  :pattern (($FVF.loc_next ($FVF.lookup_next $t@10@01 n_0@8@01) n_0@8@01))
  :qid |next-permImpliesNonNull|)))
(declare-const sm@13@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@12@01 r) (Set_in (inv@11@01 r) g@1@01))
    (=
      ($FVF.lookup_next (as sm@13@01  $FVF<next>) r)
      ($FVF.lookup_next $t@10@01 r)))
  :pattern (($FVF.lookup_next (as sm@13@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next $t@10@01 r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next $t@10@01 r) r)
  :pattern (($FVF.lookup_next (as sm@13@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@11@01 r) g@1@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@13@01  $FVF<next>) r) r))
  :pattern ((inv@11@01 r))
  :qid |quant-u-7|)))
(pop) ; 2
(push) ; 2
; [exec]
; exhale (forall n_0: Ref ::
;     { n_0.next }
;     (n_0 in g) ==> acc(n_0.next, 1 / 1))
(declare-const n_0@14@01 $Ref)
(push) ; 3
; [eval] (n_0 in g)
(assert (Set_in n_0@14@01 g@1@01))
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-fun inv@15@01 ($Ref) $Ref)
(declare-fun img@16@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((n_01@14@01 $Ref) (n_02@14@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n_01@14@01 g@1@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) n_01@14@01) n_01@14@01))
      (and
        (Set_in n_02@14@01 g@1@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) n_02@14@01) n_02@14@01))
      (= n_01@14@01 n_02@14@01))
    (= n_01@14@01 n_02@14@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n_0@14@01 $Ref)) (!
  (=>
    (Set_in n_0@14@01 g@1@01)
    (and (= (inv@15@01 n_0@14@01) n_0@14@01) (img@16@01 n_0@14@01)))
  :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) n_0@14@01) n_0@14@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@16@01 r) (Set_in (inv@15@01 r) g@1@01)) (= (inv@15@01 r) r))
  :pattern ((inv@15@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@15@01 r) g@1@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) r) r))
  :pattern ((inv@15@01 r))
  :qid |quant-u-9|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@17@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@15@01 r) g@1@01) (img@16@01 r) (= r (inv@15@01 r)))
    ($Perm.min
      (ite (and (img@6@01 r) (Set_in (inv@5@01 r) g@1@01)) $Perm.Write $Perm.No)
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
      (ite (and (img@6@01 r) (Set_in (inv@5@01 r) g@1@01)) $Perm.Write $Perm.No)
      (pTaken@17@01 r))
    $Perm.No)
  
  :qid |quant-u-11|))))
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
    (and (Set_in (inv@15@01 r) g@1@01) (img@16@01 r) (= r (inv@15@01 r)))
    (= (- $Perm.Write (pTaken@17@01 r)) $Perm.No))
  
  :qid |quant-u-12|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
; [exec]
; inhale (forall n_0: Ref ::
;     { n_0.next }
;     (n_0 in g) ==> acc(n_0.next, 1 / 1))
(declare-const n_0@18@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (n_0 in g)
(assert (Set_in n_0@18@01 g@1@01))
(declare-const sm@19@01 $FVF<next>)
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-const $t@20@01 $FVF<next>)
(declare-fun inv@21@01 ($Ref) $Ref)
(declare-fun img@22@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((n_01@18@01 $Ref) (n_02@18@01 $Ref)) (!
  (=>
    (and
      (Set_in n_01@18@01 g@1@01)
      (Set_in n_02@18@01 g@1@01)
      (= n_01@18@01 n_02@18@01))
    (= n_01@18@01 n_02@18@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n_0@18@01 $Ref)) (!
  (=>
    (Set_in n_0@18@01 g@1@01)
    (and (= (inv@21@01 n_0@18@01) n_0@18@01) (img@22@01 n_0@18@01)))
  :pattern (($FVF.loc_next ($FVF.lookup_next $t@20@01 n_0@18@01) n_0@18@01))
  :qid |quant-u-14|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@22@01 r) (Set_in (inv@21@01 r) g@1@01)) (= (inv@21@01 r) r))
  :pattern ((inv@21@01 r))
  :qid |next-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((n_0@18@01 $Ref)) (!
  (=> (Set_in n_0@18@01 g@1@01) (not (= n_0@18@01 $Ref.null)))
  :pattern (($FVF.loc_next ($FVF.lookup_next $t@20@01 n_0@18@01) n_0@18@01))
  :qid |next-permImpliesNonNull|)))
(declare-const sm@23@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@22@01 r) (Set_in (inv@21@01 r) g@1@01))
    (=
      ($FVF.lookup_next (as sm@23@01  $FVF<next>) r)
      ($FVF.lookup_next $t@20@01 r)))
  :pattern (($FVF.lookup_next (as sm@23@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next $t@20@01 r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next $t@20@01 r) r)
  :pattern (($FVF.lookup_next (as sm@23@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@21@01 r) g@1@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@23@01  $FVF<next>) r) r))
  :pattern ((inv@21@01 r))
  :qid |quant-u-15|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
(declare-const n_0@24@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (n_0 in g)
(assert (Set_in n_0@24@01 g@1@01))
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-fun inv@25@01 ($Ref) $Ref)
(declare-fun img@26@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((n_01@24@01 $Ref) (n_02@24@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n_01@24@01 g@1@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@23@01  $FVF<next>) n_01@24@01) n_01@24@01))
      (and
        (Set_in n_02@24@01 g@1@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@23@01  $FVF<next>) n_02@24@01) n_02@24@01))
      (= n_01@24@01 n_02@24@01))
    (= n_01@24@01 n_02@24@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n_0@24@01 $Ref)) (!
  (=>
    (Set_in n_0@24@01 g@1@01)
    (and (= (inv@25@01 n_0@24@01) n_0@24@01) (img@26@01 n_0@24@01)))
  :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@23@01  $FVF<next>) n_0@24@01) n_0@24@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@26@01 r) (Set_in (inv@25@01 r) g@1@01)) (= (inv@25@01 r) r))
  :pattern ((inv@25@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@25@01 r) g@1@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@23@01  $FVF<next>) r) r))
  :pattern ((inv@25@01 r))
  :qid |quant-u-17|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@27@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@25@01 r) g@1@01) (img@26@01 r) (= r (inv@25@01 r)))
    ($Perm.min
      (ite
        (and (img@22@01 r) (Set_in (inv@21@01 r) g@1@01))
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
        (and (img@22@01 r) (Set_in (inv@21@01 r) g@1@01))
        $Perm.Write
        $Perm.No)
      (pTaken@27@01 r))
    $Perm.No)
  
  :qid |quant-u-19|))))
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
    (and (Set_in (inv@25@01 r) g@1@01) (img@26@01 r) (= r (inv@25@01 r)))
    (= (- $Perm.Write (pTaken@27@01 r)) $Perm.No))
  
  :qid |quant-u-20|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
(pop) ; 2
(pop) ; 1
; ---------- inhExhTestB ----------
(declare-const g@28@01 Set<$Ref>)
(declare-const g@29@01 Set<$Ref>)
(set-option :timeout 0)
(push) ; 1
(declare-const n_0@30@01 $Ref)
(push) ; 2
; [eval] (n_0 in g)
(assert (Set_in n_0@30@01 g@29@01))
(declare-const sm@31@01 $FVF<next>)
; Definitional axioms for snapshot map values
(pop) ; 2
(declare-const $t@32@01 $FVF<next>)
(declare-fun inv@33@01 ($Ref) $Ref)
(declare-fun img@34@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((n_01@30@01 $Ref) (n_02@30@01 $Ref)) (!
  (=>
    (and
      (Set_in n_01@30@01 g@29@01)
      (Set_in n_02@30@01 g@29@01)
      (= n_01@30@01 n_02@30@01))
    (= n_01@30@01 n_02@30@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n_0@30@01 $Ref)) (!
  (=>
    (Set_in n_0@30@01 g@29@01)
    (and (= (inv@33@01 n_0@30@01) n_0@30@01) (img@34@01 n_0@30@01)))
  :pattern (($FVF.loc_next ($FVF.lookup_next $t@32@01 n_0@30@01) n_0@30@01))
  :qid |quant-u-22|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@34@01 r) (Set_in (inv@33@01 r) g@29@01)) (= (inv@33@01 r) r))
  :pattern ((inv@33@01 r))
  :qid |next-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((n_0@30@01 $Ref)) (!
  (=> (Set_in n_0@30@01 g@29@01) (not (= n_0@30@01 $Ref.null)))
  :pattern (($FVF.loc_next ($FVF.lookup_next $t@32@01 n_0@30@01) n_0@30@01))
  :qid |next-permImpliesNonNull|)))
(declare-const sm@35@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@34@01 r) (Set_in (inv@33@01 r) g@29@01))
    (=
      ($FVF.lookup_next (as sm@35@01  $FVF<next>) r)
      ($FVF.lookup_next $t@32@01 r)))
  :pattern (($FVF.lookup_next (as sm@35@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next $t@32@01 r))
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next $t@32@01 r) r)
  :pattern (($FVF.lookup_next (as sm@35@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@33@01 r) g@29@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@35@01  $FVF<next>) r) r))
  :pattern ((inv@33@01 r))
  :qid |quant-u-23|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const n_0@36@01 $Ref)
(push) ; 3
; [eval] (n_0 in g)
(assert (Set_in n_0@36@01 g@29@01))
(declare-const sm@37@01 $FVF<next>)
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-const $t@38@01 $FVF<next>)
(declare-fun inv@39@01 ($Ref) $Ref)
(declare-fun img@40@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((n_01@36@01 $Ref) (n_02@36@01 $Ref)) (!
  (=>
    (and
      (Set_in n_01@36@01 g@29@01)
      (Set_in n_02@36@01 g@29@01)
      (= n_01@36@01 n_02@36@01))
    (= n_01@36@01 n_02@36@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n_0@36@01 $Ref)) (!
  (=>
    (Set_in n_0@36@01 g@29@01)
    (and (= (inv@39@01 n_0@36@01) n_0@36@01) (img@40@01 n_0@36@01)))
  :pattern (($FVF.loc_next ($FVF.lookup_next $t@38@01 n_0@36@01) n_0@36@01))
  :qid |quant-u-25|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@40@01 r) (Set_in (inv@39@01 r) g@29@01)) (= (inv@39@01 r) r))
  :pattern ((inv@39@01 r))
  :qid |next-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((n_0@36@01 $Ref)) (!
  (=> (Set_in n_0@36@01 g@29@01) (not (= n_0@36@01 $Ref.null)))
  :pattern (($FVF.loc_next ($FVF.lookup_next $t@38@01 n_0@36@01) n_0@36@01))
  :qid |next-permImpliesNonNull|)))
(declare-const sm@41@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@40@01 r) (Set_in (inv@39@01 r) g@29@01))
    (=
      ($FVF.lookup_next (as sm@41@01  $FVF<next>) r)
      ($FVF.lookup_next $t@38@01 r)))
  :pattern (($FVF.lookup_next (as sm@41@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next $t@38@01 r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next $t@38@01 r) r)
  :pattern (($FVF.lookup_next (as sm@41@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef14|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@39@01 r) g@29@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@41@01  $FVF<next>) r) r))
  :pattern ((inv@39@01 r))
  :qid |quant-u-26|)))
(pop) ; 2
(push) ; 2
; [exec]
; exhale (forall n_0: Ref ::
;     { n_0.next }
;     (n_0 in g) ==> acc(n_0.next, 1 / 2))
(declare-const n_0@42@01 $Ref)
(push) ; 3
; [eval] (n_0 in g)
(assert (Set_in n_0@42@01 g@29@01))
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-fun inv@43@01 ($Ref) $Ref)
(declare-fun img@44@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((n_01@42@01 $Ref) (n_02@42@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n_01@42@01 g@29@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@35@01  $FVF<next>) n_01@42@01) n_01@42@01))
      (and
        (Set_in n_02@42@01 g@29@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@35@01  $FVF<next>) n_02@42@01) n_02@42@01))
      (= n_01@42@01 n_02@42@01))
    (= n_01@42@01 n_02@42@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n_0@42@01 $Ref)) (!
  (=>
    (Set_in n_0@42@01 g@29@01)
    (and (= (inv@43@01 n_0@42@01) n_0@42@01) (img@44@01 n_0@42@01)))
  :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@35@01  $FVF<next>) n_0@42@01) n_0@42@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@44@01 r) (Set_in (inv@43@01 r) g@29@01)) (= (inv@43@01 r) r))
  :pattern ((inv@43@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@43@01 r) g@29@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@35@01  $FVF<next>) r) r))
  :pattern ((inv@43@01 r))
  :qid |quant-u-28|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@45@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@43@01 r) g@29@01) (img@44@01 r) (= r (inv@43@01 r)))
    ($Perm.min
      (ite
        (and (img@34@01 r) (Set_in (inv@33@01 r) g@29@01))
        $Perm.Write
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
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
        (and (img@34@01 r) (Set_in (inv@33@01 r) g@29@01))
        $Perm.Write
        $Perm.No)
      (pTaken@45@01 r))
    $Perm.No)
  
  :qid |quant-u-30|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@45@01 r) $Perm.No)
  
  :qid |quant-u-31|))))
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
    (and (Set_in (inv@43@01 r) g@29@01) (img@44@01 r) (= r (inv@43@01 r)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@45@01 r)) $Perm.No))
  
  :qid |quant-u-32|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
; [exec]
; inhale (forall n_0: Ref ::
;     { n_0.next }
;     (n_0 in g) ==> acc(n_0.next, 1 / 2))
(declare-const n_0@46@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (n_0 in g)
(assert (Set_in n_0@46@01 g@29@01))
(declare-const sm@47@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@34@01 r) (Set_in (inv@33@01 r) g@29@01))
      (< $Perm.No (- $Perm.Write (pTaken@45@01 r)))
      false)
    (=
      ($FVF.lookup_next (as sm@47@01  $FVF<next>) r)
      ($FVF.lookup_next $t@32@01 r)))
  :pattern (($FVF.lookup_next (as sm@47@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next $t@32@01 r))
  :qid |qp.fvfValDef15|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next $t@32@01 r) r)
  :pattern (($FVF.lookup_next (as sm@47@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef16|)))
(pop) ; 3
(declare-const $t@48@01 $FVF<next>)
(declare-fun inv@49@01 ($Ref) $Ref)
(declare-fun img@50@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@34@01 r) (Set_in (inv@33@01 r) g@29@01))
      (< $Perm.No (- $Perm.Write (pTaken@45@01 r)))
      false)
    (=
      ($FVF.lookup_next (as sm@47@01  $FVF<next>) r)
      ($FVF.lookup_next $t@32@01 r)))
  :pattern (($FVF.lookup_next (as sm@47@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next $t@32@01 r))
  :qid |qp.fvfValDef15|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next $t@32@01 r) r)
  :pattern (($FVF.lookup_next (as sm@47@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef16|)))
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((n_01@46@01 $Ref) (n_02@46@01 $Ref)) (!
  (=>
    (and
      (Set_in n_01@46@01 g@29@01)
      (Set_in n_02@46@01 g@29@01)
      (= n_01@46@01 n_02@46@01))
    (= n_01@46@01 n_02@46@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n_0@46@01 $Ref)) (!
  (=>
    (Set_in n_0@46@01 g@29@01)
    (and (= (inv@49@01 n_0@46@01) n_0@46@01) (img@50@01 n_0@46@01)))
  :pattern (($FVF.loc_next ($FVF.lookup_next $t@48@01 n_0@46@01) n_0@46@01))
  :qid |quant-u-34|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@50@01 r) (Set_in (inv@49@01 r) g@29@01)) (= (inv@49@01 r) r))
  :pattern ((inv@49@01 r))
  :qid |next-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((n_0@46@01 $Ref)) (!
  (=> (Set_in n_0@46@01 g@29@01) (not (= n_0@46@01 $Ref.null)))
  :pattern (($FVF.loc_next ($FVF.lookup_next $t@48@01 n_0@46@01) n_0@46@01))
  :qid |next-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= n_0@46@01 n_0@30@01)
    (=
      (and (img@50@01 r) (Set_in (inv@49@01 r) g@29@01))
      (and (img@34@01 r) (Set_in (inv@33@01 r) g@29@01))))
  
  :qid |quant-u-35|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@51@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@34@01 r) (Set_in (inv@33@01 r) g@29@01))
      (< $Perm.No (- $Perm.Write (pTaken@45@01 r)))
      false)
    (=
      ($FVF.lookup_next (as sm@51@01  $FVF<next>) r)
      ($FVF.lookup_next $t@32@01 r)))
  :pattern (($FVF.lookup_next (as sm@51@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next $t@32@01 r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@50@01 r) (Set_in (inv@49@01 r) g@29@01))
    (=
      ($FVF.lookup_next (as sm@51@01  $FVF<next>) r)
      ($FVF.lookup_next $t@48@01 r)))
  :pattern (($FVF.lookup_next (as sm@51@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next $t@48@01 r))
  :qid |qp.fvfValDef18|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next $t@32@01 r) r)
    ($FVF.loc_next ($FVF.lookup_next $t@48@01 r) r))
  :pattern (($FVF.lookup_next (as sm@51@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@49@01 r) g@29@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@51@01  $FVF<next>) r) r))
  :pattern ((inv@49@01 r))
  :qid |quant-u-36|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
(declare-const n_0@52@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (n_0 in g)
(assert (Set_in n_0@52@01 g@29@01))
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-fun inv@53@01 ($Ref) $Ref)
(declare-fun img@54@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((n_01@52@01 $Ref) (n_02@52@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n_01@52@01 g@29@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@51@01  $FVF<next>) n_01@52@01) n_01@52@01))
      (and
        (Set_in n_02@52@01 g@29@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@51@01  $FVF<next>) n_02@52@01) n_02@52@01))
      (= n_01@52@01 n_02@52@01))
    (= n_01@52@01 n_02@52@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n_0@52@01 $Ref)) (!
  (=>
    (Set_in n_0@52@01 g@29@01)
    (and (= (inv@53@01 n_0@52@01) n_0@52@01) (img@54@01 n_0@52@01)))
  :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@51@01  $FVF<next>) n_0@52@01) n_0@52@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@54@01 r) (Set_in (inv@53@01 r) g@29@01)) (= (inv@53@01 r) r))
  :pattern ((inv@53@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@53@01 r) g@29@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@51@01  $FVF<next>) r) r))
  :pattern ((inv@53@01 r))
  :qid |quant-u-38|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@55@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@53@01 r) g@29@01) (img@54@01 r) (= r (inv@53@01 r)))
    ($Perm.min
      (ite
        (and (img@34@01 r) (Set_in (inv@33@01 r) g@29@01))
        (- $Perm.Write (pTaken@45@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@56@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@53@01 r) g@29@01) (img@54@01 r) (= r (inv@53@01 r)))
    ($Perm.min
      (ite
        (and (img@50@01 r) (Set_in (inv@49@01 r) g@29@01))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- $Perm.Write (pTaken@55@01 r)))
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
        (and (img@34@01 r) (Set_in (inv@33@01 r) g@29@01))
        (- $Perm.Write (pTaken@45@01 r))
        $Perm.No)
      (pTaken@55@01 r))
    $Perm.No)
  
  :qid |quant-u-40|))))
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
    (and (Set_in (inv@53@01 r) g@29@01) (img@54@01 r) (= r (inv@53@01 r)))
    (= (- $Perm.Write (pTaken@55@01 r)) $Perm.No))
  
  :qid |quant-u-41|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@50@01 r) (Set_in (inv@49@01 r) g@29@01))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@56@01 r))
    $Perm.No)
  
  :qid |quant-u-42|))))
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
    (and (Set_in (inv@53@01 r) g@29@01) (img@54@01 r) (= r (inv@53@01 r)))
    (= (- (- $Perm.Write (pTaken@55@01 r)) (pTaken@56@01 r)) $Perm.No))
  
  :qid |quant-u-43|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
(pop) ; 2
(pop) ; 1
