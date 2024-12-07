(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:50:52
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0091.vpr
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
(declare-sort Seq<Multiset<Set<D>>> 0)
(declare-sort Seq<Seq<A>> 0)
(declare-sort Seq<A> 0)
(declare-sort Seq<Set<E>> 0)
(declare-sort Seq<Set<C>> 0)
(declare-sort Seq<B> 0)
(declare-sort Set<Seq<B>> 0)
(declare-sort Set<E> 0)
(declare-sort Set<Multiset<C>> 0)
(declare-sort Set<C> 0)
(declare-sort Set<D> 0)
(declare-sort Multiset<Set<C>> 0)
(declare-sort Multiset<C> 0)
(declare-sort Multiset<Multiset<Seq<Set<E>>>> 0)
(declare-sort Multiset<Seq<Set<E>>> 0)
(declare-sort Multiset<Set<D>> 0)
(declare-sort B 0)
(declare-sort A 0)
(declare-sort C 0)
(declare-sort D 0)
(declare-sort E 0)
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
(declare-fun $SortWrappers.Seq<Multiset<Set<D>>>To$Snap (Seq<Multiset<Set<D>>>) $Snap)
(declare-fun $SortWrappers.$SnapToSeq<Multiset<Set<D>>> ($Snap) Seq<Multiset<Set<D>>>)
(assert (forall ((x Seq<Multiset<Set<D>>>)) (!
    (= x ($SortWrappers.$SnapToSeq<Multiset<Set<D>>>($SortWrappers.Seq<Multiset<Set<D>>>To$Snap x)))
    :pattern (($SortWrappers.Seq<Multiset<Set<D>>>To$Snap x))
    :qid |$Snap.$SnapToSeq<Multiset<Set<D>>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Seq<Multiset<Set<D>>>To$Snap($SortWrappers.$SnapToSeq<Multiset<Set<D>>> x)))
    :pattern (($SortWrappers.$SnapToSeq<Multiset<Set<D>>> x))
    :qid |$Snap.Seq<Multiset<Set<D>>>To$SnapToSeq<Multiset<Set<D>>>|
    )))
(declare-fun $SortWrappers.Seq<Seq<A>>To$Snap (Seq<Seq<A>>) $Snap)
(declare-fun $SortWrappers.$SnapToSeq<Seq<A>> ($Snap) Seq<Seq<A>>)
(assert (forall ((x Seq<Seq<A>>)) (!
    (= x ($SortWrappers.$SnapToSeq<Seq<A>>($SortWrappers.Seq<Seq<A>>To$Snap x)))
    :pattern (($SortWrappers.Seq<Seq<A>>To$Snap x))
    :qid |$Snap.$SnapToSeq<Seq<A>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Seq<Seq<A>>To$Snap($SortWrappers.$SnapToSeq<Seq<A>> x)))
    :pattern (($SortWrappers.$SnapToSeq<Seq<A>> x))
    :qid |$Snap.Seq<Seq<A>>To$SnapToSeq<Seq<A>>|
    )))
(declare-fun $SortWrappers.Seq<A>To$Snap (Seq<A>) $Snap)
(declare-fun $SortWrappers.$SnapToSeq<A> ($Snap) Seq<A>)
(assert (forall ((x Seq<A>)) (!
    (= x ($SortWrappers.$SnapToSeq<A>($SortWrappers.Seq<A>To$Snap x)))
    :pattern (($SortWrappers.Seq<A>To$Snap x))
    :qid |$Snap.$SnapToSeq<A>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Seq<A>To$Snap($SortWrappers.$SnapToSeq<A> x)))
    :pattern (($SortWrappers.$SnapToSeq<A> x))
    :qid |$Snap.Seq<A>To$SnapToSeq<A>|
    )))
(declare-fun $SortWrappers.Seq<Set<E>>To$Snap (Seq<Set<E>>) $Snap)
(declare-fun $SortWrappers.$SnapToSeq<Set<E>> ($Snap) Seq<Set<E>>)
(assert (forall ((x Seq<Set<E>>)) (!
    (= x ($SortWrappers.$SnapToSeq<Set<E>>($SortWrappers.Seq<Set<E>>To$Snap x)))
    :pattern (($SortWrappers.Seq<Set<E>>To$Snap x))
    :qid |$Snap.$SnapToSeq<Set<E>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Seq<Set<E>>To$Snap($SortWrappers.$SnapToSeq<Set<E>> x)))
    :pattern (($SortWrappers.$SnapToSeq<Set<E>> x))
    :qid |$Snap.Seq<Set<E>>To$SnapToSeq<Set<E>>|
    )))
(declare-fun $SortWrappers.Seq<Set<C>>To$Snap (Seq<Set<C>>) $Snap)
(declare-fun $SortWrappers.$SnapToSeq<Set<C>> ($Snap) Seq<Set<C>>)
(assert (forall ((x Seq<Set<C>>)) (!
    (= x ($SortWrappers.$SnapToSeq<Set<C>>($SortWrappers.Seq<Set<C>>To$Snap x)))
    :pattern (($SortWrappers.Seq<Set<C>>To$Snap x))
    :qid |$Snap.$SnapToSeq<Set<C>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Seq<Set<C>>To$Snap($SortWrappers.$SnapToSeq<Set<C>> x)))
    :pattern (($SortWrappers.$SnapToSeq<Set<C>> x))
    :qid |$Snap.Seq<Set<C>>To$SnapToSeq<Set<C>>|
    )))
(declare-fun $SortWrappers.Seq<B>To$Snap (Seq<B>) $Snap)
(declare-fun $SortWrappers.$SnapToSeq<B> ($Snap) Seq<B>)
(assert (forall ((x Seq<B>)) (!
    (= x ($SortWrappers.$SnapToSeq<B>($SortWrappers.Seq<B>To$Snap x)))
    :pattern (($SortWrappers.Seq<B>To$Snap x))
    :qid |$Snap.$SnapToSeq<B>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Seq<B>To$Snap($SortWrappers.$SnapToSeq<B> x)))
    :pattern (($SortWrappers.$SnapToSeq<B> x))
    :qid |$Snap.Seq<B>To$SnapToSeq<B>|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.Set<Seq<B>>To$Snap (Set<Seq<B>>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<Seq<B>> ($Snap) Set<Seq<B>>)
(assert (forall ((x Set<Seq<B>>)) (!
    (= x ($SortWrappers.$SnapToSet<Seq<B>>($SortWrappers.Set<Seq<B>>To$Snap x)))
    :pattern (($SortWrappers.Set<Seq<B>>To$Snap x))
    :qid |$Snap.$SnapToSet<Seq<B>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<Seq<B>>To$Snap($SortWrappers.$SnapToSet<Seq<B>> x)))
    :pattern (($SortWrappers.$SnapToSet<Seq<B>> x))
    :qid |$Snap.Set<Seq<B>>To$SnapToSet<Seq<B>>|
    )))
(declare-fun $SortWrappers.Set<E>To$Snap (Set<E>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<E> ($Snap) Set<E>)
(assert (forall ((x Set<E>)) (!
    (= x ($SortWrappers.$SnapToSet<E>($SortWrappers.Set<E>To$Snap x)))
    :pattern (($SortWrappers.Set<E>To$Snap x))
    :qid |$Snap.$SnapToSet<E>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<E>To$Snap($SortWrappers.$SnapToSet<E> x)))
    :pattern (($SortWrappers.$SnapToSet<E> x))
    :qid |$Snap.Set<E>To$SnapToSet<E>|
    )))
(declare-fun $SortWrappers.Set<Multiset<C>>To$Snap (Set<Multiset<C>>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<Multiset<C>> ($Snap) Set<Multiset<C>>)
(assert (forall ((x Set<Multiset<C>>)) (!
    (= x ($SortWrappers.$SnapToSet<Multiset<C>>($SortWrappers.Set<Multiset<C>>To$Snap x)))
    :pattern (($SortWrappers.Set<Multiset<C>>To$Snap x))
    :qid |$Snap.$SnapToSet<Multiset<C>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<Multiset<C>>To$Snap($SortWrappers.$SnapToSet<Multiset<C>> x)))
    :pattern (($SortWrappers.$SnapToSet<Multiset<C>> x))
    :qid |$Snap.Set<Multiset<C>>To$SnapToSet<Multiset<C>>|
    )))
(declare-fun $SortWrappers.Set<C>To$Snap (Set<C>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<C> ($Snap) Set<C>)
(assert (forall ((x Set<C>)) (!
    (= x ($SortWrappers.$SnapToSet<C>($SortWrappers.Set<C>To$Snap x)))
    :pattern (($SortWrappers.Set<C>To$Snap x))
    :qid |$Snap.$SnapToSet<C>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<C>To$Snap($SortWrappers.$SnapToSet<C> x)))
    :pattern (($SortWrappers.$SnapToSet<C> x))
    :qid |$Snap.Set<C>To$SnapToSet<C>|
    )))
(declare-fun $SortWrappers.Set<D>To$Snap (Set<D>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<D> ($Snap) Set<D>)
(assert (forall ((x Set<D>)) (!
    (= x ($SortWrappers.$SnapToSet<D>($SortWrappers.Set<D>To$Snap x)))
    :pattern (($SortWrappers.Set<D>To$Snap x))
    :qid |$Snap.$SnapToSet<D>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<D>To$Snap($SortWrappers.$SnapToSet<D> x)))
    :pattern (($SortWrappers.$SnapToSet<D> x))
    :qid |$Snap.Set<D>To$SnapToSet<D>|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.Multiset<Set<C>>To$Snap (Multiset<Set<C>>) $Snap)
(declare-fun $SortWrappers.$SnapToMultiset<Set<C>> ($Snap) Multiset<Set<C>>)
(assert (forall ((x Multiset<Set<C>>)) (!
    (= x ($SortWrappers.$SnapToMultiset<Set<C>>($SortWrappers.Multiset<Set<C>>To$Snap x)))
    :pattern (($SortWrappers.Multiset<Set<C>>To$Snap x))
    :qid |$Snap.$SnapToMultiset<Set<C>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Multiset<Set<C>>To$Snap($SortWrappers.$SnapToMultiset<Set<C>> x)))
    :pattern (($SortWrappers.$SnapToMultiset<Set<C>> x))
    :qid |$Snap.Multiset<Set<C>>To$SnapToMultiset<Set<C>>|
    )))
(declare-fun $SortWrappers.Multiset<C>To$Snap (Multiset<C>) $Snap)
(declare-fun $SortWrappers.$SnapToMultiset<C> ($Snap) Multiset<C>)
(assert (forall ((x Multiset<C>)) (!
    (= x ($SortWrappers.$SnapToMultiset<C>($SortWrappers.Multiset<C>To$Snap x)))
    :pattern (($SortWrappers.Multiset<C>To$Snap x))
    :qid |$Snap.$SnapToMultiset<C>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Multiset<C>To$Snap($SortWrappers.$SnapToMultiset<C> x)))
    :pattern (($SortWrappers.$SnapToMultiset<C> x))
    :qid |$Snap.Multiset<C>To$SnapToMultiset<C>|
    )))
(declare-fun $SortWrappers.Multiset<Multiset<Seq<Set<E>>>>To$Snap (Multiset<Multiset<Seq<Set<E>>>>) $Snap)
(declare-fun $SortWrappers.$SnapToMultiset<Multiset<Seq<Set<E>>>> ($Snap) Multiset<Multiset<Seq<Set<E>>>>)
(assert (forall ((x Multiset<Multiset<Seq<Set<E>>>>)) (!
    (= x ($SortWrappers.$SnapToMultiset<Multiset<Seq<Set<E>>>>($SortWrappers.Multiset<Multiset<Seq<Set<E>>>>To$Snap x)))
    :pattern (($SortWrappers.Multiset<Multiset<Seq<Set<E>>>>To$Snap x))
    :qid |$Snap.$SnapToMultiset<Multiset<Seq<Set<E>>>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Multiset<Multiset<Seq<Set<E>>>>To$Snap($SortWrappers.$SnapToMultiset<Multiset<Seq<Set<E>>>> x)))
    :pattern (($SortWrappers.$SnapToMultiset<Multiset<Seq<Set<E>>>> x))
    :qid |$Snap.Multiset<Multiset<Seq<Set<E>>>>To$SnapToMultiset<Multiset<Seq<Set<E>>>>|
    )))
(declare-fun $SortWrappers.Multiset<Seq<Set<E>>>To$Snap (Multiset<Seq<Set<E>>>) $Snap)
(declare-fun $SortWrappers.$SnapToMultiset<Seq<Set<E>>> ($Snap) Multiset<Seq<Set<E>>>)
(assert (forall ((x Multiset<Seq<Set<E>>>)) (!
    (= x ($SortWrappers.$SnapToMultiset<Seq<Set<E>>>($SortWrappers.Multiset<Seq<Set<E>>>To$Snap x)))
    :pattern (($SortWrappers.Multiset<Seq<Set<E>>>To$Snap x))
    :qid |$Snap.$SnapToMultiset<Seq<Set<E>>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Multiset<Seq<Set<E>>>To$Snap($SortWrappers.$SnapToMultiset<Seq<Set<E>>> x)))
    :pattern (($SortWrappers.$SnapToMultiset<Seq<Set<E>>> x))
    :qid |$Snap.Multiset<Seq<Set<E>>>To$SnapToMultiset<Seq<Set<E>>>|
    )))
(declare-fun $SortWrappers.Multiset<Set<D>>To$Snap (Multiset<Set<D>>) $Snap)
(declare-fun $SortWrappers.$SnapToMultiset<Set<D>> ($Snap) Multiset<Set<D>>)
(assert (forall ((x Multiset<Set<D>>)) (!
    (= x ($SortWrappers.$SnapToMultiset<Set<D>>($SortWrappers.Multiset<Set<D>>To$Snap x)))
    :pattern (($SortWrappers.Multiset<Set<D>>To$Snap x))
    :qid |$Snap.$SnapToMultiset<Set<D>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Multiset<Set<D>>To$Snap($SortWrappers.$SnapToMultiset<Set<D>> x)))
    :pattern (($SortWrappers.$SnapToMultiset<Set<D>> x))
    :qid |$Snap.Multiset<Set<D>>To$SnapToMultiset<Set<D>>|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.BTo$Snap (B) $Snap)
(declare-fun $SortWrappers.$SnapToB ($Snap) B)
(assert (forall ((x B)) (!
    (= x ($SortWrappers.$SnapToB($SortWrappers.BTo$Snap x)))
    :pattern (($SortWrappers.BTo$Snap x))
    :qid |$Snap.$SnapToBTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.BTo$Snap($SortWrappers.$SnapToB x)))
    :pattern (($SortWrappers.$SnapToB x))
    :qid |$Snap.BTo$SnapToB|
    )))
(declare-fun $SortWrappers.ATo$Snap (A) $Snap)
(declare-fun $SortWrappers.$SnapToA ($Snap) A)
(assert (forall ((x A)) (!
    (= x ($SortWrappers.$SnapToA($SortWrappers.ATo$Snap x)))
    :pattern (($SortWrappers.ATo$Snap x))
    :qid |$Snap.$SnapToATo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.ATo$Snap($SortWrappers.$SnapToA x)))
    :pattern (($SortWrappers.$SnapToA x))
    :qid |$Snap.ATo$SnapToA|
    )))
(declare-fun $SortWrappers.CTo$Snap (C) $Snap)
(declare-fun $SortWrappers.$SnapToC ($Snap) C)
(assert (forall ((x C)) (!
    (= x ($SortWrappers.$SnapToC($SortWrappers.CTo$Snap x)))
    :pattern (($SortWrappers.CTo$Snap x))
    :qid |$Snap.$SnapToCTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.CTo$Snap($SortWrappers.$SnapToC x)))
    :pattern (($SortWrappers.$SnapToC x))
    :qid |$Snap.CTo$SnapToC|
    )))
(declare-fun $SortWrappers.DTo$Snap (D) $Snap)
(declare-fun $SortWrappers.$SnapToD ($Snap) D)
(assert (forall ((x D)) (!
    (= x ($SortWrappers.$SnapToD($SortWrappers.DTo$Snap x)))
    :pattern (($SortWrappers.DTo$Snap x))
    :qid |$Snap.$SnapToDTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.DTo$Snap($SortWrappers.$SnapToD x)))
    :pattern (($SortWrappers.$SnapToD x))
    :qid |$Snap.DTo$SnapToD|
    )))
(declare-fun $SortWrappers.ETo$Snap (E) $Snap)
(declare-fun $SortWrappers.$SnapToE ($Snap) E)
(assert (forall ((x E)) (!
    (= x ($SortWrappers.$SnapToE($SortWrappers.ETo$Snap x)))
    :pattern (($SortWrappers.ETo$Snap x))
    :qid |$Snap.$SnapToETo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.ETo$Snap($SortWrappers.$SnapToE x)))
    :pattern (($SortWrappers.$SnapToE x))
    :qid |$Snap.ETo$SnapToE|
    )))
