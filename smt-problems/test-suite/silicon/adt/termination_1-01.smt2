(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:40:16
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/adt/termination_1.vpr
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
(declare-sort IntList 0)
(declare-sort ListWellFoundedOrder<Val> 0)
(declare-sort WellFoundedOrder<DList<Int~_Val>> 0)
(declare-sort WellFoundedOrder<List<Val>> 0)
(declare-sort List<Val> 0)
(declare-sort DListWellFoundedOrder<Int~_Val> 0)
(declare-sort DList<Int~_Val> 0)
(declare-sort IntListWellFoundedOrder 0)
(declare-sort Val 0)
(declare-sort PairWellFoundedOrder<Int~_Val> 0)
(declare-sort WellFoundedOrder<IntList> 0)
(declare-sort Pair<Int~_Val> 0)
(declare-sort WellFoundedOrder<Pair<Int~_Val>> 0)
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
(declare-fun $SortWrappers.IntListTo$Snap (IntList) $Snap)
(declare-fun $SortWrappers.$SnapToIntList ($Snap) IntList)
(assert (forall ((x IntList)) (!
    (= x ($SortWrappers.$SnapToIntList($SortWrappers.IntListTo$Snap x)))
    :pattern (($SortWrappers.IntListTo$Snap x))
    :qid |$Snap.$SnapToIntListTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.IntListTo$Snap($SortWrappers.$SnapToIntList x)))
    :pattern (($SortWrappers.$SnapToIntList x))
    :qid |$Snap.IntListTo$SnapToIntList|
    )))
(declare-fun $SortWrappers.ListWellFoundedOrder<Val>To$Snap (ListWellFoundedOrder<Val>) $Snap)
(declare-fun $SortWrappers.$SnapToListWellFoundedOrder<Val> ($Snap) ListWellFoundedOrder<Val>)
(assert (forall ((x ListWellFoundedOrder<Val>)) (!
    (= x ($SortWrappers.$SnapToListWellFoundedOrder<Val>($SortWrappers.ListWellFoundedOrder<Val>To$Snap x)))
    :pattern (($SortWrappers.ListWellFoundedOrder<Val>To$Snap x))
    :qid |$Snap.$SnapToListWellFoundedOrder<Val>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.ListWellFoundedOrder<Val>To$Snap($SortWrappers.$SnapToListWellFoundedOrder<Val> x)))
    :pattern (($SortWrappers.$SnapToListWellFoundedOrder<Val> x))
    :qid |$Snap.ListWellFoundedOrder<Val>To$SnapToListWellFoundedOrder<Val>|
    )))
(declare-fun $SortWrappers.WellFoundedOrder<DList<Int~_Val>>To$Snap (WellFoundedOrder<DList<Int~_Val>>) $Snap)
(declare-fun $SortWrappers.$SnapToWellFoundedOrder<DList<Int~_Val>> ($Snap) WellFoundedOrder<DList<Int~_Val>>)
(assert (forall ((x WellFoundedOrder<DList<Int~_Val>>)) (!
    (= x ($SortWrappers.$SnapToWellFoundedOrder<DList<Int~_Val>>($SortWrappers.WellFoundedOrder<DList<Int~_Val>>To$Snap x)))
    :pattern (($SortWrappers.WellFoundedOrder<DList<Int~_Val>>To$Snap x))
    :qid |$Snap.$SnapToWellFoundedOrder<DList<Int~_Val>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.WellFoundedOrder<DList<Int~_Val>>To$Snap($SortWrappers.$SnapToWellFoundedOrder<DList<Int~_Val>> x)))
    :pattern (($SortWrappers.$SnapToWellFoundedOrder<DList<Int~_Val>> x))
    :qid |$Snap.WellFoundedOrder<DList<Int~_Val>>To$SnapToWellFoundedOrder<DList<Int~_Val>>|
    )))
(declare-fun $SortWrappers.WellFoundedOrder<List<Val>>To$Snap (WellFoundedOrder<List<Val>>) $Snap)
(declare-fun $SortWrappers.$SnapToWellFoundedOrder<List<Val>> ($Snap) WellFoundedOrder<List<Val>>)
(assert (forall ((x WellFoundedOrder<List<Val>>)) (!
    (= x ($SortWrappers.$SnapToWellFoundedOrder<List<Val>>($SortWrappers.WellFoundedOrder<List<Val>>To$Snap x)))
    :pattern (($SortWrappers.WellFoundedOrder<List<Val>>To$Snap x))
    :qid |$Snap.$SnapToWellFoundedOrder<List<Val>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.WellFoundedOrder<List<Val>>To$Snap($SortWrappers.$SnapToWellFoundedOrder<List<Val>> x)))
    :pattern (($SortWrappers.$SnapToWellFoundedOrder<List<Val>> x))
    :qid |$Snap.WellFoundedOrder<List<Val>>To$SnapToWellFoundedOrder<List<Val>>|
    )))
(declare-fun $SortWrappers.List<Val>To$Snap (List<Val>) $Snap)
(declare-fun $SortWrappers.$SnapToList<Val> ($Snap) List<Val>)
(assert (forall ((x List<Val>)) (!
    (= x ($SortWrappers.$SnapToList<Val>($SortWrappers.List<Val>To$Snap x)))
    :pattern (($SortWrappers.List<Val>To$Snap x))
    :qid |$Snap.$SnapToList<Val>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.List<Val>To$Snap($SortWrappers.$SnapToList<Val> x)))
    :pattern (($SortWrappers.$SnapToList<Val> x))
    :qid |$Snap.List<Val>To$SnapToList<Val>|
    )))
(declare-fun $SortWrappers.DListWellFoundedOrder<Int~_Val>To$Snap (DListWellFoundedOrder<Int~_Val>) $Snap)
(declare-fun $SortWrappers.$SnapToDListWellFoundedOrder<Int~_Val> ($Snap) DListWellFoundedOrder<Int~_Val>)
(assert (forall ((x DListWellFoundedOrder<Int~_Val>)) (!
    (= x ($SortWrappers.$SnapToDListWellFoundedOrder<Int~_Val>($SortWrappers.DListWellFoundedOrder<Int~_Val>To$Snap x)))
    :pattern (($SortWrappers.DListWellFoundedOrder<Int~_Val>To$Snap x))
    :qid |$Snap.$SnapToDListWellFoundedOrder<Int~_Val>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.DListWellFoundedOrder<Int~_Val>To$Snap($SortWrappers.$SnapToDListWellFoundedOrder<Int~_Val> x)))
    :pattern (($SortWrappers.$SnapToDListWellFoundedOrder<Int~_Val> x))
    :qid |$Snap.DListWellFoundedOrder<Int~_Val>To$SnapToDListWellFoundedOrder<Int~_Val>|
    )))
(declare-fun $SortWrappers.DList<Int~_Val>To$Snap (DList<Int~_Val>) $Snap)
(declare-fun $SortWrappers.$SnapToDList<Int~_Val> ($Snap) DList<Int~_Val>)
(assert (forall ((x DList<Int~_Val>)) (!
    (= x ($SortWrappers.$SnapToDList<Int~_Val>($SortWrappers.DList<Int~_Val>To$Snap x)))
    :pattern (($SortWrappers.DList<Int~_Val>To$Snap x))
    :qid |$Snap.$SnapToDList<Int~_Val>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.DList<Int~_Val>To$Snap($SortWrappers.$SnapToDList<Int~_Val> x)))
    :pattern (($SortWrappers.$SnapToDList<Int~_Val> x))
    :qid |$Snap.DList<Int~_Val>To$SnapToDList<Int~_Val>|
    )))
(declare-fun $SortWrappers.IntListWellFoundedOrderTo$Snap (IntListWellFoundedOrder) $Snap)
(declare-fun $SortWrappers.$SnapToIntListWellFoundedOrder ($Snap) IntListWellFoundedOrder)
(assert (forall ((x IntListWellFoundedOrder)) (!
    (= x ($SortWrappers.$SnapToIntListWellFoundedOrder($SortWrappers.IntListWellFoundedOrderTo$Snap x)))
    :pattern (($SortWrappers.IntListWellFoundedOrderTo$Snap x))
    :qid |$Snap.$SnapToIntListWellFoundedOrderTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.IntListWellFoundedOrderTo$Snap($SortWrappers.$SnapToIntListWellFoundedOrder x)))
    :pattern (($SortWrappers.$SnapToIntListWellFoundedOrder x))
    :qid |$Snap.IntListWellFoundedOrderTo$SnapToIntListWellFoundedOrder|
    )))
