(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:44:59
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr
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
(declare-sort Set<$Snap> 0)
(declare-sort Inverse_9 0)
(declare-sort Inverse_5 0)
(declare-sort Inverse_8 0)
(declare-sort Inverse_6 0)
(declare-sort Inverse_2 0)
(declare-sort Inverse_4 0)
(declare-sort Inverse_7 0)
(declare-sort Inverse_0 0)
(declare-sort Inverse_3 0)
(declare-sort Inverse_10 0)
(declare-sort __ns__impure_assume_rewriter 0)
(declare-sort Inverse_1 0)
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
(declare-fun $SortWrappers.Inverse_9To$Snap (Inverse_9) $Snap)
(declare-fun $SortWrappers.$SnapToInverse_9 ($Snap) Inverse_9)
(assert (forall ((x Inverse_9)) (!
    (= x ($SortWrappers.$SnapToInverse_9($SortWrappers.Inverse_9To$Snap x)))
    :pattern (($SortWrappers.Inverse_9To$Snap x))
    :qid |$Snap.$SnapToInverse_9To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Inverse_9To$Snap($SortWrappers.$SnapToInverse_9 x)))
    :pattern (($SortWrappers.$SnapToInverse_9 x))
    :qid |$Snap.Inverse_9To$SnapToInverse_9|
    )))
(declare-fun $SortWrappers.Inverse_5To$Snap (Inverse_5) $Snap)
(declare-fun $SortWrappers.$SnapToInverse_5 ($Snap) Inverse_5)
(assert (forall ((x Inverse_5)) (!
    (= x ($SortWrappers.$SnapToInverse_5($SortWrappers.Inverse_5To$Snap x)))
    :pattern (($SortWrappers.Inverse_5To$Snap x))
    :qid |$Snap.$SnapToInverse_5To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Inverse_5To$Snap($SortWrappers.$SnapToInverse_5 x)))
    :pattern (($SortWrappers.$SnapToInverse_5 x))
    :qid |$Snap.Inverse_5To$SnapToInverse_5|
    )))
(declare-fun $SortWrappers.Inverse_8To$Snap (Inverse_8) $Snap)
(declare-fun $SortWrappers.$SnapToInverse_8 ($Snap) Inverse_8)
(assert (forall ((x Inverse_8)) (!
    (= x ($SortWrappers.$SnapToInverse_8($SortWrappers.Inverse_8To$Snap x)))
    :pattern (($SortWrappers.Inverse_8To$Snap x))
    :qid |$Snap.$SnapToInverse_8To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Inverse_8To$Snap($SortWrappers.$SnapToInverse_8 x)))
    :pattern (($SortWrappers.$SnapToInverse_8 x))
    :qid |$Snap.Inverse_8To$SnapToInverse_8|
    )))
(declare-fun $SortWrappers.Inverse_6To$Snap (Inverse_6) $Snap)
(declare-fun $SortWrappers.$SnapToInverse_6 ($Snap) Inverse_6)
(assert (forall ((x Inverse_6)) (!
    (= x ($SortWrappers.$SnapToInverse_6($SortWrappers.Inverse_6To$Snap x)))
    :pattern (($SortWrappers.Inverse_6To$Snap x))
    :qid |$Snap.$SnapToInverse_6To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Inverse_6To$Snap($SortWrappers.$SnapToInverse_6 x)))
    :pattern (($SortWrappers.$SnapToInverse_6 x))
    :qid |$Snap.Inverse_6To$SnapToInverse_6|
    )))
(declare-fun $SortWrappers.Inverse_2To$Snap (Inverse_2) $Snap)
(declare-fun $SortWrappers.$SnapToInverse_2 ($Snap) Inverse_2)
(assert (forall ((x Inverse_2)) (!
    (= x ($SortWrappers.$SnapToInverse_2($SortWrappers.Inverse_2To$Snap x)))
    :pattern (($SortWrappers.Inverse_2To$Snap x))
    :qid |$Snap.$SnapToInverse_2To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Inverse_2To$Snap($SortWrappers.$SnapToInverse_2 x)))
    :pattern (($SortWrappers.$SnapToInverse_2 x))
    :qid |$Snap.Inverse_2To$SnapToInverse_2|
    )))
(declare-fun $SortWrappers.Inverse_4To$Snap (Inverse_4) $Snap)
(declare-fun $SortWrappers.$SnapToInverse_4 ($Snap) Inverse_4)
(assert (forall ((x Inverse_4)) (!
    (= x ($SortWrappers.$SnapToInverse_4($SortWrappers.Inverse_4To$Snap x)))
    :pattern (($SortWrappers.Inverse_4To$Snap x))
    :qid |$Snap.$SnapToInverse_4To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Inverse_4To$Snap($SortWrappers.$SnapToInverse_4 x)))
    :pattern (($SortWrappers.$SnapToInverse_4 x))
    :qid |$Snap.Inverse_4To$SnapToInverse_4|
    )))
(declare-fun $SortWrappers.Inverse_7To$Snap (Inverse_7) $Snap)
(declare-fun $SortWrappers.$SnapToInverse_7 ($Snap) Inverse_7)
(assert (forall ((x Inverse_7)) (!
    (= x ($SortWrappers.$SnapToInverse_7($SortWrappers.Inverse_7To$Snap x)))
    :pattern (($SortWrappers.Inverse_7To$Snap x))
    :qid |$Snap.$SnapToInverse_7To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Inverse_7To$Snap($SortWrappers.$SnapToInverse_7 x)))
    :pattern (($SortWrappers.$SnapToInverse_7 x))
    :qid |$Snap.Inverse_7To$SnapToInverse_7|
    )))
(declare-fun $SortWrappers.Inverse_0To$Snap (Inverse_0) $Snap)
(declare-fun $SortWrappers.$SnapToInverse_0 ($Snap) Inverse_0)
(assert (forall ((x Inverse_0)) (!
    (= x ($SortWrappers.$SnapToInverse_0($SortWrappers.Inverse_0To$Snap x)))
    :pattern (($SortWrappers.Inverse_0To$Snap x))
    :qid |$Snap.$SnapToInverse_0To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Inverse_0To$Snap($SortWrappers.$SnapToInverse_0 x)))
    :pattern (($SortWrappers.$SnapToInverse_0 x))
    :qid |$Snap.Inverse_0To$SnapToInverse_0|
    )))
(declare-fun $SortWrappers.Inverse_3To$Snap (Inverse_3) $Snap)
(declare-fun $SortWrappers.$SnapToInverse_3 ($Snap) Inverse_3)
(assert (forall ((x Inverse_3)) (!
    (= x ($SortWrappers.$SnapToInverse_3($SortWrappers.Inverse_3To$Snap x)))
    :pattern (($SortWrappers.Inverse_3To$Snap x))
    :qid |$Snap.$SnapToInverse_3To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Inverse_3To$Snap($SortWrappers.$SnapToInverse_3 x)))
    :pattern (($SortWrappers.$SnapToInverse_3 x))
    :qid |$Snap.Inverse_3To$SnapToInverse_3|
    )))
(declare-fun $SortWrappers.Inverse_10To$Snap (Inverse_10) $Snap)
(declare-fun $SortWrappers.$SnapToInverse_10 ($Snap) Inverse_10)
(assert (forall ((x Inverse_10)) (!
    (= x ($SortWrappers.$SnapToInverse_10($SortWrappers.Inverse_10To$Snap x)))
    :pattern (($SortWrappers.Inverse_10To$Snap x))
    :qid |$Snap.$SnapToInverse_10To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Inverse_10To$Snap($SortWrappers.$SnapToInverse_10 x)))
    :pattern (($SortWrappers.$SnapToInverse_10 x))
    :qid |$Snap.Inverse_10To$SnapToInverse_10|
    )))
(declare-fun $SortWrappers.__ns__impure_assume_rewriterTo$Snap (__ns__impure_assume_rewriter) $Snap)
(declare-fun $SortWrappers.$SnapTo__ns__impure_assume_rewriter ($Snap) __ns__impure_assume_rewriter)
(assert (forall ((x __ns__impure_assume_rewriter)) (!
    (= x ($SortWrappers.$SnapTo__ns__impure_assume_rewriter($SortWrappers.__ns__impure_assume_rewriterTo$Snap x)))
    :pattern (($SortWrappers.__ns__impure_assume_rewriterTo$Snap x))
    :qid |$Snap.$SnapTo__ns__impure_assume_rewriterTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.__ns__impure_assume_rewriterTo$Snap($SortWrappers.$SnapTo__ns__impure_assume_rewriter x)))
    :pattern (($SortWrappers.$SnapTo__ns__impure_assume_rewriter x))
    :qid |$Snap.__ns__impure_assume_rewriterTo$SnapTo__ns__impure_assume_rewriter|
    )))
(declare-fun $SortWrappers.Inverse_1To$Snap (Inverse_1) $Snap)
(declare-fun $SortWrappers.$SnapToInverse_1 ($Snap) Inverse_1)
(assert (forall ((x Inverse_1)) (!
    (= x ($SortWrappers.$SnapToInverse_1($SortWrappers.Inverse_1To$Snap x)))
    :pattern (($SortWrappers.Inverse_1To$Snap x))
    :qid |$Snap.$SnapToInverse_1To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Inverse_1To$Snap($SortWrappers.$SnapToInverse_1 x)))
    :pattern (($SortWrappers.$SnapToInverse_1 x))
    :qid |$Snap.Inverse_1To$SnapToInverse_1|
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
(declare-fun __iar__assume_helper_1<Perm> (Bool $Perm $Perm) $Perm)
(declare-fun __iar__assume_helper_2<Perm> (Bool Bool $Perm $Perm $Perm) $Perm)
(declare-fun __iar__assume_helper_3<Perm> (Bool Bool Bool $Perm $Perm $Perm $Perm) $Perm)
(declare-fun __iar__assume_helper_4<Perm> (Bool Bool Bool Bool $Perm $Perm $Perm $Perm $Perm) $Perm)
(declare-fun __iar__assume_helper_5<Perm> (Bool Bool Bool Bool Bool $Perm $Perm $Perm $Perm $Perm $Perm) $Perm)
(declare-fun __iar__assume_helper_6<Perm> (Bool Bool Bool Bool Bool Bool $Perm $Perm $Perm $Perm $Perm $Perm $Perm) $Perm)
(declare-fun __iar__assume_helper_7<Perm> (Bool Bool Bool Bool Bool Bool Bool $Perm $Perm $Perm $Perm $Perm $Perm $Perm $Perm) $Perm)
(declare-fun __iar__assume_helper_8<Perm> (Bool Bool Bool Bool Bool Bool Bool Bool $Perm $Perm $Perm $Perm $Perm $Perm $Perm $Perm $Perm) $Perm)
(declare-fun __iar__assume_helper_9<Perm> (Bool Bool Bool Bool Bool Bool Bool Bool Bool $Perm $Perm $Perm $Perm $Perm $Perm $Perm $Perm $Perm $Perm) $Perm)
(declare-fun __iar__assume_helper_10<Perm> (Bool Bool Bool Bool Bool Bool Bool Bool Bool Bool $Perm $Perm $Perm $Perm $Perm $Perm $Perm $Perm $Perm $Perm $Perm) $Perm)
(declare-fun inv_2<Ref> ($Ref) $Ref)
(declare-fun inv_6<Ref> ($Ref) $Ref)
(declare-fun inv_7<Ref> ($Ref) $Ref)
(declare-fun inv_5<Ref> ($Ref) $Ref)
(declare-fun inv_4<Ref> ($Ref) $Ref)
(declare-fun inv_10<Ref> ($Ref) $Ref)
(declare-fun inv_0<Ref> ($Ref) $Ref)
(declare-fun inv_8<Ref> ($Ref) $Ref)
(declare-fun inv_9<Ref> ($Ref) $Ref)
(declare-fun inv_3<Ref> ($Ref) $Ref)
(declare-fun inv_1<Ref> ($Ref) $Ref)
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
(assert (forall ((c_1 Bool) (p_1 $Perm) (p_0 $Perm)) (!
  (= (__iar__assume_helper_1<Perm> c_1 p_1 p_0) (+ p_0 (ite c_1 p_1 $Perm.No)))
  :pattern ((__iar__assume_helper_1<Perm> c_1 p_1 p_0))
  :qid |prog.__iar__assume_helper_1_axiom|)))
(assert (forall ((c_2 Bool) (c_1 Bool) (p_2 $Perm) (p_1 $Perm) (p_0 $Perm)) (!
  (=
    (__iar__assume_helper_2<Perm> c_2 c_1 p_2 p_1 p_0)
    (+ (+ p_0 (ite c_1 p_1 $Perm.No)) (ite c_2 p_2 $Perm.No)))
  :pattern ((__iar__assume_helper_2<Perm> c_2 c_1 p_2 p_1 p_0))
  :qid |prog.__iar__assume_helper_2_axiom|)))
(assert (forall ((c_3 Bool) (c_2 Bool) (c_1 Bool) (p_3 $Perm) (p_2 $Perm) (p_1 $Perm) (p_0 $Perm)) (!
  (=
    (__iar__assume_helper_3<Perm> c_3 c_2 c_1 p_3 p_2 p_1 p_0)
    (+
      (+ (+ p_0 (ite c_1 p_1 $Perm.No)) (ite c_2 p_2 $Perm.No))
      (ite c_3 p_3 $Perm.No)))
  :pattern ((__iar__assume_helper_3<Perm> c_3 c_2 c_1 p_3 p_2 p_1 p_0))
  :qid |prog.__iar__assume_helper_3_axiom|)))
(assert (forall ((c_4 Bool) (c_3 Bool) (c_2 Bool) (c_1 Bool) (p_4 $Perm) (p_3 $Perm) (p_2 $Perm) (p_1 $Perm) (p_0 $Perm)) (!
  (=
    (__iar__assume_helper_4<Perm> c_4 c_3 c_2 c_1 p_4 p_3 p_2 p_1 p_0)
    (+
      (+
        (+ (+ p_0 (ite c_1 p_1 $Perm.No)) (ite c_2 p_2 $Perm.No))
        (ite c_3 p_3 $Perm.No))
      (ite c_4 p_4 $Perm.No)))
  :pattern ((__iar__assume_helper_4<Perm> c_4 c_3 c_2 c_1 p_4 p_3 p_2 p_1 p_0))
  :qid |prog.__iar__assume_helper_4_axiom|)))
(assert (forall ((c_5 Bool) (c_4 Bool) (c_3 Bool) (c_2 Bool) (c_1 Bool) (p_5 $Perm) (p_4 $Perm) (p_3 $Perm) (p_2 $Perm) (p_1 $Perm) (p_0 $Perm)) (!
  (=
    (__iar__assume_helper_5<Perm> c_5 c_4 c_3 c_2 c_1 p_5 p_4 p_3 p_2 p_1 p_0)
    (+
      (+
        (+
          (+ (+ p_0 (ite c_1 p_1 $Perm.No)) (ite c_2 p_2 $Perm.No))
          (ite c_3 p_3 $Perm.No))
        (ite c_4 p_4 $Perm.No))
      (ite c_5 p_5 $Perm.No)))
  :pattern ((__iar__assume_helper_5<Perm> c_5 c_4 c_3 c_2 c_1 p_5 p_4 p_3 p_2 p_1 p_0))
  :qid |prog.__iar__assume_helper_5_axiom|)))
(assert (forall ((c_6 Bool) (c_5 Bool) (c_4 Bool) (c_3 Bool) (c_2 Bool) (c_1 Bool) (p_6 $Perm) (p_5 $Perm) (p_4 $Perm) (p_3 $Perm) (p_2 $Perm) (p_1 $Perm) (p_0 $Perm)) (!
  (=
    (__iar__assume_helper_6<Perm> c_6 c_5 c_4 c_3 c_2 c_1 p_6 p_5 p_4 p_3 p_2 p_1 p_0)
    (+
      (+
        (+
          (+
            (+ (+ p_0 (ite c_1 p_1 $Perm.No)) (ite c_2 p_2 $Perm.No))
            (ite c_3 p_3 $Perm.No))
          (ite c_4 p_4 $Perm.No))
        (ite c_5 p_5 $Perm.No))
      (ite c_6 p_6 $Perm.No)))
  :pattern ((__iar__assume_helper_6<Perm> c_6 c_5 c_4 c_3 c_2 c_1 p_6 p_5 p_4 p_3 p_2 p_1 p_0))
  :qid |prog.__iar__assume_helper_6_axiom|)))
(assert (forall ((c_7 Bool) (c_6 Bool) (c_5 Bool) (c_4 Bool) (c_3 Bool) (c_2 Bool) (c_1 Bool) (p_7 $Perm) (p_6 $Perm) (p_5 $Perm) (p_4 $Perm) (p_3 $Perm) (p_2 $Perm) (p_1 $Perm) (p_0 $Perm)) (!
  (=
    (__iar__assume_helper_7<Perm> c_7 c_6 c_5 c_4 c_3 c_2 c_1 p_7 p_6 p_5 p_4 p_3 p_2 p_1 p_0)
    (+
      (+
        (+
          (+
            (+
              (+ (+ p_0 (ite c_1 p_1 $Perm.No)) (ite c_2 p_2 $Perm.No))
              (ite c_3 p_3 $Perm.No))
            (ite c_4 p_4 $Perm.No))
          (ite c_5 p_5 $Perm.No))
        (ite c_6 p_6 $Perm.No))
      (ite c_7 p_7 $Perm.No)))
  :pattern ((__iar__assume_helper_7<Perm> c_7 c_6 c_5 c_4 c_3 c_2 c_1 p_7 p_6 p_5 p_4 p_3 p_2 p_1 p_0))
  :qid |prog.__iar__assume_helper_7_axiom|)))
(assert (forall ((c_8 Bool) (c_7 Bool) (c_6 Bool) (c_5 Bool) (c_4 Bool) (c_3 Bool) (c_2 Bool) (c_1 Bool) (p_8 $Perm) (p_7 $Perm) (p_6 $Perm) (p_5 $Perm) (p_4 $Perm) (p_3 $Perm) (p_2 $Perm) (p_1 $Perm) (p_0 $Perm)) (!
  (=
    (__iar__assume_helper_8<Perm> c_8 c_7 c_6 c_5 c_4 c_3 c_2 c_1 p_8 p_7 p_6 p_5 p_4 p_3 p_2 p_1 p_0)
    (+
      (+
        (+
          (+
            (+
              (+
                (+ (+ p_0 (ite c_1 p_1 $Perm.No)) (ite c_2 p_2 $Perm.No))
                (ite c_3 p_3 $Perm.No))
              (ite c_4 p_4 $Perm.No))
            (ite c_5 p_5 $Perm.No))
          (ite c_6 p_6 $Perm.No))
        (ite c_7 p_7 $Perm.No))
      (ite c_8 p_8 $Perm.No)))
  :pattern ((__iar__assume_helper_8<Perm> c_8 c_7 c_6 c_5 c_4 c_3 c_2 c_1 p_8 p_7 p_6 p_5 p_4 p_3 p_2 p_1 p_0))
  :qid |prog.__iar__assume_helper_8_axiom|)))
(assert (forall ((c_9 Bool) (c_8 Bool) (c_7 Bool) (c_6 Bool) (c_5 Bool) (c_4 Bool) (c_3 Bool) (c_2 Bool) (c_1 Bool) (p_9 $Perm) (p_8 $Perm) (p_7 $Perm) (p_6 $Perm) (p_5 $Perm) (p_4 $Perm) (p_3 $Perm) (p_2 $Perm) (p_1 $Perm) (p_0 $Perm)) (!
  (=
    (__iar__assume_helper_9<Perm> c_9 c_8 c_7 c_6 c_5 c_4 c_3 c_2 c_1 p_9 p_8 p_7 p_6 p_5 p_4 p_3 p_2 p_1 p_0)
    (+
      (+
        (+
          (+
            (+
              (+
                (+
                  (+ (+ p_0 (ite c_1 p_1 $Perm.No)) (ite c_2 p_2 $Perm.No))
                  (ite c_3 p_3 $Perm.No))
                (ite c_4 p_4 $Perm.No))
              (ite c_5 p_5 $Perm.No))
            (ite c_6 p_6 $Perm.No))
          (ite c_7 p_7 $Perm.No))
        (ite c_8 p_8 $Perm.No))
      (ite c_9 p_9 $Perm.No)))
  :pattern ((__iar__assume_helper_9<Perm> c_9 c_8 c_7 c_6 c_5 c_4 c_3 c_2 c_1 p_9 p_8 p_7 p_6 p_5 p_4 p_3 p_2 p_1 p_0))
  :qid |prog.__iar__assume_helper_9_axiom|)))
(assert (forall ((c_10 Bool) (c_9 Bool) (c_8 Bool) (c_7 Bool) (c_6 Bool) (c_5 Bool) (c_4 Bool) (c_3 Bool) (c_2 Bool) (c_1 Bool) (p_10 $Perm) (p_9 $Perm) (p_8 $Perm) (p_7 $Perm) (p_6 $Perm) (p_5 $Perm) (p_4 $Perm) (p_3 $Perm) (p_2 $Perm) (p_1 $Perm) (p_0 $Perm)) (!
  (=
    (__iar__assume_helper_10<Perm> c_10 c_9 c_8 c_7 c_6 c_5 c_4 c_3 c_2 c_1 p_10 p_9 p_8 p_7 p_6 p_5 p_4 p_3 p_2 p_1 p_0)
    (+
      (+
        (+
          (+
            (+
              (+
                (+
                  (+
                    (+ (+ p_0 (ite c_1 p_1 $Perm.No)) (ite c_2 p_2 $Perm.No))
                    (ite c_3 p_3 $Perm.No))
                  (ite c_4 p_4 $Perm.No))
                (ite c_5 p_5 $Perm.No))
              (ite c_6 p_6 $Perm.No))
            (ite c_7 p_7 $Perm.No))
          (ite c_8 p_8 $Perm.No))
        (ite c_9 p_9 $Perm.No))
      (ite c_10 p_10 $Perm.No)))
  :pattern ((__iar__assume_helper_10<Perm> c_10 c_9 c_8 c_7 c_6 c_5 c_4 c_3 c_2 c_1 p_10 p_9 p_8 p_7 p_6 p_5 p_4 p_3 p_2 p_1 p_0))
  :qid |prog.__iar__assume_helper_10_axiom|)))
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
; ---------- m ----------
(declare-const xs1@0@01 Set<$Ref>)
(declare-const xs2@1@01 Set<$Ref>)
(declare-const xs3@2@01 Set<$Ref>)
(declare-const xs4@3@01 Set<$Ref>)
(declare-const xs5@4@01 Set<$Ref>)
(declare-const xs6@5@01 Set<$Ref>)
(declare-const xs7@6@01 Set<$Ref>)
(declare-const xs8@7@01 Set<$Ref>)
(declare-const xs9@8@01 Set<$Ref>)
(declare-const xs10@9@01 Set<$Ref>)
(declare-const xs11@10@01 Set<$Ref>)
(declare-const x@11@01 $Ref)
(declare-const p@12@01 $Perm)
(declare-const xs1@13@01 Set<$Ref>)
(declare-const xs2@14@01 Set<$Ref>)
(declare-const xs3@15@01 Set<$Ref>)
(declare-const xs4@16@01 Set<$Ref>)
(declare-const xs5@17@01 Set<$Ref>)
(declare-const xs6@18@01 Set<$Ref>)
(declare-const xs7@19@01 Set<$Ref>)
(declare-const xs8@20@01 Set<$Ref>)
(declare-const xs9@21@01 Set<$Ref>)
(declare-const xs10@22@01 Set<$Ref>)
(declare-const xs11@23@01 Set<$Ref>)
(declare-const x@24@01 $Ref)
(declare-const p@25@01 $Perm)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@26@01 $Snap)
(assert (= $t@26@01 $Snap.unit))
; [eval] p >= none
(assert (>= p@25@01 $Perm.No))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale acc(x.f, p)
(push) ; 3
(assert (not (or (= p@25@01 $Perm.No) (< $Perm.No p@25@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const $t@27@01 Int)
(declare-const sm@28@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (= ($FVF.lookup_f (as sm@28@01  $FVF<f>) x@24@01) $t@27@01))
(assert (<= $Perm.No p@25@01))
(assert (<= p@25@01 $Perm.Write))
(assert (=> (< $Perm.No p@25@01) (not (= x@24@01 $Ref.null))))
(declare-const sm@29@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite (= r x@24@01) (< $Perm.No p@25@01) false)
    (=
      ($FVF.lookup_f (as sm@29@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@28@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@29@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@28@01  $FVF<f>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f (as sm@28@01  $FVF<f>) r) r)
  :pattern (($FVF.lookup_f (as sm@29@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef1|)))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) x@24@01) x@24@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x1: Ref :: { x1.f } (x1 in xs1) ==> true && inv_0(x1) == x1)
(declare-const $t@30@01 $Snap)
(assert (= $t@30@01 $Snap.unit))
; [eval] (forall x1: Ref :: { x1.f } (x1 in xs1) ==> true && inv_0(x1) == x1)
(declare-const x1@31@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x1 in xs1) ==> true && inv_0(x1) == x1
; [eval] (x1 in xs1)
(push) ; 4
; [then-branch: 0 | x1@31@01 in xs1@13@01 | live]
; [else-branch: 0 | !(x1@31@01 in xs1@13@01) | live]
(push) ; 5
; [then-branch: 0 | x1@31@01 in xs1@13@01]
(assert (Set_in x1@31@01 xs1@13@01))
; [eval] true && inv_0(x1) == x1
(push) ; 6
; [then-branch: 1 | False | live]
; [else-branch: 1 | True | live]
(push) ; 7
; [then-branch: 1 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 1 | True]
; [eval] inv_0(x1) == x1
; [eval] inv_0(x1)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(push) ; 5
; [else-branch: 0 | !(x1@31@01 in xs1@13@01)]
(assert (not (Set_in x1@31@01 xs1@13@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in x1@31@01 xs1@13@01)) (Set_in x1@31@01 xs1@13@01)))
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x1@31@01 $Ref)) (!
  (or (not (Set_in x1@31@01 xs1@13@01)) (Set_in x1@31@01 xs1@13@01))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) x1@31@01) x1@31@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@14@11@14@62-aux|)))