; ////////// Symbols
(declare-fun Set_card (Set<Seq<B>>) Int)
(declare-const Set_empty Set<Seq<B>>)
(declare-fun Set_in (Seq<B> Set<Seq<B>>) Bool)
(declare-fun Set_singleton (Seq<B>) Set<Seq<B>>)
(declare-fun Set_unionone (Set<Seq<B>> Seq<B>) Set<Seq<B>>)
(declare-fun Set_union (Set<Seq<B>> Set<Seq<B>>) Set<Seq<B>>)
(declare-fun Set_intersection (Set<Seq<B>> Set<Seq<B>>) Set<Seq<B>>)
(declare-fun Set_difference (Set<Seq<B>> Set<Seq<B>>) Set<Seq<B>>)
(declare-fun Set_subset (Set<Seq<B>> Set<Seq<B>>) Bool)
(declare-fun Set_equal (Set<Seq<B>> Set<Seq<B>>) Bool)
(declare-fun Set_skolem_diff (Set<Seq<B>> Set<Seq<B>>) Seq<B>)
(declare-fun Set_card (Set<E>) Int)
(declare-const Set_empty Set<E>)
(declare-fun Set_in (E Set<E>) Bool)
(declare-fun Set_singleton (E) Set<E>)
(declare-fun Set_unionone (Set<E> E) Set<E>)
(declare-fun Set_union (Set<E> Set<E>) Set<E>)
(declare-fun Set_intersection (Set<E> Set<E>) Set<E>)
(declare-fun Set_difference (Set<E> Set<E>) Set<E>)
(declare-fun Set_subset (Set<E> Set<E>) Bool)
(declare-fun Set_equal (Set<E> Set<E>) Bool)
(declare-fun Set_skolem_diff (Set<E> Set<E>) E)
(declare-fun Set_card (Set<Multiset<C>>) Int)
(declare-const Set_empty Set<Multiset<C>>)
(declare-fun Set_in (Multiset<C> Set<Multiset<C>>) Bool)
(declare-fun Set_singleton (Multiset<C>) Set<Multiset<C>>)
(declare-fun Set_unionone (Set<Multiset<C>> Multiset<C>) Set<Multiset<C>>)
(declare-fun Set_union (Set<Multiset<C>> Set<Multiset<C>>) Set<Multiset<C>>)
(declare-fun Set_intersection (Set<Multiset<C>> Set<Multiset<C>>) Set<Multiset<C>>)
(declare-fun Set_difference (Set<Multiset<C>> Set<Multiset<C>>) Set<Multiset<C>>)
(declare-fun Set_subset (Set<Multiset<C>> Set<Multiset<C>>) Bool)
(declare-fun Set_equal (Set<Multiset<C>> Set<Multiset<C>>) Bool)
(declare-fun Set_skolem_diff (Set<Multiset<C>> Set<Multiset<C>>) Multiset<C>)
(declare-fun Set_card (Set<C>) Int)
(declare-const Set_empty Set<C>)
(declare-fun Set_in (C Set<C>) Bool)
(declare-fun Set_singleton (C) Set<C>)
(declare-fun Set_unionone (Set<C> C) Set<C>)
(declare-fun Set_union (Set<C> Set<C>) Set<C>)
(declare-fun Set_intersection (Set<C> Set<C>) Set<C>)
(declare-fun Set_difference (Set<C> Set<C>) Set<C>)
(declare-fun Set_subset (Set<C> Set<C>) Bool)
(declare-fun Set_equal (Set<C> Set<C>) Bool)
(declare-fun Set_skolem_diff (Set<C> Set<C>) C)
(declare-fun Set_card (Set<D>) Int)
(declare-const Set_empty Set<D>)
(declare-fun Set_in (D Set<D>) Bool)
(declare-fun Set_singleton (D) Set<D>)
(declare-fun Set_unionone (Set<D> D) Set<D>)
(declare-fun Set_union (Set<D> Set<D>) Set<D>)
(declare-fun Set_intersection (Set<D> Set<D>) Set<D>)
(declare-fun Set_difference (Set<D> Set<D>) Set<D>)
(declare-fun Set_subset (Set<D> Set<D>) Bool)
(declare-fun Set_equal (Set<D> Set<D>) Bool)
(declare-fun Set_skolem_diff (Set<D> Set<D>) D)
(declare-fun Multiset_count (Multiset<Set<C>> Set<C>) Int)
(declare-fun Multiset_card (Multiset<Set<C>>) Int)
(declare-const Multiset_empty Multiset<Set<C>>)
(declare-fun Multiset_singleton (Set<C>) Multiset<Set<C>>)
(declare-fun Multiset_unionone (Multiset<Set<C>> Set<C>) Multiset<Set<C>>)
(declare-fun Multiset_union (Multiset<Set<C>> Multiset<Set<C>>) Multiset<Set<C>>)
(declare-fun Multiset_intersection (Multiset<Set<C>> Multiset<Set<C>>) Multiset<Set<C>>)
(declare-fun Multiset_difference (Multiset<Set<C>> Multiset<Set<C>>) Multiset<Set<C>>)
(declare-fun Multiset_subset (Multiset<Set<C>> Multiset<Set<C>>) Bool)
(declare-fun Multiset_equal (Multiset<Set<C>> Multiset<Set<C>>) Bool)
(declare-fun Multiset_skolem_diff (Multiset<Set<C>> Multiset<Set<C>>) Set<C>)
(declare-fun Multiset_disjoint (Multiset<Set<C>> Multiset<Set<C>>) Bool)
(declare-fun Multiset_count (Multiset<C> C) Int)
(declare-fun Multiset_card (Multiset<C>) Int)
(declare-const Multiset_empty Multiset<C>)
(declare-fun Multiset_singleton (C) Multiset<C>)
(declare-fun Multiset_unionone (Multiset<C> C) Multiset<C>)
(declare-fun Multiset_union (Multiset<C> Multiset<C>) Multiset<C>)
(declare-fun Multiset_intersection (Multiset<C> Multiset<C>) Multiset<C>)
(declare-fun Multiset_difference (Multiset<C> Multiset<C>) Multiset<C>)
(declare-fun Multiset_subset (Multiset<C> Multiset<C>) Bool)
(declare-fun Multiset_equal (Multiset<C> Multiset<C>) Bool)
(declare-fun Multiset_skolem_diff (Multiset<C> Multiset<C>) C)
(declare-fun Multiset_disjoint (Multiset<C> Multiset<C>) Bool)
(declare-fun Multiset_count (Multiset<Multiset<Seq<Set<E>>>> Multiset<Seq<Set<E>>>) Int)
(declare-fun Multiset_card (Multiset<Multiset<Seq<Set<E>>>>) Int)
(declare-const Multiset_empty Multiset<Multiset<Seq<Set<E>>>>)
(declare-fun Multiset_singleton (Multiset<Seq<Set<E>>>) Multiset<Multiset<Seq<Set<E>>>>)
(declare-fun Multiset_unionone (Multiset<Multiset<Seq<Set<E>>>> Multiset<Seq<Set<E>>>) Multiset<Multiset<Seq<Set<E>>>>)
(declare-fun Multiset_union (Multiset<Multiset<Seq<Set<E>>>> Multiset<Multiset<Seq<Set<E>>>>) Multiset<Multiset<Seq<Set<E>>>>)
(declare-fun Multiset_intersection (Multiset<Multiset<Seq<Set<E>>>> Multiset<Multiset<Seq<Set<E>>>>) Multiset<Multiset<Seq<Set<E>>>>)
(declare-fun Multiset_difference (Multiset<Multiset<Seq<Set<E>>>> Multiset<Multiset<Seq<Set<E>>>>) Multiset<Multiset<Seq<Set<E>>>>)
(declare-fun Multiset_subset (Multiset<Multiset<Seq<Set<E>>>> Multiset<Multiset<Seq<Set<E>>>>) Bool)
(declare-fun Multiset_equal (Multiset<Multiset<Seq<Set<E>>>> Multiset<Multiset<Seq<Set<E>>>>) Bool)
(declare-fun Multiset_skolem_diff (Multiset<Multiset<Seq<Set<E>>>> Multiset<Multiset<Seq<Set<E>>>>) Multiset<Seq<Set<E>>>)
(declare-fun Multiset_disjoint (Multiset<Multiset<Seq<Set<E>>>> Multiset<Multiset<Seq<Set<E>>>>) Bool)
(declare-fun Multiset_count (Multiset<Seq<Set<E>>> Seq<Set<E>>) Int)
(declare-fun Multiset_card (Multiset<Seq<Set<E>>>) Int)
(declare-const Multiset_empty Multiset<Seq<Set<E>>>)
(declare-fun Multiset_singleton (Seq<Set<E>>) Multiset<Seq<Set<E>>>)
(declare-fun Multiset_unionone (Multiset<Seq<Set<E>>> Seq<Set<E>>) Multiset<Seq<Set<E>>>)
(declare-fun Multiset_union (Multiset<Seq<Set<E>>> Multiset<Seq<Set<E>>>) Multiset<Seq<Set<E>>>)
(declare-fun Multiset_intersection (Multiset<Seq<Set<E>>> Multiset<Seq<Set<E>>>) Multiset<Seq<Set<E>>>)
(declare-fun Multiset_difference (Multiset<Seq<Set<E>>> Multiset<Seq<Set<E>>>) Multiset<Seq<Set<E>>>)
(declare-fun Multiset_subset (Multiset<Seq<Set<E>>> Multiset<Seq<Set<E>>>) Bool)
(declare-fun Multiset_equal (Multiset<Seq<Set<E>>> Multiset<Seq<Set<E>>>) Bool)
(declare-fun Multiset_skolem_diff (Multiset<Seq<Set<E>>> Multiset<Seq<Set<E>>>) Seq<Set<E>>)
(declare-fun Multiset_disjoint (Multiset<Seq<Set<E>>> Multiset<Seq<Set<E>>>) Bool)
(declare-fun Multiset_count (Multiset<Set<D>> Set<D>) Int)
(declare-fun Multiset_card (Multiset<Set<D>>) Int)
(declare-const Multiset_empty Multiset<Set<D>>)
(declare-fun Multiset_singleton (Set<D>) Multiset<Set<D>>)
(declare-fun Multiset_unionone (Multiset<Set<D>> Set<D>) Multiset<Set<D>>)
(declare-fun Multiset_union (Multiset<Set<D>> Multiset<Set<D>>) Multiset<Set<D>>)
(declare-fun Multiset_intersection (Multiset<Set<D>> Multiset<Set<D>>) Multiset<Set<D>>)
(declare-fun Multiset_difference (Multiset<Set<D>> Multiset<Set<D>>) Multiset<Set<D>>)
(declare-fun Multiset_subset (Multiset<Set<D>> Multiset<Set<D>>) Bool)
(declare-fun Multiset_equal (Multiset<Set<D>> Multiset<Set<D>>) Bool)
(declare-fun Multiset_skolem_diff (Multiset<Set<D>> Multiset<Set<D>>) Set<D>)
(declare-fun Multiset_disjoint (Multiset<Set<D>> Multiset<Set<D>>) Bool)
(declare-fun Seq_length (Seq<Multiset<Set<D>>>) Int)
(declare-const Seq_empty Seq<Multiset<Set<D>>>)
(declare-fun Seq_singleton (Multiset<Set<D>>) Seq<Multiset<Set<D>>>)
(declare-fun Seq_append (Seq<Multiset<Set<D>>> Seq<Multiset<Set<D>>>) Seq<Multiset<Set<D>>>)
(declare-fun Seq_index (Seq<Multiset<Set<D>>> Int) Multiset<Set<D>>)
(declare-fun Seq_add (Int Int) Int)
(declare-fun Seq_sub (Int Int) Int)
(declare-fun Seq_update (Seq<Multiset<Set<D>>> Int Multiset<Set<D>>) Seq<Multiset<Set<D>>>)
(declare-fun Seq_take (Seq<Multiset<Set<D>>> Int) Seq<Multiset<Set<D>>>)
(declare-fun Seq_drop (Seq<Multiset<Set<D>>> Int) Seq<Multiset<Set<D>>>)
(declare-fun Seq_contains (Seq<Multiset<Set<D>>> Multiset<Set<D>>) Bool)
(declare-fun Seq_contains_trigger (Seq<Multiset<Set<D>>> Multiset<Set<D>>) Bool)
(declare-fun Seq_skolem (Seq<Multiset<Set<D>>> Multiset<Set<D>>) Int)
(declare-fun Seq_equal (Seq<Multiset<Set<D>>> Seq<Multiset<Set<D>>>) Bool)
(declare-fun Seq_skolem_diff (Seq<Multiset<Set<D>>> Seq<Multiset<Set<D>>>) Int)
(declare-fun Seq_length (Seq<Seq<A>>) Int)
(declare-const Seq_empty Seq<Seq<A>>)
(declare-fun Seq_singleton (Seq<A>) Seq<Seq<A>>)
(declare-fun Seq_append (Seq<Seq<A>> Seq<Seq<A>>) Seq<Seq<A>>)
(declare-fun Seq_index (Seq<Seq<A>> Int) Seq<A>)
(declare-fun Seq_update (Seq<Seq<A>> Int Seq<A>) Seq<Seq<A>>)
(declare-fun Seq_take (Seq<Seq<A>> Int) Seq<Seq<A>>)
(declare-fun Seq_drop (Seq<Seq<A>> Int) Seq<Seq<A>>)
(declare-fun Seq_contains (Seq<Seq<A>> Seq<A>) Bool)
(declare-fun Seq_contains_trigger (Seq<Seq<A>> Seq<A>) Bool)
(declare-fun Seq_skolem (Seq<Seq<A>> Seq<A>) Int)
(declare-fun Seq_equal (Seq<Seq<A>> Seq<Seq<A>>) Bool)
(declare-fun Seq_skolem_diff (Seq<Seq<A>> Seq<Seq<A>>) Int)
(declare-fun Seq_length (Seq<A>) Int)
(declare-const Seq_empty Seq<A>)
(declare-fun Seq_singleton (A) Seq<A>)
(declare-fun Seq_append (Seq<A> Seq<A>) Seq<A>)
(declare-fun Seq_index (Seq<A> Int) A)
(declare-fun Seq_update (Seq<A> Int A) Seq<A>)
(declare-fun Seq_take (Seq<A> Int) Seq<A>)
(declare-fun Seq_drop (Seq<A> Int) Seq<A>)
(declare-fun Seq_contains (Seq<A> A) Bool)
(declare-fun Seq_contains_trigger (Seq<A> A) Bool)
(declare-fun Seq_skolem (Seq<A> A) Int)
(declare-fun Seq_equal (Seq<A> Seq<A>) Bool)
(declare-fun Seq_skolem_diff (Seq<A> Seq<A>) Int)
(declare-fun Seq_length (Seq<Set<E>>) Int)
(declare-const Seq_empty Seq<Set<E>>)
(declare-fun Seq_singleton (Set<E>) Seq<Set<E>>)
(declare-fun Seq_append (Seq<Set<E>> Seq<Set<E>>) Seq<Set<E>>)
(declare-fun Seq_index (Seq<Set<E>> Int) Set<E>)
(declare-fun Seq_update (Seq<Set<E>> Int Set<E>) Seq<Set<E>>)
(declare-fun Seq_take (Seq<Set<E>> Int) Seq<Set<E>>)
(declare-fun Seq_drop (Seq<Set<E>> Int) Seq<Set<E>>)
(declare-fun Seq_contains (Seq<Set<E>> Set<E>) Bool)
(declare-fun Seq_contains_trigger (Seq<Set<E>> Set<E>) Bool)
(declare-fun Seq_skolem (Seq<Set<E>> Set<E>) Int)
(declare-fun Seq_equal (Seq<Set<E>> Seq<Set<E>>) Bool)
(declare-fun Seq_skolem_diff (Seq<Set<E>> Seq<Set<E>>) Int)
(declare-fun Seq_length (Seq<Set<C>>) Int)
(declare-const Seq_empty Seq<Set<C>>)
(declare-fun Seq_singleton (Set<C>) Seq<Set<C>>)
(declare-fun Seq_append (Seq<Set<C>> Seq<Set<C>>) Seq<Set<C>>)
(declare-fun Seq_index (Seq<Set<C>> Int) Set<C>)
(declare-fun Seq_update (Seq<Set<C>> Int Set<C>) Seq<Set<C>>)
(declare-fun Seq_take (Seq<Set<C>> Int) Seq<Set<C>>)
(declare-fun Seq_drop (Seq<Set<C>> Int) Seq<Set<C>>)
(declare-fun Seq_contains (Seq<Set<C>> Set<C>) Bool)
(declare-fun Seq_contains_trigger (Seq<Set<C>> Set<C>) Bool)
(declare-fun Seq_skolem (Seq<Set<C>> Set<C>) Int)
(declare-fun Seq_equal (Seq<Set<C>> Seq<Set<C>>) Bool)
(declare-fun Seq_skolem_diff (Seq<Set<C>> Seq<Set<C>>) Int)
(declare-fun Seq_length (Seq<B>) Int)
(declare-const Seq_empty Seq<B>)
(declare-fun Seq_singleton (B) Seq<B>)
(declare-fun Seq_append (Seq<B> Seq<B>) Seq<B>)
(declare-fun Seq_index (Seq<B> Int) B)
(declare-fun Seq_update (Seq<B> Int B) Seq<B>)
(declare-fun Seq_take (Seq<B> Int) Seq<B>)
(declare-fun Seq_drop (Seq<B> Int) Seq<B>)
(declare-fun Seq_contains (Seq<B> B) Bool)
(declare-fun Seq_contains_trigger (Seq<B> B) Bool)
(declare-fun Seq_skolem (Seq<B> B) Int)
(declare-fun Seq_equal (Seq<B> Seq<B>) Bool)
(declare-fun Seq_skolem_diff (Seq<B> Seq<B>) Int)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((s Seq<Multiset<Set<D>>>)) (!
  (<= 0 (Seq_length s))
  :pattern ((Seq_length s))
  )))
