(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:39:05
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/adt/adt_as_fields_1.vpr
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
(declare-const Nil<List<Int>> List<Int>)
(declare-fun Cons<List<Int>> (Int List<Int>) List<Int>)
(declare-fun get_List_value<Int> (List<Int>) Int)
(declare-fun get_List_tail<List<Int>> (List<Int>) List<Int>)
(declare-fun List_tag<Int> (List<Int>) Int)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((value Int) (tail List<Int>)) (!
  (= value (get_List_value<Int> (Cons<List<Int>> value tail)))
  :pattern ((Cons<List<Int>> value tail))
  )))
(assert (forall ((value Int) (tail List<Int>)) (!
  (= tail (get_List_tail<List<Int>> (Cons<List<Int>> value tail)))
  :pattern ((Cons<List<Int>> value tail))
  )))
(assert (= (List_tag<Int> (as Nil<List<Int>>  List<Int>)) 1))
(assert (forall ((value Int) (tail List<Int>)) (!
  (= (List_tag<Int> (Cons<List<Int>> value tail)) 0)
  :pattern ((Cons<List<Int>> value tail))
  )))
(assert (forall ((t List<Int>)) (!
  (or
    (= t (as Nil<List<Int>>  List<Int>))
    (= t (Cons<List<Int>> (get_List_value<Int> t) (get_List_tail<List<Int>> t))))
  :pattern ((List_tag<Int> t))
  :pattern ((get_List_value<Int> t))
  :pattern ((get_List_tail<List<Int>> t))
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
; ---------- adt_as_fields_1 ----------
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
; var f: Ref
(declare-const f@0@01 $Ref)
; [exec]
; f := new(list, condtion)
(declare-const f@1@01 $Ref)
(assert (not (= f@1@01 $Ref.null)))
(declare-const list@2@01 List<Int>)
(declare-const condtion@3@01 Bool)
(assert (not (= f@1@01 f@0@01)))
; [exec]
; assert (List_tag(f.list): Int) == 1 || (List_tag(f.list): Int) == 0
; [eval] (List_tag(f.list): Int) == 1 || (List_tag(f.list): Int) == 0
; [eval] (List_tag(f.list): Int) == 1
; [eval] (List_tag(f.list): Int)
(push) ; 3
; [then-branch: 0 | List_tag[Int](list@2@01) == 1 | live]
; [else-branch: 0 | List_tag[Int](list@2@01) != 1 | live]
(push) ; 4
; [then-branch: 0 | List_tag[Int](list@2@01) == 1]
(assert (= (List_tag<Int> list@2@01) 1))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | List_tag[Int](list@2@01) != 1]
(assert (not (= (List_tag<Int> list@2@01) 1)))
; [eval] (List_tag(f.list): Int) == 0
; [eval] (List_tag(f.list): Int)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not (= (List_tag<Int> list@2@01) 1)) (= (List_tag<Int> list@2@01) 1)))
(push) ; 3
(assert (not (or (= (List_tag<Int> list@2@01) 1) (= (List_tag<Int> list@2@01) 0))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (or (= (List_tag<Int> list@2@01) 1) (= (List_tag<Int> list@2@01) 0)))
; [exec]
; f.list := (Cons(42, (Nil(): List[Int])): List[Int])
; [eval] (Cons(42, (Nil(): List[Int])): List[Int])
; [eval] (Nil(): List[Int])
(declare-const list@4@01 List<Int>)
(assert (= list@4@01 (Cons<List<Int>> 42 (as Nil<List<Int>>  List<Int>))))
; [exec]
; assert !((List_tag((get_List_tail(f.list): List[Int])): Int) == 0)
; [eval] !((List_tag((get_List_tail(f.list): List[Int])): Int) == 0)
; [eval] (List_tag((get_List_tail(f.list): List[Int])): Int) == 0
; [eval] (List_tag((get_List_tail(f.list): List[Int])): Int)
; [eval] (get_List_tail(f.list): List[Int])
(push) ; 3
(assert (not (not (= (List_tag<Int> (get_List_tail<List<Int>> list@4@01)) 0))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= (List_tag<Int> (get_List_tail<List<Int>> list@4@01)) 0)))
; [exec]
; f.list := (get_List_tail((Cons(42, (Nil(): List[Int])): List[Int])): List[Int])
; [eval] (get_List_tail((Cons(42, (Nil(): List[Int])): List[Int])): List[Int])
; [eval] (Cons(42, (Nil(): List[Int])): List[Int])
; [eval] (Nil(): List[Int])
(declare-const list@5@01 List<Int>)
(assert (=
  list@5@01
  (get_List_tail<List<Int>> (Cons<List<Int>> 42 (as Nil<List<Int>>  List<Int>)))))
; [exec]
; f.condtion := (List_tag((Cons(42, (Nil(): List[Int])): List[Int])): Int) ==
;   0
; [eval] (List_tag((Cons(42, (Nil(): List[Int])): List[Int])): Int) == 0
; [eval] (List_tag((Cons(42, (Nil(): List[Int])): List[Int])): Int)
; [eval] (Cons(42, (Nil(): List[Int])): List[Int])
; [eval] (Nil(): List[Int])
(declare-const condtion@6@01 Bool)
(assert (=
  condtion@6@01
  (= (List_tag<Int> (Cons<List<Int>> 42 (as Nil<List<Int>>  List<Int>))) 0)))
; [exec]
; assert f.list == (Nil(): List[Int])
; [eval] f.list == (Nil(): List[Int])
; [eval] (Nil(): List[Int])
(push) ; 3
(assert (not (= list@5@01 (as Nil<List<Int>>  List<Int>))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= list@5@01 (as Nil<List<Int>>  List<Int>)))
; [exec]
; assert f.condtion == true
; [eval] f.condtion == true
(push) ; 3
(assert (not (= condtion@6@01 true)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= condtion@6@01 true))
(pop) ; 2
(pop) ; 1
