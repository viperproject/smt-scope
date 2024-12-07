(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:58:02
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0695.vpr
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
(declare-sort Set<$Perm> 0)
(declare-sort Set<Int> 0)
(declare-sort Set<Map<$Ref~_$Perm>> 0)
(declare-sort Map<Int~_Map<$Ref~_$Perm>> 0)
(declare-sort Map<$Ref~_$Perm> 0)
(declare-sort $PSF<lft_T> 0)
(declare-sort $PSF<lft_List> 0)
(declare-sort $PSF<P> 0)
(declare-sort $MWSF 0)
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
(declare-fun $SortWrappers.Set<$Perm>To$Snap (Set<$Perm>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<$Perm> ($Snap) Set<$Perm>)
(assert (forall ((x Set<$Perm>)) (!
    (= x ($SortWrappers.$SnapToSet<$Perm>($SortWrappers.Set<$Perm>To$Snap x)))
    :pattern (($SortWrappers.Set<$Perm>To$Snap x))
    :qid |$Snap.$SnapToSet<$Perm>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<$Perm>To$Snap($SortWrappers.$SnapToSet<$Perm> x)))
    :pattern (($SortWrappers.$SnapToSet<$Perm> x))
    :qid |$Snap.Set<$Perm>To$SnapToSet<$Perm>|
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
(declare-fun $SortWrappers.Set<Map<$Ref~_$Perm>>To$Snap (Set<Map<$Ref~_$Perm>>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<Map<$Ref~_$Perm>> ($Snap) Set<Map<$Ref~_$Perm>>)
(assert (forall ((x Set<Map<$Ref~_$Perm>>)) (!
    (= x ($SortWrappers.$SnapToSet<Map<$Ref~_$Perm>>($SortWrappers.Set<Map<$Ref~_$Perm>>To$Snap x)))
    :pattern (($SortWrappers.Set<Map<$Ref~_$Perm>>To$Snap x))
    :qid |$Snap.$SnapToSet<Map<$Ref~_$Perm>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<Map<$Ref~_$Perm>>To$Snap($SortWrappers.$SnapToSet<Map<$Ref~_$Perm>> x)))
    :pattern (($SortWrappers.$SnapToSet<Map<$Ref~_$Perm>> x))
    :qid |$Snap.Set<Map<$Ref~_$Perm>>To$SnapToSet<Map<$Ref~_$Perm>>|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.Map<Int~_Map<$Ref~_$Perm>>To$Snap (Map<Int~_Map<$Ref~_$Perm>>) $Snap)
(declare-fun $SortWrappers.$SnapToMap<Int~_Map<$Ref~_$Perm>> ($Snap) Map<Int~_Map<$Ref~_$Perm>>)
(assert (forall ((x Map<Int~_Map<$Ref~_$Perm>>)) (!
    (= x ($SortWrappers.$SnapToMap<Int~_Map<$Ref~_$Perm>>($SortWrappers.Map<Int~_Map<$Ref~_$Perm>>To$Snap x)))
    :pattern (($SortWrappers.Map<Int~_Map<$Ref~_$Perm>>To$Snap x))
    :qid |$Snap.$SnapToMap<Int~_Map<$Ref~_$Perm>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Map<Int~_Map<$Ref~_$Perm>>To$Snap($SortWrappers.$SnapToMap<Int~_Map<$Ref~_$Perm>> x)))
    :pattern (($SortWrappers.$SnapToMap<Int~_Map<$Ref~_$Perm>> x))
    :qid |$Snap.Map<Int~_Map<$Ref~_$Perm>>To$SnapToMap<Int~_Map<$Ref~_$Perm>>|
    )))
(declare-fun $SortWrappers.Map<$Ref~_$Perm>To$Snap (Map<$Ref~_$Perm>) $Snap)
(declare-fun $SortWrappers.$SnapToMap<$Ref~_$Perm> ($Snap) Map<$Ref~_$Perm>)
(assert (forall ((x Map<$Ref~_$Perm>)) (!
    (= x ($SortWrappers.$SnapToMap<$Ref~_$Perm>($SortWrappers.Map<$Ref~_$Perm>To$Snap x)))
    :pattern (($SortWrappers.Map<$Ref~_$Perm>To$Snap x))
    :qid |$Snap.$SnapToMap<$Ref~_$Perm>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Map<$Ref~_$Perm>To$Snap($SortWrappers.$SnapToMap<$Ref~_$Perm> x)))
    :pattern (($SortWrappers.$SnapToMap<$Ref~_$Perm> x))
    :qid |$Snap.Map<$Ref~_$Perm>To$SnapToMap<$Ref~_$Perm>|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.$PSF<lft_T>To$Snap ($PSF<lft_T>) $Snap)
(declare-fun $SortWrappers.$SnapTo$PSF<lft_T> ($Snap) $PSF<lft_T>)
(assert (forall ((x $PSF<lft_T>)) (!
    (= x ($SortWrappers.$SnapTo$PSF<lft_T>($SortWrappers.$PSF<lft_T>To$Snap x)))
    :pattern (($SortWrappers.$PSF<lft_T>To$Snap x))
    :qid |$Snap.$SnapTo$PSF<lft_T>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$PSF<lft_T>To$Snap($SortWrappers.$SnapTo$PSF<lft_T> x)))
    :pattern (($SortWrappers.$SnapTo$PSF<lft_T> x))
    :qid |$Snap.$PSF<lft_T>To$SnapTo$PSF<lft_T>|
    )))
(declare-fun $SortWrappers.$PSF<lft_List>To$Snap ($PSF<lft_List>) $Snap)
(declare-fun $SortWrappers.$SnapTo$PSF<lft_List> ($Snap) $PSF<lft_List>)
(assert (forall ((x $PSF<lft_List>)) (!
    (= x ($SortWrappers.$SnapTo$PSF<lft_List>($SortWrappers.$PSF<lft_List>To$Snap x)))
    :pattern (($SortWrappers.$PSF<lft_List>To$Snap x))
    :qid |$Snap.$SnapTo$PSF<lft_List>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$PSF<lft_List>To$Snap($SortWrappers.$SnapTo$PSF<lft_List> x)))
    :pattern (($SortWrappers.$SnapTo$PSF<lft_List> x))
    :qid |$Snap.$PSF<lft_List>To$SnapTo$PSF<lft_List>|
    )))
(declare-fun $SortWrappers.$PSF<P>To$Snap ($PSF<P>) $Snap)
(declare-fun $SortWrappers.$SnapTo$PSF<P> ($Snap) $PSF<P>)
(assert (forall ((x $PSF<P>)) (!
    (= x ($SortWrappers.$SnapTo$PSF<P>($SortWrappers.$PSF<P>To$Snap x)))
    :pattern (($SortWrappers.$PSF<P>To$Snap x))
    :qid |$Snap.$SnapTo$PSF<P>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$PSF<P>To$Snap($SortWrappers.$SnapTo$PSF<P> x)))
    :pattern (($SortWrappers.$SnapTo$PSF<P> x))
    :qid |$Snap.$PSF<P>To$SnapTo$PSF<P>|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.$MWSFTo$Snap ($MWSF) $Snap)
