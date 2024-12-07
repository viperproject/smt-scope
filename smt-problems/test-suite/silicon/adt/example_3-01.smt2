(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:40:02
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/adt/example_3.vpr
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
(declare-sort List_ 0)
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
(declare-fun $SortWrappers.List_To$Snap (List_) $Snap)
(declare-fun $SortWrappers.$SnapToList_ ($Snap) List_)
(assert (forall ((x List_)) (!
    (= x ($SortWrappers.$SnapToList_($SortWrappers.List_To$Snap x)))
    :pattern (($SortWrappers.List_To$Snap x))
    :qid |$Snap.$SnapToList_To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.List_To$Snap($SortWrappers.$SnapToList_ x)))
    :pattern (($SortWrappers.$SnapToList_ x))
    :qid |$Snap.List_To$SnapToList_|
    )))
; ////////// Symbols
(declare-const Nil<List> List_)
(declare-fun Cons<List> (Int List_) List_)
(declare-fun get_List_head<Int> (List_) Int)
(declare-fun get_List_tail<List> (List_) List_)
(declare-fun List_tag<Int> (List_) Int)
; Declaring symbols related to program functions (from program analysis)
(declare-fun len ($Snap List_) Int)
(declare-fun len%limited ($Snap List_) Int)
(declare-fun len%stateless (List_) Bool)
(declare-fun len%precondition ($Snap List_) Bool)
(declare-fun at ($Snap List_ Int) Int)
(declare-fun at%limited ($Snap List_ Int) Int)
(declare-fun at%stateless (List_ Int) Bool)
(declare-fun at%precondition ($Snap List_ Int) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((head Int) (tail List_)) (!
  (= head (get_List_head<Int> (Cons<List> head tail)))
  :pattern ((Cons<List> head tail))
  )))
(assert (forall ((head Int) (tail List_)) (!
  (= tail (get_List_tail<List> (Cons<List> head tail)))
  :pattern ((Cons<List> head tail))
  )))
(assert (= (List_tag<Int> (as Nil<List>  List_)) 1))
(assert (forall ((head Int) (tail List_)) (!
  (= (List_tag<Int> (Cons<List> head tail)) 0)
  :pattern ((Cons<List> head tail))
  )))
(assert (forall ((t List_)) (!
  (or
    (= t (as Nil<List>  List_))
    (= t (Cons<List> (get_List_head<Int> t) (get_List_tail<List> t))))
  :pattern ((List_tag<Int> t))
  :pattern ((get_List_head<Int> t))
  :pattern ((get_List_tail<List> t))
  )))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ---------- FUNCTION len----------
