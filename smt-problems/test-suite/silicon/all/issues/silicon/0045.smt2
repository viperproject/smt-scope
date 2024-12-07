(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:50:23
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0045.vpr
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
(declare-sort Natural 0)
(declare-sort Tree<Int> 0)
(declare-sort List<Natural> 0)
(declare-sort List<Int> 0)
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
(declare-fun $SortWrappers.NaturalTo$Snap (Natural) $Snap)
(declare-fun $SortWrappers.$SnapToNatural ($Snap) Natural)
(assert (forall ((x Natural)) (!
    (= x ($SortWrappers.$SnapToNatural($SortWrappers.NaturalTo$Snap x)))
    :pattern (($SortWrappers.NaturalTo$Snap x))
    :qid |$Snap.$SnapToNaturalTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.NaturalTo$Snap($SortWrappers.$SnapToNatural x)))
    :pattern (($SortWrappers.$SnapToNatural x))
    :qid |$Snap.NaturalTo$SnapToNatural|
    )))
(declare-fun $SortWrappers.Tree<Int>To$Snap (Tree<Int>) $Snap)
(declare-fun $SortWrappers.$SnapToTree<Int> ($Snap) Tree<Int>)
(assert (forall ((x Tree<Int>)) (!
    (= x ($SortWrappers.$SnapToTree<Int>($SortWrappers.Tree<Int>To$Snap x)))
    :pattern (($SortWrappers.Tree<Int>To$Snap x))
    :qid |$Snap.$SnapToTree<Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Tree<Int>To$Snap($SortWrappers.$SnapToTree<Int> x)))
    :pattern (($SortWrappers.$SnapToTree<Int> x))
    :qid |$Snap.Tree<Int>To$SnapToTree<Int>|
    )))
(declare-fun $SortWrappers.List<Natural>To$Snap (List<Natural>) $Snap)
(declare-fun $SortWrappers.$SnapToList<Natural> ($Snap) List<Natural>)
(assert (forall ((x List<Natural>)) (!
    (= x ($SortWrappers.$SnapToList<Natural>($SortWrappers.List<Natural>To$Snap x)))
    :pattern (($SortWrappers.List<Natural>To$Snap x))
    :qid |$Snap.$SnapToList<Natural>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.List<Natural>To$Snap($SortWrappers.$SnapToList<Natural> x)))
    :pattern (($SortWrappers.$SnapToList<Natural> x))
    :qid |$Snap.List<Natural>To$SnapToList<Natural>|
    )))
(declare-fun $SortWrappers.List<Int>To$Snap (List<Int>) $Snap)
(declare-fun $SortWrappers.$SnapToList<Int> ($Snap) List<Int>)
(assert (forall ((x List<Int>)) (!
    (= x ($SortWrappers.$SnapToList<Int>($SortWrappers.List<Int>To$Snap x)))
    :pattern (($SortWrappers.List<Int>To$Snap x))
    :qid |$Snap.$SnapToList<Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.List<Int>To$Snap($SortWrappers.$SnapToList<Int> x)))
    :pattern (($SortWrappers.$SnapToList<Int> x))
    :qid |$Snap.List<Int>To$SnapToList<Int>|
    )))
; ////////// Symbols
(declare-fun leaf<Tree<Int>> (Int) Tree<Int>)
(declare-fun node<Tree<Int>> (Tree<Int> Int Tree<Int>) Tree<Int>)
(declare-fun isLeafOrNode<Bool> (Tree<Int>) Bool)
(declare-fun height<Natural> (Tree<Int>) Natural)
(declare-fun mirror<Tree<Int>> (Tree<Int>) Tree<Int>)
(declare-fun nil<List<Natural>> (Natural) List<Natural>)
(declare-fun cons<List<Natural>> (Natural List<Natural>) List<Natural>)
(declare-fun isNilOrCons<Bool> (List<Natural>) Bool)
(declare-fun empty<Bool> (List<Natural>) Bool)
(declare-fun concatenate<List<Natural>> (List<Natural> List<Natural>) List<Natural>)
(declare-fun reverse<List<Natural>> (List<Natural>) List<Natural>)
(declare-fun delete<List<Natural>> (Natural List<Natural>) List<Natural>)
(declare-fun length<Natural> (List<Natural>) Natural)
(declare-fun element<Bool> (Natural List<Natural>) Bool)
(declare-fun drop<List<Natural>> (Natural List<Natural>) List<Natural>)
(declare-fun take<List<Natural>> (Natural List<Natural>) List<Natural>)
(declare-fun count<Natural> (Natural List<Natural>) Natural)
(declare-fun butLast<List<Natural>> (List<Natural>) List<Natural>)
(declare-fun last<Natural> (List<Natural>) Natural)
(declare-fun sorted<Bool> (List<Natural>) Bool)
(declare-fun insertSorting<List<Natural>> (Natural List<Natural>) List<Natural>)
(declare-fun insert<List<Natural>> (Natural List<Natural>) List<Natural>)
(declare-fun insertUnlessPresent<List<Natural>> (Natural List<Natural>) List<Natural>)
(declare-fun sort<List<Natural>> (List<Natural>) List<Natural>)
(declare-fun sum<Natural> (List<Natural>) Natural)
(declare-fun hasMultiple<Bool> (List<Natural>) Bool)
(declare-const zero<Natural> Natural)
(declare-fun successor<Natural> (Natural) Natural)
(declare-fun isZeroOrSuccessor<Bool> (Natural) Bool)
(declare-fun lessEqual<Bool> (Natural Natural) Bool)
(declare-fun less<Bool> (Natural Natural) Bool)
(declare-fun plus<Natural> (Natural Natural) Natural)
(declare-fun minus<Natural> (Natural Natural) Natural)
(declare-fun times<Natural> (Natural Natural) Natural)
(declare-fun minimum<Natural> (Natural Natural) Natural)
(declare-fun maximum<Natural> (Natural Natural) Natural)
(declare-fun nil<List<Int>> (Int) List<Int>)
(declare-fun cons<List<Int>> (Int List<Int>) List<Int>)
(declare-fun isNilOrCons<Bool> (List<Int>) Bool)
(declare-fun empty<Bool> (List<Int>) Bool)
(declare-fun concatenate<List<Int>> (List<Int> List<Int>) List<Int>)
(declare-fun reverse<List<Int>> (List<Int>) List<Int>)
(declare-fun length<Natural> (List<Int>) Natural)
(declare-fun drop<List<Int>> (Natural List<Int>) List<Int>)
(declare-fun take<List<Int>> (Natural List<Int>) List<Int>)
(declare-fun butLast<List<Int>> (List<Int>) List<Int>)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((t Tree<Int>)) (!
  (isLeafOrNode<Bool> t)
  :pattern ((isLeafOrNode<Bool> t))
  :qid |prog.leafOrNode|)))
(assert (forall ((t Tree<Int>)) (!
  (=
    (isLeafOrNode<Bool> t)
    (or
      (exists ((a Int)) (!
        (= t (leaf<Tree<Int>> a))
        :pattern ((leaf<Tree<Int>> a))
        ))
      (exists ((l Tree<Int>) (e Int) (r Tree<Int>)) (!
        (= t (node<Tree<Int>> l e r))
        :pattern ((node<Tree<Int>> l e r))
        ))))
  :pattern ((isLeafOrNode<Bool> t))
  :qid |prog.isLeafOrNodeTree|)))
(assert (forall ((t Int)) (!
  (= (height<Natural> (leaf<Tree<Int>> t)) (as zero<Natural>  Natural))
  :pattern ((height<Natural> (leaf<Tree<Int>> t)))
  :qid |prog.heightLeaf|)))
(assert (forall ((l Tree<Int>) (x Int) (r Tree<Int>)) (!
  (=
    (height<Natural> (node<Tree<Int>> l x r))
    (successor<Natural> (maximum<Natural> (height<Natural> l) (height<Natural> r))))
  :pattern ((height<Natural> (node<Tree<Int>> l x r)))
  :qid |prog.heightNode|)))
(assert (forall ((t Int)) (!
  (= (mirror<Tree<Int>> (leaf<Tree<Int>> t)) (leaf<Tree<Int>> t))
  :pattern ((mirror<Tree<Int>> (leaf<Tree<Int>> t)))
  :qid |prog.mirrorLeaf|)))
(assert (forall ((l Tree<Int>) (x Int) (r Tree<Int>)) (!
  (=
    (mirror<Tree<Int>> (node<Tree<Int>> l x r))
    (node<Tree<Int>> (mirror<Tree<Int>> r) x (mirror<Tree<Int>> l)))
  :pattern ((mirror<Tree<Int>> (node<Tree<Int>> l x r)))
  :pattern ((node<Tree<Int>> (mirror<Tree<Int>> r) x (mirror<Tree<Int>> l)))
  :qid |prog.mirrorNode|)))
(assert (forall ((l List<Natural>)) (!
  (isNilOrCons<Bool> l)
  :pattern ((isNilOrCons<Bool> l))
  :qid |prog.nilOrCons|)))
(assert (forall ((l List<Natural>)) (!
  (=
    (isNilOrCons<Bool> l)
    (or
      (exists ((t Natural)) (!
        (= l (nil<List<Natural>> t))
        :pattern ((nil<List<Natural>> t))
        ))
      (exists ((e Natural) (r List<Natural>)) (!
        (= l (cons<List<Natural>> e r))
        :pattern ((cons<List<Natural>> e r))
        ))))
  :pattern ((isNilOrCons<Bool> l))
  :qid |prog.isNilOrConsList|)))
(assert (forall ((l Natural) (r Natural)) (!
  (= (nil<List<Natural>> l) (nil<List<Natural>> r))
  :pattern ((nil<List<Natural>> l) (nil<List<Natural>> r))
  :qid |prog.equalNilNil|)))
(assert (forall ((x Natural) (xs List<Natural>) (t Natural)) (!
  (not (= (cons<List<Natural>> x xs) (nil<List<Natural>> t)))
  :pattern ((cons<List<Natural>> x xs) (nil<List<Natural>> t))
  :qid |prog.equalConsNil|)))
(assert (forall ((t Natural) (y Natural) (ys List<Natural>)) (!
  (not (= (nil<List<Natural>> t) (cons<List<Natural>> y ys)))
  :pattern ((nil<List<Natural>> t) (cons<List<Natural>> y ys))
  :qid |prog.equalNilCons|)))
(assert (forall ((x Natural) (xs List<Natural>) (y Natural) (ys List<Natural>)) (!
  (=
    (= (cons<List<Natural>> x xs) (cons<List<Natural>> y ys))
    (and (= x y) (= xs ys)))
  :pattern ((cons<List<Natural>> x xs) (cons<List<Natural>> y ys))
  :qid |prog.equalConsCons|)))