(assert (forall ((x1@31@01 $Ref)) (!
  (=> (Set_in x1@31@01 xs1@13@01) (= (inv_0<Ref> x1@31@01) x1@31@01))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) x1@31@01) x1@31@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@14@11@14@62|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall r: Ref :: { inv_0(r) } (inv_0(r) in xs1) ==> inv_0(r) == r)
(declare-const $t@32@01 $Snap)
(assert (= $t@32@01 $Snap.unit))
; [eval] (forall r: Ref :: { inv_0(r) } (inv_0(r) in xs1) ==> inv_0(r) == r)
(declare-const r@33@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (inv_0(r) in xs1) ==> inv_0(r) == r
; [eval] (inv_0(r) in xs1)
; [eval] inv_0(r)
(push) ; 4
; [then-branch: 2 | inv_0[Ref](r@33@01) in xs1@13@01 | live]
; [else-branch: 2 | !(inv_0[Ref](r@33@01) in xs1@13@01) | live]
(push) ; 5
; [then-branch: 2 | inv_0[Ref](r@33@01) in xs1@13@01]
(assert (Set_in (inv_0<Ref> r@33@01) xs1@13@01))
; [eval] inv_0(r) == r
; [eval] inv_0(r)
(pop) ; 5
(push) ; 5
; [else-branch: 2 | !(inv_0[Ref](r@33@01) in xs1@13@01)]
(assert (not (Set_in (inv_0<Ref> r@33@01) xs1@13@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Set_in (inv_0<Ref> r@33@01) xs1@13@01))
  (Set_in (inv_0<Ref> r@33@01) xs1@13@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@33@01 $Ref)) (!
  (or
    (not (Set_in (inv_0<Ref> r@33@01) xs1@13@01))
    (Set_in (inv_0<Ref> r@33@01) xs1@13@01))
  :pattern ((inv_0<Ref> r@33@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@14@11@14@62-aux|)))
(assert (forall ((r@33@01 $Ref)) (!
  (=> (Set_in (inv_0<Ref> r@33@01) xs1@13@01) (= (inv_0<Ref> r@33@01) r@33@01))
  :pattern ((inv_0<Ref> r@33@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@14@11@14@62|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall r: Ref :: { inv_0(r) } (inv_0(r) in xs1) ==> perm(r.f) >= p)
(declare-const $t@34@01 $Snap)
(assert (= $t@34@01 $Snap.unit))
; [eval] (forall r: Ref :: { inv_0(r) } (inv_0(r) in xs1) ==> perm(r.f) >= p)
(declare-const r@35@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (inv_0(r) in xs1) ==> perm(r.f) >= p
; [eval] (inv_0(r) in xs1)
; [eval] inv_0(r)
(push) ; 4
; [then-branch: 3 | inv_0[Ref](r@35@01) in xs1@13@01 | live]
; [else-branch: 3 | !(inv_0[Ref](r@35@01) in xs1@13@01) | live]
(push) ; 5
; [then-branch: 3 | inv_0[Ref](r@35@01) in xs1@13@01]
(assert (Set_in (inv_0<Ref> r@35@01) xs1@13@01))
; [eval] perm(r.f) >= p
; [eval] perm(r.f)
; Definitional axioms for snapshot map values
(declare-const pm@36@01 $FPM)
(assert (forall ((r $Ref)) (!
  (= ($FVF.perm_f (as pm@36@01  $FPM) r) (ite (= r x@24@01) p@25@01 $Perm.No))
  :pattern (($FVF.perm_f (as pm@36@01  $FPM) r))
  :qid |qp.resPrmSumDef2|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f (as sm@28@01  $FVF<f>) r) r))
  :pattern (($FVF.perm_f (as pm@36@01  $FPM) r))
  :qid |qp.resTrgDef3|)))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r@35@01) r@35@01))
; perm(r.f)  ~~>  assume upper permission bound
(assert (<= ($FVF.perm_f (as pm@36@01  $FPM) r@35@01) $Perm.Write))
(pop) ; 5
(push) ; 5
; [else-branch: 3 | !(inv_0[Ref](r@35@01) in xs1@13@01)]
(assert (not (Set_in (inv_0<Ref> r@35@01) xs1@13@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (= ($FVF.perm_f (as pm@36@01  $FPM) r) (ite (= r x@24@01) p@25@01 $Perm.No))
  :pattern (($FVF.perm_f (as pm@36@01  $FPM) r))
  :qid |qp.resPrmSumDef2|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f (as sm@28@01  $FVF<f>) r) r))
  :pattern (($FVF.perm_f (as pm@36@01  $FPM) r))
  :qid |qp.resTrgDef3|)))
(assert (=>
  (Set_in (inv_0<Ref> r@35@01) xs1@13@01)
  (and
    (Set_in (inv_0<Ref> r@35@01) xs1@13@01)
    ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r@35@01) r@35@01)
    (<= ($FVF.perm_f (as pm@36@01  $FPM) r@35@01) $Perm.Write))))
; Joined path conditions
(assert (or
  (not (Set_in (inv_0<Ref> r@35@01) xs1@13@01))
  (Set_in (inv_0<Ref> r@35@01) xs1@13@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (= ($FVF.perm_f (as pm@36@01  $FPM) r) (ite (= r x@24@01) p@25@01 $Perm.No))
  :pattern (($FVF.perm_f (as pm@36@01  $FPM) r))
  :qid |qp.resPrmSumDef2|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f (as sm@28@01  $FVF<f>) r) r))
  :pattern (($FVF.perm_f (as pm@36@01  $FPM) r))
  :qid |qp.resTrgDef3|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@35@01 $Ref)) (!
  (and
    (=>
      (Set_in (inv_0<Ref> r@35@01) xs1@13@01)
      (and
        (Set_in (inv_0<Ref> r@35@01) xs1@13@01)
        ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r@35@01) r@35@01)
        (<= ($FVF.perm_f (as pm@36@01  $FPM) r@35@01) $Perm.Write)))
    (or
      (not (Set_in (inv_0<Ref> r@35@01) xs1@13@01))
      (Set_in (inv_0<Ref> r@35@01) xs1@13@01)))
  :pattern ((inv_0<Ref> r@35@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@14@11@14@62-aux|)))
(assert (forall ((r@35@01 $Ref)) (!
  (=>
    (Set_in (inv_0<Ref> r@35@01) xs1@13@01)
    (>= ($FVF.perm_f (as pm@36@01  $FPM) r@35@01) p@25@01))
  :pattern ((inv_0<Ref> r@35@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@14@11@14@62|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x2: Ref :: { x2.f } (x2 in xs2) ==> true && inv_1(x2) == x2)
(declare-const $t@37@01 $Snap)
(assert (= $t@37@01 $Snap.unit))
; [eval] (forall x2: Ref :: { x2.f } (x2 in xs2) ==> true && inv_1(x2) == x2)
(declare-const x2@38@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x2 in xs2) ==> true && inv_1(x2) == x2
; [eval] (x2 in xs2)
(push) ; 4
; [then-branch: 4 | x2@38@01 in xs2@14@01 | live]
; [else-branch: 4 | !(x2@38@01 in xs2@14@01) | live]
(push) ; 5
; [then-branch: 4 | x2@38@01 in xs2@14@01]
(assert (Set_in x2@38@01 xs2@14@01))
; [eval] true && inv_1(x2) == x2
(push) ; 6
; [then-branch: 5 | False | live]
; [else-branch: 5 | True | live]
(push) ; 7
; [then-branch: 5 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 5 | True]
; [eval] inv_1(x2) == x2
; [eval] inv_1(x2)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(push) ; 5
; [else-branch: 4 | !(x2@38@01 in xs2@14@01)]
(assert (not (Set_in x2@38@01 xs2@14@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in x2@38@01 xs2@14@01)) (Set_in x2@38@01 xs2@14@01)))
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x2@38@01 $Ref)) (!
  (or (not (Set_in x2@38@01 xs2@14@01)) (Set_in x2@38@01 xs2@14@01))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) x2@38@01) x2@38@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@15@11@15@62-aux|)))
(assert (forall ((x2@38@01 $Ref)) (!
  (=> (Set_in x2@38@01 xs2@14@01) (= (inv_1<Ref> x2@38@01) x2@38@01))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) x2@38@01) x2@38@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@15@11@15@62|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall r: Ref :: { inv_1(r) } (inv_1(r) in xs2) ==> inv_1(r) == r)
(declare-const $t@39@01 $Snap)
(assert (= $t@39@01 $Snap.unit))
; [eval] (forall r: Ref :: { inv_1(r) } (inv_1(r) in xs2) ==> inv_1(r) == r)
(declare-const r@40@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (inv_1(r) in xs2) ==> inv_1(r) == r
; [eval] (inv_1(r) in xs2)
; [eval] inv_1(r)
(push) ; 4
; [then-branch: 6 | inv_1[Ref](r@40@01) in xs2@14@01 | live]
; [else-branch: 6 | !(inv_1[Ref](r@40@01) in xs2@14@01) | live]
(push) ; 5
; [then-branch: 6 | inv_1[Ref](r@40@01) in xs2@14@01]
(assert (Set_in (inv_1<Ref> r@40@01) xs2@14@01))
; [eval] inv_1(r) == r
; [eval] inv_1(r)
(pop) ; 5
(push) ; 5
; [else-branch: 6 | !(inv_1[Ref](r@40@01) in xs2@14@01)]
(assert (not (Set_in (inv_1<Ref> r@40@01) xs2@14@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Set_in (inv_1<Ref> r@40@01) xs2@14@01))
  (Set_in (inv_1<Ref> r@40@01) xs2@14@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@40@01 $Ref)) (!
  (or
    (not (Set_in (inv_1<Ref> r@40@01) xs2@14@01))
    (Set_in (inv_1<Ref> r@40@01) xs2@14@01))
  :pattern ((inv_1<Ref> r@40@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@15@11@15@62-aux|)))
(assert (forall ((r@40@01 $Ref)) (!
  (=> (Set_in (inv_1<Ref> r@40@01) xs2@14@01) (= (inv_1<Ref> r@40@01) r@40@01))
  :pattern ((inv_1<Ref> r@40@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@15@11@15@62|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall r: Ref ::
;     { inv_1(r) }
;     (inv_1(r) in xs2) ==>
;     perm(r.f) >= __iar__assume_helper_1((inv_0(r) in xs1) && r == r, p, p))
(declare-const $t@41@01 $Snap)
(assert (= $t@41@01 $Snap.unit))
; [eval] (forall r: Ref :: { inv_1(r) } (inv_1(r) in xs2) ==> perm(r.f) >= __iar__assume_helper_1((inv_0(r) in xs1) && r == r, p, p))
(declare-const r@42@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (inv_1(r) in xs2) ==> perm(r.f) >= __iar__assume_helper_1((inv_0(r) in xs1) && r == r, p, p)
; [eval] (inv_1(r) in xs2)
; [eval] inv_1(r)
(push) ; 4
; [then-branch: 7 | inv_1[Ref](r@42@01) in xs2@14@01 | live]
; [else-branch: 7 | !(inv_1[Ref](r@42@01) in xs2@14@01) | live]
(push) ; 5
; [then-branch: 7 | inv_1[Ref](r@42@01) in xs2@14@01]
(assert (Set_in (inv_1<Ref> r@42@01) xs2@14@01))
; [eval] perm(r.f) >= __iar__assume_helper_1((inv_0(r) in xs1) && r == r, p, p)
; [eval] perm(r.f)
; Definitional axioms for snapshot map values
(declare-const pm@43@01 $FPM)
(assert (forall ((r $Ref)) (!
  (= ($FVF.perm_f (as pm@43@01  $FPM) r) (ite (= r x@24@01) p@25@01 $Perm.No))
  :pattern (($FVF.perm_f (as pm@43@01  $FPM) r))
  :qid |qp.resPrmSumDef4|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f (as sm@28@01  $FVF<f>) r) r))
  :pattern (($FVF.perm_f (as pm@43@01  $FPM) r))
  :qid |qp.resTrgDef5|)))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r@42@01) r@42@01))
; perm(r.f)  ~~>  assume upper permission bound
(assert (<= ($FVF.perm_f (as pm@43@01  $FPM) r@42@01) $Perm.Write))
; [eval] __iar__assume_helper_1((inv_0(r) in xs1) && r == r, p, p)
; [eval] (inv_0(r) in xs1) && r == r
; [eval] (inv_0(r) in xs1)
; [eval] inv_0(r)
(push) ; 6
; [then-branch: 8 | !(inv_0[Ref](r@42@01) in xs1@13@01) | live]
; [else-branch: 8 | inv_0[Ref](r@42@01) in xs1@13@01 | live]
(push) ; 7
; [then-branch: 8 | !(inv_0[Ref](r@42@01) in xs1@13@01)]
(assert (not (Set_in (inv_0<Ref> r@42@01) xs1@13@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 8 | inv_0[Ref](r@42@01) in xs1@13@01]
(assert (Set_in (inv_0<Ref> r@42@01) xs1@13@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_0<Ref> r@42@01) xs1@13@01)
  (not (Set_in (inv_0<Ref> r@42@01) xs1@13@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 7 | !(inv_1[Ref](r@42@01) in xs2@14@01)]
(assert (not (Set_in (inv_1<Ref> r@42@01) xs2@14@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (= ($FVF.perm_f (as pm@43@01  $FPM) r) (ite (= r x@24@01) p@25@01 $Perm.No))
  :pattern (($FVF.perm_f (as pm@43@01  $FPM) r))
  :qid |qp.resPrmSumDef4|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f (as sm@28@01  $FVF<f>) r) r))
  :pattern (($FVF.perm_f (as pm@43@01  $FPM) r))
  :qid |qp.resTrgDef5|)))
(assert (=>
  (Set_in (inv_1<Ref> r@42@01) xs2@14@01)
  (and
    (Set_in (inv_1<Ref> r@42@01) xs2@14@01)
    ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r@42@01) r@42@01)
    (<= ($FVF.perm_f (as pm@43@01  $FPM) r@42@01) $Perm.Write)
    (or
      (Set_in (inv_0<Ref> r@42@01) xs1@13@01)
      (not (Set_in (inv_0<Ref> r@42@01) xs1@13@01))))))
; Joined path conditions
(assert (or
  (not (Set_in (inv_1<Ref> r@42@01) xs2@14@01))
  (Set_in (inv_1<Ref> r@42@01) xs2@14@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (= ($FVF.perm_f (as pm@43@01  $FPM) r) (ite (= r x@24@01) p@25@01 $Perm.No))
  :pattern (($FVF.perm_f (as pm@43@01  $FPM) r))
  :qid |qp.resPrmSumDef4|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f (as sm@28@01  $FVF<f>) r) r))
  :pattern (($FVF.perm_f (as pm@43@01  $FPM) r))
  :qid |qp.resTrgDef5|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@42@01 $Ref)) (!
  (and
    (=>
      (Set_in (inv_1<Ref> r@42@01) xs2@14@01)
      (and
        (Set_in (inv_1<Ref> r@42@01) xs2@14@01)
        ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r@42@01) r@42@01)
        (<= ($FVF.perm_f (as pm@43@01  $FPM) r@42@01) $Perm.Write)
        (or
          (Set_in (inv_0<Ref> r@42@01) xs1@13@01)
          (not (Set_in (inv_0<Ref> r@42@01) xs1@13@01)))))
    (or
      (not (Set_in (inv_1<Ref> r@42@01) xs2@14@01))
      (Set_in (inv_1<Ref> r@42@01) xs2@14@01)))
  :pattern ((inv_1<Ref> r@42@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@15@11@15@62-aux|)))
(assert (forall ((r@42@01 $Ref)) (!
  (=>
    (Set_in (inv_1<Ref> r@42@01) xs2@14@01)
    (>=
      ($FVF.perm_f (as pm@43@01  $FPM) r@42@01)
      (__iar__assume_helper_1<Perm> (Set_in (inv_0<Ref> r@42@01) xs1@13@01) p@25@01 p@25@01)))
  :pattern ((inv_1<Ref> r@42@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@15@11@15@62|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x3: Ref :: { x3.f } (x3 in xs3) ==> true && inv_2(x3) == x3)
(declare-const $t@44@01 $Snap)
(assert (= $t@44@01 $Snap.unit))
; [eval] (forall x3: Ref :: { x3.f } (x3 in xs3) ==> true && inv_2(x3) == x3)
(declare-const x3@45@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x3 in xs3) ==> true && inv_2(x3) == x3
; [eval] (x3 in xs3)
(push) ; 4
; [then-branch: 9 | x3@45@01 in xs3@15@01 | live]
; [else-branch: 9 | !(x3@45@01 in xs3@15@01) | live]
(push) ; 5
; [then-branch: 9 | x3@45@01 in xs3@15@01]
(assert (Set_in x3@45@01 xs3@15@01))
; [eval] true && inv_2(x3) == x3
(push) ; 6
; [then-branch: 10 | False | live]
; [else-branch: 10 | True | live]
(push) ; 7
; [then-branch: 10 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 10 | True]
; [eval] inv_2(x3) == x3
; [eval] inv_2(x3)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(push) ; 5
; [else-branch: 9 | !(x3@45@01 in xs3@15@01)]
(assert (not (Set_in x3@45@01 xs3@15@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in x3@45@01 xs3@15@01)) (Set_in x3@45@01 xs3@15@01)))
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x3@45@01 $Ref)) (!
  (or (not (Set_in x3@45@01 xs3@15@01)) (Set_in x3@45@01 xs3@15@01))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) x3@45@01) x3@45@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@16@11@16@62-aux|)))
(assert (forall ((x3@45@01 $Ref)) (!
  (=> (Set_in x3@45@01 xs3@15@01) (= (inv_2<Ref> x3@45@01) x3@45@01))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) x3@45@01) x3@45@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@16@11@16@62|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall r: Ref :: { inv_2(r) } (inv_2(r) in xs3) ==> inv_2(r) == r)
(declare-const $t@46@01 $Snap)
(assert (= $t@46@01 $Snap.unit))
; [eval] (forall r: Ref :: { inv_2(r) } (inv_2(r) in xs3) ==> inv_2(r) == r)
(declare-const r@47@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (inv_2(r) in xs3) ==> inv_2(r) == r
; [eval] (inv_2(r) in xs3)
; [eval] inv_2(r)
(push) ; 4
; [then-branch: 11 | inv_2[Ref](r@47@01) in xs3@15@01 | live]
; [else-branch: 11 | !(inv_2[Ref](r@47@01) in xs3@15@01) | live]
(push) ; 5
; [then-branch: 11 | inv_2[Ref](r@47@01) in xs3@15@01]
(assert (Set_in (inv_2<Ref> r@47@01) xs3@15@01))
; [eval] inv_2(r) == r
; [eval] inv_2(r)
(pop) ; 5
(push) ; 5
; [else-branch: 11 | !(inv_2[Ref](r@47@01) in xs3@15@01)]
(assert (not (Set_in (inv_2<Ref> r@47@01) xs3@15@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Set_in (inv_2<Ref> r@47@01) xs3@15@01))
  (Set_in (inv_2<Ref> r@47@01) xs3@15@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@47@01 $Ref)) (!
  (or
    (not (Set_in (inv_2<Ref> r@47@01) xs3@15@01))
    (Set_in (inv_2<Ref> r@47@01) xs3@15@01))
  :pattern ((inv_2<Ref> r@47@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@16@11@16@62-aux|)))
(assert (forall ((r@47@01 $Ref)) (!
  (=> (Set_in (inv_2<Ref> r@47@01) xs3@15@01) (= (inv_2<Ref> r@47@01) r@47@01))
  :pattern ((inv_2<Ref> r@47@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@16@11@16@62|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall r: Ref ::
;     { inv_2(r) }
;     (inv_2(r) in xs3) ==>
;     perm(r.f) >=
;     __iar__assume_helper_2((inv_0(r) in xs1) && r == r, (inv_1(r) in xs2) &&
;     r == r, p, p, p))
(declare-const $t@48@01 $Snap)
(assert (= $t@48@01 $Snap.unit))
; [eval] (forall r: Ref :: { inv_2(r) } (inv_2(r) in xs3) ==> perm(r.f) >= __iar__assume_helper_2((inv_0(r) in xs1) && r == r, (inv_1(r) in xs2) && r == r, p, p, p))
(declare-const r@49@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (inv_2(r) in xs3) ==> perm(r.f) >= __iar__assume_helper_2((inv_0(r) in xs1) && r == r, (inv_1(r) in xs2) && r == r, p, p, p)
; [eval] (inv_2(r) in xs3)
; [eval] inv_2(r)
(push) ; 4
; [then-branch: 12 | inv_2[Ref](r@49@01) in xs3@15@01 | live]
; [else-branch: 12 | !(inv_2[Ref](r@49@01) in xs3@15@01) | live]
(push) ; 5
; [then-branch: 12 | inv_2[Ref](r@49@01) in xs3@15@01]
(assert (Set_in (inv_2<Ref> r@49@01) xs3@15@01))
; [eval] perm(r.f) >= __iar__assume_helper_2((inv_0(r) in xs1) && r == r, (inv_1(r) in xs2) && r == r, p, p, p)
; [eval] perm(r.f)
; Definitional axioms for snapshot map values
(declare-const pm@50@01 $FPM)
(assert (forall ((r $Ref)) (!
  (= ($FVF.perm_f (as pm@50@01  $FPM) r) (ite (= r x@24@01) p@25@01 $Perm.No))
  :pattern (($FVF.perm_f (as pm@50@01  $FPM) r))
  :qid |qp.resPrmSumDef6|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f (as sm@28@01  $FVF<f>) r) r))
  :pattern (($FVF.perm_f (as pm@50@01  $FPM) r))
  :qid |qp.resTrgDef7|)))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r@49@01) r@49@01))
; perm(r.f)  ~~>  assume upper permission bound
(assert (<= ($FVF.perm_f (as pm@50@01  $FPM) r@49@01) $Perm.Write))
; [eval] __iar__assume_helper_2((inv_0(r) in xs1) && r == r, (inv_1(r) in xs2) && r == r, p, p, p)
; [eval] (inv_0(r) in xs1) && r == r
; [eval] (inv_0(r) in xs1)
; [eval] inv_0(r)
(push) ; 6
; [then-branch: 13 | !(inv_0[Ref](r@49@01) in xs1@13@01) | live]
; [else-branch: 13 | inv_0[Ref](r@49@01) in xs1@13@01 | live]
(push) ; 7
; [then-branch: 13 | !(inv_0[Ref](r@49@01) in xs1@13@01)]
(assert (not (Set_in (inv_0<Ref> r@49@01) xs1@13@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 13 | inv_0[Ref](r@49@01) in xs1@13@01]
(assert (Set_in (inv_0<Ref> r@49@01) xs1@13@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_0<Ref> r@49@01) xs1@13@01)
  (not (Set_in (inv_0<Ref> r@49@01) xs1@13@01))))
; [eval] (inv_1(r) in xs2) && r == r
; [eval] (inv_1(r) in xs2)
; [eval] inv_1(r)
(push) ; 6
; [then-branch: 14 | !(inv_1[Ref](r@49@01) in xs2@14@01) | live]
; [else-branch: 14 | inv_1[Ref](r@49@01) in xs2@14@01 | live]
(push) ; 7
; [then-branch: 14 | !(inv_1[Ref](r@49@01) in xs2@14@01)]
(assert (not (Set_in (inv_1<Ref> r@49@01) xs2@14@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 14 | inv_1[Ref](r@49@01) in xs2@14@01]
(assert (Set_in (inv_1<Ref> r@49@01) xs2@14@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_1<Ref> r@49@01) xs2@14@01)
  (not (Set_in (inv_1<Ref> r@49@01) xs2@14@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 12 | !(inv_2[Ref](r@49@01) in xs3@15@01)]
(assert (not (Set_in (inv_2<Ref> r@49@01) xs3@15@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (= ($FVF.perm_f (as pm@50@01  $FPM) r) (ite (= r x@24@01) p@25@01 $Perm.No))
  :pattern (($FVF.perm_f (as pm@50@01  $FPM) r))
  :qid |qp.resPrmSumDef6|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f (as sm@28@01  $FVF<f>) r) r))
  :pattern (($FVF.perm_f (as pm@50@01  $FPM) r))
  :qid |qp.resTrgDef7|)))