(assert (= (Seq_length (as Seq_empty  Seq<Multiset<Set<D>>>)) 0))
(assert (forall ((s Seq<Multiset<Set<D>>>)) (!
  (=> (= (Seq_length s) 0) (= s (as Seq_empty  Seq<Multiset<Set<D>>>)))
  :pattern ((Seq_length s))
  )))
(assert (forall ((e Multiset<Set<D>>)) (!
  (= (Seq_length (Seq_singleton e)) 1)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<Multiset<Set<D>>>) (s1 Seq<Multiset<Set<D>>>)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Multiset<Set<D>>>)))
      (not (= s1 (as Seq_empty  Seq<Multiset<Set<D>>>))))
    (= (Seq_length (Seq_append s0 s1)) (+ (Seq_length s0) (Seq_length s1))))
  :pattern ((Seq_length (Seq_append s0 s1)))
  )))
(assert (forall ((s0 Seq<Multiset<Set<D>>>) (s1 Seq<Multiset<Set<D>>>)) (!
  (and
    (=> (= s0 (as Seq_empty  Seq<Multiset<Set<D>>>)) (= (Seq_append s0 s1) s1))
    (=> (= s1 (as Seq_empty  Seq<Multiset<Set<D>>>)) (= (Seq_append s0 s1) s0)))
  :pattern ((Seq_append s0 s1))
  )))
(assert (forall ((e Multiset<Set<D>>)) (!
  (= (Seq_index (Seq_singleton e) 0) e)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((i Int) (j Int)) (!
  (= (Seq_add i j) (+ i j))
  :pattern ((Seq_add i j))
  )))
(assert (forall ((i Int) (j Int)) (!
  (= (Seq_sub i j) (- i j))
  :pattern ((Seq_sub i j))
  )))
(assert (forall ((s0 Seq<Multiset<Set<D>>>) (s1 Seq<Multiset<Set<D>>>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Multiset<Set<D>>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Multiset<Set<D>>>)))
        (and (<= 0 n) (< n (Seq_length s0)))))
    (= (Seq_index (Seq_append s0 s1) n) (Seq_index s0 n)))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  :pattern ((Seq_index s0 n) (Seq_append s0 s1))
  )))
(assert (forall ((s0 Seq<Multiset<Set<D>>>) (s1 Seq<Multiset<Set<D>>>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Multiset<Set<D>>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Multiset<Set<D>>>)))
        (and (<= (Seq_length s0) n) (< n (Seq_length (Seq_append s0 s1))))))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s0)) (Seq_length s0)) n)
      (=
        (Seq_index (Seq_append s0 s1) n)
        (Seq_index s1 (Seq_sub n (Seq_length s0))))))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  )))
(assert (forall ((s0 Seq<Multiset<Set<D>>>) (s1 Seq<Multiset<Set<D>>>) (m Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Multiset<Set<D>>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Multiset<Set<D>>>)))
        (and (<= 0 m) (< m (Seq_length s1)))))
    (and
      (= (Seq_sub (Seq_add m (Seq_length s0)) (Seq_length s0)) m)
      (=
        (Seq_index (Seq_append s0 s1) (Seq_add m (Seq_length s0)))
        (Seq_index s1 m))))
  :pattern ((Seq_index s1 m) (Seq_append s0 s1))
  )))
(assert (forall ((s Seq<Multiset<Set<D>>>) (i Int) (v Multiset<Set<D>>)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (= (Seq_length (Seq_update s i v)) (Seq_length s)))
  :pattern ((Seq_length (Seq_update s i v)))
  :pattern ((Seq_length s) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Multiset<Set<D>>>) (i Int) (v Multiset<Set<D>>) (n Int)) (!
  (=>
    (and (<= 0 n) (< n (Seq_length s)))
    (and
      (=> (= i n) (= (Seq_index (Seq_update s i v) n) v))
      (=> (not (= i n)) (= (Seq_index (Seq_update s i v) n) (Seq_index s n)))))
  :pattern ((Seq_index (Seq_update s i v) n))
  :pattern ((Seq_index s n) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Multiset<Set<D>>>) (n Int)) (!
  (and
    (=>
      (<= 0 n)
      (and
        (=> (<= n (Seq_length s)) (= (Seq_length (Seq_take s n)) n))
        (=> (< (Seq_length s) n) (= (Seq_length (Seq_take s n)) (Seq_length s)))))
    (=> (< n 0) (= (Seq_length (Seq_take s n)) 0)))
  :pattern ((Seq_length (Seq_take s n)))
  :pattern ((Seq_take s n) (Seq_length s))
  )))
(assert (forall ((s Seq<Multiset<Set<D>>>) (n Int) (j Int)) (!
  (=>
    (and (<= 0 j) (and (< j n) (< j (Seq_length s))))
    (= (Seq_index (Seq_take s n) j) (Seq_index s j)))
  :pattern ((Seq_index (Seq_take s n) j))
  :pattern ((Seq_index s j) (Seq_take s n))
  )))
(assert (forall ((s Seq<Multiset<Set<D>>>) (n Int)) (!
  (and
    (=>
      (<= 0 n)
      (and
        (=>
          (<= n (Seq_length s))
          (= (Seq_length (Seq_drop s n)) (- (Seq_length s) n)))
        (=> (< (Seq_length s) n) (= (Seq_length (Seq_drop s n)) 0))))
    (=> (< n 0) (= (Seq_length (Seq_drop s n)) (Seq_length s))))
  :pattern ((Seq_length (Seq_drop s n)))
  :pattern ((Seq_length s) (Seq_drop s n))
  )))
(assert (forall ((s Seq<Multiset<Set<D>>>) (n Int) (j Int)) (!
  (=>
    (and (< 0 n) (and (<= 0 j) (< j (- (Seq_length s) n))))
    (and
      (= (Seq_sub (Seq_add j n) n) j)
      (= (Seq_index (Seq_drop s n) j) (Seq_index s (Seq_add j n)))))
  :pattern ((Seq_index (Seq_drop s n) j))
  )))
(assert (forall ((s Seq<Multiset<Set<D>>>) (n Int) (i Int)) (!
  (=>
    (and (< 0 n) (and (<= n i) (< i (Seq_length s))))
    (and
      (= (Seq_add (Seq_sub i n) n) i)
      (= (Seq_index (Seq_drop s n) (Seq_sub i n)) (Seq_index s i))))
  :pattern ((Seq_drop s n) (Seq_index s i))
  )))
(assert (forall ((s Seq<Multiset<Set<D>>>) (t Seq<Multiset<Set<D>>>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_take (Seq_append s t) n) (Seq_take s n)))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Multiset<Set<D>>>) (t Seq<Multiset<Set<D>>>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (=
        (Seq_take (Seq_append s t) n)
        (Seq_append s (Seq_take t (Seq_sub n (Seq_length s)))))))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Multiset<Set<D>>>) (t Seq<Multiset<Set<D>>>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_drop (Seq_append s t) n) (Seq_append (Seq_drop s n) t)))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Multiset<Set<D>>>) (t Seq<Multiset<Set<D>>>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (= (Seq_drop (Seq_append s t) n) (Seq_drop t (Seq_sub n (Seq_length s))))))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Multiset<Set<D>>>) (n Int)) (!
  (=> (<= n 0) (= (Seq_take s n) (as Seq_empty  Seq<Multiset<Set<D>>>)))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Multiset<Set<D>>>) (n Int)) (!
  (=> (<= n 0) (= (Seq_drop s n) s))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Multiset<Set<D>>>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_take s n) s))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Multiset<Set<D>>>) (n Int)) (!
  (=>
    (>= n (Seq_length s))
    (= (Seq_drop s n) (as Seq_empty  Seq<Multiset<Set<D>>>)))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Multiset<Set<D>>>) (x Multiset<Set<D>>)) (!
  (=>
    (Seq_contains s x)
    (and
      (<= 0 (Seq_skolem s x))
      (and
        (< (Seq_skolem s x) (Seq_length s))
        (= (Seq_index s (Seq_skolem s x)) x))))
  :pattern ((Seq_contains s x))
  )))
(assert (forall ((s Seq<Multiset<Set<D>>>) (x Multiset<Set<D>>) (i Int)) (!
  (=>
    (and (<= 0 i) (and (< i (Seq_length s)) (= (Seq_index s i) x)))
    (Seq_contains s x))
  :pattern ((Seq_contains s x) (Seq_index s i))
  )))
(assert (forall ((s Seq<Multiset<Set<D>>>) (i Int)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (Seq_contains_trigger s (Seq_index s i)))
  :pattern ((Seq_index s i))
  )))
(assert (forall ((s0 Seq<Multiset<Set<D>>>) (s1 Seq<Multiset<Set<D>>>)) (!
  (or
    (and (= s0 s1) (Seq_equal s0 s1))
    (or
      (and
        (not (= s0 s1))
        (and (not (Seq_equal s0 s1)) (not (= (Seq_length s0) (Seq_length s1)))))
      (and
        (not (= s0 s1))
        (and
          (not (Seq_equal s0 s1))
          (and
            (= (Seq_length s0) (Seq_length s1))
            (and
              (= (Seq_skolem_diff s0 s1) (Seq_skolem_diff s1 s0))
              (and
                (<= 0 (Seq_skolem_diff s0 s1))
                (and
                  (< (Seq_skolem_diff s0 s1) (Seq_length s0))
                  (not
                    (=
                      (Seq_index s0 (Seq_skolem_diff s0 s1))
                      (Seq_index s1 (Seq_skolem_diff s0 s1))))))))))))
  :pattern ((Seq_equal s0 s1))
  )))
(assert (forall ((a Seq<Multiset<Set<D>>>) (b Seq<Multiset<Set<D>>>)) (!
  (=> (Seq_equal a b) (= a b))
  :pattern ((Seq_equal a b))
  )))
(assert (forall ((x Multiset<Set<D>>) (y Multiset<Set<D>>)) (!
  (= (Seq_contains (Seq_singleton x) y) (= x y))
  :pattern ((Seq_contains (Seq_singleton x) y))
  )))
(assert (forall ((s Seq<Seq<A>>)) (!
  (<= 0 (Seq_length s))
  :pattern ((Seq_length s))
  )))
(assert (= (Seq_length (as Seq_empty  Seq<Seq<A>>)) 0))
(assert (forall ((s Seq<Seq<A>>)) (!
  (=> (= (Seq_length s) 0) (= s (as Seq_empty  Seq<Seq<A>>)))
  :pattern ((Seq_length s))
  )))
(assert (forall ((e Seq<A>)) (!
  (= (Seq_length (Seq_singleton e)) 1)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<Seq<A>>) (s1 Seq<Seq<A>>)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Seq<A>>)))
      (not (= s1 (as Seq_empty  Seq<Seq<A>>))))
    (= (Seq_length (Seq_append s0 s1)) (+ (Seq_length s0) (Seq_length s1))))
  :pattern ((Seq_length (Seq_append s0 s1)))
  )))
(assert (forall ((s0 Seq<Seq<A>>) (s1 Seq<Seq<A>>)) (!
  (and
    (=> (= s0 (as Seq_empty  Seq<Seq<A>>)) (= (Seq_append s0 s1) s1))
    (=> (= s1 (as Seq_empty  Seq<Seq<A>>)) (= (Seq_append s0 s1) s0)))
  :pattern ((Seq_append s0 s1))
  )))
(assert (forall ((e Seq<A>)) (!
  (= (Seq_index (Seq_singleton e) 0) e)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<Seq<A>>) (s1 Seq<Seq<A>>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Seq<A>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Seq<A>>)))
        (and (<= 0 n) (< n (Seq_length s0)))))
    (= (Seq_index (Seq_append s0 s1) n) (Seq_index s0 n)))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  :pattern ((Seq_index s0 n) (Seq_append s0 s1))
  )))
(assert (forall ((s0 Seq<Seq<A>>) (s1 Seq<Seq<A>>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Seq<A>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Seq<A>>)))
        (and (<= (Seq_length s0) n) (< n (Seq_length (Seq_append s0 s1))))))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s0)) (Seq_length s0)) n)
      (=
        (Seq_index (Seq_append s0 s1) n)
        (Seq_index s1 (Seq_sub n (Seq_length s0))))))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  )))
(assert (forall ((s0 Seq<Seq<A>>) (s1 Seq<Seq<A>>) (m Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Seq<A>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Seq<A>>)))
        (and (<= 0 m) (< m (Seq_length s1)))))
    (and
      (= (Seq_sub (Seq_add m (Seq_length s0)) (Seq_length s0)) m)
      (=
        (Seq_index (Seq_append s0 s1) (Seq_add m (Seq_length s0)))
        (Seq_index s1 m))))
  :pattern ((Seq_index s1 m) (Seq_append s0 s1))
  )))
(assert (forall ((s Seq<Seq<A>>) (i Int) (v Seq<A>)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (= (Seq_length (Seq_update s i v)) (Seq_length s)))
  :pattern ((Seq_length (Seq_update s i v)))
  :pattern ((Seq_length s) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Seq<A>>) (i Int) (v Seq<A>) (n Int)) (!
  (=>
    (and (<= 0 n) (< n (Seq_length s)))
    (and
      (=> (= i n) (= (Seq_index (Seq_update s i v) n) v))
      (=> (not (= i n)) (= (Seq_index (Seq_update s i v) n) (Seq_index s n)))))
  :pattern ((Seq_index (Seq_update s i v) n))
  :pattern ((Seq_index s n) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Seq<A>>) (n Int)) (!
  (and
    (=>
      (<= 0 n)
      (and
        (=> (<= n (Seq_length s)) (= (Seq_length (Seq_take s n)) n))
        (=> (< (Seq_length s) n) (= (Seq_length (Seq_take s n)) (Seq_length s)))))
    (=> (< n 0) (= (Seq_length (Seq_take s n)) 0)))
  :pattern ((Seq_length (Seq_take s n)))
  :pattern ((Seq_take s n) (Seq_length s))
  )))
(assert (forall ((s Seq<Seq<A>>) (n Int) (j Int)) (!
  (=>
    (and (<= 0 j) (and (< j n) (< j (Seq_length s))))
    (= (Seq_index (Seq_take s n) j) (Seq_index s j)))
  :pattern ((Seq_index (Seq_take s n) j))
  :pattern ((Seq_index s j) (Seq_take s n))
  )))
(assert (forall ((s Seq<Seq<A>>) (n Int)) (!
  (and
    (=>
      (<= 0 n)
      (and
        (=>
          (<= n (Seq_length s))
          (= (Seq_length (Seq_drop s n)) (- (Seq_length s) n)))
        (=> (< (Seq_length s) n) (= (Seq_length (Seq_drop s n)) 0))))
    (=> (< n 0) (= (Seq_length (Seq_drop s n)) (Seq_length s))))
  :pattern ((Seq_length (Seq_drop s n)))
  :pattern ((Seq_length s) (Seq_drop s n))
  )))
(assert (forall ((s Seq<Seq<A>>) (n Int) (j Int)) (!
  (=>
    (and (< 0 n) (and (<= 0 j) (< j (- (Seq_length s) n))))
    (and
      (= (Seq_sub (Seq_add j n) n) j)
      (= (Seq_index (Seq_drop s n) j) (Seq_index s (Seq_add j n)))))
  :pattern ((Seq_index (Seq_drop s n) j))
  )))
(assert (forall ((s Seq<Seq<A>>) (n Int) (i Int)) (!
  (=>
    (and (< 0 n) (and (<= n i) (< i (Seq_length s))))
    (and
      (= (Seq_add (Seq_sub i n) n) i)
      (= (Seq_index (Seq_drop s n) (Seq_sub i n)) (Seq_index s i))))
  :pattern ((Seq_drop s n) (Seq_index s i))
  )))