(declare-fun $SortWrappers.ValTo$Snap (Val) $Snap)
(declare-fun $SortWrappers.$SnapToVal ($Snap) Val)
(assert (forall ((x Val)) (!
    (= x ($SortWrappers.$SnapToVal($SortWrappers.ValTo$Snap x)))
    :pattern (($SortWrappers.ValTo$Snap x))
    :qid |$Snap.$SnapToValTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.ValTo$Snap($SortWrappers.$SnapToVal x)))
    :pattern (($SortWrappers.$SnapToVal x))
    :qid |$Snap.ValTo$SnapToVal|
    )))
(declare-fun $SortWrappers.PairWellFoundedOrder<Int~_Val>To$Snap (PairWellFoundedOrder<Int~_Val>) $Snap)
(declare-fun $SortWrappers.$SnapToPairWellFoundedOrder<Int~_Val> ($Snap) PairWellFoundedOrder<Int~_Val>)
(assert (forall ((x PairWellFoundedOrder<Int~_Val>)) (!
    (= x ($SortWrappers.$SnapToPairWellFoundedOrder<Int~_Val>($SortWrappers.PairWellFoundedOrder<Int~_Val>To$Snap x)))
    :pattern (($SortWrappers.PairWellFoundedOrder<Int~_Val>To$Snap x))
    :qid |$Snap.$SnapToPairWellFoundedOrder<Int~_Val>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.PairWellFoundedOrder<Int~_Val>To$Snap($SortWrappers.$SnapToPairWellFoundedOrder<Int~_Val> x)))
    :pattern (($SortWrappers.$SnapToPairWellFoundedOrder<Int~_Val> x))
    :qid |$Snap.PairWellFoundedOrder<Int~_Val>To$SnapToPairWellFoundedOrder<Int~_Val>|
    )))
(declare-fun $SortWrappers.WellFoundedOrder<IntList>To$Snap (WellFoundedOrder<IntList>) $Snap)
(declare-fun $SortWrappers.$SnapToWellFoundedOrder<IntList> ($Snap) WellFoundedOrder<IntList>)
(assert (forall ((x WellFoundedOrder<IntList>)) (!
    (= x ($SortWrappers.$SnapToWellFoundedOrder<IntList>($SortWrappers.WellFoundedOrder<IntList>To$Snap x)))
    :pattern (($SortWrappers.WellFoundedOrder<IntList>To$Snap x))
    :qid |$Snap.$SnapToWellFoundedOrder<IntList>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.WellFoundedOrder<IntList>To$Snap($SortWrappers.$SnapToWellFoundedOrder<IntList> x)))
    :pattern (($SortWrappers.$SnapToWellFoundedOrder<IntList> x))
    :qid |$Snap.WellFoundedOrder<IntList>To$SnapToWellFoundedOrder<IntList>|
    )))
(declare-fun $SortWrappers.Pair<Int~_Val>To$Snap (Pair<Int~_Val>) $Snap)
(declare-fun $SortWrappers.$SnapToPair<Int~_Val> ($Snap) Pair<Int~_Val>)
(assert (forall ((x Pair<Int~_Val>)) (!
    (= x ($SortWrappers.$SnapToPair<Int~_Val>($SortWrappers.Pair<Int~_Val>To$Snap x)))
    :pattern (($SortWrappers.Pair<Int~_Val>To$Snap x))
    :qid |$Snap.$SnapToPair<Int~_Val>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Pair<Int~_Val>To$Snap($SortWrappers.$SnapToPair<Int~_Val> x)))
    :pattern (($SortWrappers.$SnapToPair<Int~_Val> x))
    :qid |$Snap.Pair<Int~_Val>To$SnapToPair<Int~_Val>|
    )))
(declare-fun $SortWrappers.WellFoundedOrder<Pair<Int~_Val>>To$Snap (WellFoundedOrder<Pair<Int~_Val>>) $Snap)
(declare-fun $SortWrappers.$SnapToWellFoundedOrder<Pair<Int~_Val>> ($Snap) WellFoundedOrder<Pair<Int~_Val>>)
(assert (forall ((x WellFoundedOrder<Pair<Int~_Val>>)) (!
    (= x ($SortWrappers.$SnapToWellFoundedOrder<Pair<Int~_Val>>($SortWrappers.WellFoundedOrder<Pair<Int~_Val>>To$Snap x)))
    :pattern (($SortWrappers.WellFoundedOrder<Pair<Int~_Val>>To$Snap x))
    :qid |$Snap.$SnapToWellFoundedOrder<Pair<Int~_Val>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.WellFoundedOrder<Pair<Int~_Val>>To$Snap($SortWrappers.$SnapToWellFoundedOrder<Pair<Int~_Val>> x)))
    :pattern (($SortWrappers.$SnapToWellFoundedOrder<Pair<Int~_Val>> x))
    :qid |$Snap.WellFoundedOrder<Pair<Int~_Val>>To$SnapToWellFoundedOrder<Pair<Int~_Val>>|
    )))
; ////////// Symbols
(declare-fun decreasing<Bool> (Pair<Int~_Val> Pair<Int~_Val>) Bool)
(declare-fun bounded<Bool> (Pair<Int~_Val>) Bool)
(declare-fun pair<Pair<Int~_Val>> (Int Val) Pair<Int~_Val>)
(declare-fun get_Pair_fst<Int> (Pair<Int~_Val>) Int)
(declare-fun get_Pair_snd<Val> (Pair<Int~_Val>) Val)
(declare-fun Pair_tag<Int> (Pair<Int~_Val>) Int)
(declare-fun decreasing<Bool> (List<Val> List<Val>) Bool)
(declare-fun bounded<Bool> (List<Val>) Bool)
(declare-const DNil<DList<Int~_Val>> DList<Int~_Val>)
(declare-fun DCons<DList<Int~_Val>> (Int Val DList<Int~_Val>) DList<Int~_Val>)
(declare-fun get_DList_dvalue1<Int> (DList<Int~_Val>) Int)
(declare-fun get_DList_dvalue2<Val> (DList<Int~_Val>) Val)
(declare-fun get_DList_dtail<DList<Int~_Val>> (DList<Int~_Val>) DList<Int~_Val>)
(declare-fun DList_tag<Int> (DList<Int~_Val>) Int)
(declare-fun decreasing<Bool> (IntList IntList) Bool)
(declare-fun bounded<Bool> (IntList) Bool)
(declare-const INil<IntList> IntList)
(declare-fun ICons<IntList> (Int IntList) IntList)
(declare-fun get_IntList_ivalue<Int> (IntList) Int)
(declare-fun get_IntList_itail<IntList> (IntList) IntList)
(declare-fun IntList_tag<Int> (IntList) Int)
(declare-const Nil<List<Val>> List<Val>)
(declare-fun Cons<List<Val>> (Val List<Val>) List<Val>)
(declare-fun get_List_value<Val> (List<Val>) Val)
(declare-fun get_List_tail<List<Val>> (List<Val>) List<Val>)
(declare-fun List_tag<Int> (List<Val>) Int)
(declare-fun decreasing<Bool> (DList<Int~_Val> DList<Int~_Val>) Bool)
(declare-fun bounded<Bool> (DList<Int~_Val>) Bool)
; Declaring symbols related to program functions (from program analysis)
(declare-fun lenBad ($Snap List<Val> Val) Int)
(declare-fun lenBad%limited ($Snap List<Val> Val) Int)
(declare-fun lenBad%stateless (List<Val> Val) Bool)
(declare-fun lenBad%precondition ($Snap List<Val> Val) Bool)
(declare-fun len ($Snap List<Val>) Int)
(declare-fun len%limited ($Snap List<Val>) Int)
(declare-fun len%stateless (List<Val>) Bool)
(declare-fun len%precondition ($Snap List<Val>) Bool)
(declare-fun ilen2 ($Snap IntList) Int)
(declare-fun ilen2%limited ($Snap IntList) Int)
(declare-fun ilen2%stateless (IntList) Bool)
(declare-fun ilen2%precondition ($Snap IntList) Bool)
(declare-fun stupidFunc ($Snap Pair<Int~_Val>) Val)
(declare-fun stupidFunc%limited ($Snap Pair<Int~_Val>) Val)
(declare-fun stupidFunc%stateless (Pair<Int~_Val>) Bool)
(declare-fun stupidFunc%precondition ($Snap Pair<Int~_Val>) Bool)
(declare-fun lenBad2 ($Snap List<Val>) Int)
(declare-fun lenBad2%limited ($Snap List<Val>) Int)
(declare-fun lenBad2%stateless (List<Val>) Bool)
(declare-fun lenBad2%precondition ($Snap List<Val>) Bool)
(declare-fun dlen ($Snap DList<Int~_Val>) Int)
(declare-fun dlen%limited ($Snap DList<Int~_Val>) Int)
(declare-fun dlen%stateless (DList<Int~_Val>) Bool)
(declare-fun dlen%precondition ($Snap DList<Int~_Val>) Bool)
(declare-fun ilenBad ($Snap IntList Int) Int)
(declare-fun ilenBad%limited ($Snap IntList Int) Int)
(declare-fun ilenBad%stateless (IntList Int) Bool)
(declare-fun ilenBad%precondition ($Snap IntList Int) Bool)
(declare-fun ilen ($Snap IntList) Int)
(declare-fun ilen%limited ($Snap IntList) Int)
(declare-fun ilen%stateless (IntList) Bool)
(declare-fun ilen%precondition ($Snap IntList) Bool)
(declare-fun dlenBad ($Snap DList<Int~_Val>) Int)
(declare-fun dlenBad%limited ($Snap DList<Int~_Val>) Int)
(declare-fun dlenBad%stateless (DList<Int~_Val>) Bool)
(declare-fun dlenBad%precondition ($Snap DList<Int~_Val>) Bool)
(declare-fun len2 ($Snap List<Val>) Int)
(declare-fun len2%limited ($Snap List<Val>) Int)
(declare-fun len2%stateless (List<Val>) Bool)
(declare-fun len2%precondition ($Snap List<Val>) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((fst Int) (snd Val)) (!
  (= fst (get_Pair_fst<Int> (pair<Pair<Int~_Val>> fst snd)))
  :pattern ((pair<Pair<Int~_Val>> fst snd))
  )))
