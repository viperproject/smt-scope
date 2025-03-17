(get-info :version)
; (:version "4.12.1")
; Started: 2023-10-31 14:04:41
; Silicon.version: 1.1-SNAPSHOT (46944a65@dspil_symbenchmarking)
; Input file: /home/pcorrect/repos/benchmarking_general/silicon_tests/prusti_tests_._pass_._quick_._routes_._routes.rs_routes--borrow_nth-Both.vpr
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
(declare-sort Set<Bool> 0)
(declare-sort Set<$Snap> 0)
(declare-sort MirrorDomain 0)
(declare-sort Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_ 0)
(declare-sort Snap$struct$m_Route 0)
(declare-sort Snap$struct$m_Point 0)
(declare-sort $FVF<val_ref> 0)
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
(declare-fun $SortWrappers.Set<Bool>To$Snap (Set<Bool>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<Bool> ($Snap) Set<Bool>)
(assert (forall ((x Set<Bool>)) (!
    (= x ($SortWrappers.$SnapToSet<Bool>($SortWrappers.Set<Bool>To$Snap x)))
    :pattern (($SortWrappers.Set<Bool>To$Snap x))
    :qid |$Snap.$SnapToSet<Bool>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<Bool>To$Snap($SortWrappers.$SnapToSet<Bool> x)))
    :pattern (($SortWrappers.$SnapToSet<Bool> x))
    :qid |$Snap.Set<Bool>To$SnapToSet<Bool>|
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
(declare-fun $SortWrappers.MirrorDomainTo$Snap (MirrorDomain) $Snap)
(declare-fun $SortWrappers.$SnapToMirrorDomain ($Snap) MirrorDomain)
(assert (forall ((x MirrorDomain)) (!
    (= x ($SortWrappers.$SnapToMirrorDomain($SortWrappers.MirrorDomainTo$Snap x)))
    :pattern (($SortWrappers.MirrorDomainTo$Snap x))
    :qid |$Snap.$SnapToMirrorDomainTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.MirrorDomainTo$Snap($SortWrappers.$SnapToMirrorDomain x)))
    :pattern (($SortWrappers.$SnapToMirrorDomain x))
    :qid |$Snap.MirrorDomainTo$SnapToMirrorDomain|
    )))
(declare-fun $SortWrappers.Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_To$Snap (Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_) $Snap)
(declare-fun $SortWrappers.$SnapToSnap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_ ($Snap) Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_)
(assert (forall ((x Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_)) (!
    (= x ($SortWrappers.$SnapToSnap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_($SortWrappers.Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_To$Snap x)))
    :pattern (($SortWrappers.Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_To$Snap x))
    :qid |$Snap.$SnapToSnap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_To$Snap($SortWrappers.$SnapToSnap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_ x)))
    :pattern (($SortWrappers.$SnapToSnap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_ x))
    :qid |$Snap.Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_To$SnapToSnap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_|
    )))
(declare-fun $SortWrappers.Snap$struct$m_RouteTo$Snap (Snap$struct$m_Route) $Snap)
(declare-fun $SortWrappers.$SnapToSnap$struct$m_Route ($Snap) Snap$struct$m_Route)
(assert (forall ((x Snap$struct$m_Route)) (!
    (= x ($SortWrappers.$SnapToSnap$struct$m_Route($SortWrappers.Snap$struct$m_RouteTo$Snap x)))
    :pattern (($SortWrappers.Snap$struct$m_RouteTo$Snap x))
    :qid |$Snap.$SnapToSnap$struct$m_RouteTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Snap$struct$m_RouteTo$Snap($SortWrappers.$SnapToSnap$struct$m_Route x)))
    :pattern (($SortWrappers.$SnapToSnap$struct$m_Route x))
    :qid |$Snap.Snap$struct$m_RouteTo$SnapToSnap$struct$m_Route|
    )))
(declare-fun $SortWrappers.Snap$struct$m_PointTo$Snap (Snap$struct$m_Point) $Snap)
(declare-fun $SortWrappers.$SnapToSnap$struct$m_Point ($Snap) Snap$struct$m_Point)
(assert (forall ((x Snap$struct$m_Point)) (!
    (= x ($SortWrappers.$SnapToSnap$struct$m_Point($SortWrappers.Snap$struct$m_PointTo$Snap x)))
    :pattern (($SortWrappers.Snap$struct$m_PointTo$Snap x))
    :qid |$Snap.$SnapToSnap$struct$m_PointTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Snap$struct$m_PointTo$Snap($SortWrappers.$SnapToSnap$struct$m_Point x)))
    :pattern (($SortWrappers.$SnapToSnap$struct$m_Point x))
    :qid |$Snap.Snap$struct$m_PointTo$SnapToSnap$struct$m_Point|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.$FVF<val_ref>To$Snap ($FVF<val_ref>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<val_ref> ($Snap) $FVF<val_ref>)
(assert (forall ((x $FVF<val_ref>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<val_ref>($SortWrappers.$FVF<val_ref>To$Snap x)))
    :pattern (($SortWrappers.$FVF<val_ref>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<val_ref>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<val_ref>To$Snap($SortWrappers.$SnapTo$FVF<val_ref> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<val_ref> x))
    :qid |$Snap.$FVF<val_ref>To$SnapTo$FVF<val_ref>|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.___BitVec_32_To$Snap ((_ BitVec 32)) $Snap)
(declare-fun $SortWrappers.$SnapTo___BitVec_32_ ($Snap) (_ BitVec 32))
(assert (forall ((x (_ BitVec 32))) (!
    (= x ($SortWrappers.$SnapTo___BitVec_32_($SortWrappers.___BitVec_32_To$Snap x)))
    :pattern (($SortWrappers.___BitVec_32_To$Snap x))
    :qid |$Snap.$SnapTo___BitVec_32_To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.___BitVec_32_To$Snap($SortWrappers.$SnapTo___BitVec_32_ x)))
    :pattern (($SortWrappers.$SnapTo___BitVec_32_ x))
    :qid |$Snap.___BitVec_32_To$SnapTo___BitVec_32_|
    )))
(declare-fun $SortWrappers.___FloatingPoint_8_24_To$Snap ((_ FloatingPoint 8 24)) $Snap)
(declare-fun $SortWrappers.$SnapTo___FloatingPoint_8_24_ ($Snap) (_ FloatingPoint 8 24))
(assert (forall ((x (_ FloatingPoint 8 24))) (!
    (= x ($SortWrappers.$SnapTo___FloatingPoint_8_24_($SortWrappers.___FloatingPoint_8_24_To$Snap x)))
    :pattern (($SortWrappers.___FloatingPoint_8_24_To$Snap x))
    :qid |$Snap.$SnapTo___FloatingPoint_8_24_To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.___FloatingPoint_8_24_To$Snap($SortWrappers.$SnapTo___FloatingPoint_8_24_ x)))
    :pattern (($SortWrappers.$SnapTo___FloatingPoint_8_24_ x))
    :qid |$Snap.___FloatingPoint_8_24_To$SnapTo___FloatingPoint_8_24_|
    )))
(declare-fun $SortWrappers.___BitVec_64_To$Snap ((_ BitVec 64)) $Snap)
(declare-fun $SortWrappers.$SnapTo___BitVec_64_ ($Snap) (_ BitVec 64))
(assert (forall ((x (_ BitVec 64))) (!
    (= x ($SortWrappers.$SnapTo___BitVec_64_($SortWrappers.___BitVec_64_To$Snap x)))
    :pattern (($SortWrappers.___BitVec_64_To$Snap x))
    :qid |$Snap.$SnapTo___BitVec_64_To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.___BitVec_64_To$Snap($SortWrappers.$SnapTo___BitVec_64_ x)))
    :pattern (($SortWrappers.$SnapTo___BitVec_64_ x))
    :qid |$Snap.___BitVec_64_To$SnapTo___BitVec_64_|
    )))
(declare-fun $SortWrappers.___FloatingPoint_12_52_To$Snap ((_ FloatingPoint 12 52)) $Snap)
(declare-fun $SortWrappers.$SnapTo___FloatingPoint_12_52_ ($Snap) (_ FloatingPoint 12 52))
(assert (forall ((x (_ FloatingPoint 12 52))) (!
    (= x ($SortWrappers.$SnapTo___FloatingPoint_12_52_($SortWrappers.___FloatingPoint_12_52_To$Snap x)))
    :pattern (($SortWrappers.___FloatingPoint_12_52_To$Snap x))
    :qid |$Snap.$SnapTo___FloatingPoint_12_52_To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.___FloatingPoint_12_52_To$Snap($SortWrappers.$SnapTo___FloatingPoint_12_52_ x)))
    :pattern (($SortWrappers.$SnapTo___FloatingPoint_12_52_ x))
    :qid |$Snap.___FloatingPoint_12_52_To$SnapTo___FloatingPoint_12_52_|
    )))
(declare-fun $SortWrappers.___BitVec_8_To$Snap ((_ BitVec 8)) $Snap)
(declare-fun $SortWrappers.$SnapTo___BitVec_8_ ($Snap) (_ BitVec 8))
(assert (forall ((x (_ BitVec 8))) (!
    (= x ($SortWrappers.$SnapTo___BitVec_8_($SortWrappers.___BitVec_8_To$Snap x)))
    :pattern (($SortWrappers.___BitVec_8_To$Snap x))
    :qid |$Snap.$SnapTo___BitVec_8_To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.___BitVec_8_To$Snap($SortWrappers.$SnapTo___BitVec_8_ x)))
    :pattern (($SortWrappers.$SnapTo___BitVec_8_ x))
    :qid |$Snap.___BitVec_8_To$SnapTo___BitVec_8_|
    )))
(declare-fun $SortWrappers.___BitVec_16_To$Snap ((_ BitVec 16)) $Snap)
(declare-fun $SortWrappers.$SnapTo___BitVec_16_ ($Snap) (_ BitVec 16))
(assert (forall ((x (_ BitVec 16))) (!
    (= x ($SortWrappers.$SnapTo___BitVec_16_($SortWrappers.___BitVec_16_To$Snap x)))
    :pattern (($SortWrappers.___BitVec_16_To$Snap x))
    :qid |$Snap.$SnapTo___BitVec_16_To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.___BitVec_16_To$Snap($SortWrappers.$SnapTo___BitVec_16_ x)))
    :pattern (($SortWrappers.$SnapTo___BitVec_16_ x))
    :qid |$Snap.___BitVec_16_To$SnapTo___BitVec_16_|
    )))
(declare-fun $SortWrappers.___BitVec_128_To$Snap ((_ BitVec 128)) $Snap)
(declare-fun $SortWrappers.$SnapTo___BitVec_128_ ($Snap) (_ BitVec 128))
(assert (forall ((x (_ BitVec 128))) (!
    (= x ($SortWrappers.$SnapTo___BitVec_128_($SortWrappers.___BitVec_128_To$Snap x)))
    :pattern (($SortWrappers.___BitVec_128_To$Snap x))
    :qid |$Snap.$SnapTo___BitVec_128_To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.___BitVec_128_To$Snap($SortWrappers.$SnapTo___BitVec_128_ x)))
    :pattern (($SortWrappers.$SnapTo___BitVec_128_ x))
    :qid |$Snap.___BitVec_128_To$SnapTo___BitVec_128_|
    )))
; ////////// Symbols
(declare-fun Set_in (Int Set<Int>) Bool)
(declare-fun Set_card (Set<Int>) Int)
(declare-const Set_empty Set<Int>)
(declare-fun Set_singleton (Int) Set<Int>)
(declare-fun Set_unionone (Set<Int> Int) Set<Int>)
(declare-fun Set_union (Set<Int> Set<Int>) Set<Int>)
(declare-fun Set_disjoint (Set<Int> Set<Int>) Bool)
(declare-fun Set_difference (Set<Int> Set<Int>) Set<Int>)
(declare-fun Set_intersection (Set<Int> Set<Int>) Set<Int>)
(declare-fun Set_subset (Set<Int> Set<Int>) Bool)
(declare-fun Set_equal (Set<Int> Set<Int>) Bool)
(declare-fun Set_in ($Ref Set<$Ref>) Bool)
(declare-fun Set_card (Set<$Ref>) Int)
(declare-const Set_empty Set<$Ref>)
(declare-fun Set_singleton ($Ref) Set<$Ref>)
(declare-fun Set_unionone (Set<$Ref> $Ref) Set<$Ref>)
(declare-fun Set_union (Set<$Ref> Set<$Ref>) Set<$Ref>)
(declare-fun Set_disjoint (Set<$Ref> Set<$Ref>) Bool)
(declare-fun Set_difference (Set<$Ref> Set<$Ref>) Set<$Ref>)
(declare-fun Set_intersection (Set<$Ref> Set<$Ref>) Set<$Ref>)
(declare-fun Set_subset (Set<$Ref> Set<$Ref>) Bool)
(declare-fun Set_equal (Set<$Ref> Set<$Ref>) Bool)
(declare-fun Set_in (Bool Set<Bool>) Bool)
(declare-fun Set_card (Set<Bool>) Int)
(declare-const Set_empty Set<Bool>)
(declare-fun Set_singleton (Bool) Set<Bool>)
(declare-fun Set_unionone (Set<Bool> Bool) Set<Bool>)
(declare-fun Set_union (Set<Bool> Set<Bool>) Set<Bool>)
(declare-fun Set_disjoint (Set<Bool> Set<Bool>) Bool)
(declare-fun Set_difference (Set<Bool> Set<Bool>) Set<Bool>)
(declare-fun Set_intersection (Set<Bool> Set<Bool>) Set<Bool>)
(declare-fun Set_subset (Set<Bool> Set<Bool>) Bool)
(declare-fun Set_equal (Set<Bool> Set<Bool>) Bool)
(declare-fun Set_in ($Snap Set<$Snap>) Bool)
(declare-fun Set_card (Set<$Snap>) Int)
(declare-const Set_empty Set<$Snap>)
(declare-fun Set_singleton ($Snap) Set<$Snap>)
(declare-fun Set_unionone (Set<$Snap> $Snap) Set<$Snap>)
(declare-fun Set_union (Set<$Snap> Set<$Snap>) Set<$Snap>)
(declare-fun Set_disjoint (Set<$Snap> Set<$Snap>) Bool)
(declare-fun Set_difference (Set<$Snap> Set<$Snap>) Set<$Snap>)
(declare-fun Set_intersection (Set<$Snap> Set<$Snap>) Set<$Snap>)
(declare-fun Set_subset (Set<$Snap> Set<$Snap>) Bool)
(declare-fun Set_equal (Set<$Snap> Set<$Snap>) Bool)
(declare-fun mirror_simple$m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$<Int> (Snap$struct$m_Route Int) Int)
(declare-fun mirror_simple$m_length__$TY$__Snap$struct$m_Route$$int$<Int> (Snap$struct$m_Route) Int)
(declare-fun cons$0$__$TY$__Snap$struct$m_Point$$int$$$int$$Snap$struct$m_Point<Snap$struct$m_Point> (Int Int) Snap$struct$m_Point)
(declare-fun Snap$struct$m_Point$0$field$f$x__$TY$__Snap$struct$m_Point$$int$<Int> (Snap$struct$m_Point) Int)
(declare-fun Snap$struct$m_Point$0$field$f$y__$TY$__Snap$struct$m_Point$$int$<Int> (Snap$struct$m_Point) Int)
(declare-fun cons$0$__$TY$__Snap$struct$m_Route$Snap$struct$m_Point$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$struct$m_Route<Snap$struct$m_Route> (Snap$struct$m_Point Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_) Snap$struct$m_Route)
(declare-fun Snap$struct$m_Route$0$field$f$current__$TY$__Snap$struct$m_Route$Snap$struct$m_Point<Snap$struct$m_Point> (Snap$struct$m_Route) Snap$struct$m_Point)
(declare-fun Snap$struct$m_Route$0$field$f$rest__$TY$__Snap$struct$m_Route$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_<Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_> (Snap$struct$m_Route) Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_)
(declare-fun discriminant$__$TY$__Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$int$<Int> (Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_) Int)
(declare-const cons$0$__$TY$__Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_<Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_> Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_)
(declare-fun cons$1$__$TY$__Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$struct$m_Route$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_<Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_> (Snap$struct$m_Route) Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_)
(declare-fun Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$1$field$f$0__$TY$__Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$struct$m_Route<Snap$struct$m_Route> (Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_) Snap$struct$m_Route)
; /field_value_functions_declarations.smt2 [val_ref: Ref]
(declare-fun $FVF.domain_val_ref ($FVF<val_ref>) Set<$Ref>)
(declare-fun $FVF.lookup_val_ref ($FVF<val_ref> $Ref) $Ref)
(declare-fun $FVF.after_val_ref ($FVF<val_ref> $FVF<val_ref>) Bool)
(declare-fun $FVF.loc_val_ref ($Ref $Ref) Bool)
(declare-fun $FVF.perm_val_ref ($FPM $Ref) $Perm)
(declare-const $fvfTOP_val_ref $FVF<val_ref>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun read$ ($Snap) $Perm)
(declare-fun read$%limited ($Snap) $Perm)
(declare-const read$%stateless Bool)
(declare-fun read$%precondition ($Snap) Bool)
(declare-fun snap$__$TY$__Snap$struct$m_Point$struct$m_Point$Snap$struct$m_Point ($Snap $Ref) Snap$struct$m_Point)
(declare-fun snap$__$TY$__Snap$struct$m_Point$struct$m_Point$Snap$struct$m_Point%limited ($Snap $Ref) Snap$struct$m_Point)
(declare-fun snap$__$TY$__Snap$struct$m_Point$struct$m_Point$Snap$struct$m_Point%stateless ($Ref) Bool)
(declare-fun snap$__$TY$__Snap$struct$m_Point$struct$m_Point$Snap$struct$m_Point%precondition ($Snap $Ref) Bool)
(declare-fun builtin$unreach__$TY$__$int$$$int$ ($Snap) Int)
(declare-fun builtin$unreach__$TY$__$int$$$int$%limited ($Snap) Int)
(declare-const builtin$unreach__$TY$__$int$$$int$%stateless Bool)
(declare-fun builtin$unreach__$TY$__$int$$$int$%precondition ($Snap) Bool)
(declare-fun m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap Snap$struct$m_Route) Int)
(declare-fun m_length__$TY$__Snap$struct$m_Route$$int$%limited ($Snap Snap$struct$m_Route) Int)
(declare-fun m_length__$TY$__Snap$struct$m_Route$$int$%stateless (Snap$struct$m_Route) Bool)
(declare-fun m_length__$TY$__Snap$struct$m_Route$$int$%precondition ($Snap Snap$struct$m_Route) Bool)
(declare-fun snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap $Ref) Snap$struct$m_Route)
(declare-fun snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route%limited ($Snap $Ref) Snap$struct$m_Route)
(declare-fun snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route%stateless ($Ref) Bool)
(declare-fun snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route%precondition ($Snap $Ref) Bool)
(declare-fun snap$__$TY$__Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_ ($Snap $Ref) Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_)
(declare-fun snap$__$TY$__Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_%limited ($Snap $Ref) Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_)
(declare-fun snap$__$TY$__Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_%stateless ($Ref) Bool)
(declare-fun snap$__$TY$__Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_%precondition ($Snap $Ref) Bool)
(declare-fun m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$ ($Snap Snap$struct$m_Route Int) Int)
(declare-fun m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%limited ($Snap Snap$struct$m_Route Int) Int)
(declare-fun m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%stateless (Snap$struct$m_Route Int) Bool)
(declare-fun m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap Snap$struct$m_Route Int) Bool)
(declare-fun m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$discriminant$$__$TY$__m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$int$ ($Snap $Ref) Int)
(declare-fun m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$discriminant$$__$TY$__m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$int$%limited ($Snap $Ref) Int)
(declare-fun m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$discriminant$$__$TY$__m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$int$%stateless ($Ref) Bool)
(declare-fun m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$discriminant$$__$TY$__m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$int$%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun DeadBorrowToken$%trigger ($Snap Int) Bool)
(declare-fun i32%trigger ($Snap $Ref) Bool)
(declare-fun m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_%trigger ($Snap $Ref) Bool)
(declare-fun m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_Some%trigger ($Snap $Ref) Bool)
(declare-fun struct$m_Point%trigger ($Snap $Ref) Bool)
(declare-fun struct$m_Route%trigger ($Snap $Ref) Bool)
(declare-fun struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global%trigger ($Snap $Ref) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((s Set<Int>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  :qid |$Set[Int]_prog.card_non_negative|)))
(assert (forall ((e Int)) (!
  (not (Set_in e (as Set_empty  Set<Int>)))
  :pattern ((Set_in e (as Set_empty  Set<Int>)))
  :qid |$Set[Int]_prog.in_empty_set|)))
(assert (forall ((s Set<Int>)) (!
  (and
    (= (= (Set_card s) 0) (= s (as Set_empty  Set<Int>)))
    (=>
      (not (= (Set_card s) 0))
      (exists ((e Int)) (!
        (Set_in e s)
        :pattern ((Set_in e s))
        ))))
  :pattern ((Set_card s))
  :qid |$Set[Int]_prog.empty_set_cardinality|)))
(assert (forall ((e Int)) (!
  (Set_in e (Set_singleton e))
  :pattern ((Set_singleton e))
  :qid |$Set[Int]_prog.in_singleton_set|)))
(assert (forall ((e1 Int) (e2 Int)) (!
  (= (Set_in e1 (Set_singleton e2)) (= e1 e2))
  :pattern ((Set_in e1 (Set_singleton e2)))
  :qid |$Set[Int]_prog.in_singleton_set_equality|)))
(assert (forall ((e Int)) (!
  (= (Set_card (Set_singleton e)) 1)
  :pattern ((Set_card (Set_singleton e)))
  :qid |$Set[Int]_prog.singleton_set_cardinality|)))
(assert (forall ((s Set<Int>) (e Int)) (!
  (Set_in e (Set_unionone s e))
  :pattern ((Set_unionone s e))
  :qid |$Set[Int]_prog.in_unionone_same|)))
(assert (forall ((s Set<Int>) (e1 Int) (e2 Int)) (!
  (= (Set_in e1 (Set_unionone s e2)) (or (= e1 e2) (Set_in e1 s)))
  :pattern ((Set_in e1 (Set_unionone s e2)))
  :qid |$Set[Int]_prog.in_unionone_other|)))
(assert (forall ((s Set<Int>) (e1 Int) (e2 Int)) (!
  (=> (Set_in e1 s) (Set_in e1 (Set_unionone s e2)))
  :pattern ((Set_in e1 s) (Set_unionone s e2))
  :qid |$Set[Int]_prog.invariance_in_unionone|)))
(assert (forall ((s Set<Int>) (e Int)) (!
  (=> (Set_in e s) (= (Set_card (Set_unionone s e)) (Set_card s)))
  :pattern ((Set_card (Set_unionone s e)))
  :qid |$Set[Int]_prog.unionone_cardinality_invariant|)))
(assert (forall ((s Set<Int>) (e Int)) (!
  (=> (not (Set_in e s)) (= (Set_card (Set_unionone s e)) (+ (Set_card s) 1)))
  :pattern ((Set_card (Set_unionone s e)))
  :qid |$Set[Int]_prog.unionone_cardinality_changed|)))
(assert (forall ((s1 Set<Int>) (s2 Set<Int>) (e Int)) (!
  (= (Set_in e (Set_union s1 s2)) (or (Set_in e s1) (Set_in e s2)))
  :pattern ((Set_in e (Set_union s1 s2)))
  :qid |$Set[Int]_prog.in_union_in_one|)))
(assert (forall ((s1 Set<Int>) (s2 Set<Int>) (e Int)) (!
  (=> (Set_in e s1) (Set_in e (Set_union s1 s2)))
  :pattern ((Set_in e s1) (Set_union s1 s2))
  :qid |$Set[Int]_prog.in_left_in_union|)))
(assert (forall ((s1 Set<Int>) (s2 Set<Int>) (e Int)) (!
  (=> (Set_in e s2) (Set_in e (Set_union s1 s2)))
  :pattern ((Set_in e s2) (Set_union s1 s2))
  :qid |$Set[Int]_prog.in_right_in_union|)))
(assert (forall ((s1 Set<Int>) (s2 Set<Int>) (e Int)) (!
  (= (Set_in e (Set_intersection s1 s2)) (and (Set_in e s1) (Set_in e s2)))
  :pattern ((Set_in e (Set_intersection s1 s2)))
  :pattern ((Set_intersection s1 s2) (Set_in e s1))
  :pattern ((Set_intersection s1 s2) (Set_in e s2))
  :qid |$Set[Int]_prog.in_intersection_in_both|)))
(assert (forall ((s1 Set<Int>) (s2 Set<Int>)) (!
  (= (Set_union s1 (Set_union s1 s2)) (Set_union s1 s2))
  :pattern ((Set_union s1 (Set_union s1 s2)))
  :qid |$Set[Int]_prog.union_left_idempotency|)))
(assert (forall ((s1 Set<Int>) (s2 Set<Int>)) (!
  (= (Set_union (Set_union s1 s2) s2) (Set_union s1 s2))
  :pattern ((Set_union (Set_union s1 s2) s2))
  :qid |$Set[Int]_prog.union_right_idempotency|)))
(assert (forall ((s1 Set<Int>) (s2 Set<Int>)) (!
  (= (Set_intersection s1 (Set_intersection s1 s2)) (Set_intersection s1 s2))
  :pattern ((Set_intersection s1 (Set_intersection s1 s2)))
  :qid |$Set[Int]_prog.intersection_left_idempotency|)))
(assert (forall ((s1 Set<Int>) (s2 Set<Int>)) (!
  (= (Set_intersection (Set_intersection s1 s2) s2) (Set_intersection s1 s2))
  :pattern ((Set_intersection (Set_intersection s1 s2) s2))
  :qid |$Set[Int]_prog.intersection_right_idempotency|)))
(assert (forall ((s1 Set<Int>) (s2 Set<Int>)) (!
  (=
    (+ (Set_card (Set_union s1 s2)) (Set_card (Set_intersection s1 s2)))
    (+ (Set_card s1) (Set_card s2)))
  :pattern ((Set_card (Set_union s1 s2)))
  :pattern ((Set_card (Set_intersection s1 s2)))
  :qid |$Set[Int]_prog.cardinality_sums|)))
(assert (forall ((s1 Set<Int>) (s2 Set<Int>) (e Int)) (!
  (= (Set_in e (Set_difference s1 s2)) (and (Set_in e s1) (not (Set_in e s2))))
  :pattern ((Set_in e (Set_difference s1 s2)))
  :qid |$Set[Int]_prog.in_difference|)))
(assert (forall ((s1 Set<Int>) (s2 Set<Int>) (e Int)) (!
  (=> (Set_in e s2) (not (Set_in e (Set_difference s1 s2))))
  :pattern ((Set_difference s1 s2) (Set_in e s2))
  :qid |$Set[Int]_prog.not_in_difference|)))
(assert (forall ((s1 Set<Int>) (s2 Set<Int>)) (!
  (=
    (Set_subset s1 s2)
    (forall ((e Int)) (!
      (=> (Set_in e s1) (Set_in e s2))
      :pattern ((Set_in e s1))
      :pattern ((Set_in e s2))
      )))
  :pattern ((Set_subset s1 s2))
  :qid |$Set[Int]_prog.subset_definition|)))
(assert (forall ((s1 Set<Int>) (s2 Set<Int>)) (!
  (=
    (Set_equal s1 s2)
    (forall ((e Int)) (!
      (= (Set_in e s1) (Set_in e s2))
      :pattern ((Set_in e s1))
      :pattern ((Set_in e s2))
      )))
  :pattern ((Set_equal s1 s2))
  :qid |$Set[Int]_prog.equality_definition|)))
(assert (forall ((s1 Set<Int>) (s2 Set<Int>)) (!
  (=> (Set_equal s1 s2) (= s1 s2))
  :pattern ((Set_equal s1 s2))
  :qid |$Set[Int]_prog.native_equality|)))
(assert (forall ((s1 Set<Int>) (s2 Set<Int>)) (!
  (=
    (Set_disjoint s1 s2)
    (forall ((e Int)) (!
      (or (not (Set_in e s1)) (not (Set_in e s2)))
      :pattern ((Set_in e s1))
      :pattern ((Set_in e s2))
      )))
  :pattern ((Set_disjoint s1 s2))
  :qid |$Set[Int]_prog.disjointness_definition|)))
(assert (forall ((s1 Set<Int>) (s2 Set<Int>)) (!
  (and
    (=
      (+
        (+ (Set_card (Set_difference s1 s2)) (Set_card (Set_difference s2 s1)))
        (Set_card (Set_intersection s1 s2)))
      (Set_card (Set_union s1 s2)))
    (=
      (Set_card (Set_difference s1 s2))
      (- (Set_card s1) (Set_card (Set_intersection s1 s2)))))
  :pattern ((Set_card (Set_difference s1 s2)))
  :qid |$Set[Int]_prog.cardinality_difference|)))