(declare-fun $SortWrappers.$SnapTo$MWSF ($Snap) $MWSF)
(assert (forall ((x $MWSF)) (!
    (= x ($SortWrappers.$SnapTo$MWSF($SortWrappers.$MWSFTo$Snap x)))
    :pattern (($SortWrappers.$MWSFTo$Snap x))
    :qid |$Snap.$SnapTo$MWSFTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$MWSFTo$Snap($SortWrappers.$SnapTo$MWSF x)))
    :pattern (($SortWrappers.$SnapTo$MWSF x))
    :qid |$Snap.$MWSFTo$SnapTo$MWSF|
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
(declare-fun Set_card (Set<$Perm>) Int)
(declare-const Set_empty Set<$Perm>)
(declare-fun Set_in ($Perm Set<$Perm>) Bool)
(declare-fun Set_singleton ($Perm) Set<$Perm>)
(declare-fun Set_unionone (Set<$Perm> $Perm) Set<$Perm>)
(declare-fun Set_union (Set<$Perm> Set<$Perm>) Set<$Perm>)
(declare-fun Set_intersection (Set<$Perm> Set<$Perm>) Set<$Perm>)
(declare-fun Set_difference (Set<$Perm> Set<$Perm>) Set<$Perm>)
(declare-fun Set_subset (Set<$Perm> Set<$Perm>) Bool)
(declare-fun Set_equal (Set<$Perm> Set<$Perm>) Bool)
(declare-fun Set_skolem_diff (Set<$Perm> Set<$Perm>) $Perm)
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
(declare-fun Set_card (Set<Map<$Ref~_$Perm>>) Int)
(declare-const Set_empty Set<Map<$Ref~_$Perm>>)
(declare-fun Set_in (Map<$Ref~_$Perm> Set<Map<$Ref~_$Perm>>) Bool)
(declare-fun Set_singleton (Map<$Ref~_$Perm>) Set<Map<$Ref~_$Perm>>)
(declare-fun Set_unionone (Set<Map<$Ref~_$Perm>> Map<$Ref~_$Perm>) Set<Map<$Ref~_$Perm>>)
(declare-fun Set_union (Set<Map<$Ref~_$Perm>> Set<Map<$Ref~_$Perm>>) Set<Map<$Ref~_$Perm>>)
(declare-fun Set_intersection (Set<Map<$Ref~_$Perm>> Set<Map<$Ref~_$Perm>>) Set<Map<$Ref~_$Perm>>)
(declare-fun Set_difference (Set<Map<$Ref~_$Perm>> Set<Map<$Ref~_$Perm>>) Set<Map<$Ref~_$Perm>>)
(declare-fun Set_subset (Set<Map<$Ref~_$Perm>> Set<Map<$Ref~_$Perm>>) Bool)
(declare-fun Set_equal (Set<Map<$Ref~_$Perm>> Set<Map<$Ref~_$Perm>>) Bool)
(declare-fun Set_skolem_diff (Set<Map<$Ref~_$Perm>> Set<Map<$Ref~_$Perm>>) Map<$Ref~_$Perm>)
(declare-fun Map_apply (Map<Int~_Map<$Ref~_$Perm>> Int) Map<$Ref~_$Perm>)
(declare-fun Map_card (Map<Int~_Map<$Ref~_$Perm>>) Int)
(declare-fun Map_disjoint (Map<Int~_Map<$Ref~_$Perm>> Map<Int~_Map<$Ref~_$Perm>>) Bool)
(declare-fun Map_domain (Map<Int~_Map<$Ref~_$Perm>>) Set<Int>)
(declare-const Map_empty Map<Int~_Map<$Ref~_$Perm>>)
(declare-fun Map_equal (Map<Int~_Map<$Ref~_$Perm>> Map<Int~_Map<$Ref~_$Perm>>) Bool)
(declare-fun Map_update (Map<Int~_Map<$Ref~_$Perm>> Int Map<$Ref~_$Perm>) Map<Int~_Map<$Ref~_$Perm>>)
(declare-fun Map_values (Map<Int~_Map<$Ref~_$Perm>>) Set<Map<$Ref~_$Perm>>)
(declare-fun Map_range_domain_skolem (Map<Int~_Map<$Ref~_$Perm>> Map<$Ref~_$Perm>) Int)
(declare-fun Map_apply (Map<$Ref~_$Perm> $Ref) $Perm)
(declare-fun Map_card (Map<$Ref~_$Perm>) Int)
(declare-fun Map_disjoint (Map<$Ref~_$Perm> Map<$Ref~_$Perm>) Bool)
(declare-fun Map_domain (Map<$Ref~_$Perm>) Set<$Ref>)
(declare-const Map_empty Map<$Ref~_$Perm>)
(declare-fun Map_equal (Map<$Ref~_$Perm> Map<$Ref~_$Perm>) Bool)
(declare-fun Map_update (Map<$Ref~_$Perm> $Ref $Perm) Map<$Ref~_$Perm>)
(declare-fun Map_values (Map<$Ref~_$Perm>) Set<$Perm>)
(declare-fun Map_range_domain_skolem (Map<$Ref~_$Perm> $Perm) $Ref)
; /predicate_snap_functions_declarations.smt2 [lft_T: Snap]
(declare-fun $PSF.domain_lft_T ($PSF<lft_T>) Set<$Snap>)
(declare-fun $PSF.lookup_lft_T ($PSF<lft_T> $Snap) $Snap)
(declare-fun $PSF.after_lft_T ($PSF<lft_T> $PSF<lft_T>) Bool)
(declare-fun $PSF.loc_lft_T ($Snap $Snap) Bool)
(declare-fun $PSF.perm_lft_T ($PPM $Snap) $Perm)
(declare-const $psfTOP_lft_T $PSF<lft_T>)
; /predicate_snap_functions_declarations.smt2 [lft_List: Snap]
(declare-fun $PSF.domain_lft_List ($PSF<lft_List>) Set<$Snap>)
(declare-fun $PSF.lookup_lft_List ($PSF<lft_List> $Snap) $Snap)
(declare-fun $PSF.after_lft_List ($PSF<lft_List> $PSF<lft_List>) Bool)
(declare-fun $PSF.loc_lft_List ($Snap $Snap) Bool)
(declare-fun $PSF.perm_lft_List ($PPM $Snap) $Perm)
(declare-const $psfTOP_lft_List $PSF<lft_List>)
; /predicate_snap_functions_declarations.smt2 [P: Snap]
(declare-fun $PSF.domain_P ($PSF<P>) Set<$Snap>)
(declare-fun $PSF.lookup_P ($PSF<P> $Snap) $Snap)
(declare-fun $PSF.after_P ($PSF<P> $PSF<P>) Bool)
(declare-fun $PSF.loc_P ($Snap $Snap) Bool)
(declare-fun $PSF.perm_P ($PPM $Snap) $Perm)
(declare-const $psfTOP_P $PSF<P>)
(declare-fun MWSF_apply ($MWSF $Snap) $Snap)
; Declaring symbols related to program functions (from program analysis)
(declare-fun valid_lft ($Snap Map<Int~_Map<$Ref~_$Perm>>) Bool)
(declare-fun valid_lft%limited ($Snap Map<Int~_Map<$Ref~_$Perm>>) Bool)
(declare-fun valid_lft%stateless (Map<Int~_Map<$Ref~_$Perm>>) Bool)
(declare-fun valid_lft%precondition ($Snap Map<Int~_Map<$Ref~_$Perm>>) Bool)
(declare-fun get_disc ($Snap $Ref Map<Int~_Map<$Ref~_$Perm>>) $Ref)
(declare-fun get_disc%limited ($Snap $Ref Map<Int~_Map<$Ref~_$Perm>>) $Ref)
(declare-fun get_disc%stateless ($Ref Map<Int~_Map<$Ref~_$Perm>>) Bool)
(declare-fun get_disc%precondition ($Snap $Ref Map<Int~_Map<$Ref~_$Perm>>) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun List%trigger ($Snap $Ref) Bool)
(declare-fun Node%trigger ($Snap $Ref) Bool)
(declare-fun ListRef%trigger ($Snap $Ref Map<Int~_Map<$Ref~_$Perm>> Bool) Bool)
(declare-fun NodeRef%trigger ($Snap $Ref Map<Int~_Map<$Ref~_$Perm>> Bool) Bool)
(declare-fun lft_T%trigger ($Snap $Ref) Bool)
(declare-fun lft_List%trigger ($Snap $Ref) Bool)
(declare-fun LifetimeP%trigger ($Snap Map<Int~_Map<$Ref~_$Perm>>) Bool)
(declare-fun P%trigger ($Snap $Ref) Bool)
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
(assert (forall ((s Set<$Perm>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o $Perm)) (!
  (not (Set_in o (as Set_empty  Set<$Perm>)))
  :pattern ((Set_in o (as Set_empty  Set<$Perm>)))
  )))
(assert (forall ((s Set<$Perm>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<$Perm>)))
    (=> (not (= (Set_card s) 0)) (exists ((x $Perm))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r $Perm)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r $Perm) (o $Perm)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r $Perm)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<$Perm>) (x $Perm) (o $Perm)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<$Perm>) (x $Perm)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<$Perm>) (x $Perm) (y $Perm)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<$Perm>) (x $Perm)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<$Perm>) (x $Perm)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<$Perm>) (b Set<$Perm>) (o $Perm)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<$Perm>) (b Set<$Perm>) (y $Perm)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<$Perm>) (b Set<$Perm>) (y $Perm)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<$Perm>) (b Set<$Perm>) (o $Perm)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<$Perm>) (b Set<$Perm>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<$Perm>) (b Set<$Perm>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<$Perm>) (b Set<$Perm>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<$Perm>) (b Set<$Perm>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<$Perm>) (b Set<$Perm>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<$Perm>) (b Set<$Perm>) (o $Perm)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<$Perm>) (b Set<$Perm>) (y $Perm)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<$Perm>) (b Set<$Perm>)) (!
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
(assert (forall ((a Set<$Perm>) (b Set<$Perm>)) (!
  (=
    (Set_subset a b)
    (forall ((o $Perm)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<$Perm>) (b Set<$Perm>)) (!
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
(assert (forall ((a Set<$Perm>) (b Set<$Perm>)) (!
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
(assert (forall ((s Set<Map<$Ref~_$Perm>>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o Map<$Ref~_$Perm>)) (!
  (not (Set_in o (as Set_empty  Set<Map<$Ref~_$Perm>>)))
  :pattern ((Set_in o (as Set_empty  Set<Map<$Ref~_$Perm>>)))
  )))
(assert (forall ((s Set<Map<$Ref~_$Perm>>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<Map<$Ref~_$Perm>>)))
    (=> (not (= (Set_card s) 0)) (exists ((x Map<$Ref~_$Perm>))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r Map<$Ref~_$Perm>)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r Map<$Ref~_$Perm>) (o Map<$Ref~_$Perm>)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r Map<$Ref~_$Perm>)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<Map<$Ref~_$Perm>>) (x Map<$Ref~_$Perm>) (o Map<$Ref~_$Perm>)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<Map<$Ref~_$Perm>>) (x Map<$Ref~_$Perm>)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<Map<$Ref~_$Perm>>) (x Map<$Ref~_$Perm>) (y Map<$Ref~_$Perm>)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<Map<$Ref~_$Perm>>) (x Map<$Ref~_$Perm>)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Map<$Ref~_$Perm>>) (x Map<$Ref~_$Perm>)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Map<$Ref~_$Perm>>) (b Set<Map<$Ref~_$Perm>>) (o Map<$Ref~_$Perm>)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<Map<$Ref~_$Perm>>) (b Set<Map<$Ref~_$Perm>>) (y Map<$Ref~_$Perm>)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<Map<$Ref~_$Perm>>) (b Set<Map<$Ref~_$Perm>>) (y Map<$Ref~_$Perm>)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<Map<$Ref~_$Perm>>) (b Set<Map<$Ref~_$Perm>>) (o Map<$Ref~_$Perm>)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<Map<$Ref~_$Perm>>) (b Set<Map<$Ref~_$Perm>>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<Map<$Ref~_$Perm>>) (b Set<Map<$Ref~_$Perm>>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<Map<$Ref~_$Perm>>) (b Set<Map<$Ref~_$Perm>>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<Map<$Ref~_$Perm>>) (b Set<Map<$Ref~_$Perm>>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<Map<$Ref~_$Perm>>) (b Set<Map<$Ref~_$Perm>>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<Map<$Ref~_$Perm>>) (b Set<Map<$Ref~_$Perm>>) (o Map<$Ref~_$Perm>)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<Map<$Ref~_$Perm>>) (b Set<Map<$Ref~_$Perm>>) (y Map<$Ref~_$Perm>)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<Map<$Ref~_$Perm>>) (b Set<Map<$Ref~_$Perm>>)) (!
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
(assert (forall ((a Set<Map<$Ref~_$Perm>>) (b Set<Map<$Ref~_$Perm>>)) (!
  (=
    (Set_subset a b)
    (forall ((o Map<$Ref~_$Perm>)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<Map<$Ref~_$Perm>>) (b Set<Map<$Ref~_$Perm>>)) (!
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
(assert (forall ((a Set<Map<$Ref~_$Perm>>) (b Set<Map<$Ref~_$Perm>>)) (!
  (=> (Set_equal a b) (= a b))
  :pattern ((Set_equal a b))
  )))
(assert (forall ((m Map<Int~_Map<$Ref~_$Perm>>)) (!
  (<= 0 (Map_card m))
  :pattern ((Map_card m))
  )))
(assert (forall ((m Map<Int~_Map<$Ref~_$Perm>>)) (!
  (= (Set_card (Map_domain m)) (Map_card m))
  :pattern ((Set_card (Map_domain m)))
  :pattern ((Map_card m))
  )))
(assert (forall ((m1 Map<Int~_Map<$Ref~_$Perm>>) (m2 Map<Int~_Map<$Ref~_$Perm>>)) (!
  (=>
    (Map_disjoint m1 m2)
    (forall ((k Int)) (!
      (or (not (Set_in k (Map_domain m1))) (not (Set_in k (Map_domain m2))))
      :pattern ((Set_in k (Map_domain m1)))
      :pattern ((Set_in k (Map_domain m2)))
      )))
  :pattern ((Map_disjoint m1 m2))
  )))
(assert (forall ((m1 Map<Int~_Map<$Ref~_$Perm>>) (m2 Map<Int~_Map<$Ref~_$Perm>>)) (!
  (=>
    (not (Map_disjoint m1 m2))
    (exists ((k Int)) 
      (and (Set_in k (Map_domain m1)) (Set_in k (Map_domain m2)))))
  :pattern ((Map_disjoint m1 m2))
  )))
(assert (forall ((k Int)) (!
  (not (Set_in k (Map_domain (as Map_empty  Map<Int~_Map<$Ref~_$Perm>>))))
  :pattern ((Set_in k (Map_domain (as Map_empty  Map<Int~_Map<$Ref~_$Perm>>))))
  )))
(assert (forall ((m Map<Int~_Map<$Ref~_$Perm>>)) (!
  (and
    (= (= (Map_card m) 0) (= m (as Map_empty  Map<Int~_Map<$Ref~_$Perm>>)))
    (and
      (=> (not (= (Map_card m) 0)) (exists ((u Int))  (Set_in u (Map_domain m))))
      (forall ((u Int)) (!
        (=> (Set_in u (Map_domain m)) (not (= (Map_card m) 0)))
        :pattern ((Set_in u (Map_domain m)))
        ))))
  :pattern ((Map_card m))
  )))
(assert (forall ((m1 Map<Int~_Map<$Ref~_$Perm>>) (m2 Map<Int~_Map<$Ref~_$Perm>>)) (!
  (=>
    (and
      (forall ((k Int)) (!
        (= (Set_in k (Map_domain m1)) (Set_in k (Map_domain m2)))
        :pattern ((Set_in k (Map_domain m1)))
        :pattern ((Set_in k (Map_domain m2)))
        ))
      (forall ((k Int)) (!
        (=> (Set_in k (Map_domain m1)) (= (Map_apply m1 k) (Map_apply m2 k)))
        :pattern ((Map_apply m1 k))
        :pattern ((Map_apply m2 k))
        )))
    (Map_equal m1 m2))
  :pattern ((Map_equal m1 m2))
  )))
(assert (forall ((m1 Map<Int~_Map<$Ref~_$Perm>>) (m2 Map<Int~_Map<$Ref~_$Perm>>)) (!
  (=> (Map_equal m1 m2) (= m1 m2))
  :pattern ((Map_equal m1 m2))
  )))
(assert (forall ((m Map<Int~_Map<$Ref~_$Perm>>) (k1 Int) (k2 Int) (v Map<$Ref~_$Perm>)) (!
  (and
    (=>
      (= k1 k2)
      (and
        (Set_in k2 (Map_domain (Map_update m k1 v)))
        (= (Map_apply (Map_update m k1 v) k2) v)))
    (=>
      (not (= k1 k2))
      (and
        (=
          (Set_in k2 (Map_domain (Map_update m k1 v)))
          (Set_in k2 (Map_domain m)))
        (=>
          (Set_in k2 (Map_domain m))
          (= (Map_apply (Map_update m k1 v) k2) (Map_apply m k2))))))
  :pattern ((Set_in k2 (Map_domain (Map_update m k1 v))))
  :pattern ((Set_in k2 (Map_domain m)) (Map_update m k1 v))
  :pattern ((Map_apply (Map_update m k1 v) k2))
  )))
(assert (forall ((m Map<Int~_Map<$Ref~_$Perm>>) (k Int) (v Map<$Ref~_$Perm>)) (!
  (and
    (=> (Set_in k (Map_domain m)) (= (Map_card (Map_update m k v)) (Map_card m)))
    (=>
      (not (Set_in k (Map_domain m)))
      (= (Map_card (Map_update m k v)) (+ (Map_card m) 1))))
  :pattern ((Map_card (Map_update m k v)))
  :pattern ((Map_card m) (Map_update m k v))
  )))
(assert (forall ((m Map<Int~_Map<$Ref~_$Perm>>) (v Map<$Ref~_$Perm>)) (!
  (=>
    (Set_in v (Map_values m))
    (and
      (Set_in (Map_range_domain_skolem m v) (Map_domain m))
      (= v (Map_apply m (Map_range_domain_skolem m v)))))
  :pattern ((Set_in v (Map_values m)))
  )))
(assert (forall ((m Map<Int~_Map<$Ref~_$Perm>>) (k Int)) (!
  (=> (Set_in k (Map_domain m)) (> (Set_card (Map_values m)) 0))
  :pattern ((Map_apply m k))
  :pattern ((Set_in k (Map_domain m)))
  )))
(assert (forall ((m Map<Int~_Map<$Ref~_$Perm>>) (k Int)) (!
  (=> (Set_in k (Map_domain m)) (Set_in (Map_apply m k) (Map_values m)))
  :pattern ((Map_apply m k))
  )))
(assert (forall ((m Map<$Ref~_$Perm>)) (!
  (<= 0 (Map_card m))
  :pattern ((Map_card m))
  )))
(assert (forall ((m Map<$Ref~_$Perm>)) (!
  (= (Set_card (Map_domain m)) (Map_card m))
  :pattern ((Set_card (Map_domain m)))
  :pattern ((Map_card m))
  )))
(assert (forall ((m1 Map<$Ref~_$Perm>) (m2 Map<$Ref~_$Perm>)) (!
  (=>
    (Map_disjoint m1 m2)
    (forall ((k $Ref)) (!
      (or (not (Set_in k (Map_domain m1))) (not (Set_in k (Map_domain m2))))
      :pattern ((Set_in k (Map_domain m1)))
      :pattern ((Set_in k (Map_domain m2)))
      )))
  :pattern ((Map_disjoint m1 m2))
  )))
(assert (forall ((m1 Map<$Ref~_$Perm>) (m2 Map<$Ref~_$Perm>)) (!
  (=>
    (not (Map_disjoint m1 m2))
    (exists ((k $Ref)) 
      (and (Set_in k (Map_domain m1)) (Set_in k (Map_domain m2)))))
  :pattern ((Map_disjoint m1 m2))
  )))
(assert (forall ((k $Ref)) (!
  (not (Set_in k (Map_domain (as Map_empty  Map<$Ref~_$Perm>))))
  :pattern ((Set_in k (Map_domain (as Map_empty  Map<$Ref~_$Perm>))))
  )))
(assert (forall ((m Map<$Ref~_$Perm>)) (!
  (and
    (= (= (Map_card m) 0) (= m (as Map_empty  Map<$Ref~_$Perm>)))
    (and
      (=>
        (not (= (Map_card m) 0))
        (exists ((u $Ref)) 
          (Set_in u (Map_domain m))))
      (forall ((u $Ref)) (!
        (=> (Set_in u (Map_domain m)) (not (= (Map_card m) 0)))
        :pattern ((Set_in u (Map_domain m)))
        ))))
  :pattern ((Map_card m))
  )))
(assert (forall ((m1 Map<$Ref~_$Perm>) (m2 Map<$Ref~_$Perm>)) (!
  (=>
    (and
      (forall ((k $Ref)) (!
        (= (Set_in k (Map_domain m1)) (Set_in k (Map_domain m2)))
        :pattern ((Set_in k (Map_domain m1)))
        :pattern ((Set_in k (Map_domain m2)))
        ))
      (forall ((k $Ref)) (!
        (=> (Set_in k (Map_domain m1)) (= (Map_apply m1 k) (Map_apply m2 k)))
        :pattern ((Map_apply m1 k))
        :pattern ((Map_apply m2 k))
        )))
    (Map_equal m1 m2))
  :pattern ((Map_equal m1 m2))
  )))
(assert (forall ((m1 Map<$Ref~_$Perm>) (m2 Map<$Ref~_$Perm>)) (!
  (=> (Map_equal m1 m2) (= m1 m2))
  :pattern ((Map_equal m1 m2))
  )))
(assert (forall ((m Map<$Ref~_$Perm>) (k1 $Ref) (k2 $Ref) (v $Perm)) (!
  (and
    (=>
      (= k1 k2)
      (and
        (Set_in k2 (Map_domain (Map_update m k1 v)))
        (= (Map_apply (Map_update m k1 v) k2) v)))
    (=>
      (not (= k1 k2))
      (and
        (=
          (Set_in k2 (Map_domain (Map_update m k1 v)))
          (Set_in k2 (Map_domain m)))
        (=>
          (Set_in k2 (Map_domain m))
          (= (Map_apply (Map_update m k1 v) k2) (Map_apply m k2))))))
  :pattern ((Set_in k2 (Map_domain (Map_update m k1 v))))
  :pattern ((Set_in k2 (Map_domain m)) (Map_update m k1 v))
  :pattern ((Map_apply (Map_update m k1 v) k2))
  )))
(assert (forall ((m Map<$Ref~_$Perm>) (k $Ref) (v $Perm)) (!
  (and
    (=> (Set_in k (Map_domain m)) (= (Map_card (Map_update m k v)) (Map_card m)))
    (=>
      (not (Set_in k (Map_domain m)))
      (= (Map_card (Map_update m k v)) (+ (Map_card m) 1))))
  :pattern ((Map_card (Map_update m k v)))
  :pattern ((Map_card m) (Map_update m k v))
  )))
(assert (forall ((m Map<$Ref~_$Perm>) (v $Perm)) (!
  (=>
    (Set_in v (Map_values m))
    (and
      (Set_in (Map_range_domain_skolem m v) (Map_domain m))
      (= v (Map_apply m (Map_range_domain_skolem m v)))))
  :pattern ((Set_in v (Map_values m)))
  )))
(assert (forall ((m Map<$Ref~_$Perm>) (k $Ref)) (!
  (=> (Set_in k (Map_domain m)) (> (Set_card (Map_values m)) 0))
  :pattern ((Map_apply m k))
  :pattern ((Set_in k (Map_domain m)))
  )))
(assert (forall ((m Map<$Ref~_$Perm>) (k $Ref)) (!
  (=> (Set_in k (Map_domain m)) (Set_in (Map_apply m k) (Map_values m)))
  :pattern ((Map_apply m k))
  )))
; /predicate_snap_functions_axioms.smt2 [lft_T: Snap]
(assert (forall ((vs $PSF<lft_T>) (ws $PSF<lft_T>)) (!
    (=>
      (and
        (Set_equal ($PSF.domain_lft_T vs) ($PSF.domain_lft_T ws))
        (forall ((x $Snap)) (!
          (=>
            (Set_in x ($PSF.domain_lft_T vs))
            (= ($PSF.lookup_lft_T vs x) ($PSF.lookup_lft_T ws x)))
          :pattern (($PSF.lookup_lft_T vs x) ($PSF.lookup_lft_T ws x))
          :qid |qp.$PSF<lft_T>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$PSF<lft_T>To$Snap vs)
              ($SortWrappers.$PSF<lft_T>To$Snap ws)
              )
    :qid |qp.$PSF<lft_T>-eq-outer|
    )))
(assert (forall ((s $Snap) (pm $PPM)) (!
    ($Perm.isValidVar ($PSF.perm_lft_T pm s))
    :pattern (($PSF.perm_lft_T pm s)))))
(assert (forall ((s $Snap) (f $Snap)) (!
    (= ($PSF.loc_lft_T f s) true)
    :pattern (($PSF.loc_lft_T f s)))))
; /predicate_snap_functions_axioms.smt2 [lft_List: Snap]
(assert (forall ((vs $PSF<lft_List>) (ws $PSF<lft_List>)) (!
    (=>
      (and
        (Set_equal ($PSF.domain_lft_List vs) ($PSF.domain_lft_List ws))
        (forall ((x $Snap)) (!
          (=>
            (Set_in x ($PSF.domain_lft_List vs))
            (= ($PSF.lookup_lft_List vs x) ($PSF.lookup_lft_List ws x)))
          :pattern (($PSF.lookup_lft_List vs x) ($PSF.lookup_lft_List ws x))
          :qid |qp.$PSF<lft_List>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$PSF<lft_List>To$Snap vs)
              ($SortWrappers.$PSF<lft_List>To$Snap ws)
              )
    :qid |qp.$PSF<lft_List>-eq-outer|
    )))
(assert (forall ((s $Snap) (pm $PPM)) (!
    ($Perm.isValidVar ($PSF.perm_lft_List pm s))
    :pattern (($PSF.perm_lft_List pm s)))))
(assert (forall ((s $Snap) (f $Snap)) (!
    (= ($PSF.loc_lft_List f s) true)
    :pattern (($PSF.loc_lft_List f s)))))
; /predicate_snap_functions_axioms.smt2 [P: Snap]
(assert (forall ((vs $PSF<P>) (ws $PSF<P>)) (!
    (=>
      (and
        (Set_equal ($PSF.domain_P vs) ($PSF.domain_P ws))
        (forall ((x $Snap)) (!
          (=>
            (Set_in x ($PSF.domain_P vs))
            (= ($PSF.lookup_P vs x) ($PSF.lookup_P ws x)))
          :pattern (($PSF.lookup_P vs x) ($PSF.lookup_P ws x))
          :qid |qp.$PSF<P>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$PSF<P>To$Snap vs)
              ($SortWrappers.$PSF<P>To$Snap ws)
              )
    :qid |qp.$PSF<P>-eq-outer|
    )))
(assert (forall ((s $Snap) (pm $PPM)) (!
    ($Perm.isValidVar ($PSF.perm_P pm s))
    :pattern (($PSF.perm_P pm s)))))
(assert (forall ((s $Snap) (f $Snap)) (!
    (= ($PSF.loc_P f s) true)
    :pattern (($PSF.loc_P f s)))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ---------- FUNCTION valid_lft----------
(declare-fun lft@0@00 () Map<Int~_Map<$Ref~_$Perm>>)
(declare-fun result@1@00 () Bool)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (lft@0@00 Map<Int~_Map<$Ref~_$Perm>>)) (!
  (= (valid_lft%limited s@$ lft@0@00) (valid_lft s@$ lft@0@00))
  :pattern ((valid_lft s@$ lft@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (lft@0@00 Map<Int~_Map<$Ref~_$Perm>>)) (!
  (valid_lft%stateless lft@0@00)
  :pattern ((valid_lft%limited s@$ lft@0@00))
  :qid |quant-u-1|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (0 in lft) && (1 in lft)
; [eval] (0 in lft)
(set-option :timeout 0)
(push) ; 2
; [then-branch: 0 | !(0 in domain(lft@0@00)) | live]
; [else-branch: 0 | 0 in domain(lft@0@00) | live]
(push) ; 3
; [then-branch: 0 | !(0 in domain(lft@0@00))]
(assert (not (Set_in 0 (Map_domain lft@0@00))))
(pop) ; 3
(push) ; 3
; [else-branch: 0 | 0 in domain(lft@0@00)]
(assert (Set_in 0 (Map_domain lft@0@00)))
; [eval] (1 in lft)
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or (Set_in 0 (Map_domain lft@0@00)) (not (Set_in 0 (Map_domain lft@0@00)))))
(assert (=
  result@1@00
  (and (Set_in 0 (Map_domain lft@0@00)) (Set_in 1 (Map_domain lft@0@00)))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (lft@0@00 Map<Int~_Map<$Ref~_$Perm>>)) (!
  (=>
    (valid_lft%precondition s@$ lft@0@00)
    (=
      (valid_lft s@$ lft@0@00)
      (and (Set_in 0 (Map_domain lft@0@00)) (Set_in 1 (Map_domain lft@0@00)))))
  :pattern ((valid_lft s@$ lft@0@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (lft@0@00 Map<Int~_Map<$Ref~_$Perm>>)) (!
  true
  :pattern ((valid_lft s@$ lft@0@00))
  :qid |quant-u-5|)))
; ---------- FUNCTION get_disc----------
(declare-fun x@2@00 () $Ref)
(declare-fun lft@3@00 () Map<Int~_Map<$Ref~_$Perm>>)
(declare-fun result@4@00 () $Ref)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] valid_lft(lft)
(push) ; 2
(assert (valid_lft%precondition $Snap.unit lft@3@00))
(pop) ; 2
; Joined path conditions
(assert (valid_lft%precondition $Snap.unit lft@3@00))
(assert (valid_lft $Snap.unit lft@3@00))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] valid_lft(lft)
(push) ; 2
(pop) ; 2
; Joined path conditions
(assert (=
  ($Snap.second ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit))
; [eval] (x in lft[1])
; [eval] lft[1]
(push) ; 2
(assert (not (Set_in 1 (Map_domain lft@3@00))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (Set_in x@2@00 (Map_domain (Map_apply lft@3@00 1))))
(assert (= ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit))
; [eval] false ==> lft[1][x] == 1 / 1
(push) ; 2
; [then-branch: 1 | False | dead]
; [else-branch: 1 | True | live]
(push) ; 3
; [else-branch: 1 | True]
(pop) ; 3
(pop) ; 2
; Joined path conditions
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@2@00 $Ref) (lft@3@00 Map<Int~_Map<$Ref~_$Perm>>)) (!
  (= (get_disc%limited s@$ x@2@00 lft@3@00) (get_disc s@$ x@2@00 lft@3@00))
  :pattern ((get_disc s@$ x@2@00 lft@3@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref) (lft@3@00 Map<Int~_Map<$Ref~_$Perm>>)) (!
  (get_disc%stateless x@2@00 lft@3@00)
  :pattern ((get_disc%limited s@$ x@2@00 lft@3@00))
  :qid |quant-u-3|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (valid_lft%precondition $Snap.unit lft@3@00))
(assert (valid_lft $Snap.unit lft@3@00))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit))
(assert (Set_in x@2@00 (Map_domain (Map_apply lft@3@00 1))))
(assert (= ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(LifetimeP(lft), write) in (unfolding acc(lft_List(x), wildcard) in x.ref))
(set-option :timeout 0)
(push) ; 2
(assert (LifetimeP%trigger ($Snap.first ($Snap.second s@$)) lft@3@00))
(assert (=
  ($Snap.first ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second s@$)))
    ($Snap.second ($Snap.first ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.first ($Snap.second s@$))) $Snap.unit))
; [eval] valid_lft(lft)
(push) ; 3
(pop) ; 3
; Joined path conditions
(assert (=
  ($Snap.second ($Snap.first ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second s@$))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.first ($Snap.second s@$)))) $Snap.unit))
; [eval] (forall x: Ref :: { (x in lft[0]) } { lft[0][x] } (x in lft[0]) ==> lft[0][x] > 0 / 1)
(declare-const x@5@00 $Ref)
(push) ; 3
; [eval] (x in lft[0]) ==> lft[0][x] > 0 / 1
; [eval] (x in lft[0])
; [eval] lft[0]
(push) ; 4
(assert (not (Set_in 0 (Map_domain lft@3@00))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
; [then-branch: 2 | x@5@00 in domain(lft@3@00[0]) | live]
; [else-branch: 2 | !(x@5@00 in domain(lft@3@00[0])) | live]
(push) ; 5
; [then-branch: 2 | x@5@00 in domain(lft@3@00[0])]
(assert (Set_in x@5@00 (Map_domain (Map_apply lft@3@00 0))))
; [eval] lft[0][x] > 0 / 1
; [eval] lft[0][x]
; [eval] lft[0]
(push) ; 6
(assert (not (Set_in 0 (Map_domain lft@3@00))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 2 | !(x@5@00 in domain(lft@3@00[0]))]
(assert (not (Set_in x@5@00 (Map_domain (Map_apply lft@3@00 0)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Set_in x@5@00 (Map_domain (Map_apply lft@3@00 0))))
  (Set_in x@5@00 (Map_domain (Map_apply lft@3@00 0)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@5@00 $Ref)) (!
  (or
    (not (Set_in x@5@00 (Map_domain (Map_apply lft@3@00 0))))
    (Set_in x@5@00 (Map_domain (Map_apply lft@3@00 0))))
  :pattern ((Set_in x@5@00 (Map_domain (Map_apply lft@3@00 0))))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0695.vpr@32@4@32@108-aux|)))
(assert (forall ((x@5@00 $Ref)) (!
  (or
    (not (Set_in x@5@00 (Map_domain (Map_apply lft@3@00 0))))
    (Set_in x@5@00 (Map_domain (Map_apply lft@3@00 0))))
  :pattern ((Map_apply (Map_apply lft@3@00 0) x@5@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0695.vpr@32@4@32@108-aux|)))
(assert (forall ((x@5@00 $Ref)) (!
  (=>
    (Set_in x@5@00 (Map_domain (Map_apply lft@3@00 0)))
    (> (Map_apply (Map_apply lft@3@00 0) x@5@00) $Perm.No))
  :pattern ((Set_in x@5@00 (Map_domain (Map_apply lft@3@00 0))))
  :pattern ((Map_apply (Map_apply lft@3@00 0) x@5@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0695.vpr@32@4@32@108|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$)))))
  $Snap.unit))
; [eval] (forall x: Ref :: { (x in lft[0]) } { lft[0][x] } (x in lft[0]) ==> lft[0][x] <= 1 / 1)
(declare-const x@6@00 $Ref)
(push) ; 3
; [eval] (x in lft[0]) ==> lft[0][x] <= 1 / 1
; [eval] (x in lft[0])
; [eval] lft[0]
(push) ; 4
(assert (not (Set_in 0 (Map_domain lft@3@00))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
; [then-branch: 3 | x@6@00 in domain(lft@3@00[0]) | live]
; [else-branch: 3 | !(x@6@00 in domain(lft@3@00[0])) | live]
(push) ; 5
; [then-branch: 3 | x@6@00 in domain(lft@3@00[0])]
(assert (Set_in x@6@00 (Map_domain (Map_apply lft@3@00 0))))
; [eval] lft[0][x] <= 1 / 1
; [eval] lft[0][x]
; [eval] lft[0]
(push) ; 6
(assert (not (Set_in 0 (Map_domain lft@3@00))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 3 | !(x@6@00 in domain(lft@3@00[0]))]
(assert (not (Set_in x@6@00 (Map_domain (Map_apply lft@3@00 0)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Set_in x@6@00 (Map_domain (Map_apply lft@3@00 0))))
  (Set_in x@6@00 (Map_domain (Map_apply lft@3@00 0)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@6@00 $Ref)) (!
  (or
    (not (Set_in x@6@00 (Map_domain (Map_apply lft@3@00 0))))
    (Set_in x@6@00 (Map_domain (Map_apply lft@3@00 0))))
  :pattern ((Set_in x@6@00 (Map_domain (Map_apply lft@3@00 0))))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0695.vpr@32@4@32@108-aux|)))
(assert (forall ((x@6@00 $Ref)) (!
  (or
    (not (Set_in x@6@00 (Map_domain (Map_apply lft@3@00 0))))
    (Set_in x@6@00 (Map_domain (Map_apply lft@3@00 0))))
  :pattern ((Map_apply (Map_apply lft@3@00 0) x@6@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0695.vpr@32@4@32@108-aux|)))
(assert (forall ((x@6@00 $Ref)) (!
  (=>
    (Set_in x@6@00 (Map_domain (Map_apply lft@3@00 0)))
    (<= (Map_apply (Map_apply lft@3@00 0) x@6@00) $Perm.Write))
  :pattern ((Set_in x@6@00 (Map_domain (Map_apply lft@3@00 0))))
  :pattern ((Map_apply (Map_apply lft@3@00 0) x@6@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0695.vpr@32@4@32@108|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$)))))))))
(declare-const x@7@00 $Ref)
(push) ; 3
; [eval] (x in lft[0])
; [eval] lft[0]
(push) ; 4
(assert (not (Set_in 0 (Map_domain lft@3@00))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Set_in x@7@00 (Map_domain (Map_apply lft@3@00 0))))
; [eval] lft[0][x]
; [eval] lft[0]
(push) ; 4
(assert (not (Set_in 0 (Map_domain lft@3@00))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@8@00 ($Snap $Ref Map<Int~_Map<$Ref~_$Perm>> $Ref) $Ref)
(declare-fun img@9@00 ($Snap $Ref Map<Int~_Map<$Ref~_$Perm>> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@7@00 $Ref)) (!
  (=>
    (Set_in x@7@00 (Map_domain (Map_apply lft@3@00 0)))
    (or
      (= (Map_apply (Map_apply lft@3@00 0) x@7@00) $Perm.No)
      (< $Perm.No (Map_apply (Map_apply lft@3@00 0) x@7@00))))
  
  :qid |quant-u-6|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@7@00 $Ref) (x2@7@00 $Ref)) (!
  (=>
    (and
      (and
        (Set_in x1@7@00 (Map_domain (Map_apply lft@3@00 0)))
        (< $Perm.No (Map_apply (Map_apply lft@3@00 0) x1@7@00)))
      (and
        (Set_in x2@7@00 (Map_domain (Map_apply lft@3@00 0)))
        (< $Perm.No (Map_apply (Map_apply lft@3@00 0) x2@7@00)))
      (= x1@7@00 x2@7@00))
    (= x1@7@00 x2@7@00))
  
  :qid |lft_T-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@7@00 $Ref)) (!
  (=>
    (and
      (Set_in x@7@00 (Map_domain (Map_apply lft@3@00 0)))
      (< $Perm.No (Map_apply (Map_apply lft@3@00 0) x@7@00)))
    (and
      (= (inv@8@00 s@$ x@2@00 lft@3@00 x@7@00) x@7@00)
      (img@9@00 s@$ x@2@00 lft@3@00 x@7@00)))
  :pattern ((Set_in x@7@00 (Map_domain (Map_apply lft@3@00 0))))
  :pattern ((Map_apply (Map_apply lft@3@00 0) x@7@00))
  :pattern ((inv@8@00 s@$ x@2@00 lft@3@00 x@7@00))
  :pattern ((img@9@00 s@$ x@2@00 lft@3@00 x@7@00))
  :qid |quant-u-7|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@9@00 s@$ x@2@00 lft@3@00 x)
      (and
        (Set_in (inv@8@00 s@$ x@2@00 lft@3@00 x) (Map_domain (Map_apply lft@3@00 0)))
        (<
          $Perm.No
          (Map_apply (Map_apply lft@3@00 0) (inv@8@00 s@$ x@2@00 lft@3@00 x)))))
    (= (inv@8@00 s@$ x@2@00 lft@3@00 x) x))
  :pattern ((inv@8@00 s@$ x@2@00 lft@3@00 x))
  :qid |lft_T-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((x@7@00 $Ref)) (!
  (<= $Perm.No (Map_apply (Map_apply lft@3@00 0) x@7@00))
  :pattern ((Set_in x@7@00 (Map_domain (Map_apply lft@3@00 0))))
  :pattern ((Map_apply (Map_apply lft@3@00 0) x@7@00))
  :pattern ((inv@8@00 s@$ x@2@00 lft@3@00 x@7@00))
  :pattern ((img@9@00 s@$ x@2@00 lft@3@00 x@7@00))
  :qid |lft_T-permAtLeastZero|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$)))))))
  $Snap.unit))
; [eval] (forall x: Ref :: { (x in lft[1]) } { lft[1][x] } (x in lft[1]) ==> lft[1][x] > 0 / 1)
(declare-const x@10@00 $Ref)
(push) ; 3
; [eval] (x in lft[1]) ==> lft[1][x] > 0 / 1
; [eval] (x in lft[1])
; [eval] lft[1]
(push) ; 4
(assert (not (Set_in 1 (Map_domain lft@3@00))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
; [then-branch: 4 | x@10@00 in domain(lft@3@00[1]) | live]
; [else-branch: 4 | !(x@10@00 in domain(lft@3@00[1])) | live]
(push) ; 5
; [then-branch: 4 | x@10@00 in domain(lft@3@00[1])]
(assert (Set_in x@10@00 (Map_domain (Map_apply lft@3@00 1))))
; [eval] lft[1][x] > 0 / 1
; [eval] lft[1][x]
; [eval] lft[1]
(push) ; 6
(assert (not (Set_in 1 (Map_domain lft@3@00))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 4 | !(x@10@00 in domain(lft@3@00[1]))]
(assert (not (Set_in x@10@00 (Map_domain (Map_apply lft@3@00 1)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Set_in x@10@00 (Map_domain (Map_apply lft@3@00 1))))
  (Set_in x@10@00 (Map_domain (Map_apply lft@3@00 1)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@10@00 $Ref)) (!
  (or
    (not (Set_in x@10@00 (Map_domain (Map_apply lft@3@00 1))))
    (Set_in x@10@00 (Map_domain (Map_apply lft@3@00 1))))
  :pattern ((Set_in x@10@00 (Map_domain (Map_apply lft@3@00 1))))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0695.vpr@33@4@33@127-aux|)))
(assert (forall ((x@10@00 $Ref)) (!
  (or
    (not (Set_in x@10@00 (Map_domain (Map_apply lft@3@00 1))))
    (Set_in x@10@00 (Map_domain (Map_apply lft@3@00 1))))
  :pattern ((Map_apply (Map_apply lft@3@00 1) x@10@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0695.vpr@33@4@33@127-aux|)))
(assert (forall ((x@10@00 $Ref)) (!
  (=>
    (Set_in x@10@00 (Map_domain (Map_apply lft@3@00 1)))
    (> (Map_apply (Map_apply lft@3@00 1) x@10@00) $Perm.No))
  :pattern ((Set_in x@10@00 (Map_domain (Map_apply lft@3@00 1))))
  :pattern ((Map_apply (Map_apply lft@3@00 1) x@10@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0695.vpr@33@4@33@127|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$))))))))
  $Snap.unit))
; [eval] (forall x: Ref :: { (x in lft[1]) } { lft[1][x] } (x in lft[1]) ==> lft[1][x] <= 1 / 1)
(declare-const x@11@00 $Ref)
(push) ; 3
; [eval] (x in lft[1]) ==> lft[1][x] <= 1 / 1
; [eval] (x in lft[1])
; [eval] lft[1]
(push) ; 4
(assert (not (Set_in 1 (Map_domain lft@3@00))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
; [then-branch: 5 | x@11@00 in domain(lft@3@00[1]) | live]
; [else-branch: 5 | !(x@11@00 in domain(lft@3@00[1])) | live]
(push) ; 5
; [then-branch: 5 | x@11@00 in domain(lft@3@00[1])]
(assert (Set_in x@11@00 (Map_domain (Map_apply lft@3@00 1))))
; [eval] lft[1][x] <= 1 / 1
; [eval] lft[1][x]
; [eval] lft[1]
(push) ; 6
(assert (not (Set_in 1 (Map_domain lft@3@00))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 5 | !(x@11@00 in domain(lft@3@00[1]))]
(assert (not (Set_in x@11@00 (Map_domain (Map_apply lft@3@00 1)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Set_in x@11@00 (Map_domain (Map_apply lft@3@00 1))))
  (Set_in x@11@00 (Map_domain (Map_apply lft@3@00 1)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@11@00 $Ref)) (!
  (or
    (not (Set_in x@11@00 (Map_domain (Map_apply lft@3@00 1))))
    (Set_in x@11@00 (Map_domain (Map_apply lft@3@00 1))))
  :pattern ((Set_in x@11@00 (Map_domain (Map_apply lft@3@00 1))))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0695.vpr@33@4@33@127-aux|)))
(assert (forall ((x@11@00 $Ref)) (!
  (or
    (not (Set_in x@11@00 (Map_domain (Map_apply lft@3@00 1))))
    (Set_in x@11@00 (Map_domain (Map_apply lft@3@00 1))))
  :pattern ((Map_apply (Map_apply lft@3@00 1) x@11@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0695.vpr@33@4@33@127-aux|)))
(assert (forall ((x@11@00 $Ref)) (!
  (=>
    (Set_in x@11@00 (Map_domain (Map_apply lft@3@00 1)))
    (<= (Map_apply (Map_apply lft@3@00 1) x@11@00) $Perm.Write))
  :pattern ((Set_in x@11@00 (Map_domain (Map_apply lft@3@00 1))))
  :pattern ((Map_apply (Map_apply lft@3@00 1) x@11@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0695.vpr@33@4@33@127|)))
(declare-const x@12@00 $Ref)
(push) ; 3
; [eval] (x in lft[1])
; [eval] lft[1]
(push) ; 4
(assert (not (Set_in 1 (Map_domain lft@3@00))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Set_in x@12@00 (Map_domain (Map_apply lft@3@00 1))))
; [eval] lft[1][x]
; [eval] lft[1]
(push) ; 4
(assert (not (Set_in 1 (Map_domain lft@3@00))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@13@00 ($Snap $Ref Map<Int~_Map<$Ref~_$Perm>> $Ref) $Ref)
(declare-fun img@14@00 ($Snap $Ref Map<Int~_Map<$Ref~_$Perm>> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@12@00 $Ref)) (!
  (=>
    (Set_in x@12@00 (Map_domain (Map_apply lft@3@00 1)))
    (or
      (= (Map_apply (Map_apply lft@3@00 1) x@12@00) $Perm.No)
      (< $Perm.No (Map_apply (Map_apply lft@3@00 1) x@12@00))))
  
  :qid |quant-u-8|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@12@00 $Ref) (x2@12@00 $Ref)) (!
  (=>
    (and
      (and
        (Set_in x1@12@00 (Map_domain (Map_apply lft@3@00 1)))
        (< $Perm.No (Map_apply (Map_apply lft@3@00 1) x1@12@00)))
      (and
        (Set_in x2@12@00 (Map_domain (Map_apply lft@3@00 1)))
        (< $Perm.No (Map_apply (Map_apply lft@3@00 1) x2@12@00)))
      (= x1@12@00 x2@12@00))
    (= x1@12@00 x2@12@00))
  
  :qid |lft_List-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@12@00 $Ref)) (!
  (=>
    (and
      (Set_in x@12@00 (Map_domain (Map_apply lft@3@00 1)))
      (< $Perm.No (Map_apply (Map_apply lft@3@00 1) x@12@00)))
    (and
      (= (inv@13@00 s@$ x@2@00 lft@3@00 x@12@00) x@12@00)
      (img@14@00 s@$ x@2@00 lft@3@00 x@12@00)))
  :pattern ((Set_in x@12@00 (Map_domain (Map_apply lft@3@00 1))))
  :pattern ((Map_apply (Map_apply lft@3@00 1) x@12@00))
  :pattern ((inv@13@00 s@$ x@2@00 lft@3@00 x@12@00))
  :pattern ((img@14@00 s@$ x@2@00 lft@3@00 x@12@00))
  :qid |quant-u-9|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@14@00 s@$ x@2@00 lft@3@00 x)
      (and
        (Set_in (inv@13@00 s@$ x@2@00 lft@3@00 x) (Map_domain (Map_apply lft@3@00 1)))
        (<
          $Perm.No
          (Map_apply (Map_apply lft@3@00 1) (inv@13@00 s@$ x@2@00 lft@3@00 x)))))
    (= (inv@13@00 s@$ x@2@00 lft@3@00 x) x))
  :pattern ((inv@13@00 s@$ x@2@00 lft@3@00 x))
  :qid |lft_List-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((x@12@00 $Ref)) (!
  (<= $Perm.No (Map_apply (Map_apply lft@3@00 1) x@12@00))
  :pattern ((Set_in x@12@00 (Map_domain (Map_apply lft@3@00 1))))
  :pattern ((Map_apply (Map_apply lft@3@00 1) x@12@00))
  :pattern ((inv@13@00 s@$ x@2@00 lft@3@00 x@12@00))
  :pattern ((img@14@00 s@$ x@2@00 lft@3@00 x@12@00))
  :qid |lft_List-permAtLeastZero|)))
; [eval] (unfolding acc(lft_List(x), wildcard) in x.ref)
(declare-const $k@15@00 $Perm)
(assert ($Perm.isReadVar $k@15@00))
(push) ; 3
(assert (not (< $Perm.No $k@15@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(declare-const $k@16@00 $Perm)
(assert ($Perm.isReadVar $k@16@00))
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@16@00
(assert (=>
  (not
    (=
      (ite
        (and
          (img@14@00 s@$ x@2@00 lft@3@00 x@2@00)
          (Set_in (inv@13@00 s@$ x@2@00 lft@3@00 x@2@00) (Map_domain (Map_apply lft@3@00 1))))
        (Map_apply (Map_apply lft@3@00 1) (inv@13@00 s@$ x@2@00 lft@3@00 x@2@00))
        $Perm.No)
      $Perm.No))
  (ite
    (and
      (img@14@00 s@$ x@2@00 lft@3@00 x@2@00)
      (Set_in (inv@13@00 s@$ x@2@00 lft@3@00 x@2@00) (Map_domain (Map_apply lft@3@00 1))))
    (<
      $k@16@00
      (Map_apply (Map_apply lft@3@00 1) (inv@13@00 s@$ x@2@00 lft@3@00 x@2@00)))
    (< $k@16@00 $Perm.No))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (= x x@2@00)
    (=
      (-
        $k@16@00
        (ite
          (= x x@2@00)
          ($Perm.min
            (ite
              (and
                (img@14@00 s@$ x@2@00 lft@3@00 x)
                (Set_in (inv@13@00 s@$ x@2@00 lft@3@00 x) (Map_domain (Map_apply lft@3@00 1))))
              (Map_apply (Map_apply lft@3@00 1) (inv@13@00 s@$ x@2@00 lft@3@00 x))
              $Perm.No)
            $k@16@00)
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-12|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@17@00 ($Snap $Ref Map<Int~_Map<$Ref~_$Perm>>) $PSF<lft_List>)
(declare-const s@18@00 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite
    (and
      (img@14@00 s@$ x@2@00 lft@3@00 x@2@00)
      (Set_in (inv@13@00 s@$ x@2@00 lft@3@00 x@2@00) (Map_domain (Map_apply lft@3@00 1))))
    (<
      $Perm.No
      (Map_apply (Map_apply lft@3@00 1) (inv@13@00 s@$ x@2@00 lft@3@00 x@2@00)))
    false)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x@2@00) $Snap.unit))
    (=
      ($PSF.lookup_lft_List (sm@17@00 s@$ x@2@00 lft@3@00) ($SortWrappers.$RefTo$Snap x@2@00))
      ($PSF.lookup_lft_List ($SortWrappers.$SnapTo$PSF<lft_List> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$))))))))) ($SortWrappers.$RefTo$Snap x@2@00))))))