(assert (forall ((s Seq<Seq<A>>) (t Seq<Seq<A>>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_take (Seq_append s t) n) (Seq_take s n)))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Seq<A>>) (t Seq<Seq<A>>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (=
        (Seq_take (Seq_append s t) n)
        (Seq_append s (Seq_take t (Seq_sub n (Seq_length s)))))))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Seq<A>>) (t Seq<Seq<A>>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_drop (Seq_append s t) n) (Seq_append (Seq_drop s n) t)))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Seq<A>>) (t Seq<Seq<A>>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (= (Seq_drop (Seq_append s t) n) (Seq_drop t (Seq_sub n (Seq_length s))))))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Seq<A>>) (n Int)) (!
  (=> (<= n 0) (= (Seq_take s n) (as Seq_empty  Seq<Seq<A>>)))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Seq<A>>) (n Int)) (!
  (=> (<= n 0) (= (Seq_drop s n) s))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Seq<A>>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_take s n) s))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Seq<A>>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_drop s n) (as Seq_empty  Seq<Seq<A>>)))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Seq<A>>) (x Seq<A>)) (!
  (=>
    (Seq_contains s x)
    (and
      (<= 0 (Seq_skolem s x))
      (and
        (< (Seq_skolem s x) (Seq_length s))
        (= (Seq_index s (Seq_skolem s x)) x))))
  :pattern ((Seq_contains s x))
  )))
(assert (forall ((s Seq<Seq<A>>) (x Seq<A>) (i Int)) (!
  (=>
    (and (<= 0 i) (and (< i (Seq_length s)) (= (Seq_index s i) x)))
    (Seq_contains s x))
  :pattern ((Seq_contains s x) (Seq_index s i))
  )))
(assert (forall ((s Seq<Seq<A>>) (i Int)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (Seq_contains_trigger s (Seq_index s i)))
  :pattern ((Seq_index s i))
  )))
(assert (forall ((s0 Seq<Seq<A>>) (s1 Seq<Seq<A>>)) (!
  (or
    (and (= s0 s1) (Seq_equal s0 s1))
    (or
      (and
        (not (= s0 s1))
        (and (not (Seq_equal s0 s1)) (not (= (Seq_length s0) (Seq_length s1)))))
      (and
        (not (= s0 s1))
        (and
          (not (Seq_equal s0 s1))
          (and
            (= (Seq_length s0) (Seq_length s1))
            (and
              (= (Seq_skolem_diff s0 s1) (Seq_skolem_diff s1 s0))
              (and
                (<= 0 (Seq_skolem_diff s0 s1))
                (and
                  (< (Seq_skolem_diff s0 s1) (Seq_length s0))
                  (not
                    (=
                      (Seq_index s0 (Seq_skolem_diff s0 s1))
                      (Seq_index s1 (Seq_skolem_diff s0 s1))))))))))))
  :pattern ((Seq_equal s0 s1))
  )))
(assert (forall ((a Seq<Seq<A>>) (b Seq<Seq<A>>)) (!
  (=> (Seq_equal a b) (= a b))
  :pattern ((Seq_equal a b))
  )))
(assert (forall ((x Seq<A>) (y Seq<A>)) (!
  (= (Seq_contains (Seq_singleton x) y) (= x y))
  :pattern ((Seq_contains (Seq_singleton x) y))
  )))
(assert (forall ((s Seq<A>)) (!
  (<= 0 (Seq_length s))
  :pattern ((Seq_length s))
  )))
(assert (= (Seq_length (as Seq_empty  Seq<A>)) 0))
(assert (forall ((s Seq<A>)) (!
  (=> (= (Seq_length s) 0) (= s (as Seq_empty  Seq<A>)))
  :pattern ((Seq_length s))
  )))
(assert (forall ((e A)) (!
  (= (Seq_length (Seq_singleton e)) 1)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<A>) (s1 Seq<A>)) (!
  (=>
    (and (not (= s0 (as Seq_empty  Seq<A>))) (not (= s1 (as Seq_empty  Seq<A>))))
    (= (Seq_length (Seq_append s0 s1)) (+ (Seq_length s0) (Seq_length s1))))
  :pattern ((Seq_length (Seq_append s0 s1)))
  )))
(assert (forall ((s0 Seq<A>) (s1 Seq<A>)) (!
  (and
    (=> (= s0 (as Seq_empty  Seq<A>)) (= (Seq_append s0 s1) s1))
    (=> (= s1 (as Seq_empty  Seq<A>)) (= (Seq_append s0 s1) s0)))
  :pattern ((Seq_append s0 s1))
  )))
(assert (forall ((e A)) (!
  (= (Seq_index (Seq_singleton e) 0) e)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<A>) (s1 Seq<A>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<A>)))
      (and
        (not (= s1 (as Seq_empty  Seq<A>)))
        (and (<= 0 n) (< n (Seq_length s0)))))
    (= (Seq_index (Seq_append s0 s1) n) (Seq_index s0 n)))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  :pattern ((Seq_index s0 n) (Seq_append s0 s1))
  )))
(assert (forall ((s0 Seq<A>) (s1 Seq<A>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<A>)))
      (and
        (not (= s1 (as Seq_empty  Seq<A>)))
        (and (<= (Seq_length s0) n) (< n (Seq_length (Seq_append s0 s1))))))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s0)) (Seq_length s0)) n)
      (=
        (Seq_index (Seq_append s0 s1) n)
        (Seq_index s1 (Seq_sub n (Seq_length s0))))))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  )))
(assert (forall ((s0 Seq<A>) (s1 Seq<A>) (m Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<A>)))
      (and
        (not (= s1 (as Seq_empty  Seq<A>)))
        (and (<= 0 m) (< m (Seq_length s1)))))
    (and
      (= (Seq_sub (Seq_add m (Seq_length s0)) (Seq_length s0)) m)
      (=
        (Seq_index (Seq_append s0 s1) (Seq_add m (Seq_length s0)))
        (Seq_index s1 m))))
  :pattern ((Seq_index s1 m) (Seq_append s0 s1))
  )))
(assert (forall ((s Seq<A>) (i Int) (v A)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (= (Seq_length (Seq_update s i v)) (Seq_length s)))
  :pattern ((Seq_length (Seq_update s i v)))
  :pattern ((Seq_length s) (Seq_update s i v))
  )))
(assert (forall ((s Seq<A>) (i Int) (v A) (n Int)) (!
  (=>
    (and (<= 0 n) (< n (Seq_length s)))
    (and
      (=> (= i n) (= (Seq_index (Seq_update s i v) n) v))
      (=> (not (= i n)) (= (Seq_index (Seq_update s i v) n) (Seq_index s n)))))
  :pattern ((Seq_index (Seq_update s i v) n))
  :pattern ((Seq_index s n) (Seq_update s i v))
  )))
(assert (forall ((s Seq<A>) (n Int)) (!
  (and
    (=>
      (<= 0 n)
      (and
        (=> (<= n (Seq_length s)) (= (Seq_length (Seq_take s n)) n))
        (=> (< (Seq_length s) n) (= (Seq_length (Seq_take s n)) (Seq_length s)))))
    (=> (< n 0) (= (Seq_length (Seq_take s n)) 0)))
  :pattern ((Seq_length (Seq_take s n)))
  :pattern ((Seq_take s n) (Seq_length s))
  )))
(assert (forall ((s Seq<A>) (n Int) (j Int)) (!
  (=>
    (and (<= 0 j) (and (< j n) (< j (Seq_length s))))
    (= (Seq_index (Seq_take s n) j) (Seq_index s j)))
  :pattern ((Seq_index (Seq_take s n) j))
  :pattern ((Seq_index s j) (Seq_take s n))
  )))
(assert (forall ((s Seq<A>) (n Int)) (!
  (and
    (=>
      (<= 0 n)
      (and
        (=>
          (<= n (Seq_length s))
          (= (Seq_length (Seq_drop s n)) (- (Seq_length s) n)))
        (=> (< (Seq_length s) n) (= (Seq_length (Seq_drop s n)) 0))))
    (=> (< n 0) (= (Seq_length (Seq_drop s n)) (Seq_length s))))
  :pattern ((Seq_length (Seq_drop s n)))
  :pattern ((Seq_length s) (Seq_drop s n))
  )))
(assert (forall ((s Seq<A>) (n Int) (j Int)) (!
  (=>
    (and (< 0 n) (and (<= 0 j) (< j (- (Seq_length s) n))))
    (and
      (= (Seq_sub (Seq_add j n) n) j)
      (= (Seq_index (Seq_drop s n) j) (Seq_index s (Seq_add j n)))))
  :pattern ((Seq_index (Seq_drop s n) j))
  )))
(assert (forall ((s Seq<A>) (n Int) (i Int)) (!
  (=>
    (and (< 0 n) (and (<= n i) (< i (Seq_length s))))
    (and
      (= (Seq_add (Seq_sub i n) n) i)
      (= (Seq_index (Seq_drop s n) (Seq_sub i n)) (Seq_index s i))))
  :pattern ((Seq_drop s n) (Seq_index s i))
  )))
(assert (forall ((s Seq<A>) (t Seq<A>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_take (Seq_append s t) n) (Seq_take s n)))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<A>) (t Seq<A>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (=
        (Seq_take (Seq_append s t) n)
        (Seq_append s (Seq_take t (Seq_sub n (Seq_length s)))))))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<A>) (t Seq<A>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_drop (Seq_append s t) n) (Seq_append (Seq_drop s n) t)))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<A>) (t Seq<A>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (= (Seq_drop (Seq_append s t) n) (Seq_drop t (Seq_sub n (Seq_length s))))))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<A>) (n Int)) (!
  (=> (<= n 0) (= (Seq_take s n) (as Seq_empty  Seq<A>)))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<A>) (n Int)) (!
  (=> (<= n 0) (= (Seq_drop s n) s))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<A>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_take s n) s))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<A>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_drop s n) (as Seq_empty  Seq<A>)))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<A>) (x A)) (!
  (=>
    (Seq_contains s x)
    (and
      (<= 0 (Seq_skolem s x))
      (and
        (< (Seq_skolem s x) (Seq_length s))
        (= (Seq_index s (Seq_skolem s x)) x))))
  :pattern ((Seq_contains s x))
  )))
(assert (forall ((s Seq<A>) (x A) (i Int)) (!
  (=>
    (and (<= 0 i) (and (< i (Seq_length s)) (= (Seq_index s i) x)))
    (Seq_contains s x))
  :pattern ((Seq_contains s x) (Seq_index s i))
  )))
(assert (forall ((s Seq<A>) (i Int)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (Seq_contains_trigger s (Seq_index s i)))
  :pattern ((Seq_index s i))
  )))
(assert (forall ((s0 Seq<A>) (s1 Seq<A>)) (!
  (or
    (and (= s0 s1) (Seq_equal s0 s1))
    (or
      (and
        (not (= s0 s1))
        (and (not (Seq_equal s0 s1)) (not (= (Seq_length s0) (Seq_length s1)))))
      (and
        (not (= s0 s1))
        (and
          (not (Seq_equal s0 s1))
          (and
            (= (Seq_length s0) (Seq_length s1))
            (and
              (= (Seq_skolem_diff s0 s1) (Seq_skolem_diff s1 s0))
              (and
                (<= 0 (Seq_skolem_diff s0 s1))
                (and
                  (< (Seq_skolem_diff s0 s1) (Seq_length s0))
                  (not
                    (=
                      (Seq_index s0 (Seq_skolem_diff s0 s1))
                      (Seq_index s1 (Seq_skolem_diff s0 s1))))))))))))
  :pattern ((Seq_equal s0 s1))
  )))
(assert (forall ((a Seq<A>) (b Seq<A>)) (!
  (=> (Seq_equal a b) (= a b))
  :pattern ((Seq_equal a b))
  )))
(assert (forall ((x A) (y A)) (!
  (= (Seq_contains (Seq_singleton x) y) (= x y))
  :pattern ((Seq_contains (Seq_singleton x) y))
  )))
(assert (forall ((s Seq<Set<E>>)) (!
  (<= 0 (Seq_length s))
  :pattern ((Seq_length s))
  )))
(assert (= (Seq_length (as Seq_empty  Seq<Set<E>>)) 0))
(assert (forall ((s Seq<Set<E>>)) (!
  (=> (= (Seq_length s) 0) (= s (as Seq_empty  Seq<Set<E>>)))
  :pattern ((Seq_length s))
  )))
(assert (forall ((e Set<E>)) (!
  (= (Seq_length (Seq_singleton e)) 1)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<Set<E>>) (s1 Seq<Set<E>>)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Set<E>>)))
      (not (= s1 (as Seq_empty  Seq<Set<E>>))))
    (= (Seq_length (Seq_append s0 s1)) (+ (Seq_length s0) (Seq_length s1))))
  :pattern ((Seq_length (Seq_append s0 s1)))
  )))
(assert (forall ((s0 Seq<Set<E>>) (s1 Seq<Set<E>>)) (!
  (and
    (=> (= s0 (as Seq_empty  Seq<Set<E>>)) (= (Seq_append s0 s1) s1))
    (=> (= s1 (as Seq_empty  Seq<Set<E>>)) (= (Seq_append s0 s1) s0)))
  :pattern ((Seq_append s0 s1))
  )))
(assert (forall ((e Set<E>)) (!
  (= (Seq_index (Seq_singleton e) 0) e)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<Set<E>>) (s1 Seq<Set<E>>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Set<E>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Set<E>>)))
        (and (<= 0 n) (< n (Seq_length s0)))))
    (= (Seq_index (Seq_append s0 s1) n) (Seq_index s0 n)))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  :pattern ((Seq_index s0 n) (Seq_append s0 s1))
  )))
(assert (forall ((s0 Seq<Set<E>>) (s1 Seq<Set<E>>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Set<E>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Set<E>>)))
        (and (<= (Seq_length s0) n) (< n (Seq_length (Seq_append s0 s1))))))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s0)) (Seq_length s0)) n)
      (=
        (Seq_index (Seq_append s0 s1) n)
        (Seq_index s1 (Seq_sub n (Seq_length s0))))))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  )))
(assert (forall ((s0 Seq<Set<E>>) (s1 Seq<Set<E>>) (m Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Set<E>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Set<E>>)))
        (and (<= 0 m) (< m (Seq_length s1)))))
    (and
      (= (Seq_sub (Seq_add m (Seq_length s0)) (Seq_length s0)) m)
      (=
        (Seq_index (Seq_append s0 s1) (Seq_add m (Seq_length s0)))
        (Seq_index s1 m))))
  :pattern ((Seq_index s1 m) (Seq_append s0 s1))
  )))
(assert (forall ((s Seq<Set<E>>) (i Int) (v Set<E>)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (= (Seq_length (Seq_update s i v)) (Seq_length s)))
  :pattern ((Seq_length (Seq_update s i v)))
  :pattern ((Seq_length s) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Set<E>>) (i Int) (v Set<E>) (n Int)) (!
  (=>
    (and (<= 0 n) (< n (Seq_length s)))
    (and
      (=> (= i n) (= (Seq_index (Seq_update s i v) n) v))
      (=> (not (= i n)) (= (Seq_index (Seq_update s i v) n) (Seq_index s n)))))
  :pattern ((Seq_index (Seq_update s i v) n))
  :pattern ((Seq_index s n) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Set<E>>) (n Int)) (!
  (and
    (=>
      (<= 0 n)
      (and
        (=> (<= n (Seq_length s)) (= (Seq_length (Seq_take s n)) n))
        (=> (< (Seq_length s) n) (= (Seq_length (Seq_take s n)) (Seq_length s)))))
    (=> (< n 0) (= (Seq_length (Seq_take s n)) 0)))
  :pattern ((Seq_length (Seq_take s n)))
  :pattern ((Seq_take s n) (Seq_length s))
  )))
(assert (forall ((s Seq<Set<E>>) (n Int) (j Int)) (!
  (=>
    (and (<= 0 j) (and (< j n) (< j (Seq_length s))))
    (= (Seq_index (Seq_take s n) j) (Seq_index s j)))
  :pattern ((Seq_index (Seq_take s n) j))
  :pattern ((Seq_index s j) (Seq_take s n))
  )))
(assert (forall ((s Seq<Set<E>>) (n Int)) (!
  (and
    (=>
      (<= 0 n)
      (and
        (=>
          (<= n (Seq_length s))
          (= (Seq_length (Seq_drop s n)) (- (Seq_length s) n)))
        (=> (< (Seq_length s) n) (= (Seq_length (Seq_drop s n)) 0))))
    (=> (< n 0) (= (Seq_length (Seq_drop s n)) (Seq_length s))))
  :pattern ((Seq_length (Seq_drop s n)))
  :pattern ((Seq_length s) (Seq_drop s n))
  )))
(assert (forall ((s Seq<Set<E>>) (n Int) (j Int)) (!
  (=>
    (and (< 0 n) (and (<= 0 j) (< j (- (Seq_length s) n))))
    (and
      (= (Seq_sub (Seq_add j n) n) j)
      (= (Seq_index (Seq_drop s n) j) (Seq_index s (Seq_add j n)))))
  :pattern ((Seq_index (Seq_drop s n) j))
  )))
(assert (forall ((s Seq<Set<E>>) (n Int) (i Int)) (!
  (=>
    (and (< 0 n) (and (<= n i) (< i (Seq_length s))))
    (and
      (= (Seq_add (Seq_sub i n) n) i)
      (= (Seq_index (Seq_drop s n) (Seq_sub i n)) (Seq_index s i))))
  :pattern ((Seq_drop s n) (Seq_index s i))
  )))