(assert (forall ((t Natural)) (!
  (empty<Bool> (nil<List<Natural>> t))
  :pattern ((empty<Bool> (nil<List<Natural>> t)))
  :qid |prog.emptyNil|)))
(assert (forall ((e Natural) (l List<Natural>)) (!
  (not (empty<Bool> (cons<List<Natural>> e l)))
  :pattern ((empty<Bool> (cons<List<Natural>> e l)))
  :qid |prog.emptyCons|)))
(assert (forall ((t Natural) (ys List<Natural>)) (!
  (= (concatenate<List<Natural>> (nil<List<Natural>> t) ys) ys)
  :pattern ((concatenate<List<Natural>> (nil<List<Natural>> t) ys))
  :qid |prog.concatenateNilList|)))
(assert (forall ((x Natural) (xs List<Natural>) (ys List<Natural>)) (!
  (=
    (concatenate<List<Natural>> (cons<List<Natural>> x xs) ys)
    (cons<List<Natural>> x (concatenate<List<Natural>> xs ys)))
  :pattern ((cons<List<Natural>> x xs) (concatenate<List<Natural>> xs ys))
  :pattern ((cons<List<Natural>> x xs) (cons<List<Natural>> x (concatenate<List<Natural>> xs ys)))
  :pattern ((concatenate<List<Natural>> (cons<List<Natural>> x xs) ys))
  :pattern ((cons<List<Natural>> x (concatenate<List<Natural>> xs ys)))
  :qid |prog.concatenateConsList|)))
(assert (forall ((t Natural)) (!
  (= (reverse<List<Natural>> (nil<List<Natural>> t)) (nil<List<Natural>> t))
  :pattern ((reverse<List<Natural>> (nil<List<Natural>> t)))
  :qid |prog.reverseNil|)))
(assert (forall ((x Natural) (xs List<Natural>) (t Natural)) (!
  (=
    (reverse<List<Natural>> (cons<List<Natural>> x xs))
    (concatenate<List<Natural>> (reverse<List<Natural>> xs) (cons<List<Natural>> x (nil<List<Natural>> t))))
  :pattern ((cons<List<Natural>> x xs) (concatenate<List<Natural>> (reverse<List<Natural>> xs) (cons<List<Natural>> x (nil<List<Natural>> t))))
  :pattern ((reverse<List<Natural>> (cons<List<Natural>> x xs)) (nil<List<Natural>> t))
  :pattern ((reverse<List<Natural>> (cons<List<Natural>> x xs)) (cons<List<Natural>> x (nil<List<Natural>> t)))
  :pattern ((reverse<List<Natural>> (cons<List<Natural>> x xs)) (concatenate<List<Natural>> (reverse<List<Natural>> xs) (cons<List<Natural>> x (nil<List<Natural>> t))))
  :pattern ((concatenate<List<Natural>> (reverse<List<Natural>> xs) (cons<List<Natural>> x (nil<List<Natural>> t))))
  :qid |prog.reverseCons|)))
(assert (forall ((n Natural) (t Natural)) (!
  (= (delete<List<Natural>> n (nil<List<Natural>> t)) (nil<List<Natural>> t))
  :pattern ((delete<List<Natural>> n (nil<List<Natural>> t)))
  :qid |prog.deleteNaturalNil|)))
(assert (forall ((n Natural) (x Natural) (xs List<Natural>)) (!
  (=
    (delete<List<Natural>> n (cons<List<Natural>> x xs))
    (ite
      (= n x)
      (delete<List<Natural>> n xs)
      (cons<List<Natural>> x (delete<List<Natural>> n xs))))
  :pattern ((cons<List<Natural>> x xs) (delete<List<Natural>> n xs))
  :pattern ((cons<List<Natural>> x xs) (cons<List<Natural>> x (delete<List<Natural>> n xs)))
  :pattern ((delete<List<Natural>> n (cons<List<Natural>> x xs)))
  :pattern ((cons<List<Natural>> x (delete<List<Natural>> n xs)))
  :qid |prog.deleteNaturalCons|)))
(assert (forall ((t Natural)) (!
  (= (length<Natural> (nil<List<Natural>> t)) (as zero<Natural>  Natural))
  :pattern ((length<Natural> (nil<List<Natural>> t)))
  :qid |prog.lengthNil|)))
(assert (forall ((e Natural) (xs List<Natural>)) (!
  (=
    (length<Natural> (cons<List<Natural>> e xs))
    (successor<Natural> (length<Natural> xs)))
  :pattern ((length<Natural> (cons<List<Natural>> e xs)))
  :qid |prog.lengthCons|)))
(assert (forall ((n Natural) (t Natural)) (!
  (not (element<Bool> n (nil<List<Natural>> t)))
  :pattern ((element<Bool> n (nil<List<Natural>> t)))
  :qid |prog.elementNil|)))
(assert (forall ((n Natural) (x Natural) (xs List<Natural>)) (!
  (=
    (element<Bool> n (cons<List<Natural>> x xs))
    (or (= n x) (element<Bool> n xs)))
  :pattern ((cons<List<Natural>> x xs) (element<Bool> n xs))
  :pattern ((element<Bool> n (cons<List<Natural>> x xs)))
  :qid |prog.elementCons|)))
(assert (forall ((xs List<Natural>)) (!
  (= (drop<List<Natural>> (as zero<Natural>  Natural) xs) xs)
  :pattern ((drop<List<Natural>> (as zero<Natural>  Natural) xs))
  :qid |prog.dropZeroList|)))
(assert (forall ((n Natural) (t Natural)) (!
  (= (drop<List<Natural>> n (nil<List<Natural>> t)) (nil<List<Natural>> t))
  :pattern ((drop<List<Natural>> n (nil<List<Natural>> t)))
  :qid |prog.dropNaturalNil|)))
(assert (forall ((x Natural) (e Natural) (xs List<Natural>)) (!
  (=
    (drop<List<Natural>> (successor<Natural> x) (cons<List<Natural>> e xs))
    (drop<List<Natural>> x xs))
  :pattern ((cons<List<Natural>> e xs) (drop<List<Natural>> x xs))
  :pattern ((drop<List<Natural>> (successor<Natural> x) (cons<List<Natural>> e xs)))
  :qid |prog.dropSuccessorCons|)))
(assert (forall ((l List<Natural>)) (!
  (exists ((t Natural)) (!
    (=
      (take<List<Natural>> (as zero<Natural>  Natural) l)
      (nil<List<Natural>> t))
    :pattern ((nil<List<Natural>> t))
    ))
  :pattern ((take<List<Natural>> (as zero<Natural>  Natural) l))
  :qid |prog.takeZeroList|)))
(assert (forall ((n Natural) (t Natural)) (!
  (= (take<List<Natural>> n (nil<List<Natural>> t)) (nil<List<Natural>> t))
  :pattern ((take<List<Natural>> n (nil<List<Natural>> t)))
  :qid |prog.takeNaturalNil|)))
(assert (forall ((x Natural) (y Natural) (ys List<Natural>)) (!
  (=
    (take<List<Natural>> (successor<Natural> x) (cons<List<Natural>> y ys))
    (cons<List<Natural>> y (take<List<Natural>> x ys)))
  :pattern ((successor<Natural> x) (cons<List<Natural>> y (take<List<Natural>> x ys)))
  :pattern ((cons<List<Natural>> y ys) (take<List<Natural>> x ys))
  :pattern ((cons<List<Natural>> y ys) (cons<List<Natural>> y (take<List<Natural>> x ys)))
  :pattern ((take<List<Natural>> (successor<Natural> x) (cons<List<Natural>> y ys)))
  :pattern ((cons<List<Natural>> y (take<List<Natural>> x ys)))
  :qid |prog.takeSuccessorCons|)))
(assert (forall ((x Natural) (t Natural)) (!
  (= (count<Natural> x (nil<List<Natural>> t)) (as zero<Natural>  Natural))
  :pattern ((count<Natural> x (nil<List<Natural>> t)))
  :qid |prog.countNaturalNil|)))
(assert (forall ((x Natural) (y Natural) (ys List<Natural>)) (!
  (=
    (count<Natural> x (cons<List<Natural>> y ys))
    (ite
      (= x y)
      (successor<Natural> (count<Natural> x ys))
      (count<Natural> x ys)))
  :pattern ((cons<List<Natural>> y ys) (count<Natural> x ys))
  :pattern ((cons<List<Natural>> y ys) (successor<Natural> (count<Natural> x ys)))
  :pattern ((count<Natural> x (cons<List<Natural>> y ys)))
  :qid |prog.countNaturalCons|)))
(assert (forall ((t Natural)) (!
  (= (butLast<List<Natural>> (nil<List<Natural>> t)) (nil<List<Natural>> t))
  :pattern ((butLast<List<Natural>> (nil<List<Natural>> t)))
  :qid |prog.butLastNil|)))
(assert (forall ((x Natural) (t Natural)) (!
  (=
    (butLast<List<Natural>> (cons<List<Natural>> x (nil<List<Natural>> t)))
    (nil<List<Natural>> t))
  :pattern ((butLast<List<Natural>> (cons<List<Natural>> x (nil<List<Natural>> t))))
  :qid |prog.butLastConsNil|)))
(assert (forall ((x Natural) (e Natural) (l List<Natural>)) (!
  (=
    (cons<List<Natural>> x (cons<List<Natural>> e l))
    (cons<List<Natural>> x (butLast<List<Natural>> (cons<List<Natural>> e l))))
  :pattern ((cons<List<Natural>> x (cons<List<Natural>> e l)))
  :pattern ((cons<List<Natural>> x (butLast<List<Natural>> (cons<List<Natural>> e l))))
  :qid |prog.butLastConsCons|)))
(assert (forall ((t Natural)) (!
  (= (last<Natural> (nil<List<Natural>> t)) (as zero<Natural>  Natural))
  :pattern ((last<Natural> (nil<List<Natural>> t)))
  :qid |prog.lastNil|)))
(assert (forall ((x Natural) (t Natural)) (!
  (= (last<Natural> (cons<List<Natural>> x (nil<List<Natural>> t))) x)
  :pattern ((last<Natural> (cons<List<Natural>> x (nil<List<Natural>> t))))
  :qid |prog.lastConsNil|)))
(assert (forall ((x Natural) (n Natural) (l List<Natural>)) (!
  (=
    (last<Natural> (cons<List<Natural>> x (cons<List<Natural>> n l)))
    (last<Natural> (cons<List<Natural>> n l)))
  :pattern ((last<Natural> (cons<List<Natural>> x (cons<List<Natural>> n l))))
  :qid |prog.lastConsCons|)))