(assert (=>
  (Set_in (inv_2<Ref> r@49@01) xs3@15@01)
  (and
    (Set_in (inv_2<Ref> r@49@01) xs3@15@01)
    ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r@49@01) r@49@01)
    (<= ($FVF.perm_f (as pm@50@01  $FPM) r@49@01) $Perm.Write)
    (or
      (Set_in (inv_0<Ref> r@49@01) xs1@13@01)
      (not (Set_in (inv_0<Ref> r@49@01) xs1@13@01)))
    (or
      (Set_in (inv_1<Ref> r@49@01) xs2@14@01)
      (not (Set_in (inv_1<Ref> r@49@01) xs2@14@01))))))
; Joined path conditions
(assert (or
  (not (Set_in (inv_2<Ref> r@49@01) xs3@15@01))
  (Set_in (inv_2<Ref> r@49@01) xs3@15@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (= ($FVF.perm_f (as pm@50@01  $FPM) r) (ite (= r x@24@01) p@25@01 $Perm.No))
  :pattern (($FVF.perm_f (as pm@50@01  $FPM) r))
  :qid |qp.resPrmSumDef6|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f (as sm@28@01  $FVF<f>) r) r))
  :pattern (($FVF.perm_f (as pm@50@01  $FPM) r))
  :qid |qp.resTrgDef7|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@49@01 $Ref)) (!
  (and
    (=>
      (Set_in (inv_2<Ref> r@49@01) xs3@15@01)
      (and
        (Set_in (inv_2<Ref> r@49@01) xs3@15@01)
        ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r@49@01) r@49@01)
        (<= ($FVF.perm_f (as pm@50@01  $FPM) r@49@01) $Perm.Write)
        (or
          (Set_in (inv_0<Ref> r@49@01) xs1@13@01)
          (not (Set_in (inv_0<Ref> r@49@01) xs1@13@01)))
        (or
          (Set_in (inv_1<Ref> r@49@01) xs2@14@01)
          (not (Set_in (inv_1<Ref> r@49@01) xs2@14@01)))))
    (or
      (not (Set_in (inv_2<Ref> r@49@01) xs3@15@01))
      (Set_in (inv_2<Ref> r@49@01) xs3@15@01)))
  :pattern ((inv_2<Ref> r@49@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@16@11@16@62-aux|)))
(assert (forall ((r@49@01 $Ref)) (!
  (=>
    (Set_in (inv_2<Ref> r@49@01) xs3@15@01)
    (>=
      ($FVF.perm_f (as pm@50@01  $FPM) r@49@01)
      (__iar__assume_helper_2<Perm> (Set_in (inv_0<Ref> r@49@01) xs1@13@01) (Set_in (inv_1<Ref> r@49@01) xs2@14@01) p@25@01 p@25@01 p@25@01)))
  :pattern ((inv_2<Ref> r@49@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@16@11@16@62|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x4: Ref :: { x4.f } (x4 in xs4) ==> true && inv_3(x4) == x4)
(declare-const $t@51@01 $Snap)
(assert (= $t@51@01 $Snap.unit))
; [eval] (forall x4: Ref :: { x4.f } (x4 in xs4) ==> true && inv_3(x4) == x4)
(declare-const x4@52@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x4 in xs4) ==> true && inv_3(x4) == x4
; [eval] (x4 in xs4)
(push) ; 4
; [then-branch: 15 | x4@52@01 in xs4@16@01 | live]
; [else-branch: 15 | !(x4@52@01 in xs4@16@01) | live]
(push) ; 5
; [then-branch: 15 | x4@52@01 in xs4@16@01]
(assert (Set_in x4@52@01 xs4@16@01))
; [eval] true && inv_3(x4) == x4
(push) ; 6
; [then-branch: 16 | False | live]
; [else-branch: 16 | True | live]
(push) ; 7
; [then-branch: 16 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 16 | True]
; [eval] inv_3(x4) == x4
; [eval] inv_3(x4)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(push) ; 5
; [else-branch: 15 | !(x4@52@01 in xs4@16@01)]
(assert (not (Set_in x4@52@01 xs4@16@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in x4@52@01 xs4@16@01)) (Set_in x4@52@01 xs4@16@01)))
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x4@52@01 $Ref)) (!
  (or (not (Set_in x4@52@01 xs4@16@01)) (Set_in x4@52@01 xs4@16@01))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) x4@52@01) x4@52@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@17@11@17@62-aux|)))
(assert (forall ((x4@52@01 $Ref)) (!
  (=> (Set_in x4@52@01 xs4@16@01) (= (inv_3<Ref> x4@52@01) x4@52@01))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) x4@52@01) x4@52@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@17@11@17@62|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall r: Ref :: { inv_3(r) } (inv_3(r) in xs4) ==> inv_3(r) == r)
(declare-const $t@53@01 $Snap)
(assert (= $t@53@01 $Snap.unit))
; [eval] (forall r: Ref :: { inv_3(r) } (inv_3(r) in xs4) ==> inv_3(r) == r)
(declare-const r@54@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (inv_3(r) in xs4) ==> inv_3(r) == r
; [eval] (inv_3(r) in xs4)
; [eval] inv_3(r)
(push) ; 4
; [then-branch: 17 | inv_3[Ref](r@54@01) in xs4@16@01 | live]
; [else-branch: 17 | !(inv_3[Ref](r@54@01) in xs4@16@01) | live]
(push) ; 5
; [then-branch: 17 | inv_3[Ref](r@54@01) in xs4@16@01]
(assert (Set_in (inv_3<Ref> r@54@01) xs4@16@01))
; [eval] inv_3(r) == r
; [eval] inv_3(r)
(pop) ; 5
(push) ; 5
; [else-branch: 17 | !(inv_3[Ref](r@54@01) in xs4@16@01)]
(assert (not (Set_in (inv_3<Ref> r@54@01) xs4@16@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Set_in (inv_3<Ref> r@54@01) xs4@16@01))
  (Set_in (inv_3<Ref> r@54@01) xs4@16@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@54@01 $Ref)) (!
  (or
    (not (Set_in (inv_3<Ref> r@54@01) xs4@16@01))
    (Set_in (inv_3<Ref> r@54@01) xs4@16@01))
  :pattern ((inv_3<Ref> r@54@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@17@11@17@62-aux|)))
(assert (forall ((r@54@01 $Ref)) (!
  (=> (Set_in (inv_3<Ref> r@54@01) xs4@16@01) (= (inv_3<Ref> r@54@01) r@54@01))
  :pattern ((inv_3<Ref> r@54@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@17@11@17@62|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall r: Ref ::
;     { inv_3(r) }
;     (inv_3(r) in xs4) ==>
;     perm(r.f) >=
;     __iar__assume_helper_3((inv_0(r) in xs1) && r == r, (inv_1(r) in xs2) &&
;     r == r, (inv_2(r) in xs3) && r == r, p, p, p, p))
(declare-const $t@55@01 $Snap)
(assert (= $t@55@01 $Snap.unit))
; [eval] (forall r: Ref :: { inv_3(r) } (inv_3(r) in xs4) ==> perm(r.f) >= __iar__assume_helper_3((inv_0(r) in xs1) && r == r, (inv_1(r) in xs2) && r == r, (inv_2(r) in xs3) && r == r, p, p, p, p))
(declare-const r@56@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (inv_3(r) in xs4) ==> perm(r.f) >= __iar__assume_helper_3((inv_0(r) in xs1) && r == r, (inv_1(r) in xs2) && r == r, (inv_2(r) in xs3) && r == r, p, p, p, p)
; [eval] (inv_3(r) in xs4)
; [eval] inv_3(r)
(push) ; 4
; [then-branch: 18 | inv_3[Ref](r@56@01) in xs4@16@01 | live]
; [else-branch: 18 | !(inv_3[Ref](r@56@01) in xs4@16@01) | live]
(push) ; 5
; [then-branch: 18 | inv_3[Ref](r@56@01) in xs4@16@01]
(assert (Set_in (inv_3<Ref> r@56@01) xs4@16@01))
; [eval] perm(r.f) >= __iar__assume_helper_3((inv_0(r) in xs1) && r == r, (inv_1(r) in xs2) && r == r, (inv_2(r) in xs3) && r == r, p, p, p, p)
; [eval] perm(r.f)
; Definitional axioms for snapshot map values
(declare-const pm@57@01 $FPM)
(assert (forall ((r $Ref)) (!
  (= ($FVF.perm_f (as pm@57@01  $FPM) r) (ite (= r x@24@01) p@25@01 $Perm.No))
  :pattern (($FVF.perm_f (as pm@57@01  $FPM) r))
  :qid |qp.resPrmSumDef8|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f (as sm@28@01  $FVF<f>) r) r))
  :pattern (($FVF.perm_f (as pm@57@01  $FPM) r))
  :qid |qp.resTrgDef9|)))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r@56@01) r@56@01))
; perm(r.f)  ~~>  assume upper permission bound
(assert (<= ($FVF.perm_f (as pm@57@01  $FPM) r@56@01) $Perm.Write))
; [eval] __iar__assume_helper_3((inv_0(r) in xs1) && r == r, (inv_1(r) in xs2) && r == r, (inv_2(r) in xs3) && r == r, p, p, p, p)
; [eval] (inv_0(r) in xs1) && r == r
; [eval] (inv_0(r) in xs1)
; [eval] inv_0(r)
(push) ; 6
; [then-branch: 19 | !(inv_0[Ref](r@56@01) in xs1@13@01) | live]
; [else-branch: 19 | inv_0[Ref](r@56@01) in xs1@13@01 | live]
(push) ; 7
; [then-branch: 19 | !(inv_0[Ref](r@56@01) in xs1@13@01)]
(assert (not (Set_in (inv_0<Ref> r@56@01) xs1@13@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 19 | inv_0[Ref](r@56@01) in xs1@13@01]
(assert (Set_in (inv_0<Ref> r@56@01) xs1@13@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_0<Ref> r@56@01) xs1@13@01)
  (not (Set_in (inv_0<Ref> r@56@01) xs1@13@01))))
; [eval] (inv_1(r) in xs2) && r == r
; [eval] (inv_1(r) in xs2)
; [eval] inv_1(r)
(push) ; 6
; [then-branch: 20 | !(inv_1[Ref](r@56@01) in xs2@14@01) | live]
; [else-branch: 20 | inv_1[Ref](r@56@01) in xs2@14@01 | live]
(push) ; 7
; [then-branch: 20 | !(inv_1[Ref](r@56@01) in xs2@14@01)]
(assert (not (Set_in (inv_1<Ref> r@56@01) xs2@14@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 20 | inv_1[Ref](r@56@01) in xs2@14@01]
(assert (Set_in (inv_1<Ref> r@56@01) xs2@14@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_1<Ref> r@56@01) xs2@14@01)
  (not (Set_in (inv_1<Ref> r@56@01) xs2@14@01))))
; [eval] (inv_2(r) in xs3) && r == r
; [eval] (inv_2(r) in xs3)
; [eval] inv_2(r)
(push) ; 6
; [then-branch: 21 | !(inv_2[Ref](r@56@01) in xs3@15@01) | live]
; [else-branch: 21 | inv_2[Ref](r@56@01) in xs3@15@01 | live]
(push) ; 7
; [then-branch: 21 | !(inv_2[Ref](r@56@01) in xs3@15@01)]
(assert (not (Set_in (inv_2<Ref> r@56@01) xs3@15@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 21 | inv_2[Ref](r@56@01) in xs3@15@01]
(assert (Set_in (inv_2<Ref> r@56@01) xs3@15@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_2<Ref> r@56@01) xs3@15@01)
  (not (Set_in (inv_2<Ref> r@56@01) xs3@15@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 18 | !(inv_3[Ref](r@56@01) in xs4@16@01)]
(assert (not (Set_in (inv_3<Ref> r@56@01) xs4@16@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (= ($FVF.perm_f (as pm@57@01  $FPM) r) (ite (= r x@24@01) p@25@01 $Perm.No))
  :pattern (($FVF.perm_f (as pm@57@01  $FPM) r))
  :qid |qp.resPrmSumDef8|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f (as sm@28@01  $FVF<f>) r) r))
  :pattern (($FVF.perm_f (as pm@57@01  $FPM) r))
  :qid |qp.resTrgDef9|)))
(assert (=>
  (Set_in (inv_3<Ref> r@56@01) xs4@16@01)
  (and
    (Set_in (inv_3<Ref> r@56@01) xs4@16@01)
    ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r@56@01) r@56@01)
    (<= ($FVF.perm_f (as pm@57@01  $FPM) r@56@01) $Perm.Write)
    (or
      (Set_in (inv_0<Ref> r@56@01) xs1@13@01)
      (not (Set_in (inv_0<Ref> r@56@01) xs1@13@01)))
    (or
      (Set_in (inv_1<Ref> r@56@01) xs2@14@01)
      (not (Set_in (inv_1<Ref> r@56@01) xs2@14@01)))
    (or
      (Set_in (inv_2<Ref> r@56@01) xs3@15@01)
      (not (Set_in (inv_2<Ref> r@56@01) xs3@15@01))))))
; Joined path conditions
(assert (or
  (not (Set_in (inv_3<Ref> r@56@01) xs4@16@01))
  (Set_in (inv_3<Ref> r@56@01) xs4@16@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (= ($FVF.perm_f (as pm@57@01  $FPM) r) (ite (= r x@24@01) p@25@01 $Perm.No))
  :pattern (($FVF.perm_f (as pm@57@01  $FPM) r))
  :qid |qp.resPrmSumDef8|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f (as sm@28@01  $FVF<f>) r) r))
  :pattern (($FVF.perm_f (as pm@57@01  $FPM) r))
  :qid |qp.resTrgDef9|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@56@01 $Ref)) (!
  (and
    (=>
      (Set_in (inv_3<Ref> r@56@01) xs4@16@01)
      (and
        (Set_in (inv_3<Ref> r@56@01) xs4@16@01)
        ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r@56@01) r@56@01)
        (<= ($FVF.perm_f (as pm@57@01  $FPM) r@56@01) $Perm.Write)
        (or
          (Set_in (inv_0<Ref> r@56@01) xs1@13@01)
          (not (Set_in (inv_0<Ref> r@56@01) xs1@13@01)))
        (or
          (Set_in (inv_1<Ref> r@56@01) xs2@14@01)
          (not (Set_in (inv_1<Ref> r@56@01) xs2@14@01)))
        (or
          (Set_in (inv_2<Ref> r@56@01) xs3@15@01)
          (not (Set_in (inv_2<Ref> r@56@01) xs3@15@01)))))
    (or
      (not (Set_in (inv_3<Ref> r@56@01) xs4@16@01))
      (Set_in (inv_3<Ref> r@56@01) xs4@16@01)))
  :pattern ((inv_3<Ref> r@56@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@17@11@17@62-aux|)))
(assert (forall ((r@56@01 $Ref)) (!
  (=>
    (Set_in (inv_3<Ref> r@56@01) xs4@16@01)
    (>=
      ($FVF.perm_f (as pm@57@01  $FPM) r@56@01)
      (__iar__assume_helper_3<Perm> (Set_in (inv_0<Ref> r@56@01) xs1@13@01) (Set_in (inv_1<Ref> r@56@01) xs2@14@01) (Set_in (inv_2<Ref> r@56@01) xs3@15@01) p@25@01 p@25@01 p@25@01 p@25@01)))
  :pattern ((inv_3<Ref> r@56@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@17@11@17@62|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x5: Ref :: { x5.f } (x5 in xs5) ==> true && inv_4(x5) == x5)
(declare-const $t@58@01 $Snap)
(assert (= $t@58@01 $Snap.unit))
; [eval] (forall x5: Ref :: { x5.f } (x5 in xs5) ==> true && inv_4(x5) == x5)
(declare-const x5@59@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x5 in xs5) ==> true && inv_4(x5) == x5
; [eval] (x5 in xs5)
(push) ; 4
; [then-branch: 22 | x5@59@01 in xs5@17@01 | live]
; [else-branch: 22 | !(x5@59@01 in xs5@17@01) | live]
(push) ; 5
; [then-branch: 22 | x5@59@01 in xs5@17@01]
(assert (Set_in x5@59@01 xs5@17@01))
; [eval] true && inv_4(x5) == x5
(push) ; 6
; [then-branch: 23 | False | live]
; [else-branch: 23 | True | live]
(push) ; 7
; [then-branch: 23 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 23 | True]
; [eval] inv_4(x5) == x5
; [eval] inv_4(x5)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(push) ; 5
; [else-branch: 22 | !(x5@59@01 in xs5@17@01)]
(assert (not (Set_in x5@59@01 xs5@17@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in x5@59@01 xs5@17@01)) (Set_in x5@59@01 xs5@17@01)))
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x5@59@01 $Ref)) (!
  (or (not (Set_in x5@59@01 xs5@17@01)) (Set_in x5@59@01 xs5@17@01))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) x5@59@01) x5@59@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@18@11@18@62-aux|)))
(assert (forall ((x5@59@01 $Ref)) (!
  (=> (Set_in x5@59@01 xs5@17@01) (= (inv_4<Ref> x5@59@01) x5@59@01))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) x5@59@01) x5@59@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@18@11@18@62|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall r: Ref :: { inv_4(r) } (inv_4(r) in xs5) ==> inv_4(r) == r)
(declare-const $t@60@01 $Snap)
(assert (= $t@60@01 $Snap.unit))
; [eval] (forall r: Ref :: { inv_4(r) } (inv_4(r) in xs5) ==> inv_4(r) == r)
(declare-const r@61@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (inv_4(r) in xs5) ==> inv_4(r) == r
; [eval] (inv_4(r) in xs5)
; [eval] inv_4(r)
(push) ; 4
; [then-branch: 24 | inv_4[Ref](r@61@01) in xs5@17@01 | live]
; [else-branch: 24 | !(inv_4[Ref](r@61@01) in xs5@17@01) | live]
(push) ; 5
; [then-branch: 24 | inv_4[Ref](r@61@01) in xs5@17@01]
(assert (Set_in (inv_4<Ref> r@61@01) xs5@17@01))
; [eval] inv_4(r) == r
; [eval] inv_4(r)
(pop) ; 5
(push) ; 5
; [else-branch: 24 | !(inv_4[Ref](r@61@01) in xs5@17@01)]
(assert (not (Set_in (inv_4<Ref> r@61@01) xs5@17@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Set_in (inv_4<Ref> r@61@01) xs5@17@01))
  (Set_in (inv_4<Ref> r@61@01) xs5@17@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@61@01 $Ref)) (!
  (or
    (not (Set_in (inv_4<Ref> r@61@01) xs5@17@01))
    (Set_in (inv_4<Ref> r@61@01) xs5@17@01))
  :pattern ((inv_4<Ref> r@61@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@18@11@18@62-aux|)))
(assert (forall ((r@61@01 $Ref)) (!
  (=> (Set_in (inv_4<Ref> r@61@01) xs5@17@01) (= (inv_4<Ref> r@61@01) r@61@01))
  :pattern ((inv_4<Ref> r@61@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@18@11@18@62|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall r: Ref ::
;     { inv_4(r) }
;     (inv_4(r) in xs5) ==>
;     perm(r.f) >=
;     __iar__assume_helper_4((inv_0(r) in xs1) && r == r, (inv_1(r) in xs2) &&
;     r == r, (inv_2(r) in xs3) && r == r, (inv_3(r) in xs4) && r == r, p, p,
;     p, p, p))
(declare-const $t@62@01 $Snap)
(assert (= $t@62@01 $Snap.unit))
; [eval] (forall r: Ref :: { inv_4(r) } (inv_4(r) in xs5) ==> perm(r.f) >= __iar__assume_helper_4((inv_0(r) in xs1) && r == r, (inv_1(r) in xs2) && r == r, (inv_2(r) in xs3) && r == r, (inv_3(r) in xs4) && r == r, p, p, p, p, p))
(declare-const r@63@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (inv_4(r) in xs5) ==> perm(r.f) >= __iar__assume_helper_4((inv_0(r) in xs1) && r == r, (inv_1(r) in xs2) && r == r, (inv_2(r) in xs3) && r == r, (inv_3(r) in xs4) && r == r, p, p, p, p, p)
; [eval] (inv_4(r) in xs5)
; [eval] inv_4(r)
(push) ; 4
; [then-branch: 25 | inv_4[Ref](r@63@01) in xs5@17@01 | live]
; [else-branch: 25 | !(inv_4[Ref](r@63@01) in xs5@17@01) | live]
(push) ; 5
; [then-branch: 25 | inv_4[Ref](r@63@01) in xs5@17@01]
(assert (Set_in (inv_4<Ref> r@63@01) xs5@17@01))
; [eval] perm(r.f) >= __iar__assume_helper_4((inv_0(r) in xs1) && r == r, (inv_1(r) in xs2) && r == r, (inv_2(r) in xs3) && r == r, (inv_3(r) in xs4) && r == r, p, p, p, p, p)
; [eval] perm(r.f)
; Definitional axioms for snapshot map values
(declare-const pm@64@01 $FPM)
(assert (forall ((r $Ref)) (!
  (= ($FVF.perm_f (as pm@64@01  $FPM) r) (ite (= r x@24@01) p@25@01 $Perm.No))
  :pattern (($FVF.perm_f (as pm@64@01  $FPM) r))
  :qid |qp.resPrmSumDef10|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f (as sm@28@01  $FVF<f>) r) r))
  :pattern (($FVF.perm_f (as pm@64@01  $FPM) r))
  :qid |qp.resTrgDef11|)))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r@63@01) r@63@01))
; perm(r.f)  ~~>  assume upper permission bound
(assert (<= ($FVF.perm_f (as pm@64@01  $FPM) r@63@01) $Perm.Write))
; [eval] __iar__assume_helper_4((inv_0(r) in xs1) && r == r, (inv_1(r) in xs2) && r == r, (inv_2(r) in xs3) && r == r, (inv_3(r) in xs4) && r == r, p, p, p, p, p)
; [eval] (inv_0(r) in xs1) && r == r
; [eval] (inv_0(r) in xs1)
; [eval] inv_0(r)
(push) ; 6
; [then-branch: 26 | !(inv_0[Ref](r@63@01) in xs1@13@01) | live]
; [else-branch: 26 | inv_0[Ref](r@63@01) in xs1@13@01 | live]
(push) ; 7
; [then-branch: 26 | !(inv_0[Ref](r@63@01) in xs1@13@01)]
(assert (not (Set_in (inv_0<Ref> r@63@01) xs1@13@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 26 | inv_0[Ref](r@63@01) in xs1@13@01]
(assert (Set_in (inv_0<Ref> r@63@01) xs1@13@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_0<Ref> r@63@01) xs1@13@01)
  (not (Set_in (inv_0<Ref> r@63@01) xs1@13@01))))
; [eval] (inv_1(r) in xs2) && r == r
; [eval] (inv_1(r) in xs2)
; [eval] inv_1(r)
(push) ; 6
; [then-branch: 27 | !(inv_1[Ref](r@63@01) in xs2@14@01) | live]
; [else-branch: 27 | inv_1[Ref](r@63@01) in xs2@14@01 | live]
(push) ; 7
; [then-branch: 27 | !(inv_1[Ref](r@63@01) in xs2@14@01)]
(assert (not (Set_in (inv_1<Ref> r@63@01) xs2@14@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 27 | inv_1[Ref](r@63@01) in xs2@14@01]
(assert (Set_in (inv_1<Ref> r@63@01) xs2@14@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_1<Ref> r@63@01) xs2@14@01)
  (not (Set_in (inv_1<Ref> r@63@01) xs2@14@01))))
; [eval] (inv_2(r) in xs3) && r == r
; [eval] (inv_2(r) in xs3)
; [eval] inv_2(r)
(push) ; 6
; [then-branch: 28 | !(inv_2[Ref](r@63@01) in xs3@15@01) | live]
; [else-branch: 28 | inv_2[Ref](r@63@01) in xs3@15@01 | live]
(push) ; 7
; [then-branch: 28 | !(inv_2[Ref](r@63@01) in xs3@15@01)]
(assert (not (Set_in (inv_2<Ref> r@63@01) xs3@15@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 28 | inv_2[Ref](r@63@01) in xs3@15@01]
(assert (Set_in (inv_2<Ref> r@63@01) xs3@15@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_2<Ref> r@63@01) xs3@15@01)
  (not (Set_in (inv_2<Ref> r@63@01) xs3@15@01))))