(assert (lft_List%trigger ($PSF.lookup_lft_List (sm@17@00 s@$ x@2@00 lft@3@00) ($SortWrappers.$RefTo$Snap x@2@00)) x@2@00))
(assert (=
  ($PSF.lookup_lft_List (sm@17@00 s@$ x@2@00 lft@3@00) ($SortWrappers.$RefTo$Snap x@2@00))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_lft_List (sm@17@00 s@$ x@2@00 lft@3@00) ($SortWrappers.$RefTo$Snap x@2@00)))
    ($Snap.second ($PSF.lookup_lft_List (sm@17@00 s@$ x@2@00 lft@3@00) ($SortWrappers.$RefTo$Snap x@2@00))))))
(assert (<= $Perm.No $k@15@00))
(assert (<= $k@15@00 $Perm.Write))
(assert (=> (< $Perm.No $k@15@00) (not (= x@2@00 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@15@00)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@15@00)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@16@00))
(assert (and
  (=>
    (not
      (=
        (ite
          (and
            (img@14@00 s@$ x@2@00 lft@3@00 x@2@00)
            (Set_in (inv@13@00 s@$ x@2@00 lft@3@00 x@2@00) (Map_domain (Map_apply lft@3@00 1))))
          (Map_apply (Map_apply lft@3@00 1) (inv@13@00 s@$ x@2@00 lft@3@00 x@2@00))
          $Perm.No)
        $Perm.No))
    (ite
      (and
        (img@14@00 s@$ x@2@00 lft@3@00 x@2@00)
        (Set_in (inv@13@00 s@$ x@2@00 lft@3@00 x@2@00) (Map_domain (Map_apply lft@3@00 1))))
      (<
        $k@16@00
        (Map_apply (Map_apply lft@3@00 1) (inv@13@00 s@$ x@2@00 lft@3@00 x@2@00)))
      (< $k@16@00 $Perm.No)))
  (=>
    (ite
      (and
        (img@14@00 s@$ x@2@00 lft@3@00 x@2@00)
        (Set_in (inv@13@00 s@$ x@2@00 lft@3@00 x@2@00) (Map_domain (Map_apply lft@3@00 1))))
      (<
        $Perm.No
        (Map_apply (Map_apply lft@3@00 1) (inv@13@00 s@$ x@2@00 lft@3@00 x@2@00)))
      false)
    (and
      (not (= ($SortWrappers.$RefTo$Snap x@2@00) $Snap.unit))
      (=
        ($PSF.lookup_lft_List (sm@17@00 s@$ x@2@00 lft@3@00) ($SortWrappers.$RefTo$Snap x@2@00))
        ($PSF.lookup_lft_List ($SortWrappers.$SnapTo$PSF<lft_List> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$))))))))) ($SortWrappers.$RefTo$Snap x@2@00)))))
  (lft_List%trigger ($PSF.lookup_lft_List (sm@17@00 s@$ x@2@00 lft@3@00) ($SortWrappers.$RefTo$Snap x@2@00)) x@2@00)
  (=
    ($PSF.lookup_lft_List (sm@17@00 s@$ x@2@00 lft@3@00) ($SortWrappers.$RefTo$Snap x@2@00))
    ($Snap.combine
      ($Snap.first ($PSF.lookup_lft_List (sm@17@00 s@$ x@2@00 lft@3@00) ($SortWrappers.$RefTo$Snap x@2@00)))
      ($Snap.second ($PSF.lookup_lft_List (sm@17@00 s@$ x@2@00 lft@3@00) ($SortWrappers.$RefTo$Snap x@2@00)))))
  (<= $Perm.No $k@15@00)
  (<= $k@15@00 $Perm.Write)
  (=> (< $Perm.No $k@15@00) (not (= x@2@00 $Ref.null)))))