(assert (forall ((fst Int) (snd Val)) (!
  (= snd (get_Pair_snd<Val> (pair<Pair<Int~_Val>> fst snd)))
  :pattern ((pair<Pair<Int~_Val>> fst snd))
  )))
(assert (forall ((fst Int) (snd Val)) (!
  (= (Pair_tag<Int> (pair<Pair<Int~_Val>> fst snd)) 0)
  :pattern ((pair<Pair<Int~_Val>> fst snd))
  )))
(assert (forall ((t Pair<Int~_Val>)) (!
  (= t (pair<Pair<Int~_Val>> (get_Pair_fst<Int> t) (get_Pair_snd<Val> t)))
  :pattern ((Pair_tag<Int> t))
  :pattern ((get_Pair_fst<Int> t))
  :pattern ((get_Pair_snd<Val> t))
  )))
(assert true)
(assert (forall ((dtail_0 DList<Int~_Val>) (dvalue1 Int) (dvalue2 Val)) (!
  (decreasing<Bool> dtail_0 (DCons<DList<Int~_Val>> dvalue1 dvalue2 dtail_0))
  :pattern ((DCons<DList<Int~_Val>> dvalue1 dvalue2 dtail_0))
  )))
(assert (forall ((v1 DList<Int~_Val>) (v2 DList<Int~_Val>) (v3 DList<Int~_Val>)) (!
  (=>
    (and (decreasing<Bool> v1 v2) (decreasing<Bool> v2 v3))
    (decreasing<Bool> v1 v3))
  :pattern ((decreasing<Bool> v1 v2) (decreasing<Bool> v2 v3))
  )))
(assert (forall ((x DList<Int~_Val>)) (!
  (bounded<Bool> x)
  :pattern ((bounded<Bool> x))
  )))
(assert (forall ((dvalue1 Int) (dvalue2 Val) (dtail DList<Int~_Val>)) (!
  (=
    dvalue1
    (get_DList_dvalue1<Int> (DCons<DList<Int~_Val>> dvalue1 dvalue2 dtail)))
  :pattern ((DCons<DList<Int~_Val>> dvalue1 dvalue2 dtail))
  )))
(assert (forall ((dvalue1 Int) (dvalue2 Val) (dtail DList<Int~_Val>)) (!
  (=
    dvalue2
    (get_DList_dvalue2<Val> (DCons<DList<Int~_Val>> dvalue1 dvalue2 dtail)))
  :pattern ((DCons<DList<Int~_Val>> dvalue1 dvalue2 dtail))
  )))
(assert (forall ((dvalue1 Int) (dvalue2 Val) (dtail DList<Int~_Val>)) (!
  (=
    dtail
    (get_DList_dtail<DList<Int~_Val>> (DCons<DList<Int~_Val>> dvalue1 dvalue2 dtail)))
  :pattern ((DCons<DList<Int~_Val>> dvalue1 dvalue2 dtail))
  )))
(assert (= (DList_tag<Int> (as DNil<DList<Int~_Val>>  DList<Int~_Val>)) 1))
(assert (forall ((dvalue1 Int) (dvalue2 Val) (dtail DList<Int~_Val>)) (!
  (= (DList_tag<Int> (DCons<DList<Int~_Val>> dvalue1 dvalue2 dtail)) 0)
  :pattern ((DCons<DList<Int~_Val>> dvalue1 dvalue2 dtail))
  )))
(assert (forall ((t DList<Int~_Val>)) (!
  (or
    (= t (as DNil<DList<Int~_Val>>  DList<Int~_Val>))
    (=
      t
      (DCons<DList<Int~_Val>> (get_DList_dvalue1<Int> t) (get_DList_dvalue2<Val> t) (get_DList_dtail<DList<Int~_Val>> t))))
  :pattern ((DList_tag<Int> t))
  :pattern ((get_DList_dvalue1<Int> t))
  :pattern ((get_DList_dvalue2<Val> t))
  :pattern ((get_DList_dtail<DList<Int~_Val>> t))
  )))
(assert (forall ((ivalue Int) (itail IntList)) (!
  (= ivalue (get_IntList_ivalue<Int> (ICons<IntList> ivalue itail)))
  :pattern ((ICons<IntList> ivalue itail))
  )))
(assert (forall ((ivalue Int) (itail IntList)) (!
  (= itail (get_IntList_itail<IntList> (ICons<IntList> ivalue itail)))
  :pattern ((ICons<IntList> ivalue itail))
  )))
(assert (= (IntList_tag<Int> (as INil<IntList>  IntList)) 1))
(assert (forall ((ivalue Int) (itail IntList)) (!
  (= (IntList_tag<Int> (ICons<IntList> ivalue itail)) 0)
  :pattern ((ICons<IntList> ivalue itail))
  )))
(assert (forall ((t IntList)) (!
  (or
    (= t (as INil<IntList>  IntList))
    (=
      t
      (ICons<IntList> (get_IntList_ivalue<Int> t) (get_IntList_itail<IntList> t))))
  :pattern ((IntList_tag<Int> t))
  :pattern ((get_IntList_ivalue<Int> t))
  :pattern ((get_IntList_itail<IntList> t))
  )))
(assert (forall ((value Val) (tail List<Val>)) (!
  (= value (get_List_value<Val> (Cons<List<Val>> value tail)))
  :pattern ((Cons<List<Val>> value tail))
  )))
(assert (forall ((value Val) (tail List<Val>)) (!
  (= tail (get_List_tail<List<Val>> (Cons<List<Val>> value tail)))
  :pattern ((Cons<List<Val>> value tail))
  )))
(assert (= (List_tag<Int> (as Nil<List<Val>>  List<Val>)) 1))
(assert (forall ((value Val) (tail List<Val>)) (!
  (= (List_tag<Int> (Cons<List<Val>> value tail)) 0)
  :pattern ((Cons<List<Val>> value tail))
  )))
(assert (forall ((t List<Val>)) (!
  (or
    (= t (as Nil<List<Val>>  List<Val>))
    (= t (Cons<List<Val>> (get_List_value<Val> t) (get_List_tail<List<Val>> t))))
  :pattern ((List_tag<Int> t))
  :pattern ((get_List_value<Val> t))
  :pattern ((get_List_tail<List<Val>> t))
  )))
(assert (forall ((itail_0 IntList) (ivalue Int)) (!
  (decreasing<Bool> itail_0 (ICons<IntList> ivalue itail_0))
  :pattern ((ICons<IntList> ivalue itail_0))
  )))
(assert (forall ((v1 IntList) (v2 IntList) (v3 IntList)) (!
  (=>
    (and (decreasing<Bool> v1 v2) (decreasing<Bool> v2 v3))
    (decreasing<Bool> v1 v3))
  :pattern ((decreasing<Bool> v1 v2) (decreasing<Bool> v2 v3))
  )))