(assert (forall ((s Seq<Set<E>>) (t Seq<Set<E>>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_take (Seq_append s t) n) (Seq_take s n)))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Set<E>>) (t Seq<Set<E>>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (=
        (Seq_take (Seq_append s t) n)
        (Seq_append s (Seq_take t (Seq_sub n (Seq_length s)))))))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Set<E>>) (t Seq<Set<E>>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_drop (Seq_append s t) n) (Seq_append (Seq_drop s n) t)))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Set<E>>) (t Seq<Set<E>>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (= (Seq_drop (Seq_append s t) n) (Seq_drop t (Seq_sub n (Seq_length s))))))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Set<E>>) (n Int)) (!
  (=> (<= n 0) (= (Seq_take s n) (as Seq_empty  Seq<Set<E>>)))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Set<E>>) (n Int)) (!
  (=> (<= n 0) (= (Seq_drop s n) s))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Set<E>>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_take s n) s))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Set<E>>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_drop s n) (as Seq_empty  Seq<Set<E>>)))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Set<E>>) (x Set<E>)) (!
  (=>
    (Seq_contains s x)
    (and
      (<= 0 (Seq_skolem s x))
      (and
        (< (Seq_skolem s x) (Seq_length s))
        (= (Seq_index s (Seq_skolem s x)) x))))
  :pattern ((Seq_contains s x))
  )))
(assert (forall ((s Seq<Set<E>>) (x Set<E>) (i Int)) (!
  (=>
    (and (<= 0 i) (and (< i (Seq_length s)) (= (Seq_index s i) x)))
    (Seq_contains s x))
  :pattern ((Seq_contains s x) (Seq_index s i))
  )))
(assert (forall ((s Seq<Set<E>>) (i Int)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (Seq_contains_trigger s (Seq_index s i)))
  :pattern ((Seq_index s i))
  )))
(assert (forall ((s0 Seq<Set<E>>) (s1 Seq<Set<E>>)) (!
  (or
    (and (= s0 s1) (Seq_equal s0 s1))
    (or
      (and
        (not (= s0 s1))
        (and (not (Seq_equal s0 s1)) (not (= (Seq_length s0) (Seq_length s1)))))
      (and
        (not (= s0 s1))
        (and
          (not (Seq_equal s0 s1))
          (and
            (= (Seq_length s0) (Seq_length s1))
            (and
              (= (Seq_skolem_diff s0 s1) (Seq_skolem_diff s1 s0))
              (and
                (<= 0 (Seq_skolem_diff s0 s1))
                (and
                  (< (Seq_skolem_diff s0 s1) (Seq_length s0))
                  (not
                    (=
                      (Seq_index s0 (Seq_skolem_diff s0 s1))
                      (Seq_index s1 (Seq_skolem_diff s0 s1))))))))))))
  :pattern ((Seq_equal s0 s1))
  )))
(assert (forall ((a Seq<Set<E>>) (b Seq<Set<E>>)) (!
  (=> (Seq_equal a b) (= a b))
  :pattern ((Seq_equal a b))
  )))
(assert (forall ((x Set<E>) (y Set<E>)) (!
  (= (Seq_contains (Seq_singleton x) y) (= x y))
  :pattern ((Seq_contains (Seq_singleton x) y))
  )))
(assert (forall ((s Seq<Set<C>>)) (!
  (<= 0 (Seq_length s))
  :pattern ((Seq_length s))
  )))
(assert (= (Seq_length (as Seq_empty  Seq<Set<C>>)) 0))
(assert (forall ((s Seq<Set<C>>)) (!
  (=> (= (Seq_length s) 0) (= s (as Seq_empty  Seq<Set<C>>)))
  :pattern ((Seq_length s))
  )))
(assert (forall ((e Set<C>)) (!
  (= (Seq_length (Seq_singleton e)) 1)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<Set<C>>) (s1 Seq<Set<C>>)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Set<C>>)))
      (not (= s1 (as Seq_empty  Seq<Set<C>>))))
    (= (Seq_length (Seq_append s0 s1)) (+ (Seq_length s0) (Seq_length s1))))
  :pattern ((Seq_length (Seq_append s0 s1)))
  )))
(assert (forall ((s0 Seq<Set<C>>) (s1 Seq<Set<C>>)) (!
  (and
    (=> (= s0 (as Seq_empty  Seq<Set<C>>)) (= (Seq_append s0 s1) s1))
    (=> (= s1 (as Seq_empty  Seq<Set<C>>)) (= (Seq_append s0 s1) s0)))
  :pattern ((Seq_append s0 s1))
  )))
(assert (forall ((e Set<C>)) (!
  (= (Seq_index (Seq_singleton e) 0) e)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<Set<C>>) (s1 Seq<Set<C>>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Set<C>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Set<C>>)))
        (and (<= 0 n) (< n (Seq_length s0)))))
    (= (Seq_index (Seq_append s0 s1) n) (Seq_index s0 n)))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  :pattern ((Seq_index s0 n) (Seq_append s0 s1))
  )))
(assert (forall ((s0 Seq<Set<C>>) (s1 Seq<Set<C>>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Set<C>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Set<C>>)))
        (and (<= (Seq_length s0) n) (< n (Seq_length (Seq_append s0 s1))))))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s0)) (Seq_length s0)) n)
      (=
        (Seq_index (Seq_append s0 s1) n)
        (Seq_index s1 (Seq_sub n (Seq_length s0))))))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  )))
(assert (forall ((s0 Seq<Set<C>>) (s1 Seq<Set<C>>) (m Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Set<C>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Set<C>>)))
        (and (<= 0 m) (< m (Seq_length s1)))))
    (and
      (= (Seq_sub (Seq_add m (Seq_length s0)) (Seq_length s0)) m)
      (=
        (Seq_index (Seq_append s0 s1) (Seq_add m (Seq_length s0)))
        (Seq_index s1 m))))
  :pattern ((Seq_index s1 m) (Seq_append s0 s1))
  )))
(assert (forall ((s Seq<Set<C>>) (i Int) (v Set<C>)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (= (Seq_length (Seq_update s i v)) (Seq_length s)))
  :pattern ((Seq_length (Seq_update s i v)))
  :pattern ((Seq_length s) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Set<C>>) (i Int) (v Set<C>) (n Int)) (!
  (=>
    (and (<= 0 n) (< n (Seq_length s)))
    (and
      (=> (= i n) (= (Seq_index (Seq_update s i v) n) v))
      (=> (not (= i n)) (= (Seq_index (Seq_update s i v) n) (Seq_index s n)))))
  :pattern ((Seq_index (Seq_update s i v) n))
  :pattern ((Seq_index s n) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Set<C>>) (n Int)) (!
  (and
    (=>
      (<= 0 n)
      (and
        (=> (<= n (Seq_length s)) (= (Seq_length (Seq_take s n)) n))
        (=> (< (Seq_length s) n) (= (Seq_length (Seq_take s n)) (Seq_length s)))))
    (=> (< n 0) (= (Seq_length (Seq_take s n)) 0)))
  :pattern ((Seq_length (Seq_take s n)))
  :pattern ((Seq_take s n) (Seq_length s))
  )))
(assert (forall ((s Seq<Set<C>>) (n Int) (j Int)) (!
  (=>
    (and (<= 0 j) (and (< j n) (< j (Seq_length s))))
    (= (Seq_index (Seq_take s n) j) (Seq_index s j)))
  :pattern ((Seq_index (Seq_take s n) j))
  :pattern ((Seq_index s j) (Seq_take s n))
  )))
(assert (forall ((s Seq<Set<C>>) (n Int)) (!
  (and
    (=>
      (<= 0 n)
      (and
        (=>
          (<= n (Seq_length s))
          (= (Seq_length (Seq_drop s n)) (- (Seq_length s) n)))
        (=> (< (Seq_length s) n) (= (Seq_length (Seq_drop s n)) 0))))
    (=> (< n 0) (= (Seq_length (Seq_drop s n)) (Seq_length s))))
  :pattern ((Seq_length (Seq_drop s n)))
  :pattern ((Seq_length s) (Seq_drop s n))
  )))
(assert (forall ((s Seq<Set<C>>) (n Int) (j Int)) (!
  (=>
    (and (< 0 n) (and (<= 0 j) (< j (- (Seq_length s) n))))
    (and
      (= (Seq_sub (Seq_add j n) n) j)
      (= (Seq_index (Seq_drop s n) j) (Seq_index s (Seq_add j n)))))
  :pattern ((Seq_index (Seq_drop s n) j))
  )))
(assert (forall ((s Seq<Set<C>>) (n Int) (i Int)) (!
  (=>
    (and (< 0 n) (and (<= n i) (< i (Seq_length s))))
    (and
      (= (Seq_add (Seq_sub i n) n) i)
      (= (Seq_index (Seq_drop s n) (Seq_sub i n)) (Seq_index s i))))
  :pattern ((Seq_drop s n) (Seq_index s i))
  )))
(assert (forall ((s Seq<Set<C>>) (t Seq<Set<C>>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_take (Seq_append s t) n) (Seq_take s n)))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Set<C>>) (t Seq<Set<C>>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (=
        (Seq_take (Seq_append s t) n)
        (Seq_append s (Seq_take t (Seq_sub n (Seq_length s)))))))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Set<C>>) (t Seq<Set<C>>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_drop (Seq_append s t) n) (Seq_append (Seq_drop s n) t)))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Set<C>>) (t Seq<Set<C>>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (= (Seq_drop (Seq_append s t) n) (Seq_drop t (Seq_sub n (Seq_length s))))))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Set<C>>) (n Int)) (!
  (=> (<= n 0) (= (Seq_take s n) (as Seq_empty  Seq<Set<C>>)))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Set<C>>) (n Int)) (!
  (=> (<= n 0) (= (Seq_drop s n) s))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Set<C>>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_take s n) s))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Set<C>>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_drop s n) (as Seq_empty  Seq<Set<C>>)))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Set<C>>) (x Set<C>)) (!
  (=>
    (Seq_contains s x)
    (and
      (<= 0 (Seq_skolem s x))
      (and
        (< (Seq_skolem s x) (Seq_length s))
        (= (Seq_index s (Seq_skolem s x)) x))))
  :pattern ((Seq_contains s x))
  )))
(assert (forall ((s Seq<Set<C>>) (x Set<C>) (i Int)) (!
  (=>
    (and (<= 0 i) (and (< i (Seq_length s)) (= (Seq_index s i) x)))
    (Seq_contains s x))
  :pattern ((Seq_contains s x) (Seq_index s i))
  )))
(assert (forall ((s Seq<Set<C>>) (i Int)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (Seq_contains_trigger s (Seq_index s i)))
  :pattern ((Seq_index s i))
  )))
(assert (forall ((s0 Seq<Set<C>>) (s1 Seq<Set<C>>)) (!
  (or
    (and (= s0 s1) (Seq_equal s0 s1))
    (or
      (and
        (not (= s0 s1))
        (and (not (Seq_equal s0 s1)) (not (= (Seq_length s0) (Seq_length s1)))))
      (and
        (not (= s0 s1))
        (and
          (not (Seq_equal s0 s1))
          (and
            (= (Seq_length s0) (Seq_length s1))
            (and
              (= (Seq_skolem_diff s0 s1) (Seq_skolem_diff s1 s0))
              (and
                (<= 0 (Seq_skolem_diff s0 s1))
                (and
                  (< (Seq_skolem_diff s0 s1) (Seq_length s0))
                  (not
                    (=
                      (Seq_index s0 (Seq_skolem_diff s0 s1))
                      (Seq_index s1 (Seq_skolem_diff s0 s1))))))))))))
  :pattern ((Seq_equal s0 s1))
  )))
(assert (forall ((a Seq<Set<C>>) (b Seq<Set<C>>)) (!
  (=> (Seq_equal a b) (= a b))
  :pattern ((Seq_equal a b))
  )))
(assert (forall ((x Set<C>) (y Set<C>)) (!
  (= (Seq_contains (Seq_singleton x) y) (= x y))
  :pattern ((Seq_contains (Seq_singleton x) y))
  )))
(assert (forall ((s Seq<B>)) (!
  (<= 0 (Seq_length s))
  :pattern ((Seq_length s))
  )))
(assert (= (Seq_length (as Seq_empty  Seq<B>)) 0))
(assert (forall ((s Seq<B>)) (!
  (=> (= (Seq_length s) 0) (= s (as Seq_empty  Seq<B>)))
  :pattern ((Seq_length s))
  )))
(assert (forall ((e B)) (!
  (= (Seq_length (Seq_singleton e)) 1)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<B>) (s1 Seq<B>)) (!
  (=>
    (and (not (= s0 (as Seq_empty  Seq<B>))) (not (= s1 (as Seq_empty  Seq<B>))))
    (= (Seq_length (Seq_append s0 s1)) (+ (Seq_length s0) (Seq_length s1))))
  :pattern ((Seq_length (Seq_append s0 s1)))
  )))
(assert (forall ((s0 Seq<B>) (s1 Seq<B>)) (!
  (and
    (=> (= s0 (as Seq_empty  Seq<B>)) (= (Seq_append s0 s1) s1))
    (=> (= s1 (as Seq_empty  Seq<B>)) (= (Seq_append s0 s1) s0)))
  :pattern ((Seq_append s0 s1))
  )))
(assert (forall ((e B)) (!
  (= (Seq_index (Seq_singleton e) 0) e)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<B>) (s1 Seq<B>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<B>)))
      (and
        (not (= s1 (as Seq_empty  Seq<B>)))
        (and (<= 0 n) (< n (Seq_length s0)))))
    (= (Seq_index (Seq_append s0 s1) n) (Seq_index s0 n)))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  :pattern ((Seq_index s0 n) (Seq_append s0 s1))
  )))
(assert (forall ((s0 Seq<B>) (s1 Seq<B>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<B>)))
      (and
        (not (= s1 (as Seq_empty  Seq<B>)))
        (and (<= (Seq_length s0) n) (< n (Seq_length (Seq_append s0 s1))))))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s0)) (Seq_length s0)) n)
      (=
        (Seq_index (Seq_append s0 s1) n)
        (Seq_index s1 (Seq_sub n (Seq_length s0))))))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  )))
(assert (forall ((s0 Seq<B>) (s1 Seq<B>) (m Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<B>)))
      (and
        (not (= s1 (as Seq_empty  Seq<B>)))
        (and (<= 0 m) (< m (Seq_length s1)))))
    (and
      (= (Seq_sub (Seq_add m (Seq_length s0)) (Seq_length s0)) m)
      (=
        (Seq_index (Seq_append s0 s1) (Seq_add m (Seq_length s0)))
        (Seq_index s1 m))))
  :pattern ((Seq_index s1 m) (Seq_append s0 s1))
  )))
(assert (forall ((s Seq<B>) (i Int) (v B)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (= (Seq_length (Seq_update s i v)) (Seq_length s)))
  :pattern ((Seq_length (Seq_update s i v)))
  :pattern ((Seq_length s) (Seq_update s i v))
  )))
(assert (forall ((s Seq<B>) (i Int) (v B) (n Int)) (!
  (=>
    (and (<= 0 n) (< n (Seq_length s)))
    (and
      (=> (= i n) (= (Seq_index (Seq_update s i v) n) v))
      (=> (not (= i n)) (= (Seq_index (Seq_update s i v) n) (Seq_index s n)))))
  :pattern ((Seq_index (Seq_update s i v) n))
  :pattern ((Seq_index s n) (Seq_update s i v))
  )))
(assert (forall ((s Seq<B>) (n Int)) (!
  (and
    (=>
      (<= 0 n)
      (and
        (=> (<= n (Seq_length s)) (= (Seq_length (Seq_take s n)) n))
        (=> (< (Seq_length s) n) (= (Seq_length (Seq_take s n)) (Seq_length s)))))
    (=> (< n 0) (= (Seq_length (Seq_take s n)) 0)))
  :pattern ((Seq_length (Seq_take s n)))
  :pattern ((Seq_take s n) (Seq_length s))
  )))
(assert (forall ((s Seq<B>) (n Int) (j Int)) (!
  (=>
    (and (<= 0 j) (and (< j n) (< j (Seq_length s))))
    (= (Seq_index (Seq_take s n) j) (Seq_index s j)))
  :pattern ((Seq_index (Seq_take s n) j))
  :pattern ((Seq_index s j) (Seq_take s n))
  )))
(assert (forall ((s Seq<B>) (n Int)) (!
  (and
    (=>
      (<= 0 n)
      (and
        (=>
          (<= n (Seq_length s))
          (= (Seq_length (Seq_drop s n)) (- (Seq_length s) n)))
        (=> (< (Seq_length s) n) (= (Seq_length (Seq_drop s n)) 0))))
    (=> (< n 0) (= (Seq_length (Seq_drop s n)) (Seq_length s))))
  :pattern ((Seq_length (Seq_drop s n)))
  :pattern ((Seq_length s) (Seq_drop s n))
  )))