(assert (forall ((t Natural)) (!
  (sorted<Bool> (nil<List<Natural>> t))
  :pattern ((sorted<Bool> (nil<List<Natural>> t)))
  :qid |prog.sortedNil|)))
(assert (forall ((x Natural) (t Natural)) (!
  (sorted<Bool> (cons<List<Natural>> x (nil<List<Natural>> t)))
  :pattern ((sorted<Bool> (cons<List<Natural>> x (nil<List<Natural>> t))))
  :qid |prog.sortedConsNil|)))
(assert (forall ((x Natural) (y Natural) (ys List<Natural>)) (!
  (=
    (sorted<Bool> (cons<List<Natural>> x (cons<List<Natural>> y ys)))
    (and (lessEqual<Bool> x y) (sorted<Bool> (cons<List<Natural>> y ys))))
  :pattern ((cons<List<Natural>> y ys) (lessEqual<Bool> x y))
  :pattern ((sorted<Bool> (cons<List<Natural>> x (cons<List<Natural>> y ys))))
  :pattern ((lessEqual<Bool> x y) (cons<List<Natural>> y ys))
  :pattern ((lessEqual<Bool> x y) (sorted<Bool> (cons<List<Natural>> y ys)))
  :qid |prog.sortedConsCons|)))
(assert (forall ((n Natural) (t Natural)) (!
  (=
    (insertSorting<List<Natural>> n (nil<List<Natural>> t))
    (cons<List<Natural>> n (nil<List<Natural>> t)))
  :pattern ((insertSorting<List<Natural>> n (nil<List<Natural>> t)))
  :pattern ((cons<List<Natural>> n (nil<List<Natural>> t)))
  :qid |prog.insertSortingNil|)))
(assert (forall ((n Natural) (x Natural) (xs List<Natural>)) (!
  (=
    (insertSorting<List<Natural>> n (cons<List<Natural>> x xs))
    (ite
      (lessEqual<Bool> n x)
      (cons<List<Natural>> n (cons<List<Natural>> x xs))
      (cons<List<Natural>> x (insertSorting<List<Natural>> n xs))))
  :pattern ((cons<List<Natural>> x xs) (lessEqual<Bool> n x))
  :pattern ((cons<List<Natural>> x xs) (insertSorting<List<Natural>> n xs))
  :pattern ((cons<List<Natural>> x xs) (cons<List<Natural>> x (insertSorting<List<Natural>> n xs)))
  :pattern ((insertSorting<List<Natural>> n (cons<List<Natural>> x xs)))
  :pattern ((lessEqual<Bool> n x) (cons<List<Natural>> x xs))
  :pattern ((lessEqual<Bool> n x) (cons<List<Natural>> n (cons<List<Natural>> x xs)))
  :pattern ((lessEqual<Bool> n x) (insertSorting<List<Natural>> n xs))
  :pattern ((lessEqual<Bool> n x) (cons<List<Natural>> x (insertSorting<List<Natural>> n xs)))
  :pattern ((cons<List<Natural>> n (cons<List<Natural>> x xs)))
  :pattern ((cons<List<Natural>> x (insertSorting<List<Natural>> n xs)))
  :qid |prog.insertSortingCons|)))
(assert (forall ((n Natural) (t Natural)) (!
  (=
    (insert<List<Natural>> n (nil<List<Natural>> t))
    (cons<List<Natural>> n (nil<List<Natural>> t)))
  :pattern ((insert<List<Natural>> n (nil<List<Natural>> t)))
  :pattern ((cons<List<Natural>> n (nil<List<Natural>> t)))
  :qid |prog.insertNil|)))
(assert (forall ((n Natural) (x Natural) (xs List<Natural>)) (!
  (=
    (insert<List<Natural>> n (cons<List<Natural>> x xs))
    (ite
      (less<Bool> n x)
      (cons<List<Natural>> n (cons<List<Natural>> x xs))
      (cons<List<Natural>> x (insert<List<Natural>> n xs))))
  :pattern ((cons<List<Natural>> x xs) (less<Bool> n x))
  :pattern ((cons<List<Natural>> x xs) (insert<List<Natural>> n xs))
  :pattern ((cons<List<Natural>> x xs) (cons<List<Natural>> x (insert<List<Natural>> n xs)))
  :pattern ((insert<List<Natural>> n (cons<List<Natural>> x xs)))
  :pattern ((less<Bool> n x) (cons<List<Natural>> x xs))
  :pattern ((less<Bool> n x) (cons<List<Natural>> n (cons<List<Natural>> x xs)))
  :pattern ((less<Bool> n x) (insert<List<Natural>> n xs))
  :pattern ((less<Bool> n x) (cons<List<Natural>> x (insert<List<Natural>> n xs)))
  :pattern ((cons<List<Natural>> n (cons<List<Natural>> x xs)))
  :pattern ((cons<List<Natural>> x (insert<List<Natural>> n xs)))
  :qid |prog.insertCons|)))
(assert (forall ((n Natural) (t Natural)) (!
  (=
    (insertUnlessPresent<List<Natural>> n (nil<List<Natural>> t))
    (cons<List<Natural>> n (nil<List<Natural>> t)))
  :pattern ((insertUnlessPresent<List<Natural>> n (nil<List<Natural>> t)))
  :pattern ((cons<List<Natural>> n (nil<List<Natural>> t)))
  :qid |prog.insertUnlessPresentNil|)))
(assert (forall ((n Natural) (x Natural) (xs List<Natural>)) (!
  (=
    (insertUnlessPresent<List<Natural>> n (cons<List<Natural>> x xs))
    (ite
      (= n x)
      (cons<List<Natural>> x xs)
      (cons<List<Natural>> x (insertUnlessPresent<List<Natural>> n xs))))
  :pattern ((cons<List<Natural>> x xs) (insertUnlessPresent<List<Natural>> n xs))
  :pattern ((cons<List<Natural>> x xs) (cons<List<Natural>> x (insertUnlessPresent<List<Natural>> n xs)))
  :pattern ((insertUnlessPresent<List<Natural>> n (cons<List<Natural>> x xs)))
  :pattern ((cons<List<Natural>> x (insertUnlessPresent<List<Natural>> n xs)))
  :qid |prog.insertUnlessPresentCons|)))
(assert (forall ((t Natural)) (!
  (= (sort<List<Natural>> (nil<List<Natural>> t)) (nil<List<Natural>> t))
  :pattern ((sort<List<Natural>> (nil<List<Natural>> t)))
  :qid |prog.sortNil|)))
(assert (forall ((x Natural) (xs List<Natural>)) (!
  (=
    (sort<List<Natural>> (cons<List<Natural>> x xs))
    (insertSorting<List<Natural>> x (sort<List<Natural>> xs)))
  :pattern ((sort<List<Natural>> (cons<List<Natural>> x xs)))
  :pattern ((insertSorting<List<Natural>> x (sort<List<Natural>> xs)))
  :qid |prog.sortCons|)))
(assert (forall ((t Natural)) (!
  (= (sum<Natural> (nil<List<Natural>> t)) (as zero<Natural>  Natural))
  :pattern ((sum<Natural> (nil<List<Natural>> t)))
  :qid |prog.sumNil|)))
(assert (forall ((n Natural) (l List<Natural>)) (!
  (= (sum<Natural> (cons<List<Natural>> n l)) (plus<Natural> n (sum<Natural> l)))
  :pattern ((sum<Natural> (cons<List<Natural>> n l)))
  :pattern ((plus<Natural> n (sum<Natural> l)))
  :qid |prog.sumCons|)))
(assert (forall ((t Natural)) (!
  (not (hasMultiple<Bool> (nil<List<Natural>> t)))
  :pattern ((hasMultiple<Bool> (nil<List<Natural>> t)))
  :qid |prog.hasMultipleNil|)))
(assert (forall ((n Natural) (l List<Natural>)) (!
  (=
    (hasMultiple<Bool> (cons<List<Natural>> n l))
    (or
      (less<Bool> (successor<Natural> (as zero<Natural>  Natural)) n)
      (hasMultiple<Bool> l)))
  :pattern ((hasMultiple<Bool> (cons<List<Natural>> n l)))
  :pattern ((less<Bool> (successor<Natural> (as zero<Natural>  Natural)) n) (hasMultiple<Bool> l))
  :qid |prog.hasMultipleCons|)))
(assert (forall ((n Natural)) (!
  (isZeroOrSuccessor<Bool> n)
  :pattern ((isZeroOrSuccessor<Bool> n))
  :qid |prog.zeroOrSuccessor|)))
(assert (forall ((n Natural)) (!
  (=
    (isZeroOrSuccessor<Bool> n)
    (or
      (= n (as zero<Natural>  Natural))
      (exists ((p Natural)) (!
        (= n (successor<Natural> p))
        :pattern ((successor<Natural> p))
        ))))
  :pattern ((isZeroOrSuccessor<Bool> n))
  :qid |prog.isZeroOrSuccessorNatural|)))
(assert true)
(assert (forall ((n Natural)) (!
  (not (= (as zero<Natural>  Natural) (successor<Natural> n)))
  :pattern ((successor<Natural> n))
  :qid |prog.equalZeroSuccessor|)))
(assert (forall ((n Natural)) (!
  (not (= (successor<Natural> n) (as zero<Natural>  Natural)))
  :pattern ((successor<Natural> n))
  :qid |prog.equalSuccessorZero|)))
(assert (forall ((x Natural) (y Natural)) (!
  (= (= (successor<Natural> x) (successor<Natural> y)) (= x y))
  :pattern ((successor<Natural> x) (successor<Natural> y))
  :qid |prog.equalSuccessorSuccessor|)))
(assert (forall ((n Natural)) (!
  (lessEqual<Bool> (as zero<Natural>  Natural) n)
  :pattern ((lessEqual<Bool> (as zero<Natural>  Natural) n))
  :qid |prog.lessEqualZeroNatural|)))
(assert (forall ((n Natural)) (!
  (not (lessEqual<Bool> (successor<Natural> n) (as zero<Natural>  Natural)))
  :pattern ((lessEqual<Bool> (successor<Natural> n) (as zero<Natural>  Natural)))
  :qid |prog.lessEqualSuccessorZero|)))
(assert (forall ((x Natural) (y Natural)) (!
  (=
    (lessEqual<Bool> (successor<Natural> x) (successor<Natural> y))
    (lessEqual<Bool> x y))
  :pattern ((successor<Natural> x) (lessEqual<Bool> x y))
  :pattern ((successor<Natural> y) (lessEqual<Bool> x y))
  :pattern ((lessEqual<Bool> (successor<Natural> x) (successor<Natural> y)))
  :pattern ((lessEqual<Bool> x y))
  :qid |prog.lessEqualSuccessorSuccessor|)))