(declare-fun xs@0@00 () List_)
(declare-fun result@1@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(declare-const $t@5@00 $Snap)
(assert (= $t@5@00 $Snap.unit))
; [eval] result >= 0
(assert (>= result@1@00 0))
(pop) ; 1
(assert (forall ((s@$ $Snap) (xs@0@00 List_)) (!
  (= (len%limited s@$ xs@0@00) (len s@$ xs@0@00))
  :pattern ((len s@$ xs@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (xs@0@00 List_)) (!
  (len%stateless xs@0@00)
  :pattern ((len%limited s@$ xs@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (xs@0@00 List_)) (!
  (let ((result@1@00 (len%limited s@$ xs@0@00))) (=>
    (len%precondition s@$ xs@0@00)
    (>= result@1@00 0)))
  :pattern ((len%limited s@$ xs@0@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (xs@0@00 List_)) (!
  (let ((result@1@00 (len%limited s@$ xs@0@00))) true)
  :pattern ((len%limited s@$ xs@0@00))
  :qid |quant-u-5|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (List_tag(xs) == 1 ? 0 : 1 + len(get_List_tail(xs)))
; [eval] List_tag(xs) == 1
; [eval] List_tag(xs)
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= (List_tag<Int> xs@0@00) 1))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (List_tag<Int> xs@0@00) 1)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | List_tag[Int](xs@0@00) == 1 | live]
; [else-branch: 0 | List_tag[Int](xs@0@00) != 1 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | List_tag[Int](xs@0@00) == 1]
(assert (= (List_tag<Int> xs@0@00) 1))
(pop) ; 3
(push) ; 3
; [else-branch: 0 | List_tag[Int](xs@0@00) != 1]
(assert (not (= (List_tag<Int> xs@0@00) 1)))
; [eval] 1 + len(get_List_tail(xs))
; [eval] len(get_List_tail(xs))
; [eval] get_List_tail(xs)
(push) ; 4
(assert (len%precondition $Snap.unit (get_List_tail<List> xs@0@00)))
(pop) ; 4
; Joined path conditions
(assert (len%precondition $Snap.unit (get_List_tail<List> xs@0@00)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= (List_tag<Int> xs@0@00) 1))
  (and
    (not (= (List_tag<Int> xs@0@00) 1))
    (len%precondition $Snap.unit (get_List_tail<List> xs@0@00)))))
(assert (or (not (= (List_tag<Int> xs@0@00) 1)) (= (List_tag<Int> xs@0@00) 1)))
(assert (=
  result@1@00
  (ite
    (= (List_tag<Int> xs@0@00) 1)
    0
    (+ 1 (len $Snap.unit (get_List_tail<List> xs@0@00))))))
; [eval] result >= 0
(push) ; 2
(assert (not (>= result@1@00 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (>= result@1@00 0))
(pop) ; 1
(assert (forall ((s@$ $Snap) (xs@0@00 List_)) (!
  (=>
    (len%precondition s@$ xs@0@00)
    (=
      (len s@$ xs@0@00)
      (ite
        (= (List_tag<Int> xs@0@00) 1)
        0
        (+ 1 (len%limited $Snap.unit (get_List_tail<List> xs@0@00))))))
  :pattern ((len s@$ xs@0@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (xs@0@00 List_)) (!
  (=>
    (len%precondition s@$ xs@0@00)
    (ite
      (= (List_tag<Int> xs@0@00) 1)
      true
      (len%precondition $Snap.unit (get_List_tail<List> xs@0@00))))
  :pattern ((len s@$ xs@0@00))
  :qid |quant-u-7|)))
; ---------- FUNCTION at----------
(declare-fun xs@2@00 () List_)
(declare-fun pos@3@00 () Int)
(declare-fun result@4@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (xs@2@00 List_) (pos@3@00 Int)) (!
  (= (at%limited s@$ xs@2@00 pos@3@00) (at s@$ xs@2@00 pos@3@00))
  :pattern ((at s@$ xs@2@00 pos@3@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (xs@2@00 List_) (pos@3@00 Int)) (!
  (at%stateless xs@2@00 pos@3@00)
  :pattern ((at%limited s@$ xs@2@00 pos@3@00))
  :qid |quant-u-3|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (List_tag(xs) == 1 || pos < 0 ? -1 : (pos == 0 ? get_List_head(xs) : at(get_List_tail(xs), pos - 1)))
; [eval] List_tag(xs) == 1 || pos < 0
; [eval] List_tag(xs) == 1
; [eval] List_tag(xs)
(set-option :timeout 0)
(push) ; 2
; [then-branch: 1 | List_tag[Int](xs@2@00) == 1 | live]
; [else-branch: 1 | List_tag[Int](xs@2@00) != 1 | live]
(push) ; 3
; [then-branch: 1 | List_tag[Int](xs@2@00) == 1]
(assert (= (List_tag<Int> xs@2@00) 1))
(pop) ; 3
(push) ; 3
; [else-branch: 1 | List_tag[Int](xs@2@00) != 1]
(assert (not (= (List_tag<Int> xs@2@00) 1)))
; [eval] pos < 0
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or (not (= (List_tag<Int> xs@2@00) 1)) (= (List_tag<Int> xs@2@00) 1)))
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (or (= (List_tag<Int> xs@2@00) 1) (< pos@3@00 0)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (or (= (List_tag<Int> xs@2@00) 1) (< pos@3@00 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | List_tag[Int](xs@2@00) == 1 || pos@3@00 < 0 | live]
; [else-branch: 2 | !(List_tag[Int](xs@2@00) == 1 || pos@3@00 < 0) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 2 | List_tag[Int](xs@2@00) == 1 || pos@3@00 < 0]
(assert (or (= (List_tag<Int> xs@2@00) 1) (< pos@3@00 0)))
; [eval] -1
(pop) ; 3
(push) ; 3
; [else-branch: 2 | !(List_tag[Int](xs@2@00) == 1 || pos@3@00 < 0)]
(assert (not (or (= (List_tag<Int> xs@2@00) 1) (< pos@3@00 0))))
; [eval] (pos == 0 ? get_List_head(xs) : at(get_List_tail(xs), pos - 1))
; [eval] pos == 0
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= pos@3@00 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= pos@3@00 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | pos@3@00 == 0 | live]
; [else-branch: 3 | pos@3@00 != 0 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 3 | pos@3@00 == 0]
(assert (= pos@3@00 0))
; [eval] get_List_head(xs)
(pop) ; 5
(push) ; 5
; [else-branch: 3 | pos@3@00 != 0]
(assert (not (= pos@3@00 0)))
; [eval] at(get_List_tail(xs), pos - 1)
; [eval] get_List_tail(xs)
; [eval] pos - 1
(push) ; 6
(assert (at%precondition $Snap.unit (get_List_tail<List> xs@2@00) (- pos@3@00 1)))
(pop) ; 6
; Joined path conditions
(assert (at%precondition $Snap.unit (get_List_tail<List> xs@2@00) (- pos@3@00 1)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= pos@3@00 0))
  (and
    (not (= pos@3@00 0))
    (at%precondition $Snap.unit (get_List_tail<List> xs@2@00) (- pos@3@00 1)))))
(assert (or (not (= pos@3@00 0)) (= pos@3@00 0)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (or (= (List_tag<Int> xs@2@00) 1) (< pos@3@00 0)))
  (and
    (not (or (= (List_tag<Int> xs@2@00) 1) (< pos@3@00 0)))
    (=>
      (not (= pos@3@00 0))
      (and
        (not (= pos@3@00 0))
        (at%precondition $Snap.unit (get_List_tail<List> xs@2@00) (- pos@3@00 1))))
    (or (not (= pos@3@00 0)) (= pos@3@00 0)))))
(assert (or
  (not (or (= (List_tag<Int> xs@2@00) 1) (< pos@3@00 0)))
  (or (= (List_tag<Int> xs@2@00) 1) (< pos@3@00 0))))
(assert (=
  result@4@00
  (ite
    (or (= (List_tag<Int> xs@2@00) 1) (< pos@3@00 0))
    (- 0 1)
    (ite
      (= pos@3@00 0)
      (get_List_head<Int> xs@2@00)
      (at $Snap.unit (get_List_tail<List> xs@2@00) (- pos@3@00 1))))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (xs@2@00 List_) (pos@3@00 Int)) (!
  (=>
    (at%precondition s@$ xs@2@00 pos@3@00)
    (=
      (at s@$ xs@2@00 pos@3@00)
      (ite
        (or (= (List_tag<Int> xs@2@00) 1) (< pos@3@00 0))
        (- 0 1)
        (ite
          (= pos@3@00 0)
          (get_List_head<Int> xs@2@00)
          (at%limited $Snap.unit (get_List_tail<List> xs@2@00) (- pos@3@00 1))))))
  :pattern ((at s@$ xs@2@00 pos@3@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (xs@2@00 List_) (pos@3@00 Int)) (!
  (=>
    (at%precondition s@$ xs@2@00 pos@3@00)
    (ite
      (or (= (List_tag<Int> xs@2@00) 1) (< pos@3@00 0))
      true
      (ite
        (= pos@3@00 0)
        true
        (at%precondition $Snap.unit (get_List_tail<List> xs@2@00) (- pos@3@00 1)))))
  :pattern ((at s@$ xs@2@00 pos@3@00))
  :qid |quant-u-9|)))