(assert (forall ((s Seq<B>) (n Int) (j Int)) (!
  (=>
    (and (< 0 n) (and (<= 0 j) (< j (- (Seq_length s) n))))
    (and
      (= (Seq_sub (Seq_add j n) n) j)
      (= (Seq_index (Seq_drop s n) j) (Seq_index s (Seq_add j n)))))
  :pattern ((Seq_index (Seq_drop s n) j))
  )))
(assert (forall ((s Seq<B>) (n Int) (i Int)) (!
  (=>
    (and (< 0 n) (and (<= n i) (< i (Seq_length s))))
    (and
      (= (Seq_add (Seq_sub i n) n) i)
      (= (Seq_index (Seq_drop s n) (Seq_sub i n)) (Seq_index s i))))
  :pattern ((Seq_drop s n) (Seq_index s i))
  )))
(assert (forall ((s Seq<B>) (t Seq<B>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_take (Seq_append s t) n) (Seq_take s n)))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<B>) (t Seq<B>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (=
        (Seq_take (Seq_append s t) n)
        (Seq_append s (Seq_take t (Seq_sub n (Seq_length s)))))))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<B>) (t Seq<B>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_drop (Seq_append s t) n) (Seq_append (Seq_drop s n) t)))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<B>) (t Seq<B>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (= (Seq_drop (Seq_append s t) n) (Seq_drop t (Seq_sub n (Seq_length s))))))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<B>) (n Int)) (!
  (=> (<= n 0) (= (Seq_take s n) (as Seq_empty  Seq<B>)))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<B>) (n Int)) (!
  (=> (<= n 0) (= (Seq_drop s n) s))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<B>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_take s n) s))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<B>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_drop s n) (as Seq_empty  Seq<B>)))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<B>) (x B)) (!
  (=>
    (Seq_contains s x)
    (and
      (<= 0 (Seq_skolem s x))
      (and
        (< (Seq_skolem s x) (Seq_length s))
        (= (Seq_index s (Seq_skolem s x)) x))))
  :pattern ((Seq_contains s x))
  )))
(assert (forall ((s Seq<B>) (x B) (i Int)) (!
  (=>
    (and (<= 0 i) (and (< i (Seq_length s)) (= (Seq_index s i) x)))
    (Seq_contains s x))
  :pattern ((Seq_contains s x) (Seq_index s i))
  )))
(assert (forall ((s Seq<B>) (i Int)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (Seq_contains_trigger s (Seq_index s i)))
  :pattern ((Seq_index s i))
  )))
(assert (forall ((s0 Seq<B>) (s1 Seq<B>)) (!
  (or
    (and (= s0 s1) (Seq_equal s0 s1))
    (or
      (and
        (not (= s0 s1))
        (and (not (Seq_equal s0 s1)) (not (= (Seq_length s0) (Seq_length s1)))))
      (and
        (not (= s0 s1))
        (and
          (not (Seq_equal s0 s1))
          (and
            (= (Seq_length s0) (Seq_length s1))
            (and
              (= (Seq_skolem_diff s0 s1) (Seq_skolem_diff s1 s0))
              (and
                (<= 0 (Seq_skolem_diff s0 s1))
                (and
                  (< (Seq_skolem_diff s0 s1) (Seq_length s0))
                  (not
                    (=
                      (Seq_index s0 (Seq_skolem_diff s0 s1))
                      (Seq_index s1 (Seq_skolem_diff s0 s1))))))))))))
  :pattern ((Seq_equal s0 s1))
  )))
(assert (forall ((a Seq<B>) (b Seq<B>)) (!
  (=> (Seq_equal a b) (= a b))
  :pattern ((Seq_equal a b))
  )))
(assert (forall ((x B) (y B)) (!
  (= (Seq_contains (Seq_singleton x) y) (= x y))
  :pattern ((Seq_contains (Seq_singleton x) y))
  )))
(assert (forall ((s Set<Seq<B>>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o Seq<B>)) (!
  (not (Set_in o (as Set_empty  Set<Seq<B>>)))
  :pattern ((Set_in o (as Set_empty  Set<Seq<B>>)))
  )))