(assert (forall ((s Set<$Ref>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  :qid |$Set[Ref]_prog.card_non_negative|)))
(assert (forall ((e $Ref)) (!
  (not (Set_in e (as Set_empty  Set<$Ref>)))
  :pattern ((Set_in e (as Set_empty  Set<$Ref>)))
  :qid |$Set[Ref]_prog.in_empty_set|)))
(assert (forall ((s Set<$Ref>)) (!
  (and
    (= (= (Set_card s) 0) (= s (as Set_empty  Set<$Ref>)))
    (=>
      (not (= (Set_card s) 0))
      (exists ((e $Ref)) (!
        (Set_in e s)
        :pattern ((Set_in e s))
        ))))
  :pattern ((Set_card s))
  :qid |$Set[Ref]_prog.empty_set_cardinality|)))
(assert (forall ((e $Ref)) (!
  (Set_in e (Set_singleton e))
  :pattern ((Set_singleton e))
  :qid |$Set[Ref]_prog.in_singleton_set|)))
(assert (forall ((e1 $Ref) (e2 $Ref)) (!
  (= (Set_in e1 (Set_singleton e2)) (= e1 e2))
  :pattern ((Set_in e1 (Set_singleton e2)))
  :qid |$Set[Ref]_prog.in_singleton_set_equality|)))
(assert (forall ((e $Ref)) (!
  (= (Set_card (Set_singleton e)) 1)
  :pattern ((Set_card (Set_singleton e)))
  :qid |$Set[Ref]_prog.singleton_set_cardinality|)))
(assert (forall ((s Set<$Ref>) (e $Ref)) (!
  (Set_in e (Set_unionone s e))
  :pattern ((Set_unionone s e))
  :qid |$Set[Ref]_prog.in_unionone_same|)))
(assert (forall ((s Set<$Ref>) (e1 $Ref) (e2 $Ref)) (!
  (= (Set_in e1 (Set_unionone s e2)) (or (= e1 e2) (Set_in e1 s)))
  :pattern ((Set_in e1 (Set_unionone s e2)))
  :qid |$Set[Ref]_prog.in_unionone_other|)))
(assert (forall ((s Set<$Ref>) (e1 $Ref) (e2 $Ref)) (!
  (=> (Set_in e1 s) (Set_in e1 (Set_unionone s e2)))
  :pattern ((Set_in e1 s) (Set_unionone s e2))
  :qid |$Set[Ref]_prog.invariance_in_unionone|)))
(assert (forall ((s Set<$Ref>) (e $Ref)) (!
  (=> (Set_in e s) (= (Set_card (Set_unionone s e)) (Set_card s)))
  :pattern ((Set_card (Set_unionone s e)))
  :qid |$Set[Ref]_prog.unionone_cardinality_invariant|)))
(assert (forall ((s Set<$Ref>) (e $Ref)) (!
  (=> (not (Set_in e s)) (= (Set_card (Set_unionone s e)) (+ (Set_card s) 1)))
  :pattern ((Set_card (Set_unionone s e)))
  :qid |$Set[Ref]_prog.unionone_cardinality_changed|)))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>) (e $Ref)) (!
  (= (Set_in e (Set_union s1 s2)) (or (Set_in e s1) (Set_in e s2)))
  :pattern ((Set_in e (Set_union s1 s2)))
  :qid |$Set[Ref]_prog.in_union_in_one|)))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>) (e $Ref)) (!
  (=> (Set_in e s1) (Set_in e (Set_union s1 s2)))
  :pattern ((Set_in e s1) (Set_union s1 s2))
  :qid |$Set[Ref]_prog.in_left_in_union|)))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>) (e $Ref)) (!
  (=> (Set_in e s2) (Set_in e (Set_union s1 s2)))
  :pattern ((Set_in e s2) (Set_union s1 s2))
  :qid |$Set[Ref]_prog.in_right_in_union|)))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>) (e $Ref)) (!
  (= (Set_in e (Set_intersection s1 s2)) (and (Set_in e s1) (Set_in e s2)))
  :pattern ((Set_in e (Set_intersection s1 s2)))
  :pattern ((Set_intersection s1 s2) (Set_in e s1))
  :pattern ((Set_intersection s1 s2) (Set_in e s2))
  :qid |$Set[Ref]_prog.in_intersection_in_both|)))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>)) (!
  (= (Set_union s1 (Set_union s1 s2)) (Set_union s1 s2))
  :pattern ((Set_union s1 (Set_union s1 s2)))
  :qid |$Set[Ref]_prog.union_left_idempotency|)))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>)) (!
  (= (Set_union (Set_union s1 s2) s2) (Set_union s1 s2))
  :pattern ((Set_union (Set_union s1 s2) s2))
  :qid |$Set[Ref]_prog.union_right_idempotency|)))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>)) (!
  (= (Set_intersection s1 (Set_intersection s1 s2)) (Set_intersection s1 s2))
  :pattern ((Set_intersection s1 (Set_intersection s1 s2)))
  :qid |$Set[Ref]_prog.intersection_left_idempotency|)))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>)) (!
  (= (Set_intersection (Set_intersection s1 s2) s2) (Set_intersection s1 s2))
  :pattern ((Set_intersection (Set_intersection s1 s2) s2))
  :qid |$Set[Ref]_prog.intersection_right_idempotency|)))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>)) (!
  (=
    (+ (Set_card (Set_union s1 s2)) (Set_card (Set_intersection s1 s2)))
    (+ (Set_card s1) (Set_card s2)))
  :pattern ((Set_card (Set_union s1 s2)))
  :pattern ((Set_card (Set_intersection s1 s2)))
  :qid |$Set[Ref]_prog.cardinality_sums|)))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>) (e $Ref)) (!
  (= (Set_in e (Set_difference s1 s2)) (and (Set_in e s1) (not (Set_in e s2))))
  :pattern ((Set_in e (Set_difference s1 s2)))
  :qid |$Set[Ref]_prog.in_difference|)))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>) (e $Ref)) (!
  (=> (Set_in e s2) (not (Set_in e (Set_difference s1 s2))))
  :pattern ((Set_difference s1 s2) (Set_in e s2))
  :qid |$Set[Ref]_prog.not_in_difference|)))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>)) (!
  (=
    (Set_subset s1 s2)
    (forall ((e $Ref)) (!
      (=> (Set_in e s1) (Set_in e s2))
      :pattern ((Set_in e s1))
      :pattern ((Set_in e s2))
      )))
  :pattern ((Set_subset s1 s2))
  :qid |$Set[Ref]_prog.subset_definition|)))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>)) (!
  (=
    (Set_equal s1 s2)
    (forall ((e $Ref)) (!
      (= (Set_in e s1) (Set_in e s2))
      :pattern ((Set_in e s1))
      :pattern ((Set_in e s2))
      )))
  :pattern ((Set_equal s1 s2))
  :qid |$Set[Ref]_prog.equality_definition|)))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>)) (!
  (=> (Set_equal s1 s2) (= s1 s2))
  :pattern ((Set_equal s1 s2))
  :qid |$Set[Ref]_prog.native_equality|)))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>)) (!
  (=
    (Set_disjoint s1 s2)
    (forall ((e $Ref)) (!
      (or (not (Set_in e s1)) (not (Set_in e s2)))
      :pattern ((Set_in e s1))
      :pattern ((Set_in e s2))
      )))
  :pattern ((Set_disjoint s1 s2))
  :qid |$Set[Ref]_prog.disjointness_definition|)))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>)) (!
  (and
    (=
      (+
        (+ (Set_card (Set_difference s1 s2)) (Set_card (Set_difference s2 s1)))
        (Set_card (Set_intersection s1 s2)))
      (Set_card (Set_union s1 s2)))
    (=
      (Set_card (Set_difference s1 s2))
      (- (Set_card s1) (Set_card (Set_intersection s1 s2)))))
  :pattern ((Set_card (Set_difference s1 s2)))
  :qid |$Set[Ref]_prog.cardinality_difference|)))
(assert (forall ((s Set<Bool>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  :qid |$Set[Bool]_prog.card_non_negative|)))
(assert (forall ((e Bool)) (!
  (not (Set_in e (as Set_empty  Set<Bool>)))
  :pattern ((Set_in e (as Set_empty  Set<Bool>)))
  :qid |$Set[Bool]_prog.in_empty_set|)))
(assert (forall ((s Set<Bool>)) (!
  (and
    (= (= (Set_card s) 0) (= s (as Set_empty  Set<Bool>)))
    (=>
      (not (= (Set_card s) 0))
      (exists ((e Bool)) (!
        (Set_in e s)
        :pattern ((Set_in e s))
        ))))
  :pattern ((Set_card s))
  :qid |$Set[Bool]_prog.empty_set_cardinality|)))
(assert (forall ((e Bool)) (!
  (Set_in e (Set_singleton e))
  :pattern ((Set_singleton e))
  :qid |$Set[Bool]_prog.in_singleton_set|)))
(assert (forall ((e1 Bool) (e2 Bool)) (!
  (= (Set_in e1 (Set_singleton e2)) (= e1 e2))
  :pattern ((Set_in e1 (Set_singleton e2)))
  :qid |$Set[Bool]_prog.in_singleton_set_equality|)))
(assert (forall ((e Bool)) (!
  (= (Set_card (Set_singleton e)) 1)
  :pattern ((Set_card (Set_singleton e)))
  :qid |$Set[Bool]_prog.singleton_set_cardinality|)))
(assert (forall ((s Set<Bool>) (e Bool)) (!
  (Set_in e (Set_unionone s e))
  :pattern ((Set_unionone s e))
  :qid |$Set[Bool]_prog.in_unionone_same|)))
(assert (forall ((s Set<Bool>) (e1 Bool) (e2 Bool)) (!
  (= (Set_in e1 (Set_unionone s e2)) (or (= e1 e2) (Set_in e1 s)))
  :pattern ((Set_in e1 (Set_unionone s e2)))
  :qid |$Set[Bool]_prog.in_unionone_other|)))
(assert (forall ((s Set<Bool>) (e1 Bool) (e2 Bool)) (!
  (=> (Set_in e1 s) (Set_in e1 (Set_unionone s e2)))
  :pattern ((Set_in e1 s) (Set_unionone s e2))
  :qid |$Set[Bool]_prog.invariance_in_unionone|)))
(assert (forall ((s Set<Bool>) (e Bool)) (!
  (=> (Set_in e s) (= (Set_card (Set_unionone s e)) (Set_card s)))
  :pattern ((Set_card (Set_unionone s e)))
  :qid |$Set[Bool]_prog.unionone_cardinality_invariant|)))
(assert (forall ((s Set<Bool>) (e Bool)) (!
  (=> (not (Set_in e s)) (= (Set_card (Set_unionone s e)) (+ (Set_card s) 1)))
  :pattern ((Set_card (Set_unionone s e)))
  :qid |$Set[Bool]_prog.unionone_cardinality_changed|)))
(assert (forall ((s1 Set<Bool>) (s2 Set<Bool>) (e Bool)) (!
  (= (Set_in e (Set_union s1 s2)) (or (Set_in e s1) (Set_in e s2)))
  :pattern ((Set_in e (Set_union s1 s2)))
  :qid |$Set[Bool]_prog.in_union_in_one|)))
(assert (forall ((s1 Set<Bool>) (s2 Set<Bool>) (e Bool)) (!
  (=> (Set_in e s1) (Set_in e (Set_union s1 s2)))
  :pattern ((Set_in e s1) (Set_union s1 s2))
  :qid |$Set[Bool]_prog.in_left_in_union|)))
(assert (forall ((s1 Set<Bool>) (s2 Set<Bool>) (e Bool)) (!
  (=> (Set_in e s2) (Set_in e (Set_union s1 s2)))
  :pattern ((Set_in e s2) (Set_union s1 s2))
  :qid |$Set[Bool]_prog.in_right_in_union|)))
(assert (forall ((s1 Set<Bool>) (s2 Set<Bool>) (e Bool)) (!
  (= (Set_in e (Set_intersection s1 s2)) (and (Set_in e s1) (Set_in e s2)))
  :pattern ((Set_in e (Set_intersection s1 s2)))
  :pattern ((Set_intersection s1 s2) (Set_in e s1))
  :pattern ((Set_intersection s1 s2) (Set_in e s2))
  :qid |$Set[Bool]_prog.in_intersection_in_both|)))
(assert (forall ((s1 Set<Bool>) (s2 Set<Bool>)) (!
  (= (Set_union s1 (Set_union s1 s2)) (Set_union s1 s2))
  :pattern ((Set_union s1 (Set_union s1 s2)))
  :qid |$Set[Bool]_prog.union_left_idempotency|)))
(assert (forall ((s1 Set<Bool>) (s2 Set<Bool>)) (!
  (= (Set_union (Set_union s1 s2) s2) (Set_union s1 s2))
  :pattern ((Set_union (Set_union s1 s2) s2))
  :qid |$Set[Bool]_prog.union_right_idempotency|)))
(assert (forall ((s1 Set<Bool>) (s2 Set<Bool>)) (!
  (= (Set_intersection s1 (Set_intersection s1 s2)) (Set_intersection s1 s2))
  :pattern ((Set_intersection s1 (Set_intersection s1 s2)))
  :qid |$Set[Bool]_prog.intersection_left_idempotency|)))
(assert (forall ((s1 Set<Bool>) (s2 Set<Bool>)) (!
  (= (Set_intersection (Set_intersection s1 s2) s2) (Set_intersection s1 s2))
  :pattern ((Set_intersection (Set_intersection s1 s2) s2))
  :qid |$Set[Bool]_prog.intersection_right_idempotency|)))
(assert (forall ((s1 Set<Bool>) (s2 Set<Bool>)) (!
  (=
    (+ (Set_card (Set_union s1 s2)) (Set_card (Set_intersection s1 s2)))
    (+ (Set_card s1) (Set_card s2)))
  :pattern ((Set_card (Set_union s1 s2)))
  :pattern ((Set_card (Set_intersection s1 s2)))
  :qid |$Set[Bool]_prog.cardinality_sums|)))
(assert (forall ((s1 Set<Bool>) (s2 Set<Bool>) (e Bool)) (!
  (= (Set_in e (Set_difference s1 s2)) (and (Set_in e s1) (not (Set_in e s2))))
  :pattern ((Set_in e (Set_difference s1 s2)))
  :qid |$Set[Bool]_prog.in_difference|)))
(assert (forall ((s1 Set<Bool>) (s2 Set<Bool>) (e Bool)) (!
  (=> (Set_in e s2) (not (Set_in e (Set_difference s1 s2))))
  :pattern ((Set_difference s1 s2) (Set_in e s2))
  :qid |$Set[Bool]_prog.not_in_difference|)))
(assert (forall ((s1 Set<Bool>) (s2 Set<Bool>)) (!
  (=
    (Set_subset s1 s2)
    (forall ((e Bool)) (!
      (=> (Set_in e s1) (Set_in e s2))
      :pattern ((Set_in e s1))
      :pattern ((Set_in e s2))
      )))
  :pattern ((Set_subset s1 s2))
  :qid |$Set[Bool]_prog.subset_definition|)))
(assert (forall ((s1 Set<Bool>) (s2 Set<Bool>)) (!
  (=
    (Set_equal s1 s2)
    (forall ((e Bool)) (!
      (= (Set_in e s1) (Set_in e s2))
      :pattern ((Set_in e s1))
      :pattern ((Set_in e s2))
      )))
  :pattern ((Set_equal s1 s2))
  :qid |$Set[Bool]_prog.equality_definition|)))
(assert (forall ((s1 Set<Bool>) (s2 Set<Bool>)) (!
  (=> (Set_equal s1 s2) (= s1 s2))
  :pattern ((Set_equal s1 s2))
  :qid |$Set[Bool]_prog.native_equality|)))
(assert (forall ((s1 Set<Bool>) (s2 Set<Bool>)) (!
  (=
    (Set_disjoint s1 s2)
    (forall ((e Bool)) (!
      (or (not (Set_in e s1)) (not (Set_in e s2)))
      :pattern ((Set_in e s1))
      :pattern ((Set_in e s2))
      )))
  :pattern ((Set_disjoint s1 s2))
  :qid |$Set[Bool]_prog.disjointness_definition|)))
(assert (forall ((s1 Set<Bool>) (s2 Set<Bool>)) (!
  (and
    (=
      (+
        (+ (Set_card (Set_difference s1 s2)) (Set_card (Set_difference s2 s1)))
        (Set_card (Set_intersection s1 s2)))
      (Set_card (Set_union s1 s2)))
    (=
      (Set_card (Set_difference s1 s2))
      (- (Set_card s1) (Set_card (Set_intersection s1 s2)))))
  :pattern ((Set_card (Set_difference s1 s2)))
  :qid |$Set[Bool]_prog.cardinality_difference|)))
(assert (forall ((s Set<$Snap>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  :qid |$Set[Snap]_prog.card_non_negative|)))
(assert (forall ((e $Snap)) (!
  (not (Set_in e (as Set_empty  Set<$Snap>)))
  :pattern ((Set_in e (as Set_empty  Set<$Snap>)))
  :qid |$Set[Snap]_prog.in_empty_set|)))
(assert (forall ((s Set<$Snap>)) (!
  (and
    (= (= (Set_card s) 0) (= s (as Set_empty  Set<$Snap>)))
    (=>
      (not (= (Set_card s) 0))
      (exists ((e $Snap)) (!
        (Set_in e s)
        :pattern ((Set_in e s))
        ))))
  :pattern ((Set_card s))
  :qid |$Set[Snap]_prog.empty_set_cardinality|)))
(assert (forall ((e $Snap)) (!
  (Set_in e (Set_singleton e))
  :pattern ((Set_singleton e))
  :qid |$Set[Snap]_prog.in_singleton_set|)))
(assert (forall ((e1 $Snap) (e2 $Snap)) (!
  (= (Set_in e1 (Set_singleton e2)) (= e1 e2))
  :pattern ((Set_in e1 (Set_singleton e2)))
  :qid |$Set[Snap]_prog.in_singleton_set_equality|)))
(assert (forall ((e $Snap)) (!
  (= (Set_card (Set_singleton e)) 1)
  :pattern ((Set_card (Set_singleton e)))
  :qid |$Set[Snap]_prog.singleton_set_cardinality|)))
(assert (forall ((s Set<$Snap>) (e $Snap)) (!
  (Set_in e (Set_unionone s e))
  :pattern ((Set_unionone s e))
  :qid |$Set[Snap]_prog.in_unionone_same|)))
(assert (forall ((s Set<$Snap>) (e1 $Snap) (e2 $Snap)) (!
  (= (Set_in e1 (Set_unionone s e2)) (or (= e1 e2) (Set_in e1 s)))
  :pattern ((Set_in e1 (Set_unionone s e2)))
  :qid |$Set[Snap]_prog.in_unionone_other|)))
(assert (forall ((s Set<$Snap>) (e1 $Snap) (e2 $Snap)) (!
  (=> (Set_in e1 s) (Set_in e1 (Set_unionone s e2)))
  :pattern ((Set_in e1 s) (Set_unionone s e2))
  :qid |$Set[Snap]_prog.invariance_in_unionone|)))
(assert (forall ((s Set<$Snap>) (e $Snap)) (!
  (=> (Set_in e s) (= (Set_card (Set_unionone s e)) (Set_card s)))
  :pattern ((Set_card (Set_unionone s e)))
  :qid |$Set[Snap]_prog.unionone_cardinality_invariant|)))
(assert (forall ((s Set<$Snap>) (e $Snap)) (!
  (=> (not (Set_in e s)) (= (Set_card (Set_unionone s e)) (+ (Set_card s) 1)))
  :pattern ((Set_card (Set_unionone s e)))
  :qid |$Set[Snap]_prog.unionone_cardinality_changed|)))
(assert (forall ((s1 Set<$Snap>) (s2 Set<$Snap>) (e $Snap)) (!
  (= (Set_in e (Set_union s1 s2)) (or (Set_in e s1) (Set_in e s2)))
  :pattern ((Set_in e (Set_union s1 s2)))
  :qid |$Set[Snap]_prog.in_union_in_one|)))
(assert (forall ((s1 Set<$Snap>) (s2 Set<$Snap>) (e $Snap)) (!
  (=> (Set_in e s1) (Set_in e (Set_union s1 s2)))
  :pattern ((Set_in e s1) (Set_union s1 s2))
  :qid |$Set[Snap]_prog.in_left_in_union|)))
(assert (forall ((s1 Set<$Snap>) (s2 Set<$Snap>) (e $Snap)) (!
  (=> (Set_in e s2) (Set_in e (Set_union s1 s2)))
  :pattern ((Set_in e s2) (Set_union s1 s2))
  :qid |$Set[Snap]_prog.in_right_in_union|)))
(assert (forall ((s1 Set<$Snap>) (s2 Set<$Snap>) (e $Snap)) (!
  (= (Set_in e (Set_intersection s1 s2)) (and (Set_in e s1) (Set_in e s2)))
  :pattern ((Set_in e (Set_intersection s1 s2)))
  :pattern ((Set_intersection s1 s2) (Set_in e s1))
  :pattern ((Set_intersection s1 s2) (Set_in e s2))
  :qid |$Set[Snap]_prog.in_intersection_in_both|)))
(assert (forall ((s1 Set<$Snap>) (s2 Set<$Snap>)) (!
  (= (Set_union s1 (Set_union s1 s2)) (Set_union s1 s2))
  :pattern ((Set_union s1 (Set_union s1 s2)))
  :qid |$Set[Snap]_prog.union_left_idempotency|)))
(assert (forall ((s1 Set<$Snap>) (s2 Set<$Snap>)) (!
  (= (Set_union (Set_union s1 s2) s2) (Set_union s1 s2))
  :pattern ((Set_union (Set_union s1 s2) s2))
  :qid |$Set[Snap]_prog.union_right_idempotency|)))
(assert (forall ((s1 Set<$Snap>) (s2 Set<$Snap>)) (!
  (= (Set_intersection s1 (Set_intersection s1 s2)) (Set_intersection s1 s2))
  :pattern ((Set_intersection s1 (Set_intersection s1 s2)))
  :qid |$Set[Snap]_prog.intersection_left_idempotency|)))
(assert (forall ((s1 Set<$Snap>) (s2 Set<$Snap>)) (!
  (= (Set_intersection (Set_intersection s1 s2) s2) (Set_intersection s1 s2))
  :pattern ((Set_intersection (Set_intersection s1 s2) s2))
  :qid |$Set[Snap]_prog.intersection_right_idempotency|)))
(assert (forall ((s1 Set<$Snap>) (s2 Set<$Snap>)) (!
  (=
    (+ (Set_card (Set_union s1 s2)) (Set_card (Set_intersection s1 s2)))
    (+ (Set_card s1) (Set_card s2)))
  :pattern ((Set_card (Set_union s1 s2)))
  :pattern ((Set_card (Set_intersection s1 s2)))
  :qid |$Set[Snap]_prog.cardinality_sums|)))
(assert (forall ((s1 Set<$Snap>) (s2 Set<$Snap>) (e $Snap)) (!
  (= (Set_in e (Set_difference s1 s2)) (and (Set_in e s1) (not (Set_in e s2))))
  :pattern ((Set_in e (Set_difference s1 s2)))
  :qid |$Set[Snap]_prog.in_difference|)))
(assert (forall ((s1 Set<$Snap>) (s2 Set<$Snap>) (e $Snap)) (!
  (=> (Set_in e s2) (not (Set_in e (Set_difference s1 s2))))
  :pattern ((Set_difference s1 s2) (Set_in e s2))
  :qid |$Set[Snap]_prog.not_in_difference|)))
(assert (forall ((s1 Set<$Snap>) (s2 Set<$Snap>)) (!
  (=
    (Set_subset s1 s2)
    (forall ((e $Snap)) (!
      (=> (Set_in e s1) (Set_in e s2))
      :pattern ((Set_in e s1))
      :pattern ((Set_in e s2))
      )))
  :pattern ((Set_subset s1 s2))
  :qid |$Set[Snap]_prog.subset_definition|)))
(assert (forall ((s1 Set<$Snap>) (s2 Set<$Snap>)) (!
  (=
    (Set_equal s1 s2)
    (forall ((e $Snap)) (!
      (= (Set_in e s1) (Set_in e s2))
      :pattern ((Set_in e s1))
      :pattern ((Set_in e s2))
      )))
  :pattern ((Set_equal s1 s2))
  :qid |$Set[Snap]_prog.equality_definition|)))
(assert (forall ((s1 Set<$Snap>) (s2 Set<$Snap>)) (!
  (=> (Set_equal s1 s2) (= s1 s2))
  :pattern ((Set_equal s1 s2))
  :qid |$Set[Snap]_prog.native_equality|)))
(assert (forall ((s1 Set<$Snap>) (s2 Set<$Snap>)) (!
  (=
    (Set_disjoint s1 s2)
    (forall ((e $Snap)) (!
      (or (not (Set_in e s1)) (not (Set_in e s2)))
      :pattern ((Set_in e s1))
      :pattern ((Set_in e s2))
      )))
  :pattern ((Set_disjoint s1 s2))
  :qid |$Set[Snap]_prog.disjointness_definition|)))
(assert (forall ((s1 Set<$Snap>) (s2 Set<$Snap>)) (!
  (and
    (=
      (+
        (+ (Set_card (Set_difference s1 s2)) (Set_card (Set_difference s2 s1)))
        (Set_card (Set_intersection s1 s2)))
      (Set_card (Set_union s1 s2)))
    (=
      (Set_card (Set_difference s1 s2))
      (- (Set_card s1) (Set_card (Set_intersection s1 s2)))))
  :pattern ((Set_card (Set_difference s1 s2)))
  :qid |$Set[Snap]_prog.cardinality_difference|)))
(assert (forall ((_l_0 Int) (_l_1 Int) (_r_0 Int) (_r_1 Int)) (!
  (=>
    (=
      (cons$0$__$TY$__Snap$struct$m_Point$$int$$$int$$Snap$struct$m_Point<Snap$struct$m_Point> _l_0 _l_1)
      (cons$0$__$TY$__Snap$struct$m_Point$$int$$$int$$Snap$struct$m_Point<Snap$struct$m_Point> _r_0 _r_1))
    (and (= _l_0 _r_0) (= _l_1 _r_1)))
  :pattern ((cons$0$__$TY$__Snap$struct$m_Point$$int$$$int$$Snap$struct$m_Point<Snap$struct$m_Point> _l_0 _l_1) (cons$0$__$TY$__Snap$struct$m_Point$$int$$$int$$Snap$struct$m_Point<Snap$struct$m_Point> _r_0 _r_1))
  :qid |prog.Snap$struct$m_Point$0$injectivity|)))
(assert (forall ((_0 Int) (_1 Int)) (!
  (=
    (Snap$struct$m_Point$0$field$f$x__$TY$__Snap$struct$m_Point$$int$<Int> (cons$0$__$TY$__Snap$struct$m_Point$$int$$$int$$Snap$struct$m_Point<Snap$struct$m_Point> _0 _1))
    _0)
  :pattern ((Snap$struct$m_Point$0$field$f$x__$TY$__Snap$struct$m_Point$$int$<Int> (cons$0$__$TY$__Snap$struct$m_Point$$int$$$int$$Snap$struct$m_Point<Snap$struct$m_Point> _0 _1)))
  :qid |prog.Snap$struct$m_Point$0$field$f$x$axiom|)))
(assert (forall ((self Snap$struct$m_Point)) (!
  (and
    (<=
      (- 0 2147483648)
      (Snap$struct$m_Point$0$field$f$x__$TY$__Snap$struct$m_Point$$int$<Int> self))
    (<=
      (Snap$struct$m_Point$0$field$f$x__$TY$__Snap$struct$m_Point$$int$<Int> self)
      2147483647))
  :pattern ((Snap$struct$m_Point$0$field$f$x__$TY$__Snap$struct$m_Point$$int$<Int> self))
  :qid |prog.Snap$struct$m_Point$0$field$f$x$valid|)))
(assert (forall ((_0 Int) (_1 Int)) (!
  (=
    (Snap$struct$m_Point$0$field$f$y__$TY$__Snap$struct$m_Point$$int$<Int> (cons$0$__$TY$__Snap$struct$m_Point$$int$$$int$$Snap$struct$m_Point<Snap$struct$m_Point> _0 _1))
    _1)
  :pattern ((Snap$struct$m_Point$0$field$f$y__$TY$__Snap$struct$m_Point$$int$<Int> (cons$0$__$TY$__Snap$struct$m_Point$$int$$$int$$Snap$struct$m_Point<Snap$struct$m_Point> _0 _1)))
  :qid |prog.Snap$struct$m_Point$0$field$f$y$axiom|)))
(assert (forall ((self Snap$struct$m_Point)) (!
  (and
    (<=
      (- 0 2147483648)
      (Snap$struct$m_Point$0$field$f$y__$TY$__Snap$struct$m_Point$$int$<Int> self))
    (<=
      (Snap$struct$m_Point$0$field$f$y__$TY$__Snap$struct$m_Point$$int$<Int> self)
      2147483647))
  :pattern ((Snap$struct$m_Point$0$field$f$y__$TY$__Snap$struct$m_Point$$int$<Int> self))
  :qid |prog.Snap$struct$m_Point$0$field$f$y$valid|)))
(assert (forall ((_l_0 Snap$struct$m_Point) (_l_1 Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_) (_r_0 Snap$struct$m_Point) (_r_1 Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_)) (!
  (=>
    (=
      (cons$0$__$TY$__Snap$struct$m_Route$Snap$struct$m_Point$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$struct$m_Route<Snap$struct$m_Route> _l_0 _l_1)
      (cons$0$__$TY$__Snap$struct$m_Route$Snap$struct$m_Point$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$struct$m_Route<Snap$struct$m_Route> _r_0 _r_1))
    (and (= _l_0 _r_0) (= _l_1 _r_1)))
  :pattern ((cons$0$__$TY$__Snap$struct$m_Route$Snap$struct$m_Point$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$struct$m_Route<Snap$struct$m_Route> _l_0 _l_1) (cons$0$__$TY$__Snap$struct$m_Route$Snap$struct$m_Point$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$struct$m_Route<Snap$struct$m_Route> _r_0 _r_1))
  :qid |prog.Snap$struct$m_Route$0$injectivity|)))
(assert (forall ((_0 Snap$struct$m_Point) (_1 Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_)) (!
  (=
    (Snap$struct$m_Route$0$field$f$current__$TY$__Snap$struct$m_Route$Snap$struct$m_Point<Snap$struct$m_Point> (cons$0$__$TY$__Snap$struct$m_Route$Snap$struct$m_Point$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$struct$m_Route<Snap$struct$m_Route> _0 _1))
    _0)
  :pattern ((Snap$struct$m_Route$0$field$f$current__$TY$__Snap$struct$m_Route$Snap$struct$m_Point<Snap$struct$m_Point> (cons$0$__$TY$__Snap$struct$m_Route$Snap$struct$m_Point$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$struct$m_Route<Snap$struct$m_Route> _0 _1)))
  :qid |prog.Snap$struct$m_Route$0$field$f$current$axiom|)))
(assert (forall ((_0 Snap$struct$m_Point) (_1 Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_)) (!
  (=
    (Snap$struct$m_Route$0$field$f$rest__$TY$__Snap$struct$m_Route$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_<Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_> (cons$0$__$TY$__Snap$struct$m_Route$Snap$struct$m_Point$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$struct$m_Route<Snap$struct$m_Route> _0 _1))
    _1)
  :pattern ((Snap$struct$m_Route$0$field$f$rest__$TY$__Snap$struct$m_Route$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_<Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_> (cons$0$__$TY$__Snap$struct$m_Route$Snap$struct$m_Point$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$struct$m_Route<Snap$struct$m_Route> _0 _1)))
  :qid |prog.Snap$struct$m_Route$0$field$f$rest$axiom|)))
(assert (forall ((self Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_)) (!
  (and
    (<=
      0
      (discriminant$__$TY$__Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$int$<Int> self))
    (<=
      (discriminant$__$TY$__Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$int$<Int> self)
      1))
  :pattern ((discriminant$__$TY$__Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$int$<Int> self))
  :qid |prog.Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$discriminant_range|)))
(assert (=
  (discriminant$__$TY$__Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$int$<Int> (as cons$0$__$TY$__Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_<Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_>  Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_))
  0))
(assert (forall ((_l_0 Snap$struct$m_Route) (_r_0 Snap$struct$m_Route)) (!
  (=>
    (=
      (cons$1$__$TY$__Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$struct$m_Route$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_<Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_> _l_0)
      (cons$1$__$TY$__Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$struct$m_Route$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_<Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_> _r_0))
    (= _l_0 _r_0))
  :pattern ((cons$1$__$TY$__Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$struct$m_Route$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_<Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_> _l_0) (cons$1$__$TY$__Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$struct$m_Route$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_<Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_> _r_0))
  :qid |prog.Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$1$injectivity|)))
(assert (forall ((_0 Snap$struct$m_Route)) (!
  (=
    (discriminant$__$TY$__Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$int$<Int> (cons$1$__$TY$__Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$struct$m_Route$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_<Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_> _0))
    1)
  :pattern ((cons$1$__$TY$__Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$struct$m_Route$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_<Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_> _0))
  :qid |prog.Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$1$discriminant_axiom|)))
(assert (forall ((_0 Snap$struct$m_Route)) (!
  (=
    (Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$1$field$f$0__$TY$__Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$struct$m_Route<Snap$struct$m_Route> (cons$1$__$TY$__Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$struct$m_Route$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_<Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_> _0))
    _0)
  :pattern ((Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$1$field$f$0__$TY$__Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$struct$m_Route<Snap$struct$m_Route> (cons$1$__$TY$__Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$struct$m_Route$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_<Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_> _0)))
  :qid |prog.Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$1$field$f$0$axiom|)))
; /field_value_functions_axioms.smt2 [val_ref: Ref]
(assert (forall ((vs $FVF<val_ref>) (ws $FVF<val_ref>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_val_ref vs) ($FVF.domain_val_ref ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_val_ref vs))
            (= ($FVF.lookup_val_ref vs x) ($FVF.lookup_val_ref ws x)))
          :pattern (($FVF.lookup_val_ref vs x) ($FVF.lookup_val_ref ws x))
          :qid |qp.$FVF<val_ref>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<val_ref>To$Snap vs)
              ($SortWrappers.$FVF<val_ref>To$Snap ws)
              )
    :qid |qp.$FVF<val_ref>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_val_ref pm r))
    :pattern (($FVF.perm_val_ref pm r)))))
(assert (forall ((r $Ref) (f $Ref)) (!
    (= ($FVF.loc_val_ref f r) true)
    :pattern (($FVF.loc_val_ref f r)))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(declare-fun $unresolved@18@00 () $Snap)
(assert (forall ((s@$ $Snap)) (!
  (= (read$%limited s@$) (read$ s@$))
  :pattern ((read$ s@$))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap)) (!
  (as read$%stateless  Bool)
  :pattern ((read$%limited s@$))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap)) (!
  (let ((result@0@00 (read$%limited s@$))) (=>
    (read$%precondition s@$)
    (and (< $Perm.No result@0@00) (< result@0@00 $Perm.Write))))
  :pattern ((read$%limited s@$))
  :qid |quant-u-16|)))
(assert (forall ((s@$ $Snap)) (!
  (let ((result@0@00 (read$%limited s@$))) true)
  :pattern ((read$%limited s@$))
  :qid |quant-u-17|)))
(assert (forall ((s@$ $Snap)) (!
  (let ((result@0@00 (read$%limited s@$))) true)
  :pattern ((read$%limited s@$))
  :qid |quant-u-18|)))