(assert (forall ((n Natural)) (!
  (not (less<Bool> n (as zero<Natural>  Natural)))
  :pattern ((less<Bool> n (as zero<Natural>  Natural)))
  :qid |prog.lessNaturalZero|)))
(assert (forall ((n Natural)) (!
  (less<Bool> (as zero<Natural>  Natural) (successor<Natural> n))
  :pattern ((less<Bool> (as zero<Natural>  Natural) (successor<Natural> n)))
  :qid |prog.lessZeroSuccessor|)))
(assert (forall ((x Natural) (y Natural)) (!
  (= (less<Bool> (successor<Natural> x) (successor<Natural> y)) (less<Bool> x y))
  :pattern ((successor<Natural> x) (less<Bool> x y))
  :pattern ((successor<Natural> y) (less<Bool> x y))
  :pattern ((less<Bool> (successor<Natural> x) (successor<Natural> y)))
  :pattern ((less<Bool> x y))
  :qid |prog.lessSuccessorSuccessor|)))
(assert (forall ((y Natural)) (!
  (= (plus<Natural> (as zero<Natural>  Natural) y) y)
  :pattern ((plus<Natural> (as zero<Natural>  Natural) y))
  :qid |prog.plusZeroNatural|)))
(assert (forall ((x Natural) (y Natural)) (!
  (=
    (plus<Natural> (successor<Natural> x) y)
    (successor<Natural> (plus<Natural> x y)))
  :pattern ((successor<Natural> x) (plus<Natural> x y))
  :pattern ((successor<Natural> x) (successor<Natural> (plus<Natural> x y)))
  :pattern ((plus<Natural> (successor<Natural> x) y))
  :pattern ((successor<Natural> (plus<Natural> x y)))
  :qid |prog.plusSuccessorNatural|)))
(assert (forall ((n Natural)) (!
  (= (minus<Natural> (as zero<Natural>  Natural) n) (as zero<Natural>  Natural))
  :pattern ((minus<Natural> (as zero<Natural>  Natural) n))
  :qid |prog.minusZeroNatural|)))
(assert (forall ((x Natural)) (!
  (= (minus<Natural> x (as zero<Natural>  Natural)) x)
  :pattern ((minus<Natural> x (as zero<Natural>  Natural)))
  :qid |prog.minusNaturalZero|)))
(assert (forall ((x Natural) (y Natural)) (!
  (=
    (minus<Natural> (successor<Natural> x) (successor<Natural> y))
    (minus<Natural> x y))
  :pattern ((successor<Natural> x) (minus<Natural> x y))
  :pattern ((successor<Natural> y) (minus<Natural> x y))
  :pattern ((minus<Natural> (successor<Natural> x) (successor<Natural> y)))
  :pattern ((minus<Natural> x y))
  :qid |prog.minusSuccessorSuccessor|)))
(assert (forall ((n Natural)) (!
  (= (times<Natural> (as zero<Natural>  Natural) n) (as zero<Natural>  Natural))
  :pattern ((times<Natural> (as zero<Natural>  Natural) n))
  :qid |prog.timesZeroNatural|)))
(assert (forall ((x Natural) (y Natural)) (!
  (=
    (times<Natural> (successor<Natural> x) y)
    (plus<Natural> y (times<Natural> x y)))
  :pattern ((successor<Natural> x) (times<Natural> x y))
  :pattern ((successor<Natural> x) (plus<Natural> y (times<Natural> x y)))
  :pattern ((times<Natural> (successor<Natural> x) y))
  :pattern ((plus<Natural> y (times<Natural> x y)))
  :qid |prog.timesSuccessorNatural|)))
(assert (forall ((y Natural)) (!
  (=
    (minimum<Natural> (as zero<Natural>  Natural) y)
    (as zero<Natural>  Natural))
  :pattern ((minimum<Natural> (as zero<Natural>  Natural) y))
  :qid |prog.minimumZeroNatural|)))
(assert (forall ((x Natural)) (!
  (=
    (minimum<Natural> x (as zero<Natural>  Natural))
    (as zero<Natural>  Natural))
  :pattern ((minimum<Natural> x (as zero<Natural>  Natural)))
  :qid |prog.minimumNaturalZero|)))
(assert (forall ((x Natural) (y Natural)) (!
  (=
    (minimum<Natural> (successor<Natural> x) (successor<Natural> y))
    (successor<Natural> (minimum<Natural> x y)))
  :pattern ((successor<Natural> x) (minimum<Natural> x y))
  :pattern ((successor<Natural> x) (successor<Natural> (minimum<Natural> x y)))
  :pattern ((successor<Natural> y) (minimum<Natural> x y))
  :pattern ((successor<Natural> y) (successor<Natural> (minimum<Natural> x y)))
  :pattern ((minimum<Natural> (successor<Natural> x) (successor<Natural> y)))
  :pattern ((successor<Natural> (minimum<Natural> x y)))
  :qid |prog.minimumSuccessorSuccessor|)))
(assert (forall ((y Natural)) (!
  (= (maximum<Natural> (as zero<Natural>  Natural) y) y)
  :pattern ((maximum<Natural> (as zero<Natural>  Natural) y))
  :qid |prog.maximumZeroNatural|)))
(assert (forall ((x Natural)) (!
  (= (maximum<Natural> x (as zero<Natural>  Natural)) x)
  :pattern ((maximum<Natural> x (as zero<Natural>  Natural)))
  :qid |prog.maximumNaturalZero|)))
(assert (forall ((x Natural) (y Natural)) (!
  (=
    (maximum<Natural> (successor<Natural> x) (successor<Natural> y))
    (successor<Natural> (maximum<Natural> x y)))
  :pattern ((successor<Natural> x) (maximum<Natural> x y))
  :pattern ((successor<Natural> x) (successor<Natural> (maximum<Natural> x y)))
  :pattern ((successor<Natural> y) (maximum<Natural> x y))
  :pattern ((successor<Natural> y) (successor<Natural> (maximum<Natural> x y)))
  :pattern ((maximum<Natural> (successor<Natural> x) (successor<Natural> y)))
  :pattern ((successor<Natural> (maximum<Natural> x y)))
  :qid |prog.maximumSuccessorSuccessor|)))
(assert (forall ((l List<Int>)) (!
  (isNilOrCons<Bool> l)
  :pattern ((isNilOrCons<Bool> l))
  :qid |prog.nilOrCons|)))
(assert (forall ((l List<Int>)) (!
  (=
    (isNilOrCons<Bool> l)
    (or
      (exists ((t Int)) (!
        (= l (nil<List<Int>> t))
        :pattern ((nil<List<Int>> t))
        ))
      (exists ((e Int) (r List<Int>)) (!
        (= l (cons<List<Int>> e r))
        :pattern ((cons<List<Int>> e r))
        ))))
  :pattern ((isNilOrCons<Bool> l))
  :qid |prog.isNilOrConsList|)))
(assert (forall ((t Int)) (!
  (empty<Bool> (nil<List<Int>> t))
  :pattern ((empty<Bool> (nil<List<Int>> t)))
  :qid |prog.emptyNil|)))
(assert (forall ((e Int) (l List<Int>)) (!
  (not (empty<Bool> (cons<List<Int>> e l)))
  :pattern ((empty<Bool> (cons<List<Int>> e l)))
  :qid |prog.emptyCons|)))
(assert (forall ((t Int) (ys List<Int>)) (!
  (= (concatenate<List<Int>> (nil<List<Int>> t) ys) ys)
  :pattern ((concatenate<List<Int>> (nil<List<Int>> t) ys))
  :qid |prog.concatenateNilList|)))
(assert (forall ((x Int) (xs List<Int>) (ys List<Int>)) (!
  (=
    (concatenate<List<Int>> (cons<List<Int>> x xs) ys)
    (cons<List<Int>> x (concatenate<List<Int>> xs ys)))
  :pattern ((cons<List<Int>> x xs) (concatenate<List<Int>> xs ys))
  :pattern ((cons<List<Int>> x xs) (cons<List<Int>> x (concatenate<List<Int>> xs ys)))
  :pattern ((concatenate<List<Int>> (cons<List<Int>> x xs) ys))
  :pattern ((cons<List<Int>> x (concatenate<List<Int>> xs ys)))
  :qid |prog.concatenateConsList|)))
(assert (forall ((t Int)) (!
  (= (reverse<List<Int>> (nil<List<Int>> t)) (nil<List<Int>> t))
  :pattern ((reverse<List<Int>> (nil<List<Int>> t)))
  :qid |prog.reverseNil|)))
(assert (forall ((x Int) (xs List<Int>) (t Int)) (!
  (=
    (reverse<List<Int>> (cons<List<Int>> x xs))
    (concatenate<List<Int>> (reverse<List<Int>> xs) (cons<List<Int>> x (nil<List<Int>> t))))
  :pattern ((cons<List<Int>> x xs) (concatenate<List<Int>> (reverse<List<Int>> xs) (cons<List<Int>> x (nil<List<Int>> t))))
  :pattern ((reverse<List<Int>> (cons<List<Int>> x xs)) (nil<List<Int>> t))
  :pattern ((reverse<List<Int>> (cons<List<Int>> x xs)) (cons<List<Int>> x (nil<List<Int>> t)))
  :pattern ((reverse<List<Int>> (cons<List<Int>> x xs)) (concatenate<List<Int>> (reverse<List<Int>> xs) (cons<List<Int>> x (nil<List<Int>> t))))
  :pattern ((concatenate<List<Int>> (reverse<List<Int>> xs) (cons<List<Int>> x (nil<List<Int>> t))))
  :qid |prog.reverseCons|)))
(assert (forall ((t Int)) (!
  (= (length<Natural> (nil<List<Int>> t)) (as zero<Natural>  Natural))
  :pattern ((length<Natural> (nil<List<Int>> t)))
  :qid |prog.lengthNil|)))
(assert (forall ((e Int) (xs List<Int>)) (!
  (=
    (length<Natural> (cons<List<Int>> e xs))
    (successor<Natural> (length<Natural> xs)))
  :pattern ((length<Natural> (cons<List<Int>> e xs)))
  :qid |prog.lengthCons|)))
(assert (forall ((xs List<Int>)) (!
  (= (drop<List<Int>> (as zero<Natural>  Natural) xs) xs)
  :pattern ((drop<List<Int>> (as zero<Natural>  Natural) xs))
  :qid |prog.dropZeroList|)))
