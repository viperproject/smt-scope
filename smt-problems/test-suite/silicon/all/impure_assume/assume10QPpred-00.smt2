(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:45:02
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr
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
(declare-sort $PSF<p> 0)
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
(declare-fun $SortWrappers.$PSF<p>To$Snap ($PSF<p>) $Snap)
(declare-fun $SortWrappers.$SnapTo$PSF<p> ($Snap) $PSF<p>)
(assert (forall ((x $PSF<p>)) (!
    (= x ($SortWrappers.$SnapTo$PSF<p>($SortWrappers.$PSF<p>To$Snap x)))
    :pattern (($SortWrappers.$PSF<p>To$Snap x))
    :qid |$Snap.$SnapTo$PSF<p>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$PSF<p>To$Snap($SortWrappers.$SnapTo$PSF<p> x)))
    :pattern (($SortWrappers.$SnapTo$PSF<p> x))
    :qid |$Snap.$PSF<p>To$SnapTo$PSF<p>|
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
(declare-fun inv_2_0<Ref> ($Ref $Ref $Ref) $Ref)
(declare-fun inv_2_1<Ref> ($Ref $Ref $Ref) $Ref)
(declare-fun inv_2_2<Ref> ($Ref $Ref $Ref) $Ref)
(declare-fun inv_9_0<Ref> ($Ref $Ref $Ref) $Ref)
(declare-fun inv_9_1<Ref> ($Ref $Ref $Ref) $Ref)
(declare-fun inv_9_2<Ref> ($Ref $Ref $Ref) $Ref)
(declare-fun inv_0_0<Ref> ($Ref $Ref $Ref) $Ref)
(declare-fun inv_0_1<Ref> ($Ref $Ref $Ref) $Ref)
(declare-fun inv_0_2<Ref> ($Ref $Ref $Ref) $Ref)
(declare-fun inv_3_0<Ref> ($Ref $Ref $Ref) $Ref)
(declare-fun inv_3_1<Ref> ($Ref $Ref $Ref) $Ref)
(declare-fun inv_3_2<Ref> ($Ref $Ref $Ref) $Ref)
(declare-fun inv_7_0<Ref> ($Ref $Ref $Ref) $Ref)
(declare-fun inv_7_1<Ref> ($Ref $Ref $Ref) $Ref)
(declare-fun inv_7_2<Ref> ($Ref $Ref $Ref) $Ref)
(declare-fun inv_10_0<Ref> ($Ref $Ref $Ref) $Ref)
(declare-fun inv_10_1<Ref> ($Ref $Ref $Ref) $Ref)
(declare-fun inv_10_2<Ref> ($Ref $Ref $Ref) $Ref)
(declare-fun inv_4_0<Ref> ($Ref $Ref $Ref) $Ref)
(declare-fun inv_4_1<Ref> ($Ref $Ref $Ref) $Ref)
(declare-fun inv_4_2<Ref> ($Ref $Ref $Ref) $Ref)
(declare-fun inv_1_0<Ref> ($Ref $Ref $Ref) $Ref)
(declare-fun inv_1_1<Ref> ($Ref $Ref $Ref) $Ref)
(declare-fun inv_1_2<Ref> ($Ref $Ref $Ref) $Ref)
(declare-fun inv_8_0<Ref> ($Ref $Ref $Ref) $Ref)
(declare-fun inv_8_1<Ref> ($Ref $Ref $Ref) $Ref)
(declare-fun inv_8_2<Ref> ($Ref $Ref $Ref) $Ref)
(declare-fun inv_6_0<Ref> ($Ref $Ref $Ref) $Ref)
(declare-fun inv_6_1<Ref> ($Ref $Ref $Ref) $Ref)
(declare-fun inv_6_2<Ref> ($Ref $Ref $Ref) $Ref)
(declare-fun inv_5_0<Ref> ($Ref $Ref $Ref) $Ref)
(declare-fun inv_5_1<Ref> ($Ref $Ref $Ref) $Ref)
(declare-fun inv_5_2<Ref> ($Ref $Ref $Ref) $Ref)
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
; /predicate_snap_functions_declarations.smt2 [p: Snap]
(declare-fun $PSF.domain_p ($PSF<p>) Set<$Snap>)
(declare-fun $PSF.lookup_p ($PSF<p> $Snap) $Snap)
(declare-fun $PSF.after_p ($PSF<p> $PSF<p>) Bool)
(declare-fun $PSF.loc_p ($Snap $Snap) Bool)
(declare-fun $PSF.perm_p ($PPM $Snap) $Perm)
(declare-const $psfTOP_p $PSF<p>)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun p%trigger ($Snap $Ref $Ref $Ref) Bool)
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
; /predicate_snap_functions_axioms.smt2 [p: Snap]
(assert (forall ((vs $PSF<p>) (ws $PSF<p>)) (!
    (=>
      (and
        (Set_equal ($PSF.domain_p vs) ($PSF.domain_p ws))
        (forall ((x $Snap)) (!
          (=>
            (Set_in x ($PSF.domain_p vs))
            (= ($PSF.lookup_p vs x) ($PSF.lookup_p ws x)))
          :pattern (($PSF.lookup_p vs x) ($PSF.lookup_p ws x))
          :qid |qp.$PSF<p>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$PSF<p>To$Snap vs)
              ($SortWrappers.$PSF<p>To$Snap ws)
              )
    :qid |qp.$PSF<p>-eq-outer|
    )))
(assert (forall ((s $Snap) (pm $PPM)) (!
    ($Perm.isValidVar ($PSF.perm_p pm s))
    :pattern (($PSF.perm_p pm s)))))
(assert (forall ((s $Snap) (f $Snap)) (!
    (= ($PSF.loc_p f s) true)
    :pattern (($PSF.loc_p f s)))))
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
(declare-const ys1@11@01 Set<$Ref>)
(declare-const ys2@12@01 Set<$Ref>)
(declare-const ys3@13@01 Set<$Ref>)
(declare-const ys4@14@01 Set<$Ref>)
(declare-const ys5@15@01 Set<$Ref>)
(declare-const ys6@16@01 Set<$Ref>)
(declare-const ys7@17@01 Set<$Ref>)
(declare-const ys8@18@01 Set<$Ref>)
(declare-const ys9@19@01 Set<$Ref>)
(declare-const ys10@20@01 Set<$Ref>)
(declare-const ys11@21@01 Set<$Ref>)
(declare-const zs1@22@01 Set<$Ref>)
(declare-const zs2@23@01 Set<$Ref>)
(declare-const zs3@24@01 Set<$Ref>)
(declare-const zs4@25@01 Set<$Ref>)
(declare-const zs5@26@01 Set<$Ref>)
(declare-const zs6@27@01 Set<$Ref>)
(declare-const zs7@28@01 Set<$Ref>)
(declare-const zs8@29@01 Set<$Ref>)
(declare-const zs9@30@01 Set<$Ref>)
(declare-const zs10@31@01 Set<$Ref>)
(declare-const zs11@32@01 Set<$Ref>)
(declare-const xs@33@01 Set<$Ref>)
(declare-const ys@34@01 Set<$Ref>)
(declare-const zs@35@01 Set<$Ref>)
(declare-const q@36@01 $Perm)
(declare-const xs1@37@01 Set<$Ref>)
(declare-const xs2@38@01 Set<$Ref>)
(declare-const xs3@39@01 Set<$Ref>)
(declare-const xs4@40@01 Set<$Ref>)
(declare-const xs5@41@01 Set<$Ref>)
(declare-const xs6@42@01 Set<$Ref>)
(declare-const xs7@43@01 Set<$Ref>)
(declare-const xs8@44@01 Set<$Ref>)
(declare-const xs9@45@01 Set<$Ref>)
(declare-const xs10@46@01 Set<$Ref>)
(declare-const xs11@47@01 Set<$Ref>)
(declare-const ys1@48@01 Set<$Ref>)
(declare-const ys2@49@01 Set<$Ref>)
(declare-const ys3@50@01 Set<$Ref>)
(declare-const ys4@51@01 Set<$Ref>)
(declare-const ys5@52@01 Set<$Ref>)
(declare-const ys6@53@01 Set<$Ref>)
(declare-const ys7@54@01 Set<$Ref>)
(declare-const ys8@55@01 Set<$Ref>)
(declare-const ys9@56@01 Set<$Ref>)
(declare-const ys10@57@01 Set<$Ref>)
(declare-const ys11@58@01 Set<$Ref>)
(declare-const zs1@59@01 Set<$Ref>)
(declare-const zs2@60@01 Set<$Ref>)
(declare-const zs3@61@01 Set<$Ref>)
(declare-const zs4@62@01 Set<$Ref>)
(declare-const zs5@63@01 Set<$Ref>)
(declare-const zs6@64@01 Set<$Ref>)
(declare-const zs7@65@01 Set<$Ref>)
(declare-const zs8@66@01 Set<$Ref>)
(declare-const zs9@67@01 Set<$Ref>)
(declare-const zs10@68@01 Set<$Ref>)
(declare-const zs11@69@01 Set<$Ref>)
(declare-const xs@70@01 Set<$Ref>)
(declare-const ys@71@01 Set<$Ref>)
(declare-const zs@72@01 Set<$Ref>)
(declare-const q@73@01 $Perm)
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
; var a: Ref
(declare-const a@74@01 $Ref)
; [exec]
; var b: Ref
(declare-const b@75@01 $Ref)
; [exec]
; var c: Ref
(declare-const c@76@01 $Ref)
; [exec]
; inhale none <= q
(declare-const $t@77@01 $Snap)
(assert (= $t@77@01 $Snap.unit))
; [eval] none <= q
(assert (<= $Perm.No q@73@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x: Ref, y: Ref, z: Ref ::
;     { (x in xs), (y in ys), (z in zs) }
;     (x in xs) && ((y in ys) && (z in zs)) ==> acc(p(x, y, z), q))
(declare-const x@78@01 $Ref)
(declare-const y@79@01 $Ref)
(declare-const z@80@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs) && ((y in ys) && (z in zs))
; [eval] (x in xs)
(push) ; 4
; [then-branch: 0 | !(x@78@01 in xs@70@01) | live]
; [else-branch: 0 | x@78@01 in xs@70@01 | live]
(push) ; 5
; [then-branch: 0 | !(x@78@01 in xs@70@01)]
(assert (not (Set_in x@78@01 xs@70@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | x@78@01 in xs@70@01]
(assert (Set_in x@78@01 xs@70@01))
; [eval] (y in ys)
(push) ; 6
; [then-branch: 1 | !(y@79@01 in ys@71@01) | live]
; [else-branch: 1 | y@79@01 in ys@71@01 | live]
(push) ; 7
; [then-branch: 1 | !(y@79@01 in ys@71@01)]
(assert (not (Set_in y@79@01 ys@71@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 1 | y@79@01 in ys@71@01]
(assert (Set_in y@79@01 ys@71@01))
; [eval] (z in zs)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (Set_in y@79@01 ys@71@01) (not (Set_in y@79@01 ys@71@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in x@78@01 xs@70@01)
  (and
    (Set_in x@78@01 xs@70@01)
    (or (Set_in y@79@01 ys@71@01) (not (Set_in y@79@01 ys@71@01))))))
(assert (or (Set_in x@78@01 xs@70@01) (not (Set_in x@78@01 xs@70@01))))
(assert (and
  (Set_in x@78@01 xs@70@01)
  (and (Set_in y@79@01 ys@71@01) (Set_in z@80@01 zs@72@01))))
(pop) ; 3
(declare-const $t@81@01 $PSF<p>)
(declare-fun inv@82@01 ($Ref $Ref $Ref) $Ref)
(declare-fun img@83@01 ($Ref $Ref $Ref) Bool)
(declare-fun inv@84@01 ($Ref $Ref $Ref) $Ref)
(declare-fun img@85@01 ($Ref $Ref $Ref) Bool)
(declare-fun inv@86@01 ($Ref $Ref $Ref) $Ref)
(declare-fun img@87@01 ($Ref $Ref $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@78@01 $Ref) (y@79@01 $Ref) (z@80@01 $Ref)) (!
  (=>
    (and
      (Set_in x@78@01 xs@70@01)
      (and (Set_in y@79@01 ys@71@01) (Set_in z@80@01 zs@72@01)))
    (and
      (=>
        (Set_in x@78@01 xs@70@01)
        (and
          (Set_in x@78@01 xs@70@01)
          (or (Set_in y@79@01 ys@71@01) (not (Set_in y@79@01 ys@71@01)))))
      (or (Set_in x@78@01 xs@70@01) (not (Set_in x@78@01 xs@70@01)))))
  :pattern ((Set_in x@78@01 xs@70@01) (Set_in y@79@01 ys@71@01) (Set_in z@80@01 zs@72@01))
  :qid |p-aux|)))
(push) ; 3
(assert (not (forall ((x@78@01 $Ref) (y@79@01 $Ref) (z@80@01 $Ref)) (!
  (=>
    (and
      (Set_in x@78@01 xs@70@01)
      (and (Set_in y@79@01 ys@71@01) (Set_in z@80@01 zs@72@01)))
    (or (= q@73@01 $Perm.No) (< $Perm.No q@73@01)))
  
  :qid |quant-u-0|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@78@01 $Ref) (y1@79@01 $Ref) (z1@80@01 $Ref) (x2@78@01 $Ref) (y2@79@01 $Ref) (z2@80@01 $Ref)) (!
  (=>
    (and
      (and
        (and
          (Set_in x1@78@01 xs@70@01)
          (and (Set_in y1@79@01 ys@71@01) (Set_in z1@80@01 zs@72@01)))
        (< $Perm.No q@73@01))
      (and
        (and
          (Set_in x2@78@01 xs@70@01)
          (and (Set_in y2@79@01 ys@71@01) (Set_in z2@80@01 zs@72@01)))
        (< $Perm.No q@73@01))
      (and
        (and (= x1@78@01 x2@78@01) (= y1@79@01 y2@79@01))
        (= z1@80@01 z2@80@01)))
    (and (and (= x1@78@01 x2@78@01) (= y1@79@01 y2@79@01)) (= z1@80@01 z2@80@01)))
  
  :qid |p-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@78@01 $Ref) (y@79@01 $Ref) (z@80@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in x@78@01 xs@70@01)
        (and (Set_in y@79@01 ys@71@01) (Set_in z@80@01 zs@72@01)))
      (< $Perm.No q@73@01))
    (and
      (and
        (= (inv@82@01 x@78@01 y@79@01 z@80@01) x@78@01)
        (= (inv@84@01 x@78@01 y@79@01 z@80@01) y@79@01)
        (= (inv@86@01 x@78@01 y@79@01 z@80@01) z@80@01))
      (and
        (img@83@01 x@78@01 y@79@01 z@80@01)
        (img@85@01 x@78@01 y@79@01 z@80@01)
        (img@87@01 x@78@01 y@79@01 z@80@01))))
  :pattern ((Set_in x@78@01 xs@70@01) (Set_in y@79@01 ys@71@01) (Set_in z@80@01 zs@72@01))
  :qid |quant-u-1|)))
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (=>
    (and
      (and (img@83@01 x y z) (img@85@01 x y z) (img@87@01 x y z))
      (and
        (and
          (Set_in (inv@82@01 x y z) xs@70@01)
          (and
            (Set_in (inv@84@01 x y z) ys@71@01)
            (Set_in (inv@86@01 x y z) zs@72@01)))
        (< $Perm.No q@73@01)))
    (and (= (inv@82@01 x y z) x) (= (inv@84@01 x y z) y) (= (inv@86@01 x y z) z)))
  :pattern ((inv@82@01 x y z))
  :pattern ((inv@84@01 x y z))
  :pattern ((inv@86@01 x y z))
  :qid |p-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((x@78@01 $Ref) (y@79@01 $Ref) (z@80@01 $Ref)) (!
  (<= $Perm.No q@73@01)
  :pattern ((Set_in x@78@01 xs@70@01) (Set_in y@79@01 ys@71@01) (Set_in z@80@01 zs@72@01))
  :qid |p-permAtLeastZero|)))
(declare-const sm@88@01 $PSF<p>)
(declare-const s@89@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@89@01 $Snap)) (!
  (=>
    (ite
      (and
        (and
          (img@83@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@89@01))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first s@89@01))) ($SortWrappers.$SnapTo$Ref ($Snap.second s@89@01)))
          (img@85@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@89@01))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first s@89@01))) ($SortWrappers.$SnapTo$Ref ($Snap.second s@89@01)))
          (img@87@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@89@01))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first s@89@01))) ($SortWrappers.$SnapTo$Ref ($Snap.second s@89@01))))
        (and
          (Set_in (inv@82@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@89@01))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first s@89@01))) ($SortWrappers.$SnapTo$Ref ($Snap.second s@89@01))) xs@70@01)
          (and
            (Set_in (inv@84@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@89@01))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first s@89@01))) ($SortWrappers.$SnapTo$Ref ($Snap.second s@89@01))) ys@71@01)
            (Set_in (inv@86@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@89@01))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first s@89@01))) ($SortWrappers.$SnapTo$Ref ($Snap.second s@89@01))) zs@72@01))))
      (< $Perm.No q@73@01)
      false)
    (and
      (not (= s@89@01 $Snap.unit))
      (=
        ($PSF.lookup_p (as sm@88@01  $PSF<p>) s@89@01)
        ($PSF.lookup_p $t@81@01 s@89@01))))
  :pattern (($PSF.lookup_p (as sm@88@01  $PSF<p>) s@89@01))
  :pattern (($PSF.lookup_p $t@81@01 s@89@01))
  :qid |qp.psmValDef0|)))
(assert (forall ((s@89@01 $Snap)) (!
  ($PSF.loc_p ($PSF.lookup_p $t@81@01 s@89@01) s@89@01)
  :pattern (($PSF.lookup_p (as sm@88@01  $PSF<p>) s@89@01))
  :qid |qp.psmResTrgDef1|)))
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (=>
    (and
      (Set_in (inv@82@01 x y z) xs@70@01)
      (and
        (Set_in (inv@84@01 x y z) ys@71@01)
        (Set_in (inv@86@01 x y z) zs@72@01)))
    ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))))
  :pattern ((inv@82@01 x y z) (inv@84@01 x y z) (inv@86@01 x y z))
  :qid |quant-u-2|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x1: Ref, y1: Ref, z1: Ref ::
;     { p(x1, y1, z1) }
;     (x1 in xs1) && ((y1 in ys1) && (z1 in zs1)) ==>
;     inv_0_0(x1, y1, z1) == x1 && inv_0_1(x1, y1, z1) == y1 &&
;     inv_0_2(x1, y1, z1) == z1)
(declare-const $t@90@01 $Snap)
(assert (= $t@90@01 $Snap.unit))
; [eval] (forall x1: Ref, y1: Ref, z1: Ref :: { p(x1, y1, z1) } (x1 in xs1) && ((y1 in ys1) && (z1 in zs1)) ==> inv_0_0(x1, y1, z1) == x1 && inv_0_1(x1, y1, z1) == y1 && inv_0_2(x1, y1, z1) == z1)
(declare-const x1@91@01 $Ref)
(declare-const y1@92@01 $Ref)
(declare-const z1@93@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x1 in xs1) && ((y1 in ys1) && (z1 in zs1)) ==> inv_0_0(x1, y1, z1) == x1 && inv_0_1(x1, y1, z1) == y1 && inv_0_2(x1, y1, z1) == z1
; [eval] (x1 in xs1) && ((y1 in ys1) && (z1 in zs1))
; [eval] (x1 in xs1)
(push) ; 4
; [then-branch: 2 | !(x1@91@01 in xs1@37@01) | live]
; [else-branch: 2 | x1@91@01 in xs1@37@01 | live]
(push) ; 5
; [then-branch: 2 | !(x1@91@01 in xs1@37@01)]
(assert (not (Set_in x1@91@01 xs1@37@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 2 | x1@91@01 in xs1@37@01]
(assert (Set_in x1@91@01 xs1@37@01))
; [eval] (y1 in ys1)
(push) ; 6
; [then-branch: 3 | !(y1@92@01 in ys1@48@01) | live]
; [else-branch: 3 | y1@92@01 in ys1@48@01 | live]
(push) ; 7
; [then-branch: 3 | !(y1@92@01 in ys1@48@01)]
(assert (not (Set_in y1@92@01 ys1@48@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 3 | y1@92@01 in ys1@48@01]
(assert (Set_in y1@92@01 ys1@48@01))
; [eval] (z1 in zs1)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (Set_in y1@92@01 ys1@48@01) (not (Set_in y1@92@01 ys1@48@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in x1@91@01 xs1@37@01)
  (and
    (Set_in x1@91@01 xs1@37@01)
    (or (Set_in y1@92@01 ys1@48@01) (not (Set_in y1@92@01 ys1@48@01))))))
(assert (or (Set_in x1@91@01 xs1@37@01) (not (Set_in x1@91@01 xs1@37@01))))
(push) ; 4
; [then-branch: 4 | x1@91@01 in xs1@37@01 && y1@92@01 in ys1@48@01 && z1@93@01 in zs1@59@01 | live]
; [else-branch: 4 | !(x1@91@01 in xs1@37@01 && y1@92@01 in ys1@48@01 && z1@93@01 in zs1@59@01) | live]
(push) ; 5
; [then-branch: 4 | x1@91@01 in xs1@37@01 && y1@92@01 in ys1@48@01 && z1@93@01 in zs1@59@01]
(assert (and
  (Set_in x1@91@01 xs1@37@01)
  (and (Set_in y1@92@01 ys1@48@01) (Set_in z1@93@01 zs1@59@01))))
; [eval] inv_0_0(x1, y1, z1) == x1 && inv_0_1(x1, y1, z1) == y1 && inv_0_2(x1, y1, z1) == z1
; [eval] inv_0_0(x1, y1, z1) == x1
; [eval] inv_0_0(x1, y1, z1)
(push) ; 6
; [then-branch: 5 | inv_0_0[Ref](x1@91@01, y1@92@01, z1@93@01) != x1@91@01 | live]
; [else-branch: 5 | inv_0_0[Ref](x1@91@01, y1@92@01, z1@93@01) == x1@91@01 | live]
(push) ; 7
; [then-branch: 5 | inv_0_0[Ref](x1@91@01, y1@92@01, z1@93@01) != x1@91@01]
(assert (not (= (inv_0_0<Ref> x1@91@01 y1@92@01 z1@93@01) x1@91@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 5 | inv_0_0[Ref](x1@91@01, y1@92@01, z1@93@01) == x1@91@01]
(assert (= (inv_0_0<Ref> x1@91@01 y1@92@01 z1@93@01) x1@91@01))
; [eval] inv_0_1(x1, y1, z1) == y1
; [eval] inv_0_1(x1, y1, z1)
(push) ; 8
; [then-branch: 6 | inv_0_1[Ref](x1@91@01, y1@92@01, z1@93@01) != y1@92@01 | live]
; [else-branch: 6 | inv_0_1[Ref](x1@91@01, y1@92@01, z1@93@01) == y1@92@01 | live]
(push) ; 9
; [then-branch: 6 | inv_0_1[Ref](x1@91@01, y1@92@01, z1@93@01) != y1@92@01]
(assert (not (= (inv_0_1<Ref> x1@91@01 y1@92@01 z1@93@01) y1@92@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 6 | inv_0_1[Ref](x1@91@01, y1@92@01, z1@93@01) == y1@92@01]
(assert (= (inv_0_1<Ref> x1@91@01 y1@92@01 z1@93@01) y1@92@01))
; [eval] inv_0_2(x1, y1, z1) == z1
; [eval] inv_0_2(x1, y1, z1)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or
  (= (inv_0_1<Ref> x1@91@01 y1@92@01 z1@93@01) y1@92@01)
  (not (= (inv_0_1<Ref> x1@91@01 y1@92@01 z1@93@01) y1@92@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (= (inv_0_0<Ref> x1@91@01 y1@92@01 z1@93@01) x1@91@01)
  (and
    (= (inv_0_0<Ref> x1@91@01 y1@92@01 z1@93@01) x1@91@01)
    (or
      (= (inv_0_1<Ref> x1@91@01 y1@92@01 z1@93@01) y1@92@01)
      (not (= (inv_0_1<Ref> x1@91@01 y1@92@01 z1@93@01) y1@92@01))))))
(assert (or
  (= (inv_0_0<Ref> x1@91@01 y1@92@01 z1@93@01) x1@91@01)
  (not (= (inv_0_0<Ref> x1@91@01 y1@92@01 z1@93@01) x1@91@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 4 | !(x1@91@01 in xs1@37@01 && y1@92@01 in ys1@48@01 && z1@93@01 in zs1@59@01)]
(assert (not
  (and
    (Set_in x1@91@01 xs1@37@01)
    (and (Set_in y1@92@01 ys1@48@01) (Set_in z1@93@01 zs1@59@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Set_in x1@91@01 xs1@37@01)
    (and (Set_in y1@92@01 ys1@48@01) (Set_in z1@93@01 zs1@59@01)))
  (and
    (Set_in x1@91@01 xs1@37@01)
    (Set_in y1@92@01 ys1@48@01)
    (Set_in z1@93@01 zs1@59@01)
    (=>
      (= (inv_0_0<Ref> x1@91@01 y1@92@01 z1@93@01) x1@91@01)
      (and
        (= (inv_0_0<Ref> x1@91@01 y1@92@01 z1@93@01) x1@91@01)
        (or
          (= (inv_0_1<Ref> x1@91@01 y1@92@01 z1@93@01) y1@92@01)
          (not (= (inv_0_1<Ref> x1@91@01 y1@92@01 z1@93@01) y1@92@01)))))
    (or
      (= (inv_0_0<Ref> x1@91@01 y1@92@01 z1@93@01) x1@91@01)
      (not (= (inv_0_0<Ref> x1@91@01 y1@92@01 z1@93@01) x1@91@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in x1@91@01 xs1@37@01)
      (and (Set_in y1@92@01 ys1@48@01) (Set_in z1@93@01 zs1@59@01))))
  (and
    (Set_in x1@91@01 xs1@37@01)
    (and (Set_in y1@92@01 ys1@48@01) (Set_in z1@93@01 zs1@59@01)))))
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x1@91@01 $Ref) (y1@92@01 $Ref) (z1@93@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@91@01 xs1@37@01)
      (and
        (Set_in x1@91@01 xs1@37@01)
        (or (Set_in y1@92@01 ys1@48@01) (not (Set_in y1@92@01 ys1@48@01)))))
    (or (Set_in x1@91@01 xs1@37@01) (not (Set_in x1@91@01 xs1@37@01)))
    (=>
      (and
        (Set_in x1@91@01 xs1@37@01)
        (and (Set_in y1@92@01 ys1@48@01) (Set_in z1@93@01 zs1@59@01)))
      (and
        (Set_in x1@91@01 xs1@37@01)
        (Set_in y1@92@01 ys1@48@01)
        (Set_in z1@93@01 zs1@59@01)
        (=>
          (= (inv_0_0<Ref> x1@91@01 y1@92@01 z1@93@01) x1@91@01)
          (and
            (= (inv_0_0<Ref> x1@91@01 y1@92@01 z1@93@01) x1@91@01)
            (or
              (= (inv_0_1<Ref> x1@91@01 y1@92@01 z1@93@01) y1@92@01)
              (not (= (inv_0_1<Ref> x1@91@01 y1@92@01 z1@93@01) y1@92@01)))))
        (or
          (= (inv_0_0<Ref> x1@91@01 y1@92@01 z1@93@01) x1@91@01)
          (not (= (inv_0_0<Ref> x1@91@01 y1@92@01 z1@93@01) x1@91@01)))))
    (or
      (not
        (and
          (Set_in x1@91@01 xs1@37@01)
          (and (Set_in y1@92@01 ys1@48@01) (Set_in z1@93@01 zs1@59@01))))
      (and
        (Set_in x1@91@01 xs1@37@01)
        (and (Set_in y1@92@01 ys1@48@01) (Set_in z1@93@01 zs1@59@01)))))
  :pattern (($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap x1@91@01)
      ($SortWrappers.$RefTo$Snap y1@92@01))
    ($SortWrappers.$RefTo$Snap z1@93@01))) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap x1@91@01)
      ($SortWrappers.$RefTo$Snap y1@92@01))
    ($SortWrappers.$RefTo$Snap z1@93@01))))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@20@9@20@122-aux|)))
(assert (forall ((x1@91@01 $Ref) (y1@92@01 $Ref) (z1@93@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@91@01 xs1@37@01)
      (and (Set_in y1@92@01 ys1@48@01) (Set_in z1@93@01 zs1@59@01)))
    (and
      (= (inv_0_0<Ref> x1@91@01 y1@92@01 z1@93@01) x1@91@01)
      (and
        (= (inv_0_1<Ref> x1@91@01 y1@92@01 z1@93@01) y1@92@01)
        (= (inv_0_2<Ref> x1@91@01 y1@92@01 z1@93@01) z1@93@01))))
  :pattern (($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap x1@91@01)
      ($SortWrappers.$RefTo$Snap y1@92@01))
    ($SortWrappers.$RefTo$Snap z1@93@01))) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap x1@91@01)
      ($SortWrappers.$RefTo$Snap y1@92@01))
    ($SortWrappers.$RefTo$Snap z1@93@01))))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@20@9@20@122|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x: Ref, y: Ref, z: Ref ::
;     { inv_0_0(x, y, z), inv_0_1(x, y, z), inv_0_2(x, y, z) }
;     (inv_0_0(x, y, z) in xs1) &&
;     ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) ==>
;     inv_0_0(x, y, z) == x && inv_0_1(x, y, z) == y && inv_0_2(x, y, z) == z)
(declare-const $t@94@01 $Snap)
(assert (= $t@94@01 $Snap.unit))
; [eval] (forall x: Ref, y: Ref, z: Ref :: { inv_0_0(x, y, z), inv_0_1(x, y, z), inv_0_2(x, y, z) } (inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) ==> inv_0_0(x, y, z) == x && inv_0_1(x, y, z) == y && inv_0_2(x, y, z) == z)
(declare-const x@95@01 $Ref)
(declare-const y@96@01 $Ref)
(declare-const z@97@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) ==> inv_0_0(x, y, z) == x && inv_0_1(x, y, z) == y && inv_0_2(x, y, z) == z
; [eval] (inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1))
; [eval] (inv_0_0(x, y, z) in xs1)
; [eval] inv_0_0(x, y, z)
(push) ; 4
; [then-branch: 7 | !(inv_0_0[Ref](x@95@01, y@96@01, z@97@01) in xs1@37@01) | live]
; [else-branch: 7 | inv_0_0[Ref](x@95@01, y@96@01, z@97@01) in xs1@37@01 | live]
(push) ; 5
; [then-branch: 7 | !(inv_0_0[Ref](x@95@01, y@96@01, z@97@01) in xs1@37@01)]
(assert (not (Set_in (inv_0_0<Ref> x@95@01 y@96@01 z@97@01) xs1@37@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 7 | inv_0_0[Ref](x@95@01, y@96@01, z@97@01) in xs1@37@01]
(assert (Set_in (inv_0_0<Ref> x@95@01 y@96@01 z@97@01) xs1@37@01))
; [eval] (inv_0_1(x, y, z) in ys1)
; [eval] inv_0_1(x, y, z)
(push) ; 6
; [then-branch: 8 | !(inv_0_1[Ref](x@95@01, y@96@01, z@97@01) in ys1@48@01) | live]
; [else-branch: 8 | inv_0_1[Ref](x@95@01, y@96@01, z@97@01) in ys1@48@01 | live]
(push) ; 7
; [then-branch: 8 | !(inv_0_1[Ref](x@95@01, y@96@01, z@97@01) in ys1@48@01)]
(assert (not (Set_in (inv_0_1<Ref> x@95@01 y@96@01 z@97@01) ys1@48@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 8 | inv_0_1[Ref](x@95@01, y@96@01, z@97@01) in ys1@48@01]
(assert (Set_in (inv_0_1<Ref> x@95@01 y@96@01 z@97@01) ys1@48@01))
; [eval] (inv_0_2(x, y, z) in zs1)
; [eval] inv_0_2(x, y, z)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_0_1<Ref> x@95@01 y@96@01 z@97@01) ys1@48@01)
  (not (Set_in (inv_0_1<Ref> x@95@01 y@96@01 z@97@01) ys1@48@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_0_0<Ref> x@95@01 y@96@01 z@97@01) xs1@37@01)
  (and
    (Set_in (inv_0_0<Ref> x@95@01 y@96@01 z@97@01) xs1@37@01)
    (or
      (Set_in (inv_0_1<Ref> x@95@01 y@96@01 z@97@01) ys1@48@01)
      (not (Set_in (inv_0_1<Ref> x@95@01 y@96@01 z@97@01) ys1@48@01))))))
(assert (or
  (Set_in (inv_0_0<Ref> x@95@01 y@96@01 z@97@01) xs1@37@01)
  (not (Set_in (inv_0_0<Ref> x@95@01 y@96@01 z@97@01) xs1@37@01))))
(push) ; 4
; [then-branch: 9 | inv_0_0[Ref](x@95@01, y@96@01, z@97@01) in xs1@37@01 && inv_0_1[Ref](x@95@01, y@96@01, z@97@01) in ys1@48@01 && inv_0_2[Ref](x@95@01, y@96@01, z@97@01) in zs1@59@01 | live]
; [else-branch: 9 | !(inv_0_0[Ref](x@95@01, y@96@01, z@97@01) in xs1@37@01 && inv_0_1[Ref](x@95@01, y@96@01, z@97@01) in ys1@48@01 && inv_0_2[Ref](x@95@01, y@96@01, z@97@01) in zs1@59@01) | live]
(push) ; 5
; [then-branch: 9 | inv_0_0[Ref](x@95@01, y@96@01, z@97@01) in xs1@37@01 && inv_0_1[Ref](x@95@01, y@96@01, z@97@01) in ys1@48@01 && inv_0_2[Ref](x@95@01, y@96@01, z@97@01) in zs1@59@01]
(assert (and
  (Set_in (inv_0_0<Ref> x@95@01 y@96@01 z@97@01) xs1@37@01)
  (and
    (Set_in (inv_0_1<Ref> x@95@01 y@96@01 z@97@01) ys1@48@01)
    (Set_in (inv_0_2<Ref> x@95@01 y@96@01 z@97@01) zs1@59@01))))
; [eval] inv_0_0(x, y, z) == x && inv_0_1(x, y, z) == y && inv_0_2(x, y, z) == z
; [eval] inv_0_0(x, y, z) == x
; [eval] inv_0_0(x, y, z)
(push) ; 6
; [then-branch: 10 | inv_0_0[Ref](x@95@01, y@96@01, z@97@01) != x@95@01 | live]
; [else-branch: 10 | inv_0_0[Ref](x@95@01, y@96@01, z@97@01) == x@95@01 | live]
(push) ; 7
; [then-branch: 10 | inv_0_0[Ref](x@95@01, y@96@01, z@97@01) != x@95@01]
(assert (not (= (inv_0_0<Ref> x@95@01 y@96@01 z@97@01) x@95@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 10 | inv_0_0[Ref](x@95@01, y@96@01, z@97@01) == x@95@01]
(assert (= (inv_0_0<Ref> x@95@01 y@96@01 z@97@01) x@95@01))
; [eval] inv_0_1(x, y, z) == y
; [eval] inv_0_1(x, y, z)
(push) ; 8
; [then-branch: 11 | inv_0_1[Ref](x@95@01, y@96@01, z@97@01) != y@96@01 | live]
; [else-branch: 11 | inv_0_1[Ref](x@95@01, y@96@01, z@97@01) == y@96@01 | live]
(push) ; 9
; [then-branch: 11 | inv_0_1[Ref](x@95@01, y@96@01, z@97@01) != y@96@01]
(assert (not (= (inv_0_1<Ref> x@95@01 y@96@01 z@97@01) y@96@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 11 | inv_0_1[Ref](x@95@01, y@96@01, z@97@01) == y@96@01]
(assert (= (inv_0_1<Ref> x@95@01 y@96@01 z@97@01) y@96@01))
; [eval] inv_0_2(x, y, z) == z
; [eval] inv_0_2(x, y, z)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or
  (= (inv_0_1<Ref> x@95@01 y@96@01 z@97@01) y@96@01)
  (not (= (inv_0_1<Ref> x@95@01 y@96@01 z@97@01) y@96@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (= (inv_0_0<Ref> x@95@01 y@96@01 z@97@01) x@95@01)
  (and
    (= (inv_0_0<Ref> x@95@01 y@96@01 z@97@01) x@95@01)
    (or
      (= (inv_0_1<Ref> x@95@01 y@96@01 z@97@01) y@96@01)
      (not (= (inv_0_1<Ref> x@95@01 y@96@01 z@97@01) y@96@01))))))
(assert (or
  (= (inv_0_0<Ref> x@95@01 y@96@01 z@97@01) x@95@01)
  (not (= (inv_0_0<Ref> x@95@01 y@96@01 z@97@01) x@95@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 9 | !(inv_0_0[Ref](x@95@01, y@96@01, z@97@01) in xs1@37@01 && inv_0_1[Ref](x@95@01, y@96@01, z@97@01) in ys1@48@01 && inv_0_2[Ref](x@95@01, y@96@01, z@97@01) in zs1@59@01)]
(assert (not
  (and
    (Set_in (inv_0_0<Ref> x@95@01 y@96@01 z@97@01) xs1@37@01)
    (and
      (Set_in (inv_0_1<Ref> x@95@01 y@96@01 z@97@01) ys1@48@01)
      (Set_in (inv_0_2<Ref> x@95@01 y@96@01 z@97@01) zs1@59@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Set_in (inv_0_0<Ref> x@95@01 y@96@01 z@97@01) xs1@37@01)
    (and
      (Set_in (inv_0_1<Ref> x@95@01 y@96@01 z@97@01) ys1@48@01)
      (Set_in (inv_0_2<Ref> x@95@01 y@96@01 z@97@01) zs1@59@01)))
  (and
    (Set_in (inv_0_0<Ref> x@95@01 y@96@01 z@97@01) xs1@37@01)
    (Set_in (inv_0_1<Ref> x@95@01 y@96@01 z@97@01) ys1@48@01)
    (Set_in (inv_0_2<Ref> x@95@01 y@96@01 z@97@01) zs1@59@01)
    (=>
      (= (inv_0_0<Ref> x@95@01 y@96@01 z@97@01) x@95@01)
      (and
        (= (inv_0_0<Ref> x@95@01 y@96@01 z@97@01) x@95@01)
        (or
          (= (inv_0_1<Ref> x@95@01 y@96@01 z@97@01) y@96@01)
          (not (= (inv_0_1<Ref> x@95@01 y@96@01 z@97@01) y@96@01)))))
    (or
      (= (inv_0_0<Ref> x@95@01 y@96@01 z@97@01) x@95@01)
      (not (= (inv_0_0<Ref> x@95@01 y@96@01 z@97@01) x@95@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in (inv_0_0<Ref> x@95@01 y@96@01 z@97@01) xs1@37@01)
      (and
        (Set_in (inv_0_1<Ref> x@95@01 y@96@01 z@97@01) ys1@48@01)
        (Set_in (inv_0_2<Ref> x@95@01 y@96@01 z@97@01) zs1@59@01))))
  (and
    (Set_in (inv_0_0<Ref> x@95@01 y@96@01 z@97@01) xs1@37@01)
    (and
      (Set_in (inv_0_1<Ref> x@95@01 y@96@01 z@97@01) ys1@48@01)
      (Set_in (inv_0_2<Ref> x@95@01 y@96@01 z@97@01) zs1@59@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@95@01 $Ref) (y@96@01 $Ref) (z@97@01 $Ref)) (!
  (and
    (=>
      (Set_in (inv_0_0<Ref> x@95@01 y@96@01 z@97@01) xs1@37@01)
      (and
        (Set_in (inv_0_0<Ref> x@95@01 y@96@01 z@97@01) xs1@37@01)
        (or
          (Set_in (inv_0_1<Ref> x@95@01 y@96@01 z@97@01) ys1@48@01)
          (not (Set_in (inv_0_1<Ref> x@95@01 y@96@01 z@97@01) ys1@48@01)))))
    (or
      (Set_in (inv_0_0<Ref> x@95@01 y@96@01 z@97@01) xs1@37@01)
      (not (Set_in (inv_0_0<Ref> x@95@01 y@96@01 z@97@01) xs1@37@01)))
    (=>
      (and
        (Set_in (inv_0_0<Ref> x@95@01 y@96@01 z@97@01) xs1@37@01)
        (and
          (Set_in (inv_0_1<Ref> x@95@01 y@96@01 z@97@01) ys1@48@01)
          (Set_in (inv_0_2<Ref> x@95@01 y@96@01 z@97@01) zs1@59@01)))
      (and
        (Set_in (inv_0_0<Ref> x@95@01 y@96@01 z@97@01) xs1@37@01)
        (Set_in (inv_0_1<Ref> x@95@01 y@96@01 z@97@01) ys1@48@01)
        (Set_in (inv_0_2<Ref> x@95@01 y@96@01 z@97@01) zs1@59@01)
        (=>
          (= (inv_0_0<Ref> x@95@01 y@96@01 z@97@01) x@95@01)
          (and
            (= (inv_0_0<Ref> x@95@01 y@96@01 z@97@01) x@95@01)
            (or
              (= (inv_0_1<Ref> x@95@01 y@96@01 z@97@01) y@96@01)
              (not (= (inv_0_1<Ref> x@95@01 y@96@01 z@97@01) y@96@01)))))
        (or
          (= (inv_0_0<Ref> x@95@01 y@96@01 z@97@01) x@95@01)
          (not (= (inv_0_0<Ref> x@95@01 y@96@01 z@97@01) x@95@01)))))
    (or
      (not
        (and
          (Set_in (inv_0_0<Ref> x@95@01 y@96@01 z@97@01) xs1@37@01)
          (and
            (Set_in (inv_0_1<Ref> x@95@01 y@96@01 z@97@01) ys1@48@01)
            (Set_in (inv_0_2<Ref> x@95@01 y@96@01 z@97@01) zs1@59@01))))
      (and
        (Set_in (inv_0_0<Ref> x@95@01 y@96@01 z@97@01) xs1@37@01)
        (and
          (Set_in (inv_0_1<Ref> x@95@01 y@96@01 z@97@01) ys1@48@01)
          (Set_in (inv_0_2<Ref> x@95@01 y@96@01 z@97@01) zs1@59@01)))))
  :pattern ((inv_0_0<Ref> x@95@01 y@96@01 z@97@01) (inv_0_1<Ref> x@95@01 y@96@01 z@97@01) (inv_0_2<Ref> x@95@01 y@96@01 z@97@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@20@9@20@122-aux|)))
(assert (forall ((x@95@01 $Ref) (y@96@01 $Ref) (z@97@01 $Ref)) (!
  (=>
    (and
      (Set_in (inv_0_0<Ref> x@95@01 y@96@01 z@97@01) xs1@37@01)
      (and
        (Set_in (inv_0_1<Ref> x@95@01 y@96@01 z@97@01) ys1@48@01)
        (Set_in (inv_0_2<Ref> x@95@01 y@96@01 z@97@01) zs1@59@01)))
    (and
      (= (inv_0_0<Ref> x@95@01 y@96@01 z@97@01) x@95@01)
      (and
        (= (inv_0_1<Ref> x@95@01 y@96@01 z@97@01) y@96@01)
        (= (inv_0_2<Ref> x@95@01 y@96@01 z@97@01) z@97@01))))
  :pattern ((inv_0_0<Ref> x@95@01 y@96@01 z@97@01) (inv_0_1<Ref> x@95@01 y@96@01 z@97@01) (inv_0_2<Ref> x@95@01 y@96@01 z@97@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@20@9@20@122|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x: Ref, y: Ref, z: Ref ::
;     { inv_0_0(x, y, z), inv_0_1(x, y, z), inv_0_2(x, y, z) }
;     (inv_0_0(x, y, z) in xs1) &&
;     ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) ==>
;     perm(p(x, y, z)) >= q)
(declare-const $t@98@01 $Snap)
(assert (= $t@98@01 $Snap.unit))
; [eval] (forall x: Ref, y: Ref, z: Ref :: { inv_0_0(x, y, z), inv_0_1(x, y, z), inv_0_2(x, y, z) } (inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) ==> perm(p(x, y, z)) >= q)
(declare-const x@99@01 $Ref)
(declare-const y@100@01 $Ref)
(declare-const z@101@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) ==> perm(p(x, y, z)) >= q
; [eval] (inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1))
; [eval] (inv_0_0(x, y, z) in xs1)
; [eval] inv_0_0(x, y, z)
(push) ; 4
; [then-branch: 12 | !(inv_0_0[Ref](x@99@01, y@100@01, z@101@01) in xs1@37@01) | live]
; [else-branch: 12 | inv_0_0[Ref](x@99@01, y@100@01, z@101@01) in xs1@37@01 | live]
(push) ; 5
; [then-branch: 12 | !(inv_0_0[Ref](x@99@01, y@100@01, z@101@01) in xs1@37@01)]
(assert (not (Set_in (inv_0_0<Ref> x@99@01 y@100@01 z@101@01) xs1@37@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 12 | inv_0_0[Ref](x@99@01, y@100@01, z@101@01) in xs1@37@01]
(assert (Set_in (inv_0_0<Ref> x@99@01 y@100@01 z@101@01) xs1@37@01))
; [eval] (inv_0_1(x, y, z) in ys1)
; [eval] inv_0_1(x, y, z)
(push) ; 6
; [then-branch: 13 | !(inv_0_1[Ref](x@99@01, y@100@01, z@101@01) in ys1@48@01) | live]
; [else-branch: 13 | inv_0_1[Ref](x@99@01, y@100@01, z@101@01) in ys1@48@01 | live]
(push) ; 7
; [then-branch: 13 | !(inv_0_1[Ref](x@99@01, y@100@01, z@101@01) in ys1@48@01)]
(assert (not (Set_in (inv_0_1<Ref> x@99@01 y@100@01 z@101@01) ys1@48@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 13 | inv_0_1[Ref](x@99@01, y@100@01, z@101@01) in ys1@48@01]
(assert (Set_in (inv_0_1<Ref> x@99@01 y@100@01 z@101@01) ys1@48@01))
; [eval] (inv_0_2(x, y, z) in zs1)
; [eval] inv_0_2(x, y, z)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_0_1<Ref> x@99@01 y@100@01 z@101@01) ys1@48@01)
  (not (Set_in (inv_0_1<Ref> x@99@01 y@100@01 z@101@01) ys1@48@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_0_0<Ref> x@99@01 y@100@01 z@101@01) xs1@37@01)
  (and
    (Set_in (inv_0_0<Ref> x@99@01 y@100@01 z@101@01) xs1@37@01)
    (or
      (Set_in (inv_0_1<Ref> x@99@01 y@100@01 z@101@01) ys1@48@01)
      (not (Set_in (inv_0_1<Ref> x@99@01 y@100@01 z@101@01) ys1@48@01))))))
(assert (or
  (Set_in (inv_0_0<Ref> x@99@01 y@100@01 z@101@01) xs1@37@01)
  (not (Set_in (inv_0_0<Ref> x@99@01 y@100@01 z@101@01) xs1@37@01))))
(push) ; 4
; [then-branch: 14 | inv_0_0[Ref](x@99@01, y@100@01, z@101@01) in xs1@37@01 && inv_0_1[Ref](x@99@01, y@100@01, z@101@01) in ys1@48@01 && inv_0_2[Ref](x@99@01, y@100@01, z@101@01) in zs1@59@01 | live]
; [else-branch: 14 | !(inv_0_0[Ref](x@99@01, y@100@01, z@101@01) in xs1@37@01 && inv_0_1[Ref](x@99@01, y@100@01, z@101@01) in ys1@48@01 && inv_0_2[Ref](x@99@01, y@100@01, z@101@01) in zs1@59@01) | live]
(push) ; 5
; [then-branch: 14 | inv_0_0[Ref](x@99@01, y@100@01, z@101@01) in xs1@37@01 && inv_0_1[Ref](x@99@01, y@100@01, z@101@01) in ys1@48@01 && inv_0_2[Ref](x@99@01, y@100@01, z@101@01) in zs1@59@01]
(assert (and
  (Set_in (inv_0_0<Ref> x@99@01 y@100@01 z@101@01) xs1@37@01)
  (and
    (Set_in (inv_0_1<Ref> x@99@01 y@100@01 z@101@01) ys1@48@01)
    (Set_in (inv_0_2<Ref> x@99@01 y@100@01 z@101@01) zs1@59@01))))
; [eval] perm(p(x, y, z)) >= q
; [eval] perm(p(x, y, z))
; Definitional axioms for snapshot map values
(declare-const pm@102@01 $PPM)
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (=
    ($PSF.perm_p (as pm@102@01  $PPM) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    (ite
      (and
        (and (img@83@01 x y z) (img@85@01 x y z) (img@87@01 x y z))
        (and
          (Set_in (inv@82@01 x y z) xs@70@01)
          (and
            (Set_in (inv@84@01 x y z) ys@71@01)
            (Set_in (inv@86@01 x y z) zs@72@01))))
      q@73@01
      $Perm.No))
  :pattern (($PSF.perm_p (as pm@102@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resPrmSumDef2|)))
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (and
    ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    ($PSF.loc_p ($PSF.lookup_p $t@81@01 ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))))
  :pattern (($PSF.perm_p (as pm@102@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resTrgDef3|)))
(assert ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x@99@01)
    ($SortWrappers.$RefTo$Snap y@100@01))
  ($SortWrappers.$RefTo$Snap z@101@01))) ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x@99@01)
    ($SortWrappers.$RefTo$Snap y@100@01))
  ($SortWrappers.$RefTo$Snap z@101@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 14 | !(inv_0_0[Ref](x@99@01, y@100@01, z@101@01) in xs1@37@01 && inv_0_1[Ref](x@99@01, y@100@01, z@101@01) in ys1@48@01 && inv_0_2[Ref](x@99@01, y@100@01, z@101@01) in zs1@59@01)]
(assert (not
  (and
    (Set_in (inv_0_0<Ref> x@99@01 y@100@01 z@101@01) xs1@37@01)
    (and
      (Set_in (inv_0_1<Ref> x@99@01 y@100@01 z@101@01) ys1@48@01)
      (Set_in (inv_0_2<Ref> x@99@01 y@100@01 z@101@01) zs1@59@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (=
    ($PSF.perm_p (as pm@102@01  $PPM) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    (ite
      (and
        (and (img@83@01 x y z) (img@85@01 x y z) (img@87@01 x y z))
        (and
          (Set_in (inv@82@01 x y z) xs@70@01)
          (and
            (Set_in (inv@84@01 x y z) ys@71@01)
            (Set_in (inv@86@01 x y z) zs@72@01))))
      q@73@01
      $Perm.No))
  :pattern (($PSF.perm_p (as pm@102@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resPrmSumDef2|)))
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (and
    ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    ($PSF.loc_p ($PSF.lookup_p $t@81@01 ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))))
  :pattern (($PSF.perm_p (as pm@102@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resTrgDef3|)))
(assert (=>
  (and
    (Set_in (inv_0_0<Ref> x@99@01 y@100@01 z@101@01) xs1@37@01)
    (and
      (Set_in (inv_0_1<Ref> x@99@01 y@100@01 z@101@01) ys1@48@01)
      (Set_in (inv_0_2<Ref> x@99@01 y@100@01 z@101@01) zs1@59@01)))
  (and
    (Set_in (inv_0_0<Ref> x@99@01 y@100@01 z@101@01) xs1@37@01)
    (Set_in (inv_0_1<Ref> x@99@01 y@100@01 z@101@01) ys1@48@01)
    (Set_in (inv_0_2<Ref> x@99@01 y@100@01 z@101@01) zs1@59@01)
    ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x@99@01)
        ($SortWrappers.$RefTo$Snap y@100@01))
      ($SortWrappers.$RefTo$Snap z@101@01))) ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x@99@01)
        ($SortWrappers.$RefTo$Snap y@100@01))
      ($SortWrappers.$RefTo$Snap z@101@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in (inv_0_0<Ref> x@99@01 y@100@01 z@101@01) xs1@37@01)
      (and
        (Set_in (inv_0_1<Ref> x@99@01 y@100@01 z@101@01) ys1@48@01)
        (Set_in (inv_0_2<Ref> x@99@01 y@100@01 z@101@01) zs1@59@01))))
  (and
    (Set_in (inv_0_0<Ref> x@99@01 y@100@01 z@101@01) xs1@37@01)
    (and
      (Set_in (inv_0_1<Ref> x@99@01 y@100@01 z@101@01) ys1@48@01)
      (Set_in (inv_0_2<Ref> x@99@01 y@100@01 z@101@01) zs1@59@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (=
    ($PSF.perm_p (as pm@102@01  $PPM) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    (ite
      (and
        (and (img@83@01 x y z) (img@85@01 x y z) (img@87@01 x y z))
        (and
          (Set_in (inv@82@01 x y z) xs@70@01)
          (and
            (Set_in (inv@84@01 x y z) ys@71@01)
            (Set_in (inv@86@01 x y z) zs@72@01))))
      q@73@01
      $Perm.No))
  :pattern (($PSF.perm_p (as pm@102@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resPrmSumDef2|)))
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (and
    ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    ($PSF.loc_p ($PSF.lookup_p $t@81@01 ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))))
  :pattern (($PSF.perm_p (as pm@102@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resTrgDef3|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@99@01 $Ref) (y@100@01 $Ref) (z@101@01 $Ref)) (!
  (and
    (=>
      (Set_in (inv_0_0<Ref> x@99@01 y@100@01 z@101@01) xs1@37@01)
      (and
        (Set_in (inv_0_0<Ref> x@99@01 y@100@01 z@101@01) xs1@37@01)
        (or
          (Set_in (inv_0_1<Ref> x@99@01 y@100@01 z@101@01) ys1@48@01)
          (not (Set_in (inv_0_1<Ref> x@99@01 y@100@01 z@101@01) ys1@48@01)))))
    (or
      (Set_in (inv_0_0<Ref> x@99@01 y@100@01 z@101@01) xs1@37@01)
      (not (Set_in (inv_0_0<Ref> x@99@01 y@100@01 z@101@01) xs1@37@01)))
    (=>
      (and
        (Set_in (inv_0_0<Ref> x@99@01 y@100@01 z@101@01) xs1@37@01)
        (and
          (Set_in (inv_0_1<Ref> x@99@01 y@100@01 z@101@01) ys1@48@01)
          (Set_in (inv_0_2<Ref> x@99@01 y@100@01 z@101@01) zs1@59@01)))
      (and
        (Set_in (inv_0_0<Ref> x@99@01 y@100@01 z@101@01) xs1@37@01)
        (Set_in (inv_0_1<Ref> x@99@01 y@100@01 z@101@01) ys1@48@01)
        (Set_in (inv_0_2<Ref> x@99@01 y@100@01 z@101@01) zs1@59@01)
        ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap x@99@01)
            ($SortWrappers.$RefTo$Snap y@100@01))
          ($SortWrappers.$RefTo$Snap z@101@01))) ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap x@99@01)
            ($SortWrappers.$RefTo$Snap y@100@01))
          ($SortWrappers.$RefTo$Snap z@101@01)))))
    (or
      (not
        (and
          (Set_in (inv_0_0<Ref> x@99@01 y@100@01 z@101@01) xs1@37@01)
          (and
            (Set_in (inv_0_1<Ref> x@99@01 y@100@01 z@101@01) ys1@48@01)
            (Set_in (inv_0_2<Ref> x@99@01 y@100@01 z@101@01) zs1@59@01))))
      (and
        (Set_in (inv_0_0<Ref> x@99@01 y@100@01 z@101@01) xs1@37@01)
        (and
          (Set_in (inv_0_1<Ref> x@99@01 y@100@01 z@101@01) ys1@48@01)
          (Set_in (inv_0_2<Ref> x@99@01 y@100@01 z@101@01) zs1@59@01)))))
  :pattern ((inv_0_0<Ref> x@99@01 y@100@01 z@101@01) (inv_0_1<Ref> x@99@01 y@100@01 z@101@01) (inv_0_2<Ref> x@99@01 y@100@01 z@101@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@20@9@20@122-aux|)))
(assert (forall ((x@99@01 $Ref) (y@100@01 $Ref) (z@101@01 $Ref)) (!
  (=>
    (and
      (Set_in (inv_0_0<Ref> x@99@01 y@100@01 z@101@01) xs1@37@01)
      (and
        (Set_in (inv_0_1<Ref> x@99@01 y@100@01 z@101@01) ys1@48@01)
        (Set_in (inv_0_2<Ref> x@99@01 y@100@01 z@101@01) zs1@59@01)))
    (>=
      ($PSF.perm_p (as pm@102@01  $PPM) ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap x@99@01)
          ($SortWrappers.$RefTo$Snap y@100@01))
        ($SortWrappers.$RefTo$Snap z@101@01)))
      q@73@01))
  :pattern ((inv_0_0<Ref> x@99@01 y@100@01 z@101@01) (inv_0_1<Ref> x@99@01 y@100@01 z@101@01) (inv_0_2<Ref> x@99@01 y@100@01 z@101@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@20@9@20@122|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x2: Ref, y2: Ref, z2: Ref ::
;     { p(x2, y2, z2) }
;     (x2 in xs2) && ((y2 in ys2) && (z2 in zs2)) ==>
;     inv_1_0(x2, y2, z2) == x2 && inv_1_1(x2, y2, z2) == y2 &&
;     inv_1_2(x2, y2, z2) == z2)
(declare-const $t@103@01 $Snap)
(assert (= $t@103@01 $Snap.unit))
; [eval] (forall x2: Ref, y2: Ref, z2: Ref :: { p(x2, y2, z2) } (x2 in xs2) && ((y2 in ys2) && (z2 in zs2)) ==> inv_1_0(x2, y2, z2) == x2 && inv_1_1(x2, y2, z2) == y2 && inv_1_2(x2, y2, z2) == z2)
(declare-const x2@104@01 $Ref)
(declare-const y2@105@01 $Ref)
(declare-const z2@106@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x2 in xs2) && ((y2 in ys2) && (z2 in zs2)) ==> inv_1_0(x2, y2, z2) == x2 && inv_1_1(x2, y2, z2) == y2 && inv_1_2(x2, y2, z2) == z2
; [eval] (x2 in xs2) && ((y2 in ys2) && (z2 in zs2))
; [eval] (x2 in xs2)
(push) ; 4
; [then-branch: 15 | !(x2@104@01 in xs2@38@01) | live]
; [else-branch: 15 | x2@104@01 in xs2@38@01 | live]
(push) ; 5
; [then-branch: 15 | !(x2@104@01 in xs2@38@01)]
(assert (not (Set_in x2@104@01 xs2@38@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 15 | x2@104@01 in xs2@38@01]
(assert (Set_in x2@104@01 xs2@38@01))
; [eval] (y2 in ys2)
(push) ; 6
; [then-branch: 16 | !(y2@105@01 in ys2@49@01) | live]
; [else-branch: 16 | y2@105@01 in ys2@49@01 | live]
(push) ; 7
; [then-branch: 16 | !(y2@105@01 in ys2@49@01)]
(assert (not (Set_in y2@105@01 ys2@49@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 16 | y2@105@01 in ys2@49@01]
(assert (Set_in y2@105@01 ys2@49@01))
; [eval] (z2 in zs2)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (Set_in y2@105@01 ys2@49@01) (not (Set_in y2@105@01 ys2@49@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in x2@104@01 xs2@38@01)
  (and
    (Set_in x2@104@01 xs2@38@01)
    (or (Set_in y2@105@01 ys2@49@01) (not (Set_in y2@105@01 ys2@49@01))))))
(assert (or (Set_in x2@104@01 xs2@38@01) (not (Set_in x2@104@01 xs2@38@01))))
(push) ; 4
; [then-branch: 17 | x2@104@01 in xs2@38@01 && y2@105@01 in ys2@49@01 && z2@106@01 in zs2@60@01 | live]
; [else-branch: 17 | !(x2@104@01 in xs2@38@01 && y2@105@01 in ys2@49@01 && z2@106@01 in zs2@60@01) | live]
(push) ; 5
; [then-branch: 17 | x2@104@01 in xs2@38@01 && y2@105@01 in ys2@49@01 && z2@106@01 in zs2@60@01]
(assert (and
  (Set_in x2@104@01 xs2@38@01)
  (and (Set_in y2@105@01 ys2@49@01) (Set_in z2@106@01 zs2@60@01))))
; [eval] inv_1_0(x2, y2, z2) == x2 && inv_1_1(x2, y2, z2) == y2 && inv_1_2(x2, y2, z2) == z2
; [eval] inv_1_0(x2, y2, z2) == x2
; [eval] inv_1_0(x2, y2, z2)
(push) ; 6
; [then-branch: 18 | inv_1_0[Ref](x2@104@01, y2@105@01, z2@106@01) != x2@104@01 | live]
; [else-branch: 18 | inv_1_0[Ref](x2@104@01, y2@105@01, z2@106@01) == x2@104@01 | live]
(push) ; 7
; [then-branch: 18 | inv_1_0[Ref](x2@104@01, y2@105@01, z2@106@01) != x2@104@01]
(assert (not (= (inv_1_0<Ref> x2@104@01 y2@105@01 z2@106@01) x2@104@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 18 | inv_1_0[Ref](x2@104@01, y2@105@01, z2@106@01) == x2@104@01]
(assert (= (inv_1_0<Ref> x2@104@01 y2@105@01 z2@106@01) x2@104@01))
; [eval] inv_1_1(x2, y2, z2) == y2
; [eval] inv_1_1(x2, y2, z2)
(push) ; 8
; [then-branch: 19 | inv_1_1[Ref](x2@104@01, y2@105@01, z2@106@01) != y2@105@01 | live]
; [else-branch: 19 | inv_1_1[Ref](x2@104@01, y2@105@01, z2@106@01) == y2@105@01 | live]
(push) ; 9
; [then-branch: 19 | inv_1_1[Ref](x2@104@01, y2@105@01, z2@106@01) != y2@105@01]
(assert (not (= (inv_1_1<Ref> x2@104@01 y2@105@01 z2@106@01) y2@105@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 19 | inv_1_1[Ref](x2@104@01, y2@105@01, z2@106@01) == y2@105@01]
(assert (= (inv_1_1<Ref> x2@104@01 y2@105@01 z2@106@01) y2@105@01))
; [eval] inv_1_2(x2, y2, z2) == z2
; [eval] inv_1_2(x2, y2, z2)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or
  (= (inv_1_1<Ref> x2@104@01 y2@105@01 z2@106@01) y2@105@01)
  (not (= (inv_1_1<Ref> x2@104@01 y2@105@01 z2@106@01) y2@105@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (= (inv_1_0<Ref> x2@104@01 y2@105@01 z2@106@01) x2@104@01)
  (and
    (= (inv_1_0<Ref> x2@104@01 y2@105@01 z2@106@01) x2@104@01)
    (or
      (= (inv_1_1<Ref> x2@104@01 y2@105@01 z2@106@01) y2@105@01)
      (not (= (inv_1_1<Ref> x2@104@01 y2@105@01 z2@106@01) y2@105@01))))))
(assert (or
  (= (inv_1_0<Ref> x2@104@01 y2@105@01 z2@106@01) x2@104@01)
  (not (= (inv_1_0<Ref> x2@104@01 y2@105@01 z2@106@01) x2@104@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 17 | !(x2@104@01 in xs2@38@01 && y2@105@01 in ys2@49@01 && z2@106@01 in zs2@60@01)]
(assert (not
  (and
    (Set_in x2@104@01 xs2@38@01)
    (and (Set_in y2@105@01 ys2@49@01) (Set_in z2@106@01 zs2@60@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Set_in x2@104@01 xs2@38@01)
    (and (Set_in y2@105@01 ys2@49@01) (Set_in z2@106@01 zs2@60@01)))
  (and
    (Set_in x2@104@01 xs2@38@01)
    (Set_in y2@105@01 ys2@49@01)
    (Set_in z2@106@01 zs2@60@01)
    (=>
      (= (inv_1_0<Ref> x2@104@01 y2@105@01 z2@106@01) x2@104@01)
      (and
        (= (inv_1_0<Ref> x2@104@01 y2@105@01 z2@106@01) x2@104@01)
        (or
          (= (inv_1_1<Ref> x2@104@01 y2@105@01 z2@106@01) y2@105@01)
          (not (= (inv_1_1<Ref> x2@104@01 y2@105@01 z2@106@01) y2@105@01)))))
    (or
      (= (inv_1_0<Ref> x2@104@01 y2@105@01 z2@106@01) x2@104@01)
      (not (= (inv_1_0<Ref> x2@104@01 y2@105@01 z2@106@01) x2@104@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in x2@104@01 xs2@38@01)
      (and (Set_in y2@105@01 ys2@49@01) (Set_in z2@106@01 zs2@60@01))))
  (and
    (Set_in x2@104@01 xs2@38@01)
    (and (Set_in y2@105@01 ys2@49@01) (Set_in z2@106@01 zs2@60@01)))))
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x2@104@01 $Ref) (y2@105@01 $Ref) (z2@106@01 $Ref)) (!
  (and
    (=>
      (Set_in x2@104@01 xs2@38@01)
      (and
        (Set_in x2@104@01 xs2@38@01)
        (or (Set_in y2@105@01 ys2@49@01) (not (Set_in y2@105@01 ys2@49@01)))))
    (or (Set_in x2@104@01 xs2@38@01) (not (Set_in x2@104@01 xs2@38@01)))
    (=>
      (and
        (Set_in x2@104@01 xs2@38@01)
        (and (Set_in y2@105@01 ys2@49@01) (Set_in z2@106@01 zs2@60@01)))
      (and
        (Set_in x2@104@01 xs2@38@01)
        (Set_in y2@105@01 ys2@49@01)
        (Set_in z2@106@01 zs2@60@01)
        (=>
          (= (inv_1_0<Ref> x2@104@01 y2@105@01 z2@106@01) x2@104@01)
          (and
            (= (inv_1_0<Ref> x2@104@01 y2@105@01 z2@106@01) x2@104@01)
            (or
              (= (inv_1_1<Ref> x2@104@01 y2@105@01 z2@106@01) y2@105@01)
              (not (= (inv_1_1<Ref> x2@104@01 y2@105@01 z2@106@01) y2@105@01)))))
        (or
          (= (inv_1_0<Ref> x2@104@01 y2@105@01 z2@106@01) x2@104@01)
          (not (= (inv_1_0<Ref> x2@104@01 y2@105@01 z2@106@01) x2@104@01)))))
    (or
      (not
        (and
          (Set_in x2@104@01 xs2@38@01)
          (and (Set_in y2@105@01 ys2@49@01) (Set_in z2@106@01 zs2@60@01))))
      (and
        (Set_in x2@104@01 xs2@38@01)
        (and (Set_in y2@105@01 ys2@49@01) (Set_in z2@106@01 zs2@60@01)))))
  :pattern (($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap x2@104@01)
      ($SortWrappers.$RefTo$Snap y2@105@01))
    ($SortWrappers.$RefTo$Snap z2@106@01))) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap x2@104@01)
      ($SortWrappers.$RefTo$Snap y2@105@01))
    ($SortWrappers.$RefTo$Snap z2@106@01))))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@21@9@21@122-aux|)))
(assert (forall ((x2@104@01 $Ref) (y2@105@01 $Ref) (z2@106@01 $Ref)) (!
  (=>
    (and
      (Set_in x2@104@01 xs2@38@01)
      (and (Set_in y2@105@01 ys2@49@01) (Set_in z2@106@01 zs2@60@01)))
    (and
      (= (inv_1_0<Ref> x2@104@01 y2@105@01 z2@106@01) x2@104@01)
      (and
        (= (inv_1_1<Ref> x2@104@01 y2@105@01 z2@106@01) y2@105@01)
        (= (inv_1_2<Ref> x2@104@01 y2@105@01 z2@106@01) z2@106@01))))
  :pattern (($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap x2@104@01)
      ($SortWrappers.$RefTo$Snap y2@105@01))
    ($SortWrappers.$RefTo$Snap z2@106@01))) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap x2@104@01)
      ($SortWrappers.$RefTo$Snap y2@105@01))
    ($SortWrappers.$RefTo$Snap z2@106@01))))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@21@9@21@122|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x: Ref, y: Ref, z: Ref ::
;     { inv_1_0(x, y, z), inv_1_1(x, y, z), inv_1_2(x, y, z) }
;     (inv_1_0(x, y, z) in xs2) &&
;     ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) ==>
;     inv_1_0(x, y, z) == x && inv_1_1(x, y, z) == y && inv_1_2(x, y, z) == z)
(declare-const $t@107@01 $Snap)
(assert (= $t@107@01 $Snap.unit))
; [eval] (forall x: Ref, y: Ref, z: Ref :: { inv_1_0(x, y, z), inv_1_1(x, y, z), inv_1_2(x, y, z) } (inv_1_0(x, y, z) in xs2) && ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) ==> inv_1_0(x, y, z) == x && inv_1_1(x, y, z) == y && inv_1_2(x, y, z) == z)
(declare-const x@108@01 $Ref)
(declare-const y@109@01 $Ref)
(declare-const z@110@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (inv_1_0(x, y, z) in xs2) && ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) ==> inv_1_0(x, y, z) == x && inv_1_1(x, y, z) == y && inv_1_2(x, y, z) == z
; [eval] (inv_1_0(x, y, z) in xs2) && ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2))
; [eval] (inv_1_0(x, y, z) in xs2)
; [eval] inv_1_0(x, y, z)
(push) ; 4
; [then-branch: 20 | !(inv_1_0[Ref](x@108@01, y@109@01, z@110@01) in xs2@38@01) | live]
; [else-branch: 20 | inv_1_0[Ref](x@108@01, y@109@01, z@110@01) in xs2@38@01 | live]
(push) ; 5
; [then-branch: 20 | !(inv_1_0[Ref](x@108@01, y@109@01, z@110@01) in xs2@38@01)]
(assert (not (Set_in (inv_1_0<Ref> x@108@01 y@109@01 z@110@01) xs2@38@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 20 | inv_1_0[Ref](x@108@01, y@109@01, z@110@01) in xs2@38@01]
(assert (Set_in (inv_1_0<Ref> x@108@01 y@109@01 z@110@01) xs2@38@01))
; [eval] (inv_1_1(x, y, z) in ys2)
; [eval] inv_1_1(x, y, z)
(push) ; 6
; [then-branch: 21 | !(inv_1_1[Ref](x@108@01, y@109@01, z@110@01) in ys2@49@01) | live]
; [else-branch: 21 | inv_1_1[Ref](x@108@01, y@109@01, z@110@01) in ys2@49@01 | live]
(push) ; 7
; [then-branch: 21 | !(inv_1_1[Ref](x@108@01, y@109@01, z@110@01) in ys2@49@01)]
(assert (not (Set_in (inv_1_1<Ref> x@108@01 y@109@01 z@110@01) ys2@49@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 21 | inv_1_1[Ref](x@108@01, y@109@01, z@110@01) in ys2@49@01]
(assert (Set_in (inv_1_1<Ref> x@108@01 y@109@01 z@110@01) ys2@49@01))
; [eval] (inv_1_2(x, y, z) in zs2)
; [eval] inv_1_2(x, y, z)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_1_1<Ref> x@108@01 y@109@01 z@110@01) ys2@49@01)
  (not (Set_in (inv_1_1<Ref> x@108@01 y@109@01 z@110@01) ys2@49@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_1_0<Ref> x@108@01 y@109@01 z@110@01) xs2@38@01)
  (and
    (Set_in (inv_1_0<Ref> x@108@01 y@109@01 z@110@01) xs2@38@01)
    (or
      (Set_in (inv_1_1<Ref> x@108@01 y@109@01 z@110@01) ys2@49@01)
      (not (Set_in (inv_1_1<Ref> x@108@01 y@109@01 z@110@01) ys2@49@01))))))
(assert (or
  (Set_in (inv_1_0<Ref> x@108@01 y@109@01 z@110@01) xs2@38@01)
  (not (Set_in (inv_1_0<Ref> x@108@01 y@109@01 z@110@01) xs2@38@01))))
(push) ; 4
; [then-branch: 22 | inv_1_0[Ref](x@108@01, y@109@01, z@110@01) in xs2@38@01 && inv_1_1[Ref](x@108@01, y@109@01, z@110@01) in ys2@49@01 && inv_1_2[Ref](x@108@01, y@109@01, z@110@01) in zs2@60@01 | live]
; [else-branch: 22 | !(inv_1_0[Ref](x@108@01, y@109@01, z@110@01) in xs2@38@01 && inv_1_1[Ref](x@108@01, y@109@01, z@110@01) in ys2@49@01 && inv_1_2[Ref](x@108@01, y@109@01, z@110@01) in zs2@60@01) | live]
(push) ; 5
; [then-branch: 22 | inv_1_0[Ref](x@108@01, y@109@01, z@110@01) in xs2@38@01 && inv_1_1[Ref](x@108@01, y@109@01, z@110@01) in ys2@49@01 && inv_1_2[Ref](x@108@01, y@109@01, z@110@01) in zs2@60@01]
(assert (and
  (Set_in (inv_1_0<Ref> x@108@01 y@109@01 z@110@01) xs2@38@01)
  (and
    (Set_in (inv_1_1<Ref> x@108@01 y@109@01 z@110@01) ys2@49@01)
    (Set_in (inv_1_2<Ref> x@108@01 y@109@01 z@110@01) zs2@60@01))))
; [eval] inv_1_0(x, y, z) == x && inv_1_1(x, y, z) == y && inv_1_2(x, y, z) == z
; [eval] inv_1_0(x, y, z) == x
; [eval] inv_1_0(x, y, z)
(push) ; 6
; [then-branch: 23 | inv_1_0[Ref](x@108@01, y@109@01, z@110@01) != x@108@01 | live]
; [else-branch: 23 | inv_1_0[Ref](x@108@01, y@109@01, z@110@01) == x@108@01 | live]
(push) ; 7
; [then-branch: 23 | inv_1_0[Ref](x@108@01, y@109@01, z@110@01) != x@108@01]
(assert (not (= (inv_1_0<Ref> x@108@01 y@109@01 z@110@01) x@108@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 23 | inv_1_0[Ref](x@108@01, y@109@01, z@110@01) == x@108@01]
(assert (= (inv_1_0<Ref> x@108@01 y@109@01 z@110@01) x@108@01))
; [eval] inv_1_1(x, y, z) == y
; [eval] inv_1_1(x, y, z)
(push) ; 8
; [then-branch: 24 | inv_1_1[Ref](x@108@01, y@109@01, z@110@01) != y@109@01 | live]
; [else-branch: 24 | inv_1_1[Ref](x@108@01, y@109@01, z@110@01) == y@109@01 | live]
(push) ; 9
; [then-branch: 24 | inv_1_1[Ref](x@108@01, y@109@01, z@110@01) != y@109@01]
(assert (not (= (inv_1_1<Ref> x@108@01 y@109@01 z@110@01) y@109@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 24 | inv_1_1[Ref](x@108@01, y@109@01, z@110@01) == y@109@01]
(assert (= (inv_1_1<Ref> x@108@01 y@109@01 z@110@01) y@109@01))
; [eval] inv_1_2(x, y, z) == z
; [eval] inv_1_2(x, y, z)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or
  (= (inv_1_1<Ref> x@108@01 y@109@01 z@110@01) y@109@01)
  (not (= (inv_1_1<Ref> x@108@01 y@109@01 z@110@01) y@109@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (= (inv_1_0<Ref> x@108@01 y@109@01 z@110@01) x@108@01)
  (and
    (= (inv_1_0<Ref> x@108@01 y@109@01 z@110@01) x@108@01)
    (or
      (= (inv_1_1<Ref> x@108@01 y@109@01 z@110@01) y@109@01)
      (not (= (inv_1_1<Ref> x@108@01 y@109@01 z@110@01) y@109@01))))))
(assert (or
  (= (inv_1_0<Ref> x@108@01 y@109@01 z@110@01) x@108@01)
  (not (= (inv_1_0<Ref> x@108@01 y@109@01 z@110@01) x@108@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 22 | !(inv_1_0[Ref](x@108@01, y@109@01, z@110@01) in xs2@38@01 && inv_1_1[Ref](x@108@01, y@109@01, z@110@01) in ys2@49@01 && inv_1_2[Ref](x@108@01, y@109@01, z@110@01) in zs2@60@01)]
(assert (not
  (and
    (Set_in (inv_1_0<Ref> x@108@01 y@109@01 z@110@01) xs2@38@01)
    (and
      (Set_in (inv_1_1<Ref> x@108@01 y@109@01 z@110@01) ys2@49@01)
      (Set_in (inv_1_2<Ref> x@108@01 y@109@01 z@110@01) zs2@60@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Set_in (inv_1_0<Ref> x@108@01 y@109@01 z@110@01) xs2@38@01)
    (and
      (Set_in (inv_1_1<Ref> x@108@01 y@109@01 z@110@01) ys2@49@01)
      (Set_in (inv_1_2<Ref> x@108@01 y@109@01 z@110@01) zs2@60@01)))
  (and
    (Set_in (inv_1_0<Ref> x@108@01 y@109@01 z@110@01) xs2@38@01)
    (Set_in (inv_1_1<Ref> x@108@01 y@109@01 z@110@01) ys2@49@01)
    (Set_in (inv_1_2<Ref> x@108@01 y@109@01 z@110@01) zs2@60@01)
    (=>
      (= (inv_1_0<Ref> x@108@01 y@109@01 z@110@01) x@108@01)
      (and
        (= (inv_1_0<Ref> x@108@01 y@109@01 z@110@01) x@108@01)
        (or
          (= (inv_1_1<Ref> x@108@01 y@109@01 z@110@01) y@109@01)
          (not (= (inv_1_1<Ref> x@108@01 y@109@01 z@110@01) y@109@01)))))
    (or
      (= (inv_1_0<Ref> x@108@01 y@109@01 z@110@01) x@108@01)
      (not (= (inv_1_0<Ref> x@108@01 y@109@01 z@110@01) x@108@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in (inv_1_0<Ref> x@108@01 y@109@01 z@110@01) xs2@38@01)
      (and
        (Set_in (inv_1_1<Ref> x@108@01 y@109@01 z@110@01) ys2@49@01)
        (Set_in (inv_1_2<Ref> x@108@01 y@109@01 z@110@01) zs2@60@01))))
  (and
    (Set_in (inv_1_0<Ref> x@108@01 y@109@01 z@110@01) xs2@38@01)
    (and
      (Set_in (inv_1_1<Ref> x@108@01 y@109@01 z@110@01) ys2@49@01)
      (Set_in (inv_1_2<Ref> x@108@01 y@109@01 z@110@01) zs2@60@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@108@01 $Ref) (y@109@01 $Ref) (z@110@01 $Ref)) (!
  (and
    (=>
      (Set_in (inv_1_0<Ref> x@108@01 y@109@01 z@110@01) xs2@38@01)
      (and
        (Set_in (inv_1_0<Ref> x@108@01 y@109@01 z@110@01) xs2@38@01)
        (or
          (Set_in (inv_1_1<Ref> x@108@01 y@109@01 z@110@01) ys2@49@01)
          (not (Set_in (inv_1_1<Ref> x@108@01 y@109@01 z@110@01) ys2@49@01)))))
    (or
      (Set_in (inv_1_0<Ref> x@108@01 y@109@01 z@110@01) xs2@38@01)
      (not (Set_in (inv_1_0<Ref> x@108@01 y@109@01 z@110@01) xs2@38@01)))
    (=>
      (and
        (Set_in (inv_1_0<Ref> x@108@01 y@109@01 z@110@01) xs2@38@01)
        (and
          (Set_in (inv_1_1<Ref> x@108@01 y@109@01 z@110@01) ys2@49@01)
          (Set_in (inv_1_2<Ref> x@108@01 y@109@01 z@110@01) zs2@60@01)))
      (and
        (Set_in (inv_1_0<Ref> x@108@01 y@109@01 z@110@01) xs2@38@01)
        (Set_in (inv_1_1<Ref> x@108@01 y@109@01 z@110@01) ys2@49@01)
        (Set_in (inv_1_2<Ref> x@108@01 y@109@01 z@110@01) zs2@60@01)
        (=>
          (= (inv_1_0<Ref> x@108@01 y@109@01 z@110@01) x@108@01)
          (and
            (= (inv_1_0<Ref> x@108@01 y@109@01 z@110@01) x@108@01)
            (or
              (= (inv_1_1<Ref> x@108@01 y@109@01 z@110@01) y@109@01)
              (not (= (inv_1_1<Ref> x@108@01 y@109@01 z@110@01) y@109@01)))))
        (or
          (= (inv_1_0<Ref> x@108@01 y@109@01 z@110@01) x@108@01)
          (not (= (inv_1_0<Ref> x@108@01 y@109@01 z@110@01) x@108@01)))))
    (or
      (not
        (and
          (Set_in (inv_1_0<Ref> x@108@01 y@109@01 z@110@01) xs2@38@01)
          (and
            (Set_in (inv_1_1<Ref> x@108@01 y@109@01 z@110@01) ys2@49@01)
            (Set_in (inv_1_2<Ref> x@108@01 y@109@01 z@110@01) zs2@60@01))))
      (and
        (Set_in (inv_1_0<Ref> x@108@01 y@109@01 z@110@01) xs2@38@01)
        (and
          (Set_in (inv_1_1<Ref> x@108@01 y@109@01 z@110@01) ys2@49@01)
          (Set_in (inv_1_2<Ref> x@108@01 y@109@01 z@110@01) zs2@60@01)))))
  :pattern ((inv_1_0<Ref> x@108@01 y@109@01 z@110@01) (inv_1_1<Ref> x@108@01 y@109@01 z@110@01) (inv_1_2<Ref> x@108@01 y@109@01 z@110@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@21@9@21@122-aux|)))
(assert (forall ((x@108@01 $Ref) (y@109@01 $Ref) (z@110@01 $Ref)) (!
  (=>
    (and
      (Set_in (inv_1_0<Ref> x@108@01 y@109@01 z@110@01) xs2@38@01)
      (and
        (Set_in (inv_1_1<Ref> x@108@01 y@109@01 z@110@01) ys2@49@01)
        (Set_in (inv_1_2<Ref> x@108@01 y@109@01 z@110@01) zs2@60@01)))
    (and
      (= (inv_1_0<Ref> x@108@01 y@109@01 z@110@01) x@108@01)
      (and
        (= (inv_1_1<Ref> x@108@01 y@109@01 z@110@01) y@109@01)
        (= (inv_1_2<Ref> x@108@01 y@109@01 z@110@01) z@110@01))))
  :pattern ((inv_1_0<Ref> x@108@01 y@109@01 z@110@01) (inv_1_1<Ref> x@108@01 y@109@01 z@110@01) (inv_1_2<Ref> x@108@01 y@109@01 z@110@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@21@9@21@122|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x: Ref, y: Ref, z: Ref ::
;     { inv_1_0(x, y, z), inv_1_1(x, y, z), inv_1_2(x, y, z) }
;     (inv_1_0(x, y, z) in xs2) &&
;     ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) ==>
;     perm(p(x, y, z)) >=
;     __iar__assume_helper_1((inv_0_0(x, y, z) in xs1) &&
;     ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) &&
;     (x == x && y == y && z == z), q, q))
(declare-const $t@111@01 $Snap)
(assert (= $t@111@01 $Snap.unit))
; [eval] (forall x: Ref, y: Ref, z: Ref :: { inv_1_0(x, y, z), inv_1_1(x, y, z), inv_1_2(x, y, z) } (inv_1_0(x, y, z) in xs2) && ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) ==> perm(p(x, y, z)) >= __iar__assume_helper_1((inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) && (x == x && y == y && z == z), q, q))
(declare-const x@112@01 $Ref)
(declare-const y@113@01 $Ref)
(declare-const z@114@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (inv_1_0(x, y, z) in xs2) && ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) ==> perm(p(x, y, z)) >= __iar__assume_helper_1((inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) && (x == x && y == y && z == z), q, q)
; [eval] (inv_1_0(x, y, z) in xs2) && ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2))
; [eval] (inv_1_0(x, y, z) in xs2)
; [eval] inv_1_0(x, y, z)
(push) ; 4
; [then-branch: 25 | !(inv_1_0[Ref](x@112@01, y@113@01, z@114@01) in xs2@38@01) | live]
; [else-branch: 25 | inv_1_0[Ref](x@112@01, y@113@01, z@114@01) in xs2@38@01 | live]
(push) ; 5
; [then-branch: 25 | !(inv_1_0[Ref](x@112@01, y@113@01, z@114@01) in xs2@38@01)]
(assert (not (Set_in (inv_1_0<Ref> x@112@01 y@113@01 z@114@01) xs2@38@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 25 | inv_1_0[Ref](x@112@01, y@113@01, z@114@01) in xs2@38@01]
(assert (Set_in (inv_1_0<Ref> x@112@01 y@113@01 z@114@01) xs2@38@01))
; [eval] (inv_1_1(x, y, z) in ys2)
; [eval] inv_1_1(x, y, z)
(push) ; 6
; [then-branch: 26 | !(inv_1_1[Ref](x@112@01, y@113@01, z@114@01) in ys2@49@01) | live]
; [else-branch: 26 | inv_1_1[Ref](x@112@01, y@113@01, z@114@01) in ys2@49@01 | live]
(push) ; 7
; [then-branch: 26 | !(inv_1_1[Ref](x@112@01, y@113@01, z@114@01) in ys2@49@01)]
(assert (not (Set_in (inv_1_1<Ref> x@112@01 y@113@01 z@114@01) ys2@49@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 26 | inv_1_1[Ref](x@112@01, y@113@01, z@114@01) in ys2@49@01]
(assert (Set_in (inv_1_1<Ref> x@112@01 y@113@01 z@114@01) ys2@49@01))
; [eval] (inv_1_2(x, y, z) in zs2)
; [eval] inv_1_2(x, y, z)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_1_1<Ref> x@112@01 y@113@01 z@114@01) ys2@49@01)
  (not (Set_in (inv_1_1<Ref> x@112@01 y@113@01 z@114@01) ys2@49@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_1_0<Ref> x@112@01 y@113@01 z@114@01) xs2@38@01)
  (and
    (Set_in (inv_1_0<Ref> x@112@01 y@113@01 z@114@01) xs2@38@01)
    (or
      (Set_in (inv_1_1<Ref> x@112@01 y@113@01 z@114@01) ys2@49@01)
      (not (Set_in (inv_1_1<Ref> x@112@01 y@113@01 z@114@01) ys2@49@01))))))
(assert (or
  (Set_in (inv_1_0<Ref> x@112@01 y@113@01 z@114@01) xs2@38@01)
  (not (Set_in (inv_1_0<Ref> x@112@01 y@113@01 z@114@01) xs2@38@01))))
(push) ; 4
; [then-branch: 27 | inv_1_0[Ref](x@112@01, y@113@01, z@114@01) in xs2@38@01 && inv_1_1[Ref](x@112@01, y@113@01, z@114@01) in ys2@49@01 && inv_1_2[Ref](x@112@01, y@113@01, z@114@01) in zs2@60@01 | live]
; [else-branch: 27 | !(inv_1_0[Ref](x@112@01, y@113@01, z@114@01) in xs2@38@01 && inv_1_1[Ref](x@112@01, y@113@01, z@114@01) in ys2@49@01 && inv_1_2[Ref](x@112@01, y@113@01, z@114@01) in zs2@60@01) | live]
(push) ; 5
; [then-branch: 27 | inv_1_0[Ref](x@112@01, y@113@01, z@114@01) in xs2@38@01 && inv_1_1[Ref](x@112@01, y@113@01, z@114@01) in ys2@49@01 && inv_1_2[Ref](x@112@01, y@113@01, z@114@01) in zs2@60@01]
(assert (and
  (Set_in (inv_1_0<Ref> x@112@01 y@113@01 z@114@01) xs2@38@01)
  (and
    (Set_in (inv_1_1<Ref> x@112@01 y@113@01 z@114@01) ys2@49@01)
    (Set_in (inv_1_2<Ref> x@112@01 y@113@01 z@114@01) zs2@60@01))))
; [eval] perm(p(x, y, z)) >= __iar__assume_helper_1((inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) && (x == x && y == y && z == z), q, q)
; [eval] perm(p(x, y, z))
; Definitional axioms for snapshot map values
(declare-const pm@115@01 $PPM)
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (=
    ($PSF.perm_p (as pm@115@01  $PPM) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    (ite
      (and
        (and (img@83@01 x y z) (img@85@01 x y z) (img@87@01 x y z))
        (and
          (Set_in (inv@82@01 x y z) xs@70@01)
          (and
            (Set_in (inv@84@01 x y z) ys@71@01)
            (Set_in (inv@86@01 x y z) zs@72@01))))
      q@73@01
      $Perm.No))
  :pattern (($PSF.perm_p (as pm@115@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resPrmSumDef4|)))
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (and
    ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    ($PSF.loc_p ($PSF.lookup_p $t@81@01 ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))))
  :pattern (($PSF.perm_p (as pm@115@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resTrgDef5|)))
(assert ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x@112@01)
    ($SortWrappers.$RefTo$Snap y@113@01))
  ($SortWrappers.$RefTo$Snap z@114@01))) ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x@112@01)
    ($SortWrappers.$RefTo$Snap y@113@01))
  ($SortWrappers.$RefTo$Snap z@114@01))))
; [eval] __iar__assume_helper_1((inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) && (x == x && y == y && z == z), q, q)
; [eval] (inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) && (x == x && y == y && z == z)
; [eval] (inv_0_0(x, y, z) in xs1)
; [eval] inv_0_0(x, y, z)
(push) ; 6
; [then-branch: 28 | !(inv_0_0[Ref](x@112@01, y@113@01, z@114@01) in xs1@37@01) | live]
; [else-branch: 28 | inv_0_0[Ref](x@112@01, y@113@01, z@114@01) in xs1@37@01 | live]
(push) ; 7
; [then-branch: 28 | !(inv_0_0[Ref](x@112@01, y@113@01, z@114@01) in xs1@37@01)]
(assert (not (Set_in (inv_0_0<Ref> x@112@01 y@113@01 z@114@01) xs1@37@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 28 | inv_0_0[Ref](x@112@01, y@113@01, z@114@01) in xs1@37@01]
(assert (Set_in (inv_0_0<Ref> x@112@01 y@113@01 z@114@01) xs1@37@01))
; [eval] (inv_0_1(x, y, z) in ys1)
; [eval] inv_0_1(x, y, z)
(push) ; 8
; [then-branch: 29 | !(inv_0_1[Ref](x@112@01, y@113@01, z@114@01) in ys1@48@01) | live]
; [else-branch: 29 | inv_0_1[Ref](x@112@01, y@113@01, z@114@01) in ys1@48@01 | live]
(push) ; 9
; [then-branch: 29 | !(inv_0_1[Ref](x@112@01, y@113@01, z@114@01) in ys1@48@01)]
(assert (not (Set_in (inv_0_1<Ref> x@112@01 y@113@01 z@114@01) ys1@48@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 29 | inv_0_1[Ref](x@112@01, y@113@01, z@114@01) in ys1@48@01]
(assert (Set_in (inv_0_1<Ref> x@112@01 y@113@01 z@114@01) ys1@48@01))
; [eval] (inv_0_2(x, y, z) in zs1)
; [eval] inv_0_2(x, y, z)
(push) ; 10
; [then-branch: 30 | !(inv_0_2[Ref](x@112@01, y@113@01, z@114@01) in zs1@59@01) | live]
; [else-branch: 30 | inv_0_2[Ref](x@112@01, y@113@01, z@114@01) in zs1@59@01 | live]
(push) ; 11
; [then-branch: 30 | !(inv_0_2[Ref](x@112@01, y@113@01, z@114@01) in zs1@59@01)]
(assert (not (Set_in (inv_0_2<Ref> x@112@01 y@113@01 z@114@01) zs1@59@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 30 | inv_0_2[Ref](x@112@01, y@113@01, z@114@01) in zs1@59@01]
(assert (Set_in (inv_0_2<Ref> x@112@01 y@113@01 z@114@01) zs1@59@01))
; [eval] x == x
(push) ; 12
; [then-branch: 31 | False | live]
; [else-branch: 31 | True | live]
(push) ; 13
; [then-branch: 31 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 31 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 32 | False | live]
; [else-branch: 32 | True | live]
(push) ; 15
; [then-branch: 32 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 32 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_0_2<Ref> x@112@01 y@113@01 z@114@01) zs1@59@01)
  (not (Set_in (inv_0_2<Ref> x@112@01 y@113@01 z@114@01) zs1@59@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_0_1<Ref> x@112@01 y@113@01 z@114@01) ys1@48@01)
  (and
    (Set_in (inv_0_1<Ref> x@112@01 y@113@01 z@114@01) ys1@48@01)
    (or
      (Set_in (inv_0_2<Ref> x@112@01 y@113@01 z@114@01) zs1@59@01)
      (not (Set_in (inv_0_2<Ref> x@112@01 y@113@01 z@114@01) zs1@59@01))))))
(assert (or
  (Set_in (inv_0_1<Ref> x@112@01 y@113@01 z@114@01) ys1@48@01)
  (not (Set_in (inv_0_1<Ref> x@112@01 y@113@01 z@114@01) ys1@48@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_0_0<Ref> x@112@01 y@113@01 z@114@01) xs1@37@01)
  (and
    (Set_in (inv_0_0<Ref> x@112@01 y@113@01 z@114@01) xs1@37@01)
    (=>
      (Set_in (inv_0_1<Ref> x@112@01 y@113@01 z@114@01) ys1@48@01)
      (and
        (Set_in (inv_0_1<Ref> x@112@01 y@113@01 z@114@01) ys1@48@01)
        (or
          (Set_in (inv_0_2<Ref> x@112@01 y@113@01 z@114@01) zs1@59@01)
          (not (Set_in (inv_0_2<Ref> x@112@01 y@113@01 z@114@01) zs1@59@01)))))
    (or
      (Set_in (inv_0_1<Ref> x@112@01 y@113@01 z@114@01) ys1@48@01)
      (not (Set_in (inv_0_1<Ref> x@112@01 y@113@01 z@114@01) ys1@48@01))))))
(assert (or
  (Set_in (inv_0_0<Ref> x@112@01 y@113@01 z@114@01) xs1@37@01)
  (not (Set_in (inv_0_0<Ref> x@112@01 y@113@01 z@114@01) xs1@37@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 27 | !(inv_1_0[Ref](x@112@01, y@113@01, z@114@01) in xs2@38@01 && inv_1_1[Ref](x@112@01, y@113@01, z@114@01) in ys2@49@01 && inv_1_2[Ref](x@112@01, y@113@01, z@114@01) in zs2@60@01)]
(assert (not
  (and
    (Set_in (inv_1_0<Ref> x@112@01 y@113@01 z@114@01) xs2@38@01)
    (and
      (Set_in (inv_1_1<Ref> x@112@01 y@113@01 z@114@01) ys2@49@01)
      (Set_in (inv_1_2<Ref> x@112@01 y@113@01 z@114@01) zs2@60@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (=
    ($PSF.perm_p (as pm@115@01  $PPM) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    (ite
      (and
        (and (img@83@01 x y z) (img@85@01 x y z) (img@87@01 x y z))
        (and
          (Set_in (inv@82@01 x y z) xs@70@01)
          (and
            (Set_in (inv@84@01 x y z) ys@71@01)
            (Set_in (inv@86@01 x y z) zs@72@01))))
      q@73@01
      $Perm.No))
  :pattern (($PSF.perm_p (as pm@115@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resPrmSumDef4|)))
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (and
    ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    ($PSF.loc_p ($PSF.lookup_p $t@81@01 ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))))
  :pattern (($PSF.perm_p (as pm@115@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resTrgDef5|)))
(assert (=>
  (and
    (Set_in (inv_1_0<Ref> x@112@01 y@113@01 z@114@01) xs2@38@01)
    (and
      (Set_in (inv_1_1<Ref> x@112@01 y@113@01 z@114@01) ys2@49@01)
      (Set_in (inv_1_2<Ref> x@112@01 y@113@01 z@114@01) zs2@60@01)))
  (and
    (Set_in (inv_1_0<Ref> x@112@01 y@113@01 z@114@01) xs2@38@01)
    (Set_in (inv_1_1<Ref> x@112@01 y@113@01 z@114@01) ys2@49@01)
    (Set_in (inv_1_2<Ref> x@112@01 y@113@01 z@114@01) zs2@60@01)
    ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x@112@01)
        ($SortWrappers.$RefTo$Snap y@113@01))
      ($SortWrappers.$RefTo$Snap z@114@01))) ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x@112@01)
        ($SortWrappers.$RefTo$Snap y@113@01))
      ($SortWrappers.$RefTo$Snap z@114@01)))
    (=>
      (Set_in (inv_0_0<Ref> x@112@01 y@113@01 z@114@01) xs1@37@01)
      (and
        (Set_in (inv_0_0<Ref> x@112@01 y@113@01 z@114@01) xs1@37@01)
        (=>
          (Set_in (inv_0_1<Ref> x@112@01 y@113@01 z@114@01) ys1@48@01)
          (and
            (Set_in (inv_0_1<Ref> x@112@01 y@113@01 z@114@01) ys1@48@01)
            (or
              (Set_in (inv_0_2<Ref> x@112@01 y@113@01 z@114@01) zs1@59@01)
              (not (Set_in (inv_0_2<Ref> x@112@01 y@113@01 z@114@01) zs1@59@01)))))
        (or
          (Set_in (inv_0_1<Ref> x@112@01 y@113@01 z@114@01) ys1@48@01)
          (not (Set_in (inv_0_1<Ref> x@112@01 y@113@01 z@114@01) ys1@48@01)))))
    (or
      (Set_in (inv_0_0<Ref> x@112@01 y@113@01 z@114@01) xs1@37@01)
      (not (Set_in (inv_0_0<Ref> x@112@01 y@113@01 z@114@01) xs1@37@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in (inv_1_0<Ref> x@112@01 y@113@01 z@114@01) xs2@38@01)
      (and
        (Set_in (inv_1_1<Ref> x@112@01 y@113@01 z@114@01) ys2@49@01)
        (Set_in (inv_1_2<Ref> x@112@01 y@113@01 z@114@01) zs2@60@01))))
  (and
    (Set_in (inv_1_0<Ref> x@112@01 y@113@01 z@114@01) xs2@38@01)
    (and
      (Set_in (inv_1_1<Ref> x@112@01 y@113@01 z@114@01) ys2@49@01)
      (Set_in (inv_1_2<Ref> x@112@01 y@113@01 z@114@01) zs2@60@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (=
    ($PSF.perm_p (as pm@115@01  $PPM) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    (ite
      (and
        (and (img@83@01 x y z) (img@85@01 x y z) (img@87@01 x y z))
        (and
          (Set_in (inv@82@01 x y z) xs@70@01)
          (and
            (Set_in (inv@84@01 x y z) ys@71@01)
            (Set_in (inv@86@01 x y z) zs@72@01))))
      q@73@01
      $Perm.No))
  :pattern (($PSF.perm_p (as pm@115@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resPrmSumDef4|)))
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (and
    ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    ($PSF.loc_p ($PSF.lookup_p $t@81@01 ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))))
  :pattern (($PSF.perm_p (as pm@115@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resTrgDef5|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@112@01 $Ref) (y@113@01 $Ref) (z@114@01 $Ref)) (!
  (and
    (=>
      (Set_in (inv_1_0<Ref> x@112@01 y@113@01 z@114@01) xs2@38@01)
      (and
        (Set_in (inv_1_0<Ref> x@112@01 y@113@01 z@114@01) xs2@38@01)
        (or
          (Set_in (inv_1_1<Ref> x@112@01 y@113@01 z@114@01) ys2@49@01)
          (not (Set_in (inv_1_1<Ref> x@112@01 y@113@01 z@114@01) ys2@49@01)))))
    (or
      (Set_in (inv_1_0<Ref> x@112@01 y@113@01 z@114@01) xs2@38@01)
      (not (Set_in (inv_1_0<Ref> x@112@01 y@113@01 z@114@01) xs2@38@01)))
    (=>
      (and
        (Set_in (inv_1_0<Ref> x@112@01 y@113@01 z@114@01) xs2@38@01)
        (and
          (Set_in (inv_1_1<Ref> x@112@01 y@113@01 z@114@01) ys2@49@01)
          (Set_in (inv_1_2<Ref> x@112@01 y@113@01 z@114@01) zs2@60@01)))
      (and
        (Set_in (inv_1_0<Ref> x@112@01 y@113@01 z@114@01) xs2@38@01)
        (Set_in (inv_1_1<Ref> x@112@01 y@113@01 z@114@01) ys2@49@01)
        (Set_in (inv_1_2<Ref> x@112@01 y@113@01 z@114@01) zs2@60@01)
        ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap x@112@01)
            ($SortWrappers.$RefTo$Snap y@113@01))
          ($SortWrappers.$RefTo$Snap z@114@01))) ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap x@112@01)
            ($SortWrappers.$RefTo$Snap y@113@01))
          ($SortWrappers.$RefTo$Snap z@114@01)))
        (=>
          (Set_in (inv_0_0<Ref> x@112@01 y@113@01 z@114@01) xs1@37@01)
          (and
            (Set_in (inv_0_0<Ref> x@112@01 y@113@01 z@114@01) xs1@37@01)
            (=>
              (Set_in (inv_0_1<Ref> x@112@01 y@113@01 z@114@01) ys1@48@01)
              (and
                (Set_in (inv_0_1<Ref> x@112@01 y@113@01 z@114@01) ys1@48@01)
                (or
                  (Set_in (inv_0_2<Ref> x@112@01 y@113@01 z@114@01) zs1@59@01)
                  (not
                    (Set_in (inv_0_2<Ref> x@112@01 y@113@01 z@114@01) zs1@59@01)))))
            (or
              (Set_in (inv_0_1<Ref> x@112@01 y@113@01 z@114@01) ys1@48@01)
              (not (Set_in (inv_0_1<Ref> x@112@01 y@113@01 z@114@01) ys1@48@01)))))
        (or
          (Set_in (inv_0_0<Ref> x@112@01 y@113@01 z@114@01) xs1@37@01)
          (not (Set_in (inv_0_0<Ref> x@112@01 y@113@01 z@114@01) xs1@37@01)))))
    (or
      (not
        (and
          (Set_in (inv_1_0<Ref> x@112@01 y@113@01 z@114@01) xs2@38@01)
          (and
            (Set_in (inv_1_1<Ref> x@112@01 y@113@01 z@114@01) ys2@49@01)
            (Set_in (inv_1_2<Ref> x@112@01 y@113@01 z@114@01) zs2@60@01))))
      (and
        (Set_in (inv_1_0<Ref> x@112@01 y@113@01 z@114@01) xs2@38@01)
        (and
          (Set_in (inv_1_1<Ref> x@112@01 y@113@01 z@114@01) ys2@49@01)
          (Set_in (inv_1_2<Ref> x@112@01 y@113@01 z@114@01) zs2@60@01)))))
  :pattern ((inv_1_0<Ref> x@112@01 y@113@01 z@114@01) (inv_1_1<Ref> x@112@01 y@113@01 z@114@01) (inv_1_2<Ref> x@112@01 y@113@01 z@114@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@21@9@21@122-aux|)))
(assert (forall ((x@112@01 $Ref) (y@113@01 $Ref) (z@114@01 $Ref)) (!
  (=>
    (and
      (Set_in (inv_1_0<Ref> x@112@01 y@113@01 z@114@01) xs2@38@01)
      (and
        (Set_in (inv_1_1<Ref> x@112@01 y@113@01 z@114@01) ys2@49@01)
        (Set_in (inv_1_2<Ref> x@112@01 y@113@01 z@114@01) zs2@60@01)))
    (>=
      ($PSF.perm_p (as pm@115@01  $PPM) ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap x@112@01)
          ($SortWrappers.$RefTo$Snap y@113@01))
        ($SortWrappers.$RefTo$Snap z@114@01)))
      (__iar__assume_helper_1<Perm> (and
        (Set_in (inv_0_0<Ref> x@112@01 y@113@01 z@114@01) xs1@37@01)
        (and
          (Set_in (inv_0_1<Ref> x@112@01 y@113@01 z@114@01) ys1@48@01)
          (Set_in (inv_0_2<Ref> x@112@01 y@113@01 z@114@01) zs1@59@01))) q@73@01 q@73@01)))
  :pattern ((inv_1_0<Ref> x@112@01 y@113@01 z@114@01) (inv_1_1<Ref> x@112@01 y@113@01 z@114@01) (inv_1_2<Ref> x@112@01 y@113@01 z@114@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@21@9@21@122|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x3: Ref, y3: Ref, z3: Ref ::
;     { p(x3, y3, z3) }
;     (x3 in xs3) && ((y3 in ys3) && (z3 in zs3)) ==>
;     inv_2_0(x3, y3, z3) == x3 && inv_2_1(x3, y3, z3) == y3 &&
;     inv_2_2(x3, y3, z3) == z3)
(declare-const $t@116@01 $Snap)
(assert (= $t@116@01 $Snap.unit))
; [eval] (forall x3: Ref, y3: Ref, z3: Ref :: { p(x3, y3, z3) } (x3 in xs3) && ((y3 in ys3) && (z3 in zs3)) ==> inv_2_0(x3, y3, z3) == x3 && inv_2_1(x3, y3, z3) == y3 && inv_2_2(x3, y3, z3) == z3)
(declare-const x3@117@01 $Ref)
(declare-const y3@118@01 $Ref)
(declare-const z3@119@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x3 in xs3) && ((y3 in ys3) && (z3 in zs3)) ==> inv_2_0(x3, y3, z3) == x3 && inv_2_1(x3, y3, z3) == y3 && inv_2_2(x3, y3, z3) == z3
; [eval] (x3 in xs3) && ((y3 in ys3) && (z3 in zs3))
; [eval] (x3 in xs3)
(push) ; 4
; [then-branch: 33 | !(x3@117@01 in xs3@39@01) | live]
; [else-branch: 33 | x3@117@01 in xs3@39@01 | live]
(push) ; 5
; [then-branch: 33 | !(x3@117@01 in xs3@39@01)]
(assert (not (Set_in x3@117@01 xs3@39@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 33 | x3@117@01 in xs3@39@01]
(assert (Set_in x3@117@01 xs3@39@01))
; [eval] (y3 in ys3)
(push) ; 6
; [then-branch: 34 | !(y3@118@01 in ys3@50@01) | live]
; [else-branch: 34 | y3@118@01 in ys3@50@01 | live]
(push) ; 7
; [then-branch: 34 | !(y3@118@01 in ys3@50@01)]
(assert (not (Set_in y3@118@01 ys3@50@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 34 | y3@118@01 in ys3@50@01]
(assert (Set_in y3@118@01 ys3@50@01))
; [eval] (z3 in zs3)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (Set_in y3@118@01 ys3@50@01) (not (Set_in y3@118@01 ys3@50@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in x3@117@01 xs3@39@01)
  (and
    (Set_in x3@117@01 xs3@39@01)
    (or (Set_in y3@118@01 ys3@50@01) (not (Set_in y3@118@01 ys3@50@01))))))
(assert (or (Set_in x3@117@01 xs3@39@01) (not (Set_in x3@117@01 xs3@39@01))))
(push) ; 4
; [then-branch: 35 | x3@117@01 in xs3@39@01 && y3@118@01 in ys3@50@01 && z3@119@01 in zs3@61@01 | live]
; [else-branch: 35 | !(x3@117@01 in xs3@39@01 && y3@118@01 in ys3@50@01 && z3@119@01 in zs3@61@01) | live]
(push) ; 5
; [then-branch: 35 | x3@117@01 in xs3@39@01 && y3@118@01 in ys3@50@01 && z3@119@01 in zs3@61@01]
(assert (and
  (Set_in x3@117@01 xs3@39@01)
  (and (Set_in y3@118@01 ys3@50@01) (Set_in z3@119@01 zs3@61@01))))
; [eval] inv_2_0(x3, y3, z3) == x3 && inv_2_1(x3, y3, z3) == y3 && inv_2_2(x3, y3, z3) == z3
; [eval] inv_2_0(x3, y3, z3) == x3
; [eval] inv_2_0(x3, y3, z3)
(push) ; 6
; [then-branch: 36 | inv_2_0[Ref](x3@117@01, y3@118@01, z3@119@01) != x3@117@01 | live]
; [else-branch: 36 | inv_2_0[Ref](x3@117@01, y3@118@01, z3@119@01) == x3@117@01 | live]
(push) ; 7
; [then-branch: 36 | inv_2_0[Ref](x3@117@01, y3@118@01, z3@119@01) != x3@117@01]
(assert (not (= (inv_2_0<Ref> x3@117@01 y3@118@01 z3@119@01) x3@117@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 36 | inv_2_0[Ref](x3@117@01, y3@118@01, z3@119@01) == x3@117@01]
(assert (= (inv_2_0<Ref> x3@117@01 y3@118@01 z3@119@01) x3@117@01))
; [eval] inv_2_1(x3, y3, z3) == y3
; [eval] inv_2_1(x3, y3, z3)
(push) ; 8
; [then-branch: 37 | inv_2_1[Ref](x3@117@01, y3@118@01, z3@119@01) != y3@118@01 | live]
; [else-branch: 37 | inv_2_1[Ref](x3@117@01, y3@118@01, z3@119@01) == y3@118@01 | live]
(push) ; 9
; [then-branch: 37 | inv_2_1[Ref](x3@117@01, y3@118@01, z3@119@01) != y3@118@01]
(assert (not (= (inv_2_1<Ref> x3@117@01 y3@118@01 z3@119@01) y3@118@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 37 | inv_2_1[Ref](x3@117@01, y3@118@01, z3@119@01) == y3@118@01]
(assert (= (inv_2_1<Ref> x3@117@01 y3@118@01 z3@119@01) y3@118@01))
; [eval] inv_2_2(x3, y3, z3) == z3
; [eval] inv_2_2(x3, y3, z3)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or
  (= (inv_2_1<Ref> x3@117@01 y3@118@01 z3@119@01) y3@118@01)
  (not (= (inv_2_1<Ref> x3@117@01 y3@118@01 z3@119@01) y3@118@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (= (inv_2_0<Ref> x3@117@01 y3@118@01 z3@119@01) x3@117@01)
  (and
    (= (inv_2_0<Ref> x3@117@01 y3@118@01 z3@119@01) x3@117@01)
    (or
      (= (inv_2_1<Ref> x3@117@01 y3@118@01 z3@119@01) y3@118@01)
      (not (= (inv_2_1<Ref> x3@117@01 y3@118@01 z3@119@01) y3@118@01))))))
(assert (or
  (= (inv_2_0<Ref> x3@117@01 y3@118@01 z3@119@01) x3@117@01)
  (not (= (inv_2_0<Ref> x3@117@01 y3@118@01 z3@119@01) x3@117@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 35 | !(x3@117@01 in xs3@39@01 && y3@118@01 in ys3@50@01 && z3@119@01 in zs3@61@01)]
(assert (not
  (and
    (Set_in x3@117@01 xs3@39@01)
    (and (Set_in y3@118@01 ys3@50@01) (Set_in z3@119@01 zs3@61@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Set_in x3@117@01 xs3@39@01)
    (and (Set_in y3@118@01 ys3@50@01) (Set_in z3@119@01 zs3@61@01)))
  (and
    (Set_in x3@117@01 xs3@39@01)
    (Set_in y3@118@01 ys3@50@01)
    (Set_in z3@119@01 zs3@61@01)
    (=>
      (= (inv_2_0<Ref> x3@117@01 y3@118@01 z3@119@01) x3@117@01)
      (and
        (= (inv_2_0<Ref> x3@117@01 y3@118@01 z3@119@01) x3@117@01)
        (or
          (= (inv_2_1<Ref> x3@117@01 y3@118@01 z3@119@01) y3@118@01)
          (not (= (inv_2_1<Ref> x3@117@01 y3@118@01 z3@119@01) y3@118@01)))))
    (or
      (= (inv_2_0<Ref> x3@117@01 y3@118@01 z3@119@01) x3@117@01)
      (not (= (inv_2_0<Ref> x3@117@01 y3@118@01 z3@119@01) x3@117@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in x3@117@01 xs3@39@01)
      (and (Set_in y3@118@01 ys3@50@01) (Set_in z3@119@01 zs3@61@01))))
  (and
    (Set_in x3@117@01 xs3@39@01)
    (and (Set_in y3@118@01 ys3@50@01) (Set_in z3@119@01 zs3@61@01)))))
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x3@117@01 $Ref) (y3@118@01 $Ref) (z3@119@01 $Ref)) (!
  (and
    (=>
      (Set_in x3@117@01 xs3@39@01)
      (and
        (Set_in x3@117@01 xs3@39@01)
        (or (Set_in y3@118@01 ys3@50@01) (not (Set_in y3@118@01 ys3@50@01)))))
    (or (Set_in x3@117@01 xs3@39@01) (not (Set_in x3@117@01 xs3@39@01)))
    (=>
      (and
        (Set_in x3@117@01 xs3@39@01)
        (and (Set_in y3@118@01 ys3@50@01) (Set_in z3@119@01 zs3@61@01)))
      (and
        (Set_in x3@117@01 xs3@39@01)
        (Set_in y3@118@01 ys3@50@01)
        (Set_in z3@119@01 zs3@61@01)
        (=>
          (= (inv_2_0<Ref> x3@117@01 y3@118@01 z3@119@01) x3@117@01)
          (and
            (= (inv_2_0<Ref> x3@117@01 y3@118@01 z3@119@01) x3@117@01)
            (or
              (= (inv_2_1<Ref> x3@117@01 y3@118@01 z3@119@01) y3@118@01)
              (not (= (inv_2_1<Ref> x3@117@01 y3@118@01 z3@119@01) y3@118@01)))))
        (or
          (= (inv_2_0<Ref> x3@117@01 y3@118@01 z3@119@01) x3@117@01)
          (not (= (inv_2_0<Ref> x3@117@01 y3@118@01 z3@119@01) x3@117@01)))))
    (or
      (not
        (and
          (Set_in x3@117@01 xs3@39@01)
          (and (Set_in y3@118@01 ys3@50@01) (Set_in z3@119@01 zs3@61@01))))
      (and
        (Set_in x3@117@01 xs3@39@01)
        (and (Set_in y3@118@01 ys3@50@01) (Set_in z3@119@01 zs3@61@01)))))
  :pattern (($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap x3@117@01)
      ($SortWrappers.$RefTo$Snap y3@118@01))
    ($SortWrappers.$RefTo$Snap z3@119@01))) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap x3@117@01)
      ($SortWrappers.$RefTo$Snap y3@118@01))
    ($SortWrappers.$RefTo$Snap z3@119@01))))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@22@9@22@122-aux|)))
(assert (forall ((x3@117@01 $Ref) (y3@118@01 $Ref) (z3@119@01 $Ref)) (!
  (=>
    (and
      (Set_in x3@117@01 xs3@39@01)
      (and (Set_in y3@118@01 ys3@50@01) (Set_in z3@119@01 zs3@61@01)))
    (and
      (= (inv_2_0<Ref> x3@117@01 y3@118@01 z3@119@01) x3@117@01)
      (and
        (= (inv_2_1<Ref> x3@117@01 y3@118@01 z3@119@01) y3@118@01)
        (= (inv_2_2<Ref> x3@117@01 y3@118@01 z3@119@01) z3@119@01))))
  :pattern (($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap x3@117@01)
      ($SortWrappers.$RefTo$Snap y3@118@01))
    ($SortWrappers.$RefTo$Snap z3@119@01))) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap x3@117@01)
      ($SortWrappers.$RefTo$Snap y3@118@01))
    ($SortWrappers.$RefTo$Snap z3@119@01))))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@22@9@22@122|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x: Ref, y: Ref, z: Ref ::
;     { inv_2_0(x, y, z), inv_2_1(x, y, z), inv_2_2(x, y, z) }
;     (inv_2_0(x, y, z) in xs3) &&
;     ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) ==>
;     inv_2_0(x, y, z) == x && inv_2_1(x, y, z) == y && inv_2_2(x, y, z) == z)
(declare-const $t@120@01 $Snap)
(assert (= $t@120@01 $Snap.unit))
; [eval] (forall x: Ref, y: Ref, z: Ref :: { inv_2_0(x, y, z), inv_2_1(x, y, z), inv_2_2(x, y, z) } (inv_2_0(x, y, z) in xs3) && ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) ==> inv_2_0(x, y, z) == x && inv_2_1(x, y, z) == y && inv_2_2(x, y, z) == z)
(declare-const x@121@01 $Ref)
(declare-const y@122@01 $Ref)
(declare-const z@123@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (inv_2_0(x, y, z) in xs3) && ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) ==> inv_2_0(x, y, z) == x && inv_2_1(x, y, z) == y && inv_2_2(x, y, z) == z
; [eval] (inv_2_0(x, y, z) in xs3) && ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3))
; [eval] (inv_2_0(x, y, z) in xs3)
; [eval] inv_2_0(x, y, z)
(push) ; 4
; [then-branch: 38 | !(inv_2_0[Ref](x@121@01, y@122@01, z@123@01) in xs3@39@01) | live]
; [else-branch: 38 | inv_2_0[Ref](x@121@01, y@122@01, z@123@01) in xs3@39@01 | live]
(push) ; 5
; [then-branch: 38 | !(inv_2_0[Ref](x@121@01, y@122@01, z@123@01) in xs3@39@01)]
(assert (not (Set_in (inv_2_0<Ref> x@121@01 y@122@01 z@123@01) xs3@39@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 38 | inv_2_0[Ref](x@121@01, y@122@01, z@123@01) in xs3@39@01]
(assert (Set_in (inv_2_0<Ref> x@121@01 y@122@01 z@123@01) xs3@39@01))
; [eval] (inv_2_1(x, y, z) in ys3)
; [eval] inv_2_1(x, y, z)
(push) ; 6
; [then-branch: 39 | !(inv_2_1[Ref](x@121@01, y@122@01, z@123@01) in ys3@50@01) | live]
; [else-branch: 39 | inv_2_1[Ref](x@121@01, y@122@01, z@123@01) in ys3@50@01 | live]
(push) ; 7
; [then-branch: 39 | !(inv_2_1[Ref](x@121@01, y@122@01, z@123@01) in ys3@50@01)]
(assert (not (Set_in (inv_2_1<Ref> x@121@01 y@122@01 z@123@01) ys3@50@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 39 | inv_2_1[Ref](x@121@01, y@122@01, z@123@01) in ys3@50@01]
(assert (Set_in (inv_2_1<Ref> x@121@01 y@122@01 z@123@01) ys3@50@01))
; [eval] (inv_2_2(x, y, z) in zs3)
; [eval] inv_2_2(x, y, z)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_2_1<Ref> x@121@01 y@122@01 z@123@01) ys3@50@01)
  (not (Set_in (inv_2_1<Ref> x@121@01 y@122@01 z@123@01) ys3@50@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_2_0<Ref> x@121@01 y@122@01 z@123@01) xs3@39@01)
  (and
    (Set_in (inv_2_0<Ref> x@121@01 y@122@01 z@123@01) xs3@39@01)
    (or
      (Set_in (inv_2_1<Ref> x@121@01 y@122@01 z@123@01) ys3@50@01)
      (not (Set_in (inv_2_1<Ref> x@121@01 y@122@01 z@123@01) ys3@50@01))))))
(assert (or
  (Set_in (inv_2_0<Ref> x@121@01 y@122@01 z@123@01) xs3@39@01)
  (not (Set_in (inv_2_0<Ref> x@121@01 y@122@01 z@123@01) xs3@39@01))))
(push) ; 4
; [then-branch: 40 | inv_2_0[Ref](x@121@01, y@122@01, z@123@01) in xs3@39@01 && inv_2_1[Ref](x@121@01, y@122@01, z@123@01) in ys3@50@01 && inv_2_2[Ref](x@121@01, y@122@01, z@123@01) in zs3@61@01 | live]
; [else-branch: 40 | !(inv_2_0[Ref](x@121@01, y@122@01, z@123@01) in xs3@39@01 && inv_2_1[Ref](x@121@01, y@122@01, z@123@01) in ys3@50@01 && inv_2_2[Ref](x@121@01, y@122@01, z@123@01) in zs3@61@01) | live]
(push) ; 5
; [then-branch: 40 | inv_2_0[Ref](x@121@01, y@122@01, z@123@01) in xs3@39@01 && inv_2_1[Ref](x@121@01, y@122@01, z@123@01) in ys3@50@01 && inv_2_2[Ref](x@121@01, y@122@01, z@123@01) in zs3@61@01]
(assert (and
  (Set_in (inv_2_0<Ref> x@121@01 y@122@01 z@123@01) xs3@39@01)
  (and
    (Set_in (inv_2_1<Ref> x@121@01 y@122@01 z@123@01) ys3@50@01)
    (Set_in (inv_2_2<Ref> x@121@01 y@122@01 z@123@01) zs3@61@01))))
; [eval] inv_2_0(x, y, z) == x && inv_2_1(x, y, z) == y && inv_2_2(x, y, z) == z
; [eval] inv_2_0(x, y, z) == x
; [eval] inv_2_0(x, y, z)
(push) ; 6
; [then-branch: 41 | inv_2_0[Ref](x@121@01, y@122@01, z@123@01) != x@121@01 | live]
; [else-branch: 41 | inv_2_0[Ref](x@121@01, y@122@01, z@123@01) == x@121@01 | live]
(push) ; 7
; [then-branch: 41 | inv_2_0[Ref](x@121@01, y@122@01, z@123@01) != x@121@01]
(assert (not (= (inv_2_0<Ref> x@121@01 y@122@01 z@123@01) x@121@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 41 | inv_2_0[Ref](x@121@01, y@122@01, z@123@01) == x@121@01]
(assert (= (inv_2_0<Ref> x@121@01 y@122@01 z@123@01) x@121@01))
; [eval] inv_2_1(x, y, z) == y
; [eval] inv_2_1(x, y, z)
(push) ; 8
; [then-branch: 42 | inv_2_1[Ref](x@121@01, y@122@01, z@123@01) != y@122@01 | live]
; [else-branch: 42 | inv_2_1[Ref](x@121@01, y@122@01, z@123@01) == y@122@01 | live]
(push) ; 9
; [then-branch: 42 | inv_2_1[Ref](x@121@01, y@122@01, z@123@01) != y@122@01]
(assert (not (= (inv_2_1<Ref> x@121@01 y@122@01 z@123@01) y@122@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 42 | inv_2_1[Ref](x@121@01, y@122@01, z@123@01) == y@122@01]
(assert (= (inv_2_1<Ref> x@121@01 y@122@01 z@123@01) y@122@01))
; [eval] inv_2_2(x, y, z) == z
; [eval] inv_2_2(x, y, z)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or
  (= (inv_2_1<Ref> x@121@01 y@122@01 z@123@01) y@122@01)
  (not (= (inv_2_1<Ref> x@121@01 y@122@01 z@123@01) y@122@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (= (inv_2_0<Ref> x@121@01 y@122@01 z@123@01) x@121@01)
  (and
    (= (inv_2_0<Ref> x@121@01 y@122@01 z@123@01) x@121@01)
    (or
      (= (inv_2_1<Ref> x@121@01 y@122@01 z@123@01) y@122@01)
      (not (= (inv_2_1<Ref> x@121@01 y@122@01 z@123@01) y@122@01))))))
(assert (or
  (= (inv_2_0<Ref> x@121@01 y@122@01 z@123@01) x@121@01)
  (not (= (inv_2_0<Ref> x@121@01 y@122@01 z@123@01) x@121@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 40 | !(inv_2_0[Ref](x@121@01, y@122@01, z@123@01) in xs3@39@01 && inv_2_1[Ref](x@121@01, y@122@01, z@123@01) in ys3@50@01 && inv_2_2[Ref](x@121@01, y@122@01, z@123@01) in zs3@61@01)]
(assert (not
  (and
    (Set_in (inv_2_0<Ref> x@121@01 y@122@01 z@123@01) xs3@39@01)
    (and
      (Set_in (inv_2_1<Ref> x@121@01 y@122@01 z@123@01) ys3@50@01)
      (Set_in (inv_2_2<Ref> x@121@01 y@122@01 z@123@01) zs3@61@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Set_in (inv_2_0<Ref> x@121@01 y@122@01 z@123@01) xs3@39@01)
    (and
      (Set_in (inv_2_1<Ref> x@121@01 y@122@01 z@123@01) ys3@50@01)
      (Set_in (inv_2_2<Ref> x@121@01 y@122@01 z@123@01) zs3@61@01)))
  (and
    (Set_in (inv_2_0<Ref> x@121@01 y@122@01 z@123@01) xs3@39@01)
    (Set_in (inv_2_1<Ref> x@121@01 y@122@01 z@123@01) ys3@50@01)
    (Set_in (inv_2_2<Ref> x@121@01 y@122@01 z@123@01) zs3@61@01)
    (=>
      (= (inv_2_0<Ref> x@121@01 y@122@01 z@123@01) x@121@01)
      (and
        (= (inv_2_0<Ref> x@121@01 y@122@01 z@123@01) x@121@01)
        (or
          (= (inv_2_1<Ref> x@121@01 y@122@01 z@123@01) y@122@01)
          (not (= (inv_2_1<Ref> x@121@01 y@122@01 z@123@01) y@122@01)))))
    (or
      (= (inv_2_0<Ref> x@121@01 y@122@01 z@123@01) x@121@01)
      (not (= (inv_2_0<Ref> x@121@01 y@122@01 z@123@01) x@121@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in (inv_2_0<Ref> x@121@01 y@122@01 z@123@01) xs3@39@01)
      (and
        (Set_in (inv_2_1<Ref> x@121@01 y@122@01 z@123@01) ys3@50@01)
        (Set_in (inv_2_2<Ref> x@121@01 y@122@01 z@123@01) zs3@61@01))))
  (and
    (Set_in (inv_2_0<Ref> x@121@01 y@122@01 z@123@01) xs3@39@01)
    (and
      (Set_in (inv_2_1<Ref> x@121@01 y@122@01 z@123@01) ys3@50@01)
      (Set_in (inv_2_2<Ref> x@121@01 y@122@01 z@123@01) zs3@61@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@121@01 $Ref) (y@122@01 $Ref) (z@123@01 $Ref)) (!
  (and
    (=>
      (Set_in (inv_2_0<Ref> x@121@01 y@122@01 z@123@01) xs3@39@01)
      (and
        (Set_in (inv_2_0<Ref> x@121@01 y@122@01 z@123@01) xs3@39@01)
        (or
          (Set_in (inv_2_1<Ref> x@121@01 y@122@01 z@123@01) ys3@50@01)
          (not (Set_in (inv_2_1<Ref> x@121@01 y@122@01 z@123@01) ys3@50@01)))))
    (or
      (Set_in (inv_2_0<Ref> x@121@01 y@122@01 z@123@01) xs3@39@01)
      (not (Set_in (inv_2_0<Ref> x@121@01 y@122@01 z@123@01) xs3@39@01)))
    (=>
      (and
        (Set_in (inv_2_0<Ref> x@121@01 y@122@01 z@123@01) xs3@39@01)
        (and
          (Set_in (inv_2_1<Ref> x@121@01 y@122@01 z@123@01) ys3@50@01)
          (Set_in (inv_2_2<Ref> x@121@01 y@122@01 z@123@01) zs3@61@01)))
      (and
        (Set_in (inv_2_0<Ref> x@121@01 y@122@01 z@123@01) xs3@39@01)
        (Set_in (inv_2_1<Ref> x@121@01 y@122@01 z@123@01) ys3@50@01)
        (Set_in (inv_2_2<Ref> x@121@01 y@122@01 z@123@01) zs3@61@01)
        (=>
          (= (inv_2_0<Ref> x@121@01 y@122@01 z@123@01) x@121@01)
          (and
            (= (inv_2_0<Ref> x@121@01 y@122@01 z@123@01) x@121@01)
            (or
              (= (inv_2_1<Ref> x@121@01 y@122@01 z@123@01) y@122@01)
              (not (= (inv_2_1<Ref> x@121@01 y@122@01 z@123@01) y@122@01)))))
        (or
          (= (inv_2_0<Ref> x@121@01 y@122@01 z@123@01) x@121@01)
          (not (= (inv_2_0<Ref> x@121@01 y@122@01 z@123@01) x@121@01)))))
    (or
      (not
        (and
          (Set_in (inv_2_0<Ref> x@121@01 y@122@01 z@123@01) xs3@39@01)
          (and
            (Set_in (inv_2_1<Ref> x@121@01 y@122@01 z@123@01) ys3@50@01)
            (Set_in (inv_2_2<Ref> x@121@01 y@122@01 z@123@01) zs3@61@01))))
      (and
        (Set_in (inv_2_0<Ref> x@121@01 y@122@01 z@123@01) xs3@39@01)
        (and
          (Set_in (inv_2_1<Ref> x@121@01 y@122@01 z@123@01) ys3@50@01)
          (Set_in (inv_2_2<Ref> x@121@01 y@122@01 z@123@01) zs3@61@01)))))
  :pattern ((inv_2_0<Ref> x@121@01 y@122@01 z@123@01) (inv_2_1<Ref> x@121@01 y@122@01 z@123@01) (inv_2_2<Ref> x@121@01 y@122@01 z@123@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@22@9@22@122-aux|)))
(assert (forall ((x@121@01 $Ref) (y@122@01 $Ref) (z@123@01 $Ref)) (!
  (=>
    (and
      (Set_in (inv_2_0<Ref> x@121@01 y@122@01 z@123@01) xs3@39@01)
      (and
        (Set_in (inv_2_1<Ref> x@121@01 y@122@01 z@123@01) ys3@50@01)
        (Set_in (inv_2_2<Ref> x@121@01 y@122@01 z@123@01) zs3@61@01)))
    (and
      (= (inv_2_0<Ref> x@121@01 y@122@01 z@123@01) x@121@01)
      (and
        (= (inv_2_1<Ref> x@121@01 y@122@01 z@123@01) y@122@01)
        (= (inv_2_2<Ref> x@121@01 y@122@01 z@123@01) z@123@01))))
  :pattern ((inv_2_0<Ref> x@121@01 y@122@01 z@123@01) (inv_2_1<Ref> x@121@01 y@122@01 z@123@01) (inv_2_2<Ref> x@121@01 y@122@01 z@123@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@22@9@22@122|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x: Ref, y: Ref, z: Ref ::
;     { inv_2_0(x, y, z), inv_2_1(x, y, z), inv_2_2(x, y, z) }
;     (inv_2_0(x, y, z) in xs3) &&
;     ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) ==>
;     perm(p(x, y, z)) >=
;     __iar__assume_helper_2((inv_0_0(x, y, z) in xs1) &&
;     ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) &&
;     (x == x && y == y && z == z), (inv_1_0(x, y, z) in xs2) &&
;     ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) &&
;     (x == x && y == y && z == z), q, q, q))
(declare-const $t@124@01 $Snap)
(assert (= $t@124@01 $Snap.unit))
; [eval] (forall x: Ref, y: Ref, z: Ref :: { inv_2_0(x, y, z), inv_2_1(x, y, z), inv_2_2(x, y, z) } (inv_2_0(x, y, z) in xs3) && ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) ==> perm(p(x, y, z)) >= __iar__assume_helper_2((inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) && (x == x && y == y && z == z), (inv_1_0(x, y, z) in xs2) && ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) && (x == x && y == y && z == z), q, q, q))
(declare-const x@125@01 $Ref)
(declare-const y@126@01 $Ref)
(declare-const z@127@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (inv_2_0(x, y, z) in xs3) && ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) ==> perm(p(x, y, z)) >= __iar__assume_helper_2((inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) && (x == x && y == y && z == z), (inv_1_0(x, y, z) in xs2) && ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) && (x == x && y == y && z == z), q, q, q)
; [eval] (inv_2_0(x, y, z) in xs3) && ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3))
; [eval] (inv_2_0(x, y, z) in xs3)
; [eval] inv_2_0(x, y, z)
(push) ; 4
; [then-branch: 43 | !(inv_2_0[Ref](x@125@01, y@126@01, z@127@01) in xs3@39@01) | live]
; [else-branch: 43 | inv_2_0[Ref](x@125@01, y@126@01, z@127@01) in xs3@39@01 | live]
(push) ; 5
; [then-branch: 43 | !(inv_2_0[Ref](x@125@01, y@126@01, z@127@01) in xs3@39@01)]
(assert (not (Set_in (inv_2_0<Ref> x@125@01 y@126@01 z@127@01) xs3@39@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 43 | inv_2_0[Ref](x@125@01, y@126@01, z@127@01) in xs3@39@01]
(assert (Set_in (inv_2_0<Ref> x@125@01 y@126@01 z@127@01) xs3@39@01))
; [eval] (inv_2_1(x, y, z) in ys3)
; [eval] inv_2_1(x, y, z)
(push) ; 6
; [then-branch: 44 | !(inv_2_1[Ref](x@125@01, y@126@01, z@127@01) in ys3@50@01) | live]
; [else-branch: 44 | inv_2_1[Ref](x@125@01, y@126@01, z@127@01) in ys3@50@01 | live]
(push) ; 7
; [then-branch: 44 | !(inv_2_1[Ref](x@125@01, y@126@01, z@127@01) in ys3@50@01)]
(assert (not (Set_in (inv_2_1<Ref> x@125@01 y@126@01 z@127@01) ys3@50@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 44 | inv_2_1[Ref](x@125@01, y@126@01, z@127@01) in ys3@50@01]
(assert (Set_in (inv_2_1<Ref> x@125@01 y@126@01 z@127@01) ys3@50@01))
; [eval] (inv_2_2(x, y, z) in zs3)
; [eval] inv_2_2(x, y, z)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_2_1<Ref> x@125@01 y@126@01 z@127@01) ys3@50@01)
  (not (Set_in (inv_2_1<Ref> x@125@01 y@126@01 z@127@01) ys3@50@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_2_0<Ref> x@125@01 y@126@01 z@127@01) xs3@39@01)
  (and
    (Set_in (inv_2_0<Ref> x@125@01 y@126@01 z@127@01) xs3@39@01)
    (or
      (Set_in (inv_2_1<Ref> x@125@01 y@126@01 z@127@01) ys3@50@01)
      (not (Set_in (inv_2_1<Ref> x@125@01 y@126@01 z@127@01) ys3@50@01))))))
(assert (or
  (Set_in (inv_2_0<Ref> x@125@01 y@126@01 z@127@01) xs3@39@01)
  (not (Set_in (inv_2_0<Ref> x@125@01 y@126@01 z@127@01) xs3@39@01))))
(push) ; 4
; [then-branch: 45 | inv_2_0[Ref](x@125@01, y@126@01, z@127@01) in xs3@39@01 && inv_2_1[Ref](x@125@01, y@126@01, z@127@01) in ys3@50@01 && inv_2_2[Ref](x@125@01, y@126@01, z@127@01) in zs3@61@01 | live]
; [else-branch: 45 | !(inv_2_0[Ref](x@125@01, y@126@01, z@127@01) in xs3@39@01 && inv_2_1[Ref](x@125@01, y@126@01, z@127@01) in ys3@50@01 && inv_2_2[Ref](x@125@01, y@126@01, z@127@01) in zs3@61@01) | live]
(push) ; 5
; [then-branch: 45 | inv_2_0[Ref](x@125@01, y@126@01, z@127@01) in xs3@39@01 && inv_2_1[Ref](x@125@01, y@126@01, z@127@01) in ys3@50@01 && inv_2_2[Ref](x@125@01, y@126@01, z@127@01) in zs3@61@01]
(assert (and
  (Set_in (inv_2_0<Ref> x@125@01 y@126@01 z@127@01) xs3@39@01)
  (and
    (Set_in (inv_2_1<Ref> x@125@01 y@126@01 z@127@01) ys3@50@01)
    (Set_in (inv_2_2<Ref> x@125@01 y@126@01 z@127@01) zs3@61@01))))
; [eval] perm(p(x, y, z)) >= __iar__assume_helper_2((inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) && (x == x && y == y && z == z), (inv_1_0(x, y, z) in xs2) && ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) && (x == x && y == y && z == z), q, q, q)
; [eval] perm(p(x, y, z))
; Definitional axioms for snapshot map values
(declare-const pm@128@01 $PPM)
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (=
    ($PSF.perm_p (as pm@128@01  $PPM) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    (ite
      (and
        (and (img@83@01 x y z) (img@85@01 x y z) (img@87@01 x y z))
        (and
          (Set_in (inv@82@01 x y z) xs@70@01)
          (and
            (Set_in (inv@84@01 x y z) ys@71@01)
            (Set_in (inv@86@01 x y z) zs@72@01))))
      q@73@01
      $Perm.No))
  :pattern (($PSF.perm_p (as pm@128@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resPrmSumDef6|)))
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (and
    ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    ($PSF.loc_p ($PSF.lookup_p $t@81@01 ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))))
  :pattern (($PSF.perm_p (as pm@128@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resTrgDef7|)))
(assert ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x@125@01)
    ($SortWrappers.$RefTo$Snap y@126@01))
  ($SortWrappers.$RefTo$Snap z@127@01))) ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x@125@01)
    ($SortWrappers.$RefTo$Snap y@126@01))
  ($SortWrappers.$RefTo$Snap z@127@01))))
; [eval] __iar__assume_helper_2((inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) && (x == x && y == y && z == z), (inv_1_0(x, y, z) in xs2) && ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) && (x == x && y == y && z == z), q, q, q)
; [eval] (inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) && (x == x && y == y && z == z)
; [eval] (inv_0_0(x, y, z) in xs1)
; [eval] inv_0_0(x, y, z)
(push) ; 6
; [then-branch: 46 | !(inv_0_0[Ref](x@125@01, y@126@01, z@127@01) in xs1@37@01) | live]
; [else-branch: 46 | inv_0_0[Ref](x@125@01, y@126@01, z@127@01) in xs1@37@01 | live]
(push) ; 7
; [then-branch: 46 | !(inv_0_0[Ref](x@125@01, y@126@01, z@127@01) in xs1@37@01)]
(assert (not (Set_in (inv_0_0<Ref> x@125@01 y@126@01 z@127@01) xs1@37@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 46 | inv_0_0[Ref](x@125@01, y@126@01, z@127@01) in xs1@37@01]
(assert (Set_in (inv_0_0<Ref> x@125@01 y@126@01 z@127@01) xs1@37@01))
; [eval] (inv_0_1(x, y, z) in ys1)
; [eval] inv_0_1(x, y, z)
(push) ; 8
; [then-branch: 47 | !(inv_0_1[Ref](x@125@01, y@126@01, z@127@01) in ys1@48@01) | live]
; [else-branch: 47 | inv_0_1[Ref](x@125@01, y@126@01, z@127@01) in ys1@48@01 | live]
(push) ; 9
; [then-branch: 47 | !(inv_0_1[Ref](x@125@01, y@126@01, z@127@01) in ys1@48@01)]
(assert (not (Set_in (inv_0_1<Ref> x@125@01 y@126@01 z@127@01) ys1@48@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 47 | inv_0_1[Ref](x@125@01, y@126@01, z@127@01) in ys1@48@01]
(assert (Set_in (inv_0_1<Ref> x@125@01 y@126@01 z@127@01) ys1@48@01))
; [eval] (inv_0_2(x, y, z) in zs1)
; [eval] inv_0_2(x, y, z)
(push) ; 10
; [then-branch: 48 | !(inv_0_2[Ref](x@125@01, y@126@01, z@127@01) in zs1@59@01) | live]
; [else-branch: 48 | inv_0_2[Ref](x@125@01, y@126@01, z@127@01) in zs1@59@01 | live]
(push) ; 11
; [then-branch: 48 | !(inv_0_2[Ref](x@125@01, y@126@01, z@127@01) in zs1@59@01)]
(assert (not (Set_in (inv_0_2<Ref> x@125@01 y@126@01 z@127@01) zs1@59@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 48 | inv_0_2[Ref](x@125@01, y@126@01, z@127@01) in zs1@59@01]
(assert (Set_in (inv_0_2<Ref> x@125@01 y@126@01 z@127@01) zs1@59@01))
; [eval] x == x
(push) ; 12
; [then-branch: 49 | False | live]
; [else-branch: 49 | True | live]
(push) ; 13
; [then-branch: 49 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 49 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 50 | False | live]
; [else-branch: 50 | True | live]
(push) ; 15
; [then-branch: 50 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 50 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_0_2<Ref> x@125@01 y@126@01 z@127@01) zs1@59@01)
  (not (Set_in (inv_0_2<Ref> x@125@01 y@126@01 z@127@01) zs1@59@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_0_1<Ref> x@125@01 y@126@01 z@127@01) ys1@48@01)
  (and
    (Set_in (inv_0_1<Ref> x@125@01 y@126@01 z@127@01) ys1@48@01)
    (or
      (Set_in (inv_0_2<Ref> x@125@01 y@126@01 z@127@01) zs1@59@01)
      (not (Set_in (inv_0_2<Ref> x@125@01 y@126@01 z@127@01) zs1@59@01))))))
(assert (or
  (Set_in (inv_0_1<Ref> x@125@01 y@126@01 z@127@01) ys1@48@01)
  (not (Set_in (inv_0_1<Ref> x@125@01 y@126@01 z@127@01) ys1@48@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_0_0<Ref> x@125@01 y@126@01 z@127@01) xs1@37@01)
  (and
    (Set_in (inv_0_0<Ref> x@125@01 y@126@01 z@127@01) xs1@37@01)
    (=>
      (Set_in (inv_0_1<Ref> x@125@01 y@126@01 z@127@01) ys1@48@01)
      (and
        (Set_in (inv_0_1<Ref> x@125@01 y@126@01 z@127@01) ys1@48@01)
        (or
          (Set_in (inv_0_2<Ref> x@125@01 y@126@01 z@127@01) zs1@59@01)
          (not (Set_in (inv_0_2<Ref> x@125@01 y@126@01 z@127@01) zs1@59@01)))))
    (or
      (Set_in (inv_0_1<Ref> x@125@01 y@126@01 z@127@01) ys1@48@01)
      (not (Set_in (inv_0_1<Ref> x@125@01 y@126@01 z@127@01) ys1@48@01))))))
(assert (or
  (Set_in (inv_0_0<Ref> x@125@01 y@126@01 z@127@01) xs1@37@01)
  (not (Set_in (inv_0_0<Ref> x@125@01 y@126@01 z@127@01) xs1@37@01))))
; [eval] (inv_1_0(x, y, z) in xs2) && ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) && (x == x && y == y && z == z)
; [eval] (inv_1_0(x, y, z) in xs2)
; [eval] inv_1_0(x, y, z)
(push) ; 6
; [then-branch: 51 | !(inv_1_0[Ref](x@125@01, y@126@01, z@127@01) in xs2@38@01) | live]
; [else-branch: 51 | inv_1_0[Ref](x@125@01, y@126@01, z@127@01) in xs2@38@01 | live]
(push) ; 7
; [then-branch: 51 | !(inv_1_0[Ref](x@125@01, y@126@01, z@127@01) in xs2@38@01)]
(assert (not (Set_in (inv_1_0<Ref> x@125@01 y@126@01 z@127@01) xs2@38@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 51 | inv_1_0[Ref](x@125@01, y@126@01, z@127@01) in xs2@38@01]
(assert (Set_in (inv_1_0<Ref> x@125@01 y@126@01 z@127@01) xs2@38@01))
; [eval] (inv_1_1(x, y, z) in ys2)
; [eval] inv_1_1(x, y, z)
(push) ; 8
; [then-branch: 52 | !(inv_1_1[Ref](x@125@01, y@126@01, z@127@01) in ys2@49@01) | live]
; [else-branch: 52 | inv_1_1[Ref](x@125@01, y@126@01, z@127@01) in ys2@49@01 | live]
(push) ; 9
; [then-branch: 52 | !(inv_1_1[Ref](x@125@01, y@126@01, z@127@01) in ys2@49@01)]
(assert (not (Set_in (inv_1_1<Ref> x@125@01 y@126@01 z@127@01) ys2@49@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 52 | inv_1_1[Ref](x@125@01, y@126@01, z@127@01) in ys2@49@01]
(assert (Set_in (inv_1_1<Ref> x@125@01 y@126@01 z@127@01) ys2@49@01))
; [eval] (inv_1_2(x, y, z) in zs2)
; [eval] inv_1_2(x, y, z)
(push) ; 10
; [then-branch: 53 | !(inv_1_2[Ref](x@125@01, y@126@01, z@127@01) in zs2@60@01) | live]
; [else-branch: 53 | inv_1_2[Ref](x@125@01, y@126@01, z@127@01) in zs2@60@01 | live]
(push) ; 11
; [then-branch: 53 | !(inv_1_2[Ref](x@125@01, y@126@01, z@127@01) in zs2@60@01)]
(assert (not (Set_in (inv_1_2<Ref> x@125@01 y@126@01 z@127@01) zs2@60@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 53 | inv_1_2[Ref](x@125@01, y@126@01, z@127@01) in zs2@60@01]
(assert (Set_in (inv_1_2<Ref> x@125@01 y@126@01 z@127@01) zs2@60@01))
; [eval] x == x
(push) ; 12
; [then-branch: 54 | False | live]
; [else-branch: 54 | True | live]
(push) ; 13
; [then-branch: 54 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 54 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 55 | False | live]
; [else-branch: 55 | True | live]
(push) ; 15
; [then-branch: 55 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 55 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_1_2<Ref> x@125@01 y@126@01 z@127@01) zs2@60@01)
  (not (Set_in (inv_1_2<Ref> x@125@01 y@126@01 z@127@01) zs2@60@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_1_1<Ref> x@125@01 y@126@01 z@127@01) ys2@49@01)
  (and
    (Set_in (inv_1_1<Ref> x@125@01 y@126@01 z@127@01) ys2@49@01)
    (or
      (Set_in (inv_1_2<Ref> x@125@01 y@126@01 z@127@01) zs2@60@01)
      (not (Set_in (inv_1_2<Ref> x@125@01 y@126@01 z@127@01) zs2@60@01))))))
(assert (or
  (Set_in (inv_1_1<Ref> x@125@01 y@126@01 z@127@01) ys2@49@01)
  (not (Set_in (inv_1_1<Ref> x@125@01 y@126@01 z@127@01) ys2@49@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_1_0<Ref> x@125@01 y@126@01 z@127@01) xs2@38@01)
  (and
    (Set_in (inv_1_0<Ref> x@125@01 y@126@01 z@127@01) xs2@38@01)
    (=>
      (Set_in (inv_1_1<Ref> x@125@01 y@126@01 z@127@01) ys2@49@01)
      (and
        (Set_in (inv_1_1<Ref> x@125@01 y@126@01 z@127@01) ys2@49@01)
        (or
          (Set_in (inv_1_2<Ref> x@125@01 y@126@01 z@127@01) zs2@60@01)
          (not (Set_in (inv_1_2<Ref> x@125@01 y@126@01 z@127@01) zs2@60@01)))))
    (or
      (Set_in (inv_1_1<Ref> x@125@01 y@126@01 z@127@01) ys2@49@01)
      (not (Set_in (inv_1_1<Ref> x@125@01 y@126@01 z@127@01) ys2@49@01))))))
(assert (or
  (Set_in (inv_1_0<Ref> x@125@01 y@126@01 z@127@01) xs2@38@01)
  (not (Set_in (inv_1_0<Ref> x@125@01 y@126@01 z@127@01) xs2@38@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 45 | !(inv_2_0[Ref](x@125@01, y@126@01, z@127@01) in xs3@39@01 && inv_2_1[Ref](x@125@01, y@126@01, z@127@01) in ys3@50@01 && inv_2_2[Ref](x@125@01, y@126@01, z@127@01) in zs3@61@01)]
(assert (not
  (and
    (Set_in (inv_2_0<Ref> x@125@01 y@126@01 z@127@01) xs3@39@01)
    (and
      (Set_in (inv_2_1<Ref> x@125@01 y@126@01 z@127@01) ys3@50@01)
      (Set_in (inv_2_2<Ref> x@125@01 y@126@01 z@127@01) zs3@61@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (=
    ($PSF.perm_p (as pm@128@01  $PPM) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    (ite
      (and
        (and (img@83@01 x y z) (img@85@01 x y z) (img@87@01 x y z))
        (and
          (Set_in (inv@82@01 x y z) xs@70@01)
          (and
            (Set_in (inv@84@01 x y z) ys@71@01)
            (Set_in (inv@86@01 x y z) zs@72@01))))
      q@73@01
      $Perm.No))
  :pattern (($PSF.perm_p (as pm@128@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resPrmSumDef6|)))
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (and
    ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    ($PSF.loc_p ($PSF.lookup_p $t@81@01 ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))))
  :pattern (($PSF.perm_p (as pm@128@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resTrgDef7|)))
(assert (=>
  (and
    (Set_in (inv_2_0<Ref> x@125@01 y@126@01 z@127@01) xs3@39@01)
    (and
      (Set_in (inv_2_1<Ref> x@125@01 y@126@01 z@127@01) ys3@50@01)
      (Set_in (inv_2_2<Ref> x@125@01 y@126@01 z@127@01) zs3@61@01)))
  (and
    (Set_in (inv_2_0<Ref> x@125@01 y@126@01 z@127@01) xs3@39@01)
    (Set_in (inv_2_1<Ref> x@125@01 y@126@01 z@127@01) ys3@50@01)
    (Set_in (inv_2_2<Ref> x@125@01 y@126@01 z@127@01) zs3@61@01)
    ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x@125@01)
        ($SortWrappers.$RefTo$Snap y@126@01))
      ($SortWrappers.$RefTo$Snap z@127@01))) ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x@125@01)
        ($SortWrappers.$RefTo$Snap y@126@01))
      ($SortWrappers.$RefTo$Snap z@127@01)))
    (=>
      (Set_in (inv_0_0<Ref> x@125@01 y@126@01 z@127@01) xs1@37@01)
      (and
        (Set_in (inv_0_0<Ref> x@125@01 y@126@01 z@127@01) xs1@37@01)
        (=>
          (Set_in (inv_0_1<Ref> x@125@01 y@126@01 z@127@01) ys1@48@01)
          (and
            (Set_in (inv_0_1<Ref> x@125@01 y@126@01 z@127@01) ys1@48@01)
            (or
              (Set_in (inv_0_2<Ref> x@125@01 y@126@01 z@127@01) zs1@59@01)
              (not (Set_in (inv_0_2<Ref> x@125@01 y@126@01 z@127@01) zs1@59@01)))))
        (or
          (Set_in (inv_0_1<Ref> x@125@01 y@126@01 z@127@01) ys1@48@01)
          (not (Set_in (inv_0_1<Ref> x@125@01 y@126@01 z@127@01) ys1@48@01)))))
    (or
      (Set_in (inv_0_0<Ref> x@125@01 y@126@01 z@127@01) xs1@37@01)
      (not (Set_in (inv_0_0<Ref> x@125@01 y@126@01 z@127@01) xs1@37@01)))
    (=>
      (Set_in (inv_1_0<Ref> x@125@01 y@126@01 z@127@01) xs2@38@01)
      (and
        (Set_in (inv_1_0<Ref> x@125@01 y@126@01 z@127@01) xs2@38@01)
        (=>
          (Set_in (inv_1_1<Ref> x@125@01 y@126@01 z@127@01) ys2@49@01)
          (and
            (Set_in (inv_1_1<Ref> x@125@01 y@126@01 z@127@01) ys2@49@01)
            (or
              (Set_in (inv_1_2<Ref> x@125@01 y@126@01 z@127@01) zs2@60@01)
              (not (Set_in (inv_1_2<Ref> x@125@01 y@126@01 z@127@01) zs2@60@01)))))
        (or
          (Set_in (inv_1_1<Ref> x@125@01 y@126@01 z@127@01) ys2@49@01)
          (not (Set_in (inv_1_1<Ref> x@125@01 y@126@01 z@127@01) ys2@49@01)))))
    (or
      (Set_in (inv_1_0<Ref> x@125@01 y@126@01 z@127@01) xs2@38@01)
      (not (Set_in (inv_1_0<Ref> x@125@01 y@126@01 z@127@01) xs2@38@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in (inv_2_0<Ref> x@125@01 y@126@01 z@127@01) xs3@39@01)
      (and
        (Set_in (inv_2_1<Ref> x@125@01 y@126@01 z@127@01) ys3@50@01)
        (Set_in (inv_2_2<Ref> x@125@01 y@126@01 z@127@01) zs3@61@01))))
  (and
    (Set_in (inv_2_0<Ref> x@125@01 y@126@01 z@127@01) xs3@39@01)
    (and
      (Set_in (inv_2_1<Ref> x@125@01 y@126@01 z@127@01) ys3@50@01)
      (Set_in (inv_2_2<Ref> x@125@01 y@126@01 z@127@01) zs3@61@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (=
    ($PSF.perm_p (as pm@128@01  $PPM) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    (ite
      (and
        (and (img@83@01 x y z) (img@85@01 x y z) (img@87@01 x y z))
        (and
          (Set_in (inv@82@01 x y z) xs@70@01)
          (and
            (Set_in (inv@84@01 x y z) ys@71@01)
            (Set_in (inv@86@01 x y z) zs@72@01))))
      q@73@01
      $Perm.No))
  :pattern (($PSF.perm_p (as pm@128@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resPrmSumDef6|)))
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (and
    ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    ($PSF.loc_p ($PSF.lookup_p $t@81@01 ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))))
  :pattern (($PSF.perm_p (as pm@128@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resTrgDef7|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@125@01 $Ref) (y@126@01 $Ref) (z@127@01 $Ref)) (!
  (and
    (=>
      (Set_in (inv_2_0<Ref> x@125@01 y@126@01 z@127@01) xs3@39@01)
      (and
        (Set_in (inv_2_0<Ref> x@125@01 y@126@01 z@127@01) xs3@39@01)
        (or
          (Set_in (inv_2_1<Ref> x@125@01 y@126@01 z@127@01) ys3@50@01)
          (not (Set_in (inv_2_1<Ref> x@125@01 y@126@01 z@127@01) ys3@50@01)))))
    (or
      (Set_in (inv_2_0<Ref> x@125@01 y@126@01 z@127@01) xs3@39@01)
      (not (Set_in (inv_2_0<Ref> x@125@01 y@126@01 z@127@01) xs3@39@01)))
    (=>
      (and
        (Set_in (inv_2_0<Ref> x@125@01 y@126@01 z@127@01) xs3@39@01)
        (and
          (Set_in (inv_2_1<Ref> x@125@01 y@126@01 z@127@01) ys3@50@01)
          (Set_in (inv_2_2<Ref> x@125@01 y@126@01 z@127@01) zs3@61@01)))
      (and
        (Set_in (inv_2_0<Ref> x@125@01 y@126@01 z@127@01) xs3@39@01)
        (Set_in (inv_2_1<Ref> x@125@01 y@126@01 z@127@01) ys3@50@01)
        (Set_in (inv_2_2<Ref> x@125@01 y@126@01 z@127@01) zs3@61@01)
        ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap x@125@01)
            ($SortWrappers.$RefTo$Snap y@126@01))
          ($SortWrappers.$RefTo$Snap z@127@01))) ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap x@125@01)
            ($SortWrappers.$RefTo$Snap y@126@01))
          ($SortWrappers.$RefTo$Snap z@127@01)))
        (=>
          (Set_in (inv_0_0<Ref> x@125@01 y@126@01 z@127@01) xs1@37@01)
          (and
            (Set_in (inv_0_0<Ref> x@125@01 y@126@01 z@127@01) xs1@37@01)
            (=>
              (Set_in (inv_0_1<Ref> x@125@01 y@126@01 z@127@01) ys1@48@01)
              (and
                (Set_in (inv_0_1<Ref> x@125@01 y@126@01 z@127@01) ys1@48@01)
                (or
                  (Set_in (inv_0_2<Ref> x@125@01 y@126@01 z@127@01) zs1@59@01)
                  (not
                    (Set_in (inv_0_2<Ref> x@125@01 y@126@01 z@127@01) zs1@59@01)))))
            (or
              (Set_in (inv_0_1<Ref> x@125@01 y@126@01 z@127@01) ys1@48@01)
              (not (Set_in (inv_0_1<Ref> x@125@01 y@126@01 z@127@01) ys1@48@01)))))
        (or
          (Set_in (inv_0_0<Ref> x@125@01 y@126@01 z@127@01) xs1@37@01)
          (not (Set_in (inv_0_0<Ref> x@125@01 y@126@01 z@127@01) xs1@37@01)))
        (=>
          (Set_in (inv_1_0<Ref> x@125@01 y@126@01 z@127@01) xs2@38@01)
          (and
            (Set_in (inv_1_0<Ref> x@125@01 y@126@01 z@127@01) xs2@38@01)
            (=>
              (Set_in (inv_1_1<Ref> x@125@01 y@126@01 z@127@01) ys2@49@01)
              (and
                (Set_in (inv_1_1<Ref> x@125@01 y@126@01 z@127@01) ys2@49@01)
                (or
                  (Set_in (inv_1_2<Ref> x@125@01 y@126@01 z@127@01) zs2@60@01)
                  (not
                    (Set_in (inv_1_2<Ref> x@125@01 y@126@01 z@127@01) zs2@60@01)))))
            (or
              (Set_in (inv_1_1<Ref> x@125@01 y@126@01 z@127@01) ys2@49@01)
              (not (Set_in (inv_1_1<Ref> x@125@01 y@126@01 z@127@01) ys2@49@01)))))
        (or
          (Set_in (inv_1_0<Ref> x@125@01 y@126@01 z@127@01) xs2@38@01)
          (not (Set_in (inv_1_0<Ref> x@125@01 y@126@01 z@127@01) xs2@38@01)))))
    (or
      (not
        (and
          (Set_in (inv_2_0<Ref> x@125@01 y@126@01 z@127@01) xs3@39@01)
          (and
            (Set_in (inv_2_1<Ref> x@125@01 y@126@01 z@127@01) ys3@50@01)
            (Set_in (inv_2_2<Ref> x@125@01 y@126@01 z@127@01) zs3@61@01))))
      (and
        (Set_in (inv_2_0<Ref> x@125@01 y@126@01 z@127@01) xs3@39@01)
        (and
          (Set_in (inv_2_1<Ref> x@125@01 y@126@01 z@127@01) ys3@50@01)
          (Set_in (inv_2_2<Ref> x@125@01 y@126@01 z@127@01) zs3@61@01)))))
  :pattern ((inv_2_0<Ref> x@125@01 y@126@01 z@127@01) (inv_2_1<Ref> x@125@01 y@126@01 z@127@01) (inv_2_2<Ref> x@125@01 y@126@01 z@127@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@22@9@22@122-aux|)))
(assert (forall ((x@125@01 $Ref) (y@126@01 $Ref) (z@127@01 $Ref)) (!
  (=>
    (and
      (Set_in (inv_2_0<Ref> x@125@01 y@126@01 z@127@01) xs3@39@01)
      (and
        (Set_in (inv_2_1<Ref> x@125@01 y@126@01 z@127@01) ys3@50@01)
        (Set_in (inv_2_2<Ref> x@125@01 y@126@01 z@127@01) zs3@61@01)))
    (>=
      ($PSF.perm_p (as pm@128@01  $PPM) ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap x@125@01)
          ($SortWrappers.$RefTo$Snap y@126@01))
        ($SortWrappers.$RefTo$Snap z@127@01)))
      (__iar__assume_helper_2<Perm> (and
        (Set_in (inv_0_0<Ref> x@125@01 y@126@01 z@127@01) xs1@37@01)
        (and
          (Set_in (inv_0_1<Ref> x@125@01 y@126@01 z@127@01) ys1@48@01)
          (Set_in (inv_0_2<Ref> x@125@01 y@126@01 z@127@01) zs1@59@01))) (and
        (Set_in (inv_1_0<Ref> x@125@01 y@126@01 z@127@01) xs2@38@01)
        (and
          (Set_in (inv_1_1<Ref> x@125@01 y@126@01 z@127@01) ys2@49@01)
          (Set_in (inv_1_2<Ref> x@125@01 y@126@01 z@127@01) zs2@60@01))) q@73@01 q@73@01 q@73@01)))
  :pattern ((inv_2_0<Ref> x@125@01 y@126@01 z@127@01) (inv_2_1<Ref> x@125@01 y@126@01 z@127@01) (inv_2_2<Ref> x@125@01 y@126@01 z@127@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@22@9@22@122|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x4: Ref, y4: Ref, z4: Ref ::
;     { p(x4, y4, z4) }
;     (x4 in xs4) && ((y4 in ys4) && (z4 in zs4)) ==>
;     inv_3_0(x4, y4, z4) == x4 && inv_3_1(x4, y4, z4) == y4 &&
;     inv_3_2(x4, y4, z4) == z4)
(declare-const $t@129@01 $Snap)
(assert (= $t@129@01 $Snap.unit))
; [eval] (forall x4: Ref, y4: Ref, z4: Ref :: { p(x4, y4, z4) } (x4 in xs4) && ((y4 in ys4) && (z4 in zs4)) ==> inv_3_0(x4, y4, z4) == x4 && inv_3_1(x4, y4, z4) == y4 && inv_3_2(x4, y4, z4) == z4)
(declare-const x4@130@01 $Ref)
(declare-const y4@131@01 $Ref)
(declare-const z4@132@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x4 in xs4) && ((y4 in ys4) && (z4 in zs4)) ==> inv_3_0(x4, y4, z4) == x4 && inv_3_1(x4, y4, z4) == y4 && inv_3_2(x4, y4, z4) == z4
; [eval] (x4 in xs4) && ((y4 in ys4) && (z4 in zs4))
; [eval] (x4 in xs4)
(push) ; 4
; [then-branch: 56 | !(x4@130@01 in xs4@40@01) | live]
; [else-branch: 56 | x4@130@01 in xs4@40@01 | live]
(push) ; 5
; [then-branch: 56 | !(x4@130@01 in xs4@40@01)]
(assert (not (Set_in x4@130@01 xs4@40@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 56 | x4@130@01 in xs4@40@01]
(assert (Set_in x4@130@01 xs4@40@01))
; [eval] (y4 in ys4)
(push) ; 6
; [then-branch: 57 | !(y4@131@01 in ys4@51@01) | live]
; [else-branch: 57 | y4@131@01 in ys4@51@01 | live]
(push) ; 7
; [then-branch: 57 | !(y4@131@01 in ys4@51@01)]
(assert (not (Set_in y4@131@01 ys4@51@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 57 | y4@131@01 in ys4@51@01]
(assert (Set_in y4@131@01 ys4@51@01))
; [eval] (z4 in zs4)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (Set_in y4@131@01 ys4@51@01) (not (Set_in y4@131@01 ys4@51@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in x4@130@01 xs4@40@01)
  (and
    (Set_in x4@130@01 xs4@40@01)
    (or (Set_in y4@131@01 ys4@51@01) (not (Set_in y4@131@01 ys4@51@01))))))
(assert (or (Set_in x4@130@01 xs4@40@01) (not (Set_in x4@130@01 xs4@40@01))))
(push) ; 4
; [then-branch: 58 | x4@130@01 in xs4@40@01 && y4@131@01 in ys4@51@01 && z4@132@01 in zs4@62@01 | live]
; [else-branch: 58 | !(x4@130@01 in xs4@40@01 && y4@131@01 in ys4@51@01 && z4@132@01 in zs4@62@01) | live]
(push) ; 5
; [then-branch: 58 | x4@130@01 in xs4@40@01 && y4@131@01 in ys4@51@01 && z4@132@01 in zs4@62@01]
(assert (and
  (Set_in x4@130@01 xs4@40@01)
  (and (Set_in y4@131@01 ys4@51@01) (Set_in z4@132@01 zs4@62@01))))
; [eval] inv_3_0(x4, y4, z4) == x4 && inv_3_1(x4, y4, z4) == y4 && inv_3_2(x4, y4, z4) == z4
; [eval] inv_3_0(x4, y4, z4) == x4
; [eval] inv_3_0(x4, y4, z4)
(push) ; 6
; [then-branch: 59 | inv_3_0[Ref](x4@130@01, y4@131@01, z4@132@01) != x4@130@01 | live]
; [else-branch: 59 | inv_3_0[Ref](x4@130@01, y4@131@01, z4@132@01) == x4@130@01 | live]
(push) ; 7
; [then-branch: 59 | inv_3_0[Ref](x4@130@01, y4@131@01, z4@132@01) != x4@130@01]
(assert (not (= (inv_3_0<Ref> x4@130@01 y4@131@01 z4@132@01) x4@130@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 59 | inv_3_0[Ref](x4@130@01, y4@131@01, z4@132@01) == x4@130@01]
(assert (= (inv_3_0<Ref> x4@130@01 y4@131@01 z4@132@01) x4@130@01))
; [eval] inv_3_1(x4, y4, z4) == y4
; [eval] inv_3_1(x4, y4, z4)
(push) ; 8
; [then-branch: 60 | inv_3_1[Ref](x4@130@01, y4@131@01, z4@132@01) != y4@131@01 | live]
; [else-branch: 60 | inv_3_1[Ref](x4@130@01, y4@131@01, z4@132@01) == y4@131@01 | live]
(push) ; 9
; [then-branch: 60 | inv_3_1[Ref](x4@130@01, y4@131@01, z4@132@01) != y4@131@01]
(assert (not (= (inv_3_1<Ref> x4@130@01 y4@131@01 z4@132@01) y4@131@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 60 | inv_3_1[Ref](x4@130@01, y4@131@01, z4@132@01) == y4@131@01]
(assert (= (inv_3_1<Ref> x4@130@01 y4@131@01 z4@132@01) y4@131@01))
; [eval] inv_3_2(x4, y4, z4) == z4
; [eval] inv_3_2(x4, y4, z4)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or
  (= (inv_3_1<Ref> x4@130@01 y4@131@01 z4@132@01) y4@131@01)
  (not (= (inv_3_1<Ref> x4@130@01 y4@131@01 z4@132@01) y4@131@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (= (inv_3_0<Ref> x4@130@01 y4@131@01 z4@132@01) x4@130@01)
  (and
    (= (inv_3_0<Ref> x4@130@01 y4@131@01 z4@132@01) x4@130@01)
    (or
      (= (inv_3_1<Ref> x4@130@01 y4@131@01 z4@132@01) y4@131@01)
      (not (= (inv_3_1<Ref> x4@130@01 y4@131@01 z4@132@01) y4@131@01))))))
(assert (or
  (= (inv_3_0<Ref> x4@130@01 y4@131@01 z4@132@01) x4@130@01)
  (not (= (inv_3_0<Ref> x4@130@01 y4@131@01 z4@132@01) x4@130@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 58 | !(x4@130@01 in xs4@40@01 && y4@131@01 in ys4@51@01 && z4@132@01 in zs4@62@01)]
(assert (not
  (and
    (Set_in x4@130@01 xs4@40@01)
    (and (Set_in y4@131@01 ys4@51@01) (Set_in z4@132@01 zs4@62@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Set_in x4@130@01 xs4@40@01)
    (and (Set_in y4@131@01 ys4@51@01) (Set_in z4@132@01 zs4@62@01)))
  (and
    (Set_in x4@130@01 xs4@40@01)
    (Set_in y4@131@01 ys4@51@01)
    (Set_in z4@132@01 zs4@62@01)
    (=>
      (= (inv_3_0<Ref> x4@130@01 y4@131@01 z4@132@01) x4@130@01)
      (and
        (= (inv_3_0<Ref> x4@130@01 y4@131@01 z4@132@01) x4@130@01)
        (or
          (= (inv_3_1<Ref> x4@130@01 y4@131@01 z4@132@01) y4@131@01)
          (not (= (inv_3_1<Ref> x4@130@01 y4@131@01 z4@132@01) y4@131@01)))))
    (or
      (= (inv_3_0<Ref> x4@130@01 y4@131@01 z4@132@01) x4@130@01)
      (not (= (inv_3_0<Ref> x4@130@01 y4@131@01 z4@132@01) x4@130@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in x4@130@01 xs4@40@01)
      (and (Set_in y4@131@01 ys4@51@01) (Set_in z4@132@01 zs4@62@01))))
  (and
    (Set_in x4@130@01 xs4@40@01)
    (and (Set_in y4@131@01 ys4@51@01) (Set_in z4@132@01 zs4@62@01)))))
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x4@130@01 $Ref) (y4@131@01 $Ref) (z4@132@01 $Ref)) (!
  (and
    (=>
      (Set_in x4@130@01 xs4@40@01)
      (and
        (Set_in x4@130@01 xs4@40@01)
        (or (Set_in y4@131@01 ys4@51@01) (not (Set_in y4@131@01 ys4@51@01)))))
    (or (Set_in x4@130@01 xs4@40@01) (not (Set_in x4@130@01 xs4@40@01)))
    (=>
      (and
        (Set_in x4@130@01 xs4@40@01)
        (and (Set_in y4@131@01 ys4@51@01) (Set_in z4@132@01 zs4@62@01)))
      (and
        (Set_in x4@130@01 xs4@40@01)
        (Set_in y4@131@01 ys4@51@01)
        (Set_in z4@132@01 zs4@62@01)
        (=>
          (= (inv_3_0<Ref> x4@130@01 y4@131@01 z4@132@01) x4@130@01)
          (and
            (= (inv_3_0<Ref> x4@130@01 y4@131@01 z4@132@01) x4@130@01)
            (or
              (= (inv_3_1<Ref> x4@130@01 y4@131@01 z4@132@01) y4@131@01)
              (not (= (inv_3_1<Ref> x4@130@01 y4@131@01 z4@132@01) y4@131@01)))))
        (or
          (= (inv_3_0<Ref> x4@130@01 y4@131@01 z4@132@01) x4@130@01)
          (not (= (inv_3_0<Ref> x4@130@01 y4@131@01 z4@132@01) x4@130@01)))))
    (or
      (not
        (and
          (Set_in x4@130@01 xs4@40@01)
          (and (Set_in y4@131@01 ys4@51@01) (Set_in z4@132@01 zs4@62@01))))
      (and
        (Set_in x4@130@01 xs4@40@01)
        (and (Set_in y4@131@01 ys4@51@01) (Set_in z4@132@01 zs4@62@01)))))
  :pattern (($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap x4@130@01)
      ($SortWrappers.$RefTo$Snap y4@131@01))
    ($SortWrappers.$RefTo$Snap z4@132@01))) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap x4@130@01)
      ($SortWrappers.$RefTo$Snap y4@131@01))
    ($SortWrappers.$RefTo$Snap z4@132@01))))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@23@9@23@122-aux|)))
(assert (forall ((x4@130@01 $Ref) (y4@131@01 $Ref) (z4@132@01 $Ref)) (!
  (=>
    (and
      (Set_in x4@130@01 xs4@40@01)
      (and (Set_in y4@131@01 ys4@51@01) (Set_in z4@132@01 zs4@62@01)))
    (and
      (= (inv_3_0<Ref> x4@130@01 y4@131@01 z4@132@01) x4@130@01)
      (and
        (= (inv_3_1<Ref> x4@130@01 y4@131@01 z4@132@01) y4@131@01)
        (= (inv_3_2<Ref> x4@130@01 y4@131@01 z4@132@01) z4@132@01))))
  :pattern (($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap x4@130@01)
      ($SortWrappers.$RefTo$Snap y4@131@01))
    ($SortWrappers.$RefTo$Snap z4@132@01))) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap x4@130@01)
      ($SortWrappers.$RefTo$Snap y4@131@01))
    ($SortWrappers.$RefTo$Snap z4@132@01))))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@23@9@23@122|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x: Ref, y: Ref, z: Ref ::
;     { inv_3_0(x, y, z), inv_3_1(x, y, z), inv_3_2(x, y, z) }
;     (inv_3_0(x, y, z) in xs4) &&
;     ((inv_3_1(x, y, z) in ys4) && (inv_3_2(x, y, z) in zs4)) ==>
;     inv_3_0(x, y, z) == x && inv_3_1(x, y, z) == y && inv_3_2(x, y, z) == z)
(declare-const $t@133@01 $Snap)
(assert (= $t@133@01 $Snap.unit))
; [eval] (forall x: Ref, y: Ref, z: Ref :: { inv_3_0(x, y, z), inv_3_1(x, y, z), inv_3_2(x, y, z) } (inv_3_0(x, y, z) in xs4) && ((inv_3_1(x, y, z) in ys4) && (inv_3_2(x, y, z) in zs4)) ==> inv_3_0(x, y, z) == x && inv_3_1(x, y, z) == y && inv_3_2(x, y, z) == z)
(declare-const x@134@01 $Ref)
(declare-const y@135@01 $Ref)
(declare-const z@136@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (inv_3_0(x, y, z) in xs4) && ((inv_3_1(x, y, z) in ys4) && (inv_3_2(x, y, z) in zs4)) ==> inv_3_0(x, y, z) == x && inv_3_1(x, y, z) == y && inv_3_2(x, y, z) == z
; [eval] (inv_3_0(x, y, z) in xs4) && ((inv_3_1(x, y, z) in ys4) && (inv_3_2(x, y, z) in zs4))
; [eval] (inv_3_0(x, y, z) in xs4)
; [eval] inv_3_0(x, y, z)
(push) ; 4
; [then-branch: 61 | !(inv_3_0[Ref](x@134@01, y@135@01, z@136@01) in xs4@40@01) | live]
; [else-branch: 61 | inv_3_0[Ref](x@134@01, y@135@01, z@136@01) in xs4@40@01 | live]
(push) ; 5
; [then-branch: 61 | !(inv_3_0[Ref](x@134@01, y@135@01, z@136@01) in xs4@40@01)]
(assert (not (Set_in (inv_3_0<Ref> x@134@01 y@135@01 z@136@01) xs4@40@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 61 | inv_3_0[Ref](x@134@01, y@135@01, z@136@01) in xs4@40@01]
(assert (Set_in (inv_3_0<Ref> x@134@01 y@135@01 z@136@01) xs4@40@01))
; [eval] (inv_3_1(x, y, z) in ys4)
; [eval] inv_3_1(x, y, z)
(push) ; 6
; [then-branch: 62 | !(inv_3_1[Ref](x@134@01, y@135@01, z@136@01) in ys4@51@01) | live]
; [else-branch: 62 | inv_3_1[Ref](x@134@01, y@135@01, z@136@01) in ys4@51@01 | live]
(push) ; 7
; [then-branch: 62 | !(inv_3_1[Ref](x@134@01, y@135@01, z@136@01) in ys4@51@01)]
(assert (not (Set_in (inv_3_1<Ref> x@134@01 y@135@01 z@136@01) ys4@51@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 62 | inv_3_1[Ref](x@134@01, y@135@01, z@136@01) in ys4@51@01]
(assert (Set_in (inv_3_1<Ref> x@134@01 y@135@01 z@136@01) ys4@51@01))
; [eval] (inv_3_2(x, y, z) in zs4)
; [eval] inv_3_2(x, y, z)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_3_1<Ref> x@134@01 y@135@01 z@136@01) ys4@51@01)
  (not (Set_in (inv_3_1<Ref> x@134@01 y@135@01 z@136@01) ys4@51@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_3_0<Ref> x@134@01 y@135@01 z@136@01) xs4@40@01)
  (and
    (Set_in (inv_3_0<Ref> x@134@01 y@135@01 z@136@01) xs4@40@01)
    (or
      (Set_in (inv_3_1<Ref> x@134@01 y@135@01 z@136@01) ys4@51@01)
      (not (Set_in (inv_3_1<Ref> x@134@01 y@135@01 z@136@01) ys4@51@01))))))
(assert (or
  (Set_in (inv_3_0<Ref> x@134@01 y@135@01 z@136@01) xs4@40@01)
  (not (Set_in (inv_3_0<Ref> x@134@01 y@135@01 z@136@01) xs4@40@01))))
(push) ; 4
; [then-branch: 63 | inv_3_0[Ref](x@134@01, y@135@01, z@136@01) in xs4@40@01 && inv_3_1[Ref](x@134@01, y@135@01, z@136@01) in ys4@51@01 && inv_3_2[Ref](x@134@01, y@135@01, z@136@01) in zs4@62@01 | live]
; [else-branch: 63 | !(inv_3_0[Ref](x@134@01, y@135@01, z@136@01) in xs4@40@01 && inv_3_1[Ref](x@134@01, y@135@01, z@136@01) in ys4@51@01 && inv_3_2[Ref](x@134@01, y@135@01, z@136@01) in zs4@62@01) | live]
(push) ; 5
; [then-branch: 63 | inv_3_0[Ref](x@134@01, y@135@01, z@136@01) in xs4@40@01 && inv_3_1[Ref](x@134@01, y@135@01, z@136@01) in ys4@51@01 && inv_3_2[Ref](x@134@01, y@135@01, z@136@01) in zs4@62@01]
(assert (and
  (Set_in (inv_3_0<Ref> x@134@01 y@135@01 z@136@01) xs4@40@01)
  (and
    (Set_in (inv_3_1<Ref> x@134@01 y@135@01 z@136@01) ys4@51@01)
    (Set_in (inv_3_2<Ref> x@134@01 y@135@01 z@136@01) zs4@62@01))))
; [eval] inv_3_0(x, y, z) == x && inv_3_1(x, y, z) == y && inv_3_2(x, y, z) == z
; [eval] inv_3_0(x, y, z) == x
; [eval] inv_3_0(x, y, z)
(push) ; 6
; [then-branch: 64 | inv_3_0[Ref](x@134@01, y@135@01, z@136@01) != x@134@01 | live]
; [else-branch: 64 | inv_3_0[Ref](x@134@01, y@135@01, z@136@01) == x@134@01 | live]
(push) ; 7
; [then-branch: 64 | inv_3_0[Ref](x@134@01, y@135@01, z@136@01) != x@134@01]
(assert (not (= (inv_3_0<Ref> x@134@01 y@135@01 z@136@01) x@134@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 64 | inv_3_0[Ref](x@134@01, y@135@01, z@136@01) == x@134@01]
(assert (= (inv_3_0<Ref> x@134@01 y@135@01 z@136@01) x@134@01))
; [eval] inv_3_1(x, y, z) == y
; [eval] inv_3_1(x, y, z)
(push) ; 8
; [then-branch: 65 | inv_3_1[Ref](x@134@01, y@135@01, z@136@01) != y@135@01 | live]
; [else-branch: 65 | inv_3_1[Ref](x@134@01, y@135@01, z@136@01) == y@135@01 | live]
(push) ; 9
; [then-branch: 65 | inv_3_1[Ref](x@134@01, y@135@01, z@136@01) != y@135@01]
(assert (not (= (inv_3_1<Ref> x@134@01 y@135@01 z@136@01) y@135@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 65 | inv_3_1[Ref](x@134@01, y@135@01, z@136@01) == y@135@01]
(assert (= (inv_3_1<Ref> x@134@01 y@135@01 z@136@01) y@135@01))
; [eval] inv_3_2(x, y, z) == z
; [eval] inv_3_2(x, y, z)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or
  (= (inv_3_1<Ref> x@134@01 y@135@01 z@136@01) y@135@01)
  (not (= (inv_3_1<Ref> x@134@01 y@135@01 z@136@01) y@135@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (= (inv_3_0<Ref> x@134@01 y@135@01 z@136@01) x@134@01)
  (and
    (= (inv_3_0<Ref> x@134@01 y@135@01 z@136@01) x@134@01)
    (or
      (= (inv_3_1<Ref> x@134@01 y@135@01 z@136@01) y@135@01)
      (not (= (inv_3_1<Ref> x@134@01 y@135@01 z@136@01) y@135@01))))))
(assert (or
  (= (inv_3_0<Ref> x@134@01 y@135@01 z@136@01) x@134@01)
  (not (= (inv_3_0<Ref> x@134@01 y@135@01 z@136@01) x@134@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 63 | !(inv_3_0[Ref](x@134@01, y@135@01, z@136@01) in xs4@40@01 && inv_3_1[Ref](x@134@01, y@135@01, z@136@01) in ys4@51@01 && inv_3_2[Ref](x@134@01, y@135@01, z@136@01) in zs4@62@01)]
(assert (not
  (and
    (Set_in (inv_3_0<Ref> x@134@01 y@135@01 z@136@01) xs4@40@01)
    (and
      (Set_in (inv_3_1<Ref> x@134@01 y@135@01 z@136@01) ys4@51@01)
      (Set_in (inv_3_2<Ref> x@134@01 y@135@01 z@136@01) zs4@62@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Set_in (inv_3_0<Ref> x@134@01 y@135@01 z@136@01) xs4@40@01)
    (and
      (Set_in (inv_3_1<Ref> x@134@01 y@135@01 z@136@01) ys4@51@01)
      (Set_in (inv_3_2<Ref> x@134@01 y@135@01 z@136@01) zs4@62@01)))
  (and
    (Set_in (inv_3_0<Ref> x@134@01 y@135@01 z@136@01) xs4@40@01)
    (Set_in (inv_3_1<Ref> x@134@01 y@135@01 z@136@01) ys4@51@01)
    (Set_in (inv_3_2<Ref> x@134@01 y@135@01 z@136@01) zs4@62@01)
    (=>
      (= (inv_3_0<Ref> x@134@01 y@135@01 z@136@01) x@134@01)
      (and
        (= (inv_3_0<Ref> x@134@01 y@135@01 z@136@01) x@134@01)
        (or
          (= (inv_3_1<Ref> x@134@01 y@135@01 z@136@01) y@135@01)
          (not (= (inv_3_1<Ref> x@134@01 y@135@01 z@136@01) y@135@01)))))
    (or
      (= (inv_3_0<Ref> x@134@01 y@135@01 z@136@01) x@134@01)
      (not (= (inv_3_0<Ref> x@134@01 y@135@01 z@136@01) x@134@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in (inv_3_0<Ref> x@134@01 y@135@01 z@136@01) xs4@40@01)
      (and
        (Set_in (inv_3_1<Ref> x@134@01 y@135@01 z@136@01) ys4@51@01)
        (Set_in (inv_3_2<Ref> x@134@01 y@135@01 z@136@01) zs4@62@01))))
  (and
    (Set_in (inv_3_0<Ref> x@134@01 y@135@01 z@136@01) xs4@40@01)
    (and
      (Set_in (inv_3_1<Ref> x@134@01 y@135@01 z@136@01) ys4@51@01)
      (Set_in (inv_3_2<Ref> x@134@01 y@135@01 z@136@01) zs4@62@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@134@01 $Ref) (y@135@01 $Ref) (z@136@01 $Ref)) (!
  (and
    (=>
      (Set_in (inv_3_0<Ref> x@134@01 y@135@01 z@136@01) xs4@40@01)
      (and
        (Set_in (inv_3_0<Ref> x@134@01 y@135@01 z@136@01) xs4@40@01)
        (or
          (Set_in (inv_3_1<Ref> x@134@01 y@135@01 z@136@01) ys4@51@01)
          (not (Set_in (inv_3_1<Ref> x@134@01 y@135@01 z@136@01) ys4@51@01)))))
    (or
      (Set_in (inv_3_0<Ref> x@134@01 y@135@01 z@136@01) xs4@40@01)
      (not (Set_in (inv_3_0<Ref> x@134@01 y@135@01 z@136@01) xs4@40@01)))
    (=>
      (and
        (Set_in (inv_3_0<Ref> x@134@01 y@135@01 z@136@01) xs4@40@01)
        (and
          (Set_in (inv_3_1<Ref> x@134@01 y@135@01 z@136@01) ys4@51@01)
          (Set_in (inv_3_2<Ref> x@134@01 y@135@01 z@136@01) zs4@62@01)))
      (and
        (Set_in (inv_3_0<Ref> x@134@01 y@135@01 z@136@01) xs4@40@01)
        (Set_in (inv_3_1<Ref> x@134@01 y@135@01 z@136@01) ys4@51@01)
        (Set_in (inv_3_2<Ref> x@134@01 y@135@01 z@136@01) zs4@62@01)
        (=>
          (= (inv_3_0<Ref> x@134@01 y@135@01 z@136@01) x@134@01)
          (and
            (= (inv_3_0<Ref> x@134@01 y@135@01 z@136@01) x@134@01)
            (or
              (= (inv_3_1<Ref> x@134@01 y@135@01 z@136@01) y@135@01)
              (not (= (inv_3_1<Ref> x@134@01 y@135@01 z@136@01) y@135@01)))))
        (or
          (= (inv_3_0<Ref> x@134@01 y@135@01 z@136@01) x@134@01)
          (not (= (inv_3_0<Ref> x@134@01 y@135@01 z@136@01) x@134@01)))))
    (or
      (not
        (and
          (Set_in (inv_3_0<Ref> x@134@01 y@135@01 z@136@01) xs4@40@01)
          (and
            (Set_in (inv_3_1<Ref> x@134@01 y@135@01 z@136@01) ys4@51@01)
            (Set_in (inv_3_2<Ref> x@134@01 y@135@01 z@136@01) zs4@62@01))))
      (and
        (Set_in (inv_3_0<Ref> x@134@01 y@135@01 z@136@01) xs4@40@01)
        (and
          (Set_in (inv_3_1<Ref> x@134@01 y@135@01 z@136@01) ys4@51@01)
          (Set_in (inv_3_2<Ref> x@134@01 y@135@01 z@136@01) zs4@62@01)))))
  :pattern ((inv_3_0<Ref> x@134@01 y@135@01 z@136@01) (inv_3_1<Ref> x@134@01 y@135@01 z@136@01) (inv_3_2<Ref> x@134@01 y@135@01 z@136@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@23@9@23@122-aux|)))
(assert (forall ((x@134@01 $Ref) (y@135@01 $Ref) (z@136@01 $Ref)) (!
  (=>
    (and
      (Set_in (inv_3_0<Ref> x@134@01 y@135@01 z@136@01) xs4@40@01)
      (and
        (Set_in (inv_3_1<Ref> x@134@01 y@135@01 z@136@01) ys4@51@01)
        (Set_in (inv_3_2<Ref> x@134@01 y@135@01 z@136@01) zs4@62@01)))
    (and
      (= (inv_3_0<Ref> x@134@01 y@135@01 z@136@01) x@134@01)
      (and
        (= (inv_3_1<Ref> x@134@01 y@135@01 z@136@01) y@135@01)
        (= (inv_3_2<Ref> x@134@01 y@135@01 z@136@01) z@136@01))))
  :pattern ((inv_3_0<Ref> x@134@01 y@135@01 z@136@01) (inv_3_1<Ref> x@134@01 y@135@01 z@136@01) (inv_3_2<Ref> x@134@01 y@135@01 z@136@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@23@9@23@122|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x: Ref, y: Ref, z: Ref ::
;     { inv_3_0(x, y, z), inv_3_1(x, y, z), inv_3_2(x, y, z) }
;     (inv_3_0(x, y, z) in xs4) &&
;     ((inv_3_1(x, y, z) in ys4) && (inv_3_2(x, y, z) in zs4)) ==>
;     perm(p(x, y, z)) >=
;     __iar__assume_helper_3((inv_0_0(x, y, z) in xs1) &&
;     ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) &&
;     (x == x && y == y && z == z), (inv_1_0(x, y, z) in xs2) &&
;     ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) &&
;     (x == x && y == y && z == z), (inv_2_0(x, y, z) in xs3) &&
;     ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) &&
;     (x == x && y == y && z == z), q, q, q, q))
(declare-const $t@137@01 $Snap)
(assert (= $t@137@01 $Snap.unit))
; [eval] (forall x: Ref, y: Ref, z: Ref :: { inv_3_0(x, y, z), inv_3_1(x, y, z), inv_3_2(x, y, z) } (inv_3_0(x, y, z) in xs4) && ((inv_3_1(x, y, z) in ys4) && (inv_3_2(x, y, z) in zs4)) ==> perm(p(x, y, z)) >= __iar__assume_helper_3((inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) && (x == x && y == y && z == z), (inv_1_0(x, y, z) in xs2) && ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) && (x == x && y == y && z == z), (inv_2_0(x, y, z) in xs3) && ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) && (x == x && y == y && z == z), q, q, q, q))
(declare-const x@138@01 $Ref)
(declare-const y@139@01 $Ref)
(declare-const z@140@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (inv_3_0(x, y, z) in xs4) && ((inv_3_1(x, y, z) in ys4) && (inv_3_2(x, y, z) in zs4)) ==> perm(p(x, y, z)) >= __iar__assume_helper_3((inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) && (x == x && y == y && z == z), (inv_1_0(x, y, z) in xs2) && ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) && (x == x && y == y && z == z), (inv_2_0(x, y, z) in xs3) && ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) && (x == x && y == y && z == z), q, q, q, q)
; [eval] (inv_3_0(x, y, z) in xs4) && ((inv_3_1(x, y, z) in ys4) && (inv_3_2(x, y, z) in zs4))
; [eval] (inv_3_0(x, y, z) in xs4)
; [eval] inv_3_0(x, y, z)
(push) ; 4
; [then-branch: 66 | !(inv_3_0[Ref](x@138@01, y@139@01, z@140@01) in xs4@40@01) | live]
; [else-branch: 66 | inv_3_0[Ref](x@138@01, y@139@01, z@140@01) in xs4@40@01 | live]
(push) ; 5
; [then-branch: 66 | !(inv_3_0[Ref](x@138@01, y@139@01, z@140@01) in xs4@40@01)]
(assert (not (Set_in (inv_3_0<Ref> x@138@01 y@139@01 z@140@01) xs4@40@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 66 | inv_3_0[Ref](x@138@01, y@139@01, z@140@01) in xs4@40@01]
(assert (Set_in (inv_3_0<Ref> x@138@01 y@139@01 z@140@01) xs4@40@01))
; [eval] (inv_3_1(x, y, z) in ys4)
; [eval] inv_3_1(x, y, z)
(push) ; 6
; [then-branch: 67 | !(inv_3_1[Ref](x@138@01, y@139@01, z@140@01) in ys4@51@01) | live]
; [else-branch: 67 | inv_3_1[Ref](x@138@01, y@139@01, z@140@01) in ys4@51@01 | live]
(push) ; 7
; [then-branch: 67 | !(inv_3_1[Ref](x@138@01, y@139@01, z@140@01) in ys4@51@01)]
(assert (not (Set_in (inv_3_1<Ref> x@138@01 y@139@01 z@140@01) ys4@51@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 67 | inv_3_1[Ref](x@138@01, y@139@01, z@140@01) in ys4@51@01]
(assert (Set_in (inv_3_1<Ref> x@138@01 y@139@01 z@140@01) ys4@51@01))
; [eval] (inv_3_2(x, y, z) in zs4)
; [eval] inv_3_2(x, y, z)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_3_1<Ref> x@138@01 y@139@01 z@140@01) ys4@51@01)
  (not (Set_in (inv_3_1<Ref> x@138@01 y@139@01 z@140@01) ys4@51@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_3_0<Ref> x@138@01 y@139@01 z@140@01) xs4@40@01)
  (and
    (Set_in (inv_3_0<Ref> x@138@01 y@139@01 z@140@01) xs4@40@01)
    (or
      (Set_in (inv_3_1<Ref> x@138@01 y@139@01 z@140@01) ys4@51@01)
      (not (Set_in (inv_3_1<Ref> x@138@01 y@139@01 z@140@01) ys4@51@01))))))
(assert (or
  (Set_in (inv_3_0<Ref> x@138@01 y@139@01 z@140@01) xs4@40@01)
  (not (Set_in (inv_3_0<Ref> x@138@01 y@139@01 z@140@01) xs4@40@01))))
(push) ; 4
; [then-branch: 68 | inv_3_0[Ref](x@138@01, y@139@01, z@140@01) in xs4@40@01 && inv_3_1[Ref](x@138@01, y@139@01, z@140@01) in ys4@51@01 && inv_3_2[Ref](x@138@01, y@139@01, z@140@01) in zs4@62@01 | live]
; [else-branch: 68 | !(inv_3_0[Ref](x@138@01, y@139@01, z@140@01) in xs4@40@01 && inv_3_1[Ref](x@138@01, y@139@01, z@140@01) in ys4@51@01 && inv_3_2[Ref](x@138@01, y@139@01, z@140@01) in zs4@62@01) | live]
(push) ; 5
; [then-branch: 68 | inv_3_0[Ref](x@138@01, y@139@01, z@140@01) in xs4@40@01 && inv_3_1[Ref](x@138@01, y@139@01, z@140@01) in ys4@51@01 && inv_3_2[Ref](x@138@01, y@139@01, z@140@01) in zs4@62@01]
(assert (and
  (Set_in (inv_3_0<Ref> x@138@01 y@139@01 z@140@01) xs4@40@01)
  (and
    (Set_in (inv_3_1<Ref> x@138@01 y@139@01 z@140@01) ys4@51@01)
    (Set_in (inv_3_2<Ref> x@138@01 y@139@01 z@140@01) zs4@62@01))))
; [eval] perm(p(x, y, z)) >= __iar__assume_helper_3((inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) && (x == x && y == y && z == z), (inv_1_0(x, y, z) in xs2) && ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) && (x == x && y == y && z == z), (inv_2_0(x, y, z) in xs3) && ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) && (x == x && y == y && z == z), q, q, q, q)
; [eval] perm(p(x, y, z))
; Definitional axioms for snapshot map values
(declare-const pm@141@01 $PPM)
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (=
    ($PSF.perm_p (as pm@141@01  $PPM) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    (ite
      (and
        (and (img@83@01 x y z) (img@85@01 x y z) (img@87@01 x y z))
        (and
          (Set_in (inv@82@01 x y z) xs@70@01)
          (and
            (Set_in (inv@84@01 x y z) ys@71@01)
            (Set_in (inv@86@01 x y z) zs@72@01))))
      q@73@01
      $Perm.No))
  :pattern (($PSF.perm_p (as pm@141@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resPrmSumDef8|)))
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (and
    ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    ($PSF.loc_p ($PSF.lookup_p $t@81@01 ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))))
  :pattern (($PSF.perm_p (as pm@141@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resTrgDef9|)))
(assert ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x@138@01)
    ($SortWrappers.$RefTo$Snap y@139@01))
  ($SortWrappers.$RefTo$Snap z@140@01))) ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x@138@01)
    ($SortWrappers.$RefTo$Snap y@139@01))
  ($SortWrappers.$RefTo$Snap z@140@01))))
; [eval] __iar__assume_helper_3((inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) && (x == x && y == y && z == z), (inv_1_0(x, y, z) in xs2) && ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) && (x == x && y == y && z == z), (inv_2_0(x, y, z) in xs3) && ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) && (x == x && y == y && z == z), q, q, q, q)
; [eval] (inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) && (x == x && y == y && z == z)
; [eval] (inv_0_0(x, y, z) in xs1)
; [eval] inv_0_0(x, y, z)
(push) ; 6
; [then-branch: 69 | !(inv_0_0[Ref](x@138@01, y@139@01, z@140@01) in xs1@37@01) | live]
; [else-branch: 69 | inv_0_0[Ref](x@138@01, y@139@01, z@140@01) in xs1@37@01 | live]
(push) ; 7
; [then-branch: 69 | !(inv_0_0[Ref](x@138@01, y@139@01, z@140@01) in xs1@37@01)]
(assert (not (Set_in (inv_0_0<Ref> x@138@01 y@139@01 z@140@01) xs1@37@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 69 | inv_0_0[Ref](x@138@01, y@139@01, z@140@01) in xs1@37@01]
(assert (Set_in (inv_0_0<Ref> x@138@01 y@139@01 z@140@01) xs1@37@01))
; [eval] (inv_0_1(x, y, z) in ys1)
; [eval] inv_0_1(x, y, z)
(push) ; 8
; [then-branch: 70 | !(inv_0_1[Ref](x@138@01, y@139@01, z@140@01) in ys1@48@01) | live]
; [else-branch: 70 | inv_0_1[Ref](x@138@01, y@139@01, z@140@01) in ys1@48@01 | live]
(push) ; 9
; [then-branch: 70 | !(inv_0_1[Ref](x@138@01, y@139@01, z@140@01) in ys1@48@01)]
(assert (not (Set_in (inv_0_1<Ref> x@138@01 y@139@01 z@140@01) ys1@48@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 70 | inv_0_1[Ref](x@138@01, y@139@01, z@140@01) in ys1@48@01]
(assert (Set_in (inv_0_1<Ref> x@138@01 y@139@01 z@140@01) ys1@48@01))
; [eval] (inv_0_2(x, y, z) in zs1)
; [eval] inv_0_2(x, y, z)
(push) ; 10
; [then-branch: 71 | !(inv_0_2[Ref](x@138@01, y@139@01, z@140@01) in zs1@59@01) | live]
; [else-branch: 71 | inv_0_2[Ref](x@138@01, y@139@01, z@140@01) in zs1@59@01 | live]
(push) ; 11
; [then-branch: 71 | !(inv_0_2[Ref](x@138@01, y@139@01, z@140@01) in zs1@59@01)]
(assert (not (Set_in (inv_0_2<Ref> x@138@01 y@139@01 z@140@01) zs1@59@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 71 | inv_0_2[Ref](x@138@01, y@139@01, z@140@01) in zs1@59@01]
(assert (Set_in (inv_0_2<Ref> x@138@01 y@139@01 z@140@01) zs1@59@01))
; [eval] x == x
(push) ; 12
; [then-branch: 72 | False | live]
; [else-branch: 72 | True | live]
(push) ; 13
; [then-branch: 72 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 72 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 73 | False | live]
; [else-branch: 73 | True | live]
(push) ; 15
; [then-branch: 73 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 73 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_0_2<Ref> x@138@01 y@139@01 z@140@01) zs1@59@01)
  (not (Set_in (inv_0_2<Ref> x@138@01 y@139@01 z@140@01) zs1@59@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_0_1<Ref> x@138@01 y@139@01 z@140@01) ys1@48@01)
  (and
    (Set_in (inv_0_1<Ref> x@138@01 y@139@01 z@140@01) ys1@48@01)
    (or
      (Set_in (inv_0_2<Ref> x@138@01 y@139@01 z@140@01) zs1@59@01)
      (not (Set_in (inv_0_2<Ref> x@138@01 y@139@01 z@140@01) zs1@59@01))))))
(assert (or
  (Set_in (inv_0_1<Ref> x@138@01 y@139@01 z@140@01) ys1@48@01)
  (not (Set_in (inv_0_1<Ref> x@138@01 y@139@01 z@140@01) ys1@48@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_0_0<Ref> x@138@01 y@139@01 z@140@01) xs1@37@01)
  (and
    (Set_in (inv_0_0<Ref> x@138@01 y@139@01 z@140@01) xs1@37@01)
    (=>
      (Set_in (inv_0_1<Ref> x@138@01 y@139@01 z@140@01) ys1@48@01)
      (and
        (Set_in (inv_0_1<Ref> x@138@01 y@139@01 z@140@01) ys1@48@01)
        (or
          (Set_in (inv_0_2<Ref> x@138@01 y@139@01 z@140@01) zs1@59@01)
          (not (Set_in (inv_0_2<Ref> x@138@01 y@139@01 z@140@01) zs1@59@01)))))
    (or
      (Set_in (inv_0_1<Ref> x@138@01 y@139@01 z@140@01) ys1@48@01)
      (not (Set_in (inv_0_1<Ref> x@138@01 y@139@01 z@140@01) ys1@48@01))))))
(assert (or
  (Set_in (inv_0_0<Ref> x@138@01 y@139@01 z@140@01) xs1@37@01)
  (not (Set_in (inv_0_0<Ref> x@138@01 y@139@01 z@140@01) xs1@37@01))))
; [eval] (inv_1_0(x, y, z) in xs2) && ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) && (x == x && y == y && z == z)
; [eval] (inv_1_0(x, y, z) in xs2)
; [eval] inv_1_0(x, y, z)
(push) ; 6
; [then-branch: 74 | !(inv_1_0[Ref](x@138@01, y@139@01, z@140@01) in xs2@38@01) | live]
; [else-branch: 74 | inv_1_0[Ref](x@138@01, y@139@01, z@140@01) in xs2@38@01 | live]
(push) ; 7
; [then-branch: 74 | !(inv_1_0[Ref](x@138@01, y@139@01, z@140@01) in xs2@38@01)]
(assert (not (Set_in (inv_1_0<Ref> x@138@01 y@139@01 z@140@01) xs2@38@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 74 | inv_1_0[Ref](x@138@01, y@139@01, z@140@01) in xs2@38@01]
(assert (Set_in (inv_1_0<Ref> x@138@01 y@139@01 z@140@01) xs2@38@01))
; [eval] (inv_1_1(x, y, z) in ys2)
; [eval] inv_1_1(x, y, z)
(push) ; 8
; [then-branch: 75 | !(inv_1_1[Ref](x@138@01, y@139@01, z@140@01) in ys2@49@01) | live]
; [else-branch: 75 | inv_1_1[Ref](x@138@01, y@139@01, z@140@01) in ys2@49@01 | live]
(push) ; 9
; [then-branch: 75 | !(inv_1_1[Ref](x@138@01, y@139@01, z@140@01) in ys2@49@01)]
(assert (not (Set_in (inv_1_1<Ref> x@138@01 y@139@01 z@140@01) ys2@49@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 75 | inv_1_1[Ref](x@138@01, y@139@01, z@140@01) in ys2@49@01]
(assert (Set_in (inv_1_1<Ref> x@138@01 y@139@01 z@140@01) ys2@49@01))
; [eval] (inv_1_2(x, y, z) in zs2)
; [eval] inv_1_2(x, y, z)
(push) ; 10
; [then-branch: 76 | !(inv_1_2[Ref](x@138@01, y@139@01, z@140@01) in zs2@60@01) | live]
; [else-branch: 76 | inv_1_2[Ref](x@138@01, y@139@01, z@140@01) in zs2@60@01 | live]
(push) ; 11
; [then-branch: 76 | !(inv_1_2[Ref](x@138@01, y@139@01, z@140@01) in zs2@60@01)]
(assert (not (Set_in (inv_1_2<Ref> x@138@01 y@139@01 z@140@01) zs2@60@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 76 | inv_1_2[Ref](x@138@01, y@139@01, z@140@01) in zs2@60@01]
(assert (Set_in (inv_1_2<Ref> x@138@01 y@139@01 z@140@01) zs2@60@01))
; [eval] x == x
(push) ; 12
; [then-branch: 77 | False | live]
; [else-branch: 77 | True | live]
(push) ; 13
; [then-branch: 77 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 77 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 78 | False | live]
; [else-branch: 78 | True | live]
(push) ; 15
; [then-branch: 78 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 78 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_1_2<Ref> x@138@01 y@139@01 z@140@01) zs2@60@01)
  (not (Set_in (inv_1_2<Ref> x@138@01 y@139@01 z@140@01) zs2@60@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_1_1<Ref> x@138@01 y@139@01 z@140@01) ys2@49@01)
  (and
    (Set_in (inv_1_1<Ref> x@138@01 y@139@01 z@140@01) ys2@49@01)
    (or
      (Set_in (inv_1_2<Ref> x@138@01 y@139@01 z@140@01) zs2@60@01)
      (not (Set_in (inv_1_2<Ref> x@138@01 y@139@01 z@140@01) zs2@60@01))))))
(assert (or
  (Set_in (inv_1_1<Ref> x@138@01 y@139@01 z@140@01) ys2@49@01)
  (not (Set_in (inv_1_1<Ref> x@138@01 y@139@01 z@140@01) ys2@49@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_1_0<Ref> x@138@01 y@139@01 z@140@01) xs2@38@01)
  (and
    (Set_in (inv_1_0<Ref> x@138@01 y@139@01 z@140@01) xs2@38@01)
    (=>
      (Set_in (inv_1_1<Ref> x@138@01 y@139@01 z@140@01) ys2@49@01)
      (and
        (Set_in (inv_1_1<Ref> x@138@01 y@139@01 z@140@01) ys2@49@01)
        (or
          (Set_in (inv_1_2<Ref> x@138@01 y@139@01 z@140@01) zs2@60@01)
          (not (Set_in (inv_1_2<Ref> x@138@01 y@139@01 z@140@01) zs2@60@01)))))
    (or
      (Set_in (inv_1_1<Ref> x@138@01 y@139@01 z@140@01) ys2@49@01)
      (not (Set_in (inv_1_1<Ref> x@138@01 y@139@01 z@140@01) ys2@49@01))))))
(assert (or
  (Set_in (inv_1_0<Ref> x@138@01 y@139@01 z@140@01) xs2@38@01)
  (not (Set_in (inv_1_0<Ref> x@138@01 y@139@01 z@140@01) xs2@38@01))))
; [eval] (inv_2_0(x, y, z) in xs3) && ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) && (x == x && y == y && z == z)
; [eval] (inv_2_0(x, y, z) in xs3)
; [eval] inv_2_0(x, y, z)
(push) ; 6
; [then-branch: 79 | !(inv_2_0[Ref](x@138@01, y@139@01, z@140@01) in xs3@39@01) | live]
; [else-branch: 79 | inv_2_0[Ref](x@138@01, y@139@01, z@140@01) in xs3@39@01 | live]
(push) ; 7
; [then-branch: 79 | !(inv_2_0[Ref](x@138@01, y@139@01, z@140@01) in xs3@39@01)]
(assert (not (Set_in (inv_2_0<Ref> x@138@01 y@139@01 z@140@01) xs3@39@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 79 | inv_2_0[Ref](x@138@01, y@139@01, z@140@01) in xs3@39@01]
(assert (Set_in (inv_2_0<Ref> x@138@01 y@139@01 z@140@01) xs3@39@01))
; [eval] (inv_2_1(x, y, z) in ys3)
; [eval] inv_2_1(x, y, z)
(push) ; 8
; [then-branch: 80 | !(inv_2_1[Ref](x@138@01, y@139@01, z@140@01) in ys3@50@01) | live]
; [else-branch: 80 | inv_2_1[Ref](x@138@01, y@139@01, z@140@01) in ys3@50@01 | live]
(push) ; 9
; [then-branch: 80 | !(inv_2_1[Ref](x@138@01, y@139@01, z@140@01) in ys3@50@01)]
(assert (not (Set_in (inv_2_1<Ref> x@138@01 y@139@01 z@140@01) ys3@50@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 80 | inv_2_1[Ref](x@138@01, y@139@01, z@140@01) in ys3@50@01]
(assert (Set_in (inv_2_1<Ref> x@138@01 y@139@01 z@140@01) ys3@50@01))
; [eval] (inv_2_2(x, y, z) in zs3)
; [eval] inv_2_2(x, y, z)
(push) ; 10
; [then-branch: 81 | !(inv_2_2[Ref](x@138@01, y@139@01, z@140@01) in zs3@61@01) | live]
; [else-branch: 81 | inv_2_2[Ref](x@138@01, y@139@01, z@140@01) in zs3@61@01 | live]
(push) ; 11
; [then-branch: 81 | !(inv_2_2[Ref](x@138@01, y@139@01, z@140@01) in zs3@61@01)]
(assert (not (Set_in (inv_2_2<Ref> x@138@01 y@139@01 z@140@01) zs3@61@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 81 | inv_2_2[Ref](x@138@01, y@139@01, z@140@01) in zs3@61@01]
(assert (Set_in (inv_2_2<Ref> x@138@01 y@139@01 z@140@01) zs3@61@01))
; [eval] x == x
(push) ; 12
; [then-branch: 82 | False | live]
; [else-branch: 82 | True | live]
(push) ; 13
; [then-branch: 82 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 82 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 83 | False | live]
; [else-branch: 83 | True | live]
(push) ; 15
; [then-branch: 83 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 83 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_2_2<Ref> x@138@01 y@139@01 z@140@01) zs3@61@01)
  (not (Set_in (inv_2_2<Ref> x@138@01 y@139@01 z@140@01) zs3@61@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_2_1<Ref> x@138@01 y@139@01 z@140@01) ys3@50@01)
  (and
    (Set_in (inv_2_1<Ref> x@138@01 y@139@01 z@140@01) ys3@50@01)
    (or
      (Set_in (inv_2_2<Ref> x@138@01 y@139@01 z@140@01) zs3@61@01)
      (not (Set_in (inv_2_2<Ref> x@138@01 y@139@01 z@140@01) zs3@61@01))))))
(assert (or
  (Set_in (inv_2_1<Ref> x@138@01 y@139@01 z@140@01) ys3@50@01)
  (not (Set_in (inv_2_1<Ref> x@138@01 y@139@01 z@140@01) ys3@50@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_2_0<Ref> x@138@01 y@139@01 z@140@01) xs3@39@01)
  (and
    (Set_in (inv_2_0<Ref> x@138@01 y@139@01 z@140@01) xs3@39@01)
    (=>
      (Set_in (inv_2_1<Ref> x@138@01 y@139@01 z@140@01) ys3@50@01)
      (and
        (Set_in (inv_2_1<Ref> x@138@01 y@139@01 z@140@01) ys3@50@01)
        (or
          (Set_in (inv_2_2<Ref> x@138@01 y@139@01 z@140@01) zs3@61@01)
          (not (Set_in (inv_2_2<Ref> x@138@01 y@139@01 z@140@01) zs3@61@01)))))
    (or
      (Set_in (inv_2_1<Ref> x@138@01 y@139@01 z@140@01) ys3@50@01)
      (not (Set_in (inv_2_1<Ref> x@138@01 y@139@01 z@140@01) ys3@50@01))))))
(assert (or
  (Set_in (inv_2_0<Ref> x@138@01 y@139@01 z@140@01) xs3@39@01)
  (not (Set_in (inv_2_0<Ref> x@138@01 y@139@01 z@140@01) xs3@39@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 68 | !(inv_3_0[Ref](x@138@01, y@139@01, z@140@01) in xs4@40@01 && inv_3_1[Ref](x@138@01, y@139@01, z@140@01) in ys4@51@01 && inv_3_2[Ref](x@138@01, y@139@01, z@140@01) in zs4@62@01)]
(assert (not
  (and
    (Set_in (inv_3_0<Ref> x@138@01 y@139@01 z@140@01) xs4@40@01)
    (and
      (Set_in (inv_3_1<Ref> x@138@01 y@139@01 z@140@01) ys4@51@01)
      (Set_in (inv_3_2<Ref> x@138@01 y@139@01 z@140@01) zs4@62@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (=
    ($PSF.perm_p (as pm@141@01  $PPM) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    (ite
      (and
        (and (img@83@01 x y z) (img@85@01 x y z) (img@87@01 x y z))
        (and
          (Set_in (inv@82@01 x y z) xs@70@01)
          (and
            (Set_in (inv@84@01 x y z) ys@71@01)
            (Set_in (inv@86@01 x y z) zs@72@01))))
      q@73@01
      $Perm.No))
  :pattern (($PSF.perm_p (as pm@141@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resPrmSumDef8|)))
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (and
    ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    ($PSF.loc_p ($PSF.lookup_p $t@81@01 ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))))
  :pattern (($PSF.perm_p (as pm@141@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resTrgDef9|)))
(assert (=>
  (and
    (Set_in (inv_3_0<Ref> x@138@01 y@139@01 z@140@01) xs4@40@01)
    (and
      (Set_in (inv_3_1<Ref> x@138@01 y@139@01 z@140@01) ys4@51@01)
      (Set_in (inv_3_2<Ref> x@138@01 y@139@01 z@140@01) zs4@62@01)))
  (and
    (Set_in (inv_3_0<Ref> x@138@01 y@139@01 z@140@01) xs4@40@01)
    (Set_in (inv_3_1<Ref> x@138@01 y@139@01 z@140@01) ys4@51@01)
    (Set_in (inv_3_2<Ref> x@138@01 y@139@01 z@140@01) zs4@62@01)
    ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x@138@01)
        ($SortWrappers.$RefTo$Snap y@139@01))
      ($SortWrappers.$RefTo$Snap z@140@01))) ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x@138@01)
        ($SortWrappers.$RefTo$Snap y@139@01))
      ($SortWrappers.$RefTo$Snap z@140@01)))
    (=>
      (Set_in (inv_0_0<Ref> x@138@01 y@139@01 z@140@01) xs1@37@01)
      (and
        (Set_in (inv_0_0<Ref> x@138@01 y@139@01 z@140@01) xs1@37@01)
        (=>
          (Set_in (inv_0_1<Ref> x@138@01 y@139@01 z@140@01) ys1@48@01)
          (and
            (Set_in (inv_0_1<Ref> x@138@01 y@139@01 z@140@01) ys1@48@01)
            (or
              (Set_in (inv_0_2<Ref> x@138@01 y@139@01 z@140@01) zs1@59@01)
              (not (Set_in (inv_0_2<Ref> x@138@01 y@139@01 z@140@01) zs1@59@01)))))
        (or
          (Set_in (inv_0_1<Ref> x@138@01 y@139@01 z@140@01) ys1@48@01)
          (not (Set_in (inv_0_1<Ref> x@138@01 y@139@01 z@140@01) ys1@48@01)))))
    (or
      (Set_in (inv_0_0<Ref> x@138@01 y@139@01 z@140@01) xs1@37@01)
      (not (Set_in (inv_0_0<Ref> x@138@01 y@139@01 z@140@01) xs1@37@01)))
    (=>
      (Set_in (inv_1_0<Ref> x@138@01 y@139@01 z@140@01) xs2@38@01)
      (and
        (Set_in (inv_1_0<Ref> x@138@01 y@139@01 z@140@01) xs2@38@01)
        (=>
          (Set_in (inv_1_1<Ref> x@138@01 y@139@01 z@140@01) ys2@49@01)
          (and
            (Set_in (inv_1_1<Ref> x@138@01 y@139@01 z@140@01) ys2@49@01)
            (or
              (Set_in (inv_1_2<Ref> x@138@01 y@139@01 z@140@01) zs2@60@01)
              (not (Set_in (inv_1_2<Ref> x@138@01 y@139@01 z@140@01) zs2@60@01)))))
        (or
          (Set_in (inv_1_1<Ref> x@138@01 y@139@01 z@140@01) ys2@49@01)
          (not (Set_in (inv_1_1<Ref> x@138@01 y@139@01 z@140@01) ys2@49@01)))))
    (or
      (Set_in (inv_1_0<Ref> x@138@01 y@139@01 z@140@01) xs2@38@01)
      (not (Set_in (inv_1_0<Ref> x@138@01 y@139@01 z@140@01) xs2@38@01)))
    (=>
      (Set_in (inv_2_0<Ref> x@138@01 y@139@01 z@140@01) xs3@39@01)
      (and
        (Set_in (inv_2_0<Ref> x@138@01 y@139@01 z@140@01) xs3@39@01)
        (=>
          (Set_in (inv_2_1<Ref> x@138@01 y@139@01 z@140@01) ys3@50@01)
          (and
            (Set_in (inv_2_1<Ref> x@138@01 y@139@01 z@140@01) ys3@50@01)
            (or
              (Set_in (inv_2_2<Ref> x@138@01 y@139@01 z@140@01) zs3@61@01)
              (not (Set_in (inv_2_2<Ref> x@138@01 y@139@01 z@140@01) zs3@61@01)))))
        (or
          (Set_in (inv_2_1<Ref> x@138@01 y@139@01 z@140@01) ys3@50@01)
          (not (Set_in (inv_2_1<Ref> x@138@01 y@139@01 z@140@01) ys3@50@01)))))
    (or
      (Set_in (inv_2_0<Ref> x@138@01 y@139@01 z@140@01) xs3@39@01)
      (not (Set_in (inv_2_0<Ref> x@138@01 y@139@01 z@140@01) xs3@39@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in (inv_3_0<Ref> x@138@01 y@139@01 z@140@01) xs4@40@01)
      (and
        (Set_in (inv_3_1<Ref> x@138@01 y@139@01 z@140@01) ys4@51@01)
        (Set_in (inv_3_2<Ref> x@138@01 y@139@01 z@140@01) zs4@62@01))))
  (and
    (Set_in (inv_3_0<Ref> x@138@01 y@139@01 z@140@01) xs4@40@01)
    (and
      (Set_in (inv_3_1<Ref> x@138@01 y@139@01 z@140@01) ys4@51@01)
      (Set_in (inv_3_2<Ref> x@138@01 y@139@01 z@140@01) zs4@62@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (=
    ($PSF.perm_p (as pm@141@01  $PPM) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    (ite
      (and
        (and (img@83@01 x y z) (img@85@01 x y z) (img@87@01 x y z))
        (and
          (Set_in (inv@82@01 x y z) xs@70@01)
          (and
            (Set_in (inv@84@01 x y z) ys@71@01)
            (Set_in (inv@86@01 x y z) zs@72@01))))
      q@73@01
      $Perm.No))
  :pattern (($PSF.perm_p (as pm@141@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resPrmSumDef8|)))
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (and
    ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    ($PSF.loc_p ($PSF.lookup_p $t@81@01 ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))))
  :pattern (($PSF.perm_p (as pm@141@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resTrgDef9|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@138@01 $Ref) (y@139@01 $Ref) (z@140@01 $Ref)) (!
  (and
    (=>
      (Set_in (inv_3_0<Ref> x@138@01 y@139@01 z@140@01) xs4@40@01)
      (and
        (Set_in (inv_3_0<Ref> x@138@01 y@139@01 z@140@01) xs4@40@01)
        (or
          (Set_in (inv_3_1<Ref> x@138@01 y@139@01 z@140@01) ys4@51@01)
          (not (Set_in (inv_3_1<Ref> x@138@01 y@139@01 z@140@01) ys4@51@01)))))
    (or
      (Set_in (inv_3_0<Ref> x@138@01 y@139@01 z@140@01) xs4@40@01)
      (not (Set_in (inv_3_0<Ref> x@138@01 y@139@01 z@140@01) xs4@40@01)))
    (=>
      (and
        (Set_in (inv_3_0<Ref> x@138@01 y@139@01 z@140@01) xs4@40@01)
        (and
          (Set_in (inv_3_1<Ref> x@138@01 y@139@01 z@140@01) ys4@51@01)
          (Set_in (inv_3_2<Ref> x@138@01 y@139@01 z@140@01) zs4@62@01)))
      (and
        (Set_in (inv_3_0<Ref> x@138@01 y@139@01 z@140@01) xs4@40@01)
        (Set_in (inv_3_1<Ref> x@138@01 y@139@01 z@140@01) ys4@51@01)
        (Set_in (inv_3_2<Ref> x@138@01 y@139@01 z@140@01) zs4@62@01)
        ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap x@138@01)
            ($SortWrappers.$RefTo$Snap y@139@01))
          ($SortWrappers.$RefTo$Snap z@140@01))) ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap x@138@01)
            ($SortWrappers.$RefTo$Snap y@139@01))
          ($SortWrappers.$RefTo$Snap z@140@01)))
        (=>
          (Set_in (inv_0_0<Ref> x@138@01 y@139@01 z@140@01) xs1@37@01)
          (and
            (Set_in (inv_0_0<Ref> x@138@01 y@139@01 z@140@01) xs1@37@01)
            (=>
              (Set_in (inv_0_1<Ref> x@138@01 y@139@01 z@140@01) ys1@48@01)
              (and
                (Set_in (inv_0_1<Ref> x@138@01 y@139@01 z@140@01) ys1@48@01)
                (or
                  (Set_in (inv_0_2<Ref> x@138@01 y@139@01 z@140@01) zs1@59@01)
                  (not
                    (Set_in (inv_0_2<Ref> x@138@01 y@139@01 z@140@01) zs1@59@01)))))
            (or
              (Set_in (inv_0_1<Ref> x@138@01 y@139@01 z@140@01) ys1@48@01)
              (not (Set_in (inv_0_1<Ref> x@138@01 y@139@01 z@140@01) ys1@48@01)))))
        (or
          (Set_in (inv_0_0<Ref> x@138@01 y@139@01 z@140@01) xs1@37@01)
          (not (Set_in (inv_0_0<Ref> x@138@01 y@139@01 z@140@01) xs1@37@01)))
        (=>
          (Set_in (inv_1_0<Ref> x@138@01 y@139@01 z@140@01) xs2@38@01)
          (and
            (Set_in (inv_1_0<Ref> x@138@01 y@139@01 z@140@01) xs2@38@01)
            (=>
              (Set_in (inv_1_1<Ref> x@138@01 y@139@01 z@140@01) ys2@49@01)
              (and
                (Set_in (inv_1_1<Ref> x@138@01 y@139@01 z@140@01) ys2@49@01)
                (or
                  (Set_in (inv_1_2<Ref> x@138@01 y@139@01 z@140@01) zs2@60@01)
                  (not
                    (Set_in (inv_1_2<Ref> x@138@01 y@139@01 z@140@01) zs2@60@01)))))
            (or
              (Set_in (inv_1_1<Ref> x@138@01 y@139@01 z@140@01) ys2@49@01)
              (not (Set_in (inv_1_1<Ref> x@138@01 y@139@01 z@140@01) ys2@49@01)))))
        (or
          (Set_in (inv_1_0<Ref> x@138@01 y@139@01 z@140@01) xs2@38@01)
          (not (Set_in (inv_1_0<Ref> x@138@01 y@139@01 z@140@01) xs2@38@01)))
        (=>
          (Set_in (inv_2_0<Ref> x@138@01 y@139@01 z@140@01) xs3@39@01)
          (and
            (Set_in (inv_2_0<Ref> x@138@01 y@139@01 z@140@01) xs3@39@01)
            (=>
              (Set_in (inv_2_1<Ref> x@138@01 y@139@01 z@140@01) ys3@50@01)
              (and
                (Set_in (inv_2_1<Ref> x@138@01 y@139@01 z@140@01) ys3@50@01)
                (or
                  (Set_in (inv_2_2<Ref> x@138@01 y@139@01 z@140@01) zs3@61@01)
                  (not
                    (Set_in (inv_2_2<Ref> x@138@01 y@139@01 z@140@01) zs3@61@01)))))
            (or
              (Set_in (inv_2_1<Ref> x@138@01 y@139@01 z@140@01) ys3@50@01)
              (not (Set_in (inv_2_1<Ref> x@138@01 y@139@01 z@140@01) ys3@50@01)))))
        (or
          (Set_in (inv_2_0<Ref> x@138@01 y@139@01 z@140@01) xs3@39@01)
          (not (Set_in (inv_2_0<Ref> x@138@01 y@139@01 z@140@01) xs3@39@01)))))
    (or
      (not
        (and
          (Set_in (inv_3_0<Ref> x@138@01 y@139@01 z@140@01) xs4@40@01)
          (and
            (Set_in (inv_3_1<Ref> x@138@01 y@139@01 z@140@01) ys4@51@01)
            (Set_in (inv_3_2<Ref> x@138@01 y@139@01 z@140@01) zs4@62@01))))
      (and
        (Set_in (inv_3_0<Ref> x@138@01 y@139@01 z@140@01) xs4@40@01)
        (and
          (Set_in (inv_3_1<Ref> x@138@01 y@139@01 z@140@01) ys4@51@01)
          (Set_in (inv_3_2<Ref> x@138@01 y@139@01 z@140@01) zs4@62@01)))))
  :pattern ((inv_3_0<Ref> x@138@01 y@139@01 z@140@01) (inv_3_1<Ref> x@138@01 y@139@01 z@140@01) (inv_3_2<Ref> x@138@01 y@139@01 z@140@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@23@9@23@122-aux|)))
(assert (forall ((x@138@01 $Ref) (y@139@01 $Ref) (z@140@01 $Ref)) (!
  (=>
    (and
      (Set_in (inv_3_0<Ref> x@138@01 y@139@01 z@140@01) xs4@40@01)
      (and
        (Set_in (inv_3_1<Ref> x@138@01 y@139@01 z@140@01) ys4@51@01)
        (Set_in (inv_3_2<Ref> x@138@01 y@139@01 z@140@01) zs4@62@01)))
    (>=
      ($PSF.perm_p (as pm@141@01  $PPM) ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap x@138@01)
          ($SortWrappers.$RefTo$Snap y@139@01))
        ($SortWrappers.$RefTo$Snap z@140@01)))
      (__iar__assume_helper_3<Perm> (and
        (Set_in (inv_0_0<Ref> x@138@01 y@139@01 z@140@01) xs1@37@01)
        (and
          (Set_in (inv_0_1<Ref> x@138@01 y@139@01 z@140@01) ys1@48@01)
          (Set_in (inv_0_2<Ref> x@138@01 y@139@01 z@140@01) zs1@59@01))) (and
        (Set_in (inv_1_0<Ref> x@138@01 y@139@01 z@140@01) xs2@38@01)
        (and
          (Set_in (inv_1_1<Ref> x@138@01 y@139@01 z@140@01) ys2@49@01)
          (Set_in (inv_1_2<Ref> x@138@01 y@139@01 z@140@01) zs2@60@01))) (and
        (Set_in (inv_2_0<Ref> x@138@01 y@139@01 z@140@01) xs3@39@01)
        (and
          (Set_in (inv_2_1<Ref> x@138@01 y@139@01 z@140@01) ys3@50@01)
          (Set_in (inv_2_2<Ref> x@138@01 y@139@01 z@140@01) zs3@61@01))) q@73@01 q@73@01 q@73@01 q@73@01)))
  :pattern ((inv_3_0<Ref> x@138@01 y@139@01 z@140@01) (inv_3_1<Ref> x@138@01 y@139@01 z@140@01) (inv_3_2<Ref> x@138@01 y@139@01 z@140@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@23@9@23@122|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x5: Ref, y5: Ref, z5: Ref ::
;     { p(x5, y5, z5) }
;     (x5 in xs5) && ((y5 in ys5) && (z5 in zs5)) ==>
;     inv_4_0(x5, y5, z5) == x5 && inv_4_1(x5, y5, z5) == y5 &&
;     inv_4_2(x5, y5, z5) == z5)
(declare-const $t@142@01 $Snap)
(assert (= $t@142@01 $Snap.unit))
; [eval] (forall x5: Ref, y5: Ref, z5: Ref :: { p(x5, y5, z5) } (x5 in xs5) && ((y5 in ys5) && (z5 in zs5)) ==> inv_4_0(x5, y5, z5) == x5 && inv_4_1(x5, y5, z5) == y5 && inv_4_2(x5, y5, z5) == z5)
(declare-const x5@143@01 $Ref)
(declare-const y5@144@01 $Ref)
(declare-const z5@145@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x5 in xs5) && ((y5 in ys5) && (z5 in zs5)) ==> inv_4_0(x5, y5, z5) == x5 && inv_4_1(x5, y5, z5) == y5 && inv_4_2(x5, y5, z5) == z5
; [eval] (x5 in xs5) && ((y5 in ys5) && (z5 in zs5))
; [eval] (x5 in xs5)
(push) ; 4
; [then-branch: 84 | !(x5@143@01 in xs5@41@01) | live]
; [else-branch: 84 | x5@143@01 in xs5@41@01 | live]
(push) ; 5
; [then-branch: 84 | !(x5@143@01 in xs5@41@01)]
(assert (not (Set_in x5@143@01 xs5@41@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 84 | x5@143@01 in xs5@41@01]
(assert (Set_in x5@143@01 xs5@41@01))
; [eval] (y5 in ys5)
(push) ; 6
; [then-branch: 85 | !(y5@144@01 in ys5@52@01) | live]
; [else-branch: 85 | y5@144@01 in ys5@52@01 | live]
(push) ; 7
; [then-branch: 85 | !(y5@144@01 in ys5@52@01)]
(assert (not (Set_in y5@144@01 ys5@52@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 85 | y5@144@01 in ys5@52@01]
(assert (Set_in y5@144@01 ys5@52@01))
; [eval] (z5 in zs5)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (Set_in y5@144@01 ys5@52@01) (not (Set_in y5@144@01 ys5@52@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in x5@143@01 xs5@41@01)
  (and
    (Set_in x5@143@01 xs5@41@01)
    (or (Set_in y5@144@01 ys5@52@01) (not (Set_in y5@144@01 ys5@52@01))))))
(assert (or (Set_in x5@143@01 xs5@41@01) (not (Set_in x5@143@01 xs5@41@01))))
(push) ; 4
; [then-branch: 86 | x5@143@01 in xs5@41@01 && y5@144@01 in ys5@52@01 && z5@145@01 in zs5@63@01 | live]
; [else-branch: 86 | !(x5@143@01 in xs5@41@01 && y5@144@01 in ys5@52@01 && z5@145@01 in zs5@63@01) | live]
(push) ; 5
; [then-branch: 86 | x5@143@01 in xs5@41@01 && y5@144@01 in ys5@52@01 && z5@145@01 in zs5@63@01]
(assert (and
  (Set_in x5@143@01 xs5@41@01)
  (and (Set_in y5@144@01 ys5@52@01) (Set_in z5@145@01 zs5@63@01))))
; [eval] inv_4_0(x5, y5, z5) == x5 && inv_4_1(x5, y5, z5) == y5 && inv_4_2(x5, y5, z5) == z5
; [eval] inv_4_0(x5, y5, z5) == x5
; [eval] inv_4_0(x5, y5, z5)
(push) ; 6
; [then-branch: 87 | inv_4_0[Ref](x5@143@01, y5@144@01, z5@145@01) != x5@143@01 | live]
; [else-branch: 87 | inv_4_0[Ref](x5@143@01, y5@144@01, z5@145@01) == x5@143@01 | live]
(push) ; 7
; [then-branch: 87 | inv_4_0[Ref](x5@143@01, y5@144@01, z5@145@01) != x5@143@01]
(assert (not (= (inv_4_0<Ref> x5@143@01 y5@144@01 z5@145@01) x5@143@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 87 | inv_4_0[Ref](x5@143@01, y5@144@01, z5@145@01) == x5@143@01]
(assert (= (inv_4_0<Ref> x5@143@01 y5@144@01 z5@145@01) x5@143@01))
; [eval] inv_4_1(x5, y5, z5) == y5
; [eval] inv_4_1(x5, y5, z5)
(push) ; 8
; [then-branch: 88 | inv_4_1[Ref](x5@143@01, y5@144@01, z5@145@01) != y5@144@01 | live]
; [else-branch: 88 | inv_4_1[Ref](x5@143@01, y5@144@01, z5@145@01) == y5@144@01 | live]
(push) ; 9
; [then-branch: 88 | inv_4_1[Ref](x5@143@01, y5@144@01, z5@145@01) != y5@144@01]
(assert (not (= (inv_4_1<Ref> x5@143@01 y5@144@01 z5@145@01) y5@144@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 88 | inv_4_1[Ref](x5@143@01, y5@144@01, z5@145@01) == y5@144@01]
(assert (= (inv_4_1<Ref> x5@143@01 y5@144@01 z5@145@01) y5@144@01))
; [eval] inv_4_2(x5, y5, z5) == z5
; [eval] inv_4_2(x5, y5, z5)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or
  (= (inv_4_1<Ref> x5@143@01 y5@144@01 z5@145@01) y5@144@01)
  (not (= (inv_4_1<Ref> x5@143@01 y5@144@01 z5@145@01) y5@144@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (= (inv_4_0<Ref> x5@143@01 y5@144@01 z5@145@01) x5@143@01)
  (and
    (= (inv_4_0<Ref> x5@143@01 y5@144@01 z5@145@01) x5@143@01)
    (or
      (= (inv_4_1<Ref> x5@143@01 y5@144@01 z5@145@01) y5@144@01)
      (not (= (inv_4_1<Ref> x5@143@01 y5@144@01 z5@145@01) y5@144@01))))))
(assert (or
  (= (inv_4_0<Ref> x5@143@01 y5@144@01 z5@145@01) x5@143@01)
  (not (= (inv_4_0<Ref> x5@143@01 y5@144@01 z5@145@01) x5@143@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 86 | !(x5@143@01 in xs5@41@01 && y5@144@01 in ys5@52@01 && z5@145@01 in zs5@63@01)]
(assert (not
  (and
    (Set_in x5@143@01 xs5@41@01)
    (and (Set_in y5@144@01 ys5@52@01) (Set_in z5@145@01 zs5@63@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Set_in x5@143@01 xs5@41@01)
    (and (Set_in y5@144@01 ys5@52@01) (Set_in z5@145@01 zs5@63@01)))
  (and
    (Set_in x5@143@01 xs5@41@01)
    (Set_in y5@144@01 ys5@52@01)
    (Set_in z5@145@01 zs5@63@01)
    (=>
      (= (inv_4_0<Ref> x5@143@01 y5@144@01 z5@145@01) x5@143@01)
      (and
        (= (inv_4_0<Ref> x5@143@01 y5@144@01 z5@145@01) x5@143@01)
        (or
          (= (inv_4_1<Ref> x5@143@01 y5@144@01 z5@145@01) y5@144@01)
          (not (= (inv_4_1<Ref> x5@143@01 y5@144@01 z5@145@01) y5@144@01)))))
    (or
      (= (inv_4_0<Ref> x5@143@01 y5@144@01 z5@145@01) x5@143@01)
      (not (= (inv_4_0<Ref> x5@143@01 y5@144@01 z5@145@01) x5@143@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in x5@143@01 xs5@41@01)
      (and (Set_in y5@144@01 ys5@52@01) (Set_in z5@145@01 zs5@63@01))))
  (and
    (Set_in x5@143@01 xs5@41@01)
    (and (Set_in y5@144@01 ys5@52@01) (Set_in z5@145@01 zs5@63@01)))))
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x5@143@01 $Ref) (y5@144@01 $Ref) (z5@145@01 $Ref)) (!
  (and
    (=>
      (Set_in x5@143@01 xs5@41@01)
      (and
        (Set_in x5@143@01 xs5@41@01)
        (or (Set_in y5@144@01 ys5@52@01) (not (Set_in y5@144@01 ys5@52@01)))))
    (or (Set_in x5@143@01 xs5@41@01) (not (Set_in x5@143@01 xs5@41@01)))
    (=>
      (and
        (Set_in x5@143@01 xs5@41@01)
        (and (Set_in y5@144@01 ys5@52@01) (Set_in z5@145@01 zs5@63@01)))
      (and
        (Set_in x5@143@01 xs5@41@01)
        (Set_in y5@144@01 ys5@52@01)
        (Set_in z5@145@01 zs5@63@01)
        (=>
          (= (inv_4_0<Ref> x5@143@01 y5@144@01 z5@145@01) x5@143@01)
          (and
            (= (inv_4_0<Ref> x5@143@01 y5@144@01 z5@145@01) x5@143@01)
            (or
              (= (inv_4_1<Ref> x5@143@01 y5@144@01 z5@145@01) y5@144@01)
              (not (= (inv_4_1<Ref> x5@143@01 y5@144@01 z5@145@01) y5@144@01)))))
        (or
          (= (inv_4_0<Ref> x5@143@01 y5@144@01 z5@145@01) x5@143@01)
          (not (= (inv_4_0<Ref> x5@143@01 y5@144@01 z5@145@01) x5@143@01)))))
    (or
      (not
        (and
          (Set_in x5@143@01 xs5@41@01)
          (and (Set_in y5@144@01 ys5@52@01) (Set_in z5@145@01 zs5@63@01))))
      (and
        (Set_in x5@143@01 xs5@41@01)
        (and (Set_in y5@144@01 ys5@52@01) (Set_in z5@145@01 zs5@63@01)))))
  :pattern (($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap x5@143@01)
      ($SortWrappers.$RefTo$Snap y5@144@01))
    ($SortWrappers.$RefTo$Snap z5@145@01))) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap x5@143@01)
      ($SortWrappers.$RefTo$Snap y5@144@01))
    ($SortWrappers.$RefTo$Snap z5@145@01))))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@24@9@24@122-aux|)))
(assert (forall ((x5@143@01 $Ref) (y5@144@01 $Ref) (z5@145@01 $Ref)) (!
  (=>
    (and
      (Set_in x5@143@01 xs5@41@01)
      (and (Set_in y5@144@01 ys5@52@01) (Set_in z5@145@01 zs5@63@01)))
    (and
      (= (inv_4_0<Ref> x5@143@01 y5@144@01 z5@145@01) x5@143@01)
      (and
        (= (inv_4_1<Ref> x5@143@01 y5@144@01 z5@145@01) y5@144@01)
        (= (inv_4_2<Ref> x5@143@01 y5@144@01 z5@145@01) z5@145@01))))
  :pattern (($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap x5@143@01)
      ($SortWrappers.$RefTo$Snap y5@144@01))
    ($SortWrappers.$RefTo$Snap z5@145@01))) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap x5@143@01)
      ($SortWrappers.$RefTo$Snap y5@144@01))
    ($SortWrappers.$RefTo$Snap z5@145@01))))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@24@9@24@122|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x: Ref, y: Ref, z: Ref ::
;     { inv_4_0(x, y, z), inv_4_1(x, y, z), inv_4_2(x, y, z) }
;     (inv_4_0(x, y, z) in xs5) &&
;     ((inv_4_1(x, y, z) in ys5) && (inv_4_2(x, y, z) in zs5)) ==>
;     inv_4_0(x, y, z) == x && inv_4_1(x, y, z) == y && inv_4_2(x, y, z) == z)
(declare-const $t@146@01 $Snap)
(assert (= $t@146@01 $Snap.unit))
; [eval] (forall x: Ref, y: Ref, z: Ref :: { inv_4_0(x, y, z), inv_4_1(x, y, z), inv_4_2(x, y, z) } (inv_4_0(x, y, z) in xs5) && ((inv_4_1(x, y, z) in ys5) && (inv_4_2(x, y, z) in zs5)) ==> inv_4_0(x, y, z) == x && inv_4_1(x, y, z) == y && inv_4_2(x, y, z) == z)
(declare-const x@147@01 $Ref)
(declare-const y@148@01 $Ref)
(declare-const z@149@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (inv_4_0(x, y, z) in xs5) && ((inv_4_1(x, y, z) in ys5) && (inv_4_2(x, y, z) in zs5)) ==> inv_4_0(x, y, z) == x && inv_4_1(x, y, z) == y && inv_4_2(x, y, z) == z
; [eval] (inv_4_0(x, y, z) in xs5) && ((inv_4_1(x, y, z) in ys5) && (inv_4_2(x, y, z) in zs5))
; [eval] (inv_4_0(x, y, z) in xs5)
; [eval] inv_4_0(x, y, z)
(push) ; 4
; [then-branch: 89 | !(inv_4_0[Ref](x@147@01, y@148@01, z@149@01) in xs5@41@01) | live]
; [else-branch: 89 | inv_4_0[Ref](x@147@01, y@148@01, z@149@01) in xs5@41@01 | live]
(push) ; 5
; [then-branch: 89 | !(inv_4_0[Ref](x@147@01, y@148@01, z@149@01) in xs5@41@01)]
(assert (not (Set_in (inv_4_0<Ref> x@147@01 y@148@01 z@149@01) xs5@41@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 89 | inv_4_0[Ref](x@147@01, y@148@01, z@149@01) in xs5@41@01]
(assert (Set_in (inv_4_0<Ref> x@147@01 y@148@01 z@149@01) xs5@41@01))
; [eval] (inv_4_1(x, y, z) in ys5)
; [eval] inv_4_1(x, y, z)
(push) ; 6
; [then-branch: 90 | !(inv_4_1[Ref](x@147@01, y@148@01, z@149@01) in ys5@52@01) | live]
; [else-branch: 90 | inv_4_1[Ref](x@147@01, y@148@01, z@149@01) in ys5@52@01 | live]
(push) ; 7
; [then-branch: 90 | !(inv_4_1[Ref](x@147@01, y@148@01, z@149@01) in ys5@52@01)]
(assert (not (Set_in (inv_4_1<Ref> x@147@01 y@148@01 z@149@01) ys5@52@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 90 | inv_4_1[Ref](x@147@01, y@148@01, z@149@01) in ys5@52@01]
(assert (Set_in (inv_4_1<Ref> x@147@01 y@148@01 z@149@01) ys5@52@01))
; [eval] (inv_4_2(x, y, z) in zs5)
; [eval] inv_4_2(x, y, z)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_4_1<Ref> x@147@01 y@148@01 z@149@01) ys5@52@01)
  (not (Set_in (inv_4_1<Ref> x@147@01 y@148@01 z@149@01) ys5@52@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_4_0<Ref> x@147@01 y@148@01 z@149@01) xs5@41@01)
  (and
    (Set_in (inv_4_0<Ref> x@147@01 y@148@01 z@149@01) xs5@41@01)
    (or
      (Set_in (inv_4_1<Ref> x@147@01 y@148@01 z@149@01) ys5@52@01)
      (not (Set_in (inv_4_1<Ref> x@147@01 y@148@01 z@149@01) ys5@52@01))))))
(assert (or
  (Set_in (inv_4_0<Ref> x@147@01 y@148@01 z@149@01) xs5@41@01)
  (not (Set_in (inv_4_0<Ref> x@147@01 y@148@01 z@149@01) xs5@41@01))))
(push) ; 4
; [then-branch: 91 | inv_4_0[Ref](x@147@01, y@148@01, z@149@01) in xs5@41@01 && inv_4_1[Ref](x@147@01, y@148@01, z@149@01) in ys5@52@01 && inv_4_2[Ref](x@147@01, y@148@01, z@149@01) in zs5@63@01 | live]
; [else-branch: 91 | !(inv_4_0[Ref](x@147@01, y@148@01, z@149@01) in xs5@41@01 && inv_4_1[Ref](x@147@01, y@148@01, z@149@01) in ys5@52@01 && inv_4_2[Ref](x@147@01, y@148@01, z@149@01) in zs5@63@01) | live]
(push) ; 5
; [then-branch: 91 | inv_4_0[Ref](x@147@01, y@148@01, z@149@01) in xs5@41@01 && inv_4_1[Ref](x@147@01, y@148@01, z@149@01) in ys5@52@01 && inv_4_2[Ref](x@147@01, y@148@01, z@149@01) in zs5@63@01]
(assert (and
  (Set_in (inv_4_0<Ref> x@147@01 y@148@01 z@149@01) xs5@41@01)
  (and
    (Set_in (inv_4_1<Ref> x@147@01 y@148@01 z@149@01) ys5@52@01)
    (Set_in (inv_4_2<Ref> x@147@01 y@148@01 z@149@01) zs5@63@01))))
; [eval] inv_4_0(x, y, z) == x && inv_4_1(x, y, z) == y && inv_4_2(x, y, z) == z
; [eval] inv_4_0(x, y, z) == x
; [eval] inv_4_0(x, y, z)
(push) ; 6
; [then-branch: 92 | inv_4_0[Ref](x@147@01, y@148@01, z@149@01) != x@147@01 | live]
; [else-branch: 92 | inv_4_0[Ref](x@147@01, y@148@01, z@149@01) == x@147@01 | live]
(push) ; 7
; [then-branch: 92 | inv_4_0[Ref](x@147@01, y@148@01, z@149@01) != x@147@01]
(assert (not (= (inv_4_0<Ref> x@147@01 y@148@01 z@149@01) x@147@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 92 | inv_4_0[Ref](x@147@01, y@148@01, z@149@01) == x@147@01]
(assert (= (inv_4_0<Ref> x@147@01 y@148@01 z@149@01) x@147@01))
; [eval] inv_4_1(x, y, z) == y
; [eval] inv_4_1(x, y, z)
(push) ; 8
; [then-branch: 93 | inv_4_1[Ref](x@147@01, y@148@01, z@149@01) != y@148@01 | live]
; [else-branch: 93 | inv_4_1[Ref](x@147@01, y@148@01, z@149@01) == y@148@01 | live]
(push) ; 9
; [then-branch: 93 | inv_4_1[Ref](x@147@01, y@148@01, z@149@01) != y@148@01]
(assert (not (= (inv_4_1<Ref> x@147@01 y@148@01 z@149@01) y@148@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 93 | inv_4_1[Ref](x@147@01, y@148@01, z@149@01) == y@148@01]
(assert (= (inv_4_1<Ref> x@147@01 y@148@01 z@149@01) y@148@01))
; [eval] inv_4_2(x, y, z) == z
; [eval] inv_4_2(x, y, z)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or
  (= (inv_4_1<Ref> x@147@01 y@148@01 z@149@01) y@148@01)
  (not (= (inv_4_1<Ref> x@147@01 y@148@01 z@149@01) y@148@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (= (inv_4_0<Ref> x@147@01 y@148@01 z@149@01) x@147@01)
  (and
    (= (inv_4_0<Ref> x@147@01 y@148@01 z@149@01) x@147@01)
    (or
      (= (inv_4_1<Ref> x@147@01 y@148@01 z@149@01) y@148@01)
      (not (= (inv_4_1<Ref> x@147@01 y@148@01 z@149@01) y@148@01))))))
(assert (or
  (= (inv_4_0<Ref> x@147@01 y@148@01 z@149@01) x@147@01)
  (not (= (inv_4_0<Ref> x@147@01 y@148@01 z@149@01) x@147@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 91 | !(inv_4_0[Ref](x@147@01, y@148@01, z@149@01) in xs5@41@01 && inv_4_1[Ref](x@147@01, y@148@01, z@149@01) in ys5@52@01 && inv_4_2[Ref](x@147@01, y@148@01, z@149@01) in zs5@63@01)]
(assert (not
  (and
    (Set_in (inv_4_0<Ref> x@147@01 y@148@01 z@149@01) xs5@41@01)
    (and
      (Set_in (inv_4_1<Ref> x@147@01 y@148@01 z@149@01) ys5@52@01)
      (Set_in (inv_4_2<Ref> x@147@01 y@148@01 z@149@01) zs5@63@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Set_in (inv_4_0<Ref> x@147@01 y@148@01 z@149@01) xs5@41@01)
    (and
      (Set_in (inv_4_1<Ref> x@147@01 y@148@01 z@149@01) ys5@52@01)
      (Set_in (inv_4_2<Ref> x@147@01 y@148@01 z@149@01) zs5@63@01)))
  (and
    (Set_in (inv_4_0<Ref> x@147@01 y@148@01 z@149@01) xs5@41@01)
    (Set_in (inv_4_1<Ref> x@147@01 y@148@01 z@149@01) ys5@52@01)
    (Set_in (inv_4_2<Ref> x@147@01 y@148@01 z@149@01) zs5@63@01)
    (=>
      (= (inv_4_0<Ref> x@147@01 y@148@01 z@149@01) x@147@01)
      (and
        (= (inv_4_0<Ref> x@147@01 y@148@01 z@149@01) x@147@01)
        (or
          (= (inv_4_1<Ref> x@147@01 y@148@01 z@149@01) y@148@01)
          (not (= (inv_4_1<Ref> x@147@01 y@148@01 z@149@01) y@148@01)))))
    (or
      (= (inv_4_0<Ref> x@147@01 y@148@01 z@149@01) x@147@01)
      (not (= (inv_4_0<Ref> x@147@01 y@148@01 z@149@01) x@147@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in (inv_4_0<Ref> x@147@01 y@148@01 z@149@01) xs5@41@01)
      (and
        (Set_in (inv_4_1<Ref> x@147@01 y@148@01 z@149@01) ys5@52@01)
        (Set_in (inv_4_2<Ref> x@147@01 y@148@01 z@149@01) zs5@63@01))))
  (and
    (Set_in (inv_4_0<Ref> x@147@01 y@148@01 z@149@01) xs5@41@01)
    (and
      (Set_in (inv_4_1<Ref> x@147@01 y@148@01 z@149@01) ys5@52@01)
      (Set_in (inv_4_2<Ref> x@147@01 y@148@01 z@149@01) zs5@63@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@147@01 $Ref) (y@148@01 $Ref) (z@149@01 $Ref)) (!
  (and
    (=>
      (Set_in (inv_4_0<Ref> x@147@01 y@148@01 z@149@01) xs5@41@01)
      (and
        (Set_in (inv_4_0<Ref> x@147@01 y@148@01 z@149@01) xs5@41@01)
        (or
          (Set_in (inv_4_1<Ref> x@147@01 y@148@01 z@149@01) ys5@52@01)
          (not (Set_in (inv_4_1<Ref> x@147@01 y@148@01 z@149@01) ys5@52@01)))))
    (or
      (Set_in (inv_4_0<Ref> x@147@01 y@148@01 z@149@01) xs5@41@01)
      (not (Set_in (inv_4_0<Ref> x@147@01 y@148@01 z@149@01) xs5@41@01)))
    (=>
      (and
        (Set_in (inv_4_0<Ref> x@147@01 y@148@01 z@149@01) xs5@41@01)
        (and
          (Set_in (inv_4_1<Ref> x@147@01 y@148@01 z@149@01) ys5@52@01)
          (Set_in (inv_4_2<Ref> x@147@01 y@148@01 z@149@01) zs5@63@01)))
      (and
        (Set_in (inv_4_0<Ref> x@147@01 y@148@01 z@149@01) xs5@41@01)
        (Set_in (inv_4_1<Ref> x@147@01 y@148@01 z@149@01) ys5@52@01)
        (Set_in (inv_4_2<Ref> x@147@01 y@148@01 z@149@01) zs5@63@01)
        (=>
          (= (inv_4_0<Ref> x@147@01 y@148@01 z@149@01) x@147@01)
          (and
            (= (inv_4_0<Ref> x@147@01 y@148@01 z@149@01) x@147@01)
            (or
              (= (inv_4_1<Ref> x@147@01 y@148@01 z@149@01) y@148@01)
              (not (= (inv_4_1<Ref> x@147@01 y@148@01 z@149@01) y@148@01)))))
        (or
          (= (inv_4_0<Ref> x@147@01 y@148@01 z@149@01) x@147@01)
          (not (= (inv_4_0<Ref> x@147@01 y@148@01 z@149@01) x@147@01)))))
    (or
      (not
        (and
          (Set_in (inv_4_0<Ref> x@147@01 y@148@01 z@149@01) xs5@41@01)
          (and
            (Set_in (inv_4_1<Ref> x@147@01 y@148@01 z@149@01) ys5@52@01)
            (Set_in (inv_4_2<Ref> x@147@01 y@148@01 z@149@01) zs5@63@01))))
      (and
        (Set_in (inv_4_0<Ref> x@147@01 y@148@01 z@149@01) xs5@41@01)
        (and
          (Set_in (inv_4_1<Ref> x@147@01 y@148@01 z@149@01) ys5@52@01)
          (Set_in (inv_4_2<Ref> x@147@01 y@148@01 z@149@01) zs5@63@01)))))
  :pattern ((inv_4_0<Ref> x@147@01 y@148@01 z@149@01) (inv_4_1<Ref> x@147@01 y@148@01 z@149@01) (inv_4_2<Ref> x@147@01 y@148@01 z@149@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@24@9@24@122-aux|)))
(assert (forall ((x@147@01 $Ref) (y@148@01 $Ref) (z@149@01 $Ref)) (!
  (=>
    (and
      (Set_in (inv_4_0<Ref> x@147@01 y@148@01 z@149@01) xs5@41@01)
      (and
        (Set_in (inv_4_1<Ref> x@147@01 y@148@01 z@149@01) ys5@52@01)
        (Set_in (inv_4_2<Ref> x@147@01 y@148@01 z@149@01) zs5@63@01)))
    (and
      (= (inv_4_0<Ref> x@147@01 y@148@01 z@149@01) x@147@01)
      (and
        (= (inv_4_1<Ref> x@147@01 y@148@01 z@149@01) y@148@01)
        (= (inv_4_2<Ref> x@147@01 y@148@01 z@149@01) z@149@01))))
  :pattern ((inv_4_0<Ref> x@147@01 y@148@01 z@149@01) (inv_4_1<Ref> x@147@01 y@148@01 z@149@01) (inv_4_2<Ref> x@147@01 y@148@01 z@149@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@24@9@24@122|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x: Ref, y: Ref, z: Ref ::
;     { inv_4_0(x, y, z), inv_4_1(x, y, z), inv_4_2(x, y, z) }
;     (inv_4_0(x, y, z) in xs5) &&
;     ((inv_4_1(x, y, z) in ys5) && (inv_4_2(x, y, z) in zs5)) ==>
;     perm(p(x, y, z)) >=
;     __iar__assume_helper_4((inv_0_0(x, y, z) in xs1) &&
;     ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) &&
;     (x == x && y == y && z == z), (inv_1_0(x, y, z) in xs2) &&
;     ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) &&
;     (x == x && y == y && z == z), (inv_2_0(x, y, z) in xs3) &&
;     ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) &&
;     (x == x && y == y && z == z), (inv_3_0(x, y, z) in xs4) &&
;     ((inv_3_1(x, y, z) in ys4) && (inv_3_2(x, y, z) in zs4)) &&
;     (x == x && y == y && z == z), q, q, q, q, q))
(declare-const $t@150@01 $Snap)
(assert (= $t@150@01 $Snap.unit))
; [eval] (forall x: Ref, y: Ref, z: Ref :: { inv_4_0(x, y, z), inv_4_1(x, y, z), inv_4_2(x, y, z) } (inv_4_0(x, y, z) in xs5) && ((inv_4_1(x, y, z) in ys5) && (inv_4_2(x, y, z) in zs5)) ==> perm(p(x, y, z)) >= __iar__assume_helper_4((inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) && (x == x && y == y && z == z), (inv_1_0(x, y, z) in xs2) && ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) && (x == x && y == y && z == z), (inv_2_0(x, y, z) in xs3) && ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) && (x == x && y == y && z == z), (inv_3_0(x, y, z) in xs4) && ((inv_3_1(x, y, z) in ys4) && (inv_3_2(x, y, z) in zs4)) && (x == x && y == y && z == z), q, q, q, q, q))
(declare-const x@151@01 $Ref)
(declare-const y@152@01 $Ref)
(declare-const z@153@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (inv_4_0(x, y, z) in xs5) && ((inv_4_1(x, y, z) in ys5) && (inv_4_2(x, y, z) in zs5)) ==> perm(p(x, y, z)) >= __iar__assume_helper_4((inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) && (x == x && y == y && z == z), (inv_1_0(x, y, z) in xs2) && ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) && (x == x && y == y && z == z), (inv_2_0(x, y, z) in xs3) && ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) && (x == x && y == y && z == z), (inv_3_0(x, y, z) in xs4) && ((inv_3_1(x, y, z) in ys4) && (inv_3_2(x, y, z) in zs4)) && (x == x && y == y && z == z), q, q, q, q, q)
; [eval] (inv_4_0(x, y, z) in xs5) && ((inv_4_1(x, y, z) in ys5) && (inv_4_2(x, y, z) in zs5))
; [eval] (inv_4_0(x, y, z) in xs5)
; [eval] inv_4_0(x, y, z)
(push) ; 4
; [then-branch: 94 | !(inv_4_0[Ref](x@151@01, y@152@01, z@153@01) in xs5@41@01) | live]
; [else-branch: 94 | inv_4_0[Ref](x@151@01, y@152@01, z@153@01) in xs5@41@01 | live]
(push) ; 5
; [then-branch: 94 | !(inv_4_0[Ref](x@151@01, y@152@01, z@153@01) in xs5@41@01)]
(assert (not (Set_in (inv_4_0<Ref> x@151@01 y@152@01 z@153@01) xs5@41@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 94 | inv_4_0[Ref](x@151@01, y@152@01, z@153@01) in xs5@41@01]
(assert (Set_in (inv_4_0<Ref> x@151@01 y@152@01 z@153@01) xs5@41@01))
; [eval] (inv_4_1(x, y, z) in ys5)
; [eval] inv_4_1(x, y, z)
(push) ; 6
; [then-branch: 95 | !(inv_4_1[Ref](x@151@01, y@152@01, z@153@01) in ys5@52@01) | live]
; [else-branch: 95 | inv_4_1[Ref](x@151@01, y@152@01, z@153@01) in ys5@52@01 | live]
(push) ; 7
; [then-branch: 95 | !(inv_4_1[Ref](x@151@01, y@152@01, z@153@01) in ys5@52@01)]
(assert (not (Set_in (inv_4_1<Ref> x@151@01 y@152@01 z@153@01) ys5@52@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 95 | inv_4_1[Ref](x@151@01, y@152@01, z@153@01) in ys5@52@01]
(assert (Set_in (inv_4_1<Ref> x@151@01 y@152@01 z@153@01) ys5@52@01))
; [eval] (inv_4_2(x, y, z) in zs5)
; [eval] inv_4_2(x, y, z)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_4_1<Ref> x@151@01 y@152@01 z@153@01) ys5@52@01)
  (not (Set_in (inv_4_1<Ref> x@151@01 y@152@01 z@153@01) ys5@52@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_4_0<Ref> x@151@01 y@152@01 z@153@01) xs5@41@01)
  (and
    (Set_in (inv_4_0<Ref> x@151@01 y@152@01 z@153@01) xs5@41@01)
    (or
      (Set_in (inv_4_1<Ref> x@151@01 y@152@01 z@153@01) ys5@52@01)
      (not (Set_in (inv_4_1<Ref> x@151@01 y@152@01 z@153@01) ys5@52@01))))))
(assert (or
  (Set_in (inv_4_0<Ref> x@151@01 y@152@01 z@153@01) xs5@41@01)
  (not (Set_in (inv_4_0<Ref> x@151@01 y@152@01 z@153@01) xs5@41@01))))
(push) ; 4
; [then-branch: 96 | inv_4_0[Ref](x@151@01, y@152@01, z@153@01) in xs5@41@01 && inv_4_1[Ref](x@151@01, y@152@01, z@153@01) in ys5@52@01 && inv_4_2[Ref](x@151@01, y@152@01, z@153@01) in zs5@63@01 | live]
; [else-branch: 96 | !(inv_4_0[Ref](x@151@01, y@152@01, z@153@01) in xs5@41@01 && inv_4_1[Ref](x@151@01, y@152@01, z@153@01) in ys5@52@01 && inv_4_2[Ref](x@151@01, y@152@01, z@153@01) in zs5@63@01) | live]
(push) ; 5
; [then-branch: 96 | inv_4_0[Ref](x@151@01, y@152@01, z@153@01) in xs5@41@01 && inv_4_1[Ref](x@151@01, y@152@01, z@153@01) in ys5@52@01 && inv_4_2[Ref](x@151@01, y@152@01, z@153@01) in zs5@63@01]
(assert (and
  (Set_in (inv_4_0<Ref> x@151@01 y@152@01 z@153@01) xs5@41@01)
  (and
    (Set_in (inv_4_1<Ref> x@151@01 y@152@01 z@153@01) ys5@52@01)
    (Set_in (inv_4_2<Ref> x@151@01 y@152@01 z@153@01) zs5@63@01))))
; [eval] perm(p(x, y, z)) >= __iar__assume_helper_4((inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) && (x == x && y == y && z == z), (inv_1_0(x, y, z) in xs2) && ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) && (x == x && y == y && z == z), (inv_2_0(x, y, z) in xs3) && ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) && (x == x && y == y && z == z), (inv_3_0(x, y, z) in xs4) && ((inv_3_1(x, y, z) in ys4) && (inv_3_2(x, y, z) in zs4)) && (x == x && y == y && z == z), q, q, q, q, q)
; [eval] perm(p(x, y, z))
; Definitional axioms for snapshot map values
(declare-const pm@154@01 $PPM)
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (=
    ($PSF.perm_p (as pm@154@01  $PPM) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    (ite
      (and
        (and (img@83@01 x y z) (img@85@01 x y z) (img@87@01 x y z))
        (and
          (Set_in (inv@82@01 x y z) xs@70@01)
          (and
            (Set_in (inv@84@01 x y z) ys@71@01)
            (Set_in (inv@86@01 x y z) zs@72@01))))
      q@73@01
      $Perm.No))
  :pattern (($PSF.perm_p (as pm@154@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resPrmSumDef10|)))
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (and
    ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    ($PSF.loc_p ($PSF.lookup_p $t@81@01 ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))))
  :pattern (($PSF.perm_p (as pm@154@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resTrgDef11|)))
(assert ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x@151@01)
    ($SortWrappers.$RefTo$Snap y@152@01))
  ($SortWrappers.$RefTo$Snap z@153@01))) ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x@151@01)
    ($SortWrappers.$RefTo$Snap y@152@01))
  ($SortWrappers.$RefTo$Snap z@153@01))))
; [eval] __iar__assume_helper_4((inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) && (x == x && y == y && z == z), (inv_1_0(x, y, z) in xs2) && ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) && (x == x && y == y && z == z), (inv_2_0(x, y, z) in xs3) && ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) && (x == x && y == y && z == z), (inv_3_0(x, y, z) in xs4) && ((inv_3_1(x, y, z) in ys4) && (inv_3_2(x, y, z) in zs4)) && (x == x && y == y && z == z), q, q, q, q, q)
; [eval] (inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) && (x == x && y == y && z == z)
; [eval] (inv_0_0(x, y, z) in xs1)
; [eval] inv_0_0(x, y, z)
(push) ; 6
; [then-branch: 97 | !(inv_0_0[Ref](x@151@01, y@152@01, z@153@01) in xs1@37@01) | live]
; [else-branch: 97 | inv_0_0[Ref](x@151@01, y@152@01, z@153@01) in xs1@37@01 | live]
(push) ; 7
; [then-branch: 97 | !(inv_0_0[Ref](x@151@01, y@152@01, z@153@01) in xs1@37@01)]
(assert (not (Set_in (inv_0_0<Ref> x@151@01 y@152@01 z@153@01) xs1@37@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 97 | inv_0_0[Ref](x@151@01, y@152@01, z@153@01) in xs1@37@01]
(assert (Set_in (inv_0_0<Ref> x@151@01 y@152@01 z@153@01) xs1@37@01))
; [eval] (inv_0_1(x, y, z) in ys1)
; [eval] inv_0_1(x, y, z)
(push) ; 8
; [then-branch: 98 | !(inv_0_1[Ref](x@151@01, y@152@01, z@153@01) in ys1@48@01) | live]
; [else-branch: 98 | inv_0_1[Ref](x@151@01, y@152@01, z@153@01) in ys1@48@01 | live]
(push) ; 9
; [then-branch: 98 | !(inv_0_1[Ref](x@151@01, y@152@01, z@153@01) in ys1@48@01)]
(assert (not (Set_in (inv_0_1<Ref> x@151@01 y@152@01 z@153@01) ys1@48@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 98 | inv_0_1[Ref](x@151@01, y@152@01, z@153@01) in ys1@48@01]
(assert (Set_in (inv_0_1<Ref> x@151@01 y@152@01 z@153@01) ys1@48@01))
; [eval] (inv_0_2(x, y, z) in zs1)
; [eval] inv_0_2(x, y, z)
(push) ; 10
; [then-branch: 99 | !(inv_0_2[Ref](x@151@01, y@152@01, z@153@01) in zs1@59@01) | live]
; [else-branch: 99 | inv_0_2[Ref](x@151@01, y@152@01, z@153@01) in zs1@59@01 | live]
(push) ; 11
; [then-branch: 99 | !(inv_0_2[Ref](x@151@01, y@152@01, z@153@01) in zs1@59@01)]
(assert (not (Set_in (inv_0_2<Ref> x@151@01 y@152@01 z@153@01) zs1@59@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 99 | inv_0_2[Ref](x@151@01, y@152@01, z@153@01) in zs1@59@01]
(assert (Set_in (inv_0_2<Ref> x@151@01 y@152@01 z@153@01) zs1@59@01))
; [eval] x == x
(push) ; 12
; [then-branch: 100 | False | live]
; [else-branch: 100 | True | live]
(push) ; 13
; [then-branch: 100 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 100 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 101 | False | live]
; [else-branch: 101 | True | live]
(push) ; 15
; [then-branch: 101 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 101 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_0_2<Ref> x@151@01 y@152@01 z@153@01) zs1@59@01)
  (not (Set_in (inv_0_2<Ref> x@151@01 y@152@01 z@153@01) zs1@59@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_0_1<Ref> x@151@01 y@152@01 z@153@01) ys1@48@01)
  (and
    (Set_in (inv_0_1<Ref> x@151@01 y@152@01 z@153@01) ys1@48@01)
    (or
      (Set_in (inv_0_2<Ref> x@151@01 y@152@01 z@153@01) zs1@59@01)
      (not (Set_in (inv_0_2<Ref> x@151@01 y@152@01 z@153@01) zs1@59@01))))))
(assert (or
  (Set_in (inv_0_1<Ref> x@151@01 y@152@01 z@153@01) ys1@48@01)
  (not (Set_in (inv_0_1<Ref> x@151@01 y@152@01 z@153@01) ys1@48@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_0_0<Ref> x@151@01 y@152@01 z@153@01) xs1@37@01)
  (and
    (Set_in (inv_0_0<Ref> x@151@01 y@152@01 z@153@01) xs1@37@01)
    (=>
      (Set_in (inv_0_1<Ref> x@151@01 y@152@01 z@153@01) ys1@48@01)
      (and
        (Set_in (inv_0_1<Ref> x@151@01 y@152@01 z@153@01) ys1@48@01)
        (or
          (Set_in (inv_0_2<Ref> x@151@01 y@152@01 z@153@01) zs1@59@01)
          (not (Set_in (inv_0_2<Ref> x@151@01 y@152@01 z@153@01) zs1@59@01)))))
    (or
      (Set_in (inv_0_1<Ref> x@151@01 y@152@01 z@153@01) ys1@48@01)
      (not (Set_in (inv_0_1<Ref> x@151@01 y@152@01 z@153@01) ys1@48@01))))))
(assert (or
  (Set_in (inv_0_0<Ref> x@151@01 y@152@01 z@153@01) xs1@37@01)
  (not (Set_in (inv_0_0<Ref> x@151@01 y@152@01 z@153@01) xs1@37@01))))
; [eval] (inv_1_0(x, y, z) in xs2) && ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) && (x == x && y == y && z == z)
; [eval] (inv_1_0(x, y, z) in xs2)
; [eval] inv_1_0(x, y, z)
(push) ; 6
; [then-branch: 102 | !(inv_1_0[Ref](x@151@01, y@152@01, z@153@01) in xs2@38@01) | live]
; [else-branch: 102 | inv_1_0[Ref](x@151@01, y@152@01, z@153@01) in xs2@38@01 | live]
(push) ; 7
; [then-branch: 102 | !(inv_1_0[Ref](x@151@01, y@152@01, z@153@01) in xs2@38@01)]
(assert (not (Set_in (inv_1_0<Ref> x@151@01 y@152@01 z@153@01) xs2@38@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 102 | inv_1_0[Ref](x@151@01, y@152@01, z@153@01) in xs2@38@01]
(assert (Set_in (inv_1_0<Ref> x@151@01 y@152@01 z@153@01) xs2@38@01))
; [eval] (inv_1_1(x, y, z) in ys2)
; [eval] inv_1_1(x, y, z)
(push) ; 8
; [then-branch: 103 | !(inv_1_1[Ref](x@151@01, y@152@01, z@153@01) in ys2@49@01) | live]
; [else-branch: 103 | inv_1_1[Ref](x@151@01, y@152@01, z@153@01) in ys2@49@01 | live]
(push) ; 9
; [then-branch: 103 | !(inv_1_1[Ref](x@151@01, y@152@01, z@153@01) in ys2@49@01)]
(assert (not (Set_in (inv_1_1<Ref> x@151@01 y@152@01 z@153@01) ys2@49@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 103 | inv_1_1[Ref](x@151@01, y@152@01, z@153@01) in ys2@49@01]
(assert (Set_in (inv_1_1<Ref> x@151@01 y@152@01 z@153@01) ys2@49@01))
; [eval] (inv_1_2(x, y, z) in zs2)
; [eval] inv_1_2(x, y, z)
(push) ; 10
; [then-branch: 104 | !(inv_1_2[Ref](x@151@01, y@152@01, z@153@01) in zs2@60@01) | live]
; [else-branch: 104 | inv_1_2[Ref](x@151@01, y@152@01, z@153@01) in zs2@60@01 | live]
(push) ; 11
; [then-branch: 104 | !(inv_1_2[Ref](x@151@01, y@152@01, z@153@01) in zs2@60@01)]
(assert (not (Set_in (inv_1_2<Ref> x@151@01 y@152@01 z@153@01) zs2@60@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 104 | inv_1_2[Ref](x@151@01, y@152@01, z@153@01) in zs2@60@01]
(assert (Set_in (inv_1_2<Ref> x@151@01 y@152@01 z@153@01) zs2@60@01))
; [eval] x == x
(push) ; 12
; [then-branch: 105 | False | live]
; [else-branch: 105 | True | live]
(push) ; 13
; [then-branch: 105 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 105 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 106 | False | live]
; [else-branch: 106 | True | live]
(push) ; 15
; [then-branch: 106 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 106 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_1_2<Ref> x@151@01 y@152@01 z@153@01) zs2@60@01)
  (not (Set_in (inv_1_2<Ref> x@151@01 y@152@01 z@153@01) zs2@60@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_1_1<Ref> x@151@01 y@152@01 z@153@01) ys2@49@01)
  (and
    (Set_in (inv_1_1<Ref> x@151@01 y@152@01 z@153@01) ys2@49@01)
    (or
      (Set_in (inv_1_2<Ref> x@151@01 y@152@01 z@153@01) zs2@60@01)
      (not (Set_in (inv_1_2<Ref> x@151@01 y@152@01 z@153@01) zs2@60@01))))))
(assert (or
  (Set_in (inv_1_1<Ref> x@151@01 y@152@01 z@153@01) ys2@49@01)
  (not (Set_in (inv_1_1<Ref> x@151@01 y@152@01 z@153@01) ys2@49@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_1_0<Ref> x@151@01 y@152@01 z@153@01) xs2@38@01)
  (and
    (Set_in (inv_1_0<Ref> x@151@01 y@152@01 z@153@01) xs2@38@01)
    (=>
      (Set_in (inv_1_1<Ref> x@151@01 y@152@01 z@153@01) ys2@49@01)
      (and
        (Set_in (inv_1_1<Ref> x@151@01 y@152@01 z@153@01) ys2@49@01)
        (or
          (Set_in (inv_1_2<Ref> x@151@01 y@152@01 z@153@01) zs2@60@01)
          (not (Set_in (inv_1_2<Ref> x@151@01 y@152@01 z@153@01) zs2@60@01)))))
    (or
      (Set_in (inv_1_1<Ref> x@151@01 y@152@01 z@153@01) ys2@49@01)
      (not (Set_in (inv_1_1<Ref> x@151@01 y@152@01 z@153@01) ys2@49@01))))))
(assert (or
  (Set_in (inv_1_0<Ref> x@151@01 y@152@01 z@153@01) xs2@38@01)
  (not (Set_in (inv_1_0<Ref> x@151@01 y@152@01 z@153@01) xs2@38@01))))
; [eval] (inv_2_0(x, y, z) in xs3) && ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) && (x == x && y == y && z == z)
; [eval] (inv_2_0(x, y, z) in xs3)
; [eval] inv_2_0(x, y, z)
(push) ; 6
; [then-branch: 107 | !(inv_2_0[Ref](x@151@01, y@152@01, z@153@01) in xs3@39@01) | live]
; [else-branch: 107 | inv_2_0[Ref](x@151@01, y@152@01, z@153@01) in xs3@39@01 | live]
(push) ; 7
; [then-branch: 107 | !(inv_2_0[Ref](x@151@01, y@152@01, z@153@01) in xs3@39@01)]
(assert (not (Set_in (inv_2_0<Ref> x@151@01 y@152@01 z@153@01) xs3@39@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 107 | inv_2_0[Ref](x@151@01, y@152@01, z@153@01) in xs3@39@01]
(assert (Set_in (inv_2_0<Ref> x@151@01 y@152@01 z@153@01) xs3@39@01))
; [eval] (inv_2_1(x, y, z) in ys3)
; [eval] inv_2_1(x, y, z)
(push) ; 8
; [then-branch: 108 | !(inv_2_1[Ref](x@151@01, y@152@01, z@153@01) in ys3@50@01) | live]
; [else-branch: 108 | inv_2_1[Ref](x@151@01, y@152@01, z@153@01) in ys3@50@01 | live]
(push) ; 9
; [then-branch: 108 | !(inv_2_1[Ref](x@151@01, y@152@01, z@153@01) in ys3@50@01)]
(assert (not (Set_in (inv_2_1<Ref> x@151@01 y@152@01 z@153@01) ys3@50@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 108 | inv_2_1[Ref](x@151@01, y@152@01, z@153@01) in ys3@50@01]
(assert (Set_in (inv_2_1<Ref> x@151@01 y@152@01 z@153@01) ys3@50@01))
; [eval] (inv_2_2(x, y, z) in zs3)
; [eval] inv_2_2(x, y, z)
(push) ; 10
; [then-branch: 109 | !(inv_2_2[Ref](x@151@01, y@152@01, z@153@01) in zs3@61@01) | live]
; [else-branch: 109 | inv_2_2[Ref](x@151@01, y@152@01, z@153@01) in zs3@61@01 | live]
(push) ; 11
; [then-branch: 109 | !(inv_2_2[Ref](x@151@01, y@152@01, z@153@01) in zs3@61@01)]
(assert (not (Set_in (inv_2_2<Ref> x@151@01 y@152@01 z@153@01) zs3@61@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 109 | inv_2_2[Ref](x@151@01, y@152@01, z@153@01) in zs3@61@01]
(assert (Set_in (inv_2_2<Ref> x@151@01 y@152@01 z@153@01) zs3@61@01))
; [eval] x == x
(push) ; 12
; [then-branch: 110 | False | live]
; [else-branch: 110 | True | live]
(push) ; 13
; [then-branch: 110 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 110 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 111 | False | live]
; [else-branch: 111 | True | live]
(push) ; 15
; [then-branch: 111 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 111 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_2_2<Ref> x@151@01 y@152@01 z@153@01) zs3@61@01)
  (not (Set_in (inv_2_2<Ref> x@151@01 y@152@01 z@153@01) zs3@61@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_2_1<Ref> x@151@01 y@152@01 z@153@01) ys3@50@01)
  (and
    (Set_in (inv_2_1<Ref> x@151@01 y@152@01 z@153@01) ys3@50@01)
    (or
      (Set_in (inv_2_2<Ref> x@151@01 y@152@01 z@153@01) zs3@61@01)
      (not (Set_in (inv_2_2<Ref> x@151@01 y@152@01 z@153@01) zs3@61@01))))))
(assert (or
  (Set_in (inv_2_1<Ref> x@151@01 y@152@01 z@153@01) ys3@50@01)
  (not (Set_in (inv_2_1<Ref> x@151@01 y@152@01 z@153@01) ys3@50@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_2_0<Ref> x@151@01 y@152@01 z@153@01) xs3@39@01)
  (and
    (Set_in (inv_2_0<Ref> x@151@01 y@152@01 z@153@01) xs3@39@01)
    (=>
      (Set_in (inv_2_1<Ref> x@151@01 y@152@01 z@153@01) ys3@50@01)
      (and
        (Set_in (inv_2_1<Ref> x@151@01 y@152@01 z@153@01) ys3@50@01)
        (or
          (Set_in (inv_2_2<Ref> x@151@01 y@152@01 z@153@01) zs3@61@01)
          (not (Set_in (inv_2_2<Ref> x@151@01 y@152@01 z@153@01) zs3@61@01)))))
    (or
      (Set_in (inv_2_1<Ref> x@151@01 y@152@01 z@153@01) ys3@50@01)
      (not (Set_in (inv_2_1<Ref> x@151@01 y@152@01 z@153@01) ys3@50@01))))))
(assert (or
  (Set_in (inv_2_0<Ref> x@151@01 y@152@01 z@153@01) xs3@39@01)
  (not (Set_in (inv_2_0<Ref> x@151@01 y@152@01 z@153@01) xs3@39@01))))
; [eval] (inv_3_0(x, y, z) in xs4) && ((inv_3_1(x, y, z) in ys4) && (inv_3_2(x, y, z) in zs4)) && (x == x && y == y && z == z)
; [eval] (inv_3_0(x, y, z) in xs4)
; [eval] inv_3_0(x, y, z)
(push) ; 6
; [then-branch: 112 | !(inv_3_0[Ref](x@151@01, y@152@01, z@153@01) in xs4@40@01) | live]
; [else-branch: 112 | inv_3_0[Ref](x@151@01, y@152@01, z@153@01) in xs4@40@01 | live]
(push) ; 7
; [then-branch: 112 | !(inv_3_0[Ref](x@151@01, y@152@01, z@153@01) in xs4@40@01)]
(assert (not (Set_in (inv_3_0<Ref> x@151@01 y@152@01 z@153@01) xs4@40@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 112 | inv_3_0[Ref](x@151@01, y@152@01, z@153@01) in xs4@40@01]
(assert (Set_in (inv_3_0<Ref> x@151@01 y@152@01 z@153@01) xs4@40@01))
; [eval] (inv_3_1(x, y, z) in ys4)
; [eval] inv_3_1(x, y, z)
(push) ; 8
; [then-branch: 113 | !(inv_3_1[Ref](x@151@01, y@152@01, z@153@01) in ys4@51@01) | live]
; [else-branch: 113 | inv_3_1[Ref](x@151@01, y@152@01, z@153@01) in ys4@51@01 | live]
(push) ; 9
; [then-branch: 113 | !(inv_3_1[Ref](x@151@01, y@152@01, z@153@01) in ys4@51@01)]
(assert (not (Set_in (inv_3_1<Ref> x@151@01 y@152@01 z@153@01) ys4@51@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 113 | inv_3_1[Ref](x@151@01, y@152@01, z@153@01) in ys4@51@01]
(assert (Set_in (inv_3_1<Ref> x@151@01 y@152@01 z@153@01) ys4@51@01))
; [eval] (inv_3_2(x, y, z) in zs4)
; [eval] inv_3_2(x, y, z)
(push) ; 10
; [then-branch: 114 | !(inv_3_2[Ref](x@151@01, y@152@01, z@153@01) in zs4@62@01) | live]
; [else-branch: 114 | inv_3_2[Ref](x@151@01, y@152@01, z@153@01) in zs4@62@01 | live]
(push) ; 11
; [then-branch: 114 | !(inv_3_2[Ref](x@151@01, y@152@01, z@153@01) in zs4@62@01)]
(assert (not (Set_in (inv_3_2<Ref> x@151@01 y@152@01 z@153@01) zs4@62@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 114 | inv_3_2[Ref](x@151@01, y@152@01, z@153@01) in zs4@62@01]
(assert (Set_in (inv_3_2<Ref> x@151@01 y@152@01 z@153@01) zs4@62@01))
; [eval] x == x
(push) ; 12
; [then-branch: 115 | False | live]
; [else-branch: 115 | True | live]
(push) ; 13
; [then-branch: 115 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 115 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 116 | False | live]
; [else-branch: 116 | True | live]
(push) ; 15
; [then-branch: 116 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 116 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_3_2<Ref> x@151@01 y@152@01 z@153@01) zs4@62@01)
  (not (Set_in (inv_3_2<Ref> x@151@01 y@152@01 z@153@01) zs4@62@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_3_1<Ref> x@151@01 y@152@01 z@153@01) ys4@51@01)
  (and
    (Set_in (inv_3_1<Ref> x@151@01 y@152@01 z@153@01) ys4@51@01)
    (or
      (Set_in (inv_3_2<Ref> x@151@01 y@152@01 z@153@01) zs4@62@01)
      (not (Set_in (inv_3_2<Ref> x@151@01 y@152@01 z@153@01) zs4@62@01))))))
(assert (or
  (Set_in (inv_3_1<Ref> x@151@01 y@152@01 z@153@01) ys4@51@01)
  (not (Set_in (inv_3_1<Ref> x@151@01 y@152@01 z@153@01) ys4@51@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_3_0<Ref> x@151@01 y@152@01 z@153@01) xs4@40@01)
  (and
    (Set_in (inv_3_0<Ref> x@151@01 y@152@01 z@153@01) xs4@40@01)
    (=>
      (Set_in (inv_3_1<Ref> x@151@01 y@152@01 z@153@01) ys4@51@01)
      (and
        (Set_in (inv_3_1<Ref> x@151@01 y@152@01 z@153@01) ys4@51@01)
        (or
          (Set_in (inv_3_2<Ref> x@151@01 y@152@01 z@153@01) zs4@62@01)
          (not (Set_in (inv_3_2<Ref> x@151@01 y@152@01 z@153@01) zs4@62@01)))))
    (or
      (Set_in (inv_3_1<Ref> x@151@01 y@152@01 z@153@01) ys4@51@01)
      (not (Set_in (inv_3_1<Ref> x@151@01 y@152@01 z@153@01) ys4@51@01))))))
(assert (or
  (Set_in (inv_3_0<Ref> x@151@01 y@152@01 z@153@01) xs4@40@01)
  (not (Set_in (inv_3_0<Ref> x@151@01 y@152@01 z@153@01) xs4@40@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 96 | !(inv_4_0[Ref](x@151@01, y@152@01, z@153@01) in xs5@41@01 && inv_4_1[Ref](x@151@01, y@152@01, z@153@01) in ys5@52@01 && inv_4_2[Ref](x@151@01, y@152@01, z@153@01) in zs5@63@01)]
(assert (not
  (and
    (Set_in (inv_4_0<Ref> x@151@01 y@152@01 z@153@01) xs5@41@01)
    (and
      (Set_in (inv_4_1<Ref> x@151@01 y@152@01 z@153@01) ys5@52@01)
      (Set_in (inv_4_2<Ref> x@151@01 y@152@01 z@153@01) zs5@63@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (=
    ($PSF.perm_p (as pm@154@01  $PPM) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    (ite
      (and
        (and (img@83@01 x y z) (img@85@01 x y z) (img@87@01 x y z))
        (and
          (Set_in (inv@82@01 x y z) xs@70@01)
          (and
            (Set_in (inv@84@01 x y z) ys@71@01)
            (Set_in (inv@86@01 x y z) zs@72@01))))
      q@73@01
      $Perm.No))
  :pattern (($PSF.perm_p (as pm@154@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resPrmSumDef10|)))
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (and
    ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    ($PSF.loc_p ($PSF.lookup_p $t@81@01 ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))))
  :pattern (($PSF.perm_p (as pm@154@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resTrgDef11|)))
(assert (=>
  (and
    (Set_in (inv_4_0<Ref> x@151@01 y@152@01 z@153@01) xs5@41@01)
    (and
      (Set_in (inv_4_1<Ref> x@151@01 y@152@01 z@153@01) ys5@52@01)
      (Set_in (inv_4_2<Ref> x@151@01 y@152@01 z@153@01) zs5@63@01)))
  (and
    (Set_in (inv_4_0<Ref> x@151@01 y@152@01 z@153@01) xs5@41@01)
    (Set_in (inv_4_1<Ref> x@151@01 y@152@01 z@153@01) ys5@52@01)
    (Set_in (inv_4_2<Ref> x@151@01 y@152@01 z@153@01) zs5@63@01)
    ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x@151@01)
        ($SortWrappers.$RefTo$Snap y@152@01))
      ($SortWrappers.$RefTo$Snap z@153@01))) ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x@151@01)
        ($SortWrappers.$RefTo$Snap y@152@01))
      ($SortWrappers.$RefTo$Snap z@153@01)))
    (=>
      (Set_in (inv_0_0<Ref> x@151@01 y@152@01 z@153@01) xs1@37@01)
      (and
        (Set_in (inv_0_0<Ref> x@151@01 y@152@01 z@153@01) xs1@37@01)
        (=>
          (Set_in (inv_0_1<Ref> x@151@01 y@152@01 z@153@01) ys1@48@01)
          (and
            (Set_in (inv_0_1<Ref> x@151@01 y@152@01 z@153@01) ys1@48@01)
            (or
              (Set_in (inv_0_2<Ref> x@151@01 y@152@01 z@153@01) zs1@59@01)
              (not (Set_in (inv_0_2<Ref> x@151@01 y@152@01 z@153@01) zs1@59@01)))))
        (or
          (Set_in (inv_0_1<Ref> x@151@01 y@152@01 z@153@01) ys1@48@01)
          (not (Set_in (inv_0_1<Ref> x@151@01 y@152@01 z@153@01) ys1@48@01)))))
    (or
      (Set_in (inv_0_0<Ref> x@151@01 y@152@01 z@153@01) xs1@37@01)
      (not (Set_in (inv_0_0<Ref> x@151@01 y@152@01 z@153@01) xs1@37@01)))
    (=>
      (Set_in (inv_1_0<Ref> x@151@01 y@152@01 z@153@01) xs2@38@01)
      (and
        (Set_in (inv_1_0<Ref> x@151@01 y@152@01 z@153@01) xs2@38@01)
        (=>
          (Set_in (inv_1_1<Ref> x@151@01 y@152@01 z@153@01) ys2@49@01)
          (and
            (Set_in (inv_1_1<Ref> x@151@01 y@152@01 z@153@01) ys2@49@01)
            (or
              (Set_in (inv_1_2<Ref> x@151@01 y@152@01 z@153@01) zs2@60@01)
              (not (Set_in (inv_1_2<Ref> x@151@01 y@152@01 z@153@01) zs2@60@01)))))
        (or
          (Set_in (inv_1_1<Ref> x@151@01 y@152@01 z@153@01) ys2@49@01)
          (not (Set_in (inv_1_1<Ref> x@151@01 y@152@01 z@153@01) ys2@49@01)))))
    (or
      (Set_in (inv_1_0<Ref> x@151@01 y@152@01 z@153@01) xs2@38@01)
      (not (Set_in (inv_1_0<Ref> x@151@01 y@152@01 z@153@01) xs2@38@01)))
    (=>
      (Set_in (inv_2_0<Ref> x@151@01 y@152@01 z@153@01) xs3@39@01)
      (and
        (Set_in (inv_2_0<Ref> x@151@01 y@152@01 z@153@01) xs3@39@01)
        (=>
          (Set_in (inv_2_1<Ref> x@151@01 y@152@01 z@153@01) ys3@50@01)
          (and
            (Set_in (inv_2_1<Ref> x@151@01 y@152@01 z@153@01) ys3@50@01)
            (or
              (Set_in (inv_2_2<Ref> x@151@01 y@152@01 z@153@01) zs3@61@01)
              (not (Set_in (inv_2_2<Ref> x@151@01 y@152@01 z@153@01) zs3@61@01)))))
        (or
          (Set_in (inv_2_1<Ref> x@151@01 y@152@01 z@153@01) ys3@50@01)
          (not (Set_in (inv_2_1<Ref> x@151@01 y@152@01 z@153@01) ys3@50@01)))))
    (or
      (Set_in (inv_2_0<Ref> x@151@01 y@152@01 z@153@01) xs3@39@01)
      (not (Set_in (inv_2_0<Ref> x@151@01 y@152@01 z@153@01) xs3@39@01)))
    (=>
      (Set_in (inv_3_0<Ref> x@151@01 y@152@01 z@153@01) xs4@40@01)
      (and
        (Set_in (inv_3_0<Ref> x@151@01 y@152@01 z@153@01) xs4@40@01)
        (=>
          (Set_in (inv_3_1<Ref> x@151@01 y@152@01 z@153@01) ys4@51@01)
          (and
            (Set_in (inv_3_1<Ref> x@151@01 y@152@01 z@153@01) ys4@51@01)
            (or
              (Set_in (inv_3_2<Ref> x@151@01 y@152@01 z@153@01) zs4@62@01)
              (not (Set_in (inv_3_2<Ref> x@151@01 y@152@01 z@153@01) zs4@62@01)))))
        (or
          (Set_in (inv_3_1<Ref> x@151@01 y@152@01 z@153@01) ys4@51@01)
          (not (Set_in (inv_3_1<Ref> x@151@01 y@152@01 z@153@01) ys4@51@01)))))
    (or
      (Set_in (inv_3_0<Ref> x@151@01 y@152@01 z@153@01) xs4@40@01)
      (not (Set_in (inv_3_0<Ref> x@151@01 y@152@01 z@153@01) xs4@40@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in (inv_4_0<Ref> x@151@01 y@152@01 z@153@01) xs5@41@01)
      (and
        (Set_in (inv_4_1<Ref> x@151@01 y@152@01 z@153@01) ys5@52@01)
        (Set_in (inv_4_2<Ref> x@151@01 y@152@01 z@153@01) zs5@63@01))))
  (and
    (Set_in (inv_4_0<Ref> x@151@01 y@152@01 z@153@01) xs5@41@01)
    (and
      (Set_in (inv_4_1<Ref> x@151@01 y@152@01 z@153@01) ys5@52@01)
      (Set_in (inv_4_2<Ref> x@151@01 y@152@01 z@153@01) zs5@63@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (=
    ($PSF.perm_p (as pm@154@01  $PPM) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    (ite
      (and
        (and (img@83@01 x y z) (img@85@01 x y z) (img@87@01 x y z))
        (and
          (Set_in (inv@82@01 x y z) xs@70@01)
          (and
            (Set_in (inv@84@01 x y z) ys@71@01)
            (Set_in (inv@86@01 x y z) zs@72@01))))
      q@73@01
      $Perm.No))
  :pattern (($PSF.perm_p (as pm@154@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resPrmSumDef10|)))
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (and
    ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    ($PSF.loc_p ($PSF.lookup_p $t@81@01 ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))))
  :pattern (($PSF.perm_p (as pm@154@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resTrgDef11|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@151@01 $Ref) (y@152@01 $Ref) (z@153@01 $Ref)) (!
  (and
    (=>
      (Set_in (inv_4_0<Ref> x@151@01 y@152@01 z@153@01) xs5@41@01)
      (and
        (Set_in (inv_4_0<Ref> x@151@01 y@152@01 z@153@01) xs5@41@01)
        (or
          (Set_in (inv_4_1<Ref> x@151@01 y@152@01 z@153@01) ys5@52@01)
          (not (Set_in (inv_4_1<Ref> x@151@01 y@152@01 z@153@01) ys5@52@01)))))
    (or
      (Set_in (inv_4_0<Ref> x@151@01 y@152@01 z@153@01) xs5@41@01)
      (not (Set_in (inv_4_0<Ref> x@151@01 y@152@01 z@153@01) xs5@41@01)))
    (=>
      (and
        (Set_in (inv_4_0<Ref> x@151@01 y@152@01 z@153@01) xs5@41@01)
        (and
          (Set_in (inv_4_1<Ref> x@151@01 y@152@01 z@153@01) ys5@52@01)
          (Set_in (inv_4_2<Ref> x@151@01 y@152@01 z@153@01) zs5@63@01)))
      (and
        (Set_in (inv_4_0<Ref> x@151@01 y@152@01 z@153@01) xs5@41@01)
        (Set_in (inv_4_1<Ref> x@151@01 y@152@01 z@153@01) ys5@52@01)
        (Set_in (inv_4_2<Ref> x@151@01 y@152@01 z@153@01) zs5@63@01)
        ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap x@151@01)
            ($SortWrappers.$RefTo$Snap y@152@01))
          ($SortWrappers.$RefTo$Snap z@153@01))) ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap x@151@01)
            ($SortWrappers.$RefTo$Snap y@152@01))
          ($SortWrappers.$RefTo$Snap z@153@01)))
        (=>
          (Set_in (inv_0_0<Ref> x@151@01 y@152@01 z@153@01) xs1@37@01)
          (and
            (Set_in (inv_0_0<Ref> x@151@01 y@152@01 z@153@01) xs1@37@01)
            (=>
              (Set_in (inv_0_1<Ref> x@151@01 y@152@01 z@153@01) ys1@48@01)
              (and
                (Set_in (inv_0_1<Ref> x@151@01 y@152@01 z@153@01) ys1@48@01)
                (or
                  (Set_in (inv_0_2<Ref> x@151@01 y@152@01 z@153@01) zs1@59@01)
                  (not
                    (Set_in (inv_0_2<Ref> x@151@01 y@152@01 z@153@01) zs1@59@01)))))
            (or
              (Set_in (inv_0_1<Ref> x@151@01 y@152@01 z@153@01) ys1@48@01)
              (not (Set_in (inv_0_1<Ref> x@151@01 y@152@01 z@153@01) ys1@48@01)))))
        (or
          (Set_in (inv_0_0<Ref> x@151@01 y@152@01 z@153@01) xs1@37@01)
          (not (Set_in (inv_0_0<Ref> x@151@01 y@152@01 z@153@01) xs1@37@01)))
        (=>
          (Set_in (inv_1_0<Ref> x@151@01 y@152@01 z@153@01) xs2@38@01)
          (and
            (Set_in (inv_1_0<Ref> x@151@01 y@152@01 z@153@01) xs2@38@01)
            (=>
              (Set_in (inv_1_1<Ref> x@151@01 y@152@01 z@153@01) ys2@49@01)
              (and
                (Set_in (inv_1_1<Ref> x@151@01 y@152@01 z@153@01) ys2@49@01)
                (or
                  (Set_in (inv_1_2<Ref> x@151@01 y@152@01 z@153@01) zs2@60@01)
                  (not
                    (Set_in (inv_1_2<Ref> x@151@01 y@152@01 z@153@01) zs2@60@01)))))
            (or
              (Set_in (inv_1_1<Ref> x@151@01 y@152@01 z@153@01) ys2@49@01)
              (not (Set_in (inv_1_1<Ref> x@151@01 y@152@01 z@153@01) ys2@49@01)))))
        (or
          (Set_in (inv_1_0<Ref> x@151@01 y@152@01 z@153@01) xs2@38@01)
          (not (Set_in (inv_1_0<Ref> x@151@01 y@152@01 z@153@01) xs2@38@01)))
        (=>
          (Set_in (inv_2_0<Ref> x@151@01 y@152@01 z@153@01) xs3@39@01)
          (and
            (Set_in (inv_2_0<Ref> x@151@01 y@152@01 z@153@01) xs3@39@01)
            (=>
              (Set_in (inv_2_1<Ref> x@151@01 y@152@01 z@153@01) ys3@50@01)
              (and
                (Set_in (inv_2_1<Ref> x@151@01 y@152@01 z@153@01) ys3@50@01)
                (or
                  (Set_in (inv_2_2<Ref> x@151@01 y@152@01 z@153@01) zs3@61@01)
                  (not
                    (Set_in (inv_2_2<Ref> x@151@01 y@152@01 z@153@01) zs3@61@01)))))
            (or
              (Set_in (inv_2_1<Ref> x@151@01 y@152@01 z@153@01) ys3@50@01)
              (not (Set_in (inv_2_1<Ref> x@151@01 y@152@01 z@153@01) ys3@50@01)))))
        (or
          (Set_in (inv_2_0<Ref> x@151@01 y@152@01 z@153@01) xs3@39@01)
          (not (Set_in (inv_2_0<Ref> x@151@01 y@152@01 z@153@01) xs3@39@01)))
        (=>
          (Set_in (inv_3_0<Ref> x@151@01 y@152@01 z@153@01) xs4@40@01)
          (and
            (Set_in (inv_3_0<Ref> x@151@01 y@152@01 z@153@01) xs4@40@01)
            (=>
              (Set_in (inv_3_1<Ref> x@151@01 y@152@01 z@153@01) ys4@51@01)
              (and
                (Set_in (inv_3_1<Ref> x@151@01 y@152@01 z@153@01) ys4@51@01)
                (or
                  (Set_in (inv_3_2<Ref> x@151@01 y@152@01 z@153@01) zs4@62@01)
                  (not
                    (Set_in (inv_3_2<Ref> x@151@01 y@152@01 z@153@01) zs4@62@01)))))
            (or
              (Set_in (inv_3_1<Ref> x@151@01 y@152@01 z@153@01) ys4@51@01)
              (not (Set_in (inv_3_1<Ref> x@151@01 y@152@01 z@153@01) ys4@51@01)))))
        (or
          (Set_in (inv_3_0<Ref> x@151@01 y@152@01 z@153@01) xs4@40@01)
          (not (Set_in (inv_3_0<Ref> x@151@01 y@152@01 z@153@01) xs4@40@01)))))
    (or
      (not
        (and
          (Set_in (inv_4_0<Ref> x@151@01 y@152@01 z@153@01) xs5@41@01)
          (and
            (Set_in (inv_4_1<Ref> x@151@01 y@152@01 z@153@01) ys5@52@01)
            (Set_in (inv_4_2<Ref> x@151@01 y@152@01 z@153@01) zs5@63@01))))
      (and
        (Set_in (inv_4_0<Ref> x@151@01 y@152@01 z@153@01) xs5@41@01)
        (and
          (Set_in (inv_4_1<Ref> x@151@01 y@152@01 z@153@01) ys5@52@01)
          (Set_in (inv_4_2<Ref> x@151@01 y@152@01 z@153@01) zs5@63@01)))))
  :pattern ((inv_4_0<Ref> x@151@01 y@152@01 z@153@01) (inv_4_1<Ref> x@151@01 y@152@01 z@153@01) (inv_4_2<Ref> x@151@01 y@152@01 z@153@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@24@9@24@122-aux|)))
(assert (forall ((x@151@01 $Ref) (y@152@01 $Ref) (z@153@01 $Ref)) (!
  (=>
    (and
      (Set_in (inv_4_0<Ref> x@151@01 y@152@01 z@153@01) xs5@41@01)
      (and
        (Set_in (inv_4_1<Ref> x@151@01 y@152@01 z@153@01) ys5@52@01)
        (Set_in (inv_4_2<Ref> x@151@01 y@152@01 z@153@01) zs5@63@01)))
    (>=
      ($PSF.perm_p (as pm@154@01  $PPM) ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap x@151@01)
          ($SortWrappers.$RefTo$Snap y@152@01))
        ($SortWrappers.$RefTo$Snap z@153@01)))
      (__iar__assume_helper_4<Perm> (and
        (Set_in (inv_0_0<Ref> x@151@01 y@152@01 z@153@01) xs1@37@01)
        (and
          (Set_in (inv_0_1<Ref> x@151@01 y@152@01 z@153@01) ys1@48@01)
          (Set_in (inv_0_2<Ref> x@151@01 y@152@01 z@153@01) zs1@59@01))) (and
        (Set_in (inv_1_0<Ref> x@151@01 y@152@01 z@153@01) xs2@38@01)
        (and
          (Set_in (inv_1_1<Ref> x@151@01 y@152@01 z@153@01) ys2@49@01)
          (Set_in (inv_1_2<Ref> x@151@01 y@152@01 z@153@01) zs2@60@01))) (and
        (Set_in (inv_2_0<Ref> x@151@01 y@152@01 z@153@01) xs3@39@01)
        (and
          (Set_in (inv_2_1<Ref> x@151@01 y@152@01 z@153@01) ys3@50@01)
          (Set_in (inv_2_2<Ref> x@151@01 y@152@01 z@153@01) zs3@61@01))) (and
        (Set_in (inv_3_0<Ref> x@151@01 y@152@01 z@153@01) xs4@40@01)
        (and
          (Set_in (inv_3_1<Ref> x@151@01 y@152@01 z@153@01) ys4@51@01)
          (Set_in (inv_3_2<Ref> x@151@01 y@152@01 z@153@01) zs4@62@01))) q@73@01 q@73@01 q@73@01 q@73@01 q@73@01)))
  :pattern ((inv_4_0<Ref> x@151@01 y@152@01 z@153@01) (inv_4_1<Ref> x@151@01 y@152@01 z@153@01) (inv_4_2<Ref> x@151@01 y@152@01 z@153@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@24@9@24@122|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x6: Ref, y6: Ref, z6: Ref ::
;     { p(x6, y6, z6) }
;     (x6 in xs6) && ((y6 in ys6) && (z6 in zs6)) ==>
;     inv_5_0(x6, y6, z6) == x6 && inv_5_1(x6, y6, z6) == y6 &&
;     inv_5_2(x6, y6, z6) == z6)
(declare-const $t@155@01 $Snap)
(assert (= $t@155@01 $Snap.unit))
; [eval] (forall x6: Ref, y6: Ref, z6: Ref :: { p(x6, y6, z6) } (x6 in xs6) && ((y6 in ys6) && (z6 in zs6)) ==> inv_5_0(x6, y6, z6) == x6 && inv_5_1(x6, y6, z6) == y6 && inv_5_2(x6, y6, z6) == z6)
(declare-const x6@156@01 $Ref)
(declare-const y6@157@01 $Ref)
(declare-const z6@158@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x6 in xs6) && ((y6 in ys6) && (z6 in zs6)) ==> inv_5_0(x6, y6, z6) == x6 && inv_5_1(x6, y6, z6) == y6 && inv_5_2(x6, y6, z6) == z6
; [eval] (x6 in xs6) && ((y6 in ys6) && (z6 in zs6))
; [eval] (x6 in xs6)
(push) ; 4
; [then-branch: 117 | !(x6@156@01 in xs6@42@01) | live]
; [else-branch: 117 | x6@156@01 in xs6@42@01 | live]
(push) ; 5
; [then-branch: 117 | !(x6@156@01 in xs6@42@01)]
(assert (not (Set_in x6@156@01 xs6@42@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 117 | x6@156@01 in xs6@42@01]
(assert (Set_in x6@156@01 xs6@42@01))
; [eval] (y6 in ys6)
(push) ; 6
; [then-branch: 118 | !(y6@157@01 in ys6@53@01) | live]
; [else-branch: 118 | y6@157@01 in ys6@53@01 | live]
(push) ; 7
; [then-branch: 118 | !(y6@157@01 in ys6@53@01)]
(assert (not (Set_in y6@157@01 ys6@53@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 118 | y6@157@01 in ys6@53@01]
(assert (Set_in y6@157@01 ys6@53@01))
; [eval] (z6 in zs6)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (Set_in y6@157@01 ys6@53@01) (not (Set_in y6@157@01 ys6@53@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in x6@156@01 xs6@42@01)
  (and
    (Set_in x6@156@01 xs6@42@01)
    (or (Set_in y6@157@01 ys6@53@01) (not (Set_in y6@157@01 ys6@53@01))))))
(assert (or (Set_in x6@156@01 xs6@42@01) (not (Set_in x6@156@01 xs6@42@01))))
(push) ; 4
; [then-branch: 119 | x6@156@01 in xs6@42@01 && y6@157@01 in ys6@53@01 && z6@158@01 in zs6@64@01 | live]
; [else-branch: 119 | !(x6@156@01 in xs6@42@01 && y6@157@01 in ys6@53@01 && z6@158@01 in zs6@64@01) | live]
(push) ; 5
; [then-branch: 119 | x6@156@01 in xs6@42@01 && y6@157@01 in ys6@53@01 && z6@158@01 in zs6@64@01]
(assert (and
  (Set_in x6@156@01 xs6@42@01)
  (and (Set_in y6@157@01 ys6@53@01) (Set_in z6@158@01 zs6@64@01))))
; [eval] inv_5_0(x6, y6, z6) == x6 && inv_5_1(x6, y6, z6) == y6 && inv_5_2(x6, y6, z6) == z6
; [eval] inv_5_0(x6, y6, z6) == x6
; [eval] inv_5_0(x6, y6, z6)
(push) ; 6
; [then-branch: 120 | inv_5_0[Ref](x6@156@01, y6@157@01, z6@158@01) != x6@156@01 | live]
; [else-branch: 120 | inv_5_0[Ref](x6@156@01, y6@157@01, z6@158@01) == x6@156@01 | live]
(push) ; 7
; [then-branch: 120 | inv_5_0[Ref](x6@156@01, y6@157@01, z6@158@01) != x6@156@01]
(assert (not (= (inv_5_0<Ref> x6@156@01 y6@157@01 z6@158@01) x6@156@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 120 | inv_5_0[Ref](x6@156@01, y6@157@01, z6@158@01) == x6@156@01]
(assert (= (inv_5_0<Ref> x6@156@01 y6@157@01 z6@158@01) x6@156@01))
; [eval] inv_5_1(x6, y6, z6) == y6
; [eval] inv_5_1(x6, y6, z6)
(push) ; 8
; [then-branch: 121 | inv_5_1[Ref](x6@156@01, y6@157@01, z6@158@01) != y6@157@01 | live]
; [else-branch: 121 | inv_5_1[Ref](x6@156@01, y6@157@01, z6@158@01) == y6@157@01 | live]
(push) ; 9
; [then-branch: 121 | inv_5_1[Ref](x6@156@01, y6@157@01, z6@158@01) != y6@157@01]
(assert (not (= (inv_5_1<Ref> x6@156@01 y6@157@01 z6@158@01) y6@157@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 121 | inv_5_1[Ref](x6@156@01, y6@157@01, z6@158@01) == y6@157@01]
(assert (= (inv_5_1<Ref> x6@156@01 y6@157@01 z6@158@01) y6@157@01))
; [eval] inv_5_2(x6, y6, z6) == z6
; [eval] inv_5_2(x6, y6, z6)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or
  (= (inv_5_1<Ref> x6@156@01 y6@157@01 z6@158@01) y6@157@01)
  (not (= (inv_5_1<Ref> x6@156@01 y6@157@01 z6@158@01) y6@157@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (= (inv_5_0<Ref> x6@156@01 y6@157@01 z6@158@01) x6@156@01)
  (and
    (= (inv_5_0<Ref> x6@156@01 y6@157@01 z6@158@01) x6@156@01)
    (or
      (= (inv_5_1<Ref> x6@156@01 y6@157@01 z6@158@01) y6@157@01)
      (not (= (inv_5_1<Ref> x6@156@01 y6@157@01 z6@158@01) y6@157@01))))))
(assert (or
  (= (inv_5_0<Ref> x6@156@01 y6@157@01 z6@158@01) x6@156@01)
  (not (= (inv_5_0<Ref> x6@156@01 y6@157@01 z6@158@01) x6@156@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 119 | !(x6@156@01 in xs6@42@01 && y6@157@01 in ys6@53@01 && z6@158@01 in zs6@64@01)]
(assert (not
  (and
    (Set_in x6@156@01 xs6@42@01)
    (and (Set_in y6@157@01 ys6@53@01) (Set_in z6@158@01 zs6@64@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Set_in x6@156@01 xs6@42@01)
    (and (Set_in y6@157@01 ys6@53@01) (Set_in z6@158@01 zs6@64@01)))
  (and
    (Set_in x6@156@01 xs6@42@01)
    (Set_in y6@157@01 ys6@53@01)
    (Set_in z6@158@01 zs6@64@01)
    (=>
      (= (inv_5_0<Ref> x6@156@01 y6@157@01 z6@158@01) x6@156@01)
      (and
        (= (inv_5_0<Ref> x6@156@01 y6@157@01 z6@158@01) x6@156@01)
        (or
          (= (inv_5_1<Ref> x6@156@01 y6@157@01 z6@158@01) y6@157@01)
          (not (= (inv_5_1<Ref> x6@156@01 y6@157@01 z6@158@01) y6@157@01)))))
    (or
      (= (inv_5_0<Ref> x6@156@01 y6@157@01 z6@158@01) x6@156@01)
      (not (= (inv_5_0<Ref> x6@156@01 y6@157@01 z6@158@01) x6@156@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in x6@156@01 xs6@42@01)
      (and (Set_in y6@157@01 ys6@53@01) (Set_in z6@158@01 zs6@64@01))))
  (and
    (Set_in x6@156@01 xs6@42@01)
    (and (Set_in y6@157@01 ys6@53@01) (Set_in z6@158@01 zs6@64@01)))))
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x6@156@01 $Ref) (y6@157@01 $Ref) (z6@158@01 $Ref)) (!
  (and
    (=>
      (Set_in x6@156@01 xs6@42@01)
      (and
        (Set_in x6@156@01 xs6@42@01)
        (or (Set_in y6@157@01 ys6@53@01) (not (Set_in y6@157@01 ys6@53@01)))))
    (or (Set_in x6@156@01 xs6@42@01) (not (Set_in x6@156@01 xs6@42@01)))
    (=>
      (and
        (Set_in x6@156@01 xs6@42@01)
        (and (Set_in y6@157@01 ys6@53@01) (Set_in z6@158@01 zs6@64@01)))
      (and
        (Set_in x6@156@01 xs6@42@01)
        (Set_in y6@157@01 ys6@53@01)
        (Set_in z6@158@01 zs6@64@01)
        (=>
          (= (inv_5_0<Ref> x6@156@01 y6@157@01 z6@158@01) x6@156@01)
          (and
            (= (inv_5_0<Ref> x6@156@01 y6@157@01 z6@158@01) x6@156@01)
            (or
              (= (inv_5_1<Ref> x6@156@01 y6@157@01 z6@158@01) y6@157@01)
              (not (= (inv_5_1<Ref> x6@156@01 y6@157@01 z6@158@01) y6@157@01)))))
        (or
          (= (inv_5_0<Ref> x6@156@01 y6@157@01 z6@158@01) x6@156@01)
          (not (= (inv_5_0<Ref> x6@156@01 y6@157@01 z6@158@01) x6@156@01)))))
    (or
      (not
        (and
          (Set_in x6@156@01 xs6@42@01)
          (and (Set_in y6@157@01 ys6@53@01) (Set_in z6@158@01 zs6@64@01))))
      (and
        (Set_in x6@156@01 xs6@42@01)
        (and (Set_in y6@157@01 ys6@53@01) (Set_in z6@158@01 zs6@64@01)))))
  :pattern (($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap x6@156@01)
      ($SortWrappers.$RefTo$Snap y6@157@01))
    ($SortWrappers.$RefTo$Snap z6@158@01))) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap x6@156@01)
      ($SortWrappers.$RefTo$Snap y6@157@01))
    ($SortWrappers.$RefTo$Snap z6@158@01))))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@25@9@25@122-aux|)))
(assert (forall ((x6@156@01 $Ref) (y6@157@01 $Ref) (z6@158@01 $Ref)) (!
  (=>
    (and
      (Set_in x6@156@01 xs6@42@01)
      (and (Set_in y6@157@01 ys6@53@01) (Set_in z6@158@01 zs6@64@01)))
    (and
      (= (inv_5_0<Ref> x6@156@01 y6@157@01 z6@158@01) x6@156@01)
      (and
        (= (inv_5_1<Ref> x6@156@01 y6@157@01 z6@158@01) y6@157@01)
        (= (inv_5_2<Ref> x6@156@01 y6@157@01 z6@158@01) z6@158@01))))
  :pattern (($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap x6@156@01)
      ($SortWrappers.$RefTo$Snap y6@157@01))
    ($SortWrappers.$RefTo$Snap z6@158@01))) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap x6@156@01)
      ($SortWrappers.$RefTo$Snap y6@157@01))
    ($SortWrappers.$RefTo$Snap z6@158@01))))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@25@9@25@122|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x: Ref, y: Ref, z: Ref ::
;     { inv_5_0(x, y, z), inv_5_1(x, y, z), inv_5_2(x, y, z) }
;     (inv_5_0(x, y, z) in xs6) &&
;     ((inv_5_1(x, y, z) in ys6) && (inv_5_2(x, y, z) in zs6)) ==>
;     inv_5_0(x, y, z) == x && inv_5_1(x, y, z) == y && inv_5_2(x, y, z) == z)
(declare-const $t@159@01 $Snap)
(assert (= $t@159@01 $Snap.unit))
; [eval] (forall x: Ref, y: Ref, z: Ref :: { inv_5_0(x, y, z), inv_5_1(x, y, z), inv_5_2(x, y, z) } (inv_5_0(x, y, z) in xs6) && ((inv_5_1(x, y, z) in ys6) && (inv_5_2(x, y, z) in zs6)) ==> inv_5_0(x, y, z) == x && inv_5_1(x, y, z) == y && inv_5_2(x, y, z) == z)
(declare-const x@160@01 $Ref)
(declare-const y@161@01 $Ref)
(declare-const z@162@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (inv_5_0(x, y, z) in xs6) && ((inv_5_1(x, y, z) in ys6) && (inv_5_2(x, y, z) in zs6)) ==> inv_5_0(x, y, z) == x && inv_5_1(x, y, z) == y && inv_5_2(x, y, z) == z
; [eval] (inv_5_0(x, y, z) in xs6) && ((inv_5_1(x, y, z) in ys6) && (inv_5_2(x, y, z) in zs6))
; [eval] (inv_5_0(x, y, z) in xs6)
; [eval] inv_5_0(x, y, z)
(push) ; 4
; [then-branch: 122 | !(inv_5_0[Ref](x@160@01, y@161@01, z@162@01) in xs6@42@01) | live]
; [else-branch: 122 | inv_5_0[Ref](x@160@01, y@161@01, z@162@01) in xs6@42@01 | live]
(push) ; 5
; [then-branch: 122 | !(inv_5_0[Ref](x@160@01, y@161@01, z@162@01) in xs6@42@01)]
(assert (not (Set_in (inv_5_0<Ref> x@160@01 y@161@01 z@162@01) xs6@42@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 122 | inv_5_0[Ref](x@160@01, y@161@01, z@162@01) in xs6@42@01]
(assert (Set_in (inv_5_0<Ref> x@160@01 y@161@01 z@162@01) xs6@42@01))
; [eval] (inv_5_1(x, y, z) in ys6)
; [eval] inv_5_1(x, y, z)
(push) ; 6
; [then-branch: 123 | !(inv_5_1[Ref](x@160@01, y@161@01, z@162@01) in ys6@53@01) | live]
; [else-branch: 123 | inv_5_1[Ref](x@160@01, y@161@01, z@162@01) in ys6@53@01 | live]
(push) ; 7
; [then-branch: 123 | !(inv_5_1[Ref](x@160@01, y@161@01, z@162@01) in ys6@53@01)]
(assert (not (Set_in (inv_5_1<Ref> x@160@01 y@161@01 z@162@01) ys6@53@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 123 | inv_5_1[Ref](x@160@01, y@161@01, z@162@01) in ys6@53@01]
(assert (Set_in (inv_5_1<Ref> x@160@01 y@161@01 z@162@01) ys6@53@01))
; [eval] (inv_5_2(x, y, z) in zs6)
; [eval] inv_5_2(x, y, z)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_5_1<Ref> x@160@01 y@161@01 z@162@01) ys6@53@01)
  (not (Set_in (inv_5_1<Ref> x@160@01 y@161@01 z@162@01) ys6@53@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_5_0<Ref> x@160@01 y@161@01 z@162@01) xs6@42@01)
  (and
    (Set_in (inv_5_0<Ref> x@160@01 y@161@01 z@162@01) xs6@42@01)
    (or
      (Set_in (inv_5_1<Ref> x@160@01 y@161@01 z@162@01) ys6@53@01)
      (not (Set_in (inv_5_1<Ref> x@160@01 y@161@01 z@162@01) ys6@53@01))))))
(assert (or
  (Set_in (inv_5_0<Ref> x@160@01 y@161@01 z@162@01) xs6@42@01)
  (not (Set_in (inv_5_0<Ref> x@160@01 y@161@01 z@162@01) xs6@42@01))))
(push) ; 4
; [then-branch: 124 | inv_5_0[Ref](x@160@01, y@161@01, z@162@01) in xs6@42@01 && inv_5_1[Ref](x@160@01, y@161@01, z@162@01) in ys6@53@01 && inv_5_2[Ref](x@160@01, y@161@01, z@162@01) in zs6@64@01 | live]
; [else-branch: 124 | !(inv_5_0[Ref](x@160@01, y@161@01, z@162@01) in xs6@42@01 && inv_5_1[Ref](x@160@01, y@161@01, z@162@01) in ys6@53@01 && inv_5_2[Ref](x@160@01, y@161@01, z@162@01) in zs6@64@01) | live]
(push) ; 5
; [then-branch: 124 | inv_5_0[Ref](x@160@01, y@161@01, z@162@01) in xs6@42@01 && inv_5_1[Ref](x@160@01, y@161@01, z@162@01) in ys6@53@01 && inv_5_2[Ref](x@160@01, y@161@01, z@162@01) in zs6@64@01]
(assert (and
  (Set_in (inv_5_0<Ref> x@160@01 y@161@01 z@162@01) xs6@42@01)
  (and
    (Set_in (inv_5_1<Ref> x@160@01 y@161@01 z@162@01) ys6@53@01)
    (Set_in (inv_5_2<Ref> x@160@01 y@161@01 z@162@01) zs6@64@01))))
; [eval] inv_5_0(x, y, z) == x && inv_5_1(x, y, z) == y && inv_5_2(x, y, z) == z
; [eval] inv_5_0(x, y, z) == x
; [eval] inv_5_0(x, y, z)
(push) ; 6
; [then-branch: 125 | inv_5_0[Ref](x@160@01, y@161@01, z@162@01) != x@160@01 | live]
; [else-branch: 125 | inv_5_0[Ref](x@160@01, y@161@01, z@162@01) == x@160@01 | live]
(push) ; 7
; [then-branch: 125 | inv_5_0[Ref](x@160@01, y@161@01, z@162@01) != x@160@01]
(assert (not (= (inv_5_0<Ref> x@160@01 y@161@01 z@162@01) x@160@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 125 | inv_5_0[Ref](x@160@01, y@161@01, z@162@01) == x@160@01]
(assert (= (inv_5_0<Ref> x@160@01 y@161@01 z@162@01) x@160@01))
; [eval] inv_5_1(x, y, z) == y
; [eval] inv_5_1(x, y, z)
(push) ; 8
; [then-branch: 126 | inv_5_1[Ref](x@160@01, y@161@01, z@162@01) != y@161@01 | live]
; [else-branch: 126 | inv_5_1[Ref](x@160@01, y@161@01, z@162@01) == y@161@01 | live]
(push) ; 9
; [then-branch: 126 | inv_5_1[Ref](x@160@01, y@161@01, z@162@01) != y@161@01]
(assert (not (= (inv_5_1<Ref> x@160@01 y@161@01 z@162@01) y@161@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 126 | inv_5_1[Ref](x@160@01, y@161@01, z@162@01) == y@161@01]
(assert (= (inv_5_1<Ref> x@160@01 y@161@01 z@162@01) y@161@01))
; [eval] inv_5_2(x, y, z) == z
; [eval] inv_5_2(x, y, z)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or
  (= (inv_5_1<Ref> x@160@01 y@161@01 z@162@01) y@161@01)
  (not (= (inv_5_1<Ref> x@160@01 y@161@01 z@162@01) y@161@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (= (inv_5_0<Ref> x@160@01 y@161@01 z@162@01) x@160@01)
  (and
    (= (inv_5_0<Ref> x@160@01 y@161@01 z@162@01) x@160@01)
    (or
      (= (inv_5_1<Ref> x@160@01 y@161@01 z@162@01) y@161@01)
      (not (= (inv_5_1<Ref> x@160@01 y@161@01 z@162@01) y@161@01))))))
(assert (or
  (= (inv_5_0<Ref> x@160@01 y@161@01 z@162@01) x@160@01)
  (not (= (inv_5_0<Ref> x@160@01 y@161@01 z@162@01) x@160@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 124 | !(inv_5_0[Ref](x@160@01, y@161@01, z@162@01) in xs6@42@01 && inv_5_1[Ref](x@160@01, y@161@01, z@162@01) in ys6@53@01 && inv_5_2[Ref](x@160@01, y@161@01, z@162@01) in zs6@64@01)]
(assert (not
  (and
    (Set_in (inv_5_0<Ref> x@160@01 y@161@01 z@162@01) xs6@42@01)
    (and
      (Set_in (inv_5_1<Ref> x@160@01 y@161@01 z@162@01) ys6@53@01)
      (Set_in (inv_5_2<Ref> x@160@01 y@161@01 z@162@01) zs6@64@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Set_in (inv_5_0<Ref> x@160@01 y@161@01 z@162@01) xs6@42@01)
    (and
      (Set_in (inv_5_1<Ref> x@160@01 y@161@01 z@162@01) ys6@53@01)
      (Set_in (inv_5_2<Ref> x@160@01 y@161@01 z@162@01) zs6@64@01)))
  (and
    (Set_in (inv_5_0<Ref> x@160@01 y@161@01 z@162@01) xs6@42@01)
    (Set_in (inv_5_1<Ref> x@160@01 y@161@01 z@162@01) ys6@53@01)
    (Set_in (inv_5_2<Ref> x@160@01 y@161@01 z@162@01) zs6@64@01)
    (=>
      (= (inv_5_0<Ref> x@160@01 y@161@01 z@162@01) x@160@01)
      (and
        (= (inv_5_0<Ref> x@160@01 y@161@01 z@162@01) x@160@01)
        (or
          (= (inv_5_1<Ref> x@160@01 y@161@01 z@162@01) y@161@01)
          (not (= (inv_5_1<Ref> x@160@01 y@161@01 z@162@01) y@161@01)))))
    (or
      (= (inv_5_0<Ref> x@160@01 y@161@01 z@162@01) x@160@01)
      (not (= (inv_5_0<Ref> x@160@01 y@161@01 z@162@01) x@160@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in (inv_5_0<Ref> x@160@01 y@161@01 z@162@01) xs6@42@01)
      (and
        (Set_in (inv_5_1<Ref> x@160@01 y@161@01 z@162@01) ys6@53@01)
        (Set_in (inv_5_2<Ref> x@160@01 y@161@01 z@162@01) zs6@64@01))))
  (and
    (Set_in (inv_5_0<Ref> x@160@01 y@161@01 z@162@01) xs6@42@01)
    (and
      (Set_in (inv_5_1<Ref> x@160@01 y@161@01 z@162@01) ys6@53@01)
      (Set_in (inv_5_2<Ref> x@160@01 y@161@01 z@162@01) zs6@64@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@160@01 $Ref) (y@161@01 $Ref) (z@162@01 $Ref)) (!
  (and
    (=>
      (Set_in (inv_5_0<Ref> x@160@01 y@161@01 z@162@01) xs6@42@01)
      (and
        (Set_in (inv_5_0<Ref> x@160@01 y@161@01 z@162@01) xs6@42@01)
        (or
          (Set_in (inv_5_1<Ref> x@160@01 y@161@01 z@162@01) ys6@53@01)
          (not (Set_in (inv_5_1<Ref> x@160@01 y@161@01 z@162@01) ys6@53@01)))))
    (or
      (Set_in (inv_5_0<Ref> x@160@01 y@161@01 z@162@01) xs6@42@01)
      (not (Set_in (inv_5_0<Ref> x@160@01 y@161@01 z@162@01) xs6@42@01)))
    (=>
      (and
        (Set_in (inv_5_0<Ref> x@160@01 y@161@01 z@162@01) xs6@42@01)
        (and
          (Set_in (inv_5_1<Ref> x@160@01 y@161@01 z@162@01) ys6@53@01)
          (Set_in (inv_5_2<Ref> x@160@01 y@161@01 z@162@01) zs6@64@01)))
      (and
        (Set_in (inv_5_0<Ref> x@160@01 y@161@01 z@162@01) xs6@42@01)
        (Set_in (inv_5_1<Ref> x@160@01 y@161@01 z@162@01) ys6@53@01)
        (Set_in (inv_5_2<Ref> x@160@01 y@161@01 z@162@01) zs6@64@01)
        (=>
          (= (inv_5_0<Ref> x@160@01 y@161@01 z@162@01) x@160@01)
          (and
            (= (inv_5_0<Ref> x@160@01 y@161@01 z@162@01) x@160@01)
            (or
              (= (inv_5_1<Ref> x@160@01 y@161@01 z@162@01) y@161@01)
              (not (= (inv_5_1<Ref> x@160@01 y@161@01 z@162@01) y@161@01)))))
        (or
          (= (inv_5_0<Ref> x@160@01 y@161@01 z@162@01) x@160@01)
          (not (= (inv_5_0<Ref> x@160@01 y@161@01 z@162@01) x@160@01)))))
    (or
      (not
        (and
          (Set_in (inv_5_0<Ref> x@160@01 y@161@01 z@162@01) xs6@42@01)
          (and
            (Set_in (inv_5_1<Ref> x@160@01 y@161@01 z@162@01) ys6@53@01)
            (Set_in (inv_5_2<Ref> x@160@01 y@161@01 z@162@01) zs6@64@01))))
      (and
        (Set_in (inv_5_0<Ref> x@160@01 y@161@01 z@162@01) xs6@42@01)
        (and
          (Set_in (inv_5_1<Ref> x@160@01 y@161@01 z@162@01) ys6@53@01)
          (Set_in (inv_5_2<Ref> x@160@01 y@161@01 z@162@01) zs6@64@01)))))
  :pattern ((inv_5_0<Ref> x@160@01 y@161@01 z@162@01) (inv_5_1<Ref> x@160@01 y@161@01 z@162@01) (inv_5_2<Ref> x@160@01 y@161@01 z@162@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@25@9@25@122-aux|)))
(assert (forall ((x@160@01 $Ref) (y@161@01 $Ref) (z@162@01 $Ref)) (!
  (=>
    (and
      (Set_in (inv_5_0<Ref> x@160@01 y@161@01 z@162@01) xs6@42@01)
      (and
        (Set_in (inv_5_1<Ref> x@160@01 y@161@01 z@162@01) ys6@53@01)
        (Set_in (inv_5_2<Ref> x@160@01 y@161@01 z@162@01) zs6@64@01)))
    (and
      (= (inv_5_0<Ref> x@160@01 y@161@01 z@162@01) x@160@01)
      (and
        (= (inv_5_1<Ref> x@160@01 y@161@01 z@162@01) y@161@01)
        (= (inv_5_2<Ref> x@160@01 y@161@01 z@162@01) z@162@01))))
  :pattern ((inv_5_0<Ref> x@160@01 y@161@01 z@162@01) (inv_5_1<Ref> x@160@01 y@161@01 z@162@01) (inv_5_2<Ref> x@160@01 y@161@01 z@162@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@25@9@25@122|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x: Ref, y: Ref, z: Ref ::
;     { inv_5_0(x, y, z), inv_5_1(x, y, z), inv_5_2(x, y, z) }
;     (inv_5_0(x, y, z) in xs6) &&
;     ((inv_5_1(x, y, z) in ys6) && (inv_5_2(x, y, z) in zs6)) ==>
;     perm(p(x, y, z)) >=
;     __iar__assume_helper_5((inv_0_0(x, y, z) in xs1) &&
;     ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) &&
;     (x == x && y == y && z == z), (inv_1_0(x, y, z) in xs2) &&
;     ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) &&
;     (x == x && y == y && z == z), (inv_2_0(x, y, z) in xs3) &&
;     ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) &&
;     (x == x && y == y && z == z), (inv_3_0(x, y, z) in xs4) &&
;     ((inv_3_1(x, y, z) in ys4) && (inv_3_2(x, y, z) in zs4)) &&
;     (x == x && y == y && z == z), (inv_4_0(x, y, z) in xs5) &&
;     ((inv_4_1(x, y, z) in ys5) && (inv_4_2(x, y, z) in zs5)) &&
;     (x == x && y == y && z == z), q, q, q, q, q, q))
(declare-const $t@163@01 $Snap)
(assert (= $t@163@01 $Snap.unit))
; [eval] (forall x: Ref, y: Ref, z: Ref :: { inv_5_0(x, y, z), inv_5_1(x, y, z), inv_5_2(x, y, z) } (inv_5_0(x, y, z) in xs6) && ((inv_5_1(x, y, z) in ys6) && (inv_5_2(x, y, z) in zs6)) ==> perm(p(x, y, z)) >= __iar__assume_helper_5((inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) && (x == x && y == y && z == z), (inv_1_0(x, y, z) in xs2) && ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) && (x == x && y == y && z == z), (inv_2_0(x, y, z) in xs3) && ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) && (x == x && y == y && z == z), (inv_3_0(x, y, z) in xs4) && ((inv_3_1(x, y, z) in ys4) && (inv_3_2(x, y, z) in zs4)) && (x == x && y == y && z == z), (inv_4_0(x, y, z) in xs5) && ((inv_4_1(x, y, z) in ys5) && (inv_4_2(x, y, z) in zs5)) && (x == x && y == y && z == z), q, q, q, q, q, q))
(declare-const x@164@01 $Ref)
(declare-const y@165@01 $Ref)
(declare-const z@166@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (inv_5_0(x, y, z) in xs6) && ((inv_5_1(x, y, z) in ys6) && (inv_5_2(x, y, z) in zs6)) ==> perm(p(x, y, z)) >= __iar__assume_helper_5((inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) && (x == x && y == y && z == z), (inv_1_0(x, y, z) in xs2) && ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) && (x == x && y == y && z == z), (inv_2_0(x, y, z) in xs3) && ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) && (x == x && y == y && z == z), (inv_3_0(x, y, z) in xs4) && ((inv_3_1(x, y, z) in ys4) && (inv_3_2(x, y, z) in zs4)) && (x == x && y == y && z == z), (inv_4_0(x, y, z) in xs5) && ((inv_4_1(x, y, z) in ys5) && (inv_4_2(x, y, z) in zs5)) && (x == x && y == y && z == z), q, q, q, q, q, q)
; [eval] (inv_5_0(x, y, z) in xs6) && ((inv_5_1(x, y, z) in ys6) && (inv_5_2(x, y, z) in zs6))
; [eval] (inv_5_0(x, y, z) in xs6)
; [eval] inv_5_0(x, y, z)
(push) ; 4
; [then-branch: 127 | !(inv_5_0[Ref](x@164@01, y@165@01, z@166@01) in xs6@42@01) | live]
; [else-branch: 127 | inv_5_0[Ref](x@164@01, y@165@01, z@166@01) in xs6@42@01 | live]
(push) ; 5
; [then-branch: 127 | !(inv_5_0[Ref](x@164@01, y@165@01, z@166@01) in xs6@42@01)]
(assert (not (Set_in (inv_5_0<Ref> x@164@01 y@165@01 z@166@01) xs6@42@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 127 | inv_5_0[Ref](x@164@01, y@165@01, z@166@01) in xs6@42@01]
(assert (Set_in (inv_5_0<Ref> x@164@01 y@165@01 z@166@01) xs6@42@01))
; [eval] (inv_5_1(x, y, z) in ys6)
; [eval] inv_5_1(x, y, z)
(push) ; 6
; [then-branch: 128 | !(inv_5_1[Ref](x@164@01, y@165@01, z@166@01) in ys6@53@01) | live]
; [else-branch: 128 | inv_5_1[Ref](x@164@01, y@165@01, z@166@01) in ys6@53@01 | live]
(push) ; 7
; [then-branch: 128 | !(inv_5_1[Ref](x@164@01, y@165@01, z@166@01) in ys6@53@01)]
(assert (not (Set_in (inv_5_1<Ref> x@164@01 y@165@01 z@166@01) ys6@53@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 128 | inv_5_1[Ref](x@164@01, y@165@01, z@166@01) in ys6@53@01]
(assert (Set_in (inv_5_1<Ref> x@164@01 y@165@01 z@166@01) ys6@53@01))
; [eval] (inv_5_2(x, y, z) in zs6)
; [eval] inv_5_2(x, y, z)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_5_1<Ref> x@164@01 y@165@01 z@166@01) ys6@53@01)
  (not (Set_in (inv_5_1<Ref> x@164@01 y@165@01 z@166@01) ys6@53@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_5_0<Ref> x@164@01 y@165@01 z@166@01) xs6@42@01)
  (and
    (Set_in (inv_5_0<Ref> x@164@01 y@165@01 z@166@01) xs6@42@01)
    (or
      (Set_in (inv_5_1<Ref> x@164@01 y@165@01 z@166@01) ys6@53@01)
      (not (Set_in (inv_5_1<Ref> x@164@01 y@165@01 z@166@01) ys6@53@01))))))
(assert (or
  (Set_in (inv_5_0<Ref> x@164@01 y@165@01 z@166@01) xs6@42@01)
  (not (Set_in (inv_5_0<Ref> x@164@01 y@165@01 z@166@01) xs6@42@01))))
(push) ; 4
; [then-branch: 129 | inv_5_0[Ref](x@164@01, y@165@01, z@166@01) in xs6@42@01 && inv_5_1[Ref](x@164@01, y@165@01, z@166@01) in ys6@53@01 && inv_5_2[Ref](x@164@01, y@165@01, z@166@01) in zs6@64@01 | live]
; [else-branch: 129 | !(inv_5_0[Ref](x@164@01, y@165@01, z@166@01) in xs6@42@01 && inv_5_1[Ref](x@164@01, y@165@01, z@166@01) in ys6@53@01 && inv_5_2[Ref](x@164@01, y@165@01, z@166@01) in zs6@64@01) | live]
(push) ; 5
; [then-branch: 129 | inv_5_0[Ref](x@164@01, y@165@01, z@166@01) in xs6@42@01 && inv_5_1[Ref](x@164@01, y@165@01, z@166@01) in ys6@53@01 && inv_5_2[Ref](x@164@01, y@165@01, z@166@01) in zs6@64@01]
(assert (and
  (Set_in (inv_5_0<Ref> x@164@01 y@165@01 z@166@01) xs6@42@01)
  (and
    (Set_in (inv_5_1<Ref> x@164@01 y@165@01 z@166@01) ys6@53@01)
    (Set_in (inv_5_2<Ref> x@164@01 y@165@01 z@166@01) zs6@64@01))))
; [eval] perm(p(x, y, z)) >= __iar__assume_helper_5((inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) && (x == x && y == y && z == z), (inv_1_0(x, y, z) in xs2) && ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) && (x == x && y == y && z == z), (inv_2_0(x, y, z) in xs3) && ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) && (x == x && y == y && z == z), (inv_3_0(x, y, z) in xs4) && ((inv_3_1(x, y, z) in ys4) && (inv_3_2(x, y, z) in zs4)) && (x == x && y == y && z == z), (inv_4_0(x, y, z) in xs5) && ((inv_4_1(x, y, z) in ys5) && (inv_4_2(x, y, z) in zs5)) && (x == x && y == y && z == z), q, q, q, q, q, q)
; [eval] perm(p(x, y, z))
; Definitional axioms for snapshot map values
(declare-const pm@167@01 $PPM)
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (=
    ($PSF.perm_p (as pm@167@01  $PPM) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    (ite
      (and
        (and (img@83@01 x y z) (img@85@01 x y z) (img@87@01 x y z))
        (and
          (Set_in (inv@82@01 x y z) xs@70@01)
          (and
            (Set_in (inv@84@01 x y z) ys@71@01)
            (Set_in (inv@86@01 x y z) zs@72@01))))
      q@73@01
      $Perm.No))
  :pattern (($PSF.perm_p (as pm@167@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resPrmSumDef12|)))
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (and
    ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    ($PSF.loc_p ($PSF.lookup_p $t@81@01 ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))))
  :pattern (($PSF.perm_p (as pm@167@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resTrgDef13|)))
(assert ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x@164@01)
    ($SortWrappers.$RefTo$Snap y@165@01))
  ($SortWrappers.$RefTo$Snap z@166@01))) ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x@164@01)
    ($SortWrappers.$RefTo$Snap y@165@01))
  ($SortWrappers.$RefTo$Snap z@166@01))))
; [eval] __iar__assume_helper_5((inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) && (x == x && y == y && z == z), (inv_1_0(x, y, z) in xs2) && ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) && (x == x && y == y && z == z), (inv_2_0(x, y, z) in xs3) && ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) && (x == x && y == y && z == z), (inv_3_0(x, y, z) in xs4) && ((inv_3_1(x, y, z) in ys4) && (inv_3_2(x, y, z) in zs4)) && (x == x && y == y && z == z), (inv_4_0(x, y, z) in xs5) && ((inv_4_1(x, y, z) in ys5) && (inv_4_2(x, y, z) in zs5)) && (x == x && y == y && z == z), q, q, q, q, q, q)
; [eval] (inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) && (x == x && y == y && z == z)
; [eval] (inv_0_0(x, y, z) in xs1)
; [eval] inv_0_0(x, y, z)
(push) ; 6
; [then-branch: 130 | !(inv_0_0[Ref](x@164@01, y@165@01, z@166@01) in xs1@37@01) | live]
; [else-branch: 130 | inv_0_0[Ref](x@164@01, y@165@01, z@166@01) in xs1@37@01 | live]
(push) ; 7
; [then-branch: 130 | !(inv_0_0[Ref](x@164@01, y@165@01, z@166@01) in xs1@37@01)]
(assert (not (Set_in (inv_0_0<Ref> x@164@01 y@165@01 z@166@01) xs1@37@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 130 | inv_0_0[Ref](x@164@01, y@165@01, z@166@01) in xs1@37@01]
(assert (Set_in (inv_0_0<Ref> x@164@01 y@165@01 z@166@01) xs1@37@01))
; [eval] (inv_0_1(x, y, z) in ys1)
; [eval] inv_0_1(x, y, z)
(push) ; 8
; [then-branch: 131 | !(inv_0_1[Ref](x@164@01, y@165@01, z@166@01) in ys1@48@01) | live]
; [else-branch: 131 | inv_0_1[Ref](x@164@01, y@165@01, z@166@01) in ys1@48@01 | live]
(push) ; 9
; [then-branch: 131 | !(inv_0_1[Ref](x@164@01, y@165@01, z@166@01) in ys1@48@01)]
(assert (not (Set_in (inv_0_1<Ref> x@164@01 y@165@01 z@166@01) ys1@48@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 131 | inv_0_1[Ref](x@164@01, y@165@01, z@166@01) in ys1@48@01]
(assert (Set_in (inv_0_1<Ref> x@164@01 y@165@01 z@166@01) ys1@48@01))
; [eval] (inv_0_2(x, y, z) in zs1)
; [eval] inv_0_2(x, y, z)
(push) ; 10
; [then-branch: 132 | !(inv_0_2[Ref](x@164@01, y@165@01, z@166@01) in zs1@59@01) | live]
; [else-branch: 132 | inv_0_2[Ref](x@164@01, y@165@01, z@166@01) in zs1@59@01 | live]
(push) ; 11
; [then-branch: 132 | !(inv_0_2[Ref](x@164@01, y@165@01, z@166@01) in zs1@59@01)]
(assert (not (Set_in (inv_0_2<Ref> x@164@01 y@165@01 z@166@01) zs1@59@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 132 | inv_0_2[Ref](x@164@01, y@165@01, z@166@01) in zs1@59@01]
(assert (Set_in (inv_0_2<Ref> x@164@01 y@165@01 z@166@01) zs1@59@01))
; [eval] x == x
(push) ; 12
; [then-branch: 133 | False | live]
; [else-branch: 133 | True | live]
(push) ; 13
; [then-branch: 133 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 133 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 134 | False | live]
; [else-branch: 134 | True | live]
(push) ; 15
; [then-branch: 134 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 134 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_0_2<Ref> x@164@01 y@165@01 z@166@01) zs1@59@01)
  (not (Set_in (inv_0_2<Ref> x@164@01 y@165@01 z@166@01) zs1@59@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_0_1<Ref> x@164@01 y@165@01 z@166@01) ys1@48@01)
  (and
    (Set_in (inv_0_1<Ref> x@164@01 y@165@01 z@166@01) ys1@48@01)
    (or
      (Set_in (inv_0_2<Ref> x@164@01 y@165@01 z@166@01) zs1@59@01)
      (not (Set_in (inv_0_2<Ref> x@164@01 y@165@01 z@166@01) zs1@59@01))))))
(assert (or
  (Set_in (inv_0_1<Ref> x@164@01 y@165@01 z@166@01) ys1@48@01)
  (not (Set_in (inv_0_1<Ref> x@164@01 y@165@01 z@166@01) ys1@48@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_0_0<Ref> x@164@01 y@165@01 z@166@01) xs1@37@01)
  (and
    (Set_in (inv_0_0<Ref> x@164@01 y@165@01 z@166@01) xs1@37@01)
    (=>
      (Set_in (inv_0_1<Ref> x@164@01 y@165@01 z@166@01) ys1@48@01)
      (and
        (Set_in (inv_0_1<Ref> x@164@01 y@165@01 z@166@01) ys1@48@01)
        (or
          (Set_in (inv_0_2<Ref> x@164@01 y@165@01 z@166@01) zs1@59@01)
          (not (Set_in (inv_0_2<Ref> x@164@01 y@165@01 z@166@01) zs1@59@01)))))
    (or
      (Set_in (inv_0_1<Ref> x@164@01 y@165@01 z@166@01) ys1@48@01)
      (not (Set_in (inv_0_1<Ref> x@164@01 y@165@01 z@166@01) ys1@48@01))))))
(assert (or
  (Set_in (inv_0_0<Ref> x@164@01 y@165@01 z@166@01) xs1@37@01)
  (not (Set_in (inv_0_0<Ref> x@164@01 y@165@01 z@166@01) xs1@37@01))))
; [eval] (inv_1_0(x, y, z) in xs2) && ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) && (x == x && y == y && z == z)
; [eval] (inv_1_0(x, y, z) in xs2)
; [eval] inv_1_0(x, y, z)
(push) ; 6
; [then-branch: 135 | !(inv_1_0[Ref](x@164@01, y@165@01, z@166@01) in xs2@38@01) | live]
; [else-branch: 135 | inv_1_0[Ref](x@164@01, y@165@01, z@166@01) in xs2@38@01 | live]
(push) ; 7
; [then-branch: 135 | !(inv_1_0[Ref](x@164@01, y@165@01, z@166@01) in xs2@38@01)]
(assert (not (Set_in (inv_1_0<Ref> x@164@01 y@165@01 z@166@01) xs2@38@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 135 | inv_1_0[Ref](x@164@01, y@165@01, z@166@01) in xs2@38@01]
(assert (Set_in (inv_1_0<Ref> x@164@01 y@165@01 z@166@01) xs2@38@01))
; [eval] (inv_1_1(x, y, z) in ys2)
; [eval] inv_1_1(x, y, z)
(push) ; 8
; [then-branch: 136 | !(inv_1_1[Ref](x@164@01, y@165@01, z@166@01) in ys2@49@01) | live]
; [else-branch: 136 | inv_1_1[Ref](x@164@01, y@165@01, z@166@01) in ys2@49@01 | live]
(push) ; 9
; [then-branch: 136 | !(inv_1_1[Ref](x@164@01, y@165@01, z@166@01) in ys2@49@01)]
(assert (not (Set_in (inv_1_1<Ref> x@164@01 y@165@01 z@166@01) ys2@49@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 136 | inv_1_1[Ref](x@164@01, y@165@01, z@166@01) in ys2@49@01]
(assert (Set_in (inv_1_1<Ref> x@164@01 y@165@01 z@166@01) ys2@49@01))
; [eval] (inv_1_2(x, y, z) in zs2)
; [eval] inv_1_2(x, y, z)
(push) ; 10
; [then-branch: 137 | !(inv_1_2[Ref](x@164@01, y@165@01, z@166@01) in zs2@60@01) | live]
; [else-branch: 137 | inv_1_2[Ref](x@164@01, y@165@01, z@166@01) in zs2@60@01 | live]
(push) ; 11
; [then-branch: 137 | !(inv_1_2[Ref](x@164@01, y@165@01, z@166@01) in zs2@60@01)]
(assert (not (Set_in (inv_1_2<Ref> x@164@01 y@165@01 z@166@01) zs2@60@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 137 | inv_1_2[Ref](x@164@01, y@165@01, z@166@01) in zs2@60@01]
(assert (Set_in (inv_1_2<Ref> x@164@01 y@165@01 z@166@01) zs2@60@01))
; [eval] x == x
(push) ; 12
; [then-branch: 138 | False | live]
; [else-branch: 138 | True | live]
(push) ; 13
; [then-branch: 138 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 138 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 139 | False | live]
; [else-branch: 139 | True | live]
(push) ; 15
; [then-branch: 139 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 139 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_1_2<Ref> x@164@01 y@165@01 z@166@01) zs2@60@01)
  (not (Set_in (inv_1_2<Ref> x@164@01 y@165@01 z@166@01) zs2@60@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_1_1<Ref> x@164@01 y@165@01 z@166@01) ys2@49@01)
  (and
    (Set_in (inv_1_1<Ref> x@164@01 y@165@01 z@166@01) ys2@49@01)
    (or
      (Set_in (inv_1_2<Ref> x@164@01 y@165@01 z@166@01) zs2@60@01)
      (not (Set_in (inv_1_2<Ref> x@164@01 y@165@01 z@166@01) zs2@60@01))))))
(assert (or
  (Set_in (inv_1_1<Ref> x@164@01 y@165@01 z@166@01) ys2@49@01)
  (not (Set_in (inv_1_1<Ref> x@164@01 y@165@01 z@166@01) ys2@49@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_1_0<Ref> x@164@01 y@165@01 z@166@01) xs2@38@01)
  (and
    (Set_in (inv_1_0<Ref> x@164@01 y@165@01 z@166@01) xs2@38@01)
    (=>
      (Set_in (inv_1_1<Ref> x@164@01 y@165@01 z@166@01) ys2@49@01)
      (and
        (Set_in (inv_1_1<Ref> x@164@01 y@165@01 z@166@01) ys2@49@01)
        (or
          (Set_in (inv_1_2<Ref> x@164@01 y@165@01 z@166@01) zs2@60@01)
          (not (Set_in (inv_1_2<Ref> x@164@01 y@165@01 z@166@01) zs2@60@01)))))
    (or
      (Set_in (inv_1_1<Ref> x@164@01 y@165@01 z@166@01) ys2@49@01)
      (not (Set_in (inv_1_1<Ref> x@164@01 y@165@01 z@166@01) ys2@49@01))))))
(assert (or
  (Set_in (inv_1_0<Ref> x@164@01 y@165@01 z@166@01) xs2@38@01)
  (not (Set_in (inv_1_0<Ref> x@164@01 y@165@01 z@166@01) xs2@38@01))))
; [eval] (inv_2_0(x, y, z) in xs3) && ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) && (x == x && y == y && z == z)
; [eval] (inv_2_0(x, y, z) in xs3)
; [eval] inv_2_0(x, y, z)
(push) ; 6
; [then-branch: 140 | !(inv_2_0[Ref](x@164@01, y@165@01, z@166@01) in xs3@39@01) | live]
; [else-branch: 140 | inv_2_0[Ref](x@164@01, y@165@01, z@166@01) in xs3@39@01 | live]
(push) ; 7
; [then-branch: 140 | !(inv_2_0[Ref](x@164@01, y@165@01, z@166@01) in xs3@39@01)]
(assert (not (Set_in (inv_2_0<Ref> x@164@01 y@165@01 z@166@01) xs3@39@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 140 | inv_2_0[Ref](x@164@01, y@165@01, z@166@01) in xs3@39@01]
(assert (Set_in (inv_2_0<Ref> x@164@01 y@165@01 z@166@01) xs3@39@01))
; [eval] (inv_2_1(x, y, z) in ys3)
; [eval] inv_2_1(x, y, z)
(push) ; 8
; [then-branch: 141 | !(inv_2_1[Ref](x@164@01, y@165@01, z@166@01) in ys3@50@01) | live]
; [else-branch: 141 | inv_2_1[Ref](x@164@01, y@165@01, z@166@01) in ys3@50@01 | live]
(push) ; 9
; [then-branch: 141 | !(inv_2_1[Ref](x@164@01, y@165@01, z@166@01) in ys3@50@01)]
(assert (not (Set_in (inv_2_1<Ref> x@164@01 y@165@01 z@166@01) ys3@50@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 141 | inv_2_1[Ref](x@164@01, y@165@01, z@166@01) in ys3@50@01]
(assert (Set_in (inv_2_1<Ref> x@164@01 y@165@01 z@166@01) ys3@50@01))
; [eval] (inv_2_2(x, y, z) in zs3)
; [eval] inv_2_2(x, y, z)
(push) ; 10
; [then-branch: 142 | !(inv_2_2[Ref](x@164@01, y@165@01, z@166@01) in zs3@61@01) | live]
; [else-branch: 142 | inv_2_2[Ref](x@164@01, y@165@01, z@166@01) in zs3@61@01 | live]
(push) ; 11
; [then-branch: 142 | !(inv_2_2[Ref](x@164@01, y@165@01, z@166@01) in zs3@61@01)]
(assert (not (Set_in (inv_2_2<Ref> x@164@01 y@165@01 z@166@01) zs3@61@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 142 | inv_2_2[Ref](x@164@01, y@165@01, z@166@01) in zs3@61@01]
(assert (Set_in (inv_2_2<Ref> x@164@01 y@165@01 z@166@01) zs3@61@01))
; [eval] x == x
(push) ; 12
; [then-branch: 143 | False | live]
; [else-branch: 143 | True | live]
(push) ; 13
; [then-branch: 143 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 143 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 144 | False | live]
; [else-branch: 144 | True | live]
(push) ; 15
; [then-branch: 144 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 144 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_2_2<Ref> x@164@01 y@165@01 z@166@01) zs3@61@01)
  (not (Set_in (inv_2_2<Ref> x@164@01 y@165@01 z@166@01) zs3@61@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_2_1<Ref> x@164@01 y@165@01 z@166@01) ys3@50@01)
  (and
    (Set_in (inv_2_1<Ref> x@164@01 y@165@01 z@166@01) ys3@50@01)
    (or
      (Set_in (inv_2_2<Ref> x@164@01 y@165@01 z@166@01) zs3@61@01)
      (not (Set_in (inv_2_2<Ref> x@164@01 y@165@01 z@166@01) zs3@61@01))))))
(assert (or
  (Set_in (inv_2_1<Ref> x@164@01 y@165@01 z@166@01) ys3@50@01)
  (not (Set_in (inv_2_1<Ref> x@164@01 y@165@01 z@166@01) ys3@50@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_2_0<Ref> x@164@01 y@165@01 z@166@01) xs3@39@01)
  (and
    (Set_in (inv_2_0<Ref> x@164@01 y@165@01 z@166@01) xs3@39@01)
    (=>
      (Set_in (inv_2_1<Ref> x@164@01 y@165@01 z@166@01) ys3@50@01)
      (and
        (Set_in (inv_2_1<Ref> x@164@01 y@165@01 z@166@01) ys3@50@01)
        (or
          (Set_in (inv_2_2<Ref> x@164@01 y@165@01 z@166@01) zs3@61@01)
          (not (Set_in (inv_2_2<Ref> x@164@01 y@165@01 z@166@01) zs3@61@01)))))
    (or
      (Set_in (inv_2_1<Ref> x@164@01 y@165@01 z@166@01) ys3@50@01)
      (not (Set_in (inv_2_1<Ref> x@164@01 y@165@01 z@166@01) ys3@50@01))))))
(assert (or
  (Set_in (inv_2_0<Ref> x@164@01 y@165@01 z@166@01) xs3@39@01)
  (not (Set_in (inv_2_0<Ref> x@164@01 y@165@01 z@166@01) xs3@39@01))))
; [eval] (inv_3_0(x, y, z) in xs4) && ((inv_3_1(x, y, z) in ys4) && (inv_3_2(x, y, z) in zs4)) && (x == x && y == y && z == z)
; [eval] (inv_3_0(x, y, z) in xs4)
; [eval] inv_3_0(x, y, z)
(push) ; 6
; [then-branch: 145 | !(inv_3_0[Ref](x@164@01, y@165@01, z@166@01) in xs4@40@01) | live]
; [else-branch: 145 | inv_3_0[Ref](x@164@01, y@165@01, z@166@01) in xs4@40@01 | live]
(push) ; 7
; [then-branch: 145 | !(inv_3_0[Ref](x@164@01, y@165@01, z@166@01) in xs4@40@01)]
(assert (not (Set_in (inv_3_0<Ref> x@164@01 y@165@01 z@166@01) xs4@40@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 145 | inv_3_0[Ref](x@164@01, y@165@01, z@166@01) in xs4@40@01]
(assert (Set_in (inv_3_0<Ref> x@164@01 y@165@01 z@166@01) xs4@40@01))
; [eval] (inv_3_1(x, y, z) in ys4)
; [eval] inv_3_1(x, y, z)
(push) ; 8
; [then-branch: 146 | !(inv_3_1[Ref](x@164@01, y@165@01, z@166@01) in ys4@51@01) | live]
; [else-branch: 146 | inv_3_1[Ref](x@164@01, y@165@01, z@166@01) in ys4@51@01 | live]
(push) ; 9
; [then-branch: 146 | !(inv_3_1[Ref](x@164@01, y@165@01, z@166@01) in ys4@51@01)]
(assert (not (Set_in (inv_3_1<Ref> x@164@01 y@165@01 z@166@01) ys4@51@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 146 | inv_3_1[Ref](x@164@01, y@165@01, z@166@01) in ys4@51@01]
(assert (Set_in (inv_3_1<Ref> x@164@01 y@165@01 z@166@01) ys4@51@01))
; [eval] (inv_3_2(x, y, z) in zs4)
; [eval] inv_3_2(x, y, z)
(push) ; 10
; [then-branch: 147 | !(inv_3_2[Ref](x@164@01, y@165@01, z@166@01) in zs4@62@01) | live]
; [else-branch: 147 | inv_3_2[Ref](x@164@01, y@165@01, z@166@01) in zs4@62@01 | live]
(push) ; 11
; [then-branch: 147 | !(inv_3_2[Ref](x@164@01, y@165@01, z@166@01) in zs4@62@01)]
(assert (not (Set_in (inv_3_2<Ref> x@164@01 y@165@01 z@166@01) zs4@62@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 147 | inv_3_2[Ref](x@164@01, y@165@01, z@166@01) in zs4@62@01]
(assert (Set_in (inv_3_2<Ref> x@164@01 y@165@01 z@166@01) zs4@62@01))
; [eval] x == x
(push) ; 12
; [then-branch: 148 | False | live]
; [else-branch: 148 | True | live]
(push) ; 13
; [then-branch: 148 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 148 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 149 | False | live]
; [else-branch: 149 | True | live]
(push) ; 15
; [then-branch: 149 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 149 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_3_2<Ref> x@164@01 y@165@01 z@166@01) zs4@62@01)
  (not (Set_in (inv_3_2<Ref> x@164@01 y@165@01 z@166@01) zs4@62@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_3_1<Ref> x@164@01 y@165@01 z@166@01) ys4@51@01)
  (and
    (Set_in (inv_3_1<Ref> x@164@01 y@165@01 z@166@01) ys4@51@01)
    (or
      (Set_in (inv_3_2<Ref> x@164@01 y@165@01 z@166@01) zs4@62@01)
      (not (Set_in (inv_3_2<Ref> x@164@01 y@165@01 z@166@01) zs4@62@01))))))
(assert (or
  (Set_in (inv_3_1<Ref> x@164@01 y@165@01 z@166@01) ys4@51@01)
  (not (Set_in (inv_3_1<Ref> x@164@01 y@165@01 z@166@01) ys4@51@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_3_0<Ref> x@164@01 y@165@01 z@166@01) xs4@40@01)
  (and
    (Set_in (inv_3_0<Ref> x@164@01 y@165@01 z@166@01) xs4@40@01)
    (=>
      (Set_in (inv_3_1<Ref> x@164@01 y@165@01 z@166@01) ys4@51@01)
      (and
        (Set_in (inv_3_1<Ref> x@164@01 y@165@01 z@166@01) ys4@51@01)
        (or
          (Set_in (inv_3_2<Ref> x@164@01 y@165@01 z@166@01) zs4@62@01)
          (not (Set_in (inv_3_2<Ref> x@164@01 y@165@01 z@166@01) zs4@62@01)))))
    (or
      (Set_in (inv_3_1<Ref> x@164@01 y@165@01 z@166@01) ys4@51@01)
      (not (Set_in (inv_3_1<Ref> x@164@01 y@165@01 z@166@01) ys4@51@01))))))
(assert (or
  (Set_in (inv_3_0<Ref> x@164@01 y@165@01 z@166@01) xs4@40@01)
  (not (Set_in (inv_3_0<Ref> x@164@01 y@165@01 z@166@01) xs4@40@01))))
; [eval] (inv_4_0(x, y, z) in xs5) && ((inv_4_1(x, y, z) in ys5) && (inv_4_2(x, y, z) in zs5)) && (x == x && y == y && z == z)
; [eval] (inv_4_0(x, y, z) in xs5)
; [eval] inv_4_0(x, y, z)
(push) ; 6
; [then-branch: 150 | !(inv_4_0[Ref](x@164@01, y@165@01, z@166@01) in xs5@41@01) | live]
; [else-branch: 150 | inv_4_0[Ref](x@164@01, y@165@01, z@166@01) in xs5@41@01 | live]
(push) ; 7
; [then-branch: 150 | !(inv_4_0[Ref](x@164@01, y@165@01, z@166@01) in xs5@41@01)]
(assert (not (Set_in (inv_4_0<Ref> x@164@01 y@165@01 z@166@01) xs5@41@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 150 | inv_4_0[Ref](x@164@01, y@165@01, z@166@01) in xs5@41@01]
(assert (Set_in (inv_4_0<Ref> x@164@01 y@165@01 z@166@01) xs5@41@01))
; [eval] (inv_4_1(x, y, z) in ys5)
; [eval] inv_4_1(x, y, z)
(push) ; 8
; [then-branch: 151 | !(inv_4_1[Ref](x@164@01, y@165@01, z@166@01) in ys5@52@01) | live]
; [else-branch: 151 | inv_4_1[Ref](x@164@01, y@165@01, z@166@01) in ys5@52@01 | live]
(push) ; 9
; [then-branch: 151 | !(inv_4_1[Ref](x@164@01, y@165@01, z@166@01) in ys5@52@01)]
(assert (not (Set_in (inv_4_1<Ref> x@164@01 y@165@01 z@166@01) ys5@52@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 151 | inv_4_1[Ref](x@164@01, y@165@01, z@166@01) in ys5@52@01]
(assert (Set_in (inv_4_1<Ref> x@164@01 y@165@01 z@166@01) ys5@52@01))
; [eval] (inv_4_2(x, y, z) in zs5)
; [eval] inv_4_2(x, y, z)
(push) ; 10
; [then-branch: 152 | !(inv_4_2[Ref](x@164@01, y@165@01, z@166@01) in zs5@63@01) | live]
; [else-branch: 152 | inv_4_2[Ref](x@164@01, y@165@01, z@166@01) in zs5@63@01 | live]
(push) ; 11
; [then-branch: 152 | !(inv_4_2[Ref](x@164@01, y@165@01, z@166@01) in zs5@63@01)]
(assert (not (Set_in (inv_4_2<Ref> x@164@01 y@165@01 z@166@01) zs5@63@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 152 | inv_4_2[Ref](x@164@01, y@165@01, z@166@01) in zs5@63@01]
(assert (Set_in (inv_4_2<Ref> x@164@01 y@165@01 z@166@01) zs5@63@01))
; [eval] x == x
(push) ; 12
; [then-branch: 153 | False | live]
; [else-branch: 153 | True | live]
(push) ; 13
; [then-branch: 153 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 153 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 154 | False | live]
; [else-branch: 154 | True | live]
(push) ; 15
; [then-branch: 154 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 154 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_4_2<Ref> x@164@01 y@165@01 z@166@01) zs5@63@01)
  (not (Set_in (inv_4_2<Ref> x@164@01 y@165@01 z@166@01) zs5@63@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_4_1<Ref> x@164@01 y@165@01 z@166@01) ys5@52@01)
  (and
    (Set_in (inv_4_1<Ref> x@164@01 y@165@01 z@166@01) ys5@52@01)
    (or
      (Set_in (inv_4_2<Ref> x@164@01 y@165@01 z@166@01) zs5@63@01)
      (not (Set_in (inv_4_2<Ref> x@164@01 y@165@01 z@166@01) zs5@63@01))))))
(assert (or
  (Set_in (inv_4_1<Ref> x@164@01 y@165@01 z@166@01) ys5@52@01)
  (not (Set_in (inv_4_1<Ref> x@164@01 y@165@01 z@166@01) ys5@52@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_4_0<Ref> x@164@01 y@165@01 z@166@01) xs5@41@01)
  (and
    (Set_in (inv_4_0<Ref> x@164@01 y@165@01 z@166@01) xs5@41@01)
    (=>
      (Set_in (inv_4_1<Ref> x@164@01 y@165@01 z@166@01) ys5@52@01)
      (and
        (Set_in (inv_4_1<Ref> x@164@01 y@165@01 z@166@01) ys5@52@01)
        (or
          (Set_in (inv_4_2<Ref> x@164@01 y@165@01 z@166@01) zs5@63@01)
          (not (Set_in (inv_4_2<Ref> x@164@01 y@165@01 z@166@01) zs5@63@01)))))
    (or
      (Set_in (inv_4_1<Ref> x@164@01 y@165@01 z@166@01) ys5@52@01)
      (not (Set_in (inv_4_1<Ref> x@164@01 y@165@01 z@166@01) ys5@52@01))))))
(assert (or
  (Set_in (inv_4_0<Ref> x@164@01 y@165@01 z@166@01) xs5@41@01)
  (not (Set_in (inv_4_0<Ref> x@164@01 y@165@01 z@166@01) xs5@41@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 129 | !(inv_5_0[Ref](x@164@01, y@165@01, z@166@01) in xs6@42@01 && inv_5_1[Ref](x@164@01, y@165@01, z@166@01) in ys6@53@01 && inv_5_2[Ref](x@164@01, y@165@01, z@166@01) in zs6@64@01)]
(assert (not
  (and
    (Set_in (inv_5_0<Ref> x@164@01 y@165@01 z@166@01) xs6@42@01)
    (and
      (Set_in (inv_5_1<Ref> x@164@01 y@165@01 z@166@01) ys6@53@01)
      (Set_in (inv_5_2<Ref> x@164@01 y@165@01 z@166@01) zs6@64@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (=
    ($PSF.perm_p (as pm@167@01  $PPM) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    (ite
      (and
        (and (img@83@01 x y z) (img@85@01 x y z) (img@87@01 x y z))
        (and
          (Set_in (inv@82@01 x y z) xs@70@01)
          (and
            (Set_in (inv@84@01 x y z) ys@71@01)
            (Set_in (inv@86@01 x y z) zs@72@01))))
      q@73@01
      $Perm.No))
  :pattern (($PSF.perm_p (as pm@167@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resPrmSumDef12|)))
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (and
    ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    ($PSF.loc_p ($PSF.lookup_p $t@81@01 ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))))
  :pattern (($PSF.perm_p (as pm@167@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resTrgDef13|)))
(assert (=>
  (and
    (Set_in (inv_5_0<Ref> x@164@01 y@165@01 z@166@01) xs6@42@01)
    (and
      (Set_in (inv_5_1<Ref> x@164@01 y@165@01 z@166@01) ys6@53@01)
      (Set_in (inv_5_2<Ref> x@164@01 y@165@01 z@166@01) zs6@64@01)))
  (and
    (Set_in (inv_5_0<Ref> x@164@01 y@165@01 z@166@01) xs6@42@01)
    (Set_in (inv_5_1<Ref> x@164@01 y@165@01 z@166@01) ys6@53@01)
    (Set_in (inv_5_2<Ref> x@164@01 y@165@01 z@166@01) zs6@64@01)
    ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x@164@01)
        ($SortWrappers.$RefTo$Snap y@165@01))
      ($SortWrappers.$RefTo$Snap z@166@01))) ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x@164@01)
        ($SortWrappers.$RefTo$Snap y@165@01))
      ($SortWrappers.$RefTo$Snap z@166@01)))
    (=>
      (Set_in (inv_0_0<Ref> x@164@01 y@165@01 z@166@01) xs1@37@01)
      (and
        (Set_in (inv_0_0<Ref> x@164@01 y@165@01 z@166@01) xs1@37@01)
        (=>
          (Set_in (inv_0_1<Ref> x@164@01 y@165@01 z@166@01) ys1@48@01)
          (and
            (Set_in (inv_0_1<Ref> x@164@01 y@165@01 z@166@01) ys1@48@01)
            (or
              (Set_in (inv_0_2<Ref> x@164@01 y@165@01 z@166@01) zs1@59@01)
              (not (Set_in (inv_0_2<Ref> x@164@01 y@165@01 z@166@01) zs1@59@01)))))
        (or
          (Set_in (inv_0_1<Ref> x@164@01 y@165@01 z@166@01) ys1@48@01)
          (not (Set_in (inv_0_1<Ref> x@164@01 y@165@01 z@166@01) ys1@48@01)))))
    (or
      (Set_in (inv_0_0<Ref> x@164@01 y@165@01 z@166@01) xs1@37@01)
      (not (Set_in (inv_0_0<Ref> x@164@01 y@165@01 z@166@01) xs1@37@01)))
    (=>
      (Set_in (inv_1_0<Ref> x@164@01 y@165@01 z@166@01) xs2@38@01)
      (and
        (Set_in (inv_1_0<Ref> x@164@01 y@165@01 z@166@01) xs2@38@01)
        (=>
          (Set_in (inv_1_1<Ref> x@164@01 y@165@01 z@166@01) ys2@49@01)
          (and
            (Set_in (inv_1_1<Ref> x@164@01 y@165@01 z@166@01) ys2@49@01)
            (or
              (Set_in (inv_1_2<Ref> x@164@01 y@165@01 z@166@01) zs2@60@01)
              (not (Set_in (inv_1_2<Ref> x@164@01 y@165@01 z@166@01) zs2@60@01)))))
        (or
          (Set_in (inv_1_1<Ref> x@164@01 y@165@01 z@166@01) ys2@49@01)
          (not (Set_in (inv_1_1<Ref> x@164@01 y@165@01 z@166@01) ys2@49@01)))))
    (or
      (Set_in (inv_1_0<Ref> x@164@01 y@165@01 z@166@01) xs2@38@01)
      (not (Set_in (inv_1_0<Ref> x@164@01 y@165@01 z@166@01) xs2@38@01)))
    (=>
      (Set_in (inv_2_0<Ref> x@164@01 y@165@01 z@166@01) xs3@39@01)
      (and
        (Set_in (inv_2_0<Ref> x@164@01 y@165@01 z@166@01) xs3@39@01)
        (=>
          (Set_in (inv_2_1<Ref> x@164@01 y@165@01 z@166@01) ys3@50@01)
          (and
            (Set_in (inv_2_1<Ref> x@164@01 y@165@01 z@166@01) ys3@50@01)
            (or
              (Set_in (inv_2_2<Ref> x@164@01 y@165@01 z@166@01) zs3@61@01)
              (not (Set_in (inv_2_2<Ref> x@164@01 y@165@01 z@166@01) zs3@61@01)))))
        (or
          (Set_in (inv_2_1<Ref> x@164@01 y@165@01 z@166@01) ys3@50@01)
          (not (Set_in (inv_2_1<Ref> x@164@01 y@165@01 z@166@01) ys3@50@01)))))
    (or
      (Set_in (inv_2_0<Ref> x@164@01 y@165@01 z@166@01) xs3@39@01)
      (not (Set_in (inv_2_0<Ref> x@164@01 y@165@01 z@166@01) xs3@39@01)))
    (=>
      (Set_in (inv_3_0<Ref> x@164@01 y@165@01 z@166@01) xs4@40@01)
      (and
        (Set_in (inv_3_0<Ref> x@164@01 y@165@01 z@166@01) xs4@40@01)
        (=>
          (Set_in (inv_3_1<Ref> x@164@01 y@165@01 z@166@01) ys4@51@01)
          (and
            (Set_in (inv_3_1<Ref> x@164@01 y@165@01 z@166@01) ys4@51@01)
            (or
              (Set_in (inv_3_2<Ref> x@164@01 y@165@01 z@166@01) zs4@62@01)
              (not (Set_in (inv_3_2<Ref> x@164@01 y@165@01 z@166@01) zs4@62@01)))))
        (or
          (Set_in (inv_3_1<Ref> x@164@01 y@165@01 z@166@01) ys4@51@01)
          (not (Set_in (inv_3_1<Ref> x@164@01 y@165@01 z@166@01) ys4@51@01)))))
    (or
      (Set_in (inv_3_0<Ref> x@164@01 y@165@01 z@166@01) xs4@40@01)
      (not (Set_in (inv_3_0<Ref> x@164@01 y@165@01 z@166@01) xs4@40@01)))
    (=>
      (Set_in (inv_4_0<Ref> x@164@01 y@165@01 z@166@01) xs5@41@01)
      (and
        (Set_in (inv_4_0<Ref> x@164@01 y@165@01 z@166@01) xs5@41@01)
        (=>
          (Set_in (inv_4_1<Ref> x@164@01 y@165@01 z@166@01) ys5@52@01)
          (and
            (Set_in (inv_4_1<Ref> x@164@01 y@165@01 z@166@01) ys5@52@01)
            (or
              (Set_in (inv_4_2<Ref> x@164@01 y@165@01 z@166@01) zs5@63@01)
              (not (Set_in (inv_4_2<Ref> x@164@01 y@165@01 z@166@01) zs5@63@01)))))
        (or
          (Set_in (inv_4_1<Ref> x@164@01 y@165@01 z@166@01) ys5@52@01)
          (not (Set_in (inv_4_1<Ref> x@164@01 y@165@01 z@166@01) ys5@52@01)))))
    (or
      (Set_in (inv_4_0<Ref> x@164@01 y@165@01 z@166@01) xs5@41@01)
      (not (Set_in (inv_4_0<Ref> x@164@01 y@165@01 z@166@01) xs5@41@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in (inv_5_0<Ref> x@164@01 y@165@01 z@166@01) xs6@42@01)
      (and
        (Set_in (inv_5_1<Ref> x@164@01 y@165@01 z@166@01) ys6@53@01)
        (Set_in (inv_5_2<Ref> x@164@01 y@165@01 z@166@01) zs6@64@01))))
  (and
    (Set_in (inv_5_0<Ref> x@164@01 y@165@01 z@166@01) xs6@42@01)
    (and
      (Set_in (inv_5_1<Ref> x@164@01 y@165@01 z@166@01) ys6@53@01)
      (Set_in (inv_5_2<Ref> x@164@01 y@165@01 z@166@01) zs6@64@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (=
    ($PSF.perm_p (as pm@167@01  $PPM) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    (ite
      (and
        (and (img@83@01 x y z) (img@85@01 x y z) (img@87@01 x y z))
        (and
          (Set_in (inv@82@01 x y z) xs@70@01)
          (and
            (Set_in (inv@84@01 x y z) ys@71@01)
            (Set_in (inv@86@01 x y z) zs@72@01))))
      q@73@01
      $Perm.No))
  :pattern (($PSF.perm_p (as pm@167@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resPrmSumDef12|)))
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (and
    ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    ($PSF.loc_p ($PSF.lookup_p $t@81@01 ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))))
  :pattern (($PSF.perm_p (as pm@167@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resTrgDef13|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@164@01 $Ref) (y@165@01 $Ref) (z@166@01 $Ref)) (!
  (and
    (=>
      (Set_in (inv_5_0<Ref> x@164@01 y@165@01 z@166@01) xs6@42@01)
      (and
        (Set_in (inv_5_0<Ref> x@164@01 y@165@01 z@166@01) xs6@42@01)
        (or
          (Set_in (inv_5_1<Ref> x@164@01 y@165@01 z@166@01) ys6@53@01)
          (not (Set_in (inv_5_1<Ref> x@164@01 y@165@01 z@166@01) ys6@53@01)))))
    (or
      (Set_in (inv_5_0<Ref> x@164@01 y@165@01 z@166@01) xs6@42@01)
      (not (Set_in (inv_5_0<Ref> x@164@01 y@165@01 z@166@01) xs6@42@01)))
    (=>
      (and
        (Set_in (inv_5_0<Ref> x@164@01 y@165@01 z@166@01) xs6@42@01)
        (and
          (Set_in (inv_5_1<Ref> x@164@01 y@165@01 z@166@01) ys6@53@01)
          (Set_in (inv_5_2<Ref> x@164@01 y@165@01 z@166@01) zs6@64@01)))
      (and
        (Set_in (inv_5_0<Ref> x@164@01 y@165@01 z@166@01) xs6@42@01)
        (Set_in (inv_5_1<Ref> x@164@01 y@165@01 z@166@01) ys6@53@01)
        (Set_in (inv_5_2<Ref> x@164@01 y@165@01 z@166@01) zs6@64@01)
        ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap x@164@01)
            ($SortWrappers.$RefTo$Snap y@165@01))
          ($SortWrappers.$RefTo$Snap z@166@01))) ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap x@164@01)
            ($SortWrappers.$RefTo$Snap y@165@01))
          ($SortWrappers.$RefTo$Snap z@166@01)))
        (=>
          (Set_in (inv_0_0<Ref> x@164@01 y@165@01 z@166@01) xs1@37@01)
          (and
            (Set_in (inv_0_0<Ref> x@164@01 y@165@01 z@166@01) xs1@37@01)
            (=>
              (Set_in (inv_0_1<Ref> x@164@01 y@165@01 z@166@01) ys1@48@01)
              (and
                (Set_in (inv_0_1<Ref> x@164@01 y@165@01 z@166@01) ys1@48@01)
                (or
                  (Set_in (inv_0_2<Ref> x@164@01 y@165@01 z@166@01) zs1@59@01)
                  (not
                    (Set_in (inv_0_2<Ref> x@164@01 y@165@01 z@166@01) zs1@59@01)))))
            (or
              (Set_in (inv_0_1<Ref> x@164@01 y@165@01 z@166@01) ys1@48@01)
              (not (Set_in (inv_0_1<Ref> x@164@01 y@165@01 z@166@01) ys1@48@01)))))
        (or
          (Set_in (inv_0_0<Ref> x@164@01 y@165@01 z@166@01) xs1@37@01)
          (not (Set_in (inv_0_0<Ref> x@164@01 y@165@01 z@166@01) xs1@37@01)))
        (=>
          (Set_in (inv_1_0<Ref> x@164@01 y@165@01 z@166@01) xs2@38@01)
          (and
            (Set_in (inv_1_0<Ref> x@164@01 y@165@01 z@166@01) xs2@38@01)
            (=>
              (Set_in (inv_1_1<Ref> x@164@01 y@165@01 z@166@01) ys2@49@01)
              (and
                (Set_in (inv_1_1<Ref> x@164@01 y@165@01 z@166@01) ys2@49@01)
                (or
                  (Set_in (inv_1_2<Ref> x@164@01 y@165@01 z@166@01) zs2@60@01)
                  (not
                    (Set_in (inv_1_2<Ref> x@164@01 y@165@01 z@166@01) zs2@60@01)))))
            (or
              (Set_in (inv_1_1<Ref> x@164@01 y@165@01 z@166@01) ys2@49@01)
              (not (Set_in (inv_1_1<Ref> x@164@01 y@165@01 z@166@01) ys2@49@01)))))
        (or
          (Set_in (inv_1_0<Ref> x@164@01 y@165@01 z@166@01) xs2@38@01)
          (not (Set_in (inv_1_0<Ref> x@164@01 y@165@01 z@166@01) xs2@38@01)))
        (=>
          (Set_in (inv_2_0<Ref> x@164@01 y@165@01 z@166@01) xs3@39@01)
          (and
            (Set_in (inv_2_0<Ref> x@164@01 y@165@01 z@166@01) xs3@39@01)
            (=>
              (Set_in (inv_2_1<Ref> x@164@01 y@165@01 z@166@01) ys3@50@01)
              (and
                (Set_in (inv_2_1<Ref> x@164@01 y@165@01 z@166@01) ys3@50@01)
                (or
                  (Set_in (inv_2_2<Ref> x@164@01 y@165@01 z@166@01) zs3@61@01)
                  (not
                    (Set_in (inv_2_2<Ref> x@164@01 y@165@01 z@166@01) zs3@61@01)))))
            (or
              (Set_in (inv_2_1<Ref> x@164@01 y@165@01 z@166@01) ys3@50@01)
              (not (Set_in (inv_2_1<Ref> x@164@01 y@165@01 z@166@01) ys3@50@01)))))
        (or
          (Set_in (inv_2_0<Ref> x@164@01 y@165@01 z@166@01) xs3@39@01)
          (not (Set_in (inv_2_0<Ref> x@164@01 y@165@01 z@166@01) xs3@39@01)))
        (=>
          (Set_in (inv_3_0<Ref> x@164@01 y@165@01 z@166@01) xs4@40@01)
          (and
            (Set_in (inv_3_0<Ref> x@164@01 y@165@01 z@166@01) xs4@40@01)
            (=>
              (Set_in (inv_3_1<Ref> x@164@01 y@165@01 z@166@01) ys4@51@01)
              (and
                (Set_in (inv_3_1<Ref> x@164@01 y@165@01 z@166@01) ys4@51@01)
                (or
                  (Set_in (inv_3_2<Ref> x@164@01 y@165@01 z@166@01) zs4@62@01)
                  (not
                    (Set_in (inv_3_2<Ref> x@164@01 y@165@01 z@166@01) zs4@62@01)))))
            (or
              (Set_in (inv_3_1<Ref> x@164@01 y@165@01 z@166@01) ys4@51@01)
              (not (Set_in (inv_3_1<Ref> x@164@01 y@165@01 z@166@01) ys4@51@01)))))
        (or
          (Set_in (inv_3_0<Ref> x@164@01 y@165@01 z@166@01) xs4@40@01)
          (not (Set_in (inv_3_0<Ref> x@164@01 y@165@01 z@166@01) xs4@40@01)))
        (=>
          (Set_in (inv_4_0<Ref> x@164@01 y@165@01 z@166@01) xs5@41@01)
          (and
            (Set_in (inv_4_0<Ref> x@164@01 y@165@01 z@166@01) xs5@41@01)
            (=>
              (Set_in (inv_4_1<Ref> x@164@01 y@165@01 z@166@01) ys5@52@01)
              (and
                (Set_in (inv_4_1<Ref> x@164@01 y@165@01 z@166@01) ys5@52@01)
                (or
                  (Set_in (inv_4_2<Ref> x@164@01 y@165@01 z@166@01) zs5@63@01)
                  (not
                    (Set_in (inv_4_2<Ref> x@164@01 y@165@01 z@166@01) zs5@63@01)))))
            (or
              (Set_in (inv_4_1<Ref> x@164@01 y@165@01 z@166@01) ys5@52@01)
              (not (Set_in (inv_4_1<Ref> x@164@01 y@165@01 z@166@01) ys5@52@01)))))
        (or
          (Set_in (inv_4_0<Ref> x@164@01 y@165@01 z@166@01) xs5@41@01)
          (not (Set_in (inv_4_0<Ref> x@164@01 y@165@01 z@166@01) xs5@41@01)))))
    (or
      (not
        (and
          (Set_in (inv_5_0<Ref> x@164@01 y@165@01 z@166@01) xs6@42@01)
          (and
            (Set_in (inv_5_1<Ref> x@164@01 y@165@01 z@166@01) ys6@53@01)
            (Set_in (inv_5_2<Ref> x@164@01 y@165@01 z@166@01) zs6@64@01))))
      (and
        (Set_in (inv_5_0<Ref> x@164@01 y@165@01 z@166@01) xs6@42@01)
        (and
          (Set_in (inv_5_1<Ref> x@164@01 y@165@01 z@166@01) ys6@53@01)
          (Set_in (inv_5_2<Ref> x@164@01 y@165@01 z@166@01) zs6@64@01)))))
  :pattern ((inv_5_0<Ref> x@164@01 y@165@01 z@166@01) (inv_5_1<Ref> x@164@01 y@165@01 z@166@01) (inv_5_2<Ref> x@164@01 y@165@01 z@166@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@25@9@25@122-aux|)))
(assert (forall ((x@164@01 $Ref) (y@165@01 $Ref) (z@166@01 $Ref)) (!
  (=>
    (and
      (Set_in (inv_5_0<Ref> x@164@01 y@165@01 z@166@01) xs6@42@01)
      (and
        (Set_in (inv_5_1<Ref> x@164@01 y@165@01 z@166@01) ys6@53@01)
        (Set_in (inv_5_2<Ref> x@164@01 y@165@01 z@166@01) zs6@64@01)))
    (>=
      ($PSF.perm_p (as pm@167@01  $PPM) ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap x@164@01)
          ($SortWrappers.$RefTo$Snap y@165@01))
        ($SortWrappers.$RefTo$Snap z@166@01)))
      (__iar__assume_helper_5<Perm> (and
        (Set_in (inv_0_0<Ref> x@164@01 y@165@01 z@166@01) xs1@37@01)
        (and
          (Set_in (inv_0_1<Ref> x@164@01 y@165@01 z@166@01) ys1@48@01)
          (Set_in (inv_0_2<Ref> x@164@01 y@165@01 z@166@01) zs1@59@01))) (and
        (Set_in (inv_1_0<Ref> x@164@01 y@165@01 z@166@01) xs2@38@01)
        (and
          (Set_in (inv_1_1<Ref> x@164@01 y@165@01 z@166@01) ys2@49@01)
          (Set_in (inv_1_2<Ref> x@164@01 y@165@01 z@166@01) zs2@60@01))) (and
        (Set_in (inv_2_0<Ref> x@164@01 y@165@01 z@166@01) xs3@39@01)
        (and
          (Set_in (inv_2_1<Ref> x@164@01 y@165@01 z@166@01) ys3@50@01)
          (Set_in (inv_2_2<Ref> x@164@01 y@165@01 z@166@01) zs3@61@01))) (and
        (Set_in (inv_3_0<Ref> x@164@01 y@165@01 z@166@01) xs4@40@01)
        (and
          (Set_in (inv_3_1<Ref> x@164@01 y@165@01 z@166@01) ys4@51@01)
          (Set_in (inv_3_2<Ref> x@164@01 y@165@01 z@166@01) zs4@62@01))) (and
        (Set_in (inv_4_0<Ref> x@164@01 y@165@01 z@166@01) xs5@41@01)
        (and
          (Set_in (inv_4_1<Ref> x@164@01 y@165@01 z@166@01) ys5@52@01)
          (Set_in (inv_4_2<Ref> x@164@01 y@165@01 z@166@01) zs5@63@01))) q@73@01 q@73@01 q@73@01 q@73@01 q@73@01 q@73@01)))
  :pattern ((inv_5_0<Ref> x@164@01 y@165@01 z@166@01) (inv_5_1<Ref> x@164@01 y@165@01 z@166@01) (inv_5_2<Ref> x@164@01 y@165@01 z@166@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@25@9@25@122|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x7: Ref, y7: Ref, z7: Ref ::
;     { p(x7, y7, z7) }
;     (x7 in xs7) && ((y7 in ys7) && (z7 in zs7)) ==>
;     inv_6_0(x7, y7, z7) == x7 && inv_6_1(x7, y7, z7) == y7 &&
;     inv_6_2(x7, y7, z7) == z7)
(declare-const $t@168@01 $Snap)
(assert (= $t@168@01 $Snap.unit))
; [eval] (forall x7: Ref, y7: Ref, z7: Ref :: { p(x7, y7, z7) } (x7 in xs7) && ((y7 in ys7) && (z7 in zs7)) ==> inv_6_0(x7, y7, z7) == x7 && inv_6_1(x7, y7, z7) == y7 && inv_6_2(x7, y7, z7) == z7)
(declare-const x7@169@01 $Ref)
(declare-const y7@170@01 $Ref)
(declare-const z7@171@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x7 in xs7) && ((y7 in ys7) && (z7 in zs7)) ==> inv_6_0(x7, y7, z7) == x7 && inv_6_1(x7, y7, z7) == y7 && inv_6_2(x7, y7, z7) == z7
; [eval] (x7 in xs7) && ((y7 in ys7) && (z7 in zs7))
; [eval] (x7 in xs7)
(push) ; 4
; [then-branch: 155 | !(x7@169@01 in xs7@43@01) | live]
; [else-branch: 155 | x7@169@01 in xs7@43@01 | live]
(push) ; 5
; [then-branch: 155 | !(x7@169@01 in xs7@43@01)]
(assert (not (Set_in x7@169@01 xs7@43@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 155 | x7@169@01 in xs7@43@01]
(assert (Set_in x7@169@01 xs7@43@01))
; [eval] (y7 in ys7)
(push) ; 6
; [then-branch: 156 | !(y7@170@01 in ys7@54@01) | live]
; [else-branch: 156 | y7@170@01 in ys7@54@01 | live]
(push) ; 7
; [then-branch: 156 | !(y7@170@01 in ys7@54@01)]
(assert (not (Set_in y7@170@01 ys7@54@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 156 | y7@170@01 in ys7@54@01]
(assert (Set_in y7@170@01 ys7@54@01))
; [eval] (z7 in zs7)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (Set_in y7@170@01 ys7@54@01) (not (Set_in y7@170@01 ys7@54@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in x7@169@01 xs7@43@01)
  (and
    (Set_in x7@169@01 xs7@43@01)
    (or (Set_in y7@170@01 ys7@54@01) (not (Set_in y7@170@01 ys7@54@01))))))
(assert (or (Set_in x7@169@01 xs7@43@01) (not (Set_in x7@169@01 xs7@43@01))))
(push) ; 4
; [then-branch: 157 | x7@169@01 in xs7@43@01 && y7@170@01 in ys7@54@01 && z7@171@01 in zs7@65@01 | live]
; [else-branch: 157 | !(x7@169@01 in xs7@43@01 && y7@170@01 in ys7@54@01 && z7@171@01 in zs7@65@01) | live]
(push) ; 5
; [then-branch: 157 | x7@169@01 in xs7@43@01 && y7@170@01 in ys7@54@01 && z7@171@01 in zs7@65@01]
(assert (and
  (Set_in x7@169@01 xs7@43@01)
  (and (Set_in y7@170@01 ys7@54@01) (Set_in z7@171@01 zs7@65@01))))
; [eval] inv_6_0(x7, y7, z7) == x7 && inv_6_1(x7, y7, z7) == y7 && inv_6_2(x7, y7, z7) == z7
; [eval] inv_6_0(x7, y7, z7) == x7
; [eval] inv_6_0(x7, y7, z7)
(push) ; 6
; [then-branch: 158 | inv_6_0[Ref](x7@169@01, y7@170@01, z7@171@01) != x7@169@01 | live]
; [else-branch: 158 | inv_6_0[Ref](x7@169@01, y7@170@01, z7@171@01) == x7@169@01 | live]
(push) ; 7
; [then-branch: 158 | inv_6_0[Ref](x7@169@01, y7@170@01, z7@171@01) != x7@169@01]
(assert (not (= (inv_6_0<Ref> x7@169@01 y7@170@01 z7@171@01) x7@169@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 158 | inv_6_0[Ref](x7@169@01, y7@170@01, z7@171@01) == x7@169@01]
(assert (= (inv_6_0<Ref> x7@169@01 y7@170@01 z7@171@01) x7@169@01))
; [eval] inv_6_1(x7, y7, z7) == y7
; [eval] inv_6_1(x7, y7, z7)
(push) ; 8
; [then-branch: 159 | inv_6_1[Ref](x7@169@01, y7@170@01, z7@171@01) != y7@170@01 | live]
; [else-branch: 159 | inv_6_1[Ref](x7@169@01, y7@170@01, z7@171@01) == y7@170@01 | live]
(push) ; 9
; [then-branch: 159 | inv_6_1[Ref](x7@169@01, y7@170@01, z7@171@01) != y7@170@01]
(assert (not (= (inv_6_1<Ref> x7@169@01 y7@170@01 z7@171@01) y7@170@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 159 | inv_6_1[Ref](x7@169@01, y7@170@01, z7@171@01) == y7@170@01]
(assert (= (inv_6_1<Ref> x7@169@01 y7@170@01 z7@171@01) y7@170@01))
; [eval] inv_6_2(x7, y7, z7) == z7
; [eval] inv_6_2(x7, y7, z7)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or
  (= (inv_6_1<Ref> x7@169@01 y7@170@01 z7@171@01) y7@170@01)
  (not (= (inv_6_1<Ref> x7@169@01 y7@170@01 z7@171@01) y7@170@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (= (inv_6_0<Ref> x7@169@01 y7@170@01 z7@171@01) x7@169@01)
  (and
    (= (inv_6_0<Ref> x7@169@01 y7@170@01 z7@171@01) x7@169@01)
    (or
      (= (inv_6_1<Ref> x7@169@01 y7@170@01 z7@171@01) y7@170@01)
      (not (= (inv_6_1<Ref> x7@169@01 y7@170@01 z7@171@01) y7@170@01))))))
(assert (or
  (= (inv_6_0<Ref> x7@169@01 y7@170@01 z7@171@01) x7@169@01)
  (not (= (inv_6_0<Ref> x7@169@01 y7@170@01 z7@171@01) x7@169@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 157 | !(x7@169@01 in xs7@43@01 && y7@170@01 in ys7@54@01 && z7@171@01 in zs7@65@01)]
(assert (not
  (and
    (Set_in x7@169@01 xs7@43@01)
    (and (Set_in y7@170@01 ys7@54@01) (Set_in z7@171@01 zs7@65@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Set_in x7@169@01 xs7@43@01)
    (and (Set_in y7@170@01 ys7@54@01) (Set_in z7@171@01 zs7@65@01)))
  (and
    (Set_in x7@169@01 xs7@43@01)
    (Set_in y7@170@01 ys7@54@01)
    (Set_in z7@171@01 zs7@65@01)
    (=>
      (= (inv_6_0<Ref> x7@169@01 y7@170@01 z7@171@01) x7@169@01)
      (and
        (= (inv_6_0<Ref> x7@169@01 y7@170@01 z7@171@01) x7@169@01)
        (or
          (= (inv_6_1<Ref> x7@169@01 y7@170@01 z7@171@01) y7@170@01)
          (not (= (inv_6_1<Ref> x7@169@01 y7@170@01 z7@171@01) y7@170@01)))))
    (or
      (= (inv_6_0<Ref> x7@169@01 y7@170@01 z7@171@01) x7@169@01)
      (not (= (inv_6_0<Ref> x7@169@01 y7@170@01 z7@171@01) x7@169@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in x7@169@01 xs7@43@01)
      (and (Set_in y7@170@01 ys7@54@01) (Set_in z7@171@01 zs7@65@01))))
  (and
    (Set_in x7@169@01 xs7@43@01)
    (and (Set_in y7@170@01 ys7@54@01) (Set_in z7@171@01 zs7@65@01)))))
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x7@169@01 $Ref) (y7@170@01 $Ref) (z7@171@01 $Ref)) (!
  (and
    (=>
      (Set_in x7@169@01 xs7@43@01)
      (and
        (Set_in x7@169@01 xs7@43@01)
        (or (Set_in y7@170@01 ys7@54@01) (not (Set_in y7@170@01 ys7@54@01)))))
    (or (Set_in x7@169@01 xs7@43@01) (not (Set_in x7@169@01 xs7@43@01)))
    (=>
      (and
        (Set_in x7@169@01 xs7@43@01)
        (and (Set_in y7@170@01 ys7@54@01) (Set_in z7@171@01 zs7@65@01)))
      (and
        (Set_in x7@169@01 xs7@43@01)
        (Set_in y7@170@01 ys7@54@01)
        (Set_in z7@171@01 zs7@65@01)
        (=>
          (= (inv_6_0<Ref> x7@169@01 y7@170@01 z7@171@01) x7@169@01)
          (and
            (= (inv_6_0<Ref> x7@169@01 y7@170@01 z7@171@01) x7@169@01)
            (or
              (= (inv_6_1<Ref> x7@169@01 y7@170@01 z7@171@01) y7@170@01)
              (not (= (inv_6_1<Ref> x7@169@01 y7@170@01 z7@171@01) y7@170@01)))))
        (or
          (= (inv_6_0<Ref> x7@169@01 y7@170@01 z7@171@01) x7@169@01)
          (not (= (inv_6_0<Ref> x7@169@01 y7@170@01 z7@171@01) x7@169@01)))))
    (or
      (not
        (and
          (Set_in x7@169@01 xs7@43@01)
          (and (Set_in y7@170@01 ys7@54@01) (Set_in z7@171@01 zs7@65@01))))
      (and
        (Set_in x7@169@01 xs7@43@01)
        (and (Set_in y7@170@01 ys7@54@01) (Set_in z7@171@01 zs7@65@01)))))
  :pattern (($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap x7@169@01)
      ($SortWrappers.$RefTo$Snap y7@170@01))
    ($SortWrappers.$RefTo$Snap z7@171@01))) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap x7@169@01)
      ($SortWrappers.$RefTo$Snap y7@170@01))
    ($SortWrappers.$RefTo$Snap z7@171@01))))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@26@9@26@122-aux|)))
(assert (forall ((x7@169@01 $Ref) (y7@170@01 $Ref) (z7@171@01 $Ref)) (!
  (=>
    (and
      (Set_in x7@169@01 xs7@43@01)
      (and (Set_in y7@170@01 ys7@54@01) (Set_in z7@171@01 zs7@65@01)))
    (and
      (= (inv_6_0<Ref> x7@169@01 y7@170@01 z7@171@01) x7@169@01)
      (and
        (= (inv_6_1<Ref> x7@169@01 y7@170@01 z7@171@01) y7@170@01)
        (= (inv_6_2<Ref> x7@169@01 y7@170@01 z7@171@01) z7@171@01))))
  :pattern (($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap x7@169@01)
      ($SortWrappers.$RefTo$Snap y7@170@01))
    ($SortWrappers.$RefTo$Snap z7@171@01))) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap x7@169@01)
      ($SortWrappers.$RefTo$Snap y7@170@01))
    ($SortWrappers.$RefTo$Snap z7@171@01))))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@26@9@26@122|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x: Ref, y: Ref, z: Ref ::
;     { inv_6_0(x, y, z), inv_6_1(x, y, z), inv_6_2(x, y, z) }
;     (inv_6_0(x, y, z) in xs7) &&
;     ((inv_6_1(x, y, z) in ys7) && (inv_6_2(x, y, z) in zs7)) ==>
;     inv_6_0(x, y, z) == x && inv_6_1(x, y, z) == y && inv_6_2(x, y, z) == z)
(declare-const $t@172@01 $Snap)
(assert (= $t@172@01 $Snap.unit))
; [eval] (forall x: Ref, y: Ref, z: Ref :: { inv_6_0(x, y, z), inv_6_1(x, y, z), inv_6_2(x, y, z) } (inv_6_0(x, y, z) in xs7) && ((inv_6_1(x, y, z) in ys7) && (inv_6_2(x, y, z) in zs7)) ==> inv_6_0(x, y, z) == x && inv_6_1(x, y, z) == y && inv_6_2(x, y, z) == z)
(declare-const x@173@01 $Ref)
(declare-const y@174@01 $Ref)
(declare-const z@175@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (inv_6_0(x, y, z) in xs7) && ((inv_6_1(x, y, z) in ys7) && (inv_6_2(x, y, z) in zs7)) ==> inv_6_0(x, y, z) == x && inv_6_1(x, y, z) == y && inv_6_2(x, y, z) == z
; [eval] (inv_6_0(x, y, z) in xs7) && ((inv_6_1(x, y, z) in ys7) && (inv_6_2(x, y, z) in zs7))
; [eval] (inv_6_0(x, y, z) in xs7)
; [eval] inv_6_0(x, y, z)
(push) ; 4
; [then-branch: 160 | !(inv_6_0[Ref](x@173@01, y@174@01, z@175@01) in xs7@43@01) | live]
; [else-branch: 160 | inv_6_0[Ref](x@173@01, y@174@01, z@175@01) in xs7@43@01 | live]
(push) ; 5
; [then-branch: 160 | !(inv_6_0[Ref](x@173@01, y@174@01, z@175@01) in xs7@43@01)]
(assert (not (Set_in (inv_6_0<Ref> x@173@01 y@174@01 z@175@01) xs7@43@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 160 | inv_6_0[Ref](x@173@01, y@174@01, z@175@01) in xs7@43@01]
(assert (Set_in (inv_6_0<Ref> x@173@01 y@174@01 z@175@01) xs7@43@01))
; [eval] (inv_6_1(x, y, z) in ys7)
; [eval] inv_6_1(x, y, z)
(push) ; 6
; [then-branch: 161 | !(inv_6_1[Ref](x@173@01, y@174@01, z@175@01) in ys7@54@01) | live]
; [else-branch: 161 | inv_6_1[Ref](x@173@01, y@174@01, z@175@01) in ys7@54@01 | live]
(push) ; 7
; [then-branch: 161 | !(inv_6_1[Ref](x@173@01, y@174@01, z@175@01) in ys7@54@01)]
(assert (not (Set_in (inv_6_1<Ref> x@173@01 y@174@01 z@175@01) ys7@54@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 161 | inv_6_1[Ref](x@173@01, y@174@01, z@175@01) in ys7@54@01]
(assert (Set_in (inv_6_1<Ref> x@173@01 y@174@01 z@175@01) ys7@54@01))
; [eval] (inv_6_2(x, y, z) in zs7)
; [eval] inv_6_2(x, y, z)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_6_1<Ref> x@173@01 y@174@01 z@175@01) ys7@54@01)
  (not (Set_in (inv_6_1<Ref> x@173@01 y@174@01 z@175@01) ys7@54@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_6_0<Ref> x@173@01 y@174@01 z@175@01) xs7@43@01)
  (and
    (Set_in (inv_6_0<Ref> x@173@01 y@174@01 z@175@01) xs7@43@01)
    (or
      (Set_in (inv_6_1<Ref> x@173@01 y@174@01 z@175@01) ys7@54@01)
      (not (Set_in (inv_6_1<Ref> x@173@01 y@174@01 z@175@01) ys7@54@01))))))
(assert (or
  (Set_in (inv_6_0<Ref> x@173@01 y@174@01 z@175@01) xs7@43@01)
  (not (Set_in (inv_6_0<Ref> x@173@01 y@174@01 z@175@01) xs7@43@01))))
(push) ; 4
; [then-branch: 162 | inv_6_0[Ref](x@173@01, y@174@01, z@175@01) in xs7@43@01 && inv_6_1[Ref](x@173@01, y@174@01, z@175@01) in ys7@54@01 && inv_6_2[Ref](x@173@01, y@174@01, z@175@01) in zs7@65@01 | live]
; [else-branch: 162 | !(inv_6_0[Ref](x@173@01, y@174@01, z@175@01) in xs7@43@01 && inv_6_1[Ref](x@173@01, y@174@01, z@175@01) in ys7@54@01 && inv_6_2[Ref](x@173@01, y@174@01, z@175@01) in zs7@65@01) | live]
(push) ; 5
; [then-branch: 162 | inv_6_0[Ref](x@173@01, y@174@01, z@175@01) in xs7@43@01 && inv_6_1[Ref](x@173@01, y@174@01, z@175@01) in ys7@54@01 && inv_6_2[Ref](x@173@01, y@174@01, z@175@01) in zs7@65@01]
(assert (and
  (Set_in (inv_6_0<Ref> x@173@01 y@174@01 z@175@01) xs7@43@01)
  (and
    (Set_in (inv_6_1<Ref> x@173@01 y@174@01 z@175@01) ys7@54@01)
    (Set_in (inv_6_2<Ref> x@173@01 y@174@01 z@175@01) zs7@65@01))))
; [eval] inv_6_0(x, y, z) == x && inv_6_1(x, y, z) == y && inv_6_2(x, y, z) == z
; [eval] inv_6_0(x, y, z) == x
; [eval] inv_6_0(x, y, z)
(push) ; 6
; [then-branch: 163 | inv_6_0[Ref](x@173@01, y@174@01, z@175@01) != x@173@01 | live]
; [else-branch: 163 | inv_6_0[Ref](x@173@01, y@174@01, z@175@01) == x@173@01 | live]
(push) ; 7
; [then-branch: 163 | inv_6_0[Ref](x@173@01, y@174@01, z@175@01) != x@173@01]
(assert (not (= (inv_6_0<Ref> x@173@01 y@174@01 z@175@01) x@173@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 163 | inv_6_0[Ref](x@173@01, y@174@01, z@175@01) == x@173@01]
(assert (= (inv_6_0<Ref> x@173@01 y@174@01 z@175@01) x@173@01))
; [eval] inv_6_1(x, y, z) == y
; [eval] inv_6_1(x, y, z)
(push) ; 8
; [then-branch: 164 | inv_6_1[Ref](x@173@01, y@174@01, z@175@01) != y@174@01 | live]
; [else-branch: 164 | inv_6_1[Ref](x@173@01, y@174@01, z@175@01) == y@174@01 | live]
(push) ; 9
; [then-branch: 164 | inv_6_1[Ref](x@173@01, y@174@01, z@175@01) != y@174@01]
(assert (not (= (inv_6_1<Ref> x@173@01 y@174@01 z@175@01) y@174@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 164 | inv_6_1[Ref](x@173@01, y@174@01, z@175@01) == y@174@01]
(assert (= (inv_6_1<Ref> x@173@01 y@174@01 z@175@01) y@174@01))
; [eval] inv_6_2(x, y, z) == z
; [eval] inv_6_2(x, y, z)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or
  (= (inv_6_1<Ref> x@173@01 y@174@01 z@175@01) y@174@01)
  (not (= (inv_6_1<Ref> x@173@01 y@174@01 z@175@01) y@174@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (= (inv_6_0<Ref> x@173@01 y@174@01 z@175@01) x@173@01)
  (and
    (= (inv_6_0<Ref> x@173@01 y@174@01 z@175@01) x@173@01)
    (or
      (= (inv_6_1<Ref> x@173@01 y@174@01 z@175@01) y@174@01)
      (not (= (inv_6_1<Ref> x@173@01 y@174@01 z@175@01) y@174@01))))))
(assert (or
  (= (inv_6_0<Ref> x@173@01 y@174@01 z@175@01) x@173@01)
  (not (= (inv_6_0<Ref> x@173@01 y@174@01 z@175@01) x@173@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 162 | !(inv_6_0[Ref](x@173@01, y@174@01, z@175@01) in xs7@43@01 && inv_6_1[Ref](x@173@01, y@174@01, z@175@01) in ys7@54@01 && inv_6_2[Ref](x@173@01, y@174@01, z@175@01) in zs7@65@01)]
(assert (not
  (and
    (Set_in (inv_6_0<Ref> x@173@01 y@174@01 z@175@01) xs7@43@01)
    (and
      (Set_in (inv_6_1<Ref> x@173@01 y@174@01 z@175@01) ys7@54@01)
      (Set_in (inv_6_2<Ref> x@173@01 y@174@01 z@175@01) zs7@65@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Set_in (inv_6_0<Ref> x@173@01 y@174@01 z@175@01) xs7@43@01)
    (and
      (Set_in (inv_6_1<Ref> x@173@01 y@174@01 z@175@01) ys7@54@01)
      (Set_in (inv_6_2<Ref> x@173@01 y@174@01 z@175@01) zs7@65@01)))
  (and
    (Set_in (inv_6_0<Ref> x@173@01 y@174@01 z@175@01) xs7@43@01)
    (Set_in (inv_6_1<Ref> x@173@01 y@174@01 z@175@01) ys7@54@01)
    (Set_in (inv_6_2<Ref> x@173@01 y@174@01 z@175@01) zs7@65@01)
    (=>
      (= (inv_6_0<Ref> x@173@01 y@174@01 z@175@01) x@173@01)
      (and
        (= (inv_6_0<Ref> x@173@01 y@174@01 z@175@01) x@173@01)
        (or
          (= (inv_6_1<Ref> x@173@01 y@174@01 z@175@01) y@174@01)
          (not (= (inv_6_1<Ref> x@173@01 y@174@01 z@175@01) y@174@01)))))
    (or
      (= (inv_6_0<Ref> x@173@01 y@174@01 z@175@01) x@173@01)
      (not (= (inv_6_0<Ref> x@173@01 y@174@01 z@175@01) x@173@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in (inv_6_0<Ref> x@173@01 y@174@01 z@175@01) xs7@43@01)
      (and
        (Set_in (inv_6_1<Ref> x@173@01 y@174@01 z@175@01) ys7@54@01)
        (Set_in (inv_6_2<Ref> x@173@01 y@174@01 z@175@01) zs7@65@01))))
  (and
    (Set_in (inv_6_0<Ref> x@173@01 y@174@01 z@175@01) xs7@43@01)
    (and
      (Set_in (inv_6_1<Ref> x@173@01 y@174@01 z@175@01) ys7@54@01)
      (Set_in (inv_6_2<Ref> x@173@01 y@174@01 z@175@01) zs7@65@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@173@01 $Ref) (y@174@01 $Ref) (z@175@01 $Ref)) (!
  (and
    (=>
      (Set_in (inv_6_0<Ref> x@173@01 y@174@01 z@175@01) xs7@43@01)
      (and
        (Set_in (inv_6_0<Ref> x@173@01 y@174@01 z@175@01) xs7@43@01)
        (or
          (Set_in (inv_6_1<Ref> x@173@01 y@174@01 z@175@01) ys7@54@01)
          (not (Set_in (inv_6_1<Ref> x@173@01 y@174@01 z@175@01) ys7@54@01)))))
    (or
      (Set_in (inv_6_0<Ref> x@173@01 y@174@01 z@175@01) xs7@43@01)
      (not (Set_in (inv_6_0<Ref> x@173@01 y@174@01 z@175@01) xs7@43@01)))
    (=>
      (and
        (Set_in (inv_6_0<Ref> x@173@01 y@174@01 z@175@01) xs7@43@01)
        (and
          (Set_in (inv_6_1<Ref> x@173@01 y@174@01 z@175@01) ys7@54@01)
          (Set_in (inv_6_2<Ref> x@173@01 y@174@01 z@175@01) zs7@65@01)))
      (and
        (Set_in (inv_6_0<Ref> x@173@01 y@174@01 z@175@01) xs7@43@01)
        (Set_in (inv_6_1<Ref> x@173@01 y@174@01 z@175@01) ys7@54@01)
        (Set_in (inv_6_2<Ref> x@173@01 y@174@01 z@175@01) zs7@65@01)
        (=>
          (= (inv_6_0<Ref> x@173@01 y@174@01 z@175@01) x@173@01)
          (and
            (= (inv_6_0<Ref> x@173@01 y@174@01 z@175@01) x@173@01)
            (or
              (= (inv_6_1<Ref> x@173@01 y@174@01 z@175@01) y@174@01)
              (not (= (inv_6_1<Ref> x@173@01 y@174@01 z@175@01) y@174@01)))))
        (or
          (= (inv_6_0<Ref> x@173@01 y@174@01 z@175@01) x@173@01)
          (not (= (inv_6_0<Ref> x@173@01 y@174@01 z@175@01) x@173@01)))))
    (or
      (not
        (and
          (Set_in (inv_6_0<Ref> x@173@01 y@174@01 z@175@01) xs7@43@01)
          (and
            (Set_in (inv_6_1<Ref> x@173@01 y@174@01 z@175@01) ys7@54@01)
            (Set_in (inv_6_2<Ref> x@173@01 y@174@01 z@175@01) zs7@65@01))))
      (and
        (Set_in (inv_6_0<Ref> x@173@01 y@174@01 z@175@01) xs7@43@01)
        (and
          (Set_in (inv_6_1<Ref> x@173@01 y@174@01 z@175@01) ys7@54@01)
          (Set_in (inv_6_2<Ref> x@173@01 y@174@01 z@175@01) zs7@65@01)))))
  :pattern ((inv_6_0<Ref> x@173@01 y@174@01 z@175@01) (inv_6_1<Ref> x@173@01 y@174@01 z@175@01) (inv_6_2<Ref> x@173@01 y@174@01 z@175@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@26@9@26@122-aux|)))
(assert (forall ((x@173@01 $Ref) (y@174@01 $Ref) (z@175@01 $Ref)) (!
  (=>
    (and
      (Set_in (inv_6_0<Ref> x@173@01 y@174@01 z@175@01) xs7@43@01)
      (and
        (Set_in (inv_6_1<Ref> x@173@01 y@174@01 z@175@01) ys7@54@01)
        (Set_in (inv_6_2<Ref> x@173@01 y@174@01 z@175@01) zs7@65@01)))
    (and
      (= (inv_6_0<Ref> x@173@01 y@174@01 z@175@01) x@173@01)
      (and
        (= (inv_6_1<Ref> x@173@01 y@174@01 z@175@01) y@174@01)
        (= (inv_6_2<Ref> x@173@01 y@174@01 z@175@01) z@175@01))))
  :pattern ((inv_6_0<Ref> x@173@01 y@174@01 z@175@01) (inv_6_1<Ref> x@173@01 y@174@01 z@175@01) (inv_6_2<Ref> x@173@01 y@174@01 z@175@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@26@9@26@122|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x: Ref, y: Ref, z: Ref ::
;     { inv_6_0(x, y, z), inv_6_1(x, y, z), inv_6_2(x, y, z) }
;     (inv_6_0(x, y, z) in xs7) &&
;     ((inv_6_1(x, y, z) in ys7) && (inv_6_2(x, y, z) in zs7)) ==>
;     perm(p(x, y, z)) >=
;     __iar__assume_helper_6((inv_0_0(x, y, z) in xs1) &&
;     ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) &&
;     (x == x && y == y && z == z), (inv_1_0(x, y, z) in xs2) &&
;     ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) &&
;     (x == x && y == y && z == z), (inv_2_0(x, y, z) in xs3) &&
;     ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) &&
;     (x == x && y == y && z == z), (inv_3_0(x, y, z) in xs4) &&
;     ((inv_3_1(x, y, z) in ys4) && (inv_3_2(x, y, z) in zs4)) &&
;     (x == x && y == y && z == z), (inv_4_0(x, y, z) in xs5) &&
;     ((inv_4_1(x, y, z) in ys5) && (inv_4_2(x, y, z) in zs5)) &&
;     (x == x && y == y && z == z), (inv_5_0(x, y, z) in xs6) &&
;     ((inv_5_1(x, y, z) in ys6) && (inv_5_2(x, y, z) in zs6)) &&
;     (x == x && y == y && z == z), q, q, q, q, q, q, q))
(declare-const $t@176@01 $Snap)
(assert (= $t@176@01 $Snap.unit))
; [eval] (forall x: Ref, y: Ref, z: Ref :: { inv_6_0(x, y, z), inv_6_1(x, y, z), inv_6_2(x, y, z) } (inv_6_0(x, y, z) in xs7) && ((inv_6_1(x, y, z) in ys7) && (inv_6_2(x, y, z) in zs7)) ==> perm(p(x, y, z)) >= __iar__assume_helper_6((inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) && (x == x && y == y && z == z), (inv_1_0(x, y, z) in xs2) && ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) && (x == x && y == y && z == z), (inv_2_0(x, y, z) in xs3) && ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) && (x == x && y == y && z == z), (inv_3_0(x, y, z) in xs4) && ((inv_3_1(x, y, z) in ys4) && (inv_3_2(x, y, z) in zs4)) && (x == x && y == y && z == z), (inv_4_0(x, y, z) in xs5) && ((inv_4_1(x, y, z) in ys5) && (inv_4_2(x, y, z) in zs5)) && (x == x && y == y && z == z), (inv_5_0(x, y, z) in xs6) && ((inv_5_1(x, y, z) in ys6) && (inv_5_2(x, y, z) in zs6)) && (x == x && y == y && z == z), q, q, q, q, q, q, q))
(declare-const x@177@01 $Ref)
(declare-const y@178@01 $Ref)
(declare-const z@179@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (inv_6_0(x, y, z) in xs7) && ((inv_6_1(x, y, z) in ys7) && (inv_6_2(x, y, z) in zs7)) ==> perm(p(x, y, z)) >= __iar__assume_helper_6((inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) && (x == x && y == y && z == z), (inv_1_0(x, y, z) in xs2) && ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) && (x == x && y == y && z == z), (inv_2_0(x, y, z) in xs3) && ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) && (x == x && y == y && z == z), (inv_3_0(x, y, z) in xs4) && ((inv_3_1(x, y, z) in ys4) && (inv_3_2(x, y, z) in zs4)) && (x == x && y == y && z == z), (inv_4_0(x, y, z) in xs5) && ((inv_4_1(x, y, z) in ys5) && (inv_4_2(x, y, z) in zs5)) && (x == x && y == y && z == z), (inv_5_0(x, y, z) in xs6) && ((inv_5_1(x, y, z) in ys6) && (inv_5_2(x, y, z) in zs6)) && (x == x && y == y && z == z), q, q, q, q, q, q, q)
; [eval] (inv_6_0(x, y, z) in xs7) && ((inv_6_1(x, y, z) in ys7) && (inv_6_2(x, y, z) in zs7))
; [eval] (inv_6_0(x, y, z) in xs7)
; [eval] inv_6_0(x, y, z)
(push) ; 4
; [then-branch: 165 | !(inv_6_0[Ref](x@177@01, y@178@01, z@179@01) in xs7@43@01) | live]
; [else-branch: 165 | inv_6_0[Ref](x@177@01, y@178@01, z@179@01) in xs7@43@01 | live]
(push) ; 5
; [then-branch: 165 | !(inv_6_0[Ref](x@177@01, y@178@01, z@179@01) in xs7@43@01)]
(assert (not (Set_in (inv_6_0<Ref> x@177@01 y@178@01 z@179@01) xs7@43@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 165 | inv_6_0[Ref](x@177@01, y@178@01, z@179@01) in xs7@43@01]
(assert (Set_in (inv_6_0<Ref> x@177@01 y@178@01 z@179@01) xs7@43@01))
; [eval] (inv_6_1(x, y, z) in ys7)
; [eval] inv_6_1(x, y, z)
(push) ; 6
; [then-branch: 166 | !(inv_6_1[Ref](x@177@01, y@178@01, z@179@01) in ys7@54@01) | live]
; [else-branch: 166 | inv_6_1[Ref](x@177@01, y@178@01, z@179@01) in ys7@54@01 | live]
(push) ; 7
; [then-branch: 166 | !(inv_6_1[Ref](x@177@01, y@178@01, z@179@01) in ys7@54@01)]
(assert (not (Set_in (inv_6_1<Ref> x@177@01 y@178@01 z@179@01) ys7@54@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 166 | inv_6_1[Ref](x@177@01, y@178@01, z@179@01) in ys7@54@01]
(assert (Set_in (inv_6_1<Ref> x@177@01 y@178@01 z@179@01) ys7@54@01))
; [eval] (inv_6_2(x, y, z) in zs7)
; [eval] inv_6_2(x, y, z)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_6_1<Ref> x@177@01 y@178@01 z@179@01) ys7@54@01)
  (not (Set_in (inv_6_1<Ref> x@177@01 y@178@01 z@179@01) ys7@54@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_6_0<Ref> x@177@01 y@178@01 z@179@01) xs7@43@01)
  (and
    (Set_in (inv_6_0<Ref> x@177@01 y@178@01 z@179@01) xs7@43@01)
    (or
      (Set_in (inv_6_1<Ref> x@177@01 y@178@01 z@179@01) ys7@54@01)
      (not (Set_in (inv_6_1<Ref> x@177@01 y@178@01 z@179@01) ys7@54@01))))))
(assert (or
  (Set_in (inv_6_0<Ref> x@177@01 y@178@01 z@179@01) xs7@43@01)
  (not (Set_in (inv_6_0<Ref> x@177@01 y@178@01 z@179@01) xs7@43@01))))
(push) ; 4
; [then-branch: 167 | inv_6_0[Ref](x@177@01, y@178@01, z@179@01) in xs7@43@01 && inv_6_1[Ref](x@177@01, y@178@01, z@179@01) in ys7@54@01 && inv_6_2[Ref](x@177@01, y@178@01, z@179@01) in zs7@65@01 | live]
; [else-branch: 167 | !(inv_6_0[Ref](x@177@01, y@178@01, z@179@01) in xs7@43@01 && inv_6_1[Ref](x@177@01, y@178@01, z@179@01) in ys7@54@01 && inv_6_2[Ref](x@177@01, y@178@01, z@179@01) in zs7@65@01) | live]
(push) ; 5
; [then-branch: 167 | inv_6_0[Ref](x@177@01, y@178@01, z@179@01) in xs7@43@01 && inv_6_1[Ref](x@177@01, y@178@01, z@179@01) in ys7@54@01 && inv_6_2[Ref](x@177@01, y@178@01, z@179@01) in zs7@65@01]
(assert (and
  (Set_in (inv_6_0<Ref> x@177@01 y@178@01 z@179@01) xs7@43@01)
  (and
    (Set_in (inv_6_1<Ref> x@177@01 y@178@01 z@179@01) ys7@54@01)
    (Set_in (inv_6_2<Ref> x@177@01 y@178@01 z@179@01) zs7@65@01))))
; [eval] perm(p(x, y, z)) >= __iar__assume_helper_6((inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) && (x == x && y == y && z == z), (inv_1_0(x, y, z) in xs2) && ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) && (x == x && y == y && z == z), (inv_2_0(x, y, z) in xs3) && ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) && (x == x && y == y && z == z), (inv_3_0(x, y, z) in xs4) && ((inv_3_1(x, y, z) in ys4) && (inv_3_2(x, y, z) in zs4)) && (x == x && y == y && z == z), (inv_4_0(x, y, z) in xs5) && ((inv_4_1(x, y, z) in ys5) && (inv_4_2(x, y, z) in zs5)) && (x == x && y == y && z == z), (inv_5_0(x, y, z) in xs6) && ((inv_5_1(x, y, z) in ys6) && (inv_5_2(x, y, z) in zs6)) && (x == x && y == y && z == z), q, q, q, q, q, q, q)
; [eval] perm(p(x, y, z))
; Definitional axioms for snapshot map values
(declare-const pm@180@01 $PPM)
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (=
    ($PSF.perm_p (as pm@180@01  $PPM) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    (ite
      (and
        (and (img@83@01 x y z) (img@85@01 x y z) (img@87@01 x y z))
        (and
          (Set_in (inv@82@01 x y z) xs@70@01)
          (and
            (Set_in (inv@84@01 x y z) ys@71@01)
            (Set_in (inv@86@01 x y z) zs@72@01))))
      q@73@01
      $Perm.No))
  :pattern (($PSF.perm_p (as pm@180@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resPrmSumDef14|)))
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (and
    ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    ($PSF.loc_p ($PSF.lookup_p $t@81@01 ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))))
  :pattern (($PSF.perm_p (as pm@180@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resTrgDef15|)))
(assert ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x@177@01)
    ($SortWrappers.$RefTo$Snap y@178@01))
  ($SortWrappers.$RefTo$Snap z@179@01))) ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x@177@01)
    ($SortWrappers.$RefTo$Snap y@178@01))
  ($SortWrappers.$RefTo$Snap z@179@01))))
; [eval] __iar__assume_helper_6((inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) && (x == x && y == y && z == z), (inv_1_0(x, y, z) in xs2) && ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) && (x == x && y == y && z == z), (inv_2_0(x, y, z) in xs3) && ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) && (x == x && y == y && z == z), (inv_3_0(x, y, z) in xs4) && ((inv_3_1(x, y, z) in ys4) && (inv_3_2(x, y, z) in zs4)) && (x == x && y == y && z == z), (inv_4_0(x, y, z) in xs5) && ((inv_4_1(x, y, z) in ys5) && (inv_4_2(x, y, z) in zs5)) && (x == x && y == y && z == z), (inv_5_0(x, y, z) in xs6) && ((inv_5_1(x, y, z) in ys6) && (inv_5_2(x, y, z) in zs6)) && (x == x && y == y && z == z), q, q, q, q, q, q, q)
; [eval] (inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) && (x == x && y == y && z == z)
; [eval] (inv_0_0(x, y, z) in xs1)
; [eval] inv_0_0(x, y, z)
(push) ; 6
; [then-branch: 168 | !(inv_0_0[Ref](x@177@01, y@178@01, z@179@01) in xs1@37@01) | live]
; [else-branch: 168 | inv_0_0[Ref](x@177@01, y@178@01, z@179@01) in xs1@37@01 | live]
(push) ; 7
; [then-branch: 168 | !(inv_0_0[Ref](x@177@01, y@178@01, z@179@01) in xs1@37@01)]
(assert (not (Set_in (inv_0_0<Ref> x@177@01 y@178@01 z@179@01) xs1@37@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 168 | inv_0_0[Ref](x@177@01, y@178@01, z@179@01) in xs1@37@01]
(assert (Set_in (inv_0_0<Ref> x@177@01 y@178@01 z@179@01) xs1@37@01))
; [eval] (inv_0_1(x, y, z) in ys1)
; [eval] inv_0_1(x, y, z)
(push) ; 8
; [then-branch: 169 | !(inv_0_1[Ref](x@177@01, y@178@01, z@179@01) in ys1@48@01) | live]
; [else-branch: 169 | inv_0_1[Ref](x@177@01, y@178@01, z@179@01) in ys1@48@01 | live]
(push) ; 9
; [then-branch: 169 | !(inv_0_1[Ref](x@177@01, y@178@01, z@179@01) in ys1@48@01)]
(assert (not (Set_in (inv_0_1<Ref> x@177@01 y@178@01 z@179@01) ys1@48@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 169 | inv_0_1[Ref](x@177@01, y@178@01, z@179@01) in ys1@48@01]
(assert (Set_in (inv_0_1<Ref> x@177@01 y@178@01 z@179@01) ys1@48@01))
; [eval] (inv_0_2(x, y, z) in zs1)
; [eval] inv_0_2(x, y, z)
(push) ; 10
; [then-branch: 170 | !(inv_0_2[Ref](x@177@01, y@178@01, z@179@01) in zs1@59@01) | live]
; [else-branch: 170 | inv_0_2[Ref](x@177@01, y@178@01, z@179@01) in zs1@59@01 | live]
(push) ; 11
; [then-branch: 170 | !(inv_0_2[Ref](x@177@01, y@178@01, z@179@01) in zs1@59@01)]
(assert (not (Set_in (inv_0_2<Ref> x@177@01 y@178@01 z@179@01) zs1@59@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 170 | inv_0_2[Ref](x@177@01, y@178@01, z@179@01) in zs1@59@01]
(assert (Set_in (inv_0_2<Ref> x@177@01 y@178@01 z@179@01) zs1@59@01))
; [eval] x == x
(push) ; 12
; [then-branch: 171 | False | live]
; [else-branch: 171 | True | live]
(push) ; 13
; [then-branch: 171 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 171 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 172 | False | live]
; [else-branch: 172 | True | live]
(push) ; 15
; [then-branch: 172 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 172 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_0_2<Ref> x@177@01 y@178@01 z@179@01) zs1@59@01)
  (not (Set_in (inv_0_2<Ref> x@177@01 y@178@01 z@179@01) zs1@59@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_0_1<Ref> x@177@01 y@178@01 z@179@01) ys1@48@01)
  (and
    (Set_in (inv_0_1<Ref> x@177@01 y@178@01 z@179@01) ys1@48@01)
    (or
      (Set_in (inv_0_2<Ref> x@177@01 y@178@01 z@179@01) zs1@59@01)
      (not (Set_in (inv_0_2<Ref> x@177@01 y@178@01 z@179@01) zs1@59@01))))))
(assert (or
  (Set_in (inv_0_1<Ref> x@177@01 y@178@01 z@179@01) ys1@48@01)
  (not (Set_in (inv_0_1<Ref> x@177@01 y@178@01 z@179@01) ys1@48@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_0_0<Ref> x@177@01 y@178@01 z@179@01) xs1@37@01)
  (and
    (Set_in (inv_0_0<Ref> x@177@01 y@178@01 z@179@01) xs1@37@01)
    (=>
      (Set_in (inv_0_1<Ref> x@177@01 y@178@01 z@179@01) ys1@48@01)
      (and
        (Set_in (inv_0_1<Ref> x@177@01 y@178@01 z@179@01) ys1@48@01)
        (or
          (Set_in (inv_0_2<Ref> x@177@01 y@178@01 z@179@01) zs1@59@01)
          (not (Set_in (inv_0_2<Ref> x@177@01 y@178@01 z@179@01) zs1@59@01)))))
    (or
      (Set_in (inv_0_1<Ref> x@177@01 y@178@01 z@179@01) ys1@48@01)
      (not (Set_in (inv_0_1<Ref> x@177@01 y@178@01 z@179@01) ys1@48@01))))))
(assert (or
  (Set_in (inv_0_0<Ref> x@177@01 y@178@01 z@179@01) xs1@37@01)
  (not (Set_in (inv_0_0<Ref> x@177@01 y@178@01 z@179@01) xs1@37@01))))
; [eval] (inv_1_0(x, y, z) in xs2) && ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) && (x == x && y == y && z == z)
; [eval] (inv_1_0(x, y, z) in xs2)
; [eval] inv_1_0(x, y, z)
(push) ; 6
; [then-branch: 173 | !(inv_1_0[Ref](x@177@01, y@178@01, z@179@01) in xs2@38@01) | live]
; [else-branch: 173 | inv_1_0[Ref](x@177@01, y@178@01, z@179@01) in xs2@38@01 | live]
(push) ; 7
; [then-branch: 173 | !(inv_1_0[Ref](x@177@01, y@178@01, z@179@01) in xs2@38@01)]
(assert (not (Set_in (inv_1_0<Ref> x@177@01 y@178@01 z@179@01) xs2@38@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 173 | inv_1_0[Ref](x@177@01, y@178@01, z@179@01) in xs2@38@01]
(assert (Set_in (inv_1_0<Ref> x@177@01 y@178@01 z@179@01) xs2@38@01))
; [eval] (inv_1_1(x, y, z) in ys2)
; [eval] inv_1_1(x, y, z)
(push) ; 8
; [then-branch: 174 | !(inv_1_1[Ref](x@177@01, y@178@01, z@179@01) in ys2@49@01) | live]
; [else-branch: 174 | inv_1_1[Ref](x@177@01, y@178@01, z@179@01) in ys2@49@01 | live]
(push) ; 9
; [then-branch: 174 | !(inv_1_1[Ref](x@177@01, y@178@01, z@179@01) in ys2@49@01)]
(assert (not (Set_in (inv_1_1<Ref> x@177@01 y@178@01 z@179@01) ys2@49@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 174 | inv_1_1[Ref](x@177@01, y@178@01, z@179@01) in ys2@49@01]
(assert (Set_in (inv_1_1<Ref> x@177@01 y@178@01 z@179@01) ys2@49@01))
; [eval] (inv_1_2(x, y, z) in zs2)
; [eval] inv_1_2(x, y, z)
(push) ; 10
; [then-branch: 175 | !(inv_1_2[Ref](x@177@01, y@178@01, z@179@01) in zs2@60@01) | live]
; [else-branch: 175 | inv_1_2[Ref](x@177@01, y@178@01, z@179@01) in zs2@60@01 | live]
(push) ; 11
; [then-branch: 175 | !(inv_1_2[Ref](x@177@01, y@178@01, z@179@01) in zs2@60@01)]
(assert (not (Set_in (inv_1_2<Ref> x@177@01 y@178@01 z@179@01) zs2@60@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 175 | inv_1_2[Ref](x@177@01, y@178@01, z@179@01) in zs2@60@01]
(assert (Set_in (inv_1_2<Ref> x@177@01 y@178@01 z@179@01) zs2@60@01))
; [eval] x == x
(push) ; 12
; [then-branch: 176 | False | live]
; [else-branch: 176 | True | live]
(push) ; 13
; [then-branch: 176 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 176 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 177 | False | live]
; [else-branch: 177 | True | live]
(push) ; 15
; [then-branch: 177 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 177 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_1_2<Ref> x@177@01 y@178@01 z@179@01) zs2@60@01)
  (not (Set_in (inv_1_2<Ref> x@177@01 y@178@01 z@179@01) zs2@60@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_1_1<Ref> x@177@01 y@178@01 z@179@01) ys2@49@01)
  (and
    (Set_in (inv_1_1<Ref> x@177@01 y@178@01 z@179@01) ys2@49@01)
    (or
      (Set_in (inv_1_2<Ref> x@177@01 y@178@01 z@179@01) zs2@60@01)
      (not (Set_in (inv_1_2<Ref> x@177@01 y@178@01 z@179@01) zs2@60@01))))))
(assert (or
  (Set_in (inv_1_1<Ref> x@177@01 y@178@01 z@179@01) ys2@49@01)
  (not (Set_in (inv_1_1<Ref> x@177@01 y@178@01 z@179@01) ys2@49@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_1_0<Ref> x@177@01 y@178@01 z@179@01) xs2@38@01)
  (and
    (Set_in (inv_1_0<Ref> x@177@01 y@178@01 z@179@01) xs2@38@01)
    (=>
      (Set_in (inv_1_1<Ref> x@177@01 y@178@01 z@179@01) ys2@49@01)
      (and
        (Set_in (inv_1_1<Ref> x@177@01 y@178@01 z@179@01) ys2@49@01)
        (or
          (Set_in (inv_1_2<Ref> x@177@01 y@178@01 z@179@01) zs2@60@01)
          (not (Set_in (inv_1_2<Ref> x@177@01 y@178@01 z@179@01) zs2@60@01)))))
    (or
      (Set_in (inv_1_1<Ref> x@177@01 y@178@01 z@179@01) ys2@49@01)
      (not (Set_in (inv_1_1<Ref> x@177@01 y@178@01 z@179@01) ys2@49@01))))))
(assert (or
  (Set_in (inv_1_0<Ref> x@177@01 y@178@01 z@179@01) xs2@38@01)
  (not (Set_in (inv_1_0<Ref> x@177@01 y@178@01 z@179@01) xs2@38@01))))
; [eval] (inv_2_0(x, y, z) in xs3) && ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) && (x == x && y == y && z == z)
; [eval] (inv_2_0(x, y, z) in xs3)
; [eval] inv_2_0(x, y, z)
(push) ; 6
; [then-branch: 178 | !(inv_2_0[Ref](x@177@01, y@178@01, z@179@01) in xs3@39@01) | live]
; [else-branch: 178 | inv_2_0[Ref](x@177@01, y@178@01, z@179@01) in xs3@39@01 | live]
(push) ; 7
; [then-branch: 178 | !(inv_2_0[Ref](x@177@01, y@178@01, z@179@01) in xs3@39@01)]
(assert (not (Set_in (inv_2_0<Ref> x@177@01 y@178@01 z@179@01) xs3@39@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 178 | inv_2_0[Ref](x@177@01, y@178@01, z@179@01) in xs3@39@01]
(assert (Set_in (inv_2_0<Ref> x@177@01 y@178@01 z@179@01) xs3@39@01))
; [eval] (inv_2_1(x, y, z) in ys3)
; [eval] inv_2_1(x, y, z)
(push) ; 8
; [then-branch: 179 | !(inv_2_1[Ref](x@177@01, y@178@01, z@179@01) in ys3@50@01) | live]
; [else-branch: 179 | inv_2_1[Ref](x@177@01, y@178@01, z@179@01) in ys3@50@01 | live]
(push) ; 9
; [then-branch: 179 | !(inv_2_1[Ref](x@177@01, y@178@01, z@179@01) in ys3@50@01)]
(assert (not (Set_in (inv_2_1<Ref> x@177@01 y@178@01 z@179@01) ys3@50@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 179 | inv_2_1[Ref](x@177@01, y@178@01, z@179@01) in ys3@50@01]
(assert (Set_in (inv_2_1<Ref> x@177@01 y@178@01 z@179@01) ys3@50@01))
; [eval] (inv_2_2(x, y, z) in zs3)
; [eval] inv_2_2(x, y, z)
(push) ; 10
; [then-branch: 180 | !(inv_2_2[Ref](x@177@01, y@178@01, z@179@01) in zs3@61@01) | live]
; [else-branch: 180 | inv_2_2[Ref](x@177@01, y@178@01, z@179@01) in zs3@61@01 | live]
(push) ; 11
; [then-branch: 180 | !(inv_2_2[Ref](x@177@01, y@178@01, z@179@01) in zs3@61@01)]
(assert (not (Set_in (inv_2_2<Ref> x@177@01 y@178@01 z@179@01) zs3@61@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 180 | inv_2_2[Ref](x@177@01, y@178@01, z@179@01) in zs3@61@01]
(assert (Set_in (inv_2_2<Ref> x@177@01 y@178@01 z@179@01) zs3@61@01))
; [eval] x == x
(push) ; 12
; [then-branch: 181 | False | live]
; [else-branch: 181 | True | live]
(push) ; 13
; [then-branch: 181 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 181 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 182 | False | live]
; [else-branch: 182 | True | live]
(push) ; 15
; [then-branch: 182 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 182 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_2_2<Ref> x@177@01 y@178@01 z@179@01) zs3@61@01)
  (not (Set_in (inv_2_2<Ref> x@177@01 y@178@01 z@179@01) zs3@61@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_2_1<Ref> x@177@01 y@178@01 z@179@01) ys3@50@01)
  (and
    (Set_in (inv_2_1<Ref> x@177@01 y@178@01 z@179@01) ys3@50@01)
    (or
      (Set_in (inv_2_2<Ref> x@177@01 y@178@01 z@179@01) zs3@61@01)
      (not (Set_in (inv_2_2<Ref> x@177@01 y@178@01 z@179@01) zs3@61@01))))))
(assert (or
  (Set_in (inv_2_1<Ref> x@177@01 y@178@01 z@179@01) ys3@50@01)
  (not (Set_in (inv_2_1<Ref> x@177@01 y@178@01 z@179@01) ys3@50@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_2_0<Ref> x@177@01 y@178@01 z@179@01) xs3@39@01)
  (and
    (Set_in (inv_2_0<Ref> x@177@01 y@178@01 z@179@01) xs3@39@01)
    (=>
      (Set_in (inv_2_1<Ref> x@177@01 y@178@01 z@179@01) ys3@50@01)
      (and
        (Set_in (inv_2_1<Ref> x@177@01 y@178@01 z@179@01) ys3@50@01)
        (or
          (Set_in (inv_2_2<Ref> x@177@01 y@178@01 z@179@01) zs3@61@01)
          (not (Set_in (inv_2_2<Ref> x@177@01 y@178@01 z@179@01) zs3@61@01)))))
    (or
      (Set_in (inv_2_1<Ref> x@177@01 y@178@01 z@179@01) ys3@50@01)
      (not (Set_in (inv_2_1<Ref> x@177@01 y@178@01 z@179@01) ys3@50@01))))))
(assert (or
  (Set_in (inv_2_0<Ref> x@177@01 y@178@01 z@179@01) xs3@39@01)
  (not (Set_in (inv_2_0<Ref> x@177@01 y@178@01 z@179@01) xs3@39@01))))
; [eval] (inv_3_0(x, y, z) in xs4) && ((inv_3_1(x, y, z) in ys4) && (inv_3_2(x, y, z) in zs4)) && (x == x && y == y && z == z)
; [eval] (inv_3_0(x, y, z) in xs4)
; [eval] inv_3_0(x, y, z)
(push) ; 6
; [then-branch: 183 | !(inv_3_0[Ref](x@177@01, y@178@01, z@179@01) in xs4@40@01) | live]
; [else-branch: 183 | inv_3_0[Ref](x@177@01, y@178@01, z@179@01) in xs4@40@01 | live]
(push) ; 7
; [then-branch: 183 | !(inv_3_0[Ref](x@177@01, y@178@01, z@179@01) in xs4@40@01)]
(assert (not (Set_in (inv_3_0<Ref> x@177@01 y@178@01 z@179@01) xs4@40@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 183 | inv_3_0[Ref](x@177@01, y@178@01, z@179@01) in xs4@40@01]
(assert (Set_in (inv_3_0<Ref> x@177@01 y@178@01 z@179@01) xs4@40@01))
; [eval] (inv_3_1(x, y, z) in ys4)
; [eval] inv_3_1(x, y, z)
(push) ; 8
; [then-branch: 184 | !(inv_3_1[Ref](x@177@01, y@178@01, z@179@01) in ys4@51@01) | live]
; [else-branch: 184 | inv_3_1[Ref](x@177@01, y@178@01, z@179@01) in ys4@51@01 | live]
(push) ; 9
; [then-branch: 184 | !(inv_3_1[Ref](x@177@01, y@178@01, z@179@01) in ys4@51@01)]
(assert (not (Set_in (inv_3_1<Ref> x@177@01 y@178@01 z@179@01) ys4@51@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 184 | inv_3_1[Ref](x@177@01, y@178@01, z@179@01) in ys4@51@01]
(assert (Set_in (inv_3_1<Ref> x@177@01 y@178@01 z@179@01) ys4@51@01))
; [eval] (inv_3_2(x, y, z) in zs4)
; [eval] inv_3_2(x, y, z)
(push) ; 10
; [then-branch: 185 | !(inv_3_2[Ref](x@177@01, y@178@01, z@179@01) in zs4@62@01) | live]
; [else-branch: 185 | inv_3_2[Ref](x@177@01, y@178@01, z@179@01) in zs4@62@01 | live]
(push) ; 11
; [then-branch: 185 | !(inv_3_2[Ref](x@177@01, y@178@01, z@179@01) in zs4@62@01)]
(assert (not (Set_in (inv_3_2<Ref> x@177@01 y@178@01 z@179@01) zs4@62@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 185 | inv_3_2[Ref](x@177@01, y@178@01, z@179@01) in zs4@62@01]
(assert (Set_in (inv_3_2<Ref> x@177@01 y@178@01 z@179@01) zs4@62@01))
; [eval] x == x
(push) ; 12
; [then-branch: 186 | False | live]
; [else-branch: 186 | True | live]
(push) ; 13
; [then-branch: 186 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 186 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 187 | False | live]
; [else-branch: 187 | True | live]
(push) ; 15
; [then-branch: 187 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 187 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_3_2<Ref> x@177@01 y@178@01 z@179@01) zs4@62@01)
  (not (Set_in (inv_3_2<Ref> x@177@01 y@178@01 z@179@01) zs4@62@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_3_1<Ref> x@177@01 y@178@01 z@179@01) ys4@51@01)
  (and
    (Set_in (inv_3_1<Ref> x@177@01 y@178@01 z@179@01) ys4@51@01)
    (or
      (Set_in (inv_3_2<Ref> x@177@01 y@178@01 z@179@01) zs4@62@01)
      (not (Set_in (inv_3_2<Ref> x@177@01 y@178@01 z@179@01) zs4@62@01))))))
(assert (or
  (Set_in (inv_3_1<Ref> x@177@01 y@178@01 z@179@01) ys4@51@01)
  (not (Set_in (inv_3_1<Ref> x@177@01 y@178@01 z@179@01) ys4@51@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_3_0<Ref> x@177@01 y@178@01 z@179@01) xs4@40@01)
  (and
    (Set_in (inv_3_0<Ref> x@177@01 y@178@01 z@179@01) xs4@40@01)
    (=>
      (Set_in (inv_3_1<Ref> x@177@01 y@178@01 z@179@01) ys4@51@01)
      (and
        (Set_in (inv_3_1<Ref> x@177@01 y@178@01 z@179@01) ys4@51@01)
        (or
          (Set_in (inv_3_2<Ref> x@177@01 y@178@01 z@179@01) zs4@62@01)
          (not (Set_in (inv_3_2<Ref> x@177@01 y@178@01 z@179@01) zs4@62@01)))))
    (or
      (Set_in (inv_3_1<Ref> x@177@01 y@178@01 z@179@01) ys4@51@01)
      (not (Set_in (inv_3_1<Ref> x@177@01 y@178@01 z@179@01) ys4@51@01))))))
(assert (or
  (Set_in (inv_3_0<Ref> x@177@01 y@178@01 z@179@01) xs4@40@01)
  (not (Set_in (inv_3_0<Ref> x@177@01 y@178@01 z@179@01) xs4@40@01))))
; [eval] (inv_4_0(x, y, z) in xs5) && ((inv_4_1(x, y, z) in ys5) && (inv_4_2(x, y, z) in zs5)) && (x == x && y == y && z == z)
; [eval] (inv_4_0(x, y, z) in xs5)
; [eval] inv_4_0(x, y, z)
(push) ; 6
; [then-branch: 188 | !(inv_4_0[Ref](x@177@01, y@178@01, z@179@01) in xs5@41@01) | live]
; [else-branch: 188 | inv_4_0[Ref](x@177@01, y@178@01, z@179@01) in xs5@41@01 | live]
(push) ; 7
; [then-branch: 188 | !(inv_4_0[Ref](x@177@01, y@178@01, z@179@01) in xs5@41@01)]
(assert (not (Set_in (inv_4_0<Ref> x@177@01 y@178@01 z@179@01) xs5@41@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 188 | inv_4_0[Ref](x@177@01, y@178@01, z@179@01) in xs5@41@01]
(assert (Set_in (inv_4_0<Ref> x@177@01 y@178@01 z@179@01) xs5@41@01))
; [eval] (inv_4_1(x, y, z) in ys5)
; [eval] inv_4_1(x, y, z)
(push) ; 8
; [then-branch: 189 | !(inv_4_1[Ref](x@177@01, y@178@01, z@179@01) in ys5@52@01) | live]
; [else-branch: 189 | inv_4_1[Ref](x@177@01, y@178@01, z@179@01) in ys5@52@01 | live]
(push) ; 9
; [then-branch: 189 | !(inv_4_1[Ref](x@177@01, y@178@01, z@179@01) in ys5@52@01)]
(assert (not (Set_in (inv_4_1<Ref> x@177@01 y@178@01 z@179@01) ys5@52@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 189 | inv_4_1[Ref](x@177@01, y@178@01, z@179@01) in ys5@52@01]
(assert (Set_in (inv_4_1<Ref> x@177@01 y@178@01 z@179@01) ys5@52@01))
; [eval] (inv_4_2(x, y, z) in zs5)
; [eval] inv_4_2(x, y, z)
(push) ; 10
; [then-branch: 190 | !(inv_4_2[Ref](x@177@01, y@178@01, z@179@01) in zs5@63@01) | live]
; [else-branch: 190 | inv_4_2[Ref](x@177@01, y@178@01, z@179@01) in zs5@63@01 | live]
(push) ; 11
; [then-branch: 190 | !(inv_4_2[Ref](x@177@01, y@178@01, z@179@01) in zs5@63@01)]
(assert (not (Set_in (inv_4_2<Ref> x@177@01 y@178@01 z@179@01) zs5@63@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 190 | inv_4_2[Ref](x@177@01, y@178@01, z@179@01) in zs5@63@01]
(assert (Set_in (inv_4_2<Ref> x@177@01 y@178@01 z@179@01) zs5@63@01))
; [eval] x == x
(push) ; 12
; [then-branch: 191 | False | live]
; [else-branch: 191 | True | live]
(push) ; 13
; [then-branch: 191 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 191 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 192 | False | live]
; [else-branch: 192 | True | live]
(push) ; 15
; [then-branch: 192 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 192 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_4_2<Ref> x@177@01 y@178@01 z@179@01) zs5@63@01)
  (not (Set_in (inv_4_2<Ref> x@177@01 y@178@01 z@179@01) zs5@63@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_4_1<Ref> x@177@01 y@178@01 z@179@01) ys5@52@01)
  (and
    (Set_in (inv_4_1<Ref> x@177@01 y@178@01 z@179@01) ys5@52@01)
    (or
      (Set_in (inv_4_2<Ref> x@177@01 y@178@01 z@179@01) zs5@63@01)
      (not (Set_in (inv_4_2<Ref> x@177@01 y@178@01 z@179@01) zs5@63@01))))))
(assert (or
  (Set_in (inv_4_1<Ref> x@177@01 y@178@01 z@179@01) ys5@52@01)
  (not (Set_in (inv_4_1<Ref> x@177@01 y@178@01 z@179@01) ys5@52@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_4_0<Ref> x@177@01 y@178@01 z@179@01) xs5@41@01)
  (and
    (Set_in (inv_4_0<Ref> x@177@01 y@178@01 z@179@01) xs5@41@01)
    (=>
      (Set_in (inv_4_1<Ref> x@177@01 y@178@01 z@179@01) ys5@52@01)
      (and
        (Set_in (inv_4_1<Ref> x@177@01 y@178@01 z@179@01) ys5@52@01)
        (or
          (Set_in (inv_4_2<Ref> x@177@01 y@178@01 z@179@01) zs5@63@01)
          (not (Set_in (inv_4_2<Ref> x@177@01 y@178@01 z@179@01) zs5@63@01)))))
    (or
      (Set_in (inv_4_1<Ref> x@177@01 y@178@01 z@179@01) ys5@52@01)
      (not (Set_in (inv_4_1<Ref> x@177@01 y@178@01 z@179@01) ys5@52@01))))))
(assert (or
  (Set_in (inv_4_0<Ref> x@177@01 y@178@01 z@179@01) xs5@41@01)
  (not (Set_in (inv_4_0<Ref> x@177@01 y@178@01 z@179@01) xs5@41@01))))
; [eval] (inv_5_0(x, y, z) in xs6) && ((inv_5_1(x, y, z) in ys6) && (inv_5_2(x, y, z) in zs6)) && (x == x && y == y && z == z)
; [eval] (inv_5_0(x, y, z) in xs6)
; [eval] inv_5_0(x, y, z)
(push) ; 6
; [then-branch: 193 | !(inv_5_0[Ref](x@177@01, y@178@01, z@179@01) in xs6@42@01) | live]
; [else-branch: 193 | inv_5_0[Ref](x@177@01, y@178@01, z@179@01) in xs6@42@01 | live]
(push) ; 7
; [then-branch: 193 | !(inv_5_0[Ref](x@177@01, y@178@01, z@179@01) in xs6@42@01)]
(assert (not (Set_in (inv_5_0<Ref> x@177@01 y@178@01 z@179@01) xs6@42@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 193 | inv_5_0[Ref](x@177@01, y@178@01, z@179@01) in xs6@42@01]
(assert (Set_in (inv_5_0<Ref> x@177@01 y@178@01 z@179@01) xs6@42@01))
; [eval] (inv_5_1(x, y, z) in ys6)
; [eval] inv_5_1(x, y, z)
(push) ; 8
; [then-branch: 194 | !(inv_5_1[Ref](x@177@01, y@178@01, z@179@01) in ys6@53@01) | live]
; [else-branch: 194 | inv_5_1[Ref](x@177@01, y@178@01, z@179@01) in ys6@53@01 | live]
(push) ; 9
; [then-branch: 194 | !(inv_5_1[Ref](x@177@01, y@178@01, z@179@01) in ys6@53@01)]
(assert (not (Set_in (inv_5_1<Ref> x@177@01 y@178@01 z@179@01) ys6@53@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 194 | inv_5_1[Ref](x@177@01, y@178@01, z@179@01) in ys6@53@01]
(assert (Set_in (inv_5_1<Ref> x@177@01 y@178@01 z@179@01) ys6@53@01))
; [eval] (inv_5_2(x, y, z) in zs6)
; [eval] inv_5_2(x, y, z)
(push) ; 10
; [then-branch: 195 | !(inv_5_2[Ref](x@177@01, y@178@01, z@179@01) in zs6@64@01) | live]
; [else-branch: 195 | inv_5_2[Ref](x@177@01, y@178@01, z@179@01) in zs6@64@01 | live]
(push) ; 11
; [then-branch: 195 | !(inv_5_2[Ref](x@177@01, y@178@01, z@179@01) in zs6@64@01)]
(assert (not (Set_in (inv_5_2<Ref> x@177@01 y@178@01 z@179@01) zs6@64@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 195 | inv_5_2[Ref](x@177@01, y@178@01, z@179@01) in zs6@64@01]
(assert (Set_in (inv_5_2<Ref> x@177@01 y@178@01 z@179@01) zs6@64@01))
; [eval] x == x
(push) ; 12
; [then-branch: 196 | False | live]
; [else-branch: 196 | True | live]
(push) ; 13
; [then-branch: 196 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 196 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 197 | False | live]
; [else-branch: 197 | True | live]
(push) ; 15
; [then-branch: 197 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 197 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_5_2<Ref> x@177@01 y@178@01 z@179@01) zs6@64@01)
  (not (Set_in (inv_5_2<Ref> x@177@01 y@178@01 z@179@01) zs6@64@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_5_1<Ref> x@177@01 y@178@01 z@179@01) ys6@53@01)
  (and
    (Set_in (inv_5_1<Ref> x@177@01 y@178@01 z@179@01) ys6@53@01)
    (or
      (Set_in (inv_5_2<Ref> x@177@01 y@178@01 z@179@01) zs6@64@01)
      (not (Set_in (inv_5_2<Ref> x@177@01 y@178@01 z@179@01) zs6@64@01))))))
(assert (or
  (Set_in (inv_5_1<Ref> x@177@01 y@178@01 z@179@01) ys6@53@01)
  (not (Set_in (inv_5_1<Ref> x@177@01 y@178@01 z@179@01) ys6@53@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_5_0<Ref> x@177@01 y@178@01 z@179@01) xs6@42@01)
  (and
    (Set_in (inv_5_0<Ref> x@177@01 y@178@01 z@179@01) xs6@42@01)
    (=>
      (Set_in (inv_5_1<Ref> x@177@01 y@178@01 z@179@01) ys6@53@01)
      (and
        (Set_in (inv_5_1<Ref> x@177@01 y@178@01 z@179@01) ys6@53@01)
        (or
          (Set_in (inv_5_2<Ref> x@177@01 y@178@01 z@179@01) zs6@64@01)
          (not (Set_in (inv_5_2<Ref> x@177@01 y@178@01 z@179@01) zs6@64@01)))))
    (or
      (Set_in (inv_5_1<Ref> x@177@01 y@178@01 z@179@01) ys6@53@01)
      (not (Set_in (inv_5_1<Ref> x@177@01 y@178@01 z@179@01) ys6@53@01))))))
(assert (or
  (Set_in (inv_5_0<Ref> x@177@01 y@178@01 z@179@01) xs6@42@01)
  (not (Set_in (inv_5_0<Ref> x@177@01 y@178@01 z@179@01) xs6@42@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 167 | !(inv_6_0[Ref](x@177@01, y@178@01, z@179@01) in xs7@43@01 && inv_6_1[Ref](x@177@01, y@178@01, z@179@01) in ys7@54@01 && inv_6_2[Ref](x@177@01, y@178@01, z@179@01) in zs7@65@01)]
(assert (not
  (and
    (Set_in (inv_6_0<Ref> x@177@01 y@178@01 z@179@01) xs7@43@01)
    (and
      (Set_in (inv_6_1<Ref> x@177@01 y@178@01 z@179@01) ys7@54@01)
      (Set_in (inv_6_2<Ref> x@177@01 y@178@01 z@179@01) zs7@65@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (=
    ($PSF.perm_p (as pm@180@01  $PPM) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    (ite
      (and
        (and (img@83@01 x y z) (img@85@01 x y z) (img@87@01 x y z))
        (and
          (Set_in (inv@82@01 x y z) xs@70@01)
          (and
            (Set_in (inv@84@01 x y z) ys@71@01)
            (Set_in (inv@86@01 x y z) zs@72@01))))
      q@73@01
      $Perm.No))
  :pattern (($PSF.perm_p (as pm@180@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resPrmSumDef14|)))
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (and
    ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    ($PSF.loc_p ($PSF.lookup_p $t@81@01 ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))))
  :pattern (($PSF.perm_p (as pm@180@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resTrgDef15|)))
(assert (=>
  (and
    (Set_in (inv_6_0<Ref> x@177@01 y@178@01 z@179@01) xs7@43@01)
    (and
      (Set_in (inv_6_1<Ref> x@177@01 y@178@01 z@179@01) ys7@54@01)
      (Set_in (inv_6_2<Ref> x@177@01 y@178@01 z@179@01) zs7@65@01)))
  (and
    (Set_in (inv_6_0<Ref> x@177@01 y@178@01 z@179@01) xs7@43@01)
    (Set_in (inv_6_1<Ref> x@177@01 y@178@01 z@179@01) ys7@54@01)
    (Set_in (inv_6_2<Ref> x@177@01 y@178@01 z@179@01) zs7@65@01)
    ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x@177@01)
        ($SortWrappers.$RefTo$Snap y@178@01))
      ($SortWrappers.$RefTo$Snap z@179@01))) ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x@177@01)
        ($SortWrappers.$RefTo$Snap y@178@01))
      ($SortWrappers.$RefTo$Snap z@179@01)))
    (=>
      (Set_in (inv_0_0<Ref> x@177@01 y@178@01 z@179@01) xs1@37@01)
      (and
        (Set_in (inv_0_0<Ref> x@177@01 y@178@01 z@179@01) xs1@37@01)
        (=>
          (Set_in (inv_0_1<Ref> x@177@01 y@178@01 z@179@01) ys1@48@01)
          (and
            (Set_in (inv_0_1<Ref> x@177@01 y@178@01 z@179@01) ys1@48@01)
            (or
              (Set_in (inv_0_2<Ref> x@177@01 y@178@01 z@179@01) zs1@59@01)
              (not (Set_in (inv_0_2<Ref> x@177@01 y@178@01 z@179@01) zs1@59@01)))))
        (or
          (Set_in (inv_0_1<Ref> x@177@01 y@178@01 z@179@01) ys1@48@01)
          (not (Set_in (inv_0_1<Ref> x@177@01 y@178@01 z@179@01) ys1@48@01)))))
    (or
      (Set_in (inv_0_0<Ref> x@177@01 y@178@01 z@179@01) xs1@37@01)
      (not (Set_in (inv_0_0<Ref> x@177@01 y@178@01 z@179@01) xs1@37@01)))
    (=>
      (Set_in (inv_1_0<Ref> x@177@01 y@178@01 z@179@01) xs2@38@01)
      (and
        (Set_in (inv_1_0<Ref> x@177@01 y@178@01 z@179@01) xs2@38@01)
        (=>
          (Set_in (inv_1_1<Ref> x@177@01 y@178@01 z@179@01) ys2@49@01)
          (and
            (Set_in (inv_1_1<Ref> x@177@01 y@178@01 z@179@01) ys2@49@01)
            (or
              (Set_in (inv_1_2<Ref> x@177@01 y@178@01 z@179@01) zs2@60@01)
              (not (Set_in (inv_1_2<Ref> x@177@01 y@178@01 z@179@01) zs2@60@01)))))
        (or
          (Set_in (inv_1_1<Ref> x@177@01 y@178@01 z@179@01) ys2@49@01)
          (not (Set_in (inv_1_1<Ref> x@177@01 y@178@01 z@179@01) ys2@49@01)))))
    (or
      (Set_in (inv_1_0<Ref> x@177@01 y@178@01 z@179@01) xs2@38@01)
      (not (Set_in (inv_1_0<Ref> x@177@01 y@178@01 z@179@01) xs2@38@01)))
    (=>
      (Set_in (inv_2_0<Ref> x@177@01 y@178@01 z@179@01) xs3@39@01)
      (and
        (Set_in (inv_2_0<Ref> x@177@01 y@178@01 z@179@01) xs3@39@01)
        (=>
          (Set_in (inv_2_1<Ref> x@177@01 y@178@01 z@179@01) ys3@50@01)
          (and
            (Set_in (inv_2_1<Ref> x@177@01 y@178@01 z@179@01) ys3@50@01)
            (or
              (Set_in (inv_2_2<Ref> x@177@01 y@178@01 z@179@01) zs3@61@01)
              (not (Set_in (inv_2_2<Ref> x@177@01 y@178@01 z@179@01) zs3@61@01)))))
        (or
          (Set_in (inv_2_1<Ref> x@177@01 y@178@01 z@179@01) ys3@50@01)
          (not (Set_in (inv_2_1<Ref> x@177@01 y@178@01 z@179@01) ys3@50@01)))))
    (or
      (Set_in (inv_2_0<Ref> x@177@01 y@178@01 z@179@01) xs3@39@01)
      (not (Set_in (inv_2_0<Ref> x@177@01 y@178@01 z@179@01) xs3@39@01)))
    (=>
      (Set_in (inv_3_0<Ref> x@177@01 y@178@01 z@179@01) xs4@40@01)
      (and
        (Set_in (inv_3_0<Ref> x@177@01 y@178@01 z@179@01) xs4@40@01)
        (=>
          (Set_in (inv_3_1<Ref> x@177@01 y@178@01 z@179@01) ys4@51@01)
          (and
            (Set_in (inv_3_1<Ref> x@177@01 y@178@01 z@179@01) ys4@51@01)
            (or
              (Set_in (inv_3_2<Ref> x@177@01 y@178@01 z@179@01) zs4@62@01)
              (not (Set_in (inv_3_2<Ref> x@177@01 y@178@01 z@179@01) zs4@62@01)))))
        (or
          (Set_in (inv_3_1<Ref> x@177@01 y@178@01 z@179@01) ys4@51@01)
          (not (Set_in (inv_3_1<Ref> x@177@01 y@178@01 z@179@01) ys4@51@01)))))
    (or
      (Set_in (inv_3_0<Ref> x@177@01 y@178@01 z@179@01) xs4@40@01)
      (not (Set_in (inv_3_0<Ref> x@177@01 y@178@01 z@179@01) xs4@40@01)))
    (=>
      (Set_in (inv_4_0<Ref> x@177@01 y@178@01 z@179@01) xs5@41@01)
      (and
        (Set_in (inv_4_0<Ref> x@177@01 y@178@01 z@179@01) xs5@41@01)
        (=>
          (Set_in (inv_4_1<Ref> x@177@01 y@178@01 z@179@01) ys5@52@01)
          (and
            (Set_in (inv_4_1<Ref> x@177@01 y@178@01 z@179@01) ys5@52@01)
            (or
              (Set_in (inv_4_2<Ref> x@177@01 y@178@01 z@179@01) zs5@63@01)
              (not (Set_in (inv_4_2<Ref> x@177@01 y@178@01 z@179@01) zs5@63@01)))))
        (or
          (Set_in (inv_4_1<Ref> x@177@01 y@178@01 z@179@01) ys5@52@01)
          (not (Set_in (inv_4_1<Ref> x@177@01 y@178@01 z@179@01) ys5@52@01)))))
    (or
      (Set_in (inv_4_0<Ref> x@177@01 y@178@01 z@179@01) xs5@41@01)
      (not (Set_in (inv_4_0<Ref> x@177@01 y@178@01 z@179@01) xs5@41@01)))
    (=>
      (Set_in (inv_5_0<Ref> x@177@01 y@178@01 z@179@01) xs6@42@01)
      (and
        (Set_in (inv_5_0<Ref> x@177@01 y@178@01 z@179@01) xs6@42@01)
        (=>
          (Set_in (inv_5_1<Ref> x@177@01 y@178@01 z@179@01) ys6@53@01)
          (and
            (Set_in (inv_5_1<Ref> x@177@01 y@178@01 z@179@01) ys6@53@01)
            (or
              (Set_in (inv_5_2<Ref> x@177@01 y@178@01 z@179@01) zs6@64@01)
              (not (Set_in (inv_5_2<Ref> x@177@01 y@178@01 z@179@01) zs6@64@01)))))
        (or
          (Set_in (inv_5_1<Ref> x@177@01 y@178@01 z@179@01) ys6@53@01)
          (not (Set_in (inv_5_1<Ref> x@177@01 y@178@01 z@179@01) ys6@53@01)))))
    (or
      (Set_in (inv_5_0<Ref> x@177@01 y@178@01 z@179@01) xs6@42@01)
      (not (Set_in (inv_5_0<Ref> x@177@01 y@178@01 z@179@01) xs6@42@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in (inv_6_0<Ref> x@177@01 y@178@01 z@179@01) xs7@43@01)
      (and
        (Set_in (inv_6_1<Ref> x@177@01 y@178@01 z@179@01) ys7@54@01)
        (Set_in (inv_6_2<Ref> x@177@01 y@178@01 z@179@01) zs7@65@01))))
  (and
    (Set_in (inv_6_0<Ref> x@177@01 y@178@01 z@179@01) xs7@43@01)
    (and
      (Set_in (inv_6_1<Ref> x@177@01 y@178@01 z@179@01) ys7@54@01)
      (Set_in (inv_6_2<Ref> x@177@01 y@178@01 z@179@01) zs7@65@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (=
    ($PSF.perm_p (as pm@180@01  $PPM) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    (ite
      (and
        (and (img@83@01 x y z) (img@85@01 x y z) (img@87@01 x y z))
        (and
          (Set_in (inv@82@01 x y z) xs@70@01)
          (and
            (Set_in (inv@84@01 x y z) ys@71@01)
            (Set_in (inv@86@01 x y z) zs@72@01))))
      q@73@01
      $Perm.No))
  :pattern (($PSF.perm_p (as pm@180@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resPrmSumDef14|)))
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (and
    ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    ($PSF.loc_p ($PSF.lookup_p $t@81@01 ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))))
  :pattern (($PSF.perm_p (as pm@180@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resTrgDef15|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@177@01 $Ref) (y@178@01 $Ref) (z@179@01 $Ref)) (!
  (and
    (=>
      (Set_in (inv_6_0<Ref> x@177@01 y@178@01 z@179@01) xs7@43@01)
      (and
        (Set_in (inv_6_0<Ref> x@177@01 y@178@01 z@179@01) xs7@43@01)
        (or
          (Set_in (inv_6_1<Ref> x@177@01 y@178@01 z@179@01) ys7@54@01)
          (not (Set_in (inv_6_1<Ref> x@177@01 y@178@01 z@179@01) ys7@54@01)))))
    (or
      (Set_in (inv_6_0<Ref> x@177@01 y@178@01 z@179@01) xs7@43@01)
      (not (Set_in (inv_6_0<Ref> x@177@01 y@178@01 z@179@01) xs7@43@01)))
    (=>
      (and
        (Set_in (inv_6_0<Ref> x@177@01 y@178@01 z@179@01) xs7@43@01)
        (and
          (Set_in (inv_6_1<Ref> x@177@01 y@178@01 z@179@01) ys7@54@01)
          (Set_in (inv_6_2<Ref> x@177@01 y@178@01 z@179@01) zs7@65@01)))
      (and
        (Set_in (inv_6_0<Ref> x@177@01 y@178@01 z@179@01) xs7@43@01)
        (Set_in (inv_6_1<Ref> x@177@01 y@178@01 z@179@01) ys7@54@01)
        (Set_in (inv_6_2<Ref> x@177@01 y@178@01 z@179@01) zs7@65@01)
        ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap x@177@01)
            ($SortWrappers.$RefTo$Snap y@178@01))
          ($SortWrappers.$RefTo$Snap z@179@01))) ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap x@177@01)
            ($SortWrappers.$RefTo$Snap y@178@01))
          ($SortWrappers.$RefTo$Snap z@179@01)))
        (=>
          (Set_in (inv_0_0<Ref> x@177@01 y@178@01 z@179@01) xs1@37@01)
          (and
            (Set_in (inv_0_0<Ref> x@177@01 y@178@01 z@179@01) xs1@37@01)
            (=>
              (Set_in (inv_0_1<Ref> x@177@01 y@178@01 z@179@01) ys1@48@01)
              (and
                (Set_in (inv_0_1<Ref> x@177@01 y@178@01 z@179@01) ys1@48@01)
                (or
                  (Set_in (inv_0_2<Ref> x@177@01 y@178@01 z@179@01) zs1@59@01)
                  (not
                    (Set_in (inv_0_2<Ref> x@177@01 y@178@01 z@179@01) zs1@59@01)))))
            (or
              (Set_in (inv_0_1<Ref> x@177@01 y@178@01 z@179@01) ys1@48@01)
              (not (Set_in (inv_0_1<Ref> x@177@01 y@178@01 z@179@01) ys1@48@01)))))
        (or
          (Set_in (inv_0_0<Ref> x@177@01 y@178@01 z@179@01) xs1@37@01)
          (not (Set_in (inv_0_0<Ref> x@177@01 y@178@01 z@179@01) xs1@37@01)))
        (=>
          (Set_in (inv_1_0<Ref> x@177@01 y@178@01 z@179@01) xs2@38@01)
          (and
            (Set_in (inv_1_0<Ref> x@177@01 y@178@01 z@179@01) xs2@38@01)
            (=>
              (Set_in (inv_1_1<Ref> x@177@01 y@178@01 z@179@01) ys2@49@01)
              (and
                (Set_in (inv_1_1<Ref> x@177@01 y@178@01 z@179@01) ys2@49@01)
                (or
                  (Set_in (inv_1_2<Ref> x@177@01 y@178@01 z@179@01) zs2@60@01)
                  (not
                    (Set_in (inv_1_2<Ref> x@177@01 y@178@01 z@179@01) zs2@60@01)))))
            (or
              (Set_in (inv_1_1<Ref> x@177@01 y@178@01 z@179@01) ys2@49@01)
              (not (Set_in (inv_1_1<Ref> x@177@01 y@178@01 z@179@01) ys2@49@01)))))
        (or
          (Set_in (inv_1_0<Ref> x@177@01 y@178@01 z@179@01) xs2@38@01)
          (not (Set_in (inv_1_0<Ref> x@177@01 y@178@01 z@179@01) xs2@38@01)))
        (=>
          (Set_in (inv_2_0<Ref> x@177@01 y@178@01 z@179@01) xs3@39@01)
          (and
            (Set_in (inv_2_0<Ref> x@177@01 y@178@01 z@179@01) xs3@39@01)
            (=>
              (Set_in (inv_2_1<Ref> x@177@01 y@178@01 z@179@01) ys3@50@01)
              (and
                (Set_in (inv_2_1<Ref> x@177@01 y@178@01 z@179@01) ys3@50@01)
                (or
                  (Set_in (inv_2_2<Ref> x@177@01 y@178@01 z@179@01) zs3@61@01)
                  (not
                    (Set_in (inv_2_2<Ref> x@177@01 y@178@01 z@179@01) zs3@61@01)))))
            (or
              (Set_in (inv_2_1<Ref> x@177@01 y@178@01 z@179@01) ys3@50@01)
              (not (Set_in (inv_2_1<Ref> x@177@01 y@178@01 z@179@01) ys3@50@01)))))
        (or
          (Set_in (inv_2_0<Ref> x@177@01 y@178@01 z@179@01) xs3@39@01)
          (not (Set_in (inv_2_0<Ref> x@177@01 y@178@01 z@179@01) xs3@39@01)))
        (=>
          (Set_in (inv_3_0<Ref> x@177@01 y@178@01 z@179@01) xs4@40@01)
          (and
            (Set_in (inv_3_0<Ref> x@177@01 y@178@01 z@179@01) xs4@40@01)
            (=>
              (Set_in (inv_3_1<Ref> x@177@01 y@178@01 z@179@01) ys4@51@01)
              (and
                (Set_in (inv_3_1<Ref> x@177@01 y@178@01 z@179@01) ys4@51@01)
                (or
                  (Set_in (inv_3_2<Ref> x@177@01 y@178@01 z@179@01) zs4@62@01)
                  (not
                    (Set_in (inv_3_2<Ref> x@177@01 y@178@01 z@179@01) zs4@62@01)))))
            (or
              (Set_in (inv_3_1<Ref> x@177@01 y@178@01 z@179@01) ys4@51@01)
              (not (Set_in (inv_3_1<Ref> x@177@01 y@178@01 z@179@01) ys4@51@01)))))
        (or
          (Set_in (inv_3_0<Ref> x@177@01 y@178@01 z@179@01) xs4@40@01)
          (not (Set_in (inv_3_0<Ref> x@177@01 y@178@01 z@179@01) xs4@40@01)))
        (=>
          (Set_in (inv_4_0<Ref> x@177@01 y@178@01 z@179@01) xs5@41@01)
          (and
            (Set_in (inv_4_0<Ref> x@177@01 y@178@01 z@179@01) xs5@41@01)
            (=>
              (Set_in (inv_4_1<Ref> x@177@01 y@178@01 z@179@01) ys5@52@01)
              (and
                (Set_in (inv_4_1<Ref> x@177@01 y@178@01 z@179@01) ys5@52@01)
                (or
                  (Set_in (inv_4_2<Ref> x@177@01 y@178@01 z@179@01) zs5@63@01)
                  (not
                    (Set_in (inv_4_2<Ref> x@177@01 y@178@01 z@179@01) zs5@63@01)))))
            (or
              (Set_in (inv_4_1<Ref> x@177@01 y@178@01 z@179@01) ys5@52@01)
              (not (Set_in (inv_4_1<Ref> x@177@01 y@178@01 z@179@01) ys5@52@01)))))
        (or
          (Set_in (inv_4_0<Ref> x@177@01 y@178@01 z@179@01) xs5@41@01)
          (not (Set_in (inv_4_0<Ref> x@177@01 y@178@01 z@179@01) xs5@41@01)))
        (=>
          (Set_in (inv_5_0<Ref> x@177@01 y@178@01 z@179@01) xs6@42@01)
          (and
            (Set_in (inv_5_0<Ref> x@177@01 y@178@01 z@179@01) xs6@42@01)
            (=>
              (Set_in (inv_5_1<Ref> x@177@01 y@178@01 z@179@01) ys6@53@01)
              (and
                (Set_in (inv_5_1<Ref> x@177@01 y@178@01 z@179@01) ys6@53@01)
                (or
                  (Set_in (inv_5_2<Ref> x@177@01 y@178@01 z@179@01) zs6@64@01)
                  (not
                    (Set_in (inv_5_2<Ref> x@177@01 y@178@01 z@179@01) zs6@64@01)))))
            (or
              (Set_in (inv_5_1<Ref> x@177@01 y@178@01 z@179@01) ys6@53@01)
              (not (Set_in (inv_5_1<Ref> x@177@01 y@178@01 z@179@01) ys6@53@01)))))
        (or
          (Set_in (inv_5_0<Ref> x@177@01 y@178@01 z@179@01) xs6@42@01)
          (not (Set_in (inv_5_0<Ref> x@177@01 y@178@01 z@179@01) xs6@42@01)))))
    (or
      (not
        (and
          (Set_in (inv_6_0<Ref> x@177@01 y@178@01 z@179@01) xs7@43@01)
          (and
            (Set_in (inv_6_1<Ref> x@177@01 y@178@01 z@179@01) ys7@54@01)
            (Set_in (inv_6_2<Ref> x@177@01 y@178@01 z@179@01) zs7@65@01))))
      (and
        (Set_in (inv_6_0<Ref> x@177@01 y@178@01 z@179@01) xs7@43@01)
        (and
          (Set_in (inv_6_1<Ref> x@177@01 y@178@01 z@179@01) ys7@54@01)
          (Set_in (inv_6_2<Ref> x@177@01 y@178@01 z@179@01) zs7@65@01)))))
  :pattern ((inv_6_0<Ref> x@177@01 y@178@01 z@179@01) (inv_6_1<Ref> x@177@01 y@178@01 z@179@01) (inv_6_2<Ref> x@177@01 y@178@01 z@179@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@26@9@26@122-aux|)))
(assert (forall ((x@177@01 $Ref) (y@178@01 $Ref) (z@179@01 $Ref)) (!
  (=>
    (and
      (Set_in (inv_6_0<Ref> x@177@01 y@178@01 z@179@01) xs7@43@01)
      (and
        (Set_in (inv_6_1<Ref> x@177@01 y@178@01 z@179@01) ys7@54@01)
        (Set_in (inv_6_2<Ref> x@177@01 y@178@01 z@179@01) zs7@65@01)))
    (>=
      ($PSF.perm_p (as pm@180@01  $PPM) ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap x@177@01)
          ($SortWrappers.$RefTo$Snap y@178@01))
        ($SortWrappers.$RefTo$Snap z@179@01)))
      (__iar__assume_helper_6<Perm> (and
        (Set_in (inv_0_0<Ref> x@177@01 y@178@01 z@179@01) xs1@37@01)
        (and
          (Set_in (inv_0_1<Ref> x@177@01 y@178@01 z@179@01) ys1@48@01)
          (Set_in (inv_0_2<Ref> x@177@01 y@178@01 z@179@01) zs1@59@01))) (and
        (Set_in (inv_1_0<Ref> x@177@01 y@178@01 z@179@01) xs2@38@01)
        (and
          (Set_in (inv_1_1<Ref> x@177@01 y@178@01 z@179@01) ys2@49@01)
          (Set_in (inv_1_2<Ref> x@177@01 y@178@01 z@179@01) zs2@60@01))) (and
        (Set_in (inv_2_0<Ref> x@177@01 y@178@01 z@179@01) xs3@39@01)
        (and
          (Set_in (inv_2_1<Ref> x@177@01 y@178@01 z@179@01) ys3@50@01)
          (Set_in (inv_2_2<Ref> x@177@01 y@178@01 z@179@01) zs3@61@01))) (and
        (Set_in (inv_3_0<Ref> x@177@01 y@178@01 z@179@01) xs4@40@01)
        (and
          (Set_in (inv_3_1<Ref> x@177@01 y@178@01 z@179@01) ys4@51@01)
          (Set_in (inv_3_2<Ref> x@177@01 y@178@01 z@179@01) zs4@62@01))) (and
        (Set_in (inv_4_0<Ref> x@177@01 y@178@01 z@179@01) xs5@41@01)
        (and
          (Set_in (inv_4_1<Ref> x@177@01 y@178@01 z@179@01) ys5@52@01)
          (Set_in (inv_4_2<Ref> x@177@01 y@178@01 z@179@01) zs5@63@01))) (and
        (Set_in (inv_5_0<Ref> x@177@01 y@178@01 z@179@01) xs6@42@01)
        (and
          (Set_in (inv_5_1<Ref> x@177@01 y@178@01 z@179@01) ys6@53@01)
          (Set_in (inv_5_2<Ref> x@177@01 y@178@01 z@179@01) zs6@64@01))) q@73@01 q@73@01 q@73@01 q@73@01 q@73@01 q@73@01 q@73@01)))
  :pattern ((inv_6_0<Ref> x@177@01 y@178@01 z@179@01) (inv_6_1<Ref> x@177@01 y@178@01 z@179@01) (inv_6_2<Ref> x@177@01 y@178@01 z@179@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@26@9@26@122|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x8: Ref, y8: Ref, z8: Ref ::
;     { p(x8, y8, z8) }
;     (x8 in xs8) && ((y8 in ys8) && (z8 in zs8)) ==>
;     inv_7_0(x8, y8, z8) == x8 && inv_7_1(x8, y8, z8) == y8 &&
;     inv_7_2(x8, y8, z8) == z8)
(declare-const $t@181@01 $Snap)
(assert (= $t@181@01 $Snap.unit))
; [eval] (forall x8: Ref, y8: Ref, z8: Ref :: { p(x8, y8, z8) } (x8 in xs8) && ((y8 in ys8) && (z8 in zs8)) ==> inv_7_0(x8, y8, z8) == x8 && inv_7_1(x8, y8, z8) == y8 && inv_7_2(x8, y8, z8) == z8)
(declare-const x8@182@01 $Ref)
(declare-const y8@183@01 $Ref)
(declare-const z8@184@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x8 in xs8) && ((y8 in ys8) && (z8 in zs8)) ==> inv_7_0(x8, y8, z8) == x8 && inv_7_1(x8, y8, z8) == y8 && inv_7_2(x8, y8, z8) == z8
; [eval] (x8 in xs8) && ((y8 in ys8) && (z8 in zs8))
; [eval] (x8 in xs8)
(push) ; 4
; [then-branch: 198 | !(x8@182@01 in xs8@44@01) | live]
; [else-branch: 198 | x8@182@01 in xs8@44@01 | live]
(push) ; 5
; [then-branch: 198 | !(x8@182@01 in xs8@44@01)]
(assert (not (Set_in x8@182@01 xs8@44@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 198 | x8@182@01 in xs8@44@01]
(assert (Set_in x8@182@01 xs8@44@01))
; [eval] (y8 in ys8)
(push) ; 6
; [then-branch: 199 | !(y8@183@01 in ys8@55@01) | live]
; [else-branch: 199 | y8@183@01 in ys8@55@01 | live]
(push) ; 7
; [then-branch: 199 | !(y8@183@01 in ys8@55@01)]
(assert (not (Set_in y8@183@01 ys8@55@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 199 | y8@183@01 in ys8@55@01]
(assert (Set_in y8@183@01 ys8@55@01))
; [eval] (z8 in zs8)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (Set_in y8@183@01 ys8@55@01) (not (Set_in y8@183@01 ys8@55@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in x8@182@01 xs8@44@01)
  (and
    (Set_in x8@182@01 xs8@44@01)
    (or (Set_in y8@183@01 ys8@55@01) (not (Set_in y8@183@01 ys8@55@01))))))
(assert (or (Set_in x8@182@01 xs8@44@01) (not (Set_in x8@182@01 xs8@44@01))))
(push) ; 4
; [then-branch: 200 | x8@182@01 in xs8@44@01 && y8@183@01 in ys8@55@01 && z8@184@01 in zs8@66@01 | live]
; [else-branch: 200 | !(x8@182@01 in xs8@44@01 && y8@183@01 in ys8@55@01 && z8@184@01 in zs8@66@01) | live]
(push) ; 5
; [then-branch: 200 | x8@182@01 in xs8@44@01 && y8@183@01 in ys8@55@01 && z8@184@01 in zs8@66@01]
(assert (and
  (Set_in x8@182@01 xs8@44@01)
  (and (Set_in y8@183@01 ys8@55@01) (Set_in z8@184@01 zs8@66@01))))
; [eval] inv_7_0(x8, y8, z8) == x8 && inv_7_1(x8, y8, z8) == y8 && inv_7_2(x8, y8, z8) == z8
; [eval] inv_7_0(x8, y8, z8) == x8
; [eval] inv_7_0(x8, y8, z8)
(push) ; 6
; [then-branch: 201 | inv_7_0[Ref](x8@182@01, y8@183@01, z8@184@01) != x8@182@01 | live]
; [else-branch: 201 | inv_7_0[Ref](x8@182@01, y8@183@01, z8@184@01) == x8@182@01 | live]
(push) ; 7
; [then-branch: 201 | inv_7_0[Ref](x8@182@01, y8@183@01, z8@184@01) != x8@182@01]
(assert (not (= (inv_7_0<Ref> x8@182@01 y8@183@01 z8@184@01) x8@182@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 201 | inv_7_0[Ref](x8@182@01, y8@183@01, z8@184@01) == x8@182@01]
(assert (= (inv_7_0<Ref> x8@182@01 y8@183@01 z8@184@01) x8@182@01))
; [eval] inv_7_1(x8, y8, z8) == y8
; [eval] inv_7_1(x8, y8, z8)
(push) ; 8
; [then-branch: 202 | inv_7_1[Ref](x8@182@01, y8@183@01, z8@184@01) != y8@183@01 | live]
; [else-branch: 202 | inv_7_1[Ref](x8@182@01, y8@183@01, z8@184@01) == y8@183@01 | live]
(push) ; 9
; [then-branch: 202 | inv_7_1[Ref](x8@182@01, y8@183@01, z8@184@01) != y8@183@01]
(assert (not (= (inv_7_1<Ref> x8@182@01 y8@183@01 z8@184@01) y8@183@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 202 | inv_7_1[Ref](x8@182@01, y8@183@01, z8@184@01) == y8@183@01]
(assert (= (inv_7_1<Ref> x8@182@01 y8@183@01 z8@184@01) y8@183@01))
; [eval] inv_7_2(x8, y8, z8) == z8
; [eval] inv_7_2(x8, y8, z8)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or
  (= (inv_7_1<Ref> x8@182@01 y8@183@01 z8@184@01) y8@183@01)
  (not (= (inv_7_1<Ref> x8@182@01 y8@183@01 z8@184@01) y8@183@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (= (inv_7_0<Ref> x8@182@01 y8@183@01 z8@184@01) x8@182@01)
  (and
    (= (inv_7_0<Ref> x8@182@01 y8@183@01 z8@184@01) x8@182@01)
    (or
      (= (inv_7_1<Ref> x8@182@01 y8@183@01 z8@184@01) y8@183@01)
      (not (= (inv_7_1<Ref> x8@182@01 y8@183@01 z8@184@01) y8@183@01))))))
(assert (or
  (= (inv_7_0<Ref> x8@182@01 y8@183@01 z8@184@01) x8@182@01)
  (not (= (inv_7_0<Ref> x8@182@01 y8@183@01 z8@184@01) x8@182@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 200 | !(x8@182@01 in xs8@44@01 && y8@183@01 in ys8@55@01 && z8@184@01 in zs8@66@01)]
(assert (not
  (and
    (Set_in x8@182@01 xs8@44@01)
    (and (Set_in y8@183@01 ys8@55@01) (Set_in z8@184@01 zs8@66@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Set_in x8@182@01 xs8@44@01)
    (and (Set_in y8@183@01 ys8@55@01) (Set_in z8@184@01 zs8@66@01)))
  (and
    (Set_in x8@182@01 xs8@44@01)
    (Set_in y8@183@01 ys8@55@01)
    (Set_in z8@184@01 zs8@66@01)
    (=>
      (= (inv_7_0<Ref> x8@182@01 y8@183@01 z8@184@01) x8@182@01)
      (and
        (= (inv_7_0<Ref> x8@182@01 y8@183@01 z8@184@01) x8@182@01)
        (or
          (= (inv_7_1<Ref> x8@182@01 y8@183@01 z8@184@01) y8@183@01)
          (not (= (inv_7_1<Ref> x8@182@01 y8@183@01 z8@184@01) y8@183@01)))))
    (or
      (= (inv_7_0<Ref> x8@182@01 y8@183@01 z8@184@01) x8@182@01)
      (not (= (inv_7_0<Ref> x8@182@01 y8@183@01 z8@184@01) x8@182@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in x8@182@01 xs8@44@01)
      (and (Set_in y8@183@01 ys8@55@01) (Set_in z8@184@01 zs8@66@01))))
  (and
    (Set_in x8@182@01 xs8@44@01)
    (and (Set_in y8@183@01 ys8@55@01) (Set_in z8@184@01 zs8@66@01)))))
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x8@182@01 $Ref) (y8@183@01 $Ref) (z8@184@01 $Ref)) (!
  (and
    (=>
      (Set_in x8@182@01 xs8@44@01)
      (and
        (Set_in x8@182@01 xs8@44@01)
        (or (Set_in y8@183@01 ys8@55@01) (not (Set_in y8@183@01 ys8@55@01)))))
    (or (Set_in x8@182@01 xs8@44@01) (not (Set_in x8@182@01 xs8@44@01)))
    (=>
      (and
        (Set_in x8@182@01 xs8@44@01)
        (and (Set_in y8@183@01 ys8@55@01) (Set_in z8@184@01 zs8@66@01)))
      (and
        (Set_in x8@182@01 xs8@44@01)
        (Set_in y8@183@01 ys8@55@01)
        (Set_in z8@184@01 zs8@66@01)
        (=>
          (= (inv_7_0<Ref> x8@182@01 y8@183@01 z8@184@01) x8@182@01)
          (and
            (= (inv_7_0<Ref> x8@182@01 y8@183@01 z8@184@01) x8@182@01)
            (or
              (= (inv_7_1<Ref> x8@182@01 y8@183@01 z8@184@01) y8@183@01)
              (not (= (inv_7_1<Ref> x8@182@01 y8@183@01 z8@184@01) y8@183@01)))))
        (or
          (= (inv_7_0<Ref> x8@182@01 y8@183@01 z8@184@01) x8@182@01)
          (not (= (inv_7_0<Ref> x8@182@01 y8@183@01 z8@184@01) x8@182@01)))))
    (or
      (not
        (and
          (Set_in x8@182@01 xs8@44@01)
          (and (Set_in y8@183@01 ys8@55@01) (Set_in z8@184@01 zs8@66@01))))
      (and
        (Set_in x8@182@01 xs8@44@01)
        (and (Set_in y8@183@01 ys8@55@01) (Set_in z8@184@01 zs8@66@01)))))
  :pattern (($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap x8@182@01)
      ($SortWrappers.$RefTo$Snap y8@183@01))
    ($SortWrappers.$RefTo$Snap z8@184@01))) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap x8@182@01)
      ($SortWrappers.$RefTo$Snap y8@183@01))
    ($SortWrappers.$RefTo$Snap z8@184@01))))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@27@9@27@122-aux|)))
(assert (forall ((x8@182@01 $Ref) (y8@183@01 $Ref) (z8@184@01 $Ref)) (!
  (=>
    (and
      (Set_in x8@182@01 xs8@44@01)
      (and (Set_in y8@183@01 ys8@55@01) (Set_in z8@184@01 zs8@66@01)))
    (and
      (= (inv_7_0<Ref> x8@182@01 y8@183@01 z8@184@01) x8@182@01)
      (and
        (= (inv_7_1<Ref> x8@182@01 y8@183@01 z8@184@01) y8@183@01)
        (= (inv_7_2<Ref> x8@182@01 y8@183@01 z8@184@01) z8@184@01))))
  :pattern (($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap x8@182@01)
      ($SortWrappers.$RefTo$Snap y8@183@01))
    ($SortWrappers.$RefTo$Snap z8@184@01))) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap x8@182@01)
      ($SortWrappers.$RefTo$Snap y8@183@01))
    ($SortWrappers.$RefTo$Snap z8@184@01))))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@27@9@27@122|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x: Ref, y: Ref, z: Ref ::
;     { inv_7_0(x, y, z), inv_7_1(x, y, z), inv_7_2(x, y, z) }
;     (inv_7_0(x, y, z) in xs8) &&
;     ((inv_7_1(x, y, z) in ys8) && (inv_7_2(x, y, z) in zs8)) ==>
;     inv_7_0(x, y, z) == x && inv_7_1(x, y, z) == y && inv_7_2(x, y, z) == z)
(declare-const $t@185@01 $Snap)
(assert (= $t@185@01 $Snap.unit))
; [eval] (forall x: Ref, y: Ref, z: Ref :: { inv_7_0(x, y, z), inv_7_1(x, y, z), inv_7_2(x, y, z) } (inv_7_0(x, y, z) in xs8) && ((inv_7_1(x, y, z) in ys8) && (inv_7_2(x, y, z) in zs8)) ==> inv_7_0(x, y, z) == x && inv_7_1(x, y, z) == y && inv_7_2(x, y, z) == z)
(declare-const x@186@01 $Ref)
(declare-const y@187@01 $Ref)
(declare-const z@188@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (inv_7_0(x, y, z) in xs8) && ((inv_7_1(x, y, z) in ys8) && (inv_7_2(x, y, z) in zs8)) ==> inv_7_0(x, y, z) == x && inv_7_1(x, y, z) == y && inv_7_2(x, y, z) == z
; [eval] (inv_7_0(x, y, z) in xs8) && ((inv_7_1(x, y, z) in ys8) && (inv_7_2(x, y, z) in zs8))
; [eval] (inv_7_0(x, y, z) in xs8)
; [eval] inv_7_0(x, y, z)
(push) ; 4
; [then-branch: 203 | !(inv_7_0[Ref](x@186@01, y@187@01, z@188@01) in xs8@44@01) | live]
; [else-branch: 203 | inv_7_0[Ref](x@186@01, y@187@01, z@188@01) in xs8@44@01 | live]
(push) ; 5
; [then-branch: 203 | !(inv_7_0[Ref](x@186@01, y@187@01, z@188@01) in xs8@44@01)]
(assert (not (Set_in (inv_7_0<Ref> x@186@01 y@187@01 z@188@01) xs8@44@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 203 | inv_7_0[Ref](x@186@01, y@187@01, z@188@01) in xs8@44@01]
(assert (Set_in (inv_7_0<Ref> x@186@01 y@187@01 z@188@01) xs8@44@01))
; [eval] (inv_7_1(x, y, z) in ys8)
; [eval] inv_7_1(x, y, z)
(push) ; 6
; [then-branch: 204 | !(inv_7_1[Ref](x@186@01, y@187@01, z@188@01) in ys8@55@01) | live]
; [else-branch: 204 | inv_7_1[Ref](x@186@01, y@187@01, z@188@01) in ys8@55@01 | live]
(push) ; 7
; [then-branch: 204 | !(inv_7_1[Ref](x@186@01, y@187@01, z@188@01) in ys8@55@01)]
(assert (not (Set_in (inv_7_1<Ref> x@186@01 y@187@01 z@188@01) ys8@55@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 204 | inv_7_1[Ref](x@186@01, y@187@01, z@188@01) in ys8@55@01]
(assert (Set_in (inv_7_1<Ref> x@186@01 y@187@01 z@188@01) ys8@55@01))
; [eval] (inv_7_2(x, y, z) in zs8)
; [eval] inv_7_2(x, y, z)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_7_1<Ref> x@186@01 y@187@01 z@188@01) ys8@55@01)
  (not (Set_in (inv_7_1<Ref> x@186@01 y@187@01 z@188@01) ys8@55@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_7_0<Ref> x@186@01 y@187@01 z@188@01) xs8@44@01)
  (and
    (Set_in (inv_7_0<Ref> x@186@01 y@187@01 z@188@01) xs8@44@01)
    (or
      (Set_in (inv_7_1<Ref> x@186@01 y@187@01 z@188@01) ys8@55@01)
      (not (Set_in (inv_7_1<Ref> x@186@01 y@187@01 z@188@01) ys8@55@01))))))
(assert (or
  (Set_in (inv_7_0<Ref> x@186@01 y@187@01 z@188@01) xs8@44@01)
  (not (Set_in (inv_7_0<Ref> x@186@01 y@187@01 z@188@01) xs8@44@01))))
(push) ; 4
; [then-branch: 205 | inv_7_0[Ref](x@186@01, y@187@01, z@188@01) in xs8@44@01 && inv_7_1[Ref](x@186@01, y@187@01, z@188@01) in ys8@55@01 && inv_7_2[Ref](x@186@01, y@187@01, z@188@01) in zs8@66@01 | live]
; [else-branch: 205 | !(inv_7_0[Ref](x@186@01, y@187@01, z@188@01) in xs8@44@01 && inv_7_1[Ref](x@186@01, y@187@01, z@188@01) in ys8@55@01 && inv_7_2[Ref](x@186@01, y@187@01, z@188@01) in zs8@66@01) | live]
(push) ; 5
; [then-branch: 205 | inv_7_0[Ref](x@186@01, y@187@01, z@188@01) in xs8@44@01 && inv_7_1[Ref](x@186@01, y@187@01, z@188@01) in ys8@55@01 && inv_7_2[Ref](x@186@01, y@187@01, z@188@01) in zs8@66@01]
(assert (and
  (Set_in (inv_7_0<Ref> x@186@01 y@187@01 z@188@01) xs8@44@01)
  (and
    (Set_in (inv_7_1<Ref> x@186@01 y@187@01 z@188@01) ys8@55@01)
    (Set_in (inv_7_2<Ref> x@186@01 y@187@01 z@188@01) zs8@66@01))))
; [eval] inv_7_0(x, y, z) == x && inv_7_1(x, y, z) == y && inv_7_2(x, y, z) == z
; [eval] inv_7_0(x, y, z) == x
; [eval] inv_7_0(x, y, z)
(push) ; 6
; [then-branch: 206 | inv_7_0[Ref](x@186@01, y@187@01, z@188@01) != x@186@01 | live]
; [else-branch: 206 | inv_7_0[Ref](x@186@01, y@187@01, z@188@01) == x@186@01 | live]
(push) ; 7
; [then-branch: 206 | inv_7_0[Ref](x@186@01, y@187@01, z@188@01) != x@186@01]
(assert (not (= (inv_7_0<Ref> x@186@01 y@187@01 z@188@01) x@186@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 206 | inv_7_0[Ref](x@186@01, y@187@01, z@188@01) == x@186@01]
(assert (= (inv_7_0<Ref> x@186@01 y@187@01 z@188@01) x@186@01))
; [eval] inv_7_1(x, y, z) == y
; [eval] inv_7_1(x, y, z)
(push) ; 8
; [then-branch: 207 | inv_7_1[Ref](x@186@01, y@187@01, z@188@01) != y@187@01 | live]
; [else-branch: 207 | inv_7_1[Ref](x@186@01, y@187@01, z@188@01) == y@187@01 | live]
(push) ; 9
; [then-branch: 207 | inv_7_1[Ref](x@186@01, y@187@01, z@188@01) != y@187@01]
(assert (not (= (inv_7_1<Ref> x@186@01 y@187@01 z@188@01) y@187@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 207 | inv_7_1[Ref](x@186@01, y@187@01, z@188@01) == y@187@01]
(assert (= (inv_7_1<Ref> x@186@01 y@187@01 z@188@01) y@187@01))
; [eval] inv_7_2(x, y, z) == z
; [eval] inv_7_2(x, y, z)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or
  (= (inv_7_1<Ref> x@186@01 y@187@01 z@188@01) y@187@01)
  (not (= (inv_7_1<Ref> x@186@01 y@187@01 z@188@01) y@187@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (= (inv_7_0<Ref> x@186@01 y@187@01 z@188@01) x@186@01)
  (and
    (= (inv_7_0<Ref> x@186@01 y@187@01 z@188@01) x@186@01)
    (or
      (= (inv_7_1<Ref> x@186@01 y@187@01 z@188@01) y@187@01)
      (not (= (inv_7_1<Ref> x@186@01 y@187@01 z@188@01) y@187@01))))))
(assert (or
  (= (inv_7_0<Ref> x@186@01 y@187@01 z@188@01) x@186@01)
  (not (= (inv_7_0<Ref> x@186@01 y@187@01 z@188@01) x@186@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 205 | !(inv_7_0[Ref](x@186@01, y@187@01, z@188@01) in xs8@44@01 && inv_7_1[Ref](x@186@01, y@187@01, z@188@01) in ys8@55@01 && inv_7_2[Ref](x@186@01, y@187@01, z@188@01) in zs8@66@01)]
(assert (not
  (and
    (Set_in (inv_7_0<Ref> x@186@01 y@187@01 z@188@01) xs8@44@01)
    (and
      (Set_in (inv_7_1<Ref> x@186@01 y@187@01 z@188@01) ys8@55@01)
      (Set_in (inv_7_2<Ref> x@186@01 y@187@01 z@188@01) zs8@66@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Set_in (inv_7_0<Ref> x@186@01 y@187@01 z@188@01) xs8@44@01)
    (and
      (Set_in (inv_7_1<Ref> x@186@01 y@187@01 z@188@01) ys8@55@01)
      (Set_in (inv_7_2<Ref> x@186@01 y@187@01 z@188@01) zs8@66@01)))
  (and
    (Set_in (inv_7_0<Ref> x@186@01 y@187@01 z@188@01) xs8@44@01)
    (Set_in (inv_7_1<Ref> x@186@01 y@187@01 z@188@01) ys8@55@01)
    (Set_in (inv_7_2<Ref> x@186@01 y@187@01 z@188@01) zs8@66@01)
    (=>
      (= (inv_7_0<Ref> x@186@01 y@187@01 z@188@01) x@186@01)
      (and
        (= (inv_7_0<Ref> x@186@01 y@187@01 z@188@01) x@186@01)
        (or
          (= (inv_7_1<Ref> x@186@01 y@187@01 z@188@01) y@187@01)
          (not (= (inv_7_1<Ref> x@186@01 y@187@01 z@188@01) y@187@01)))))
    (or
      (= (inv_7_0<Ref> x@186@01 y@187@01 z@188@01) x@186@01)
      (not (= (inv_7_0<Ref> x@186@01 y@187@01 z@188@01) x@186@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in (inv_7_0<Ref> x@186@01 y@187@01 z@188@01) xs8@44@01)
      (and
        (Set_in (inv_7_1<Ref> x@186@01 y@187@01 z@188@01) ys8@55@01)
        (Set_in (inv_7_2<Ref> x@186@01 y@187@01 z@188@01) zs8@66@01))))
  (and
    (Set_in (inv_7_0<Ref> x@186@01 y@187@01 z@188@01) xs8@44@01)
    (and
      (Set_in (inv_7_1<Ref> x@186@01 y@187@01 z@188@01) ys8@55@01)
      (Set_in (inv_7_2<Ref> x@186@01 y@187@01 z@188@01) zs8@66@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@186@01 $Ref) (y@187@01 $Ref) (z@188@01 $Ref)) (!
  (and
    (=>
      (Set_in (inv_7_0<Ref> x@186@01 y@187@01 z@188@01) xs8@44@01)
      (and
        (Set_in (inv_7_0<Ref> x@186@01 y@187@01 z@188@01) xs8@44@01)
        (or
          (Set_in (inv_7_1<Ref> x@186@01 y@187@01 z@188@01) ys8@55@01)
          (not (Set_in (inv_7_1<Ref> x@186@01 y@187@01 z@188@01) ys8@55@01)))))
    (or
      (Set_in (inv_7_0<Ref> x@186@01 y@187@01 z@188@01) xs8@44@01)
      (not (Set_in (inv_7_0<Ref> x@186@01 y@187@01 z@188@01) xs8@44@01)))
    (=>
      (and
        (Set_in (inv_7_0<Ref> x@186@01 y@187@01 z@188@01) xs8@44@01)
        (and
          (Set_in (inv_7_1<Ref> x@186@01 y@187@01 z@188@01) ys8@55@01)
          (Set_in (inv_7_2<Ref> x@186@01 y@187@01 z@188@01) zs8@66@01)))
      (and
        (Set_in (inv_7_0<Ref> x@186@01 y@187@01 z@188@01) xs8@44@01)
        (Set_in (inv_7_1<Ref> x@186@01 y@187@01 z@188@01) ys8@55@01)
        (Set_in (inv_7_2<Ref> x@186@01 y@187@01 z@188@01) zs8@66@01)
        (=>
          (= (inv_7_0<Ref> x@186@01 y@187@01 z@188@01) x@186@01)
          (and
            (= (inv_7_0<Ref> x@186@01 y@187@01 z@188@01) x@186@01)
            (or
              (= (inv_7_1<Ref> x@186@01 y@187@01 z@188@01) y@187@01)
              (not (= (inv_7_1<Ref> x@186@01 y@187@01 z@188@01) y@187@01)))))
        (or
          (= (inv_7_0<Ref> x@186@01 y@187@01 z@188@01) x@186@01)
          (not (= (inv_7_0<Ref> x@186@01 y@187@01 z@188@01) x@186@01)))))
    (or
      (not
        (and
          (Set_in (inv_7_0<Ref> x@186@01 y@187@01 z@188@01) xs8@44@01)
          (and
            (Set_in (inv_7_1<Ref> x@186@01 y@187@01 z@188@01) ys8@55@01)
            (Set_in (inv_7_2<Ref> x@186@01 y@187@01 z@188@01) zs8@66@01))))
      (and
        (Set_in (inv_7_0<Ref> x@186@01 y@187@01 z@188@01) xs8@44@01)
        (and
          (Set_in (inv_7_1<Ref> x@186@01 y@187@01 z@188@01) ys8@55@01)
          (Set_in (inv_7_2<Ref> x@186@01 y@187@01 z@188@01) zs8@66@01)))))
  :pattern ((inv_7_0<Ref> x@186@01 y@187@01 z@188@01) (inv_7_1<Ref> x@186@01 y@187@01 z@188@01) (inv_7_2<Ref> x@186@01 y@187@01 z@188@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@27@9@27@122-aux|)))
(assert (forall ((x@186@01 $Ref) (y@187@01 $Ref) (z@188@01 $Ref)) (!
  (=>
    (and
      (Set_in (inv_7_0<Ref> x@186@01 y@187@01 z@188@01) xs8@44@01)
      (and
        (Set_in (inv_7_1<Ref> x@186@01 y@187@01 z@188@01) ys8@55@01)
        (Set_in (inv_7_2<Ref> x@186@01 y@187@01 z@188@01) zs8@66@01)))
    (and
      (= (inv_7_0<Ref> x@186@01 y@187@01 z@188@01) x@186@01)
      (and
        (= (inv_7_1<Ref> x@186@01 y@187@01 z@188@01) y@187@01)
        (= (inv_7_2<Ref> x@186@01 y@187@01 z@188@01) z@188@01))))
  :pattern ((inv_7_0<Ref> x@186@01 y@187@01 z@188@01) (inv_7_1<Ref> x@186@01 y@187@01 z@188@01) (inv_7_2<Ref> x@186@01 y@187@01 z@188@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@27@9@27@122|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x: Ref, y: Ref, z: Ref ::
;     { inv_7_0(x, y, z), inv_7_1(x, y, z), inv_7_2(x, y, z) }
;     (inv_7_0(x, y, z) in xs8) &&
;     ((inv_7_1(x, y, z) in ys8) && (inv_7_2(x, y, z) in zs8)) ==>
;     perm(p(x, y, z)) >=
;     __iar__assume_helper_7((inv_0_0(x, y, z) in xs1) &&
;     ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) &&
;     (x == x && y == y && z == z), (inv_1_0(x, y, z) in xs2) &&
;     ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) &&
;     (x == x && y == y && z == z), (inv_2_0(x, y, z) in xs3) &&
;     ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) &&
;     (x == x && y == y && z == z), (inv_3_0(x, y, z) in xs4) &&
;     ((inv_3_1(x, y, z) in ys4) && (inv_3_2(x, y, z) in zs4)) &&
;     (x == x && y == y && z == z), (inv_4_0(x, y, z) in xs5) &&
;     ((inv_4_1(x, y, z) in ys5) && (inv_4_2(x, y, z) in zs5)) &&
;     (x == x && y == y && z == z), (inv_5_0(x, y, z) in xs6) &&
;     ((inv_5_1(x, y, z) in ys6) && (inv_5_2(x, y, z) in zs6)) &&
;     (x == x && y == y && z == z), (inv_6_0(x, y, z) in xs7) &&
;     ((inv_6_1(x, y, z) in ys7) && (inv_6_2(x, y, z) in zs7)) &&
;     (x == x && y == y && z == z), q, q, q, q, q, q, q, q))
(declare-const $t@189@01 $Snap)
(assert (= $t@189@01 $Snap.unit))
; [eval] (forall x: Ref, y: Ref, z: Ref :: { inv_7_0(x, y, z), inv_7_1(x, y, z), inv_7_2(x, y, z) } (inv_7_0(x, y, z) in xs8) && ((inv_7_1(x, y, z) in ys8) && (inv_7_2(x, y, z) in zs8)) ==> perm(p(x, y, z)) >= __iar__assume_helper_7((inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) && (x == x && y == y && z == z), (inv_1_0(x, y, z) in xs2) && ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) && (x == x && y == y && z == z), (inv_2_0(x, y, z) in xs3) && ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) && (x == x && y == y && z == z), (inv_3_0(x, y, z) in xs4) && ((inv_3_1(x, y, z) in ys4) && (inv_3_2(x, y, z) in zs4)) && (x == x && y == y && z == z), (inv_4_0(x, y, z) in xs5) && ((inv_4_1(x, y, z) in ys5) && (inv_4_2(x, y, z) in zs5)) && (x == x && y == y && z == z), (inv_5_0(x, y, z) in xs6) && ((inv_5_1(x, y, z) in ys6) && (inv_5_2(x, y, z) in zs6)) && (x == x && y == y && z == z), (inv_6_0(x, y, z) in xs7) && ((inv_6_1(x, y, z) in ys7) && (inv_6_2(x, y, z) in zs7)) && (x == x && y == y && z == z), q, q, q, q, q, q, q, q))
(declare-const x@190@01 $Ref)
(declare-const y@191@01 $Ref)
(declare-const z@192@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (inv_7_0(x, y, z) in xs8) && ((inv_7_1(x, y, z) in ys8) && (inv_7_2(x, y, z) in zs8)) ==> perm(p(x, y, z)) >= __iar__assume_helper_7((inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) && (x == x && y == y && z == z), (inv_1_0(x, y, z) in xs2) && ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) && (x == x && y == y && z == z), (inv_2_0(x, y, z) in xs3) && ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) && (x == x && y == y && z == z), (inv_3_0(x, y, z) in xs4) && ((inv_3_1(x, y, z) in ys4) && (inv_3_2(x, y, z) in zs4)) && (x == x && y == y && z == z), (inv_4_0(x, y, z) in xs5) && ((inv_4_1(x, y, z) in ys5) && (inv_4_2(x, y, z) in zs5)) && (x == x && y == y && z == z), (inv_5_0(x, y, z) in xs6) && ((inv_5_1(x, y, z) in ys6) && (inv_5_2(x, y, z) in zs6)) && (x == x && y == y && z == z), (inv_6_0(x, y, z) in xs7) && ((inv_6_1(x, y, z) in ys7) && (inv_6_2(x, y, z) in zs7)) && (x == x && y == y && z == z), q, q, q, q, q, q, q, q)
; [eval] (inv_7_0(x, y, z) in xs8) && ((inv_7_1(x, y, z) in ys8) && (inv_7_2(x, y, z) in zs8))
; [eval] (inv_7_0(x, y, z) in xs8)
; [eval] inv_7_0(x, y, z)
(push) ; 4
; [then-branch: 208 | !(inv_7_0[Ref](x@190@01, y@191@01, z@192@01) in xs8@44@01) | live]
; [else-branch: 208 | inv_7_0[Ref](x@190@01, y@191@01, z@192@01) in xs8@44@01 | live]
(push) ; 5
; [then-branch: 208 | !(inv_7_0[Ref](x@190@01, y@191@01, z@192@01) in xs8@44@01)]
(assert (not (Set_in (inv_7_0<Ref> x@190@01 y@191@01 z@192@01) xs8@44@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 208 | inv_7_0[Ref](x@190@01, y@191@01, z@192@01) in xs8@44@01]
(assert (Set_in (inv_7_0<Ref> x@190@01 y@191@01 z@192@01) xs8@44@01))
; [eval] (inv_7_1(x, y, z) in ys8)
; [eval] inv_7_1(x, y, z)
(push) ; 6
; [then-branch: 209 | !(inv_7_1[Ref](x@190@01, y@191@01, z@192@01) in ys8@55@01) | live]
; [else-branch: 209 | inv_7_1[Ref](x@190@01, y@191@01, z@192@01) in ys8@55@01 | live]
(push) ; 7
; [then-branch: 209 | !(inv_7_1[Ref](x@190@01, y@191@01, z@192@01) in ys8@55@01)]
(assert (not (Set_in (inv_7_1<Ref> x@190@01 y@191@01 z@192@01) ys8@55@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 209 | inv_7_1[Ref](x@190@01, y@191@01, z@192@01) in ys8@55@01]
(assert (Set_in (inv_7_1<Ref> x@190@01 y@191@01 z@192@01) ys8@55@01))
; [eval] (inv_7_2(x, y, z) in zs8)
; [eval] inv_7_2(x, y, z)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_7_1<Ref> x@190@01 y@191@01 z@192@01) ys8@55@01)
  (not (Set_in (inv_7_1<Ref> x@190@01 y@191@01 z@192@01) ys8@55@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_7_0<Ref> x@190@01 y@191@01 z@192@01) xs8@44@01)
  (and
    (Set_in (inv_7_0<Ref> x@190@01 y@191@01 z@192@01) xs8@44@01)
    (or
      (Set_in (inv_7_1<Ref> x@190@01 y@191@01 z@192@01) ys8@55@01)
      (not (Set_in (inv_7_1<Ref> x@190@01 y@191@01 z@192@01) ys8@55@01))))))
(assert (or
  (Set_in (inv_7_0<Ref> x@190@01 y@191@01 z@192@01) xs8@44@01)
  (not (Set_in (inv_7_0<Ref> x@190@01 y@191@01 z@192@01) xs8@44@01))))
(push) ; 4
; [then-branch: 210 | inv_7_0[Ref](x@190@01, y@191@01, z@192@01) in xs8@44@01 && inv_7_1[Ref](x@190@01, y@191@01, z@192@01) in ys8@55@01 && inv_7_2[Ref](x@190@01, y@191@01, z@192@01) in zs8@66@01 | live]
; [else-branch: 210 | !(inv_7_0[Ref](x@190@01, y@191@01, z@192@01) in xs8@44@01 && inv_7_1[Ref](x@190@01, y@191@01, z@192@01) in ys8@55@01 && inv_7_2[Ref](x@190@01, y@191@01, z@192@01) in zs8@66@01) | live]
(push) ; 5
; [then-branch: 210 | inv_7_0[Ref](x@190@01, y@191@01, z@192@01) in xs8@44@01 && inv_7_1[Ref](x@190@01, y@191@01, z@192@01) in ys8@55@01 && inv_7_2[Ref](x@190@01, y@191@01, z@192@01) in zs8@66@01]
(assert (and
  (Set_in (inv_7_0<Ref> x@190@01 y@191@01 z@192@01) xs8@44@01)
  (and
    (Set_in (inv_7_1<Ref> x@190@01 y@191@01 z@192@01) ys8@55@01)
    (Set_in (inv_7_2<Ref> x@190@01 y@191@01 z@192@01) zs8@66@01))))
; [eval] perm(p(x, y, z)) >= __iar__assume_helper_7((inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) && (x == x && y == y && z == z), (inv_1_0(x, y, z) in xs2) && ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) && (x == x && y == y && z == z), (inv_2_0(x, y, z) in xs3) && ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) && (x == x && y == y && z == z), (inv_3_0(x, y, z) in xs4) && ((inv_3_1(x, y, z) in ys4) && (inv_3_2(x, y, z) in zs4)) && (x == x && y == y && z == z), (inv_4_0(x, y, z) in xs5) && ((inv_4_1(x, y, z) in ys5) && (inv_4_2(x, y, z) in zs5)) && (x == x && y == y && z == z), (inv_5_0(x, y, z) in xs6) && ((inv_5_1(x, y, z) in ys6) && (inv_5_2(x, y, z) in zs6)) && (x == x && y == y && z == z), (inv_6_0(x, y, z) in xs7) && ((inv_6_1(x, y, z) in ys7) && (inv_6_2(x, y, z) in zs7)) && (x == x && y == y && z == z), q, q, q, q, q, q, q, q)
; [eval] perm(p(x, y, z))
; Definitional axioms for snapshot map values
(declare-const pm@193@01 $PPM)
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (=
    ($PSF.perm_p (as pm@193@01  $PPM) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    (ite
      (and
        (and (img@83@01 x y z) (img@85@01 x y z) (img@87@01 x y z))
        (and
          (Set_in (inv@82@01 x y z) xs@70@01)
          (and
            (Set_in (inv@84@01 x y z) ys@71@01)
            (Set_in (inv@86@01 x y z) zs@72@01))))
      q@73@01
      $Perm.No))
  :pattern (($PSF.perm_p (as pm@193@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resPrmSumDef16|)))
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (and
    ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    ($PSF.loc_p ($PSF.lookup_p $t@81@01 ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))))
  :pattern (($PSF.perm_p (as pm@193@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resTrgDef17|)))
(assert ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x@190@01)
    ($SortWrappers.$RefTo$Snap y@191@01))
  ($SortWrappers.$RefTo$Snap z@192@01))) ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x@190@01)
    ($SortWrappers.$RefTo$Snap y@191@01))
  ($SortWrappers.$RefTo$Snap z@192@01))))
; [eval] __iar__assume_helper_7((inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) && (x == x && y == y && z == z), (inv_1_0(x, y, z) in xs2) && ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) && (x == x && y == y && z == z), (inv_2_0(x, y, z) in xs3) && ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) && (x == x && y == y && z == z), (inv_3_0(x, y, z) in xs4) && ((inv_3_1(x, y, z) in ys4) && (inv_3_2(x, y, z) in zs4)) && (x == x && y == y && z == z), (inv_4_0(x, y, z) in xs5) && ((inv_4_1(x, y, z) in ys5) && (inv_4_2(x, y, z) in zs5)) && (x == x && y == y && z == z), (inv_5_0(x, y, z) in xs6) && ((inv_5_1(x, y, z) in ys6) && (inv_5_2(x, y, z) in zs6)) && (x == x && y == y && z == z), (inv_6_0(x, y, z) in xs7) && ((inv_6_1(x, y, z) in ys7) && (inv_6_2(x, y, z) in zs7)) && (x == x && y == y && z == z), q, q, q, q, q, q, q, q)
; [eval] (inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) && (x == x && y == y && z == z)
; [eval] (inv_0_0(x, y, z) in xs1)
; [eval] inv_0_0(x, y, z)
(push) ; 6
; [then-branch: 211 | !(inv_0_0[Ref](x@190@01, y@191@01, z@192@01) in xs1@37@01) | live]
; [else-branch: 211 | inv_0_0[Ref](x@190@01, y@191@01, z@192@01) in xs1@37@01 | live]
(push) ; 7
; [then-branch: 211 | !(inv_0_0[Ref](x@190@01, y@191@01, z@192@01) in xs1@37@01)]
(assert (not (Set_in (inv_0_0<Ref> x@190@01 y@191@01 z@192@01) xs1@37@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 211 | inv_0_0[Ref](x@190@01, y@191@01, z@192@01) in xs1@37@01]
(assert (Set_in (inv_0_0<Ref> x@190@01 y@191@01 z@192@01) xs1@37@01))
; [eval] (inv_0_1(x, y, z) in ys1)
; [eval] inv_0_1(x, y, z)
(push) ; 8
; [then-branch: 212 | !(inv_0_1[Ref](x@190@01, y@191@01, z@192@01) in ys1@48@01) | live]
; [else-branch: 212 | inv_0_1[Ref](x@190@01, y@191@01, z@192@01) in ys1@48@01 | live]
(push) ; 9
; [then-branch: 212 | !(inv_0_1[Ref](x@190@01, y@191@01, z@192@01) in ys1@48@01)]
(assert (not (Set_in (inv_0_1<Ref> x@190@01 y@191@01 z@192@01) ys1@48@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 212 | inv_0_1[Ref](x@190@01, y@191@01, z@192@01) in ys1@48@01]
(assert (Set_in (inv_0_1<Ref> x@190@01 y@191@01 z@192@01) ys1@48@01))
; [eval] (inv_0_2(x, y, z) in zs1)
; [eval] inv_0_2(x, y, z)
(push) ; 10
; [then-branch: 213 | !(inv_0_2[Ref](x@190@01, y@191@01, z@192@01) in zs1@59@01) | live]
; [else-branch: 213 | inv_0_2[Ref](x@190@01, y@191@01, z@192@01) in zs1@59@01 | live]
(push) ; 11
; [then-branch: 213 | !(inv_0_2[Ref](x@190@01, y@191@01, z@192@01) in zs1@59@01)]
(assert (not (Set_in (inv_0_2<Ref> x@190@01 y@191@01 z@192@01) zs1@59@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 213 | inv_0_2[Ref](x@190@01, y@191@01, z@192@01) in zs1@59@01]
(assert (Set_in (inv_0_2<Ref> x@190@01 y@191@01 z@192@01) zs1@59@01))
; [eval] x == x
(push) ; 12
; [then-branch: 214 | False | live]
; [else-branch: 214 | True | live]
(push) ; 13
; [then-branch: 214 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 214 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 215 | False | live]
; [else-branch: 215 | True | live]
(push) ; 15
; [then-branch: 215 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 215 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_0_2<Ref> x@190@01 y@191@01 z@192@01) zs1@59@01)
  (not (Set_in (inv_0_2<Ref> x@190@01 y@191@01 z@192@01) zs1@59@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_0_1<Ref> x@190@01 y@191@01 z@192@01) ys1@48@01)
  (and
    (Set_in (inv_0_1<Ref> x@190@01 y@191@01 z@192@01) ys1@48@01)
    (or
      (Set_in (inv_0_2<Ref> x@190@01 y@191@01 z@192@01) zs1@59@01)
      (not (Set_in (inv_0_2<Ref> x@190@01 y@191@01 z@192@01) zs1@59@01))))))
(assert (or
  (Set_in (inv_0_1<Ref> x@190@01 y@191@01 z@192@01) ys1@48@01)
  (not (Set_in (inv_0_1<Ref> x@190@01 y@191@01 z@192@01) ys1@48@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_0_0<Ref> x@190@01 y@191@01 z@192@01) xs1@37@01)
  (and
    (Set_in (inv_0_0<Ref> x@190@01 y@191@01 z@192@01) xs1@37@01)
    (=>
      (Set_in (inv_0_1<Ref> x@190@01 y@191@01 z@192@01) ys1@48@01)
      (and
        (Set_in (inv_0_1<Ref> x@190@01 y@191@01 z@192@01) ys1@48@01)
        (or
          (Set_in (inv_0_2<Ref> x@190@01 y@191@01 z@192@01) zs1@59@01)
          (not (Set_in (inv_0_2<Ref> x@190@01 y@191@01 z@192@01) zs1@59@01)))))
    (or
      (Set_in (inv_0_1<Ref> x@190@01 y@191@01 z@192@01) ys1@48@01)
      (not (Set_in (inv_0_1<Ref> x@190@01 y@191@01 z@192@01) ys1@48@01))))))
(assert (or
  (Set_in (inv_0_0<Ref> x@190@01 y@191@01 z@192@01) xs1@37@01)
  (not (Set_in (inv_0_0<Ref> x@190@01 y@191@01 z@192@01) xs1@37@01))))
; [eval] (inv_1_0(x, y, z) in xs2) && ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) && (x == x && y == y && z == z)
; [eval] (inv_1_0(x, y, z) in xs2)
; [eval] inv_1_0(x, y, z)
(push) ; 6
; [then-branch: 216 | !(inv_1_0[Ref](x@190@01, y@191@01, z@192@01) in xs2@38@01) | live]
; [else-branch: 216 | inv_1_0[Ref](x@190@01, y@191@01, z@192@01) in xs2@38@01 | live]
(push) ; 7
; [then-branch: 216 | !(inv_1_0[Ref](x@190@01, y@191@01, z@192@01) in xs2@38@01)]
(assert (not (Set_in (inv_1_0<Ref> x@190@01 y@191@01 z@192@01) xs2@38@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 216 | inv_1_0[Ref](x@190@01, y@191@01, z@192@01) in xs2@38@01]
(assert (Set_in (inv_1_0<Ref> x@190@01 y@191@01 z@192@01) xs2@38@01))
; [eval] (inv_1_1(x, y, z) in ys2)
; [eval] inv_1_1(x, y, z)
(push) ; 8
; [then-branch: 217 | !(inv_1_1[Ref](x@190@01, y@191@01, z@192@01) in ys2@49@01) | live]
; [else-branch: 217 | inv_1_1[Ref](x@190@01, y@191@01, z@192@01) in ys2@49@01 | live]
(push) ; 9
; [then-branch: 217 | !(inv_1_1[Ref](x@190@01, y@191@01, z@192@01) in ys2@49@01)]
(assert (not (Set_in (inv_1_1<Ref> x@190@01 y@191@01 z@192@01) ys2@49@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 217 | inv_1_1[Ref](x@190@01, y@191@01, z@192@01) in ys2@49@01]
(assert (Set_in (inv_1_1<Ref> x@190@01 y@191@01 z@192@01) ys2@49@01))
; [eval] (inv_1_2(x, y, z) in zs2)
; [eval] inv_1_2(x, y, z)
(push) ; 10
; [then-branch: 218 | !(inv_1_2[Ref](x@190@01, y@191@01, z@192@01) in zs2@60@01) | live]
; [else-branch: 218 | inv_1_2[Ref](x@190@01, y@191@01, z@192@01) in zs2@60@01 | live]
(push) ; 11
; [then-branch: 218 | !(inv_1_2[Ref](x@190@01, y@191@01, z@192@01) in zs2@60@01)]
(assert (not (Set_in (inv_1_2<Ref> x@190@01 y@191@01 z@192@01) zs2@60@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 218 | inv_1_2[Ref](x@190@01, y@191@01, z@192@01) in zs2@60@01]
(assert (Set_in (inv_1_2<Ref> x@190@01 y@191@01 z@192@01) zs2@60@01))
; [eval] x == x
(push) ; 12
; [then-branch: 219 | False | live]
; [else-branch: 219 | True | live]
(push) ; 13
; [then-branch: 219 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 219 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 220 | False | live]
; [else-branch: 220 | True | live]
(push) ; 15
; [then-branch: 220 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 220 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_1_2<Ref> x@190@01 y@191@01 z@192@01) zs2@60@01)
  (not (Set_in (inv_1_2<Ref> x@190@01 y@191@01 z@192@01) zs2@60@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_1_1<Ref> x@190@01 y@191@01 z@192@01) ys2@49@01)
  (and
    (Set_in (inv_1_1<Ref> x@190@01 y@191@01 z@192@01) ys2@49@01)
    (or
      (Set_in (inv_1_2<Ref> x@190@01 y@191@01 z@192@01) zs2@60@01)
      (not (Set_in (inv_1_2<Ref> x@190@01 y@191@01 z@192@01) zs2@60@01))))))
(assert (or
  (Set_in (inv_1_1<Ref> x@190@01 y@191@01 z@192@01) ys2@49@01)
  (not (Set_in (inv_1_1<Ref> x@190@01 y@191@01 z@192@01) ys2@49@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_1_0<Ref> x@190@01 y@191@01 z@192@01) xs2@38@01)
  (and
    (Set_in (inv_1_0<Ref> x@190@01 y@191@01 z@192@01) xs2@38@01)
    (=>
      (Set_in (inv_1_1<Ref> x@190@01 y@191@01 z@192@01) ys2@49@01)
      (and
        (Set_in (inv_1_1<Ref> x@190@01 y@191@01 z@192@01) ys2@49@01)
        (or
          (Set_in (inv_1_2<Ref> x@190@01 y@191@01 z@192@01) zs2@60@01)
          (not (Set_in (inv_1_2<Ref> x@190@01 y@191@01 z@192@01) zs2@60@01)))))
    (or
      (Set_in (inv_1_1<Ref> x@190@01 y@191@01 z@192@01) ys2@49@01)
      (not (Set_in (inv_1_1<Ref> x@190@01 y@191@01 z@192@01) ys2@49@01))))))
(assert (or
  (Set_in (inv_1_0<Ref> x@190@01 y@191@01 z@192@01) xs2@38@01)
  (not (Set_in (inv_1_0<Ref> x@190@01 y@191@01 z@192@01) xs2@38@01))))
; [eval] (inv_2_0(x, y, z) in xs3) && ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) && (x == x && y == y && z == z)
; [eval] (inv_2_0(x, y, z) in xs3)
; [eval] inv_2_0(x, y, z)
(push) ; 6
; [then-branch: 221 | !(inv_2_0[Ref](x@190@01, y@191@01, z@192@01) in xs3@39@01) | live]
; [else-branch: 221 | inv_2_0[Ref](x@190@01, y@191@01, z@192@01) in xs3@39@01 | live]
(push) ; 7
; [then-branch: 221 | !(inv_2_0[Ref](x@190@01, y@191@01, z@192@01) in xs3@39@01)]
(assert (not (Set_in (inv_2_0<Ref> x@190@01 y@191@01 z@192@01) xs3@39@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 221 | inv_2_0[Ref](x@190@01, y@191@01, z@192@01) in xs3@39@01]
(assert (Set_in (inv_2_0<Ref> x@190@01 y@191@01 z@192@01) xs3@39@01))
; [eval] (inv_2_1(x, y, z) in ys3)
; [eval] inv_2_1(x, y, z)
(push) ; 8
; [then-branch: 222 | !(inv_2_1[Ref](x@190@01, y@191@01, z@192@01) in ys3@50@01) | live]
; [else-branch: 222 | inv_2_1[Ref](x@190@01, y@191@01, z@192@01) in ys3@50@01 | live]
(push) ; 9
; [then-branch: 222 | !(inv_2_1[Ref](x@190@01, y@191@01, z@192@01) in ys3@50@01)]
(assert (not (Set_in (inv_2_1<Ref> x@190@01 y@191@01 z@192@01) ys3@50@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 222 | inv_2_1[Ref](x@190@01, y@191@01, z@192@01) in ys3@50@01]
(assert (Set_in (inv_2_1<Ref> x@190@01 y@191@01 z@192@01) ys3@50@01))
; [eval] (inv_2_2(x, y, z) in zs3)
; [eval] inv_2_2(x, y, z)
(push) ; 10
; [then-branch: 223 | !(inv_2_2[Ref](x@190@01, y@191@01, z@192@01) in zs3@61@01) | live]
; [else-branch: 223 | inv_2_2[Ref](x@190@01, y@191@01, z@192@01) in zs3@61@01 | live]
(push) ; 11
; [then-branch: 223 | !(inv_2_2[Ref](x@190@01, y@191@01, z@192@01) in zs3@61@01)]
(assert (not (Set_in (inv_2_2<Ref> x@190@01 y@191@01 z@192@01) zs3@61@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 223 | inv_2_2[Ref](x@190@01, y@191@01, z@192@01) in zs3@61@01]
(assert (Set_in (inv_2_2<Ref> x@190@01 y@191@01 z@192@01) zs3@61@01))
; [eval] x == x
(push) ; 12
; [then-branch: 224 | False | live]
; [else-branch: 224 | True | live]
(push) ; 13
; [then-branch: 224 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 224 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 225 | False | live]
; [else-branch: 225 | True | live]
(push) ; 15
; [then-branch: 225 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 225 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_2_2<Ref> x@190@01 y@191@01 z@192@01) zs3@61@01)
  (not (Set_in (inv_2_2<Ref> x@190@01 y@191@01 z@192@01) zs3@61@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_2_1<Ref> x@190@01 y@191@01 z@192@01) ys3@50@01)
  (and
    (Set_in (inv_2_1<Ref> x@190@01 y@191@01 z@192@01) ys3@50@01)
    (or
      (Set_in (inv_2_2<Ref> x@190@01 y@191@01 z@192@01) zs3@61@01)
      (not (Set_in (inv_2_2<Ref> x@190@01 y@191@01 z@192@01) zs3@61@01))))))
(assert (or
  (Set_in (inv_2_1<Ref> x@190@01 y@191@01 z@192@01) ys3@50@01)
  (not (Set_in (inv_2_1<Ref> x@190@01 y@191@01 z@192@01) ys3@50@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_2_0<Ref> x@190@01 y@191@01 z@192@01) xs3@39@01)
  (and
    (Set_in (inv_2_0<Ref> x@190@01 y@191@01 z@192@01) xs3@39@01)
    (=>
      (Set_in (inv_2_1<Ref> x@190@01 y@191@01 z@192@01) ys3@50@01)
      (and
        (Set_in (inv_2_1<Ref> x@190@01 y@191@01 z@192@01) ys3@50@01)
        (or
          (Set_in (inv_2_2<Ref> x@190@01 y@191@01 z@192@01) zs3@61@01)
          (not (Set_in (inv_2_2<Ref> x@190@01 y@191@01 z@192@01) zs3@61@01)))))
    (or
      (Set_in (inv_2_1<Ref> x@190@01 y@191@01 z@192@01) ys3@50@01)
      (not (Set_in (inv_2_1<Ref> x@190@01 y@191@01 z@192@01) ys3@50@01))))))
(assert (or
  (Set_in (inv_2_0<Ref> x@190@01 y@191@01 z@192@01) xs3@39@01)
  (not (Set_in (inv_2_0<Ref> x@190@01 y@191@01 z@192@01) xs3@39@01))))
; [eval] (inv_3_0(x, y, z) in xs4) && ((inv_3_1(x, y, z) in ys4) && (inv_3_2(x, y, z) in zs4)) && (x == x && y == y && z == z)
; [eval] (inv_3_0(x, y, z) in xs4)
; [eval] inv_3_0(x, y, z)
(push) ; 6
; [then-branch: 226 | !(inv_3_0[Ref](x@190@01, y@191@01, z@192@01) in xs4@40@01) | live]
; [else-branch: 226 | inv_3_0[Ref](x@190@01, y@191@01, z@192@01) in xs4@40@01 | live]
(push) ; 7
; [then-branch: 226 | !(inv_3_0[Ref](x@190@01, y@191@01, z@192@01) in xs4@40@01)]
(assert (not (Set_in (inv_3_0<Ref> x@190@01 y@191@01 z@192@01) xs4@40@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 226 | inv_3_0[Ref](x@190@01, y@191@01, z@192@01) in xs4@40@01]
(assert (Set_in (inv_3_0<Ref> x@190@01 y@191@01 z@192@01) xs4@40@01))
; [eval] (inv_3_1(x, y, z) in ys4)
; [eval] inv_3_1(x, y, z)
(push) ; 8
; [then-branch: 227 | !(inv_3_1[Ref](x@190@01, y@191@01, z@192@01) in ys4@51@01) | live]
; [else-branch: 227 | inv_3_1[Ref](x@190@01, y@191@01, z@192@01) in ys4@51@01 | live]
(push) ; 9
; [then-branch: 227 | !(inv_3_1[Ref](x@190@01, y@191@01, z@192@01) in ys4@51@01)]
(assert (not (Set_in (inv_3_1<Ref> x@190@01 y@191@01 z@192@01) ys4@51@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 227 | inv_3_1[Ref](x@190@01, y@191@01, z@192@01) in ys4@51@01]
(assert (Set_in (inv_3_1<Ref> x@190@01 y@191@01 z@192@01) ys4@51@01))
; [eval] (inv_3_2(x, y, z) in zs4)
; [eval] inv_3_2(x, y, z)
(push) ; 10
; [then-branch: 228 | !(inv_3_2[Ref](x@190@01, y@191@01, z@192@01) in zs4@62@01) | live]
; [else-branch: 228 | inv_3_2[Ref](x@190@01, y@191@01, z@192@01) in zs4@62@01 | live]
(push) ; 11
; [then-branch: 228 | !(inv_3_2[Ref](x@190@01, y@191@01, z@192@01) in zs4@62@01)]
(assert (not (Set_in (inv_3_2<Ref> x@190@01 y@191@01 z@192@01) zs4@62@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 228 | inv_3_2[Ref](x@190@01, y@191@01, z@192@01) in zs4@62@01]
(assert (Set_in (inv_3_2<Ref> x@190@01 y@191@01 z@192@01) zs4@62@01))
; [eval] x == x
(push) ; 12
; [then-branch: 229 | False | live]
; [else-branch: 229 | True | live]
(push) ; 13
; [then-branch: 229 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 229 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 230 | False | live]
; [else-branch: 230 | True | live]
(push) ; 15
; [then-branch: 230 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 230 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_3_2<Ref> x@190@01 y@191@01 z@192@01) zs4@62@01)
  (not (Set_in (inv_3_2<Ref> x@190@01 y@191@01 z@192@01) zs4@62@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_3_1<Ref> x@190@01 y@191@01 z@192@01) ys4@51@01)
  (and
    (Set_in (inv_3_1<Ref> x@190@01 y@191@01 z@192@01) ys4@51@01)
    (or
      (Set_in (inv_3_2<Ref> x@190@01 y@191@01 z@192@01) zs4@62@01)
      (not (Set_in (inv_3_2<Ref> x@190@01 y@191@01 z@192@01) zs4@62@01))))))
(assert (or
  (Set_in (inv_3_1<Ref> x@190@01 y@191@01 z@192@01) ys4@51@01)
  (not (Set_in (inv_3_1<Ref> x@190@01 y@191@01 z@192@01) ys4@51@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_3_0<Ref> x@190@01 y@191@01 z@192@01) xs4@40@01)
  (and
    (Set_in (inv_3_0<Ref> x@190@01 y@191@01 z@192@01) xs4@40@01)
    (=>
      (Set_in (inv_3_1<Ref> x@190@01 y@191@01 z@192@01) ys4@51@01)
      (and
        (Set_in (inv_3_1<Ref> x@190@01 y@191@01 z@192@01) ys4@51@01)
        (or
          (Set_in (inv_3_2<Ref> x@190@01 y@191@01 z@192@01) zs4@62@01)
          (not (Set_in (inv_3_2<Ref> x@190@01 y@191@01 z@192@01) zs4@62@01)))))
    (or
      (Set_in (inv_3_1<Ref> x@190@01 y@191@01 z@192@01) ys4@51@01)
      (not (Set_in (inv_3_1<Ref> x@190@01 y@191@01 z@192@01) ys4@51@01))))))
(assert (or
  (Set_in (inv_3_0<Ref> x@190@01 y@191@01 z@192@01) xs4@40@01)
  (not (Set_in (inv_3_0<Ref> x@190@01 y@191@01 z@192@01) xs4@40@01))))
; [eval] (inv_4_0(x, y, z) in xs5) && ((inv_4_1(x, y, z) in ys5) && (inv_4_2(x, y, z) in zs5)) && (x == x && y == y && z == z)
; [eval] (inv_4_0(x, y, z) in xs5)
; [eval] inv_4_0(x, y, z)
(push) ; 6
; [then-branch: 231 | !(inv_4_0[Ref](x@190@01, y@191@01, z@192@01) in xs5@41@01) | live]
; [else-branch: 231 | inv_4_0[Ref](x@190@01, y@191@01, z@192@01) in xs5@41@01 | live]
(push) ; 7
; [then-branch: 231 | !(inv_4_0[Ref](x@190@01, y@191@01, z@192@01) in xs5@41@01)]
(assert (not (Set_in (inv_4_0<Ref> x@190@01 y@191@01 z@192@01) xs5@41@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 231 | inv_4_0[Ref](x@190@01, y@191@01, z@192@01) in xs5@41@01]
(assert (Set_in (inv_4_0<Ref> x@190@01 y@191@01 z@192@01) xs5@41@01))
; [eval] (inv_4_1(x, y, z) in ys5)
; [eval] inv_4_1(x, y, z)
(push) ; 8
; [then-branch: 232 | !(inv_4_1[Ref](x@190@01, y@191@01, z@192@01) in ys5@52@01) | live]
; [else-branch: 232 | inv_4_1[Ref](x@190@01, y@191@01, z@192@01) in ys5@52@01 | live]
(push) ; 9
; [then-branch: 232 | !(inv_4_1[Ref](x@190@01, y@191@01, z@192@01) in ys5@52@01)]
(assert (not (Set_in (inv_4_1<Ref> x@190@01 y@191@01 z@192@01) ys5@52@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 232 | inv_4_1[Ref](x@190@01, y@191@01, z@192@01) in ys5@52@01]
(assert (Set_in (inv_4_1<Ref> x@190@01 y@191@01 z@192@01) ys5@52@01))
; [eval] (inv_4_2(x, y, z) in zs5)
; [eval] inv_4_2(x, y, z)
(push) ; 10
; [then-branch: 233 | !(inv_4_2[Ref](x@190@01, y@191@01, z@192@01) in zs5@63@01) | live]
; [else-branch: 233 | inv_4_2[Ref](x@190@01, y@191@01, z@192@01) in zs5@63@01 | live]
(push) ; 11
; [then-branch: 233 | !(inv_4_2[Ref](x@190@01, y@191@01, z@192@01) in zs5@63@01)]
(assert (not (Set_in (inv_4_2<Ref> x@190@01 y@191@01 z@192@01) zs5@63@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 233 | inv_4_2[Ref](x@190@01, y@191@01, z@192@01) in zs5@63@01]
(assert (Set_in (inv_4_2<Ref> x@190@01 y@191@01 z@192@01) zs5@63@01))
; [eval] x == x
(push) ; 12
; [then-branch: 234 | False | live]
; [else-branch: 234 | True | live]
(push) ; 13
; [then-branch: 234 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 234 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 235 | False | live]
; [else-branch: 235 | True | live]
(push) ; 15
; [then-branch: 235 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 235 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_4_2<Ref> x@190@01 y@191@01 z@192@01) zs5@63@01)
  (not (Set_in (inv_4_2<Ref> x@190@01 y@191@01 z@192@01) zs5@63@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_4_1<Ref> x@190@01 y@191@01 z@192@01) ys5@52@01)
  (and
    (Set_in (inv_4_1<Ref> x@190@01 y@191@01 z@192@01) ys5@52@01)
    (or
      (Set_in (inv_4_2<Ref> x@190@01 y@191@01 z@192@01) zs5@63@01)
      (not (Set_in (inv_4_2<Ref> x@190@01 y@191@01 z@192@01) zs5@63@01))))))
(assert (or
  (Set_in (inv_4_1<Ref> x@190@01 y@191@01 z@192@01) ys5@52@01)
  (not (Set_in (inv_4_1<Ref> x@190@01 y@191@01 z@192@01) ys5@52@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_4_0<Ref> x@190@01 y@191@01 z@192@01) xs5@41@01)
  (and
    (Set_in (inv_4_0<Ref> x@190@01 y@191@01 z@192@01) xs5@41@01)
    (=>
      (Set_in (inv_4_1<Ref> x@190@01 y@191@01 z@192@01) ys5@52@01)
      (and
        (Set_in (inv_4_1<Ref> x@190@01 y@191@01 z@192@01) ys5@52@01)
        (or
          (Set_in (inv_4_2<Ref> x@190@01 y@191@01 z@192@01) zs5@63@01)
          (not (Set_in (inv_4_2<Ref> x@190@01 y@191@01 z@192@01) zs5@63@01)))))
    (or
      (Set_in (inv_4_1<Ref> x@190@01 y@191@01 z@192@01) ys5@52@01)
      (not (Set_in (inv_4_1<Ref> x@190@01 y@191@01 z@192@01) ys5@52@01))))))
(assert (or
  (Set_in (inv_4_0<Ref> x@190@01 y@191@01 z@192@01) xs5@41@01)
  (not (Set_in (inv_4_0<Ref> x@190@01 y@191@01 z@192@01) xs5@41@01))))
; [eval] (inv_5_0(x, y, z) in xs6) && ((inv_5_1(x, y, z) in ys6) && (inv_5_2(x, y, z) in zs6)) && (x == x && y == y && z == z)
; [eval] (inv_5_0(x, y, z) in xs6)
; [eval] inv_5_0(x, y, z)
(push) ; 6
; [then-branch: 236 | !(inv_5_0[Ref](x@190@01, y@191@01, z@192@01) in xs6@42@01) | live]
; [else-branch: 236 | inv_5_0[Ref](x@190@01, y@191@01, z@192@01) in xs6@42@01 | live]
(push) ; 7
; [then-branch: 236 | !(inv_5_0[Ref](x@190@01, y@191@01, z@192@01) in xs6@42@01)]
(assert (not (Set_in (inv_5_0<Ref> x@190@01 y@191@01 z@192@01) xs6@42@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 236 | inv_5_0[Ref](x@190@01, y@191@01, z@192@01) in xs6@42@01]
(assert (Set_in (inv_5_0<Ref> x@190@01 y@191@01 z@192@01) xs6@42@01))
; [eval] (inv_5_1(x, y, z) in ys6)
; [eval] inv_5_1(x, y, z)
(push) ; 8
; [then-branch: 237 | !(inv_5_1[Ref](x@190@01, y@191@01, z@192@01) in ys6@53@01) | live]
; [else-branch: 237 | inv_5_1[Ref](x@190@01, y@191@01, z@192@01) in ys6@53@01 | live]
(push) ; 9
; [then-branch: 237 | !(inv_5_1[Ref](x@190@01, y@191@01, z@192@01) in ys6@53@01)]
(assert (not (Set_in (inv_5_1<Ref> x@190@01 y@191@01 z@192@01) ys6@53@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 237 | inv_5_1[Ref](x@190@01, y@191@01, z@192@01) in ys6@53@01]
(assert (Set_in (inv_5_1<Ref> x@190@01 y@191@01 z@192@01) ys6@53@01))
; [eval] (inv_5_2(x, y, z) in zs6)
; [eval] inv_5_2(x, y, z)
(push) ; 10
; [then-branch: 238 | !(inv_5_2[Ref](x@190@01, y@191@01, z@192@01) in zs6@64@01) | live]
; [else-branch: 238 | inv_5_2[Ref](x@190@01, y@191@01, z@192@01) in zs6@64@01 | live]
(push) ; 11
; [then-branch: 238 | !(inv_5_2[Ref](x@190@01, y@191@01, z@192@01) in zs6@64@01)]
(assert (not (Set_in (inv_5_2<Ref> x@190@01 y@191@01 z@192@01) zs6@64@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 238 | inv_5_2[Ref](x@190@01, y@191@01, z@192@01) in zs6@64@01]
(assert (Set_in (inv_5_2<Ref> x@190@01 y@191@01 z@192@01) zs6@64@01))
; [eval] x == x
(push) ; 12
; [then-branch: 239 | False | live]
; [else-branch: 239 | True | live]
(push) ; 13
; [then-branch: 239 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 239 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 240 | False | live]
; [else-branch: 240 | True | live]
(push) ; 15
; [then-branch: 240 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 240 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_5_2<Ref> x@190@01 y@191@01 z@192@01) zs6@64@01)
  (not (Set_in (inv_5_2<Ref> x@190@01 y@191@01 z@192@01) zs6@64@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_5_1<Ref> x@190@01 y@191@01 z@192@01) ys6@53@01)
  (and
    (Set_in (inv_5_1<Ref> x@190@01 y@191@01 z@192@01) ys6@53@01)
    (or
      (Set_in (inv_5_2<Ref> x@190@01 y@191@01 z@192@01) zs6@64@01)
      (not (Set_in (inv_5_2<Ref> x@190@01 y@191@01 z@192@01) zs6@64@01))))))
(assert (or
  (Set_in (inv_5_1<Ref> x@190@01 y@191@01 z@192@01) ys6@53@01)
  (not (Set_in (inv_5_1<Ref> x@190@01 y@191@01 z@192@01) ys6@53@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_5_0<Ref> x@190@01 y@191@01 z@192@01) xs6@42@01)
  (and
    (Set_in (inv_5_0<Ref> x@190@01 y@191@01 z@192@01) xs6@42@01)
    (=>
      (Set_in (inv_5_1<Ref> x@190@01 y@191@01 z@192@01) ys6@53@01)
      (and
        (Set_in (inv_5_1<Ref> x@190@01 y@191@01 z@192@01) ys6@53@01)
        (or
          (Set_in (inv_5_2<Ref> x@190@01 y@191@01 z@192@01) zs6@64@01)
          (not (Set_in (inv_5_2<Ref> x@190@01 y@191@01 z@192@01) zs6@64@01)))))
    (or
      (Set_in (inv_5_1<Ref> x@190@01 y@191@01 z@192@01) ys6@53@01)
      (not (Set_in (inv_5_1<Ref> x@190@01 y@191@01 z@192@01) ys6@53@01))))))
(assert (or
  (Set_in (inv_5_0<Ref> x@190@01 y@191@01 z@192@01) xs6@42@01)
  (not (Set_in (inv_5_0<Ref> x@190@01 y@191@01 z@192@01) xs6@42@01))))
; [eval] (inv_6_0(x, y, z) in xs7) && ((inv_6_1(x, y, z) in ys7) && (inv_6_2(x, y, z) in zs7)) && (x == x && y == y && z == z)
; [eval] (inv_6_0(x, y, z) in xs7)
; [eval] inv_6_0(x, y, z)
(push) ; 6
; [then-branch: 241 | !(inv_6_0[Ref](x@190@01, y@191@01, z@192@01) in xs7@43@01) | live]
; [else-branch: 241 | inv_6_0[Ref](x@190@01, y@191@01, z@192@01) in xs7@43@01 | live]
(push) ; 7
; [then-branch: 241 | !(inv_6_0[Ref](x@190@01, y@191@01, z@192@01) in xs7@43@01)]
(assert (not (Set_in (inv_6_0<Ref> x@190@01 y@191@01 z@192@01) xs7@43@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 241 | inv_6_0[Ref](x@190@01, y@191@01, z@192@01) in xs7@43@01]
(assert (Set_in (inv_6_0<Ref> x@190@01 y@191@01 z@192@01) xs7@43@01))
; [eval] (inv_6_1(x, y, z) in ys7)
; [eval] inv_6_1(x, y, z)
(push) ; 8
; [then-branch: 242 | !(inv_6_1[Ref](x@190@01, y@191@01, z@192@01) in ys7@54@01) | live]
; [else-branch: 242 | inv_6_1[Ref](x@190@01, y@191@01, z@192@01) in ys7@54@01 | live]
(push) ; 9
; [then-branch: 242 | !(inv_6_1[Ref](x@190@01, y@191@01, z@192@01) in ys7@54@01)]
(assert (not (Set_in (inv_6_1<Ref> x@190@01 y@191@01 z@192@01) ys7@54@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 242 | inv_6_1[Ref](x@190@01, y@191@01, z@192@01) in ys7@54@01]
(assert (Set_in (inv_6_1<Ref> x@190@01 y@191@01 z@192@01) ys7@54@01))
; [eval] (inv_6_2(x, y, z) in zs7)
; [eval] inv_6_2(x, y, z)
(push) ; 10
; [then-branch: 243 | !(inv_6_2[Ref](x@190@01, y@191@01, z@192@01) in zs7@65@01) | live]
; [else-branch: 243 | inv_6_2[Ref](x@190@01, y@191@01, z@192@01) in zs7@65@01 | live]
(push) ; 11
; [then-branch: 243 | !(inv_6_2[Ref](x@190@01, y@191@01, z@192@01) in zs7@65@01)]
(assert (not (Set_in (inv_6_2<Ref> x@190@01 y@191@01 z@192@01) zs7@65@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 243 | inv_6_2[Ref](x@190@01, y@191@01, z@192@01) in zs7@65@01]
(assert (Set_in (inv_6_2<Ref> x@190@01 y@191@01 z@192@01) zs7@65@01))
; [eval] x == x
(push) ; 12
; [then-branch: 244 | False | live]
; [else-branch: 244 | True | live]
(push) ; 13
; [then-branch: 244 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 244 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 245 | False | live]
; [else-branch: 245 | True | live]
(push) ; 15
; [then-branch: 245 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 245 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_6_2<Ref> x@190@01 y@191@01 z@192@01) zs7@65@01)
  (not (Set_in (inv_6_2<Ref> x@190@01 y@191@01 z@192@01) zs7@65@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_6_1<Ref> x@190@01 y@191@01 z@192@01) ys7@54@01)
  (and
    (Set_in (inv_6_1<Ref> x@190@01 y@191@01 z@192@01) ys7@54@01)
    (or
      (Set_in (inv_6_2<Ref> x@190@01 y@191@01 z@192@01) zs7@65@01)
      (not (Set_in (inv_6_2<Ref> x@190@01 y@191@01 z@192@01) zs7@65@01))))))
(assert (or
  (Set_in (inv_6_1<Ref> x@190@01 y@191@01 z@192@01) ys7@54@01)
  (not (Set_in (inv_6_1<Ref> x@190@01 y@191@01 z@192@01) ys7@54@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_6_0<Ref> x@190@01 y@191@01 z@192@01) xs7@43@01)
  (and
    (Set_in (inv_6_0<Ref> x@190@01 y@191@01 z@192@01) xs7@43@01)
    (=>
      (Set_in (inv_6_1<Ref> x@190@01 y@191@01 z@192@01) ys7@54@01)
      (and
        (Set_in (inv_6_1<Ref> x@190@01 y@191@01 z@192@01) ys7@54@01)
        (or
          (Set_in (inv_6_2<Ref> x@190@01 y@191@01 z@192@01) zs7@65@01)
          (not (Set_in (inv_6_2<Ref> x@190@01 y@191@01 z@192@01) zs7@65@01)))))
    (or
      (Set_in (inv_6_1<Ref> x@190@01 y@191@01 z@192@01) ys7@54@01)
      (not (Set_in (inv_6_1<Ref> x@190@01 y@191@01 z@192@01) ys7@54@01))))))
(assert (or
  (Set_in (inv_6_0<Ref> x@190@01 y@191@01 z@192@01) xs7@43@01)
  (not (Set_in (inv_6_0<Ref> x@190@01 y@191@01 z@192@01) xs7@43@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 210 | !(inv_7_0[Ref](x@190@01, y@191@01, z@192@01) in xs8@44@01 && inv_7_1[Ref](x@190@01, y@191@01, z@192@01) in ys8@55@01 && inv_7_2[Ref](x@190@01, y@191@01, z@192@01) in zs8@66@01)]
(assert (not
  (and
    (Set_in (inv_7_0<Ref> x@190@01 y@191@01 z@192@01) xs8@44@01)
    (and
      (Set_in (inv_7_1<Ref> x@190@01 y@191@01 z@192@01) ys8@55@01)
      (Set_in (inv_7_2<Ref> x@190@01 y@191@01 z@192@01) zs8@66@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (=
    ($PSF.perm_p (as pm@193@01  $PPM) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    (ite
      (and
        (and (img@83@01 x y z) (img@85@01 x y z) (img@87@01 x y z))
        (and
          (Set_in (inv@82@01 x y z) xs@70@01)
          (and
            (Set_in (inv@84@01 x y z) ys@71@01)
            (Set_in (inv@86@01 x y z) zs@72@01))))
      q@73@01
      $Perm.No))
  :pattern (($PSF.perm_p (as pm@193@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resPrmSumDef16|)))
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (and
    ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    ($PSF.loc_p ($PSF.lookup_p $t@81@01 ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))))
  :pattern (($PSF.perm_p (as pm@193@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resTrgDef17|)))
(assert (=>
  (and
    (Set_in (inv_7_0<Ref> x@190@01 y@191@01 z@192@01) xs8@44@01)
    (and
      (Set_in (inv_7_1<Ref> x@190@01 y@191@01 z@192@01) ys8@55@01)
      (Set_in (inv_7_2<Ref> x@190@01 y@191@01 z@192@01) zs8@66@01)))
  (and
    (Set_in (inv_7_0<Ref> x@190@01 y@191@01 z@192@01) xs8@44@01)
    (Set_in (inv_7_1<Ref> x@190@01 y@191@01 z@192@01) ys8@55@01)
    (Set_in (inv_7_2<Ref> x@190@01 y@191@01 z@192@01) zs8@66@01)
    ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x@190@01)
        ($SortWrappers.$RefTo$Snap y@191@01))
      ($SortWrappers.$RefTo$Snap z@192@01))) ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x@190@01)
        ($SortWrappers.$RefTo$Snap y@191@01))
      ($SortWrappers.$RefTo$Snap z@192@01)))
    (=>
      (Set_in (inv_0_0<Ref> x@190@01 y@191@01 z@192@01) xs1@37@01)
      (and
        (Set_in (inv_0_0<Ref> x@190@01 y@191@01 z@192@01) xs1@37@01)
        (=>
          (Set_in (inv_0_1<Ref> x@190@01 y@191@01 z@192@01) ys1@48@01)
          (and
            (Set_in (inv_0_1<Ref> x@190@01 y@191@01 z@192@01) ys1@48@01)
            (or
              (Set_in (inv_0_2<Ref> x@190@01 y@191@01 z@192@01) zs1@59@01)
              (not (Set_in (inv_0_2<Ref> x@190@01 y@191@01 z@192@01) zs1@59@01)))))
        (or
          (Set_in (inv_0_1<Ref> x@190@01 y@191@01 z@192@01) ys1@48@01)
          (not (Set_in (inv_0_1<Ref> x@190@01 y@191@01 z@192@01) ys1@48@01)))))
    (or
      (Set_in (inv_0_0<Ref> x@190@01 y@191@01 z@192@01) xs1@37@01)
      (not (Set_in (inv_0_0<Ref> x@190@01 y@191@01 z@192@01) xs1@37@01)))
    (=>
      (Set_in (inv_1_0<Ref> x@190@01 y@191@01 z@192@01) xs2@38@01)
      (and
        (Set_in (inv_1_0<Ref> x@190@01 y@191@01 z@192@01) xs2@38@01)
        (=>
          (Set_in (inv_1_1<Ref> x@190@01 y@191@01 z@192@01) ys2@49@01)
          (and
            (Set_in (inv_1_1<Ref> x@190@01 y@191@01 z@192@01) ys2@49@01)
            (or
              (Set_in (inv_1_2<Ref> x@190@01 y@191@01 z@192@01) zs2@60@01)
              (not (Set_in (inv_1_2<Ref> x@190@01 y@191@01 z@192@01) zs2@60@01)))))
        (or
          (Set_in (inv_1_1<Ref> x@190@01 y@191@01 z@192@01) ys2@49@01)
          (not (Set_in (inv_1_1<Ref> x@190@01 y@191@01 z@192@01) ys2@49@01)))))
    (or
      (Set_in (inv_1_0<Ref> x@190@01 y@191@01 z@192@01) xs2@38@01)
      (not (Set_in (inv_1_0<Ref> x@190@01 y@191@01 z@192@01) xs2@38@01)))
    (=>
      (Set_in (inv_2_0<Ref> x@190@01 y@191@01 z@192@01) xs3@39@01)
      (and
        (Set_in (inv_2_0<Ref> x@190@01 y@191@01 z@192@01) xs3@39@01)
        (=>
          (Set_in (inv_2_1<Ref> x@190@01 y@191@01 z@192@01) ys3@50@01)
          (and
            (Set_in (inv_2_1<Ref> x@190@01 y@191@01 z@192@01) ys3@50@01)
            (or
              (Set_in (inv_2_2<Ref> x@190@01 y@191@01 z@192@01) zs3@61@01)
              (not (Set_in (inv_2_2<Ref> x@190@01 y@191@01 z@192@01) zs3@61@01)))))
        (or
          (Set_in (inv_2_1<Ref> x@190@01 y@191@01 z@192@01) ys3@50@01)
          (not (Set_in (inv_2_1<Ref> x@190@01 y@191@01 z@192@01) ys3@50@01)))))
    (or
      (Set_in (inv_2_0<Ref> x@190@01 y@191@01 z@192@01) xs3@39@01)
      (not (Set_in (inv_2_0<Ref> x@190@01 y@191@01 z@192@01) xs3@39@01)))
    (=>
      (Set_in (inv_3_0<Ref> x@190@01 y@191@01 z@192@01) xs4@40@01)
      (and
        (Set_in (inv_3_0<Ref> x@190@01 y@191@01 z@192@01) xs4@40@01)
        (=>
          (Set_in (inv_3_1<Ref> x@190@01 y@191@01 z@192@01) ys4@51@01)
          (and
            (Set_in (inv_3_1<Ref> x@190@01 y@191@01 z@192@01) ys4@51@01)
            (or
              (Set_in (inv_3_2<Ref> x@190@01 y@191@01 z@192@01) zs4@62@01)
              (not (Set_in (inv_3_2<Ref> x@190@01 y@191@01 z@192@01) zs4@62@01)))))
        (or
          (Set_in (inv_3_1<Ref> x@190@01 y@191@01 z@192@01) ys4@51@01)
          (not (Set_in (inv_3_1<Ref> x@190@01 y@191@01 z@192@01) ys4@51@01)))))
    (or
      (Set_in (inv_3_0<Ref> x@190@01 y@191@01 z@192@01) xs4@40@01)
      (not (Set_in (inv_3_0<Ref> x@190@01 y@191@01 z@192@01) xs4@40@01)))
    (=>
      (Set_in (inv_4_0<Ref> x@190@01 y@191@01 z@192@01) xs5@41@01)
      (and
        (Set_in (inv_4_0<Ref> x@190@01 y@191@01 z@192@01) xs5@41@01)
        (=>
          (Set_in (inv_4_1<Ref> x@190@01 y@191@01 z@192@01) ys5@52@01)
          (and
            (Set_in (inv_4_1<Ref> x@190@01 y@191@01 z@192@01) ys5@52@01)
            (or
              (Set_in (inv_4_2<Ref> x@190@01 y@191@01 z@192@01) zs5@63@01)
              (not (Set_in (inv_4_2<Ref> x@190@01 y@191@01 z@192@01) zs5@63@01)))))
        (or
          (Set_in (inv_4_1<Ref> x@190@01 y@191@01 z@192@01) ys5@52@01)
          (not (Set_in (inv_4_1<Ref> x@190@01 y@191@01 z@192@01) ys5@52@01)))))
    (or
      (Set_in (inv_4_0<Ref> x@190@01 y@191@01 z@192@01) xs5@41@01)
      (not (Set_in (inv_4_0<Ref> x@190@01 y@191@01 z@192@01) xs5@41@01)))
    (=>
      (Set_in (inv_5_0<Ref> x@190@01 y@191@01 z@192@01) xs6@42@01)
      (and
        (Set_in (inv_5_0<Ref> x@190@01 y@191@01 z@192@01) xs6@42@01)
        (=>
          (Set_in (inv_5_1<Ref> x@190@01 y@191@01 z@192@01) ys6@53@01)
          (and
            (Set_in (inv_5_1<Ref> x@190@01 y@191@01 z@192@01) ys6@53@01)
            (or
              (Set_in (inv_5_2<Ref> x@190@01 y@191@01 z@192@01) zs6@64@01)
              (not (Set_in (inv_5_2<Ref> x@190@01 y@191@01 z@192@01) zs6@64@01)))))
        (or
          (Set_in (inv_5_1<Ref> x@190@01 y@191@01 z@192@01) ys6@53@01)
          (not (Set_in (inv_5_1<Ref> x@190@01 y@191@01 z@192@01) ys6@53@01)))))
    (or
      (Set_in (inv_5_0<Ref> x@190@01 y@191@01 z@192@01) xs6@42@01)
      (not (Set_in (inv_5_0<Ref> x@190@01 y@191@01 z@192@01) xs6@42@01)))
    (=>
      (Set_in (inv_6_0<Ref> x@190@01 y@191@01 z@192@01) xs7@43@01)
      (and
        (Set_in (inv_6_0<Ref> x@190@01 y@191@01 z@192@01) xs7@43@01)
        (=>
          (Set_in (inv_6_1<Ref> x@190@01 y@191@01 z@192@01) ys7@54@01)
          (and
            (Set_in (inv_6_1<Ref> x@190@01 y@191@01 z@192@01) ys7@54@01)
            (or
              (Set_in (inv_6_2<Ref> x@190@01 y@191@01 z@192@01) zs7@65@01)
              (not (Set_in (inv_6_2<Ref> x@190@01 y@191@01 z@192@01) zs7@65@01)))))
        (or
          (Set_in (inv_6_1<Ref> x@190@01 y@191@01 z@192@01) ys7@54@01)
          (not (Set_in (inv_6_1<Ref> x@190@01 y@191@01 z@192@01) ys7@54@01)))))
    (or
      (Set_in (inv_6_0<Ref> x@190@01 y@191@01 z@192@01) xs7@43@01)
      (not (Set_in (inv_6_0<Ref> x@190@01 y@191@01 z@192@01) xs7@43@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in (inv_7_0<Ref> x@190@01 y@191@01 z@192@01) xs8@44@01)
      (and
        (Set_in (inv_7_1<Ref> x@190@01 y@191@01 z@192@01) ys8@55@01)
        (Set_in (inv_7_2<Ref> x@190@01 y@191@01 z@192@01) zs8@66@01))))
  (and
    (Set_in (inv_7_0<Ref> x@190@01 y@191@01 z@192@01) xs8@44@01)
    (and
      (Set_in (inv_7_1<Ref> x@190@01 y@191@01 z@192@01) ys8@55@01)
      (Set_in (inv_7_2<Ref> x@190@01 y@191@01 z@192@01) zs8@66@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (=
    ($PSF.perm_p (as pm@193@01  $PPM) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    (ite
      (and
        (and (img@83@01 x y z) (img@85@01 x y z) (img@87@01 x y z))
        (and
          (Set_in (inv@82@01 x y z) xs@70@01)
          (and
            (Set_in (inv@84@01 x y z) ys@71@01)
            (Set_in (inv@86@01 x y z) zs@72@01))))
      q@73@01
      $Perm.No))
  :pattern (($PSF.perm_p (as pm@193@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resPrmSumDef16|)))
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (and
    ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    ($PSF.loc_p ($PSF.lookup_p $t@81@01 ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))))
  :pattern (($PSF.perm_p (as pm@193@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resTrgDef17|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@190@01 $Ref) (y@191@01 $Ref) (z@192@01 $Ref)) (!
  (and
    (=>
      (Set_in (inv_7_0<Ref> x@190@01 y@191@01 z@192@01) xs8@44@01)
      (and
        (Set_in (inv_7_0<Ref> x@190@01 y@191@01 z@192@01) xs8@44@01)
        (or
          (Set_in (inv_7_1<Ref> x@190@01 y@191@01 z@192@01) ys8@55@01)
          (not (Set_in (inv_7_1<Ref> x@190@01 y@191@01 z@192@01) ys8@55@01)))))
    (or
      (Set_in (inv_7_0<Ref> x@190@01 y@191@01 z@192@01) xs8@44@01)
      (not (Set_in (inv_7_0<Ref> x@190@01 y@191@01 z@192@01) xs8@44@01)))
    (=>
      (and
        (Set_in (inv_7_0<Ref> x@190@01 y@191@01 z@192@01) xs8@44@01)
        (and
          (Set_in (inv_7_1<Ref> x@190@01 y@191@01 z@192@01) ys8@55@01)
          (Set_in (inv_7_2<Ref> x@190@01 y@191@01 z@192@01) zs8@66@01)))
      (and
        (Set_in (inv_7_0<Ref> x@190@01 y@191@01 z@192@01) xs8@44@01)
        (Set_in (inv_7_1<Ref> x@190@01 y@191@01 z@192@01) ys8@55@01)
        (Set_in (inv_7_2<Ref> x@190@01 y@191@01 z@192@01) zs8@66@01)
        ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap x@190@01)
            ($SortWrappers.$RefTo$Snap y@191@01))
          ($SortWrappers.$RefTo$Snap z@192@01))) ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap x@190@01)
            ($SortWrappers.$RefTo$Snap y@191@01))
          ($SortWrappers.$RefTo$Snap z@192@01)))
        (=>
          (Set_in (inv_0_0<Ref> x@190@01 y@191@01 z@192@01) xs1@37@01)
          (and
            (Set_in (inv_0_0<Ref> x@190@01 y@191@01 z@192@01) xs1@37@01)
            (=>
              (Set_in (inv_0_1<Ref> x@190@01 y@191@01 z@192@01) ys1@48@01)
              (and
                (Set_in (inv_0_1<Ref> x@190@01 y@191@01 z@192@01) ys1@48@01)
                (or
                  (Set_in (inv_0_2<Ref> x@190@01 y@191@01 z@192@01) zs1@59@01)
                  (not
                    (Set_in (inv_0_2<Ref> x@190@01 y@191@01 z@192@01) zs1@59@01)))))
            (or
              (Set_in (inv_0_1<Ref> x@190@01 y@191@01 z@192@01) ys1@48@01)
              (not (Set_in (inv_0_1<Ref> x@190@01 y@191@01 z@192@01) ys1@48@01)))))
        (or
          (Set_in (inv_0_0<Ref> x@190@01 y@191@01 z@192@01) xs1@37@01)
          (not (Set_in (inv_0_0<Ref> x@190@01 y@191@01 z@192@01) xs1@37@01)))
        (=>
          (Set_in (inv_1_0<Ref> x@190@01 y@191@01 z@192@01) xs2@38@01)
          (and
            (Set_in (inv_1_0<Ref> x@190@01 y@191@01 z@192@01) xs2@38@01)
            (=>
              (Set_in (inv_1_1<Ref> x@190@01 y@191@01 z@192@01) ys2@49@01)
              (and
                (Set_in (inv_1_1<Ref> x@190@01 y@191@01 z@192@01) ys2@49@01)
                (or
                  (Set_in (inv_1_2<Ref> x@190@01 y@191@01 z@192@01) zs2@60@01)
                  (not
                    (Set_in (inv_1_2<Ref> x@190@01 y@191@01 z@192@01) zs2@60@01)))))
            (or
              (Set_in (inv_1_1<Ref> x@190@01 y@191@01 z@192@01) ys2@49@01)
              (not (Set_in (inv_1_1<Ref> x@190@01 y@191@01 z@192@01) ys2@49@01)))))
        (or
          (Set_in (inv_1_0<Ref> x@190@01 y@191@01 z@192@01) xs2@38@01)
          (not (Set_in (inv_1_0<Ref> x@190@01 y@191@01 z@192@01) xs2@38@01)))
        (=>
          (Set_in (inv_2_0<Ref> x@190@01 y@191@01 z@192@01) xs3@39@01)
          (and
            (Set_in (inv_2_0<Ref> x@190@01 y@191@01 z@192@01) xs3@39@01)
            (=>
              (Set_in (inv_2_1<Ref> x@190@01 y@191@01 z@192@01) ys3@50@01)
              (and
                (Set_in (inv_2_1<Ref> x@190@01 y@191@01 z@192@01) ys3@50@01)
                (or
                  (Set_in (inv_2_2<Ref> x@190@01 y@191@01 z@192@01) zs3@61@01)
                  (not
                    (Set_in (inv_2_2<Ref> x@190@01 y@191@01 z@192@01) zs3@61@01)))))
            (or
              (Set_in (inv_2_1<Ref> x@190@01 y@191@01 z@192@01) ys3@50@01)
              (not (Set_in (inv_2_1<Ref> x@190@01 y@191@01 z@192@01) ys3@50@01)))))
        (or
          (Set_in (inv_2_0<Ref> x@190@01 y@191@01 z@192@01) xs3@39@01)
          (not (Set_in (inv_2_0<Ref> x@190@01 y@191@01 z@192@01) xs3@39@01)))
        (=>
          (Set_in (inv_3_0<Ref> x@190@01 y@191@01 z@192@01) xs4@40@01)
          (and
            (Set_in (inv_3_0<Ref> x@190@01 y@191@01 z@192@01) xs4@40@01)
            (=>
              (Set_in (inv_3_1<Ref> x@190@01 y@191@01 z@192@01) ys4@51@01)
              (and
                (Set_in (inv_3_1<Ref> x@190@01 y@191@01 z@192@01) ys4@51@01)
                (or
                  (Set_in (inv_3_2<Ref> x@190@01 y@191@01 z@192@01) zs4@62@01)
                  (not
                    (Set_in (inv_3_2<Ref> x@190@01 y@191@01 z@192@01) zs4@62@01)))))
            (or
              (Set_in (inv_3_1<Ref> x@190@01 y@191@01 z@192@01) ys4@51@01)
              (not (Set_in (inv_3_1<Ref> x@190@01 y@191@01 z@192@01) ys4@51@01)))))
        (or
          (Set_in (inv_3_0<Ref> x@190@01 y@191@01 z@192@01) xs4@40@01)
          (not (Set_in (inv_3_0<Ref> x@190@01 y@191@01 z@192@01) xs4@40@01)))
        (=>
          (Set_in (inv_4_0<Ref> x@190@01 y@191@01 z@192@01) xs5@41@01)
          (and
            (Set_in (inv_4_0<Ref> x@190@01 y@191@01 z@192@01) xs5@41@01)
            (=>
              (Set_in (inv_4_1<Ref> x@190@01 y@191@01 z@192@01) ys5@52@01)
              (and
                (Set_in (inv_4_1<Ref> x@190@01 y@191@01 z@192@01) ys5@52@01)
                (or
                  (Set_in (inv_4_2<Ref> x@190@01 y@191@01 z@192@01) zs5@63@01)
                  (not
                    (Set_in (inv_4_2<Ref> x@190@01 y@191@01 z@192@01) zs5@63@01)))))
            (or
              (Set_in (inv_4_1<Ref> x@190@01 y@191@01 z@192@01) ys5@52@01)
              (not (Set_in (inv_4_1<Ref> x@190@01 y@191@01 z@192@01) ys5@52@01)))))
        (or
          (Set_in (inv_4_0<Ref> x@190@01 y@191@01 z@192@01) xs5@41@01)
          (not (Set_in (inv_4_0<Ref> x@190@01 y@191@01 z@192@01) xs5@41@01)))
        (=>
          (Set_in (inv_5_0<Ref> x@190@01 y@191@01 z@192@01) xs6@42@01)
          (and
            (Set_in (inv_5_0<Ref> x@190@01 y@191@01 z@192@01) xs6@42@01)
            (=>
              (Set_in (inv_5_1<Ref> x@190@01 y@191@01 z@192@01) ys6@53@01)
              (and
                (Set_in (inv_5_1<Ref> x@190@01 y@191@01 z@192@01) ys6@53@01)
                (or
                  (Set_in (inv_5_2<Ref> x@190@01 y@191@01 z@192@01) zs6@64@01)
                  (not
                    (Set_in (inv_5_2<Ref> x@190@01 y@191@01 z@192@01) zs6@64@01)))))
            (or
              (Set_in (inv_5_1<Ref> x@190@01 y@191@01 z@192@01) ys6@53@01)
              (not (Set_in (inv_5_1<Ref> x@190@01 y@191@01 z@192@01) ys6@53@01)))))
        (or
          (Set_in (inv_5_0<Ref> x@190@01 y@191@01 z@192@01) xs6@42@01)
          (not (Set_in (inv_5_0<Ref> x@190@01 y@191@01 z@192@01) xs6@42@01)))
        (=>
          (Set_in (inv_6_0<Ref> x@190@01 y@191@01 z@192@01) xs7@43@01)
          (and
            (Set_in (inv_6_0<Ref> x@190@01 y@191@01 z@192@01) xs7@43@01)
            (=>
              (Set_in (inv_6_1<Ref> x@190@01 y@191@01 z@192@01) ys7@54@01)
              (and
                (Set_in (inv_6_1<Ref> x@190@01 y@191@01 z@192@01) ys7@54@01)
                (or
                  (Set_in (inv_6_2<Ref> x@190@01 y@191@01 z@192@01) zs7@65@01)
                  (not
                    (Set_in (inv_6_2<Ref> x@190@01 y@191@01 z@192@01) zs7@65@01)))))
            (or
              (Set_in (inv_6_1<Ref> x@190@01 y@191@01 z@192@01) ys7@54@01)
              (not (Set_in (inv_6_1<Ref> x@190@01 y@191@01 z@192@01) ys7@54@01)))))
        (or
          (Set_in (inv_6_0<Ref> x@190@01 y@191@01 z@192@01) xs7@43@01)
          (not (Set_in (inv_6_0<Ref> x@190@01 y@191@01 z@192@01) xs7@43@01)))))
    (or
      (not
        (and
          (Set_in (inv_7_0<Ref> x@190@01 y@191@01 z@192@01) xs8@44@01)
          (and
            (Set_in (inv_7_1<Ref> x@190@01 y@191@01 z@192@01) ys8@55@01)
            (Set_in (inv_7_2<Ref> x@190@01 y@191@01 z@192@01) zs8@66@01))))
      (and
        (Set_in (inv_7_0<Ref> x@190@01 y@191@01 z@192@01) xs8@44@01)
        (and
          (Set_in (inv_7_1<Ref> x@190@01 y@191@01 z@192@01) ys8@55@01)
          (Set_in (inv_7_2<Ref> x@190@01 y@191@01 z@192@01) zs8@66@01)))))
  :pattern ((inv_7_0<Ref> x@190@01 y@191@01 z@192@01) (inv_7_1<Ref> x@190@01 y@191@01 z@192@01) (inv_7_2<Ref> x@190@01 y@191@01 z@192@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@27@9@27@122-aux|)))
(assert (forall ((x@190@01 $Ref) (y@191@01 $Ref) (z@192@01 $Ref)) (!
  (=>
    (and
      (Set_in (inv_7_0<Ref> x@190@01 y@191@01 z@192@01) xs8@44@01)
      (and
        (Set_in (inv_7_1<Ref> x@190@01 y@191@01 z@192@01) ys8@55@01)
        (Set_in (inv_7_2<Ref> x@190@01 y@191@01 z@192@01) zs8@66@01)))
    (>=
      ($PSF.perm_p (as pm@193@01  $PPM) ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap x@190@01)
          ($SortWrappers.$RefTo$Snap y@191@01))
        ($SortWrappers.$RefTo$Snap z@192@01)))
      (__iar__assume_helper_7<Perm> (and
        (Set_in (inv_0_0<Ref> x@190@01 y@191@01 z@192@01) xs1@37@01)
        (and
          (Set_in (inv_0_1<Ref> x@190@01 y@191@01 z@192@01) ys1@48@01)
          (Set_in (inv_0_2<Ref> x@190@01 y@191@01 z@192@01) zs1@59@01))) (and
        (Set_in (inv_1_0<Ref> x@190@01 y@191@01 z@192@01) xs2@38@01)
        (and
          (Set_in (inv_1_1<Ref> x@190@01 y@191@01 z@192@01) ys2@49@01)
          (Set_in (inv_1_2<Ref> x@190@01 y@191@01 z@192@01) zs2@60@01))) (and
        (Set_in (inv_2_0<Ref> x@190@01 y@191@01 z@192@01) xs3@39@01)
        (and
          (Set_in (inv_2_1<Ref> x@190@01 y@191@01 z@192@01) ys3@50@01)
          (Set_in (inv_2_2<Ref> x@190@01 y@191@01 z@192@01) zs3@61@01))) (and
        (Set_in (inv_3_0<Ref> x@190@01 y@191@01 z@192@01) xs4@40@01)
        (and
          (Set_in (inv_3_1<Ref> x@190@01 y@191@01 z@192@01) ys4@51@01)
          (Set_in (inv_3_2<Ref> x@190@01 y@191@01 z@192@01) zs4@62@01))) (and
        (Set_in (inv_4_0<Ref> x@190@01 y@191@01 z@192@01) xs5@41@01)
        (and
          (Set_in (inv_4_1<Ref> x@190@01 y@191@01 z@192@01) ys5@52@01)
          (Set_in (inv_4_2<Ref> x@190@01 y@191@01 z@192@01) zs5@63@01))) (and
        (Set_in (inv_5_0<Ref> x@190@01 y@191@01 z@192@01) xs6@42@01)
        (and
          (Set_in (inv_5_1<Ref> x@190@01 y@191@01 z@192@01) ys6@53@01)
          (Set_in (inv_5_2<Ref> x@190@01 y@191@01 z@192@01) zs6@64@01))) (and
        (Set_in (inv_6_0<Ref> x@190@01 y@191@01 z@192@01) xs7@43@01)
        (and
          (Set_in (inv_6_1<Ref> x@190@01 y@191@01 z@192@01) ys7@54@01)
          (Set_in (inv_6_2<Ref> x@190@01 y@191@01 z@192@01) zs7@65@01))) q@73@01 q@73@01 q@73@01 q@73@01 q@73@01 q@73@01 q@73@01 q@73@01)))
  :pattern ((inv_7_0<Ref> x@190@01 y@191@01 z@192@01) (inv_7_1<Ref> x@190@01 y@191@01 z@192@01) (inv_7_2<Ref> x@190@01 y@191@01 z@192@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@27@9@27@122|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x9: Ref, y9: Ref, z9: Ref ::
;     { p(x9, y9, z9) }
;     (x9 in xs9) && ((y9 in ys9) && (z9 in zs9)) ==>
;     inv_8_0(x9, y9, z9) == x9 && inv_8_1(x9, y9, z9) == y9 &&
;     inv_8_2(x9, y9, z9) == z9)
(declare-const $t@194@01 $Snap)
(assert (= $t@194@01 $Snap.unit))
; [eval] (forall x9: Ref, y9: Ref, z9: Ref :: { p(x9, y9, z9) } (x9 in xs9) && ((y9 in ys9) && (z9 in zs9)) ==> inv_8_0(x9, y9, z9) == x9 && inv_8_1(x9, y9, z9) == y9 && inv_8_2(x9, y9, z9) == z9)
(declare-const x9@195@01 $Ref)
(declare-const y9@196@01 $Ref)
(declare-const z9@197@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x9 in xs9) && ((y9 in ys9) && (z9 in zs9)) ==> inv_8_0(x9, y9, z9) == x9 && inv_8_1(x9, y9, z9) == y9 && inv_8_2(x9, y9, z9) == z9
; [eval] (x9 in xs9) && ((y9 in ys9) && (z9 in zs9))
; [eval] (x9 in xs9)
(push) ; 4
; [then-branch: 246 | !(x9@195@01 in xs9@45@01) | live]
; [else-branch: 246 | x9@195@01 in xs9@45@01 | live]
(push) ; 5
; [then-branch: 246 | !(x9@195@01 in xs9@45@01)]
(assert (not (Set_in x9@195@01 xs9@45@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 246 | x9@195@01 in xs9@45@01]
(assert (Set_in x9@195@01 xs9@45@01))
; [eval] (y9 in ys9)
(push) ; 6
; [then-branch: 247 | !(y9@196@01 in ys9@56@01) | live]
; [else-branch: 247 | y9@196@01 in ys9@56@01 | live]
(push) ; 7
; [then-branch: 247 | !(y9@196@01 in ys9@56@01)]
(assert (not (Set_in y9@196@01 ys9@56@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 247 | y9@196@01 in ys9@56@01]
(assert (Set_in y9@196@01 ys9@56@01))
; [eval] (z9 in zs9)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (Set_in y9@196@01 ys9@56@01) (not (Set_in y9@196@01 ys9@56@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in x9@195@01 xs9@45@01)
  (and
    (Set_in x9@195@01 xs9@45@01)
    (or (Set_in y9@196@01 ys9@56@01) (not (Set_in y9@196@01 ys9@56@01))))))
(assert (or (Set_in x9@195@01 xs9@45@01) (not (Set_in x9@195@01 xs9@45@01))))
(push) ; 4
; [then-branch: 248 | x9@195@01 in xs9@45@01 && y9@196@01 in ys9@56@01 && z9@197@01 in zs9@67@01 | live]
; [else-branch: 248 | !(x9@195@01 in xs9@45@01 && y9@196@01 in ys9@56@01 && z9@197@01 in zs9@67@01) | live]
(push) ; 5
; [then-branch: 248 | x9@195@01 in xs9@45@01 && y9@196@01 in ys9@56@01 && z9@197@01 in zs9@67@01]
(assert (and
  (Set_in x9@195@01 xs9@45@01)
  (and (Set_in y9@196@01 ys9@56@01) (Set_in z9@197@01 zs9@67@01))))
; [eval] inv_8_0(x9, y9, z9) == x9 && inv_8_1(x9, y9, z9) == y9 && inv_8_2(x9, y9, z9) == z9
; [eval] inv_8_0(x9, y9, z9) == x9
; [eval] inv_8_0(x9, y9, z9)
(push) ; 6
; [then-branch: 249 | inv_8_0[Ref](x9@195@01, y9@196@01, z9@197@01) != x9@195@01 | live]
; [else-branch: 249 | inv_8_0[Ref](x9@195@01, y9@196@01, z9@197@01) == x9@195@01 | live]
(push) ; 7
; [then-branch: 249 | inv_8_0[Ref](x9@195@01, y9@196@01, z9@197@01) != x9@195@01]
(assert (not (= (inv_8_0<Ref> x9@195@01 y9@196@01 z9@197@01) x9@195@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 249 | inv_8_0[Ref](x9@195@01, y9@196@01, z9@197@01) == x9@195@01]
(assert (= (inv_8_0<Ref> x9@195@01 y9@196@01 z9@197@01) x9@195@01))
; [eval] inv_8_1(x9, y9, z9) == y9
; [eval] inv_8_1(x9, y9, z9)
(push) ; 8
; [then-branch: 250 | inv_8_1[Ref](x9@195@01, y9@196@01, z9@197@01) != y9@196@01 | live]
; [else-branch: 250 | inv_8_1[Ref](x9@195@01, y9@196@01, z9@197@01) == y9@196@01 | live]
(push) ; 9
; [then-branch: 250 | inv_8_1[Ref](x9@195@01, y9@196@01, z9@197@01) != y9@196@01]
(assert (not (= (inv_8_1<Ref> x9@195@01 y9@196@01 z9@197@01) y9@196@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 250 | inv_8_1[Ref](x9@195@01, y9@196@01, z9@197@01) == y9@196@01]
(assert (= (inv_8_1<Ref> x9@195@01 y9@196@01 z9@197@01) y9@196@01))
; [eval] inv_8_2(x9, y9, z9) == z9
; [eval] inv_8_2(x9, y9, z9)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or
  (= (inv_8_1<Ref> x9@195@01 y9@196@01 z9@197@01) y9@196@01)
  (not (= (inv_8_1<Ref> x9@195@01 y9@196@01 z9@197@01) y9@196@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (= (inv_8_0<Ref> x9@195@01 y9@196@01 z9@197@01) x9@195@01)
  (and
    (= (inv_8_0<Ref> x9@195@01 y9@196@01 z9@197@01) x9@195@01)
    (or
      (= (inv_8_1<Ref> x9@195@01 y9@196@01 z9@197@01) y9@196@01)
      (not (= (inv_8_1<Ref> x9@195@01 y9@196@01 z9@197@01) y9@196@01))))))
(assert (or
  (= (inv_8_0<Ref> x9@195@01 y9@196@01 z9@197@01) x9@195@01)
  (not (= (inv_8_0<Ref> x9@195@01 y9@196@01 z9@197@01) x9@195@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 248 | !(x9@195@01 in xs9@45@01 && y9@196@01 in ys9@56@01 && z9@197@01 in zs9@67@01)]
(assert (not
  (and
    (Set_in x9@195@01 xs9@45@01)
    (and (Set_in y9@196@01 ys9@56@01) (Set_in z9@197@01 zs9@67@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Set_in x9@195@01 xs9@45@01)
    (and (Set_in y9@196@01 ys9@56@01) (Set_in z9@197@01 zs9@67@01)))
  (and
    (Set_in x9@195@01 xs9@45@01)
    (Set_in y9@196@01 ys9@56@01)
    (Set_in z9@197@01 zs9@67@01)
    (=>
      (= (inv_8_0<Ref> x9@195@01 y9@196@01 z9@197@01) x9@195@01)
      (and
        (= (inv_8_0<Ref> x9@195@01 y9@196@01 z9@197@01) x9@195@01)
        (or
          (= (inv_8_1<Ref> x9@195@01 y9@196@01 z9@197@01) y9@196@01)
          (not (= (inv_8_1<Ref> x9@195@01 y9@196@01 z9@197@01) y9@196@01)))))
    (or
      (= (inv_8_0<Ref> x9@195@01 y9@196@01 z9@197@01) x9@195@01)
      (not (= (inv_8_0<Ref> x9@195@01 y9@196@01 z9@197@01) x9@195@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in x9@195@01 xs9@45@01)
      (and (Set_in y9@196@01 ys9@56@01) (Set_in z9@197@01 zs9@67@01))))
  (and
    (Set_in x9@195@01 xs9@45@01)
    (and (Set_in y9@196@01 ys9@56@01) (Set_in z9@197@01 zs9@67@01)))))
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x9@195@01 $Ref) (y9@196@01 $Ref) (z9@197@01 $Ref)) (!
  (and
    (=>
      (Set_in x9@195@01 xs9@45@01)
      (and
        (Set_in x9@195@01 xs9@45@01)
        (or (Set_in y9@196@01 ys9@56@01) (not (Set_in y9@196@01 ys9@56@01)))))
    (or (Set_in x9@195@01 xs9@45@01) (not (Set_in x9@195@01 xs9@45@01)))
    (=>
      (and
        (Set_in x9@195@01 xs9@45@01)
        (and (Set_in y9@196@01 ys9@56@01) (Set_in z9@197@01 zs9@67@01)))
      (and
        (Set_in x9@195@01 xs9@45@01)
        (Set_in y9@196@01 ys9@56@01)
        (Set_in z9@197@01 zs9@67@01)
        (=>
          (= (inv_8_0<Ref> x9@195@01 y9@196@01 z9@197@01) x9@195@01)
          (and
            (= (inv_8_0<Ref> x9@195@01 y9@196@01 z9@197@01) x9@195@01)
            (or
              (= (inv_8_1<Ref> x9@195@01 y9@196@01 z9@197@01) y9@196@01)
              (not (= (inv_8_1<Ref> x9@195@01 y9@196@01 z9@197@01) y9@196@01)))))
        (or
          (= (inv_8_0<Ref> x9@195@01 y9@196@01 z9@197@01) x9@195@01)
          (not (= (inv_8_0<Ref> x9@195@01 y9@196@01 z9@197@01) x9@195@01)))))
    (or
      (not
        (and
          (Set_in x9@195@01 xs9@45@01)
          (and (Set_in y9@196@01 ys9@56@01) (Set_in z9@197@01 zs9@67@01))))
      (and
        (Set_in x9@195@01 xs9@45@01)
        (and (Set_in y9@196@01 ys9@56@01) (Set_in z9@197@01 zs9@67@01)))))
  :pattern (($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap x9@195@01)
      ($SortWrappers.$RefTo$Snap y9@196@01))
    ($SortWrappers.$RefTo$Snap z9@197@01))) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap x9@195@01)
      ($SortWrappers.$RefTo$Snap y9@196@01))
    ($SortWrappers.$RefTo$Snap z9@197@01))))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@28@9@28@122-aux|)))
(assert (forall ((x9@195@01 $Ref) (y9@196@01 $Ref) (z9@197@01 $Ref)) (!
  (=>
    (and
      (Set_in x9@195@01 xs9@45@01)
      (and (Set_in y9@196@01 ys9@56@01) (Set_in z9@197@01 zs9@67@01)))
    (and
      (= (inv_8_0<Ref> x9@195@01 y9@196@01 z9@197@01) x9@195@01)
      (and
        (= (inv_8_1<Ref> x9@195@01 y9@196@01 z9@197@01) y9@196@01)
        (= (inv_8_2<Ref> x9@195@01 y9@196@01 z9@197@01) z9@197@01))))
  :pattern (($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap x9@195@01)
      ($SortWrappers.$RefTo$Snap y9@196@01))
    ($SortWrappers.$RefTo$Snap z9@197@01))) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap x9@195@01)
      ($SortWrappers.$RefTo$Snap y9@196@01))
    ($SortWrappers.$RefTo$Snap z9@197@01))))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@28@9@28@122|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x: Ref, y: Ref, z: Ref ::
;     { inv_8_0(x, y, z), inv_8_1(x, y, z), inv_8_2(x, y, z) }
;     (inv_8_0(x, y, z) in xs9) &&
;     ((inv_8_1(x, y, z) in ys9) && (inv_8_2(x, y, z) in zs9)) ==>
;     inv_8_0(x, y, z) == x && inv_8_1(x, y, z) == y && inv_8_2(x, y, z) == z)
(declare-const $t@198@01 $Snap)
(assert (= $t@198@01 $Snap.unit))
; [eval] (forall x: Ref, y: Ref, z: Ref :: { inv_8_0(x, y, z), inv_8_1(x, y, z), inv_8_2(x, y, z) } (inv_8_0(x, y, z) in xs9) && ((inv_8_1(x, y, z) in ys9) && (inv_8_2(x, y, z) in zs9)) ==> inv_8_0(x, y, z) == x && inv_8_1(x, y, z) == y && inv_8_2(x, y, z) == z)
(declare-const x@199@01 $Ref)
(declare-const y@200@01 $Ref)
(declare-const z@201@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (inv_8_0(x, y, z) in xs9) && ((inv_8_1(x, y, z) in ys9) && (inv_8_2(x, y, z) in zs9)) ==> inv_8_0(x, y, z) == x && inv_8_1(x, y, z) == y && inv_8_2(x, y, z) == z
; [eval] (inv_8_0(x, y, z) in xs9) && ((inv_8_1(x, y, z) in ys9) && (inv_8_2(x, y, z) in zs9))
; [eval] (inv_8_0(x, y, z) in xs9)
; [eval] inv_8_0(x, y, z)
(push) ; 4
; [then-branch: 251 | !(inv_8_0[Ref](x@199@01, y@200@01, z@201@01) in xs9@45@01) | live]
; [else-branch: 251 | inv_8_0[Ref](x@199@01, y@200@01, z@201@01) in xs9@45@01 | live]
(push) ; 5
; [then-branch: 251 | !(inv_8_0[Ref](x@199@01, y@200@01, z@201@01) in xs9@45@01)]
(assert (not (Set_in (inv_8_0<Ref> x@199@01 y@200@01 z@201@01) xs9@45@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 251 | inv_8_0[Ref](x@199@01, y@200@01, z@201@01) in xs9@45@01]
(assert (Set_in (inv_8_0<Ref> x@199@01 y@200@01 z@201@01) xs9@45@01))
; [eval] (inv_8_1(x, y, z) in ys9)
; [eval] inv_8_1(x, y, z)
(push) ; 6
; [then-branch: 252 | !(inv_8_1[Ref](x@199@01, y@200@01, z@201@01) in ys9@56@01) | live]
; [else-branch: 252 | inv_8_1[Ref](x@199@01, y@200@01, z@201@01) in ys9@56@01 | live]
(push) ; 7
; [then-branch: 252 | !(inv_8_1[Ref](x@199@01, y@200@01, z@201@01) in ys9@56@01)]
(assert (not (Set_in (inv_8_1<Ref> x@199@01 y@200@01 z@201@01) ys9@56@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 252 | inv_8_1[Ref](x@199@01, y@200@01, z@201@01) in ys9@56@01]
(assert (Set_in (inv_8_1<Ref> x@199@01 y@200@01 z@201@01) ys9@56@01))
; [eval] (inv_8_2(x, y, z) in zs9)
; [eval] inv_8_2(x, y, z)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_8_1<Ref> x@199@01 y@200@01 z@201@01) ys9@56@01)
  (not (Set_in (inv_8_1<Ref> x@199@01 y@200@01 z@201@01) ys9@56@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_8_0<Ref> x@199@01 y@200@01 z@201@01) xs9@45@01)
  (and
    (Set_in (inv_8_0<Ref> x@199@01 y@200@01 z@201@01) xs9@45@01)
    (or
      (Set_in (inv_8_1<Ref> x@199@01 y@200@01 z@201@01) ys9@56@01)
      (not (Set_in (inv_8_1<Ref> x@199@01 y@200@01 z@201@01) ys9@56@01))))))
(assert (or
  (Set_in (inv_8_0<Ref> x@199@01 y@200@01 z@201@01) xs9@45@01)
  (not (Set_in (inv_8_0<Ref> x@199@01 y@200@01 z@201@01) xs9@45@01))))
(push) ; 4
; [then-branch: 253 | inv_8_0[Ref](x@199@01, y@200@01, z@201@01) in xs9@45@01 && inv_8_1[Ref](x@199@01, y@200@01, z@201@01) in ys9@56@01 && inv_8_2[Ref](x@199@01, y@200@01, z@201@01) in zs9@67@01 | live]
; [else-branch: 253 | !(inv_8_0[Ref](x@199@01, y@200@01, z@201@01) in xs9@45@01 && inv_8_1[Ref](x@199@01, y@200@01, z@201@01) in ys9@56@01 && inv_8_2[Ref](x@199@01, y@200@01, z@201@01) in zs9@67@01) | live]
(push) ; 5
; [then-branch: 253 | inv_8_0[Ref](x@199@01, y@200@01, z@201@01) in xs9@45@01 && inv_8_1[Ref](x@199@01, y@200@01, z@201@01) in ys9@56@01 && inv_8_2[Ref](x@199@01, y@200@01, z@201@01) in zs9@67@01]
(assert (and
  (Set_in (inv_8_0<Ref> x@199@01 y@200@01 z@201@01) xs9@45@01)
  (and
    (Set_in (inv_8_1<Ref> x@199@01 y@200@01 z@201@01) ys9@56@01)
    (Set_in (inv_8_2<Ref> x@199@01 y@200@01 z@201@01) zs9@67@01))))
; [eval] inv_8_0(x, y, z) == x && inv_8_1(x, y, z) == y && inv_8_2(x, y, z) == z
; [eval] inv_8_0(x, y, z) == x
; [eval] inv_8_0(x, y, z)
(push) ; 6
; [then-branch: 254 | inv_8_0[Ref](x@199@01, y@200@01, z@201@01) != x@199@01 | live]
; [else-branch: 254 | inv_8_0[Ref](x@199@01, y@200@01, z@201@01) == x@199@01 | live]
(push) ; 7
; [then-branch: 254 | inv_8_0[Ref](x@199@01, y@200@01, z@201@01) != x@199@01]
(assert (not (= (inv_8_0<Ref> x@199@01 y@200@01 z@201@01) x@199@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 254 | inv_8_0[Ref](x@199@01, y@200@01, z@201@01) == x@199@01]
(assert (= (inv_8_0<Ref> x@199@01 y@200@01 z@201@01) x@199@01))
; [eval] inv_8_1(x, y, z) == y
; [eval] inv_8_1(x, y, z)
(push) ; 8
; [then-branch: 255 | inv_8_1[Ref](x@199@01, y@200@01, z@201@01) != y@200@01 | live]
; [else-branch: 255 | inv_8_1[Ref](x@199@01, y@200@01, z@201@01) == y@200@01 | live]
(push) ; 9
; [then-branch: 255 | inv_8_1[Ref](x@199@01, y@200@01, z@201@01) != y@200@01]
(assert (not (= (inv_8_1<Ref> x@199@01 y@200@01 z@201@01) y@200@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 255 | inv_8_1[Ref](x@199@01, y@200@01, z@201@01) == y@200@01]
(assert (= (inv_8_1<Ref> x@199@01 y@200@01 z@201@01) y@200@01))
; [eval] inv_8_2(x, y, z) == z
; [eval] inv_8_2(x, y, z)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or
  (= (inv_8_1<Ref> x@199@01 y@200@01 z@201@01) y@200@01)
  (not (= (inv_8_1<Ref> x@199@01 y@200@01 z@201@01) y@200@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (= (inv_8_0<Ref> x@199@01 y@200@01 z@201@01) x@199@01)
  (and
    (= (inv_8_0<Ref> x@199@01 y@200@01 z@201@01) x@199@01)
    (or
      (= (inv_8_1<Ref> x@199@01 y@200@01 z@201@01) y@200@01)
      (not (= (inv_8_1<Ref> x@199@01 y@200@01 z@201@01) y@200@01))))))
(assert (or
  (= (inv_8_0<Ref> x@199@01 y@200@01 z@201@01) x@199@01)
  (not (= (inv_8_0<Ref> x@199@01 y@200@01 z@201@01) x@199@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 253 | !(inv_8_0[Ref](x@199@01, y@200@01, z@201@01) in xs9@45@01 && inv_8_1[Ref](x@199@01, y@200@01, z@201@01) in ys9@56@01 && inv_8_2[Ref](x@199@01, y@200@01, z@201@01) in zs9@67@01)]
(assert (not
  (and
    (Set_in (inv_8_0<Ref> x@199@01 y@200@01 z@201@01) xs9@45@01)
    (and
      (Set_in (inv_8_1<Ref> x@199@01 y@200@01 z@201@01) ys9@56@01)
      (Set_in (inv_8_2<Ref> x@199@01 y@200@01 z@201@01) zs9@67@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Set_in (inv_8_0<Ref> x@199@01 y@200@01 z@201@01) xs9@45@01)
    (and
      (Set_in (inv_8_1<Ref> x@199@01 y@200@01 z@201@01) ys9@56@01)
      (Set_in (inv_8_2<Ref> x@199@01 y@200@01 z@201@01) zs9@67@01)))
  (and
    (Set_in (inv_8_0<Ref> x@199@01 y@200@01 z@201@01) xs9@45@01)
    (Set_in (inv_8_1<Ref> x@199@01 y@200@01 z@201@01) ys9@56@01)
    (Set_in (inv_8_2<Ref> x@199@01 y@200@01 z@201@01) zs9@67@01)
    (=>
      (= (inv_8_0<Ref> x@199@01 y@200@01 z@201@01) x@199@01)
      (and
        (= (inv_8_0<Ref> x@199@01 y@200@01 z@201@01) x@199@01)
        (or
          (= (inv_8_1<Ref> x@199@01 y@200@01 z@201@01) y@200@01)
          (not (= (inv_8_1<Ref> x@199@01 y@200@01 z@201@01) y@200@01)))))
    (or
      (= (inv_8_0<Ref> x@199@01 y@200@01 z@201@01) x@199@01)
      (not (= (inv_8_0<Ref> x@199@01 y@200@01 z@201@01) x@199@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in (inv_8_0<Ref> x@199@01 y@200@01 z@201@01) xs9@45@01)
      (and
        (Set_in (inv_8_1<Ref> x@199@01 y@200@01 z@201@01) ys9@56@01)
        (Set_in (inv_8_2<Ref> x@199@01 y@200@01 z@201@01) zs9@67@01))))
  (and
    (Set_in (inv_8_0<Ref> x@199@01 y@200@01 z@201@01) xs9@45@01)
    (and
      (Set_in (inv_8_1<Ref> x@199@01 y@200@01 z@201@01) ys9@56@01)
      (Set_in (inv_8_2<Ref> x@199@01 y@200@01 z@201@01) zs9@67@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@199@01 $Ref) (y@200@01 $Ref) (z@201@01 $Ref)) (!
  (and
    (=>
      (Set_in (inv_8_0<Ref> x@199@01 y@200@01 z@201@01) xs9@45@01)
      (and
        (Set_in (inv_8_0<Ref> x@199@01 y@200@01 z@201@01) xs9@45@01)
        (or
          (Set_in (inv_8_1<Ref> x@199@01 y@200@01 z@201@01) ys9@56@01)
          (not (Set_in (inv_8_1<Ref> x@199@01 y@200@01 z@201@01) ys9@56@01)))))
    (or
      (Set_in (inv_8_0<Ref> x@199@01 y@200@01 z@201@01) xs9@45@01)
      (not (Set_in (inv_8_0<Ref> x@199@01 y@200@01 z@201@01) xs9@45@01)))
    (=>
      (and
        (Set_in (inv_8_0<Ref> x@199@01 y@200@01 z@201@01) xs9@45@01)
        (and
          (Set_in (inv_8_1<Ref> x@199@01 y@200@01 z@201@01) ys9@56@01)
          (Set_in (inv_8_2<Ref> x@199@01 y@200@01 z@201@01) zs9@67@01)))
      (and
        (Set_in (inv_8_0<Ref> x@199@01 y@200@01 z@201@01) xs9@45@01)
        (Set_in (inv_8_1<Ref> x@199@01 y@200@01 z@201@01) ys9@56@01)
        (Set_in (inv_8_2<Ref> x@199@01 y@200@01 z@201@01) zs9@67@01)
        (=>
          (= (inv_8_0<Ref> x@199@01 y@200@01 z@201@01) x@199@01)
          (and
            (= (inv_8_0<Ref> x@199@01 y@200@01 z@201@01) x@199@01)
            (or
              (= (inv_8_1<Ref> x@199@01 y@200@01 z@201@01) y@200@01)
              (not (= (inv_8_1<Ref> x@199@01 y@200@01 z@201@01) y@200@01)))))
        (or
          (= (inv_8_0<Ref> x@199@01 y@200@01 z@201@01) x@199@01)
          (not (= (inv_8_0<Ref> x@199@01 y@200@01 z@201@01) x@199@01)))))
    (or
      (not
        (and
          (Set_in (inv_8_0<Ref> x@199@01 y@200@01 z@201@01) xs9@45@01)
          (and
            (Set_in (inv_8_1<Ref> x@199@01 y@200@01 z@201@01) ys9@56@01)
            (Set_in (inv_8_2<Ref> x@199@01 y@200@01 z@201@01) zs9@67@01))))
      (and
        (Set_in (inv_8_0<Ref> x@199@01 y@200@01 z@201@01) xs9@45@01)
        (and
          (Set_in (inv_8_1<Ref> x@199@01 y@200@01 z@201@01) ys9@56@01)
          (Set_in (inv_8_2<Ref> x@199@01 y@200@01 z@201@01) zs9@67@01)))))
  :pattern ((inv_8_0<Ref> x@199@01 y@200@01 z@201@01) (inv_8_1<Ref> x@199@01 y@200@01 z@201@01) (inv_8_2<Ref> x@199@01 y@200@01 z@201@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@28@9@28@122-aux|)))
(assert (forall ((x@199@01 $Ref) (y@200@01 $Ref) (z@201@01 $Ref)) (!
  (=>
    (and
      (Set_in (inv_8_0<Ref> x@199@01 y@200@01 z@201@01) xs9@45@01)
      (and
        (Set_in (inv_8_1<Ref> x@199@01 y@200@01 z@201@01) ys9@56@01)
        (Set_in (inv_8_2<Ref> x@199@01 y@200@01 z@201@01) zs9@67@01)))
    (and
      (= (inv_8_0<Ref> x@199@01 y@200@01 z@201@01) x@199@01)
      (and
        (= (inv_8_1<Ref> x@199@01 y@200@01 z@201@01) y@200@01)
        (= (inv_8_2<Ref> x@199@01 y@200@01 z@201@01) z@201@01))))
  :pattern ((inv_8_0<Ref> x@199@01 y@200@01 z@201@01) (inv_8_1<Ref> x@199@01 y@200@01 z@201@01) (inv_8_2<Ref> x@199@01 y@200@01 z@201@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@28@9@28@122|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x: Ref, y: Ref, z: Ref ::
;     { inv_8_0(x, y, z), inv_8_1(x, y, z), inv_8_2(x, y, z) }
;     (inv_8_0(x, y, z) in xs9) &&
;     ((inv_8_1(x, y, z) in ys9) && (inv_8_2(x, y, z) in zs9)) ==>
;     perm(p(x, y, z)) >=
;     __iar__assume_helper_8((inv_0_0(x, y, z) in xs1) &&
;     ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) &&
;     (x == x && y == y && z == z), (inv_1_0(x, y, z) in xs2) &&
;     ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) &&
;     (x == x && y == y && z == z), (inv_2_0(x, y, z) in xs3) &&
;     ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) &&
;     (x == x && y == y && z == z), (inv_3_0(x, y, z) in xs4) &&
;     ((inv_3_1(x, y, z) in ys4) && (inv_3_2(x, y, z) in zs4)) &&
;     (x == x && y == y && z == z), (inv_4_0(x, y, z) in xs5) &&
;     ((inv_4_1(x, y, z) in ys5) && (inv_4_2(x, y, z) in zs5)) &&
;     (x == x && y == y && z == z), (inv_5_0(x, y, z) in xs6) &&
;     ((inv_5_1(x, y, z) in ys6) && (inv_5_2(x, y, z) in zs6)) &&
;     (x == x && y == y && z == z), (inv_6_0(x, y, z) in xs7) &&
;     ((inv_6_1(x, y, z) in ys7) && (inv_6_2(x, y, z) in zs7)) &&
;     (x == x && y == y && z == z), (inv_7_0(x, y, z) in xs8) &&
;     ((inv_7_1(x, y, z) in ys8) && (inv_7_2(x, y, z) in zs8)) &&
;     (x == x && y == y && z == z), q, q, q, q, q, q, q, q, q))
(declare-const $t@202@01 $Snap)
(assert (= $t@202@01 $Snap.unit))
; [eval] (forall x: Ref, y: Ref, z: Ref :: { inv_8_0(x, y, z), inv_8_1(x, y, z), inv_8_2(x, y, z) } (inv_8_0(x, y, z) in xs9) && ((inv_8_1(x, y, z) in ys9) && (inv_8_2(x, y, z) in zs9)) ==> perm(p(x, y, z)) >= __iar__assume_helper_8((inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) && (x == x && y == y && z == z), (inv_1_0(x, y, z) in xs2) && ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) && (x == x && y == y && z == z), (inv_2_0(x, y, z) in xs3) && ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) && (x == x && y == y && z == z), (inv_3_0(x, y, z) in xs4) && ((inv_3_1(x, y, z) in ys4) && (inv_3_2(x, y, z) in zs4)) && (x == x && y == y && z == z), (inv_4_0(x, y, z) in xs5) && ((inv_4_1(x, y, z) in ys5) && (inv_4_2(x, y, z) in zs5)) && (x == x && y == y && z == z), (inv_5_0(x, y, z) in xs6) && ((inv_5_1(x, y, z) in ys6) && (inv_5_2(x, y, z) in zs6)) && (x == x && y == y && z == z), (inv_6_0(x, y, z) in xs7) && ((inv_6_1(x, y, z) in ys7) && (inv_6_2(x, y, z) in zs7)) && (x == x && y == y && z == z), (inv_7_0(x, y, z) in xs8) && ((inv_7_1(x, y, z) in ys8) && (inv_7_2(x, y, z) in zs8)) && (x == x && y == y && z == z), q, q, q, q, q, q, q, q, q))
(declare-const x@203@01 $Ref)
(declare-const y@204@01 $Ref)
(declare-const z@205@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (inv_8_0(x, y, z) in xs9) && ((inv_8_1(x, y, z) in ys9) && (inv_8_2(x, y, z) in zs9)) ==> perm(p(x, y, z)) >= __iar__assume_helper_8((inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) && (x == x && y == y && z == z), (inv_1_0(x, y, z) in xs2) && ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) && (x == x && y == y && z == z), (inv_2_0(x, y, z) in xs3) && ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) && (x == x && y == y && z == z), (inv_3_0(x, y, z) in xs4) && ((inv_3_1(x, y, z) in ys4) && (inv_3_2(x, y, z) in zs4)) && (x == x && y == y && z == z), (inv_4_0(x, y, z) in xs5) && ((inv_4_1(x, y, z) in ys5) && (inv_4_2(x, y, z) in zs5)) && (x == x && y == y && z == z), (inv_5_0(x, y, z) in xs6) && ((inv_5_1(x, y, z) in ys6) && (inv_5_2(x, y, z) in zs6)) && (x == x && y == y && z == z), (inv_6_0(x, y, z) in xs7) && ((inv_6_1(x, y, z) in ys7) && (inv_6_2(x, y, z) in zs7)) && (x == x && y == y && z == z), (inv_7_0(x, y, z) in xs8) && ((inv_7_1(x, y, z) in ys8) && (inv_7_2(x, y, z) in zs8)) && (x == x && y == y && z == z), q, q, q, q, q, q, q, q, q)
; [eval] (inv_8_0(x, y, z) in xs9) && ((inv_8_1(x, y, z) in ys9) && (inv_8_2(x, y, z) in zs9))
; [eval] (inv_8_0(x, y, z) in xs9)
; [eval] inv_8_0(x, y, z)
(push) ; 4
; [then-branch: 256 | !(inv_8_0[Ref](x@203@01, y@204@01, z@205@01) in xs9@45@01) | live]
; [else-branch: 256 | inv_8_0[Ref](x@203@01, y@204@01, z@205@01) in xs9@45@01 | live]
(push) ; 5
; [then-branch: 256 | !(inv_8_0[Ref](x@203@01, y@204@01, z@205@01) in xs9@45@01)]
(assert (not (Set_in (inv_8_0<Ref> x@203@01 y@204@01 z@205@01) xs9@45@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 256 | inv_8_0[Ref](x@203@01, y@204@01, z@205@01) in xs9@45@01]
(assert (Set_in (inv_8_0<Ref> x@203@01 y@204@01 z@205@01) xs9@45@01))
; [eval] (inv_8_1(x, y, z) in ys9)
; [eval] inv_8_1(x, y, z)
(push) ; 6
; [then-branch: 257 | !(inv_8_1[Ref](x@203@01, y@204@01, z@205@01) in ys9@56@01) | live]
; [else-branch: 257 | inv_8_1[Ref](x@203@01, y@204@01, z@205@01) in ys9@56@01 | live]
(push) ; 7
; [then-branch: 257 | !(inv_8_1[Ref](x@203@01, y@204@01, z@205@01) in ys9@56@01)]
(assert (not (Set_in (inv_8_1<Ref> x@203@01 y@204@01 z@205@01) ys9@56@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 257 | inv_8_1[Ref](x@203@01, y@204@01, z@205@01) in ys9@56@01]
(assert (Set_in (inv_8_1<Ref> x@203@01 y@204@01 z@205@01) ys9@56@01))
; [eval] (inv_8_2(x, y, z) in zs9)
; [eval] inv_8_2(x, y, z)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_8_1<Ref> x@203@01 y@204@01 z@205@01) ys9@56@01)
  (not (Set_in (inv_8_1<Ref> x@203@01 y@204@01 z@205@01) ys9@56@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_8_0<Ref> x@203@01 y@204@01 z@205@01) xs9@45@01)
  (and
    (Set_in (inv_8_0<Ref> x@203@01 y@204@01 z@205@01) xs9@45@01)
    (or
      (Set_in (inv_8_1<Ref> x@203@01 y@204@01 z@205@01) ys9@56@01)
      (not (Set_in (inv_8_1<Ref> x@203@01 y@204@01 z@205@01) ys9@56@01))))))
(assert (or
  (Set_in (inv_8_0<Ref> x@203@01 y@204@01 z@205@01) xs9@45@01)
  (not (Set_in (inv_8_0<Ref> x@203@01 y@204@01 z@205@01) xs9@45@01))))
(push) ; 4
; [then-branch: 258 | inv_8_0[Ref](x@203@01, y@204@01, z@205@01) in xs9@45@01 && inv_8_1[Ref](x@203@01, y@204@01, z@205@01) in ys9@56@01 && inv_8_2[Ref](x@203@01, y@204@01, z@205@01) in zs9@67@01 | live]
; [else-branch: 258 | !(inv_8_0[Ref](x@203@01, y@204@01, z@205@01) in xs9@45@01 && inv_8_1[Ref](x@203@01, y@204@01, z@205@01) in ys9@56@01 && inv_8_2[Ref](x@203@01, y@204@01, z@205@01) in zs9@67@01) | live]
(push) ; 5
; [then-branch: 258 | inv_8_0[Ref](x@203@01, y@204@01, z@205@01) in xs9@45@01 && inv_8_1[Ref](x@203@01, y@204@01, z@205@01) in ys9@56@01 && inv_8_2[Ref](x@203@01, y@204@01, z@205@01) in zs9@67@01]
(assert (and
  (Set_in (inv_8_0<Ref> x@203@01 y@204@01 z@205@01) xs9@45@01)
  (and
    (Set_in (inv_8_1<Ref> x@203@01 y@204@01 z@205@01) ys9@56@01)
    (Set_in (inv_8_2<Ref> x@203@01 y@204@01 z@205@01) zs9@67@01))))
; [eval] perm(p(x, y, z)) >= __iar__assume_helper_8((inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) && (x == x && y == y && z == z), (inv_1_0(x, y, z) in xs2) && ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) && (x == x && y == y && z == z), (inv_2_0(x, y, z) in xs3) && ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) && (x == x && y == y && z == z), (inv_3_0(x, y, z) in xs4) && ((inv_3_1(x, y, z) in ys4) && (inv_3_2(x, y, z) in zs4)) && (x == x && y == y && z == z), (inv_4_0(x, y, z) in xs5) && ((inv_4_1(x, y, z) in ys5) && (inv_4_2(x, y, z) in zs5)) && (x == x && y == y && z == z), (inv_5_0(x, y, z) in xs6) && ((inv_5_1(x, y, z) in ys6) && (inv_5_2(x, y, z) in zs6)) && (x == x && y == y && z == z), (inv_6_0(x, y, z) in xs7) && ((inv_6_1(x, y, z) in ys7) && (inv_6_2(x, y, z) in zs7)) && (x == x && y == y && z == z), (inv_7_0(x, y, z) in xs8) && ((inv_7_1(x, y, z) in ys8) && (inv_7_2(x, y, z) in zs8)) && (x == x && y == y && z == z), q, q, q, q, q, q, q, q, q)
; [eval] perm(p(x, y, z))
; Definitional axioms for snapshot map values
(declare-const pm@206@01 $PPM)
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (=
    ($PSF.perm_p (as pm@206@01  $PPM) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    (ite
      (and
        (and (img@83@01 x y z) (img@85@01 x y z) (img@87@01 x y z))
        (and
          (Set_in (inv@82@01 x y z) xs@70@01)
          (and
            (Set_in (inv@84@01 x y z) ys@71@01)
            (Set_in (inv@86@01 x y z) zs@72@01))))
      q@73@01
      $Perm.No))
  :pattern (($PSF.perm_p (as pm@206@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resPrmSumDef18|)))
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (and
    ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    ($PSF.loc_p ($PSF.lookup_p $t@81@01 ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))))
  :pattern (($PSF.perm_p (as pm@206@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resTrgDef19|)))
(assert ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x@203@01)
    ($SortWrappers.$RefTo$Snap y@204@01))
  ($SortWrappers.$RefTo$Snap z@205@01))) ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x@203@01)
    ($SortWrappers.$RefTo$Snap y@204@01))
  ($SortWrappers.$RefTo$Snap z@205@01))))
; [eval] __iar__assume_helper_8((inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) && (x == x && y == y && z == z), (inv_1_0(x, y, z) in xs2) && ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) && (x == x && y == y && z == z), (inv_2_0(x, y, z) in xs3) && ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) && (x == x && y == y && z == z), (inv_3_0(x, y, z) in xs4) && ((inv_3_1(x, y, z) in ys4) && (inv_3_2(x, y, z) in zs4)) && (x == x && y == y && z == z), (inv_4_0(x, y, z) in xs5) && ((inv_4_1(x, y, z) in ys5) && (inv_4_2(x, y, z) in zs5)) && (x == x && y == y && z == z), (inv_5_0(x, y, z) in xs6) && ((inv_5_1(x, y, z) in ys6) && (inv_5_2(x, y, z) in zs6)) && (x == x && y == y && z == z), (inv_6_0(x, y, z) in xs7) && ((inv_6_1(x, y, z) in ys7) && (inv_6_2(x, y, z) in zs7)) && (x == x && y == y && z == z), (inv_7_0(x, y, z) in xs8) && ((inv_7_1(x, y, z) in ys8) && (inv_7_2(x, y, z) in zs8)) && (x == x && y == y && z == z), q, q, q, q, q, q, q, q, q)
; [eval] (inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) && (x == x && y == y && z == z)
; [eval] (inv_0_0(x, y, z) in xs1)
; [eval] inv_0_0(x, y, z)
(push) ; 6
; [then-branch: 259 | !(inv_0_0[Ref](x@203@01, y@204@01, z@205@01) in xs1@37@01) | live]
; [else-branch: 259 | inv_0_0[Ref](x@203@01, y@204@01, z@205@01) in xs1@37@01 | live]
(push) ; 7
; [then-branch: 259 | !(inv_0_0[Ref](x@203@01, y@204@01, z@205@01) in xs1@37@01)]
(assert (not (Set_in (inv_0_0<Ref> x@203@01 y@204@01 z@205@01) xs1@37@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 259 | inv_0_0[Ref](x@203@01, y@204@01, z@205@01) in xs1@37@01]
(assert (Set_in (inv_0_0<Ref> x@203@01 y@204@01 z@205@01) xs1@37@01))
; [eval] (inv_0_1(x, y, z) in ys1)
; [eval] inv_0_1(x, y, z)
(push) ; 8
; [then-branch: 260 | !(inv_0_1[Ref](x@203@01, y@204@01, z@205@01) in ys1@48@01) | live]
; [else-branch: 260 | inv_0_1[Ref](x@203@01, y@204@01, z@205@01) in ys1@48@01 | live]
(push) ; 9
; [then-branch: 260 | !(inv_0_1[Ref](x@203@01, y@204@01, z@205@01) in ys1@48@01)]
(assert (not (Set_in (inv_0_1<Ref> x@203@01 y@204@01 z@205@01) ys1@48@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 260 | inv_0_1[Ref](x@203@01, y@204@01, z@205@01) in ys1@48@01]
(assert (Set_in (inv_0_1<Ref> x@203@01 y@204@01 z@205@01) ys1@48@01))
; [eval] (inv_0_2(x, y, z) in zs1)
; [eval] inv_0_2(x, y, z)
(push) ; 10
; [then-branch: 261 | !(inv_0_2[Ref](x@203@01, y@204@01, z@205@01) in zs1@59@01) | live]
; [else-branch: 261 | inv_0_2[Ref](x@203@01, y@204@01, z@205@01) in zs1@59@01 | live]
(push) ; 11
; [then-branch: 261 | !(inv_0_2[Ref](x@203@01, y@204@01, z@205@01) in zs1@59@01)]
(assert (not (Set_in (inv_0_2<Ref> x@203@01 y@204@01 z@205@01) zs1@59@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 261 | inv_0_2[Ref](x@203@01, y@204@01, z@205@01) in zs1@59@01]
(assert (Set_in (inv_0_2<Ref> x@203@01 y@204@01 z@205@01) zs1@59@01))
; [eval] x == x
(push) ; 12
; [then-branch: 262 | False | live]
; [else-branch: 262 | True | live]
(push) ; 13
; [then-branch: 262 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 262 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 263 | False | live]
; [else-branch: 263 | True | live]
(push) ; 15
; [then-branch: 263 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 263 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_0_2<Ref> x@203@01 y@204@01 z@205@01) zs1@59@01)
  (not (Set_in (inv_0_2<Ref> x@203@01 y@204@01 z@205@01) zs1@59@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_0_1<Ref> x@203@01 y@204@01 z@205@01) ys1@48@01)
  (and
    (Set_in (inv_0_1<Ref> x@203@01 y@204@01 z@205@01) ys1@48@01)
    (or
      (Set_in (inv_0_2<Ref> x@203@01 y@204@01 z@205@01) zs1@59@01)
      (not (Set_in (inv_0_2<Ref> x@203@01 y@204@01 z@205@01) zs1@59@01))))))
(assert (or
  (Set_in (inv_0_1<Ref> x@203@01 y@204@01 z@205@01) ys1@48@01)
  (not (Set_in (inv_0_1<Ref> x@203@01 y@204@01 z@205@01) ys1@48@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_0_0<Ref> x@203@01 y@204@01 z@205@01) xs1@37@01)
  (and
    (Set_in (inv_0_0<Ref> x@203@01 y@204@01 z@205@01) xs1@37@01)
    (=>
      (Set_in (inv_0_1<Ref> x@203@01 y@204@01 z@205@01) ys1@48@01)
      (and
        (Set_in (inv_0_1<Ref> x@203@01 y@204@01 z@205@01) ys1@48@01)
        (or
          (Set_in (inv_0_2<Ref> x@203@01 y@204@01 z@205@01) zs1@59@01)
          (not (Set_in (inv_0_2<Ref> x@203@01 y@204@01 z@205@01) zs1@59@01)))))
    (or
      (Set_in (inv_0_1<Ref> x@203@01 y@204@01 z@205@01) ys1@48@01)
      (not (Set_in (inv_0_1<Ref> x@203@01 y@204@01 z@205@01) ys1@48@01))))))
(assert (or
  (Set_in (inv_0_0<Ref> x@203@01 y@204@01 z@205@01) xs1@37@01)
  (not (Set_in (inv_0_0<Ref> x@203@01 y@204@01 z@205@01) xs1@37@01))))
; [eval] (inv_1_0(x, y, z) in xs2) && ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) && (x == x && y == y && z == z)
; [eval] (inv_1_0(x, y, z) in xs2)
; [eval] inv_1_0(x, y, z)
(push) ; 6
; [then-branch: 264 | !(inv_1_0[Ref](x@203@01, y@204@01, z@205@01) in xs2@38@01) | live]
; [else-branch: 264 | inv_1_0[Ref](x@203@01, y@204@01, z@205@01) in xs2@38@01 | live]
(push) ; 7
; [then-branch: 264 | !(inv_1_0[Ref](x@203@01, y@204@01, z@205@01) in xs2@38@01)]
(assert (not (Set_in (inv_1_0<Ref> x@203@01 y@204@01 z@205@01) xs2@38@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 264 | inv_1_0[Ref](x@203@01, y@204@01, z@205@01) in xs2@38@01]
(assert (Set_in (inv_1_0<Ref> x@203@01 y@204@01 z@205@01) xs2@38@01))
; [eval] (inv_1_1(x, y, z) in ys2)
; [eval] inv_1_1(x, y, z)
(push) ; 8
; [then-branch: 265 | !(inv_1_1[Ref](x@203@01, y@204@01, z@205@01) in ys2@49@01) | live]
; [else-branch: 265 | inv_1_1[Ref](x@203@01, y@204@01, z@205@01) in ys2@49@01 | live]
(push) ; 9
; [then-branch: 265 | !(inv_1_1[Ref](x@203@01, y@204@01, z@205@01) in ys2@49@01)]
(assert (not (Set_in (inv_1_1<Ref> x@203@01 y@204@01 z@205@01) ys2@49@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 265 | inv_1_1[Ref](x@203@01, y@204@01, z@205@01) in ys2@49@01]
(assert (Set_in (inv_1_1<Ref> x@203@01 y@204@01 z@205@01) ys2@49@01))
; [eval] (inv_1_2(x, y, z) in zs2)
; [eval] inv_1_2(x, y, z)
(push) ; 10
; [then-branch: 266 | !(inv_1_2[Ref](x@203@01, y@204@01, z@205@01) in zs2@60@01) | live]
; [else-branch: 266 | inv_1_2[Ref](x@203@01, y@204@01, z@205@01) in zs2@60@01 | live]
(push) ; 11
; [then-branch: 266 | !(inv_1_2[Ref](x@203@01, y@204@01, z@205@01) in zs2@60@01)]
(assert (not (Set_in (inv_1_2<Ref> x@203@01 y@204@01 z@205@01) zs2@60@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 266 | inv_1_2[Ref](x@203@01, y@204@01, z@205@01) in zs2@60@01]
(assert (Set_in (inv_1_2<Ref> x@203@01 y@204@01 z@205@01) zs2@60@01))
; [eval] x == x
(push) ; 12
; [then-branch: 267 | False | live]
; [else-branch: 267 | True | live]
(push) ; 13
; [then-branch: 267 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 267 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 268 | False | live]
; [else-branch: 268 | True | live]
(push) ; 15
; [then-branch: 268 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 268 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_1_2<Ref> x@203@01 y@204@01 z@205@01) zs2@60@01)
  (not (Set_in (inv_1_2<Ref> x@203@01 y@204@01 z@205@01) zs2@60@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_1_1<Ref> x@203@01 y@204@01 z@205@01) ys2@49@01)
  (and
    (Set_in (inv_1_1<Ref> x@203@01 y@204@01 z@205@01) ys2@49@01)
    (or
      (Set_in (inv_1_2<Ref> x@203@01 y@204@01 z@205@01) zs2@60@01)
      (not (Set_in (inv_1_2<Ref> x@203@01 y@204@01 z@205@01) zs2@60@01))))))
(assert (or
  (Set_in (inv_1_1<Ref> x@203@01 y@204@01 z@205@01) ys2@49@01)
  (not (Set_in (inv_1_1<Ref> x@203@01 y@204@01 z@205@01) ys2@49@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_1_0<Ref> x@203@01 y@204@01 z@205@01) xs2@38@01)
  (and
    (Set_in (inv_1_0<Ref> x@203@01 y@204@01 z@205@01) xs2@38@01)
    (=>
      (Set_in (inv_1_1<Ref> x@203@01 y@204@01 z@205@01) ys2@49@01)
      (and
        (Set_in (inv_1_1<Ref> x@203@01 y@204@01 z@205@01) ys2@49@01)
        (or
          (Set_in (inv_1_2<Ref> x@203@01 y@204@01 z@205@01) zs2@60@01)
          (not (Set_in (inv_1_2<Ref> x@203@01 y@204@01 z@205@01) zs2@60@01)))))
    (or
      (Set_in (inv_1_1<Ref> x@203@01 y@204@01 z@205@01) ys2@49@01)
      (not (Set_in (inv_1_1<Ref> x@203@01 y@204@01 z@205@01) ys2@49@01))))))
(assert (or
  (Set_in (inv_1_0<Ref> x@203@01 y@204@01 z@205@01) xs2@38@01)
  (not (Set_in (inv_1_0<Ref> x@203@01 y@204@01 z@205@01) xs2@38@01))))
; [eval] (inv_2_0(x, y, z) in xs3) && ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) && (x == x && y == y && z == z)
; [eval] (inv_2_0(x, y, z) in xs3)
; [eval] inv_2_0(x, y, z)
(push) ; 6
; [then-branch: 269 | !(inv_2_0[Ref](x@203@01, y@204@01, z@205@01) in xs3@39@01) | live]
; [else-branch: 269 | inv_2_0[Ref](x@203@01, y@204@01, z@205@01) in xs3@39@01 | live]
(push) ; 7
; [then-branch: 269 | !(inv_2_0[Ref](x@203@01, y@204@01, z@205@01) in xs3@39@01)]
(assert (not (Set_in (inv_2_0<Ref> x@203@01 y@204@01 z@205@01) xs3@39@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 269 | inv_2_0[Ref](x@203@01, y@204@01, z@205@01) in xs3@39@01]
(assert (Set_in (inv_2_0<Ref> x@203@01 y@204@01 z@205@01) xs3@39@01))
; [eval] (inv_2_1(x, y, z) in ys3)
; [eval] inv_2_1(x, y, z)
(push) ; 8
; [then-branch: 270 | !(inv_2_1[Ref](x@203@01, y@204@01, z@205@01) in ys3@50@01) | live]
; [else-branch: 270 | inv_2_1[Ref](x@203@01, y@204@01, z@205@01) in ys3@50@01 | live]
(push) ; 9
; [then-branch: 270 | !(inv_2_1[Ref](x@203@01, y@204@01, z@205@01) in ys3@50@01)]
(assert (not (Set_in (inv_2_1<Ref> x@203@01 y@204@01 z@205@01) ys3@50@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 270 | inv_2_1[Ref](x@203@01, y@204@01, z@205@01) in ys3@50@01]
(assert (Set_in (inv_2_1<Ref> x@203@01 y@204@01 z@205@01) ys3@50@01))
; [eval] (inv_2_2(x, y, z) in zs3)
; [eval] inv_2_2(x, y, z)
(push) ; 10
; [then-branch: 271 | !(inv_2_2[Ref](x@203@01, y@204@01, z@205@01) in zs3@61@01) | live]
; [else-branch: 271 | inv_2_2[Ref](x@203@01, y@204@01, z@205@01) in zs3@61@01 | live]
(push) ; 11
; [then-branch: 271 | !(inv_2_2[Ref](x@203@01, y@204@01, z@205@01) in zs3@61@01)]
(assert (not (Set_in (inv_2_2<Ref> x@203@01 y@204@01 z@205@01) zs3@61@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 271 | inv_2_2[Ref](x@203@01, y@204@01, z@205@01) in zs3@61@01]
(assert (Set_in (inv_2_2<Ref> x@203@01 y@204@01 z@205@01) zs3@61@01))
; [eval] x == x
(push) ; 12
; [then-branch: 272 | False | live]
; [else-branch: 272 | True | live]
(push) ; 13
; [then-branch: 272 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 272 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 273 | False | live]
; [else-branch: 273 | True | live]
(push) ; 15
; [then-branch: 273 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 273 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_2_2<Ref> x@203@01 y@204@01 z@205@01) zs3@61@01)
  (not (Set_in (inv_2_2<Ref> x@203@01 y@204@01 z@205@01) zs3@61@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_2_1<Ref> x@203@01 y@204@01 z@205@01) ys3@50@01)
  (and
    (Set_in (inv_2_1<Ref> x@203@01 y@204@01 z@205@01) ys3@50@01)
    (or
      (Set_in (inv_2_2<Ref> x@203@01 y@204@01 z@205@01) zs3@61@01)
      (not (Set_in (inv_2_2<Ref> x@203@01 y@204@01 z@205@01) zs3@61@01))))))
(assert (or
  (Set_in (inv_2_1<Ref> x@203@01 y@204@01 z@205@01) ys3@50@01)
  (not (Set_in (inv_2_1<Ref> x@203@01 y@204@01 z@205@01) ys3@50@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_2_0<Ref> x@203@01 y@204@01 z@205@01) xs3@39@01)
  (and
    (Set_in (inv_2_0<Ref> x@203@01 y@204@01 z@205@01) xs3@39@01)
    (=>
      (Set_in (inv_2_1<Ref> x@203@01 y@204@01 z@205@01) ys3@50@01)
      (and
        (Set_in (inv_2_1<Ref> x@203@01 y@204@01 z@205@01) ys3@50@01)
        (or
          (Set_in (inv_2_2<Ref> x@203@01 y@204@01 z@205@01) zs3@61@01)
          (not (Set_in (inv_2_2<Ref> x@203@01 y@204@01 z@205@01) zs3@61@01)))))
    (or
      (Set_in (inv_2_1<Ref> x@203@01 y@204@01 z@205@01) ys3@50@01)
      (not (Set_in (inv_2_1<Ref> x@203@01 y@204@01 z@205@01) ys3@50@01))))))
(assert (or
  (Set_in (inv_2_0<Ref> x@203@01 y@204@01 z@205@01) xs3@39@01)
  (not (Set_in (inv_2_0<Ref> x@203@01 y@204@01 z@205@01) xs3@39@01))))
; [eval] (inv_3_0(x, y, z) in xs4) && ((inv_3_1(x, y, z) in ys4) && (inv_3_2(x, y, z) in zs4)) && (x == x && y == y && z == z)
; [eval] (inv_3_0(x, y, z) in xs4)
; [eval] inv_3_0(x, y, z)
(push) ; 6
; [then-branch: 274 | !(inv_3_0[Ref](x@203@01, y@204@01, z@205@01) in xs4@40@01) | live]
; [else-branch: 274 | inv_3_0[Ref](x@203@01, y@204@01, z@205@01) in xs4@40@01 | live]
(push) ; 7
; [then-branch: 274 | !(inv_3_0[Ref](x@203@01, y@204@01, z@205@01) in xs4@40@01)]
(assert (not (Set_in (inv_3_0<Ref> x@203@01 y@204@01 z@205@01) xs4@40@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 274 | inv_3_0[Ref](x@203@01, y@204@01, z@205@01) in xs4@40@01]
(assert (Set_in (inv_3_0<Ref> x@203@01 y@204@01 z@205@01) xs4@40@01))
; [eval] (inv_3_1(x, y, z) in ys4)
; [eval] inv_3_1(x, y, z)
(push) ; 8
; [then-branch: 275 | !(inv_3_1[Ref](x@203@01, y@204@01, z@205@01) in ys4@51@01) | live]
; [else-branch: 275 | inv_3_1[Ref](x@203@01, y@204@01, z@205@01) in ys4@51@01 | live]
(push) ; 9
; [then-branch: 275 | !(inv_3_1[Ref](x@203@01, y@204@01, z@205@01) in ys4@51@01)]
(assert (not (Set_in (inv_3_1<Ref> x@203@01 y@204@01 z@205@01) ys4@51@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 275 | inv_3_1[Ref](x@203@01, y@204@01, z@205@01) in ys4@51@01]
(assert (Set_in (inv_3_1<Ref> x@203@01 y@204@01 z@205@01) ys4@51@01))
; [eval] (inv_3_2(x, y, z) in zs4)
; [eval] inv_3_2(x, y, z)
(push) ; 10
; [then-branch: 276 | !(inv_3_2[Ref](x@203@01, y@204@01, z@205@01) in zs4@62@01) | live]
; [else-branch: 276 | inv_3_2[Ref](x@203@01, y@204@01, z@205@01) in zs4@62@01 | live]
(push) ; 11
; [then-branch: 276 | !(inv_3_2[Ref](x@203@01, y@204@01, z@205@01) in zs4@62@01)]
(assert (not (Set_in (inv_3_2<Ref> x@203@01 y@204@01 z@205@01) zs4@62@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 276 | inv_3_2[Ref](x@203@01, y@204@01, z@205@01) in zs4@62@01]
(assert (Set_in (inv_3_2<Ref> x@203@01 y@204@01 z@205@01) zs4@62@01))
; [eval] x == x
(push) ; 12
; [then-branch: 277 | False | live]
; [else-branch: 277 | True | live]
(push) ; 13
; [then-branch: 277 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 277 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 278 | False | live]
; [else-branch: 278 | True | live]
(push) ; 15
; [then-branch: 278 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 278 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_3_2<Ref> x@203@01 y@204@01 z@205@01) zs4@62@01)
  (not (Set_in (inv_3_2<Ref> x@203@01 y@204@01 z@205@01) zs4@62@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_3_1<Ref> x@203@01 y@204@01 z@205@01) ys4@51@01)
  (and
    (Set_in (inv_3_1<Ref> x@203@01 y@204@01 z@205@01) ys4@51@01)
    (or
      (Set_in (inv_3_2<Ref> x@203@01 y@204@01 z@205@01) zs4@62@01)
      (not (Set_in (inv_3_2<Ref> x@203@01 y@204@01 z@205@01) zs4@62@01))))))
(assert (or
  (Set_in (inv_3_1<Ref> x@203@01 y@204@01 z@205@01) ys4@51@01)
  (not (Set_in (inv_3_1<Ref> x@203@01 y@204@01 z@205@01) ys4@51@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_3_0<Ref> x@203@01 y@204@01 z@205@01) xs4@40@01)
  (and
    (Set_in (inv_3_0<Ref> x@203@01 y@204@01 z@205@01) xs4@40@01)
    (=>
      (Set_in (inv_3_1<Ref> x@203@01 y@204@01 z@205@01) ys4@51@01)
      (and
        (Set_in (inv_3_1<Ref> x@203@01 y@204@01 z@205@01) ys4@51@01)
        (or
          (Set_in (inv_3_2<Ref> x@203@01 y@204@01 z@205@01) zs4@62@01)
          (not (Set_in (inv_3_2<Ref> x@203@01 y@204@01 z@205@01) zs4@62@01)))))
    (or
      (Set_in (inv_3_1<Ref> x@203@01 y@204@01 z@205@01) ys4@51@01)
      (not (Set_in (inv_3_1<Ref> x@203@01 y@204@01 z@205@01) ys4@51@01))))))
(assert (or
  (Set_in (inv_3_0<Ref> x@203@01 y@204@01 z@205@01) xs4@40@01)
  (not (Set_in (inv_3_0<Ref> x@203@01 y@204@01 z@205@01) xs4@40@01))))
; [eval] (inv_4_0(x, y, z) in xs5) && ((inv_4_1(x, y, z) in ys5) && (inv_4_2(x, y, z) in zs5)) && (x == x && y == y && z == z)
; [eval] (inv_4_0(x, y, z) in xs5)
; [eval] inv_4_0(x, y, z)
(push) ; 6
; [then-branch: 279 | !(inv_4_0[Ref](x@203@01, y@204@01, z@205@01) in xs5@41@01) | live]
; [else-branch: 279 | inv_4_0[Ref](x@203@01, y@204@01, z@205@01) in xs5@41@01 | live]
(push) ; 7
; [then-branch: 279 | !(inv_4_0[Ref](x@203@01, y@204@01, z@205@01) in xs5@41@01)]
(assert (not (Set_in (inv_4_0<Ref> x@203@01 y@204@01 z@205@01) xs5@41@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 279 | inv_4_0[Ref](x@203@01, y@204@01, z@205@01) in xs5@41@01]
(assert (Set_in (inv_4_0<Ref> x@203@01 y@204@01 z@205@01) xs5@41@01))
; [eval] (inv_4_1(x, y, z) in ys5)
; [eval] inv_4_1(x, y, z)
(push) ; 8
; [then-branch: 280 | !(inv_4_1[Ref](x@203@01, y@204@01, z@205@01) in ys5@52@01) | live]
; [else-branch: 280 | inv_4_1[Ref](x@203@01, y@204@01, z@205@01) in ys5@52@01 | live]
(push) ; 9
; [then-branch: 280 | !(inv_4_1[Ref](x@203@01, y@204@01, z@205@01) in ys5@52@01)]
(assert (not (Set_in (inv_4_1<Ref> x@203@01 y@204@01 z@205@01) ys5@52@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 280 | inv_4_1[Ref](x@203@01, y@204@01, z@205@01) in ys5@52@01]
(assert (Set_in (inv_4_1<Ref> x@203@01 y@204@01 z@205@01) ys5@52@01))
; [eval] (inv_4_2(x, y, z) in zs5)
; [eval] inv_4_2(x, y, z)
(push) ; 10
; [then-branch: 281 | !(inv_4_2[Ref](x@203@01, y@204@01, z@205@01) in zs5@63@01) | live]
; [else-branch: 281 | inv_4_2[Ref](x@203@01, y@204@01, z@205@01) in zs5@63@01 | live]
(push) ; 11
; [then-branch: 281 | !(inv_4_2[Ref](x@203@01, y@204@01, z@205@01) in zs5@63@01)]
(assert (not (Set_in (inv_4_2<Ref> x@203@01 y@204@01 z@205@01) zs5@63@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 281 | inv_4_2[Ref](x@203@01, y@204@01, z@205@01) in zs5@63@01]
(assert (Set_in (inv_4_2<Ref> x@203@01 y@204@01 z@205@01) zs5@63@01))
; [eval] x == x
(push) ; 12
; [then-branch: 282 | False | live]
; [else-branch: 282 | True | live]
(push) ; 13
; [then-branch: 282 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 282 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 283 | False | live]
; [else-branch: 283 | True | live]
(push) ; 15
; [then-branch: 283 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 283 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_4_2<Ref> x@203@01 y@204@01 z@205@01) zs5@63@01)
  (not (Set_in (inv_4_2<Ref> x@203@01 y@204@01 z@205@01) zs5@63@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_4_1<Ref> x@203@01 y@204@01 z@205@01) ys5@52@01)
  (and
    (Set_in (inv_4_1<Ref> x@203@01 y@204@01 z@205@01) ys5@52@01)
    (or
      (Set_in (inv_4_2<Ref> x@203@01 y@204@01 z@205@01) zs5@63@01)
      (not (Set_in (inv_4_2<Ref> x@203@01 y@204@01 z@205@01) zs5@63@01))))))
(assert (or
  (Set_in (inv_4_1<Ref> x@203@01 y@204@01 z@205@01) ys5@52@01)
  (not (Set_in (inv_4_1<Ref> x@203@01 y@204@01 z@205@01) ys5@52@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_4_0<Ref> x@203@01 y@204@01 z@205@01) xs5@41@01)
  (and
    (Set_in (inv_4_0<Ref> x@203@01 y@204@01 z@205@01) xs5@41@01)
    (=>
      (Set_in (inv_4_1<Ref> x@203@01 y@204@01 z@205@01) ys5@52@01)
      (and
        (Set_in (inv_4_1<Ref> x@203@01 y@204@01 z@205@01) ys5@52@01)
        (or
          (Set_in (inv_4_2<Ref> x@203@01 y@204@01 z@205@01) zs5@63@01)
          (not (Set_in (inv_4_2<Ref> x@203@01 y@204@01 z@205@01) zs5@63@01)))))
    (or
      (Set_in (inv_4_1<Ref> x@203@01 y@204@01 z@205@01) ys5@52@01)
      (not (Set_in (inv_4_1<Ref> x@203@01 y@204@01 z@205@01) ys5@52@01))))))
(assert (or
  (Set_in (inv_4_0<Ref> x@203@01 y@204@01 z@205@01) xs5@41@01)
  (not (Set_in (inv_4_0<Ref> x@203@01 y@204@01 z@205@01) xs5@41@01))))
; [eval] (inv_5_0(x, y, z) in xs6) && ((inv_5_1(x, y, z) in ys6) && (inv_5_2(x, y, z) in zs6)) && (x == x && y == y && z == z)
; [eval] (inv_5_0(x, y, z) in xs6)
; [eval] inv_5_0(x, y, z)
(push) ; 6
; [then-branch: 284 | !(inv_5_0[Ref](x@203@01, y@204@01, z@205@01) in xs6@42@01) | live]
; [else-branch: 284 | inv_5_0[Ref](x@203@01, y@204@01, z@205@01) in xs6@42@01 | live]
(push) ; 7
; [then-branch: 284 | !(inv_5_0[Ref](x@203@01, y@204@01, z@205@01) in xs6@42@01)]
(assert (not (Set_in (inv_5_0<Ref> x@203@01 y@204@01 z@205@01) xs6@42@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 284 | inv_5_0[Ref](x@203@01, y@204@01, z@205@01) in xs6@42@01]
(assert (Set_in (inv_5_0<Ref> x@203@01 y@204@01 z@205@01) xs6@42@01))
; [eval] (inv_5_1(x, y, z) in ys6)
; [eval] inv_5_1(x, y, z)
(push) ; 8
; [then-branch: 285 | !(inv_5_1[Ref](x@203@01, y@204@01, z@205@01) in ys6@53@01) | live]
; [else-branch: 285 | inv_5_1[Ref](x@203@01, y@204@01, z@205@01) in ys6@53@01 | live]
(push) ; 9
; [then-branch: 285 | !(inv_5_1[Ref](x@203@01, y@204@01, z@205@01) in ys6@53@01)]
(assert (not (Set_in (inv_5_1<Ref> x@203@01 y@204@01 z@205@01) ys6@53@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 285 | inv_5_1[Ref](x@203@01, y@204@01, z@205@01) in ys6@53@01]
(assert (Set_in (inv_5_1<Ref> x@203@01 y@204@01 z@205@01) ys6@53@01))
; [eval] (inv_5_2(x, y, z) in zs6)
; [eval] inv_5_2(x, y, z)
(push) ; 10
; [then-branch: 286 | !(inv_5_2[Ref](x@203@01, y@204@01, z@205@01) in zs6@64@01) | live]
; [else-branch: 286 | inv_5_2[Ref](x@203@01, y@204@01, z@205@01) in zs6@64@01 | live]
(push) ; 11
; [then-branch: 286 | !(inv_5_2[Ref](x@203@01, y@204@01, z@205@01) in zs6@64@01)]
(assert (not (Set_in (inv_5_2<Ref> x@203@01 y@204@01 z@205@01) zs6@64@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 286 | inv_5_2[Ref](x@203@01, y@204@01, z@205@01) in zs6@64@01]
(assert (Set_in (inv_5_2<Ref> x@203@01 y@204@01 z@205@01) zs6@64@01))
; [eval] x == x
(push) ; 12
; [then-branch: 287 | False | live]
; [else-branch: 287 | True | live]
(push) ; 13
; [then-branch: 287 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 287 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 288 | False | live]
; [else-branch: 288 | True | live]
(push) ; 15
; [then-branch: 288 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 288 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_5_2<Ref> x@203@01 y@204@01 z@205@01) zs6@64@01)
  (not (Set_in (inv_5_2<Ref> x@203@01 y@204@01 z@205@01) zs6@64@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_5_1<Ref> x@203@01 y@204@01 z@205@01) ys6@53@01)
  (and
    (Set_in (inv_5_1<Ref> x@203@01 y@204@01 z@205@01) ys6@53@01)
    (or
      (Set_in (inv_5_2<Ref> x@203@01 y@204@01 z@205@01) zs6@64@01)
      (not (Set_in (inv_5_2<Ref> x@203@01 y@204@01 z@205@01) zs6@64@01))))))
(assert (or
  (Set_in (inv_5_1<Ref> x@203@01 y@204@01 z@205@01) ys6@53@01)
  (not (Set_in (inv_5_1<Ref> x@203@01 y@204@01 z@205@01) ys6@53@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_5_0<Ref> x@203@01 y@204@01 z@205@01) xs6@42@01)
  (and
    (Set_in (inv_5_0<Ref> x@203@01 y@204@01 z@205@01) xs6@42@01)
    (=>
      (Set_in (inv_5_1<Ref> x@203@01 y@204@01 z@205@01) ys6@53@01)
      (and
        (Set_in (inv_5_1<Ref> x@203@01 y@204@01 z@205@01) ys6@53@01)
        (or
          (Set_in (inv_5_2<Ref> x@203@01 y@204@01 z@205@01) zs6@64@01)
          (not (Set_in (inv_5_2<Ref> x@203@01 y@204@01 z@205@01) zs6@64@01)))))
    (or
      (Set_in (inv_5_1<Ref> x@203@01 y@204@01 z@205@01) ys6@53@01)
      (not (Set_in (inv_5_1<Ref> x@203@01 y@204@01 z@205@01) ys6@53@01))))))
(assert (or
  (Set_in (inv_5_0<Ref> x@203@01 y@204@01 z@205@01) xs6@42@01)
  (not (Set_in (inv_5_0<Ref> x@203@01 y@204@01 z@205@01) xs6@42@01))))
; [eval] (inv_6_0(x, y, z) in xs7) && ((inv_6_1(x, y, z) in ys7) && (inv_6_2(x, y, z) in zs7)) && (x == x && y == y && z == z)
; [eval] (inv_6_0(x, y, z) in xs7)
; [eval] inv_6_0(x, y, z)
(push) ; 6
; [then-branch: 289 | !(inv_6_0[Ref](x@203@01, y@204@01, z@205@01) in xs7@43@01) | live]
; [else-branch: 289 | inv_6_0[Ref](x@203@01, y@204@01, z@205@01) in xs7@43@01 | live]
(push) ; 7
; [then-branch: 289 | !(inv_6_0[Ref](x@203@01, y@204@01, z@205@01) in xs7@43@01)]
(assert (not (Set_in (inv_6_0<Ref> x@203@01 y@204@01 z@205@01) xs7@43@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 289 | inv_6_0[Ref](x@203@01, y@204@01, z@205@01) in xs7@43@01]
(assert (Set_in (inv_6_0<Ref> x@203@01 y@204@01 z@205@01) xs7@43@01))
; [eval] (inv_6_1(x, y, z) in ys7)
; [eval] inv_6_1(x, y, z)
(push) ; 8
; [then-branch: 290 | !(inv_6_1[Ref](x@203@01, y@204@01, z@205@01) in ys7@54@01) | live]
; [else-branch: 290 | inv_6_1[Ref](x@203@01, y@204@01, z@205@01) in ys7@54@01 | live]
(push) ; 9
; [then-branch: 290 | !(inv_6_1[Ref](x@203@01, y@204@01, z@205@01) in ys7@54@01)]
(assert (not (Set_in (inv_6_1<Ref> x@203@01 y@204@01 z@205@01) ys7@54@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 290 | inv_6_1[Ref](x@203@01, y@204@01, z@205@01) in ys7@54@01]
(assert (Set_in (inv_6_1<Ref> x@203@01 y@204@01 z@205@01) ys7@54@01))
; [eval] (inv_6_2(x, y, z) in zs7)
; [eval] inv_6_2(x, y, z)
(push) ; 10
; [then-branch: 291 | !(inv_6_2[Ref](x@203@01, y@204@01, z@205@01) in zs7@65@01) | live]
; [else-branch: 291 | inv_6_2[Ref](x@203@01, y@204@01, z@205@01) in zs7@65@01 | live]
(push) ; 11
; [then-branch: 291 | !(inv_6_2[Ref](x@203@01, y@204@01, z@205@01) in zs7@65@01)]
(assert (not (Set_in (inv_6_2<Ref> x@203@01 y@204@01 z@205@01) zs7@65@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 291 | inv_6_2[Ref](x@203@01, y@204@01, z@205@01) in zs7@65@01]
(assert (Set_in (inv_6_2<Ref> x@203@01 y@204@01 z@205@01) zs7@65@01))
; [eval] x == x
(push) ; 12
; [then-branch: 292 | False | live]
; [else-branch: 292 | True | live]
(push) ; 13
; [then-branch: 292 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 292 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 293 | False | live]
; [else-branch: 293 | True | live]
(push) ; 15
; [then-branch: 293 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 293 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_6_2<Ref> x@203@01 y@204@01 z@205@01) zs7@65@01)
  (not (Set_in (inv_6_2<Ref> x@203@01 y@204@01 z@205@01) zs7@65@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_6_1<Ref> x@203@01 y@204@01 z@205@01) ys7@54@01)
  (and
    (Set_in (inv_6_1<Ref> x@203@01 y@204@01 z@205@01) ys7@54@01)
    (or
      (Set_in (inv_6_2<Ref> x@203@01 y@204@01 z@205@01) zs7@65@01)
      (not (Set_in (inv_6_2<Ref> x@203@01 y@204@01 z@205@01) zs7@65@01))))))
(assert (or
  (Set_in (inv_6_1<Ref> x@203@01 y@204@01 z@205@01) ys7@54@01)
  (not (Set_in (inv_6_1<Ref> x@203@01 y@204@01 z@205@01) ys7@54@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_6_0<Ref> x@203@01 y@204@01 z@205@01) xs7@43@01)
  (and
    (Set_in (inv_6_0<Ref> x@203@01 y@204@01 z@205@01) xs7@43@01)
    (=>
      (Set_in (inv_6_1<Ref> x@203@01 y@204@01 z@205@01) ys7@54@01)
      (and
        (Set_in (inv_6_1<Ref> x@203@01 y@204@01 z@205@01) ys7@54@01)
        (or
          (Set_in (inv_6_2<Ref> x@203@01 y@204@01 z@205@01) zs7@65@01)
          (not (Set_in (inv_6_2<Ref> x@203@01 y@204@01 z@205@01) zs7@65@01)))))
    (or
      (Set_in (inv_6_1<Ref> x@203@01 y@204@01 z@205@01) ys7@54@01)
      (not (Set_in (inv_6_1<Ref> x@203@01 y@204@01 z@205@01) ys7@54@01))))))
(assert (or
  (Set_in (inv_6_0<Ref> x@203@01 y@204@01 z@205@01) xs7@43@01)
  (not (Set_in (inv_6_0<Ref> x@203@01 y@204@01 z@205@01) xs7@43@01))))
; [eval] (inv_7_0(x, y, z) in xs8) && ((inv_7_1(x, y, z) in ys8) && (inv_7_2(x, y, z) in zs8)) && (x == x && y == y && z == z)
; [eval] (inv_7_0(x, y, z) in xs8)
; [eval] inv_7_0(x, y, z)
(push) ; 6
; [then-branch: 294 | !(inv_7_0[Ref](x@203@01, y@204@01, z@205@01) in xs8@44@01) | live]
; [else-branch: 294 | inv_7_0[Ref](x@203@01, y@204@01, z@205@01) in xs8@44@01 | live]
(push) ; 7
; [then-branch: 294 | !(inv_7_0[Ref](x@203@01, y@204@01, z@205@01) in xs8@44@01)]
(assert (not (Set_in (inv_7_0<Ref> x@203@01 y@204@01 z@205@01) xs8@44@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 294 | inv_7_0[Ref](x@203@01, y@204@01, z@205@01) in xs8@44@01]
(assert (Set_in (inv_7_0<Ref> x@203@01 y@204@01 z@205@01) xs8@44@01))
; [eval] (inv_7_1(x, y, z) in ys8)
; [eval] inv_7_1(x, y, z)
(push) ; 8
; [then-branch: 295 | !(inv_7_1[Ref](x@203@01, y@204@01, z@205@01) in ys8@55@01) | live]
; [else-branch: 295 | inv_7_1[Ref](x@203@01, y@204@01, z@205@01) in ys8@55@01 | live]
(push) ; 9
; [then-branch: 295 | !(inv_7_1[Ref](x@203@01, y@204@01, z@205@01) in ys8@55@01)]
(assert (not (Set_in (inv_7_1<Ref> x@203@01 y@204@01 z@205@01) ys8@55@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 295 | inv_7_1[Ref](x@203@01, y@204@01, z@205@01) in ys8@55@01]
(assert (Set_in (inv_7_1<Ref> x@203@01 y@204@01 z@205@01) ys8@55@01))
; [eval] (inv_7_2(x, y, z) in zs8)
; [eval] inv_7_2(x, y, z)
(push) ; 10
; [then-branch: 296 | !(inv_7_2[Ref](x@203@01, y@204@01, z@205@01) in zs8@66@01) | live]
; [else-branch: 296 | inv_7_2[Ref](x@203@01, y@204@01, z@205@01) in zs8@66@01 | live]
(push) ; 11
; [then-branch: 296 | !(inv_7_2[Ref](x@203@01, y@204@01, z@205@01) in zs8@66@01)]
(assert (not (Set_in (inv_7_2<Ref> x@203@01 y@204@01 z@205@01) zs8@66@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 296 | inv_7_2[Ref](x@203@01, y@204@01, z@205@01) in zs8@66@01]
(assert (Set_in (inv_7_2<Ref> x@203@01 y@204@01 z@205@01) zs8@66@01))
; [eval] x == x
(push) ; 12
; [then-branch: 297 | False | live]
; [else-branch: 297 | True | live]
(push) ; 13
; [then-branch: 297 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 297 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 298 | False | live]
; [else-branch: 298 | True | live]
(push) ; 15
; [then-branch: 298 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 298 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_7_2<Ref> x@203@01 y@204@01 z@205@01) zs8@66@01)
  (not (Set_in (inv_7_2<Ref> x@203@01 y@204@01 z@205@01) zs8@66@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_7_1<Ref> x@203@01 y@204@01 z@205@01) ys8@55@01)
  (and
    (Set_in (inv_7_1<Ref> x@203@01 y@204@01 z@205@01) ys8@55@01)
    (or
      (Set_in (inv_7_2<Ref> x@203@01 y@204@01 z@205@01) zs8@66@01)
      (not (Set_in (inv_7_2<Ref> x@203@01 y@204@01 z@205@01) zs8@66@01))))))
(assert (or
  (Set_in (inv_7_1<Ref> x@203@01 y@204@01 z@205@01) ys8@55@01)
  (not (Set_in (inv_7_1<Ref> x@203@01 y@204@01 z@205@01) ys8@55@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_7_0<Ref> x@203@01 y@204@01 z@205@01) xs8@44@01)
  (and
    (Set_in (inv_7_0<Ref> x@203@01 y@204@01 z@205@01) xs8@44@01)
    (=>
      (Set_in (inv_7_1<Ref> x@203@01 y@204@01 z@205@01) ys8@55@01)
      (and
        (Set_in (inv_7_1<Ref> x@203@01 y@204@01 z@205@01) ys8@55@01)
        (or
          (Set_in (inv_7_2<Ref> x@203@01 y@204@01 z@205@01) zs8@66@01)
          (not (Set_in (inv_7_2<Ref> x@203@01 y@204@01 z@205@01) zs8@66@01)))))
    (or
      (Set_in (inv_7_1<Ref> x@203@01 y@204@01 z@205@01) ys8@55@01)
      (not (Set_in (inv_7_1<Ref> x@203@01 y@204@01 z@205@01) ys8@55@01))))))
(assert (or
  (Set_in (inv_7_0<Ref> x@203@01 y@204@01 z@205@01) xs8@44@01)
  (not (Set_in (inv_7_0<Ref> x@203@01 y@204@01 z@205@01) xs8@44@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 258 | !(inv_8_0[Ref](x@203@01, y@204@01, z@205@01) in xs9@45@01 && inv_8_1[Ref](x@203@01, y@204@01, z@205@01) in ys9@56@01 && inv_8_2[Ref](x@203@01, y@204@01, z@205@01) in zs9@67@01)]
(assert (not
  (and
    (Set_in (inv_8_0<Ref> x@203@01 y@204@01 z@205@01) xs9@45@01)
    (and
      (Set_in (inv_8_1<Ref> x@203@01 y@204@01 z@205@01) ys9@56@01)
      (Set_in (inv_8_2<Ref> x@203@01 y@204@01 z@205@01) zs9@67@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (=
    ($PSF.perm_p (as pm@206@01  $PPM) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    (ite
      (and
        (and (img@83@01 x y z) (img@85@01 x y z) (img@87@01 x y z))
        (and
          (Set_in (inv@82@01 x y z) xs@70@01)
          (and
            (Set_in (inv@84@01 x y z) ys@71@01)
            (Set_in (inv@86@01 x y z) zs@72@01))))
      q@73@01
      $Perm.No))
  :pattern (($PSF.perm_p (as pm@206@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resPrmSumDef18|)))
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (and
    ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    ($PSF.loc_p ($PSF.lookup_p $t@81@01 ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))))
  :pattern (($PSF.perm_p (as pm@206@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resTrgDef19|)))
(assert (=>
  (and
    (Set_in (inv_8_0<Ref> x@203@01 y@204@01 z@205@01) xs9@45@01)
    (and
      (Set_in (inv_8_1<Ref> x@203@01 y@204@01 z@205@01) ys9@56@01)
      (Set_in (inv_8_2<Ref> x@203@01 y@204@01 z@205@01) zs9@67@01)))
  (and
    (Set_in (inv_8_0<Ref> x@203@01 y@204@01 z@205@01) xs9@45@01)
    (Set_in (inv_8_1<Ref> x@203@01 y@204@01 z@205@01) ys9@56@01)
    (Set_in (inv_8_2<Ref> x@203@01 y@204@01 z@205@01) zs9@67@01)
    ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x@203@01)
        ($SortWrappers.$RefTo$Snap y@204@01))
      ($SortWrappers.$RefTo$Snap z@205@01))) ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x@203@01)
        ($SortWrappers.$RefTo$Snap y@204@01))
      ($SortWrappers.$RefTo$Snap z@205@01)))
    (=>
      (Set_in (inv_0_0<Ref> x@203@01 y@204@01 z@205@01) xs1@37@01)
      (and
        (Set_in (inv_0_0<Ref> x@203@01 y@204@01 z@205@01) xs1@37@01)
        (=>
          (Set_in (inv_0_1<Ref> x@203@01 y@204@01 z@205@01) ys1@48@01)
          (and
            (Set_in (inv_0_1<Ref> x@203@01 y@204@01 z@205@01) ys1@48@01)
            (or
              (Set_in (inv_0_2<Ref> x@203@01 y@204@01 z@205@01) zs1@59@01)
              (not (Set_in (inv_0_2<Ref> x@203@01 y@204@01 z@205@01) zs1@59@01)))))
        (or
          (Set_in (inv_0_1<Ref> x@203@01 y@204@01 z@205@01) ys1@48@01)
          (not (Set_in (inv_0_1<Ref> x@203@01 y@204@01 z@205@01) ys1@48@01)))))
    (or
      (Set_in (inv_0_0<Ref> x@203@01 y@204@01 z@205@01) xs1@37@01)
      (not (Set_in (inv_0_0<Ref> x@203@01 y@204@01 z@205@01) xs1@37@01)))
    (=>
      (Set_in (inv_1_0<Ref> x@203@01 y@204@01 z@205@01) xs2@38@01)
      (and
        (Set_in (inv_1_0<Ref> x@203@01 y@204@01 z@205@01) xs2@38@01)
        (=>
          (Set_in (inv_1_1<Ref> x@203@01 y@204@01 z@205@01) ys2@49@01)
          (and
            (Set_in (inv_1_1<Ref> x@203@01 y@204@01 z@205@01) ys2@49@01)
            (or
              (Set_in (inv_1_2<Ref> x@203@01 y@204@01 z@205@01) zs2@60@01)
              (not (Set_in (inv_1_2<Ref> x@203@01 y@204@01 z@205@01) zs2@60@01)))))
        (or
          (Set_in (inv_1_1<Ref> x@203@01 y@204@01 z@205@01) ys2@49@01)
          (not (Set_in (inv_1_1<Ref> x@203@01 y@204@01 z@205@01) ys2@49@01)))))
    (or
      (Set_in (inv_1_0<Ref> x@203@01 y@204@01 z@205@01) xs2@38@01)
      (not (Set_in (inv_1_0<Ref> x@203@01 y@204@01 z@205@01) xs2@38@01)))
    (=>
      (Set_in (inv_2_0<Ref> x@203@01 y@204@01 z@205@01) xs3@39@01)
      (and
        (Set_in (inv_2_0<Ref> x@203@01 y@204@01 z@205@01) xs3@39@01)
        (=>
          (Set_in (inv_2_1<Ref> x@203@01 y@204@01 z@205@01) ys3@50@01)
          (and
            (Set_in (inv_2_1<Ref> x@203@01 y@204@01 z@205@01) ys3@50@01)
            (or
              (Set_in (inv_2_2<Ref> x@203@01 y@204@01 z@205@01) zs3@61@01)
              (not (Set_in (inv_2_2<Ref> x@203@01 y@204@01 z@205@01) zs3@61@01)))))
        (or
          (Set_in (inv_2_1<Ref> x@203@01 y@204@01 z@205@01) ys3@50@01)
          (not (Set_in (inv_2_1<Ref> x@203@01 y@204@01 z@205@01) ys3@50@01)))))
    (or
      (Set_in (inv_2_0<Ref> x@203@01 y@204@01 z@205@01) xs3@39@01)
      (not (Set_in (inv_2_0<Ref> x@203@01 y@204@01 z@205@01) xs3@39@01)))
    (=>
      (Set_in (inv_3_0<Ref> x@203@01 y@204@01 z@205@01) xs4@40@01)
      (and
        (Set_in (inv_3_0<Ref> x@203@01 y@204@01 z@205@01) xs4@40@01)
        (=>
          (Set_in (inv_3_1<Ref> x@203@01 y@204@01 z@205@01) ys4@51@01)
          (and
            (Set_in (inv_3_1<Ref> x@203@01 y@204@01 z@205@01) ys4@51@01)
            (or
              (Set_in (inv_3_2<Ref> x@203@01 y@204@01 z@205@01) zs4@62@01)
              (not (Set_in (inv_3_2<Ref> x@203@01 y@204@01 z@205@01) zs4@62@01)))))
        (or
          (Set_in (inv_3_1<Ref> x@203@01 y@204@01 z@205@01) ys4@51@01)
          (not (Set_in (inv_3_1<Ref> x@203@01 y@204@01 z@205@01) ys4@51@01)))))
    (or
      (Set_in (inv_3_0<Ref> x@203@01 y@204@01 z@205@01) xs4@40@01)
      (not (Set_in (inv_3_0<Ref> x@203@01 y@204@01 z@205@01) xs4@40@01)))
    (=>
      (Set_in (inv_4_0<Ref> x@203@01 y@204@01 z@205@01) xs5@41@01)
      (and
        (Set_in (inv_4_0<Ref> x@203@01 y@204@01 z@205@01) xs5@41@01)
        (=>
          (Set_in (inv_4_1<Ref> x@203@01 y@204@01 z@205@01) ys5@52@01)
          (and
            (Set_in (inv_4_1<Ref> x@203@01 y@204@01 z@205@01) ys5@52@01)
            (or
              (Set_in (inv_4_2<Ref> x@203@01 y@204@01 z@205@01) zs5@63@01)
              (not (Set_in (inv_4_2<Ref> x@203@01 y@204@01 z@205@01) zs5@63@01)))))
        (or
          (Set_in (inv_4_1<Ref> x@203@01 y@204@01 z@205@01) ys5@52@01)
          (not (Set_in (inv_4_1<Ref> x@203@01 y@204@01 z@205@01) ys5@52@01)))))
    (or
      (Set_in (inv_4_0<Ref> x@203@01 y@204@01 z@205@01) xs5@41@01)
      (not (Set_in (inv_4_0<Ref> x@203@01 y@204@01 z@205@01) xs5@41@01)))
    (=>
      (Set_in (inv_5_0<Ref> x@203@01 y@204@01 z@205@01) xs6@42@01)
      (and
        (Set_in (inv_5_0<Ref> x@203@01 y@204@01 z@205@01) xs6@42@01)
        (=>
          (Set_in (inv_5_1<Ref> x@203@01 y@204@01 z@205@01) ys6@53@01)
          (and
            (Set_in (inv_5_1<Ref> x@203@01 y@204@01 z@205@01) ys6@53@01)
            (or
              (Set_in (inv_5_2<Ref> x@203@01 y@204@01 z@205@01) zs6@64@01)
              (not (Set_in (inv_5_2<Ref> x@203@01 y@204@01 z@205@01) zs6@64@01)))))
        (or
          (Set_in (inv_5_1<Ref> x@203@01 y@204@01 z@205@01) ys6@53@01)
          (not (Set_in (inv_5_1<Ref> x@203@01 y@204@01 z@205@01) ys6@53@01)))))
    (or
      (Set_in (inv_5_0<Ref> x@203@01 y@204@01 z@205@01) xs6@42@01)
      (not (Set_in (inv_5_0<Ref> x@203@01 y@204@01 z@205@01) xs6@42@01)))
    (=>
      (Set_in (inv_6_0<Ref> x@203@01 y@204@01 z@205@01) xs7@43@01)
      (and
        (Set_in (inv_6_0<Ref> x@203@01 y@204@01 z@205@01) xs7@43@01)
        (=>
          (Set_in (inv_6_1<Ref> x@203@01 y@204@01 z@205@01) ys7@54@01)
          (and
            (Set_in (inv_6_1<Ref> x@203@01 y@204@01 z@205@01) ys7@54@01)
            (or
              (Set_in (inv_6_2<Ref> x@203@01 y@204@01 z@205@01) zs7@65@01)
              (not (Set_in (inv_6_2<Ref> x@203@01 y@204@01 z@205@01) zs7@65@01)))))
        (or
          (Set_in (inv_6_1<Ref> x@203@01 y@204@01 z@205@01) ys7@54@01)
          (not (Set_in (inv_6_1<Ref> x@203@01 y@204@01 z@205@01) ys7@54@01)))))
    (or
      (Set_in (inv_6_0<Ref> x@203@01 y@204@01 z@205@01) xs7@43@01)
      (not (Set_in (inv_6_0<Ref> x@203@01 y@204@01 z@205@01) xs7@43@01)))
    (=>
      (Set_in (inv_7_0<Ref> x@203@01 y@204@01 z@205@01) xs8@44@01)
      (and
        (Set_in (inv_7_0<Ref> x@203@01 y@204@01 z@205@01) xs8@44@01)
        (=>
          (Set_in (inv_7_1<Ref> x@203@01 y@204@01 z@205@01) ys8@55@01)
          (and
            (Set_in (inv_7_1<Ref> x@203@01 y@204@01 z@205@01) ys8@55@01)
            (or
              (Set_in (inv_7_2<Ref> x@203@01 y@204@01 z@205@01) zs8@66@01)
              (not (Set_in (inv_7_2<Ref> x@203@01 y@204@01 z@205@01) zs8@66@01)))))
        (or
          (Set_in (inv_7_1<Ref> x@203@01 y@204@01 z@205@01) ys8@55@01)
          (not (Set_in (inv_7_1<Ref> x@203@01 y@204@01 z@205@01) ys8@55@01)))))
    (or
      (Set_in (inv_7_0<Ref> x@203@01 y@204@01 z@205@01) xs8@44@01)
      (not (Set_in (inv_7_0<Ref> x@203@01 y@204@01 z@205@01) xs8@44@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in (inv_8_0<Ref> x@203@01 y@204@01 z@205@01) xs9@45@01)
      (and
        (Set_in (inv_8_1<Ref> x@203@01 y@204@01 z@205@01) ys9@56@01)
        (Set_in (inv_8_2<Ref> x@203@01 y@204@01 z@205@01) zs9@67@01))))
  (and
    (Set_in (inv_8_0<Ref> x@203@01 y@204@01 z@205@01) xs9@45@01)
    (and
      (Set_in (inv_8_1<Ref> x@203@01 y@204@01 z@205@01) ys9@56@01)
      (Set_in (inv_8_2<Ref> x@203@01 y@204@01 z@205@01) zs9@67@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (=
    ($PSF.perm_p (as pm@206@01  $PPM) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    (ite
      (and
        (and (img@83@01 x y z) (img@85@01 x y z) (img@87@01 x y z))
        (and
          (Set_in (inv@82@01 x y z) xs@70@01)
          (and
            (Set_in (inv@84@01 x y z) ys@71@01)
            (Set_in (inv@86@01 x y z) zs@72@01))))
      q@73@01
      $Perm.No))
  :pattern (($PSF.perm_p (as pm@206@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resPrmSumDef18|)))
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (and
    ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    ($PSF.loc_p ($PSF.lookup_p $t@81@01 ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))))
  :pattern (($PSF.perm_p (as pm@206@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resTrgDef19|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@203@01 $Ref) (y@204@01 $Ref) (z@205@01 $Ref)) (!
  (and
    (=>
      (Set_in (inv_8_0<Ref> x@203@01 y@204@01 z@205@01) xs9@45@01)
      (and
        (Set_in (inv_8_0<Ref> x@203@01 y@204@01 z@205@01) xs9@45@01)
        (or
          (Set_in (inv_8_1<Ref> x@203@01 y@204@01 z@205@01) ys9@56@01)
          (not (Set_in (inv_8_1<Ref> x@203@01 y@204@01 z@205@01) ys9@56@01)))))
    (or
      (Set_in (inv_8_0<Ref> x@203@01 y@204@01 z@205@01) xs9@45@01)
      (not (Set_in (inv_8_0<Ref> x@203@01 y@204@01 z@205@01) xs9@45@01)))
    (=>
      (and
        (Set_in (inv_8_0<Ref> x@203@01 y@204@01 z@205@01) xs9@45@01)
        (and
          (Set_in (inv_8_1<Ref> x@203@01 y@204@01 z@205@01) ys9@56@01)
          (Set_in (inv_8_2<Ref> x@203@01 y@204@01 z@205@01) zs9@67@01)))
      (and
        (Set_in (inv_8_0<Ref> x@203@01 y@204@01 z@205@01) xs9@45@01)
        (Set_in (inv_8_1<Ref> x@203@01 y@204@01 z@205@01) ys9@56@01)
        (Set_in (inv_8_2<Ref> x@203@01 y@204@01 z@205@01) zs9@67@01)
        ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap x@203@01)
            ($SortWrappers.$RefTo$Snap y@204@01))
          ($SortWrappers.$RefTo$Snap z@205@01))) ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap x@203@01)
            ($SortWrappers.$RefTo$Snap y@204@01))
          ($SortWrappers.$RefTo$Snap z@205@01)))
        (=>
          (Set_in (inv_0_0<Ref> x@203@01 y@204@01 z@205@01) xs1@37@01)
          (and
            (Set_in (inv_0_0<Ref> x@203@01 y@204@01 z@205@01) xs1@37@01)
            (=>
              (Set_in (inv_0_1<Ref> x@203@01 y@204@01 z@205@01) ys1@48@01)
              (and
                (Set_in (inv_0_1<Ref> x@203@01 y@204@01 z@205@01) ys1@48@01)
                (or
                  (Set_in (inv_0_2<Ref> x@203@01 y@204@01 z@205@01) zs1@59@01)
                  (not
                    (Set_in (inv_0_2<Ref> x@203@01 y@204@01 z@205@01) zs1@59@01)))))
            (or
              (Set_in (inv_0_1<Ref> x@203@01 y@204@01 z@205@01) ys1@48@01)
              (not (Set_in (inv_0_1<Ref> x@203@01 y@204@01 z@205@01) ys1@48@01)))))
        (or
          (Set_in (inv_0_0<Ref> x@203@01 y@204@01 z@205@01) xs1@37@01)
          (not (Set_in (inv_0_0<Ref> x@203@01 y@204@01 z@205@01) xs1@37@01)))
        (=>
          (Set_in (inv_1_0<Ref> x@203@01 y@204@01 z@205@01) xs2@38@01)
          (and
            (Set_in (inv_1_0<Ref> x@203@01 y@204@01 z@205@01) xs2@38@01)
            (=>
              (Set_in (inv_1_1<Ref> x@203@01 y@204@01 z@205@01) ys2@49@01)
              (and
                (Set_in (inv_1_1<Ref> x@203@01 y@204@01 z@205@01) ys2@49@01)
                (or
                  (Set_in (inv_1_2<Ref> x@203@01 y@204@01 z@205@01) zs2@60@01)
                  (not
                    (Set_in (inv_1_2<Ref> x@203@01 y@204@01 z@205@01) zs2@60@01)))))
            (or
              (Set_in (inv_1_1<Ref> x@203@01 y@204@01 z@205@01) ys2@49@01)
              (not (Set_in (inv_1_1<Ref> x@203@01 y@204@01 z@205@01) ys2@49@01)))))
        (or
          (Set_in (inv_1_0<Ref> x@203@01 y@204@01 z@205@01) xs2@38@01)
          (not (Set_in (inv_1_0<Ref> x@203@01 y@204@01 z@205@01) xs2@38@01)))
        (=>
          (Set_in (inv_2_0<Ref> x@203@01 y@204@01 z@205@01) xs3@39@01)
          (and
            (Set_in (inv_2_0<Ref> x@203@01 y@204@01 z@205@01) xs3@39@01)
            (=>
              (Set_in (inv_2_1<Ref> x@203@01 y@204@01 z@205@01) ys3@50@01)
              (and
                (Set_in (inv_2_1<Ref> x@203@01 y@204@01 z@205@01) ys3@50@01)
                (or
                  (Set_in (inv_2_2<Ref> x@203@01 y@204@01 z@205@01) zs3@61@01)
                  (not
                    (Set_in (inv_2_2<Ref> x@203@01 y@204@01 z@205@01) zs3@61@01)))))
            (or
              (Set_in (inv_2_1<Ref> x@203@01 y@204@01 z@205@01) ys3@50@01)
              (not (Set_in (inv_2_1<Ref> x@203@01 y@204@01 z@205@01) ys3@50@01)))))
        (or
          (Set_in (inv_2_0<Ref> x@203@01 y@204@01 z@205@01) xs3@39@01)
          (not (Set_in (inv_2_0<Ref> x@203@01 y@204@01 z@205@01) xs3@39@01)))
        (=>
          (Set_in (inv_3_0<Ref> x@203@01 y@204@01 z@205@01) xs4@40@01)
          (and
            (Set_in (inv_3_0<Ref> x@203@01 y@204@01 z@205@01) xs4@40@01)
            (=>
              (Set_in (inv_3_1<Ref> x@203@01 y@204@01 z@205@01) ys4@51@01)
              (and
                (Set_in (inv_3_1<Ref> x@203@01 y@204@01 z@205@01) ys4@51@01)
                (or
                  (Set_in (inv_3_2<Ref> x@203@01 y@204@01 z@205@01) zs4@62@01)
                  (not
                    (Set_in (inv_3_2<Ref> x@203@01 y@204@01 z@205@01) zs4@62@01)))))
            (or
              (Set_in (inv_3_1<Ref> x@203@01 y@204@01 z@205@01) ys4@51@01)
              (not (Set_in (inv_3_1<Ref> x@203@01 y@204@01 z@205@01) ys4@51@01)))))
        (or
          (Set_in (inv_3_0<Ref> x@203@01 y@204@01 z@205@01) xs4@40@01)
          (not (Set_in (inv_3_0<Ref> x@203@01 y@204@01 z@205@01) xs4@40@01)))
        (=>
          (Set_in (inv_4_0<Ref> x@203@01 y@204@01 z@205@01) xs5@41@01)
          (and
            (Set_in (inv_4_0<Ref> x@203@01 y@204@01 z@205@01) xs5@41@01)
            (=>
              (Set_in (inv_4_1<Ref> x@203@01 y@204@01 z@205@01) ys5@52@01)
              (and
                (Set_in (inv_4_1<Ref> x@203@01 y@204@01 z@205@01) ys5@52@01)
                (or
                  (Set_in (inv_4_2<Ref> x@203@01 y@204@01 z@205@01) zs5@63@01)
                  (not
                    (Set_in (inv_4_2<Ref> x@203@01 y@204@01 z@205@01) zs5@63@01)))))
            (or
              (Set_in (inv_4_1<Ref> x@203@01 y@204@01 z@205@01) ys5@52@01)
              (not (Set_in (inv_4_1<Ref> x@203@01 y@204@01 z@205@01) ys5@52@01)))))
        (or
          (Set_in (inv_4_0<Ref> x@203@01 y@204@01 z@205@01) xs5@41@01)
          (not (Set_in (inv_4_0<Ref> x@203@01 y@204@01 z@205@01) xs5@41@01)))
        (=>
          (Set_in (inv_5_0<Ref> x@203@01 y@204@01 z@205@01) xs6@42@01)
          (and
            (Set_in (inv_5_0<Ref> x@203@01 y@204@01 z@205@01) xs6@42@01)
            (=>
              (Set_in (inv_5_1<Ref> x@203@01 y@204@01 z@205@01) ys6@53@01)
              (and
                (Set_in (inv_5_1<Ref> x@203@01 y@204@01 z@205@01) ys6@53@01)
                (or
                  (Set_in (inv_5_2<Ref> x@203@01 y@204@01 z@205@01) zs6@64@01)
                  (not
                    (Set_in (inv_5_2<Ref> x@203@01 y@204@01 z@205@01) zs6@64@01)))))
            (or
              (Set_in (inv_5_1<Ref> x@203@01 y@204@01 z@205@01) ys6@53@01)
              (not (Set_in (inv_5_1<Ref> x@203@01 y@204@01 z@205@01) ys6@53@01)))))
        (or
          (Set_in (inv_5_0<Ref> x@203@01 y@204@01 z@205@01) xs6@42@01)
          (not (Set_in (inv_5_0<Ref> x@203@01 y@204@01 z@205@01) xs6@42@01)))
        (=>
          (Set_in (inv_6_0<Ref> x@203@01 y@204@01 z@205@01) xs7@43@01)
          (and
            (Set_in (inv_6_0<Ref> x@203@01 y@204@01 z@205@01) xs7@43@01)
            (=>
              (Set_in (inv_6_1<Ref> x@203@01 y@204@01 z@205@01) ys7@54@01)
              (and
                (Set_in (inv_6_1<Ref> x@203@01 y@204@01 z@205@01) ys7@54@01)
                (or
                  (Set_in (inv_6_2<Ref> x@203@01 y@204@01 z@205@01) zs7@65@01)
                  (not
                    (Set_in (inv_6_2<Ref> x@203@01 y@204@01 z@205@01) zs7@65@01)))))
            (or
              (Set_in (inv_6_1<Ref> x@203@01 y@204@01 z@205@01) ys7@54@01)
              (not (Set_in (inv_6_1<Ref> x@203@01 y@204@01 z@205@01) ys7@54@01)))))
        (or
          (Set_in (inv_6_0<Ref> x@203@01 y@204@01 z@205@01) xs7@43@01)
          (not (Set_in (inv_6_0<Ref> x@203@01 y@204@01 z@205@01) xs7@43@01)))
        (=>
          (Set_in (inv_7_0<Ref> x@203@01 y@204@01 z@205@01) xs8@44@01)
          (and
            (Set_in (inv_7_0<Ref> x@203@01 y@204@01 z@205@01) xs8@44@01)
            (=>
              (Set_in (inv_7_1<Ref> x@203@01 y@204@01 z@205@01) ys8@55@01)
              (and
                (Set_in (inv_7_1<Ref> x@203@01 y@204@01 z@205@01) ys8@55@01)
                (or
                  (Set_in (inv_7_2<Ref> x@203@01 y@204@01 z@205@01) zs8@66@01)
                  (not
                    (Set_in (inv_7_2<Ref> x@203@01 y@204@01 z@205@01) zs8@66@01)))))
            (or
              (Set_in (inv_7_1<Ref> x@203@01 y@204@01 z@205@01) ys8@55@01)
              (not (Set_in (inv_7_1<Ref> x@203@01 y@204@01 z@205@01) ys8@55@01)))))
        (or
          (Set_in (inv_7_0<Ref> x@203@01 y@204@01 z@205@01) xs8@44@01)
          (not (Set_in (inv_7_0<Ref> x@203@01 y@204@01 z@205@01) xs8@44@01)))))
    (or
      (not
        (and
          (Set_in (inv_8_0<Ref> x@203@01 y@204@01 z@205@01) xs9@45@01)
          (and
            (Set_in (inv_8_1<Ref> x@203@01 y@204@01 z@205@01) ys9@56@01)
            (Set_in (inv_8_2<Ref> x@203@01 y@204@01 z@205@01) zs9@67@01))))
      (and
        (Set_in (inv_8_0<Ref> x@203@01 y@204@01 z@205@01) xs9@45@01)
        (and
          (Set_in (inv_8_1<Ref> x@203@01 y@204@01 z@205@01) ys9@56@01)
          (Set_in (inv_8_2<Ref> x@203@01 y@204@01 z@205@01) zs9@67@01)))))
  :pattern ((inv_8_0<Ref> x@203@01 y@204@01 z@205@01) (inv_8_1<Ref> x@203@01 y@204@01 z@205@01) (inv_8_2<Ref> x@203@01 y@204@01 z@205@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@28@9@28@122-aux|)))
(assert (forall ((x@203@01 $Ref) (y@204@01 $Ref) (z@205@01 $Ref)) (!
  (=>
    (and
      (Set_in (inv_8_0<Ref> x@203@01 y@204@01 z@205@01) xs9@45@01)
      (and
        (Set_in (inv_8_1<Ref> x@203@01 y@204@01 z@205@01) ys9@56@01)
        (Set_in (inv_8_2<Ref> x@203@01 y@204@01 z@205@01) zs9@67@01)))
    (>=
      ($PSF.perm_p (as pm@206@01  $PPM) ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap x@203@01)
          ($SortWrappers.$RefTo$Snap y@204@01))
        ($SortWrappers.$RefTo$Snap z@205@01)))
      (__iar__assume_helper_8<Perm> (and
        (Set_in (inv_0_0<Ref> x@203@01 y@204@01 z@205@01) xs1@37@01)
        (and
          (Set_in (inv_0_1<Ref> x@203@01 y@204@01 z@205@01) ys1@48@01)
          (Set_in (inv_0_2<Ref> x@203@01 y@204@01 z@205@01) zs1@59@01))) (and
        (Set_in (inv_1_0<Ref> x@203@01 y@204@01 z@205@01) xs2@38@01)
        (and
          (Set_in (inv_1_1<Ref> x@203@01 y@204@01 z@205@01) ys2@49@01)
          (Set_in (inv_1_2<Ref> x@203@01 y@204@01 z@205@01) zs2@60@01))) (and
        (Set_in (inv_2_0<Ref> x@203@01 y@204@01 z@205@01) xs3@39@01)
        (and
          (Set_in (inv_2_1<Ref> x@203@01 y@204@01 z@205@01) ys3@50@01)
          (Set_in (inv_2_2<Ref> x@203@01 y@204@01 z@205@01) zs3@61@01))) (and
        (Set_in (inv_3_0<Ref> x@203@01 y@204@01 z@205@01) xs4@40@01)
        (and
          (Set_in (inv_3_1<Ref> x@203@01 y@204@01 z@205@01) ys4@51@01)
          (Set_in (inv_3_2<Ref> x@203@01 y@204@01 z@205@01) zs4@62@01))) (and
        (Set_in (inv_4_0<Ref> x@203@01 y@204@01 z@205@01) xs5@41@01)
        (and
          (Set_in (inv_4_1<Ref> x@203@01 y@204@01 z@205@01) ys5@52@01)
          (Set_in (inv_4_2<Ref> x@203@01 y@204@01 z@205@01) zs5@63@01))) (and
        (Set_in (inv_5_0<Ref> x@203@01 y@204@01 z@205@01) xs6@42@01)
        (and
          (Set_in (inv_5_1<Ref> x@203@01 y@204@01 z@205@01) ys6@53@01)
          (Set_in (inv_5_2<Ref> x@203@01 y@204@01 z@205@01) zs6@64@01))) (and
        (Set_in (inv_6_0<Ref> x@203@01 y@204@01 z@205@01) xs7@43@01)
        (and
          (Set_in (inv_6_1<Ref> x@203@01 y@204@01 z@205@01) ys7@54@01)
          (Set_in (inv_6_2<Ref> x@203@01 y@204@01 z@205@01) zs7@65@01))) (and
        (Set_in (inv_7_0<Ref> x@203@01 y@204@01 z@205@01) xs8@44@01)
        (and
          (Set_in (inv_7_1<Ref> x@203@01 y@204@01 z@205@01) ys8@55@01)
          (Set_in (inv_7_2<Ref> x@203@01 y@204@01 z@205@01) zs8@66@01))) q@73@01 q@73@01 q@73@01 q@73@01 q@73@01 q@73@01 q@73@01 q@73@01 q@73@01)))
  :pattern ((inv_8_0<Ref> x@203@01 y@204@01 z@205@01) (inv_8_1<Ref> x@203@01 y@204@01 z@205@01) (inv_8_2<Ref> x@203@01 y@204@01 z@205@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@28@9@28@122|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x10: Ref, y10: Ref, z10: Ref ::
;     { p(x10, y10, z10) }
;     (x10 in xs10) && ((y10 in ys10) && (z10 in zs10)) ==>
;     inv_9_0(x10, y10, z10) == x10 && inv_9_1(x10, y10, z10) == y10 &&
;     inv_9_2(x10, y10, z10) == z10)
(declare-const $t@207@01 $Snap)
(assert (= $t@207@01 $Snap.unit))
; [eval] (forall x10: Ref, y10: Ref, z10: Ref :: { p(x10, y10, z10) } (x10 in xs10) && ((y10 in ys10) && (z10 in zs10)) ==> inv_9_0(x10, y10, z10) == x10 && inv_9_1(x10, y10, z10) == y10 && inv_9_2(x10, y10, z10) == z10)
(declare-const x10@208@01 $Ref)
(declare-const y10@209@01 $Ref)
(declare-const z10@210@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x10 in xs10) && ((y10 in ys10) && (z10 in zs10)) ==> inv_9_0(x10, y10, z10) == x10 && inv_9_1(x10, y10, z10) == y10 && inv_9_2(x10, y10, z10) == z10
; [eval] (x10 in xs10) && ((y10 in ys10) && (z10 in zs10))
; [eval] (x10 in xs10)
(push) ; 4
; [then-branch: 299 | !(x10@208@01 in xs10@46@01) | live]
; [else-branch: 299 | x10@208@01 in xs10@46@01 | live]
(push) ; 5
; [then-branch: 299 | !(x10@208@01 in xs10@46@01)]
(assert (not (Set_in x10@208@01 xs10@46@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 299 | x10@208@01 in xs10@46@01]
(assert (Set_in x10@208@01 xs10@46@01))
; [eval] (y10 in ys10)
(push) ; 6
; [then-branch: 300 | !(y10@209@01 in ys10@57@01) | live]
; [else-branch: 300 | y10@209@01 in ys10@57@01 | live]
(push) ; 7
; [then-branch: 300 | !(y10@209@01 in ys10@57@01)]
(assert (not (Set_in y10@209@01 ys10@57@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 300 | y10@209@01 in ys10@57@01]
(assert (Set_in y10@209@01 ys10@57@01))
; [eval] (z10 in zs10)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (Set_in y10@209@01 ys10@57@01) (not (Set_in y10@209@01 ys10@57@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in x10@208@01 xs10@46@01)
  (and
    (Set_in x10@208@01 xs10@46@01)
    (or (Set_in y10@209@01 ys10@57@01) (not (Set_in y10@209@01 ys10@57@01))))))
(assert (or (Set_in x10@208@01 xs10@46@01) (not (Set_in x10@208@01 xs10@46@01))))
(push) ; 4
; [then-branch: 301 | x10@208@01 in xs10@46@01 && y10@209@01 in ys10@57@01 && z10@210@01 in zs10@68@01 | live]
; [else-branch: 301 | !(x10@208@01 in xs10@46@01 && y10@209@01 in ys10@57@01 && z10@210@01 in zs10@68@01) | live]
(push) ; 5
; [then-branch: 301 | x10@208@01 in xs10@46@01 && y10@209@01 in ys10@57@01 && z10@210@01 in zs10@68@01]
(assert (and
  (Set_in x10@208@01 xs10@46@01)
  (and (Set_in y10@209@01 ys10@57@01) (Set_in z10@210@01 zs10@68@01))))
; [eval] inv_9_0(x10, y10, z10) == x10 && inv_9_1(x10, y10, z10) == y10 && inv_9_2(x10, y10, z10) == z10
; [eval] inv_9_0(x10, y10, z10) == x10
; [eval] inv_9_0(x10, y10, z10)
(push) ; 6
; [then-branch: 302 | inv_9_0[Ref](x10@208@01, y10@209@01, z10@210@01) != x10@208@01 | live]
; [else-branch: 302 | inv_9_0[Ref](x10@208@01, y10@209@01, z10@210@01) == x10@208@01 | live]
(push) ; 7
; [then-branch: 302 | inv_9_0[Ref](x10@208@01, y10@209@01, z10@210@01) != x10@208@01]
(assert (not (= (inv_9_0<Ref> x10@208@01 y10@209@01 z10@210@01) x10@208@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 302 | inv_9_0[Ref](x10@208@01, y10@209@01, z10@210@01) == x10@208@01]
(assert (= (inv_9_0<Ref> x10@208@01 y10@209@01 z10@210@01) x10@208@01))
; [eval] inv_9_1(x10, y10, z10) == y10
; [eval] inv_9_1(x10, y10, z10)
(push) ; 8
; [then-branch: 303 | inv_9_1[Ref](x10@208@01, y10@209@01, z10@210@01) != y10@209@01 | live]
; [else-branch: 303 | inv_9_1[Ref](x10@208@01, y10@209@01, z10@210@01) == y10@209@01 | live]
(push) ; 9
; [then-branch: 303 | inv_9_1[Ref](x10@208@01, y10@209@01, z10@210@01) != y10@209@01]
(assert (not (= (inv_9_1<Ref> x10@208@01 y10@209@01 z10@210@01) y10@209@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 303 | inv_9_1[Ref](x10@208@01, y10@209@01, z10@210@01) == y10@209@01]
(assert (= (inv_9_1<Ref> x10@208@01 y10@209@01 z10@210@01) y10@209@01))
; [eval] inv_9_2(x10, y10, z10) == z10
; [eval] inv_9_2(x10, y10, z10)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or
  (= (inv_9_1<Ref> x10@208@01 y10@209@01 z10@210@01) y10@209@01)
  (not (= (inv_9_1<Ref> x10@208@01 y10@209@01 z10@210@01) y10@209@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (= (inv_9_0<Ref> x10@208@01 y10@209@01 z10@210@01) x10@208@01)
  (and
    (= (inv_9_0<Ref> x10@208@01 y10@209@01 z10@210@01) x10@208@01)
    (or
      (= (inv_9_1<Ref> x10@208@01 y10@209@01 z10@210@01) y10@209@01)
      (not (= (inv_9_1<Ref> x10@208@01 y10@209@01 z10@210@01) y10@209@01))))))
(assert (or
  (= (inv_9_0<Ref> x10@208@01 y10@209@01 z10@210@01) x10@208@01)
  (not (= (inv_9_0<Ref> x10@208@01 y10@209@01 z10@210@01) x10@208@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 301 | !(x10@208@01 in xs10@46@01 && y10@209@01 in ys10@57@01 && z10@210@01 in zs10@68@01)]
(assert (not
  (and
    (Set_in x10@208@01 xs10@46@01)
    (and (Set_in y10@209@01 ys10@57@01) (Set_in z10@210@01 zs10@68@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Set_in x10@208@01 xs10@46@01)
    (and (Set_in y10@209@01 ys10@57@01) (Set_in z10@210@01 zs10@68@01)))
  (and
    (Set_in x10@208@01 xs10@46@01)
    (Set_in y10@209@01 ys10@57@01)
    (Set_in z10@210@01 zs10@68@01)
    (=>
      (= (inv_9_0<Ref> x10@208@01 y10@209@01 z10@210@01) x10@208@01)
      (and
        (= (inv_9_0<Ref> x10@208@01 y10@209@01 z10@210@01) x10@208@01)
        (or
          (= (inv_9_1<Ref> x10@208@01 y10@209@01 z10@210@01) y10@209@01)
          (not (= (inv_9_1<Ref> x10@208@01 y10@209@01 z10@210@01) y10@209@01)))))
    (or
      (= (inv_9_0<Ref> x10@208@01 y10@209@01 z10@210@01) x10@208@01)
      (not (= (inv_9_0<Ref> x10@208@01 y10@209@01 z10@210@01) x10@208@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in x10@208@01 xs10@46@01)
      (and (Set_in y10@209@01 ys10@57@01) (Set_in z10@210@01 zs10@68@01))))
  (and
    (Set_in x10@208@01 xs10@46@01)
    (and (Set_in y10@209@01 ys10@57@01) (Set_in z10@210@01 zs10@68@01)))))
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x10@208@01 $Ref) (y10@209@01 $Ref) (z10@210@01 $Ref)) (!
  (and
    (=>
      (Set_in x10@208@01 xs10@46@01)
      (and
        (Set_in x10@208@01 xs10@46@01)
        (or (Set_in y10@209@01 ys10@57@01) (not (Set_in y10@209@01 ys10@57@01)))))
    (or (Set_in x10@208@01 xs10@46@01) (not (Set_in x10@208@01 xs10@46@01)))
    (=>
      (and
        (Set_in x10@208@01 xs10@46@01)
        (and (Set_in y10@209@01 ys10@57@01) (Set_in z10@210@01 zs10@68@01)))
      (and
        (Set_in x10@208@01 xs10@46@01)
        (Set_in y10@209@01 ys10@57@01)
        (Set_in z10@210@01 zs10@68@01)
        (=>
          (= (inv_9_0<Ref> x10@208@01 y10@209@01 z10@210@01) x10@208@01)
          (and
            (= (inv_9_0<Ref> x10@208@01 y10@209@01 z10@210@01) x10@208@01)
            (or
              (= (inv_9_1<Ref> x10@208@01 y10@209@01 z10@210@01) y10@209@01)
              (not
                (= (inv_9_1<Ref> x10@208@01 y10@209@01 z10@210@01) y10@209@01)))))
        (or
          (= (inv_9_0<Ref> x10@208@01 y10@209@01 z10@210@01) x10@208@01)
          (not (= (inv_9_0<Ref> x10@208@01 y10@209@01 z10@210@01) x10@208@01)))))
    (or
      (not
        (and
          (Set_in x10@208@01 xs10@46@01)
          (and (Set_in y10@209@01 ys10@57@01) (Set_in z10@210@01 zs10@68@01))))
      (and
        (Set_in x10@208@01 xs10@46@01)
        (and (Set_in y10@209@01 ys10@57@01) (Set_in z10@210@01 zs10@68@01)))))
  :pattern (($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap x10@208@01)
      ($SortWrappers.$RefTo$Snap y10@209@01))
    ($SortWrappers.$RefTo$Snap z10@210@01))) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap x10@208@01)
      ($SortWrappers.$RefTo$Snap y10@209@01))
    ($SortWrappers.$RefTo$Snap z10@210@01))))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@29@9@29@137-aux|)))
(assert (forall ((x10@208@01 $Ref) (y10@209@01 $Ref) (z10@210@01 $Ref)) (!
  (=>
    (and
      (Set_in x10@208@01 xs10@46@01)
      (and (Set_in y10@209@01 ys10@57@01) (Set_in z10@210@01 zs10@68@01)))
    (and
      (= (inv_9_0<Ref> x10@208@01 y10@209@01 z10@210@01) x10@208@01)
      (and
        (= (inv_9_1<Ref> x10@208@01 y10@209@01 z10@210@01) y10@209@01)
        (= (inv_9_2<Ref> x10@208@01 y10@209@01 z10@210@01) z10@210@01))))
  :pattern (($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap x10@208@01)
      ($SortWrappers.$RefTo$Snap y10@209@01))
    ($SortWrappers.$RefTo$Snap z10@210@01))) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap x10@208@01)
      ($SortWrappers.$RefTo$Snap y10@209@01))
    ($SortWrappers.$RefTo$Snap z10@210@01))))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@29@9@29@137|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x: Ref, y: Ref, z: Ref ::
;     { inv_9_0(x, y, z), inv_9_1(x, y, z), inv_9_2(x, y, z) }
;     (inv_9_0(x, y, z) in xs10) &&
;     ((inv_9_1(x, y, z) in ys10) && (inv_9_2(x, y, z) in zs10)) ==>
;     inv_9_0(x, y, z) == x && inv_9_1(x, y, z) == y && inv_9_2(x, y, z) == z)
(declare-const $t@211@01 $Snap)
(assert (= $t@211@01 $Snap.unit))
; [eval] (forall x: Ref, y: Ref, z: Ref :: { inv_9_0(x, y, z), inv_9_1(x, y, z), inv_9_2(x, y, z) } (inv_9_0(x, y, z) in xs10) && ((inv_9_1(x, y, z) in ys10) && (inv_9_2(x, y, z) in zs10)) ==> inv_9_0(x, y, z) == x && inv_9_1(x, y, z) == y && inv_9_2(x, y, z) == z)
(declare-const x@212@01 $Ref)
(declare-const y@213@01 $Ref)
(declare-const z@214@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (inv_9_0(x, y, z) in xs10) && ((inv_9_1(x, y, z) in ys10) && (inv_9_2(x, y, z) in zs10)) ==> inv_9_0(x, y, z) == x && inv_9_1(x, y, z) == y && inv_9_2(x, y, z) == z
; [eval] (inv_9_0(x, y, z) in xs10) && ((inv_9_1(x, y, z) in ys10) && (inv_9_2(x, y, z) in zs10))
; [eval] (inv_9_0(x, y, z) in xs10)
; [eval] inv_9_0(x, y, z)
(push) ; 4
; [then-branch: 304 | !(inv_9_0[Ref](x@212@01, y@213@01, z@214@01) in xs10@46@01) | live]
; [else-branch: 304 | inv_9_0[Ref](x@212@01, y@213@01, z@214@01) in xs10@46@01 | live]
(push) ; 5
; [then-branch: 304 | !(inv_9_0[Ref](x@212@01, y@213@01, z@214@01) in xs10@46@01)]
(assert (not (Set_in (inv_9_0<Ref> x@212@01 y@213@01 z@214@01) xs10@46@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 304 | inv_9_0[Ref](x@212@01, y@213@01, z@214@01) in xs10@46@01]
(assert (Set_in (inv_9_0<Ref> x@212@01 y@213@01 z@214@01) xs10@46@01))
; [eval] (inv_9_1(x, y, z) in ys10)
; [eval] inv_9_1(x, y, z)
(push) ; 6
; [then-branch: 305 | !(inv_9_1[Ref](x@212@01, y@213@01, z@214@01) in ys10@57@01) | live]
; [else-branch: 305 | inv_9_1[Ref](x@212@01, y@213@01, z@214@01) in ys10@57@01 | live]
(push) ; 7
; [then-branch: 305 | !(inv_9_1[Ref](x@212@01, y@213@01, z@214@01) in ys10@57@01)]
(assert (not (Set_in (inv_9_1<Ref> x@212@01 y@213@01 z@214@01) ys10@57@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 305 | inv_9_1[Ref](x@212@01, y@213@01, z@214@01) in ys10@57@01]
(assert (Set_in (inv_9_1<Ref> x@212@01 y@213@01 z@214@01) ys10@57@01))
; [eval] (inv_9_2(x, y, z) in zs10)
; [eval] inv_9_2(x, y, z)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_9_1<Ref> x@212@01 y@213@01 z@214@01) ys10@57@01)
  (not (Set_in (inv_9_1<Ref> x@212@01 y@213@01 z@214@01) ys10@57@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_9_0<Ref> x@212@01 y@213@01 z@214@01) xs10@46@01)
  (and
    (Set_in (inv_9_0<Ref> x@212@01 y@213@01 z@214@01) xs10@46@01)
    (or
      (Set_in (inv_9_1<Ref> x@212@01 y@213@01 z@214@01) ys10@57@01)
      (not (Set_in (inv_9_1<Ref> x@212@01 y@213@01 z@214@01) ys10@57@01))))))
(assert (or
  (Set_in (inv_9_0<Ref> x@212@01 y@213@01 z@214@01) xs10@46@01)
  (not (Set_in (inv_9_0<Ref> x@212@01 y@213@01 z@214@01) xs10@46@01))))
(push) ; 4
; [then-branch: 306 | inv_9_0[Ref](x@212@01, y@213@01, z@214@01) in xs10@46@01 && inv_9_1[Ref](x@212@01, y@213@01, z@214@01) in ys10@57@01 && inv_9_2[Ref](x@212@01, y@213@01, z@214@01) in zs10@68@01 | live]
; [else-branch: 306 | !(inv_9_0[Ref](x@212@01, y@213@01, z@214@01) in xs10@46@01 && inv_9_1[Ref](x@212@01, y@213@01, z@214@01) in ys10@57@01 && inv_9_2[Ref](x@212@01, y@213@01, z@214@01) in zs10@68@01) | live]
(push) ; 5
; [then-branch: 306 | inv_9_0[Ref](x@212@01, y@213@01, z@214@01) in xs10@46@01 && inv_9_1[Ref](x@212@01, y@213@01, z@214@01) in ys10@57@01 && inv_9_2[Ref](x@212@01, y@213@01, z@214@01) in zs10@68@01]
(assert (and
  (Set_in (inv_9_0<Ref> x@212@01 y@213@01 z@214@01) xs10@46@01)
  (and
    (Set_in (inv_9_1<Ref> x@212@01 y@213@01 z@214@01) ys10@57@01)
    (Set_in (inv_9_2<Ref> x@212@01 y@213@01 z@214@01) zs10@68@01))))
; [eval] inv_9_0(x, y, z) == x && inv_9_1(x, y, z) == y && inv_9_2(x, y, z) == z
; [eval] inv_9_0(x, y, z) == x
; [eval] inv_9_0(x, y, z)
(push) ; 6
; [then-branch: 307 | inv_9_0[Ref](x@212@01, y@213@01, z@214@01) != x@212@01 | live]
; [else-branch: 307 | inv_9_0[Ref](x@212@01, y@213@01, z@214@01) == x@212@01 | live]
(push) ; 7
; [then-branch: 307 | inv_9_0[Ref](x@212@01, y@213@01, z@214@01) != x@212@01]
(assert (not (= (inv_9_0<Ref> x@212@01 y@213@01 z@214@01) x@212@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 307 | inv_9_0[Ref](x@212@01, y@213@01, z@214@01) == x@212@01]
(assert (= (inv_9_0<Ref> x@212@01 y@213@01 z@214@01) x@212@01))
; [eval] inv_9_1(x, y, z) == y
; [eval] inv_9_1(x, y, z)
(push) ; 8
; [then-branch: 308 | inv_9_1[Ref](x@212@01, y@213@01, z@214@01) != y@213@01 | live]
; [else-branch: 308 | inv_9_1[Ref](x@212@01, y@213@01, z@214@01) == y@213@01 | live]
(push) ; 9
; [then-branch: 308 | inv_9_1[Ref](x@212@01, y@213@01, z@214@01) != y@213@01]
(assert (not (= (inv_9_1<Ref> x@212@01 y@213@01 z@214@01) y@213@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 308 | inv_9_1[Ref](x@212@01, y@213@01, z@214@01) == y@213@01]
(assert (= (inv_9_1<Ref> x@212@01 y@213@01 z@214@01) y@213@01))
; [eval] inv_9_2(x, y, z) == z
; [eval] inv_9_2(x, y, z)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or
  (= (inv_9_1<Ref> x@212@01 y@213@01 z@214@01) y@213@01)
  (not (= (inv_9_1<Ref> x@212@01 y@213@01 z@214@01) y@213@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (= (inv_9_0<Ref> x@212@01 y@213@01 z@214@01) x@212@01)
  (and
    (= (inv_9_0<Ref> x@212@01 y@213@01 z@214@01) x@212@01)
    (or
      (= (inv_9_1<Ref> x@212@01 y@213@01 z@214@01) y@213@01)
      (not (= (inv_9_1<Ref> x@212@01 y@213@01 z@214@01) y@213@01))))))
(assert (or
  (= (inv_9_0<Ref> x@212@01 y@213@01 z@214@01) x@212@01)
  (not (= (inv_9_0<Ref> x@212@01 y@213@01 z@214@01) x@212@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 306 | !(inv_9_0[Ref](x@212@01, y@213@01, z@214@01) in xs10@46@01 && inv_9_1[Ref](x@212@01, y@213@01, z@214@01) in ys10@57@01 && inv_9_2[Ref](x@212@01, y@213@01, z@214@01) in zs10@68@01)]
(assert (not
  (and
    (Set_in (inv_9_0<Ref> x@212@01 y@213@01 z@214@01) xs10@46@01)
    (and
      (Set_in (inv_9_1<Ref> x@212@01 y@213@01 z@214@01) ys10@57@01)
      (Set_in (inv_9_2<Ref> x@212@01 y@213@01 z@214@01) zs10@68@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Set_in (inv_9_0<Ref> x@212@01 y@213@01 z@214@01) xs10@46@01)
    (and
      (Set_in (inv_9_1<Ref> x@212@01 y@213@01 z@214@01) ys10@57@01)
      (Set_in (inv_9_2<Ref> x@212@01 y@213@01 z@214@01) zs10@68@01)))
  (and
    (Set_in (inv_9_0<Ref> x@212@01 y@213@01 z@214@01) xs10@46@01)
    (Set_in (inv_9_1<Ref> x@212@01 y@213@01 z@214@01) ys10@57@01)
    (Set_in (inv_9_2<Ref> x@212@01 y@213@01 z@214@01) zs10@68@01)
    (=>
      (= (inv_9_0<Ref> x@212@01 y@213@01 z@214@01) x@212@01)
      (and
        (= (inv_9_0<Ref> x@212@01 y@213@01 z@214@01) x@212@01)
        (or
          (= (inv_9_1<Ref> x@212@01 y@213@01 z@214@01) y@213@01)
          (not (= (inv_9_1<Ref> x@212@01 y@213@01 z@214@01) y@213@01)))))
    (or
      (= (inv_9_0<Ref> x@212@01 y@213@01 z@214@01) x@212@01)
      (not (= (inv_9_0<Ref> x@212@01 y@213@01 z@214@01) x@212@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in (inv_9_0<Ref> x@212@01 y@213@01 z@214@01) xs10@46@01)
      (and
        (Set_in (inv_9_1<Ref> x@212@01 y@213@01 z@214@01) ys10@57@01)
        (Set_in (inv_9_2<Ref> x@212@01 y@213@01 z@214@01) zs10@68@01))))
  (and
    (Set_in (inv_9_0<Ref> x@212@01 y@213@01 z@214@01) xs10@46@01)
    (and
      (Set_in (inv_9_1<Ref> x@212@01 y@213@01 z@214@01) ys10@57@01)
      (Set_in (inv_9_2<Ref> x@212@01 y@213@01 z@214@01) zs10@68@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@212@01 $Ref) (y@213@01 $Ref) (z@214@01 $Ref)) (!
  (and
    (=>
      (Set_in (inv_9_0<Ref> x@212@01 y@213@01 z@214@01) xs10@46@01)
      (and
        (Set_in (inv_9_0<Ref> x@212@01 y@213@01 z@214@01) xs10@46@01)
        (or
          (Set_in (inv_9_1<Ref> x@212@01 y@213@01 z@214@01) ys10@57@01)
          (not (Set_in (inv_9_1<Ref> x@212@01 y@213@01 z@214@01) ys10@57@01)))))
    (or
      (Set_in (inv_9_0<Ref> x@212@01 y@213@01 z@214@01) xs10@46@01)
      (not (Set_in (inv_9_0<Ref> x@212@01 y@213@01 z@214@01) xs10@46@01)))
    (=>
      (and
        (Set_in (inv_9_0<Ref> x@212@01 y@213@01 z@214@01) xs10@46@01)
        (and
          (Set_in (inv_9_1<Ref> x@212@01 y@213@01 z@214@01) ys10@57@01)
          (Set_in (inv_9_2<Ref> x@212@01 y@213@01 z@214@01) zs10@68@01)))
      (and
        (Set_in (inv_9_0<Ref> x@212@01 y@213@01 z@214@01) xs10@46@01)
        (Set_in (inv_9_1<Ref> x@212@01 y@213@01 z@214@01) ys10@57@01)
        (Set_in (inv_9_2<Ref> x@212@01 y@213@01 z@214@01) zs10@68@01)
        (=>
          (= (inv_9_0<Ref> x@212@01 y@213@01 z@214@01) x@212@01)
          (and
            (= (inv_9_0<Ref> x@212@01 y@213@01 z@214@01) x@212@01)
            (or
              (= (inv_9_1<Ref> x@212@01 y@213@01 z@214@01) y@213@01)
              (not (= (inv_9_1<Ref> x@212@01 y@213@01 z@214@01) y@213@01)))))
        (or
          (= (inv_9_0<Ref> x@212@01 y@213@01 z@214@01) x@212@01)
          (not (= (inv_9_0<Ref> x@212@01 y@213@01 z@214@01) x@212@01)))))
    (or
      (not
        (and
          (Set_in (inv_9_0<Ref> x@212@01 y@213@01 z@214@01) xs10@46@01)
          (and
            (Set_in (inv_9_1<Ref> x@212@01 y@213@01 z@214@01) ys10@57@01)
            (Set_in (inv_9_2<Ref> x@212@01 y@213@01 z@214@01) zs10@68@01))))
      (and
        (Set_in (inv_9_0<Ref> x@212@01 y@213@01 z@214@01) xs10@46@01)
        (and
          (Set_in (inv_9_1<Ref> x@212@01 y@213@01 z@214@01) ys10@57@01)
          (Set_in (inv_9_2<Ref> x@212@01 y@213@01 z@214@01) zs10@68@01)))))
  :pattern ((inv_9_0<Ref> x@212@01 y@213@01 z@214@01) (inv_9_1<Ref> x@212@01 y@213@01 z@214@01) (inv_9_2<Ref> x@212@01 y@213@01 z@214@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@29@9@29@137-aux|)))
(assert (forall ((x@212@01 $Ref) (y@213@01 $Ref) (z@214@01 $Ref)) (!
  (=>
    (and
      (Set_in (inv_9_0<Ref> x@212@01 y@213@01 z@214@01) xs10@46@01)
      (and
        (Set_in (inv_9_1<Ref> x@212@01 y@213@01 z@214@01) ys10@57@01)
        (Set_in (inv_9_2<Ref> x@212@01 y@213@01 z@214@01) zs10@68@01)))
    (and
      (= (inv_9_0<Ref> x@212@01 y@213@01 z@214@01) x@212@01)
      (and
        (= (inv_9_1<Ref> x@212@01 y@213@01 z@214@01) y@213@01)
        (= (inv_9_2<Ref> x@212@01 y@213@01 z@214@01) z@214@01))))
  :pattern ((inv_9_0<Ref> x@212@01 y@213@01 z@214@01) (inv_9_1<Ref> x@212@01 y@213@01 z@214@01) (inv_9_2<Ref> x@212@01 y@213@01 z@214@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@29@9@29@137|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x: Ref, y: Ref, z: Ref ::
;     { inv_9_0(x, y, z), inv_9_1(x, y, z), inv_9_2(x, y, z) }
;     (inv_9_0(x, y, z) in xs10) &&
;     ((inv_9_1(x, y, z) in ys10) && (inv_9_2(x, y, z) in zs10)) ==>
;     perm(p(x, y, z)) >=
;     __iar__assume_helper_9((inv_0_0(x, y, z) in xs1) &&
;     ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) &&
;     (x == x && y == y && z == z), (inv_1_0(x, y, z) in xs2) &&
;     ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) &&
;     (x == x && y == y && z == z), (inv_2_0(x, y, z) in xs3) &&
;     ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) &&
;     (x == x && y == y && z == z), (inv_3_0(x, y, z) in xs4) &&
;     ((inv_3_1(x, y, z) in ys4) && (inv_3_2(x, y, z) in zs4)) &&
;     (x == x && y == y && z == z), (inv_4_0(x, y, z) in xs5) &&
;     ((inv_4_1(x, y, z) in ys5) && (inv_4_2(x, y, z) in zs5)) &&
;     (x == x && y == y && z == z), (inv_5_0(x, y, z) in xs6) &&
;     ((inv_5_1(x, y, z) in ys6) && (inv_5_2(x, y, z) in zs6)) &&
;     (x == x && y == y && z == z), (inv_6_0(x, y, z) in xs7) &&
;     ((inv_6_1(x, y, z) in ys7) && (inv_6_2(x, y, z) in zs7)) &&
;     (x == x && y == y && z == z), (inv_7_0(x, y, z) in xs8) &&
;     ((inv_7_1(x, y, z) in ys8) && (inv_7_2(x, y, z) in zs8)) &&
;     (x == x && y == y && z == z), (inv_8_0(x, y, z) in xs9) &&
;     ((inv_8_1(x, y, z) in ys9) && (inv_8_2(x, y, z) in zs9)) &&
;     (x == x && y == y && z == z), q, q, q, q, q, q, q, q, q, q))
(declare-const $t@215@01 $Snap)
(assert (= $t@215@01 $Snap.unit))
; [eval] (forall x: Ref, y: Ref, z: Ref :: { inv_9_0(x, y, z), inv_9_1(x, y, z), inv_9_2(x, y, z) } (inv_9_0(x, y, z) in xs10) && ((inv_9_1(x, y, z) in ys10) && (inv_9_2(x, y, z) in zs10)) ==> perm(p(x, y, z)) >= __iar__assume_helper_9((inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) && (x == x && y == y && z == z), (inv_1_0(x, y, z) in xs2) && ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) && (x == x && y == y && z == z), (inv_2_0(x, y, z) in xs3) && ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) && (x == x && y == y && z == z), (inv_3_0(x, y, z) in xs4) && ((inv_3_1(x, y, z) in ys4) && (inv_3_2(x, y, z) in zs4)) && (x == x && y == y && z == z), (inv_4_0(x, y, z) in xs5) && ((inv_4_1(x, y, z) in ys5) && (inv_4_2(x, y, z) in zs5)) && (x == x && y == y && z == z), (inv_5_0(x, y, z) in xs6) && ((inv_5_1(x, y, z) in ys6) && (inv_5_2(x, y, z) in zs6)) && (x == x && y == y && z == z), (inv_6_0(x, y, z) in xs7) && ((inv_6_1(x, y, z) in ys7) && (inv_6_2(x, y, z) in zs7)) && (x == x && y == y && z == z), (inv_7_0(x, y, z) in xs8) && ((inv_7_1(x, y, z) in ys8) && (inv_7_2(x, y, z) in zs8)) && (x == x && y == y && z == z), (inv_8_0(x, y, z) in xs9) && ((inv_8_1(x, y, z) in ys9) && (inv_8_2(x, y, z) in zs9)) && (x == x && y == y && z == z), q, q, q, q, q, q, q, q, q, q))
(declare-const x@216@01 $Ref)
(declare-const y@217@01 $Ref)
(declare-const z@218@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (inv_9_0(x, y, z) in xs10) && ((inv_9_1(x, y, z) in ys10) && (inv_9_2(x, y, z) in zs10)) ==> perm(p(x, y, z)) >= __iar__assume_helper_9((inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) && (x == x && y == y && z == z), (inv_1_0(x, y, z) in xs2) && ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) && (x == x && y == y && z == z), (inv_2_0(x, y, z) in xs3) && ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) && (x == x && y == y && z == z), (inv_3_0(x, y, z) in xs4) && ((inv_3_1(x, y, z) in ys4) && (inv_3_2(x, y, z) in zs4)) && (x == x && y == y && z == z), (inv_4_0(x, y, z) in xs5) && ((inv_4_1(x, y, z) in ys5) && (inv_4_2(x, y, z) in zs5)) && (x == x && y == y && z == z), (inv_5_0(x, y, z) in xs6) && ((inv_5_1(x, y, z) in ys6) && (inv_5_2(x, y, z) in zs6)) && (x == x && y == y && z == z), (inv_6_0(x, y, z) in xs7) && ((inv_6_1(x, y, z) in ys7) && (inv_6_2(x, y, z) in zs7)) && (x == x && y == y && z == z), (inv_7_0(x, y, z) in xs8) && ((inv_7_1(x, y, z) in ys8) && (inv_7_2(x, y, z) in zs8)) && (x == x && y == y && z == z), (inv_8_0(x, y, z) in xs9) && ((inv_8_1(x, y, z) in ys9) && (inv_8_2(x, y, z) in zs9)) && (x == x && y == y && z == z), q, q, q, q, q, q, q, q, q, q)
; [eval] (inv_9_0(x, y, z) in xs10) && ((inv_9_1(x, y, z) in ys10) && (inv_9_2(x, y, z) in zs10))
; [eval] (inv_9_0(x, y, z) in xs10)
; [eval] inv_9_0(x, y, z)
(push) ; 4
; [then-branch: 309 | !(inv_9_0[Ref](x@216@01, y@217@01, z@218@01) in xs10@46@01) | live]
; [else-branch: 309 | inv_9_0[Ref](x@216@01, y@217@01, z@218@01) in xs10@46@01 | live]
(push) ; 5
; [then-branch: 309 | !(inv_9_0[Ref](x@216@01, y@217@01, z@218@01) in xs10@46@01)]
(assert (not (Set_in (inv_9_0<Ref> x@216@01 y@217@01 z@218@01) xs10@46@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 309 | inv_9_0[Ref](x@216@01, y@217@01, z@218@01) in xs10@46@01]
(assert (Set_in (inv_9_0<Ref> x@216@01 y@217@01 z@218@01) xs10@46@01))
; [eval] (inv_9_1(x, y, z) in ys10)
; [eval] inv_9_1(x, y, z)
(push) ; 6
; [then-branch: 310 | !(inv_9_1[Ref](x@216@01, y@217@01, z@218@01) in ys10@57@01) | live]
; [else-branch: 310 | inv_9_1[Ref](x@216@01, y@217@01, z@218@01) in ys10@57@01 | live]
(push) ; 7
; [then-branch: 310 | !(inv_9_1[Ref](x@216@01, y@217@01, z@218@01) in ys10@57@01)]
(assert (not (Set_in (inv_9_1<Ref> x@216@01 y@217@01 z@218@01) ys10@57@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 310 | inv_9_1[Ref](x@216@01, y@217@01, z@218@01) in ys10@57@01]
(assert (Set_in (inv_9_1<Ref> x@216@01 y@217@01 z@218@01) ys10@57@01))
; [eval] (inv_9_2(x, y, z) in zs10)
; [eval] inv_9_2(x, y, z)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_9_1<Ref> x@216@01 y@217@01 z@218@01) ys10@57@01)
  (not (Set_in (inv_9_1<Ref> x@216@01 y@217@01 z@218@01) ys10@57@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_9_0<Ref> x@216@01 y@217@01 z@218@01) xs10@46@01)
  (and
    (Set_in (inv_9_0<Ref> x@216@01 y@217@01 z@218@01) xs10@46@01)
    (or
      (Set_in (inv_9_1<Ref> x@216@01 y@217@01 z@218@01) ys10@57@01)
      (not (Set_in (inv_9_1<Ref> x@216@01 y@217@01 z@218@01) ys10@57@01))))))
(assert (or
  (Set_in (inv_9_0<Ref> x@216@01 y@217@01 z@218@01) xs10@46@01)
  (not (Set_in (inv_9_0<Ref> x@216@01 y@217@01 z@218@01) xs10@46@01))))
(push) ; 4
; [then-branch: 311 | inv_9_0[Ref](x@216@01, y@217@01, z@218@01) in xs10@46@01 && inv_9_1[Ref](x@216@01, y@217@01, z@218@01) in ys10@57@01 && inv_9_2[Ref](x@216@01, y@217@01, z@218@01) in zs10@68@01 | live]
; [else-branch: 311 | !(inv_9_0[Ref](x@216@01, y@217@01, z@218@01) in xs10@46@01 && inv_9_1[Ref](x@216@01, y@217@01, z@218@01) in ys10@57@01 && inv_9_2[Ref](x@216@01, y@217@01, z@218@01) in zs10@68@01) | live]
(push) ; 5
; [then-branch: 311 | inv_9_0[Ref](x@216@01, y@217@01, z@218@01) in xs10@46@01 && inv_9_1[Ref](x@216@01, y@217@01, z@218@01) in ys10@57@01 && inv_9_2[Ref](x@216@01, y@217@01, z@218@01) in zs10@68@01]
(assert (and
  (Set_in (inv_9_0<Ref> x@216@01 y@217@01 z@218@01) xs10@46@01)
  (and
    (Set_in (inv_9_1<Ref> x@216@01 y@217@01 z@218@01) ys10@57@01)
    (Set_in (inv_9_2<Ref> x@216@01 y@217@01 z@218@01) zs10@68@01))))
; [eval] perm(p(x, y, z)) >= __iar__assume_helper_9((inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) && (x == x && y == y && z == z), (inv_1_0(x, y, z) in xs2) && ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) && (x == x && y == y && z == z), (inv_2_0(x, y, z) in xs3) && ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) && (x == x && y == y && z == z), (inv_3_0(x, y, z) in xs4) && ((inv_3_1(x, y, z) in ys4) && (inv_3_2(x, y, z) in zs4)) && (x == x && y == y && z == z), (inv_4_0(x, y, z) in xs5) && ((inv_4_1(x, y, z) in ys5) && (inv_4_2(x, y, z) in zs5)) && (x == x && y == y && z == z), (inv_5_0(x, y, z) in xs6) && ((inv_5_1(x, y, z) in ys6) && (inv_5_2(x, y, z) in zs6)) && (x == x && y == y && z == z), (inv_6_0(x, y, z) in xs7) && ((inv_6_1(x, y, z) in ys7) && (inv_6_2(x, y, z) in zs7)) && (x == x && y == y && z == z), (inv_7_0(x, y, z) in xs8) && ((inv_7_1(x, y, z) in ys8) && (inv_7_2(x, y, z) in zs8)) && (x == x && y == y && z == z), (inv_8_0(x, y, z) in xs9) && ((inv_8_1(x, y, z) in ys9) && (inv_8_2(x, y, z) in zs9)) && (x == x && y == y && z == z), q, q, q, q, q, q, q, q, q, q)
; [eval] perm(p(x, y, z))
; Definitional axioms for snapshot map values
(declare-const pm@219@01 $PPM)
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (=
    ($PSF.perm_p (as pm@219@01  $PPM) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    (ite
      (and
        (and (img@83@01 x y z) (img@85@01 x y z) (img@87@01 x y z))
        (and
          (Set_in (inv@82@01 x y z) xs@70@01)
          (and
            (Set_in (inv@84@01 x y z) ys@71@01)
            (Set_in (inv@86@01 x y z) zs@72@01))))
      q@73@01
      $Perm.No))
  :pattern (($PSF.perm_p (as pm@219@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resPrmSumDef20|)))
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (and
    ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    ($PSF.loc_p ($PSF.lookup_p $t@81@01 ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))))
  :pattern (($PSF.perm_p (as pm@219@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resTrgDef21|)))
(assert ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x@216@01)
    ($SortWrappers.$RefTo$Snap y@217@01))
  ($SortWrappers.$RefTo$Snap z@218@01))) ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x@216@01)
    ($SortWrappers.$RefTo$Snap y@217@01))
  ($SortWrappers.$RefTo$Snap z@218@01))))
; [eval] __iar__assume_helper_9((inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) && (x == x && y == y && z == z), (inv_1_0(x, y, z) in xs2) && ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) && (x == x && y == y && z == z), (inv_2_0(x, y, z) in xs3) && ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) && (x == x && y == y && z == z), (inv_3_0(x, y, z) in xs4) && ((inv_3_1(x, y, z) in ys4) && (inv_3_2(x, y, z) in zs4)) && (x == x && y == y && z == z), (inv_4_0(x, y, z) in xs5) && ((inv_4_1(x, y, z) in ys5) && (inv_4_2(x, y, z) in zs5)) && (x == x && y == y && z == z), (inv_5_0(x, y, z) in xs6) && ((inv_5_1(x, y, z) in ys6) && (inv_5_2(x, y, z) in zs6)) && (x == x && y == y && z == z), (inv_6_0(x, y, z) in xs7) && ((inv_6_1(x, y, z) in ys7) && (inv_6_2(x, y, z) in zs7)) && (x == x && y == y && z == z), (inv_7_0(x, y, z) in xs8) && ((inv_7_1(x, y, z) in ys8) && (inv_7_2(x, y, z) in zs8)) && (x == x && y == y && z == z), (inv_8_0(x, y, z) in xs9) && ((inv_8_1(x, y, z) in ys9) && (inv_8_2(x, y, z) in zs9)) && (x == x && y == y && z == z), q, q, q, q, q, q, q, q, q, q)
; [eval] (inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) && (x == x && y == y && z == z)
; [eval] (inv_0_0(x, y, z) in xs1)
; [eval] inv_0_0(x, y, z)
(push) ; 6
; [then-branch: 312 | !(inv_0_0[Ref](x@216@01, y@217@01, z@218@01) in xs1@37@01) | live]
; [else-branch: 312 | inv_0_0[Ref](x@216@01, y@217@01, z@218@01) in xs1@37@01 | live]
(push) ; 7
; [then-branch: 312 | !(inv_0_0[Ref](x@216@01, y@217@01, z@218@01) in xs1@37@01)]
(assert (not (Set_in (inv_0_0<Ref> x@216@01 y@217@01 z@218@01) xs1@37@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 312 | inv_0_0[Ref](x@216@01, y@217@01, z@218@01) in xs1@37@01]
(assert (Set_in (inv_0_0<Ref> x@216@01 y@217@01 z@218@01) xs1@37@01))
; [eval] (inv_0_1(x, y, z) in ys1)
; [eval] inv_0_1(x, y, z)
(push) ; 8
; [then-branch: 313 | !(inv_0_1[Ref](x@216@01, y@217@01, z@218@01) in ys1@48@01) | live]
; [else-branch: 313 | inv_0_1[Ref](x@216@01, y@217@01, z@218@01) in ys1@48@01 | live]
(push) ; 9
; [then-branch: 313 | !(inv_0_1[Ref](x@216@01, y@217@01, z@218@01) in ys1@48@01)]
(assert (not (Set_in (inv_0_1<Ref> x@216@01 y@217@01 z@218@01) ys1@48@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 313 | inv_0_1[Ref](x@216@01, y@217@01, z@218@01) in ys1@48@01]
(assert (Set_in (inv_0_1<Ref> x@216@01 y@217@01 z@218@01) ys1@48@01))
; [eval] (inv_0_2(x, y, z) in zs1)
; [eval] inv_0_2(x, y, z)
(push) ; 10
; [then-branch: 314 | !(inv_0_2[Ref](x@216@01, y@217@01, z@218@01) in zs1@59@01) | live]
; [else-branch: 314 | inv_0_2[Ref](x@216@01, y@217@01, z@218@01) in zs1@59@01 | live]
(push) ; 11
; [then-branch: 314 | !(inv_0_2[Ref](x@216@01, y@217@01, z@218@01) in zs1@59@01)]
(assert (not (Set_in (inv_0_2<Ref> x@216@01 y@217@01 z@218@01) zs1@59@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 314 | inv_0_2[Ref](x@216@01, y@217@01, z@218@01) in zs1@59@01]
(assert (Set_in (inv_0_2<Ref> x@216@01 y@217@01 z@218@01) zs1@59@01))
; [eval] x == x
(push) ; 12
; [then-branch: 315 | False | live]
; [else-branch: 315 | True | live]
(push) ; 13
; [then-branch: 315 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 315 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 316 | False | live]
; [else-branch: 316 | True | live]
(push) ; 15
; [then-branch: 316 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 316 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_0_2<Ref> x@216@01 y@217@01 z@218@01) zs1@59@01)
  (not (Set_in (inv_0_2<Ref> x@216@01 y@217@01 z@218@01) zs1@59@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_0_1<Ref> x@216@01 y@217@01 z@218@01) ys1@48@01)
  (and
    (Set_in (inv_0_1<Ref> x@216@01 y@217@01 z@218@01) ys1@48@01)
    (or
      (Set_in (inv_0_2<Ref> x@216@01 y@217@01 z@218@01) zs1@59@01)
      (not (Set_in (inv_0_2<Ref> x@216@01 y@217@01 z@218@01) zs1@59@01))))))
(assert (or
  (Set_in (inv_0_1<Ref> x@216@01 y@217@01 z@218@01) ys1@48@01)
  (not (Set_in (inv_0_1<Ref> x@216@01 y@217@01 z@218@01) ys1@48@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_0_0<Ref> x@216@01 y@217@01 z@218@01) xs1@37@01)
  (and
    (Set_in (inv_0_0<Ref> x@216@01 y@217@01 z@218@01) xs1@37@01)
    (=>
      (Set_in (inv_0_1<Ref> x@216@01 y@217@01 z@218@01) ys1@48@01)
      (and
        (Set_in (inv_0_1<Ref> x@216@01 y@217@01 z@218@01) ys1@48@01)
        (or
          (Set_in (inv_0_2<Ref> x@216@01 y@217@01 z@218@01) zs1@59@01)
          (not (Set_in (inv_0_2<Ref> x@216@01 y@217@01 z@218@01) zs1@59@01)))))
    (or
      (Set_in (inv_0_1<Ref> x@216@01 y@217@01 z@218@01) ys1@48@01)
      (not (Set_in (inv_0_1<Ref> x@216@01 y@217@01 z@218@01) ys1@48@01))))))
(assert (or
  (Set_in (inv_0_0<Ref> x@216@01 y@217@01 z@218@01) xs1@37@01)
  (not (Set_in (inv_0_0<Ref> x@216@01 y@217@01 z@218@01) xs1@37@01))))
; [eval] (inv_1_0(x, y, z) in xs2) && ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) && (x == x && y == y && z == z)
; [eval] (inv_1_0(x, y, z) in xs2)
; [eval] inv_1_0(x, y, z)
(push) ; 6
; [then-branch: 317 | !(inv_1_0[Ref](x@216@01, y@217@01, z@218@01) in xs2@38@01) | live]
; [else-branch: 317 | inv_1_0[Ref](x@216@01, y@217@01, z@218@01) in xs2@38@01 | live]
(push) ; 7
; [then-branch: 317 | !(inv_1_0[Ref](x@216@01, y@217@01, z@218@01) in xs2@38@01)]
(assert (not (Set_in (inv_1_0<Ref> x@216@01 y@217@01 z@218@01) xs2@38@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 317 | inv_1_0[Ref](x@216@01, y@217@01, z@218@01) in xs2@38@01]
(assert (Set_in (inv_1_0<Ref> x@216@01 y@217@01 z@218@01) xs2@38@01))
; [eval] (inv_1_1(x, y, z) in ys2)
; [eval] inv_1_1(x, y, z)
(push) ; 8
; [then-branch: 318 | !(inv_1_1[Ref](x@216@01, y@217@01, z@218@01) in ys2@49@01) | live]
; [else-branch: 318 | inv_1_1[Ref](x@216@01, y@217@01, z@218@01) in ys2@49@01 | live]
(push) ; 9
; [then-branch: 318 | !(inv_1_1[Ref](x@216@01, y@217@01, z@218@01) in ys2@49@01)]
(assert (not (Set_in (inv_1_1<Ref> x@216@01 y@217@01 z@218@01) ys2@49@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 318 | inv_1_1[Ref](x@216@01, y@217@01, z@218@01) in ys2@49@01]
(assert (Set_in (inv_1_1<Ref> x@216@01 y@217@01 z@218@01) ys2@49@01))
; [eval] (inv_1_2(x, y, z) in zs2)
; [eval] inv_1_2(x, y, z)
(push) ; 10
; [then-branch: 319 | !(inv_1_2[Ref](x@216@01, y@217@01, z@218@01) in zs2@60@01) | live]
; [else-branch: 319 | inv_1_2[Ref](x@216@01, y@217@01, z@218@01) in zs2@60@01 | live]
(push) ; 11
; [then-branch: 319 | !(inv_1_2[Ref](x@216@01, y@217@01, z@218@01) in zs2@60@01)]
(assert (not (Set_in (inv_1_2<Ref> x@216@01 y@217@01 z@218@01) zs2@60@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 319 | inv_1_2[Ref](x@216@01, y@217@01, z@218@01) in zs2@60@01]
(assert (Set_in (inv_1_2<Ref> x@216@01 y@217@01 z@218@01) zs2@60@01))
; [eval] x == x
(push) ; 12
; [then-branch: 320 | False | live]
; [else-branch: 320 | True | live]
(push) ; 13
; [then-branch: 320 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 320 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 321 | False | live]
; [else-branch: 321 | True | live]
(push) ; 15
; [then-branch: 321 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 321 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_1_2<Ref> x@216@01 y@217@01 z@218@01) zs2@60@01)
  (not (Set_in (inv_1_2<Ref> x@216@01 y@217@01 z@218@01) zs2@60@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_1_1<Ref> x@216@01 y@217@01 z@218@01) ys2@49@01)
  (and
    (Set_in (inv_1_1<Ref> x@216@01 y@217@01 z@218@01) ys2@49@01)
    (or
      (Set_in (inv_1_2<Ref> x@216@01 y@217@01 z@218@01) zs2@60@01)
      (not (Set_in (inv_1_2<Ref> x@216@01 y@217@01 z@218@01) zs2@60@01))))))
(assert (or
  (Set_in (inv_1_1<Ref> x@216@01 y@217@01 z@218@01) ys2@49@01)
  (not (Set_in (inv_1_1<Ref> x@216@01 y@217@01 z@218@01) ys2@49@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_1_0<Ref> x@216@01 y@217@01 z@218@01) xs2@38@01)
  (and
    (Set_in (inv_1_0<Ref> x@216@01 y@217@01 z@218@01) xs2@38@01)
    (=>
      (Set_in (inv_1_1<Ref> x@216@01 y@217@01 z@218@01) ys2@49@01)
      (and
        (Set_in (inv_1_1<Ref> x@216@01 y@217@01 z@218@01) ys2@49@01)
        (or
          (Set_in (inv_1_2<Ref> x@216@01 y@217@01 z@218@01) zs2@60@01)
          (not (Set_in (inv_1_2<Ref> x@216@01 y@217@01 z@218@01) zs2@60@01)))))
    (or
      (Set_in (inv_1_1<Ref> x@216@01 y@217@01 z@218@01) ys2@49@01)
      (not (Set_in (inv_1_1<Ref> x@216@01 y@217@01 z@218@01) ys2@49@01))))))
(assert (or
  (Set_in (inv_1_0<Ref> x@216@01 y@217@01 z@218@01) xs2@38@01)
  (not (Set_in (inv_1_0<Ref> x@216@01 y@217@01 z@218@01) xs2@38@01))))
; [eval] (inv_2_0(x, y, z) in xs3) && ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) && (x == x && y == y && z == z)
; [eval] (inv_2_0(x, y, z) in xs3)
; [eval] inv_2_0(x, y, z)
(push) ; 6
; [then-branch: 322 | !(inv_2_0[Ref](x@216@01, y@217@01, z@218@01) in xs3@39@01) | live]
; [else-branch: 322 | inv_2_0[Ref](x@216@01, y@217@01, z@218@01) in xs3@39@01 | live]
(push) ; 7
; [then-branch: 322 | !(inv_2_0[Ref](x@216@01, y@217@01, z@218@01) in xs3@39@01)]
(assert (not (Set_in (inv_2_0<Ref> x@216@01 y@217@01 z@218@01) xs3@39@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 322 | inv_2_0[Ref](x@216@01, y@217@01, z@218@01) in xs3@39@01]
(assert (Set_in (inv_2_0<Ref> x@216@01 y@217@01 z@218@01) xs3@39@01))
; [eval] (inv_2_1(x, y, z) in ys3)
; [eval] inv_2_1(x, y, z)
(push) ; 8
; [then-branch: 323 | !(inv_2_1[Ref](x@216@01, y@217@01, z@218@01) in ys3@50@01) | live]
; [else-branch: 323 | inv_2_1[Ref](x@216@01, y@217@01, z@218@01) in ys3@50@01 | live]
(push) ; 9
; [then-branch: 323 | !(inv_2_1[Ref](x@216@01, y@217@01, z@218@01) in ys3@50@01)]
(assert (not (Set_in (inv_2_1<Ref> x@216@01 y@217@01 z@218@01) ys3@50@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 323 | inv_2_1[Ref](x@216@01, y@217@01, z@218@01) in ys3@50@01]
(assert (Set_in (inv_2_1<Ref> x@216@01 y@217@01 z@218@01) ys3@50@01))
; [eval] (inv_2_2(x, y, z) in zs3)
; [eval] inv_2_2(x, y, z)
(push) ; 10
; [then-branch: 324 | !(inv_2_2[Ref](x@216@01, y@217@01, z@218@01) in zs3@61@01) | live]
; [else-branch: 324 | inv_2_2[Ref](x@216@01, y@217@01, z@218@01) in zs3@61@01 | live]
(push) ; 11
; [then-branch: 324 | !(inv_2_2[Ref](x@216@01, y@217@01, z@218@01) in zs3@61@01)]
(assert (not (Set_in (inv_2_2<Ref> x@216@01 y@217@01 z@218@01) zs3@61@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 324 | inv_2_2[Ref](x@216@01, y@217@01, z@218@01) in zs3@61@01]
(assert (Set_in (inv_2_2<Ref> x@216@01 y@217@01 z@218@01) zs3@61@01))
; [eval] x == x
(push) ; 12
; [then-branch: 325 | False | live]
; [else-branch: 325 | True | live]
(push) ; 13
; [then-branch: 325 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 325 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 326 | False | live]
; [else-branch: 326 | True | live]
(push) ; 15
; [then-branch: 326 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 326 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_2_2<Ref> x@216@01 y@217@01 z@218@01) zs3@61@01)
  (not (Set_in (inv_2_2<Ref> x@216@01 y@217@01 z@218@01) zs3@61@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_2_1<Ref> x@216@01 y@217@01 z@218@01) ys3@50@01)
  (and
    (Set_in (inv_2_1<Ref> x@216@01 y@217@01 z@218@01) ys3@50@01)
    (or
      (Set_in (inv_2_2<Ref> x@216@01 y@217@01 z@218@01) zs3@61@01)
      (not (Set_in (inv_2_2<Ref> x@216@01 y@217@01 z@218@01) zs3@61@01))))))
(assert (or
  (Set_in (inv_2_1<Ref> x@216@01 y@217@01 z@218@01) ys3@50@01)
  (not (Set_in (inv_2_1<Ref> x@216@01 y@217@01 z@218@01) ys3@50@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_2_0<Ref> x@216@01 y@217@01 z@218@01) xs3@39@01)
  (and
    (Set_in (inv_2_0<Ref> x@216@01 y@217@01 z@218@01) xs3@39@01)
    (=>
      (Set_in (inv_2_1<Ref> x@216@01 y@217@01 z@218@01) ys3@50@01)
      (and
        (Set_in (inv_2_1<Ref> x@216@01 y@217@01 z@218@01) ys3@50@01)
        (or
          (Set_in (inv_2_2<Ref> x@216@01 y@217@01 z@218@01) zs3@61@01)
          (not (Set_in (inv_2_2<Ref> x@216@01 y@217@01 z@218@01) zs3@61@01)))))
    (or
      (Set_in (inv_2_1<Ref> x@216@01 y@217@01 z@218@01) ys3@50@01)
      (not (Set_in (inv_2_1<Ref> x@216@01 y@217@01 z@218@01) ys3@50@01))))))
(assert (or
  (Set_in (inv_2_0<Ref> x@216@01 y@217@01 z@218@01) xs3@39@01)
  (not (Set_in (inv_2_0<Ref> x@216@01 y@217@01 z@218@01) xs3@39@01))))
; [eval] (inv_3_0(x, y, z) in xs4) && ((inv_3_1(x, y, z) in ys4) && (inv_3_2(x, y, z) in zs4)) && (x == x && y == y && z == z)
; [eval] (inv_3_0(x, y, z) in xs4)
; [eval] inv_3_0(x, y, z)
(push) ; 6
; [then-branch: 327 | !(inv_3_0[Ref](x@216@01, y@217@01, z@218@01) in xs4@40@01) | live]
; [else-branch: 327 | inv_3_0[Ref](x@216@01, y@217@01, z@218@01) in xs4@40@01 | live]
(push) ; 7
; [then-branch: 327 | !(inv_3_0[Ref](x@216@01, y@217@01, z@218@01) in xs4@40@01)]
(assert (not (Set_in (inv_3_0<Ref> x@216@01 y@217@01 z@218@01) xs4@40@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 327 | inv_3_0[Ref](x@216@01, y@217@01, z@218@01) in xs4@40@01]
(assert (Set_in (inv_3_0<Ref> x@216@01 y@217@01 z@218@01) xs4@40@01))
; [eval] (inv_3_1(x, y, z) in ys4)
; [eval] inv_3_1(x, y, z)
(push) ; 8
; [then-branch: 328 | !(inv_3_1[Ref](x@216@01, y@217@01, z@218@01) in ys4@51@01) | live]
; [else-branch: 328 | inv_3_1[Ref](x@216@01, y@217@01, z@218@01) in ys4@51@01 | live]
(push) ; 9
; [then-branch: 328 | !(inv_3_1[Ref](x@216@01, y@217@01, z@218@01) in ys4@51@01)]
(assert (not (Set_in (inv_3_1<Ref> x@216@01 y@217@01 z@218@01) ys4@51@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 328 | inv_3_1[Ref](x@216@01, y@217@01, z@218@01) in ys4@51@01]
(assert (Set_in (inv_3_1<Ref> x@216@01 y@217@01 z@218@01) ys4@51@01))
; [eval] (inv_3_2(x, y, z) in zs4)
; [eval] inv_3_2(x, y, z)
(push) ; 10
; [then-branch: 329 | !(inv_3_2[Ref](x@216@01, y@217@01, z@218@01) in zs4@62@01) | live]
; [else-branch: 329 | inv_3_2[Ref](x@216@01, y@217@01, z@218@01) in zs4@62@01 | live]
(push) ; 11
; [then-branch: 329 | !(inv_3_2[Ref](x@216@01, y@217@01, z@218@01) in zs4@62@01)]
(assert (not (Set_in (inv_3_2<Ref> x@216@01 y@217@01 z@218@01) zs4@62@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 329 | inv_3_2[Ref](x@216@01, y@217@01, z@218@01) in zs4@62@01]
(assert (Set_in (inv_3_2<Ref> x@216@01 y@217@01 z@218@01) zs4@62@01))
; [eval] x == x
(push) ; 12
; [then-branch: 330 | False | live]
; [else-branch: 330 | True | live]
(push) ; 13
; [then-branch: 330 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 330 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 331 | False | live]
; [else-branch: 331 | True | live]
(push) ; 15
; [then-branch: 331 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 331 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_3_2<Ref> x@216@01 y@217@01 z@218@01) zs4@62@01)
  (not (Set_in (inv_3_2<Ref> x@216@01 y@217@01 z@218@01) zs4@62@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_3_1<Ref> x@216@01 y@217@01 z@218@01) ys4@51@01)
  (and
    (Set_in (inv_3_1<Ref> x@216@01 y@217@01 z@218@01) ys4@51@01)
    (or
      (Set_in (inv_3_2<Ref> x@216@01 y@217@01 z@218@01) zs4@62@01)
      (not (Set_in (inv_3_2<Ref> x@216@01 y@217@01 z@218@01) zs4@62@01))))))
(assert (or
  (Set_in (inv_3_1<Ref> x@216@01 y@217@01 z@218@01) ys4@51@01)
  (not (Set_in (inv_3_1<Ref> x@216@01 y@217@01 z@218@01) ys4@51@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_3_0<Ref> x@216@01 y@217@01 z@218@01) xs4@40@01)
  (and
    (Set_in (inv_3_0<Ref> x@216@01 y@217@01 z@218@01) xs4@40@01)
    (=>
      (Set_in (inv_3_1<Ref> x@216@01 y@217@01 z@218@01) ys4@51@01)
      (and
        (Set_in (inv_3_1<Ref> x@216@01 y@217@01 z@218@01) ys4@51@01)
        (or
          (Set_in (inv_3_2<Ref> x@216@01 y@217@01 z@218@01) zs4@62@01)
          (not (Set_in (inv_3_2<Ref> x@216@01 y@217@01 z@218@01) zs4@62@01)))))
    (or
      (Set_in (inv_3_1<Ref> x@216@01 y@217@01 z@218@01) ys4@51@01)
      (not (Set_in (inv_3_1<Ref> x@216@01 y@217@01 z@218@01) ys4@51@01))))))
(assert (or
  (Set_in (inv_3_0<Ref> x@216@01 y@217@01 z@218@01) xs4@40@01)
  (not (Set_in (inv_3_0<Ref> x@216@01 y@217@01 z@218@01) xs4@40@01))))
; [eval] (inv_4_0(x, y, z) in xs5) && ((inv_4_1(x, y, z) in ys5) && (inv_4_2(x, y, z) in zs5)) && (x == x && y == y && z == z)
; [eval] (inv_4_0(x, y, z) in xs5)
; [eval] inv_4_0(x, y, z)
(push) ; 6
; [then-branch: 332 | !(inv_4_0[Ref](x@216@01, y@217@01, z@218@01) in xs5@41@01) | live]
; [else-branch: 332 | inv_4_0[Ref](x@216@01, y@217@01, z@218@01) in xs5@41@01 | live]
(push) ; 7
; [then-branch: 332 | !(inv_4_0[Ref](x@216@01, y@217@01, z@218@01) in xs5@41@01)]
(assert (not (Set_in (inv_4_0<Ref> x@216@01 y@217@01 z@218@01) xs5@41@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 332 | inv_4_0[Ref](x@216@01, y@217@01, z@218@01) in xs5@41@01]
(assert (Set_in (inv_4_0<Ref> x@216@01 y@217@01 z@218@01) xs5@41@01))
; [eval] (inv_4_1(x, y, z) in ys5)
; [eval] inv_4_1(x, y, z)
(push) ; 8
; [then-branch: 333 | !(inv_4_1[Ref](x@216@01, y@217@01, z@218@01) in ys5@52@01) | live]
; [else-branch: 333 | inv_4_1[Ref](x@216@01, y@217@01, z@218@01) in ys5@52@01 | live]
(push) ; 9
; [then-branch: 333 | !(inv_4_1[Ref](x@216@01, y@217@01, z@218@01) in ys5@52@01)]
(assert (not (Set_in (inv_4_1<Ref> x@216@01 y@217@01 z@218@01) ys5@52@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 333 | inv_4_1[Ref](x@216@01, y@217@01, z@218@01) in ys5@52@01]
(assert (Set_in (inv_4_1<Ref> x@216@01 y@217@01 z@218@01) ys5@52@01))
; [eval] (inv_4_2(x, y, z) in zs5)
; [eval] inv_4_2(x, y, z)
(push) ; 10
; [then-branch: 334 | !(inv_4_2[Ref](x@216@01, y@217@01, z@218@01) in zs5@63@01) | live]
; [else-branch: 334 | inv_4_2[Ref](x@216@01, y@217@01, z@218@01) in zs5@63@01 | live]
(push) ; 11
; [then-branch: 334 | !(inv_4_2[Ref](x@216@01, y@217@01, z@218@01) in zs5@63@01)]
(assert (not (Set_in (inv_4_2<Ref> x@216@01 y@217@01 z@218@01) zs5@63@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 334 | inv_4_2[Ref](x@216@01, y@217@01, z@218@01) in zs5@63@01]
(assert (Set_in (inv_4_2<Ref> x@216@01 y@217@01 z@218@01) zs5@63@01))
; [eval] x == x
(push) ; 12
; [then-branch: 335 | False | live]
; [else-branch: 335 | True | live]
(push) ; 13
; [then-branch: 335 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 335 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 336 | False | live]
; [else-branch: 336 | True | live]
(push) ; 15
; [then-branch: 336 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 336 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_4_2<Ref> x@216@01 y@217@01 z@218@01) zs5@63@01)
  (not (Set_in (inv_4_2<Ref> x@216@01 y@217@01 z@218@01) zs5@63@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_4_1<Ref> x@216@01 y@217@01 z@218@01) ys5@52@01)
  (and
    (Set_in (inv_4_1<Ref> x@216@01 y@217@01 z@218@01) ys5@52@01)
    (or
      (Set_in (inv_4_2<Ref> x@216@01 y@217@01 z@218@01) zs5@63@01)
      (not (Set_in (inv_4_2<Ref> x@216@01 y@217@01 z@218@01) zs5@63@01))))))
(assert (or
  (Set_in (inv_4_1<Ref> x@216@01 y@217@01 z@218@01) ys5@52@01)
  (not (Set_in (inv_4_1<Ref> x@216@01 y@217@01 z@218@01) ys5@52@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_4_0<Ref> x@216@01 y@217@01 z@218@01) xs5@41@01)
  (and
    (Set_in (inv_4_0<Ref> x@216@01 y@217@01 z@218@01) xs5@41@01)
    (=>
      (Set_in (inv_4_1<Ref> x@216@01 y@217@01 z@218@01) ys5@52@01)
      (and
        (Set_in (inv_4_1<Ref> x@216@01 y@217@01 z@218@01) ys5@52@01)
        (or
          (Set_in (inv_4_2<Ref> x@216@01 y@217@01 z@218@01) zs5@63@01)
          (not (Set_in (inv_4_2<Ref> x@216@01 y@217@01 z@218@01) zs5@63@01)))))
    (or
      (Set_in (inv_4_1<Ref> x@216@01 y@217@01 z@218@01) ys5@52@01)
      (not (Set_in (inv_4_1<Ref> x@216@01 y@217@01 z@218@01) ys5@52@01))))))
(assert (or
  (Set_in (inv_4_0<Ref> x@216@01 y@217@01 z@218@01) xs5@41@01)
  (not (Set_in (inv_4_0<Ref> x@216@01 y@217@01 z@218@01) xs5@41@01))))
; [eval] (inv_5_0(x, y, z) in xs6) && ((inv_5_1(x, y, z) in ys6) && (inv_5_2(x, y, z) in zs6)) && (x == x && y == y && z == z)
; [eval] (inv_5_0(x, y, z) in xs6)
; [eval] inv_5_0(x, y, z)
(push) ; 6
; [then-branch: 337 | !(inv_5_0[Ref](x@216@01, y@217@01, z@218@01) in xs6@42@01) | live]
; [else-branch: 337 | inv_5_0[Ref](x@216@01, y@217@01, z@218@01) in xs6@42@01 | live]
(push) ; 7
; [then-branch: 337 | !(inv_5_0[Ref](x@216@01, y@217@01, z@218@01) in xs6@42@01)]
(assert (not (Set_in (inv_5_0<Ref> x@216@01 y@217@01 z@218@01) xs6@42@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 337 | inv_5_0[Ref](x@216@01, y@217@01, z@218@01) in xs6@42@01]
(assert (Set_in (inv_5_0<Ref> x@216@01 y@217@01 z@218@01) xs6@42@01))
; [eval] (inv_5_1(x, y, z) in ys6)
; [eval] inv_5_1(x, y, z)
(push) ; 8
; [then-branch: 338 | !(inv_5_1[Ref](x@216@01, y@217@01, z@218@01) in ys6@53@01) | live]
; [else-branch: 338 | inv_5_1[Ref](x@216@01, y@217@01, z@218@01) in ys6@53@01 | live]
(push) ; 9
; [then-branch: 338 | !(inv_5_1[Ref](x@216@01, y@217@01, z@218@01) in ys6@53@01)]
(assert (not (Set_in (inv_5_1<Ref> x@216@01 y@217@01 z@218@01) ys6@53@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 338 | inv_5_1[Ref](x@216@01, y@217@01, z@218@01) in ys6@53@01]
(assert (Set_in (inv_5_1<Ref> x@216@01 y@217@01 z@218@01) ys6@53@01))
; [eval] (inv_5_2(x, y, z) in zs6)
; [eval] inv_5_2(x, y, z)
(push) ; 10
; [then-branch: 339 | !(inv_5_2[Ref](x@216@01, y@217@01, z@218@01) in zs6@64@01) | live]
; [else-branch: 339 | inv_5_2[Ref](x@216@01, y@217@01, z@218@01) in zs6@64@01 | live]
(push) ; 11
; [then-branch: 339 | !(inv_5_2[Ref](x@216@01, y@217@01, z@218@01) in zs6@64@01)]
(assert (not (Set_in (inv_5_2<Ref> x@216@01 y@217@01 z@218@01) zs6@64@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 339 | inv_5_2[Ref](x@216@01, y@217@01, z@218@01) in zs6@64@01]
(assert (Set_in (inv_5_2<Ref> x@216@01 y@217@01 z@218@01) zs6@64@01))
; [eval] x == x
(push) ; 12
; [then-branch: 340 | False | live]
; [else-branch: 340 | True | live]
(push) ; 13
; [then-branch: 340 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 340 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 341 | False | live]
; [else-branch: 341 | True | live]
(push) ; 15
; [then-branch: 341 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 341 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_5_2<Ref> x@216@01 y@217@01 z@218@01) zs6@64@01)
  (not (Set_in (inv_5_2<Ref> x@216@01 y@217@01 z@218@01) zs6@64@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_5_1<Ref> x@216@01 y@217@01 z@218@01) ys6@53@01)
  (and
    (Set_in (inv_5_1<Ref> x@216@01 y@217@01 z@218@01) ys6@53@01)
    (or
      (Set_in (inv_5_2<Ref> x@216@01 y@217@01 z@218@01) zs6@64@01)
      (not (Set_in (inv_5_2<Ref> x@216@01 y@217@01 z@218@01) zs6@64@01))))))
(assert (or
  (Set_in (inv_5_1<Ref> x@216@01 y@217@01 z@218@01) ys6@53@01)
  (not (Set_in (inv_5_1<Ref> x@216@01 y@217@01 z@218@01) ys6@53@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_5_0<Ref> x@216@01 y@217@01 z@218@01) xs6@42@01)
  (and
    (Set_in (inv_5_0<Ref> x@216@01 y@217@01 z@218@01) xs6@42@01)
    (=>
      (Set_in (inv_5_1<Ref> x@216@01 y@217@01 z@218@01) ys6@53@01)
      (and
        (Set_in (inv_5_1<Ref> x@216@01 y@217@01 z@218@01) ys6@53@01)
        (or
          (Set_in (inv_5_2<Ref> x@216@01 y@217@01 z@218@01) zs6@64@01)
          (not (Set_in (inv_5_2<Ref> x@216@01 y@217@01 z@218@01) zs6@64@01)))))
    (or
      (Set_in (inv_5_1<Ref> x@216@01 y@217@01 z@218@01) ys6@53@01)
      (not (Set_in (inv_5_1<Ref> x@216@01 y@217@01 z@218@01) ys6@53@01))))))
(assert (or
  (Set_in (inv_5_0<Ref> x@216@01 y@217@01 z@218@01) xs6@42@01)
  (not (Set_in (inv_5_0<Ref> x@216@01 y@217@01 z@218@01) xs6@42@01))))
; [eval] (inv_6_0(x, y, z) in xs7) && ((inv_6_1(x, y, z) in ys7) && (inv_6_2(x, y, z) in zs7)) && (x == x && y == y && z == z)
; [eval] (inv_6_0(x, y, z) in xs7)
; [eval] inv_6_0(x, y, z)
(push) ; 6
; [then-branch: 342 | !(inv_6_0[Ref](x@216@01, y@217@01, z@218@01) in xs7@43@01) | live]
; [else-branch: 342 | inv_6_0[Ref](x@216@01, y@217@01, z@218@01) in xs7@43@01 | live]
(push) ; 7
; [then-branch: 342 | !(inv_6_0[Ref](x@216@01, y@217@01, z@218@01) in xs7@43@01)]
(assert (not (Set_in (inv_6_0<Ref> x@216@01 y@217@01 z@218@01) xs7@43@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 342 | inv_6_0[Ref](x@216@01, y@217@01, z@218@01) in xs7@43@01]
(assert (Set_in (inv_6_0<Ref> x@216@01 y@217@01 z@218@01) xs7@43@01))
; [eval] (inv_6_1(x, y, z) in ys7)
; [eval] inv_6_1(x, y, z)
(push) ; 8
; [then-branch: 343 | !(inv_6_1[Ref](x@216@01, y@217@01, z@218@01) in ys7@54@01) | live]
; [else-branch: 343 | inv_6_1[Ref](x@216@01, y@217@01, z@218@01) in ys7@54@01 | live]
(push) ; 9
; [then-branch: 343 | !(inv_6_1[Ref](x@216@01, y@217@01, z@218@01) in ys7@54@01)]
(assert (not (Set_in (inv_6_1<Ref> x@216@01 y@217@01 z@218@01) ys7@54@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 343 | inv_6_1[Ref](x@216@01, y@217@01, z@218@01) in ys7@54@01]
(assert (Set_in (inv_6_1<Ref> x@216@01 y@217@01 z@218@01) ys7@54@01))
; [eval] (inv_6_2(x, y, z) in zs7)
; [eval] inv_6_2(x, y, z)
(push) ; 10
; [then-branch: 344 | !(inv_6_2[Ref](x@216@01, y@217@01, z@218@01) in zs7@65@01) | live]
; [else-branch: 344 | inv_6_2[Ref](x@216@01, y@217@01, z@218@01) in zs7@65@01 | live]
(push) ; 11
; [then-branch: 344 | !(inv_6_2[Ref](x@216@01, y@217@01, z@218@01) in zs7@65@01)]
(assert (not (Set_in (inv_6_2<Ref> x@216@01 y@217@01 z@218@01) zs7@65@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 344 | inv_6_2[Ref](x@216@01, y@217@01, z@218@01) in zs7@65@01]
(assert (Set_in (inv_6_2<Ref> x@216@01 y@217@01 z@218@01) zs7@65@01))
; [eval] x == x
(push) ; 12
; [then-branch: 345 | False | live]
; [else-branch: 345 | True | live]
(push) ; 13
; [then-branch: 345 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 345 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 346 | False | live]
; [else-branch: 346 | True | live]
(push) ; 15
; [then-branch: 346 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 346 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_6_2<Ref> x@216@01 y@217@01 z@218@01) zs7@65@01)
  (not (Set_in (inv_6_2<Ref> x@216@01 y@217@01 z@218@01) zs7@65@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_6_1<Ref> x@216@01 y@217@01 z@218@01) ys7@54@01)
  (and
    (Set_in (inv_6_1<Ref> x@216@01 y@217@01 z@218@01) ys7@54@01)
    (or
      (Set_in (inv_6_2<Ref> x@216@01 y@217@01 z@218@01) zs7@65@01)
      (not (Set_in (inv_6_2<Ref> x@216@01 y@217@01 z@218@01) zs7@65@01))))))
(assert (or
  (Set_in (inv_6_1<Ref> x@216@01 y@217@01 z@218@01) ys7@54@01)
  (not (Set_in (inv_6_1<Ref> x@216@01 y@217@01 z@218@01) ys7@54@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_6_0<Ref> x@216@01 y@217@01 z@218@01) xs7@43@01)
  (and
    (Set_in (inv_6_0<Ref> x@216@01 y@217@01 z@218@01) xs7@43@01)
    (=>
      (Set_in (inv_6_1<Ref> x@216@01 y@217@01 z@218@01) ys7@54@01)
      (and
        (Set_in (inv_6_1<Ref> x@216@01 y@217@01 z@218@01) ys7@54@01)
        (or
          (Set_in (inv_6_2<Ref> x@216@01 y@217@01 z@218@01) zs7@65@01)
          (not (Set_in (inv_6_2<Ref> x@216@01 y@217@01 z@218@01) zs7@65@01)))))
    (or
      (Set_in (inv_6_1<Ref> x@216@01 y@217@01 z@218@01) ys7@54@01)
      (not (Set_in (inv_6_1<Ref> x@216@01 y@217@01 z@218@01) ys7@54@01))))))
(assert (or
  (Set_in (inv_6_0<Ref> x@216@01 y@217@01 z@218@01) xs7@43@01)
  (not (Set_in (inv_6_0<Ref> x@216@01 y@217@01 z@218@01) xs7@43@01))))
; [eval] (inv_7_0(x, y, z) in xs8) && ((inv_7_1(x, y, z) in ys8) && (inv_7_2(x, y, z) in zs8)) && (x == x && y == y && z == z)
; [eval] (inv_7_0(x, y, z) in xs8)
; [eval] inv_7_0(x, y, z)
(push) ; 6
; [then-branch: 347 | !(inv_7_0[Ref](x@216@01, y@217@01, z@218@01) in xs8@44@01) | live]
; [else-branch: 347 | inv_7_0[Ref](x@216@01, y@217@01, z@218@01) in xs8@44@01 | live]
(push) ; 7
; [then-branch: 347 | !(inv_7_0[Ref](x@216@01, y@217@01, z@218@01) in xs8@44@01)]
(assert (not (Set_in (inv_7_0<Ref> x@216@01 y@217@01 z@218@01) xs8@44@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 347 | inv_7_0[Ref](x@216@01, y@217@01, z@218@01) in xs8@44@01]
(assert (Set_in (inv_7_0<Ref> x@216@01 y@217@01 z@218@01) xs8@44@01))
; [eval] (inv_7_1(x, y, z) in ys8)
; [eval] inv_7_1(x, y, z)
(push) ; 8
; [then-branch: 348 | !(inv_7_1[Ref](x@216@01, y@217@01, z@218@01) in ys8@55@01) | live]
; [else-branch: 348 | inv_7_1[Ref](x@216@01, y@217@01, z@218@01) in ys8@55@01 | live]
(push) ; 9
; [then-branch: 348 | !(inv_7_1[Ref](x@216@01, y@217@01, z@218@01) in ys8@55@01)]
(assert (not (Set_in (inv_7_1<Ref> x@216@01 y@217@01 z@218@01) ys8@55@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 348 | inv_7_1[Ref](x@216@01, y@217@01, z@218@01) in ys8@55@01]
(assert (Set_in (inv_7_1<Ref> x@216@01 y@217@01 z@218@01) ys8@55@01))
; [eval] (inv_7_2(x, y, z) in zs8)
; [eval] inv_7_2(x, y, z)
(push) ; 10
; [then-branch: 349 | !(inv_7_2[Ref](x@216@01, y@217@01, z@218@01) in zs8@66@01) | live]
; [else-branch: 349 | inv_7_2[Ref](x@216@01, y@217@01, z@218@01) in zs8@66@01 | live]
(push) ; 11
; [then-branch: 349 | !(inv_7_2[Ref](x@216@01, y@217@01, z@218@01) in zs8@66@01)]
(assert (not (Set_in (inv_7_2<Ref> x@216@01 y@217@01 z@218@01) zs8@66@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 349 | inv_7_2[Ref](x@216@01, y@217@01, z@218@01) in zs8@66@01]
(assert (Set_in (inv_7_2<Ref> x@216@01 y@217@01 z@218@01) zs8@66@01))
; [eval] x == x
(push) ; 12
; [then-branch: 350 | False | live]
; [else-branch: 350 | True | live]
(push) ; 13
; [then-branch: 350 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 350 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 351 | False | live]
; [else-branch: 351 | True | live]
(push) ; 15
; [then-branch: 351 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 351 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_7_2<Ref> x@216@01 y@217@01 z@218@01) zs8@66@01)
  (not (Set_in (inv_7_2<Ref> x@216@01 y@217@01 z@218@01) zs8@66@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_7_1<Ref> x@216@01 y@217@01 z@218@01) ys8@55@01)
  (and
    (Set_in (inv_7_1<Ref> x@216@01 y@217@01 z@218@01) ys8@55@01)
    (or
      (Set_in (inv_7_2<Ref> x@216@01 y@217@01 z@218@01) zs8@66@01)
      (not (Set_in (inv_7_2<Ref> x@216@01 y@217@01 z@218@01) zs8@66@01))))))
(assert (or
  (Set_in (inv_7_1<Ref> x@216@01 y@217@01 z@218@01) ys8@55@01)
  (not (Set_in (inv_7_1<Ref> x@216@01 y@217@01 z@218@01) ys8@55@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_7_0<Ref> x@216@01 y@217@01 z@218@01) xs8@44@01)
  (and
    (Set_in (inv_7_0<Ref> x@216@01 y@217@01 z@218@01) xs8@44@01)
    (=>
      (Set_in (inv_7_1<Ref> x@216@01 y@217@01 z@218@01) ys8@55@01)
      (and
        (Set_in (inv_7_1<Ref> x@216@01 y@217@01 z@218@01) ys8@55@01)
        (or
          (Set_in (inv_7_2<Ref> x@216@01 y@217@01 z@218@01) zs8@66@01)
          (not (Set_in (inv_7_2<Ref> x@216@01 y@217@01 z@218@01) zs8@66@01)))))
    (or
      (Set_in (inv_7_1<Ref> x@216@01 y@217@01 z@218@01) ys8@55@01)
      (not (Set_in (inv_7_1<Ref> x@216@01 y@217@01 z@218@01) ys8@55@01))))))
(assert (or
  (Set_in (inv_7_0<Ref> x@216@01 y@217@01 z@218@01) xs8@44@01)
  (not (Set_in (inv_7_0<Ref> x@216@01 y@217@01 z@218@01) xs8@44@01))))
; [eval] (inv_8_0(x, y, z) in xs9) && ((inv_8_1(x, y, z) in ys9) && (inv_8_2(x, y, z) in zs9)) && (x == x && y == y && z == z)
; [eval] (inv_8_0(x, y, z) in xs9)
; [eval] inv_8_0(x, y, z)
(push) ; 6
; [then-branch: 352 | !(inv_8_0[Ref](x@216@01, y@217@01, z@218@01) in xs9@45@01) | live]
; [else-branch: 352 | inv_8_0[Ref](x@216@01, y@217@01, z@218@01) in xs9@45@01 | live]
(push) ; 7
; [then-branch: 352 | !(inv_8_0[Ref](x@216@01, y@217@01, z@218@01) in xs9@45@01)]
(assert (not (Set_in (inv_8_0<Ref> x@216@01 y@217@01 z@218@01) xs9@45@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 352 | inv_8_0[Ref](x@216@01, y@217@01, z@218@01) in xs9@45@01]
(assert (Set_in (inv_8_0<Ref> x@216@01 y@217@01 z@218@01) xs9@45@01))
; [eval] (inv_8_1(x, y, z) in ys9)
; [eval] inv_8_1(x, y, z)
(push) ; 8
; [then-branch: 353 | !(inv_8_1[Ref](x@216@01, y@217@01, z@218@01) in ys9@56@01) | live]
; [else-branch: 353 | inv_8_1[Ref](x@216@01, y@217@01, z@218@01) in ys9@56@01 | live]
(push) ; 9
; [then-branch: 353 | !(inv_8_1[Ref](x@216@01, y@217@01, z@218@01) in ys9@56@01)]
(assert (not (Set_in (inv_8_1<Ref> x@216@01 y@217@01 z@218@01) ys9@56@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 353 | inv_8_1[Ref](x@216@01, y@217@01, z@218@01) in ys9@56@01]
(assert (Set_in (inv_8_1<Ref> x@216@01 y@217@01 z@218@01) ys9@56@01))
; [eval] (inv_8_2(x, y, z) in zs9)
; [eval] inv_8_2(x, y, z)
(push) ; 10
; [then-branch: 354 | !(inv_8_2[Ref](x@216@01, y@217@01, z@218@01) in zs9@67@01) | live]
; [else-branch: 354 | inv_8_2[Ref](x@216@01, y@217@01, z@218@01) in zs9@67@01 | live]
(push) ; 11
; [then-branch: 354 | !(inv_8_2[Ref](x@216@01, y@217@01, z@218@01) in zs9@67@01)]
(assert (not (Set_in (inv_8_2<Ref> x@216@01 y@217@01 z@218@01) zs9@67@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 354 | inv_8_2[Ref](x@216@01, y@217@01, z@218@01) in zs9@67@01]
(assert (Set_in (inv_8_2<Ref> x@216@01 y@217@01 z@218@01) zs9@67@01))
; [eval] x == x
(push) ; 12
; [then-branch: 355 | False | live]
; [else-branch: 355 | True | live]
(push) ; 13
; [then-branch: 355 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 355 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 356 | False | live]
; [else-branch: 356 | True | live]
(push) ; 15
; [then-branch: 356 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 356 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_8_2<Ref> x@216@01 y@217@01 z@218@01) zs9@67@01)
  (not (Set_in (inv_8_2<Ref> x@216@01 y@217@01 z@218@01) zs9@67@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_8_1<Ref> x@216@01 y@217@01 z@218@01) ys9@56@01)
  (and
    (Set_in (inv_8_1<Ref> x@216@01 y@217@01 z@218@01) ys9@56@01)
    (or
      (Set_in (inv_8_2<Ref> x@216@01 y@217@01 z@218@01) zs9@67@01)
      (not (Set_in (inv_8_2<Ref> x@216@01 y@217@01 z@218@01) zs9@67@01))))))
(assert (or
  (Set_in (inv_8_1<Ref> x@216@01 y@217@01 z@218@01) ys9@56@01)
  (not (Set_in (inv_8_1<Ref> x@216@01 y@217@01 z@218@01) ys9@56@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_8_0<Ref> x@216@01 y@217@01 z@218@01) xs9@45@01)
  (and
    (Set_in (inv_8_0<Ref> x@216@01 y@217@01 z@218@01) xs9@45@01)
    (=>
      (Set_in (inv_8_1<Ref> x@216@01 y@217@01 z@218@01) ys9@56@01)
      (and
        (Set_in (inv_8_1<Ref> x@216@01 y@217@01 z@218@01) ys9@56@01)
        (or
          (Set_in (inv_8_2<Ref> x@216@01 y@217@01 z@218@01) zs9@67@01)
          (not (Set_in (inv_8_2<Ref> x@216@01 y@217@01 z@218@01) zs9@67@01)))))
    (or
      (Set_in (inv_8_1<Ref> x@216@01 y@217@01 z@218@01) ys9@56@01)
      (not (Set_in (inv_8_1<Ref> x@216@01 y@217@01 z@218@01) ys9@56@01))))))
(assert (or
  (Set_in (inv_8_0<Ref> x@216@01 y@217@01 z@218@01) xs9@45@01)
  (not (Set_in (inv_8_0<Ref> x@216@01 y@217@01 z@218@01) xs9@45@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 311 | !(inv_9_0[Ref](x@216@01, y@217@01, z@218@01) in xs10@46@01 && inv_9_1[Ref](x@216@01, y@217@01, z@218@01) in ys10@57@01 && inv_9_2[Ref](x@216@01, y@217@01, z@218@01) in zs10@68@01)]
(assert (not
  (and
    (Set_in (inv_9_0<Ref> x@216@01 y@217@01 z@218@01) xs10@46@01)
    (and
      (Set_in (inv_9_1<Ref> x@216@01 y@217@01 z@218@01) ys10@57@01)
      (Set_in (inv_9_2<Ref> x@216@01 y@217@01 z@218@01) zs10@68@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (=
    ($PSF.perm_p (as pm@219@01  $PPM) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    (ite
      (and
        (and (img@83@01 x y z) (img@85@01 x y z) (img@87@01 x y z))
        (and
          (Set_in (inv@82@01 x y z) xs@70@01)
          (and
            (Set_in (inv@84@01 x y z) ys@71@01)
            (Set_in (inv@86@01 x y z) zs@72@01))))
      q@73@01
      $Perm.No))
  :pattern (($PSF.perm_p (as pm@219@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resPrmSumDef20|)))
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (and
    ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    ($PSF.loc_p ($PSF.lookup_p $t@81@01 ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))))
  :pattern (($PSF.perm_p (as pm@219@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resTrgDef21|)))
(assert (=>
  (and
    (Set_in (inv_9_0<Ref> x@216@01 y@217@01 z@218@01) xs10@46@01)
    (and
      (Set_in (inv_9_1<Ref> x@216@01 y@217@01 z@218@01) ys10@57@01)
      (Set_in (inv_9_2<Ref> x@216@01 y@217@01 z@218@01) zs10@68@01)))
  (and
    (Set_in (inv_9_0<Ref> x@216@01 y@217@01 z@218@01) xs10@46@01)
    (Set_in (inv_9_1<Ref> x@216@01 y@217@01 z@218@01) ys10@57@01)
    (Set_in (inv_9_2<Ref> x@216@01 y@217@01 z@218@01) zs10@68@01)
    ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x@216@01)
        ($SortWrappers.$RefTo$Snap y@217@01))
      ($SortWrappers.$RefTo$Snap z@218@01))) ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x@216@01)
        ($SortWrappers.$RefTo$Snap y@217@01))
      ($SortWrappers.$RefTo$Snap z@218@01)))
    (=>
      (Set_in (inv_0_0<Ref> x@216@01 y@217@01 z@218@01) xs1@37@01)
      (and
        (Set_in (inv_0_0<Ref> x@216@01 y@217@01 z@218@01) xs1@37@01)
        (=>
          (Set_in (inv_0_1<Ref> x@216@01 y@217@01 z@218@01) ys1@48@01)
          (and
            (Set_in (inv_0_1<Ref> x@216@01 y@217@01 z@218@01) ys1@48@01)
            (or
              (Set_in (inv_0_2<Ref> x@216@01 y@217@01 z@218@01) zs1@59@01)
              (not (Set_in (inv_0_2<Ref> x@216@01 y@217@01 z@218@01) zs1@59@01)))))
        (or
          (Set_in (inv_0_1<Ref> x@216@01 y@217@01 z@218@01) ys1@48@01)
          (not (Set_in (inv_0_1<Ref> x@216@01 y@217@01 z@218@01) ys1@48@01)))))
    (or
      (Set_in (inv_0_0<Ref> x@216@01 y@217@01 z@218@01) xs1@37@01)
      (not (Set_in (inv_0_0<Ref> x@216@01 y@217@01 z@218@01) xs1@37@01)))
    (=>
      (Set_in (inv_1_0<Ref> x@216@01 y@217@01 z@218@01) xs2@38@01)
      (and
        (Set_in (inv_1_0<Ref> x@216@01 y@217@01 z@218@01) xs2@38@01)
        (=>
          (Set_in (inv_1_1<Ref> x@216@01 y@217@01 z@218@01) ys2@49@01)
          (and
            (Set_in (inv_1_1<Ref> x@216@01 y@217@01 z@218@01) ys2@49@01)
            (or
              (Set_in (inv_1_2<Ref> x@216@01 y@217@01 z@218@01) zs2@60@01)
              (not (Set_in (inv_1_2<Ref> x@216@01 y@217@01 z@218@01) zs2@60@01)))))
        (or
          (Set_in (inv_1_1<Ref> x@216@01 y@217@01 z@218@01) ys2@49@01)
          (not (Set_in (inv_1_1<Ref> x@216@01 y@217@01 z@218@01) ys2@49@01)))))
    (or
      (Set_in (inv_1_0<Ref> x@216@01 y@217@01 z@218@01) xs2@38@01)
      (not (Set_in (inv_1_0<Ref> x@216@01 y@217@01 z@218@01) xs2@38@01)))
    (=>
      (Set_in (inv_2_0<Ref> x@216@01 y@217@01 z@218@01) xs3@39@01)
      (and
        (Set_in (inv_2_0<Ref> x@216@01 y@217@01 z@218@01) xs3@39@01)
        (=>
          (Set_in (inv_2_1<Ref> x@216@01 y@217@01 z@218@01) ys3@50@01)
          (and
            (Set_in (inv_2_1<Ref> x@216@01 y@217@01 z@218@01) ys3@50@01)
            (or
              (Set_in (inv_2_2<Ref> x@216@01 y@217@01 z@218@01) zs3@61@01)
              (not (Set_in (inv_2_2<Ref> x@216@01 y@217@01 z@218@01) zs3@61@01)))))
        (or
          (Set_in (inv_2_1<Ref> x@216@01 y@217@01 z@218@01) ys3@50@01)
          (not (Set_in (inv_2_1<Ref> x@216@01 y@217@01 z@218@01) ys3@50@01)))))
    (or
      (Set_in (inv_2_0<Ref> x@216@01 y@217@01 z@218@01) xs3@39@01)
      (not (Set_in (inv_2_0<Ref> x@216@01 y@217@01 z@218@01) xs3@39@01)))
    (=>
      (Set_in (inv_3_0<Ref> x@216@01 y@217@01 z@218@01) xs4@40@01)
      (and
        (Set_in (inv_3_0<Ref> x@216@01 y@217@01 z@218@01) xs4@40@01)
        (=>
          (Set_in (inv_3_1<Ref> x@216@01 y@217@01 z@218@01) ys4@51@01)
          (and
            (Set_in (inv_3_1<Ref> x@216@01 y@217@01 z@218@01) ys4@51@01)
            (or
              (Set_in (inv_3_2<Ref> x@216@01 y@217@01 z@218@01) zs4@62@01)
              (not (Set_in (inv_3_2<Ref> x@216@01 y@217@01 z@218@01) zs4@62@01)))))
        (or
          (Set_in (inv_3_1<Ref> x@216@01 y@217@01 z@218@01) ys4@51@01)
          (not (Set_in (inv_3_1<Ref> x@216@01 y@217@01 z@218@01) ys4@51@01)))))
    (or
      (Set_in (inv_3_0<Ref> x@216@01 y@217@01 z@218@01) xs4@40@01)
      (not (Set_in (inv_3_0<Ref> x@216@01 y@217@01 z@218@01) xs4@40@01)))
    (=>
      (Set_in (inv_4_0<Ref> x@216@01 y@217@01 z@218@01) xs5@41@01)
      (and
        (Set_in (inv_4_0<Ref> x@216@01 y@217@01 z@218@01) xs5@41@01)
        (=>
          (Set_in (inv_4_1<Ref> x@216@01 y@217@01 z@218@01) ys5@52@01)
          (and
            (Set_in (inv_4_1<Ref> x@216@01 y@217@01 z@218@01) ys5@52@01)
            (or
              (Set_in (inv_4_2<Ref> x@216@01 y@217@01 z@218@01) zs5@63@01)
              (not (Set_in (inv_4_2<Ref> x@216@01 y@217@01 z@218@01) zs5@63@01)))))
        (or
          (Set_in (inv_4_1<Ref> x@216@01 y@217@01 z@218@01) ys5@52@01)
          (not (Set_in (inv_4_1<Ref> x@216@01 y@217@01 z@218@01) ys5@52@01)))))
    (or
      (Set_in (inv_4_0<Ref> x@216@01 y@217@01 z@218@01) xs5@41@01)
      (not (Set_in (inv_4_0<Ref> x@216@01 y@217@01 z@218@01) xs5@41@01)))
    (=>
      (Set_in (inv_5_0<Ref> x@216@01 y@217@01 z@218@01) xs6@42@01)
      (and
        (Set_in (inv_5_0<Ref> x@216@01 y@217@01 z@218@01) xs6@42@01)
        (=>
          (Set_in (inv_5_1<Ref> x@216@01 y@217@01 z@218@01) ys6@53@01)
          (and
            (Set_in (inv_5_1<Ref> x@216@01 y@217@01 z@218@01) ys6@53@01)
            (or
              (Set_in (inv_5_2<Ref> x@216@01 y@217@01 z@218@01) zs6@64@01)
              (not (Set_in (inv_5_2<Ref> x@216@01 y@217@01 z@218@01) zs6@64@01)))))
        (or
          (Set_in (inv_5_1<Ref> x@216@01 y@217@01 z@218@01) ys6@53@01)
          (not (Set_in (inv_5_1<Ref> x@216@01 y@217@01 z@218@01) ys6@53@01)))))
    (or
      (Set_in (inv_5_0<Ref> x@216@01 y@217@01 z@218@01) xs6@42@01)
      (not (Set_in (inv_5_0<Ref> x@216@01 y@217@01 z@218@01) xs6@42@01)))
    (=>
      (Set_in (inv_6_0<Ref> x@216@01 y@217@01 z@218@01) xs7@43@01)
      (and
        (Set_in (inv_6_0<Ref> x@216@01 y@217@01 z@218@01) xs7@43@01)
        (=>
          (Set_in (inv_6_1<Ref> x@216@01 y@217@01 z@218@01) ys7@54@01)
          (and
            (Set_in (inv_6_1<Ref> x@216@01 y@217@01 z@218@01) ys7@54@01)
            (or
              (Set_in (inv_6_2<Ref> x@216@01 y@217@01 z@218@01) zs7@65@01)
              (not (Set_in (inv_6_2<Ref> x@216@01 y@217@01 z@218@01) zs7@65@01)))))
        (or
          (Set_in (inv_6_1<Ref> x@216@01 y@217@01 z@218@01) ys7@54@01)
          (not (Set_in (inv_6_1<Ref> x@216@01 y@217@01 z@218@01) ys7@54@01)))))
    (or
      (Set_in (inv_6_0<Ref> x@216@01 y@217@01 z@218@01) xs7@43@01)
      (not (Set_in (inv_6_0<Ref> x@216@01 y@217@01 z@218@01) xs7@43@01)))
    (=>
      (Set_in (inv_7_0<Ref> x@216@01 y@217@01 z@218@01) xs8@44@01)
      (and
        (Set_in (inv_7_0<Ref> x@216@01 y@217@01 z@218@01) xs8@44@01)
        (=>
          (Set_in (inv_7_1<Ref> x@216@01 y@217@01 z@218@01) ys8@55@01)
          (and
            (Set_in (inv_7_1<Ref> x@216@01 y@217@01 z@218@01) ys8@55@01)
            (or
              (Set_in (inv_7_2<Ref> x@216@01 y@217@01 z@218@01) zs8@66@01)
              (not (Set_in (inv_7_2<Ref> x@216@01 y@217@01 z@218@01) zs8@66@01)))))
        (or
          (Set_in (inv_7_1<Ref> x@216@01 y@217@01 z@218@01) ys8@55@01)
          (not (Set_in (inv_7_1<Ref> x@216@01 y@217@01 z@218@01) ys8@55@01)))))
    (or
      (Set_in (inv_7_0<Ref> x@216@01 y@217@01 z@218@01) xs8@44@01)
      (not (Set_in (inv_7_0<Ref> x@216@01 y@217@01 z@218@01) xs8@44@01)))
    (=>
      (Set_in (inv_8_0<Ref> x@216@01 y@217@01 z@218@01) xs9@45@01)
      (and
        (Set_in (inv_8_0<Ref> x@216@01 y@217@01 z@218@01) xs9@45@01)
        (=>
          (Set_in (inv_8_1<Ref> x@216@01 y@217@01 z@218@01) ys9@56@01)
          (and
            (Set_in (inv_8_1<Ref> x@216@01 y@217@01 z@218@01) ys9@56@01)
            (or
              (Set_in (inv_8_2<Ref> x@216@01 y@217@01 z@218@01) zs9@67@01)
              (not (Set_in (inv_8_2<Ref> x@216@01 y@217@01 z@218@01) zs9@67@01)))))
        (or
          (Set_in (inv_8_1<Ref> x@216@01 y@217@01 z@218@01) ys9@56@01)
          (not (Set_in (inv_8_1<Ref> x@216@01 y@217@01 z@218@01) ys9@56@01)))))
    (or
      (Set_in (inv_8_0<Ref> x@216@01 y@217@01 z@218@01) xs9@45@01)
      (not (Set_in (inv_8_0<Ref> x@216@01 y@217@01 z@218@01) xs9@45@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in (inv_9_0<Ref> x@216@01 y@217@01 z@218@01) xs10@46@01)
      (and
        (Set_in (inv_9_1<Ref> x@216@01 y@217@01 z@218@01) ys10@57@01)
        (Set_in (inv_9_2<Ref> x@216@01 y@217@01 z@218@01) zs10@68@01))))
  (and
    (Set_in (inv_9_0<Ref> x@216@01 y@217@01 z@218@01) xs10@46@01)
    (and
      (Set_in (inv_9_1<Ref> x@216@01 y@217@01 z@218@01) ys10@57@01)
      (Set_in (inv_9_2<Ref> x@216@01 y@217@01 z@218@01) zs10@68@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (=
    ($PSF.perm_p (as pm@219@01  $PPM) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    (ite
      (and
        (and (img@83@01 x y z) (img@85@01 x y z) (img@87@01 x y z))
        (and
          (Set_in (inv@82@01 x y z) xs@70@01)
          (and
            (Set_in (inv@84@01 x y z) ys@71@01)
            (Set_in (inv@86@01 x y z) zs@72@01))))
      q@73@01
      $Perm.No))
  :pattern (($PSF.perm_p (as pm@219@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resPrmSumDef20|)))
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (and
    ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    ($PSF.loc_p ($PSF.lookup_p $t@81@01 ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))))
  :pattern (($PSF.perm_p (as pm@219@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resTrgDef21|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@216@01 $Ref) (y@217@01 $Ref) (z@218@01 $Ref)) (!
  (and
    (=>
      (Set_in (inv_9_0<Ref> x@216@01 y@217@01 z@218@01) xs10@46@01)
      (and
        (Set_in (inv_9_0<Ref> x@216@01 y@217@01 z@218@01) xs10@46@01)
        (or
          (Set_in (inv_9_1<Ref> x@216@01 y@217@01 z@218@01) ys10@57@01)
          (not (Set_in (inv_9_1<Ref> x@216@01 y@217@01 z@218@01) ys10@57@01)))))
    (or
      (Set_in (inv_9_0<Ref> x@216@01 y@217@01 z@218@01) xs10@46@01)
      (not (Set_in (inv_9_0<Ref> x@216@01 y@217@01 z@218@01) xs10@46@01)))
    (=>
      (and
        (Set_in (inv_9_0<Ref> x@216@01 y@217@01 z@218@01) xs10@46@01)
        (and
          (Set_in (inv_9_1<Ref> x@216@01 y@217@01 z@218@01) ys10@57@01)
          (Set_in (inv_9_2<Ref> x@216@01 y@217@01 z@218@01) zs10@68@01)))
      (and
        (Set_in (inv_9_0<Ref> x@216@01 y@217@01 z@218@01) xs10@46@01)
        (Set_in (inv_9_1<Ref> x@216@01 y@217@01 z@218@01) ys10@57@01)
        (Set_in (inv_9_2<Ref> x@216@01 y@217@01 z@218@01) zs10@68@01)
        ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap x@216@01)
            ($SortWrappers.$RefTo$Snap y@217@01))
          ($SortWrappers.$RefTo$Snap z@218@01))) ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap x@216@01)
            ($SortWrappers.$RefTo$Snap y@217@01))
          ($SortWrappers.$RefTo$Snap z@218@01)))
        (=>
          (Set_in (inv_0_0<Ref> x@216@01 y@217@01 z@218@01) xs1@37@01)
          (and
            (Set_in (inv_0_0<Ref> x@216@01 y@217@01 z@218@01) xs1@37@01)
            (=>
              (Set_in (inv_0_1<Ref> x@216@01 y@217@01 z@218@01) ys1@48@01)
              (and
                (Set_in (inv_0_1<Ref> x@216@01 y@217@01 z@218@01) ys1@48@01)
                (or
                  (Set_in (inv_0_2<Ref> x@216@01 y@217@01 z@218@01) zs1@59@01)
                  (not
                    (Set_in (inv_0_2<Ref> x@216@01 y@217@01 z@218@01) zs1@59@01)))))
            (or
              (Set_in (inv_0_1<Ref> x@216@01 y@217@01 z@218@01) ys1@48@01)
              (not (Set_in (inv_0_1<Ref> x@216@01 y@217@01 z@218@01) ys1@48@01)))))
        (or
          (Set_in (inv_0_0<Ref> x@216@01 y@217@01 z@218@01) xs1@37@01)
          (not (Set_in (inv_0_0<Ref> x@216@01 y@217@01 z@218@01) xs1@37@01)))
        (=>
          (Set_in (inv_1_0<Ref> x@216@01 y@217@01 z@218@01) xs2@38@01)
          (and
            (Set_in (inv_1_0<Ref> x@216@01 y@217@01 z@218@01) xs2@38@01)
            (=>
              (Set_in (inv_1_1<Ref> x@216@01 y@217@01 z@218@01) ys2@49@01)
              (and
                (Set_in (inv_1_1<Ref> x@216@01 y@217@01 z@218@01) ys2@49@01)
                (or
                  (Set_in (inv_1_2<Ref> x@216@01 y@217@01 z@218@01) zs2@60@01)
                  (not
                    (Set_in (inv_1_2<Ref> x@216@01 y@217@01 z@218@01) zs2@60@01)))))
            (or
              (Set_in (inv_1_1<Ref> x@216@01 y@217@01 z@218@01) ys2@49@01)
              (not (Set_in (inv_1_1<Ref> x@216@01 y@217@01 z@218@01) ys2@49@01)))))
        (or
          (Set_in (inv_1_0<Ref> x@216@01 y@217@01 z@218@01) xs2@38@01)
          (not (Set_in (inv_1_0<Ref> x@216@01 y@217@01 z@218@01) xs2@38@01)))
        (=>
          (Set_in (inv_2_0<Ref> x@216@01 y@217@01 z@218@01) xs3@39@01)
          (and
            (Set_in (inv_2_0<Ref> x@216@01 y@217@01 z@218@01) xs3@39@01)
            (=>
              (Set_in (inv_2_1<Ref> x@216@01 y@217@01 z@218@01) ys3@50@01)
              (and
                (Set_in (inv_2_1<Ref> x@216@01 y@217@01 z@218@01) ys3@50@01)
                (or
                  (Set_in (inv_2_2<Ref> x@216@01 y@217@01 z@218@01) zs3@61@01)
                  (not
                    (Set_in (inv_2_2<Ref> x@216@01 y@217@01 z@218@01) zs3@61@01)))))
            (or
              (Set_in (inv_2_1<Ref> x@216@01 y@217@01 z@218@01) ys3@50@01)
              (not (Set_in (inv_2_1<Ref> x@216@01 y@217@01 z@218@01) ys3@50@01)))))
        (or
          (Set_in (inv_2_0<Ref> x@216@01 y@217@01 z@218@01) xs3@39@01)
          (not (Set_in (inv_2_0<Ref> x@216@01 y@217@01 z@218@01) xs3@39@01)))
        (=>
          (Set_in (inv_3_0<Ref> x@216@01 y@217@01 z@218@01) xs4@40@01)
          (and
            (Set_in (inv_3_0<Ref> x@216@01 y@217@01 z@218@01) xs4@40@01)
            (=>
              (Set_in (inv_3_1<Ref> x@216@01 y@217@01 z@218@01) ys4@51@01)
              (and
                (Set_in (inv_3_1<Ref> x@216@01 y@217@01 z@218@01) ys4@51@01)
                (or
                  (Set_in (inv_3_2<Ref> x@216@01 y@217@01 z@218@01) zs4@62@01)
                  (not
                    (Set_in (inv_3_2<Ref> x@216@01 y@217@01 z@218@01) zs4@62@01)))))
            (or
              (Set_in (inv_3_1<Ref> x@216@01 y@217@01 z@218@01) ys4@51@01)
              (not (Set_in (inv_3_1<Ref> x@216@01 y@217@01 z@218@01) ys4@51@01)))))
        (or
          (Set_in (inv_3_0<Ref> x@216@01 y@217@01 z@218@01) xs4@40@01)
          (not (Set_in (inv_3_0<Ref> x@216@01 y@217@01 z@218@01) xs4@40@01)))
        (=>
          (Set_in (inv_4_0<Ref> x@216@01 y@217@01 z@218@01) xs5@41@01)
          (and
            (Set_in (inv_4_0<Ref> x@216@01 y@217@01 z@218@01) xs5@41@01)
            (=>
              (Set_in (inv_4_1<Ref> x@216@01 y@217@01 z@218@01) ys5@52@01)
              (and
                (Set_in (inv_4_1<Ref> x@216@01 y@217@01 z@218@01) ys5@52@01)
                (or
                  (Set_in (inv_4_2<Ref> x@216@01 y@217@01 z@218@01) zs5@63@01)
                  (not
                    (Set_in (inv_4_2<Ref> x@216@01 y@217@01 z@218@01) zs5@63@01)))))
            (or
              (Set_in (inv_4_1<Ref> x@216@01 y@217@01 z@218@01) ys5@52@01)
              (not (Set_in (inv_4_1<Ref> x@216@01 y@217@01 z@218@01) ys5@52@01)))))
        (or
          (Set_in (inv_4_0<Ref> x@216@01 y@217@01 z@218@01) xs5@41@01)
          (not (Set_in (inv_4_0<Ref> x@216@01 y@217@01 z@218@01) xs5@41@01)))
        (=>
          (Set_in (inv_5_0<Ref> x@216@01 y@217@01 z@218@01) xs6@42@01)
          (and
            (Set_in (inv_5_0<Ref> x@216@01 y@217@01 z@218@01) xs6@42@01)
            (=>
              (Set_in (inv_5_1<Ref> x@216@01 y@217@01 z@218@01) ys6@53@01)
              (and
                (Set_in (inv_5_1<Ref> x@216@01 y@217@01 z@218@01) ys6@53@01)
                (or
                  (Set_in (inv_5_2<Ref> x@216@01 y@217@01 z@218@01) zs6@64@01)
                  (not
                    (Set_in (inv_5_2<Ref> x@216@01 y@217@01 z@218@01) zs6@64@01)))))
            (or
              (Set_in (inv_5_1<Ref> x@216@01 y@217@01 z@218@01) ys6@53@01)
              (not (Set_in (inv_5_1<Ref> x@216@01 y@217@01 z@218@01) ys6@53@01)))))
        (or
          (Set_in (inv_5_0<Ref> x@216@01 y@217@01 z@218@01) xs6@42@01)
          (not (Set_in (inv_5_0<Ref> x@216@01 y@217@01 z@218@01) xs6@42@01)))
        (=>
          (Set_in (inv_6_0<Ref> x@216@01 y@217@01 z@218@01) xs7@43@01)
          (and
            (Set_in (inv_6_0<Ref> x@216@01 y@217@01 z@218@01) xs7@43@01)
            (=>
              (Set_in (inv_6_1<Ref> x@216@01 y@217@01 z@218@01) ys7@54@01)
              (and
                (Set_in (inv_6_1<Ref> x@216@01 y@217@01 z@218@01) ys7@54@01)
                (or
                  (Set_in (inv_6_2<Ref> x@216@01 y@217@01 z@218@01) zs7@65@01)
                  (not
                    (Set_in (inv_6_2<Ref> x@216@01 y@217@01 z@218@01) zs7@65@01)))))
            (or
              (Set_in (inv_6_1<Ref> x@216@01 y@217@01 z@218@01) ys7@54@01)
              (not (Set_in (inv_6_1<Ref> x@216@01 y@217@01 z@218@01) ys7@54@01)))))
        (or
          (Set_in (inv_6_0<Ref> x@216@01 y@217@01 z@218@01) xs7@43@01)
          (not (Set_in (inv_6_0<Ref> x@216@01 y@217@01 z@218@01) xs7@43@01)))
        (=>
          (Set_in (inv_7_0<Ref> x@216@01 y@217@01 z@218@01) xs8@44@01)
          (and
            (Set_in (inv_7_0<Ref> x@216@01 y@217@01 z@218@01) xs8@44@01)
            (=>
              (Set_in (inv_7_1<Ref> x@216@01 y@217@01 z@218@01) ys8@55@01)
              (and
                (Set_in (inv_7_1<Ref> x@216@01 y@217@01 z@218@01) ys8@55@01)
                (or
                  (Set_in (inv_7_2<Ref> x@216@01 y@217@01 z@218@01) zs8@66@01)
                  (not
                    (Set_in (inv_7_2<Ref> x@216@01 y@217@01 z@218@01) zs8@66@01)))))
            (or
              (Set_in (inv_7_1<Ref> x@216@01 y@217@01 z@218@01) ys8@55@01)
              (not (Set_in (inv_7_1<Ref> x@216@01 y@217@01 z@218@01) ys8@55@01)))))
        (or
          (Set_in (inv_7_0<Ref> x@216@01 y@217@01 z@218@01) xs8@44@01)
          (not (Set_in (inv_7_0<Ref> x@216@01 y@217@01 z@218@01) xs8@44@01)))
        (=>
          (Set_in (inv_8_0<Ref> x@216@01 y@217@01 z@218@01) xs9@45@01)
          (and
            (Set_in (inv_8_0<Ref> x@216@01 y@217@01 z@218@01) xs9@45@01)
            (=>
              (Set_in (inv_8_1<Ref> x@216@01 y@217@01 z@218@01) ys9@56@01)
              (and
                (Set_in (inv_8_1<Ref> x@216@01 y@217@01 z@218@01) ys9@56@01)
                (or
                  (Set_in (inv_8_2<Ref> x@216@01 y@217@01 z@218@01) zs9@67@01)
                  (not
                    (Set_in (inv_8_2<Ref> x@216@01 y@217@01 z@218@01) zs9@67@01)))))
            (or
              (Set_in (inv_8_1<Ref> x@216@01 y@217@01 z@218@01) ys9@56@01)
              (not (Set_in (inv_8_1<Ref> x@216@01 y@217@01 z@218@01) ys9@56@01)))))
        (or
          (Set_in (inv_8_0<Ref> x@216@01 y@217@01 z@218@01) xs9@45@01)
          (not (Set_in (inv_8_0<Ref> x@216@01 y@217@01 z@218@01) xs9@45@01)))))
    (or
      (not
        (and
          (Set_in (inv_9_0<Ref> x@216@01 y@217@01 z@218@01) xs10@46@01)
          (and
            (Set_in (inv_9_1<Ref> x@216@01 y@217@01 z@218@01) ys10@57@01)
            (Set_in (inv_9_2<Ref> x@216@01 y@217@01 z@218@01) zs10@68@01))))
      (and
        (Set_in (inv_9_0<Ref> x@216@01 y@217@01 z@218@01) xs10@46@01)
        (and
          (Set_in (inv_9_1<Ref> x@216@01 y@217@01 z@218@01) ys10@57@01)
          (Set_in (inv_9_2<Ref> x@216@01 y@217@01 z@218@01) zs10@68@01)))))
  :pattern ((inv_9_0<Ref> x@216@01 y@217@01 z@218@01) (inv_9_1<Ref> x@216@01 y@217@01 z@218@01) (inv_9_2<Ref> x@216@01 y@217@01 z@218@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@29@9@29@137-aux|)))
(assert (forall ((x@216@01 $Ref) (y@217@01 $Ref) (z@218@01 $Ref)) (!
  (=>
    (and
      (Set_in (inv_9_0<Ref> x@216@01 y@217@01 z@218@01) xs10@46@01)
      (and
        (Set_in (inv_9_1<Ref> x@216@01 y@217@01 z@218@01) ys10@57@01)
        (Set_in (inv_9_2<Ref> x@216@01 y@217@01 z@218@01) zs10@68@01)))
    (>=
      ($PSF.perm_p (as pm@219@01  $PPM) ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap x@216@01)
          ($SortWrappers.$RefTo$Snap y@217@01))
        ($SortWrappers.$RefTo$Snap z@218@01)))
      (__iar__assume_helper_9<Perm> (and
        (Set_in (inv_0_0<Ref> x@216@01 y@217@01 z@218@01) xs1@37@01)
        (and
          (Set_in (inv_0_1<Ref> x@216@01 y@217@01 z@218@01) ys1@48@01)
          (Set_in (inv_0_2<Ref> x@216@01 y@217@01 z@218@01) zs1@59@01))) (and
        (Set_in (inv_1_0<Ref> x@216@01 y@217@01 z@218@01) xs2@38@01)
        (and
          (Set_in (inv_1_1<Ref> x@216@01 y@217@01 z@218@01) ys2@49@01)
          (Set_in (inv_1_2<Ref> x@216@01 y@217@01 z@218@01) zs2@60@01))) (and
        (Set_in (inv_2_0<Ref> x@216@01 y@217@01 z@218@01) xs3@39@01)
        (and
          (Set_in (inv_2_1<Ref> x@216@01 y@217@01 z@218@01) ys3@50@01)
          (Set_in (inv_2_2<Ref> x@216@01 y@217@01 z@218@01) zs3@61@01))) (and
        (Set_in (inv_3_0<Ref> x@216@01 y@217@01 z@218@01) xs4@40@01)
        (and
          (Set_in (inv_3_1<Ref> x@216@01 y@217@01 z@218@01) ys4@51@01)
          (Set_in (inv_3_2<Ref> x@216@01 y@217@01 z@218@01) zs4@62@01))) (and
        (Set_in (inv_4_0<Ref> x@216@01 y@217@01 z@218@01) xs5@41@01)
        (and
          (Set_in (inv_4_1<Ref> x@216@01 y@217@01 z@218@01) ys5@52@01)
          (Set_in (inv_4_2<Ref> x@216@01 y@217@01 z@218@01) zs5@63@01))) (and
        (Set_in (inv_5_0<Ref> x@216@01 y@217@01 z@218@01) xs6@42@01)
        (and
          (Set_in (inv_5_1<Ref> x@216@01 y@217@01 z@218@01) ys6@53@01)
          (Set_in (inv_5_2<Ref> x@216@01 y@217@01 z@218@01) zs6@64@01))) (and
        (Set_in (inv_6_0<Ref> x@216@01 y@217@01 z@218@01) xs7@43@01)
        (and
          (Set_in (inv_6_1<Ref> x@216@01 y@217@01 z@218@01) ys7@54@01)
          (Set_in (inv_6_2<Ref> x@216@01 y@217@01 z@218@01) zs7@65@01))) (and
        (Set_in (inv_7_0<Ref> x@216@01 y@217@01 z@218@01) xs8@44@01)
        (and
          (Set_in (inv_7_1<Ref> x@216@01 y@217@01 z@218@01) ys8@55@01)
          (Set_in (inv_7_2<Ref> x@216@01 y@217@01 z@218@01) zs8@66@01))) (and
        (Set_in (inv_8_0<Ref> x@216@01 y@217@01 z@218@01) xs9@45@01)
        (and
          (Set_in (inv_8_1<Ref> x@216@01 y@217@01 z@218@01) ys9@56@01)
          (Set_in (inv_8_2<Ref> x@216@01 y@217@01 z@218@01) zs9@67@01))) q@73@01 q@73@01 q@73@01 q@73@01 q@73@01 q@73@01 q@73@01 q@73@01 q@73@01 q@73@01)))
  :pattern ((inv_9_0<Ref> x@216@01 y@217@01 z@218@01) (inv_9_1<Ref> x@216@01 y@217@01 z@218@01) (inv_9_2<Ref> x@216@01 y@217@01 z@218@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@29@9@29@137|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x11: Ref, y11: Ref, z11: Ref ::
;     { p(x11, y11, z11) }
;     (x11 in xs11) && ((y11 in ys11) && (z11 in zs11)) ==>
;     inv_10_0(x11, y11, z11) == x11 && inv_10_1(x11, y11, z11) == y11 &&
;     inv_10_2(x11, y11, z11) == z11)
(declare-const $t@220@01 $Snap)
(assert (= $t@220@01 $Snap.unit))
; [eval] (forall x11: Ref, y11: Ref, z11: Ref :: { p(x11, y11, z11) } (x11 in xs11) && ((y11 in ys11) && (z11 in zs11)) ==> inv_10_0(x11, y11, z11) == x11 && inv_10_1(x11, y11, z11) == y11 && inv_10_2(x11, y11, z11) == z11)
(declare-const x11@221@01 $Ref)
(declare-const y11@222@01 $Ref)
(declare-const z11@223@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x11 in xs11) && ((y11 in ys11) && (z11 in zs11)) ==> inv_10_0(x11, y11, z11) == x11 && inv_10_1(x11, y11, z11) == y11 && inv_10_2(x11, y11, z11) == z11
; [eval] (x11 in xs11) && ((y11 in ys11) && (z11 in zs11))
; [eval] (x11 in xs11)
(push) ; 4
; [then-branch: 357 | !(x11@221@01 in xs11@47@01) | live]
; [else-branch: 357 | x11@221@01 in xs11@47@01 | live]
(push) ; 5
; [then-branch: 357 | !(x11@221@01 in xs11@47@01)]
(assert (not (Set_in x11@221@01 xs11@47@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 357 | x11@221@01 in xs11@47@01]
(assert (Set_in x11@221@01 xs11@47@01))
; [eval] (y11 in ys11)
(push) ; 6
; [then-branch: 358 | !(y11@222@01 in ys11@58@01) | live]
; [else-branch: 358 | y11@222@01 in ys11@58@01 | live]
(push) ; 7
; [then-branch: 358 | !(y11@222@01 in ys11@58@01)]
(assert (not (Set_in y11@222@01 ys11@58@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 358 | y11@222@01 in ys11@58@01]
(assert (Set_in y11@222@01 ys11@58@01))
; [eval] (z11 in zs11)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (Set_in y11@222@01 ys11@58@01) (not (Set_in y11@222@01 ys11@58@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in x11@221@01 xs11@47@01)
  (and
    (Set_in x11@221@01 xs11@47@01)
    (or (Set_in y11@222@01 ys11@58@01) (not (Set_in y11@222@01 ys11@58@01))))))
(assert (or (Set_in x11@221@01 xs11@47@01) (not (Set_in x11@221@01 xs11@47@01))))
(push) ; 4
; [then-branch: 359 | x11@221@01 in xs11@47@01 && y11@222@01 in ys11@58@01 && z11@223@01 in zs11@69@01 | live]
; [else-branch: 359 | !(x11@221@01 in xs11@47@01 && y11@222@01 in ys11@58@01 && z11@223@01 in zs11@69@01) | live]
(push) ; 5
; [then-branch: 359 | x11@221@01 in xs11@47@01 && y11@222@01 in ys11@58@01 && z11@223@01 in zs11@69@01]
(assert (and
  (Set_in x11@221@01 xs11@47@01)
  (and (Set_in y11@222@01 ys11@58@01) (Set_in z11@223@01 zs11@69@01))))
; [eval] inv_10_0(x11, y11, z11) == x11 && inv_10_1(x11, y11, z11) == y11 && inv_10_2(x11, y11, z11) == z11
; [eval] inv_10_0(x11, y11, z11) == x11
; [eval] inv_10_0(x11, y11, z11)
(push) ; 6
; [then-branch: 360 | inv_10_0[Ref](x11@221@01, y11@222@01, z11@223@01) != x11@221@01 | live]
; [else-branch: 360 | inv_10_0[Ref](x11@221@01, y11@222@01, z11@223@01) == x11@221@01 | live]
(push) ; 7
; [then-branch: 360 | inv_10_0[Ref](x11@221@01, y11@222@01, z11@223@01) != x11@221@01]
(assert (not (= (inv_10_0<Ref> x11@221@01 y11@222@01 z11@223@01) x11@221@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 360 | inv_10_0[Ref](x11@221@01, y11@222@01, z11@223@01) == x11@221@01]
(assert (= (inv_10_0<Ref> x11@221@01 y11@222@01 z11@223@01) x11@221@01))
; [eval] inv_10_1(x11, y11, z11) == y11
; [eval] inv_10_1(x11, y11, z11)
(push) ; 8
; [then-branch: 361 | inv_10_1[Ref](x11@221@01, y11@222@01, z11@223@01) != y11@222@01 | live]
; [else-branch: 361 | inv_10_1[Ref](x11@221@01, y11@222@01, z11@223@01) == y11@222@01 | live]
(push) ; 9
; [then-branch: 361 | inv_10_1[Ref](x11@221@01, y11@222@01, z11@223@01) != y11@222@01]
(assert (not (= (inv_10_1<Ref> x11@221@01 y11@222@01 z11@223@01) y11@222@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 361 | inv_10_1[Ref](x11@221@01, y11@222@01, z11@223@01) == y11@222@01]
(assert (= (inv_10_1<Ref> x11@221@01 y11@222@01 z11@223@01) y11@222@01))
; [eval] inv_10_2(x11, y11, z11) == z11
; [eval] inv_10_2(x11, y11, z11)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or
  (= (inv_10_1<Ref> x11@221@01 y11@222@01 z11@223@01) y11@222@01)
  (not (= (inv_10_1<Ref> x11@221@01 y11@222@01 z11@223@01) y11@222@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (= (inv_10_0<Ref> x11@221@01 y11@222@01 z11@223@01) x11@221@01)
  (and
    (= (inv_10_0<Ref> x11@221@01 y11@222@01 z11@223@01) x11@221@01)
    (or
      (= (inv_10_1<Ref> x11@221@01 y11@222@01 z11@223@01) y11@222@01)
      (not (= (inv_10_1<Ref> x11@221@01 y11@222@01 z11@223@01) y11@222@01))))))
(assert (or
  (= (inv_10_0<Ref> x11@221@01 y11@222@01 z11@223@01) x11@221@01)
  (not (= (inv_10_0<Ref> x11@221@01 y11@222@01 z11@223@01) x11@221@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 359 | !(x11@221@01 in xs11@47@01 && y11@222@01 in ys11@58@01 && z11@223@01 in zs11@69@01)]
(assert (not
  (and
    (Set_in x11@221@01 xs11@47@01)
    (and (Set_in y11@222@01 ys11@58@01) (Set_in z11@223@01 zs11@69@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Set_in x11@221@01 xs11@47@01)
    (and (Set_in y11@222@01 ys11@58@01) (Set_in z11@223@01 zs11@69@01)))
  (and
    (Set_in x11@221@01 xs11@47@01)
    (Set_in y11@222@01 ys11@58@01)
    (Set_in z11@223@01 zs11@69@01)
    (=>
      (= (inv_10_0<Ref> x11@221@01 y11@222@01 z11@223@01) x11@221@01)
      (and
        (= (inv_10_0<Ref> x11@221@01 y11@222@01 z11@223@01) x11@221@01)
        (or
          (= (inv_10_1<Ref> x11@221@01 y11@222@01 z11@223@01) y11@222@01)
          (not (= (inv_10_1<Ref> x11@221@01 y11@222@01 z11@223@01) y11@222@01)))))
    (or
      (= (inv_10_0<Ref> x11@221@01 y11@222@01 z11@223@01) x11@221@01)
      (not (= (inv_10_0<Ref> x11@221@01 y11@222@01 z11@223@01) x11@221@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in x11@221@01 xs11@47@01)
      (and (Set_in y11@222@01 ys11@58@01) (Set_in z11@223@01 zs11@69@01))))
  (and
    (Set_in x11@221@01 xs11@47@01)
    (and (Set_in y11@222@01 ys11@58@01) (Set_in z11@223@01 zs11@69@01)))))
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x11@221@01 $Ref) (y11@222@01 $Ref) (z11@223@01 $Ref)) (!
  (and
    (=>
      (Set_in x11@221@01 xs11@47@01)
      (and
        (Set_in x11@221@01 xs11@47@01)
        (or (Set_in y11@222@01 ys11@58@01) (not (Set_in y11@222@01 ys11@58@01)))))
    (or (Set_in x11@221@01 xs11@47@01) (not (Set_in x11@221@01 xs11@47@01)))
    (=>
      (and
        (Set_in x11@221@01 xs11@47@01)
        (and (Set_in y11@222@01 ys11@58@01) (Set_in z11@223@01 zs11@69@01)))
      (and
        (Set_in x11@221@01 xs11@47@01)
        (Set_in y11@222@01 ys11@58@01)
        (Set_in z11@223@01 zs11@69@01)
        (=>
          (= (inv_10_0<Ref> x11@221@01 y11@222@01 z11@223@01) x11@221@01)
          (and
            (= (inv_10_0<Ref> x11@221@01 y11@222@01 z11@223@01) x11@221@01)
            (or
              (= (inv_10_1<Ref> x11@221@01 y11@222@01 z11@223@01) y11@222@01)
              (not
                (= (inv_10_1<Ref> x11@221@01 y11@222@01 z11@223@01) y11@222@01)))))
        (or
          (= (inv_10_0<Ref> x11@221@01 y11@222@01 z11@223@01) x11@221@01)
          (not (= (inv_10_0<Ref> x11@221@01 y11@222@01 z11@223@01) x11@221@01)))))
    (or
      (not
        (and
          (Set_in x11@221@01 xs11@47@01)
          (and (Set_in y11@222@01 ys11@58@01) (Set_in z11@223@01 zs11@69@01))))
      (and
        (Set_in x11@221@01 xs11@47@01)
        (and (Set_in y11@222@01 ys11@58@01) (Set_in z11@223@01 zs11@69@01)))))
  :pattern (($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap x11@221@01)
      ($SortWrappers.$RefTo$Snap y11@222@01))
    ($SortWrappers.$RefTo$Snap z11@223@01))) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap x11@221@01)
      ($SortWrappers.$RefTo$Snap y11@222@01))
    ($SortWrappers.$RefTo$Snap z11@223@01))))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@30@9@30@137-aux|)))
(assert (forall ((x11@221@01 $Ref) (y11@222@01 $Ref) (z11@223@01 $Ref)) (!
  (=>
    (and
      (Set_in x11@221@01 xs11@47@01)
      (and (Set_in y11@222@01 ys11@58@01) (Set_in z11@223@01 zs11@69@01)))
    (and
      (= (inv_10_0<Ref> x11@221@01 y11@222@01 z11@223@01) x11@221@01)
      (and
        (= (inv_10_1<Ref> x11@221@01 y11@222@01 z11@223@01) y11@222@01)
        (= (inv_10_2<Ref> x11@221@01 y11@222@01 z11@223@01) z11@223@01))))
  :pattern (($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap x11@221@01)
      ($SortWrappers.$RefTo$Snap y11@222@01))
    ($SortWrappers.$RefTo$Snap z11@223@01))) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap x11@221@01)
      ($SortWrappers.$RefTo$Snap y11@222@01))
    ($SortWrappers.$RefTo$Snap z11@223@01))))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@30@9@30@137|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x: Ref, y: Ref, z: Ref ::
;     { inv_10_0(x, y, z), inv_10_1(x, y, z), inv_10_2(x, y, z) }
;     (inv_10_0(x, y, z) in xs11) &&
;     ((inv_10_1(x, y, z) in ys11) && (inv_10_2(x, y, z) in zs11)) ==>
;     inv_10_0(x, y, z) == x && inv_10_1(x, y, z) == y &&
;     inv_10_2(x, y, z) == z)
(declare-const $t@224@01 $Snap)
(assert (= $t@224@01 $Snap.unit))
; [eval] (forall x: Ref, y: Ref, z: Ref :: { inv_10_0(x, y, z), inv_10_1(x, y, z), inv_10_2(x, y, z) } (inv_10_0(x, y, z) in xs11) && ((inv_10_1(x, y, z) in ys11) && (inv_10_2(x, y, z) in zs11)) ==> inv_10_0(x, y, z) == x && inv_10_1(x, y, z) == y && inv_10_2(x, y, z) == z)
(declare-const x@225@01 $Ref)
(declare-const y@226@01 $Ref)
(declare-const z@227@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (inv_10_0(x, y, z) in xs11) && ((inv_10_1(x, y, z) in ys11) && (inv_10_2(x, y, z) in zs11)) ==> inv_10_0(x, y, z) == x && inv_10_1(x, y, z) == y && inv_10_2(x, y, z) == z
; [eval] (inv_10_0(x, y, z) in xs11) && ((inv_10_1(x, y, z) in ys11) && (inv_10_2(x, y, z) in zs11))
; [eval] (inv_10_0(x, y, z) in xs11)
; [eval] inv_10_0(x, y, z)
(push) ; 4
; [then-branch: 362 | !(inv_10_0[Ref](x@225@01, y@226@01, z@227@01) in xs11@47@01) | live]
; [else-branch: 362 | inv_10_0[Ref](x@225@01, y@226@01, z@227@01) in xs11@47@01 | live]
(push) ; 5
; [then-branch: 362 | !(inv_10_0[Ref](x@225@01, y@226@01, z@227@01) in xs11@47@01)]
(assert (not (Set_in (inv_10_0<Ref> x@225@01 y@226@01 z@227@01) xs11@47@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 362 | inv_10_0[Ref](x@225@01, y@226@01, z@227@01) in xs11@47@01]
(assert (Set_in (inv_10_0<Ref> x@225@01 y@226@01 z@227@01) xs11@47@01))
; [eval] (inv_10_1(x, y, z) in ys11)
; [eval] inv_10_1(x, y, z)
(push) ; 6
; [then-branch: 363 | !(inv_10_1[Ref](x@225@01, y@226@01, z@227@01) in ys11@58@01) | live]
; [else-branch: 363 | inv_10_1[Ref](x@225@01, y@226@01, z@227@01) in ys11@58@01 | live]
(push) ; 7
; [then-branch: 363 | !(inv_10_1[Ref](x@225@01, y@226@01, z@227@01) in ys11@58@01)]
(assert (not (Set_in (inv_10_1<Ref> x@225@01 y@226@01 z@227@01) ys11@58@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 363 | inv_10_1[Ref](x@225@01, y@226@01, z@227@01) in ys11@58@01]
(assert (Set_in (inv_10_1<Ref> x@225@01 y@226@01 z@227@01) ys11@58@01))
; [eval] (inv_10_2(x, y, z) in zs11)
; [eval] inv_10_2(x, y, z)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_10_1<Ref> x@225@01 y@226@01 z@227@01) ys11@58@01)
  (not (Set_in (inv_10_1<Ref> x@225@01 y@226@01 z@227@01) ys11@58@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_10_0<Ref> x@225@01 y@226@01 z@227@01) xs11@47@01)
  (and
    (Set_in (inv_10_0<Ref> x@225@01 y@226@01 z@227@01) xs11@47@01)
    (or
      (Set_in (inv_10_1<Ref> x@225@01 y@226@01 z@227@01) ys11@58@01)
      (not (Set_in (inv_10_1<Ref> x@225@01 y@226@01 z@227@01) ys11@58@01))))))
(assert (or
  (Set_in (inv_10_0<Ref> x@225@01 y@226@01 z@227@01) xs11@47@01)
  (not (Set_in (inv_10_0<Ref> x@225@01 y@226@01 z@227@01) xs11@47@01))))
(push) ; 4
; [then-branch: 364 | inv_10_0[Ref](x@225@01, y@226@01, z@227@01) in xs11@47@01 && inv_10_1[Ref](x@225@01, y@226@01, z@227@01) in ys11@58@01 && inv_10_2[Ref](x@225@01, y@226@01, z@227@01) in zs11@69@01 | live]
; [else-branch: 364 | !(inv_10_0[Ref](x@225@01, y@226@01, z@227@01) in xs11@47@01 && inv_10_1[Ref](x@225@01, y@226@01, z@227@01) in ys11@58@01 && inv_10_2[Ref](x@225@01, y@226@01, z@227@01) in zs11@69@01) | live]
(push) ; 5
; [then-branch: 364 | inv_10_0[Ref](x@225@01, y@226@01, z@227@01) in xs11@47@01 && inv_10_1[Ref](x@225@01, y@226@01, z@227@01) in ys11@58@01 && inv_10_2[Ref](x@225@01, y@226@01, z@227@01) in zs11@69@01]
(assert (and
  (Set_in (inv_10_0<Ref> x@225@01 y@226@01 z@227@01) xs11@47@01)
  (and
    (Set_in (inv_10_1<Ref> x@225@01 y@226@01 z@227@01) ys11@58@01)
    (Set_in (inv_10_2<Ref> x@225@01 y@226@01 z@227@01) zs11@69@01))))
; [eval] inv_10_0(x, y, z) == x && inv_10_1(x, y, z) == y && inv_10_2(x, y, z) == z
; [eval] inv_10_0(x, y, z) == x
; [eval] inv_10_0(x, y, z)
(push) ; 6
; [then-branch: 365 | inv_10_0[Ref](x@225@01, y@226@01, z@227@01) != x@225@01 | live]
; [else-branch: 365 | inv_10_0[Ref](x@225@01, y@226@01, z@227@01) == x@225@01 | live]
(push) ; 7
; [then-branch: 365 | inv_10_0[Ref](x@225@01, y@226@01, z@227@01) != x@225@01]
(assert (not (= (inv_10_0<Ref> x@225@01 y@226@01 z@227@01) x@225@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 365 | inv_10_0[Ref](x@225@01, y@226@01, z@227@01) == x@225@01]
(assert (= (inv_10_0<Ref> x@225@01 y@226@01 z@227@01) x@225@01))
; [eval] inv_10_1(x, y, z) == y
; [eval] inv_10_1(x, y, z)
(push) ; 8
; [then-branch: 366 | inv_10_1[Ref](x@225@01, y@226@01, z@227@01) != y@226@01 | live]
; [else-branch: 366 | inv_10_1[Ref](x@225@01, y@226@01, z@227@01) == y@226@01 | live]
(push) ; 9
; [then-branch: 366 | inv_10_1[Ref](x@225@01, y@226@01, z@227@01) != y@226@01]
(assert (not (= (inv_10_1<Ref> x@225@01 y@226@01 z@227@01) y@226@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 366 | inv_10_1[Ref](x@225@01, y@226@01, z@227@01) == y@226@01]
(assert (= (inv_10_1<Ref> x@225@01 y@226@01 z@227@01) y@226@01))
; [eval] inv_10_2(x, y, z) == z
; [eval] inv_10_2(x, y, z)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or
  (= (inv_10_1<Ref> x@225@01 y@226@01 z@227@01) y@226@01)
  (not (= (inv_10_1<Ref> x@225@01 y@226@01 z@227@01) y@226@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (= (inv_10_0<Ref> x@225@01 y@226@01 z@227@01) x@225@01)
  (and
    (= (inv_10_0<Ref> x@225@01 y@226@01 z@227@01) x@225@01)
    (or
      (= (inv_10_1<Ref> x@225@01 y@226@01 z@227@01) y@226@01)
      (not (= (inv_10_1<Ref> x@225@01 y@226@01 z@227@01) y@226@01))))))
(assert (or
  (= (inv_10_0<Ref> x@225@01 y@226@01 z@227@01) x@225@01)
  (not (= (inv_10_0<Ref> x@225@01 y@226@01 z@227@01) x@225@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 364 | !(inv_10_0[Ref](x@225@01, y@226@01, z@227@01) in xs11@47@01 && inv_10_1[Ref](x@225@01, y@226@01, z@227@01) in ys11@58@01 && inv_10_2[Ref](x@225@01, y@226@01, z@227@01) in zs11@69@01)]
(assert (not
  (and
    (Set_in (inv_10_0<Ref> x@225@01 y@226@01 z@227@01) xs11@47@01)
    (and
      (Set_in (inv_10_1<Ref> x@225@01 y@226@01 z@227@01) ys11@58@01)
      (Set_in (inv_10_2<Ref> x@225@01 y@226@01 z@227@01) zs11@69@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Set_in (inv_10_0<Ref> x@225@01 y@226@01 z@227@01) xs11@47@01)
    (and
      (Set_in (inv_10_1<Ref> x@225@01 y@226@01 z@227@01) ys11@58@01)
      (Set_in (inv_10_2<Ref> x@225@01 y@226@01 z@227@01) zs11@69@01)))
  (and
    (Set_in (inv_10_0<Ref> x@225@01 y@226@01 z@227@01) xs11@47@01)
    (Set_in (inv_10_1<Ref> x@225@01 y@226@01 z@227@01) ys11@58@01)
    (Set_in (inv_10_2<Ref> x@225@01 y@226@01 z@227@01) zs11@69@01)
    (=>
      (= (inv_10_0<Ref> x@225@01 y@226@01 z@227@01) x@225@01)
      (and
        (= (inv_10_0<Ref> x@225@01 y@226@01 z@227@01) x@225@01)
        (or
          (= (inv_10_1<Ref> x@225@01 y@226@01 z@227@01) y@226@01)
          (not (= (inv_10_1<Ref> x@225@01 y@226@01 z@227@01) y@226@01)))))
    (or
      (= (inv_10_0<Ref> x@225@01 y@226@01 z@227@01) x@225@01)
      (not (= (inv_10_0<Ref> x@225@01 y@226@01 z@227@01) x@225@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in (inv_10_0<Ref> x@225@01 y@226@01 z@227@01) xs11@47@01)
      (and
        (Set_in (inv_10_1<Ref> x@225@01 y@226@01 z@227@01) ys11@58@01)
        (Set_in (inv_10_2<Ref> x@225@01 y@226@01 z@227@01) zs11@69@01))))
  (and
    (Set_in (inv_10_0<Ref> x@225@01 y@226@01 z@227@01) xs11@47@01)
    (and
      (Set_in (inv_10_1<Ref> x@225@01 y@226@01 z@227@01) ys11@58@01)
      (Set_in (inv_10_2<Ref> x@225@01 y@226@01 z@227@01) zs11@69@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@225@01 $Ref) (y@226@01 $Ref) (z@227@01 $Ref)) (!
  (and
    (=>
      (Set_in (inv_10_0<Ref> x@225@01 y@226@01 z@227@01) xs11@47@01)
      (and
        (Set_in (inv_10_0<Ref> x@225@01 y@226@01 z@227@01) xs11@47@01)
        (or
          (Set_in (inv_10_1<Ref> x@225@01 y@226@01 z@227@01) ys11@58@01)
          (not (Set_in (inv_10_1<Ref> x@225@01 y@226@01 z@227@01) ys11@58@01)))))
    (or
      (Set_in (inv_10_0<Ref> x@225@01 y@226@01 z@227@01) xs11@47@01)
      (not (Set_in (inv_10_0<Ref> x@225@01 y@226@01 z@227@01) xs11@47@01)))
    (=>
      (and
        (Set_in (inv_10_0<Ref> x@225@01 y@226@01 z@227@01) xs11@47@01)
        (and
          (Set_in (inv_10_1<Ref> x@225@01 y@226@01 z@227@01) ys11@58@01)
          (Set_in (inv_10_2<Ref> x@225@01 y@226@01 z@227@01) zs11@69@01)))
      (and
        (Set_in (inv_10_0<Ref> x@225@01 y@226@01 z@227@01) xs11@47@01)
        (Set_in (inv_10_1<Ref> x@225@01 y@226@01 z@227@01) ys11@58@01)
        (Set_in (inv_10_2<Ref> x@225@01 y@226@01 z@227@01) zs11@69@01)
        (=>
          (= (inv_10_0<Ref> x@225@01 y@226@01 z@227@01) x@225@01)
          (and
            (= (inv_10_0<Ref> x@225@01 y@226@01 z@227@01) x@225@01)
            (or
              (= (inv_10_1<Ref> x@225@01 y@226@01 z@227@01) y@226@01)
              (not (= (inv_10_1<Ref> x@225@01 y@226@01 z@227@01) y@226@01)))))
        (or
          (= (inv_10_0<Ref> x@225@01 y@226@01 z@227@01) x@225@01)
          (not (= (inv_10_0<Ref> x@225@01 y@226@01 z@227@01) x@225@01)))))
    (or
      (not
        (and
          (Set_in (inv_10_0<Ref> x@225@01 y@226@01 z@227@01) xs11@47@01)
          (and
            (Set_in (inv_10_1<Ref> x@225@01 y@226@01 z@227@01) ys11@58@01)
            (Set_in (inv_10_2<Ref> x@225@01 y@226@01 z@227@01) zs11@69@01))))
      (and
        (Set_in (inv_10_0<Ref> x@225@01 y@226@01 z@227@01) xs11@47@01)
        (and
          (Set_in (inv_10_1<Ref> x@225@01 y@226@01 z@227@01) ys11@58@01)
          (Set_in (inv_10_2<Ref> x@225@01 y@226@01 z@227@01) zs11@69@01)))))
  :pattern ((inv_10_0<Ref> x@225@01 y@226@01 z@227@01) (inv_10_1<Ref> x@225@01 y@226@01 z@227@01) (inv_10_2<Ref> x@225@01 y@226@01 z@227@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@30@9@30@137-aux|)))
(assert (forall ((x@225@01 $Ref) (y@226@01 $Ref) (z@227@01 $Ref)) (!
  (=>
    (and
      (Set_in (inv_10_0<Ref> x@225@01 y@226@01 z@227@01) xs11@47@01)
      (and
        (Set_in (inv_10_1<Ref> x@225@01 y@226@01 z@227@01) ys11@58@01)
        (Set_in (inv_10_2<Ref> x@225@01 y@226@01 z@227@01) zs11@69@01)))
    (and
      (= (inv_10_0<Ref> x@225@01 y@226@01 z@227@01) x@225@01)
      (and
        (= (inv_10_1<Ref> x@225@01 y@226@01 z@227@01) y@226@01)
        (= (inv_10_2<Ref> x@225@01 y@226@01 z@227@01) z@227@01))))
  :pattern ((inv_10_0<Ref> x@225@01 y@226@01 z@227@01) (inv_10_1<Ref> x@225@01 y@226@01 z@227@01) (inv_10_2<Ref> x@225@01 y@226@01 z@227@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@30@9@30@137|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x: Ref, y: Ref, z: Ref ::
;     { inv_10_0(x, y, z), inv_10_1(x, y, z), inv_10_2(x, y, z) }
;     (inv_10_0(x, y, z) in xs11) &&
;     ((inv_10_1(x, y, z) in ys11) && (inv_10_2(x, y, z) in zs11)) ==>
;     perm(p(x, y, z)) >=
;     __iar__assume_helper_10((inv_0_0(x, y, z) in xs1) &&
;     ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) &&
;     (x == x && y == y && z == z), (inv_1_0(x, y, z) in xs2) &&
;     ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) &&
;     (x == x && y == y && z == z), (inv_2_0(x, y, z) in xs3) &&
;     ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) &&
;     (x == x && y == y && z == z), (inv_3_0(x, y, z) in xs4) &&
;     ((inv_3_1(x, y, z) in ys4) && (inv_3_2(x, y, z) in zs4)) &&
;     (x == x && y == y && z == z), (inv_4_0(x, y, z) in xs5) &&
;     ((inv_4_1(x, y, z) in ys5) && (inv_4_2(x, y, z) in zs5)) &&
;     (x == x && y == y && z == z), (inv_5_0(x, y, z) in xs6) &&
;     ((inv_5_1(x, y, z) in ys6) && (inv_5_2(x, y, z) in zs6)) &&
;     (x == x && y == y && z == z), (inv_6_0(x, y, z) in xs7) &&
;     ((inv_6_1(x, y, z) in ys7) && (inv_6_2(x, y, z) in zs7)) &&
;     (x == x && y == y && z == z), (inv_7_0(x, y, z) in xs8) &&
;     ((inv_7_1(x, y, z) in ys8) && (inv_7_2(x, y, z) in zs8)) &&
;     (x == x && y == y && z == z), (inv_8_0(x, y, z) in xs9) &&
;     ((inv_8_1(x, y, z) in ys9) && (inv_8_2(x, y, z) in zs9)) &&
;     (x == x && y == y && z == z), (inv_9_0(x, y, z) in xs10) &&
;     ((inv_9_1(x, y, z) in ys10) && (inv_9_2(x, y, z) in zs10)) &&
;     (x == x && y == y && z == z), q, q, q, q, q, q, q, q, q, q, q))
(declare-const $t@228@01 $Snap)
(assert (= $t@228@01 $Snap.unit))
; [eval] (forall x: Ref, y: Ref, z: Ref :: { inv_10_0(x, y, z), inv_10_1(x, y, z), inv_10_2(x, y, z) } (inv_10_0(x, y, z) in xs11) && ((inv_10_1(x, y, z) in ys11) && (inv_10_2(x, y, z) in zs11)) ==> perm(p(x, y, z)) >= __iar__assume_helper_10((inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) && (x == x && y == y && z == z), (inv_1_0(x, y, z) in xs2) && ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) && (x == x && y == y && z == z), (inv_2_0(x, y, z) in xs3) && ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) && (x == x && y == y && z == z), (inv_3_0(x, y, z) in xs4) && ((inv_3_1(x, y, z) in ys4) && (inv_3_2(x, y, z) in zs4)) && (x == x && y == y && z == z), (inv_4_0(x, y, z) in xs5) && ((inv_4_1(x, y, z) in ys5) && (inv_4_2(x, y, z) in zs5)) && (x == x && y == y && z == z), (inv_5_0(x, y, z) in xs6) && ((inv_5_1(x, y, z) in ys6) && (inv_5_2(x, y, z) in zs6)) && (x == x && y == y && z == z), (inv_6_0(x, y, z) in xs7) && ((inv_6_1(x, y, z) in ys7) && (inv_6_2(x, y, z) in zs7)) && (x == x && y == y && z == z), (inv_7_0(x, y, z) in xs8) && ((inv_7_1(x, y, z) in ys8) && (inv_7_2(x, y, z) in zs8)) && (x == x && y == y && z == z), (inv_8_0(x, y, z) in xs9) && ((inv_8_1(x, y, z) in ys9) && (inv_8_2(x, y, z) in zs9)) && (x == x && y == y && z == z), (inv_9_0(x, y, z) in xs10) && ((inv_9_1(x, y, z) in ys10) && (inv_9_2(x, y, z) in zs10)) && (x == x && y == y && z == z), q, q, q, q, q, q, q, q, q, q, q))
(declare-const x@229@01 $Ref)
(declare-const y@230@01 $Ref)
(declare-const z@231@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (inv_10_0(x, y, z) in xs11) && ((inv_10_1(x, y, z) in ys11) && (inv_10_2(x, y, z) in zs11)) ==> perm(p(x, y, z)) >= __iar__assume_helper_10((inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) && (x == x && y == y && z == z), (inv_1_0(x, y, z) in xs2) && ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) && (x == x && y == y && z == z), (inv_2_0(x, y, z) in xs3) && ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) && (x == x && y == y && z == z), (inv_3_0(x, y, z) in xs4) && ((inv_3_1(x, y, z) in ys4) && (inv_3_2(x, y, z) in zs4)) && (x == x && y == y && z == z), (inv_4_0(x, y, z) in xs5) && ((inv_4_1(x, y, z) in ys5) && (inv_4_2(x, y, z) in zs5)) && (x == x && y == y && z == z), (inv_5_0(x, y, z) in xs6) && ((inv_5_1(x, y, z) in ys6) && (inv_5_2(x, y, z) in zs6)) && (x == x && y == y && z == z), (inv_6_0(x, y, z) in xs7) && ((inv_6_1(x, y, z) in ys7) && (inv_6_2(x, y, z) in zs7)) && (x == x && y == y && z == z), (inv_7_0(x, y, z) in xs8) && ((inv_7_1(x, y, z) in ys8) && (inv_7_2(x, y, z) in zs8)) && (x == x && y == y && z == z), (inv_8_0(x, y, z) in xs9) && ((inv_8_1(x, y, z) in ys9) && (inv_8_2(x, y, z) in zs9)) && (x == x && y == y && z == z), (inv_9_0(x, y, z) in xs10) && ((inv_9_1(x, y, z) in ys10) && (inv_9_2(x, y, z) in zs10)) && (x == x && y == y && z == z), q, q, q, q, q, q, q, q, q, q, q)
; [eval] (inv_10_0(x, y, z) in xs11) && ((inv_10_1(x, y, z) in ys11) && (inv_10_2(x, y, z) in zs11))
; [eval] (inv_10_0(x, y, z) in xs11)
; [eval] inv_10_0(x, y, z)
(push) ; 4
; [then-branch: 367 | !(inv_10_0[Ref](x@229@01, y@230@01, z@231@01) in xs11@47@01) | live]
; [else-branch: 367 | inv_10_0[Ref](x@229@01, y@230@01, z@231@01) in xs11@47@01 | live]
(push) ; 5
; [then-branch: 367 | !(inv_10_0[Ref](x@229@01, y@230@01, z@231@01) in xs11@47@01)]
(assert (not (Set_in (inv_10_0<Ref> x@229@01 y@230@01 z@231@01) xs11@47@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 367 | inv_10_0[Ref](x@229@01, y@230@01, z@231@01) in xs11@47@01]
(assert (Set_in (inv_10_0<Ref> x@229@01 y@230@01 z@231@01) xs11@47@01))
; [eval] (inv_10_1(x, y, z) in ys11)
; [eval] inv_10_1(x, y, z)
(push) ; 6
; [then-branch: 368 | !(inv_10_1[Ref](x@229@01, y@230@01, z@231@01) in ys11@58@01) | live]
; [else-branch: 368 | inv_10_1[Ref](x@229@01, y@230@01, z@231@01) in ys11@58@01 | live]
(push) ; 7
; [then-branch: 368 | !(inv_10_1[Ref](x@229@01, y@230@01, z@231@01) in ys11@58@01)]
(assert (not (Set_in (inv_10_1<Ref> x@229@01 y@230@01 z@231@01) ys11@58@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 368 | inv_10_1[Ref](x@229@01, y@230@01, z@231@01) in ys11@58@01]
(assert (Set_in (inv_10_1<Ref> x@229@01 y@230@01 z@231@01) ys11@58@01))
; [eval] (inv_10_2(x, y, z) in zs11)
; [eval] inv_10_2(x, y, z)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_10_1<Ref> x@229@01 y@230@01 z@231@01) ys11@58@01)
  (not (Set_in (inv_10_1<Ref> x@229@01 y@230@01 z@231@01) ys11@58@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_10_0<Ref> x@229@01 y@230@01 z@231@01) xs11@47@01)
  (and
    (Set_in (inv_10_0<Ref> x@229@01 y@230@01 z@231@01) xs11@47@01)
    (or
      (Set_in (inv_10_1<Ref> x@229@01 y@230@01 z@231@01) ys11@58@01)
      (not (Set_in (inv_10_1<Ref> x@229@01 y@230@01 z@231@01) ys11@58@01))))))
(assert (or
  (Set_in (inv_10_0<Ref> x@229@01 y@230@01 z@231@01) xs11@47@01)
  (not (Set_in (inv_10_0<Ref> x@229@01 y@230@01 z@231@01) xs11@47@01))))
(push) ; 4
; [then-branch: 369 | inv_10_0[Ref](x@229@01, y@230@01, z@231@01) in xs11@47@01 && inv_10_1[Ref](x@229@01, y@230@01, z@231@01) in ys11@58@01 && inv_10_2[Ref](x@229@01, y@230@01, z@231@01) in zs11@69@01 | live]
; [else-branch: 369 | !(inv_10_0[Ref](x@229@01, y@230@01, z@231@01) in xs11@47@01 && inv_10_1[Ref](x@229@01, y@230@01, z@231@01) in ys11@58@01 && inv_10_2[Ref](x@229@01, y@230@01, z@231@01) in zs11@69@01) | live]
(push) ; 5
; [then-branch: 369 | inv_10_0[Ref](x@229@01, y@230@01, z@231@01) in xs11@47@01 && inv_10_1[Ref](x@229@01, y@230@01, z@231@01) in ys11@58@01 && inv_10_2[Ref](x@229@01, y@230@01, z@231@01) in zs11@69@01]
(assert (and
  (Set_in (inv_10_0<Ref> x@229@01 y@230@01 z@231@01) xs11@47@01)
  (and
    (Set_in (inv_10_1<Ref> x@229@01 y@230@01 z@231@01) ys11@58@01)
    (Set_in (inv_10_2<Ref> x@229@01 y@230@01 z@231@01) zs11@69@01))))
; [eval] perm(p(x, y, z)) >= __iar__assume_helper_10((inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) && (x == x && y == y && z == z), (inv_1_0(x, y, z) in xs2) && ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) && (x == x && y == y && z == z), (inv_2_0(x, y, z) in xs3) && ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) && (x == x && y == y && z == z), (inv_3_0(x, y, z) in xs4) && ((inv_3_1(x, y, z) in ys4) && (inv_3_2(x, y, z) in zs4)) && (x == x && y == y && z == z), (inv_4_0(x, y, z) in xs5) && ((inv_4_1(x, y, z) in ys5) && (inv_4_2(x, y, z) in zs5)) && (x == x && y == y && z == z), (inv_5_0(x, y, z) in xs6) && ((inv_5_1(x, y, z) in ys6) && (inv_5_2(x, y, z) in zs6)) && (x == x && y == y && z == z), (inv_6_0(x, y, z) in xs7) && ((inv_6_1(x, y, z) in ys7) && (inv_6_2(x, y, z) in zs7)) && (x == x && y == y && z == z), (inv_7_0(x, y, z) in xs8) && ((inv_7_1(x, y, z) in ys8) && (inv_7_2(x, y, z) in zs8)) && (x == x && y == y && z == z), (inv_8_0(x, y, z) in xs9) && ((inv_8_1(x, y, z) in ys9) && (inv_8_2(x, y, z) in zs9)) && (x == x && y == y && z == z), (inv_9_0(x, y, z) in xs10) && ((inv_9_1(x, y, z) in ys10) && (inv_9_2(x, y, z) in zs10)) && (x == x && y == y && z == z), q, q, q, q, q, q, q, q, q, q, q)
; [eval] perm(p(x, y, z))
; Definitional axioms for snapshot map values
(declare-const pm@232@01 $PPM)
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (=
    ($PSF.perm_p (as pm@232@01  $PPM) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    (ite
      (and
        (and (img@83@01 x y z) (img@85@01 x y z) (img@87@01 x y z))
        (and
          (Set_in (inv@82@01 x y z) xs@70@01)
          (and
            (Set_in (inv@84@01 x y z) ys@71@01)
            (Set_in (inv@86@01 x y z) zs@72@01))))
      q@73@01
      $Perm.No))
  :pattern (($PSF.perm_p (as pm@232@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resPrmSumDef22|)))
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (and
    ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    ($PSF.loc_p ($PSF.lookup_p $t@81@01 ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))))
  :pattern (($PSF.perm_p (as pm@232@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resTrgDef23|)))
(assert ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x@229@01)
    ($SortWrappers.$RefTo$Snap y@230@01))
  ($SortWrappers.$RefTo$Snap z@231@01))) ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x@229@01)
    ($SortWrappers.$RefTo$Snap y@230@01))
  ($SortWrappers.$RefTo$Snap z@231@01))))
; [eval] __iar__assume_helper_10((inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) && (x == x && y == y && z == z), (inv_1_0(x, y, z) in xs2) && ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) && (x == x && y == y && z == z), (inv_2_0(x, y, z) in xs3) && ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) && (x == x && y == y && z == z), (inv_3_0(x, y, z) in xs4) && ((inv_3_1(x, y, z) in ys4) && (inv_3_2(x, y, z) in zs4)) && (x == x && y == y && z == z), (inv_4_0(x, y, z) in xs5) && ((inv_4_1(x, y, z) in ys5) && (inv_4_2(x, y, z) in zs5)) && (x == x && y == y && z == z), (inv_5_0(x, y, z) in xs6) && ((inv_5_1(x, y, z) in ys6) && (inv_5_2(x, y, z) in zs6)) && (x == x && y == y && z == z), (inv_6_0(x, y, z) in xs7) && ((inv_6_1(x, y, z) in ys7) && (inv_6_2(x, y, z) in zs7)) && (x == x && y == y && z == z), (inv_7_0(x, y, z) in xs8) && ((inv_7_1(x, y, z) in ys8) && (inv_7_2(x, y, z) in zs8)) && (x == x && y == y && z == z), (inv_8_0(x, y, z) in xs9) && ((inv_8_1(x, y, z) in ys9) && (inv_8_2(x, y, z) in zs9)) && (x == x && y == y && z == z), (inv_9_0(x, y, z) in xs10) && ((inv_9_1(x, y, z) in ys10) && (inv_9_2(x, y, z) in zs10)) && (x == x && y == y && z == z), q, q, q, q, q, q, q, q, q, q, q)
; [eval] (inv_0_0(x, y, z) in xs1) && ((inv_0_1(x, y, z) in ys1) && (inv_0_2(x, y, z) in zs1)) && (x == x && y == y && z == z)
; [eval] (inv_0_0(x, y, z) in xs1)
; [eval] inv_0_0(x, y, z)
(push) ; 6
; [then-branch: 370 | !(inv_0_0[Ref](x@229@01, y@230@01, z@231@01) in xs1@37@01) | live]
; [else-branch: 370 | inv_0_0[Ref](x@229@01, y@230@01, z@231@01) in xs1@37@01 | live]
(push) ; 7
; [then-branch: 370 | !(inv_0_0[Ref](x@229@01, y@230@01, z@231@01) in xs1@37@01)]
(assert (not (Set_in (inv_0_0<Ref> x@229@01 y@230@01 z@231@01) xs1@37@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 370 | inv_0_0[Ref](x@229@01, y@230@01, z@231@01) in xs1@37@01]
(assert (Set_in (inv_0_0<Ref> x@229@01 y@230@01 z@231@01) xs1@37@01))
; [eval] (inv_0_1(x, y, z) in ys1)
; [eval] inv_0_1(x, y, z)
(push) ; 8
; [then-branch: 371 | !(inv_0_1[Ref](x@229@01, y@230@01, z@231@01) in ys1@48@01) | live]
; [else-branch: 371 | inv_0_1[Ref](x@229@01, y@230@01, z@231@01) in ys1@48@01 | live]
(push) ; 9
; [then-branch: 371 | !(inv_0_1[Ref](x@229@01, y@230@01, z@231@01) in ys1@48@01)]
(assert (not (Set_in (inv_0_1<Ref> x@229@01 y@230@01 z@231@01) ys1@48@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 371 | inv_0_1[Ref](x@229@01, y@230@01, z@231@01) in ys1@48@01]
(assert (Set_in (inv_0_1<Ref> x@229@01 y@230@01 z@231@01) ys1@48@01))
; [eval] (inv_0_2(x, y, z) in zs1)
; [eval] inv_0_2(x, y, z)
(push) ; 10
; [then-branch: 372 | !(inv_0_2[Ref](x@229@01, y@230@01, z@231@01) in zs1@59@01) | live]
; [else-branch: 372 | inv_0_2[Ref](x@229@01, y@230@01, z@231@01) in zs1@59@01 | live]
(push) ; 11
; [then-branch: 372 | !(inv_0_2[Ref](x@229@01, y@230@01, z@231@01) in zs1@59@01)]
(assert (not (Set_in (inv_0_2<Ref> x@229@01 y@230@01 z@231@01) zs1@59@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 372 | inv_0_2[Ref](x@229@01, y@230@01, z@231@01) in zs1@59@01]
(assert (Set_in (inv_0_2<Ref> x@229@01 y@230@01 z@231@01) zs1@59@01))
; [eval] x == x
(push) ; 12
; [then-branch: 373 | False | live]
; [else-branch: 373 | True | live]
(push) ; 13
; [then-branch: 373 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 373 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 374 | False | live]
; [else-branch: 374 | True | live]
(push) ; 15
; [then-branch: 374 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 374 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_0_2<Ref> x@229@01 y@230@01 z@231@01) zs1@59@01)
  (not (Set_in (inv_0_2<Ref> x@229@01 y@230@01 z@231@01) zs1@59@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_0_1<Ref> x@229@01 y@230@01 z@231@01) ys1@48@01)
  (and
    (Set_in (inv_0_1<Ref> x@229@01 y@230@01 z@231@01) ys1@48@01)
    (or
      (Set_in (inv_0_2<Ref> x@229@01 y@230@01 z@231@01) zs1@59@01)
      (not (Set_in (inv_0_2<Ref> x@229@01 y@230@01 z@231@01) zs1@59@01))))))
(assert (or
  (Set_in (inv_0_1<Ref> x@229@01 y@230@01 z@231@01) ys1@48@01)
  (not (Set_in (inv_0_1<Ref> x@229@01 y@230@01 z@231@01) ys1@48@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_0_0<Ref> x@229@01 y@230@01 z@231@01) xs1@37@01)
  (and
    (Set_in (inv_0_0<Ref> x@229@01 y@230@01 z@231@01) xs1@37@01)
    (=>
      (Set_in (inv_0_1<Ref> x@229@01 y@230@01 z@231@01) ys1@48@01)
      (and
        (Set_in (inv_0_1<Ref> x@229@01 y@230@01 z@231@01) ys1@48@01)
        (or
          (Set_in (inv_0_2<Ref> x@229@01 y@230@01 z@231@01) zs1@59@01)
          (not (Set_in (inv_0_2<Ref> x@229@01 y@230@01 z@231@01) zs1@59@01)))))
    (or
      (Set_in (inv_0_1<Ref> x@229@01 y@230@01 z@231@01) ys1@48@01)
      (not (Set_in (inv_0_1<Ref> x@229@01 y@230@01 z@231@01) ys1@48@01))))))
(assert (or
  (Set_in (inv_0_0<Ref> x@229@01 y@230@01 z@231@01) xs1@37@01)
  (not (Set_in (inv_0_0<Ref> x@229@01 y@230@01 z@231@01) xs1@37@01))))
; [eval] (inv_1_0(x, y, z) in xs2) && ((inv_1_1(x, y, z) in ys2) && (inv_1_2(x, y, z) in zs2)) && (x == x && y == y && z == z)
; [eval] (inv_1_0(x, y, z) in xs2)
; [eval] inv_1_0(x, y, z)
(push) ; 6
; [then-branch: 375 | !(inv_1_0[Ref](x@229@01, y@230@01, z@231@01) in xs2@38@01) | live]
; [else-branch: 375 | inv_1_0[Ref](x@229@01, y@230@01, z@231@01) in xs2@38@01 | live]
(push) ; 7
; [then-branch: 375 | !(inv_1_0[Ref](x@229@01, y@230@01, z@231@01) in xs2@38@01)]
(assert (not (Set_in (inv_1_0<Ref> x@229@01 y@230@01 z@231@01) xs2@38@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 375 | inv_1_0[Ref](x@229@01, y@230@01, z@231@01) in xs2@38@01]
(assert (Set_in (inv_1_0<Ref> x@229@01 y@230@01 z@231@01) xs2@38@01))
; [eval] (inv_1_1(x, y, z) in ys2)
; [eval] inv_1_1(x, y, z)
(push) ; 8
; [then-branch: 376 | !(inv_1_1[Ref](x@229@01, y@230@01, z@231@01) in ys2@49@01) | live]
; [else-branch: 376 | inv_1_1[Ref](x@229@01, y@230@01, z@231@01) in ys2@49@01 | live]
(push) ; 9
; [then-branch: 376 | !(inv_1_1[Ref](x@229@01, y@230@01, z@231@01) in ys2@49@01)]
(assert (not (Set_in (inv_1_1<Ref> x@229@01 y@230@01 z@231@01) ys2@49@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 376 | inv_1_1[Ref](x@229@01, y@230@01, z@231@01) in ys2@49@01]
(assert (Set_in (inv_1_1<Ref> x@229@01 y@230@01 z@231@01) ys2@49@01))
; [eval] (inv_1_2(x, y, z) in zs2)
; [eval] inv_1_2(x, y, z)
(push) ; 10
; [then-branch: 377 | !(inv_1_2[Ref](x@229@01, y@230@01, z@231@01) in zs2@60@01) | live]
; [else-branch: 377 | inv_1_2[Ref](x@229@01, y@230@01, z@231@01) in zs2@60@01 | live]
(push) ; 11
; [then-branch: 377 | !(inv_1_2[Ref](x@229@01, y@230@01, z@231@01) in zs2@60@01)]
(assert (not (Set_in (inv_1_2<Ref> x@229@01 y@230@01 z@231@01) zs2@60@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 377 | inv_1_2[Ref](x@229@01, y@230@01, z@231@01) in zs2@60@01]
(assert (Set_in (inv_1_2<Ref> x@229@01 y@230@01 z@231@01) zs2@60@01))
; [eval] x == x
(push) ; 12
; [then-branch: 378 | False | live]
; [else-branch: 378 | True | live]
(push) ; 13
; [then-branch: 378 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 378 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 379 | False | live]
; [else-branch: 379 | True | live]
(push) ; 15
; [then-branch: 379 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 379 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_1_2<Ref> x@229@01 y@230@01 z@231@01) zs2@60@01)
  (not (Set_in (inv_1_2<Ref> x@229@01 y@230@01 z@231@01) zs2@60@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_1_1<Ref> x@229@01 y@230@01 z@231@01) ys2@49@01)
  (and
    (Set_in (inv_1_1<Ref> x@229@01 y@230@01 z@231@01) ys2@49@01)
    (or
      (Set_in (inv_1_2<Ref> x@229@01 y@230@01 z@231@01) zs2@60@01)
      (not (Set_in (inv_1_2<Ref> x@229@01 y@230@01 z@231@01) zs2@60@01))))))
(assert (or
  (Set_in (inv_1_1<Ref> x@229@01 y@230@01 z@231@01) ys2@49@01)
  (not (Set_in (inv_1_1<Ref> x@229@01 y@230@01 z@231@01) ys2@49@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_1_0<Ref> x@229@01 y@230@01 z@231@01) xs2@38@01)
  (and
    (Set_in (inv_1_0<Ref> x@229@01 y@230@01 z@231@01) xs2@38@01)
    (=>
      (Set_in (inv_1_1<Ref> x@229@01 y@230@01 z@231@01) ys2@49@01)
      (and
        (Set_in (inv_1_1<Ref> x@229@01 y@230@01 z@231@01) ys2@49@01)
        (or
          (Set_in (inv_1_2<Ref> x@229@01 y@230@01 z@231@01) zs2@60@01)
          (not (Set_in (inv_1_2<Ref> x@229@01 y@230@01 z@231@01) zs2@60@01)))))
    (or
      (Set_in (inv_1_1<Ref> x@229@01 y@230@01 z@231@01) ys2@49@01)
      (not (Set_in (inv_1_1<Ref> x@229@01 y@230@01 z@231@01) ys2@49@01))))))
(assert (or
  (Set_in (inv_1_0<Ref> x@229@01 y@230@01 z@231@01) xs2@38@01)
  (not (Set_in (inv_1_0<Ref> x@229@01 y@230@01 z@231@01) xs2@38@01))))
; [eval] (inv_2_0(x, y, z) in xs3) && ((inv_2_1(x, y, z) in ys3) && (inv_2_2(x, y, z) in zs3)) && (x == x && y == y && z == z)
; [eval] (inv_2_0(x, y, z) in xs3)
; [eval] inv_2_0(x, y, z)
(push) ; 6
; [then-branch: 380 | !(inv_2_0[Ref](x@229@01, y@230@01, z@231@01) in xs3@39@01) | live]
; [else-branch: 380 | inv_2_0[Ref](x@229@01, y@230@01, z@231@01) in xs3@39@01 | live]
(push) ; 7
; [then-branch: 380 | !(inv_2_0[Ref](x@229@01, y@230@01, z@231@01) in xs3@39@01)]
(assert (not (Set_in (inv_2_0<Ref> x@229@01 y@230@01 z@231@01) xs3@39@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 380 | inv_2_0[Ref](x@229@01, y@230@01, z@231@01) in xs3@39@01]
(assert (Set_in (inv_2_0<Ref> x@229@01 y@230@01 z@231@01) xs3@39@01))
; [eval] (inv_2_1(x, y, z) in ys3)
; [eval] inv_2_1(x, y, z)
(push) ; 8
; [then-branch: 381 | !(inv_2_1[Ref](x@229@01, y@230@01, z@231@01) in ys3@50@01) | live]
; [else-branch: 381 | inv_2_1[Ref](x@229@01, y@230@01, z@231@01) in ys3@50@01 | live]
(push) ; 9
; [then-branch: 381 | !(inv_2_1[Ref](x@229@01, y@230@01, z@231@01) in ys3@50@01)]
(assert (not (Set_in (inv_2_1<Ref> x@229@01 y@230@01 z@231@01) ys3@50@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 381 | inv_2_1[Ref](x@229@01, y@230@01, z@231@01) in ys3@50@01]
(assert (Set_in (inv_2_1<Ref> x@229@01 y@230@01 z@231@01) ys3@50@01))
; [eval] (inv_2_2(x, y, z) in zs3)
; [eval] inv_2_2(x, y, z)
(push) ; 10
; [then-branch: 382 | !(inv_2_2[Ref](x@229@01, y@230@01, z@231@01) in zs3@61@01) | live]
; [else-branch: 382 | inv_2_2[Ref](x@229@01, y@230@01, z@231@01) in zs3@61@01 | live]
(push) ; 11
; [then-branch: 382 | !(inv_2_2[Ref](x@229@01, y@230@01, z@231@01) in zs3@61@01)]
(assert (not (Set_in (inv_2_2<Ref> x@229@01 y@230@01 z@231@01) zs3@61@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 382 | inv_2_2[Ref](x@229@01, y@230@01, z@231@01) in zs3@61@01]
(assert (Set_in (inv_2_2<Ref> x@229@01 y@230@01 z@231@01) zs3@61@01))
; [eval] x == x
(push) ; 12
; [then-branch: 383 | False | live]
; [else-branch: 383 | True | live]
(push) ; 13
; [then-branch: 383 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 383 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 384 | False | live]
; [else-branch: 384 | True | live]
(push) ; 15
; [then-branch: 384 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 384 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_2_2<Ref> x@229@01 y@230@01 z@231@01) zs3@61@01)
  (not (Set_in (inv_2_2<Ref> x@229@01 y@230@01 z@231@01) zs3@61@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_2_1<Ref> x@229@01 y@230@01 z@231@01) ys3@50@01)
  (and
    (Set_in (inv_2_1<Ref> x@229@01 y@230@01 z@231@01) ys3@50@01)
    (or
      (Set_in (inv_2_2<Ref> x@229@01 y@230@01 z@231@01) zs3@61@01)
      (not (Set_in (inv_2_2<Ref> x@229@01 y@230@01 z@231@01) zs3@61@01))))))
(assert (or
  (Set_in (inv_2_1<Ref> x@229@01 y@230@01 z@231@01) ys3@50@01)
  (not (Set_in (inv_2_1<Ref> x@229@01 y@230@01 z@231@01) ys3@50@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_2_0<Ref> x@229@01 y@230@01 z@231@01) xs3@39@01)
  (and
    (Set_in (inv_2_0<Ref> x@229@01 y@230@01 z@231@01) xs3@39@01)
    (=>
      (Set_in (inv_2_1<Ref> x@229@01 y@230@01 z@231@01) ys3@50@01)
      (and
        (Set_in (inv_2_1<Ref> x@229@01 y@230@01 z@231@01) ys3@50@01)
        (or
          (Set_in (inv_2_2<Ref> x@229@01 y@230@01 z@231@01) zs3@61@01)
          (not (Set_in (inv_2_2<Ref> x@229@01 y@230@01 z@231@01) zs3@61@01)))))
    (or
      (Set_in (inv_2_1<Ref> x@229@01 y@230@01 z@231@01) ys3@50@01)
      (not (Set_in (inv_2_1<Ref> x@229@01 y@230@01 z@231@01) ys3@50@01))))))
(assert (or
  (Set_in (inv_2_0<Ref> x@229@01 y@230@01 z@231@01) xs3@39@01)
  (not (Set_in (inv_2_0<Ref> x@229@01 y@230@01 z@231@01) xs3@39@01))))
; [eval] (inv_3_0(x, y, z) in xs4) && ((inv_3_1(x, y, z) in ys4) && (inv_3_2(x, y, z) in zs4)) && (x == x && y == y && z == z)
; [eval] (inv_3_0(x, y, z) in xs4)
; [eval] inv_3_0(x, y, z)
(push) ; 6
; [then-branch: 385 | !(inv_3_0[Ref](x@229@01, y@230@01, z@231@01) in xs4@40@01) | live]
; [else-branch: 385 | inv_3_0[Ref](x@229@01, y@230@01, z@231@01) in xs4@40@01 | live]
(push) ; 7
; [then-branch: 385 | !(inv_3_0[Ref](x@229@01, y@230@01, z@231@01) in xs4@40@01)]
(assert (not (Set_in (inv_3_0<Ref> x@229@01 y@230@01 z@231@01) xs4@40@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 385 | inv_3_0[Ref](x@229@01, y@230@01, z@231@01) in xs4@40@01]
(assert (Set_in (inv_3_0<Ref> x@229@01 y@230@01 z@231@01) xs4@40@01))
; [eval] (inv_3_1(x, y, z) in ys4)
; [eval] inv_3_1(x, y, z)
(push) ; 8
; [then-branch: 386 | !(inv_3_1[Ref](x@229@01, y@230@01, z@231@01) in ys4@51@01) | live]
; [else-branch: 386 | inv_3_1[Ref](x@229@01, y@230@01, z@231@01) in ys4@51@01 | live]
(push) ; 9
; [then-branch: 386 | !(inv_3_1[Ref](x@229@01, y@230@01, z@231@01) in ys4@51@01)]
(assert (not (Set_in (inv_3_1<Ref> x@229@01 y@230@01 z@231@01) ys4@51@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 386 | inv_3_1[Ref](x@229@01, y@230@01, z@231@01) in ys4@51@01]
(assert (Set_in (inv_3_1<Ref> x@229@01 y@230@01 z@231@01) ys4@51@01))
; [eval] (inv_3_2(x, y, z) in zs4)
; [eval] inv_3_2(x, y, z)
(push) ; 10
; [then-branch: 387 | !(inv_3_2[Ref](x@229@01, y@230@01, z@231@01) in zs4@62@01) | live]
; [else-branch: 387 | inv_3_2[Ref](x@229@01, y@230@01, z@231@01) in zs4@62@01 | live]
(push) ; 11
; [then-branch: 387 | !(inv_3_2[Ref](x@229@01, y@230@01, z@231@01) in zs4@62@01)]
(assert (not (Set_in (inv_3_2<Ref> x@229@01 y@230@01 z@231@01) zs4@62@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 387 | inv_3_2[Ref](x@229@01, y@230@01, z@231@01) in zs4@62@01]
(assert (Set_in (inv_3_2<Ref> x@229@01 y@230@01 z@231@01) zs4@62@01))
; [eval] x == x
(push) ; 12
; [then-branch: 388 | False | live]
; [else-branch: 388 | True | live]
(push) ; 13
; [then-branch: 388 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 388 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 389 | False | live]
; [else-branch: 389 | True | live]
(push) ; 15
; [then-branch: 389 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 389 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_3_2<Ref> x@229@01 y@230@01 z@231@01) zs4@62@01)
  (not (Set_in (inv_3_2<Ref> x@229@01 y@230@01 z@231@01) zs4@62@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_3_1<Ref> x@229@01 y@230@01 z@231@01) ys4@51@01)
  (and
    (Set_in (inv_3_1<Ref> x@229@01 y@230@01 z@231@01) ys4@51@01)
    (or
      (Set_in (inv_3_2<Ref> x@229@01 y@230@01 z@231@01) zs4@62@01)
      (not (Set_in (inv_3_2<Ref> x@229@01 y@230@01 z@231@01) zs4@62@01))))))
(assert (or
  (Set_in (inv_3_1<Ref> x@229@01 y@230@01 z@231@01) ys4@51@01)
  (not (Set_in (inv_3_1<Ref> x@229@01 y@230@01 z@231@01) ys4@51@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_3_0<Ref> x@229@01 y@230@01 z@231@01) xs4@40@01)
  (and
    (Set_in (inv_3_0<Ref> x@229@01 y@230@01 z@231@01) xs4@40@01)
    (=>
      (Set_in (inv_3_1<Ref> x@229@01 y@230@01 z@231@01) ys4@51@01)
      (and
        (Set_in (inv_3_1<Ref> x@229@01 y@230@01 z@231@01) ys4@51@01)
        (or
          (Set_in (inv_3_2<Ref> x@229@01 y@230@01 z@231@01) zs4@62@01)
          (not (Set_in (inv_3_2<Ref> x@229@01 y@230@01 z@231@01) zs4@62@01)))))
    (or
      (Set_in (inv_3_1<Ref> x@229@01 y@230@01 z@231@01) ys4@51@01)
      (not (Set_in (inv_3_1<Ref> x@229@01 y@230@01 z@231@01) ys4@51@01))))))
(assert (or
  (Set_in (inv_3_0<Ref> x@229@01 y@230@01 z@231@01) xs4@40@01)
  (not (Set_in (inv_3_0<Ref> x@229@01 y@230@01 z@231@01) xs4@40@01))))
; [eval] (inv_4_0(x, y, z) in xs5) && ((inv_4_1(x, y, z) in ys5) && (inv_4_2(x, y, z) in zs5)) && (x == x && y == y && z == z)
; [eval] (inv_4_0(x, y, z) in xs5)
; [eval] inv_4_0(x, y, z)
(push) ; 6
; [then-branch: 390 | !(inv_4_0[Ref](x@229@01, y@230@01, z@231@01) in xs5@41@01) | live]
; [else-branch: 390 | inv_4_0[Ref](x@229@01, y@230@01, z@231@01) in xs5@41@01 | live]
(push) ; 7
; [then-branch: 390 | !(inv_4_0[Ref](x@229@01, y@230@01, z@231@01) in xs5@41@01)]
(assert (not (Set_in (inv_4_0<Ref> x@229@01 y@230@01 z@231@01) xs5@41@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 390 | inv_4_0[Ref](x@229@01, y@230@01, z@231@01) in xs5@41@01]
(assert (Set_in (inv_4_0<Ref> x@229@01 y@230@01 z@231@01) xs5@41@01))
; [eval] (inv_4_1(x, y, z) in ys5)
; [eval] inv_4_1(x, y, z)
(push) ; 8
; [then-branch: 391 | !(inv_4_1[Ref](x@229@01, y@230@01, z@231@01) in ys5@52@01) | live]
; [else-branch: 391 | inv_4_1[Ref](x@229@01, y@230@01, z@231@01) in ys5@52@01 | live]
(push) ; 9
; [then-branch: 391 | !(inv_4_1[Ref](x@229@01, y@230@01, z@231@01) in ys5@52@01)]
(assert (not (Set_in (inv_4_1<Ref> x@229@01 y@230@01 z@231@01) ys5@52@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 391 | inv_4_1[Ref](x@229@01, y@230@01, z@231@01) in ys5@52@01]
(assert (Set_in (inv_4_1<Ref> x@229@01 y@230@01 z@231@01) ys5@52@01))
; [eval] (inv_4_2(x, y, z) in zs5)
; [eval] inv_4_2(x, y, z)
(push) ; 10
; [then-branch: 392 | !(inv_4_2[Ref](x@229@01, y@230@01, z@231@01) in zs5@63@01) | live]
; [else-branch: 392 | inv_4_2[Ref](x@229@01, y@230@01, z@231@01) in zs5@63@01 | live]
(push) ; 11
; [then-branch: 392 | !(inv_4_2[Ref](x@229@01, y@230@01, z@231@01) in zs5@63@01)]
(assert (not (Set_in (inv_4_2<Ref> x@229@01 y@230@01 z@231@01) zs5@63@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 392 | inv_4_2[Ref](x@229@01, y@230@01, z@231@01) in zs5@63@01]
(assert (Set_in (inv_4_2<Ref> x@229@01 y@230@01 z@231@01) zs5@63@01))
; [eval] x == x
(push) ; 12
; [then-branch: 393 | False | live]
; [else-branch: 393 | True | live]
(push) ; 13
; [then-branch: 393 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 393 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 394 | False | live]
; [else-branch: 394 | True | live]
(push) ; 15
; [then-branch: 394 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 394 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_4_2<Ref> x@229@01 y@230@01 z@231@01) zs5@63@01)
  (not (Set_in (inv_4_2<Ref> x@229@01 y@230@01 z@231@01) zs5@63@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_4_1<Ref> x@229@01 y@230@01 z@231@01) ys5@52@01)
  (and
    (Set_in (inv_4_1<Ref> x@229@01 y@230@01 z@231@01) ys5@52@01)
    (or
      (Set_in (inv_4_2<Ref> x@229@01 y@230@01 z@231@01) zs5@63@01)
      (not (Set_in (inv_4_2<Ref> x@229@01 y@230@01 z@231@01) zs5@63@01))))))
(assert (or
  (Set_in (inv_4_1<Ref> x@229@01 y@230@01 z@231@01) ys5@52@01)
  (not (Set_in (inv_4_1<Ref> x@229@01 y@230@01 z@231@01) ys5@52@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_4_0<Ref> x@229@01 y@230@01 z@231@01) xs5@41@01)
  (and
    (Set_in (inv_4_0<Ref> x@229@01 y@230@01 z@231@01) xs5@41@01)
    (=>
      (Set_in (inv_4_1<Ref> x@229@01 y@230@01 z@231@01) ys5@52@01)
      (and
        (Set_in (inv_4_1<Ref> x@229@01 y@230@01 z@231@01) ys5@52@01)
        (or
          (Set_in (inv_4_2<Ref> x@229@01 y@230@01 z@231@01) zs5@63@01)
          (not (Set_in (inv_4_2<Ref> x@229@01 y@230@01 z@231@01) zs5@63@01)))))
    (or
      (Set_in (inv_4_1<Ref> x@229@01 y@230@01 z@231@01) ys5@52@01)
      (not (Set_in (inv_4_1<Ref> x@229@01 y@230@01 z@231@01) ys5@52@01))))))
(assert (or
  (Set_in (inv_4_0<Ref> x@229@01 y@230@01 z@231@01) xs5@41@01)
  (not (Set_in (inv_4_0<Ref> x@229@01 y@230@01 z@231@01) xs5@41@01))))
; [eval] (inv_5_0(x, y, z) in xs6) && ((inv_5_1(x, y, z) in ys6) && (inv_5_2(x, y, z) in zs6)) && (x == x && y == y && z == z)
; [eval] (inv_5_0(x, y, z) in xs6)
; [eval] inv_5_0(x, y, z)
(push) ; 6
; [then-branch: 395 | !(inv_5_0[Ref](x@229@01, y@230@01, z@231@01) in xs6@42@01) | live]
; [else-branch: 395 | inv_5_0[Ref](x@229@01, y@230@01, z@231@01) in xs6@42@01 | live]
(push) ; 7
; [then-branch: 395 | !(inv_5_0[Ref](x@229@01, y@230@01, z@231@01) in xs6@42@01)]
(assert (not (Set_in (inv_5_0<Ref> x@229@01 y@230@01 z@231@01) xs6@42@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 395 | inv_5_0[Ref](x@229@01, y@230@01, z@231@01) in xs6@42@01]
(assert (Set_in (inv_5_0<Ref> x@229@01 y@230@01 z@231@01) xs6@42@01))
; [eval] (inv_5_1(x, y, z) in ys6)
; [eval] inv_5_1(x, y, z)
(push) ; 8
; [then-branch: 396 | !(inv_5_1[Ref](x@229@01, y@230@01, z@231@01) in ys6@53@01) | live]
; [else-branch: 396 | inv_5_1[Ref](x@229@01, y@230@01, z@231@01) in ys6@53@01 | live]
(push) ; 9
; [then-branch: 396 | !(inv_5_1[Ref](x@229@01, y@230@01, z@231@01) in ys6@53@01)]
(assert (not (Set_in (inv_5_1<Ref> x@229@01 y@230@01 z@231@01) ys6@53@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 396 | inv_5_1[Ref](x@229@01, y@230@01, z@231@01) in ys6@53@01]
(assert (Set_in (inv_5_1<Ref> x@229@01 y@230@01 z@231@01) ys6@53@01))
; [eval] (inv_5_2(x, y, z) in zs6)
; [eval] inv_5_2(x, y, z)
(push) ; 10
; [then-branch: 397 | !(inv_5_2[Ref](x@229@01, y@230@01, z@231@01) in zs6@64@01) | live]
; [else-branch: 397 | inv_5_2[Ref](x@229@01, y@230@01, z@231@01) in zs6@64@01 | live]
(push) ; 11
; [then-branch: 397 | !(inv_5_2[Ref](x@229@01, y@230@01, z@231@01) in zs6@64@01)]
(assert (not (Set_in (inv_5_2<Ref> x@229@01 y@230@01 z@231@01) zs6@64@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 397 | inv_5_2[Ref](x@229@01, y@230@01, z@231@01) in zs6@64@01]
(assert (Set_in (inv_5_2<Ref> x@229@01 y@230@01 z@231@01) zs6@64@01))
; [eval] x == x
(push) ; 12
; [then-branch: 398 | False | live]
; [else-branch: 398 | True | live]
(push) ; 13
; [then-branch: 398 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 398 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 399 | False | live]
; [else-branch: 399 | True | live]
(push) ; 15
; [then-branch: 399 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 399 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_5_2<Ref> x@229@01 y@230@01 z@231@01) zs6@64@01)
  (not (Set_in (inv_5_2<Ref> x@229@01 y@230@01 z@231@01) zs6@64@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_5_1<Ref> x@229@01 y@230@01 z@231@01) ys6@53@01)
  (and
    (Set_in (inv_5_1<Ref> x@229@01 y@230@01 z@231@01) ys6@53@01)
    (or
      (Set_in (inv_5_2<Ref> x@229@01 y@230@01 z@231@01) zs6@64@01)
      (not (Set_in (inv_5_2<Ref> x@229@01 y@230@01 z@231@01) zs6@64@01))))))
(assert (or
  (Set_in (inv_5_1<Ref> x@229@01 y@230@01 z@231@01) ys6@53@01)
  (not (Set_in (inv_5_1<Ref> x@229@01 y@230@01 z@231@01) ys6@53@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_5_0<Ref> x@229@01 y@230@01 z@231@01) xs6@42@01)
  (and
    (Set_in (inv_5_0<Ref> x@229@01 y@230@01 z@231@01) xs6@42@01)
    (=>
      (Set_in (inv_5_1<Ref> x@229@01 y@230@01 z@231@01) ys6@53@01)
      (and
        (Set_in (inv_5_1<Ref> x@229@01 y@230@01 z@231@01) ys6@53@01)
        (or
          (Set_in (inv_5_2<Ref> x@229@01 y@230@01 z@231@01) zs6@64@01)
          (not (Set_in (inv_5_2<Ref> x@229@01 y@230@01 z@231@01) zs6@64@01)))))
    (or
      (Set_in (inv_5_1<Ref> x@229@01 y@230@01 z@231@01) ys6@53@01)
      (not (Set_in (inv_5_1<Ref> x@229@01 y@230@01 z@231@01) ys6@53@01))))))
(assert (or
  (Set_in (inv_5_0<Ref> x@229@01 y@230@01 z@231@01) xs6@42@01)
  (not (Set_in (inv_5_0<Ref> x@229@01 y@230@01 z@231@01) xs6@42@01))))
; [eval] (inv_6_0(x, y, z) in xs7) && ((inv_6_1(x, y, z) in ys7) && (inv_6_2(x, y, z) in zs7)) && (x == x && y == y && z == z)
; [eval] (inv_6_0(x, y, z) in xs7)
; [eval] inv_6_0(x, y, z)
(push) ; 6
; [then-branch: 400 | !(inv_6_0[Ref](x@229@01, y@230@01, z@231@01) in xs7@43@01) | live]
; [else-branch: 400 | inv_6_0[Ref](x@229@01, y@230@01, z@231@01) in xs7@43@01 | live]
(push) ; 7
; [then-branch: 400 | !(inv_6_0[Ref](x@229@01, y@230@01, z@231@01) in xs7@43@01)]
(assert (not (Set_in (inv_6_0<Ref> x@229@01 y@230@01 z@231@01) xs7@43@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 400 | inv_6_0[Ref](x@229@01, y@230@01, z@231@01) in xs7@43@01]
(assert (Set_in (inv_6_0<Ref> x@229@01 y@230@01 z@231@01) xs7@43@01))
; [eval] (inv_6_1(x, y, z) in ys7)
; [eval] inv_6_1(x, y, z)
(push) ; 8
; [then-branch: 401 | !(inv_6_1[Ref](x@229@01, y@230@01, z@231@01) in ys7@54@01) | live]
; [else-branch: 401 | inv_6_1[Ref](x@229@01, y@230@01, z@231@01) in ys7@54@01 | live]
(push) ; 9
; [then-branch: 401 | !(inv_6_1[Ref](x@229@01, y@230@01, z@231@01) in ys7@54@01)]
(assert (not (Set_in (inv_6_1<Ref> x@229@01 y@230@01 z@231@01) ys7@54@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 401 | inv_6_1[Ref](x@229@01, y@230@01, z@231@01) in ys7@54@01]
(assert (Set_in (inv_6_1<Ref> x@229@01 y@230@01 z@231@01) ys7@54@01))
; [eval] (inv_6_2(x, y, z) in zs7)
; [eval] inv_6_2(x, y, z)
(push) ; 10
; [then-branch: 402 | !(inv_6_2[Ref](x@229@01, y@230@01, z@231@01) in zs7@65@01) | live]
; [else-branch: 402 | inv_6_2[Ref](x@229@01, y@230@01, z@231@01) in zs7@65@01 | live]
(push) ; 11
; [then-branch: 402 | !(inv_6_2[Ref](x@229@01, y@230@01, z@231@01) in zs7@65@01)]
(assert (not (Set_in (inv_6_2<Ref> x@229@01 y@230@01 z@231@01) zs7@65@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 402 | inv_6_2[Ref](x@229@01, y@230@01, z@231@01) in zs7@65@01]
(assert (Set_in (inv_6_2<Ref> x@229@01 y@230@01 z@231@01) zs7@65@01))
; [eval] x == x
(push) ; 12
; [then-branch: 403 | False | live]
; [else-branch: 403 | True | live]
(push) ; 13
; [then-branch: 403 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 403 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 404 | False | live]
; [else-branch: 404 | True | live]
(push) ; 15
; [then-branch: 404 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 404 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_6_2<Ref> x@229@01 y@230@01 z@231@01) zs7@65@01)
  (not (Set_in (inv_6_2<Ref> x@229@01 y@230@01 z@231@01) zs7@65@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_6_1<Ref> x@229@01 y@230@01 z@231@01) ys7@54@01)
  (and
    (Set_in (inv_6_1<Ref> x@229@01 y@230@01 z@231@01) ys7@54@01)
    (or
      (Set_in (inv_6_2<Ref> x@229@01 y@230@01 z@231@01) zs7@65@01)
      (not (Set_in (inv_6_2<Ref> x@229@01 y@230@01 z@231@01) zs7@65@01))))))
(assert (or
  (Set_in (inv_6_1<Ref> x@229@01 y@230@01 z@231@01) ys7@54@01)
  (not (Set_in (inv_6_1<Ref> x@229@01 y@230@01 z@231@01) ys7@54@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_6_0<Ref> x@229@01 y@230@01 z@231@01) xs7@43@01)
  (and
    (Set_in (inv_6_0<Ref> x@229@01 y@230@01 z@231@01) xs7@43@01)
    (=>
      (Set_in (inv_6_1<Ref> x@229@01 y@230@01 z@231@01) ys7@54@01)
      (and
        (Set_in (inv_6_1<Ref> x@229@01 y@230@01 z@231@01) ys7@54@01)
        (or
          (Set_in (inv_6_2<Ref> x@229@01 y@230@01 z@231@01) zs7@65@01)
          (not (Set_in (inv_6_2<Ref> x@229@01 y@230@01 z@231@01) zs7@65@01)))))
    (or
      (Set_in (inv_6_1<Ref> x@229@01 y@230@01 z@231@01) ys7@54@01)
      (not (Set_in (inv_6_1<Ref> x@229@01 y@230@01 z@231@01) ys7@54@01))))))
(assert (or
  (Set_in (inv_6_0<Ref> x@229@01 y@230@01 z@231@01) xs7@43@01)
  (not (Set_in (inv_6_0<Ref> x@229@01 y@230@01 z@231@01) xs7@43@01))))
; [eval] (inv_7_0(x, y, z) in xs8) && ((inv_7_1(x, y, z) in ys8) && (inv_7_2(x, y, z) in zs8)) && (x == x && y == y && z == z)
; [eval] (inv_7_0(x, y, z) in xs8)
; [eval] inv_7_0(x, y, z)
(push) ; 6
; [then-branch: 405 | !(inv_7_0[Ref](x@229@01, y@230@01, z@231@01) in xs8@44@01) | live]
; [else-branch: 405 | inv_7_0[Ref](x@229@01, y@230@01, z@231@01) in xs8@44@01 | live]
(push) ; 7
; [then-branch: 405 | !(inv_7_0[Ref](x@229@01, y@230@01, z@231@01) in xs8@44@01)]
(assert (not (Set_in (inv_7_0<Ref> x@229@01 y@230@01 z@231@01) xs8@44@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 405 | inv_7_0[Ref](x@229@01, y@230@01, z@231@01) in xs8@44@01]
(assert (Set_in (inv_7_0<Ref> x@229@01 y@230@01 z@231@01) xs8@44@01))
; [eval] (inv_7_1(x, y, z) in ys8)
; [eval] inv_7_1(x, y, z)
(push) ; 8
; [then-branch: 406 | !(inv_7_1[Ref](x@229@01, y@230@01, z@231@01) in ys8@55@01) | live]
; [else-branch: 406 | inv_7_1[Ref](x@229@01, y@230@01, z@231@01) in ys8@55@01 | live]
(push) ; 9
; [then-branch: 406 | !(inv_7_1[Ref](x@229@01, y@230@01, z@231@01) in ys8@55@01)]
(assert (not (Set_in (inv_7_1<Ref> x@229@01 y@230@01 z@231@01) ys8@55@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 406 | inv_7_1[Ref](x@229@01, y@230@01, z@231@01) in ys8@55@01]
(assert (Set_in (inv_7_1<Ref> x@229@01 y@230@01 z@231@01) ys8@55@01))
; [eval] (inv_7_2(x, y, z) in zs8)
; [eval] inv_7_2(x, y, z)
(push) ; 10
; [then-branch: 407 | !(inv_7_2[Ref](x@229@01, y@230@01, z@231@01) in zs8@66@01) | live]
; [else-branch: 407 | inv_7_2[Ref](x@229@01, y@230@01, z@231@01) in zs8@66@01 | live]
(push) ; 11
; [then-branch: 407 | !(inv_7_2[Ref](x@229@01, y@230@01, z@231@01) in zs8@66@01)]
(assert (not (Set_in (inv_7_2<Ref> x@229@01 y@230@01 z@231@01) zs8@66@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 407 | inv_7_2[Ref](x@229@01, y@230@01, z@231@01) in zs8@66@01]
(assert (Set_in (inv_7_2<Ref> x@229@01 y@230@01 z@231@01) zs8@66@01))
; [eval] x == x
(push) ; 12
; [then-branch: 408 | False | live]
; [else-branch: 408 | True | live]
(push) ; 13
; [then-branch: 408 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 408 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 409 | False | live]
; [else-branch: 409 | True | live]
(push) ; 15
; [then-branch: 409 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 409 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_7_2<Ref> x@229@01 y@230@01 z@231@01) zs8@66@01)
  (not (Set_in (inv_7_2<Ref> x@229@01 y@230@01 z@231@01) zs8@66@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_7_1<Ref> x@229@01 y@230@01 z@231@01) ys8@55@01)
  (and
    (Set_in (inv_7_1<Ref> x@229@01 y@230@01 z@231@01) ys8@55@01)
    (or
      (Set_in (inv_7_2<Ref> x@229@01 y@230@01 z@231@01) zs8@66@01)
      (not (Set_in (inv_7_2<Ref> x@229@01 y@230@01 z@231@01) zs8@66@01))))))
(assert (or
  (Set_in (inv_7_1<Ref> x@229@01 y@230@01 z@231@01) ys8@55@01)
  (not (Set_in (inv_7_1<Ref> x@229@01 y@230@01 z@231@01) ys8@55@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_7_0<Ref> x@229@01 y@230@01 z@231@01) xs8@44@01)
  (and
    (Set_in (inv_7_0<Ref> x@229@01 y@230@01 z@231@01) xs8@44@01)
    (=>
      (Set_in (inv_7_1<Ref> x@229@01 y@230@01 z@231@01) ys8@55@01)
      (and
        (Set_in (inv_7_1<Ref> x@229@01 y@230@01 z@231@01) ys8@55@01)
        (or
          (Set_in (inv_7_2<Ref> x@229@01 y@230@01 z@231@01) zs8@66@01)
          (not (Set_in (inv_7_2<Ref> x@229@01 y@230@01 z@231@01) zs8@66@01)))))
    (or
      (Set_in (inv_7_1<Ref> x@229@01 y@230@01 z@231@01) ys8@55@01)
      (not (Set_in (inv_7_1<Ref> x@229@01 y@230@01 z@231@01) ys8@55@01))))))
(assert (or
  (Set_in (inv_7_0<Ref> x@229@01 y@230@01 z@231@01) xs8@44@01)
  (not (Set_in (inv_7_0<Ref> x@229@01 y@230@01 z@231@01) xs8@44@01))))
; [eval] (inv_8_0(x, y, z) in xs9) && ((inv_8_1(x, y, z) in ys9) && (inv_8_2(x, y, z) in zs9)) && (x == x && y == y && z == z)
; [eval] (inv_8_0(x, y, z) in xs9)
; [eval] inv_8_0(x, y, z)
(push) ; 6
; [then-branch: 410 | !(inv_8_0[Ref](x@229@01, y@230@01, z@231@01) in xs9@45@01) | live]
; [else-branch: 410 | inv_8_0[Ref](x@229@01, y@230@01, z@231@01) in xs9@45@01 | live]
(push) ; 7
; [then-branch: 410 | !(inv_8_0[Ref](x@229@01, y@230@01, z@231@01) in xs9@45@01)]
(assert (not (Set_in (inv_8_0<Ref> x@229@01 y@230@01 z@231@01) xs9@45@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 410 | inv_8_0[Ref](x@229@01, y@230@01, z@231@01) in xs9@45@01]
(assert (Set_in (inv_8_0<Ref> x@229@01 y@230@01 z@231@01) xs9@45@01))
; [eval] (inv_8_1(x, y, z) in ys9)
; [eval] inv_8_1(x, y, z)
(push) ; 8
; [then-branch: 411 | !(inv_8_1[Ref](x@229@01, y@230@01, z@231@01) in ys9@56@01) | live]
; [else-branch: 411 | inv_8_1[Ref](x@229@01, y@230@01, z@231@01) in ys9@56@01 | live]
(push) ; 9
; [then-branch: 411 | !(inv_8_1[Ref](x@229@01, y@230@01, z@231@01) in ys9@56@01)]
(assert (not (Set_in (inv_8_1<Ref> x@229@01 y@230@01 z@231@01) ys9@56@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 411 | inv_8_1[Ref](x@229@01, y@230@01, z@231@01) in ys9@56@01]
(assert (Set_in (inv_8_1<Ref> x@229@01 y@230@01 z@231@01) ys9@56@01))
; [eval] (inv_8_2(x, y, z) in zs9)
; [eval] inv_8_2(x, y, z)
(push) ; 10
; [then-branch: 412 | !(inv_8_2[Ref](x@229@01, y@230@01, z@231@01) in zs9@67@01) | live]
; [else-branch: 412 | inv_8_2[Ref](x@229@01, y@230@01, z@231@01) in zs9@67@01 | live]
(push) ; 11
; [then-branch: 412 | !(inv_8_2[Ref](x@229@01, y@230@01, z@231@01) in zs9@67@01)]
(assert (not (Set_in (inv_8_2<Ref> x@229@01 y@230@01 z@231@01) zs9@67@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 412 | inv_8_2[Ref](x@229@01, y@230@01, z@231@01) in zs9@67@01]
(assert (Set_in (inv_8_2<Ref> x@229@01 y@230@01 z@231@01) zs9@67@01))
; [eval] x == x
(push) ; 12
; [then-branch: 413 | False | live]
; [else-branch: 413 | True | live]
(push) ; 13
; [then-branch: 413 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 413 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 414 | False | live]
; [else-branch: 414 | True | live]
(push) ; 15
; [then-branch: 414 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 414 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_8_2<Ref> x@229@01 y@230@01 z@231@01) zs9@67@01)
  (not (Set_in (inv_8_2<Ref> x@229@01 y@230@01 z@231@01) zs9@67@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_8_1<Ref> x@229@01 y@230@01 z@231@01) ys9@56@01)
  (and
    (Set_in (inv_8_1<Ref> x@229@01 y@230@01 z@231@01) ys9@56@01)
    (or
      (Set_in (inv_8_2<Ref> x@229@01 y@230@01 z@231@01) zs9@67@01)
      (not (Set_in (inv_8_2<Ref> x@229@01 y@230@01 z@231@01) zs9@67@01))))))
(assert (or
  (Set_in (inv_8_1<Ref> x@229@01 y@230@01 z@231@01) ys9@56@01)
  (not (Set_in (inv_8_1<Ref> x@229@01 y@230@01 z@231@01) ys9@56@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_8_0<Ref> x@229@01 y@230@01 z@231@01) xs9@45@01)
  (and
    (Set_in (inv_8_0<Ref> x@229@01 y@230@01 z@231@01) xs9@45@01)
    (=>
      (Set_in (inv_8_1<Ref> x@229@01 y@230@01 z@231@01) ys9@56@01)
      (and
        (Set_in (inv_8_1<Ref> x@229@01 y@230@01 z@231@01) ys9@56@01)
        (or
          (Set_in (inv_8_2<Ref> x@229@01 y@230@01 z@231@01) zs9@67@01)
          (not (Set_in (inv_8_2<Ref> x@229@01 y@230@01 z@231@01) zs9@67@01)))))
    (or
      (Set_in (inv_8_1<Ref> x@229@01 y@230@01 z@231@01) ys9@56@01)
      (not (Set_in (inv_8_1<Ref> x@229@01 y@230@01 z@231@01) ys9@56@01))))))
(assert (or
  (Set_in (inv_8_0<Ref> x@229@01 y@230@01 z@231@01) xs9@45@01)
  (not (Set_in (inv_8_0<Ref> x@229@01 y@230@01 z@231@01) xs9@45@01))))
; [eval] (inv_9_0(x, y, z) in xs10) && ((inv_9_1(x, y, z) in ys10) && (inv_9_2(x, y, z) in zs10)) && (x == x && y == y && z == z)
; [eval] (inv_9_0(x, y, z) in xs10)
; [eval] inv_9_0(x, y, z)
(push) ; 6
; [then-branch: 415 | !(inv_9_0[Ref](x@229@01, y@230@01, z@231@01) in xs10@46@01) | live]
; [else-branch: 415 | inv_9_0[Ref](x@229@01, y@230@01, z@231@01) in xs10@46@01 | live]
(push) ; 7
; [then-branch: 415 | !(inv_9_0[Ref](x@229@01, y@230@01, z@231@01) in xs10@46@01)]
(assert (not (Set_in (inv_9_0<Ref> x@229@01 y@230@01 z@231@01) xs10@46@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 415 | inv_9_0[Ref](x@229@01, y@230@01, z@231@01) in xs10@46@01]
(assert (Set_in (inv_9_0<Ref> x@229@01 y@230@01 z@231@01) xs10@46@01))
; [eval] (inv_9_1(x, y, z) in ys10)
; [eval] inv_9_1(x, y, z)
(push) ; 8
; [then-branch: 416 | !(inv_9_1[Ref](x@229@01, y@230@01, z@231@01) in ys10@57@01) | live]
; [else-branch: 416 | inv_9_1[Ref](x@229@01, y@230@01, z@231@01) in ys10@57@01 | live]
(push) ; 9
; [then-branch: 416 | !(inv_9_1[Ref](x@229@01, y@230@01, z@231@01) in ys10@57@01)]
(assert (not (Set_in (inv_9_1<Ref> x@229@01 y@230@01 z@231@01) ys10@57@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 416 | inv_9_1[Ref](x@229@01, y@230@01, z@231@01) in ys10@57@01]
(assert (Set_in (inv_9_1<Ref> x@229@01 y@230@01 z@231@01) ys10@57@01))
; [eval] (inv_9_2(x, y, z) in zs10)
; [eval] inv_9_2(x, y, z)
(push) ; 10
; [then-branch: 417 | !(inv_9_2[Ref](x@229@01, y@230@01, z@231@01) in zs10@68@01) | live]
; [else-branch: 417 | inv_9_2[Ref](x@229@01, y@230@01, z@231@01) in zs10@68@01 | live]
(push) ; 11
; [then-branch: 417 | !(inv_9_2[Ref](x@229@01, y@230@01, z@231@01) in zs10@68@01)]
(assert (not (Set_in (inv_9_2<Ref> x@229@01 y@230@01 z@231@01) zs10@68@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 417 | inv_9_2[Ref](x@229@01, y@230@01, z@231@01) in zs10@68@01]
(assert (Set_in (inv_9_2<Ref> x@229@01 y@230@01 z@231@01) zs10@68@01))
; [eval] x == x
(push) ; 12
; [then-branch: 418 | False | live]
; [else-branch: 418 | True | live]
(push) ; 13
; [then-branch: 418 | False]
(assert false)
(pop) ; 13
(push) ; 13
; [else-branch: 418 | True]
; [eval] y == y
(push) ; 14
; [then-branch: 419 | False | live]
; [else-branch: 419 | True | live]
(push) ; 15
; [then-branch: 419 | False]
(assert false)
(pop) ; 15
(push) ; 15
; [else-branch: 419 | True]
; [eval] z == z
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in (inv_9_2<Ref> x@229@01 y@230@01 z@231@01) zs10@68@01)
  (not (Set_in (inv_9_2<Ref> x@229@01 y@230@01 z@231@01) zs10@68@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_9_1<Ref> x@229@01 y@230@01 z@231@01) ys10@57@01)
  (and
    (Set_in (inv_9_1<Ref> x@229@01 y@230@01 z@231@01) ys10@57@01)
    (or
      (Set_in (inv_9_2<Ref> x@229@01 y@230@01 z@231@01) zs10@68@01)
      (not (Set_in (inv_9_2<Ref> x@229@01 y@230@01 z@231@01) zs10@68@01))))))
(assert (or
  (Set_in (inv_9_1<Ref> x@229@01 y@230@01 z@231@01) ys10@57@01)
  (not (Set_in (inv_9_1<Ref> x@229@01 y@230@01 z@231@01) ys10@57@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in (inv_9_0<Ref> x@229@01 y@230@01 z@231@01) xs10@46@01)
  (and
    (Set_in (inv_9_0<Ref> x@229@01 y@230@01 z@231@01) xs10@46@01)
    (=>
      (Set_in (inv_9_1<Ref> x@229@01 y@230@01 z@231@01) ys10@57@01)
      (and
        (Set_in (inv_9_1<Ref> x@229@01 y@230@01 z@231@01) ys10@57@01)
        (or
          (Set_in (inv_9_2<Ref> x@229@01 y@230@01 z@231@01) zs10@68@01)
          (not (Set_in (inv_9_2<Ref> x@229@01 y@230@01 z@231@01) zs10@68@01)))))
    (or
      (Set_in (inv_9_1<Ref> x@229@01 y@230@01 z@231@01) ys10@57@01)
      (not (Set_in (inv_9_1<Ref> x@229@01 y@230@01 z@231@01) ys10@57@01))))))
(assert (or
  (Set_in (inv_9_0<Ref> x@229@01 y@230@01 z@231@01) xs10@46@01)
  (not (Set_in (inv_9_0<Ref> x@229@01 y@230@01 z@231@01) xs10@46@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 369 | !(inv_10_0[Ref](x@229@01, y@230@01, z@231@01) in xs11@47@01 && inv_10_1[Ref](x@229@01, y@230@01, z@231@01) in ys11@58@01 && inv_10_2[Ref](x@229@01, y@230@01, z@231@01) in zs11@69@01)]
(assert (not
  (and
    (Set_in (inv_10_0<Ref> x@229@01 y@230@01 z@231@01) xs11@47@01)
    (and
      (Set_in (inv_10_1<Ref> x@229@01 y@230@01 z@231@01) ys11@58@01)
      (Set_in (inv_10_2<Ref> x@229@01 y@230@01 z@231@01) zs11@69@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (=
    ($PSF.perm_p (as pm@232@01  $PPM) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    (ite
      (and
        (and (img@83@01 x y z) (img@85@01 x y z) (img@87@01 x y z))
        (and
          (Set_in (inv@82@01 x y z) xs@70@01)
          (and
            (Set_in (inv@84@01 x y z) ys@71@01)
            (Set_in (inv@86@01 x y z) zs@72@01))))
      q@73@01
      $Perm.No))
  :pattern (($PSF.perm_p (as pm@232@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resPrmSumDef22|)))
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (and
    ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    ($PSF.loc_p ($PSF.lookup_p $t@81@01 ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))))
  :pattern (($PSF.perm_p (as pm@232@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resTrgDef23|)))
(assert (=>
  (and
    (Set_in (inv_10_0<Ref> x@229@01 y@230@01 z@231@01) xs11@47@01)
    (and
      (Set_in (inv_10_1<Ref> x@229@01 y@230@01 z@231@01) ys11@58@01)
      (Set_in (inv_10_2<Ref> x@229@01 y@230@01 z@231@01) zs11@69@01)))
  (and
    (Set_in (inv_10_0<Ref> x@229@01 y@230@01 z@231@01) xs11@47@01)
    (Set_in (inv_10_1<Ref> x@229@01 y@230@01 z@231@01) ys11@58@01)
    (Set_in (inv_10_2<Ref> x@229@01 y@230@01 z@231@01) zs11@69@01)
    ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x@229@01)
        ($SortWrappers.$RefTo$Snap y@230@01))
      ($SortWrappers.$RefTo$Snap z@231@01))) ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x@229@01)
        ($SortWrappers.$RefTo$Snap y@230@01))
      ($SortWrappers.$RefTo$Snap z@231@01)))
    (=>
      (Set_in (inv_0_0<Ref> x@229@01 y@230@01 z@231@01) xs1@37@01)
      (and
        (Set_in (inv_0_0<Ref> x@229@01 y@230@01 z@231@01) xs1@37@01)
        (=>
          (Set_in (inv_0_1<Ref> x@229@01 y@230@01 z@231@01) ys1@48@01)
          (and
            (Set_in (inv_0_1<Ref> x@229@01 y@230@01 z@231@01) ys1@48@01)
            (or
              (Set_in (inv_0_2<Ref> x@229@01 y@230@01 z@231@01) zs1@59@01)
              (not (Set_in (inv_0_2<Ref> x@229@01 y@230@01 z@231@01) zs1@59@01)))))
        (or
          (Set_in (inv_0_1<Ref> x@229@01 y@230@01 z@231@01) ys1@48@01)
          (not (Set_in (inv_0_1<Ref> x@229@01 y@230@01 z@231@01) ys1@48@01)))))
    (or
      (Set_in (inv_0_0<Ref> x@229@01 y@230@01 z@231@01) xs1@37@01)
      (not (Set_in (inv_0_0<Ref> x@229@01 y@230@01 z@231@01) xs1@37@01)))
    (=>
      (Set_in (inv_1_0<Ref> x@229@01 y@230@01 z@231@01) xs2@38@01)
      (and
        (Set_in (inv_1_0<Ref> x@229@01 y@230@01 z@231@01) xs2@38@01)
        (=>
          (Set_in (inv_1_1<Ref> x@229@01 y@230@01 z@231@01) ys2@49@01)
          (and
            (Set_in (inv_1_1<Ref> x@229@01 y@230@01 z@231@01) ys2@49@01)
            (or
              (Set_in (inv_1_2<Ref> x@229@01 y@230@01 z@231@01) zs2@60@01)
              (not (Set_in (inv_1_2<Ref> x@229@01 y@230@01 z@231@01) zs2@60@01)))))
        (or
          (Set_in (inv_1_1<Ref> x@229@01 y@230@01 z@231@01) ys2@49@01)
          (not (Set_in (inv_1_1<Ref> x@229@01 y@230@01 z@231@01) ys2@49@01)))))
    (or
      (Set_in (inv_1_0<Ref> x@229@01 y@230@01 z@231@01) xs2@38@01)
      (not (Set_in (inv_1_0<Ref> x@229@01 y@230@01 z@231@01) xs2@38@01)))
    (=>
      (Set_in (inv_2_0<Ref> x@229@01 y@230@01 z@231@01) xs3@39@01)
      (and
        (Set_in (inv_2_0<Ref> x@229@01 y@230@01 z@231@01) xs3@39@01)
        (=>
          (Set_in (inv_2_1<Ref> x@229@01 y@230@01 z@231@01) ys3@50@01)
          (and
            (Set_in (inv_2_1<Ref> x@229@01 y@230@01 z@231@01) ys3@50@01)
            (or
              (Set_in (inv_2_2<Ref> x@229@01 y@230@01 z@231@01) zs3@61@01)
              (not (Set_in (inv_2_2<Ref> x@229@01 y@230@01 z@231@01) zs3@61@01)))))
        (or
          (Set_in (inv_2_1<Ref> x@229@01 y@230@01 z@231@01) ys3@50@01)
          (not (Set_in (inv_2_1<Ref> x@229@01 y@230@01 z@231@01) ys3@50@01)))))
    (or
      (Set_in (inv_2_0<Ref> x@229@01 y@230@01 z@231@01) xs3@39@01)
      (not (Set_in (inv_2_0<Ref> x@229@01 y@230@01 z@231@01) xs3@39@01)))
    (=>
      (Set_in (inv_3_0<Ref> x@229@01 y@230@01 z@231@01) xs4@40@01)
      (and
        (Set_in (inv_3_0<Ref> x@229@01 y@230@01 z@231@01) xs4@40@01)
        (=>
          (Set_in (inv_3_1<Ref> x@229@01 y@230@01 z@231@01) ys4@51@01)
          (and
            (Set_in (inv_3_1<Ref> x@229@01 y@230@01 z@231@01) ys4@51@01)
            (or
              (Set_in (inv_3_2<Ref> x@229@01 y@230@01 z@231@01) zs4@62@01)
              (not (Set_in (inv_3_2<Ref> x@229@01 y@230@01 z@231@01) zs4@62@01)))))
        (or
          (Set_in (inv_3_1<Ref> x@229@01 y@230@01 z@231@01) ys4@51@01)
          (not (Set_in (inv_3_1<Ref> x@229@01 y@230@01 z@231@01) ys4@51@01)))))
    (or
      (Set_in (inv_3_0<Ref> x@229@01 y@230@01 z@231@01) xs4@40@01)
      (not (Set_in (inv_3_0<Ref> x@229@01 y@230@01 z@231@01) xs4@40@01)))
    (=>
      (Set_in (inv_4_0<Ref> x@229@01 y@230@01 z@231@01) xs5@41@01)
      (and
        (Set_in (inv_4_0<Ref> x@229@01 y@230@01 z@231@01) xs5@41@01)
        (=>
          (Set_in (inv_4_1<Ref> x@229@01 y@230@01 z@231@01) ys5@52@01)
          (and
            (Set_in (inv_4_1<Ref> x@229@01 y@230@01 z@231@01) ys5@52@01)
            (or
              (Set_in (inv_4_2<Ref> x@229@01 y@230@01 z@231@01) zs5@63@01)
              (not (Set_in (inv_4_2<Ref> x@229@01 y@230@01 z@231@01) zs5@63@01)))))
        (or
          (Set_in (inv_4_1<Ref> x@229@01 y@230@01 z@231@01) ys5@52@01)
          (not (Set_in (inv_4_1<Ref> x@229@01 y@230@01 z@231@01) ys5@52@01)))))
    (or
      (Set_in (inv_4_0<Ref> x@229@01 y@230@01 z@231@01) xs5@41@01)
      (not (Set_in (inv_4_0<Ref> x@229@01 y@230@01 z@231@01) xs5@41@01)))
    (=>
      (Set_in (inv_5_0<Ref> x@229@01 y@230@01 z@231@01) xs6@42@01)
      (and
        (Set_in (inv_5_0<Ref> x@229@01 y@230@01 z@231@01) xs6@42@01)
        (=>
          (Set_in (inv_5_1<Ref> x@229@01 y@230@01 z@231@01) ys6@53@01)
          (and
            (Set_in (inv_5_1<Ref> x@229@01 y@230@01 z@231@01) ys6@53@01)
            (or
              (Set_in (inv_5_2<Ref> x@229@01 y@230@01 z@231@01) zs6@64@01)
              (not (Set_in (inv_5_2<Ref> x@229@01 y@230@01 z@231@01) zs6@64@01)))))
        (or
          (Set_in (inv_5_1<Ref> x@229@01 y@230@01 z@231@01) ys6@53@01)
          (not (Set_in (inv_5_1<Ref> x@229@01 y@230@01 z@231@01) ys6@53@01)))))
    (or
      (Set_in (inv_5_0<Ref> x@229@01 y@230@01 z@231@01) xs6@42@01)
      (not (Set_in (inv_5_0<Ref> x@229@01 y@230@01 z@231@01) xs6@42@01)))
    (=>
      (Set_in (inv_6_0<Ref> x@229@01 y@230@01 z@231@01) xs7@43@01)
      (and
        (Set_in (inv_6_0<Ref> x@229@01 y@230@01 z@231@01) xs7@43@01)
        (=>
          (Set_in (inv_6_1<Ref> x@229@01 y@230@01 z@231@01) ys7@54@01)
          (and
            (Set_in (inv_6_1<Ref> x@229@01 y@230@01 z@231@01) ys7@54@01)
            (or
              (Set_in (inv_6_2<Ref> x@229@01 y@230@01 z@231@01) zs7@65@01)
              (not (Set_in (inv_6_2<Ref> x@229@01 y@230@01 z@231@01) zs7@65@01)))))
        (or
          (Set_in (inv_6_1<Ref> x@229@01 y@230@01 z@231@01) ys7@54@01)
          (not (Set_in (inv_6_1<Ref> x@229@01 y@230@01 z@231@01) ys7@54@01)))))
    (or
      (Set_in (inv_6_0<Ref> x@229@01 y@230@01 z@231@01) xs7@43@01)
      (not (Set_in (inv_6_0<Ref> x@229@01 y@230@01 z@231@01) xs7@43@01)))
    (=>
      (Set_in (inv_7_0<Ref> x@229@01 y@230@01 z@231@01) xs8@44@01)
      (and
        (Set_in (inv_7_0<Ref> x@229@01 y@230@01 z@231@01) xs8@44@01)
        (=>
          (Set_in (inv_7_1<Ref> x@229@01 y@230@01 z@231@01) ys8@55@01)
          (and
            (Set_in (inv_7_1<Ref> x@229@01 y@230@01 z@231@01) ys8@55@01)
            (or
              (Set_in (inv_7_2<Ref> x@229@01 y@230@01 z@231@01) zs8@66@01)
              (not (Set_in (inv_7_2<Ref> x@229@01 y@230@01 z@231@01) zs8@66@01)))))
        (or
          (Set_in (inv_7_1<Ref> x@229@01 y@230@01 z@231@01) ys8@55@01)
          (not (Set_in (inv_7_1<Ref> x@229@01 y@230@01 z@231@01) ys8@55@01)))))
    (or
      (Set_in (inv_7_0<Ref> x@229@01 y@230@01 z@231@01) xs8@44@01)
      (not (Set_in (inv_7_0<Ref> x@229@01 y@230@01 z@231@01) xs8@44@01)))
    (=>
      (Set_in (inv_8_0<Ref> x@229@01 y@230@01 z@231@01) xs9@45@01)
      (and
        (Set_in (inv_8_0<Ref> x@229@01 y@230@01 z@231@01) xs9@45@01)
        (=>
          (Set_in (inv_8_1<Ref> x@229@01 y@230@01 z@231@01) ys9@56@01)
          (and
            (Set_in (inv_8_1<Ref> x@229@01 y@230@01 z@231@01) ys9@56@01)
            (or
              (Set_in (inv_8_2<Ref> x@229@01 y@230@01 z@231@01) zs9@67@01)
              (not (Set_in (inv_8_2<Ref> x@229@01 y@230@01 z@231@01) zs9@67@01)))))
        (or
          (Set_in (inv_8_1<Ref> x@229@01 y@230@01 z@231@01) ys9@56@01)
          (not (Set_in (inv_8_1<Ref> x@229@01 y@230@01 z@231@01) ys9@56@01)))))
    (or
      (Set_in (inv_8_0<Ref> x@229@01 y@230@01 z@231@01) xs9@45@01)
      (not (Set_in (inv_8_0<Ref> x@229@01 y@230@01 z@231@01) xs9@45@01)))
    (=>
      (Set_in (inv_9_0<Ref> x@229@01 y@230@01 z@231@01) xs10@46@01)
      (and
        (Set_in (inv_9_0<Ref> x@229@01 y@230@01 z@231@01) xs10@46@01)
        (=>
          (Set_in (inv_9_1<Ref> x@229@01 y@230@01 z@231@01) ys10@57@01)
          (and
            (Set_in (inv_9_1<Ref> x@229@01 y@230@01 z@231@01) ys10@57@01)
            (or
              (Set_in (inv_9_2<Ref> x@229@01 y@230@01 z@231@01) zs10@68@01)
              (not (Set_in (inv_9_2<Ref> x@229@01 y@230@01 z@231@01) zs10@68@01)))))
        (or
          (Set_in (inv_9_1<Ref> x@229@01 y@230@01 z@231@01) ys10@57@01)
          (not (Set_in (inv_9_1<Ref> x@229@01 y@230@01 z@231@01) ys10@57@01)))))
    (or
      (Set_in (inv_9_0<Ref> x@229@01 y@230@01 z@231@01) xs10@46@01)
      (not (Set_in (inv_9_0<Ref> x@229@01 y@230@01 z@231@01) xs10@46@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in (inv_10_0<Ref> x@229@01 y@230@01 z@231@01) xs11@47@01)
      (and
        (Set_in (inv_10_1<Ref> x@229@01 y@230@01 z@231@01) ys11@58@01)
        (Set_in (inv_10_2<Ref> x@229@01 y@230@01 z@231@01) zs11@69@01))))
  (and
    (Set_in (inv_10_0<Ref> x@229@01 y@230@01 z@231@01) xs11@47@01)
    (and
      (Set_in (inv_10_1<Ref> x@229@01 y@230@01 z@231@01) ys11@58@01)
      (Set_in (inv_10_2<Ref> x@229@01 y@230@01 z@231@01) zs11@69@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (=
    ($PSF.perm_p (as pm@232@01  $PPM) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    (ite
      (and
        (and (img@83@01 x y z) (img@85@01 x y z) (img@87@01 x y z))
        (and
          (Set_in (inv@82@01 x y z) xs@70@01)
          (and
            (Set_in (inv@84@01 x y z) ys@71@01)
            (Set_in (inv@86@01 x y z) zs@72@01))))
      q@73@01
      $Perm.No))
  :pattern (($PSF.perm_p (as pm@232@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resPrmSumDef22|)))
(assert (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (and
    ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z)))
    ($PSF.loc_p ($PSF.lookup_p $t@81@01 ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))) ($Snap.combine
      ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
      ($SortWrappers.$RefTo$Snap z))))
  :pattern (($PSF.perm_p (as pm@232@01  $PPM) ($Snap.combine
    ($Snap.combine ($SortWrappers.$RefTo$Snap x) ($SortWrappers.$RefTo$Snap y))
    ($SortWrappers.$RefTo$Snap z))))
  :qid |qp.resTrgDef23|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@229@01 $Ref) (y@230@01 $Ref) (z@231@01 $Ref)) (!
  (and
    (=>
      (Set_in (inv_10_0<Ref> x@229@01 y@230@01 z@231@01) xs11@47@01)
      (and
        (Set_in (inv_10_0<Ref> x@229@01 y@230@01 z@231@01) xs11@47@01)
        (or
          (Set_in (inv_10_1<Ref> x@229@01 y@230@01 z@231@01) ys11@58@01)
          (not (Set_in (inv_10_1<Ref> x@229@01 y@230@01 z@231@01) ys11@58@01)))))
    (or
      (Set_in (inv_10_0<Ref> x@229@01 y@230@01 z@231@01) xs11@47@01)
      (not (Set_in (inv_10_0<Ref> x@229@01 y@230@01 z@231@01) xs11@47@01)))
    (=>
      (and
        (Set_in (inv_10_0<Ref> x@229@01 y@230@01 z@231@01) xs11@47@01)
        (and
          (Set_in (inv_10_1<Ref> x@229@01 y@230@01 z@231@01) ys11@58@01)
          (Set_in (inv_10_2<Ref> x@229@01 y@230@01 z@231@01) zs11@69@01)))
      (and
        (Set_in (inv_10_0<Ref> x@229@01 y@230@01 z@231@01) xs11@47@01)
        (Set_in (inv_10_1<Ref> x@229@01 y@230@01 z@231@01) ys11@58@01)
        (Set_in (inv_10_2<Ref> x@229@01 y@230@01 z@231@01) zs11@69@01)
        ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap x@229@01)
            ($SortWrappers.$RefTo$Snap y@230@01))
          ($SortWrappers.$RefTo$Snap z@231@01))) ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap x@229@01)
            ($SortWrappers.$RefTo$Snap y@230@01))
          ($SortWrappers.$RefTo$Snap z@231@01)))
        (=>
          (Set_in (inv_0_0<Ref> x@229@01 y@230@01 z@231@01) xs1@37@01)
          (and
            (Set_in (inv_0_0<Ref> x@229@01 y@230@01 z@231@01) xs1@37@01)
            (=>
              (Set_in (inv_0_1<Ref> x@229@01 y@230@01 z@231@01) ys1@48@01)
              (and
                (Set_in (inv_0_1<Ref> x@229@01 y@230@01 z@231@01) ys1@48@01)
                (or
                  (Set_in (inv_0_2<Ref> x@229@01 y@230@01 z@231@01) zs1@59@01)
                  (not
                    (Set_in (inv_0_2<Ref> x@229@01 y@230@01 z@231@01) zs1@59@01)))))
            (or
              (Set_in (inv_0_1<Ref> x@229@01 y@230@01 z@231@01) ys1@48@01)
              (not (Set_in (inv_0_1<Ref> x@229@01 y@230@01 z@231@01) ys1@48@01)))))
        (or
          (Set_in (inv_0_0<Ref> x@229@01 y@230@01 z@231@01) xs1@37@01)
          (not (Set_in (inv_0_0<Ref> x@229@01 y@230@01 z@231@01) xs1@37@01)))
        (=>
          (Set_in (inv_1_0<Ref> x@229@01 y@230@01 z@231@01) xs2@38@01)
          (and
            (Set_in (inv_1_0<Ref> x@229@01 y@230@01 z@231@01) xs2@38@01)
            (=>
              (Set_in (inv_1_1<Ref> x@229@01 y@230@01 z@231@01) ys2@49@01)
              (and
                (Set_in (inv_1_1<Ref> x@229@01 y@230@01 z@231@01) ys2@49@01)
                (or
                  (Set_in (inv_1_2<Ref> x@229@01 y@230@01 z@231@01) zs2@60@01)
                  (not
                    (Set_in (inv_1_2<Ref> x@229@01 y@230@01 z@231@01) zs2@60@01)))))
            (or
              (Set_in (inv_1_1<Ref> x@229@01 y@230@01 z@231@01) ys2@49@01)
              (not (Set_in (inv_1_1<Ref> x@229@01 y@230@01 z@231@01) ys2@49@01)))))
        (or
          (Set_in (inv_1_0<Ref> x@229@01 y@230@01 z@231@01) xs2@38@01)
          (not (Set_in (inv_1_0<Ref> x@229@01 y@230@01 z@231@01) xs2@38@01)))
        (=>
          (Set_in (inv_2_0<Ref> x@229@01 y@230@01 z@231@01) xs3@39@01)
          (and
            (Set_in (inv_2_0<Ref> x@229@01 y@230@01 z@231@01) xs3@39@01)
            (=>
              (Set_in (inv_2_1<Ref> x@229@01 y@230@01 z@231@01) ys3@50@01)
              (and
                (Set_in (inv_2_1<Ref> x@229@01 y@230@01 z@231@01) ys3@50@01)
                (or
                  (Set_in (inv_2_2<Ref> x@229@01 y@230@01 z@231@01) zs3@61@01)
                  (not
                    (Set_in (inv_2_2<Ref> x@229@01 y@230@01 z@231@01) zs3@61@01)))))
            (or
              (Set_in (inv_2_1<Ref> x@229@01 y@230@01 z@231@01) ys3@50@01)
              (not (Set_in (inv_2_1<Ref> x@229@01 y@230@01 z@231@01) ys3@50@01)))))
        (or
          (Set_in (inv_2_0<Ref> x@229@01 y@230@01 z@231@01) xs3@39@01)
          (not (Set_in (inv_2_0<Ref> x@229@01 y@230@01 z@231@01) xs3@39@01)))
        (=>
          (Set_in (inv_3_0<Ref> x@229@01 y@230@01 z@231@01) xs4@40@01)
          (and
            (Set_in (inv_3_0<Ref> x@229@01 y@230@01 z@231@01) xs4@40@01)
            (=>
              (Set_in (inv_3_1<Ref> x@229@01 y@230@01 z@231@01) ys4@51@01)
              (and
                (Set_in (inv_3_1<Ref> x@229@01 y@230@01 z@231@01) ys4@51@01)
                (or
                  (Set_in (inv_3_2<Ref> x@229@01 y@230@01 z@231@01) zs4@62@01)
                  (not
                    (Set_in (inv_3_2<Ref> x@229@01 y@230@01 z@231@01) zs4@62@01)))))
            (or
              (Set_in (inv_3_1<Ref> x@229@01 y@230@01 z@231@01) ys4@51@01)
              (not (Set_in (inv_3_1<Ref> x@229@01 y@230@01 z@231@01) ys4@51@01)))))
        (or
          (Set_in (inv_3_0<Ref> x@229@01 y@230@01 z@231@01) xs4@40@01)
          (not (Set_in (inv_3_0<Ref> x@229@01 y@230@01 z@231@01) xs4@40@01)))
        (=>
          (Set_in (inv_4_0<Ref> x@229@01 y@230@01 z@231@01) xs5@41@01)
          (and
            (Set_in (inv_4_0<Ref> x@229@01 y@230@01 z@231@01) xs5@41@01)
            (=>
              (Set_in (inv_4_1<Ref> x@229@01 y@230@01 z@231@01) ys5@52@01)
              (and
                (Set_in (inv_4_1<Ref> x@229@01 y@230@01 z@231@01) ys5@52@01)
                (or
                  (Set_in (inv_4_2<Ref> x@229@01 y@230@01 z@231@01) zs5@63@01)
                  (not
                    (Set_in (inv_4_2<Ref> x@229@01 y@230@01 z@231@01) zs5@63@01)))))
            (or
              (Set_in (inv_4_1<Ref> x@229@01 y@230@01 z@231@01) ys5@52@01)
              (not (Set_in (inv_4_1<Ref> x@229@01 y@230@01 z@231@01) ys5@52@01)))))
        (or
          (Set_in (inv_4_0<Ref> x@229@01 y@230@01 z@231@01) xs5@41@01)
          (not (Set_in (inv_4_0<Ref> x@229@01 y@230@01 z@231@01) xs5@41@01)))
        (=>
          (Set_in (inv_5_0<Ref> x@229@01 y@230@01 z@231@01) xs6@42@01)
          (and
            (Set_in (inv_5_0<Ref> x@229@01 y@230@01 z@231@01) xs6@42@01)
            (=>
              (Set_in (inv_5_1<Ref> x@229@01 y@230@01 z@231@01) ys6@53@01)
              (and
                (Set_in (inv_5_1<Ref> x@229@01 y@230@01 z@231@01) ys6@53@01)
                (or
                  (Set_in (inv_5_2<Ref> x@229@01 y@230@01 z@231@01) zs6@64@01)
                  (not
                    (Set_in (inv_5_2<Ref> x@229@01 y@230@01 z@231@01) zs6@64@01)))))
            (or
              (Set_in (inv_5_1<Ref> x@229@01 y@230@01 z@231@01) ys6@53@01)
              (not (Set_in (inv_5_1<Ref> x@229@01 y@230@01 z@231@01) ys6@53@01)))))
        (or
          (Set_in (inv_5_0<Ref> x@229@01 y@230@01 z@231@01) xs6@42@01)
          (not (Set_in (inv_5_0<Ref> x@229@01 y@230@01 z@231@01) xs6@42@01)))
        (=>
          (Set_in (inv_6_0<Ref> x@229@01 y@230@01 z@231@01) xs7@43@01)
          (and
            (Set_in (inv_6_0<Ref> x@229@01 y@230@01 z@231@01) xs7@43@01)
            (=>
              (Set_in (inv_6_1<Ref> x@229@01 y@230@01 z@231@01) ys7@54@01)
              (and
                (Set_in (inv_6_1<Ref> x@229@01 y@230@01 z@231@01) ys7@54@01)
                (or
                  (Set_in (inv_6_2<Ref> x@229@01 y@230@01 z@231@01) zs7@65@01)
                  (not
                    (Set_in (inv_6_2<Ref> x@229@01 y@230@01 z@231@01) zs7@65@01)))))
            (or
              (Set_in (inv_6_1<Ref> x@229@01 y@230@01 z@231@01) ys7@54@01)
              (not (Set_in (inv_6_1<Ref> x@229@01 y@230@01 z@231@01) ys7@54@01)))))
        (or
          (Set_in (inv_6_0<Ref> x@229@01 y@230@01 z@231@01) xs7@43@01)
          (not (Set_in (inv_6_0<Ref> x@229@01 y@230@01 z@231@01) xs7@43@01)))
        (=>
          (Set_in (inv_7_0<Ref> x@229@01 y@230@01 z@231@01) xs8@44@01)
          (and
            (Set_in (inv_7_0<Ref> x@229@01 y@230@01 z@231@01) xs8@44@01)
            (=>
              (Set_in (inv_7_1<Ref> x@229@01 y@230@01 z@231@01) ys8@55@01)
              (and
                (Set_in (inv_7_1<Ref> x@229@01 y@230@01 z@231@01) ys8@55@01)
                (or
                  (Set_in (inv_7_2<Ref> x@229@01 y@230@01 z@231@01) zs8@66@01)
                  (not
                    (Set_in (inv_7_2<Ref> x@229@01 y@230@01 z@231@01) zs8@66@01)))))
            (or
              (Set_in (inv_7_1<Ref> x@229@01 y@230@01 z@231@01) ys8@55@01)
              (not (Set_in (inv_7_1<Ref> x@229@01 y@230@01 z@231@01) ys8@55@01)))))
        (or
          (Set_in (inv_7_0<Ref> x@229@01 y@230@01 z@231@01) xs8@44@01)
          (not (Set_in (inv_7_0<Ref> x@229@01 y@230@01 z@231@01) xs8@44@01)))
        (=>
          (Set_in (inv_8_0<Ref> x@229@01 y@230@01 z@231@01) xs9@45@01)
          (and
            (Set_in (inv_8_0<Ref> x@229@01 y@230@01 z@231@01) xs9@45@01)
            (=>
              (Set_in (inv_8_1<Ref> x@229@01 y@230@01 z@231@01) ys9@56@01)
              (and
                (Set_in (inv_8_1<Ref> x@229@01 y@230@01 z@231@01) ys9@56@01)
                (or
                  (Set_in (inv_8_2<Ref> x@229@01 y@230@01 z@231@01) zs9@67@01)
                  (not
                    (Set_in (inv_8_2<Ref> x@229@01 y@230@01 z@231@01) zs9@67@01)))))
            (or
              (Set_in (inv_8_1<Ref> x@229@01 y@230@01 z@231@01) ys9@56@01)
              (not (Set_in (inv_8_1<Ref> x@229@01 y@230@01 z@231@01) ys9@56@01)))))
        (or
          (Set_in (inv_8_0<Ref> x@229@01 y@230@01 z@231@01) xs9@45@01)
          (not (Set_in (inv_8_0<Ref> x@229@01 y@230@01 z@231@01) xs9@45@01)))
        (=>
          (Set_in (inv_9_0<Ref> x@229@01 y@230@01 z@231@01) xs10@46@01)
          (and
            (Set_in (inv_9_0<Ref> x@229@01 y@230@01 z@231@01) xs10@46@01)
            (=>
              (Set_in (inv_9_1<Ref> x@229@01 y@230@01 z@231@01) ys10@57@01)
              (and
                (Set_in (inv_9_1<Ref> x@229@01 y@230@01 z@231@01) ys10@57@01)
                (or
                  (Set_in (inv_9_2<Ref> x@229@01 y@230@01 z@231@01) zs10@68@01)
                  (not
                    (Set_in (inv_9_2<Ref> x@229@01 y@230@01 z@231@01) zs10@68@01)))))
            (or
              (Set_in (inv_9_1<Ref> x@229@01 y@230@01 z@231@01) ys10@57@01)
              (not (Set_in (inv_9_1<Ref> x@229@01 y@230@01 z@231@01) ys10@57@01)))))
        (or
          (Set_in (inv_9_0<Ref> x@229@01 y@230@01 z@231@01) xs10@46@01)
          (not (Set_in (inv_9_0<Ref> x@229@01 y@230@01 z@231@01) xs10@46@01)))))
    (or
      (not
        (and
          (Set_in (inv_10_0<Ref> x@229@01 y@230@01 z@231@01) xs11@47@01)
          (and
            (Set_in (inv_10_1<Ref> x@229@01 y@230@01 z@231@01) ys11@58@01)
            (Set_in (inv_10_2<Ref> x@229@01 y@230@01 z@231@01) zs11@69@01))))
      (and
        (Set_in (inv_10_0<Ref> x@229@01 y@230@01 z@231@01) xs11@47@01)
        (and
          (Set_in (inv_10_1<Ref> x@229@01 y@230@01 z@231@01) ys11@58@01)
          (Set_in (inv_10_2<Ref> x@229@01 y@230@01 z@231@01) zs11@69@01)))))
  :pattern ((inv_10_0<Ref> x@229@01 y@230@01 z@231@01) (inv_10_1<Ref> x@229@01 y@230@01 z@231@01) (inv_10_2<Ref> x@229@01 y@230@01 z@231@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@30@9@30@137-aux|)))
(assert (forall ((x@229@01 $Ref) (y@230@01 $Ref) (z@231@01 $Ref)) (!
  (=>
    (and
      (Set_in (inv_10_0<Ref> x@229@01 y@230@01 z@231@01) xs11@47@01)
      (and
        (Set_in (inv_10_1<Ref> x@229@01 y@230@01 z@231@01) ys11@58@01)
        (Set_in (inv_10_2<Ref> x@229@01 y@230@01 z@231@01) zs11@69@01)))
    (>=
      ($PSF.perm_p (as pm@232@01  $PPM) ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap x@229@01)
          ($SortWrappers.$RefTo$Snap y@230@01))
        ($SortWrappers.$RefTo$Snap z@231@01)))
      (__iar__assume_helper_10<Perm> (and
        (Set_in (inv_0_0<Ref> x@229@01 y@230@01 z@231@01) xs1@37@01)
        (and
          (Set_in (inv_0_1<Ref> x@229@01 y@230@01 z@231@01) ys1@48@01)
          (Set_in (inv_0_2<Ref> x@229@01 y@230@01 z@231@01) zs1@59@01))) (and
        (Set_in (inv_1_0<Ref> x@229@01 y@230@01 z@231@01) xs2@38@01)
        (and
          (Set_in (inv_1_1<Ref> x@229@01 y@230@01 z@231@01) ys2@49@01)
          (Set_in (inv_1_2<Ref> x@229@01 y@230@01 z@231@01) zs2@60@01))) (and
        (Set_in (inv_2_0<Ref> x@229@01 y@230@01 z@231@01) xs3@39@01)
        (and
          (Set_in (inv_2_1<Ref> x@229@01 y@230@01 z@231@01) ys3@50@01)
          (Set_in (inv_2_2<Ref> x@229@01 y@230@01 z@231@01) zs3@61@01))) (and
        (Set_in (inv_3_0<Ref> x@229@01 y@230@01 z@231@01) xs4@40@01)
        (and
          (Set_in (inv_3_1<Ref> x@229@01 y@230@01 z@231@01) ys4@51@01)
          (Set_in (inv_3_2<Ref> x@229@01 y@230@01 z@231@01) zs4@62@01))) (and
        (Set_in (inv_4_0<Ref> x@229@01 y@230@01 z@231@01) xs5@41@01)
        (and
          (Set_in (inv_4_1<Ref> x@229@01 y@230@01 z@231@01) ys5@52@01)
          (Set_in (inv_4_2<Ref> x@229@01 y@230@01 z@231@01) zs5@63@01))) (and
        (Set_in (inv_5_0<Ref> x@229@01 y@230@01 z@231@01) xs6@42@01)
        (and
          (Set_in (inv_5_1<Ref> x@229@01 y@230@01 z@231@01) ys6@53@01)
          (Set_in (inv_5_2<Ref> x@229@01 y@230@01 z@231@01) zs6@64@01))) (and
        (Set_in (inv_6_0<Ref> x@229@01 y@230@01 z@231@01) xs7@43@01)
        (and
          (Set_in (inv_6_1<Ref> x@229@01 y@230@01 z@231@01) ys7@54@01)
          (Set_in (inv_6_2<Ref> x@229@01 y@230@01 z@231@01) zs7@65@01))) (and
        (Set_in (inv_7_0<Ref> x@229@01 y@230@01 z@231@01) xs8@44@01)
        (and
          (Set_in (inv_7_1<Ref> x@229@01 y@230@01 z@231@01) ys8@55@01)
          (Set_in (inv_7_2<Ref> x@229@01 y@230@01 z@231@01) zs8@66@01))) (and
        (Set_in (inv_8_0<Ref> x@229@01 y@230@01 z@231@01) xs9@45@01)
        (and
          (Set_in (inv_8_1<Ref> x@229@01 y@230@01 z@231@01) ys9@56@01)
          (Set_in (inv_8_2<Ref> x@229@01 y@230@01 z@231@01) zs9@67@01))) (and
        (Set_in (inv_9_0<Ref> x@229@01 y@230@01 z@231@01) xs10@46@01)
        (and
          (Set_in (inv_9_1<Ref> x@229@01 y@230@01 z@231@01) ys10@57@01)
          (Set_in (inv_9_2<Ref> x@229@01 y@230@01 z@231@01) zs10@68@01))) q@73@01 q@73@01 q@73@01 q@73@01 q@73@01 q@73@01 q@73@01 q@73@01 q@73@01 q@73@01 q@73@01)))
  :pattern ((inv_10_0<Ref> x@229@01 y@230@01 z@231@01) (inv_10_1<Ref> x@229@01 y@230@01 z@231@01) (inv_10_2<Ref> x@229@01 y@230@01 z@231@01))
  :qid |prog./silicon/silver/src/test/resources/all/impure_assume/assume10QPpred.vpr@30@9@30@137|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (a in xs1)
(declare-const $t@233@01 $Snap)
(assert (= $t@233@01 $Snap.unit))
; [eval] (a in xs1)
(assert (Set_in a@74@01 xs1@37@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (b in ys1)
(declare-const $t@234@01 $Snap)
(assert (= $t@234@01 $Snap.unit))
; [eval] (b in ys1)
(assert (Set_in b@75@01 ys1@48@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (c in zs1)
(declare-const $t@235@01 $Snap)
(assert (= $t@235@01 $Snap.unit))
; [eval] (c in zs1)
(assert (Set_in c@76@01 zs1@59@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (a in xs2)
(declare-const $t@236@01 $Snap)
(assert (= $t@236@01 $Snap.unit))
; [eval] (a in xs2)
(assert (Set_in a@74@01 xs2@38@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (b in ys2)
(declare-const $t@237@01 $Snap)
(assert (= $t@237@01 $Snap.unit))
; [eval] (b in ys2)
(assert (Set_in b@75@01 ys2@49@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (c in zs2)
(declare-const $t@238@01 $Snap)
(assert (= $t@238@01 $Snap.unit))
; [eval] (c in zs2)
(assert (Set_in c@76@01 zs2@60@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; assert acc(p(a, b, c), q)
; Definitional axioms for snapshot map values
(assert ($PSF.loc_p ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap a@74@01)
    ($SortWrappers.$RefTo$Snap b@75@01))
  ($SortWrappers.$RefTo$Snap c@76@01))) ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap a@74@01)
    ($SortWrappers.$RefTo$Snap b@75@01))
  ($SortWrappers.$RefTo$Snap c@76@01))))
; Precomputing data for removing quantified permissions
(define-fun pTaken@239@01 ((x $Ref) (y $Ref) (z $Ref)) $Perm
  (ite
    (and (= x a@74@01) (= y b@75@01) (= z c@76@01))
    ($Perm.min
      (ite
        (and
          (and (img@83@01 x y z) (img@85@01 x y z) (img@87@01 x y z))
          (and
            (Set_in (inv@82@01 x y z) xs@70@01)
            (and
              (Set_in (inv@84@01 x y z) ys@71@01)
              (Set_in (inv@86@01 x y z) zs@72@01))))
        q@73@01
        $Perm.No)
      q@73@01)
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
(assert (not (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (=
    (-
      (ite
        (and
          (and (img@83@01 x y z) (img@85@01 x y z) (img@87@01 x y z))
          (and
            (Set_in (inv@82@01 x y z) xs@70@01)
            (and
              (Set_in (inv@84@01 x y z) ys@71@01)
              (Set_in (inv@86@01 x y z) zs@72@01))))
        q@73@01
        $Perm.No)
      (pTaken@239@01 x y z))
    $Perm.No)
  
  :qid |quant-u-4|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((x $Ref) (y $Ref) (z $Ref)) (!
  (=>
    (and (= x a@74@01) (= y b@75@01) (= z c@76@01))
    (= (- q@73@01 (pTaken@239@01 x y z)) $Perm.No))
  
  :qid |quant-u-5|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite
    (and
      (and
        (img@83@01 a@74@01 b@75@01 c@76@01)
        (img@85@01 a@74@01 b@75@01 c@76@01)
        (img@87@01 a@74@01 b@75@01 c@76@01))
      (and
        (Set_in (inv@82@01 a@74@01 b@75@01 c@76@01) xs@70@01)
        (and
          (Set_in (inv@84@01 a@74@01 b@75@01 c@76@01) ys@71@01)
          (Set_in (inv@86@01 a@74@01 b@75@01 c@76@01) zs@72@01))))
    (< $Perm.No q@73@01)
    false)
  (and
    (not
      (=
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap a@74@01)
            ($SortWrappers.$RefTo$Snap b@75@01))
          ($SortWrappers.$RefTo$Snap c@76@01))
        $Snap.unit))
    (=
      ($PSF.lookup_p (as sm@88@01  $PSF<p>) ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap a@74@01)
          ($SortWrappers.$RefTo$Snap b@75@01))
        ($SortWrappers.$RefTo$Snap c@76@01)))
      ($PSF.lookup_p $t@81@01 ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap a@74@01)
          ($SortWrappers.$RefTo$Snap b@75@01))
        ($SortWrappers.$RefTo$Snap c@76@01)))))))
(assert ($PSF.loc_p ($PSF.lookup_p $t@81@01 ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap a@74@01)
    ($SortWrappers.$RefTo$Snap b@75@01))
  ($SortWrappers.$RefTo$Snap c@76@01))) ($Snap.combine
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap a@74@01)
    ($SortWrappers.$RefTo$Snap b@75@01))
  ($SortWrappers.$RefTo$Snap c@76@01))))
; [exec]
; assert q > none ==> false
; [eval] q > none ==> false
; [eval] q > none
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (> q@73@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 420 | q@73@01 > Z | dead]
; [else-branch: 420 | !(q@73@01 > Z) | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 420 | !(q@73@01 > Z)]
(assert (not (> q@73@01 $Perm.No)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (not (> q@73@01 $Perm.No)))
(pop) ; 2
(pop) ; 1