(assert (forall ((s@$ $Snap) (self@1@00 $Ref)) (!
  (=
    (snap$__$TY$__Snap$struct$m_Point$struct$m_Point$Snap$struct$m_Point%limited s@$ self@1@00)
    (snap$__$TY$__Snap$struct$m_Point$struct$m_Point$Snap$struct$m_Point s@$ self@1@00))
  :pattern ((snap$__$TY$__Snap$struct$m_Point$struct$m_Point$Snap$struct$m_Point s@$ self@1@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (self@1@00 $Ref)) (!
  (snap$__$TY$__Snap$struct$m_Point$struct$m_Point$Snap$struct$m_Point%stateless self@1@00)
  :pattern ((snap$__$TY$__Snap$struct$m_Point$struct$m_Point$Snap$struct$m_Point%limited s@$ self@1@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (self@1@00 $Ref)) (!
  (=>
    (snap$__$TY$__Snap$struct$m_Point$struct$m_Point$Snap$struct$m_Point%precondition s@$ self@1@00)
    (=
      (snap$__$TY$__Snap$struct$m_Point$struct$m_Point$Snap$struct$m_Point s@$ self@1@00)
      (cons$0$__$TY$__Snap$struct$m_Point$$int$$$int$$Snap$struct$m_Point<Snap$struct$m_Point> ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second s@$)))))))
  :pattern ((snap$__$TY$__Snap$struct$m_Point$struct$m_Point$Snap$struct$m_Point s@$ self@1@00))
  :qid |quant-u-19|)))
(assert (forall ((s@$ $Snap) (self@1@00 $Ref)) (!
  true
  :pattern ((snap$__$TY$__Snap$struct$m_Point$struct$m_Point$Snap$struct$m_Point s@$ self@1@00))
  :qid |quant-u-20|)))
(assert (forall ((s@$ $Snap)) (!
  (=
    (builtin$unreach__$TY$__$int$$$int$%limited s@$)
    (builtin$unreach__$TY$__$int$$$int$ s@$))
  :pattern ((builtin$unreach__$TY$__$int$$$int$ s@$))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap)) (!
  (as builtin$unreach__$TY$__$int$$$int$%stateless  Bool)
  :pattern ((builtin$unreach__$TY$__$int$$$int$%limited s@$))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (_1@4@00 Snap$struct$m_Route)) (!
  (=
    (m_length__$TY$__Snap$struct$m_Route$$int$%limited s@$ _1@4@00)
    (m_length__$TY$__Snap$struct$m_Route$$int$ s@$ _1@4@00))
  :pattern ((m_length__$TY$__Snap$struct$m_Route$$int$ s@$ _1@4@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (_1@4@00 Snap$struct$m_Route)) (!
  (m_length__$TY$__Snap$struct$m_Route$$int$%stateless _1@4@00)
  :pattern ((m_length__$TY$__Snap$struct$m_Route$$int$%limited s@$ _1@4@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (_1@4@00 Snap$struct$m_Route)) (!
  (let ((result@5@00 (m_length__$TY$__Snap$struct$m_Route$$int$%limited s@$ _1@4@00))) (=>
    (m_length__$TY$__Snap$struct$m_Route$$int$%precondition s@$ _1@4@00)
    (and
      (> result@5@00 0)
      (=
        result@5@00
        (mirror_simple$m_length__$TY$__Snap$struct$m_Route$$int$<Int> _1@4@00)))))
  :pattern ((m_length__$TY$__Snap$struct$m_Route$$int$%limited s@$ _1@4@00))
  :qid |quant-u-21|)))
(assert (forall ((s@$ $Snap) (_1@4@00 Snap$struct$m_Route)) (!
  (let ((result@5@00 (m_length__$TY$__Snap$struct$m_Route$$int$%limited s@$ _1@4@00))) true)
  :pattern ((m_length__$TY$__Snap$struct$m_Route$$int$%limited s@$ _1@4@00))
  :qid |quant-u-22|)))
(assert (forall ((s@$ $Snap) (_1@4@00 Snap$struct$m_Route)) (!
  (let ((result@5@00 (m_length__$TY$__Snap$struct$m_Route$$int$%limited s@$ _1@4@00))) true)
  :pattern ((m_length__$TY$__Snap$struct$m_Route$$int$%limited s@$ _1@4@00))
  :qid |quant-u-23|)))
(assert (forall ((s@$ $Snap) (_1@4@00 Snap$struct$m_Route)) (!
  (=>
    (m_length__$TY$__Snap$struct$m_Route$$int$%precondition s@$ _1@4@00)
    (=
      (m_length__$TY$__Snap$struct$m_Route$$int$ s@$ _1@4@00)
      (ite
        (=
          (discriminant$__$TY$__Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$int$<Int> (Snap$struct$m_Route$0$field$f$rest__$TY$__Snap$struct$m_Route$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_<Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_> _1@4@00))
          0)
        1
        (+
          1
          (m_length__$TY$__Snap$struct$m_Route$$int$%limited ($Snap.combine
            $Snap.unit
            $Snap.unit) (Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$1$field$f$0__$TY$__Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$struct$m_Route<Snap$struct$m_Route> (Snap$struct$m_Route$0$field$f$rest__$TY$__Snap$struct$m_Route$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_<Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_> _1@4@00)))))))
  :pattern ((m_length__$TY$__Snap$struct$m_Route$$int$ s@$ _1@4@00))
  :qid |quant-u-24|)))
(assert (forall ((s@$ $Snap) (_1@4@00 Snap$struct$m_Route)) (!
  (=>
    (m_length__$TY$__Snap$struct$m_Route$$int$%precondition s@$ _1@4@00)
    (ite
      (=
        (discriminant$__$TY$__Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$int$<Int> (Snap$struct$m_Route$0$field$f$rest__$TY$__Snap$struct$m_Route$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_<Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_> _1@4@00))
        0)
      true
      (m_length__$TY$__Snap$struct$m_Route$$int$%precondition ($Snap.combine
        $Snap.unit
        $Snap.unit) (Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$1$field$f$0__$TY$__Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$struct$m_Route<Snap$struct$m_Route> (Snap$struct$m_Route$0$field$f$rest__$TY$__Snap$struct$m_Route$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_<Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_> _1@4@00)))))
  :pattern ((m_length__$TY$__Snap$struct$m_Route$$int$ s@$ _1@4@00))
  :qid |quant-u-25|)))
(assert (forall ((s@$ $Snap) (self@6@00 $Ref)) (!
  (=
    (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route%limited s@$ self@6@00)
    (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route s@$ self@6@00))
  :pattern ((snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route s@$ self@6@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (self@6@00 $Ref)) (!
  (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route%stateless self@6@00)
  :pattern ((snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route%limited s@$ self@6@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (self@6@00 $Ref)) (!
  (=>
    (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route%precondition s@$ self@6@00)
    (=
      (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route s@$ self@6@00)
      (cons$0$__$TY$__Snap$struct$m_Route$Snap$struct$m_Point$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$struct$m_Route<Snap$struct$m_Route> (snap$__$TY$__Snap$struct$m_Point$struct$m_Point$Snap$struct$m_Point ($Snap.first ($Snap.second s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))) (snap$__$TY$__Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_%limited ($Snap.second ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))))))
  :pattern ((snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route s@$ self@6@00))
  :pattern ((snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route%stateless self@6@00) (struct$m_Route%trigger s@$ self@6@00))
  :qid |quant-u-26|)))
(assert (forall ((s@$ $Snap) (self@6@00 $Ref)) (!
  (=>
    (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route%precondition s@$ self@6@00)
    (and
      (snap$__$TY$__Snap$struct$m_Point$struct$m_Point$Snap$struct$m_Point%precondition ($Snap.first ($Snap.second s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
      (snap$__$TY$__Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_%precondition ($Snap.second ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))))))
  :pattern ((snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route s@$ self@6@00))
  :qid |quant-u-27|)))
(assert (forall ((s@$ $Snap) (self@8@00 $Ref)) (!
  (=
    (snap$__$TY$__Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_%limited s@$ self@8@00)
    (snap$__$TY$__Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_ s@$ self@8@00))
  :pattern ((snap$__$TY$__Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_ s@$ self@8@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (self@8@00 $Ref)) (!
  (snap$__$TY$__Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_%stateless self@8@00)
  :pattern ((snap$__$TY$__Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_%limited s@$ self@8@00))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap) (self@8@00 $Ref)) (!
  (=>
    (snap$__$TY$__Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_%precondition s@$ self@8@00)
    (=
      (snap$__$TY$__Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_ s@$ self@8@00)
      (ite
        (= ($SortWrappers.$SnapToInt ($Snap.first s@$)) 1)
        (cons$1$__$TY$__Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$struct$m_Route$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_<Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_> (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route%limited ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
        (as cons$0$__$TY$__Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_<Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_>  Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_))))
  :pattern ((snap$__$TY$__Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_ s@$ self@8@00))
  :pattern ((snap$__$TY$__Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_%stateless self@8@00) (m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_%trigger s@$ self@8@00))
  :qid |quant-u-28|)))
(assert (forall ((s@$ $Snap) (self@8@00 $Ref)) (!
  (=>
    (snap$__$TY$__Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_%precondition s@$ self@8@00)
    (ite
      (= ($SortWrappers.$SnapToInt ($Snap.first s@$)) 1)
      (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route%precondition ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
      true))
  :pattern ((snap$__$TY$__Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_ s@$ self@8@00))
  :qid |quant-u-29|)))
(assert (forall ((s@$ $Snap) (_1@10@00 Snap$struct$m_Route) (_2@11@00 Int)) (!
  (=
    (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%limited s@$ _1@10@00 _2@11@00)
    (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$ s@$ _1@10@00 _2@11@00))
  :pattern ((m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$ s@$ _1@10@00 _2@11@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (_1@10@00 Snap$struct$m_Route) (_2@11@00 Int)) (!
  (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%stateless _1@10@00 _2@11@00)
  :pattern ((m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%limited s@$ _1@10@00 _2@11@00))
  :qid |quant-u-13|)))
(assert (forall ((s@$ $Snap) (_1@10@00 Snap$struct$m_Route) (_2@11@00 Int)) (!
  (let ((result@12@00 (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%limited s@$ _1@10@00 _2@11@00))) (=>
    (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition s@$ _1@10@00 _2@11@00)
    (=
      result@12@00
      (mirror_simple$m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$<Int> _1@10@00 _2@11@00))))
  :pattern ((m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%limited s@$ _1@10@00 _2@11@00))
  :qid |quant-u-30|)))
(assert (forall ((s@$ $Snap) (_1@10@00 Snap$struct$m_Route) (_2@11@00 Int)) (!
  (let ((result@12@00 (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%limited s@$ _1@10@00 _2@11@00))) true)
  :pattern ((m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%limited s@$ _1@10@00 _2@11@00))
  :qid |quant-u-31|)))
(assert (forall ((s@$ $Snap) (_1@10@00 Snap$struct$m_Route) (_2@11@00 Int)) (!
  (let ((result@12@00 (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%limited s@$ _1@10@00 _2@11@00))) true)
  :pattern ((m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%limited s@$ _1@10@00 _2@11@00))
  :qid |quant-u-32|)))
(assert (forall ((s@$ $Snap) (_1@10@00 Snap$struct$m_Route) (_2@11@00 Int)) (!
  (=>
    (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition s@$ _1@10@00 _2@11@00)
    (=
      (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$ s@$ _1@10@00 _2@11@00)
      (ite
        (not (= _2@11@00 0))
        (ite
          (=
            (discriminant$__$TY$__Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$int$<Int> (Snap$struct$m_Route$0$field$f$rest__$TY$__Snap$struct$m_Route$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_<Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_> _1@10@00))
            0)
          (builtin$unreach__$TY$__$int$$$int$ $unresolved@18@00)
          (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%limited ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit $Snap.unit)) (Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$1$field$f$0__$TY$__Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$struct$m_Route<Snap$struct$m_Route> (Snap$struct$m_Route$0$field$f$rest__$TY$__Snap$struct$m_Route$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_<Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_> _1@10@00)) (-
            _2@11@00
            1)))
        (Snap$struct$m_Point$0$field$f$x__$TY$__Snap$struct$m_Point$$int$<Int> (Snap$struct$m_Route$0$field$f$current__$TY$__Snap$struct$m_Route$Snap$struct$m_Point<Snap$struct$m_Point> _1@10@00)))))
  :pattern ((m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$ s@$ _1@10@00 _2@11@00))
  :qid |quant-u-33|)))
(assert (forall ((s@$ $Snap) (_1@10@00 Snap$struct$m_Route) (_2@11@00 Int)) (!
  (=>
    (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition s@$ _1@10@00 _2@11@00)
    (ite
      (not (= _2@11@00 0))
      (ite
        (=
          (discriminant$__$TY$__Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$int$<Int> (Snap$struct$m_Route$0$field$f$rest__$TY$__Snap$struct$m_Route$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_<Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_> _1@10@00))
          0)
        (builtin$unreach__$TY$__$int$$$int$%precondition $unresolved@18@00)
        (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit $Snap.unit)) (Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$1$field$f$0__$TY$__Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$struct$m_Route<Snap$struct$m_Route> (Snap$struct$m_Route$0$field$f$rest__$TY$__Snap$struct$m_Route$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_<Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_> _1@10@00)) (-
          _2@11@00
          1)))
      true))
  :pattern ((m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$ s@$ _1@10@00 _2@11@00))
  :qid |quant-u-34|)))
(assert (forall ((s@$ $Snap) (self@13@00 $Ref)) (!
  (=
    (m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$discriminant$$__$TY$__m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$int$%limited s@$ self@13@00)
    (m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$discriminant$$__$TY$__m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$int$ s@$ self@13@00))
  :pattern ((m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$discriminant$$__$TY$__m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$int$ s@$ self@13@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (self@13@00 $Ref)) (!
  (m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$discriminant$$__$TY$__m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$int$%stateless self@13@00)
  :pattern ((m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$discriminant$$__$TY$__m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$int$%limited s@$ self@13@00))
  :qid |quant-u-15|)))
(assert (forall ((s@$ $Snap) (self@13@00 $Ref)) (!
  (let ((result@14@00 (m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$discriminant$$__$TY$__m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$int$%limited s@$ self@13@00))) (=>
    (m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$discriminant$$__$TY$__m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$int$%precondition s@$ self@13@00)
    (and
      (and (<= 0 result@14@00) (<= result@14@00 1))
      (=
        (discriminant$__$TY$__Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$int$<Int> (snap$__$TY$__Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_ s@$ self@13@00))
        result@14@00))))
  :pattern ((m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$discriminant$$__$TY$__m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$int$%limited s@$ self@13@00))
  :qid |quant-u-35|)))
(assert (forall ((s@$ $Snap) (self@13@00 $Ref)) (!
  (let ((result@14@00 (m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$discriminant$$__$TY$__m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$int$%limited s@$ self@13@00))) true)
  :pattern ((m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$discriminant$$__$TY$__m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$int$%limited s@$ self@13@00))
  :qid |quant-u-36|)))
(assert (forall ((s@$ $Snap) (self@13@00 $Ref)) (!
  (let ((result@14@00 (m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$discriminant$$__$TY$__m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$int$%limited s@$ self@13@00))) (=>
    (m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$discriminant$$__$TY$__m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$int$%precondition s@$ self@13@00)
    (snap$__$TY$__Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$Snap$m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_%precondition s@$ self@13@00)))
  :pattern ((m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$discriminant$$__$TY$__m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$int$%limited s@$ self@13@00))
  :qid |quant-u-37|)))
(assert (forall ((s@$ $Snap) (self@13@00 $Ref)) (!
  (=>
    (m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$discriminant$$__$TY$__m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$int$%precondition s@$ self@13@00)
    (=
      (m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$discriminant$$__$TY$__m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$int$ s@$ self@13@00)
      ($SortWrappers.$SnapToInt ($Snap.first s@$))))
  :pattern ((m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$discriminant$$__$TY$__m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$int$ s@$ self@13@00))
  :qid |quant-u-38|)))
(assert (forall ((s@$ $Snap) (self@13@00 $Ref)) (!
  true
  :pattern ((m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$discriminant$$__$TY$__m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$int$ s@$ self@13@00))
  :qid |quant-u-39|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- m_borrow_nth ----------
(declare-const _0@0@01 $Ref)
(declare-const _0@1@01 $Ref)
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
; var __t0: Bool
(declare-const __t0@2@01 Bool)
; [exec]
; var __t1: Bool
(declare-const __t1@3@01 Bool)
; [exec]
; var __t2: Bool
(declare-const __t2@4@01 Bool)
; [exec]
; var __t3: Bool
(declare-const __t3@5@01 Bool)
; [exec]
; var __t4: Bool
(declare-const __t4@6@01 Bool)
; [exec]
; var __t5: Bool
(declare-const __t5@7@01 Bool)
; [exec]
; var __t6: Bool
(declare-const __t6@8@01 Bool)
; [exec]
; var __t7: Bool
(declare-const __t7@9@01 Bool)
; [exec]
; var __t8: Bool
(declare-const __t8@10@01 Bool)
; [exec]
; var __t9: Bool
(declare-const __t9@11@01 Bool)
; [exec]
; var __t10: Bool
(declare-const __t10@12@01 Bool)
; [exec]
; var __t11: Int
(declare-const __t11@13@01 Int)
; [exec]
; var __t12: Bool
(declare-const __t12@14@01 Bool)
; [exec]
; var _1: Ref
(declare-const _1@15@01 $Ref)
; [exec]
; var _2: Ref
(declare-const _2@16@01 $Ref)
; [exec]
; var _3: Ref
(declare-const _3@17@01 $Ref)
; [exec]
; var _4: Ref
(declare-const _4@18@01 $Ref)
; [exec]
; var _5: Ref
(declare-const _5@19@01 $Ref)
; [exec]
; var _6: Int
(declare-const _6@20@01 Int)
; [exec]
; var _7: Ref
(declare-const _7@21@01 $Ref)
; [exec]
; var _8: Ref
(declare-const _8@22@01 $Ref)
; [exec]
; var _9: Ref
(declare-const _9@23@01 $Ref)
; [exec]
; var _10: Int
(declare-const _10@24@01 Int)
; [exec]
; var _11: Ref
(declare-const _11@25@01 $Ref)
; [exec]
; var _12: Ref
(declare-const _12@26@01 $Ref)
; [exec]
; var _13: Ref
(declare-const _13@27@01 $Ref)
; [exec]
; var _14: Ref
(declare-const _14@28@01 $Ref)
; [exec]
; var _15: Int
(declare-const _15@29@01 Int)
; [exec]
; var _16: Ref
(declare-const _16@30@01 $Ref)
; [exec]
; label start
; [exec]
; __t0 := false
; [exec]
; __t1 := false
; [exec]
; __t2 := false
; [exec]
; __t3 := false
; [exec]
; __t4 := false
; [exec]
; __t5 := false
; [exec]
; __t6 := false
; [exec]
; __t7 := false
; [exec]
; __t8 := false
; [exec]
; __t9 := false
; [exec]
; inhale acc(_1.val_ref, write) &&
;   (acc(struct$m_Route(_1.val_ref), write) && acc(i32(_2), write))
(declare-const $t@31@01 $Snap)
(assert (= $t@31@01 ($Snap.combine ($Snap.first $t@31@01) ($Snap.second $t@31@01))))
(assert (not (= _1@15@01 $Ref.null)))
(assert (=
  ($Snap.second $t@31@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@31@01))
    ($Snap.second ($Snap.second $t@31@01)))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale true
(declare-const $t@32@01 $Snap)
(assert (= $t@32@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale 0 <= (unfolding acc(i32(_2), write) in _2.val_int) &&
;   (unfolding acc(i32(_2), write) in _2.val_int) <
;   m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref))
(declare-const $t@33@01 $Snap)
(assert (= $t@33@01 ($Snap.combine ($Snap.first $t@33@01) ($Snap.second $t@33@01))))
(assert (= ($Snap.first $t@33@01) $Snap.unit))
; [eval] 0 <= (unfolding acc(i32(_2), write) in _2.val_int)
; [eval] (unfolding acc(i32(_2), write) in _2.val_int)
(set-option :timeout 0)
(push) ; 3
(assert (i32%trigger ($Snap.second ($Snap.second $t@31@01)) _2@16@01))
(assert (not (= _2@16@01 $Ref.null)))
(pop) ; 3
; Joined path conditions
(assert (and
  (i32%trigger ($Snap.second ($Snap.second $t@31@01)) _2@16@01)
  (not (= _2@16@01 $Ref.null))))
(assert (<= 0 ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))))
(assert (= ($Snap.second $t@33@01) $Snap.unit))
; [eval] (unfolding acc(i32(_2), write) in _2.val_int) < m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref))
; [eval] (unfolding acc(i32(_2), write) in _2.val_int)
(push) ; 3
(pop) ; 3
; Joined path conditions
; [eval] m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref)
(push) ; 3
; [eval] read$()
(push) ; 4
(assert (read$%precondition $Snap.unit))
(pop) ; 4
; Joined path conditions
(assert (read$%precondition $Snap.unit))
(push) ; 4
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (<= $Perm.No (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))))
(set-option :timeout 0)
(push) ; 4
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route%precondition ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))))
(pop) ; 3
; Joined path conditions
(assert (and
  (read$%precondition $Snap.unit)
  (<= $Perm.No (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))))
  (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route%precondition ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
(set-option :timeout 0)
(push) ; 3
(assert (m_length__$TY$__Snap$struct$m_Route$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
(pop) ; 3
; Joined path conditions
(assert (m_length__$TY$__Snap$struct$m_Route$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
(assert (<
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))
  (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label pre
; [exec]
; __t0 := true
; [exec]
; _6 := builtin$havoc_int()
(declare-const ret@34@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; unfold acc(i32(_2), write)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; _6 := _2.val_int
(declare-const _6@35@01 Int)
(assert (= _6@35@01 ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))))
; [exec]
; label l0
; [exec]
; _5 := builtin$havoc_ref()
(declare-const ret@36@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_5.val_bool, write)
(declare-const $t@37@01 Bool)
(assert (not (= ret@36@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _5.val_bool := _6 == 0
; [eval] _6 == 0
(declare-const val_bool@38@01 Bool)
(assert (= val_bool@38@01 (= _6@35@01 0)))
; [exec]
; __t10 := _5.val_bool
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not val_bool@38@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not val_bool@38@01))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [then-branch: 0 | val_bool@38@01 | live]
; [else-branch: 0 | !(val_bool@38@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | val_bool@38@01]
(assert val_bool@38@01)
; [exec]
; label bb1
; [exec]
; __t1 := true
; [exec]
; _8 := builtin$havoc_ref()
(declare-const ret@39@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_8.val_ref, write)
(declare-const $t@40@01 $Ref)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= _1@15@01 ret@39@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@39@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; unfold acc(struct$m_Route(_1.val_ref), write)
(assert (=
  ($Snap.first ($Snap.second $t@31@01))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
    ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second $t@31@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (struct$m_Route%trigger ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))))
; [exec]
; _8.val_ref := _1.val_ref.f$current
(declare-const val_ref@41@01 $Ref)
(assert (=
  val_ref@41@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@31@01))))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= _1@15@01 ret@39@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l3
; [exec]
; _7 := builtin$havoc_ref()
(declare-const ret@42@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_7.val_ref, write)
(declare-const $t@43@01 $Ref)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= _1@15@01 ret@42@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@39@01 ret@42@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@42@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _7.val_ref := _8.val_ref
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@39@01 ret@42@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= _1@15@01 ret@42@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l4
; [exec]
; _4 := builtin$havoc_ref()
(declare-const ret@44@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_4.val_ref, write)
(declare-const $t@45@01 $Ref)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= _1@15@01 ret@44@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@39@01 ret@44@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@42@01 ret@44@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@44@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _4.val_ref := _7.val_ref
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@42@01 ret@44@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@39@01 ret@44@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= _1@15@01 ret@44@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l5
; [exec]
; label bb2
; [exec]
; __t8 := true
; [exec]
; _3 := builtin$havoc_ref()
(declare-const ret@46@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_3.val_ref, write)
(declare-const $t@47@01 $Ref)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= _1@15@01 ret@46@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@39@01 ret@46@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@42@01 ret@46@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@44@01 ret@46@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@46@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _3.val_ref := _4.val_ref
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@44@01 ret@46@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@42@01 ret@46@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@39@01 ret@46@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= _1@15@01 ret@46@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l16
; [exec]
; _0 := builtin$havoc_ref()
(declare-const ret@48@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_0.val_ref, write)
(declare-const $t@49@01 $Ref)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= _1@15@01 ret@48@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@39@01 ret@48@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@42@01 ret@48@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@44@01 ret@48@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@46@01 ret@48@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@48@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _0.val_ref := _3.val_ref
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@46@01 ret@48@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@44@01 ret@48@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@42@01 ret@48@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@39@01 ret@48@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= _1@15@01 ret@48@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l17
; [exec]
; label l18
; [exec]
; package acc(DeadBorrowToken$(-1), write) &&
; acc(struct$m_Point(old[l18](_0.val_ref)), write) --*
; acc(struct$m_Route(old[pre](_1.val_ref)), write) &&
; (m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref))) ==
; old[pre](m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref))) &&
; (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref)),
; old[pre]((unfolding acc(i32(_2), write) in _2.val_int))) ==
; old[lhs]((unfolding acc(struct$m_Point(old[l18](_0.val_ref)), write) in
;   (unfolding acc(i32(old[l18](_0.val_ref).f$x), write) in
;     old[l18](_0.val_ref).f$x.val_int))) &&
; (forall _0_quant_0: Int ::
;   { m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref)),
;   _0_quant_0) }
;   { old[pre](m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref),
;   _0_quant_0)) }
;   !(0 <= _0_quant_0) ||
;   (!(_0_quant_0 <
;   m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref)))) ||
;   (_0_quant_0 == old[pre]((unfolding acc(i32(_2), write) in _2.val_int)) ||
;   m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref)),
;   _0_quant_0) ==
;   old[pre](m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref),
;   _0_quant_0))))))) {
;   var _old$l13$0$p0: Ref
;   if (__t8) {
;   }
;   if (__t8 && __t8) {
;   }
;   if (__t8 && (__t8 && __t7)) {
;   }
;   if (__t8 && (__t8 && __t1)) {
;   }
;   if (__t7 && (__t8 && __t8)) {
;   }
;   if (__t7 && (__t7 && (__t8 && __t8))) {
;   }
;   if (__t1 && (__t8 && __t8)) {
;   }
;   if (__t1 && (__t1 && (__t8 && __t8))) {
;   }
;   if (__t6 && (__t7 && (__t7 && (__t8 && __t8)))) {
;     _old$l13$0$p0 := old[l14](_12.val_ref)
;     inhale acc(DeadBorrowToken$(12), write) &&
;       acc(struct$m_Point(_old$l13$0$p0), write) --*
;       acc(struct$m_Route(old[l12](_13.val_ref)), write) &&
;       (m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[l12](_13.val_ref))) ==
;       old[l12](m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_13.val_ref))) &&
;       (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[l12](_13.val_ref)),
;       old[l12](_14.val_int)) ==
;       old[lhs]((unfolding acc(struct$m_Point(_old$l13$0$p0), write) in
;         (unfolding acc(i32(_old$l13$0$p0.f$x), write) in
;           _old$l13$0$p0.f$x.val_int))) &&
;       (forall _0_quant_0: Int ::
;         { m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[l12](_13.val_ref)),
;         _0_quant_0) }
;         { old[l12](m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_13.val_ref),
;         _0_quant_0)) }
;         !(0 <= _0_quant_0) ||
;         (!(_0_quant_0 <
;         m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[l12](_13.val_ref)))) ||
;         (_0_quant_0 == old[l12](_14.val_int) ||
;         m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[l12](_13.val_ref)),
;         _0_quant_0) ==
;         old[l12](m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_13.val_ref),
;         _0_quant_0)))))))
;     inhale acc(DeadBorrowToken$(12), write)
;     apply acc(DeadBorrowToken$(12), write) &&
;       acc(struct$m_Point(_old$l13$0$p0), write) --*
;       acc(struct$m_Route(old[l12](_13.val_ref)), write) &&
;       (m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[l12](_13.val_ref))) ==
;       old[l12](m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_13.val_ref))) &&
;       (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[l12](_13.val_ref)),
;       old[l12](_14.val_int)) ==
;       old[lhs]((unfolding acc(struct$m_Point(_old$l13$0$p0), write) in
;         (unfolding acc(i32(_old$l13$0$p0.f$x), write) in
;           _old$l13$0$p0.f$x.val_int))) &&
;       (forall _0_quant_0: Int ::
;         { m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[l12](_13.val_ref)),
;         _0_quant_0) }
;         { old[l12](m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_13.val_ref),
;         _0_quant_0)) }
;         !(0 <= _0_quant_0) ||
;         (!(_0_quant_0 <
;         m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[l12](_13.val_ref)))) ||
;         (_0_quant_0 == old[l12](_14.val_int) ||
;         m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[l12](_13.val_ref)),
;         _0_quant_0) ==
;         old[l12](m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_13.val_ref),
;         _0_quant_0)))))))
;   }
;   if (__t6 && (__t6 && (__t7 && (__t7 && (__t8 && __t8))))) {
;   }
;   if (__t5 && (__t6 && (__t6 && (__t7 && (__t7 && (__t8 && __t8)))))) {
;   }
;   if (__t5 &&
;   (__t5 && (__t6 && (__t6 && (__t7 && (__t7 && (__t8 && __t8))))))) {
;     assert acc(old[l18](_1.val_ref).f$rest, read$())
;     assert acc(old[l18](_1.val_ref).f$rest.enum_Some, read$())
;     assert acc(old[l18](_1.val_ref).f$rest.enum_Some.f$0, read$())
;     fold acc(struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global(old[l18](_1.val_ref).f$rest.enum_Some.f$0), write)
;     assert acc(old[l18](_1.val_ref).f$rest, read$())
;     assert acc(old[l18](_1.val_ref).f$rest.enum_Some, read$())
;     fold acc(m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_Some(old[l18](_1.val_ref).f$rest.enum_Some), write)
;     assert acc(old[l18](_1.val_ref).f$rest, read$())
;     fold acc(m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_(old[l18](_1.val_ref).f$rest), write)
;   }
;   if (__t1 && (__t1 && (__t1 && (__t8 && __t8)))) {
;   }
;   fold acc(struct$m_Route(old[pre](_1.val_ref)), write)
; }
(set-option :timeout 0)
(push) ; 4
(declare-const $t@50@01 $Snap)
(assert (= $t@50@01 ($Snap.combine ($Snap.first $t@50@01) ($Snap.second $t@50@01))))
; [eval] -1
; [eval] old[l18](_0.val_ref)
; [exec]
; var _old$l13$0$p0: Ref
(declare-const _old$l13$0$p0@51@01 $Ref)
; [eval] !__t8
; [then-branch: 1 | False | dead]
; [else-branch: 1 | True | live]
(push) ; 5
; [else-branch: 1 | True]
(pop) ; 5
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 2 | True | live]
; [else-branch: 2 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 2 | True]
; [eval] !(__t8 && __t8)
; [eval] __t8 && __t8
(push) ; 6
; [then-branch: 3 | True | live]
; [else-branch: 3 | False | live]
(push) ; 7
; [then-branch: 3 | True]
(pop) ; 7
(push) ; 7
; [else-branch: 3 | False]
(assert false)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
; [then-branch: 4 | False | dead]
; [else-branch: 4 | True | live]
(push) ; 6
; [else-branch: 4 | True]
(pop) ; 6
; [eval] __t8 && __t8
(push) ; 6
; [then-branch: 5 | True | live]
; [else-branch: 5 | False | live]
(push) ; 7
; [then-branch: 5 | True]
(pop) ; 7
(push) ; 7
; [else-branch: 5 | False]
(assert false)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 6 | True | live]
; [else-branch: 6 | False | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 6 | True]
; [eval] !(__t8 && (__t8 && __t7))
; [eval] __t8 && (__t8 && __t7)
(push) ; 7
; [then-branch: 7 | True | live]
; [else-branch: 7 | False | live]
(push) ; 8
; [then-branch: 7 | True]
(push) ; 9
; [then-branch: 8 | True | live]
; [else-branch: 8 | False | live]
(push) ; 10
; [then-branch: 8 | True]
(pop) ; 10
(push) ; 10
; [else-branch: 8 | False]
(assert false)
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(pop) ; 8
(push) ; 8
; [else-branch: 7 | False]
(assert false)
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 9 | True | live]
; [else-branch: 9 | False | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 9 | True]
; [eval] !(__t8 && (__t8 && __t1))
; [eval] __t8 && (__t8 && __t1)
(push) ; 8
; [then-branch: 10 | True | live]
; [else-branch: 10 | False | live]
(push) ; 9
; [then-branch: 10 | True]
(push) ; 10
; [then-branch: 11 | True | live]
; [else-branch: 11 | False | live]
(push) ; 11
; [then-branch: 11 | True]
(pop) ; 11
(push) ; 11
; [else-branch: 11 | False]
(assert false)
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(pop) ; 9
(push) ; 9
; [else-branch: 10 | False]
(assert false)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
; [then-branch: 12 | False | dead]
; [else-branch: 12 | True | live]
(push) ; 8
; [else-branch: 12 | True]
(pop) ; 8
; [eval] __t8 && (__t8 && __t1)
(push) ; 8
; [then-branch: 13 | True | live]
; [else-branch: 13 | False | live]
(push) ; 9
; [then-branch: 13 | True]
(push) ; 10
; [then-branch: 14 | True | live]
; [else-branch: 14 | False | live]
(push) ; 11
; [then-branch: 14 | True]
(pop) ; 11
(push) ; 11
; [else-branch: 14 | False]
(assert false)
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(pop) ; 9
(push) ; 9
; [else-branch: 13 | False]
(assert false)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(push) ; 8
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 15 | True | live]
; [else-branch: 15 | False | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 15 | True]
; [eval] !(__t7 && (__t8 && __t8))
; [eval] __t7 && (__t8 && __t8)
(push) ; 9
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 16 | True | live]
; [else-branch: 16 | False | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 16 | True]
; [eval] !(__t7 && (__t7 && (__t8 && __t8)))
; [eval] __t7 && (__t7 && (__t8 && __t8))
(push) ; 10
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 17 | True | live]
; [else-branch: 17 | False | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 17 | True]
; [eval] !(__t1 && (__t8 && __t8))
; [eval] __t1 && (__t8 && __t8)
(push) ; 11
; [then-branch: 18 | True | live]
; [else-branch: 18 | False | live]
(push) ; 12
; [then-branch: 18 | True]
(push) ; 13
; [then-branch: 19 | True | live]
; [else-branch: 19 | False | live]
(push) ; 14
; [then-branch: 19 | True]
(pop) ; 14
(push) ; 14
; [else-branch: 19 | False]
(assert false)
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(pop) ; 12
(push) ; 12
; [else-branch: 18 | False]
(assert false)
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
; [then-branch: 20 | False | dead]
; [else-branch: 20 | True | live]
(push) ; 11
; [else-branch: 20 | True]
(pop) ; 11
; [eval] __t1 && (__t8 && __t8)
(push) ; 11
; [then-branch: 21 | True | live]
; [else-branch: 21 | False | live]
(push) ; 12
; [then-branch: 21 | True]
(push) ; 13
; [then-branch: 22 | True | live]
; [else-branch: 22 | False | live]
(push) ; 14
; [then-branch: 22 | True]
(pop) ; 14
(push) ; 14
; [else-branch: 22 | False]
(assert false)
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(pop) ; 12
(push) ; 12
; [else-branch: 21 | False]
(assert false)
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(push) ; 11
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 23 | True | live]
; [else-branch: 23 | False | dead]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 23 | True]
; [eval] !(__t1 && (__t1 && (__t8 && __t8)))
; [eval] __t1 && (__t1 && (__t8 && __t8))
(push) ; 12
; [then-branch: 24 | True | live]
; [else-branch: 24 | False | live]
(push) ; 13
; [then-branch: 24 | True]
(push) ; 14
; [then-branch: 25 | True | live]
; [else-branch: 25 | False | live]
(push) ; 15
; [then-branch: 25 | True]
(push) ; 16
; [then-branch: 26 | True | live]
; [else-branch: 26 | False | live]
(push) ; 17
; [then-branch: 26 | True]
(pop) ; 17
(push) ; 17
; [else-branch: 26 | False]
(assert false)
(pop) ; 17
(pop) ; 16
; Joined path conditions
; Joined path conditions
(pop) ; 15
(push) ; 15
; [else-branch: 25 | False]
(assert false)
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(push) ; 13
; [else-branch: 24 | False]
(assert false)
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
; [then-branch: 27 | False | dead]
; [else-branch: 27 | True | live]
(push) ; 12
; [else-branch: 27 | True]
(pop) ; 12
; [eval] __t1 && (__t1 && (__t8 && __t8))
(push) ; 12
; [then-branch: 28 | True | live]
; [else-branch: 28 | False | live]
(push) ; 13
; [then-branch: 28 | True]
(push) ; 14
; [then-branch: 29 | True | live]
; [else-branch: 29 | False | live]
(push) ; 15
; [then-branch: 29 | True]
(push) ; 16
; [then-branch: 30 | True | live]
; [else-branch: 30 | False | live]
(push) ; 17
; [then-branch: 30 | True]
(pop) ; 17
(push) ; 17
; [else-branch: 30 | False]
(assert false)
(pop) ; 17
(pop) ; 16
; Joined path conditions
; Joined path conditions
(pop) ; 15
(push) ; 15
; [else-branch: 29 | False]
(assert false)
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(pop) ; 13
(push) ; 13
; [else-branch: 28 | False]
(assert false)
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(push) ; 12
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 31 | True | live]
; [else-branch: 31 | False | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 31 | True]
; [eval] __t6 && (__t7 && (__t7 && (__t8 && __t8)))
; [then-branch: 32 | False | dead]
; [else-branch: 32 | True | live]
(push) ; 13
; [else-branch: 32 | True]
(pop) ; 13
; [eval] !(__t6 && (__t7 && (__t7 && (__t8 && __t8))))
; [eval] __t6 && (__t7 && (__t7 && (__t8 && __t8)))
(push) ; 13
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [then-branch: 33 | True | live]
; [else-branch: 33 | False | dead]
(set-option :timeout 0)
(push) ; 13
; [then-branch: 33 | True]
; [eval] !(__t6 && (__t6 && (__t7 && (__t7 && (__t8 && __t8)))))
; [eval] __t6 && (__t6 && (__t7 && (__t7 && (__t8 && __t8))))
(push) ; 14
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; [then-branch: 34 | True | live]
; [else-branch: 34 | False | dead]
(set-option :timeout 0)
(push) ; 14
; [then-branch: 34 | True]
; [eval] !(__t5 && (__t6 && (__t6 && (__t7 && (__t7 && (__t8 && __t8))))))
; [eval] __t5 && (__t6 && (__t6 && (__t7 && (__t7 && (__t8 && __t8)))))
(push) ; 15
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; [then-branch: 35 | True | live]
; [else-branch: 35 | False | dead]
(set-option :timeout 0)
(push) ; 15
; [then-branch: 35 | True]
; [eval] __t5 && (__t5 && (__t6 && (__t6 && (__t7 && (__t7 && (__t8 && __t8))))))
; [then-branch: 36 | False | dead]
; [else-branch: 36 | True | live]
(push) ; 16
; [else-branch: 36 | True]
(pop) ; 16
; [eval] !(__t5 && (__t5 && (__t6 && (__t6 && (__t7 && (__t7 && (__t8 && __t8)))))))
; [eval] __t5 && (__t5 && (__t6 && (__t6 && (__t7 && (__t7 && (__t8 && __t8))))))
(push) ; 16
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
; [then-branch: 37 | True | live]
; [else-branch: 37 | False | dead]
(set-option :timeout 0)
(push) ; 16
; [then-branch: 37 | True]
; [eval] !(__t1 && (__t1 && (__t1 && (__t8 && __t8))))
; [eval] __t1 && (__t1 && (__t1 && (__t8 && __t8)))
(push) ; 17
; [then-branch: 38 | True | live]
; [else-branch: 38 | False | live]
(push) ; 18
; [then-branch: 38 | True]
(push) ; 19
; [then-branch: 39 | True | live]
; [else-branch: 39 | False | live]
(push) ; 20
; [then-branch: 39 | True]
(push) ; 21
; [then-branch: 40 | True | live]
; [else-branch: 40 | False | live]
(push) ; 22
; [then-branch: 40 | True]
(push) ; 23
; [then-branch: 41 | True | live]
; [else-branch: 41 | False | live]
(push) ; 24
; [then-branch: 41 | True]
(pop) ; 24
(push) ; 24
; [else-branch: 41 | False]
(assert false)
(pop) ; 24
(pop) ; 23
; Joined path conditions
; Joined path conditions
(pop) ; 22
(push) ; 22
; [else-branch: 40 | False]
(assert false)
(pop) ; 22
(pop) ; 21
; Joined path conditions
; Joined path conditions
(pop) ; 20
(push) ; 20
; [else-branch: 39 | False]
(assert false)
(pop) ; 20
(pop) ; 19
; Joined path conditions
; Joined path conditions
(pop) ; 18
(push) ; 18
; [else-branch: 38 | False]
(assert false)
(pop) ; 18
(pop) ; 17
; Joined path conditions
; Joined path conditions
; [then-branch: 42 | False | dead]
; [else-branch: 42 | True | live]
(push) ; 17
; [else-branch: 42 | True]
(pop) ; 17
; [eval] __t1 && (__t1 && (__t1 && (__t8 && __t8)))
(push) ; 17
; [then-branch: 43 | True | live]
; [else-branch: 43 | False | live]
(push) ; 18
; [then-branch: 43 | True]
(push) ; 19
; [then-branch: 44 | True | live]
; [else-branch: 44 | False | live]
(push) ; 20
; [then-branch: 44 | True]
(push) ; 21
; [then-branch: 45 | True | live]
; [else-branch: 45 | False | live]
(push) ; 22
; [then-branch: 45 | True]
(push) ; 23
; [then-branch: 46 | True | live]
; [else-branch: 46 | False | live]
(push) ; 24
; [then-branch: 46 | True]
(pop) ; 24
(push) ; 24
; [else-branch: 46 | False]
(assert false)
(pop) ; 24
(pop) ; 23
; Joined path conditions
; Joined path conditions
(pop) ; 22
(push) ; 22
; [else-branch: 45 | False]
(assert false)
(pop) ; 22
(pop) ; 21
; Joined path conditions
; Joined path conditions
(pop) ; 20
(push) ; 20
; [else-branch: 44 | False]
(assert false)
(pop) ; 20
(pop) ; 19
; Joined path conditions
; Joined path conditions
(pop) ; 18
(push) ; 18
; [else-branch: 43 | False]
(assert false)
(pop) ; 18
(pop) ; 17
; Joined path conditions
; Joined path conditions
(push) ; 17
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
; [then-branch: 47 | True | live]
; [else-branch: 47 | False | dead]
(set-option :timeout 0)
(push) ; 17
; [then-branch: 47 | True]
; [exec]
; fold acc(struct$m_Route(old[pre](_1.val_ref)), write)
; [eval] old[pre](_1.val_ref)
(push) ; 18
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
(assert (struct$m_Route%trigger ($Snap.combine
  ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
  ($Snap.combine
    ($Snap.second $t@50@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))))
; [eval] old[pre](_1.val_ref)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(check-sat)
; unknown
; [eval] m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref))) == old[pre](m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref)))
; [eval] m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref)))
; [eval] snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref))
; [eval] old[pre](_1.val_ref)
(set-option :timeout 0)
(push) ; 18
; [eval] read$()
(push) ; 19
(pop) ; 19
; Joined path conditions
(push) ; 19
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(push) ; 19
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(push) ; 19
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(assert (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route%precondition ($Snap.combine
  ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
  ($Snap.combine
    ($Snap.second $t@50@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))))
(pop) ; 18
; Joined path conditions
(assert (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route%precondition ($Snap.combine
  ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
  ($Snap.combine
    ($Snap.second $t@50@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))))
(set-option :timeout 0)
(push) ; 18
(assert (m_length__$TY$__Snap$struct$m_Route$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
  ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
  ($Snap.combine
    ($Snap.second $t@50@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
(pop) ; 18
; Joined path conditions
(assert (m_length__$TY$__Snap$struct$m_Route$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
  ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
  ($Snap.combine
    ($Snap.second $t@50@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
; [eval] old[pre](m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref)))
; [eval] m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref)
(push) ; 18
; [eval] read$()
(push) ; 19
(pop) ; 19
; Joined path conditions
(push) ; 19
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(push) ; 19
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(push) ; 19
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(pop) ; 18
; Joined path conditions
(set-option :timeout 0)
(push) ; 18
(pop) ; 18
; Joined path conditions
(push) ; 18
(assert (not (=
  (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
    ($Snap.combine
      ($Snap.second $t@50@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))))
  (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(assert (=
  (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
    ($Snap.combine
      ($Snap.second $t@50@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))))
  (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))))))
; [eval] m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref)), old[pre]((unfolding acc(i32(_2), write) in _2.val_int))) == old[lhs]((unfolding acc(struct$m_Point(old[l18](_0.val_ref)), write) in (unfolding acc(i32(old[l18](_0.val_ref).f$x), write) in old[l18](_0.val_ref).f$x.val_int)))
; [eval] m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref)), old[pre]((unfolding acc(i32(_2), write) in _2.val_int)))
; [eval] snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref))
; [eval] old[pre](_1.val_ref)
(push) ; 18
; [eval] read$()
(push) ; 19
(pop) ; 19
; Joined path conditions
(push) ; 19
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(push) ; 19
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(push) ; 19
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(pop) ; 18
; Joined path conditions
; [eval] old[pre]((unfolding acc(i32(_2), write) in _2.val_int))
; [eval] (unfolding acc(i32(_2), write) in _2.val_int)
(set-option :timeout 0)
(push) ; 18
(pop) ; 18
; Joined path conditions
(push) ; 18
; [eval] 0 <= _2
; [eval] _2 < m_length__$TY$__Snap$struct$m_Route$$int$(_1)
; [eval] m_length__$TY$__Snap$struct$m_Route$$int$(_1)
(push) ; 19
(pop) ; 19
; Joined path conditions
(push) ; 19
(assert (not (<
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))
  (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
    ($Snap.combine
      ($Snap.second $t@50@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))))