(assert (forall ((n Natural) (t Int)) (!
  (= (drop<List<Int>> n (nil<List<Int>> t)) (nil<List<Int>> t))
  :pattern ((drop<List<Int>> n (nil<List<Int>> t)))
  :qid |prog.dropNaturalNil|)))
(assert (forall ((x Natural) (e Int) (xs List<Int>)) (!
  (=
    (drop<List<Int>> (successor<Natural> x) (cons<List<Int>> e xs))
    (drop<List<Int>> x xs))
  :pattern ((cons<List<Int>> e xs) (drop<List<Int>> x xs))
  :pattern ((drop<List<Int>> (successor<Natural> x) (cons<List<Int>> e xs)))
  :qid |prog.dropSuccessorCons|)))
(assert (forall ((l List<Int>)) (!
  (exists ((t Int)) (!
    (= (take<List<Int>> (as zero<Natural>  Natural) l) (nil<List<Int>> t))
    :pattern ((nil<List<Int>> t))
    ))
  :pattern ((take<List<Int>> (as zero<Natural>  Natural) l))
  :qid |prog.takeZeroList|)))
(assert (forall ((n Natural) (t Int)) (!
  (= (take<List<Int>> n (nil<List<Int>> t)) (nil<List<Int>> t))
  :pattern ((take<List<Int>> n (nil<List<Int>> t)))
  :qid |prog.takeNaturalNil|)))
(assert (forall ((x Natural) (y Int) (ys List<Int>)) (!
  (=
    (take<List<Int>> (successor<Natural> x) (cons<List<Int>> y ys))
    (cons<List<Int>> y (take<List<Int>> x ys)))
  :pattern ((successor<Natural> x) (cons<List<Int>> y (take<List<Int>> x ys)))
  :pattern ((cons<List<Int>> y ys) (take<List<Int>> x ys))
  :pattern ((cons<List<Int>> y ys) (cons<List<Int>> y (take<List<Int>> x ys)))
  :pattern ((take<List<Int>> (successor<Natural> x) (cons<List<Int>> y ys)))
  :pattern ((cons<List<Int>> y (take<List<Int>> x ys)))
  :qid |prog.takeSuccessorCons|)))
(assert (forall ((t Int)) (!
  (= (butLast<List<Int>> (nil<List<Int>> t)) (nil<List<Int>> t))
  :pattern ((butLast<List<Int>> (nil<List<Int>> t)))
  :qid |prog.butLastNil|)))
(assert (forall ((x Int) (t Int)) (!
  (=
    (butLast<List<Int>> (cons<List<Int>> x (nil<List<Int>> t)))
    (nil<List<Int>> t))
  :pattern ((butLast<List<Int>> (cons<List<Int>> x (nil<List<Int>> t))))
  :qid |prog.butLastConsNil|)))