; [eval] (inv_3(r) in xs4) && r == r
; [eval] (inv_3(r) in xs4)
; [eval] inv_3(r)
(push) ; 6
; [then-branch: 29 | !(inv_3[Ref](r@63@01) in xs4@16@01) | live]
; [else-branch: 29 | inv_3[Ref](r@63@01) in xs4@16@01 | live]
(push) ; 7
; [then-branch: 29 | !(inv_3[Ref](r@63@01) in xs4@16@01)]
(assert (not (Set_in (inv_3<Ref> r@63@01) xs4@16@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 29 | inv_3[Ref](r@63@01) in xs4@16@01]
(assert (Set_in (inv_3<Ref> r@63@01) xs4@16@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_3<Ref> r@63@01) xs4@16@01)
  (not (Set_in (inv_3<Ref> r@63@01) xs4@16@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 25 | !(inv_4[Ref](r@63@01) in xs5@17@01)]
(assert (not (Set_in (inv_4<Ref> r@63@01) xs5@17@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (= ($FVF.perm_f (as pm@64@01  $FPM) r) (ite (= r x@24@01) p@25@01 $Perm.No))
  :pattern (($FVF.perm_f (as pm@64@01  $FPM) r))
  :qid |qp.resPrmSumDef10|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f (as sm@28@01  $FVF<f>) r) r))
  :pattern (($FVF.perm_f (as pm@64@01  $FPM) r))
  :qid |qp.resTrgDef11|)))
(assert (=>
  (Set_in (inv_4<Ref> r@63@01) xs5@17@01)
  (and
    (Set_in (inv_4<Ref> r@63@01) xs5@17@01)
    ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r@63@01) r@63@01)
    (<= ($FVF.perm_f (as pm@64@01  $FPM) r@63@01) $Perm.Write)
    (or
      (Set_in (inv_0<Ref> r@63@01) xs1@13@01)
      (not (Set_in (inv_0<Ref> r@63@01) xs1@13@01)))
    (or
      (Set_in (inv_1<Ref> r@63@01) xs2@14@01)
      (not (Set_in (inv_1<Ref> r@63@01) xs2@14@01)))
    (or
      (Set_in (inv_2<Ref> r@63@01) xs3@15@01)
      (not (Set_in (inv_2<Ref> r@63@01) xs3@15@01)))
    (or
      (Set_in (inv_3<Ref> r@63@01) xs4@16@01)
      (not (Set_in (inv_3<Ref> r@63@01) xs4@16@01))))))
; Joined path conditions
(assert (or
  (not (Set_in (inv_4<Ref> r@63@01) xs5@17@01))
  (Set_in (inv_4<Ref> r@63@01) xs5@17@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (= ($FVF.perm_f (as pm@64@01  $FPM) r) (ite (= r x@24@01) p@25@01 $Perm.No))
  :pattern (($FVF.perm_f (as pm@64@01  $FPM) r))
  :qid |qp.resPrmSumDef10|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f (as sm@28@01  $FVF<f>) r) r))
  :pattern (($FVF.perm_f (as pm@64@01  $FPM) r))
  :qid |qp.resTrgDef11|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@63@01 $Ref)) (!
  (and
    (=>
      (Set_in (inv_4<Ref> r@63@01) xs5@17@01)
      (and
        (Set_in (inv_4<Ref> r@63@01) xs5@17@01)
        ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r@63@01) r@63@01)
        (<= ($FVF.perm_f (as pm@64@01  $FPM) r@63@01) $Perm.Write)
        (or
          (Set_in (inv_0<Ref> r@63@01) xs1@13@01)
          (not (Set_in (inv_0<Ref> r@63@01) xs1@13@01)))
        (or
          (Set_in (inv_1<Ref> r@63@01) xs2@14@01)
          (not (Set_in (inv_1<Ref> r@63@01) xs2@14@01)))
        (or
          (Set_in (inv_2<Ref> r@63@01) xs3@15@01)
          (not (Set_in (inv_2<Ref> r@63@01) xs3@15@01)))
        (or
          (Set_in (inv_3<Ref> r@63@01) xs4@16@01)
          (not (Set_in (inv_3<Ref> r@63@01) xs4@16@01)))))
    (or
      (not (Set_in (inv_4<Ref> r@63@01) xs5@17@01))
      (Set_in (inv_4<Ref> r@63@01) xs5@17@01)))
  :pattern ((inv_4<Ref> r@63@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@18@11@18@62-aux|)))
(assert (forall ((r@63@01 $Ref)) (!
  (=>
    (Set_in (inv_4<Ref> r@63@01) xs5@17@01)
    (>=
      ($FVF.perm_f (as pm@64@01  $FPM) r@63@01)
      (__iar__assume_helper_4<Perm> (Set_in (inv_0<Ref> r@63@01) xs1@13@01) (Set_in (inv_1<Ref> r@63@01) xs2@14@01) (Set_in (inv_2<Ref> r@63@01) xs3@15@01) (Set_in (inv_3<Ref> r@63@01) xs4@16@01) p@25@01 p@25@01 p@25@01 p@25@01 p@25@01)))
  :pattern ((inv_4<Ref> r@63@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@18@11@18@62|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x6: Ref :: { x6.f } (x6 in xs6) ==> true && inv_5(x6) == x6)
(declare-const $t@65@01 $Snap)
(assert (= $t@65@01 $Snap.unit))
; [eval] (forall x6: Ref :: { x6.f } (x6 in xs6) ==> true && inv_5(x6) == x6)
(declare-const x6@66@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x6 in xs6) ==> true && inv_5(x6) == x6
; [eval] (x6 in xs6)
(push) ; 4
; [then-branch: 30 | x6@66@01 in xs6@18@01 | live]
; [else-branch: 30 | !(x6@66@01 in xs6@18@01) | live]
(push) ; 5
; [then-branch: 30 | x6@66@01 in xs6@18@01]
(assert (Set_in x6@66@01 xs6@18@01))
; [eval] true && inv_5(x6) == x6
(push) ; 6
; [then-branch: 31 | False | live]
; [else-branch: 31 | True | live]
(push) ; 7
; [then-branch: 31 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 31 | True]
; [eval] inv_5(x6) == x6
; [eval] inv_5(x6)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(push) ; 5
; [else-branch: 30 | !(x6@66@01 in xs6@18@01)]
(assert (not (Set_in x6@66@01 xs6@18@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in x6@66@01 xs6@18@01)) (Set_in x6@66@01 xs6@18@01)))
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x6@66@01 $Ref)) (!
  (or (not (Set_in x6@66@01 xs6@18@01)) (Set_in x6@66@01 xs6@18@01))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) x6@66@01) x6@66@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@19@11@19@62-aux|)))
(assert (forall ((x6@66@01 $Ref)) (!
  (=> (Set_in x6@66@01 xs6@18@01) (= (inv_5<Ref> x6@66@01) x6@66@01))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) x6@66@01) x6@66@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@19@11@19@62|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall r: Ref :: { inv_5(r) } (inv_5(r) in xs6) ==> inv_5(r) == r)
(declare-const $t@67@01 $Snap)
(assert (= $t@67@01 $Snap.unit))
; [eval] (forall r: Ref :: { inv_5(r) } (inv_5(r) in xs6) ==> inv_5(r) == r)
(declare-const r@68@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (inv_5(r) in xs6) ==> inv_5(r) == r
; [eval] (inv_5(r) in xs6)
; [eval] inv_5(r)
(push) ; 4
; [then-branch: 32 | inv_5[Ref](r@68@01) in xs6@18@01 | live]
; [else-branch: 32 | !(inv_5[Ref](r@68@01) in xs6@18@01) | live]
(push) ; 5
; [then-branch: 32 | inv_5[Ref](r@68@01) in xs6@18@01]
(assert (Set_in (inv_5<Ref> r@68@01) xs6@18@01))
; [eval] inv_5(r) == r
; [eval] inv_5(r)
(pop) ; 5
(push) ; 5
; [else-branch: 32 | !(inv_5[Ref](r@68@01) in xs6@18@01)]
(assert (not (Set_in (inv_5<Ref> r@68@01) xs6@18@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Set_in (inv_5<Ref> r@68@01) xs6@18@01))
  (Set_in (inv_5<Ref> r@68@01) xs6@18@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@68@01 $Ref)) (!
  (or
    (not (Set_in (inv_5<Ref> r@68@01) xs6@18@01))
    (Set_in (inv_5<Ref> r@68@01) xs6@18@01))
  :pattern ((inv_5<Ref> r@68@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@19@11@19@62-aux|)))
(assert (forall ((r@68@01 $Ref)) (!
  (=> (Set_in (inv_5<Ref> r@68@01) xs6@18@01) (= (inv_5<Ref> r@68@01) r@68@01))
  :pattern ((inv_5<Ref> r@68@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@19@11@19@62|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall r: Ref ::
;     { inv_5(r) }
;     (inv_5(r) in xs6) ==>
;     perm(r.f) >=
;     __iar__assume_helper_5((inv_0(r) in xs1) && r == r, (inv_1(r) in xs2) &&
;     r == r, (inv_2(r) in xs3) && r == r, (inv_3(r) in xs4) && r == r, (inv_4(r) in
;     xs5) &&
;     r == r, p, p, p, p, p, p))
(declare-const $t@69@01 $Snap)
(assert (= $t@69@01 $Snap.unit))
; [eval] (forall r: Ref :: { inv_5(r) } (inv_5(r) in xs6) ==> perm(r.f) >= __iar__assume_helper_5((inv_0(r) in xs1) && r == r, (inv_1(r) in xs2) && r == r, (inv_2(r) in xs3) && r == r, (inv_3(r) in xs4) && r == r, (inv_4(r) in xs5) && r == r, p, p, p, p, p, p))
(declare-const r@70@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (inv_5(r) in xs6) ==> perm(r.f) >= __iar__assume_helper_5((inv_0(r) in xs1) && r == r, (inv_1(r) in xs2) && r == r, (inv_2(r) in xs3) && r == r, (inv_3(r) in xs4) && r == r, (inv_4(r) in xs5) && r == r, p, p, p, p, p, p)
; [eval] (inv_5(r) in xs6)
; [eval] inv_5(r)
(push) ; 4
; [then-branch: 33 | inv_5[Ref](r@70@01) in xs6@18@01 | live]
; [else-branch: 33 | !(inv_5[Ref](r@70@01) in xs6@18@01) | live]
(push) ; 5
; [then-branch: 33 | inv_5[Ref](r@70@01) in xs6@18@01]
(assert (Set_in (inv_5<Ref> r@70@01) xs6@18@01))
; [eval] perm(r.f) >= __iar__assume_helper_5((inv_0(r) in xs1) && r == r, (inv_1(r) in xs2) && r == r, (inv_2(r) in xs3) && r == r, (inv_3(r) in xs4) && r == r, (inv_4(r) in xs5) && r == r, p, p, p, p, p, p)
; [eval] perm(r.f)
; Definitional axioms for snapshot map values
(declare-const pm@71@01 $FPM)
(assert (forall ((r $Ref)) (!
  (= ($FVF.perm_f (as pm@71@01  $FPM) r) (ite (= r x@24@01) p@25@01 $Perm.No))
  :pattern (($FVF.perm_f (as pm@71@01  $FPM) r))
  :qid |qp.resPrmSumDef12|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f (as sm@28@01  $FVF<f>) r) r))
  :pattern (($FVF.perm_f (as pm@71@01  $FPM) r))
  :qid |qp.resTrgDef13|)))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r@70@01) r@70@01))
; perm(r.f)  ~~>  assume upper permission bound
(assert (<= ($FVF.perm_f (as pm@71@01  $FPM) r@70@01) $Perm.Write))
; [eval] __iar__assume_helper_5((inv_0(r) in xs1) && r == r, (inv_1(r) in xs2) && r == r, (inv_2(r) in xs3) && r == r, (inv_3(r) in xs4) && r == r, (inv_4(r) in xs5) && r == r, p, p, p, p, p, p)
; [eval] (inv_0(r) in xs1) && r == r
; [eval] (inv_0(r) in xs1)
; [eval] inv_0(r)
(push) ; 6
; [then-branch: 34 | !(inv_0[Ref](r@70@01) in xs1@13@01) | live]
; [else-branch: 34 | inv_0[Ref](r@70@01) in xs1@13@01 | live]
(push) ; 7
; [then-branch: 34 | !(inv_0[Ref](r@70@01) in xs1@13@01)]
(assert (not (Set_in (inv_0<Ref> r@70@01) xs1@13@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 34 | inv_0[Ref](r@70@01) in xs1@13@01]
(assert (Set_in (inv_0<Ref> r@70@01) xs1@13@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_0<Ref> r@70@01) xs1@13@01)
  (not (Set_in (inv_0<Ref> r@70@01) xs1@13@01))))
; [eval] (inv_1(r) in xs2) && r == r
; [eval] (inv_1(r) in xs2)
; [eval] inv_1(r)
(push) ; 6
; [then-branch: 35 | !(inv_1[Ref](r@70@01) in xs2@14@01) | live]
; [else-branch: 35 | inv_1[Ref](r@70@01) in xs2@14@01 | live]
(push) ; 7
; [then-branch: 35 | !(inv_1[Ref](r@70@01) in xs2@14@01)]
(assert (not (Set_in (inv_1<Ref> r@70@01) xs2@14@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 35 | inv_1[Ref](r@70@01) in xs2@14@01]
(assert (Set_in (inv_1<Ref> r@70@01) xs2@14@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_1<Ref> r@70@01) xs2@14@01)
  (not (Set_in (inv_1<Ref> r@70@01) xs2@14@01))))
; [eval] (inv_2(r) in xs3) && r == r
; [eval] (inv_2(r) in xs3)
; [eval] inv_2(r)
(push) ; 6
; [then-branch: 36 | !(inv_2[Ref](r@70@01) in xs3@15@01) | live]
; [else-branch: 36 | inv_2[Ref](r@70@01) in xs3@15@01 | live]
(push) ; 7
; [then-branch: 36 | !(inv_2[Ref](r@70@01) in xs3@15@01)]
(assert (not (Set_in (inv_2<Ref> r@70@01) xs3@15@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 36 | inv_2[Ref](r@70@01) in xs3@15@01]
(assert (Set_in (inv_2<Ref> r@70@01) xs3@15@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_2<Ref> r@70@01) xs3@15@01)
  (not (Set_in (inv_2<Ref> r@70@01) xs3@15@01))))
; [eval] (inv_3(r) in xs4) && r == r
; [eval] (inv_3(r) in xs4)
; [eval] inv_3(r)
(push) ; 6
; [then-branch: 37 | !(inv_3[Ref](r@70@01) in xs4@16@01) | live]
; [else-branch: 37 | inv_3[Ref](r@70@01) in xs4@16@01 | live]
(push) ; 7
; [then-branch: 37 | !(inv_3[Ref](r@70@01) in xs4@16@01)]
(assert (not (Set_in (inv_3<Ref> r@70@01) xs4@16@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 37 | inv_3[Ref](r@70@01) in xs4@16@01]
(assert (Set_in (inv_3<Ref> r@70@01) xs4@16@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_3<Ref> r@70@01) xs4@16@01)
  (not (Set_in (inv_3<Ref> r@70@01) xs4@16@01))))
; [eval] (inv_4(r) in xs5) && r == r
; [eval] (inv_4(r) in xs5)
; [eval] inv_4(r)
(push) ; 6
; [then-branch: 38 | !(inv_4[Ref](r@70@01) in xs5@17@01) | live]
; [else-branch: 38 | inv_4[Ref](r@70@01) in xs5@17@01 | live]
(push) ; 7
; [then-branch: 38 | !(inv_4[Ref](r@70@01) in xs5@17@01)]
(assert (not (Set_in (inv_4<Ref> r@70@01) xs5@17@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 38 | inv_4[Ref](r@70@01) in xs5@17@01]
(assert (Set_in (inv_4<Ref> r@70@01) xs5@17@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_4<Ref> r@70@01) xs5@17@01)
  (not (Set_in (inv_4<Ref> r@70@01) xs5@17@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 33 | !(inv_5[Ref](r@70@01) in xs6@18@01)]
(assert (not (Set_in (inv_5<Ref> r@70@01) xs6@18@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (= ($FVF.perm_f (as pm@71@01  $FPM) r) (ite (= r x@24@01) p@25@01 $Perm.No))
  :pattern (($FVF.perm_f (as pm@71@01  $FPM) r))
  :qid |qp.resPrmSumDef12|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f (as sm@28@01  $FVF<f>) r) r))
  :pattern (($FVF.perm_f (as pm@71@01  $FPM) r))
  :qid |qp.resTrgDef13|)))
(assert (=>
  (Set_in (inv_5<Ref> r@70@01) xs6@18@01)
  (and
    (Set_in (inv_5<Ref> r@70@01) xs6@18@01)
    ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r@70@01) r@70@01)
    (<= ($FVF.perm_f (as pm@71@01  $FPM) r@70@01) $Perm.Write)
    (or
      (Set_in (inv_0<Ref> r@70@01) xs1@13@01)
      (not (Set_in (inv_0<Ref> r@70@01) xs1@13@01)))
    (or
      (Set_in (inv_1<Ref> r@70@01) xs2@14@01)
      (not (Set_in (inv_1<Ref> r@70@01) xs2@14@01)))
    (or
      (Set_in (inv_2<Ref> r@70@01) xs3@15@01)
      (not (Set_in (inv_2<Ref> r@70@01) xs3@15@01)))
    (or
      (Set_in (inv_3<Ref> r@70@01) xs4@16@01)
      (not (Set_in (inv_3<Ref> r@70@01) xs4@16@01)))
    (or
      (Set_in (inv_4<Ref> r@70@01) xs5@17@01)
      (not (Set_in (inv_4<Ref> r@70@01) xs5@17@01))))))
; Joined path conditions
(assert (or
  (not (Set_in (inv_5<Ref> r@70@01) xs6@18@01))
  (Set_in (inv_5<Ref> r@70@01) xs6@18@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (= ($FVF.perm_f (as pm@71@01  $FPM) r) (ite (= r x@24@01) p@25@01 $Perm.No))
  :pattern (($FVF.perm_f (as pm@71@01  $FPM) r))
  :qid |qp.resPrmSumDef12|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f (as sm@28@01  $FVF<f>) r) r))
  :pattern (($FVF.perm_f (as pm@71@01  $FPM) r))
  :qid |qp.resTrgDef13|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@70@01 $Ref)) (!
  (and
    (=>
      (Set_in (inv_5<Ref> r@70@01) xs6@18@01)
      (and
        (Set_in (inv_5<Ref> r@70@01) xs6@18@01)
        ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r@70@01) r@70@01)
        (<= ($FVF.perm_f (as pm@71@01  $FPM) r@70@01) $Perm.Write)
        (or
          (Set_in (inv_0<Ref> r@70@01) xs1@13@01)
          (not (Set_in (inv_0<Ref> r@70@01) xs1@13@01)))
        (or
          (Set_in (inv_1<Ref> r@70@01) xs2@14@01)
          (not (Set_in (inv_1<Ref> r@70@01) xs2@14@01)))
        (or
          (Set_in (inv_2<Ref> r@70@01) xs3@15@01)
          (not (Set_in (inv_2<Ref> r@70@01) xs3@15@01)))
        (or
          (Set_in (inv_3<Ref> r@70@01) xs4@16@01)
          (not (Set_in (inv_3<Ref> r@70@01) xs4@16@01)))
        (or
          (Set_in (inv_4<Ref> r@70@01) xs5@17@01)
          (not (Set_in (inv_4<Ref> r@70@01) xs5@17@01)))))
    (or
      (not (Set_in (inv_5<Ref> r@70@01) xs6@18@01))
      (Set_in (inv_5<Ref> r@70@01) xs6@18@01)))
  :pattern ((inv_5<Ref> r@70@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@19@11@19@62-aux|)))
(assert (forall ((r@70@01 $Ref)) (!
  (=>
    (Set_in (inv_5<Ref> r@70@01) xs6@18@01)
    (>=
      ($FVF.perm_f (as pm@71@01  $FPM) r@70@01)
      (__iar__assume_helper_5<Perm> (Set_in (inv_0<Ref> r@70@01) xs1@13@01) (Set_in (inv_1<Ref> r@70@01) xs2@14@01) (Set_in (inv_2<Ref> r@70@01) xs3@15@01) (Set_in (inv_3<Ref> r@70@01) xs4@16@01) (Set_in (inv_4<Ref> r@70@01) xs5@17@01) p@25@01 p@25@01 p@25@01 p@25@01 p@25@01 p@25@01)))
  :pattern ((inv_5<Ref> r@70@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@19@11@19@62|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x7: Ref :: { x7.f } (x7 in xs7) ==> true && inv_6(x7) == x7)
(declare-const $t@72@01 $Snap)
(assert (= $t@72@01 $Snap.unit))
; [eval] (forall x7: Ref :: { x7.f } (x7 in xs7) ==> true && inv_6(x7) == x7)
(declare-const x7@73@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x7 in xs7) ==> true && inv_6(x7) == x7
; [eval] (x7 in xs7)
(push) ; 4
; [then-branch: 39 | x7@73@01 in xs7@19@01 | live]
; [else-branch: 39 | !(x7@73@01 in xs7@19@01) | live]
(push) ; 5
; [then-branch: 39 | x7@73@01 in xs7@19@01]
(assert (Set_in x7@73@01 xs7@19@01))
; [eval] true && inv_6(x7) == x7
(push) ; 6
; [then-branch: 40 | False | live]
; [else-branch: 40 | True | live]
(push) ; 7
; [then-branch: 40 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 40 | True]
; [eval] inv_6(x7) == x7
; [eval] inv_6(x7)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(push) ; 5
; [else-branch: 39 | !(x7@73@01 in xs7@19@01)]
(assert (not (Set_in x7@73@01 xs7@19@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in x7@73@01 xs7@19@01)) (Set_in x7@73@01 xs7@19@01)))
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x7@73@01 $Ref)) (!
  (or (not (Set_in x7@73@01 xs7@19@01)) (Set_in x7@73@01 xs7@19@01))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) x7@73@01) x7@73@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@20@11@20@62-aux|)))
(assert (forall ((x7@73@01 $Ref)) (!
  (=> (Set_in x7@73@01 xs7@19@01) (= (inv_6<Ref> x7@73@01) x7@73@01))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) x7@73@01) x7@73@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@20@11@20@62|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall r: Ref :: { inv_6(r) } (inv_6(r) in xs7) ==> inv_6(r) == r)
(declare-const $t@74@01 $Snap)
(assert (= $t@74@01 $Snap.unit))
; [eval] (forall r: Ref :: { inv_6(r) } (inv_6(r) in xs7) ==> inv_6(r) == r)
(declare-const r@75@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (inv_6(r) in xs7) ==> inv_6(r) == r
; [eval] (inv_6(r) in xs7)
; [eval] inv_6(r)
(push) ; 4
; [then-branch: 41 | inv_6[Ref](r@75@01) in xs7@19@01 | live]
; [else-branch: 41 | !(inv_6[Ref](r@75@01) in xs7@19@01) | live]
(push) ; 5
; [then-branch: 41 | inv_6[Ref](r@75@01) in xs7@19@01]
(assert (Set_in (inv_6<Ref> r@75@01) xs7@19@01))
; [eval] inv_6(r) == r
; [eval] inv_6(r)
(pop) ; 5
(push) ; 5
; [else-branch: 41 | !(inv_6[Ref](r@75@01) in xs7@19@01)]
(assert (not (Set_in (inv_6<Ref> r@75@01) xs7@19@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Set_in (inv_6<Ref> r@75@01) xs7@19@01))
  (Set_in (inv_6<Ref> r@75@01) xs7@19@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@75@01 $Ref)) (!
  (or
    (not (Set_in (inv_6<Ref> r@75@01) xs7@19@01))
    (Set_in (inv_6<Ref> r@75@01) xs7@19@01))
  :pattern ((inv_6<Ref> r@75@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@20@11@20@62-aux|)))
(assert (forall ((r@75@01 $Ref)) (!
  (=> (Set_in (inv_6<Ref> r@75@01) xs7@19@01) (= (inv_6<Ref> r@75@01) r@75@01))
  :pattern ((inv_6<Ref> r@75@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@20@11@20@62|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall r: Ref ::
;     { inv_6(r) }
;     (inv_6(r) in xs7) ==>
;     perm(r.f) >=
;     __iar__assume_helper_6((inv_0(r) in xs1) && r == r, (inv_1(r) in xs2) &&
;     r == r, (inv_2(r) in xs3) && r == r, (inv_3(r) in xs4) && r == r, (inv_4(r) in
;     xs5) &&
;     r == r, (inv_5(r) in xs6) && r == r, p, p, p, p, p, p, p))
(declare-const $t@76@01 $Snap)
(assert (= $t@76@01 $Snap.unit))
; [eval] (forall r: Ref :: { inv_6(r) } (inv_6(r) in xs7) ==> perm(r.f) >= __iar__assume_helper_6((inv_0(r) in xs1) && r == r, (inv_1(r) in xs2) && r == r, (inv_2(r) in xs3) && r == r, (inv_3(r) in xs4) && r == r, (inv_4(r) in xs5) && r == r, (inv_5(r) in xs6) && r == r, p, p, p, p, p, p, p))
(declare-const r@77@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (inv_6(r) in xs7) ==> perm(r.f) >= __iar__assume_helper_6((inv_0(r) in xs1) && r == r, (inv_1(r) in xs2) && r == r, (inv_2(r) in xs3) && r == r, (inv_3(r) in xs4) && r == r, (inv_4(r) in xs5) && r == r, (inv_5(r) in xs6) && r == r, p, p, p, p, p, p, p)
; [eval] (inv_6(r) in xs7)
; [eval] inv_6(r)
(push) ; 4
; [then-branch: 42 | inv_6[Ref](r@77@01) in xs7@19@01 | live]
; [else-branch: 42 | !(inv_6[Ref](r@77@01) in xs7@19@01) | live]
(push) ; 5
; [then-branch: 42 | inv_6[Ref](r@77@01) in xs7@19@01]
(assert (Set_in (inv_6<Ref> r@77@01) xs7@19@01))
; [eval] perm(r.f) >= __iar__assume_helper_6((inv_0(r) in xs1) && r == r, (inv_1(r) in xs2) && r == r, (inv_2(r) in xs3) && r == r, (inv_3(r) in xs4) && r == r, (inv_4(r) in xs5) && r == r, (inv_5(r) in xs6) && r == r, p, p, p, p, p, p, p)
; [eval] perm(r.f)
; Definitional axioms for snapshot map values
(declare-const pm@78@01 $FPM)
(assert (forall ((r $Ref)) (!
  (= ($FVF.perm_f (as pm@78@01  $FPM) r) (ite (= r x@24@01) p@25@01 $Perm.No))
  :pattern (($FVF.perm_f (as pm@78@01  $FPM) r))
  :qid |qp.resPrmSumDef14|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f (as sm@28@01  $FVF<f>) r) r))
  :pattern (($FVF.perm_f (as pm@78@01  $FPM) r))
  :qid |qp.resTrgDef15|)))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r@77@01) r@77@01))