(check-sat)
; unsat
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(assert (<
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))
  (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
    ($Snap.combine
      ($Snap.second $t@50@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))))))
(assert (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
  ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
  ($Snap.combine
    ($Snap.second $t@50@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))))
(pop) ; 18
; Joined path conditions
(assert (and
  (<
    ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))
    (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
      ($Snap.combine
        ($Snap.second $t@50@01)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
          ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
  (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
    ($Snap.combine
      ($Snap.second $t@50@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01))))))
; [eval] old[lhs]((unfolding acc(struct$m_Point(old[l18](_0.val_ref)), write) in (unfolding acc(i32(old[l18](_0.val_ref).f$x), write) in old[l18](_0.val_ref).f$x.val_int)))
; [eval] (unfolding acc(struct$m_Point(old[l18](_0.val_ref)), write) in (unfolding acc(i32(old[l18](_0.val_ref).f$x), write) in old[l18](_0.val_ref).f$x.val_int))
; [eval] old[l18](_0.val_ref)
(push) ; 18
; [eval] old[l18](_0.val_ref)
(assert (struct$m_Point%trigger ($Snap.second $t@50@01) val_ref@41@01))
(assert (=
  ($Snap.second $t@50@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@50@01))
    ($Snap.second ($Snap.second $t@50@01)))))
(assert (not (= val_ref@41@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second $t@50@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@50@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@50@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@50@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))))
(push) ; 19
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@50@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))))))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
; [eval] (unfolding acc(i32(old[l18](_0.val_ref).f$x), write) in old[l18](_0.val_ref).f$x.val_int)
; [eval] old[l18](_0.val_ref)
(set-option :timeout 0)
(push) ; 19
; [eval] old[l18](_0.val_ref)
(assert (i32%trigger ($Snap.first ($Snap.second ($Snap.second $t@50@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@50@01)))))
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@50@01))) $Ref.null)))
; [eval] old[l18](_0.val_ref)
(pop) ; 19
; Joined path conditions
(assert (and
  (i32%trigger ($Snap.first ($Snap.second ($Snap.second $t@50@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@50@01))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@50@01)))
      $Ref.null))))
(pop) ; 18
; Joined path conditions
(assert (and
  (struct$m_Point%trigger ($Snap.second $t@50@01) val_ref@41@01)
  (=
    ($Snap.second $t@50@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@50@01))
      ($Snap.second ($Snap.second $t@50@01))))
  (not (= val_ref@41@01 $Ref.null))
  (=
    ($Snap.second ($Snap.second $t@50@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second $t@50@01)))
      ($Snap.second ($Snap.second ($Snap.second $t@50@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.second $t@50@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@50@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@50@01))))))
  (i32%trigger ($Snap.first ($Snap.second ($Snap.second $t@50@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@50@01))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@50@01)))
      $Ref.null))))
(push) ; 18
(assert (not (=
  (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$ ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
    ($Snap.combine
      ($Snap.second $t@50@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@50@01)))))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(assert (=
  (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$ ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
    ($Snap.combine
      ($Snap.second $t@50@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@50@01))))))
; [eval] (forall _0_quant_0: Int :: { m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref)), _0_quant_0) } { old[pre](m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref), _0_quant_0)) } !(0 <= _0_quant_0) || (!(_0_quant_0 < m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref)))) || (_0_quant_0 == old[pre]((unfolding acc(i32(_2), write) in _2.val_int)) || m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref)), _0_quant_0) == old[pre](m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref), _0_quant_0)))))
(declare-const _0_quant_0@52@01 Int)
(push) ; 18
; [eval] !(0 <= _0_quant_0) || (!(_0_quant_0 < m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref)))) || (_0_quant_0 == old[pre]((unfolding acc(i32(_2), write) in _2.val_int)) || m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref)), _0_quant_0) == old[pre](m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref), _0_quant_0))))
; [eval] !(0 <= _0_quant_0)
; [eval] 0 <= _0_quant_0
(push) ; 19
; [then-branch: 48 | !(0 <= _0_quant_0@52@01) | live]
; [else-branch: 48 | 0 <= _0_quant_0@52@01 | live]
(push) ; 20
; [then-branch: 48 | !(0 <= _0_quant_0@52@01)]
(assert (not (<= 0 _0_quant_0@52@01)))
(pop) ; 20
(push) ; 20
; [else-branch: 48 | 0 <= _0_quant_0@52@01]
(assert (<= 0 _0_quant_0@52@01))
; [eval] !(_0_quant_0 < m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref))))
; [eval] _0_quant_0 < m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref)))
; [eval] m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref)))
; [eval] snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref))
; [eval] old[pre](_1.val_ref)
(push) ; 21
; [eval] read$()
(push) ; 22
(pop) ; 22
; Joined path conditions
(push) ; 22
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(push) ; 22
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 22
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(push) ; 22
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 22
; 0.00s
; (get-info :all-statistics)
(pop) ; 21
; Joined path conditions
(set-option :timeout 0)
(push) ; 21
(pop) ; 21
; Joined path conditions
(push) ; 21
; [then-branch: 49 | !(_0_quant_0@52@01 < m_length__$TY$__Snap$struct$m_Route$$int$((_, _), snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route((First:(First:(Second:($t@31@01))), (Second:($t@50@01), (First:(Second:(Second:(First:(Second:($t@31@01))))), Second:(Second:(Second:(First:(Second:($t@31@01)))))))), First:($t@31@01)))) | live]
; [else-branch: 49 | _0_quant_0@52@01 < m_length__$TY$__Snap$struct$m_Route$$int$((_, _), snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route((First:(First:(Second:($t@31@01))), (Second:($t@50@01), (First:(Second:(Second:(First:(Second:($t@31@01))))), Second:(Second:(Second:(First:(Second:($t@31@01)))))))), First:($t@31@01))) | live]
(push) ; 22
; [then-branch: 49 | !(_0_quant_0@52@01 < m_length__$TY$__Snap$struct$m_Route$$int$((_, _), snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route((First:(First:(Second:($t@31@01))), (Second:($t@50@01), (First:(Second:(Second:(First:(Second:($t@31@01))))), Second:(Second:(Second:(First:(Second:($t@31@01)))))))), First:($t@31@01))))]
(assert (not
  (<
    _0_quant_0@52@01
    (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
      ($Snap.combine
        ($Snap.second $t@50@01)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
          ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))))
(pop) ; 22
(push) ; 22
; [else-branch: 49 | _0_quant_0@52@01 < m_length__$TY$__Snap$struct$m_Route$$int$((_, _), snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route((First:(First:(Second:($t@31@01))), (Second:($t@50@01), (First:(Second:(Second:(First:(Second:($t@31@01))))), Second:(Second:(Second:(First:(Second:($t@31@01)))))))), First:($t@31@01)))]
(assert (<
  _0_quant_0@52@01
  (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
    ($Snap.combine
      ($Snap.second $t@50@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))))))
; [eval] _0_quant_0 == old[pre]((unfolding acc(i32(_2), write) in _2.val_int))
; [eval] old[pre]((unfolding acc(i32(_2), write) in _2.val_int))
; [eval] (unfolding acc(i32(_2), write) in _2.val_int)
(push) ; 23
(pop) ; 23
; Joined path conditions
(push) ; 23
; [then-branch: 50 | _0_quant_0@52@01 == Second:(Second:($t@31@01)) | live]
; [else-branch: 50 | _0_quant_0@52@01 != Second:(Second:($t@31@01)) | live]
(push) ; 24
; [then-branch: 50 | _0_quant_0@52@01 == Second:(Second:($t@31@01))]
(assert (=
  _0_quant_0@52@01
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))))
(pop) ; 24
(push) ; 24
; [else-branch: 50 | _0_quant_0@52@01 != Second:(Second:($t@31@01))]
(assert (not
  (=
    _0_quant_0@52@01
    ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01))))))
; [eval] m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref)), _0_quant_0) == old[pre](m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref), _0_quant_0))
; [eval] m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref)), _0_quant_0)
; [eval] snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref))
; [eval] old[pre](_1.val_ref)
(push) ; 25
; [eval] read$()
(push) ; 26
(pop) ; 26
; Joined path conditions
(push) ; 26
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 26
; 0.00s
; (get-info :all-statistics)
(push) ; 26
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 26
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 26
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 26
; 0.00s
; (get-info :all-statistics)
(push) ; 26
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 26
; 0.00s
; (get-info :all-statistics)
(pop) ; 25
; Joined path conditions
(set-option :timeout 0)
(push) ; 25
; [eval] 0 <= _2
; [eval] _2 < m_length__$TY$__Snap$struct$m_Route$$int$(_1)
; [eval] m_length__$TY$__Snap$struct$m_Route$$int$(_1)
(push) ; 26
(pop) ; 26
; Joined path conditions
(assert (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
  ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
  ($Snap.combine
    ($Snap.second $t@50@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@52@01))
(pop) ; 25
; Joined path conditions
(assert (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
  ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
  ($Snap.combine
    ($Snap.second $t@50@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@52@01))
; [eval] old[pre](m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref), _0_quant_0))
; [eval] m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref), _0_quant_0)
; [eval] snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref)
(push) ; 25
; [eval] read$()
(push) ; 26
(pop) ; 26
; Joined path conditions
(push) ; 26
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 26
; 0.00s
; (get-info :all-statistics)
(push) ; 26
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 26
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 26
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 26
; 0.00s
; (get-info :all-statistics)
(push) ; 26
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 26
; 0.00s
; (get-info :all-statistics)
(pop) ; 25
; Joined path conditions
(set-option :timeout 0)
(push) ; 25
; [eval] 0 <= _2
; [eval] _2 < m_length__$TY$__Snap$struct$m_Route$$int$(_1)
; [eval] m_length__$TY$__Snap$struct$m_Route$$int$(_1)
(push) ; 26
(pop) ; 26
; Joined path conditions
(push) ; 26
(assert (not (<
  _0_quant_0@52@01
  (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))))
(check-sat)
; unsat
(pop) ; 26
; 0.00s
; (get-info :all-statistics)
(assert (<
  _0_quant_0@52@01
  (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))))))
(assert (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@52@01))
(pop) ; 25
; Joined path conditions
(assert (and
  (<
    _0_quant_0@52@01
    (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
  (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@52@01)))
(pop) ; 24
(pop) ; 23
; Joined path conditions
; Joined path conditions
(assert (=>
  (not
    (=
      _0_quant_0@52@01
      ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))))
  (and
    (not
      (=
        _0_quant_0@52@01
        ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))))
    (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
      ($Snap.combine
        ($Snap.second $t@50@01)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
          ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@52@01)
    (<
      _0_quant_0@52@01
      (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
    (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@52@01))))
(assert (or
  (not
    (=
      _0_quant_0@52@01
      ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))))
  (=
    _0_quant_0@52@01
    ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01))))))
(pop) ; 22
(pop) ; 21
; Joined path conditions
; Joined path conditions
(assert (=>
  (<
    _0_quant_0@52@01
    (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
      ($Snap.combine
        ($Snap.second $t@50@01)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
          ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
  (and
    (<
      _0_quant_0@52@01
      (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
        ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
        ($Snap.combine
          ($Snap.second $t@50@01)
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
    (=>
      (not
        (=
          _0_quant_0@52@01
          ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))))
      (and
        (not
          (=
            _0_quant_0@52@01
            ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))))
        (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
          ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
          ($Snap.combine
            ($Snap.second $t@50@01)
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
              ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@52@01)
        (<
          _0_quant_0@52@01
          (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
        (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@52@01)))
    (or
      (not
        (=
          _0_quant_0@52@01
          ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))))
      (=
        _0_quant_0@52@01
        ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01))))))))
(assert (or
  (<
    _0_quant_0@52@01
    (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
      ($Snap.combine
        ($Snap.second $t@50@01)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
          ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
  (not
    (<
      _0_quant_0@52@01
      (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
        ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
        ($Snap.combine
          ($Snap.second $t@50@01)
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))))))))
(pop) ; 20
(pop) ; 19
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 _0_quant_0@52@01)
  (and
    (<= 0 _0_quant_0@52@01)
    (=>
      (<
        _0_quant_0@52@01
        (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
          ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
          ($Snap.combine
            ($Snap.second $t@50@01)
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
              ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
      (and
        (<
          _0_quant_0@52@01
          (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
            ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
            ($Snap.combine
              ($Snap.second $t@50@01)
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
                ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
        (=>
          (not
            (=
              _0_quant_0@52@01
              ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))))
          (and
            (not
              (=
                _0_quant_0@52@01
                ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))))
            (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
              ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
              ($Snap.combine
                ($Snap.second $t@50@01)
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
                  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@52@01)
            (<
              _0_quant_0@52@01
              (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
            (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@52@01)))
        (or
          (not
            (=
              _0_quant_0@52@01
              ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))))
          (=
            _0_quant_0@52@01
            ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))))))
    (or
      (<
        _0_quant_0@52@01
        (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
          ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
          ($Snap.combine
            ($Snap.second $t@50@01)
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
              ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
      (not
        (<
          _0_quant_0@52@01
          (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
            ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
            ($Snap.combine
              ($Snap.second $t@50@01)
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
                ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))))))))))