(assert (forall ((x IntList)) (!
  (bounded<Bool> x)
  :pattern ((bounded<Bool> x))
  )))
(assert (forall ((tail_0 List<Val>) (value Val)) (!
  (decreasing<Bool> tail_0 (Cons<List<Val>> value tail_0))
  :pattern ((Cons<List<Val>> value tail_0))
  )))
(assert (forall ((v1 List<Val>) (v2 List<Val>) (v3 List<Val>)) (!
  (=>
    (and (decreasing<Bool> v1 v2) (decreasing<Bool> v2 v3))
    (decreasing<Bool> v1 v3))
  :pattern ((decreasing<Bool> v1 v2) (decreasing<Bool> v2 v3))
  )))
(assert (forall ((x List<Val>)) (!
  (bounded<Bool> x)
  :pattern ((bounded<Bool> x))
  )))
(assert (forall ((v1 Pair<Int~_Val>) (v2 Pair<Int~_Val>) (v3 Pair<Int~_Val>)) (!
  (=>
    (and (decreasing<Bool> v1 v2) (decreasing<Bool> v2 v3))
    (decreasing<Bool> v1 v3))
  :pattern ((decreasing<Bool> v1 v2) (decreasing<Bool> v2 v3))
  )))
(assert (forall ((x Pair<Int~_Val>)) (!
  (bounded<Bool> x)
  :pattern ((bounded<Bool> x))
  )))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ---------- FUNCTION lenBad----------