(pop) ; 2
; Joined path conditions
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@9@00 s@$ x@2@00 lft@3@00 x)
      (and
        (Set_in (inv@8@00 s@$ x@2@00 lft@3@00 x) (Map_domain (Map_apply lft@3@00 0)))
        (<
          $Perm.No
          (Map_apply (Map_apply lft@3@00 0) (inv@8@00 s@$ x@2@00 lft@3@00 x)))))
    (= (inv@8@00 s@$ x@2@00 lft@3@00 x) x))
  :pattern ((inv@8@00 s@$ x@2@00 lft@3@00 x))
  :qid |lft_T-fctOfInv|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@14@00 s@$ x@2@00 lft@3@00 x)
      (and
        (Set_in (inv@13@00 s@$ x@2@00 lft@3@00 x) (Map_domain (Map_apply lft@3@00 1)))
        (<
          $Perm.No
          (Map_apply (Map_apply lft@3@00 1) (inv@13@00 s@$ x@2@00 lft@3@00 x)))))
    (= (inv@13@00 s@$ x@2@00 lft@3@00 x) x))
  :pattern ((inv@13@00 s@$ x@2@00 lft@3@00 x))
  :qid |lft_List-fctOfInv|)))
(assert ($Perm.isReadVar $k@15@00))
(assert ($Perm.isReadVar $k@16@00))
(assert (and
  (LifetimeP%trigger ($Snap.first ($Snap.second s@$)) lft@3@00)
  (=
    ($Snap.first ($Snap.second s@$))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second s@$)))
      ($Snap.second ($Snap.first ($Snap.second s@$)))))
  (= ($Snap.first ($Snap.first ($Snap.second s@$))) $Snap.unit)
  (=
    ($Snap.second ($Snap.first ($Snap.second s@$)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second s@$))))
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$))))))
  (= ($Snap.first ($Snap.second ($Snap.first ($Snap.second s@$)))) $Snap.unit)
  (forall ((x@5@00 $Ref)) (!
    (or
      (not (Set_in x@5@00 (Map_domain (Map_apply lft@3@00 0))))
      (Set_in x@5@00 (Map_domain (Map_apply lft@3@00 0))))
    :pattern ((Set_in x@5@00 (Map_domain (Map_apply lft@3@00 0))))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0695.vpr@32@4@32@108-aux|))
  (forall ((x@5@00 $Ref)) (!
    (or
      (not (Set_in x@5@00 (Map_domain (Map_apply lft@3@00 0))))
      (Set_in x@5@00 (Map_domain (Map_apply lft@3@00 0))))
    :pattern ((Map_apply (Map_apply lft@3@00 0) x@5@00))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0695.vpr@32@4@32@108-aux|))
  (forall ((x@5@00 $Ref)) (!
    (=>
      (Set_in x@5@00 (Map_domain (Map_apply lft@3@00 0)))
      (> (Map_apply (Map_apply lft@3@00 0) x@5@00) $Perm.No))
    :pattern ((Set_in x@5@00 (Map_domain (Map_apply lft@3@00 0))))
    :pattern ((Map_apply (Map_apply lft@3@00 0) x@5@00))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0695.vpr@32@4@32@108|))
  (=
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$)))))))
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$)))))
    $Snap.unit)
  (forall ((x@6@00 $Ref)) (!
    (or
      (not (Set_in x@6@00 (Map_domain (Map_apply lft@3@00 0))))
      (Set_in x@6@00 (Map_domain (Map_apply lft@3@00 0))))
    :pattern ((Set_in x@6@00 (Map_domain (Map_apply lft@3@00 0))))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0695.vpr@32@4@32@108-aux|))
  (forall ((x@6@00 $Ref)) (!
    (or
      (not (Set_in x@6@00 (Map_domain (Map_apply lft@3@00 0))))
      (Set_in x@6@00 (Map_domain (Map_apply lft@3@00 0))))
    :pattern ((Map_apply (Map_apply lft@3@00 0) x@6@00))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0695.vpr@32@4@32@108-aux|))
  (forall ((x@6@00 $Ref)) (!
    (=>
      (Set_in x@6@00 (Map_domain (Map_apply lft@3@00 0)))
      (<= (Map_apply (Map_apply lft@3@00 0) x@6@00) $Perm.Write))
    :pattern ((Set_in x@6@00 (Map_domain (Map_apply lft@3@00 0))))
    :pattern ((Map_apply (Map_apply lft@3@00 0) x@6@00))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0695.vpr@32@4@32@108|))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$))))))))))