(assert (or (<= 0 _0_quant_0@52@01) (not (<= 0 _0_quant_0@52@01))))
(pop) ; 18
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((_0_quant_0@52@01 Int)) (!
  (and
    (=>
      (<= 0 _0_quant_0@52@01)
      (and
        (<= 0 _0_quant_0@52@01)
        (=>
          (<
            _0_quant_0@52@01
            (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
              ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
              ($Snap.combine
                ($Snap.second $t@50@01)
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
                  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
          (and
            (<
              _0_quant_0@52@01
              (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
                ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
                ($Snap.combine
                  ($Snap.second $t@50@01)
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
                    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
            (=>
              (not
                (=
                  _0_quant_0@52@01
                  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))))
              (and
                (not
                  (=
                    _0_quant_0@52@01
                    ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))))
                (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
                  $Snap.unit
                  ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
                  ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
                  ($Snap.combine
                    ($Snap.second $t@50@01)
                    ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
                      ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@52@01)
                (<
                  _0_quant_0@52@01
                  (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
                    $Snap.unit
                    $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
                (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
                  $Snap.unit
                  ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@52@01)))
            (or
              (not
                (=
                  _0_quant_0@52@01
                  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))))
              (=
                _0_quant_0@52@01
                ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))))))
        (or
          (<
            _0_quant_0@52@01
            (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
              ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
              ($Snap.combine
                ($Snap.second $t@50@01)
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
                  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
          (not
            (<
              _0_quant_0@52@01
              (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
                ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
                ($Snap.combine
                  ($Snap.second $t@50@01)
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
                    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))))))
    (or (<= 0 _0_quant_0@52@01) (not (<= 0 _0_quant_0@52@01))))
  :pattern ((m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
    ($Snap.combine
      ($Snap.second $t@50@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@52@01))
  :qid |prog.l693-aux|)))
(assert (forall ((_0_quant_0@52@01 Int)) (!
  (and
    (=>
      (<= 0 _0_quant_0@52@01)
      (and
        (<= 0 _0_quant_0@52@01)
        (=>
          (<
            _0_quant_0@52@01
            (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
              ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
              ($Snap.combine
                ($Snap.second $t@50@01)
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
                  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
          (and
            (<
              _0_quant_0@52@01
              (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
                ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
                ($Snap.combine
                  ($Snap.second $t@50@01)
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
                    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
            (=>
              (not
                (=
                  _0_quant_0@52@01
                  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))))
              (and
                (not
                  (=
                    _0_quant_0@52@01
                    ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))))
                (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
                  $Snap.unit
                  ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
                  ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
                  ($Snap.combine
                    ($Snap.second $t@50@01)
                    ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
                      ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@52@01)
                (<
                  _0_quant_0@52@01
                  (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
                    $Snap.unit
                    $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
                (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
                  $Snap.unit
                  ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@52@01)))
            (or
              (not
                (=
                  _0_quant_0@52@01
                  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))))
              (=
                _0_quant_0@52@01
                ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))))))
        (or
          (<
            _0_quant_0@52@01
            (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
              ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
              ($Snap.combine
                ($Snap.second $t@50@01)
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
                  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
          (not
            (<
              _0_quant_0@52@01
              (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
                ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
                ($Snap.combine
                  ($Snap.second $t@50@01)
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
                    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))))))
    (or (<= 0 _0_quant_0@52@01) (not (<= 0 _0_quant_0@52@01))))
  :pattern ((m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@52@01))
  :qid |prog.l693-aux|)))
(assert (forall ((_0_quant_0@52@01 Int)) (!
  (=>
    (<= 0 _0_quant_0@52@01)
    (and
      (and
        (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route%precondition ($Snap.combine
          ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
          ($Snap.combine
            ($Snap.second $t@50@01)
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
              ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))
        (m_length__$TY$__Snap$struct$m_Route$$int$%precondition ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
          ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
          ($Snap.combine
            ($Snap.second $t@50@01)
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
              ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
      (=>
        (and
          (<
            _0_quant_0@52@01
            (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
              ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
              ($Snap.combine
                ($Snap.second $t@50@01)
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
                  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
          (not
            (=
              _0_quant_0@52@01
              ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01))))))
        (and
          (and
            (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route%precondition ($Snap.combine
              ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
              ($Snap.combine
                ($Snap.second $t@50@01)
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
                  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))
            (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
              ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
              ($Snap.combine
                ($Snap.second $t@50@01)
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
                  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@52@01))
          (and
            (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route%precondition ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))
            (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@52@01))))))
  :pattern ((m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
    ($Snap.combine
      ($Snap.second $t@50@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@52@01))
  :pattern ((m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@52@01))
  :qid |prog.l693_precondition|)))
(push) ; 18
(assert (not (forall ((_0_quant_0@52@01 Int)) (!
  (=>
    (=>
      (<= 0 _0_quant_0@52@01)
      (and
        (and
          (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route%precondition ($Snap.combine
            ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
            ($Snap.combine
              ($Snap.second $t@50@01)
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
                ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))
          (m_length__$TY$__Snap$struct$m_Route$$int$%precondition ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
            ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
            ($Snap.combine
              ($Snap.second $t@50@01)
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
                ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
        (=>
          (and
            (<
              _0_quant_0@52@01
              (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
                ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
                ($Snap.combine
                  ($Snap.second $t@50@01)
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
                    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
            (not
              (=
                _0_quant_0@52@01
                ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01))))))
          (and
            (and
              (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route%precondition ($Snap.combine
                ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
                ($Snap.combine
                  ($Snap.second $t@50@01)
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
                    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))
              (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
                ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
                ($Snap.combine
                  ($Snap.second $t@50@01)
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
                    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@52@01))
            (and
              (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route%precondition ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))
              (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@52@01))))))
    (or
      (not (<= 0 _0_quant_0@52@01))
      (or
        (not
          (<
            _0_quant_0@52@01
            (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
              ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
              ($Snap.combine
                ($Snap.second $t@50@01)
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
                  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))))))
        (or
          (=
            _0_quant_0@52@01
            ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01))))
          (=
            (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$ ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
              ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
              ($Snap.combine
                ($Snap.second $t@50@01)
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
                  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@52@01)
            (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$ ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@52@01))))))
  :pattern ((m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
    ($Snap.combine
      ($Snap.second $t@50@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@52@01))
  :pattern ((m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@52@01))
  :qid |prog.l693|))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(assert (forall ((_0_quant_0@52@01 Int)) (!
  (or
    (not (<= 0 _0_quant_0@52@01))
    (or
      (not
        (<
          _0_quant_0@52@01
          (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
            ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
            ($Snap.combine
              ($Snap.second $t@50@01)
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
                ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))))))
      (or
        (=
          _0_quant_0@52@01
          ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01))))
        (=
          (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$ ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
            ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
            ($Snap.combine
              ($Snap.second $t@50@01)
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
                ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@52@01)
          (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$ ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@52@01)))))
  :pattern ((m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
    ($Snap.combine
      ($Snap.second $t@50@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@52@01))
  :pattern ((m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@52@01))
  :qid |prog.l693|)))
; [eval] -1
; [eval] old[l18](_0.val_ref)
; [eval] old[pre](_1.val_ref)
; [eval] old[pre](_1.val_ref)
; [eval] old[pre](m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref)))
; [eval] m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref)
(push) ; 18
; [eval] read$()
(push) ; 19
(pop) ; 19
; Joined path conditions
(push) ; 19
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(push) ; 19
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(push) ; 19
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(pop) ; 18
; Joined path conditions
(set-option :timeout 0)
(push) ; 18
(pop) ; 18
; Joined path conditions
; [eval] old[pre](_1.val_ref)
; [eval] old[pre]((unfolding acc(i32(_2), write) in _2.val_int))
; [eval] (unfolding acc(i32(_2), write) in _2.val_int)
(push) ; 18
(pop) ; 18
; Joined path conditions
; [eval] old[l18](_0.val_ref)
; [eval] old[l18](_0.val_ref)
; [eval] old[l18](_0.val_ref)
; [eval] old[pre](_1.val_ref)
; [eval] old[pre]((unfolding acc(i32(_2), write) in _2.val_int))
; [eval] (unfolding acc(i32(_2), write) in _2.val_int)
(push) ; 18
(pop) ; 18
; Joined path conditions
; [eval] old[pre](_1.val_ref)
(pop) ; 17
(pop) ; 16
(pop) ; 15
; [eval] __t5 && (__t6 && (__t6 && (__t7 && (__t7 && (__t8 && __t8)))))
; [then-branch: 51 | False | dead]
; [else-branch: 51 | True | live]
(push) ; 15
; [else-branch: 51 | True]
(pop) ; 15
(pop) ; 14
; [eval] __t6 && (__t6 && (__t7 && (__t7 && (__t8 && __t8))))
; [then-branch: 52 | False | dead]
; [else-branch: 52 | True | live]
(push) ; 14
; [else-branch: 52 | True]
(pop) ; 14
(pop) ; 13
(pop) ; 12
(pop) ; 11
(pop) ; 10
; [eval] __t7 && (__t7 && (__t8 && __t8))
; [then-branch: 53 | False | dead]
; [else-branch: 53 | True | live]
(push) ; 10
; [else-branch: 53 | True]
(pop) ; 10
(pop) ; 9
; [eval] __t7 && (__t8 && __t8)
; [then-branch: 54 | False | dead]
; [else-branch: 54 | True | live]
(push) ; 9
; [else-branch: 54 | True]
(pop) ; 9
(pop) ; 8
(pop) ; 7
; [eval] __t8 && (__t8 && __t7)
(push) ; 7
; [then-branch: 55 | True | live]
; [else-branch: 55 | False | live]
(push) ; 8
; [then-branch: 55 | True]
(push) ; 9
; [then-branch: 56 | True | live]
; [else-branch: 56 | False | live]
(push) ; 10
; [then-branch: 56 | True]
(pop) ; 10
(push) ; 10
; [else-branch: 56 | False]
(assert false)
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(pop) ; 8
(push) ; 8
; [else-branch: 55 | False]
(assert false)
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
; [then-branch: 57 | False | dead]
; [else-branch: 57 | True | live]
(push) ; 7
; [else-branch: 57 | True]
(pop) ; 7
(pop) ; 6
(pop) ; 5
(pop) ; 4
(push) ; 4
; [exec]
; label l19
; [exec]
; assert (unfolding acc(struct$m_Point(_0.val_ref), write) in
;     (unfolding acc(i32(_0.val_ref.f$x), write) in
;       _0.val_ref.f$x.val_int ==
;       old[pre](m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref),
;       (unfolding acc(i32(_2), write) in _2.val_int)))))
; [eval] (unfolding acc(struct$m_Point(_0.val_ref), write) in (unfolding acc(i32(_0.val_ref.f$x), write) in _0.val_ref.f$x.val_int == old[pre](m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref), (unfolding acc(i32(_2), write) in _2.val_int)))))
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@31@01))))
  val_ref@41@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (struct$m_Point%trigger ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01)))) val_ref@41@01))
(assert (=
  ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))
(assert (not (= val_ref@41@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [eval] (unfolding acc(i32(_0.val_ref.f$x), write) in _0.val_ref.f$x.val_int == old[pre](m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref), (unfolding acc(i32(_2), write) in _2.val_int))))
(set-option :timeout 0)
(push) ; 6
(assert (i32%trigger ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  _2@16@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
    $Ref.null)))
; [eval] _0.val_ref.f$x.val_int == old[pre](m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref), (unfolding acc(i32(_2), write) in _2.val_int)))
; [eval] old[pre](m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref), (unfolding acc(i32(_2), write) in _2.val_int)))
; [eval] m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref), (unfolding acc(i32(_2), write) in _2.val_int))
; [eval] snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref)
(set-option :timeout 0)
(push) ; 7
; [eval] read$()
(push) ; 8
(pop) ; 8
; Joined path conditions
(push) ; 8
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(push) ; 8
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(pop) ; 7
; Joined path conditions
; [eval] (unfolding acc(i32(_2), write) in _2.val_int)
(set-option :timeout 0)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
; [eval] 0 <= _2
; [eval] _2 < m_length__$TY$__Snap$struct$m_Route$$int$(_1)
; [eval] m_length__$TY$__Snap$struct$m_Route$$int$(_1)
(push) ; 8
(pop) ; 8
; Joined path conditions
(assert (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))))
(pop) ; 7
; Joined path conditions
(assert (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))))
(pop) ; 6
; Joined path conditions
(assert (and
  (i32%trigger ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
      $Ref.null))
  (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01))))))
(pop) ; 5
; Joined path conditions
(assert (and
  (struct$m_Point%trigger ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01)))) val_ref@41@01)
  (=
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
      ($Snap.second ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))
  (not (= val_ref@41@01 $Ref.null))
  (=
    ($Snap.second ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
  (i32%trigger ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
      $Ref.null))
  (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01))))))
(push) ; 5
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))
  (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$ ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))
  (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$ ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01))))))
; [exec]
; assert true
; [exec]
; exhale acc(_0.val_ref, write) && acc(struct$m_Point(_0.val_ref), write)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@31@01))))
  val_ref@41@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(DeadBorrowToken$(-1), write) &&
;   acc(struct$m_Point(old[l19](_0.val_ref)), write) --*
;   acc(struct$m_Route(old[pre](_1.val_ref)), write) &&
;   (m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref))) ==
;   old[pre](m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref))) &&
;   (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref)),
;   old[pre]((unfolding acc(i32(_2), write) in _2.val_int))) ==
;   old[lhs]((unfolding acc(struct$m_Point(old[l19](_0.val_ref)), write) in
;     (unfolding acc(i32(old[l19](_0.val_ref).f$x), write) in
;       old[l19](_0.val_ref).f$x.val_int))) &&
;   (forall _0_quant_0: Int ::
;     { m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref)),
;     _0_quant_0) }
;     { old[pre](m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref),
;     _0_quant_0)) }
;     !(0 <= _0_quant_0) ||
;     (!(_0_quant_0 <
;     m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref)))) ||
;     (_0_quant_0 == old[pre]((unfolding acc(i32(_2), write) in _2.val_int)) ||
;     m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref)),
;     _0_quant_0) ==
;     old[pre](m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref),
;     _0_quant_0)))))))
; [eval] -1
; [eval] old[l19](_0.val_ref)
; [eval] old[pre](_1.val_ref)
; [eval] old[pre](_1.val_ref)
; [eval] old[pre](m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref)))
; [eval] m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref)
(set-option :timeout 0)
(push) ; 5
; [eval] read$()
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(push) ; 6
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(pop) ; 5
; Joined path conditions
(set-option :timeout 0)
(push) ; 5
(pop) ; 5
; Joined path conditions
; [eval] old[pre](_1.val_ref)
; [eval] old[pre]((unfolding acc(i32(_2), write) in _2.val_int))
; [eval] (unfolding acc(i32(_2), write) in _2.val_int)
(push) ; 5
(pop) ; 5
; Joined path conditions
; [eval] old[l19](_0.val_ref)
; [eval] old[l19](_0.val_ref)
; [eval] old[l19](_0.val_ref)
; [eval] old[pre](_1.val_ref)
; [eval] old[pre]((unfolding acc(i32(_2), write) in _2.val_int))
; [eval] (unfolding acc(i32(_2), write) in _2.val_int)
(push) ; 5
(pop) ; 5
; Joined path conditions
; [eval] old[pre](_1.val_ref)
; [exec]
; label end_of_method
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 0 | !(val_bool@38@01)]
(assert (not val_bool@38@01))
(pop) ; 3
; [eval] !__t10
(push) ; 3
(set-option :timeout 10)
(assert (not val_bool@38@01))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not val_bool@38@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [then-branch: 58 | !(val_bool@38@01) | live]
; [else-branch: 58 | val_bool@38@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 58 | !(val_bool@38@01)]
(assert (not val_bool@38@01))
; [exec]
; label bb0
; [exec]
; __t2 := true
; [exec]
; _10 := builtin$havoc_int()
(declare-const ret@53@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; unfold acc(struct$m_Route(_1.val_ref), write)
(assert (=
  ($Snap.first ($Snap.second $t@31@01))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
    ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second $t@31@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (struct$m_Route%trigger ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))))
; [exec]
; _10 := m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$discriminant$$__$TY$__m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$int$(_1.val_ref.f$rest)
; [eval] m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$discriminant$$__$TY$__m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$int$(_1.val_ref.f$rest)
(set-option :timeout 0)
(push) ; 4
; [eval] read$()
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$discriminant$$__$TY$__m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$int$%precondition ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))
(pop) ; 4
; Joined path conditions
(assert (m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$discriminant$$__$TY$__m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$int$%precondition ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))
(declare-const _10@54@01 Int)
(assert (=
  _10@54@01
  (m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$discriminant$$__$TY$__m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_$$int$ ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
; [exec]
; __t11 := _10
; [eval] __t11 == 0
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= _10@54@01 0))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 59 | _10@54@01 == 0 | dead]
; [else-branch: 59 | _10@54@01 != 0 | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 59 | _10@54@01 != 0]
(assert (not (= _10@54@01 0)))
(pop) ; 4
; [eval] !(__t11 == 0)
; [eval] __t11 == 0
(push) ; 4
(set-option :timeout 10)
(assert (not (= _10@54@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= _10@54@01 0))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 60 | _10@54@01 != 0 | live]
; [else-branch: 60 | _10@54@01 == 0 | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 60 | _10@54@01 != 0]
(assert (not (= _10@54@01 0)))
; [exec]
; label l1
; [exec]
; __t4 := true
; [exec]
; __t5 := true
; [exec]
; _11 := builtin$havoc_ref()
(declare-const ret@55@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_11.val_ref, write)
(declare-const $t@56@01 $Ref)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _1@15@01 ret@55@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@55@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; unfold acc(m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_(_1.val_ref.f$rest), write)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))
  $Snap.unit))
; [eval] 0 <= self.discriminant
(assert (<=
  0
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))
  $Snap.unit))
; [eval] self.discriminant <= 1
(assert (<=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))
  1))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))
; [exec]
; unfold acc(m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_Some(_1.val_ref.f$rest.enum_Some), write)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))))
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
    $Ref.null)))
; State saturation: after unfold
(check-sat)
; unknown
(assert (m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_Some%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))))
; [exec]
; unfold acc(struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global(_1.val_ref.f$rest.enum_Some.f$0), write)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ret@55@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  _1@15@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
    $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))))
; [exec]
; _11.val_ref := _1.val_ref.f$rest.enum_Some.f$0.val_ref
(declare-const val_ref@57@01 $Ref)
(assert (=
  val_ref@57@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
  ret@55@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _1@15@01 ret@55@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l8
; [exec]
; _13 := builtin$havoc_ref()
(declare-const ret@58@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_13.val_ref, write)
(declare-const $t@59@01 $Ref)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _1@15@01 ret@58@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
  ret@58@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@55@01 ret@58@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@58@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _13.val_ref := _11.val_ref
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@55@01 ret@58@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
  ret@58@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _1@15@01 ret@58@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l9
; [exec]
; _15 := builtin$havoc_int()
(declare-const ret@60@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _15 := _2.val_int
(declare-const _15@61@01 Int)
(assert (= _15@61@01 ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))))
; [exec]
; label l10
; [exec]
; _16 := builtin$havoc_ref()
(declare-const ret@62@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_16.tuple_0, write)
(declare-const $t@63@01 $Ref)
(assert (not (= ret@62@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_16.tuple_0.val_int, write)
(declare-const $t@64@01 Int)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _2@16@01 $t@63@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@63@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_16.tuple_1, write)
(declare-const $t@65@01 $Ref)
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(_16.tuple_1.val_bool, write)
(declare-const $t@66@01 Bool)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@36@01 $t@65@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@65@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _16.tuple_0.val_int := _15 - 1
; [eval] _15 - 1
(declare-const val_int@67@01 Int)
(assert (= val_int@67@01 (- _15@61@01 1)))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _2@16@01 $t@63@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; _16.tuple_1.val_bool := false
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@36@01 $t@65@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t12 := _16.tuple_1.val_bool
; [exec]
; assert !__t12
; [eval] !__t12
; [exec]
; __t6 := true
; [exec]
; _14 := _16.tuple_0
; [exec]
; label l11
; [exec]
; label l12
; [exec]
; assert 0 <= _14.val_int &&
;   _14.val_int <
;   m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_13.val_ref))
; [eval] 0 <= _14.val_int
(set-option :timeout 0)
(push) ; 5
(assert (not (<= 0 val_int@67@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 val_int@67@01))
; [eval] _14.val_int < m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_13.val_ref))
; [eval] m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_13.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_13.val_ref)
(push) ; 5
; [eval] read$()
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))))
  val_ref@57@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route%precondition ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))) val_ref@57@01))
(pop) ; 5
; Joined path conditions
(assert (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route%precondition ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))) val_ref@57@01))
(set-option :timeout 0)
(push) ; 5
(assert (m_length__$TY$__Snap$struct$m_Route$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))) val_ref@57@01)))
(pop) ; 5
; Joined path conditions
(assert (m_length__$TY$__Snap$struct$m_Route$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))) val_ref@57@01)))
(push) ; 5
(assert (not (<
  val_int@67@01
  (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))) val_ref@57@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (<
  val_int@67@01
  (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))) val_ref@57@01))))
; [exec]
; assert true
; [exec]
; fold acc(i32(_14), write)
(assert (i32%trigger ($SortWrappers.IntTo$Snap val_int@67@01) $t@63@01))
; [exec]
; exhale acc(_13.val_ref, write) &&
;   (acc(struct$m_Route(_13.val_ref), write) && acc(i32(_14), write))
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))))
  val_ref@57@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; _12 := builtin$havoc_ref()
(declare-const ret@68@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_12.val_ref, write) && acc(struct$m_Point(_12.val_ref), write)
(declare-const $t@69@01 $Snap)
(assert (= $t@69@01 ($Snap.combine ($Snap.first $t@69@01) ($Snap.second $t@69@01))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@55@01 ret@68@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
  ret@68@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _1@15@01 ret@68@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@68@01 $Ref.null)))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@31@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first $t@69@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale true
(declare-const $t@70@01 $Snap)
(assert (= $t@70@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (unfolding acc(struct$m_Point(_12.val_ref), write) in
;     (unfolding acc(i32(_12.val_ref.f$x), write) in
;       _12.val_ref.f$x.val_int ==
;       old[l12](m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_13.val_ref),
;       _14.val_int))))
(declare-const $t@71@01 $Snap)
(assert (= $t@71@01 $Snap.unit))
; [eval] (unfolding acc(struct$m_Point(_12.val_ref), write) in (unfolding acc(i32(_12.val_ref.f$x), write) in _12.val_ref.f$x.val_int == old[l12](m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_13.val_ref), _14.val_int))))
(set-option :timeout 0)
(push) ; 5
(assert (struct$m_Point%trigger ($Snap.second $t@69@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@69@01))))
(assert (=
  ($Snap.second $t@69@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@69@01))
    ($Snap.second ($Snap.second $t@69@01)))))
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@69@01)) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second $t@69@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@69@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@69@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@69@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@69@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@69@01)))))))
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@69@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@69@01))))))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [eval] (unfolding acc(i32(_12.val_ref.f$x), write) in _12.val_ref.f$x.val_int == old[l12](m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_13.val_ref), _14.val_int)))
(set-option :timeout 0)
(push) ; 6
(assert (i32%trigger ($Snap.first ($Snap.second ($Snap.second $t@69@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@69@01)))))
(push) ; 7
(set-option :timeout 10)
(assert (not (= _2@16@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@69@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@69@01))) $Ref.null)))
; [eval] _12.val_ref.f$x.val_int == old[l12](m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_13.val_ref), _14.val_int))
; [eval] old[l12](m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_13.val_ref), _14.val_int))
; [eval] m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_13.val_ref), _14.val_int)
; [eval] snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_13.val_ref)
(set-option :timeout 0)
(push) ; 7
; [eval] read$()
(push) ; 8
(pop) ; 8
; Joined path conditions
(push) ; 8
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))))
  val_ref@57@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(pop) ; 7
; Joined path conditions
(set-option :timeout 0)
(push) ; 7
; [eval] 0 <= _2
; [eval] _2 < m_length__$TY$__Snap$struct$m_Route$$int$(_1)
; [eval] m_length__$TY$__Snap$struct$m_Route$$int$(_1)
(push) ; 8
(pop) ; 8
; Joined path conditions
(assert (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))) val_ref@57@01) val_int@67@01))
(pop) ; 7
; Joined path conditions
(assert (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))) val_ref@57@01) val_int@67@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (i32%trigger ($Snap.first ($Snap.second ($Snap.second $t@69@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@69@01))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@69@01)))
      $Ref.null))
  (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))) val_ref@57@01) val_int@67@01)))
(pop) ; 5
; Joined path conditions
(assert (and
  (struct$m_Point%trigger ($Snap.second $t@69@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@69@01)))
  (=
    ($Snap.second $t@69@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@69@01))
      ($Snap.second ($Snap.second $t@69@01))))
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@69@01)) $Ref.null))
  (=
    ($Snap.second ($Snap.second $t@69@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second $t@69@01)))
      ($Snap.second ($Snap.second ($Snap.second $t@69@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.second $t@69@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@69@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@69@01))))))
  (i32%trigger ($Snap.first ($Snap.second ($Snap.second $t@69@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@69@01))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@69@01)))
      $Ref.null))
  (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))) val_ref@57@01) val_int@67@01)))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@69@01))))
  (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$ ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))) val_ref@57@01) val_int@67@01)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label l13
; [exec]
; __t7 := true
; [exec]
; _9 := builtin$havoc_ref()
(declare-const ret@72@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_9.val_ref, write)
(declare-const $t@73@01 $Ref)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@68@01 ret@72@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@55@01 ret@72@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
  ret@72@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _1@15@01 ret@72@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@72@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _9.val_ref := _12.val_ref
(declare-const val_ref@74@01 $Ref)
(assert (= val_ref@74@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@69@01))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _1@15@01 ret@72@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
  ret@72@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@55@01 ret@72@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@68@01 ret@72@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l14
; [exec]
; _4 := builtin$havoc_ref()
(declare-const ret@75@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_4.val_ref, write)
(declare-const $t@76@01 $Ref)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@68@01 ret@75@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@55@01 ret@75@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
  ret@75@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _1@15@01 ret@75@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@72@01 ret@75@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@75@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _4.val_ref := _9.val_ref
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@72@01 ret@75@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _1@15@01 ret@75@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
  ret@75@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@55@01 ret@75@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@68@01 ret@75@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l15
; [exec]
; label bb2
; [exec]
; __t8 := true
; [exec]
; _3 := builtin$havoc_ref()
(declare-const ret@77@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_3.val_ref, write)
(declare-const $t@78@01 $Ref)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@68@01 ret@77@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@55@01 ret@77@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
  ret@77@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _1@15@01 ret@77@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@72@01 ret@77@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@75@01 ret@77@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@77@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _3.val_ref := _4.val_ref
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@75@01 ret@77@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@72@01 ret@77@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _1@15@01 ret@77@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
  ret@77@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@55@01 ret@77@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@68@01 ret@77@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l16
; [exec]
; _0 := builtin$havoc_ref()
(declare-const ret@79@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_0.val_ref, write)
(declare-const $t@80@01 $Ref)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@68@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@55@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
  ret@79@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _1@15@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@72@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@75@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@77@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@79@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _0.val_ref := _3.val_ref
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@77@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@75@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@72@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _1@15@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
  ret@79@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@55@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@68@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l17
; [exec]
; label l18
; [exec]
; package acc(DeadBorrowToken$(-1), write) &&
; acc(struct$m_Point(old[l18](_0.val_ref)), write) --*
; acc(struct$m_Route(old[pre](_1.val_ref)), write) &&
; (m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref))) ==
; old[pre](m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref))) &&
; (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref)),
; old[pre]((unfolding acc(i32(_2), write) in _2.val_int))) ==
; old[lhs]((unfolding acc(struct$m_Point(old[l18](_0.val_ref)), write) in
;   (unfolding acc(i32(old[l18](_0.val_ref).f$x), write) in
;     old[l18](_0.val_ref).f$x.val_int))) &&
; (forall _0_quant_0: Int ::
;   { m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref)),
;   _0_quant_0) }
;   { old[pre](m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref),
;   _0_quant_0)) }
;   !(0 <= _0_quant_0) ||
;   (!(_0_quant_0 <
;   m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref)))) ||
;   (_0_quant_0 == old[pre]((unfolding acc(i32(_2), write) in _2.val_int)) ||
;   m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref)),
;   _0_quant_0) ==
;   old[pre](m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref),
;   _0_quant_0))))))) {
;   var _old$l13$0$p0: Ref
;   if (__t8) {
;   }
;   if (__t8 && __t8) {
;   }
;   if (__t8 && (__t8 && __t7)) {
;   }
;   if (__t8 && (__t8 && __t1)) {
;   }
;   if (__t7 && (__t8 && __t8)) {
;   }
;   if (__t7 && (__t7 && (__t8 && __t8))) {
;   }
;   if (__t1 && (__t8 && __t8)) {
;   }
;   if (__t1 && (__t1 && (__t8 && __t8))) {
;   }
;   if (__t6 && (__t7 && (__t7 && (__t8 && __t8)))) {
;     _old$l13$0$p0 := old[l14](_12.val_ref)
;     inhale acc(DeadBorrowToken$(12), write) &&
;       acc(struct$m_Point(_old$l13$0$p0), write) --*
;       acc(struct$m_Route(old[l12](_13.val_ref)), write) &&
;       (m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[l12](_13.val_ref))) ==
;       old[l12](m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_13.val_ref))) &&
;       (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[l12](_13.val_ref)),
;       old[l12](_14.val_int)) ==
;       old[lhs]((unfolding acc(struct$m_Point(_old$l13$0$p0), write) in
;         (unfolding acc(i32(_old$l13$0$p0.f$x), write) in
;           _old$l13$0$p0.f$x.val_int))) &&
;       (forall _0_quant_0: Int ::
;         { m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[l12](_13.val_ref)),
;         _0_quant_0) }
;         { old[l12](m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_13.val_ref),
;         _0_quant_0)) }
;         !(0 <= _0_quant_0) ||
;         (!(_0_quant_0 <
;         m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[l12](_13.val_ref)))) ||
;         (_0_quant_0 == old[l12](_14.val_int) ||
;         m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[l12](_13.val_ref)),
;         _0_quant_0) ==
;         old[l12](m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_13.val_ref),
;         _0_quant_0)))))))
;     inhale acc(DeadBorrowToken$(12), write)
;     apply acc(DeadBorrowToken$(12), write) &&
;       acc(struct$m_Point(_old$l13$0$p0), write) --*
;       acc(struct$m_Route(old[l12](_13.val_ref)), write) &&
;       (m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[l12](_13.val_ref))) ==
;       old[l12](m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_13.val_ref))) &&
;       (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[l12](_13.val_ref)),
;       old[l12](_14.val_int)) ==
;       old[lhs]((unfolding acc(struct$m_Point(_old$l13$0$p0), write) in
;         (unfolding acc(i32(_old$l13$0$p0.f$x), write) in
;           _old$l13$0$p0.f$x.val_int))) &&
;       (forall _0_quant_0: Int ::
;         { m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[l12](_13.val_ref)),
;         _0_quant_0) }
;         { old[l12](m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_13.val_ref),
;         _0_quant_0)) }
;         !(0 <= _0_quant_0) ||
;         (!(_0_quant_0 <
;         m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[l12](_13.val_ref)))) ||
;         (_0_quant_0 == old[l12](_14.val_int) ||
;         m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[l12](_13.val_ref)),
;         _0_quant_0) ==
;         old[l12](m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_13.val_ref),
;         _0_quant_0)))))))
;   }
;   if (__t6 && (__t6 && (__t7 && (__t7 && (__t8 && __t8))))) {
;   }
;   if (__t5 && (__t6 && (__t6 && (__t7 && (__t7 && (__t8 && __t8)))))) {
;   }
;   if (__t5 &&
;   (__t5 && (__t6 && (__t6 && (__t7 && (__t7 && (__t8 && __t8))))))) {
;     assert acc(old[l18](_1.val_ref).f$rest, read$())
;     assert acc(old[l18](_1.val_ref).f$rest.enum_Some, read$())
;     assert acc(old[l18](_1.val_ref).f$rest.enum_Some.f$0, read$())
;     fold acc(struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global(old[l18](_1.val_ref).f$rest.enum_Some.f$0), write)
;     assert acc(old[l18](_1.val_ref).f$rest, read$())
;     assert acc(old[l18](_1.val_ref).f$rest.enum_Some, read$())
;     fold acc(m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_Some(old[l18](_1.val_ref).f$rest.enum_Some), write)
;     assert acc(old[l18](_1.val_ref).f$rest, read$())
;     fold acc(m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_(old[l18](_1.val_ref).f$rest), write)
;   }
;   if (__t1 && (__t1 && (__t1 && (__t8 && __t8)))) {
;   }
;   fold acc(struct$m_Route(old[pre](_1.val_ref)), write)
; }
(set-option :timeout 0)
(push) ; 5
(declare-const $t@81@01 $Snap)
(assert (= $t@81@01 ($Snap.combine ($Snap.first $t@81@01) ($Snap.second $t@81@01))))
; [eval] -1
; [eval] old[l18](_0.val_ref)
; [exec]
; var _old$l13$0$p0: Ref
(declare-const _old$l13$0$p0@82@01 $Ref)
; [eval] !__t8
; [then-branch: 61 | False | dead]
; [else-branch: 61 | True | live]
(push) ; 6
; [else-branch: 61 | True]
(pop) ; 6
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 62 | True | live]
; [else-branch: 62 | False | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 62 | True]
; [eval] !(__t8 && __t8)
; [eval] __t8 && __t8
(push) ; 7
; [then-branch: 63 | True | live]
; [else-branch: 63 | False | live]
(push) ; 8
; [then-branch: 63 | True]
(pop) ; 8
(push) ; 8
; [else-branch: 63 | False]
(assert false)
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
; [then-branch: 64 | False | dead]
; [else-branch: 64 | True | live]
(push) ; 7
; [else-branch: 64 | True]
(pop) ; 7
; [eval] __t8 && __t8
(push) ; 7
; [then-branch: 65 | True | live]
; [else-branch: 65 | False | live]
(push) ; 8
; [then-branch: 65 | True]
(pop) ; 8
(push) ; 8
; [else-branch: 65 | False]
(assert false)
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 66 | True | live]
; [else-branch: 66 | False | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 66 | True]
; [eval] !(__t8 && (__t8 && __t7))
; [eval] __t8 && (__t8 && __t7)
(push) ; 8
; [then-branch: 67 | True | live]
; [else-branch: 67 | False | live]
(push) ; 9
; [then-branch: 67 | True]
(push) ; 10
; [then-branch: 68 | True | live]
; [else-branch: 68 | False | live]
(push) ; 11
; [then-branch: 68 | True]
(pop) ; 11
(push) ; 11
; [else-branch: 68 | False]
(assert false)
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(pop) ; 9
(push) ; 9
; [else-branch: 67 | False]
(assert false)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
; [then-branch: 69 | False | dead]
; [else-branch: 69 | True | live]
(push) ; 8
; [else-branch: 69 | True]
(pop) ; 8
; [eval] __t8 && (__t8 && __t7)
(push) ; 8
; [then-branch: 70 | True | live]
; [else-branch: 70 | False | live]
(push) ; 9
; [then-branch: 70 | True]
(push) ; 10
; [then-branch: 71 | True | live]
; [else-branch: 71 | False | live]
(push) ; 11
; [then-branch: 71 | True]
(pop) ; 11
(push) ; 11
; [else-branch: 71 | False]
(assert false)
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(pop) ; 9
(push) ; 9
; [else-branch: 70 | False]
(assert false)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(push) ; 8
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 72 | True | live]
; [else-branch: 72 | False | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 72 | True]
; [eval] !(__t8 && (__t8 && __t1))
; [eval] __t8 && (__t8 && __t1)
(push) ; 9
; [then-branch: 73 | True | live]
; [else-branch: 73 | False | live]
(push) ; 10
; [then-branch: 73 | True]
(push) ; 11
; [then-branch: 74 | True | live]
; [else-branch: 74 | False | live]
(push) ; 12
; [then-branch: 74 | True]
(pop) ; 12
(push) ; 12
; [else-branch: 74 | False]
(assert false)
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(pop) ; 10
(push) ; 10
; [else-branch: 73 | False]
(assert false)
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(push) ; 9
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 75 | True | live]
; [else-branch: 75 | False | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 75 | True]
; [eval] !(__t7 && (__t8 && __t8))
; [eval] __t7 && (__t8 && __t8)
(push) ; 10
; [then-branch: 76 | True | live]
; [else-branch: 76 | False | live]
(push) ; 11
; [then-branch: 76 | True]
(push) ; 12
; [then-branch: 77 | True | live]
; [else-branch: 77 | False | live]
(push) ; 13
; [then-branch: 77 | True]
(pop) ; 13
(push) ; 13
; [else-branch: 77 | False]
(assert false)
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(push) ; 11
; [else-branch: 76 | False]
(assert false)
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
; [then-branch: 78 | False | dead]
; [else-branch: 78 | True | live]
(push) ; 10
; [else-branch: 78 | True]
(pop) ; 10
; [eval] __t7 && (__t8 && __t8)
(push) ; 10
; [then-branch: 79 | True | live]
; [else-branch: 79 | False | live]
(push) ; 11
; [then-branch: 79 | True]
(push) ; 12
; [then-branch: 80 | True | live]
; [else-branch: 80 | False | live]
(push) ; 13
; [then-branch: 80 | True]
(pop) ; 13
(push) ; 13
; [else-branch: 80 | False]
(assert false)
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(pop) ; 11
(push) ; 11
; [else-branch: 79 | False]
(assert false)
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(push) ; 10
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 81 | True | live]
; [else-branch: 81 | False | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 81 | True]
; [eval] !(__t7 && (__t7 && (__t8 && __t8)))
; [eval] __t7 && (__t7 && (__t8 && __t8))
(push) ; 11
; [then-branch: 82 | True | live]
; [else-branch: 82 | False | live]
(push) ; 12
; [then-branch: 82 | True]
(push) ; 13
; [then-branch: 83 | True | live]
; [else-branch: 83 | False | live]
(push) ; 14
; [then-branch: 83 | True]
(push) ; 15
; [then-branch: 84 | True | live]
; [else-branch: 84 | False | live]
(push) ; 16
; [then-branch: 84 | True]
(pop) ; 16
(push) ; 16
; [else-branch: 84 | False]
(assert false)
(pop) ; 16
(pop) ; 15
; Joined path conditions
; Joined path conditions
(pop) ; 14
(push) ; 14
; [else-branch: 83 | False]
(assert false)
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(pop) ; 12
(push) ; 12
; [else-branch: 82 | False]
(assert false)
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
; [then-branch: 85 | False | dead]
; [else-branch: 85 | True | live]
(push) ; 11
; [else-branch: 85 | True]
(pop) ; 11
; [eval] __t7 && (__t7 && (__t8 && __t8))
(push) ; 11
; [then-branch: 86 | True | live]
; [else-branch: 86 | False | live]
(push) ; 12
; [then-branch: 86 | True]
(push) ; 13
; [then-branch: 87 | True | live]
; [else-branch: 87 | False | live]
(push) ; 14
; [then-branch: 87 | True]
(push) ; 15
; [then-branch: 88 | True | live]
; [else-branch: 88 | False | live]
(push) ; 16
; [then-branch: 88 | True]
(pop) ; 16
(push) ; 16
; [else-branch: 88 | False]
(assert false)
(pop) ; 16
(pop) ; 15
; Joined path conditions
; Joined path conditions
(pop) ; 14
(push) ; 14
; [else-branch: 87 | False]
(assert false)
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(pop) ; 12
(push) ; 12
; [else-branch: 86 | False]
(assert false)
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(push) ; 11
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 89 | True | live]
; [else-branch: 89 | False | dead]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 89 | True]
; [eval] !(__t1 && (__t8 && __t8))
; [eval] __t1 && (__t8 && __t8)
(push) ; 12
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 90 | True | live]
; [else-branch: 90 | False | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 90 | True]
; [eval] !(__t1 && (__t1 && (__t8 && __t8)))
; [eval] __t1 && (__t1 && (__t8 && __t8))
(push) ; 13
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [then-branch: 91 | True | live]
; [else-branch: 91 | False | dead]
(set-option :timeout 0)
(push) ; 13
; [then-branch: 91 | True]
; [eval] __t6 && (__t7 && (__t7 && (__t8 && __t8)))
(push) ; 14
; [then-branch: 92 | True | live]
; [else-branch: 92 | False | live]
(push) ; 15
; [then-branch: 92 | True]
(push) ; 16
; [then-branch: 93 | True | live]
; [else-branch: 93 | False | live]
(push) ; 17
; [then-branch: 93 | True]
(push) ; 18
; [then-branch: 94 | True | live]
; [else-branch: 94 | False | live]
(push) ; 19
; [then-branch: 94 | True]
(push) ; 20
; [then-branch: 95 | True | live]
; [else-branch: 95 | False | live]
(push) ; 21
; [then-branch: 95 | True]
(pop) ; 21
(push) ; 21
; [else-branch: 95 | False]
(assert false)
(pop) ; 21
(pop) ; 20
; Joined path conditions
; Joined path conditions
(pop) ; 19
(push) ; 19
; [else-branch: 94 | False]
(assert false)
(pop) ; 19
(pop) ; 18
; Joined path conditions
; Joined path conditions
(pop) ; 17
(push) ; 17
; [else-branch: 93 | False]
(assert false)
(pop) ; 17
(pop) ; 16
; Joined path conditions
; Joined path conditions
(pop) ; 15
(push) ; 15
; [else-branch: 92 | False]
(assert false)
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(push) ; 14
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; [then-branch: 96 | True | live]
; [else-branch: 96 | False | dead]
(set-option :timeout 0)
(push) ; 14
; [then-branch: 96 | True]
; [exec]
; _old$l13$0$p0 := old[l14](_12.val_ref)
; [eval] old[l14](_12.val_ref)
(declare-const _old$l13$0$p0@83@01 $Ref)
(assert (= _old$l13$0$p0@83@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@69@01))))
; [exec]
; inhale acc(DeadBorrowToken$(12), write) &&
;   acc(struct$m_Point(_old$l13$0$p0), write) --*
;   acc(struct$m_Route(old[l12](_13.val_ref)), write) &&
;   (m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[l12](_13.val_ref))) ==
;   old[l12](m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_13.val_ref))) &&
;   (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[l12](_13.val_ref)),
;   old[l12](_14.val_int)) ==
;   old[lhs]((unfolding acc(struct$m_Point(_old$l13$0$p0), write) in
;     (unfolding acc(i32(_old$l13$0$p0.f$x), write) in
;       _old$l13$0$p0.f$x.val_int))) &&
;   (forall _0_quant_0: Int ::
;     { m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[l12](_13.val_ref)),
;     _0_quant_0) }
;     { old[l12](m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_13.val_ref),
;     _0_quant_0)) }
;     !(0 <= _0_quant_0) ||
;     (!(_0_quant_0 <
;     m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[l12](_13.val_ref)))) ||
;     (_0_quant_0 == old[l12](_14.val_int) ||
;     m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[l12](_13.val_ref)),
;     _0_quant_0) ==
;     old[l12](m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_13.val_ref),
;     _0_quant_0)))))))
(declare-const $t@84@01 $Snap)
; [eval] old[l12](_13.val_ref)
; [eval] old[l12](_13.val_ref)
; [eval] old[l12](m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_13.val_ref)))
; [eval] m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_13.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_13.val_ref)
(push) ; 15
; [eval] read$()
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(push) ; 16
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))))
  val_ref@57@01)))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(push) ; 16
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(pop) ; 15
; Joined path conditions
(set-option :timeout 0)
(push) ; 15
(pop) ; 15
; Joined path conditions
; [eval] old[l12](_13.val_ref)
; [eval] old[l12](_14.val_int)
; [eval] old[l12](_13.val_ref)
; [eval] old[l12](_14.val_int)
; [eval] old[l12](_13.val_ref)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(DeadBorrowToken$(12), write)
(declare-const $t@85@01 $Snap)
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; apply acc(DeadBorrowToken$(12), write) &&
;   acc(struct$m_Point(_old$l13$0$p0), write) --*
;   acc(struct$m_Route(old[l12](_13.val_ref)), write) &&
;   (m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[l12](_13.val_ref))) ==
;   old[l12](m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_13.val_ref))) &&
;   (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[l12](_13.val_ref)),
;   old[l12](_14.val_int)) ==
;   old[lhs]((unfolding acc(struct$m_Point(_old$l13$0$p0), write) in
;     (unfolding acc(i32(_old$l13$0$p0.f$x), write) in
;       _old$l13$0$p0.f$x.val_int))) &&
;   (forall _0_quant_0: Int ::
;     { m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[l12](_13.val_ref)),
;     _0_quant_0) }
;     { old[l12](m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_13.val_ref),
;     _0_quant_0)) }
;     !(0 <= _0_quant_0) ||
;     (!(_0_quant_0 <
;     m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[l12](_13.val_ref)))) ||
;     (_0_quant_0 == old[l12](_14.val_int) ||
;     m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[l12](_13.val_ref)),
;     _0_quant_0) ==
;     old[l12](m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_13.val_ref),
;     _0_quant_0)))))))
; [eval] old[l12](_13.val_ref)
; [eval] old[l12](_13.val_ref)
; [eval] old[l12](m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_13.val_ref)))
; [eval] m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_13.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_13.val_ref)
(set-option :timeout 0)
(push) ; 15
; [eval] read$()
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(push) ; 16
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))))
  val_ref@57@01)))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(push) ; 16
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(pop) ; 15
; Joined path conditions
(set-option :timeout 0)
(push) ; 15
(pop) ; 15
; Joined path conditions
; [eval] old[l12](_13.val_ref)
; [eval] old[l12](_14.val_int)
; [eval] old[l12](_13.val_ref)
; [eval] old[l12](_14.val_int)
; [eval] old[l12](_13.val_ref)
(push) ; 15
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= val_ref@74@01 _old$l13$0$p0@83@01)))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(check-sat)
; unknown
(assert (= ($Snap.combine $t@85@01 ($Snap.second $t@81@01)) ($Snap.first $t@84@01)))
(assert (=
  ($Snap.second $t@84@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@84@01))
    ($Snap.second ($Snap.second $t@84@01)))))