(assert (forall ((s Set<Seq<B>>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<Seq<B>>)))
    (=> (not (= (Set_card s) 0)) (exists ((x Seq<B>))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r Seq<B>)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r Seq<B>) (o Seq<B>)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r Seq<B>)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<Seq<B>>) (x Seq<B>) (o Seq<B>)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<Seq<B>>) (x Seq<B>)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<Seq<B>>) (x Seq<B>) (y Seq<B>)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<Seq<B>>) (x Seq<B>)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Seq<B>>) (x Seq<B>)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Seq<B>>) (b Set<Seq<B>>) (o Seq<B>)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<Seq<B>>) (b Set<Seq<B>>) (y Seq<B>)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<Seq<B>>) (b Set<Seq<B>>) (y Seq<B>)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<Seq<B>>) (b Set<Seq<B>>) (o Seq<B>)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<Seq<B>>) (b Set<Seq<B>>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<Seq<B>>) (b Set<Seq<B>>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<Seq<B>>) (b Set<Seq<B>>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<Seq<B>>) (b Set<Seq<B>>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<Seq<B>>) (b Set<Seq<B>>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<Seq<B>>) (b Set<Seq<B>>) (o Seq<B>)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<Seq<B>>) (b Set<Seq<B>>) (y Seq<B>)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<Seq<B>>) (b Set<Seq<B>>)) (!
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
(assert (forall ((a Set<Seq<B>>) (b Set<Seq<B>>)) (!
  (=
    (Set_subset a b)
    (forall ((o Seq<B>)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<Seq<B>>) (b Set<Seq<B>>)) (!
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
(assert (forall ((a Set<Seq<B>>) (b Set<Seq<B>>)) (!
  (=> (Set_equal a b) (= a b))
  :pattern ((Set_equal a b))
  )))
(assert (forall ((s Set<E>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o E)) (!
  (not (Set_in o (as Set_empty  Set<E>)))
  :pattern ((Set_in o (as Set_empty  Set<E>)))
  )))
(assert (forall ((s Set<E>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<E>)))
    (=> (not (= (Set_card s) 0)) (exists ((x E))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r E)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r E) (o E)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r E)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<E>) (x E) (o E)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<E>) (x E)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<E>) (x E) (y E)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<E>) (x E)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<E>) (x E)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<E>) (b Set<E>) (o E)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<E>) (b Set<E>) (y E)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<E>) (b Set<E>) (y E)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<E>) (b Set<E>) (o E)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<E>) (b Set<E>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<E>) (b Set<E>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<E>) (b Set<E>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<E>) (b Set<E>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<E>) (b Set<E>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<E>) (b Set<E>) (o E)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<E>) (b Set<E>) (y E)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<E>) (b Set<E>)) (!
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
(assert (forall ((a Set<E>) (b Set<E>)) (!
  (=
    (Set_subset a b)
    (forall ((o E)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<E>) (b Set<E>)) (!
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
(assert (forall ((a Set<E>) (b Set<E>)) (!
  (=> (Set_equal a b) (= a b))
  :pattern ((Set_equal a b))
  )))
(assert (forall ((s Set<Multiset<C>>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o Multiset<C>)) (!
  (not (Set_in o (as Set_empty  Set<Multiset<C>>)))
  :pattern ((Set_in o (as Set_empty  Set<Multiset<C>>)))
  )))
(assert (forall ((s Set<Multiset<C>>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<Multiset<C>>)))
    (=> (not (= (Set_card s) 0)) (exists ((x Multiset<C>))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r Multiset<C>)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r Multiset<C>) (o Multiset<C>)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r Multiset<C>)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<Multiset<C>>) (x Multiset<C>) (o Multiset<C>)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<Multiset<C>>) (x Multiset<C>)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<Multiset<C>>) (x Multiset<C>) (y Multiset<C>)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<Multiset<C>>) (x Multiset<C>)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Multiset<C>>) (x Multiset<C>)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Multiset<C>>) (b Set<Multiset<C>>) (o Multiset<C>)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<Multiset<C>>) (b Set<Multiset<C>>) (y Multiset<C>)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<Multiset<C>>) (b Set<Multiset<C>>) (y Multiset<C>)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<Multiset<C>>) (b Set<Multiset<C>>) (o Multiset<C>)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<Multiset<C>>) (b Set<Multiset<C>>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<Multiset<C>>) (b Set<Multiset<C>>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<Multiset<C>>) (b Set<Multiset<C>>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<Multiset<C>>) (b Set<Multiset<C>>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<Multiset<C>>) (b Set<Multiset<C>>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<Multiset<C>>) (b Set<Multiset<C>>) (o Multiset<C>)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<Multiset<C>>) (b Set<Multiset<C>>) (y Multiset<C>)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<Multiset<C>>) (b Set<Multiset<C>>)) (!
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
(assert (forall ((a Set<Multiset<C>>) (b Set<Multiset<C>>)) (!
  (=
    (Set_subset a b)
    (forall ((o Multiset<C>)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<Multiset<C>>) (b Set<Multiset<C>>)) (!
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
(assert (forall ((a Set<Multiset<C>>) (b Set<Multiset<C>>)) (!
  (=> (Set_equal a b) (= a b))
  :pattern ((Set_equal a b))
  )))
(assert (forall ((s Set<C>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o C)) (!
  (not (Set_in o (as Set_empty  Set<C>)))
  :pattern ((Set_in o (as Set_empty  Set<C>)))
  )))
(assert (forall ((s Set<C>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<C>)))
    (=> (not (= (Set_card s) 0)) (exists ((x C))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r C)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r C) (o C)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r C)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<C>) (x C) (o C)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<C>) (x C)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<C>) (x C) (y C)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<C>) (x C)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<C>) (x C)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<C>) (b Set<C>) (o C)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<C>) (b Set<C>) (y C)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<C>) (b Set<C>) (y C)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<C>) (b Set<C>) (o C)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<C>) (b Set<C>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<C>) (b Set<C>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<C>) (b Set<C>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<C>) (b Set<C>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<C>) (b Set<C>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<C>) (b Set<C>) (o C)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<C>) (b Set<C>) (y C)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<C>) (b Set<C>)) (!
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
(assert (forall ((a Set<C>) (b Set<C>)) (!
  (=
    (Set_subset a b)
    (forall ((o C)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<C>) (b Set<C>)) (!
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
(assert (forall ((a Set<C>) (b Set<C>)) (!
  (=> (Set_equal a b) (= a b))
  :pattern ((Set_equal a b))
  )))
(assert (forall ((s Set<D>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o D)) (!
  (not (Set_in o (as Set_empty  Set<D>)))
  :pattern ((Set_in o (as Set_empty  Set<D>)))
  )))
(assert (forall ((s Set<D>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<D>)))
    (=> (not (= (Set_card s) 0)) (exists ((x D))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r D)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r D) (o D)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r D)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<D>) (x D) (o D)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<D>) (x D)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<D>) (x D) (y D)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<D>) (x D)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<D>) (x D)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<D>) (b Set<D>) (o D)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<D>) (b Set<D>) (y D)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<D>) (b Set<D>) (y D)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<D>) (b Set<D>) (o D)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<D>) (b Set<D>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<D>) (b Set<D>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<D>) (b Set<D>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<D>) (b Set<D>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<D>) (b Set<D>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<D>) (b Set<D>) (o D)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<D>) (b Set<D>) (y D)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<D>) (b Set<D>)) (!
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
(assert (forall ((a Set<D>) (b Set<D>)) (!
  (=
    (Set_subset a b)
    (forall ((o D)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<D>) (b Set<D>)) (!
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
(assert (forall ((a Set<D>) (b Set<D>)) (!
  (=> (Set_equal a b) (= a b))
  :pattern ((Set_equal a b))
  )))
(assert (forall ((ms Multiset<Set<C>>) (x Set<C>)) (!
  (>= (Multiset_count ms x) 0)
  :pattern ((Multiset_count ms x))
  )))
(assert (forall ((s Multiset<Set<C>>)) (!
  (<= 0 (Multiset_card s))
  :pattern ((Multiset_card s))
  )))
(assert (forall ((o Set<C>)) (!
  (= (Multiset_count (as Multiset_empty  Multiset<Set<C>>) o) 0)
  :pattern ((Multiset_count (as Multiset_empty  Multiset<Set<C>>) o))
  )))
(assert (forall ((s Multiset<Set<C>>)) (!
  (and
    (= (= (Multiset_card s) 0) (= s (as Multiset_empty  Multiset<Set<C>>)))
    (=>
      (not (= (Multiset_card s) 0))
      (exists ((x Set<C>)) 
        (< 0 (Multiset_count s x)))))
  :pattern ((Multiset_card s))
  )))
(assert (forall ((r Set<C>) (o Set<C>)) (!
  (and
    (= (= (Multiset_count (Multiset_singleton r) o) 1) (= r o))
    (= (= (Multiset_count (Multiset_singleton r) o) 0) (not (= r o))))
  :pattern ((Multiset_count (Multiset_singleton r) o))
  )))
(assert (forall ((r Set<C>)) (!
  (and
    (= (Multiset_card (Multiset_singleton r)) 1)
    (= (Multiset_count (Multiset_singleton r) r) 1))
  :pattern ((Multiset_singleton r))
  )))
(assert (forall ((r Set<C>)) (!
  (=
    (Multiset_singleton r)
    (Multiset_unionone (as Multiset_empty  Multiset<Set<C>>) r))
  :pattern ((Multiset_singleton r))
  )))
(assert (forall ((a Multiset<Set<C>>) (x Set<C>) (o Set<C>)) (!
  (=
    (Multiset_count (Multiset_unionone a x) o)
    (ite (= x o) (+ (Multiset_count a o) 1) (Multiset_count a o)))
  :pattern ((Multiset_count (Multiset_unionone a x) o))
  :pattern ((Multiset_unionone a x) (Multiset_count a o))
  )))
(assert (forall ((a Multiset<Set<C>>) (x Set<C>)) (!
  (= (Multiset_card (Multiset_unionone a x)) (+ (Multiset_card a) 1))
  :pattern ((Multiset_card (Multiset_unionone a x)))
  :pattern ((Multiset_unionone a x) (Multiset_card a))
  )))
(assert (forall ((a Multiset<Set<C>>) (x Set<C>)) (!
  (and
    (> (Multiset_count (Multiset_unionone a x) x) 0)
    (> (Multiset_card (Multiset_unionone a x)) 0))
  :pattern ((Multiset_unionone a x))
  )))
(assert (forall ((a Multiset<Set<C>>) (b Multiset<Set<C>>) (o Set<C>)) (!
  (=
    (Multiset_count (Multiset_union a b) o)
    (+ (Multiset_count a o) (Multiset_count b o)))
  :pattern ((Multiset_count (Multiset_union a b) o))
  :pattern ((Multiset_union a b) (Multiset_count a o) (Multiset_count b o))
  )))
(assert (forall ((a Multiset<Set<C>>) (b Multiset<Set<C>>)) (!
  (=
    (Multiset_card (Multiset_union a b))
    (+ (Multiset_card a) (Multiset_card b)))
  :pattern ((Multiset_card (Multiset_union a b)))
  :pattern ((Multiset_card a) (Multiset_union a b))
  :pattern ((Multiset_card b) (Multiset_union a b))
  )))
(assert (forall ((a Multiset<Set<C>>) (b Multiset<Set<C>>) (o Set<C>)) (!
  (=
    (Multiset_count (Multiset_intersection a b) o)
    (ite
      (<= (Multiset_count a o) (Multiset_count b o))
      (Multiset_count a o)
      (Multiset_count b o)))
  :pattern ((Multiset_count (Multiset_intersection a b) o))
  )))
(assert (forall ((a Multiset<Set<C>>) (b Multiset<Set<C>>)) (!
  (=
    (Multiset_intersection (Multiset_intersection a b) b)
    (Multiset_intersection a b))
  :pattern ((Multiset_intersection (Multiset_intersection a b) b))
  )))
(assert (forall ((a Multiset<Set<C>>) (b Multiset<Set<C>>)) (!
  (=
    (Multiset_intersection a (Multiset_intersection a b))
    (Multiset_intersection a b))
  :pattern ((Multiset_intersection a (Multiset_intersection a b)))
  )))
(assert (forall ((a Multiset<Set<C>>) (b Multiset<Set<C>>) (o Set<C>)) (!
  (=
    (Multiset_count (Multiset_difference a b) o)
    (ite
      (< (- (Multiset_count a o) (Multiset_count b o)) 0)
      0
      (- (Multiset_count a o) (Multiset_count b o))))
  :pattern ((Multiset_count (Multiset_difference a b) o))
  )))
(assert (forall ((a Multiset<Set<C>>) (b Multiset<Set<C>>) (y Set<C>)) (!
  (=>
    (<= (Multiset_count a y) (Multiset_count b y))
    (= (Multiset_count (Multiset_difference a b) y) 0))
  :pattern ((Multiset_difference a b) (Multiset_count b y) (Multiset_count a y))
  )))
(assert (forall ((a Multiset<Set<C>>) (b Multiset<Set<C>>)) (!
  (and
    (=
      (+
        (+
          (Multiset_card (Multiset_difference a b))
          (Multiset_card (Multiset_difference b a)))
        (* 2 (Multiset_card (Multiset_intersection a b))))
      (Multiset_card (Multiset_union a b)))
    (=
      (Multiset_card (Multiset_difference a b))
      (- (Multiset_card a) (Multiset_card (Multiset_intersection a b)))))
  :pattern ((Multiset_card (Multiset_difference a b)))
  )))
(assert (forall ((a Multiset<Set<C>>) (b Multiset<Set<C>>)) (!
  (=
    (Multiset_subset a b)
    (forall ((o Set<C>)) (!
      (<= (Multiset_count a o) (Multiset_count b o))
      :pattern ((Multiset_count a o))
      :pattern ((Multiset_count b o))
      )))
  :pattern ((Multiset_subset a b))
  )))
(assert (forall ((a Multiset<Set<C>>) (b Multiset<Set<C>>)) (!
  (or
    (and (Multiset_equal a b) (= a b))
    (and
      (not (Multiset_equal a b))
      (and
        (not (= a b))
        (and
          (= (Multiset_skolem_diff a b) (Multiset_skolem_diff b a))
          (not
            (=
              (Multiset_count a (Multiset_skolem_diff a b))
              (Multiset_count b (Multiset_skolem_diff a b))))))))
  :pattern ((Multiset_equal a b))
  )))
(assert (forall ((a Multiset<Set<C>>) (b Multiset<Set<C>>)) (!
  (=> (Multiset_equal a b) (= a b))
  :pattern ((Multiset_equal a b))
  )))
(assert (forall ((a Multiset<Set<C>>) (b Multiset<Set<C>>)) (!
  (=
    (Multiset_disjoint a b)
    (forall ((o Set<C>)) (!
      (or (= (Multiset_count a o) 0) (= (Multiset_count b o) 0))
      :pattern ((Multiset_count a o))
      :pattern ((Multiset_count b o))
      )))
  :pattern ((Multiset_disjoint a b))
  )))
(assert (forall ((ms Multiset<C>) (x C)) (!
  (>= (Multiset_count ms x) 0)
  :pattern ((Multiset_count ms x))
  )))
(assert (forall ((s Multiset<C>)) (!
  (<= 0 (Multiset_card s))
  :pattern ((Multiset_card s))
  )))
(assert (forall ((o C)) (!
  (= (Multiset_count (as Multiset_empty  Multiset<C>) o) 0)
  :pattern ((Multiset_count (as Multiset_empty  Multiset<C>) o))
  )))
(assert (forall ((s Multiset<C>)) (!
  (and
    (= (= (Multiset_card s) 0) (= s (as Multiset_empty  Multiset<C>)))
    (=>
      (not (= (Multiset_card s) 0))
      (exists ((x C)) 
        (< 0 (Multiset_count s x)))))
  :pattern ((Multiset_card s))
  )))
(assert (forall ((r C) (o C)) (!
  (and
    (= (= (Multiset_count (Multiset_singleton r) o) 1) (= r o))
    (= (= (Multiset_count (Multiset_singleton r) o) 0) (not (= r o))))
  :pattern ((Multiset_count (Multiset_singleton r) o))
  )))
(assert (forall ((r C)) (!
  (and
    (= (Multiset_card (Multiset_singleton r)) 1)
    (= (Multiset_count (Multiset_singleton r) r) 1))
  :pattern ((Multiset_singleton r))
  )))
(assert (forall ((r C)) (!
  (=
    (Multiset_singleton r)
    (Multiset_unionone (as Multiset_empty  Multiset<C>) r))
  :pattern ((Multiset_singleton r))
  )))
(assert (forall ((a Multiset<C>) (x C) (o C)) (!
  (=
    (Multiset_count (Multiset_unionone a x) o)
    (ite (= x o) (+ (Multiset_count a o) 1) (Multiset_count a o)))
  :pattern ((Multiset_count (Multiset_unionone a x) o))
  :pattern ((Multiset_unionone a x) (Multiset_count a o))
  )))
(assert (forall ((a Multiset<C>) (x C)) (!
  (= (Multiset_card (Multiset_unionone a x)) (+ (Multiset_card a) 1))
  :pattern ((Multiset_card (Multiset_unionone a x)))
  :pattern ((Multiset_unionone a x) (Multiset_card a))
  )))
(assert (forall ((a Multiset<C>) (x C)) (!
  (and
    (> (Multiset_count (Multiset_unionone a x) x) 0)
    (> (Multiset_card (Multiset_unionone a x)) 0))
  :pattern ((Multiset_unionone a x))
  )))
(assert (forall ((a Multiset<C>) (b Multiset<C>) (o C)) (!
  (=
    (Multiset_count (Multiset_union a b) o)
    (+ (Multiset_count a o) (Multiset_count b o)))
  :pattern ((Multiset_count (Multiset_union a b) o))
  :pattern ((Multiset_union a b) (Multiset_count a o) (Multiset_count b o))
  )))
(assert (forall ((a Multiset<C>) (b Multiset<C>)) (!
  (=
    (Multiset_card (Multiset_union a b))
    (+ (Multiset_card a) (Multiset_card b)))
  :pattern ((Multiset_card (Multiset_union a b)))
  :pattern ((Multiset_card a) (Multiset_union a b))
  :pattern ((Multiset_card b) (Multiset_union a b))
  )))
(assert (forall ((a Multiset<C>) (b Multiset<C>) (o C)) (!
  (=
    (Multiset_count (Multiset_intersection a b) o)
    (ite
      (<= (Multiset_count a o) (Multiset_count b o))
      (Multiset_count a o)
      (Multiset_count b o)))
  :pattern ((Multiset_count (Multiset_intersection a b) o))
  )))
(assert (forall ((a Multiset<C>) (b Multiset<C>)) (!
  (=
    (Multiset_intersection (Multiset_intersection a b) b)
    (Multiset_intersection a b))
  :pattern ((Multiset_intersection (Multiset_intersection a b) b))
  )))
(assert (forall ((a Multiset<C>) (b Multiset<C>)) (!
  (=
    (Multiset_intersection a (Multiset_intersection a b))
    (Multiset_intersection a b))
  :pattern ((Multiset_intersection a (Multiset_intersection a b)))
  )))
(assert (forall ((a Multiset<C>) (b Multiset<C>) (o C)) (!
  (=
    (Multiset_count (Multiset_difference a b) o)
    (ite
      (< (- (Multiset_count a o) (Multiset_count b o)) 0)
      0
      (- (Multiset_count a o) (Multiset_count b o))))
  :pattern ((Multiset_count (Multiset_difference a b) o))
  )))
(assert (forall ((a Multiset<C>) (b Multiset<C>) (y C)) (!
  (=>
    (<= (Multiset_count a y) (Multiset_count b y))
    (= (Multiset_count (Multiset_difference a b) y) 0))
  :pattern ((Multiset_difference a b) (Multiset_count b y) (Multiset_count a y))
  )))
(assert (forall ((a Multiset<C>) (b Multiset<C>)) (!
  (and
    (=
      (+
        (+
          (Multiset_card (Multiset_difference a b))
          (Multiset_card (Multiset_difference b a)))
        (* 2 (Multiset_card (Multiset_intersection a b))))
      (Multiset_card (Multiset_union a b)))
    (=
      (Multiset_card (Multiset_difference a b))
      (- (Multiset_card a) (Multiset_card (Multiset_intersection a b)))))
  :pattern ((Multiset_card (Multiset_difference a b)))
  )))
(assert (forall ((a Multiset<C>) (b Multiset<C>)) (!
  (=
    (Multiset_subset a b)
    (forall ((o C)) (!
      (<= (Multiset_count a o) (Multiset_count b o))
      :pattern ((Multiset_count a o))
      :pattern ((Multiset_count b o))
      )))
  :pattern ((Multiset_subset a b))
  )))
(assert (forall ((a Multiset<C>) (b Multiset<C>)) (!
  (or
    (and (Multiset_equal a b) (= a b))
    (and
      (not (Multiset_equal a b))
      (and
        (not (= a b))
        (and
          (= (Multiset_skolem_diff a b) (Multiset_skolem_diff b a))
          (not
            (=
              (Multiset_count a (Multiset_skolem_diff a b))
              (Multiset_count b (Multiset_skolem_diff a b))))))))
  :pattern ((Multiset_equal a b))
  )))
(assert (forall ((a Multiset<C>) (b Multiset<C>)) (!
  (=> (Multiset_equal a b) (= a b))
  :pattern ((Multiset_equal a b))
  )))
(assert (forall ((a Multiset<C>) (b Multiset<C>)) (!
  (=
    (Multiset_disjoint a b)
    (forall ((o C)) (!
      (or (= (Multiset_count a o) 0) (= (Multiset_count b o) 0))
      :pattern ((Multiset_count a o))
      :pattern ((Multiset_count b o))
      )))
  :pattern ((Multiset_disjoint a b))
  )))
(assert (forall ((ms Multiset<Multiset<Seq<Set<E>>>>) (x Multiset<Seq<Set<E>>>)) (!
  (>= (Multiset_count ms x) 0)
  :pattern ((Multiset_count ms x))
  )))
(assert (forall ((s Multiset<Multiset<Seq<Set<E>>>>)) (!
  (<= 0 (Multiset_card s))
  :pattern ((Multiset_card s))
  )))
(assert (forall ((o Multiset<Seq<Set<E>>>)) (!
  (= (Multiset_count (as Multiset_empty  Multiset<Multiset<Seq<Set<E>>>>) o) 0)
  :pattern ((Multiset_count (as Multiset_empty  Multiset<Multiset<Seq<Set<E>>>>) o))
  )))
(assert (forall ((s Multiset<Multiset<Seq<Set<E>>>>)) (!
  (and
    (=
      (= (Multiset_card s) 0)
      (= s (as Multiset_empty  Multiset<Multiset<Seq<Set<E>>>>)))
    (=>
      (not (= (Multiset_card s) 0))
      (exists ((x Multiset<Seq<Set<E>>>)) 
        (< 0 (Multiset_count s x)))))
  :pattern ((Multiset_card s))
  )))
(assert (forall ((r Multiset<Seq<Set<E>>>) (o Multiset<Seq<Set<E>>>)) (!
  (and
    (= (= (Multiset_count (Multiset_singleton r) o) 1) (= r o))
    (= (= (Multiset_count (Multiset_singleton r) o) 0) (not (= r o))))
  :pattern ((Multiset_count (Multiset_singleton r) o))
  )))
(assert (forall ((r Multiset<Seq<Set<E>>>)) (!
  (and
    (= (Multiset_card (Multiset_singleton r)) 1)
    (= (Multiset_count (Multiset_singleton r) r) 1))
  :pattern ((Multiset_singleton r))
  )))
(assert (forall ((r Multiset<Seq<Set<E>>>)) (!
  (=
    (Multiset_singleton r)
    (Multiset_unionone (as Multiset_empty  Multiset<Multiset<Seq<Set<E>>>>) r))
  :pattern ((Multiset_singleton r))
  )))
(assert (forall ((a Multiset<Multiset<Seq<Set<E>>>>) (x Multiset<Seq<Set<E>>>) (o Multiset<Seq<Set<E>>>)) (!
  (=
    (Multiset_count (Multiset_unionone a x) o)
    (ite (= x o) (+ (Multiset_count a o) 1) (Multiset_count a o)))
  :pattern ((Multiset_count (Multiset_unionone a x) o))
  :pattern ((Multiset_unionone a x) (Multiset_count a o))
  )))
(assert (forall ((a Multiset<Multiset<Seq<Set<E>>>>) (x Multiset<Seq<Set<E>>>)) (!
  (= (Multiset_card (Multiset_unionone a x)) (+ (Multiset_card a) 1))
  :pattern ((Multiset_card (Multiset_unionone a x)))
  :pattern ((Multiset_unionone a x) (Multiset_card a))
  )))
(assert (forall ((a Multiset<Multiset<Seq<Set<E>>>>) (x Multiset<Seq<Set<E>>>)) (!
  (and
    (> (Multiset_count (Multiset_unionone a x) x) 0)
    (> (Multiset_card (Multiset_unionone a x)) 0))
  :pattern ((Multiset_unionone a x))
  )))
(assert (forall ((a Multiset<Multiset<Seq<Set<E>>>>) (b Multiset<Multiset<Seq<Set<E>>>>) (o Multiset<Seq<Set<E>>>)) (!
  (=
    (Multiset_count (Multiset_union a b) o)
    (+ (Multiset_count a o) (Multiset_count b o)))
  :pattern ((Multiset_count (Multiset_union a b) o))
  :pattern ((Multiset_union a b) (Multiset_count a o) (Multiset_count b o))
  )))
(assert (forall ((a Multiset<Multiset<Seq<Set<E>>>>) (b Multiset<Multiset<Seq<Set<E>>>>)) (!
  (=
    (Multiset_card (Multiset_union a b))
    (+ (Multiset_card a) (Multiset_card b)))
  :pattern ((Multiset_card (Multiset_union a b)))
  :pattern ((Multiset_card a) (Multiset_union a b))
  :pattern ((Multiset_card b) (Multiset_union a b))
  )))
(assert (forall ((a Multiset<Multiset<Seq<Set<E>>>>) (b Multiset<Multiset<Seq<Set<E>>>>) (o Multiset<Seq<Set<E>>>)) (!
  (=
    (Multiset_count (Multiset_intersection a b) o)
    (ite
      (<= (Multiset_count a o) (Multiset_count b o))
      (Multiset_count a o)
      (Multiset_count b o)))
  :pattern ((Multiset_count (Multiset_intersection a b) o))
  )))
(assert (forall ((a Multiset<Multiset<Seq<Set<E>>>>) (b Multiset<Multiset<Seq<Set<E>>>>)) (!
  (=
    (Multiset_intersection (Multiset_intersection a b) b)
    (Multiset_intersection a b))
  :pattern ((Multiset_intersection (Multiset_intersection a b) b))
  )))
(assert (forall ((a Multiset<Multiset<Seq<Set<E>>>>) (b Multiset<Multiset<Seq<Set<E>>>>)) (!
  (=
    (Multiset_intersection a (Multiset_intersection a b))
    (Multiset_intersection a b))
  :pattern ((Multiset_intersection a (Multiset_intersection a b)))
  )))
(assert (forall ((a Multiset<Multiset<Seq<Set<E>>>>) (b Multiset<Multiset<Seq<Set<E>>>>) (o Multiset<Seq<Set<E>>>)) (!
  (=
    (Multiset_count (Multiset_difference a b) o)
    (ite
      (< (- (Multiset_count a o) (Multiset_count b o)) 0)
      0
      (- (Multiset_count a o) (Multiset_count b o))))
  :pattern ((Multiset_count (Multiset_difference a b) o))
  )))
(assert (forall ((a Multiset<Multiset<Seq<Set<E>>>>) (b Multiset<Multiset<Seq<Set<E>>>>) (y Multiset<Seq<Set<E>>>)) (!
  (=>
    (<= (Multiset_count a y) (Multiset_count b y))
    (= (Multiset_count (Multiset_difference a b) y) 0))
  :pattern ((Multiset_difference a b) (Multiset_count b y) (Multiset_count a y))
  )))
(assert (forall ((a Multiset<Multiset<Seq<Set<E>>>>) (b Multiset<Multiset<Seq<Set<E>>>>)) (!
  (and
    (=
      (+
        (+
          (Multiset_card (Multiset_difference a b))
          (Multiset_card (Multiset_difference b a)))
        (* 2 (Multiset_card (Multiset_intersection a b))))
      (Multiset_card (Multiset_union a b)))
    (=
      (Multiset_card (Multiset_difference a b))
      (- (Multiset_card a) (Multiset_card (Multiset_intersection a b)))))
  :pattern ((Multiset_card (Multiset_difference a b)))
  )))
(assert (forall ((a Multiset<Multiset<Seq<Set<E>>>>) (b Multiset<Multiset<Seq<Set<E>>>>)) (!
  (=
    (Multiset_subset a b)
    (forall ((o Multiset<Seq<Set<E>>>)) (!
      (<= (Multiset_count a o) (Multiset_count b o))
      :pattern ((Multiset_count a o))
      :pattern ((Multiset_count b o))
      )))
  :pattern ((Multiset_subset a b))
  )))
(assert (forall ((a Multiset<Multiset<Seq<Set<E>>>>) (b Multiset<Multiset<Seq<Set<E>>>>)) (!
  (or
    (and (Multiset_equal a b) (= a b))
    (and
      (not (Multiset_equal a b))
      (and
        (not (= a b))
        (and
          (= (Multiset_skolem_diff a b) (Multiset_skolem_diff b a))
          (not
            (=
              (Multiset_count a (Multiset_skolem_diff a b))
              (Multiset_count b (Multiset_skolem_diff a b))))))))
  :pattern ((Multiset_equal a b))
  )))
(assert (forall ((a Multiset<Multiset<Seq<Set<E>>>>) (b Multiset<Multiset<Seq<Set<E>>>>)) (!
  (=> (Multiset_equal a b) (= a b))
  :pattern ((Multiset_equal a b))
  )))
(assert (forall ((a Multiset<Multiset<Seq<Set<E>>>>) (b Multiset<Multiset<Seq<Set<E>>>>)) (!
  (=
    (Multiset_disjoint a b)
    (forall ((o Multiset<Seq<Set<E>>>)) (!
      (or (= (Multiset_count a o) 0) (= (Multiset_count b o) 0))
      :pattern ((Multiset_count a o))
      :pattern ((Multiset_count b o))
      )))
  :pattern ((Multiset_disjoint a b))
  )))
(assert (forall ((ms Multiset<Seq<Set<E>>>) (x Seq<Set<E>>)) (!
  (>= (Multiset_count ms x) 0)
  :pattern ((Multiset_count ms x))
  )))
(assert (forall ((s Multiset<Seq<Set<E>>>)) (!
  (<= 0 (Multiset_card s))
  :pattern ((Multiset_card s))
  )))
(assert (forall ((o Seq<Set<E>>)) (!
  (= (Multiset_count (as Multiset_empty  Multiset<Seq<Set<E>>>) o) 0)
  :pattern ((Multiset_count (as Multiset_empty  Multiset<Seq<Set<E>>>) o))
  )))
(assert (forall ((s Multiset<Seq<Set<E>>>)) (!
  (and
    (= (= (Multiset_card s) 0) (= s (as Multiset_empty  Multiset<Seq<Set<E>>>)))
    (=>
      (not (= (Multiset_card s) 0))
      (exists ((x Seq<Set<E>>)) 
        (< 0 (Multiset_count s x)))))
  :pattern ((Multiset_card s))
  )))
(assert (forall ((r Seq<Set<E>>) (o Seq<Set<E>>)) (!
  (and
    (= (= (Multiset_count (Multiset_singleton r) o) 1) (= r o))
    (= (= (Multiset_count (Multiset_singleton r) o) 0) (not (= r o))))
  :pattern ((Multiset_count (Multiset_singleton r) o))
  )))
(assert (forall ((r Seq<Set<E>>)) (!
  (and
    (= (Multiset_card (Multiset_singleton r)) 1)
    (= (Multiset_count (Multiset_singleton r) r) 1))
  :pattern ((Multiset_singleton r))
  )))
(assert (forall ((r Seq<Set<E>>)) (!
  (=
    (Multiset_singleton r)
    (Multiset_unionone (as Multiset_empty  Multiset<Seq<Set<E>>>) r))
  :pattern ((Multiset_singleton r))
  )))
(assert (forall ((a Multiset<Seq<Set<E>>>) (x Seq<Set<E>>) (o Seq<Set<E>>)) (!
  (=
    (Multiset_count (Multiset_unionone a x) o)
    (ite (= x o) (+ (Multiset_count a o) 1) (Multiset_count a o)))
  :pattern ((Multiset_count (Multiset_unionone a x) o))
  :pattern ((Multiset_unionone a x) (Multiset_count a o))
  )))
(assert (forall ((a Multiset<Seq<Set<E>>>) (x Seq<Set<E>>)) (!
  (= (Multiset_card (Multiset_unionone a x)) (+ (Multiset_card a) 1))
  :pattern ((Multiset_card (Multiset_unionone a x)))
  :pattern ((Multiset_unionone a x) (Multiset_card a))
  )))
(assert (forall ((a Multiset<Seq<Set<E>>>) (x Seq<Set<E>>)) (!
  (and
    (> (Multiset_count (Multiset_unionone a x) x) 0)
    (> (Multiset_card (Multiset_unionone a x)) 0))
  :pattern ((Multiset_unionone a x))
  )))
(assert (forall ((a Multiset<Seq<Set<E>>>) (b Multiset<Seq<Set<E>>>) (o Seq<Set<E>>)) (!
  (=
    (Multiset_count (Multiset_union a b) o)
    (+ (Multiset_count a o) (Multiset_count b o)))
  :pattern ((Multiset_count (Multiset_union a b) o))
  :pattern ((Multiset_union a b) (Multiset_count a o) (Multiset_count b o))
  )))
(assert (forall ((a Multiset<Seq<Set<E>>>) (b Multiset<Seq<Set<E>>>)) (!
  (=
    (Multiset_card (Multiset_union a b))
    (+ (Multiset_card a) (Multiset_card b)))
  :pattern ((Multiset_card (Multiset_union a b)))
  :pattern ((Multiset_card a) (Multiset_union a b))
  :pattern ((Multiset_card b) (Multiset_union a b))
  )))
(assert (forall ((a Multiset<Seq<Set<E>>>) (b Multiset<Seq<Set<E>>>) (o Seq<Set<E>>)) (!
  (=
    (Multiset_count (Multiset_intersection a b) o)
    (ite
      (<= (Multiset_count a o) (Multiset_count b o))
      (Multiset_count a o)
      (Multiset_count b o)))
  :pattern ((Multiset_count (Multiset_intersection a b) o))
  )))
(assert (forall ((a Multiset<Seq<Set<E>>>) (b Multiset<Seq<Set<E>>>)) (!
  (=
    (Multiset_intersection (Multiset_intersection a b) b)
    (Multiset_intersection a b))
  :pattern ((Multiset_intersection (Multiset_intersection a b) b))
  )))
(assert (forall ((a Multiset<Seq<Set<E>>>) (b Multiset<Seq<Set<E>>>)) (!
  (=
    (Multiset_intersection a (Multiset_intersection a b))
    (Multiset_intersection a b))
  :pattern ((Multiset_intersection a (Multiset_intersection a b)))
  )))
(assert (forall ((a Multiset<Seq<Set<E>>>) (b Multiset<Seq<Set<E>>>) (o Seq<Set<E>>)) (!
  (=
    (Multiset_count (Multiset_difference a b) o)
    (ite
      (< (- (Multiset_count a o) (Multiset_count b o)) 0)
      0
      (- (Multiset_count a o) (Multiset_count b o))))
  :pattern ((Multiset_count (Multiset_difference a b) o))
  )))
(assert (forall ((a Multiset<Seq<Set<E>>>) (b Multiset<Seq<Set<E>>>) (y Seq<Set<E>>)) (!
  (=>
    (<= (Multiset_count a y) (Multiset_count b y))
    (= (Multiset_count (Multiset_difference a b) y) 0))
  :pattern ((Multiset_difference a b) (Multiset_count b y) (Multiset_count a y))
  )))
(assert (forall ((a Multiset<Seq<Set<E>>>) (b Multiset<Seq<Set<E>>>)) (!
  (and
    (=
      (+
        (+
          (Multiset_card (Multiset_difference a b))
          (Multiset_card (Multiset_difference b a)))
        (* 2 (Multiset_card (Multiset_intersection a b))))
      (Multiset_card (Multiset_union a b)))
    (=
      (Multiset_card (Multiset_difference a b))
      (- (Multiset_card a) (Multiset_card (Multiset_intersection a b)))))
  :pattern ((Multiset_card (Multiset_difference a b)))
  )))
(assert (forall ((a Multiset<Seq<Set<E>>>) (b Multiset<Seq<Set<E>>>)) (!
  (=
    (Multiset_subset a b)
    (forall ((o Seq<Set<E>>)) (!
      (<= (Multiset_count a o) (Multiset_count b o))
      :pattern ((Multiset_count a o))
      :pattern ((Multiset_count b o))
      )))
  :pattern ((Multiset_subset a b))
  )))
(assert (forall ((a Multiset<Seq<Set<E>>>) (b Multiset<Seq<Set<E>>>)) (!
  (or
    (and (Multiset_equal a b) (= a b))
    (and
      (not (Multiset_equal a b))
      (and
        (not (= a b))
        (and
          (= (Multiset_skolem_diff a b) (Multiset_skolem_diff b a))
          (not
            (=
              (Multiset_count a (Multiset_skolem_diff a b))
              (Multiset_count b (Multiset_skolem_diff a b))))))))
  :pattern ((Multiset_equal a b))
  )))
(assert (forall ((a Multiset<Seq<Set<E>>>) (b Multiset<Seq<Set<E>>>)) (!
  (=> (Multiset_equal a b) (= a b))
  :pattern ((Multiset_equal a b))
  )))
(assert (forall ((a Multiset<Seq<Set<E>>>) (b Multiset<Seq<Set<E>>>)) (!
  (=
    (Multiset_disjoint a b)
    (forall ((o Seq<Set<E>>)) (!
      (or (= (Multiset_count a o) 0) (= (Multiset_count b o) 0))
      :pattern ((Multiset_count a o))
      :pattern ((Multiset_count b o))
      )))
  :pattern ((Multiset_disjoint a b))
  )))
(assert (forall ((ms Multiset<Set<D>>) (x Set<D>)) (!
  (>= (Multiset_count ms x) 0)
  :pattern ((Multiset_count ms x))
  )))
(assert (forall ((s Multiset<Set<D>>)) (!
  (<= 0 (Multiset_card s))
  :pattern ((Multiset_card s))
  )))
(assert (forall ((o Set<D>)) (!
  (= (Multiset_count (as Multiset_empty  Multiset<Set<D>>) o) 0)
  :pattern ((Multiset_count (as Multiset_empty  Multiset<Set<D>>) o))
  )))
(assert (forall ((s Multiset<Set<D>>)) (!
  (and
    (= (= (Multiset_card s) 0) (= s (as Multiset_empty  Multiset<Set<D>>)))
    (=>
      (not (= (Multiset_card s) 0))
      (exists ((x Set<D>)) 
        (< 0 (Multiset_count s x)))))
  :pattern ((Multiset_card s))
  )))
(assert (forall ((r Set<D>) (o Set<D>)) (!
  (and
    (= (= (Multiset_count (Multiset_singleton r) o) 1) (= r o))
    (= (= (Multiset_count (Multiset_singleton r) o) 0) (not (= r o))))
  :pattern ((Multiset_count (Multiset_singleton r) o))
  )))
(assert (forall ((r Set<D>)) (!
  (and
    (= (Multiset_card (Multiset_singleton r)) 1)
    (= (Multiset_count (Multiset_singleton r) r) 1))
  :pattern ((Multiset_singleton r))
  )))
(assert (forall ((r Set<D>)) (!
  (=
    (Multiset_singleton r)
    (Multiset_unionone (as Multiset_empty  Multiset<Set<D>>) r))
  :pattern ((Multiset_singleton r))
  )))
(assert (forall ((a Multiset<Set<D>>) (x Set<D>) (o Set<D>)) (!
  (=
    (Multiset_count (Multiset_unionone a x) o)
    (ite (= x o) (+ (Multiset_count a o) 1) (Multiset_count a o)))
  :pattern ((Multiset_count (Multiset_unionone a x) o))
  :pattern ((Multiset_unionone a x) (Multiset_count a o))
  )))
(assert (forall ((a Multiset<Set<D>>) (x Set<D>)) (!
  (= (Multiset_card (Multiset_unionone a x)) (+ (Multiset_card a) 1))
  :pattern ((Multiset_card (Multiset_unionone a x)))
  :pattern ((Multiset_unionone a x) (Multiset_card a))
  )))
(assert (forall ((a Multiset<Set<D>>) (x Set<D>)) (!
  (and
    (> (Multiset_count (Multiset_unionone a x) x) 0)
    (> (Multiset_card (Multiset_unionone a x)) 0))
  :pattern ((Multiset_unionone a x))
  )))
(assert (forall ((a Multiset<Set<D>>) (b Multiset<Set<D>>) (o Set<D>)) (!
  (=
    (Multiset_count (Multiset_union a b) o)
    (+ (Multiset_count a o) (Multiset_count b o)))
  :pattern ((Multiset_count (Multiset_union a b) o))
  :pattern ((Multiset_union a b) (Multiset_count a o) (Multiset_count b o))
  )))
(assert (forall ((a Multiset<Set<D>>) (b Multiset<Set<D>>)) (!
  (=
    (Multiset_card (Multiset_union a b))
    (+ (Multiset_card a) (Multiset_card b)))
  :pattern ((Multiset_card (Multiset_union a b)))
  :pattern ((Multiset_card a) (Multiset_union a b))
  :pattern ((Multiset_card b) (Multiset_union a b))
  )))
(assert (forall ((a Multiset<Set<D>>) (b Multiset<Set<D>>) (o Set<D>)) (!
  (=
    (Multiset_count (Multiset_intersection a b) o)
    (ite
      (<= (Multiset_count a o) (Multiset_count b o))
      (Multiset_count a o)
      (Multiset_count b o)))
  :pattern ((Multiset_count (Multiset_intersection a b) o))
  )))
(assert (forall ((a Multiset<Set<D>>) (b Multiset<Set<D>>)) (!
  (=
    (Multiset_intersection (Multiset_intersection a b) b)
    (Multiset_intersection a b))
  :pattern ((Multiset_intersection (Multiset_intersection a b) b))
  )))
(assert (forall ((a Multiset<Set<D>>) (b Multiset<Set<D>>)) (!
  (=
    (Multiset_intersection a (Multiset_intersection a b))
    (Multiset_intersection a b))
  :pattern ((Multiset_intersection a (Multiset_intersection a b)))
  )))
(assert (forall ((a Multiset<Set<D>>) (b Multiset<Set<D>>) (o Set<D>)) (!
  (=
    (Multiset_count (Multiset_difference a b) o)
    (ite
      (< (- (Multiset_count a o) (Multiset_count b o)) 0)
      0
      (- (Multiset_count a o) (Multiset_count b o))))
  :pattern ((Multiset_count (Multiset_difference a b) o))
  )))
(assert (forall ((a Multiset<Set<D>>) (b Multiset<Set<D>>) (y Set<D>)) (!
  (=>
    (<= (Multiset_count a y) (Multiset_count b y))
    (= (Multiset_count (Multiset_difference a b) y) 0))
  :pattern ((Multiset_difference a b) (Multiset_count b y) (Multiset_count a y))
  )))
(assert (forall ((a Multiset<Set<D>>) (b Multiset<Set<D>>)) (!
  (and
    (=
      (+
        (+
          (Multiset_card (Multiset_difference a b))
          (Multiset_card (Multiset_difference b a)))
        (* 2 (Multiset_card (Multiset_intersection a b))))
      (Multiset_card (Multiset_union a b)))
    (=
      (Multiset_card (Multiset_difference a b))
      (- (Multiset_card a) (Multiset_card (Multiset_intersection a b)))))
  :pattern ((Multiset_card (Multiset_difference a b)))
  )))
(assert (forall ((a Multiset<Set<D>>) (b Multiset<Set<D>>)) (!
  (=
    (Multiset_subset a b)
    (forall ((o Set<D>)) (!
      (<= (Multiset_count a o) (Multiset_count b o))
      :pattern ((Multiset_count a o))
      :pattern ((Multiset_count b o))
      )))
  :pattern ((Multiset_subset a b))
  )))
(assert (forall ((a Multiset<Set<D>>) (b Multiset<Set<D>>)) (!
  (or
    (and (Multiset_equal a b) (= a b))
    (and
      (not (Multiset_equal a b))
      (and
        (not (= a b))
        (and
          (= (Multiset_skolem_diff a b) (Multiset_skolem_diff b a))
          (not
            (=
              (Multiset_count a (Multiset_skolem_diff a b))
              (Multiset_count b (Multiset_skolem_diff a b))))))))
  :pattern ((Multiset_equal a b))
  )))
(assert (forall ((a Multiset<Set<D>>) (b Multiset<Set<D>>)) (!
  (=> (Multiset_equal a b) (= a b))
  :pattern ((Multiset_equal a b))
  )))
(assert (forall ((a Multiset<Set<D>>) (b Multiset<Set<D>>)) (!
  (=
    (Multiset_disjoint a b)
    (forall ((o Set<D>)) (!
      (or (= (Multiset_count a o) 0) (= (Multiset_count b o) 0))
      :pattern ((Multiset_count a o))
      :pattern ((Multiset_count b o))
      )))
  :pattern ((Multiset_disjoint a b))
  )))
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
; ---------- test ----------
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
; var v1: Seq[Seq[A]]
(declare-const v1@0@01 Seq<Seq<A>>)
; [exec]
; var v2: Set[Seq[B]]
(declare-const v2@1@01 Set<Seq<B>>)
; [exec]
; var v3: Seq[Set[C]]
(declare-const v3@2@01 Seq<Set<C>>)
; [exec]
; var v6: Multiset[Set[C]]
(declare-const v6@3@01 Multiset<Set<C>>)
; [exec]
; var v7: Set[Multiset[C]]
(declare-const v7@4@01 Set<Multiset<C>>)
; [exec]
; var v4: Seq[Multiset[Set[D]]]
(declare-const v4@5@01 Seq<Multiset<Set<D>>>)
; [exec]
; var v5: Multiset[Multiset[Seq[Set[E]]]]
(declare-const v5@6@01 Multiset<Multiset<Seq<Set<E>>>>)
; [exec]
; assert false
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