(assert (and
  (forall ((x@7@00 $Ref)) (!
    (=>
      (and
        (Set_in x@7@00 (Map_domain (Map_apply lft@3@00 0)))
        (< $Perm.No (Map_apply (Map_apply lft@3@00 0) x@7@00)))
      (and
        (= (inv@8@00 s@$ x@2@00 lft@3@00 x@7@00) x@7@00)
        (img@9@00 s@$ x@2@00 lft@3@00 x@7@00)))
    :pattern ((Set_in x@7@00 (Map_domain (Map_apply lft@3@00 0))))
    :pattern ((Map_apply (Map_apply lft@3@00 0) x@7@00))
    :pattern ((inv@8@00 s@$ x@2@00 lft@3@00 x@7@00))
    :pattern ((img@9@00 s@$ x@2@00 lft@3@00 x@7@00))
    :qid |quant-u-7|))
  (forall ((x@7@00 $Ref)) (!
    (<= $Perm.No (Map_apply (Map_apply lft@3@00 0) x@7@00))
    :pattern ((Set_in x@7@00 (Map_domain (Map_apply lft@3@00 0))))
    :pattern ((Map_apply (Map_apply lft@3@00 0) x@7@00))
    :pattern ((inv@8@00 s@$ x@2@00 lft@3@00 x@7@00))
    :pattern ((img@9@00 s@$ x@2@00 lft@3@00 x@7@00))
    :qid |lft_T-permAtLeastZero|))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$)))))))))
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$)))))))
    $Snap.unit)
  (forall ((x@10@00 $Ref)) (!
    (or
      (not (Set_in x@10@00 (Map_domain (Map_apply lft@3@00 1))))
      (Set_in x@10@00 (Map_domain (Map_apply lft@3@00 1))))
    :pattern ((Set_in x@10@00 (Map_domain (Map_apply lft@3@00 1))))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0695.vpr@33@4@33@127-aux|))
  (forall ((x@10@00 $Ref)) (!
    (or
      (not (Set_in x@10@00 (Map_domain (Map_apply lft@3@00 1))))
      (Set_in x@10@00 (Map_domain (Map_apply lft@3@00 1))))
    :pattern ((Map_apply (Map_apply lft@3@00 1) x@10@00))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0695.vpr@33@4@33@127-aux|))
  (forall ((x@10@00 $Ref)) (!
    (=>
      (Set_in x@10@00 (Map_domain (Map_apply lft@3@00 1)))
      (> (Map_apply (Map_apply lft@3@00 1) x@10@00) $Perm.No))
    :pattern ((Set_in x@10@00 (Map_domain (Map_apply lft@3@00 1))))
    :pattern ((Map_apply (Map_apply lft@3@00 1) x@10@00))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0695.vpr@33@4@33@127|))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$))))))))))
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$))))))))
    $Snap.unit)
  (forall ((x@11@00 $Ref)) (!
    (or
      (not (Set_in x@11@00 (Map_domain (Map_apply lft@3@00 1))))
      (Set_in x@11@00 (Map_domain (Map_apply lft@3@00 1))))
    :pattern ((Set_in x@11@00 (Map_domain (Map_apply lft@3@00 1))))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0695.vpr@33@4@33@127-aux|))
  (forall ((x@11@00 $Ref)) (!
    (or
      (not (Set_in x@11@00 (Map_domain (Map_apply lft@3@00 1))))
      (Set_in x@11@00 (Map_domain (Map_apply lft@3@00 1))))
    :pattern ((Map_apply (Map_apply lft@3@00 1) x@11@00))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0695.vpr@33@4@33@127-aux|))
  (forall ((x@11@00 $Ref)) (!
    (=>
      (Set_in x@11@00 (Map_domain (Map_apply lft@3@00 1)))
      (<= (Map_apply (Map_apply lft@3@00 1) x@11@00) $Perm.Write))
    :pattern ((Set_in x@11@00 (Map_domain (Map_apply lft@3@00 1))))
    :pattern ((Map_apply (Map_apply lft@3@00 1) x@11@00))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0695.vpr@33@4@33@127|))))