(declare-fun l@0@00 () List<Val>)
(declare-fun v@1@00 () Val)
(declare-fun result@2@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(declare-const $t@22@00 $Snap)
(assert (= $t@22@00 $Snap.unit))
; [eval] result >= 0
(assert (>= result@2@00 0))
(pop) ; 1
(assert (forall ((s@$ $Snap) (l@0@00 List<Val>) (v@1@00 Val)) (!
  (= (lenBad%limited s@$ l@0@00 v@1@00) (lenBad s@$ l@0@00 v@1@00))
  :pattern ((lenBad s@$ l@0@00 v@1@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (l@0@00 List<Val>) (v@1@00 Val)) (!
  (lenBad%stateless l@0@00 v@1@00)
  :pattern ((lenBad%limited s@$ l@0@00 v@1@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (l@0@00 List<Val>) (v@1@00 Val)) (!
  (let ((result@2@00 (lenBad%limited s@$ l@0@00 v@1@00))) (=>
    (lenBad%precondition s@$ l@0@00 v@1@00)
    (>= result@2@00 0)))
  :pattern ((lenBad%limited s@$ l@0@00 v@1@00))
  :qid |quant-u-20|)))
(assert (forall ((s@$ $Snap) (l@0@00 List<Val>) (v@1@00 Val)) (!
  (let ((result@2@00 (lenBad%limited s@$ l@0@00 v@1@00))) true)
  :pattern ((lenBad%limited s@$ l@0@00 v@1@00))
  :qid |quant-u-21|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] lenBad((Cons(v, (Nil(): List[Val])): List[Val]), v)
; [eval] (Cons(v, (Nil(): List[Val])): List[Val])
; [eval] (Nil(): List[Val])
(set-option :timeout 0)
(push) ; 2
(assert (lenBad%precondition $Snap.unit (Cons<List<Val>> v@1@00 (as Nil<List<Val>>  List<Val>)) v@1@00))
(pop) ; 2
; Joined path conditions
(assert (lenBad%precondition $Snap.unit (Cons<List<Val>> v@1@00 (as Nil<List<Val>>  List<Val>)) v@1@00))
(assert (=
  result@2@00
  (lenBad $Snap.unit (Cons<List<Val>> v@1@00 (as Nil<List<Val>>  List<Val>)) v@1@00)))
; [eval] result >= 0
(push) ; 2
(assert (not (>= result@2@00 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (>= result@2@00 0))
(pop) ; 1
(assert (forall ((s@$ $Snap) (l@0@00 List<Val>) (v@1@00 Val)) (!
  (=>
    (lenBad%precondition s@$ l@0@00 v@1@00)
    (=
      (lenBad s@$ l@0@00 v@1@00)
      (lenBad%limited $Snap.unit (Cons<List<Val>> v@1@00 (as Nil<List<Val>>  List<Val>)) v@1@00)))
  :pattern ((lenBad s@$ l@0@00 v@1@00))
  :qid |quant-u-22|)))
(assert (forall ((s@$ $Snap) (l@0@00 List<Val>) (v@1@00 Val)) (!
  (=>
    (lenBad%precondition s@$ l@0@00 v@1@00)
    (lenBad%precondition $Snap.unit (Cons<List<Val>> v@1@00 (as Nil<List<Val>>  List<Val>)) v@1@00))
  :pattern ((lenBad s@$ l@0@00 v@1@00))
  :qid |quant-u-23|)))
; ---------- FUNCTION len----------
(declare-fun l@3@00 () List<Val>)
(declare-fun result@4@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const $t@23@00 $Snap)
(assert (= $t@23@00 $Snap.unit))
; [eval] result >= 0
(assert (>= result@4@00 0))
(pop) ; 1
(assert (forall ((s@$ $Snap) (l@3@00 List<Val>)) (!
  (= (len%limited s@$ l@3@00) (len s@$ l@3@00))
  :pattern ((len s@$ l@3@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (l@3@00 List<Val>)) (!
  (len%stateless l@3@00)
  :pattern ((len%limited s@$ l@3@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (l@3@00 List<Val>)) (!
  (let ((result@4@00 (len%limited s@$ l@3@00))) (=>
    (len%precondition s@$ l@3@00)
    (>= result@4@00 0)))
  :pattern ((len%limited s@$ l@3@00))
  :qid |quant-u-24|)))
(assert (forall ((s@$ $Snap) (l@3@00 List<Val>)) (!
  (let ((result@4@00 (len%limited s@$ l@3@00))) true)
  :pattern ((len%limited s@$ l@3@00))
  :qid |quant-u-25|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] ((List_tag(l): Int) == 1 ? 0 : 1 + len((get_List_tail(l): List[Val])))
; [eval] (List_tag(l): Int) == 1
; [eval] (List_tag(l): Int)
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= (List_tag<Int> l@3@00) 1))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (List_tag<Int> l@3@00) 1)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | List_tag[Int](l@3@00) == 1 | live]
; [else-branch: 0 | List_tag[Int](l@3@00) != 1 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | List_tag[Int](l@3@00) == 1]
(assert (= (List_tag<Int> l@3@00) 1))
(pop) ; 3
(push) ; 3
; [else-branch: 0 | List_tag[Int](l@3@00) != 1]
(assert (not (= (List_tag<Int> l@3@00) 1)))
; [eval] 1 + len((get_List_tail(l): List[Val]))
; [eval] len((get_List_tail(l): List[Val]))
; [eval] (get_List_tail(l): List[Val])
(push) ; 4
(assert (len%precondition $Snap.unit (get_List_tail<List<Val>> l@3@00)))
(pop) ; 4
; Joined path conditions
(assert (len%precondition $Snap.unit (get_List_tail<List<Val>> l@3@00)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= (List_tag<Int> l@3@00) 1))
  (and
    (not (= (List_tag<Int> l@3@00) 1))
    (len%precondition $Snap.unit (get_List_tail<List<Val>> l@3@00)))))
(assert (or (not (= (List_tag<Int> l@3@00) 1)) (= (List_tag<Int> l@3@00) 1)))
(assert (=
  result@4@00
  (ite
    (= (List_tag<Int> l@3@00) 1)
    0
    (+ 1 (len $Snap.unit (get_List_tail<List<Val>> l@3@00))))))
; [eval] result >= 0
(push) ; 2
(assert (not (>= result@4@00 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (>= result@4@00 0))
(pop) ; 1
(assert (forall ((s@$ $Snap) (l@3@00 List<Val>)) (!
  (=>
    (len%precondition s@$ l@3@00)
    (=
      (len s@$ l@3@00)
      (ite
        (= (List_tag<Int> l@3@00) 1)
        0
        (+ 1 (len%limited $Snap.unit (get_List_tail<List<Val>> l@3@00))))))
  :pattern ((len s@$ l@3@00))
  :qid |quant-u-26|)))
(assert (forall ((s@$ $Snap) (l@3@00 List<Val>)) (!
  (=>
    (len%precondition s@$ l@3@00)
    (ite
      (= (List_tag<Int> l@3@00) 1)
      true
      (len%precondition $Snap.unit (get_List_tail<List<Val>> l@3@00))))
  :pattern ((len s@$ l@3@00))
  :qid |quant-u-27|)))
; ---------- FUNCTION ilen2----------
(declare-fun l@5@00 () IntList)
(declare-fun result@6@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const $t@24@00 $Snap)
(assert (= $t@24@00 $Snap.unit))
; [eval] result >= 0
(assert (>= result@6@00 0))
(pop) ; 1
(assert (forall ((s@$ $Snap) (l@5@00 IntList)) (!
  (= (ilen2%limited s@$ l@5@00) (ilen2 s@$ l@5@00))
  :pattern ((ilen2 s@$ l@5@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (l@5@00 IntList)) (!
  (ilen2%stateless l@5@00)
  :pattern ((ilen2%limited s@$ l@5@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (l@5@00 IntList)) (!
  (let ((result@6@00 (ilen2%limited s@$ l@5@00))) (=>
    (ilen2%precondition s@$ l@5@00)
    (>= result@6@00 0)))
  :pattern ((ilen2%limited s@$ l@5@00))
  :qid |quant-u-28|)))
(assert (forall ((s@$ $Snap) (l@5@00 IntList)) (!
  (let ((result@6@00 (ilen2%limited s@$ l@5@00))) true)
  :pattern ((ilen2%limited s@$ l@5@00))
  :qid |quant-u-29|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (IntList_tag(l) == 1 ? 0 : (IntList_tag(get_IntList_itail(l)) == 1 ? 1 : 2 + ilen2(get_IntList_itail(get_IntList_itail(l)))))
; [eval] IntList_tag(l) == 1
; [eval] IntList_tag(l)
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= (IntList_tag<Int> l@5@00) 1))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (IntList_tag<Int> l@5@00) 1)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | IntList_tag[Int](l@5@00) == 1 | live]
; [else-branch: 1 | IntList_tag[Int](l@5@00) != 1 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | IntList_tag[Int](l@5@00) == 1]
(assert (= (IntList_tag<Int> l@5@00) 1))
(pop) ; 3
(push) ; 3
; [else-branch: 1 | IntList_tag[Int](l@5@00) != 1]
(assert (not (= (IntList_tag<Int> l@5@00) 1)))
; [eval] (IntList_tag(get_IntList_itail(l)) == 1 ? 1 : 2 + ilen2(get_IntList_itail(get_IntList_itail(l))))
; [eval] IntList_tag(get_IntList_itail(l)) == 1
; [eval] IntList_tag(get_IntList_itail(l))
; [eval] get_IntList_itail(l)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= (IntList_tag<Int> (get_IntList_itail<IntList> l@5@00)) 1))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (IntList_tag<Int> (get_IntList_itail<IntList> l@5@00)) 1)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | IntList_tag[Int](get_IntList_itail[IntList](l@5@00)) == 1 | live]
; [else-branch: 2 | IntList_tag[Int](get_IntList_itail[IntList](l@5@00)) != 1 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 2 | IntList_tag[Int](get_IntList_itail[IntList](l@5@00)) == 1]
(assert (= (IntList_tag<Int> (get_IntList_itail<IntList> l@5@00)) 1))
(pop) ; 5
(push) ; 5
; [else-branch: 2 | IntList_tag[Int](get_IntList_itail[IntList](l@5@00)) != 1]
(assert (not (= (IntList_tag<Int> (get_IntList_itail<IntList> l@5@00)) 1)))
; [eval] 2 + ilen2(get_IntList_itail(get_IntList_itail(l)))
; [eval] ilen2(get_IntList_itail(get_IntList_itail(l)))
; [eval] get_IntList_itail(get_IntList_itail(l))
; [eval] get_IntList_itail(l)
(push) ; 6
(assert (ilen2%precondition $Snap.unit (get_IntList_itail<IntList> (get_IntList_itail<IntList> l@5@00))))
(pop) ; 6
; Joined path conditions
(assert (ilen2%precondition $Snap.unit (get_IntList_itail<IntList> (get_IntList_itail<IntList> l@5@00))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= (IntList_tag<Int> (get_IntList_itail<IntList> l@5@00)) 1))
  (and
    (not (= (IntList_tag<Int> (get_IntList_itail<IntList> l@5@00)) 1))
    (ilen2%precondition $Snap.unit (get_IntList_itail<IntList> (get_IntList_itail<IntList> l@5@00))))))
(assert (or
  (not (= (IntList_tag<Int> (get_IntList_itail<IntList> l@5@00)) 1))
  (= (IntList_tag<Int> (get_IntList_itail<IntList> l@5@00)) 1)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= (IntList_tag<Int> l@5@00) 1))
  (and
    (not (= (IntList_tag<Int> l@5@00) 1))
    (=>
      (not (= (IntList_tag<Int> (get_IntList_itail<IntList> l@5@00)) 1))
      (and
        (not (= (IntList_tag<Int> (get_IntList_itail<IntList> l@5@00)) 1))
        (ilen2%precondition $Snap.unit (get_IntList_itail<IntList> (get_IntList_itail<IntList> l@5@00)))))
    (or
      (not (= (IntList_tag<Int> (get_IntList_itail<IntList> l@5@00)) 1))
      (= (IntList_tag<Int> (get_IntList_itail<IntList> l@5@00)) 1)))))
(assert (or (not (= (IntList_tag<Int> l@5@00) 1)) (= (IntList_tag<Int> l@5@00) 1)))
(assert (=
  result@6@00
  (ite
    (= (IntList_tag<Int> l@5@00) 1)
    0
    (ite
      (= (IntList_tag<Int> (get_IntList_itail<IntList> l@5@00)) 1)
      1
      (+
        2
        (ilen2 $Snap.unit (get_IntList_itail<IntList> (get_IntList_itail<IntList> l@5@00))))))))
; [eval] result >= 0
(push) ; 2
(assert (not (>= result@6@00 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (>= result@6@00 0))
(pop) ; 1
(assert (forall ((s@$ $Snap) (l@5@00 IntList)) (!
  (=>
    (ilen2%precondition s@$ l@5@00)
    (=
      (ilen2 s@$ l@5@00)
      (ite
        (= (IntList_tag<Int> l@5@00) 1)
        0
        (ite
          (= (IntList_tag<Int> (get_IntList_itail<IntList> l@5@00)) 1)
          1
          (+
            2
            (ilen2%limited $Snap.unit (get_IntList_itail<IntList> (get_IntList_itail<IntList> l@5@00))))))))
  :pattern ((ilen2 s@$ l@5@00))
  :qid |quant-u-30|)))
(assert (forall ((s@$ $Snap) (l@5@00 IntList)) (!
  (=>
    (ilen2%precondition s@$ l@5@00)
    (ite
      (= (IntList_tag<Int> l@5@00) 1)
      true
      (ite
        (= (IntList_tag<Int> (get_IntList_itail<IntList> l@5@00)) 1)
        true
        (ilen2%precondition $Snap.unit (get_IntList_itail<IntList> (get_IntList_itail<IntList> l@5@00))))))
  :pattern ((ilen2 s@$ l@5@00))
  :qid |quant-u-31|)))
; ---------- FUNCTION stupidFunc----------
(declare-fun p@7@00 () Pair<Int~_Val>)
(declare-fun result@8@00 () Val)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (p@7@00 Pair<Int~_Val>)) (!
  (= (stupidFunc%limited s@$ p@7@00) (stupidFunc s@$ p@7@00))
  :pattern ((stupidFunc s@$ p@7@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (p@7@00 Pair<Int~_Val>)) (!
  (stupidFunc%stateless p@7@00)
  :pattern ((stupidFunc%limited s@$ p@7@00))
  :qid |quant-u-7|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] stupidFunc(p)
(set-option :timeout 0)
(push) ; 2
(assert (stupidFunc%precondition $Snap.unit p@7@00))
(pop) ; 2
; Joined path conditions
(assert (stupidFunc%precondition $Snap.unit p@7@00))
(assert (= result@8@00 (stupidFunc $Snap.unit p@7@00)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (p@7@00 Pair<Int~_Val>)) (!
  (=>
    (stupidFunc%precondition s@$ p@7@00)
    (= (stupidFunc s@$ p@7@00) (stupidFunc%limited $Snap.unit p@7@00)))
  :pattern ((stupidFunc s@$ p@7@00))
  :qid |quant-u-32|)))
(assert (forall ((s@$ $Snap) (p@7@00 Pair<Int~_Val>)) (!
  (=>
    (stupidFunc%precondition s@$ p@7@00)
    (stupidFunc%precondition $Snap.unit p@7@00))
  :pattern ((stupidFunc s@$ p@7@00))
  :qid |quant-u-33|)))
; ---------- FUNCTION lenBad2----------
(declare-fun l@9@00 () List<Val>)
(declare-fun result@10@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const $t@25@00 $Snap)
(assert (= $t@25@00 $Snap.unit))
; [eval] result >= 0
(assert (>= result@10@00 0))
(pop) ; 1
(assert (forall ((s@$ $Snap) (l@9@00 List<Val>)) (!
  (= (lenBad2%limited s@$ l@9@00) (lenBad2 s@$ l@9@00))
  :pattern ((lenBad2 s@$ l@9@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (l@9@00 List<Val>)) (!
  (lenBad2%stateless l@9@00)
  :pattern ((lenBad2%limited s@$ l@9@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (l@9@00 List<Val>)) (!
  (let ((result@10@00 (lenBad2%limited s@$ l@9@00))) (=>
    (lenBad2%precondition s@$ l@9@00)
    (>= result@10@00 0)))
  :pattern ((lenBad2%limited s@$ l@9@00))
  :qid |quant-u-34|)))
(assert (forall ((s@$ $Snap) (l@9@00 List<Val>)) (!
  (let ((result@10@00 (lenBad2%limited s@$ l@9@00))) true)
  :pattern ((lenBad2%limited s@$ l@9@00))
  :qid |quant-u-35|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] 1 + lenBad2(l)
; [eval] lenBad2(l)
(set-option :timeout 0)
(push) ; 2
(assert (lenBad2%precondition $Snap.unit l@9@00))
(pop) ; 2
; Joined path conditions
(assert (lenBad2%precondition $Snap.unit l@9@00))
(assert (= result@10@00 (+ 1 (lenBad2 $Snap.unit l@9@00))))
; [eval] result >= 0
(push) ; 2
(assert (not (>= result@10@00 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (>= result@10@00 0))
(pop) ; 1
(assert (forall ((s@$ $Snap) (l@9@00 List<Val>)) (!
  (=>
    (lenBad2%precondition s@$ l@9@00)
    (= (lenBad2 s@$ l@9@00) (+ 1 (lenBad2%limited $Snap.unit l@9@00))))
  :pattern ((lenBad2 s@$ l@9@00))
  :qid |quant-u-36|)))
(assert (forall ((s@$ $Snap) (l@9@00 List<Val>)) (!
  (=> (lenBad2%precondition s@$ l@9@00) (lenBad2%precondition $Snap.unit l@9@00))
  :pattern ((lenBad2 s@$ l@9@00))
  :qid |quant-u-37|)))
; ---------- FUNCTION dlen----------
(declare-fun l@11@00 () DList<Int~_Val>)
(declare-fun result@12@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const $t@26@00 $Snap)
(assert (= $t@26@00 $Snap.unit))
; [eval] result >= 0
(assert (>= result@12@00 0))
(pop) ; 1
(assert (forall ((s@$ $Snap) (l@11@00 DList<Int~_Val>)) (!
  (= (dlen%limited s@$ l@11@00) (dlen s@$ l@11@00))
  :pattern ((dlen s@$ l@11@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (l@11@00 DList<Int~_Val>)) (!
  (dlen%stateless l@11@00)
  :pattern ((dlen%limited s@$ l@11@00))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap) (l@11@00 DList<Int~_Val>)) (!
  (let ((result@12@00 (dlen%limited s@$ l@11@00))) (=>
    (dlen%precondition s@$ l@11@00)
    (>= result@12@00 0)))
  :pattern ((dlen%limited s@$ l@11@00))
  :qid |quant-u-38|)))
(assert (forall ((s@$ $Snap) (l@11@00 DList<Int~_Val>)) (!
  (let ((result@12@00 (dlen%limited s@$ l@11@00))) true)
  :pattern ((dlen%limited s@$ l@11@00))
  :qid |quant-u-39|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] ((DList_tag(l): Int) == 1 ? 0 : 1 + dlen((get_DList_dtail(l): DList[Int, Val])))
; [eval] (DList_tag(l): Int) == 1
; [eval] (DList_tag(l): Int)
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= (DList_tag<Int> l@11@00) 1))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (DList_tag<Int> l@11@00) 1)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | DList_tag[Int](l@11@00) == 1 | live]
; [else-branch: 3 | DList_tag[Int](l@11@00) != 1 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 3 | DList_tag[Int](l@11@00) == 1]
(assert (= (DList_tag<Int> l@11@00) 1))
(pop) ; 3
(push) ; 3
; [else-branch: 3 | DList_tag[Int](l@11@00) != 1]
(assert (not (= (DList_tag<Int> l@11@00) 1)))
; [eval] 1 + dlen((get_DList_dtail(l): DList[Int, Val]))
; [eval] dlen((get_DList_dtail(l): DList[Int, Val]))
; [eval] (get_DList_dtail(l): DList[Int, Val])
(push) ; 4
(assert (dlen%precondition $Snap.unit (get_DList_dtail<DList<Int~_Val>> l@11@00)))
(pop) ; 4
; Joined path conditions
(assert (dlen%precondition $Snap.unit (get_DList_dtail<DList<Int~_Val>> l@11@00)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= (DList_tag<Int> l@11@00) 1))
  (and
    (not (= (DList_tag<Int> l@11@00) 1))
    (dlen%precondition $Snap.unit (get_DList_dtail<DList<Int~_Val>> l@11@00)))))
(assert (or (not (= (DList_tag<Int> l@11@00) 1)) (= (DList_tag<Int> l@11@00) 1)))
(assert (=
  result@12@00
  (ite
    (= (DList_tag<Int> l@11@00) 1)
    0
    (+ 1 (dlen $Snap.unit (get_DList_dtail<DList<Int~_Val>> l@11@00))))))
; [eval] result >= 0
(push) ; 2
(assert (not (>= result@12@00 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (>= result@12@00 0))
(pop) ; 1
(assert (forall ((s@$ $Snap) (l@11@00 DList<Int~_Val>)) (!
  (=>
    (dlen%precondition s@$ l@11@00)
    (=
      (dlen s@$ l@11@00)
      (ite
        (= (DList_tag<Int> l@11@00) 1)
        0
        (+
          1
          (dlen%limited $Snap.unit (get_DList_dtail<DList<Int~_Val>> l@11@00))))))
  :pattern ((dlen s@$ l@11@00))
  :qid |quant-u-40|)))
(assert (forall ((s@$ $Snap) (l@11@00 DList<Int~_Val>)) (!
  (=>
    (dlen%precondition s@$ l@11@00)
    (ite
      (= (DList_tag<Int> l@11@00) 1)
      true
      (dlen%precondition $Snap.unit (get_DList_dtail<DList<Int~_Val>> l@11@00))))
  :pattern ((dlen s@$ l@11@00))
  :qid |quant-u-41|)))
; ---------- FUNCTION ilenBad----------
(declare-fun l@13@00 () IntList)
(declare-fun v@14@00 () Int)
(declare-fun result@15@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const $t@27@00 $Snap)
(assert (= $t@27@00 $Snap.unit))
; [eval] result >= 0
(assert (>= result@15@00 0))
(pop) ; 1
(assert (forall ((s@$ $Snap) (l@13@00 IntList) (v@14@00 Int)) (!
  (= (ilenBad%limited s@$ l@13@00 v@14@00) (ilenBad s@$ l@13@00 v@14@00))
  :pattern ((ilenBad s@$ l@13@00 v@14@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (l@13@00 IntList) (v@14@00 Int)) (!
  (ilenBad%stateless l@13@00 v@14@00)
  :pattern ((ilenBad%limited s@$ l@13@00 v@14@00))
  :qid |quant-u-13|)))
(assert (forall ((s@$ $Snap) (l@13@00 IntList) (v@14@00 Int)) (!
  (let ((result@15@00 (ilenBad%limited s@$ l@13@00 v@14@00))) (=>
    (ilenBad%precondition s@$ l@13@00 v@14@00)
    (>= result@15@00 0)))
  :pattern ((ilenBad%limited s@$ l@13@00 v@14@00))
  :qid |quant-u-42|)))
(assert (forall ((s@$ $Snap) (l@13@00 IntList) (v@14@00 Int)) (!
  (let ((result@15@00 (ilenBad%limited s@$ l@13@00 v@14@00))) true)
  :pattern ((ilenBad%limited s@$ l@13@00 v@14@00))
  :qid |quant-u-43|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] ilenBad(ICons(v, INil()), v)
; [eval] ICons(v, INil())
; [eval] INil()
(set-option :timeout 0)
(push) ; 2
(assert (ilenBad%precondition $Snap.unit (ICons<IntList> v@14@00 (as INil<IntList>  IntList)) v@14@00))
(pop) ; 2
; Joined path conditions
(assert (ilenBad%precondition $Snap.unit (ICons<IntList> v@14@00 (as INil<IntList>  IntList)) v@14@00))
(assert (=
  result@15@00
  (ilenBad $Snap.unit (ICons<IntList> v@14@00 (as INil<IntList>  IntList)) v@14@00)))
; [eval] result >= 0
(push) ; 2
(assert (not (>= result@15@00 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (>= result@15@00 0))
(pop) ; 1
(assert (forall ((s@$ $Snap) (l@13@00 IntList) (v@14@00 Int)) (!
  (=>
    (ilenBad%precondition s@$ l@13@00 v@14@00)
    (=
      (ilenBad s@$ l@13@00 v@14@00)
      (ilenBad%limited $Snap.unit (ICons<IntList> v@14@00 (as INil<IntList>  IntList)) v@14@00)))
  :pattern ((ilenBad s@$ l@13@00 v@14@00))
  :qid |quant-u-44|)))
(assert (forall ((s@$ $Snap) (l@13@00 IntList) (v@14@00 Int)) (!
  (=>
    (ilenBad%precondition s@$ l@13@00 v@14@00)
    (ilenBad%precondition $Snap.unit (ICons<IntList> v@14@00 (as INil<IntList>  IntList)) v@14@00))
  :pattern ((ilenBad s@$ l@13@00 v@14@00))
  :qid |quant-u-45|)))
; ---------- FUNCTION ilen----------
(declare-fun l@16@00 () IntList)
(declare-fun result@17@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const $t@28@00 $Snap)
(assert (= $t@28@00 $Snap.unit))
; [eval] result >= 0
(assert (>= result@17@00 0))
(pop) ; 1
(assert (forall ((s@$ $Snap) (l@16@00 IntList)) (!
  (= (ilen%limited s@$ l@16@00) (ilen s@$ l@16@00))
  :pattern ((ilen s@$ l@16@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (l@16@00 IntList)) (!
  (ilen%stateless l@16@00)
  :pattern ((ilen%limited s@$ l@16@00))
  :qid |quant-u-15|)))
(assert (forall ((s@$ $Snap) (l@16@00 IntList)) (!
  (let ((result@17@00 (ilen%limited s@$ l@16@00))) (=>
    (ilen%precondition s@$ l@16@00)
    (>= result@17@00 0)))
  :pattern ((ilen%limited s@$ l@16@00))
  :qid |quant-u-46|)))
(assert (forall ((s@$ $Snap) (l@16@00 IntList)) (!
  (let ((result@17@00 (ilen%limited s@$ l@16@00))) true)
  :pattern ((ilen%limited s@$ l@16@00))
  :qid |quant-u-47|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (IntList_tag(l) == 1 ? 0 : 1 + ilen(get_IntList_itail(l)))
; [eval] IntList_tag(l) == 1
; [eval] IntList_tag(l)
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= (IntList_tag<Int> l@16@00) 1))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (IntList_tag<Int> l@16@00) 1)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | IntList_tag[Int](l@16@00) == 1 | live]
; [else-branch: 4 | IntList_tag[Int](l@16@00) != 1 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 4 | IntList_tag[Int](l@16@00) == 1]
(assert (= (IntList_tag<Int> l@16@00) 1))
(pop) ; 3
(push) ; 3
; [else-branch: 4 | IntList_tag[Int](l@16@00) != 1]
(assert (not (= (IntList_tag<Int> l@16@00) 1)))
; [eval] 1 + ilen(get_IntList_itail(l))
; [eval] ilen(get_IntList_itail(l))
; [eval] get_IntList_itail(l)
(push) ; 4
(assert (ilen%precondition $Snap.unit (get_IntList_itail<IntList> l@16@00)))
(pop) ; 4
; Joined path conditions
(assert (ilen%precondition $Snap.unit (get_IntList_itail<IntList> l@16@00)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= (IntList_tag<Int> l@16@00) 1))
  (and
    (not (= (IntList_tag<Int> l@16@00) 1))
    (ilen%precondition $Snap.unit (get_IntList_itail<IntList> l@16@00)))))
(assert (or (not (= (IntList_tag<Int> l@16@00) 1)) (= (IntList_tag<Int> l@16@00) 1)))
(assert (=
  result@17@00
  (ite
    (= (IntList_tag<Int> l@16@00) 1)
    0
    (+ 1 (ilen $Snap.unit (get_IntList_itail<IntList> l@16@00))))))
; [eval] result >= 0
(push) ; 2
(assert (not (>= result@17@00 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (>= result@17@00 0))
(pop) ; 1
(assert (forall ((s@$ $Snap) (l@16@00 IntList)) (!
  (=>
    (ilen%precondition s@$ l@16@00)
    (=
      (ilen s@$ l@16@00)
      (ite
        (= (IntList_tag<Int> l@16@00) 1)
        0
        (+ 1 (ilen%limited $Snap.unit (get_IntList_itail<IntList> l@16@00))))))
  :pattern ((ilen s@$ l@16@00))
  :qid |quant-u-48|)))
(assert (forall ((s@$ $Snap) (l@16@00 IntList)) (!
  (=>
    (ilen%precondition s@$ l@16@00)
    (ite
      (= (IntList_tag<Int> l@16@00) 1)
      true
      (ilen%precondition $Snap.unit (get_IntList_itail<IntList> l@16@00))))
  :pattern ((ilen s@$ l@16@00))
  :qid |quant-u-49|)))
; ---------- FUNCTION dlenBad----------
(declare-fun l@18@00 () DList<Int~_Val>)
(declare-fun result@19@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const $t@29@00 $Snap)
(assert (= $t@29@00 $Snap.unit))
; [eval] result >= 0
(assert (>= result@19@00 0))
(pop) ; 1
(assert (forall ((s@$ $Snap) (l@18@00 DList<Int~_Val>)) (!
  (= (dlenBad%limited s@$ l@18@00) (dlenBad s@$ l@18@00))
  :pattern ((dlenBad s@$ l@18@00))
  :qid |quant-u-16|)))
(assert (forall ((s@$ $Snap) (l@18@00 DList<Int~_Val>)) (!
  (dlenBad%stateless l@18@00)
  :pattern ((dlenBad%limited s@$ l@18@00))
  :qid |quant-u-17|)))
(assert (forall ((s@$ $Snap) (l@18@00 DList<Int~_Val>)) (!
  (let ((result@19@00 (dlenBad%limited s@$ l@18@00))) (=>
    (dlenBad%precondition s@$ l@18@00)
    (>= result@19@00 0)))
  :pattern ((dlenBad%limited s@$ l@18@00))
  :qid |quant-u-50|)))
(assert (forall ((s@$ $Snap) (l@18@00 DList<Int~_Val>)) (!
  (let ((result@19@00 (dlenBad%limited s@$ l@18@00))) true)
  :pattern ((dlenBad%limited s@$ l@18@00))
  :qid |quant-u-51|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] ((DList_tag(l): Int) == 1 ? 0 : 1 + dlenBad(l))
; [eval] (DList_tag(l): Int) == 1
; [eval] (DList_tag(l): Int)
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= (DList_tag<Int> l@18@00) 1))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (DList_tag<Int> l@18@00) 1)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | DList_tag[Int](l@18@00) == 1 | live]
; [else-branch: 5 | DList_tag[Int](l@18@00) != 1 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 5 | DList_tag[Int](l@18@00) == 1]
(assert (= (DList_tag<Int> l@18@00) 1))
(pop) ; 3
(push) ; 3
; [else-branch: 5 | DList_tag[Int](l@18@00) != 1]
(assert (not (= (DList_tag<Int> l@18@00) 1)))
; [eval] 1 + dlenBad(l)
; [eval] dlenBad(l)
(push) ; 4
(assert (dlenBad%precondition $Snap.unit l@18@00))
(pop) ; 4
; Joined path conditions
(assert (dlenBad%precondition $Snap.unit l@18@00))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= (DList_tag<Int> l@18@00) 1))
  (and
    (not (= (DList_tag<Int> l@18@00) 1))
    (dlenBad%precondition $Snap.unit l@18@00))))
(assert (or (not (= (DList_tag<Int> l@18@00) 1)) (= (DList_tag<Int> l@18@00) 1)))
(assert (=
  result@19@00
  (ite (= (DList_tag<Int> l@18@00) 1) 0 (+ 1 (dlenBad $Snap.unit l@18@00)))))
; [eval] result >= 0
(push) ; 2
(assert (not (>= result@19@00 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (>= result@19@00 0))
(pop) ; 1
(assert (forall ((s@$ $Snap) (l@18@00 DList<Int~_Val>)) (!
  (=>
    (dlenBad%precondition s@$ l@18@00)
    (=
      (dlenBad s@$ l@18@00)
      (ite
        (= (DList_tag<Int> l@18@00) 1)
        0
        (+ 1 (dlenBad%limited $Snap.unit l@18@00)))))
  :pattern ((dlenBad s@$ l@18@00))
  :qid |quant-u-52|)))
(assert (forall ((s@$ $Snap) (l@18@00 DList<Int~_Val>)) (!
  (=>
    (dlenBad%precondition s@$ l@18@00)
    (ite
      (= (DList_tag<Int> l@18@00) 1)
      true
      (dlenBad%precondition $Snap.unit l@18@00)))
  :pattern ((dlenBad s@$ l@18@00))
  :qid |quant-u-53|)))
; ---------- FUNCTION len2----------
(declare-fun l@20@00 () List<Val>)
(declare-fun result@21@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const $t@30@00 $Snap)
(assert (= $t@30@00 $Snap.unit))
; [eval] result >= 0
(assert (>= result@21@00 0))
(pop) ; 1
(assert (forall ((s@$ $Snap) (l@20@00 List<Val>)) (!
  (= (len2%limited s@$ l@20@00) (len2 s@$ l@20@00))
  :pattern ((len2 s@$ l@20@00))
  :qid |quant-u-18|)))
(assert (forall ((s@$ $Snap) (l@20@00 List<Val>)) (!
  (len2%stateless l@20@00)
  :pattern ((len2%limited s@$ l@20@00))
  :qid |quant-u-19|)))
(assert (forall ((s@$ $Snap) (l@20@00 List<Val>)) (!
  (let ((result@21@00 (len2%limited s@$ l@20@00))) (=>
    (len2%precondition s@$ l@20@00)
    (>= result@21@00 0)))
  :pattern ((len2%limited s@$ l@20@00))
  :qid |quant-u-54|)))
(assert (forall ((s@$ $Snap) (l@20@00 List<Val>)) (!
  (let ((result@21@00 (len2%limited s@$ l@20@00))) true)
  :pattern ((len2%limited s@$ l@20@00))
  :qid |quant-u-55|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] ((List_tag(l): Int) == 1 ? 0 : ((List_tag((get_List_tail(l): List[Val])): Int) == 1 ? 1 : 2 + len2((get_List_tail((get_List_tail(l): List[Val])): List[Val]))))
; [eval] (List_tag(l): Int) == 1
; [eval] (List_tag(l): Int)
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= (List_tag<Int> l@20@00) 1))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (List_tag<Int> l@20@00) 1)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | List_tag[Int](l@20@00) == 1 | live]
; [else-branch: 6 | List_tag[Int](l@20@00) != 1 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 6 | List_tag[Int](l@20@00) == 1]
(assert (= (List_tag<Int> l@20@00) 1))
(pop) ; 3
(push) ; 3
; [else-branch: 6 | List_tag[Int](l@20@00) != 1]
(assert (not (= (List_tag<Int> l@20@00) 1)))
; [eval] ((List_tag((get_List_tail(l): List[Val])): Int) == 1 ? 1 : 2 + len2((get_List_tail((get_List_tail(l): List[Val])): List[Val])))
; [eval] (List_tag((get_List_tail(l): List[Val])): Int) == 1
; [eval] (List_tag((get_List_tail(l): List[Val])): Int)
; [eval] (get_List_tail(l): List[Val])
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= (List_tag<Int> (get_List_tail<List<Val>> l@20@00)) 1))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (List_tag<Int> (get_List_tail<List<Val>> l@20@00)) 1)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | List_tag[Int](get_List_tail[List[Val]](l@20@00)) == 1 | live]
; [else-branch: 7 | List_tag[Int](get_List_tail[List[Val]](l@20@00)) != 1 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 7 | List_tag[Int](get_List_tail[List[Val]](l@20@00)) == 1]
(assert (= (List_tag<Int> (get_List_tail<List<Val>> l@20@00)) 1))
(pop) ; 5
(push) ; 5
; [else-branch: 7 | List_tag[Int](get_List_tail[List[Val]](l@20@00)) != 1]
(assert (not (= (List_tag<Int> (get_List_tail<List<Val>> l@20@00)) 1)))
; [eval] 2 + len2((get_List_tail((get_List_tail(l): List[Val])): List[Val]))
; [eval] len2((get_List_tail((get_List_tail(l): List[Val])): List[Val]))
; [eval] (get_List_tail((get_List_tail(l): List[Val])): List[Val])
; [eval] (get_List_tail(l): List[Val])
(push) ; 6
(assert (len2%precondition $Snap.unit (get_List_tail<List<Val>> (get_List_tail<List<Val>> l@20@00))))
(pop) ; 6
; Joined path conditions
(assert (len2%precondition $Snap.unit (get_List_tail<List<Val>> (get_List_tail<List<Val>> l@20@00))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= (List_tag<Int> (get_List_tail<List<Val>> l@20@00)) 1))
  (and
    (not (= (List_tag<Int> (get_List_tail<List<Val>> l@20@00)) 1))
    (len2%precondition $Snap.unit (get_List_tail<List<Val>> (get_List_tail<List<Val>> l@20@00))))))
(assert (or
  (not (= (List_tag<Int> (get_List_tail<List<Val>> l@20@00)) 1))
  (= (List_tag<Int> (get_List_tail<List<Val>> l@20@00)) 1)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= (List_tag<Int> l@20@00) 1))
  (and
    (not (= (List_tag<Int> l@20@00) 1))
    (=>
      (not (= (List_tag<Int> (get_List_tail<List<Val>> l@20@00)) 1))
      (and
        (not (= (List_tag<Int> (get_List_tail<List<Val>> l@20@00)) 1))
        (len2%precondition $Snap.unit (get_List_tail<List<Val>> (get_List_tail<List<Val>> l@20@00)))))
    (or
      (not (= (List_tag<Int> (get_List_tail<List<Val>> l@20@00)) 1))
      (= (List_tag<Int> (get_List_tail<List<Val>> l@20@00)) 1)))))
(assert (or (not (= (List_tag<Int> l@20@00) 1)) (= (List_tag<Int> l@20@00) 1)))
(assert (=
  result@21@00
  (ite
    (= (List_tag<Int> l@20@00) 1)
    0
    (ite
      (= (List_tag<Int> (get_List_tail<List<Val>> l@20@00)) 1)
      1
      (+
        2
        (len2 $Snap.unit (get_List_tail<List<Val>> (get_List_tail<List<Val>> l@20@00))))))))
; [eval] result >= 0
(push) ; 2
(assert (not (>= result@21@00 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (>= result@21@00 0))
(pop) ; 1
(assert (forall ((s@$ $Snap) (l@20@00 List<Val>)) (!
  (=>
    (len2%precondition s@$ l@20@00)
    (=
      (len2 s@$ l@20@00)
      (ite
        (= (List_tag<Int> l@20@00) 1)
        0
        (ite
          (= (List_tag<Int> (get_List_tail<List<Val>> l@20@00)) 1)
          1
          (+
            2
            (len2%limited $Snap.unit (get_List_tail<List<Val>> (get_List_tail<List<Val>> l@20@00))))))))
  :pattern ((len2 s@$ l@20@00))
  :qid |quant-u-56|)))
(assert (forall ((s@$ $Snap) (l@20@00 List<Val>)) (!
  (=>
    (len2%precondition s@$ l@20@00)
    (ite
      (= (List_tag<Int> l@20@00) 1)
      true
      (ite
        (= (List_tag<Int> (get_List_tail<List<Val>> l@20@00)) 1)
        true
        (len2%precondition $Snap.unit (get_List_tail<List<Val>> (get_List_tail<List<Val>> l@20@00))))))
  :pattern ((len2 s@$ l@20@00))
  :qid |quant-u-57|)))