(assert (forall ((x Int) (e Int) (l List<Int>)) (!
  (=
    (cons<List<Int>> x (cons<List<Int>> e l))
    (cons<List<Int>> x (butLast<List<Int>> (cons<List<Int>> e l))))
  :pattern ((cons<List<Int>> x (cons<List<Int>> e l)))
  :pattern ((cons<List<Int>> x (butLast<List<Int>> (cons<List<Int>> e l))))
  :qid |prog.butLastConsCons|)))
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
; ---------- property01 ----------
(set-option :timeout 0)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@0@01 $Snap)
(assert (= $t@0@01 $Snap.unit))
; [eval] (forall n: Natural, xs: List[Natural] :: { (concatenate((take(n, xs): List[Natural]), (drop(n, xs): List[Natural])): List[Natural]) } (concatenate((take(n, xs): List[Natural]), (drop(n, xs): List[Natural])): List[Natural]) == xs)
(declare-const n@1@01 Natural)
(declare-const xs@2@01 List<Natural>)
(push) ; 3
; [eval] (concatenate((take(n, xs): List[Natural]), (drop(n, xs): List[Natural])): List[Natural]) == xs
; [eval] (concatenate((take(n, xs): List[Natural]), (drop(n, xs): List[Natural])): List[Natural])
; [eval] (take(n, xs): List[Natural])
; [eval] (drop(n, xs): List[Natural])
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((n@1@01 Natural) (xs@2@01 List<Natural>)) (!
  (=
    (concatenate<List<Natural>> (take<List<Natural>> n@1@01 xs@2@01) (drop<List<Natural>> n@1@01 xs@2@01))
    xs@2@01)
  :pattern ((concatenate<List<Natural>> (take<List<Natural>> n@1@01 xs@2@01) (drop<List<Natural>> n@1@01 xs@2@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@438@12@439@48|)))
(pop) ; 2
(push) ; 2
; [eval] (forall t_0: Natural :: { (nil(t_0): List[Natural]) } (forall n_3: Natural :: { (concatenate((take(n_3, (nil(t_0): List[Natural])): List[Natural]), (drop(n_3, (nil(t_0): List[Natural])): List[Natural])): List[Natural]) } (concatenate((take(n_3, (nil(t_0): List[Natural])): List[Natural]), (drop(n_3, (nil(t_0): List[Natural])): List[Natural])): List[Natural]) == (nil(t_0): List[Natural])))
(declare-const t_0@3@01 Natural)
(push) ; 3
; [eval] (forall n_3: Natural :: { (concatenate((take(n_3, (nil(t_0): List[Natural])): List[Natural]), (drop(n_3, (nil(t_0): List[Natural])): List[Natural])): List[Natural]) } (concatenate((take(n_3, (nil(t_0): List[Natural])): List[Natural]), (drop(n_3, (nil(t_0): List[Natural])): List[Natural])): List[Natural]) == (nil(t_0): List[Natural]))
(declare-const n_3@4@01 Natural)
(push) ; 4
; [eval] (concatenate((take(n_3, (nil(t_0): List[Natural])): List[Natural]), (drop(n_3, (nil(t_0): List[Natural])): List[Natural])): List[Natural]) == (nil(t_0): List[Natural])
; [eval] (concatenate((take(n_3, (nil(t_0): List[Natural])): List[Natural]), (drop(n_3, (nil(t_0): List[Natural])): List[Natural])): List[Natural])
; [eval] (take(n_3, (nil(t_0): List[Natural])): List[Natural])
; [eval] (nil(t_0): List[Natural])
; [eval] (drop(n_3, (nil(t_0): List[Natural])): List[Natural])
; [eval] (nil(t_0): List[Natural])
; [eval] (nil(t_0): List[Natural])
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 3
(assert (not (forall ((t_0@3@01 Natural)) (!
  (forall ((n_3@4@01 Natural)) (!
    (=
      (concatenate<List<Natural>> (take<List<Natural>> n_3@4@01 (nil<List<Natural>> t_0@3@01)) (drop<List<Natural>> n_3@4@01 (nil<List<Natural>> t_0@3@01)))
      (nil<List<Natural>> t_0@3@01))
    :pattern ((concatenate<List<Natural>> (take<List<Natural>> n_3@4@01 (nil<List<Natural>> t_0@3@01)) (drop<List<Natural>> n_3@4@01 (nil<List<Natural>> t_0@3@01))))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@440@31@441@74|))
  :pattern ((nil<List<Natural>> t_0@3@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@440@8@441@74|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((t_0@3@01 Natural)) (!
  (forall ((n_3@4@01 Natural)) (!
    (=
      (concatenate<List<Natural>> (take<List<Natural>> n_3@4@01 (nil<List<Natural>> t_0@3@01)) (drop<List<Natural>> n_3@4@01 (nil<List<Natural>> t_0@3@01)))
      (nil<List<Natural>> t_0@3@01))
    :pattern ((concatenate<List<Natural>> (take<List<Natural>> n_3@4@01 (nil<List<Natural>> t_0@3@01)) (drop<List<Natural>> n_3@4@01 (nil<List<Natural>> t_0@3@01))))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@440@31@441@74|))
  :pattern ((nil<List<Natural>> t_0@3@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@440@8@441@74|)))
; [eval] (forall l_0: List[Natural] :: { (isNilOrCons(l_0): Bool) } (isNilOrCons(l_0): Bool) ==> (forall n_4: Natural :: { (concatenate((take(n_4, l_0): List[Natural]), (drop(n_4, l_0): List[Natural])): List[Natural]) } (concatenate((take(n_4, l_0): List[Natural]), (drop(n_4, l_0): List[Natural])): List[Natural]) == l_0) ==> (forall e_0: Natural :: { isZeroOrSuccessor(e_0) } { (cons(e_0, l_0): List[Natural]) } isZeroOrSuccessor(e_0) ==> (forall n_5: Natural :: { isZeroOrSuccessor(n_5) } { (concatenate((take(n_5, (cons(e_0, l_0): List[Natural])): List[Natural]), (drop(n_5, (cons(e_0, l_0): List[Natural])): List[Natural])): List[Natural]) } isZeroOrSuccessor(n_5) ==> (concatenate((take(n_5, (cons(e_0, l_0): List[Natural])): List[Natural]), (drop(n_5, (cons(e_0, l_0): List[Natural])): List[Natural])): List[Natural]) == (cons(e_0, l_0): List[Natural]))))
(declare-const l_0@5@01 List<Natural>)
(push) ; 3
; [eval] (isNilOrCons(l_0): Bool) ==> (forall n_4: Natural :: { (concatenate((take(n_4, l_0): List[Natural]), (drop(n_4, l_0): List[Natural])): List[Natural]) } (concatenate((take(n_4, l_0): List[Natural]), (drop(n_4, l_0): List[Natural])): List[Natural]) == l_0) ==> (forall e_0: Natural :: { isZeroOrSuccessor(e_0) } { (cons(e_0, l_0): List[Natural]) } isZeroOrSuccessor(e_0) ==> (forall n_5: Natural :: { isZeroOrSuccessor(n_5) } { (concatenate((take(n_5, (cons(e_0, l_0): List[Natural])): List[Natural]), (drop(n_5, (cons(e_0, l_0): List[Natural])): List[Natural])): List[Natural]) } isZeroOrSuccessor(n_5) ==> (concatenate((take(n_5, (cons(e_0, l_0): List[Natural])): List[Natural]), (drop(n_5, (cons(e_0, l_0): List[Natural])): List[Natural])): List[Natural]) == (cons(e_0, l_0): List[Natural])))
; [eval] (isNilOrCons(l_0): Bool)
(push) ; 4
; [then-branch: 0 | isNilOrCons[Bool](l_0@5@01) | live]
; [else-branch: 0 | !(isNilOrCons[Bool](l_0@5@01)) | live]
(push) ; 5
; [then-branch: 0 | isNilOrCons[Bool](l_0@5@01)]
(assert (isNilOrCons<Bool> l_0@5@01))
; [eval] (forall n_4: Natural :: { (concatenate((take(n_4, l_0): List[Natural]), (drop(n_4, l_0): List[Natural])): List[Natural]) } (concatenate((take(n_4, l_0): List[Natural]), (drop(n_4, l_0): List[Natural])): List[Natural]) == l_0) ==> (forall e_0: Natural :: { isZeroOrSuccessor(e_0) } { (cons(e_0, l_0): List[Natural]) } isZeroOrSuccessor(e_0) ==> (forall n_5: Natural :: { isZeroOrSuccessor(n_5) } { (concatenate((take(n_5, (cons(e_0, l_0): List[Natural])): List[Natural]), (drop(n_5, (cons(e_0, l_0): List[Natural])): List[Natural])): List[Natural]) } isZeroOrSuccessor(n_5) ==> (concatenate((take(n_5, (cons(e_0, l_0): List[Natural])): List[Natural]), (drop(n_5, (cons(e_0, l_0): List[Natural])): List[Natural])): List[Natural]) == (cons(e_0, l_0): List[Natural])))
; [eval] (forall n_4: Natural :: { (concatenate((take(n_4, l_0): List[Natural]), (drop(n_4, l_0): List[Natural])): List[Natural]) } (concatenate((take(n_4, l_0): List[Natural]), (drop(n_4, l_0): List[Natural])): List[Natural]) == l_0)
(declare-const n_4@6@01 Natural)
(push) ; 6
; [eval] (concatenate((take(n_4, l_0): List[Natural]), (drop(n_4, l_0): List[Natural])): List[Natural]) == l_0
; [eval] (concatenate((take(n_4, l_0): List[Natural]), (drop(n_4, l_0): List[Natural])): List[Natural])
; [eval] (take(n_4, l_0): List[Natural])
; [eval] (drop(n_4, l_0): List[Natural])
(pop) ; 6
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 6
; [then-branch: 1 | QA n_4@6@01 :: concatenate[List[Natural]](take[List[Natural]](n_4@6@01, l_0@5@01), drop[List[Natural]](n_4@6@01, l_0@5@01)) == l_0@5@01 | live]
; [else-branch: 1 | !(QA n_4@6@01 :: concatenate[List[Natural]](take[List[Natural]](n_4@6@01, l_0@5@01), drop[List[Natural]](n_4@6@01, l_0@5@01)) == l_0@5@01) | live]
(push) ; 7
; [then-branch: 1 | QA n_4@6@01 :: concatenate[List[Natural]](take[List[Natural]](n_4@6@01, l_0@5@01), drop[List[Natural]](n_4@6@01, l_0@5@01)) == l_0@5@01]
(assert (forall ((n_4@6@01 Natural)) (!
  (=
    (concatenate<List<Natural>> (take<List<Natural>> n_4@6@01 l_0@5@01) (drop<List<Natural>> n_4@6@01 l_0@5@01))
    l_0@5@01)
  :pattern ((concatenate<List<Natural>> (take<List<Natural>> n_4@6@01 l_0@5@01) (drop<List<Natural>> n_4@6@01 l_0@5@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@446@16@447@67|)))
; [eval] (forall e_0: Natural :: { isZeroOrSuccessor(e_0) } { (cons(e_0, l_0): List[Natural]) } isZeroOrSuccessor(e_0) ==> (forall n_5: Natural :: { isZeroOrSuccessor(n_5) } { (concatenate((take(n_5, (cons(e_0, l_0): List[Natural])): List[Natural]), (drop(n_5, (cons(e_0, l_0): List[Natural])): List[Natural])): List[Natural]) } isZeroOrSuccessor(n_5) ==> (concatenate((take(n_5, (cons(e_0, l_0): List[Natural])): List[Natural]), (drop(n_5, (cons(e_0, l_0): List[Natural])): List[Natural])): List[Natural]) == (cons(e_0, l_0): List[Natural])))
(declare-const e_0@7@01 Natural)
(push) ; 8
; [eval] isZeroOrSuccessor(e_0) ==> (forall n_5: Natural :: { isZeroOrSuccessor(n_5) } { (concatenate((take(n_5, (cons(e_0, l_0): List[Natural])): List[Natural]), (drop(n_5, (cons(e_0, l_0): List[Natural])): List[Natural])): List[Natural]) } isZeroOrSuccessor(n_5) ==> (concatenate((take(n_5, (cons(e_0, l_0): List[Natural])): List[Natural]), (drop(n_5, (cons(e_0, l_0): List[Natural])): List[Natural])): List[Natural]) == (cons(e_0, l_0): List[Natural]))
; [eval] isZeroOrSuccessor(e_0)
(push) ; 9
; [then-branch: 2 | isZeroOrSuccessor[Bool](e_0@7@01) | live]
; [else-branch: 2 | !(isZeroOrSuccessor[Bool](e_0@7@01)) | live]
(push) ; 10
; [then-branch: 2 | isZeroOrSuccessor[Bool](e_0@7@01)]
(assert (isZeroOrSuccessor<Bool> e_0@7@01))
; [eval] (forall n_5: Natural :: { isZeroOrSuccessor(n_5) } { (concatenate((take(n_5, (cons(e_0, l_0): List[Natural])): List[Natural]), (drop(n_5, (cons(e_0, l_0): List[Natural])): List[Natural])): List[Natural]) } isZeroOrSuccessor(n_5) ==> (concatenate((take(n_5, (cons(e_0, l_0): List[Natural])): List[Natural]), (drop(n_5, (cons(e_0, l_0): List[Natural])): List[Natural])): List[Natural]) == (cons(e_0, l_0): List[Natural]))
(declare-const n_5@8@01 Natural)
(push) ; 11
; [eval] isZeroOrSuccessor(n_5) ==> (concatenate((take(n_5, (cons(e_0, l_0): List[Natural])): List[Natural]), (drop(n_5, (cons(e_0, l_0): List[Natural])): List[Natural])): List[Natural]) == (cons(e_0, l_0): List[Natural])
; [eval] isZeroOrSuccessor(n_5)
(push) ; 12
; [then-branch: 3 | isZeroOrSuccessor[Bool](n_5@8@01) | live]
; [else-branch: 3 | !(isZeroOrSuccessor[Bool](n_5@8@01)) | live]
(push) ; 13
; [then-branch: 3 | isZeroOrSuccessor[Bool](n_5@8@01)]
(assert (isZeroOrSuccessor<Bool> n_5@8@01))
; [eval] (concatenate((take(n_5, (cons(e_0, l_0): List[Natural])): List[Natural]), (drop(n_5, (cons(e_0, l_0): List[Natural])): List[Natural])): List[Natural]) == (cons(e_0, l_0): List[Natural])
; [eval] (concatenate((take(n_5, (cons(e_0, l_0): List[Natural])): List[Natural]), (drop(n_5, (cons(e_0, l_0): List[Natural])): List[Natural])): List[Natural])
; [eval] (take(n_5, (cons(e_0, l_0): List[Natural])): List[Natural])
; [eval] (cons(e_0, l_0): List[Natural])
; [eval] (drop(n_5, (cons(e_0, l_0): List[Natural])): List[Natural])
; [eval] (cons(e_0, l_0): List[Natural])
; [eval] (cons(e_0, l_0): List[Natural])
(pop) ; 13
(push) ; 13
; [else-branch: 3 | !(isZeroOrSuccessor[Bool](n_5@8@01))]
(assert (not (isZeroOrSuccessor<Bool> n_5@8@01)))
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (or (not (isZeroOrSuccessor<Bool> n_5@8@01)) (isZeroOrSuccessor<Bool> n_5@8@01)))
(pop) ; 11
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((n_5@8@01 Natural)) (!
  (or
    (not (isZeroOrSuccessor<Bool> n_5@8@01))
    (isZeroOrSuccessor<Bool> n_5@8@01))
  :pattern ((isZeroOrSuccessor<Bool> n_5@8@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@453@23@459@73-aux|)))
(assert (forall ((n_5@8@01 Natural)) (!
  (or
    (not (isZeroOrSuccessor<Bool> n_5@8@01))
    (isZeroOrSuccessor<Bool> n_5@8@01))
  :pattern ((concatenate<List<Natural>> (take<List<Natural>> n_5@8@01 (cons<List<Natural>> e_0@7@01 l_0@5@01)) (drop<List<Natural>> n_5@8@01 (cons<List<Natural>> e_0@7@01 l_0@5@01))))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@453@23@459@73-aux|)))
(pop) ; 10
(push) ; 10
; [else-branch: 2 | !(isZeroOrSuccessor[Bool](e_0@7@01))]
(assert (not (isZeroOrSuccessor<Bool> e_0@7@01)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (isZeroOrSuccessor<Bool> e_0@7@01)
  (and
    (isZeroOrSuccessor<Bool> e_0@7@01)
    (forall ((n_5@8@01 Natural)) (!
      (or
        (not (isZeroOrSuccessor<Bool> n_5@8@01))
        (isZeroOrSuccessor<Bool> n_5@8@01))
      :pattern ((isZeroOrSuccessor<Bool> n_5@8@01))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@453@23@459@73-aux|))
    (forall ((n_5@8@01 Natural)) (!
      (or
        (not (isZeroOrSuccessor<Bool> n_5@8@01))
        (isZeroOrSuccessor<Bool> n_5@8@01))
      :pattern ((concatenate<List<Natural>> (take<List<Natural>> n_5@8@01 (cons<List<Natural>> e_0@7@01 l_0@5@01)) (drop<List<Natural>> n_5@8@01 (cons<List<Natural>> e_0@7@01 l_0@5@01))))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@453@23@459@73-aux|)))))
; Joined path conditions
(assert (or (not (isZeroOrSuccessor<Bool> e_0@7@01)) (isZeroOrSuccessor<Bool> e_0@7@01)))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((e_0@7@01 Natural)) (!
  (and
    (=>
      (isZeroOrSuccessor<Bool> e_0@7@01)
      (and
        (isZeroOrSuccessor<Bool> e_0@7@01)
        (forall ((n_5@8@01 Natural)) (!
          (or
            (not (isZeroOrSuccessor<Bool> n_5@8@01))
            (isZeroOrSuccessor<Bool> n_5@8@01))
          :pattern ((isZeroOrSuccessor<Bool> n_5@8@01))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@453@23@459@73-aux|))
        (forall ((n_5@8@01 Natural)) (!
          (or
            (not (isZeroOrSuccessor<Bool> n_5@8@01))
            (isZeroOrSuccessor<Bool> n_5@8@01))
          :pattern ((concatenate<List<Natural>> (take<List<Natural>> n_5@8@01 (cons<List<Natural>> e_0@7@01 l_0@5@01)) (drop<List<Natural>> n_5@8@01 (cons<List<Natural>> e_0@7@01 l_0@5@01))))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@453@23@459@73-aux|))))
    (or
      (not (isZeroOrSuccessor<Bool> e_0@7@01))
      (isZeroOrSuccessor<Bool> e_0@7@01)))
  :pattern ((isZeroOrSuccessor<Bool> e_0@7@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@448@19@459@73-aux|)))
(assert (forall ((e_0@7@01 Natural)) (!
  (and
    (=>
      (isZeroOrSuccessor<Bool> e_0@7@01)
      (and
        (isZeroOrSuccessor<Bool> e_0@7@01)
        (forall ((n_5@8@01 Natural)) (!
          (or
            (not (isZeroOrSuccessor<Bool> n_5@8@01))
            (isZeroOrSuccessor<Bool> n_5@8@01))
          :pattern ((isZeroOrSuccessor<Bool> n_5@8@01))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@453@23@459@73-aux|))
        (forall ((n_5@8@01 Natural)) (!
          (or
            (not (isZeroOrSuccessor<Bool> n_5@8@01))
            (isZeroOrSuccessor<Bool> n_5@8@01))
          :pattern ((concatenate<List<Natural>> (take<List<Natural>> n_5@8@01 (cons<List<Natural>> e_0@7@01 l_0@5@01)) (drop<List<Natural>> n_5@8@01 (cons<List<Natural>> e_0@7@01 l_0@5@01))))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@453@23@459@73-aux|))))
    (or
      (not (isZeroOrSuccessor<Bool> e_0@7@01))
      (isZeroOrSuccessor<Bool> e_0@7@01)))
  :pattern ((cons<List<Natural>> e_0@7@01 l_0@5@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@448@19@459@73-aux|)))
(pop) ; 7
(push) ; 7
; [else-branch: 1 | !(QA n_4@6@01 :: concatenate[List[Natural]](take[List[Natural]](n_4@6@01, l_0@5@01), drop[List[Natural]](n_4@6@01, l_0@5@01)) == l_0@5@01)]
(assert (not
  (forall ((n_4@6@01 Natural)) (!
    (=
      (concatenate<List<Natural>> (take<List<Natural>> n_4@6@01 l_0@5@01) (drop<List<Natural>> n_4@6@01 l_0@5@01))
      l_0@5@01)
    :pattern ((concatenate<List<Natural>> (take<List<Natural>> n_4@6@01 l_0@5@01) (drop<List<Natural>> n_4@6@01 l_0@5@01)))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@446@16@447@67|))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (forall ((n_4@6@01 Natural)) (!
    (=
      (concatenate<List<Natural>> (take<List<Natural>> n_4@6@01 l_0@5@01) (drop<List<Natural>> n_4@6@01 l_0@5@01))
      l_0@5@01)
    :pattern ((concatenate<List<Natural>> (take<List<Natural>> n_4@6@01 l_0@5@01) (drop<List<Natural>> n_4@6@01 l_0@5@01)))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@446@16@447@67|))
  (and
    (forall ((n_4@6@01 Natural)) (!
      (=
        (concatenate<List<Natural>> (take<List<Natural>> n_4@6@01 l_0@5@01) (drop<List<Natural>> n_4@6@01 l_0@5@01))
        l_0@5@01)
      :pattern ((concatenate<List<Natural>> (take<List<Natural>> n_4@6@01 l_0@5@01) (drop<List<Natural>> n_4@6@01 l_0@5@01)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@446@16@447@67|))
    (forall ((e_0@7@01 Natural)) (!
      (and
        (=>
          (isZeroOrSuccessor<Bool> e_0@7@01)
          (and
            (isZeroOrSuccessor<Bool> e_0@7@01)
            (forall ((n_5@8@01 Natural)) (!
              (or
                (not (isZeroOrSuccessor<Bool> n_5@8@01))
                (isZeroOrSuccessor<Bool> n_5@8@01))
              :pattern ((isZeroOrSuccessor<Bool> n_5@8@01))
              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@453@23@459@73-aux|))
            (forall ((n_5@8@01 Natural)) (!
              (or
                (not (isZeroOrSuccessor<Bool> n_5@8@01))
                (isZeroOrSuccessor<Bool> n_5@8@01))
              :pattern ((concatenate<List<Natural>> (take<List<Natural>> n_5@8@01 (cons<List<Natural>> e_0@7@01 l_0@5@01)) (drop<List<Natural>> n_5@8@01 (cons<List<Natural>> e_0@7@01 l_0@5@01))))
              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@453@23@459@73-aux|))))
        (or
          (not (isZeroOrSuccessor<Bool> e_0@7@01))
          (isZeroOrSuccessor<Bool> e_0@7@01)))
      :pattern ((isZeroOrSuccessor<Bool> e_0@7@01))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@448@19@459@73-aux|))
    (forall ((e_0@7@01 Natural)) (!
      (and
        (=>
          (isZeroOrSuccessor<Bool> e_0@7@01)
          (and
            (isZeroOrSuccessor<Bool> e_0@7@01)
            (forall ((n_5@8@01 Natural)) (!
              (or
                (not (isZeroOrSuccessor<Bool> n_5@8@01))
                (isZeroOrSuccessor<Bool> n_5@8@01))
              :pattern ((isZeroOrSuccessor<Bool> n_5@8@01))
              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@453@23@459@73-aux|))
            (forall ((n_5@8@01 Natural)) (!
              (or
                (not (isZeroOrSuccessor<Bool> n_5@8@01))
                (isZeroOrSuccessor<Bool> n_5@8@01))
              :pattern ((concatenate<List<Natural>> (take<List<Natural>> n_5@8@01 (cons<List<Natural>> e_0@7@01 l_0@5@01)) (drop<List<Natural>> n_5@8@01 (cons<List<Natural>> e_0@7@01 l_0@5@01))))
              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@453@23@459@73-aux|))))
        (or
          (not (isZeroOrSuccessor<Bool> e_0@7@01))
          (isZeroOrSuccessor<Bool> e_0@7@01)))
      :pattern ((cons<List<Natural>> e_0@7@01 l_0@5@01))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@448@19@459@73-aux|)))))
; Joined path conditions
(assert (or
  (not
    (forall ((n_4@6@01 Natural)) (!
      (=
        (concatenate<List<Natural>> (take<List<Natural>> n_4@6@01 l_0@5@01) (drop<List<Natural>> n_4@6@01 l_0@5@01))
        l_0@5@01)
      :pattern ((concatenate<List<Natural>> (take<List<Natural>> n_4@6@01 l_0@5@01) (drop<List<Natural>> n_4@6@01 l_0@5@01)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@446@16@447@67|)))
  (forall ((n_4@6@01 Natural)) (!
    (=
      (concatenate<List<Natural>> (take<List<Natural>> n_4@6@01 l_0@5@01) (drop<List<Natural>> n_4@6@01 l_0@5@01))
      l_0@5@01)
    :pattern ((concatenate<List<Natural>> (take<List<Natural>> n_4@6@01 l_0@5@01) (drop<List<Natural>> n_4@6@01 l_0@5@01)))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@446@16@447@67|))))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | !(isNilOrCons[Bool](l_0@5@01))]
(assert (not (isNilOrCons<Bool> l_0@5@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (isNilOrCons<Bool> l_0@5@01)
  (and
    (isNilOrCons<Bool> l_0@5@01)
    (=>
      (forall ((n_4@6@01 Natural)) (!
        (=
          (concatenate<List<Natural>> (take<List<Natural>> n_4@6@01 l_0@5@01) (drop<List<Natural>> n_4@6@01 l_0@5@01))
          l_0@5@01)
        :pattern ((concatenate<List<Natural>> (take<List<Natural>> n_4@6@01 l_0@5@01) (drop<List<Natural>> n_4@6@01 l_0@5@01)))
        :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@446@16@447@67|))
      (and
        (forall ((n_4@6@01 Natural)) (!
          (=
            (concatenate<List<Natural>> (take<List<Natural>> n_4@6@01 l_0@5@01) (drop<List<Natural>> n_4@6@01 l_0@5@01))
            l_0@5@01)
          :pattern ((concatenate<List<Natural>> (take<List<Natural>> n_4@6@01 l_0@5@01) (drop<List<Natural>> n_4@6@01 l_0@5@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@446@16@447@67|))
        (forall ((e_0@7@01 Natural)) (!
          (and
            (=>
              (isZeroOrSuccessor<Bool> e_0@7@01)
              (and
                (isZeroOrSuccessor<Bool> e_0@7@01)
                (forall ((n_5@8@01 Natural)) (!
                  (or
                    (not (isZeroOrSuccessor<Bool> n_5@8@01))
                    (isZeroOrSuccessor<Bool> n_5@8@01))
                  :pattern ((isZeroOrSuccessor<Bool> n_5@8@01))
                  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@453@23@459@73-aux|))
                (forall ((n_5@8@01 Natural)) (!
                  (or
                    (not (isZeroOrSuccessor<Bool> n_5@8@01))
                    (isZeroOrSuccessor<Bool> n_5@8@01))
                  :pattern ((concatenate<List<Natural>> (take<List<Natural>> n_5@8@01 (cons<List<Natural>> e_0@7@01 l_0@5@01)) (drop<List<Natural>> n_5@8@01 (cons<List<Natural>> e_0@7@01 l_0@5@01))))
                  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@453@23@459@73-aux|))))
            (or
              (not (isZeroOrSuccessor<Bool> e_0@7@01))
              (isZeroOrSuccessor<Bool> e_0@7@01)))
          :pattern ((isZeroOrSuccessor<Bool> e_0@7@01))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@448@19@459@73-aux|))
        (forall ((e_0@7@01 Natural)) (!
          (and
            (=>
              (isZeroOrSuccessor<Bool> e_0@7@01)
              (and
                (isZeroOrSuccessor<Bool> e_0@7@01)
                (forall ((n_5@8@01 Natural)) (!
                  (or
                    (not (isZeroOrSuccessor<Bool> n_5@8@01))
                    (isZeroOrSuccessor<Bool> n_5@8@01))
                  :pattern ((isZeroOrSuccessor<Bool> n_5@8@01))
                  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@453@23@459@73-aux|))
                (forall ((n_5@8@01 Natural)) (!
                  (or
                    (not (isZeroOrSuccessor<Bool> n_5@8@01))
                    (isZeroOrSuccessor<Bool> n_5@8@01))
                  :pattern ((concatenate<List<Natural>> (take<List<Natural>> n_5@8@01 (cons<List<Natural>> e_0@7@01 l_0@5@01)) (drop<List<Natural>> n_5@8@01 (cons<List<Natural>> e_0@7@01 l_0@5@01))))
                  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@453@23@459@73-aux|))))
            (or
              (not (isZeroOrSuccessor<Bool> e_0@7@01))
              (isZeroOrSuccessor<Bool> e_0@7@01)))
          :pattern ((cons<List<Natural>> e_0@7@01 l_0@5@01))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@448@19@459@73-aux|))))
    (or
      (not
        (forall ((n_4@6@01 Natural)) (!
          (=
            (concatenate<List<Natural>> (take<List<Natural>> n_4@6@01 l_0@5@01) (drop<List<Natural>> n_4@6@01 l_0@5@01))
            l_0@5@01)
          :pattern ((concatenate<List<Natural>> (take<List<Natural>> n_4@6@01 l_0@5@01) (drop<List<Natural>> n_4@6@01 l_0@5@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@446@16@447@67|)))
      (forall ((n_4@6@01 Natural)) (!
        (=
          (concatenate<List<Natural>> (take<List<Natural>> n_4@6@01 l_0@5@01) (drop<List<Natural>> n_4@6@01 l_0@5@01))
          l_0@5@01)
        :pattern ((concatenate<List<Natural>> (take<List<Natural>> n_4@6@01 l_0@5@01) (drop<List<Natural>> n_4@6@01 l_0@5@01)))
        :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@446@16@447@67|))))))
; Joined path conditions
(assert (or (not (isNilOrCons<Bool> l_0@5@01)) (isNilOrCons<Bool> l_0@5@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((l_0@5@01 List<Natural>)) (!
  (and
    (=>
      (isNilOrCons<Bool> l_0@5@01)
      (and
        (isNilOrCons<Bool> l_0@5@01)
        (=>
          (forall ((n_4@6@01 Natural)) (!
            (=
              (concatenate<List<Natural>> (take<List<Natural>> n_4@6@01 l_0@5@01) (drop<List<Natural>> n_4@6@01 l_0@5@01))
              l_0@5@01)
            :pattern ((concatenate<List<Natural>> (take<List<Natural>> n_4@6@01 l_0@5@01) (drop<List<Natural>> n_4@6@01 l_0@5@01)))
            :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@446@16@447@67|))
          (and
            (forall ((n_4@6@01 Natural)) (!
              (=
                (concatenate<List<Natural>> (take<List<Natural>> n_4@6@01 l_0@5@01) (drop<List<Natural>> n_4@6@01 l_0@5@01))
                l_0@5@01)
              :pattern ((concatenate<List<Natural>> (take<List<Natural>> n_4@6@01 l_0@5@01) (drop<List<Natural>> n_4@6@01 l_0@5@01)))
              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@446@16@447@67|))
            (forall ((e_0@7@01 Natural)) (!
              (and
                (=>
                  (isZeroOrSuccessor<Bool> e_0@7@01)
                  (and
                    (isZeroOrSuccessor<Bool> e_0@7@01)
                    (forall ((n_5@8@01 Natural)) (!
                      (or
                        (not (isZeroOrSuccessor<Bool> n_5@8@01))
                        (isZeroOrSuccessor<Bool> n_5@8@01))
                      :pattern ((isZeroOrSuccessor<Bool> n_5@8@01))
                      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@453@23@459@73-aux|))
                    (forall ((n_5@8@01 Natural)) (!
                      (or
                        (not (isZeroOrSuccessor<Bool> n_5@8@01))
                        (isZeroOrSuccessor<Bool> n_5@8@01))
                      :pattern ((concatenate<List<Natural>> (take<List<Natural>> n_5@8@01 (cons<List<Natural>> e_0@7@01 l_0@5@01)) (drop<List<Natural>> n_5@8@01 (cons<List<Natural>> e_0@7@01 l_0@5@01))))
                      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@453@23@459@73-aux|))))
                (or
                  (not (isZeroOrSuccessor<Bool> e_0@7@01))
                  (isZeroOrSuccessor<Bool> e_0@7@01)))
              :pattern ((isZeroOrSuccessor<Bool> e_0@7@01))
              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@448@19@459@73-aux|))
            (forall ((e_0@7@01 Natural)) (!
              (and
                (=>
                  (isZeroOrSuccessor<Bool> e_0@7@01)
                  (and
                    (isZeroOrSuccessor<Bool> e_0@7@01)
                    (forall ((n_5@8@01 Natural)) (!
                      (or
                        (not (isZeroOrSuccessor<Bool> n_5@8@01))
                        (isZeroOrSuccessor<Bool> n_5@8@01))
                      :pattern ((isZeroOrSuccessor<Bool> n_5@8@01))
                      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@453@23@459@73-aux|))
                    (forall ((n_5@8@01 Natural)) (!
                      (or
                        (not (isZeroOrSuccessor<Bool> n_5@8@01))
                        (isZeroOrSuccessor<Bool> n_5@8@01))
                      :pattern ((concatenate<List<Natural>> (take<List<Natural>> n_5@8@01 (cons<List<Natural>> e_0@7@01 l_0@5@01)) (drop<List<Natural>> n_5@8@01 (cons<List<Natural>> e_0@7@01 l_0@5@01))))
                      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@453@23@459@73-aux|))))
                (or
                  (not (isZeroOrSuccessor<Bool> e_0@7@01))
                  (isZeroOrSuccessor<Bool> e_0@7@01)))
              :pattern ((cons<List<Natural>> e_0@7@01 l_0@5@01))
              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@448@19@459@73-aux|))))
        (or
          (not
            (forall ((n_4@6@01 Natural)) (!
              (=
                (concatenate<List<Natural>> (take<List<Natural>> n_4@6@01 l_0@5@01) (drop<List<Natural>> n_4@6@01 l_0@5@01))
                l_0@5@01)
              :pattern ((concatenate<List<Natural>> (take<List<Natural>> n_4@6@01 l_0@5@01) (drop<List<Natural>> n_4@6@01 l_0@5@01)))
              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@446@16@447@67|)))
          (forall ((n_4@6@01 Natural)) (!
            (=
              (concatenate<List<Natural>> (take<List<Natural>> n_4@6@01 l_0@5@01) (drop<List<Natural>> n_4@6@01 l_0@5@01))
              l_0@5@01)
            :pattern ((concatenate<List<Natural>> (take<List<Natural>> n_4@6@01 l_0@5@01) (drop<List<Natural>> n_4@6@01 l_0@5@01)))
            :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@446@16@447@67|)))))
    (or (not (isNilOrCons<Bool> l_0@5@01)) (isNilOrCons<Bool> l_0@5@01)))
  :pattern ((isNilOrCons<Bool> l_0@5@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@442@11@459@73-aux|)))
(push) ; 3
(assert (not (forall ((l_0@5@01 List<Natural>)) (!
  (=>
    (and
      (isNilOrCons<Bool> l_0@5@01)
      (forall ((n_4@6@01 Natural)) (!
        (=
          (concatenate<List<Natural>> (take<List<Natural>> n_4@6@01 l_0@5@01) (drop<List<Natural>> n_4@6@01 l_0@5@01))
          l_0@5@01)
        :pattern ((concatenate<List<Natural>> (take<List<Natural>> n_4@6@01 l_0@5@01) (drop<List<Natural>> n_4@6@01 l_0@5@01)))
        :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@446@16@447@67|)))
    (forall ((e_0@7@01 Natural)) (!
      (=>
        (isZeroOrSuccessor<Bool> e_0@7@01)
        (forall ((n_5@8@01 Natural)) (!
          (=>
            (isZeroOrSuccessor<Bool> n_5@8@01)
            (=
              (concatenate<List<Natural>> (take<List<Natural>> n_5@8@01 (cons<List<Natural>> e_0@7@01 l_0@5@01)) (drop<List<Natural>> n_5@8@01 (cons<List<Natural>> e_0@7@01 l_0@5@01)))
              (cons<List<Natural>> e_0@7@01 l_0@5@01)))
          :pattern ((isZeroOrSuccessor<Bool> n_5@8@01))
          :pattern ((concatenate<List<Natural>> (take<List<Natural>> n_5@8@01 (cons<List<Natural>> e_0@7@01 l_0@5@01)) (drop<List<Natural>> n_5@8@01 (cons<List<Natural>> e_0@7@01 l_0@5@01))))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@453@23@459@73|)))
      :pattern ((isZeroOrSuccessor<Bool> e_0@7@01))
      :pattern ((cons<List<Natural>> e_0@7@01 l_0@5@01))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@448@19@459@73|)))
  :pattern ((isNilOrCons<Bool> l_0@5@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@442@11@459@73|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((l_0@5@01 List<Natural>)) (!
  (=>
    (and
      (isNilOrCons<Bool> l_0@5@01)
      (forall ((n_4@6@01 Natural)) (!
        (=
          (concatenate<List<Natural>> (take<List<Natural>> n_4@6@01 l_0@5@01) (drop<List<Natural>> n_4@6@01 l_0@5@01))
          l_0@5@01)
        :pattern ((concatenate<List<Natural>> (take<List<Natural>> n_4@6@01 l_0@5@01) (drop<List<Natural>> n_4@6@01 l_0@5@01)))
        :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@446@16@447@67|)))
    (forall ((e_0@7@01 Natural)) (!
      (=>
        (isZeroOrSuccessor<Bool> e_0@7@01)
        (forall ((n_5@8@01 Natural)) (!
          (=>
            (isZeroOrSuccessor<Bool> n_5@8@01)
            (=
              (concatenate<List<Natural>> (take<List<Natural>> n_5@8@01 (cons<List<Natural>> e_0@7@01 l_0@5@01)) (drop<List<Natural>> n_5@8@01 (cons<List<Natural>> e_0@7@01 l_0@5@01)))
              (cons<List<Natural>> e_0@7@01 l_0@5@01)))
          :pattern ((isZeroOrSuccessor<Bool> n_5@8@01))
          :pattern ((concatenate<List<Natural>> (take<List<Natural>> n_5@8@01 (cons<List<Natural>> e_0@7@01 l_0@5@01)) (drop<List<Natural>> n_5@8@01 (cons<List<Natural>> e_0@7@01 l_0@5@01))))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@453@23@459@73|)))
      :pattern ((isZeroOrSuccessor<Bool> e_0@7@01))
      :pattern ((cons<List<Natural>> e_0@7@01 l_0@5@01))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@448@19@459@73|)))
  :pattern ((isNilOrCons<Bool> l_0@5@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0045.vpr@442@11@459@73|)))
(pop) ; 2
(pop) ; 1