(assert (and
  (forall ((x@12@00 $Ref)) (!
    (=>
      (and
        (Set_in x@12@00 (Map_domain (Map_apply lft@3@00 1)))
        (< $Perm.No (Map_apply (Map_apply lft@3@00 1) x@12@00)))
      (and
        (= (inv@13@00 s@$ x@2@00 lft@3@00 x@12@00) x@12@00)
        (img@14@00 s@$ x@2@00 lft@3@00 x@12@00)))
    :pattern ((Set_in x@12@00 (Map_domain (Map_apply lft@3@00 1))))
    :pattern ((Map_apply (Map_apply lft@3@00 1) x@12@00))
    :pattern ((inv@13@00 s@$ x@2@00 lft@3@00 x@12@00))
    :pattern ((img@14@00 s@$ x@2@00 lft@3@00 x@12@00))
    :qid |quant-u-9|))
  (forall ((x@12@00 $Ref)) (!
    (<= $Perm.No (Map_apply (Map_apply lft@3@00 1) x@12@00))
    :pattern ((Set_in x@12@00 (Map_domain (Map_apply lft@3@00 1))))
    :pattern ((Map_apply (Map_apply lft@3@00 1) x@12@00))
    :pattern ((inv@13@00 s@$ x@2@00 lft@3@00 x@12@00))
    :pattern ((img@14@00 s@$ x@2@00 lft@3@00 x@12@00))
    :qid |lft_List-permAtLeastZero|))
  (=>
    (not
      (=
        (ite
          (and
            (img@14@00 s@$ x@2@00 lft@3@00 x@2@00)
            (Set_in (inv@13@00 s@$ x@2@00 lft@3@00 x@2@00) (Map_domain (Map_apply lft@3@00 1))))
          (Map_apply (Map_apply lft@3@00 1) (inv@13@00 s@$ x@2@00 lft@3@00 x@2@00))
          $Perm.No)
        $Perm.No))
    (ite
      (and
        (img@14@00 s@$ x@2@00 lft@3@00 x@2@00)
        (Set_in (inv@13@00 s@$ x@2@00 lft@3@00 x@2@00) (Map_domain (Map_apply lft@3@00 1))))
      (<
        $k@16@00
        (Map_apply (Map_apply lft@3@00 1) (inv@13@00 s@$ x@2@00 lft@3@00 x@2@00)))
      (< $k@16@00 $Perm.No)))
  (=>
    (ite
      (and
        (img@14@00 s@$ x@2@00 lft@3@00 x@2@00)
        (Set_in (inv@13@00 s@$ x@2@00 lft@3@00 x@2@00) (Map_domain (Map_apply lft@3@00 1))))
      (<
        $Perm.No
        (Map_apply (Map_apply lft@3@00 1) (inv@13@00 s@$ x@2@00 lft@3@00 x@2@00)))
      false)
    (and
      (not (= ($SortWrappers.$RefTo$Snap x@2@00) $Snap.unit))
      (=
        ($PSF.lookup_lft_List (sm@17@00 s@$ x@2@00 lft@3@00) ($SortWrappers.$RefTo$Snap x@2@00))
        ($PSF.lookup_lft_List ($SortWrappers.$SnapTo$PSF<lft_List> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$))))))))) ($SortWrappers.$RefTo$Snap x@2@00)))))
  (lft_List%trigger ($PSF.lookup_lft_List (sm@17@00 s@$ x@2@00 lft@3@00) ($SortWrappers.$RefTo$Snap x@2@00)) x@2@00)
  (=
    ($PSF.lookup_lft_List (sm@17@00 s@$ x@2@00 lft@3@00) ($SortWrappers.$RefTo$Snap x@2@00))
    ($Snap.combine
      ($Snap.first ($PSF.lookup_lft_List (sm@17@00 s@$ x@2@00 lft@3@00) ($SortWrappers.$RefTo$Snap x@2@00)))
      ($Snap.second ($PSF.lookup_lft_List (sm@17@00 s@$ x@2@00 lft@3@00) ($SortWrappers.$RefTo$Snap x@2@00)))))
  (<= $Perm.No $k@15@00)
  (<= $k@15@00 $Perm.Write)
  (=> (< $Perm.No $k@15@00) (not (= x@2@00 $Ref.null)))))