; [eval] old[l12](_13.val_ref)
(assert (=
  ($Snap.second ($Snap.second $t@84@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@84@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@84@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@84@01))) $Snap.unit))
; [eval] m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[l12](_13.val_ref))) == old[l12](m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_13.val_ref)))
; [eval] m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[l12](_13.val_ref)))
; [eval] snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[l12](_13.val_ref))
; [eval] old[l12](_13.val_ref)
(set-option :timeout 0)
(push) ; 15
; [eval] read$()
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(push) ; 16
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(push) ; 16
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(assert (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route%precondition ($Snap.first ($Snap.second $t@84@01)) val_ref@57@01))
(pop) ; 15
; Joined path conditions
(assert (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route%precondition ($Snap.first ($Snap.second $t@84@01)) val_ref@57@01))
(set-option :timeout 0)
(push) ; 15
(assert (m_length__$TY$__Snap$struct$m_Route$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@84@01)) val_ref@57@01)))
(pop) ; 15
; Joined path conditions
(assert (m_length__$TY$__Snap$struct$m_Route$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@84@01)) val_ref@57@01)))
; [eval] old[l12](m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_13.val_ref)))
; [eval] m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_13.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_13.val_ref)
(push) ; 15
; [eval] read$()
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(push) ; 16
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))))
  val_ref@57@01)))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(push) ; 16
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(pop) ; 15
; Joined path conditions
(set-option :timeout 0)
(push) ; 15
(pop) ; 15
; Joined path conditions
(assert (=
  (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@84@01)) val_ref@57@01))
  (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))) val_ref@57@01))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@84@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@84@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@84@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@84@01))))
  $Snap.unit))
; [eval] m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[l12](_13.val_ref)), old[l12](_14.val_int)) == old[lhs]((unfolding acc(struct$m_Point(_old$l13$0$p0), write) in (unfolding acc(i32(_old$l13$0$p0.f$x), write) in _old$l13$0$p0.f$x.val_int)))
; [eval] m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[l12](_13.val_ref)), old[l12](_14.val_int))
; [eval] snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[l12](_13.val_ref))
; [eval] old[l12](_13.val_ref)
(push) ; 15
; [eval] read$()
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(push) ; 16
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(push) ; 16
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(pop) ; 15
; Joined path conditions
; [eval] old[l12](_14.val_int)
(set-option :timeout 0)
(push) ; 15
; [eval] 0 <= _2
; [eval] _2 < m_length__$TY$__Snap$struct$m_Route$$int$(_1)
; [eval] m_length__$TY$__Snap$struct$m_Route$$int$(_1)
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(assert (not (<
  val_int@67@01
  (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@84@01)) val_ref@57@01)))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(assert (<
  val_int@67@01
  (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@84@01)) val_ref@57@01))))
(assert (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@84@01)) val_ref@57@01) val_int@67@01))
(pop) ; 15
; Joined path conditions
(assert (and
  (<
    val_int@67@01
    (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@84@01)) val_ref@57@01)))
  (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@84@01)) val_ref@57@01) val_int@67@01)))
; [eval] old[lhs]((unfolding acc(struct$m_Point(_old$l13$0$p0), write) in (unfolding acc(i32(_old$l13$0$p0.f$x), write) in _old$l13$0$p0.f$x.val_int)))
; [eval] (unfolding acc(struct$m_Point(_old$l13$0$p0), write) in (unfolding acc(i32(_old$l13$0$p0.f$x), write) in _old$l13$0$p0.f$x.val_int))
(push) ; 15
(push) ; 16
(set-option :timeout 10)
(assert (not (= val_ref@74@01 _old$l13$0$p0@83@01)))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(assert (struct$m_Point%trigger ($Snap.second $t@81@01) _old$l13$0$p0@83@01))
(assert (=
  ($Snap.second $t@81@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@81@01))
    ($Snap.second ($Snap.second $t@81@01)))))
(assert (not (= _old$l13$0$p0@83@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second $t@81@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@81@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@81@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))))
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@81@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
; [eval] (unfolding acc(i32(_old$l13$0$p0.f$x), write) in _old$l13$0$p0.f$x.val_int)
(set-option :timeout 0)
(push) ; 16
(assert (i32%trigger ($Snap.first ($Snap.second ($Snap.second $t@81@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@81@01)))))
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@81@01))) $Ref.null)))
(pop) ; 16
; Joined path conditions
(assert (and
  (i32%trigger ($Snap.first ($Snap.second ($Snap.second $t@81@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@81@01))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@81@01)))
      $Ref.null))))
(pop) ; 15
; Joined path conditions
(assert (and
  (struct$m_Point%trigger ($Snap.second $t@81@01) _old$l13$0$p0@83@01)
  (=
    ($Snap.second $t@81@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@81@01))
      ($Snap.second ($Snap.second $t@81@01))))
  (not (= _old$l13$0$p0@83@01 $Ref.null))
  (=
    ($Snap.second ($Snap.second $t@81@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second $t@81@01)))
      ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.second $t@81@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))
  (i32%trigger ($Snap.first ($Snap.second ($Snap.second $t@81@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@81@01))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@81@01)))
      $Ref.null))))
(assert (=
  (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$ ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@84@01)) val_ref@57@01) val_int@67@01)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@81@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@84@01))))
  $Snap.unit))
; [eval] (forall _0_quant_0: Int :: { m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[l12](_13.val_ref)), _0_quant_0) } { old[l12](m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_13.val_ref), _0_quant_0)) } !(0 <= _0_quant_0) || (!(_0_quant_0 < m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[l12](_13.val_ref)))) || (_0_quant_0 == old[l12](_14.val_int) || m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[l12](_13.val_ref)), _0_quant_0) == old[l12](m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_13.val_ref), _0_quant_0)))))
(declare-const _0_quant_0@86@01 Int)
(push) ; 15
; [eval] !(0 <= _0_quant_0) || (!(_0_quant_0 < m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[l12](_13.val_ref)))) || (_0_quant_0 == old[l12](_14.val_int) || m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[l12](_13.val_ref)), _0_quant_0) == old[l12](m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_13.val_ref), _0_quant_0))))
; [eval] !(0 <= _0_quant_0)
; [eval] 0 <= _0_quant_0
(push) ; 16
; [then-branch: 97 | !(0 <= _0_quant_0@86@01) | live]
; [else-branch: 97 | 0 <= _0_quant_0@86@01 | live]
(push) ; 17
; [then-branch: 97 | !(0 <= _0_quant_0@86@01)]
(assert (not (<= 0 _0_quant_0@86@01)))
(pop) ; 17
(push) ; 17
; [else-branch: 97 | 0 <= _0_quant_0@86@01]
(assert (<= 0 _0_quant_0@86@01))
; [eval] !(_0_quant_0 < m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[l12](_13.val_ref))))
; [eval] _0_quant_0 < m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[l12](_13.val_ref)))
; [eval] m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[l12](_13.val_ref)))
; [eval] snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[l12](_13.val_ref))
; [eval] old[l12](_13.val_ref)
(push) ; 18
; [eval] read$()
(push) ; 19
(pop) ; 19
; Joined path conditions
(push) ; 19
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(push) ; 19
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(push) ; 19
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(pop) ; 18
; Joined path conditions
(set-option :timeout 0)
(push) ; 18
(pop) ; 18
; Joined path conditions
(push) ; 18
; [then-branch: 98 | !(_0_quant_0@86@01 < m_length__$TY$__Snap$struct$m_Route$$int$((_, _), snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(First:(Second:($t@84@01)), val_ref@57@01))) | live]
; [else-branch: 98 | _0_quant_0@86@01 < m_length__$TY$__Snap$struct$m_Route$$int$((_, _), snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(First:(Second:($t@84@01)), val_ref@57@01)) | live]
(push) ; 19
; [then-branch: 98 | !(_0_quant_0@86@01 < m_length__$TY$__Snap$struct$m_Route$$int$((_, _), snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(First:(Second:($t@84@01)), val_ref@57@01)))]
(assert (not
  (<
    _0_quant_0@86@01
    (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@84@01)) val_ref@57@01)))))
(pop) ; 19
(push) ; 19
; [else-branch: 98 | _0_quant_0@86@01 < m_length__$TY$__Snap$struct$m_Route$$int$((_, _), snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(First:(Second:($t@84@01)), val_ref@57@01))]
(assert (<
  _0_quant_0@86@01
  (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@84@01)) val_ref@57@01))))
; [eval] _0_quant_0 == old[l12](_14.val_int)
; [eval] old[l12](_14.val_int)
(push) ; 20
; [then-branch: 99 | _0_quant_0@86@01 == val_int@67@01 | live]
; [else-branch: 99 | _0_quant_0@86@01 != val_int@67@01 | live]
(push) ; 21
; [then-branch: 99 | _0_quant_0@86@01 == val_int@67@01]
(assert (= _0_quant_0@86@01 val_int@67@01))
(pop) ; 21
(push) ; 21
; [else-branch: 99 | _0_quant_0@86@01 != val_int@67@01]
(assert (not (= _0_quant_0@86@01 val_int@67@01)))
; [eval] m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[l12](_13.val_ref)), _0_quant_0) == old[l12](m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_13.val_ref), _0_quant_0))
; [eval] m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[l12](_13.val_ref)), _0_quant_0)
; [eval] snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[l12](_13.val_ref))
; [eval] old[l12](_13.val_ref)
(push) ; 22
; [eval] read$()
(push) ; 23
(pop) ; 23
; Joined path conditions
(push) ; 23
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(push) ; 23
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(push) ; 23
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(pop) ; 22
; Joined path conditions
(set-option :timeout 0)
(push) ; 22
; [eval] 0 <= _2
; [eval] _2 < m_length__$TY$__Snap$struct$m_Route$$int$(_1)
; [eval] m_length__$TY$__Snap$struct$m_Route$$int$(_1)
(push) ; 23
(pop) ; 23
; Joined path conditions
(assert (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@84@01)) val_ref@57@01) _0_quant_0@86@01))
(pop) ; 22
; Joined path conditions
(assert (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@84@01)) val_ref@57@01) _0_quant_0@86@01))
; [eval] old[l12](m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_13.val_ref), _0_quant_0))
; [eval] m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_13.val_ref), _0_quant_0)
; [eval] snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_13.val_ref)
(push) ; 22
; [eval] read$()
(push) ; 23
(pop) ; 23
; Joined path conditions
(push) ; 23
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(push) ; 23
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))))
  val_ref@57@01)))
(check-sat)
; unsat
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(push) ; 23
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(pop) ; 22
; Joined path conditions
(set-option :timeout 0)
(push) ; 22
; [eval] 0 <= _2
; [eval] _2 < m_length__$TY$__Snap$struct$m_Route$$int$(_1)
; [eval] m_length__$TY$__Snap$struct$m_Route$$int$(_1)
(push) ; 23
(pop) ; 23
; Joined path conditions
(push) ; 23
(assert (not (<
  _0_quant_0@86@01
  (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))) val_ref@57@01)))))
(check-sat)
; unsat
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(assert (<
  _0_quant_0@86@01
  (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))) val_ref@57@01))))
(assert (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))) val_ref@57@01) _0_quant_0@86@01))
(pop) ; 22
; Joined path conditions
(assert (and
  (<
    _0_quant_0@86@01
    (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))) val_ref@57@01)))
  (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))) val_ref@57@01) _0_quant_0@86@01)))
(pop) ; 21
(pop) ; 20
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= _0_quant_0@86@01 val_int@67@01))
  (and
    (not (= _0_quant_0@86@01 val_int@67@01))
    (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@84@01)) val_ref@57@01) _0_quant_0@86@01)
    (<
      _0_quant_0@86@01
      (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))) val_ref@57@01)))
    (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))) val_ref@57@01) _0_quant_0@86@01))))
(assert (or (not (= _0_quant_0@86@01 val_int@67@01)) (= _0_quant_0@86@01 val_int@67@01)))
(pop) ; 19
(pop) ; 18
; Joined path conditions
; Joined path conditions
(assert (=>
  (<
    _0_quant_0@86@01
    (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@84@01)) val_ref@57@01)))
  (and
    (<
      _0_quant_0@86@01
      (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@84@01)) val_ref@57@01)))
    (=>
      (not (= _0_quant_0@86@01 val_int@67@01))
      (and
        (not (= _0_quant_0@86@01 val_int@67@01))
        (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@84@01)) val_ref@57@01) _0_quant_0@86@01)
        (<
          _0_quant_0@86@01
          (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))) val_ref@57@01)))
        (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))) val_ref@57@01) _0_quant_0@86@01)))
    (or
      (not (= _0_quant_0@86@01 val_int@67@01))
      (= _0_quant_0@86@01 val_int@67@01)))))
(assert (or
  (<
    _0_quant_0@86@01
    (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@84@01)) val_ref@57@01)))
  (not
    (<
      _0_quant_0@86@01
      (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@84@01)) val_ref@57@01))))))
(pop) ; 17
(pop) ; 16
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 _0_quant_0@86@01)
  (and
    (<= 0 _0_quant_0@86@01)
    (=>
      (<
        _0_quant_0@86@01
        (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@84@01)) val_ref@57@01)))
      (and
        (<
          _0_quant_0@86@01
          (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@84@01)) val_ref@57@01)))
        (=>
          (not (= _0_quant_0@86@01 val_int@67@01))
          (and
            (not (= _0_quant_0@86@01 val_int@67@01))
            (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@84@01)) val_ref@57@01) _0_quant_0@86@01)
            (<
              _0_quant_0@86@01
              (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))) val_ref@57@01)))
            (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))) val_ref@57@01) _0_quant_0@86@01)))
        (or
          (not (= _0_quant_0@86@01 val_int@67@01))
          (= _0_quant_0@86@01 val_int@67@01))))
    (or
      (<
        _0_quant_0@86@01
        (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@84@01)) val_ref@57@01)))
      (not
        (<
          _0_quant_0@86@01
          (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@84@01)) val_ref@57@01))))))))
(assert (or (<= 0 _0_quant_0@86@01) (not (<= 0 _0_quant_0@86@01))))
(pop) ; 15
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((_0_quant_0@86@01 Int)) (!
  (and
    (=>
      (<= 0 _0_quant_0@86@01)
      (and
        (<= 0 _0_quant_0@86@01)
        (=>
          (<
            _0_quant_0@86@01
            (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@84@01)) val_ref@57@01)))
          (and
            (<
              _0_quant_0@86@01
              (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@84@01)) val_ref@57@01)))
            (=>
              (not (= _0_quant_0@86@01 val_int@67@01))
              (and
                (not (= _0_quant_0@86@01 val_int@67@01))
                (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
                  $Snap.unit
                  ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@84@01)) val_ref@57@01) _0_quant_0@86@01)
                (<
                  _0_quant_0@86@01
                  (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
                    $Snap.unit
                    $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))) val_ref@57@01)))
                (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
                  $Snap.unit
                  ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))) val_ref@57@01) _0_quant_0@86@01)))
            (or
              (not (= _0_quant_0@86@01 val_int@67@01))
              (= _0_quant_0@86@01 val_int@67@01))))
        (or
          (<
            _0_quant_0@86@01
            (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@84@01)) val_ref@57@01)))
          (not
            (<
              _0_quant_0@86@01
              (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@84@01)) val_ref@57@01)))))))
    (or (<= 0 _0_quant_0@86@01) (not (<= 0 _0_quant_0@86@01))))
  :pattern ((m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@84@01)) val_ref@57@01) _0_quant_0@86@01))
  :qid |prog.l780-aux|)))
(assert (forall ((_0_quant_0@86@01 Int)) (!
  (and
    (=>
      (<= 0 _0_quant_0@86@01)
      (and
        (<= 0 _0_quant_0@86@01)
        (=>
          (<
            _0_quant_0@86@01
            (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@84@01)) val_ref@57@01)))
          (and
            (<
              _0_quant_0@86@01
              (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@84@01)) val_ref@57@01)))
            (=>
              (not (= _0_quant_0@86@01 val_int@67@01))
              (and
                (not (= _0_quant_0@86@01 val_int@67@01))
                (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
                  $Snap.unit
                  ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@84@01)) val_ref@57@01) _0_quant_0@86@01)
                (<
                  _0_quant_0@86@01
                  (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
                    $Snap.unit
                    $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))) val_ref@57@01)))
                (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
                  $Snap.unit
                  ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))) val_ref@57@01) _0_quant_0@86@01)))
            (or
              (not (= _0_quant_0@86@01 val_int@67@01))
              (= _0_quant_0@86@01 val_int@67@01))))
        (or
          (<
            _0_quant_0@86@01
            (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@84@01)) val_ref@57@01)))
          (not
            (<
              _0_quant_0@86@01
              (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@84@01)) val_ref@57@01)))))))
    (or (<= 0 _0_quant_0@86@01) (not (<= 0 _0_quant_0@86@01))))
  :pattern ((m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))) val_ref@57@01) _0_quant_0@86@01))
  :qid |prog.l780-aux|)))
(assert (forall ((_0_quant_0@86@01 Int)) (!
  (or
    (not (<= 0 _0_quant_0@86@01))
    (or
      (not
        (<
          _0_quant_0@86@01
          (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@84@01)) val_ref@57@01))))
      (or
        (= _0_quant_0@86@01 val_int@67@01)
        (=
          (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$ ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@84@01)) val_ref@57@01) _0_quant_0@86@01)
          (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$ ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))) val_ref@57@01) _0_quant_0@86@01)))))
  :pattern ((m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@84@01)) val_ref@57@01) _0_quant_0@86@01))
  :pattern ((m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))) val_ref@57@01) _0_quant_0@86@01))
  :qid |prog.l780|)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@68@01 ret@55@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (=
  ret@55@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (=
  ret@68@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
  _1@15@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@55@01 _1@15@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@68@01 _1@15@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= $t@65@01 ret@36@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second $t@31@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first $t@69@01)))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= _1@15@01 ret@72@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
  ret@72@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@55@01 ret@72@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@68@01 ret@72@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@72@01 ret@75@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= _1@15@01 ret@75@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
  ret@75@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@55@01 ret@75@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@68@01 ret@75@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@75@01 ret@77@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@72@01 ret@77@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= _1@15@01 ret@77@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
  ret@77@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@55@01 ret@77@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@68@01 ret@77@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@77@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@75@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@72@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= _1@15@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
  ret@79@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@55@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= ret@68@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not
  (=
    ($Snap.second $t@69@01)
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not
  (=
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
    ($Snap.second $t@69@01)))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not (= val_ref@74@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not
  (=
    val_ref@74@01
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))))))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not (= val_ref@74@01 val_ref@57@01))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not (= val_ref@74@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@69@01))))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not (= val_ref@74@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not
  (=
    val_ref@74@01
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))))))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not (= val_ref@74@01 val_ref@57@01))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not (= val_ref@74@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@69@01))))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not (= val_ref@74@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not
  (=
    val_ref@74@01
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))))))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not (= val_ref@74@01 val_ref@57@01))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not (= val_ref@74@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@69@01))))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not (= val_ref@74@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not
  (=
    val_ref@74@01
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))))))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not (= val_ref@74@01 val_ref@57@01))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not (= val_ref@74@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@69@01))))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)) val_ref@74@01))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)) val_ref@74@01))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)) val_ref@74@01))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)) val_ref@74@01))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))))))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)) val_ref@57@01))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))
    ($SortWrappers.$SnapTo$Ref ($Snap.first $t@69@01))))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))))
    val_ref@74@01))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))))
    val_ref@74@01))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))))
    val_ref@74@01))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))))
    val_ref@74@01))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))))
    ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))))
    val_ref@57@01))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))))
    ($SortWrappers.$SnapTo$Ref ($Snap.first $t@69@01))))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not (= val_ref@57@01 val_ref@74@01))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not (= val_ref@57@01 val_ref@74@01))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not (= val_ref@57@01 val_ref@74@01))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not (= val_ref@57@01 val_ref@74@01))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not (= val_ref@57@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not
  (=
    val_ref@57@01
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))))))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not (= val_ref@57@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@69@01))))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@69@01)) val_ref@74@01))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@69@01)) val_ref@74@01))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@69@01)) val_ref@74@01))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@69@01)) val_ref@74@01))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first $t@69@01))
    ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first $t@69@01))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))))))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@69@01)) val_ref@57@01))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not (= val_bool@38@01 false))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (not (= false val_bool@38@01))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and
    (and
      (not (= ret@79@01 ret@77@01))
      (not (= ret@79@01 ret@75@01))
      (not (= ret@79@01 ret@72@01))
      (not (= ret@79@01 _1@15@01))
      (not
        (=
          ret@79@01
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))))
      (not (= ret@79@01 ret@55@01))
      (not (= ret@79@01 ret@68@01)))
    (and
      (not (= ret@77@01 ret@79@01))
      (not (= ret@77@01 ret@75@01))
      (not (= ret@77@01 ret@72@01))
      (not (= ret@77@01 _1@15@01))
      (not
        (=
          ret@77@01
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))))
      (not (= ret@77@01 ret@55@01))
      (not (= ret@77@01 ret@68@01)))
    (and
      (not (= ret@75@01 ret@79@01))
      (not (= ret@75@01 ret@77@01))
      (not (= ret@75@01 ret@72@01))
      (not (= ret@75@01 _1@15@01))
      (not
        (=
          ret@75@01
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))))
      (not (= ret@75@01 ret@55@01))
      (not (= ret@75@01 ret@68@01)))
    (and
      (not (= ret@72@01 ret@79@01))
      (not (= ret@72@01 ret@77@01))
      (not (= ret@72@01 ret@75@01))
      (not (= ret@72@01 _1@15@01))
      (not
        (=
          ret@72@01
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))))
      (not (= ret@72@01 ret@55@01))
      (not (= ret@72@01 ret@68@01)))
    (and
      (not (= _1@15@01 ret@79@01))
      (not (= _1@15@01 ret@77@01))
      (not (= _1@15@01 ret@75@01))
      (not (= _1@15@01 ret@72@01))
      (not
        (=
          _1@15@01
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))))
      (not (= _1@15@01 ret@55@01))
      (not (= _1@15@01 ret@68@01)))
    (and
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
          ret@79@01))
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
          ret@77@01))
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
          ret@75@01))
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
          ret@72@01))
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
          _1@15@01))
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
          ret@55@01))
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
          ret@68@01)))
    (and
      (not (= ret@55@01 ret@79@01))
      (not (= ret@55@01 ret@77@01))
      (not (= ret@55@01 ret@75@01))
      (not (= ret@55@01 ret@72@01))
      (not (= ret@55@01 _1@15@01))
      (not
        (=
          ret@55@01
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))))
      (not (= ret@55@01 ret@68@01)))
    (and
      (not (= ret@68@01 ret@79@01))
      (not (= ret@68@01 ret@77@01))
      (not (= ret@68@01 ret@75@01))
      (not (= ret@68@01 ret@72@01))
      (not (= ret@68@01 _1@15@01))
      (not
        (=
          ret@68@01
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))))
      (not (= ret@68@01 ret@55@01))))
  (and (not (= ret@36@01 $t@65@01)) (not (= $t@65@01 ret@36@01)))))