; perm(r.f)  ~~>  assume upper permission bound
(assert (<= ($FVF.perm_f (as pm@78@01  $FPM) r@77@01) $Perm.Write))
; [eval] __iar__assume_helper_6((inv_0(r) in xs1) && r == r, (inv_1(r) in xs2) && r == r, (inv_2(r) in xs3) && r == r, (inv_3(r) in xs4) && r == r, (inv_4(r) in xs5) && r == r, (inv_5(r) in xs6) && r == r, p, p, p, p, p, p, p)
; [eval] (inv_0(r) in xs1) && r == r
; [eval] (inv_0(r) in xs1)
; [eval] inv_0(r)
(push) ; 6
; [then-branch: 43 | !(inv_0[Ref](r@77@01) in xs1@13@01) | live]
; [else-branch: 43 | inv_0[Ref](r@77@01) in xs1@13@01 | live]
(push) ; 7
; [then-branch: 43 | !(inv_0[Ref](r@77@01) in xs1@13@01)]
(assert (not (Set_in (inv_0<Ref> r@77@01) xs1@13@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 43 | inv_0[Ref](r@77@01) in xs1@13@01]
(assert (Set_in (inv_0<Ref> r@77@01) xs1@13@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_0<Ref> r@77@01) xs1@13@01)
  (not (Set_in (inv_0<Ref> r@77@01) xs1@13@01))))
; [eval] (inv_1(r) in xs2) && r == r
; [eval] (inv_1(r) in xs2)
; [eval] inv_1(r)
(push) ; 6
; [then-branch: 44 | !(inv_1[Ref](r@77@01) in xs2@14@01) | live]
; [else-branch: 44 | inv_1[Ref](r@77@01) in xs2@14@01 | live]
(push) ; 7
; [then-branch: 44 | !(inv_1[Ref](r@77@01) in xs2@14@01)]
(assert (not (Set_in (inv_1<Ref> r@77@01) xs2@14@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 44 | inv_1[Ref](r@77@01) in xs2@14@01]
(assert (Set_in (inv_1<Ref> r@77@01) xs2@14@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_1<Ref> r@77@01) xs2@14@01)
  (not (Set_in (inv_1<Ref> r@77@01) xs2@14@01))))
; [eval] (inv_2(r) in xs3) && r == r
; [eval] (inv_2(r) in xs3)
; [eval] inv_2(r)
(push) ; 6
; [then-branch: 45 | !(inv_2[Ref](r@77@01) in xs3@15@01) | live]
; [else-branch: 45 | inv_2[Ref](r@77@01) in xs3@15@01 | live]
(push) ; 7
; [then-branch: 45 | !(inv_2[Ref](r@77@01) in xs3@15@01)]
(assert (not (Set_in (inv_2<Ref> r@77@01) xs3@15@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 45 | inv_2[Ref](r@77@01) in xs3@15@01]
(assert (Set_in (inv_2<Ref> r@77@01) xs3@15@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_2<Ref> r@77@01) xs3@15@01)
  (not (Set_in (inv_2<Ref> r@77@01) xs3@15@01))))
; [eval] (inv_3(r) in xs4) && r == r
; [eval] (inv_3(r) in xs4)
; [eval] inv_3(r)
(push) ; 6
; [then-branch: 46 | !(inv_3[Ref](r@77@01) in xs4@16@01) | live]
; [else-branch: 46 | inv_3[Ref](r@77@01) in xs4@16@01 | live]
(push) ; 7
; [then-branch: 46 | !(inv_3[Ref](r@77@01) in xs4@16@01)]
(assert (not (Set_in (inv_3<Ref> r@77@01) xs4@16@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 46 | inv_3[Ref](r@77@01) in xs4@16@01]
(assert (Set_in (inv_3<Ref> r@77@01) xs4@16@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_3<Ref> r@77@01) xs4@16@01)
  (not (Set_in (inv_3<Ref> r@77@01) xs4@16@01))))
; [eval] (inv_4(r) in xs5) && r == r
; [eval] (inv_4(r) in xs5)
; [eval] inv_4(r)
(push) ; 6
; [then-branch: 47 | !(inv_4[Ref](r@77@01) in xs5@17@01) | live]
; [else-branch: 47 | inv_4[Ref](r@77@01) in xs5@17@01 | live]
(push) ; 7
; [then-branch: 47 | !(inv_4[Ref](r@77@01) in xs5@17@01)]
(assert (not (Set_in (inv_4<Ref> r@77@01) xs5@17@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 47 | inv_4[Ref](r@77@01) in xs5@17@01]
(assert (Set_in (inv_4<Ref> r@77@01) xs5@17@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_4<Ref> r@77@01) xs5@17@01)
  (not (Set_in (inv_4<Ref> r@77@01) xs5@17@01))))
; [eval] (inv_5(r) in xs6) && r == r
; [eval] (inv_5(r) in xs6)
; [eval] inv_5(r)
(push) ; 6
; [then-branch: 48 | !(inv_5[Ref](r@77@01) in xs6@18@01) | live]
; [else-branch: 48 | inv_5[Ref](r@77@01) in xs6@18@01 | live]
(push) ; 7
; [then-branch: 48 | !(inv_5[Ref](r@77@01) in xs6@18@01)]
(assert (not (Set_in (inv_5<Ref> r@77@01) xs6@18@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 48 | inv_5[Ref](r@77@01) in xs6@18@01]
(assert (Set_in (inv_5<Ref> r@77@01) xs6@18@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_5<Ref> r@77@01) xs6@18@01)
  (not (Set_in (inv_5<Ref> r@77@01) xs6@18@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 42 | !(inv_6[Ref](r@77@01) in xs7@19@01)]
(assert (not (Set_in (inv_6<Ref> r@77@01) xs7@19@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (= ($FVF.perm_f (as pm@78@01  $FPM) r) (ite (= r x@24@01) p@25@01 $Perm.No))
  :pattern (($FVF.perm_f (as pm@78@01  $FPM) r))
  :qid |qp.resPrmSumDef14|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f (as sm@28@01  $FVF<f>) r) r))
  :pattern (($FVF.perm_f (as pm@78@01  $FPM) r))
  :qid |qp.resTrgDef15|)))
(assert (=>
  (Set_in (inv_6<Ref> r@77@01) xs7@19@01)
  (and
    (Set_in (inv_6<Ref> r@77@01) xs7@19@01)
    ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r@77@01) r@77@01)
    (<= ($FVF.perm_f (as pm@78@01  $FPM) r@77@01) $Perm.Write)
    (or
      (Set_in (inv_0<Ref> r@77@01) xs1@13@01)
      (not (Set_in (inv_0<Ref> r@77@01) xs1@13@01)))
    (or
      (Set_in (inv_1<Ref> r@77@01) xs2@14@01)
      (not (Set_in (inv_1<Ref> r@77@01) xs2@14@01)))
    (or
      (Set_in (inv_2<Ref> r@77@01) xs3@15@01)
      (not (Set_in (inv_2<Ref> r@77@01) xs3@15@01)))
    (or
      (Set_in (inv_3<Ref> r@77@01) xs4@16@01)
      (not (Set_in (inv_3<Ref> r@77@01) xs4@16@01)))
    (or
      (Set_in (inv_4<Ref> r@77@01) xs5@17@01)
      (not (Set_in (inv_4<Ref> r@77@01) xs5@17@01)))
    (or
      (Set_in (inv_5<Ref> r@77@01) xs6@18@01)
      (not (Set_in (inv_5<Ref> r@77@01) xs6@18@01))))))
; Joined path conditions
(assert (or
  (not (Set_in (inv_6<Ref> r@77@01) xs7@19@01))
  (Set_in (inv_6<Ref> r@77@01) xs7@19@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (= ($FVF.perm_f (as pm@78@01  $FPM) r) (ite (= r x@24@01) p@25@01 $Perm.No))
  :pattern (($FVF.perm_f (as pm@78@01  $FPM) r))
  :qid |qp.resPrmSumDef14|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f (as sm@28@01  $FVF<f>) r) r))
  :pattern (($FVF.perm_f (as pm@78@01  $FPM) r))
  :qid |qp.resTrgDef15|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@77@01 $Ref)) (!
  (and
    (=>
      (Set_in (inv_6<Ref> r@77@01) xs7@19@01)
      (and
        (Set_in (inv_6<Ref> r@77@01) xs7@19@01)
        ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r@77@01) r@77@01)
        (<= ($FVF.perm_f (as pm@78@01  $FPM) r@77@01) $Perm.Write)
        (or
          (Set_in (inv_0<Ref> r@77@01) xs1@13@01)
          (not (Set_in (inv_0<Ref> r@77@01) xs1@13@01)))
        (or
          (Set_in (inv_1<Ref> r@77@01) xs2@14@01)
          (not (Set_in (inv_1<Ref> r@77@01) xs2@14@01)))
        (or
          (Set_in (inv_2<Ref> r@77@01) xs3@15@01)
          (not (Set_in (inv_2<Ref> r@77@01) xs3@15@01)))
        (or
          (Set_in (inv_3<Ref> r@77@01) xs4@16@01)
          (not (Set_in (inv_3<Ref> r@77@01) xs4@16@01)))
        (or
          (Set_in (inv_4<Ref> r@77@01) xs5@17@01)
          (not (Set_in (inv_4<Ref> r@77@01) xs5@17@01)))
        (or
          (Set_in (inv_5<Ref> r@77@01) xs6@18@01)
          (not (Set_in (inv_5<Ref> r@77@01) xs6@18@01)))))
    (or
      (not (Set_in (inv_6<Ref> r@77@01) xs7@19@01))
      (Set_in (inv_6<Ref> r@77@01) xs7@19@01)))
  :pattern ((inv_6<Ref> r@77@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@20@11@20@62-aux|)))
(assert (forall ((r@77@01 $Ref)) (!
  (=>
    (Set_in (inv_6<Ref> r@77@01) xs7@19@01)
    (>=
      ($FVF.perm_f (as pm@78@01  $FPM) r@77@01)
      (__iar__assume_helper_6<Perm> (Set_in (inv_0<Ref> r@77@01) xs1@13@01) (Set_in (inv_1<Ref> r@77@01) xs2@14@01) (Set_in (inv_2<Ref> r@77@01) xs3@15@01) (Set_in (inv_3<Ref> r@77@01) xs4@16@01) (Set_in (inv_4<Ref> r@77@01) xs5@17@01) (Set_in (inv_5<Ref> r@77@01) xs6@18@01) p@25@01 p@25@01 p@25@01 p@25@01 p@25@01 p@25@01 p@25@01)))
  :pattern ((inv_6<Ref> r@77@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@20@11@20@62|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x8: Ref :: { x8.f } (x8 in xs8) ==> true && inv_7(x8) == x8)
(declare-const $t@79@01 $Snap)
(assert (= $t@79@01 $Snap.unit))
; [eval] (forall x8: Ref :: { x8.f } (x8 in xs8) ==> true && inv_7(x8) == x8)
(declare-const x8@80@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x8 in xs8) ==> true && inv_7(x8) == x8
; [eval] (x8 in xs8)
(push) ; 4
; [then-branch: 49 | x8@80@01 in xs8@20@01 | live]
; [else-branch: 49 | !(x8@80@01 in xs8@20@01) | live]
(push) ; 5
; [then-branch: 49 | x8@80@01 in xs8@20@01]
(assert (Set_in x8@80@01 xs8@20@01))
; [eval] true && inv_7(x8) == x8
(push) ; 6
; [then-branch: 50 | False | live]
; [else-branch: 50 | True | live]
(push) ; 7
; [then-branch: 50 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 50 | True]
; [eval] inv_7(x8) == x8
; [eval] inv_7(x8)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(push) ; 5
; [else-branch: 49 | !(x8@80@01 in xs8@20@01)]
(assert (not (Set_in x8@80@01 xs8@20@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in x8@80@01 xs8@20@01)) (Set_in x8@80@01 xs8@20@01)))
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x8@80@01 $Ref)) (!
  (or (not (Set_in x8@80@01 xs8@20@01)) (Set_in x8@80@01 xs8@20@01))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) x8@80@01) x8@80@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@21@11@21@62-aux|)))
(assert (forall ((x8@80@01 $Ref)) (!
  (=> (Set_in x8@80@01 xs8@20@01) (= (inv_7<Ref> x8@80@01) x8@80@01))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) x8@80@01) x8@80@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@21@11@21@62|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall r: Ref :: { inv_7(r) } (inv_7(r) in xs8) ==> inv_7(r) == r)
(declare-const $t@81@01 $Snap)
(assert (= $t@81@01 $Snap.unit))
; [eval] (forall r: Ref :: { inv_7(r) } (inv_7(r) in xs8) ==> inv_7(r) == r)
(declare-const r@82@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (inv_7(r) in xs8) ==> inv_7(r) == r
; [eval] (inv_7(r) in xs8)
; [eval] inv_7(r)
(push) ; 4
; [then-branch: 51 | inv_7[Ref](r@82@01) in xs8@20@01 | live]
; [else-branch: 51 | !(inv_7[Ref](r@82@01) in xs8@20@01) | live]
(push) ; 5
; [then-branch: 51 | inv_7[Ref](r@82@01) in xs8@20@01]
(assert (Set_in (inv_7<Ref> r@82@01) xs8@20@01))
; [eval] inv_7(r) == r
; [eval] inv_7(r)
(pop) ; 5
(push) ; 5
; [else-branch: 51 | !(inv_7[Ref](r@82@01) in xs8@20@01)]
(assert (not (Set_in (inv_7<Ref> r@82@01) xs8@20@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Set_in (inv_7<Ref> r@82@01) xs8@20@01))
  (Set_in (inv_7<Ref> r@82@01) xs8@20@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@82@01 $Ref)) (!
  (or
    (not (Set_in (inv_7<Ref> r@82@01) xs8@20@01))
    (Set_in (inv_7<Ref> r@82@01) xs8@20@01))
  :pattern ((inv_7<Ref> r@82@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@21@11@21@62-aux|)))
(assert (forall ((r@82@01 $Ref)) (!
  (=> (Set_in (inv_7<Ref> r@82@01) xs8@20@01) (= (inv_7<Ref> r@82@01) r@82@01))
  :pattern ((inv_7<Ref> r@82@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@21@11@21@62|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall r: Ref ::
;     { inv_7(r) }
;     (inv_7(r) in xs8) ==>
;     perm(r.f) >=
;     __iar__assume_helper_7((inv_0(r) in xs1) && r == r, (inv_1(r) in xs2) &&
;     r == r, (inv_2(r) in xs3) && r == r, (inv_3(r) in xs4) && r == r, (inv_4(r) in
;     xs5) &&
;     r == r, (inv_5(r) in xs6) && r == r, (inv_6(r) in xs7) && r == r, p, p,
;     p, p, p, p, p, p))
(declare-const $t@83@01 $Snap)
(assert (= $t@83@01 $Snap.unit))
; [eval] (forall r: Ref :: { inv_7(r) } (inv_7(r) in xs8) ==> perm(r.f) >= __iar__assume_helper_7((inv_0(r) in xs1) && r == r, (inv_1(r) in xs2) && r == r, (inv_2(r) in xs3) && r == r, (inv_3(r) in xs4) && r == r, (inv_4(r) in xs5) && r == r, (inv_5(r) in xs6) && r == r, (inv_6(r) in xs7) && r == r, p, p, p, p, p, p, p, p))
(declare-const r@84@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (inv_7(r) in xs8) ==> perm(r.f) >= __iar__assume_helper_7((inv_0(r) in xs1) && r == r, (inv_1(r) in xs2) && r == r, (inv_2(r) in xs3) && r == r, (inv_3(r) in xs4) && r == r, (inv_4(r) in xs5) && r == r, (inv_5(r) in xs6) && r == r, (inv_6(r) in xs7) && r == r, p, p, p, p, p, p, p, p)
; [eval] (inv_7(r) in xs8)
; [eval] inv_7(r)
(push) ; 4
; [then-branch: 52 | inv_7[Ref](r@84@01) in xs8@20@01 | live]
; [else-branch: 52 | !(inv_7[Ref](r@84@01) in xs8@20@01) | live]
(push) ; 5
; [then-branch: 52 | inv_7[Ref](r@84@01) in xs8@20@01]
(assert (Set_in (inv_7<Ref> r@84@01) xs8@20@01))
; [eval] perm(r.f) >= __iar__assume_helper_7((inv_0(r) in xs1) && r == r, (inv_1(r) in xs2) && r == r, (inv_2(r) in xs3) && r == r, (inv_3(r) in xs4) && r == r, (inv_4(r) in xs5) && r == r, (inv_5(r) in xs6) && r == r, (inv_6(r) in xs7) && r == r, p, p, p, p, p, p, p, p)
; [eval] perm(r.f)
; Definitional axioms for snapshot map values
(declare-const pm@85@01 $FPM)
(assert (forall ((r $Ref)) (!
  (= ($FVF.perm_f (as pm@85@01  $FPM) r) (ite (= r x@24@01) p@25@01 $Perm.No))
  :pattern (($FVF.perm_f (as pm@85@01  $FPM) r))
  :qid |qp.resPrmSumDef16|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f (as sm@28@01  $FVF<f>) r) r))
  :pattern (($FVF.perm_f (as pm@85@01  $FPM) r))
  :qid |qp.resTrgDef17|)))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r@84@01) r@84@01))
; perm(r.f)  ~~>  assume upper permission bound
(assert (<= ($FVF.perm_f (as pm@85@01  $FPM) r@84@01) $Perm.Write))
; [eval] __iar__assume_helper_7((inv_0(r) in xs1) && r == r, (inv_1(r) in xs2) && r == r, (inv_2(r) in xs3) && r == r, (inv_3(r) in xs4) && r == r, (inv_4(r) in xs5) && r == r, (inv_5(r) in xs6) && r == r, (inv_6(r) in xs7) && r == r, p, p, p, p, p, p, p, p)
; [eval] (inv_0(r) in xs1) && r == r
; [eval] (inv_0(r) in xs1)
; [eval] inv_0(r)
(push) ; 6
; [then-branch: 53 | !(inv_0[Ref](r@84@01) in xs1@13@01) | live]
; [else-branch: 53 | inv_0[Ref](r@84@01) in xs1@13@01 | live]
(push) ; 7
; [then-branch: 53 | !(inv_0[Ref](r@84@01) in xs1@13@01)]
(assert (not (Set_in (inv_0<Ref> r@84@01) xs1@13@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 53 | inv_0[Ref](r@84@01) in xs1@13@01]
(assert (Set_in (inv_0<Ref> r@84@01) xs1@13@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_0<Ref> r@84@01) xs1@13@01)
  (not (Set_in (inv_0<Ref> r@84@01) xs1@13@01))))
; [eval] (inv_1(r) in xs2) && r == r
; [eval] (inv_1(r) in xs2)
; [eval] inv_1(r)
(push) ; 6
; [then-branch: 54 | !(inv_1[Ref](r@84@01) in xs2@14@01) | live]
; [else-branch: 54 | inv_1[Ref](r@84@01) in xs2@14@01 | live]
(push) ; 7
; [then-branch: 54 | !(inv_1[Ref](r@84@01) in xs2@14@01)]
(assert (not (Set_in (inv_1<Ref> r@84@01) xs2@14@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 54 | inv_1[Ref](r@84@01) in xs2@14@01]
(assert (Set_in (inv_1<Ref> r@84@01) xs2@14@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_1<Ref> r@84@01) xs2@14@01)
  (not (Set_in (inv_1<Ref> r@84@01) xs2@14@01))))
; [eval] (inv_2(r) in xs3) && r == r
; [eval] (inv_2(r) in xs3)
; [eval] inv_2(r)
(push) ; 6
; [then-branch: 55 | !(inv_2[Ref](r@84@01) in xs3@15@01) | live]
; [else-branch: 55 | inv_2[Ref](r@84@01) in xs3@15@01 | live]
(push) ; 7
; [then-branch: 55 | !(inv_2[Ref](r@84@01) in xs3@15@01)]
(assert (not (Set_in (inv_2<Ref> r@84@01) xs3@15@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 55 | inv_2[Ref](r@84@01) in xs3@15@01]
(assert (Set_in (inv_2<Ref> r@84@01) xs3@15@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_2<Ref> r@84@01) xs3@15@01)
  (not (Set_in (inv_2<Ref> r@84@01) xs3@15@01))))
; [eval] (inv_3(r) in xs4) && r == r
; [eval] (inv_3(r) in xs4)
; [eval] inv_3(r)
(push) ; 6
; [then-branch: 56 | !(inv_3[Ref](r@84@01) in xs4@16@01) | live]
; [else-branch: 56 | inv_3[Ref](r@84@01) in xs4@16@01 | live]
(push) ; 7
; [then-branch: 56 | !(inv_3[Ref](r@84@01) in xs4@16@01)]
(assert (not (Set_in (inv_3<Ref> r@84@01) xs4@16@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 56 | inv_3[Ref](r@84@01) in xs4@16@01]
(assert (Set_in (inv_3<Ref> r@84@01) xs4@16@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_3<Ref> r@84@01) xs4@16@01)
  (not (Set_in (inv_3<Ref> r@84@01) xs4@16@01))))
; [eval] (inv_4(r) in xs5) && r == r
; [eval] (inv_4(r) in xs5)
; [eval] inv_4(r)
(push) ; 6
; [then-branch: 57 | !(inv_4[Ref](r@84@01) in xs5@17@01) | live]
; [else-branch: 57 | inv_4[Ref](r@84@01) in xs5@17@01 | live]
(push) ; 7
; [then-branch: 57 | !(inv_4[Ref](r@84@01) in xs5@17@01)]
(assert (not (Set_in (inv_4<Ref> r@84@01) xs5@17@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 57 | inv_4[Ref](r@84@01) in xs5@17@01]
(assert (Set_in (inv_4<Ref> r@84@01) xs5@17@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_4<Ref> r@84@01) xs5@17@01)
  (not (Set_in (inv_4<Ref> r@84@01) xs5@17@01))))
; [eval] (inv_5(r) in xs6) && r == r
; [eval] (inv_5(r) in xs6)
; [eval] inv_5(r)
(push) ; 6
; [then-branch: 58 | !(inv_5[Ref](r@84@01) in xs6@18@01) | live]
; [else-branch: 58 | inv_5[Ref](r@84@01) in xs6@18@01 | live]
(push) ; 7
; [then-branch: 58 | !(inv_5[Ref](r@84@01) in xs6@18@01)]
(assert (not (Set_in (inv_5<Ref> r@84@01) xs6@18@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 58 | inv_5[Ref](r@84@01) in xs6@18@01]
(assert (Set_in (inv_5<Ref> r@84@01) xs6@18@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_5<Ref> r@84@01) xs6@18@01)
  (not (Set_in (inv_5<Ref> r@84@01) xs6@18@01))))