(assert (=
  result@4@00
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($PSF.lookup_lft_List (sm@17@00 s@$ x@2@00 lft@3@00) ($SortWrappers.$RefTo$Snap x@2@00))))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@2@00 $Ref) (lft@3@00 Map<Int~_Map<$Ref~_$Perm>>)) (!
  (and
    (forall ((x@7@00 $Ref)) (!
      (=>
        (and
          (Set_in x@7@00 (Map_domain (Map_apply lft@3@00 0)))
          (< $Perm.No (Map_apply (Map_apply lft@3@00 0) x@7@00)))
        (and
          (= (inv@8@00 s@$ x@2@00 lft@3@00 x@7@00) x@7@00)
          (img@9@00 s@$ x@2@00 lft@3@00 x@7@00)))
      :pattern ((Set_in x@7@00 (Map_domain (Map_apply lft@3@00 0))))
      :pattern ((Map_apply (Map_apply lft@3@00 0) x@7@00))
      :pattern ((inv@8@00 s@$ x@2@00 lft@3@00 x@7@00))
      :pattern ((img@9@00 s@$ x@2@00 lft@3@00 x@7@00))
      :qid |quant-u-7|))
    (forall ((x $Ref)) (!
      (=>
        (and
          (img@9@00 s@$ x@2@00 lft@3@00 x)
          (and
            (Set_in (inv@8@00 s@$ x@2@00 lft@3@00 x) (Map_domain (Map_apply lft@3@00 0)))
            (<
              $Perm.No
              (Map_apply (Map_apply lft@3@00 0) (inv@8@00 s@$ x@2@00 lft@3@00 x)))))
        (= (inv@8@00 s@$ x@2@00 lft@3@00 x) x))
      :pattern ((inv@8@00 s@$ x@2@00 lft@3@00 x))
      :qid |lft_T-fctOfInv|))
    (forall ((x@12@00 $Ref)) (!
      (=>
        (and
          (Set_in x@12@00 (Map_domain (Map_apply lft@3@00 1)))
          (< $Perm.No (Map_apply (Map_apply lft@3@00 1) x@12@00)))
        (and
          (= (inv@13@00 s@$ x@2@00 lft@3@00 x@12@00) x@12@00)
          (img@14@00 s@$ x@2@00 lft@3@00 x@12@00)))
      :pattern ((Set_in x@12@00 (Map_domain (Map_apply lft@3@00 1))))
      :pattern ((Map_apply (Map_apply lft@3@00 1) x@12@00))
      :pattern ((inv@13@00 s@$ x@2@00 lft@3@00 x@12@00))
      :pattern ((img@14@00 s@$ x@2@00 lft@3@00 x@12@00))
      :qid |quant-u-9|))
    (forall ((x $Ref)) (!
      (=>
        (and
          (img@14@00 s@$ x@2@00 lft@3@00 x)
          (and
            (Set_in (inv@13@00 s@$ x@2@00 lft@3@00 x) (Map_domain (Map_apply lft@3@00 1)))
            (<
              $Perm.No
              (Map_apply (Map_apply lft@3@00 1) (inv@13@00 s@$ x@2@00 lft@3@00 x)))))
        (= (inv@13@00 s@$ x@2@00 lft@3@00 x) x))
      :pattern ((inv@13@00 s@$ x@2@00 lft@3@00 x))
      :qid |lft_List-fctOfInv|))
    (forall ((s@18@00 $Snap)) (!
      (=>
        (ite
          (and
            (img@14@00 s@$ x@2@00 lft@3@00 ($SortWrappers.$SnapTo$Ref s@18@00))
            (Set_in (inv@13@00 s@$ x@2@00 lft@3@00 ($SortWrappers.$SnapTo$Ref s@18@00)) (Map_domain (Map_apply lft@3@00 1))))
          (<
            $Perm.No
            (Map_apply (Map_apply lft@3@00 1) (inv@13@00 s@$ x@2@00 lft@3@00 ($SortWrappers.$SnapTo$Ref s@18@00))))
          false)
        (and
          (not (= s@18@00 $Snap.unit))
          (=
            ($PSF.lookup_lft_List (sm@17@00 s@$ x@2@00 lft@3@00) s@18@00)
            ($PSF.lookup_lft_List ($SortWrappers.$SnapTo$PSF<lft_List> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$))))))))) s@18@00))))
      :pattern (($PSF.lookup_lft_List (sm@17@00 s@$ x@2@00 lft@3@00) s@18@00))
      :pattern (($PSF.lookup_lft_List ($SortWrappers.$SnapTo$PSF<lft_List> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second s@$))))))))) s@18@00))
      :qid |qp.psmValDef1|))
    ($Perm.isReadVar $k@15@00)
    ($Perm.isReadVar $k@16@00)
    (=>
      (get_disc%precondition s@$ x@2@00 lft@3@00)
      (=
        (get_disc s@$ x@2@00 lft@3@00)
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($PSF.lookup_lft_List (sm@17@00 s@$ x@2@00 lft@3@00) ($SortWrappers.$RefTo$Snap x@2@00)))))))
  :pattern ((get_disc s@$ x@2@00 lft@3@00))
  :qid |quant-u-13|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref) (lft@3@00 Map<Int~_Map<$Ref~_$Perm>>)) (!
  true
  :pattern ((get_disc s@$ x@2@00 lft@3@00))
  :qid |quant-u-14|)))
; ---------- List ----------
(declare-const x@19@00 $Ref)
(set-option :timeout 0)
(push) ; 1
; [eval] x != null
(push) ; 2
(set-option :timeout 10)
(assert (not (= x@19@00 $Ref.null)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (not (= x@19@00 $Ref.null))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | x@19@00 != Null | live]
; [else-branch: 6 | x@19@00 == Null | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 6 | x@19@00 != Null]
(assert (not (= x@19@00 $Ref.null)))
(declare-const $t@20@00 $Snap)
(assert (= $t@20@00 ($Snap.combine ($Snap.first $t@20@00) ($Snap.second $t@20@00))))
(pop) ; 2
(push) ; 2
; [else-branch: 6 | x@19@00 == Null]
(assert (= x@19@00 $Ref.null))
(declare-const $t@21@00 $Snap)
(assert (= $t@21@00 $Snap.unit))
(pop) ; 2
(pop) ; 1
; ---------- Node ----------
(declare-const x@22@00 $Ref)
; ---------- ListRef ----------
(declare-const x@23@00 $Ref)
(declare-const lft@24@00 Map<Int~_Map<$Ref~_$Perm>>)
(declare-const mut@25@00 Bool)
(push) ; 1
; [eval] x != null
(push) ; 2
(set-option :timeout 10)
(assert (not (= x@23@00 $Ref.null)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (not (= x@23@00 $Ref.null))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | x@23@00 != Null | live]
; [else-branch: 7 | x@23@00 == Null | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 7 | x@23@00 != Null]
(assert (not (= x@23@00 $Ref.null)))
(declare-const $t@26@00 $Snap)
(assert (= $t@26@00 ($Snap.combine ($Snap.first $t@26@00) ($Snap.second $t@26@00))))
(pop) ; 2
(push) ; 2
; [else-branch: 7 | x@23@00 == Null]
(assert (= x@23@00 $Ref.null))
(declare-const $t@27@00 $Snap)
(assert (= $t@27@00 $Snap.unit))
(pop) ; 2
(pop) ; 1
; ---------- NodeRef ----------
(declare-const x@28@00 $Ref)
(declare-const lft@29@00 Map<Int~_Map<$Ref~_$Perm>>)
(declare-const mut@30@00 Bool)
; ---------- lft_T ----------
(declare-const x@31@00 $Ref)
; ---------- lft_List ----------
(declare-const x@32@00 $Ref)
(push) ; 1
(declare-const $t@33@00 $Snap)
(assert (= $t@33@00 ($Snap.combine ($Snap.first $t@33@00) ($Snap.second $t@33@00))))
(assert (not (= x@32@00 $Ref.null)))
(pop) ; 1
; ---------- LifetimeP ----------
(declare-const lft@34@00 Map<Int~_Map<$Ref~_$Perm>>)
(push) ; 1
(declare-const $t@35@00 $Snap)
(assert (= $t@35@00 ($Snap.combine ($Snap.first $t@35@00) ($Snap.second $t@35@00))))
(assert (= ($Snap.first $t@35@00) $Snap.unit))
; [eval] valid_lft(lft)
(push) ; 2
(assert (valid_lft%precondition $Snap.unit lft@34@00))
(pop) ; 2
; Joined path conditions
(assert (valid_lft%precondition $Snap.unit lft@34@00))
(assert (valid_lft $Snap.unit lft@34@00))
(assert (=
  ($Snap.second $t@35@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@35@00))
    ($Snap.second ($Snap.second $t@35@00)))))
(assert (= ($Snap.first ($Snap.second $t@35@00)) $Snap.unit))
; [eval] (forall x: Ref :: { (x in lft[0]) } { lft[0][x] } (x in lft[0]) ==> lft[0][x] > 0 / 1)
(declare-const x@36@00 $Ref)
(push) ; 2
; [eval] (x in lft[0]) ==> lft[0][x] > 0 / 1
; [eval] (x in lft[0])
; [eval] lft[0]
(push) ; 3
(assert (not (Set_in 0 (Map_domain lft@34@00))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
; [then-branch: 8 | x@36@00 in domain(lft@34@00[0]) | live]
; [else-branch: 8 | !(x@36@00 in domain(lft@34@00[0])) | live]
(push) ; 4
; [then-branch: 8 | x@36@00 in domain(lft@34@00[0])]
(assert (Set_in x@36@00 (Map_domain (Map_apply lft@34@00 0))))
; [eval] lft[0][x] > 0 / 1
; [eval] lft[0][x]
; [eval] lft[0]
(push) ; 5
(assert (not (Set_in 0 (Map_domain lft@34@00))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 8 | !(x@36@00 in domain(lft@34@00[0]))]
(assert (not (Set_in x@36@00 (Map_domain (Map_apply lft@34@00 0)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Set_in x@36@00 (Map_domain (Map_apply lft@34@00 0))))
  (Set_in x@36@00 (Map_domain (Map_apply lft@34@00 0)))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@36@00 $Ref)) (!
  (or
    (not (Set_in x@36@00 (Map_domain (Map_apply lft@34@00 0))))
    (Set_in x@36@00 (Map_domain (Map_apply lft@34@00 0))))
  :pattern ((Set_in x@36@00 (Map_domain (Map_apply lft@34@00 0))))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0695.vpr@32@4@32@108-aux|)))
(assert (forall ((x@36@00 $Ref)) (!
  (or
    (not (Set_in x@36@00 (Map_domain (Map_apply lft@34@00 0))))
    (Set_in x@36@00 (Map_domain (Map_apply lft@34@00 0))))
  :pattern ((Map_apply (Map_apply lft@34@00 0) x@36@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0695.vpr@32@4@32@108-aux|)))
(assert (forall ((x@36@00 $Ref)) (!
  (=>
    (Set_in x@36@00 (Map_domain (Map_apply lft@34@00 0)))
    (> (Map_apply (Map_apply lft@34@00 0) x@36@00) $Perm.No))
  :pattern ((Set_in x@36@00 (Map_domain (Map_apply lft@34@00 0))))
  :pattern ((Map_apply (Map_apply lft@34@00 0) x@36@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0695.vpr@32@4@32@108|)))
(assert (=
  ($Snap.second ($Snap.second $t@35@00))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@35@00)))
    ($Snap.second ($Snap.second ($Snap.second $t@35@00))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@35@00))) $Snap.unit))
; [eval] (forall x: Ref :: { (x in lft[0]) } { lft[0][x] } (x in lft[0]) ==> lft[0][x] <= 1 / 1)
(declare-const x@37@00 $Ref)
(push) ; 2
; [eval] (x in lft[0]) ==> lft[0][x] <= 1 / 1
; [eval] (x in lft[0])
; [eval] lft[0]
(push) ; 3
(assert (not (Set_in 0 (Map_domain lft@34@00))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
; [then-branch: 9 | x@37@00 in domain(lft@34@00[0]) | live]
; [else-branch: 9 | !(x@37@00 in domain(lft@34@00[0])) | live]
(push) ; 4
; [then-branch: 9 | x@37@00 in domain(lft@34@00[0])]
(assert (Set_in x@37@00 (Map_domain (Map_apply lft@34@00 0))))
; [eval] lft[0][x] <= 1 / 1
; [eval] lft[0][x]
; [eval] lft[0]
(push) ; 5
(assert (not (Set_in 0 (Map_domain lft@34@00))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 9 | !(x@37@00 in domain(lft@34@00[0]))]
(assert (not (Set_in x@37@00 (Map_domain (Map_apply lft@34@00 0)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Set_in x@37@00 (Map_domain (Map_apply lft@34@00 0))))
  (Set_in x@37@00 (Map_domain (Map_apply lft@34@00 0)))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@37@00 $Ref)) (!
  (or
    (not (Set_in x@37@00 (Map_domain (Map_apply lft@34@00 0))))
    (Set_in x@37@00 (Map_domain (Map_apply lft@34@00 0))))
  :pattern ((Set_in x@37@00 (Map_domain (Map_apply lft@34@00 0))))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0695.vpr@32@4@32@108-aux|)))
(assert (forall ((x@37@00 $Ref)) (!
  (or
    (not (Set_in x@37@00 (Map_domain (Map_apply lft@34@00 0))))
    (Set_in x@37@00 (Map_domain (Map_apply lft@34@00 0))))
  :pattern ((Map_apply (Map_apply lft@34@00 0) x@37@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0695.vpr@32@4@32@108-aux|)))
(assert (forall ((x@37@00 $Ref)) (!
  (=>
    (Set_in x@37@00 (Map_domain (Map_apply lft@34@00 0)))
    (<= (Map_apply (Map_apply lft@34@00 0) x@37@00) $Perm.Write))
  :pattern ((Set_in x@37@00 (Map_domain (Map_apply lft@34@00 0))))
  :pattern ((Map_apply (Map_apply lft@34@00 0) x@37@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0695.vpr@32@4@32@108|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@35@00)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@35@00))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@35@00)))))))