; [eval] !(__t6 && (__t6 && (__t7 && (__t7 && (__t8 && __t8)))))
; [eval] __t6 && (__t6 && (__t7 && (__t7 && (__t8 && __t8))))
(set-option :timeout 0)
(push) ; 15
; [then-branch: 100 | True | live]
; [else-branch: 100 | False | live]
(push) ; 16
; [then-branch: 100 | True]
(push) ; 17
; [then-branch: 101 | True | live]
; [else-branch: 101 | False | live]
(push) ; 18
; [then-branch: 101 | True]
(push) ; 19
; [then-branch: 102 | True | live]
; [else-branch: 102 | False | live]
(push) ; 20
; [then-branch: 102 | True]
(push) ; 21
; [then-branch: 103 | True | live]
; [else-branch: 103 | False | live]
(push) ; 22
; [then-branch: 103 | True]
(push) ; 23
; [then-branch: 104 | True | live]
; [else-branch: 104 | False | live]
(push) ; 24
; [then-branch: 104 | True]
(pop) ; 24
(push) ; 24
; [else-branch: 104 | False]
(assert false)
(pop) ; 24
(pop) ; 23
; Joined path conditions
; Joined path conditions
(pop) ; 22
(push) ; 22
; [else-branch: 103 | False]
(assert false)
(pop) ; 22
(pop) ; 21
; Joined path conditions
; Joined path conditions
(pop) ; 20
(push) ; 20
; [else-branch: 102 | False]
(assert false)
(pop) ; 20
(pop) ; 19
; Joined path conditions
; Joined path conditions
(pop) ; 18
(push) ; 18
; [else-branch: 101 | False]
(assert false)
(pop) ; 18
(pop) ; 17
; Joined path conditions
; Joined path conditions
(pop) ; 16
(push) ; 16
; [else-branch: 100 | False]
(assert false)
(pop) ; 16
(pop) ; 15
; Joined path conditions
; Joined path conditions
; [then-branch: 105 | False | dead]
; [else-branch: 105 | True | live]
(push) ; 15
; [else-branch: 105 | True]
(pop) ; 15
; [eval] __t6 && (__t6 && (__t7 && (__t7 && (__t8 && __t8))))
(push) ; 15
; [then-branch: 106 | True | live]
; [else-branch: 106 | False | live]
(push) ; 16
; [then-branch: 106 | True]
(push) ; 17
; [then-branch: 107 | True | live]
; [else-branch: 107 | False | live]
(push) ; 18
; [then-branch: 107 | True]
(push) ; 19
; [then-branch: 108 | True | live]
; [else-branch: 108 | False | live]
(push) ; 20
; [then-branch: 108 | True]
(push) ; 21
; [then-branch: 109 | True | live]
; [else-branch: 109 | False | live]
(push) ; 22
; [then-branch: 109 | True]
(push) ; 23
; [then-branch: 110 | True | live]
; [else-branch: 110 | False | live]
(push) ; 24
; [then-branch: 110 | True]
(pop) ; 24
(push) ; 24
; [else-branch: 110 | False]
(assert false)
(pop) ; 24
(pop) ; 23
; Joined path conditions
; Joined path conditions
(pop) ; 22
(push) ; 22
; [else-branch: 109 | False]
(assert false)
(pop) ; 22
(pop) ; 21
; Joined path conditions
; Joined path conditions
(pop) ; 20
(push) ; 20
; [else-branch: 108 | False]
(assert false)
(pop) ; 20
(pop) ; 19
; Joined path conditions
; Joined path conditions
(pop) ; 18
(push) ; 18
; [else-branch: 107 | False]
(assert false)
(pop) ; 18
(pop) ; 17
; Joined path conditions
; Joined path conditions
(pop) ; 16
(push) ; 16
; [else-branch: 106 | False]
(assert false)
(pop) ; 16
(pop) ; 15
; Joined path conditions
; Joined path conditions
(push) ; 15
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; [then-branch: 111 | True | live]
; [else-branch: 111 | False | dead]
(set-option :timeout 0)
(push) ; 15
; [then-branch: 111 | True]
; [eval] !(__t5 && (__t6 && (__t6 && (__t7 && (__t7 && (__t8 && __t8))))))
; [eval] __t5 && (__t6 && (__t6 && (__t7 && (__t7 && (__t8 && __t8)))))
(push) ; 16
; [then-branch: 112 | True | live]
; [else-branch: 112 | False | live]
(push) ; 17
; [then-branch: 112 | True]
(push) ; 18
; [then-branch: 113 | True | live]
; [else-branch: 113 | False | live]
(push) ; 19
; [then-branch: 113 | True]
(push) ; 20
; [then-branch: 114 | True | live]
; [else-branch: 114 | False | live]
(push) ; 21
; [then-branch: 114 | True]
(push) ; 22
; [then-branch: 115 | True | live]
; [else-branch: 115 | False | live]
(push) ; 23
; [then-branch: 115 | True]
(push) ; 24
; [then-branch: 116 | True | live]
; [else-branch: 116 | False | live]
(push) ; 25
; [then-branch: 116 | True]
(push) ; 26
; [then-branch: 117 | True | live]
; [else-branch: 117 | False | live]
(push) ; 27
; [then-branch: 117 | True]
(pop) ; 27
(push) ; 27
; [else-branch: 117 | False]
(assert false)
(pop) ; 27
(pop) ; 26
; Joined path conditions
; Joined path conditions
(pop) ; 25
(push) ; 25
; [else-branch: 116 | False]
(assert false)
(pop) ; 25
(pop) ; 24
; Joined path conditions
; Joined path conditions
(pop) ; 23
(push) ; 23
; [else-branch: 115 | False]
(assert false)
(pop) ; 23
(pop) ; 22
; Joined path conditions
; Joined path conditions
(pop) ; 21
(push) ; 21
; [else-branch: 114 | False]
(assert false)
(pop) ; 21
(pop) ; 20
; Joined path conditions
; Joined path conditions
(pop) ; 19
(push) ; 19
; [else-branch: 113 | False]
(assert false)
(pop) ; 19
(pop) ; 18
; Joined path conditions
; Joined path conditions
(pop) ; 17
(push) ; 17
; [else-branch: 112 | False]
(assert false)
(pop) ; 17
(pop) ; 16
; Joined path conditions
; Joined path conditions
; [then-branch: 118 | False | dead]
; [else-branch: 118 | True | live]
(push) ; 16
; [else-branch: 118 | True]
(pop) ; 16
; [eval] __t5 && (__t6 && (__t6 && (__t7 && (__t7 && (__t8 && __t8)))))
(push) ; 16
; [then-branch: 119 | True | live]
; [else-branch: 119 | False | live]
(push) ; 17
; [then-branch: 119 | True]
(push) ; 18
; [then-branch: 120 | True | live]
; [else-branch: 120 | False | live]
(push) ; 19
; [then-branch: 120 | True]
(push) ; 20
; [then-branch: 121 | True | live]
; [else-branch: 121 | False | live]
(push) ; 21
; [then-branch: 121 | True]
(push) ; 22
; [then-branch: 122 | True | live]
; [else-branch: 122 | False | live]
(push) ; 23
; [then-branch: 122 | True]
(push) ; 24
; [then-branch: 123 | True | live]
; [else-branch: 123 | False | live]
(push) ; 25
; [then-branch: 123 | True]
(push) ; 26
; [then-branch: 124 | True | live]
; [else-branch: 124 | False | live]
(push) ; 27
; [then-branch: 124 | True]
(pop) ; 27
(push) ; 27
; [else-branch: 124 | False]
(assert false)
(pop) ; 27
(pop) ; 26
; Joined path conditions
; Joined path conditions
(pop) ; 25
(push) ; 25
; [else-branch: 123 | False]
(assert false)
(pop) ; 25
(pop) ; 24
; Joined path conditions
; Joined path conditions
(pop) ; 23
(push) ; 23
; [else-branch: 122 | False]
(assert false)
(pop) ; 23
(pop) ; 22
; Joined path conditions
; Joined path conditions
(pop) ; 21
(push) ; 21
; [else-branch: 121 | False]
(assert false)
(pop) ; 21
(pop) ; 20
; Joined path conditions
; Joined path conditions
(pop) ; 19
(push) ; 19
; [else-branch: 120 | False]
(assert false)
(pop) ; 19
(pop) ; 18
; Joined path conditions
; Joined path conditions
(pop) ; 17
(push) ; 17
; [else-branch: 119 | False]
(assert false)
(pop) ; 17
(pop) ; 16
; Joined path conditions
; Joined path conditions
(push) ; 16
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
; [then-branch: 125 | True | live]
; [else-branch: 125 | False | dead]
(set-option :timeout 0)
(push) ; 16
; [then-branch: 125 | True]
; [eval] __t5 && (__t5 && (__t6 && (__t6 && (__t7 && (__t7 && (__t8 && __t8))))))
(push) ; 17
; [then-branch: 126 | True | live]
; [else-branch: 126 | False | live]
(push) ; 18
; [then-branch: 126 | True]
(push) ; 19
; [then-branch: 127 | True | live]
; [else-branch: 127 | False | live]
(push) ; 20
; [then-branch: 127 | True]
(push) ; 21
; [then-branch: 128 | True | live]
; [else-branch: 128 | False | live]
(push) ; 22
; [then-branch: 128 | True]
(push) ; 23
; [then-branch: 129 | True | live]
; [else-branch: 129 | False | live]
(push) ; 24
; [then-branch: 129 | True]
(push) ; 25
; [then-branch: 130 | True | live]
; [else-branch: 130 | False | live]
(push) ; 26
; [then-branch: 130 | True]
(push) ; 27
; [then-branch: 131 | True | live]
; [else-branch: 131 | False | live]
(push) ; 28
; [then-branch: 131 | True]
(push) ; 29
; [then-branch: 132 | True | live]
; [else-branch: 132 | False | live]
(push) ; 30
; [then-branch: 132 | True]
(pop) ; 30
(push) ; 30
; [else-branch: 132 | False]
(assert false)
(pop) ; 30
(pop) ; 29
; Joined path conditions
; Joined path conditions
(pop) ; 28
(push) ; 28
; [else-branch: 131 | False]
(assert false)
(pop) ; 28
(pop) ; 27
; Joined path conditions
; Joined path conditions
(pop) ; 26
(push) ; 26
; [else-branch: 130 | False]
(assert false)
(pop) ; 26
(pop) ; 25
; Joined path conditions
; Joined path conditions
(pop) ; 24
(push) ; 24
; [else-branch: 129 | False]
(assert false)
(pop) ; 24
(pop) ; 23
; Joined path conditions
; Joined path conditions
(pop) ; 22
(push) ; 22
; [else-branch: 128 | False]
(assert false)
(pop) ; 22
(pop) ; 21
; Joined path conditions
; Joined path conditions
(pop) ; 20
(push) ; 20
; [else-branch: 127 | False]
(assert false)
(pop) ; 20
(pop) ; 19
; Joined path conditions
; Joined path conditions
(pop) ; 18
(push) ; 18
; [else-branch: 126 | False]
(assert false)
(pop) ; 18
(pop) ; 17
; Joined path conditions
; Joined path conditions
(push) ; 17
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
; [then-branch: 133 | True | live]
; [else-branch: 133 | False | dead]
(set-option :timeout 0)
(push) ; 17
; [then-branch: 133 | True]
; [exec]
; assert acc(old[l18](_1.val_ref).f$rest, read$())
; [eval] read$()
(push) ; 18
(pop) ; 18
; Joined path conditions
; [eval] old[l18](_1.val_ref)
(push) ; 18
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(push) ; 18
(set-option :timeout 10)
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< (read$ $Snap.unit) $Perm.No))))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(assert (<= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.Write))
(assert (=>
  (< $Perm.No (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))))
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)) $Ref.null))))
(set-option :timeout 0)
(push) ; 18
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 10)
(check-sat)
; unknown
(assert (<= $Perm.No ($Perm.min $Perm.Write (read$ $Snap.unit))))
(assert (<= ($Perm.min $Perm.Write (read$ $Snap.unit)) $Perm.Write))
(assert (=>
  (< $Perm.No ($Perm.min $Perm.Write (read$ $Snap.unit)))
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)) $Ref.null))))
; [exec]
; assert acc(old[l18](_1.val_ref).f$rest.enum_Some, read$())
; [eval] read$()
(set-option :timeout 0)
(push) ; 18
(pop) ; 18
; Joined path conditions
; [eval] old[l18](_1.val_ref)
(push) ; 18
(set-option :timeout 10)
(assert (not (< $Perm.No ($Perm.min $Perm.Write (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(push) ; 18
(set-option :timeout 10)
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< (read$ $Snap.unit) $Perm.No))))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(assert (=>
  (< $Perm.No (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
      $Ref.null))))
(set-option :timeout 0)
(push) ; 18
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 10)
(check-sat)
; unknown
(assert (=>
  (< $Perm.No ($Perm.min $Perm.Write (read$ $Snap.unit)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
      $Ref.null))))
; [exec]
; assert acc(old[l18](_1.val_ref).f$rest.enum_Some.f$0, read$())
; [eval] read$()
(set-option :timeout 0)
(push) ; 18
(pop) ; 18
; Joined path conditions
; [eval] old[l18](_1.val_ref)
(push) ; 18
(set-option :timeout 10)
(assert (not (< $Perm.No ($Perm.min $Perm.Write (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (< $Perm.No ($Perm.min $Perm.Write (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(push) ; 18
(set-option :timeout 10)
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< (read$ $Snap.unit) $Perm.No))))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(assert (=>
  (< $Perm.No (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
      $Ref.null))))
(set-option :timeout 0)
(push) ; 18
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 10)
(check-sat)
; unknown
(assert (=>
  (< $Perm.No ($Perm.min $Perm.Write (read$ $Snap.unit)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
      $Ref.null))))
; [exec]
; fold acc(struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global(old[l18](_1.val_ref).f$rest.enum_Some.f$0), write)
; [eval] old[l18](_1.val_ref)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (< $Perm.No ($Perm.min $Perm.Write (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (< $Perm.No ($Perm.min $Perm.Write (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (< $Perm.No ($Perm.min $Perm.Write (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(check-sat)
; unknown
(assert (struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global%trigger ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
  ($Snap.first ($Snap.second $t@84@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))))
; [exec]
; assert acc(old[l18](_1.val_ref).f$rest, read$())
; [eval] read$()
(set-option :timeout 0)
(push) ; 18
(pop) ; 18
; Joined path conditions
; [eval] old[l18](_1.val_ref)
(push) ; 18
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(push) ; 18
(set-option :timeout 10)
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< (read$ $Snap.unit) $Perm.No))))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (=
  (-
    ($Perm.min $Perm.Write (read$ $Snap.unit))
    ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) (read$ $Snap.unit)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 10)
(check-sat)
; unknown
(assert (<=
  $Perm.No
  ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) (read$ $Snap.unit))))
(assert (<=
  ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) (read$ $Snap.unit))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) (read$ $Snap.unit)))
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)) $Ref.null))))
; [exec]
; assert acc(old[l18](_1.val_ref).f$rest.enum_Some, read$())
; [eval] read$()
(set-option :timeout 0)
(push) ; 18
(pop) ; 18
; Joined path conditions
; [eval] old[l18](_1.val_ref)
(push) ; 18
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(push) ; 18
(set-option :timeout 10)
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< (read$ $Snap.unit) $Perm.No))))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (=
  (-
    ($Perm.min $Perm.Write (read$ $Snap.unit))
    ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) (read$ $Snap.unit)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 10)
(check-sat)
; unknown
(assert (=>
  (<
    $Perm.No
    ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) (read$ $Snap.unit)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
      $Ref.null))))
; [exec]
; fold acc(m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_Some(old[l18](_1.val_ref).f$rest.enum_Some), write)
; [eval] old[l18](_1.val_ref)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (=
  (-
    ($Perm.min $Perm.Write (read$ $Snap.unit))
    ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) $Perm.Write))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(assert (not (or
  (=
    (-
      $Perm.Write
      ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) $Perm.Write))
    $Perm.No)
  (<
    (-
      $Perm.Write
      ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) $Perm.Write))
    $Perm.No))))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 10)
(check-sat)
; unknown
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (=
  (-
    (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
    ($Perm.min
      (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
      (-
        $Perm.Write
        ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) $Perm.Write))))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(assert (not (or
  (=
    (-
      (-
        $Perm.Write
        ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) $Perm.Write))
      ($Perm.min
        (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
        (-
          $Perm.Write
          ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) $Perm.Write))))
    $Perm.No)
  (<
    (-
      (-
        $Perm.Write
        ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) $Perm.Write))
      ($Perm.min
        (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
        (-
          $Perm.Write
          ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) $Perm.Write))))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const $t@87@01 $Ref)
(assert (and
  (=>
    (<
      $Perm.No
      ($Perm.min
        (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
        (-
          $Perm.Write
          ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) $Perm.Write))))
    (=
      $t@87@01
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))))
  (=>
    (<
      $Perm.No
      ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) $Perm.Write))
    (=
      $t@87@01
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))))))
(assert (<=
  $Perm.No
  (+
    ($Perm.min
      (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
      (-
        $Perm.Write
        ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) $Perm.Write)))
    ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) $Perm.Write))))
(assert (<=
  (+
    ($Perm.min
      (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
      (-
        $Perm.Write
        ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) $Perm.Write)))
    ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) $Perm.Write))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (+
      ($Perm.min
        (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
        (-
          $Perm.Write
          ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) $Perm.Write)))
      ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) $Perm.Write)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
      $Ref.null))))
(assert (<=
  $Perm.No
  ($Perm.min
    (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
    (-
      $Perm.Write
      ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) $Perm.Write)))))
(assert (<=
  ($Perm.min
    (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
    (-
      $Perm.Write
      ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) $Perm.Write)))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    ($Perm.min
      (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
      (-
        $Perm.Write
        ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) $Perm.Write))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
      $Ref.null))))
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    ($Perm.min
      (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
      (-
        $Perm.Write
        ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) $Perm.Write)))
    ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) $Perm.Write)))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
  $t@87@01)))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(check-sat)
; unknown
(assert (m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_Some%trigger ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
    ($Snap.first ($Snap.second $t@84@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))))
; [exec]
; assert acc(old[l18](_1.val_ref).f$rest, read$())
; [eval] read$()
(set-option :timeout 0)
(push) ; 18
(pop) ; 18
; Joined path conditions
; [eval] old[l18](_1.val_ref)
(push) ; 18
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(push) ; 18
(set-option :timeout 10)
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< (read$ $Snap.unit) $Perm.No))))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (=
  (-
    ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) (read$ $Snap.unit))
    ($Perm.min
      ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) (read$ $Snap.unit))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 10)
(check-sat)
; unknown
(assert (<=
  $Perm.No
  ($Perm.min
    ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) (read$ $Snap.unit))
    (read$ $Snap.unit))))
(assert (<=
  ($Perm.min
    ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) (read$ $Snap.unit))
    (read$ $Snap.unit))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    ($Perm.min
      ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) (read$ $Snap.unit))
      (read$ $Snap.unit)))
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)) $Ref.null))))
; [exec]
; fold acc(m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_(old[l18](_1.val_ref).f$rest), write)
; [eval] old[l18](_1.val_ref)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  ($Perm.min
    ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) (read$ $Snap.unit))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
; [eval] 0 <= self.discriminant
; [eval] self.discriminant <= 1
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (=
  (-
    ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) (read$ $Snap.unit))
    ($Perm.min
      ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) (read$ $Snap.unit))
      $Perm.Write))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(assert (not (or
  (=
    (-
      $Perm.Write
      ($Perm.min
        ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) (read$ $Snap.unit))
        $Perm.Write))
    $Perm.No)
  (<
    (-
      $Perm.Write
      ($Perm.min
        ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) (read$ $Snap.unit))
        $Perm.Write))
    $Perm.No))))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 10)
(check-sat)
; unknown
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (=
  (-
    (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
    ($Perm.min
      (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
      (-
        $Perm.Write
        ($Perm.min
          ($Perm.min
            ($Perm.min $Perm.Write (read$ $Snap.unit))
            (read$ $Snap.unit))
          $Perm.Write))))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(assert (not (or
  (=
    (-
      (-
        $Perm.Write
        ($Perm.min
          ($Perm.min
            ($Perm.min $Perm.Write (read$ $Snap.unit))
            (read$ $Snap.unit))
          $Perm.Write))
      ($Perm.min
        (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
        (-
          $Perm.Write
          ($Perm.min
            ($Perm.min
              ($Perm.min $Perm.Write (read$ $Snap.unit))
              (read$ $Snap.unit))
            $Perm.Write))))
    $Perm.No)
  (<
    (-
      (-
        $Perm.Write
        ($Perm.min
          ($Perm.min
            ($Perm.min $Perm.Write (read$ $Snap.unit))
            (read$ $Snap.unit))
          $Perm.Write))
      ($Perm.min
        (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
        (-
          $Perm.Write
          ($Perm.min
            ($Perm.min
              ($Perm.min $Perm.Write (read$ $Snap.unit))
              (read$ $Snap.unit))
            $Perm.Write))))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const $t@88@01 $Ref)
(assert (and
  (=>
    (<
      $Perm.No
      ($Perm.min
        (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
        (-
          $Perm.Write
          ($Perm.min
            ($Perm.min
              ($Perm.min $Perm.Write (read$ $Snap.unit))
              (read$ $Snap.unit))
            $Perm.Write))))
    (=
      $t@88@01
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))))
  (=>
    (<
      $Perm.No
      ($Perm.min
        ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) (read$ $Snap.unit))
        $Perm.Write))
    (=
      $t@88@01
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))))))
(assert (<=
  $Perm.No
  (+
    ($Perm.min
      (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
      (-
        $Perm.Write
        ($Perm.min
          ($Perm.min
            ($Perm.min $Perm.Write (read$ $Snap.unit))
            (read$ $Snap.unit))
          $Perm.Write)))
    ($Perm.min
      ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) (read$ $Snap.unit))
      $Perm.Write))))
(assert (<=
  (+
    ($Perm.min
      (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
      (-
        $Perm.Write
        ($Perm.min
          ($Perm.min
            ($Perm.min $Perm.Write (read$ $Snap.unit))
            (read$ $Snap.unit))
          $Perm.Write)))
    ($Perm.min
      ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) (read$ $Snap.unit))
      $Perm.Write))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (+
      ($Perm.min
        (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
        (-
          $Perm.Write
          ($Perm.min
            ($Perm.min
              ($Perm.min $Perm.Write (read$ $Snap.unit))
              (read$ $Snap.unit))
            $Perm.Write)))
      ($Perm.min
        ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) (read$ $Snap.unit))
        $Perm.Write)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
      $Ref.null))))
(assert (<=
  $Perm.No
  ($Perm.min
    (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
    (-
      $Perm.Write
      ($Perm.min
        ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) (read$ $Snap.unit))
        $Perm.Write)))))
(assert (<=
  ($Perm.min
    (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
    (-
      $Perm.Write
      ($Perm.min
        ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) (read$ $Snap.unit))
        $Perm.Write)))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    ($Perm.min
      (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
      (-
        $Perm.Write
        ($Perm.min
          ($Perm.min
            ($Perm.min $Perm.Write (read$ $Snap.unit))
            (read$ $Snap.unit))
          $Perm.Write))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
      $Ref.null))))
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    ($Perm.min
      (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
      (-
        $Perm.Write
        ($Perm.min
          ($Perm.min
            ($Perm.min $Perm.Write (read$ $Snap.unit))
            (read$ $Snap.unit))
          $Perm.Write)))
    ($Perm.min
      ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) (read$ $Snap.unit))
      $Perm.Write)))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
  $t@88@01)))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(check-sat)
; unknown
(assert (m_std$$option$$Option$_beg_$struct$m_std$$boxed$$Box$struct$m_Route$struct$m_std$$alloc$$Global$_end_%trigger ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
            ($Snap.first ($Snap.second $t@84@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))
; [eval] !(__t1 && (__t1 && (__t1 && (__t8 && __t8))))
; [eval] __t1 && (__t1 && (__t1 && (__t8 && __t8)))
(set-option :timeout 0)
(push) ; 18
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
; [then-branch: 134 | True | live]
; [else-branch: 134 | False | dead]
(set-option :timeout 0)
(push) ; 18
; [then-branch: 134 | True]
; [exec]
; fold acc(struct$m_Route(old[pre](_1.val_ref)), write)
; [eval] old[pre](_1.val_ref)
(push) ; 19
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (=
  (-
    ($Perm.min
      ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) (read$ $Snap.unit))
      (read$ $Snap.unit))
    ($Perm.min
      ($Perm.min
        ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) (read$ $Snap.unit))
        (read$ $Snap.unit))
      $Perm.Write))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(assert (not (or
  (=
    (-
      $Perm.Write
      ($Perm.min
        ($Perm.min
          ($Perm.min
            ($Perm.min $Perm.Write (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        $Perm.Write))
    $Perm.No)
  (<
    (-
      $Perm.Write
      ($Perm.min
        ($Perm.min
          ($Perm.min
            ($Perm.min $Perm.Write (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        $Perm.Write))
    $Perm.No))))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 10)
(check-sat)
; unknown
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (=
  (-
    (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
    ($Perm.min
      (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
      (-
        $Perm.Write
        ($Perm.min
          ($Perm.min
            ($Perm.min
              ($Perm.min $Perm.Write (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          $Perm.Write))))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(assert (not (or
  (=
    (-
      (-
        $Perm.Write
        ($Perm.min
          ($Perm.min
            ($Perm.min
              ($Perm.min $Perm.Write (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          $Perm.Write))
      ($Perm.min
        (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
        (-
          $Perm.Write
          ($Perm.min
            ($Perm.min
              ($Perm.min
                ($Perm.min $Perm.Write (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            $Perm.Write))))
    $Perm.No)
  (<
    (-
      (-
        $Perm.Write
        ($Perm.min
          ($Perm.min
            ($Perm.min
              ($Perm.min $Perm.Write (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          $Perm.Write))
      ($Perm.min
        (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
        (-
          $Perm.Write
          ($Perm.min
            ($Perm.min
              ($Perm.min
                ($Perm.min $Perm.Write (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            $Perm.Write))))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const $t@89@01 $Ref)
(assert (and
  (=>
    (<
      $Perm.No
      ($Perm.min
        (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
        (-
          $Perm.Write
          ($Perm.min
            ($Perm.min
              ($Perm.min
                ($Perm.min $Perm.Write (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            $Perm.Write))))
    (=
      $t@89@01
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))
  (=>
    (<
      $Perm.No
      ($Perm.min
        ($Perm.min
          ($Perm.min
            ($Perm.min $Perm.Write (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        $Perm.Write))
    (=
      $t@89@01
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
(assert (<=
  $Perm.No
  (+
    ($Perm.min
      (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
      (-
        $Perm.Write
        ($Perm.min
          ($Perm.min
            ($Perm.min
              ($Perm.min $Perm.Write (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          $Perm.Write)))
    ($Perm.min
      ($Perm.min
        ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) (read$ $Snap.unit))
        (read$ $Snap.unit))
      $Perm.Write))))
(assert (<=
  (+
    ($Perm.min
      (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
      (-
        $Perm.Write
        ($Perm.min
          ($Perm.min
            ($Perm.min
              ($Perm.min $Perm.Write (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          $Perm.Write)))
    ($Perm.min
      ($Perm.min
        ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) (read$ $Snap.unit))
        (read$ $Snap.unit))
      $Perm.Write))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (+
      ($Perm.min
        (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
        (-
          $Perm.Write
          ($Perm.min
            ($Perm.min
              ($Perm.min
                ($Perm.min $Perm.Write (read$ $Snap.unit))
                (read$ $Snap.unit))
              (read$ $Snap.unit))
            $Perm.Write)))
      ($Perm.min
        ($Perm.min
          ($Perm.min
            ($Perm.min $Perm.Write (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        $Perm.Write)))
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)) $Ref.null))))
(assert (<=
  $Perm.No
  ($Perm.min
    (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
    (-
      $Perm.Write
      ($Perm.min
        ($Perm.min
          ($Perm.min
            ($Perm.min $Perm.Write (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        $Perm.Write)))))
(assert (<=
  ($Perm.min
    (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
    (-
      $Perm.Write
      ($Perm.min
        ($Perm.min
          ($Perm.min
            ($Perm.min $Perm.Write (read$ $Snap.unit))
            (read$ $Snap.unit))
          (read$ $Snap.unit))
        $Perm.Write)))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    ($Perm.min
      (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
      (-
        $Perm.Write
        ($Perm.min
          ($Perm.min
            ($Perm.min
              ($Perm.min $Perm.Write (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          $Perm.Write))))
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)) $Ref.null))))
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    ($Perm.min
      (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
      (-
        $Perm.Write
        ($Perm.min
          ($Perm.min
            ($Perm.min
              ($Perm.min $Perm.Write (read$ $Snap.unit))
              (read$ $Snap.unit))
            (read$ $Snap.unit))
          $Perm.Write)))
    ($Perm.min
      ($Perm.min
        ($Perm.min ($Perm.min $Perm.Write (read$ $Snap.unit)) (read$ $Snap.unit))
        (read$ $Snap.unit))
      $Perm.Write)))))
(check-sat)
; unsat
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
  $t@89@01)))
(check-sat)
; unsat
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(check-sat)
; unknown
(assert (struct$m_Route%trigger ($Snap.combine
  ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                  ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))))
; [eval] old[pre](_1.val_ref)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(check-sat)
; unknown
; [eval] m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref))) == old[pre](m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref)))
; [eval] m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref)))
; [eval] snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref))
; [eval] old[pre](_1.val_ref)
(set-option :timeout 0)
(push) ; 19
; [eval] read$()
(push) ; 20
(pop) ; 20
; Joined path conditions
(push) ; 20
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(push) ; 20
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(push) ; 20
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(assert (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route%precondition ($Snap.combine
  ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                  ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))))
(pop) ; 19
; Joined path conditions
(assert (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route%precondition ($Snap.combine
  ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                  ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))))
(set-option :timeout 0)
(push) ; 19
(assert (m_length__$TY$__Snap$struct$m_Route$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
  ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                  ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
(pop) ; 19
; Joined path conditions
(assert (m_length__$TY$__Snap$struct$m_Route$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
  ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                  ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
; [eval] old[pre](m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref)))
; [eval] m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref)
(push) ; 19
; [eval] read$()
(push) ; 20
(pop) ; 20
; Joined path conditions
(push) ; 20
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(push) ; 20
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(push) ; 20
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(pop) ; 19
; Joined path conditions
(set-option :timeout 0)
(push) ; 19
(pop) ; 19
; Joined path conditions
(push) ; 19
(assert (not (=
  (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                    ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))))
  (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))))
(check-sat)
; unsat
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(assert (=
  (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                    ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))))
  (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))))))
; [eval] m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref)), old[pre]((unfolding acc(i32(_2), write) in _2.val_int))) == old[lhs]((unfolding acc(struct$m_Point(old[l18](_0.val_ref)), write) in (unfolding acc(i32(old[l18](_0.val_ref).f$x), write) in old[l18](_0.val_ref).f$x.val_int)))
; [eval] m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref)), old[pre]((unfolding acc(i32(_2), write) in _2.val_int)))
; [eval] snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref))
; [eval] old[pre](_1.val_ref)
(push) ; 19
; [eval] read$()
(push) ; 20
(pop) ; 20
; Joined path conditions
(push) ; 20
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(push) ; 20
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(push) ; 20
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(pop) ; 19
; Joined path conditions
; [eval] old[pre]((unfolding acc(i32(_2), write) in _2.val_int))
; [eval] (unfolding acc(i32(_2), write) in _2.val_int)
(set-option :timeout 0)
(push) ; 19
(pop) ; 19
; Joined path conditions
(push) ; 19
; [eval] 0 <= _2
; [eval] _2 < m_length__$TY$__Snap$struct$m_Route$$int$(_1)
; [eval] m_length__$TY$__Snap$struct$m_Route$$int$(_1)
(push) ; 20
(pop) ; 20
; Joined path conditions
(push) ; 20
(assert (not (<
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))
  (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                    ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))))
(check-sat)
; unsat
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(assert (<
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))
  (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                    ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))))))
(assert (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
  ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                  ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))))
(pop) ; 19
; Joined path conditions
(assert (and
  (<
    ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))
    (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                    ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                      ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
  (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                    ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01))))))
; [eval] old[lhs]((unfolding acc(struct$m_Point(old[l18](_0.val_ref)), write) in (unfolding acc(i32(old[l18](_0.val_ref).f$x), write) in old[l18](_0.val_ref).f$x.val_int)))
; [eval] (unfolding acc(struct$m_Point(old[l18](_0.val_ref)), write) in (unfolding acc(i32(old[l18](_0.val_ref).f$x), write) in old[l18](_0.val_ref).f$x.val_int))
; [eval] old[l18](_0.val_ref)
(push) ; 19
; [eval] old[l18](_0.val_ref)
(assert (struct$m_Point%trigger ($Snap.second $t@81@01) val_ref@74@01))
(assert (not (= val_ref@74@01 $Ref.null)))
(push) ; 20
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@81@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
; [eval] (unfolding acc(i32(old[l18](_0.val_ref).f$x), write) in old[l18](_0.val_ref).f$x.val_int)
; [eval] old[l18](_0.val_ref)
(set-option :timeout 0)
(push) ; 20
; [eval] old[l18](_0.val_ref)
; [eval] old[l18](_0.val_ref)
(pop) ; 20
; Joined path conditions
(pop) ; 19
; Joined path conditions
(assert (and
  (struct$m_Point%trigger ($Snap.second $t@81@01) val_ref@74@01)
  (not (= val_ref@74@01 $Ref.null))))
(push) ; 19
(assert (not (=
  (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$ ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                    ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@81@01)))))))
(check-sat)
; unsat
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(assert (=
  (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$ ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                    ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@81@01))))))
; [eval] (forall _0_quant_0: Int :: { m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref)), _0_quant_0) } { old[pre](m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref), _0_quant_0)) } !(0 <= _0_quant_0) || (!(_0_quant_0 < m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref)))) || (_0_quant_0 == old[pre]((unfolding acc(i32(_2), write) in _2.val_int)) || m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref)), _0_quant_0) == old[pre](m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref), _0_quant_0)))))
(declare-const _0_quant_0@90@01 Int)
(push) ; 19
; [eval] !(0 <= _0_quant_0) || (!(_0_quant_0 < m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref)))) || (_0_quant_0 == old[pre]((unfolding acc(i32(_2), write) in _2.val_int)) || m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref)), _0_quant_0) == old[pre](m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref), _0_quant_0))))
; [eval] !(0 <= _0_quant_0)
; [eval] 0 <= _0_quant_0
(push) ; 20
; [then-branch: 135 | !(0 <= _0_quant_0@90@01) | live]
; [else-branch: 135 | 0 <= _0_quant_0@90@01 | live]
(push) ; 21
; [then-branch: 135 | !(0 <= _0_quant_0@90@01)]
(assert (not (<= 0 _0_quant_0@90@01)))
(pop) ; 21
(push) ; 21
; [else-branch: 135 | 0 <= _0_quant_0@90@01]
(assert (<= 0 _0_quant_0@90@01))
; [eval] !(_0_quant_0 < m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref))))
; [eval] _0_quant_0 < m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref)))
; [eval] m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref)))
; [eval] snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref))
; [eval] old[pre](_1.val_ref)
(push) ; 22
; [eval] read$()
(push) ; 23
(pop) ; 23
; Joined path conditions
(push) ; 23
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(push) ; 23
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 23
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(push) ; 23
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 23
; 0.00s
; (get-info :all-statistics)
(pop) ; 22
; Joined path conditions
(set-option :timeout 0)
(push) ; 22
(pop) ; 22
; Joined path conditions
(push) ; 22
; [then-branch: 136 | !(_0_quant_0@90@01 < m_length__$TY$__Snap$struct$m_Route$$int$((_, _), snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route((First:(First:(Second:($t@31@01))), (First:(Second:(First:(Second:($t@31@01)))), (First:(Second:(Second:(First:(Second:($t@31@01))))), (First:(Second:(Second:(Second:(First:(Second:($t@31@01)))))), (_, (_, (First:(Second:(Second:(Second:(Second:(Second:(Second:(First:(Second:($t@31@01))))))))), (First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:(Second:($t@31@01)))))))))), (First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:(Second:($t@31@01))))))))))), First:(Second:($t@84@01))))))))))), First:($t@31@01)))) | live]
; [else-branch: 136 | _0_quant_0@90@01 < m_length__$TY$__Snap$struct$m_Route$$int$((_, _), snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route((First:(First:(Second:($t@31@01))), (First:(Second:(First:(Second:($t@31@01)))), (First:(Second:(Second:(First:(Second:($t@31@01))))), (First:(Second:(Second:(Second:(First:(Second:($t@31@01)))))), (_, (_, (First:(Second:(Second:(Second:(Second:(Second:(Second:(First:(Second:($t@31@01))))))))), (First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:(Second:($t@31@01)))))))))), (First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:(Second:($t@31@01))))))))))), First:(Second:($t@84@01))))))))))), First:($t@31@01))) | live]
(push) ; 23
; [then-branch: 136 | !(_0_quant_0@90@01 < m_length__$TY$__Snap$struct$m_Route$$int$((_, _), snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route((First:(First:(Second:($t@31@01))), (First:(Second:(First:(Second:($t@31@01)))), (First:(Second:(Second:(First:(Second:($t@31@01))))), (First:(Second:(Second:(Second:(First:(Second:($t@31@01)))))), (_, (_, (First:(Second:(Second:(Second:(Second:(Second:(Second:(First:(Second:($t@31@01))))))))), (First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:(Second:($t@31@01)))))))))), (First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:(Second:($t@31@01))))))))))), First:(Second:($t@84@01))))))))))), First:($t@31@01))))]
(assert (not
  (<
    _0_quant_0@90@01
    (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                    ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                      ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))))