; [eval] (inv_6(r) in xs7) && r == r
; [eval] (inv_6(r) in xs7)
; [eval] inv_6(r)
(push) ; 6
; [then-branch: 59 | !(inv_6[Ref](r@84@01) in xs7@19@01) | live]
; [else-branch: 59 | inv_6[Ref](r@84@01) in xs7@19@01 | live]
(push) ; 7
; [then-branch: 59 | !(inv_6[Ref](r@84@01) in xs7@19@01)]
(assert (not (Set_in (inv_6<Ref> r@84@01) xs7@19@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 59 | inv_6[Ref](r@84@01) in xs7@19@01]
(assert (Set_in (inv_6<Ref> r@84@01) xs7@19@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_6<Ref> r@84@01) xs7@19@01)
  (not (Set_in (inv_6<Ref> r@84@01) xs7@19@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 52 | !(inv_7[Ref](r@84@01) in xs8@20@01)]
(assert (not (Set_in (inv_7<Ref> r@84@01) xs8@20@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (= ($FVF.perm_f (as pm@85@01  $FPM) r) (ite (= r x@24@01) p@25@01 $Perm.No))
  :pattern (($FVF.perm_f (as pm@85@01  $FPM) r))
  :qid |qp.resPrmSumDef16|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f (as sm@28@01  $FVF<f>) r) r))
  :pattern (($FVF.perm_f (as pm@85@01  $FPM) r))
  :qid |qp.resTrgDef17|)))
(assert (=>
  (Set_in (inv_7<Ref> r@84@01) xs8@20@01)
  (and
    (Set_in (inv_7<Ref> r@84@01) xs8@20@01)
    ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r@84@01) r@84@01)
    (<= ($FVF.perm_f (as pm@85@01  $FPM) r@84@01) $Perm.Write)
    (or
      (Set_in (inv_0<Ref> r@84@01) xs1@13@01)
      (not (Set_in (inv_0<Ref> r@84@01) xs1@13@01)))
    (or
      (Set_in (inv_1<Ref> r@84@01) xs2@14@01)
      (not (Set_in (inv_1<Ref> r@84@01) xs2@14@01)))
    (or
      (Set_in (inv_2<Ref> r@84@01) xs3@15@01)
      (not (Set_in (inv_2<Ref> r@84@01) xs3@15@01)))
    (or
      (Set_in (inv_3<Ref> r@84@01) xs4@16@01)
      (not (Set_in (inv_3<Ref> r@84@01) xs4@16@01)))
    (or
      (Set_in (inv_4<Ref> r@84@01) xs5@17@01)
      (not (Set_in (inv_4<Ref> r@84@01) xs5@17@01)))
    (or
      (Set_in (inv_5<Ref> r@84@01) xs6@18@01)
      (not (Set_in (inv_5<Ref> r@84@01) xs6@18@01)))
    (or
      (Set_in (inv_6<Ref> r@84@01) xs7@19@01)
      (not (Set_in (inv_6<Ref> r@84@01) xs7@19@01))))))
; Joined path conditions
(assert (or
  (not (Set_in (inv_7<Ref> r@84@01) xs8@20@01))
  (Set_in (inv_7<Ref> r@84@01) xs8@20@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (= ($FVF.perm_f (as pm@85@01  $FPM) r) (ite (= r x@24@01) p@25@01 $Perm.No))
  :pattern (($FVF.perm_f (as pm@85@01  $FPM) r))
  :qid |qp.resPrmSumDef16|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f (as sm@28@01  $FVF<f>) r) r))
  :pattern (($FVF.perm_f (as pm@85@01  $FPM) r))
  :qid |qp.resTrgDef17|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@84@01 $Ref)) (!
  (and
    (=>
      (Set_in (inv_7<Ref> r@84@01) xs8@20@01)
      (and
        (Set_in (inv_7<Ref> r@84@01) xs8@20@01)
        ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r@84@01) r@84@01)
        (<= ($FVF.perm_f (as pm@85@01  $FPM) r@84@01) $Perm.Write)
        (or
          (Set_in (inv_0<Ref> r@84@01) xs1@13@01)
          (not (Set_in (inv_0<Ref> r@84@01) xs1@13@01)))
        (or
          (Set_in (inv_1<Ref> r@84@01) xs2@14@01)
          (not (Set_in (inv_1<Ref> r@84@01) xs2@14@01)))
        (or
          (Set_in (inv_2<Ref> r@84@01) xs3@15@01)
          (not (Set_in (inv_2<Ref> r@84@01) xs3@15@01)))
        (or
          (Set_in (inv_3<Ref> r@84@01) xs4@16@01)
          (not (Set_in (inv_3<Ref> r@84@01) xs4@16@01)))
        (or
          (Set_in (inv_4<Ref> r@84@01) xs5@17@01)
          (not (Set_in (inv_4<Ref> r@84@01) xs5@17@01)))
        (or
          (Set_in (inv_5<Ref> r@84@01) xs6@18@01)
          (not (Set_in (inv_5<Ref> r@84@01) xs6@18@01)))
        (or
          (Set_in (inv_6<Ref> r@84@01) xs7@19@01)
          (not (Set_in (inv_6<Ref> r@84@01) xs7@19@01)))))
    (or
      (not (Set_in (inv_7<Ref> r@84@01) xs8@20@01))
      (Set_in (inv_7<Ref> r@84@01) xs8@20@01)))
  :pattern ((inv_7<Ref> r@84@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@21@11@21@62-aux|)))
(assert (forall ((r@84@01 $Ref)) (!
  (=>
    (Set_in (inv_7<Ref> r@84@01) xs8@20@01)
    (>=
      ($FVF.perm_f (as pm@85@01  $FPM) r@84@01)
      (__iar__assume_helper_7<Perm> (Set_in (inv_0<Ref> r@84@01) xs1@13@01) (Set_in (inv_1<Ref> r@84@01) xs2@14@01) (Set_in (inv_2<Ref> r@84@01) xs3@15@01) (Set_in (inv_3<Ref> r@84@01) xs4@16@01) (Set_in (inv_4<Ref> r@84@01) xs5@17@01) (Set_in (inv_5<Ref> r@84@01) xs6@18@01) (Set_in (inv_6<Ref> r@84@01) xs7@19@01) p@25@01 p@25@01 p@25@01 p@25@01 p@25@01 p@25@01 p@25@01 p@25@01)))
  :pattern ((inv_7<Ref> r@84@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@21@11@21@62|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x9: Ref :: { x9.f } (x9 in xs9) ==> true && inv_8(x9) == x9)
(declare-const $t@86@01 $Snap)
(assert (= $t@86@01 $Snap.unit))
; [eval] (forall x9: Ref :: { x9.f } (x9 in xs9) ==> true && inv_8(x9) == x9)
(declare-const x9@87@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x9 in xs9) ==> true && inv_8(x9) == x9
; [eval] (x9 in xs9)
(push) ; 4
; [then-branch: 60 | x9@87@01 in xs9@21@01 | live]
; [else-branch: 60 | !(x9@87@01 in xs9@21@01) | live]
(push) ; 5
; [then-branch: 60 | x9@87@01 in xs9@21@01]
(assert (Set_in x9@87@01 xs9@21@01))
; [eval] true && inv_8(x9) == x9
(push) ; 6
; [then-branch: 61 | False | live]
; [else-branch: 61 | True | live]
(push) ; 7
; [then-branch: 61 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 61 | True]
; [eval] inv_8(x9) == x9
; [eval] inv_8(x9)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(push) ; 5
; [else-branch: 60 | !(x9@87@01 in xs9@21@01)]
(assert (not (Set_in x9@87@01 xs9@21@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in x9@87@01 xs9@21@01)) (Set_in x9@87@01 xs9@21@01)))
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x9@87@01 $Ref)) (!
  (or (not (Set_in x9@87@01 xs9@21@01)) (Set_in x9@87@01 xs9@21@01))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) x9@87@01) x9@87@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@22@11@22@62-aux|)))
(assert (forall ((x9@87@01 $Ref)) (!
  (=> (Set_in x9@87@01 xs9@21@01) (= (inv_8<Ref> x9@87@01) x9@87@01))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) x9@87@01) x9@87@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@22@11@22@62|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall r: Ref :: { inv_8(r) } (inv_8(r) in xs9) ==> inv_8(r) == r)
(declare-const $t@88@01 $Snap)
(assert (= $t@88@01 $Snap.unit))
; [eval] (forall r: Ref :: { inv_8(r) } (inv_8(r) in xs9) ==> inv_8(r) == r)
(declare-const r@89@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (inv_8(r) in xs9) ==> inv_8(r) == r
; [eval] (inv_8(r) in xs9)
; [eval] inv_8(r)
(push) ; 4
; [then-branch: 62 | inv_8[Ref](r@89@01) in xs9@21@01 | live]
; [else-branch: 62 | !(inv_8[Ref](r@89@01) in xs9@21@01) | live]
(push) ; 5
; [then-branch: 62 | inv_8[Ref](r@89@01) in xs9@21@01]
(assert (Set_in (inv_8<Ref> r@89@01) xs9@21@01))
; [eval] inv_8(r) == r
; [eval] inv_8(r)
(pop) ; 5
(push) ; 5
; [else-branch: 62 | !(inv_8[Ref](r@89@01) in xs9@21@01)]
(assert (not (Set_in (inv_8<Ref> r@89@01) xs9@21@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Set_in (inv_8<Ref> r@89@01) xs9@21@01))
  (Set_in (inv_8<Ref> r@89@01) xs9@21@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@89@01 $Ref)) (!
  (or
    (not (Set_in (inv_8<Ref> r@89@01) xs9@21@01))
    (Set_in (inv_8<Ref> r@89@01) xs9@21@01))
  :pattern ((inv_8<Ref> r@89@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@22@11@22@62-aux|)))
(assert (forall ((r@89@01 $Ref)) (!
  (=> (Set_in (inv_8<Ref> r@89@01) xs9@21@01) (= (inv_8<Ref> r@89@01) r@89@01))
  :pattern ((inv_8<Ref> r@89@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@22@11@22@62|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall r: Ref ::
;     { inv_8(r) }
;     (inv_8(r) in xs9) ==>
;     perm(r.f) >=
;     __iar__assume_helper_8((inv_0(r) in xs1) && r == r, (inv_1(r) in xs2) &&
;     r == r, (inv_2(r) in xs3) && r == r, (inv_3(r) in xs4) && r == r, (inv_4(r) in
;     xs5) &&
;     r == r, (inv_5(r) in xs6) && r == r, (inv_6(r) in xs7) && r == r, (inv_7(r) in
;     xs8) &&
;     r == r, p, p, p, p, p, p, p, p, p))
(declare-const $t@90@01 $Snap)
(assert (= $t@90@01 $Snap.unit))
; [eval] (forall r: Ref :: { inv_8(r) } (inv_8(r) in xs9) ==> perm(r.f) >= __iar__assume_helper_8((inv_0(r) in xs1) && r == r, (inv_1(r) in xs2) && r == r, (inv_2(r) in xs3) && r == r, (inv_3(r) in xs4) && r == r, (inv_4(r) in xs5) && r == r, (inv_5(r) in xs6) && r == r, (inv_6(r) in xs7) && r == r, (inv_7(r) in xs8) && r == r, p, p, p, p, p, p, p, p, p))
(declare-const r@91@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (inv_8(r) in xs9) ==> perm(r.f) >= __iar__assume_helper_8((inv_0(r) in xs1) && r == r, (inv_1(r) in xs2) && r == r, (inv_2(r) in xs3) && r == r, (inv_3(r) in xs4) && r == r, (inv_4(r) in xs5) && r == r, (inv_5(r) in xs6) && r == r, (inv_6(r) in xs7) && r == r, (inv_7(r) in xs8) && r == r, p, p, p, p, p, p, p, p, p)
; [eval] (inv_8(r) in xs9)
; [eval] inv_8(r)
(push) ; 4
; [then-branch: 63 | inv_8[Ref](r@91@01) in xs9@21@01 | live]
; [else-branch: 63 | !(inv_8[Ref](r@91@01) in xs9@21@01) | live]
(push) ; 5
; [then-branch: 63 | inv_8[Ref](r@91@01) in xs9@21@01]
(assert (Set_in (inv_8<Ref> r@91@01) xs9@21@01))
; [eval] perm(r.f) >= __iar__assume_helper_8((inv_0(r) in xs1) && r == r, (inv_1(r) in xs2) && r == r, (inv_2(r) in xs3) && r == r, (inv_3(r) in xs4) && r == r, (inv_4(r) in xs5) && r == r, (inv_5(r) in xs6) && r == r, (inv_6(r) in xs7) && r == r, (inv_7(r) in xs8) && r == r, p, p, p, p, p, p, p, p, p)
; [eval] perm(r.f)
; Definitional axioms for snapshot map values
(declare-const pm@92@01 $FPM)
(assert (forall ((r $Ref)) (!
  (= ($FVF.perm_f (as pm@92@01  $FPM) r) (ite (= r x@24@01) p@25@01 $Perm.No))
  :pattern (($FVF.perm_f (as pm@92@01  $FPM) r))
  :qid |qp.resPrmSumDef18|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f (as sm@28@01  $FVF<f>) r) r))
  :pattern (($FVF.perm_f (as pm@92@01  $FPM) r))
  :qid |qp.resTrgDef19|)))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r@91@01) r@91@01))
; perm(r.f)  ~~>  assume upper permission bound
(assert (<= ($FVF.perm_f (as pm@92@01  $FPM) r@91@01) $Perm.Write))
; [eval] __iar__assume_helper_8((inv_0(r) in xs1) && r == r, (inv_1(r) in xs2) && r == r, (inv_2(r) in xs3) && r == r, (inv_3(r) in xs4) && r == r, (inv_4(r) in xs5) && r == r, (inv_5(r) in xs6) && r == r, (inv_6(r) in xs7) && r == r, (inv_7(r) in xs8) && r == r, p, p, p, p, p, p, p, p, p)
; [eval] (inv_0(r) in xs1) && r == r
; [eval] (inv_0(r) in xs1)
; [eval] inv_0(r)
(push) ; 6
; [then-branch: 64 | !(inv_0[Ref](r@91@01) in xs1@13@01) | live]
; [else-branch: 64 | inv_0[Ref](r@91@01) in xs1@13@01 | live]
(push) ; 7
; [then-branch: 64 | !(inv_0[Ref](r@91@01) in xs1@13@01)]
(assert (not (Set_in (inv_0<Ref> r@91@01) xs1@13@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 64 | inv_0[Ref](r@91@01) in xs1@13@01]
(assert (Set_in (inv_0<Ref> r@91@01) xs1@13@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_0<Ref> r@91@01) xs1@13@01)
  (not (Set_in (inv_0<Ref> r@91@01) xs1@13@01))))
; [eval] (inv_1(r) in xs2) && r == r
; [eval] (inv_1(r) in xs2)
; [eval] inv_1(r)
(push) ; 6
; [then-branch: 65 | !(inv_1[Ref](r@91@01) in xs2@14@01) | live]
; [else-branch: 65 | inv_1[Ref](r@91@01) in xs2@14@01 | live]
(push) ; 7
; [then-branch: 65 | !(inv_1[Ref](r@91@01) in xs2@14@01)]
(assert (not (Set_in (inv_1<Ref> r@91@01) xs2@14@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 65 | inv_1[Ref](r@91@01) in xs2@14@01]
(assert (Set_in (inv_1<Ref> r@91@01) xs2@14@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_1<Ref> r@91@01) xs2@14@01)
  (not (Set_in (inv_1<Ref> r@91@01) xs2@14@01))))
; [eval] (inv_2(r) in xs3) && r == r
; [eval] (inv_2(r) in xs3)
; [eval] inv_2(r)
(push) ; 6
; [then-branch: 66 | !(inv_2[Ref](r@91@01) in xs3@15@01) | live]
; [else-branch: 66 | inv_2[Ref](r@91@01) in xs3@15@01 | live]
(push) ; 7
; [then-branch: 66 | !(inv_2[Ref](r@91@01) in xs3@15@01)]
(assert (not (Set_in (inv_2<Ref> r@91@01) xs3@15@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 66 | inv_2[Ref](r@91@01) in xs3@15@01]
(assert (Set_in (inv_2<Ref> r@91@01) xs3@15@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_2<Ref> r@91@01) xs3@15@01)
  (not (Set_in (inv_2<Ref> r@91@01) xs3@15@01))))
; [eval] (inv_3(r) in xs4) && r == r
; [eval] (inv_3(r) in xs4)
; [eval] inv_3(r)
(push) ; 6
; [then-branch: 67 | !(inv_3[Ref](r@91@01) in xs4@16@01) | live]
; [else-branch: 67 | inv_3[Ref](r@91@01) in xs4@16@01 | live]
(push) ; 7
; [then-branch: 67 | !(inv_3[Ref](r@91@01) in xs4@16@01)]
(assert (not (Set_in (inv_3<Ref> r@91@01) xs4@16@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 67 | inv_3[Ref](r@91@01) in xs4@16@01]
(assert (Set_in (inv_3<Ref> r@91@01) xs4@16@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_3<Ref> r@91@01) xs4@16@01)
  (not (Set_in (inv_3<Ref> r@91@01) xs4@16@01))))
; [eval] (inv_4(r) in xs5) && r == r
; [eval] (inv_4(r) in xs5)
; [eval] inv_4(r)
(push) ; 6
; [then-branch: 68 | !(inv_4[Ref](r@91@01) in xs5@17@01) | live]
; [else-branch: 68 | inv_4[Ref](r@91@01) in xs5@17@01 | live]
(push) ; 7
; [then-branch: 68 | !(inv_4[Ref](r@91@01) in xs5@17@01)]
(assert (not (Set_in (inv_4<Ref> r@91@01) xs5@17@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 68 | inv_4[Ref](r@91@01) in xs5@17@01]
(assert (Set_in (inv_4<Ref> r@91@01) xs5@17@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_4<Ref> r@91@01) xs5@17@01)
  (not (Set_in (inv_4<Ref> r@91@01) xs5@17@01))))
; [eval] (inv_5(r) in xs6) && r == r
; [eval] (inv_5(r) in xs6)
; [eval] inv_5(r)
(push) ; 6
; [then-branch: 69 | !(inv_5[Ref](r@91@01) in xs6@18@01) | live]
; [else-branch: 69 | inv_5[Ref](r@91@01) in xs6@18@01 | live]
(push) ; 7
; [then-branch: 69 | !(inv_5[Ref](r@91@01) in xs6@18@01)]
(assert (not (Set_in (inv_5<Ref> r@91@01) xs6@18@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 69 | inv_5[Ref](r@91@01) in xs6@18@01]
(assert (Set_in (inv_5<Ref> r@91@01) xs6@18@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_5<Ref> r@91@01) xs6@18@01)
  (not (Set_in (inv_5<Ref> r@91@01) xs6@18@01))))
; [eval] (inv_6(r) in xs7) && r == r
; [eval] (inv_6(r) in xs7)
; [eval] inv_6(r)
(push) ; 6
; [then-branch: 70 | !(inv_6[Ref](r@91@01) in xs7@19@01) | live]
; [else-branch: 70 | inv_6[Ref](r@91@01) in xs7@19@01 | live]
(push) ; 7
; [then-branch: 70 | !(inv_6[Ref](r@91@01) in xs7@19@01)]
(assert (not (Set_in (inv_6<Ref> r@91@01) xs7@19@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 70 | inv_6[Ref](r@91@01) in xs7@19@01]
(assert (Set_in (inv_6<Ref> r@91@01) xs7@19@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_6<Ref> r@91@01) xs7@19@01)
  (not (Set_in (inv_6<Ref> r@91@01) xs7@19@01))))
; [eval] (inv_7(r) in xs8) && r == r
; [eval] (inv_7(r) in xs8)
; [eval] inv_7(r)
(push) ; 6
; [then-branch: 71 | !(inv_7[Ref](r@91@01) in xs8@20@01) | live]
; [else-branch: 71 | inv_7[Ref](r@91@01) in xs8@20@01 | live]
(push) ; 7
; [then-branch: 71 | !(inv_7[Ref](r@91@01) in xs8@20@01)]
(assert (not (Set_in (inv_7<Ref> r@91@01) xs8@20@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 71 | inv_7[Ref](r@91@01) in xs8@20@01]
(assert (Set_in (inv_7<Ref> r@91@01) xs8@20@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_7<Ref> r@91@01) xs8@20@01)
  (not (Set_in (inv_7<Ref> r@91@01) xs8@20@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 63 | !(inv_8[Ref](r@91@01) in xs9@21@01)]
(assert (not (Set_in (inv_8<Ref> r@91@01) xs9@21@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (= ($FVF.perm_f (as pm@92@01  $FPM) r) (ite (= r x@24@01) p@25@01 $Perm.No))
  :pattern (($FVF.perm_f (as pm@92@01  $FPM) r))
  :qid |qp.resPrmSumDef18|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f (as sm@28@01  $FVF<f>) r) r))
  :pattern (($FVF.perm_f (as pm@92@01  $FPM) r))
  :qid |qp.resTrgDef19|)))
(assert (=>
  (Set_in (inv_8<Ref> r@91@01) xs9@21@01)
  (and
    (Set_in (inv_8<Ref> r@91@01) xs9@21@01)
    ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r@91@01) r@91@01)
    (<= ($FVF.perm_f (as pm@92@01  $FPM) r@91@01) $Perm.Write)
    (or
      (Set_in (inv_0<Ref> r@91@01) xs1@13@01)
      (not (Set_in (inv_0<Ref> r@91@01) xs1@13@01)))
    (or
      (Set_in (inv_1<Ref> r@91@01) xs2@14@01)
      (not (Set_in (inv_1<Ref> r@91@01) xs2@14@01)))
    (or
      (Set_in (inv_2<Ref> r@91@01) xs3@15@01)
      (not (Set_in (inv_2<Ref> r@91@01) xs3@15@01)))
    (or
      (Set_in (inv_3<Ref> r@91@01) xs4@16@01)
      (not (Set_in (inv_3<Ref> r@91@01) xs4@16@01)))
    (or
      (Set_in (inv_4<Ref> r@91@01) xs5@17@01)
      (not (Set_in (inv_4<Ref> r@91@01) xs5@17@01)))
    (or
      (Set_in (inv_5<Ref> r@91@01) xs6@18@01)
      (not (Set_in (inv_5<Ref> r@91@01) xs6@18@01)))
    (or
      (Set_in (inv_6<Ref> r@91@01) xs7@19@01)
      (not (Set_in (inv_6<Ref> r@91@01) xs7@19@01)))
    (or
      (Set_in (inv_7<Ref> r@91@01) xs8@20@01)
      (not (Set_in (inv_7<Ref> r@91@01) xs8@20@01))))))
; Joined path conditions
(assert (or
  (not (Set_in (inv_8<Ref> r@91@01) xs9@21@01))
  (Set_in (inv_8<Ref> r@91@01) xs9@21@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (= ($FVF.perm_f (as pm@92@01  $FPM) r) (ite (= r x@24@01) p@25@01 $Perm.No))
  :pattern (($FVF.perm_f (as pm@92@01  $FPM) r))
  :qid |qp.resPrmSumDef18|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f (as sm@28@01  $FVF<f>) r) r))
  :pattern (($FVF.perm_f (as pm@92@01  $FPM) r))
  :qid |qp.resTrgDef19|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@91@01 $Ref)) (!
  (and
    (=>
      (Set_in (inv_8<Ref> r@91@01) xs9@21@01)
      (and
        (Set_in (inv_8<Ref> r@91@01) xs9@21@01)
        ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r@91@01) r@91@01)
        (<= ($FVF.perm_f (as pm@92@01  $FPM) r@91@01) $Perm.Write)
        (or
          (Set_in (inv_0<Ref> r@91@01) xs1@13@01)
          (not (Set_in (inv_0<Ref> r@91@01) xs1@13@01)))
        (or
          (Set_in (inv_1<Ref> r@91@01) xs2@14@01)
          (not (Set_in (inv_1<Ref> r@91@01) xs2@14@01)))
        (or
          (Set_in (inv_2<Ref> r@91@01) xs3@15@01)
          (not (Set_in (inv_2<Ref> r@91@01) xs3@15@01)))
        (or
          (Set_in (inv_3<Ref> r@91@01) xs4@16@01)
          (not (Set_in (inv_3<Ref> r@91@01) xs4@16@01)))
        (or
          (Set_in (inv_4<Ref> r@91@01) xs5@17@01)
          (not (Set_in (inv_4<Ref> r@91@01) xs5@17@01)))
        (or
          (Set_in (inv_5<Ref> r@91@01) xs6@18@01)
          (not (Set_in (inv_5<Ref> r@91@01) xs6@18@01)))
        (or
          (Set_in (inv_6<Ref> r@91@01) xs7@19@01)
          (not (Set_in (inv_6<Ref> r@91@01) xs7@19@01)))
        (or
          (Set_in (inv_7<Ref> r@91@01) xs8@20@01)
          (not (Set_in (inv_7<Ref> r@91@01) xs8@20@01)))))
    (or
      (not (Set_in (inv_8<Ref> r@91@01) xs9@21@01))
      (Set_in (inv_8<Ref> r@91@01) xs9@21@01)))
  :pattern ((inv_8<Ref> r@91@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@22@11@22@62-aux|)))