(declare-const x@38@00 $Ref)
(push) ; 2
; [eval] (x in lft[0])
; [eval] lft[0]
(push) ; 3
(assert (not (Set_in 0 (Map_domain lft@34@00))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Set_in x@38@00 (Map_domain (Map_apply lft@34@00 0))))
; [eval] lft[0][x]
; [eval] lft[0]
(push) ; 3
(assert (not (Set_in 0 (Map_domain lft@34@00))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@39@00 ($Ref) $Ref)
(declare-fun img@40@00 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(push) ; 2
(assert (not (forall ((x@38@00 $Ref)) (!
  (=>
    (Set_in x@38@00 (Map_domain (Map_apply lft@34@00 0)))
    (or
      (= (Map_apply (Map_apply lft@34@00 0) x@38@00) $Perm.No)
      (< $Perm.No (Map_apply (Map_apply lft@34@00 0) x@38@00))))
  
  :qid |quant-u-15|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@38@00 $Ref) (x2@38@00 $Ref)) (!
  (=>
    (and
      (and
        (Set_in x1@38@00 (Map_domain (Map_apply lft@34@00 0)))
        (< $Perm.No (Map_apply (Map_apply lft@34@00 0) x1@38@00)))
      (and
        (Set_in x2@38@00 (Map_domain (Map_apply lft@34@00 0)))
        (< $Perm.No (Map_apply (Map_apply lft@34@00 0) x2@38@00)))
      (= x1@38@00 x2@38@00))
    (= x1@38@00 x2@38@00))
  
  :qid |lft_T-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@38@00 $Ref)) (!
  (=>
    (and
      (Set_in x@38@00 (Map_domain (Map_apply lft@34@00 0)))
      (< $Perm.No (Map_apply (Map_apply lft@34@00 0) x@38@00)))
    (and (= (inv@39@00 x@38@00) x@38@00) (img@40@00 x@38@00)))
  :pattern ((Set_in x@38@00 (Map_domain (Map_apply lft@34@00 0))))
  :pattern ((Map_apply (Map_apply lft@34@00 0) x@38@00))
  :pattern ((inv@39@00 x@38@00))
  :pattern ((img@40@00 x@38@00))
  :qid |quant-u-16|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@40@00 x)
      (and
        (Set_in (inv@39@00 x) (Map_domain (Map_apply lft@34@00 0)))
        (< $Perm.No (Map_apply (Map_apply lft@34@00 0) (inv@39@00 x)))))
    (= (inv@39@00 x) x))
  :pattern ((inv@39@00 x))
  :qid |lft_T-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((x@38@00 $Ref)) (!
  (<= $Perm.No (Map_apply (Map_apply lft@34@00 0) x@38@00))
  :pattern ((Set_in x@38@00 (Map_domain (Map_apply lft@34@00 0))))
  :pattern ((Map_apply (Map_apply lft@34@00 0) x@38@00))
  :pattern ((inv@39@00 x@38@00))
  :pattern ((img@40@00 x@38@00))
  :qid |lft_T-permAtLeastZero|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@35@00))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@35@00)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@35@00))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@35@00)))))
  $Snap.unit))
; [eval] (forall x: Ref :: { (x in lft[1]) } { lft[1][x] } (x in lft[1]) ==> lft[1][x] > 0 / 1)
(declare-const x@41@00 $Ref)
(push) ; 2
; [eval] (x in lft[1]) ==> lft[1][x] > 0 / 1
; [eval] (x in lft[1])
; [eval] lft[1]
(push) ; 3
(assert (not (Set_in 1 (Map_domain lft@34@00))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
; [then-branch: 10 | x@41@00 in domain(lft@34@00[1]) | live]
; [else-branch: 10 | !(x@41@00 in domain(lft@34@00[1])) | live]
(push) ; 4
; [then-branch: 10 | x@41@00 in domain(lft@34@00[1])]
(assert (Set_in x@41@00 (Map_domain (Map_apply lft@34@00 1))))
; [eval] lft[1][x] > 0 / 1
; [eval] lft[1][x]
; [eval] lft[1]
(push) ; 5
(assert (not (Set_in 1 (Map_domain lft@34@00))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 10 | !(x@41@00 in domain(lft@34@00[1]))]
(assert (not (Set_in x@41@00 (Map_domain (Map_apply lft@34@00 1)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Set_in x@41@00 (Map_domain (Map_apply lft@34@00 1))))
  (Set_in x@41@00 (Map_domain (Map_apply lft@34@00 1)))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@41@00 $Ref)) (!
  (or
    (not (Set_in x@41@00 (Map_domain (Map_apply lft@34@00 1))))
    (Set_in x@41@00 (Map_domain (Map_apply lft@34@00 1))))
  :pattern ((Set_in x@41@00 (Map_domain (Map_apply lft@34@00 1))))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0695.vpr@33@4@33@127-aux|)))
(assert (forall ((x@41@00 $Ref)) (!
  (or
    (not (Set_in x@41@00 (Map_domain (Map_apply lft@34@00 1))))
    (Set_in x@41@00 (Map_domain (Map_apply lft@34@00 1))))
  :pattern ((Map_apply (Map_apply lft@34@00 1) x@41@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0695.vpr@33@4@33@127-aux|)))
(assert (forall ((x@41@00 $Ref)) (!
  (=>
    (Set_in x@41@00 (Map_domain (Map_apply lft@34@00 1)))
    (> (Map_apply (Map_apply lft@34@00 1) x@41@00) $Perm.No))
  :pattern ((Set_in x@41@00 (Map_domain (Map_apply lft@34@00 1))))
  :pattern ((Map_apply (Map_apply lft@34@00 1) x@41@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0695.vpr@33@4@33@127|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@35@00)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@35@00))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@35@00)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@35@00))))))
  $Snap.unit))
; [eval] (forall x: Ref :: { (x in lft[1]) } { lft[1][x] } (x in lft[1]) ==> lft[1][x] <= 1 / 1)
(declare-const x@42@00 $Ref)
(push) ; 2
; [eval] (x in lft[1]) ==> lft[1][x] <= 1 / 1
; [eval] (x in lft[1])
; [eval] lft[1]
(push) ; 3
(assert (not (Set_in 1 (Map_domain lft@34@00))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
; [then-branch: 11 | x@42@00 in domain(lft@34@00[1]) | live]
; [else-branch: 11 | !(x@42@00 in domain(lft@34@00[1])) | live]
(push) ; 4
; [then-branch: 11 | x@42@00 in domain(lft@34@00[1])]
(assert (Set_in x@42@00 (Map_domain (Map_apply lft@34@00 1))))
; [eval] lft[1][x] <= 1 / 1
; [eval] lft[1][x]
; [eval] lft[1]
(push) ; 5
(assert (not (Set_in 1 (Map_domain lft@34@00))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 11 | !(x@42@00 in domain(lft@34@00[1]))]
(assert (not (Set_in x@42@00 (Map_domain (Map_apply lft@34@00 1)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Set_in x@42@00 (Map_domain (Map_apply lft@34@00 1))))
  (Set_in x@42@00 (Map_domain (Map_apply lft@34@00 1)))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@42@00 $Ref)) (!
  (or
    (not (Set_in x@42@00 (Map_domain (Map_apply lft@34@00 1))))
    (Set_in x@42@00 (Map_domain (Map_apply lft@34@00 1))))
  :pattern ((Set_in x@42@00 (Map_domain (Map_apply lft@34@00 1))))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0695.vpr@33@4@33@127-aux|)))
(assert (forall ((x@42@00 $Ref)) (!
  (or
    (not (Set_in x@42@00 (Map_domain (Map_apply lft@34@00 1))))
    (Set_in x@42@00 (Map_domain (Map_apply lft@34@00 1))))
  :pattern ((Map_apply (Map_apply lft@34@00 1) x@42@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0695.vpr@33@4@33@127-aux|)))
(assert (forall ((x@42@00 $Ref)) (!
  (=>
    (Set_in x@42@00 (Map_domain (Map_apply lft@34@00 1)))
    (<= (Map_apply (Map_apply lft@34@00 1) x@42@00) $Perm.Write))
  :pattern ((Set_in x@42@00 (Map_domain (Map_apply lft@34@00 1))))
  :pattern ((Map_apply (Map_apply lft@34@00 1) x@42@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0695.vpr@33@4@33@127|)))
(declare-const x@43@00 $Ref)
(push) ; 2
; [eval] (x in lft[1])
; [eval] lft[1]
(push) ; 3
(assert (not (Set_in 1 (Map_domain lft@34@00))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Set_in x@43@00 (Map_domain (Map_apply lft@34@00 1))))
; [eval] lft[1][x]
; [eval] lft[1]
(push) ; 3
(assert (not (Set_in 1 (Map_domain lft@34@00))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@44@00 ($Ref) $Ref)
(declare-fun img@45@00 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(push) ; 2
(assert (not (forall ((x@43@00 $Ref)) (!
  (=>
    (Set_in x@43@00 (Map_domain (Map_apply lft@34@00 1)))
    (or
      (= (Map_apply (Map_apply lft@34@00 1) x@43@00) $Perm.No)
      (< $Perm.No (Map_apply (Map_apply lft@34@00 1) x@43@00))))
  
  :qid |quant-u-17|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@43@00 $Ref) (x2@43@00 $Ref)) (!
  (=>
    (and
      (and
        (Set_in x1@43@00 (Map_domain (Map_apply lft@34@00 1)))
        (< $Perm.No (Map_apply (Map_apply lft@34@00 1) x1@43@00)))
      (and
        (Set_in x2@43@00 (Map_domain (Map_apply lft@34@00 1)))
        (< $Perm.No (Map_apply (Map_apply lft@34@00 1) x2@43@00)))
      (= x1@43@00 x2@43@00))
    (= x1@43@00 x2@43@00))
  
  :qid |lft_List-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@43@00 $Ref)) (!
  (=>
    (and
      (Set_in x@43@00 (Map_domain (Map_apply lft@34@00 1)))
      (< $Perm.No (Map_apply (Map_apply lft@34@00 1) x@43@00)))
    (and (= (inv@44@00 x@43@00) x@43@00) (img@45@00 x@43@00)))
  :pattern ((Set_in x@43@00 (Map_domain (Map_apply lft@34@00 1))))
  :pattern ((Map_apply (Map_apply lft@34@00 1) x@43@00))
  :pattern ((inv@44@00 x@43@00))
  :pattern ((img@45@00 x@43@00))
  :qid |quant-u-18|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@45@00 x)
      (and
        (Set_in (inv@44@00 x) (Map_domain (Map_apply lft@34@00 1)))
        (< $Perm.No (Map_apply (Map_apply lft@34@00 1) (inv@44@00 x)))))
    (= (inv@44@00 x) x))
  :pattern ((inv@44@00 x))
  :qid |lft_List-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((x@43@00 $Ref)) (!
  (<= $Perm.No (Map_apply (Map_apply lft@34@00 1) x@43@00))
  :pattern ((Set_in x@43@00 (Map_domain (Map_apply lft@34@00 1))))
  :pattern ((Map_apply (Map_apply lft@34@00 1) x@43@00))
  :pattern ((inv@44@00 x@43@00))
  :pattern ((img@45@00 x@43@00))
  :qid |lft_List-permAtLeastZero|)))
(pop) ; 1
; ---------- P ----------
(declare-const x@46@00 $Ref)
(push) ; 1
(declare-const $t@47@00 $Snap)
(assert (= $t@47@00 $Snap.unit))
(pop) ; 1