(pop) ; 23
(push) ; 23
; [else-branch: 136 | _0_quant_0@90@01 < m_length__$TY$__Snap$struct$m_Route$$int$((_, _), snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route((First:(First:(Second:($t@31@01))), (First:(Second:(First:(Second:($t@31@01)))), (First:(Second:(Second:(First:(Second:($t@31@01))))), (First:(Second:(Second:(Second:(First:(Second:($t@31@01)))))), (_, (_, (First:(Second:(Second:(Second:(Second:(Second:(Second:(First:(Second:($t@31@01))))))))), (First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:(Second:($t@31@01)))))))))), (First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:(Second:($t@31@01))))))))))), First:(Second:($t@84@01))))))))))), First:($t@31@01)))]
(assert (<
  _0_quant_0@90@01
  (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                    ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))))))
; [eval] _0_quant_0 == old[pre]((unfolding acc(i32(_2), write) in _2.val_int))
; [eval] old[pre]((unfolding acc(i32(_2), write) in _2.val_int))
; [eval] (unfolding acc(i32(_2), write) in _2.val_int)
(push) ; 24
(pop) ; 24
; Joined path conditions
(push) ; 24
; [then-branch: 137 | _0_quant_0@90@01 == Second:(Second:($t@31@01)) | live]
; [else-branch: 137 | _0_quant_0@90@01 != Second:(Second:($t@31@01)) | live]
(push) ; 25
; [then-branch: 137 | _0_quant_0@90@01 == Second:(Second:($t@31@01))]
(assert (=
  _0_quant_0@90@01
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))))
(pop) ; 25
(push) ; 25
; [else-branch: 137 | _0_quant_0@90@01 != Second:(Second:($t@31@01))]
(assert (not
  (=
    _0_quant_0@90@01
    ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01))))))
; [eval] m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref)), _0_quant_0) == old[pre](m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref), _0_quant_0))
; [eval] m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref)), _0_quant_0)
; [eval] snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref))
; [eval] old[pre](_1.val_ref)
(push) ; 26
; [eval] read$()
(push) ; 27
(pop) ; 27
; Joined path conditions
(push) ; 27
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 27
; 0.00s
; (get-info :all-statistics)
(push) ; 27
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 27
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 27
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 27
; 0.00s
; (get-info :all-statistics)
(push) ; 27
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 27
; 0.00s
; (get-info :all-statistics)
(pop) ; 26
; Joined path conditions
(set-option :timeout 0)
(push) ; 26
; [eval] 0 <= _2
; [eval] _2 < m_length__$TY$__Snap$struct$m_Route$$int$(_1)
; [eval] m_length__$TY$__Snap$struct$m_Route$$int$(_1)
(push) ; 27
(pop) ; 27
; Joined path conditions
(assert (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
  ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                  ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@90@01))
(pop) ; 26
; Joined path conditions
(assert (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
  ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                  ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@90@01))
; [eval] old[pre](m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref), _0_quant_0))
; [eval] m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref), _0_quant_0)
; [eval] snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref)
(push) ; 26
; [eval] read$()
(push) ; 27
(pop) ; 27
; Joined path conditions
(push) ; 27
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 27
; 0.00s
; (get-info :all-statistics)
(push) ; 27
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 27
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 27
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 27
; 0.00s
; (get-info :all-statistics)
(push) ; 27
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 27
; 0.00s
; (get-info :all-statistics)
(pop) ; 26
; Joined path conditions
(set-option :timeout 0)
(push) ; 26
; [eval] 0 <= _2
; [eval] _2 < m_length__$TY$__Snap$struct$m_Route$$int$(_1)
; [eval] m_length__$TY$__Snap$struct$m_Route$$int$(_1)
(push) ; 27
(pop) ; 27
; Joined path conditions
(push) ; 27
(assert (not (<
  _0_quant_0@90@01
  (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))))
(check-sat)
; unsat
(pop) ; 27
; 0.00s
; (get-info :all-statistics)
(assert (<
  _0_quant_0@90@01
  (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))))))
(assert (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@90@01))
(pop) ; 26
; Joined path conditions
(assert (and
  (<
    _0_quant_0@90@01
    (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
  (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@90@01)))
(pop) ; 25
(pop) ; 24
; Joined path conditions
; Joined path conditions
(assert (=>
  (not
    (=
      _0_quant_0@90@01
      ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))))
  (and
    (not
      (=
        _0_quant_0@90@01
        ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))))
    (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                    ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                      ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@90@01)
    (<
      _0_quant_0@90@01
      (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
    (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@90@01))))
(assert (or
  (not
    (=
      _0_quant_0@90@01
      ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))))
  (=
    _0_quant_0@90@01
    ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01))))))
(pop) ; 23
(pop) ; 22
; Joined path conditions
; Joined path conditions
(assert (=>
  (<
    _0_quant_0@90@01
    (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                    ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                      ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
  (and
    (<
      _0_quant_0@90@01
      (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
        ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
                    ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                      ($Snap.combine
                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                        ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
    (=>
      (not
        (=
          _0_quant_0@90@01
          ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))))
      (and
        (not
          (=
            _0_quant_0@90@01
            ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))))
        (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
          ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
                      ($Snap.combine
                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                        ($Snap.combine
                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                          ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@90@01)
        (<
          _0_quant_0@90@01
          (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
        (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@90@01)))
    (or
      (not
        (=
          _0_quant_0@90@01
          ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))))
      (=
        _0_quant_0@90@01
        ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01))))))))
(assert (or
  (<
    _0_quant_0@90@01
    (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                    ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                      ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
  (not
    (<
      _0_quant_0@90@01
      (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
        ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
                    ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                      ($Snap.combine
                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                        ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))))))))
(pop) ; 21
(pop) ; 20
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 _0_quant_0@90@01)
  (and
    (<= 0 _0_quant_0@90@01)
    (=>
      (<
        _0_quant_0@90@01
        (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
          ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
                      ($Snap.combine
                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                        ($Snap.combine
                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                          ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
      (and
        (<
          _0_quant_0@90@01
          (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
            ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
                        ($Snap.combine
                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                          ($Snap.combine
                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                            ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
        (=>
          (not
            (=
              _0_quant_0@90@01
              ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))))
          (and
            (not
              (=
                _0_quant_0@90@01
                ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))))
            (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
              ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine
                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
                          ($Snap.combine
                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                            ($Snap.combine
                              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                              ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@90@01)
            (<
              _0_quant_0@90@01
              (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
            (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@90@01)))
        (or
          (not
            (=
              _0_quant_0@90@01
              ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))))
          (=
            _0_quant_0@90@01
            ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))))))
    (or
      (<
        _0_quant_0@90@01
        (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
          ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
                      ($Snap.combine
                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                        ($Snap.combine
                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                          ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
      (not
        (<
          _0_quant_0@90@01
          (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
            ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
                        ($Snap.combine
                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                          ($Snap.combine
                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                            ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))))))))))
(assert (or (<= 0 _0_quant_0@90@01) (not (<= 0 _0_quant_0@90@01))))
(pop) ; 19
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((_0_quant_0@90@01 Int)) (!
  (and
    (=>
      (<= 0 _0_quant_0@90@01)
      (and
        (<= 0 _0_quant_0@90@01)
        (=>
          (<
            _0_quant_0@90@01
            (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
              ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine
                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
                          ($Snap.combine
                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                            ($Snap.combine
                              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                              ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
          (and
            (<
              _0_quant_0@90@01
              (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
                ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
                    ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine
                          $Snap.unit
                          ($Snap.combine
                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
                            ($Snap.combine
                              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                              ($Snap.combine
                                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                                ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
            (=>
              (not
                (=
                  _0_quant_0@90@01
                  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))))
              (and
                (not
                  (=
                    _0_quant_0@90@01
                    ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))))
                (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
                  $Snap.unit
                  ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
                  ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
                    ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
                      ($Snap.combine
                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
                        ($Snap.combine
                          $Snap.unit
                          ($Snap.combine
                            $Snap.unit
                            ($Snap.combine
                              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
                              ($Snap.combine
                                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                                ($Snap.combine
                                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                                  ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@90@01)
                (<
                  _0_quant_0@90@01
                  (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
                    $Snap.unit
                    $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
                (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
                  $Snap.unit
                  ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@90@01)))
            (or
              (not
                (=
                  _0_quant_0@90@01
                  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))))
              (=
                _0_quant_0@90@01
                ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))))))
        (or
          (<
            _0_quant_0@90@01
            (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
              ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine
                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
                          ($Snap.combine
                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                            ($Snap.combine
                              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                              ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
          (not
            (<
              _0_quant_0@90@01
              (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
                ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
                    ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine
                          $Snap.unit
                          ($Snap.combine
                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
                            ($Snap.combine
                              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                              ($Snap.combine
                                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                                ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))))))
    (or (<= 0 _0_quant_0@90@01) (not (<= 0 _0_quant_0@90@01))))
  :pattern ((m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                    ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@90@01))
  :qid |prog.l693-aux|)))
(assert (forall ((_0_quant_0@90@01 Int)) (!
  (and
    (=>
      (<= 0 _0_quant_0@90@01)
      (and
        (<= 0 _0_quant_0@90@01)
        (=>
          (<
            _0_quant_0@90@01
            (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
              ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine
                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
                          ($Snap.combine
                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                            ($Snap.combine
                              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                              ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
          (and
            (<
              _0_quant_0@90@01
              (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
                ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
                    ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine
                          $Snap.unit
                          ($Snap.combine
                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
                            ($Snap.combine
                              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                              ($Snap.combine
                                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                                ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
            (=>
              (not
                (=
                  _0_quant_0@90@01
                  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))))
              (and
                (not
                  (=
                    _0_quant_0@90@01
                    ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))))
                (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
                  $Snap.unit
                  ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
                  ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
                    ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
                      ($Snap.combine
                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
                        ($Snap.combine
                          $Snap.unit
                          ($Snap.combine
                            $Snap.unit
                            ($Snap.combine
                              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
                              ($Snap.combine
                                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                                ($Snap.combine
                                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                                  ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@90@01)
                (<
                  _0_quant_0@90@01
                  (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
                    $Snap.unit
                    $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
                (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
                  $Snap.unit
                  ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@90@01)))
            (or
              (not
                (=
                  _0_quant_0@90@01
                  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))))
              (=
                _0_quant_0@90@01
                ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))))))
        (or
          (<
            _0_quant_0@90@01
            (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
              ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine
                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
                          ($Snap.combine
                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                            ($Snap.combine
                              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                              ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
          (not
            (<
              _0_quant_0@90@01
              (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
                ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
                    ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine
                          $Snap.unit
                          ($Snap.combine
                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
                            ($Snap.combine
                              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                              ($Snap.combine
                                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                                ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))))))
    (or (<= 0 _0_quant_0@90@01) (not (<= 0 _0_quant_0@90@01))))
  :pattern ((m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@90@01))
  :qid |prog.l693-aux|)))
(assert (forall ((_0_quant_0@90@01 Int)) (!
  (=>
    (<= 0 _0_quant_0@90@01)
    (and
      (and
        (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route%precondition ($Snap.combine
          ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
                      ($Snap.combine
                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                        ($Snap.combine
                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                          ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))
        (m_length__$TY$__Snap$struct$m_Route$$int$%precondition ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
          ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
                      ($Snap.combine
                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                        ($Snap.combine
                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                          ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
      (=>
        (and
          (<
            _0_quant_0@90@01
            (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
              ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine
                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
                          ($Snap.combine
                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                            ($Snap.combine
                              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                              ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
          (not
            (=
              _0_quant_0@90@01
              ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01))))))
        (and
          (and
            (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route%precondition ($Snap.combine
              ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine
                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
                          ($Snap.combine
                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                            ($Snap.combine
                              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                              ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))
            (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
              ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine
                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
                          ($Snap.combine
                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                            ($Snap.combine
                              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                              ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@90@01))
          (and
            (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route%precondition ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))
            (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@90@01))))))
  :pattern ((m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                    ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@90@01))
  :pattern ((m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@90@01))
  :qid |prog.l693_precondition|)))
(push) ; 19
(assert (not (forall ((_0_quant_0@90@01 Int)) (!
  (=>
    (=>
      (<= 0 _0_quant_0@90@01)
      (and
        (and
          (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route%precondition ($Snap.combine
            ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
                        ($Snap.combine
                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                          ($Snap.combine
                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                            ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))
          (m_length__$TY$__Snap$struct$m_Route$$int$%precondition ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
            ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
                        ($Snap.combine
                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                          ($Snap.combine
                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                            ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
        (=>
          (and
            (<
              _0_quant_0@90@01
              (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
                ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
                    ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine
                          $Snap.unit
                          ($Snap.combine
                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
                            ($Snap.combine
                              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                              ($Snap.combine
                                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                                ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))))
            (not
              (=
                _0_quant_0@90@01
                ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01))))))
          (and
            (and
              (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route%precondition ($Snap.combine
                ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
                    ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine
                          $Snap.unit
                          ($Snap.combine
                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
                            ($Snap.combine
                              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                              ($Snap.combine
                                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                                ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))
              (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
                ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
                    ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine
                          $Snap.unit
                          ($Snap.combine
                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
                            ($Snap.combine
                              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                              ($Snap.combine
                                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                                ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@90@01))
            (and
              (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route%precondition ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)))
              (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@90@01))))))
    (or
      (not (<= 0 _0_quant_0@90@01))
      (or
        (not
          (<
            _0_quant_0@90@01
            (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
              ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine
                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
                          ($Snap.combine
                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                            ($Snap.combine
                              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                              ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))))))
        (or
          (=
            _0_quant_0@90@01
            ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01))))
          (=
            (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$ ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
              ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine
                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
                          ($Snap.combine
                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                            ($Snap.combine
                              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                              ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@90@01)
            (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$ ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@90@01))))))
  :pattern ((m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                    ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@90@01))
  :pattern ((m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@90@01))
  :qid |prog.l693|))))
(check-sat)
; unsat
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
(assert (forall ((_0_quant_0@90@01 Int)) (!
  (or
    (not (<= 0 _0_quant_0@90@01))
    (or
      (not
        (<
          _0_quant_0@90@01
          (m_length__$TY$__Snap$struct$m_Route$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
            ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
                        ($Snap.combine
                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                          ($Snap.combine
                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                            ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))))))
      (or
        (=
          _0_quant_0@90@01
          ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01))))
        (=
          (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$ ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
            ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
                        ($Snap.combine
                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                          ($Snap.combine
                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                            ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@90@01)
          (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$ ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@90@01)))))
  :pattern ((m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second $t@31@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@31@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01)))))))))))
                    ($Snap.first ($Snap.second $t@84@01))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@90@01))
  :pattern ((m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) _0_quant_0@90@01))
  :qid |prog.l693|)))
; [eval] -1
; [eval] old[l18](_0.val_ref)
; [eval] old[pre](_1.val_ref)
; [eval] old[pre](_1.val_ref)
; [eval] old[pre](m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref)))
; [eval] m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref)
(push) ; 19
; [eval] read$()
(push) ; 20
(pop) ; 20
; Joined path conditions
(push) ; 20
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(push) ; 20
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 20
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(push) ; 20
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 20
; 0.00s
; (get-info :all-statistics)
(pop) ; 19
; Joined path conditions
(set-option :timeout 0)
(push) ; 19
(pop) ; 19
; Joined path conditions
; [eval] old[pre](_1.val_ref)
; [eval] old[pre]((unfolding acc(i32(_2), write) in _2.val_int))
; [eval] (unfolding acc(i32(_2), write) in _2.val_int)
(push) ; 19
(pop) ; 19
; Joined path conditions
; [eval] old[l18](_0.val_ref)
; [eval] old[l18](_0.val_ref)
; [eval] old[l18](_0.val_ref)
; [eval] old[pre](_1.val_ref)
; [eval] old[pre]((unfolding acc(i32(_2), write) in _2.val_int))
; [eval] (unfolding acc(i32(_2), write) in _2.val_int)
(push) ; 19
(pop) ; 19
; Joined path conditions
; [eval] old[pre](_1.val_ref)
(pop) ; 18
; [eval] __t1 && (__t1 && (__t1 && (__t8 && __t8)))
; [then-branch: 138 | False | dead]
; [else-branch: 138 | True | live]
(push) ; 18
; [else-branch: 138 | True]
(pop) ; 18
(pop) ; 17
; [eval] !(__t5 && (__t5 && (__t6 && (__t6 && (__t7 && (__t7 && (__t8 && __t8)))))))
; [eval] __t5 && (__t5 && (__t6 && (__t6 && (__t7 && (__t7 && (__t8 && __t8))))))
(push) ; 17
; [then-branch: 139 | True | live]
; [else-branch: 139 | False | live]
(push) ; 18
; [then-branch: 139 | True]
(push) ; 19
; [then-branch: 140 | True | live]
; [else-branch: 140 | False | live]
(push) ; 20
; [then-branch: 140 | True]
(push) ; 21
; [then-branch: 141 | True | live]
; [else-branch: 141 | False | live]
(push) ; 22
; [then-branch: 141 | True]
(push) ; 23
; [then-branch: 142 | True | live]
; [else-branch: 142 | False | live]
(push) ; 24
; [then-branch: 142 | True]
(push) ; 25
; [then-branch: 143 | True | live]
; [else-branch: 143 | False | live]
(push) ; 26
; [then-branch: 143 | True]
(push) ; 27
; [then-branch: 144 | True | live]
; [else-branch: 144 | False | live]
(push) ; 28
; [then-branch: 144 | True]
(push) ; 29
; [then-branch: 145 | True | live]
; [else-branch: 145 | False | live]
(push) ; 30
; [then-branch: 145 | True]
(pop) ; 30
(push) ; 30
; [else-branch: 145 | False]
(assert false)
(pop) ; 30
(pop) ; 29
; Joined path conditions
; Joined path conditions
(pop) ; 28
(push) ; 28
; [else-branch: 144 | False]
(assert false)
(pop) ; 28
(pop) ; 27
; Joined path conditions
; Joined path conditions
(pop) ; 26
(push) ; 26
; [else-branch: 143 | False]
(assert false)
(pop) ; 26
(pop) ; 25
; Joined path conditions
; Joined path conditions
(pop) ; 24
(push) ; 24
; [else-branch: 142 | False]
(assert false)
(pop) ; 24
(pop) ; 23
; Joined path conditions
; Joined path conditions
(pop) ; 22
(push) ; 22
; [else-branch: 141 | False]
(assert false)
(pop) ; 22
(pop) ; 21
; Joined path conditions
; Joined path conditions
(pop) ; 20
(push) ; 20
; [else-branch: 140 | False]
(assert false)
(pop) ; 20
(pop) ; 19
; Joined path conditions
; Joined path conditions
(pop) ; 18
(push) ; 18
; [else-branch: 139 | False]
(assert false)
(pop) ; 18
(pop) ; 17
; Joined path conditions
; Joined path conditions
; [then-branch: 146 | False | dead]
; [else-branch: 146 | True | live]
(push) ; 17
; [else-branch: 146 | True]
(pop) ; 17
(pop) ; 16
(pop) ; 15
(pop) ; 14
; [eval] !(__t6 && (__t7 && (__t7 && (__t8 && __t8))))
; [eval] __t6 && (__t7 && (__t7 && (__t8 && __t8)))
(push) ; 14
; [then-branch: 147 | True | live]
; [else-branch: 147 | False | live]
(push) ; 15
; [then-branch: 147 | True]
(push) ; 16
; [then-branch: 148 | True | live]
; [else-branch: 148 | False | live]
(push) ; 17
; [then-branch: 148 | True]
(push) ; 18
; [then-branch: 149 | True | live]
; [else-branch: 149 | False | live]
(push) ; 19
; [then-branch: 149 | True]
(push) ; 20
; [then-branch: 150 | True | live]
; [else-branch: 150 | False | live]
(push) ; 21
; [then-branch: 150 | True]
(pop) ; 21
(push) ; 21
; [else-branch: 150 | False]
(assert false)
(pop) ; 21
(pop) ; 20
; Joined path conditions
; Joined path conditions
(pop) ; 19
(push) ; 19
; [else-branch: 149 | False]
(assert false)
(pop) ; 19
(pop) ; 18
; Joined path conditions
; Joined path conditions
(pop) ; 17
(push) ; 17
; [else-branch: 148 | False]
(assert false)
(pop) ; 17
(pop) ; 16
; Joined path conditions
; Joined path conditions
(pop) ; 15
(push) ; 15
; [else-branch: 147 | False]
(assert false)
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
; [then-branch: 151 | False | dead]
; [else-branch: 151 | True | live]
(push) ; 14
; [else-branch: 151 | True]
(pop) ; 14
(pop) ; 13
; [eval] __t1 && (__t1 && (__t8 && __t8))
; [then-branch: 152 | False | dead]
; [else-branch: 152 | True | live]
(push) ; 13
; [else-branch: 152 | True]
(pop) ; 13
(pop) ; 12
; [eval] __t1 && (__t8 && __t8)
; [then-branch: 153 | False | dead]
; [else-branch: 153 | True | live]
(push) ; 12
; [else-branch: 153 | True]
(pop) ; 12
(pop) ; 11
(pop) ; 10
(pop) ; 9
; [eval] __t8 && (__t8 && __t1)
(push) ; 9
; [then-branch: 154 | True | live]
; [else-branch: 154 | False | live]
(push) ; 10
; [then-branch: 154 | True]
(push) ; 11
; [then-branch: 155 | True | live]
; [else-branch: 155 | False | live]
(push) ; 12
; [then-branch: 155 | True]
(pop) ; 12
(push) ; 12
; [else-branch: 155 | False]
(assert false)
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(pop) ; 10
(push) ; 10
; [else-branch: 154 | False]
(assert false)
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
; [then-branch: 156 | False | dead]
; [else-branch: 156 | True | live]
(push) ; 9
; [else-branch: 156 | True]
(pop) ; 9
(pop) ; 8
(pop) ; 7
(pop) ; 6
(pop) ; 5
(push) ; 5
(assert (and (not (= _10@54@01 0)) (not val_bool@38@01)))
(assert (and
  (<= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.Write)
  (=>
    (< $Perm.No (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))))
    (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01)) $Ref.null)))))
(assert (=>
  (< $Perm.No (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))
      $Ref.null))))
(assert (=>
  (< $Perm.No (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@31@01))))))))))
      $Ref.null))))
; [exec]
; label l19
; [exec]
; assert (unfolding acc(struct$m_Point(_0.val_ref), write) in
;     (unfolding acc(i32(_0.val_ref.f$x), write) in
;       _0.val_ref.f$x.val_int ==
;       old[pre](m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref),
;       (unfolding acc(i32(_2), write) in _2.val_int)))))
; [eval] (unfolding acc(struct$m_Point(_0.val_ref), write) in (unfolding acc(i32(_0.val_ref.f$x), write) in _0.val_ref.f$x.val_int == old[pre](m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref), (unfolding acc(i32(_2), write) in _2.val_int)))))
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@69@01)) val_ref@74@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (struct$m_Point%trigger ($Snap.second $t@69@01) val_ref@74@01))
(assert (not (= val_ref@74@01 $Ref.null)))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@69@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@69@01))))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [eval] (unfolding acc(i32(_0.val_ref.f$x), write) in _0.val_ref.f$x.val_int == old[pre](m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref), (unfolding acc(i32(_2), write) in _2.val_int))))
(set-option :timeout 0)
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not (= _2@16@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@69@01))))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [eval] _0.val_ref.f$x.val_int == old[pre](m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref), (unfolding acc(i32(_2), write) in _2.val_int)))
; [eval] old[pre](m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref), (unfolding acc(i32(_2), write) in _2.val_int)))
; [eval] m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref), (unfolding acc(i32(_2), write) in _2.val_int))
; [eval] snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref)
(set-option :timeout 0)
(push) ; 8
; [eval] read$()
(push) ; 9
(pop) ; 9
; Joined path conditions
(push) ; 9
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(push) ; 9
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(push) ; 9
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(pop) ; 8
; Joined path conditions
; [eval] (unfolding acc(i32(_2), write) in _2.val_int)
(set-option :timeout 0)
(push) ; 8
(pop) ; 8
; Joined path conditions
(push) ; 8
; [eval] 0 <= _2
; [eval] _2 < m_length__$TY$__Snap$struct$m_Route$$int$(_1)
; [eval] m_length__$TY$__Snap$struct$m_Route$$int$(_1)
(push) ; 9
(pop) ; 9
; Joined path conditions
(assert (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))))
(pop) ; 8
; Joined path conditions
(assert (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))))
(pop) ; 7
; Joined path conditions
(assert (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))))
(pop) ; 6
; Joined path conditions
(assert (and
  (struct$m_Point%trigger ($Snap.second $t@69@01) val_ref@74@01)
  (not (= val_ref@74@01 $Ref.null))
  (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01))))))
(push) ; 6
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@69@01))))
  (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$ ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01)))))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@69@01))))
  (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$ ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit $Snap.unit)) (snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route ($Snap.first ($Snap.second $t@31@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@31@01))) ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@31@01))))))
; [exec]
; assert true
; [exec]
; exhale acc(_0.val_ref, write) && acc(struct$m_Point(_0.val_ref), write)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@69@01)) val_ref@74@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(DeadBorrowToken$(-1), write) &&
;   acc(struct$m_Point(old[l19](_0.val_ref)), write) --*
;   acc(struct$m_Route(old[pre](_1.val_ref)), write) &&
;   (m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref))) ==
;   old[pre](m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref))) &&
;   (m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref)),
;   old[pre]((unfolding acc(i32(_2), write) in _2.val_int))) ==
;   old[lhs]((unfolding acc(struct$m_Point(old[l19](_0.val_ref)), write) in
;     (unfolding acc(i32(old[l19](_0.val_ref).f$x), write) in
;       old[l19](_0.val_ref).f$x.val_int))) &&
;   (forall _0_quant_0: Int ::
;     { m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref)),
;     _0_quant_0) }
;     { old[pre](m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref),
;     _0_quant_0)) }
;     !(0 <= _0_quant_0) ||
;     (!(_0_quant_0 <
;     m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref)))) ||
;     (_0_quant_0 == old[pre]((unfolding acc(i32(_2), write) in _2.val_int)) ||
;     m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(old[pre](_1.val_ref)),
;     _0_quant_0) ==
;     old[pre](m_get_nth_x__$TY$__Snap$struct$m_Route$$int$$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref),
;     _0_quant_0)))))))
; [eval] -1
; [eval] old[l19](_0.val_ref)
; [eval] old[pre](_1.val_ref)
; [eval] old[pre](_1.val_ref)
; [eval] old[pre](m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref)))
; [eval] m_length__$TY$__Snap$struct$m_Route$$int$(snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_Route$struct$m_Route$Snap$struct$m_Route(_1.val_ref)
(set-option :timeout 0)
(push) ; 6
; [eval] read$()
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(pop) ; 6
; Joined path conditions
(set-option :timeout 0)
(push) ; 6
(pop) ; 6
; Joined path conditions
; [eval] old[pre](_1.val_ref)
; [eval] old[pre]((unfolding acc(i32(_2), write) in _2.val_int))
; [eval] (unfolding acc(i32(_2), write) in _2.val_int)
(push) ; 6
(pop) ; 6
; Joined path conditions
; [eval] old[l19](_0.val_ref)
; [eval] old[l19](_0.val_ref)
; [eval] old[l19](_0.val_ref)
; [eval] old[pre](_1.val_ref)
; [eval] old[pre]((unfolding acc(i32(_2), write) in _2.val_int))
; [eval] (unfolding acc(i32(_2), write) in _2.val_int)
(push) ; 6
(pop) ; 6
; Joined path conditions
; [eval] old[pre](_1.val_ref)
; [exec]
; label end_of_method
(pop) ; 5
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 58 | val_bool@38@01]
(assert val_bool@38@01)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- builtin$havoc_bool ----------
(declare-const ret@91@01 Bool)
(declare-const ret@92@01 Bool)
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
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- builtin$havoc_int ----------
(declare-const ret@93@01 Int)
(declare-const ret@94@01 Int)
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
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- builtin$havoc_ref ----------
(declare-const ret@95@01 $Ref)
(declare-const ret@96@01 $Ref)
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
; inhale false
(pop) ; 2
(pop) ; 1