(assert (forall ((r@91@01 $Ref)) (!
  (=>
    (Set_in (inv_8<Ref> r@91@01) xs9@21@01)
    (>=
      ($FVF.perm_f (as pm@92@01  $FPM) r@91@01)
      (__iar__assume_helper_8<Perm> (Set_in (inv_0<Ref> r@91@01) xs1@13@01) (Set_in (inv_1<Ref> r@91@01) xs2@14@01) (Set_in (inv_2<Ref> r@91@01) xs3@15@01) (Set_in (inv_3<Ref> r@91@01) xs4@16@01) (Set_in (inv_4<Ref> r@91@01) xs5@17@01) (Set_in (inv_5<Ref> r@91@01) xs6@18@01) (Set_in (inv_6<Ref> r@91@01) xs7@19@01) (Set_in (inv_7<Ref> r@91@01) xs8@20@01) p@25@01 p@25@01 p@25@01 p@25@01 p@25@01 p@25@01 p@25@01 p@25@01 p@25@01)))
  :pattern ((inv_8<Ref> r@91@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@22@11@22@62|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x10: Ref ::
;     { x10.f }
;     (x10 in xs10) ==> true && inv_9(x10) == x10)
(declare-const $t@93@01 $Snap)
(assert (= $t@93@01 $Snap.unit))
; [eval] (forall x10: Ref :: { x10.f } (x10 in xs10) ==> true && inv_9(x10) == x10)
(declare-const x10@94@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x10 in xs10) ==> true && inv_9(x10) == x10
; [eval] (x10 in xs10)
(push) ; 4
; [then-branch: 72 | x10@94@01 in xs10@22@01 | live]
; [else-branch: 72 | !(x10@94@01 in xs10@22@01) | live]
(push) ; 5
; [then-branch: 72 | x10@94@01 in xs10@22@01]
(assert (Set_in x10@94@01 xs10@22@01))
; [eval] true && inv_9(x10) == x10
(push) ; 6
; [then-branch: 73 | False | live]
; [else-branch: 73 | True | live]
(push) ; 7
; [then-branch: 73 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 73 | True]
; [eval] inv_9(x10) == x10
; [eval] inv_9(x10)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(push) ; 5
; [else-branch: 72 | !(x10@94@01 in xs10@22@01)]
(assert (not (Set_in x10@94@01 xs10@22@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in x10@94@01 xs10@22@01)) (Set_in x10@94@01 xs10@22@01)))
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x10@94@01 $Ref)) (!
  (or (not (Set_in x10@94@01 xs10@22@01)) (Set_in x10@94@01 xs10@22@01))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) x10@94@01) x10@94@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@23@11@23@67-aux|)))
(assert (forall ((x10@94@01 $Ref)) (!
  (=> (Set_in x10@94@01 xs10@22@01) (= (inv_9<Ref> x10@94@01) x10@94@01))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) x10@94@01) x10@94@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@23@11@23@67|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall r: Ref :: { inv_9(r) } (inv_9(r) in xs10) ==> inv_9(r) == r)
(declare-const $t@95@01 $Snap)
(assert (= $t@95@01 $Snap.unit))
; [eval] (forall r: Ref :: { inv_9(r) } (inv_9(r) in xs10) ==> inv_9(r) == r)
(declare-const r@96@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (inv_9(r) in xs10) ==> inv_9(r) == r
; [eval] (inv_9(r) in xs10)
; [eval] inv_9(r)
(push) ; 4
; [then-branch: 74 | inv_9[Ref](r@96@01) in xs10@22@01 | live]
; [else-branch: 74 | !(inv_9[Ref](r@96@01) in xs10@22@01) | live]
(push) ; 5
; [then-branch: 74 | inv_9[Ref](r@96@01) in xs10@22@01]
(assert (Set_in (inv_9<Ref> r@96@01) xs10@22@01))
; [eval] inv_9(r) == r
; [eval] inv_9(r)
(pop) ; 5
(push) ; 5
; [else-branch: 74 | !(inv_9[Ref](r@96@01) in xs10@22@01)]
(assert (not (Set_in (inv_9<Ref> r@96@01) xs10@22@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Set_in (inv_9<Ref> r@96@01) xs10@22@01))
  (Set_in (inv_9<Ref> r@96@01) xs10@22@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@96@01 $Ref)) (!
  (or
    (not (Set_in (inv_9<Ref> r@96@01) xs10@22@01))
    (Set_in (inv_9<Ref> r@96@01) xs10@22@01))
  :pattern ((inv_9<Ref> r@96@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@23@11@23@67-aux|)))
(assert (forall ((r@96@01 $Ref)) (!
  (=> (Set_in (inv_9<Ref> r@96@01) xs10@22@01) (= (inv_9<Ref> r@96@01) r@96@01))
  :pattern ((inv_9<Ref> r@96@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@23@11@23@67|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall r: Ref ::
;     { inv_9(r) }
;     (inv_9(r) in xs10) ==>
;     perm(r.f) >=
;     __iar__assume_helper_9((inv_0(r) in xs1) && r == r, (inv_1(r) in xs2) &&
;     r == r, (inv_2(r) in xs3) && r == r, (inv_3(r) in xs4) && r == r, (inv_4(r) in
;     xs5) &&
;     r == r, (inv_5(r) in xs6) && r == r, (inv_6(r) in xs7) && r == r, (inv_7(r) in
;     xs8) &&
;     r == r, (inv_8(r) in xs9) && r == r, p, p, p, p, p, p, p, p, p, p))
(declare-const $t@97@01 $Snap)
(assert (= $t@97@01 $Snap.unit))
; [eval] (forall r: Ref :: { inv_9(r) } (inv_9(r) in xs10) ==> perm(r.f) >= __iar__assume_helper_9((inv_0(r) in xs1) && r == r, (inv_1(r) in xs2) && r == r, (inv_2(r) in xs3) && r == r, (inv_3(r) in xs4) && r == r, (inv_4(r) in xs5) && r == r, (inv_5(r) in xs6) && r == r, (inv_6(r) in xs7) && r == r, (inv_7(r) in xs8) && r == r, (inv_8(r) in xs9) && r == r, p, p, p, p, p, p, p, p, p, p))
(declare-const r@98@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (inv_9(r) in xs10) ==> perm(r.f) >= __iar__assume_helper_9((inv_0(r) in xs1) && r == r, (inv_1(r) in xs2) && r == r, (inv_2(r) in xs3) && r == r, (inv_3(r) in xs4) && r == r, (inv_4(r) in xs5) && r == r, (inv_5(r) in xs6) && r == r, (inv_6(r) in xs7) && r == r, (inv_7(r) in xs8) && r == r, (inv_8(r) in xs9) && r == r, p, p, p, p, p, p, p, p, p, p)
; [eval] (inv_9(r) in xs10)
; [eval] inv_9(r)
(push) ; 4
; [then-branch: 75 | inv_9[Ref](r@98@01) in xs10@22@01 | live]
; [else-branch: 75 | !(inv_9[Ref](r@98@01) in xs10@22@01) | live]
(push) ; 5
; [then-branch: 75 | inv_9[Ref](r@98@01) in xs10@22@01]
(assert (Set_in (inv_9<Ref> r@98@01) xs10@22@01))
; [eval] perm(r.f) >= __iar__assume_helper_9((inv_0(r) in xs1) && r == r, (inv_1(r) in xs2) && r == r, (inv_2(r) in xs3) && r == r, (inv_3(r) in xs4) && r == r, (inv_4(r) in xs5) && r == r, (inv_5(r) in xs6) && r == r, (inv_6(r) in xs7) && r == r, (inv_7(r) in xs8) && r == r, (inv_8(r) in xs9) && r == r, p, p, p, p, p, p, p, p, p, p)
; [eval] perm(r.f)
; Definitional axioms for snapshot map values
(declare-const pm@99@01 $FPM)
(assert (forall ((r $Ref)) (!
  (= ($FVF.perm_f (as pm@99@01  $FPM) r) (ite (= r x@24@01) p@25@01 $Perm.No))
  :pattern (($FVF.perm_f (as pm@99@01  $FPM) r))
  :qid |qp.resPrmSumDef20|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f (as sm@28@01  $FVF<f>) r) r))
  :pattern (($FVF.perm_f (as pm@99@01  $FPM) r))
  :qid |qp.resTrgDef21|)))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r@98@01) r@98@01))
; perm(r.f)  ~~>  assume upper permission bound
(assert (<= ($FVF.perm_f (as pm@99@01  $FPM) r@98@01) $Perm.Write))
; [eval] __iar__assume_helper_9((inv_0(r) in xs1) && r == r, (inv_1(r) in xs2) && r == r, (inv_2(r) in xs3) && r == r, (inv_3(r) in xs4) && r == r, (inv_4(r) in xs5) && r == r, (inv_5(r) in xs6) && r == r, (inv_6(r) in xs7) && r == r, (inv_7(r) in xs8) && r == r, (inv_8(r) in xs9) && r == r, p, p, p, p, p, p, p, p, p, p)
; [eval] (inv_0(r) in xs1) && r == r
; [eval] (inv_0(r) in xs1)
; [eval] inv_0(r)
(push) ; 6
; [then-branch: 76 | !(inv_0[Ref](r@98@01) in xs1@13@01) | live]
; [else-branch: 76 | inv_0[Ref](r@98@01) in xs1@13@01 | live]
(push) ; 7
; [then-branch: 76 | !(inv_0[Ref](r@98@01) in xs1@13@01)]
(assert (not (Set_in (inv_0<Ref> r@98@01) xs1@13@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 76 | inv_0[Ref](r@98@01) in xs1@13@01]
(assert (Set_in (inv_0<Ref> r@98@01) xs1@13@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_0<Ref> r@98@01) xs1@13@01)
  (not (Set_in (inv_0<Ref> r@98@01) xs1@13@01))))
; [eval] (inv_1(r) in xs2) && r == r
; [eval] (inv_1(r) in xs2)
; [eval] inv_1(r)
(push) ; 6
; [then-branch: 77 | !(inv_1[Ref](r@98@01) in xs2@14@01) | live]
; [else-branch: 77 | inv_1[Ref](r@98@01) in xs2@14@01 | live]
(push) ; 7
; [then-branch: 77 | !(inv_1[Ref](r@98@01) in xs2@14@01)]
(assert (not (Set_in (inv_1<Ref> r@98@01) xs2@14@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 77 | inv_1[Ref](r@98@01) in xs2@14@01]
(assert (Set_in (inv_1<Ref> r@98@01) xs2@14@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_1<Ref> r@98@01) xs2@14@01)
  (not (Set_in (inv_1<Ref> r@98@01) xs2@14@01))))
; [eval] (inv_2(r) in xs3) && r == r
; [eval] (inv_2(r) in xs3)
; [eval] inv_2(r)
(push) ; 6
; [then-branch: 78 | !(inv_2[Ref](r@98@01) in xs3@15@01) | live]
; [else-branch: 78 | inv_2[Ref](r@98@01) in xs3@15@01 | live]
(push) ; 7
; [then-branch: 78 | !(inv_2[Ref](r@98@01) in xs3@15@01)]
(assert (not (Set_in (inv_2<Ref> r@98@01) xs3@15@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 78 | inv_2[Ref](r@98@01) in xs3@15@01]
(assert (Set_in (inv_2<Ref> r@98@01) xs3@15@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_2<Ref> r@98@01) xs3@15@01)
  (not (Set_in (inv_2<Ref> r@98@01) xs3@15@01))))
; [eval] (inv_3(r) in xs4) && r == r
; [eval] (inv_3(r) in xs4)
; [eval] inv_3(r)
(push) ; 6
; [then-branch: 79 | !(inv_3[Ref](r@98@01) in xs4@16@01) | live]
; [else-branch: 79 | inv_3[Ref](r@98@01) in xs4@16@01 | live]
(push) ; 7
; [then-branch: 79 | !(inv_3[Ref](r@98@01) in xs4@16@01)]
(assert (not (Set_in (inv_3<Ref> r@98@01) xs4@16@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 79 | inv_3[Ref](r@98@01) in xs4@16@01]
(assert (Set_in (inv_3<Ref> r@98@01) xs4@16@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_3<Ref> r@98@01) xs4@16@01)
  (not (Set_in (inv_3<Ref> r@98@01) xs4@16@01))))
; [eval] (inv_4(r) in xs5) && r == r
; [eval] (inv_4(r) in xs5)
; [eval] inv_4(r)
(push) ; 6
; [then-branch: 80 | !(inv_4[Ref](r@98@01) in xs5@17@01) | live]
; [else-branch: 80 | inv_4[Ref](r@98@01) in xs5@17@01 | live]
(push) ; 7
; [then-branch: 80 | !(inv_4[Ref](r@98@01) in xs5@17@01)]
(assert (not (Set_in (inv_4<Ref> r@98@01) xs5@17@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 80 | inv_4[Ref](r@98@01) in xs5@17@01]
(assert (Set_in (inv_4<Ref> r@98@01) xs5@17@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_4<Ref> r@98@01) xs5@17@01)
  (not (Set_in (inv_4<Ref> r@98@01) xs5@17@01))))
; [eval] (inv_5(r) in xs6) && r == r
; [eval] (inv_5(r) in xs6)
; [eval] inv_5(r)
(push) ; 6
; [then-branch: 81 | !(inv_5[Ref](r@98@01) in xs6@18@01) | live]
; [else-branch: 81 | inv_5[Ref](r@98@01) in xs6@18@01 | live]
(push) ; 7
; [then-branch: 81 | !(inv_5[Ref](r@98@01) in xs6@18@01)]
(assert (not (Set_in (inv_5<Ref> r@98@01) xs6@18@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 81 | inv_5[Ref](r@98@01) in xs6@18@01]
(assert (Set_in (inv_5<Ref> r@98@01) xs6@18@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_5<Ref> r@98@01) xs6@18@01)
  (not (Set_in (inv_5<Ref> r@98@01) xs6@18@01))))
; [eval] (inv_6(r) in xs7) && r == r
; [eval] (inv_6(r) in xs7)
; [eval] inv_6(r)
(push) ; 6
; [then-branch: 82 | !(inv_6[Ref](r@98@01) in xs7@19@01) | live]
; [else-branch: 82 | inv_6[Ref](r@98@01) in xs7@19@01 | live]
(push) ; 7
; [then-branch: 82 | !(inv_6[Ref](r@98@01) in xs7@19@01)]
(assert (not (Set_in (inv_6<Ref> r@98@01) xs7@19@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 82 | inv_6[Ref](r@98@01) in xs7@19@01]
(assert (Set_in (inv_6<Ref> r@98@01) xs7@19@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_6<Ref> r@98@01) xs7@19@01)
  (not (Set_in (inv_6<Ref> r@98@01) xs7@19@01))))
; [eval] (inv_7(r) in xs8) && r == r
; [eval] (inv_7(r) in xs8)
; [eval] inv_7(r)
(push) ; 6
; [then-branch: 83 | !(inv_7[Ref](r@98@01) in xs8@20@01) | live]
; [else-branch: 83 | inv_7[Ref](r@98@01) in xs8@20@01 | live]
(push) ; 7
; [then-branch: 83 | !(inv_7[Ref](r@98@01) in xs8@20@01)]
(assert (not (Set_in (inv_7<Ref> r@98@01) xs8@20@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 83 | inv_7[Ref](r@98@01) in xs8@20@01]
(assert (Set_in (inv_7<Ref> r@98@01) xs8@20@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_7<Ref> r@98@01) xs8@20@01)
  (not (Set_in (inv_7<Ref> r@98@01) xs8@20@01))))
; [eval] (inv_8(r) in xs9) && r == r
; [eval] (inv_8(r) in xs9)
; [eval] inv_8(r)
(push) ; 6
; [then-branch: 84 | !(inv_8[Ref](r@98@01) in xs9@21@01) | live]
; [else-branch: 84 | inv_8[Ref](r@98@01) in xs9@21@01 | live]
(push) ; 7
; [then-branch: 84 | !(inv_8[Ref](r@98@01) in xs9@21@01)]
(assert (not (Set_in (inv_8<Ref> r@98@01) xs9@21@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 84 | inv_8[Ref](r@98@01) in xs9@21@01]
(assert (Set_in (inv_8<Ref> r@98@01) xs9@21@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_8<Ref> r@98@01) xs9@21@01)
  (not (Set_in (inv_8<Ref> r@98@01) xs9@21@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 75 | !(inv_9[Ref](r@98@01) in xs10@22@01)]
(assert (not (Set_in (inv_9<Ref> r@98@01) xs10@22@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (= ($FVF.perm_f (as pm@99@01  $FPM) r) (ite (= r x@24@01) p@25@01 $Perm.No))
  :pattern (($FVF.perm_f (as pm@99@01  $FPM) r))
  :qid |qp.resPrmSumDef20|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f (as sm@28@01  $FVF<f>) r) r))
  :pattern (($FVF.perm_f (as pm@99@01  $FPM) r))
  :qid |qp.resTrgDef21|)))
(assert (=>
  (Set_in (inv_9<Ref> r@98@01) xs10@22@01)
  (and
    (Set_in (inv_9<Ref> r@98@01) xs10@22@01)
    ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r@98@01) r@98@01)
    (<= ($FVF.perm_f (as pm@99@01  $FPM) r@98@01) $Perm.Write)
    (or
      (Set_in (inv_0<Ref> r@98@01) xs1@13@01)
      (not (Set_in (inv_0<Ref> r@98@01) xs1@13@01)))
    (or
      (Set_in (inv_1<Ref> r@98@01) xs2@14@01)
      (not (Set_in (inv_1<Ref> r@98@01) xs2@14@01)))
    (or
      (Set_in (inv_2<Ref> r@98@01) xs3@15@01)
      (not (Set_in (inv_2<Ref> r@98@01) xs3@15@01)))
    (or
      (Set_in (inv_3<Ref> r@98@01) xs4@16@01)
      (not (Set_in (inv_3<Ref> r@98@01) xs4@16@01)))
    (or
      (Set_in (inv_4<Ref> r@98@01) xs5@17@01)
      (not (Set_in (inv_4<Ref> r@98@01) xs5@17@01)))
    (or
      (Set_in (inv_5<Ref> r@98@01) xs6@18@01)
      (not (Set_in (inv_5<Ref> r@98@01) xs6@18@01)))
    (or
      (Set_in (inv_6<Ref> r@98@01) xs7@19@01)
      (not (Set_in (inv_6<Ref> r@98@01) xs7@19@01)))
    (or
      (Set_in (inv_7<Ref> r@98@01) xs8@20@01)
      (not (Set_in (inv_7<Ref> r@98@01) xs8@20@01)))
    (or
      (Set_in (inv_8<Ref> r@98@01) xs9@21@01)
      (not (Set_in (inv_8<Ref> r@98@01) xs9@21@01))))))
; Joined path conditions
(assert (or
  (not (Set_in (inv_9<Ref> r@98@01) xs10@22@01))
  (Set_in (inv_9<Ref> r@98@01) xs10@22@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (= ($FVF.perm_f (as pm@99@01  $FPM) r) (ite (= r x@24@01) p@25@01 $Perm.No))
  :pattern (($FVF.perm_f (as pm@99@01  $FPM) r))
  :qid |qp.resPrmSumDef20|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f (as sm@28@01  $FVF<f>) r) r))
  :pattern (($FVF.perm_f (as pm@99@01  $FPM) r))
  :qid |qp.resTrgDef21|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@98@01 $Ref)) (!
  (and
    (=>
      (Set_in (inv_9<Ref> r@98@01) xs10@22@01)
      (and
        (Set_in (inv_9<Ref> r@98@01) xs10@22@01)
        ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r@98@01) r@98@01)
        (<= ($FVF.perm_f (as pm@99@01  $FPM) r@98@01) $Perm.Write)
        (or
          (Set_in (inv_0<Ref> r@98@01) xs1@13@01)
          (not (Set_in (inv_0<Ref> r@98@01) xs1@13@01)))
        (or
          (Set_in (inv_1<Ref> r@98@01) xs2@14@01)
          (not (Set_in (inv_1<Ref> r@98@01) xs2@14@01)))
        (or
          (Set_in (inv_2<Ref> r@98@01) xs3@15@01)
          (not (Set_in (inv_2<Ref> r@98@01) xs3@15@01)))
        (or
          (Set_in (inv_3<Ref> r@98@01) xs4@16@01)
          (not (Set_in (inv_3<Ref> r@98@01) xs4@16@01)))
        (or
          (Set_in (inv_4<Ref> r@98@01) xs5@17@01)
          (not (Set_in (inv_4<Ref> r@98@01) xs5@17@01)))
        (or
          (Set_in (inv_5<Ref> r@98@01) xs6@18@01)
          (not (Set_in (inv_5<Ref> r@98@01) xs6@18@01)))
        (or
          (Set_in (inv_6<Ref> r@98@01) xs7@19@01)
          (not (Set_in (inv_6<Ref> r@98@01) xs7@19@01)))
        (or
          (Set_in (inv_7<Ref> r@98@01) xs8@20@01)
          (not (Set_in (inv_7<Ref> r@98@01) xs8@20@01)))
        (or
          (Set_in (inv_8<Ref> r@98@01) xs9@21@01)
          (not (Set_in (inv_8<Ref> r@98@01) xs9@21@01)))))
    (or
      (not (Set_in (inv_9<Ref> r@98@01) xs10@22@01))
      (Set_in (inv_9<Ref> r@98@01) xs10@22@01)))
  :pattern ((inv_9<Ref> r@98@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@23@11@23@67-aux|)))
(assert (forall ((r@98@01 $Ref)) (!
  (=>
    (Set_in (inv_9<Ref> r@98@01) xs10@22@01)
    (>=
      ($FVF.perm_f (as pm@99@01  $FPM) r@98@01)
      (__iar__assume_helper_9<Perm> (Set_in (inv_0<Ref> r@98@01) xs1@13@01) (Set_in (inv_1<Ref> r@98@01) xs2@14@01) (Set_in (inv_2<Ref> r@98@01) xs3@15@01) (Set_in (inv_3<Ref> r@98@01) xs4@16@01) (Set_in (inv_4<Ref> r@98@01) xs5@17@01) (Set_in (inv_5<Ref> r@98@01) xs6@18@01) (Set_in (inv_6<Ref> r@98@01) xs7@19@01) (Set_in (inv_7<Ref> r@98@01) xs8@20@01) (Set_in (inv_8<Ref> r@98@01) xs9@21@01) p@25@01 p@25@01 p@25@01 p@25@01 p@25@01 p@25@01 p@25@01 p@25@01 p@25@01 p@25@01)))
  :pattern ((inv_9<Ref> r@98@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@23@11@23@67|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x11: Ref ::
;     { x11.f }
;     (x11 in xs11) ==> true && inv_10(x11) == x11)
(declare-const $t@100@01 $Snap)
(assert (= $t@100@01 $Snap.unit))
; [eval] (forall x11: Ref :: { x11.f } (x11 in xs11) ==> true && inv_10(x11) == x11)
(declare-const x11@101@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x11 in xs11) ==> true && inv_10(x11) == x11
; [eval] (x11 in xs11)
(push) ; 4
; [then-branch: 85 | x11@101@01 in xs11@23@01 | live]
; [else-branch: 85 | !(x11@101@01 in xs11@23@01) | live]
(push) ; 5
; [then-branch: 85 | x11@101@01 in xs11@23@01]
(assert (Set_in x11@101@01 xs11@23@01))
; [eval] true && inv_10(x11) == x11
(push) ; 6
; [then-branch: 86 | False | live]
; [else-branch: 86 | True | live]
(push) ; 7
; [then-branch: 86 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 86 | True]
; [eval] inv_10(x11) == x11
; [eval] inv_10(x11)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(push) ; 5
; [else-branch: 85 | !(x11@101@01 in xs11@23@01)]
(assert (not (Set_in x11@101@01 xs11@23@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in x11@101@01 xs11@23@01)) (Set_in x11@101@01 xs11@23@01)))
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x11@101@01 $Ref)) (!
  (or (not (Set_in x11@101@01 xs11@23@01)) (Set_in x11@101@01 xs11@23@01))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) x11@101@01) x11@101@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@24@11@24@67-aux|)))
(assert (forall ((x11@101@01 $Ref)) (!
  (=> (Set_in x11@101@01 xs11@23@01) (= (inv_10<Ref> x11@101@01) x11@101@01))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) x11@101@01) x11@101@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@24@11@24@67|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall r: Ref ::
;     { inv_10(r) }
;     (inv_10(r) in xs11) ==> inv_10(r) == r)
(declare-const $t@102@01 $Snap)
(assert (= $t@102@01 $Snap.unit))
; [eval] (forall r: Ref :: { inv_10(r) } (inv_10(r) in xs11) ==> inv_10(r) == r)
(declare-const r@103@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (inv_10(r) in xs11) ==> inv_10(r) == r
; [eval] (inv_10(r) in xs11)
; [eval] inv_10(r)
(push) ; 4
; [then-branch: 87 | inv_10[Ref](r@103@01) in xs11@23@01 | live]
; [else-branch: 87 | !(inv_10[Ref](r@103@01) in xs11@23@01) | live]
(push) ; 5
; [then-branch: 87 | inv_10[Ref](r@103@01) in xs11@23@01]
(assert (Set_in (inv_10<Ref> r@103@01) xs11@23@01))
; [eval] inv_10(r) == r
; [eval] inv_10(r)
(pop) ; 5
(push) ; 5
; [else-branch: 87 | !(inv_10[Ref](r@103@01) in xs11@23@01)]
(assert (not (Set_in (inv_10<Ref> r@103@01) xs11@23@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Set_in (inv_10<Ref> r@103@01) xs11@23@01))
  (Set_in (inv_10<Ref> r@103@01) xs11@23@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@103@01 $Ref)) (!
  (or
    (not (Set_in (inv_10<Ref> r@103@01) xs11@23@01))
    (Set_in (inv_10<Ref> r@103@01) xs11@23@01))
  :pattern ((inv_10<Ref> r@103@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@24@11@24@67-aux|)))
(assert (forall ((r@103@01 $Ref)) (!
  (=>
    (Set_in (inv_10<Ref> r@103@01) xs11@23@01)
    (= (inv_10<Ref> r@103@01) r@103@01))
  :pattern ((inv_10<Ref> r@103@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@24@11@24@67|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall r: Ref ::
;     { inv_10(r) }
;     (inv_10(r) in xs11) ==>
;     perm(r.f) >=
;     __iar__assume_helper_10((inv_0(r) in xs1) && r == r, (inv_1(r) in xs2) &&
;     r == r, (inv_2(r) in xs3) && r == r, (inv_3(r) in xs4) && r == r, (inv_4(r) in
;     xs5) &&
;     r == r, (inv_5(r) in xs6) && r == r, (inv_6(r) in xs7) && r == r, (inv_7(r) in
;     xs8) &&
;     r == r, (inv_8(r) in xs9) && r == r, (inv_9(r) in xs10) && r == r, p, p,
;     p, p, p, p, p, p, p, p, p))
(declare-const $t@104@01 $Snap)
(assert (= $t@104@01 $Snap.unit))
; [eval] (forall r: Ref :: { inv_10(r) } (inv_10(r) in xs11) ==> perm(r.f) >= __iar__assume_helper_10((inv_0(r) in xs1) && r == r, (inv_1(r) in xs2) && r == r, (inv_2(r) in xs3) && r == r, (inv_3(r) in xs4) && r == r, (inv_4(r) in xs5) && r == r, (inv_5(r) in xs6) && r == r, (inv_6(r) in xs7) && r == r, (inv_7(r) in xs8) && r == r, (inv_8(r) in xs9) && r == r, (inv_9(r) in xs10) && r == r, p, p, p, p, p, p, p, p, p, p, p))
(declare-const r@105@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (inv_10(r) in xs11) ==> perm(r.f) >= __iar__assume_helper_10((inv_0(r) in xs1) && r == r, (inv_1(r) in xs2) && r == r, (inv_2(r) in xs3) && r == r, (inv_3(r) in xs4) && r == r, (inv_4(r) in xs5) && r == r, (inv_5(r) in xs6) && r == r, (inv_6(r) in xs7) && r == r, (inv_7(r) in xs8) && r == r, (inv_8(r) in xs9) && r == r, (inv_9(r) in xs10) && r == r, p, p, p, p, p, p, p, p, p, p, p)
; [eval] (inv_10(r) in xs11)
; [eval] inv_10(r)
(push) ; 4
; [then-branch: 88 | inv_10[Ref](r@105@01) in xs11@23@01 | live]
; [else-branch: 88 | !(inv_10[Ref](r@105@01) in xs11@23@01) | live]
(push) ; 5
; [then-branch: 88 | inv_10[Ref](r@105@01) in xs11@23@01]
(assert (Set_in (inv_10<Ref> r@105@01) xs11@23@01))
; [eval] perm(r.f) >= __iar__assume_helper_10((inv_0(r) in xs1) && r == r, (inv_1(r) in xs2) && r == r, (inv_2(r) in xs3) && r == r, (inv_3(r) in xs4) && r == r, (inv_4(r) in xs5) && r == r, (inv_5(r) in xs6) && r == r, (inv_6(r) in xs7) && r == r, (inv_7(r) in xs8) && r == r, (inv_8(r) in xs9) && r == r, (inv_9(r) in xs10) && r == r, p, p, p, p, p, p, p, p, p, p, p)
; [eval] perm(r.f)
; Definitional axioms for snapshot map values
(declare-const pm@106@01 $FPM)
(assert (forall ((r $Ref)) (!
  (= ($FVF.perm_f (as pm@106@01  $FPM) r) (ite (= r x@24@01) p@25@01 $Perm.No))
  :pattern (($FVF.perm_f (as pm@106@01  $FPM) r))
  :qid |qp.resPrmSumDef22|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f (as sm@28@01  $FVF<f>) r) r))
  :pattern (($FVF.perm_f (as pm@106@01  $FPM) r))
  :qid |qp.resTrgDef23|)))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r@105@01) r@105@01))
; perm(r.f)  ~~>  assume upper permission bound
(assert (<= ($FVF.perm_f (as pm@106@01  $FPM) r@105@01) $Perm.Write))
; [eval] __iar__assume_helper_10((inv_0(r) in xs1) && r == r, (inv_1(r) in xs2) && r == r, (inv_2(r) in xs3) && r == r, (inv_3(r) in xs4) && r == r, (inv_4(r) in xs5) && r == r, (inv_5(r) in xs6) && r == r, (inv_6(r) in xs7) && r == r, (inv_7(r) in xs8) && r == r, (inv_8(r) in xs9) && r == r, (inv_9(r) in xs10) && r == r, p, p, p, p, p, p, p, p, p, p, p)
; [eval] (inv_0(r) in xs1) && r == r
; [eval] (inv_0(r) in xs1)
; [eval] inv_0(r)
(push) ; 6
; [then-branch: 89 | !(inv_0[Ref](r@105@01) in xs1@13@01) | live]
; [else-branch: 89 | inv_0[Ref](r@105@01) in xs1@13@01 | live]
(push) ; 7
; [then-branch: 89 | !(inv_0[Ref](r@105@01) in xs1@13@01)]
(assert (not (Set_in (inv_0<Ref> r@105@01) xs1@13@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 89 | inv_0[Ref](r@105@01) in xs1@13@01]
(assert (Set_in (inv_0<Ref> r@105@01) xs1@13@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_0<Ref> r@105@01) xs1@13@01)
  (not (Set_in (inv_0<Ref> r@105@01) xs1@13@01))))
; [eval] (inv_1(r) in xs2) && r == r
; [eval] (inv_1(r) in xs2)
; [eval] inv_1(r)
(push) ; 6
; [then-branch: 90 | !(inv_1[Ref](r@105@01) in xs2@14@01) | live]
; [else-branch: 90 | inv_1[Ref](r@105@01) in xs2@14@01 | live]
(push) ; 7
; [then-branch: 90 | !(inv_1[Ref](r@105@01) in xs2@14@01)]
(assert (not (Set_in (inv_1<Ref> r@105@01) xs2@14@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 90 | inv_1[Ref](r@105@01) in xs2@14@01]
(assert (Set_in (inv_1<Ref> r@105@01) xs2@14@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_1<Ref> r@105@01) xs2@14@01)
  (not (Set_in (inv_1<Ref> r@105@01) xs2@14@01))))
; [eval] (inv_2(r) in xs3) && r == r
; [eval] (inv_2(r) in xs3)
; [eval] inv_2(r)
(push) ; 6
; [then-branch: 91 | !(inv_2[Ref](r@105@01) in xs3@15@01) | live]
; [else-branch: 91 | inv_2[Ref](r@105@01) in xs3@15@01 | live]
(push) ; 7
; [then-branch: 91 | !(inv_2[Ref](r@105@01) in xs3@15@01)]
(assert (not (Set_in (inv_2<Ref> r@105@01) xs3@15@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 91 | inv_2[Ref](r@105@01) in xs3@15@01]
(assert (Set_in (inv_2<Ref> r@105@01) xs3@15@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_2<Ref> r@105@01) xs3@15@01)
  (not (Set_in (inv_2<Ref> r@105@01) xs3@15@01))))
; [eval] (inv_3(r) in xs4) && r == r
; [eval] (inv_3(r) in xs4)
; [eval] inv_3(r)
(push) ; 6
; [then-branch: 92 | !(inv_3[Ref](r@105@01) in xs4@16@01) | live]
; [else-branch: 92 | inv_3[Ref](r@105@01) in xs4@16@01 | live]
(push) ; 7
; [then-branch: 92 | !(inv_3[Ref](r@105@01) in xs4@16@01)]
(assert (not (Set_in (inv_3<Ref> r@105@01) xs4@16@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 92 | inv_3[Ref](r@105@01) in xs4@16@01]
(assert (Set_in (inv_3<Ref> r@105@01) xs4@16@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_3<Ref> r@105@01) xs4@16@01)
  (not (Set_in (inv_3<Ref> r@105@01) xs4@16@01))))
; [eval] (inv_4(r) in xs5) && r == r
; [eval] (inv_4(r) in xs5)
; [eval] inv_4(r)
(push) ; 6
; [then-branch: 93 | !(inv_4[Ref](r@105@01) in xs5@17@01) | live]
; [else-branch: 93 | inv_4[Ref](r@105@01) in xs5@17@01 | live]
(push) ; 7
; [then-branch: 93 | !(inv_4[Ref](r@105@01) in xs5@17@01)]
(assert (not (Set_in (inv_4<Ref> r@105@01) xs5@17@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 93 | inv_4[Ref](r@105@01) in xs5@17@01]
(assert (Set_in (inv_4<Ref> r@105@01) xs5@17@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_4<Ref> r@105@01) xs5@17@01)
  (not (Set_in (inv_4<Ref> r@105@01) xs5@17@01))))
; [eval] (inv_5(r) in xs6) && r == r
; [eval] (inv_5(r) in xs6)
; [eval] inv_5(r)
(push) ; 6
; [then-branch: 94 | !(inv_5[Ref](r@105@01) in xs6@18@01) | live]
; [else-branch: 94 | inv_5[Ref](r@105@01) in xs6@18@01 | live]
(push) ; 7
; [then-branch: 94 | !(inv_5[Ref](r@105@01) in xs6@18@01)]
(assert (not (Set_in (inv_5<Ref> r@105@01) xs6@18@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 94 | inv_5[Ref](r@105@01) in xs6@18@01]
(assert (Set_in (inv_5<Ref> r@105@01) xs6@18@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_5<Ref> r@105@01) xs6@18@01)
  (not (Set_in (inv_5<Ref> r@105@01) xs6@18@01))))
; [eval] (inv_6(r) in xs7) && r == r
; [eval] (inv_6(r) in xs7)
; [eval] inv_6(r)
(push) ; 6
; [then-branch: 95 | !(inv_6[Ref](r@105@01) in xs7@19@01) | live]
; [else-branch: 95 | inv_6[Ref](r@105@01) in xs7@19@01 | live]
(push) ; 7
; [then-branch: 95 | !(inv_6[Ref](r@105@01) in xs7@19@01)]
(assert (not (Set_in (inv_6<Ref> r@105@01) xs7@19@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 95 | inv_6[Ref](r@105@01) in xs7@19@01]
(assert (Set_in (inv_6<Ref> r@105@01) xs7@19@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_6<Ref> r@105@01) xs7@19@01)
  (not (Set_in (inv_6<Ref> r@105@01) xs7@19@01))))
; [eval] (inv_7(r) in xs8) && r == r
; [eval] (inv_7(r) in xs8)
; [eval] inv_7(r)
(push) ; 6
; [then-branch: 96 | !(inv_7[Ref](r@105@01) in xs8@20@01) | live]
; [else-branch: 96 | inv_7[Ref](r@105@01) in xs8@20@01 | live]
(push) ; 7
; [then-branch: 96 | !(inv_7[Ref](r@105@01) in xs8@20@01)]
(assert (not (Set_in (inv_7<Ref> r@105@01) xs8@20@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 96 | inv_7[Ref](r@105@01) in xs8@20@01]
(assert (Set_in (inv_7<Ref> r@105@01) xs8@20@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_7<Ref> r@105@01) xs8@20@01)
  (not (Set_in (inv_7<Ref> r@105@01) xs8@20@01))))
; [eval] (inv_8(r) in xs9) && r == r
; [eval] (inv_8(r) in xs9)
; [eval] inv_8(r)
(push) ; 6
; [then-branch: 97 | !(inv_8[Ref](r@105@01) in xs9@21@01) | live]
; [else-branch: 97 | inv_8[Ref](r@105@01) in xs9@21@01 | live]
(push) ; 7
; [then-branch: 97 | !(inv_8[Ref](r@105@01) in xs9@21@01)]
(assert (not (Set_in (inv_8<Ref> r@105@01) xs9@21@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 97 | inv_8[Ref](r@105@01) in xs9@21@01]
(assert (Set_in (inv_8<Ref> r@105@01) xs9@21@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_8<Ref> r@105@01) xs9@21@01)
  (not (Set_in (inv_8<Ref> r@105@01) xs9@21@01))))
; [eval] (inv_9(r) in xs10) && r == r
; [eval] (inv_9(r) in xs10)
; [eval] inv_9(r)
(push) ; 6
; [then-branch: 98 | !(inv_9[Ref](r@105@01) in xs10@22@01) | live]
; [else-branch: 98 | inv_9[Ref](r@105@01) in xs10@22@01 | live]
(push) ; 7
; [then-branch: 98 | !(inv_9[Ref](r@105@01) in xs10@22@01)]
(assert (not (Set_in (inv_9<Ref> r@105@01) xs10@22@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 98 | inv_9[Ref](r@105@01) in xs10@22@01]
(assert (Set_in (inv_9<Ref> r@105@01) xs10@22@01))
; [eval] r == r
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_9<Ref> r@105@01) xs10@22@01)
  (not (Set_in (inv_9<Ref> r@105@01) xs10@22@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 88 | !(inv_10[Ref](r@105@01) in xs11@23@01)]
(assert (not (Set_in (inv_10<Ref> r@105@01) xs11@23@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (= ($FVF.perm_f (as pm@106@01  $FPM) r) (ite (= r x@24@01) p@25@01 $Perm.No))
  :pattern (($FVF.perm_f (as pm@106@01  $FPM) r))
  :qid |qp.resPrmSumDef22|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f (as sm@28@01  $FVF<f>) r) r))
  :pattern (($FVF.perm_f (as pm@106@01  $FPM) r))
  :qid |qp.resTrgDef23|)))
(assert (=>
  (Set_in (inv_10<Ref> r@105@01) xs11@23@01)
  (and
    (Set_in (inv_10<Ref> r@105@01) xs11@23@01)
    ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r@105@01) r@105@01)
    (<= ($FVF.perm_f (as pm@106@01  $FPM) r@105@01) $Perm.Write)
    (or
      (Set_in (inv_0<Ref> r@105@01) xs1@13@01)
      (not (Set_in (inv_0<Ref> r@105@01) xs1@13@01)))
    (or
      (Set_in (inv_1<Ref> r@105@01) xs2@14@01)
      (not (Set_in (inv_1<Ref> r@105@01) xs2@14@01)))
    (or
      (Set_in (inv_2<Ref> r@105@01) xs3@15@01)
      (not (Set_in (inv_2<Ref> r@105@01) xs3@15@01)))
    (or
      (Set_in (inv_3<Ref> r@105@01) xs4@16@01)
      (not (Set_in (inv_3<Ref> r@105@01) xs4@16@01)))
    (or
      (Set_in (inv_4<Ref> r@105@01) xs5@17@01)
      (not (Set_in (inv_4<Ref> r@105@01) xs5@17@01)))
    (or
      (Set_in (inv_5<Ref> r@105@01) xs6@18@01)
      (not (Set_in (inv_5<Ref> r@105@01) xs6@18@01)))
    (or
      (Set_in (inv_6<Ref> r@105@01) xs7@19@01)
      (not (Set_in (inv_6<Ref> r@105@01) xs7@19@01)))
    (or
      (Set_in (inv_7<Ref> r@105@01) xs8@20@01)
      (not (Set_in (inv_7<Ref> r@105@01) xs8@20@01)))
    (or
      (Set_in (inv_8<Ref> r@105@01) xs9@21@01)
      (not (Set_in (inv_8<Ref> r@105@01) xs9@21@01)))
    (or
      (Set_in (inv_9<Ref> r@105@01) xs10@22@01)
      (not (Set_in (inv_9<Ref> r@105@01) xs10@22@01))))))
; Joined path conditions
(assert (or
  (not (Set_in (inv_10<Ref> r@105@01) xs11@23@01))
  (Set_in (inv_10<Ref> r@105@01) xs11@23@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (= ($FVF.perm_f (as pm@106@01  $FPM) r) (ite (= r x@24@01) p@25@01 $Perm.No))
  :pattern (($FVF.perm_f (as pm@106@01  $FPM) r))
  :qid |qp.resPrmSumDef22|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f (as sm@28@01  $FVF<f>) r) r))
  :pattern (($FVF.perm_f (as pm@106@01  $FPM) r))
  :qid |qp.resTrgDef23|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@105@01 $Ref)) (!
  (and
    (=>
      (Set_in (inv_10<Ref> r@105@01) xs11@23@01)
      (and
        (Set_in (inv_10<Ref> r@105@01) xs11@23@01)
        ($FVF.loc_f ($FVF.lookup_f (as sm@29@01  $FVF<f>) r@105@01) r@105@01)
        (<= ($FVF.perm_f (as pm@106@01  $FPM) r@105@01) $Perm.Write)
        (or
          (Set_in (inv_0<Ref> r@105@01) xs1@13@01)
          (not (Set_in (inv_0<Ref> r@105@01) xs1@13@01)))
        (or
          (Set_in (inv_1<Ref> r@105@01) xs2@14@01)
          (not (Set_in (inv_1<Ref> r@105@01) xs2@14@01)))
        (or
          (Set_in (inv_2<Ref> r@105@01) xs3@15@01)
          (not (Set_in (inv_2<Ref> r@105@01) xs3@15@01)))
        (or
          (Set_in (inv_3<Ref> r@105@01) xs4@16@01)
          (not (Set_in (inv_3<Ref> r@105@01) xs4@16@01)))
        (or
          (Set_in (inv_4<Ref> r@105@01) xs5@17@01)
          (not (Set_in (inv_4<Ref> r@105@01) xs5@17@01)))
        (or
          (Set_in (inv_5<Ref> r@105@01) xs6@18@01)
          (not (Set_in (inv_5<Ref> r@105@01) xs6@18@01)))
        (or
          (Set_in (inv_6<Ref> r@105@01) xs7@19@01)
          (not (Set_in (inv_6<Ref> r@105@01) xs7@19@01)))
        (or
          (Set_in (inv_7<Ref> r@105@01) xs8@20@01)
          (not (Set_in (inv_7<Ref> r@105@01) xs8@20@01)))
        (or
          (Set_in (inv_8<Ref> r@105@01) xs9@21@01)
          (not (Set_in (inv_8<Ref> r@105@01) xs9@21@01)))
        (or
          (Set_in (inv_9<Ref> r@105@01) xs10@22@01)
          (not (Set_in (inv_9<Ref> r@105@01) xs10@22@01)))))
    (or
      (not (Set_in (inv_10<Ref> r@105@01) xs11@23@01))
      (Set_in (inv_10<Ref> r@105@01) xs11@23@01)))
  :pattern ((inv_10<Ref> r@105@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@24@11@24@67-aux|)))
(assert (forall ((r@105@01 $Ref)) (!
  (=>
    (Set_in (inv_10<Ref> r@105@01) xs11@23@01)
    (>=
      ($FVF.perm_f (as pm@106@01  $FPM) r@105@01)
      (__iar__assume_helper_10<Perm> (Set_in (inv_0<Ref> r@105@01) xs1@13@01) (Set_in (inv_1<Ref> r@105@01) xs2@14@01) (Set_in (inv_2<Ref> r@105@01) xs3@15@01) (Set_in (inv_3<Ref> r@105@01) xs4@16@01) (Set_in (inv_4<Ref> r@105@01) xs5@17@01) (Set_in (inv_5<Ref> r@105@01) xs6@18@01) (Set_in (inv_6<Ref> r@105@01) xs7@19@01) (Set_in (inv_7<Ref> r@105@01) xs8@20@01) (Set_in (inv_8<Ref> r@105@01) xs9@21@01) (Set_in (inv_9<Ref> r@105@01) xs10@22@01) p@25@01 p@25@01 p@25@01 p@25@01 p@25@01 p@25@01 p@25@01 p@25@01 p@25@01 p@25@01 p@25@01)))
  :pattern ((inv_10<Ref> r@105@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QP.vpr@24@11@24@67|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (x in xs1)
(declare-const $t@107@01 $Snap)
(assert (= $t@107@01 $Snap.unit))
; [eval] (x in xs1)
(assert (Set_in x@24@01 xs1@13@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (x in xs2)
(declare-const $t@108@01 $Snap)
(assert (= $t@108@01 $Snap.unit))
; [eval] (x in xs2)
(assert (Set_in x@24@01 xs2@14@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; assert acc(x.f, p)
; Definitional axioms for snapshot map values
; Precomputing data for removing quantified permissions
(define-fun pTaken@109@01 ((r $Ref)) $Perm
  (ite
    (= r x@24@01)
    ($Perm.min (ite (= r x@24@01) p@25@01 $Perm.No) p@25@01)
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
(assert (not (= (- p@25@01 (pTaken@109@01 x@24@01)) $Perm.No)))
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
  (=> (= r x@24@01) (= (- p@25@01 (pTaken@109@01 r)) $Perm.No))
  
  :qid |quant-u-2|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (< $Perm.No p@25@01)
  (=
    ($FVF.lookup_f (as sm@29@01  $FVF<f>) x@24@01)
    ($FVF.lookup_f (as sm@28@01  $FVF<f>) x@24@01))))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@28@01  $FVF<f>) x@24@01) x@24@01))
; [exec]
; assert p > none ==> false
; [eval] p > none ==> false
; [eval] p > none
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (> p@25@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 99 | p@25@01 > Z | dead]
; [else-branch: 99 | !(p@25@01 > Z) | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 99 | !(p@25@01 > Z)]
(assert (not (> p@25@01 $Perm.No)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (not (> p@25@01 $Perm.No)))
; [exec]
; assert |xs1| > 0 && (x in xs1) ==> p < write
; [eval] |xs1| > 0 && (x in xs1) ==> p < write
; [eval] |xs1| > 0 && (x in xs1)
; [eval] |xs1| > 0
; [eval] |xs1|
(push) ; 3
; [then-branch: 100 | !(|xs1@13@01| > 0) | live]
; [else-branch: 100 | |xs1@13@01| > 0 | live]
(push) ; 4
; [then-branch: 100 | !(|xs1@13@01| > 0)]
(assert (not (> (Set_card xs1@13@01) 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 100 | |xs1@13@01| > 0]
(assert (> (Set_card xs1@13@01) 0))
; [eval] (x in xs1)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (> (Set_card xs1@13@01) 0) (not (> (Set_card xs1@13@01) 0))))
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (and (> (Set_card xs1@13@01) 0) (Set_in x@24@01 xs1@13@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and (> (Set_card xs1@13@01) 0) (Set_in x@24@01 xs1@13@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 101 | |xs1@13@01| > 0 && x@24@01 in xs1@13@01 | live]
; [else-branch: 101 | !(|xs1@13@01| > 0 && x@24@01 in xs1@13@01) | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 101 | |xs1@13@01| > 0 && x@24@01 in xs1@13@01]
(assert (and (> (Set_card xs1@13@01) 0) (Set_in x@24@01 xs1@13@01)))
; [eval] p < write
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (and (> (Set_card xs1@13@01) 0) (Set_in x@24@01 xs1@13@01)))
(push) ; 3
(assert (not (=>
  (and (> (Set_card xs1@13@01) 0) (Set_in x@24@01 xs1@13@01))
  (< p@25@01 $Perm.Write))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (and (> (Set_card xs1@13@01) 0) (Set_in x@24@01 xs1@13@01))
  (< p@25@01 $Perm.Write)))
(pop) ; 2
(pop) ; 1
