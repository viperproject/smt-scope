(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:39:50
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/adt/encoding_2.vpr
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
(declare-sort ADT<Int> 0)
(declare-sort ADT<Bool> 0)
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
(declare-fun $SortWrappers.ADT<Int>To$Snap (ADT<Int>) $Snap)
(declare-fun $SortWrappers.$SnapToADT<Int> ($Snap) ADT<Int>)
(assert (forall ((x ADT<Int>)) (!
    (= x ($SortWrappers.$SnapToADT<Int>($SortWrappers.ADT<Int>To$Snap x)))
    :pattern (($SortWrappers.ADT<Int>To$Snap x))
    :qid |$Snap.$SnapToADT<Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.ADT<Int>To$Snap($SortWrappers.$SnapToADT<Int> x)))
    :pattern (($SortWrappers.$SnapToADT<Int> x))
    :qid |$Snap.ADT<Int>To$SnapToADT<Int>|
    )))
(declare-fun $SortWrappers.ADT<Bool>To$Snap (ADT<Bool>) $Snap)
(declare-fun $SortWrappers.$SnapToADT<Bool> ($Snap) ADT<Bool>)
(assert (forall ((x ADT<Bool>)) (!
    (= x ($SortWrappers.$SnapToADT<Bool>($SortWrappers.ADT<Bool>To$Snap x)))
    :pattern (($SortWrappers.ADT<Bool>To$Snap x))
    :qid |$Snap.$SnapToADT<Bool>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.ADT<Bool>To$Snap($SortWrappers.$SnapToADT<Bool> x)))
    :pattern (($SortWrappers.$SnapToADT<Bool> x))
    :qid |$Snap.ADT<Bool>To$SnapToADT<Bool>|
    )))
; ////////// Symbols
(declare-const C1<ADT<Int>> ADT<Int>)
(declare-fun C2<ADT<Int>> (Int ADT<Int>) ADT<Int>)
(declare-fun C3<ADT<Int>> (Int) ADT<Int>)
(declare-fun C4<ADT<Int>> (Bool ADT<Int> ADT<Int>) ADT<Int>)
(declare-const C5<ADT<Int>> ADT<Int>)
(declare-const C6<ADT<Int>> ADT<Int>)
(declare-fun get_ADT_p21<Int> (ADT<Int>) Int)
(declare-fun get_ADT_p22<ADT<Int>> (ADT<Int>) ADT<Int>)
(declare-fun get_ADT_p31<Int> (ADT<Int>) Int)
(declare-fun get_ADT_p41<Bool> (ADT<Int>) Bool)
(declare-fun get_ADT_p42<ADT<Int>> (ADT<Int>) ADT<Int>)
(declare-fun get_ADT_p43<ADT<Int>> (ADT<Int>) ADT<Int>)
(declare-fun ADT_tag<Int> (ADT<Int>) Int)
(declare-const C1<ADT<Bool>> ADT<Bool>)
(declare-fun C2<ADT<Bool>> (Bool ADT<Bool>) ADT<Bool>)
(declare-fun C3<ADT<Bool>> (Int) ADT<Bool>)
(declare-fun C4<ADT<Bool>> (Bool ADT<Bool> ADT<Int>) ADT<Bool>)
(declare-const C5<ADT<Bool>> ADT<Bool>)
(declare-const C6<ADT<Bool>> ADT<Bool>)
(declare-fun get_ADT_p21<Bool> (ADT<Bool>) Bool)
(declare-fun get_ADT_p22<ADT<Bool>> (ADT<Bool>) ADT<Bool>)
(declare-fun get_ADT_p31<Int> (ADT<Bool>) Int)
(declare-fun get_ADT_p41<Bool> (ADT<Bool>) Bool)
(declare-fun get_ADT_p42<ADT<Bool>> (ADT<Bool>) ADT<Bool>)
(declare-fun get_ADT_p43<ADT<Int>> (ADT<Bool>) ADT<Int>)
(declare-fun ADT_tag<Int> (ADT<Bool>) Int)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((p21 Int) (p22 ADT<Int>)) (!
  (= p21 (get_ADT_p21<Int> (C2<ADT<Int>> p21 p22)))
  :pattern ((C2<ADT<Int>> p21 p22))
  )))
(assert (forall ((p21 Int) (p22 ADT<Int>)) (!
  (= p22 (get_ADT_p22<ADT<Int>> (C2<ADT<Int>> p21 p22)))
  :pattern ((C2<ADT<Int>> p21 p22))
  )))
(assert (forall ((p31 Int)) (!
  (= p31 (get_ADT_p31<Int> (C3<ADT<Int>> p31)))
  :pattern ((C3<ADT<Int>> p31))
  )))
(assert (forall ((p41 Bool) (p42 ADT<Int>) (p43 ADT<Int>)) (!
  (= p41 (get_ADT_p41<Bool> (C4<ADT<Int>> p41 p42 p43)))
  :pattern ((C4<ADT<Int>> p41 p42 p43))
  )))
(assert (forall ((p41 Bool) (p42 ADT<Int>) (p43 ADT<Int>)) (!
  (= p42 (get_ADT_p42<ADT<Int>> (C4<ADT<Int>> p41 p42 p43)))
  :pattern ((C4<ADT<Int>> p41 p42 p43))
  )))
(assert (forall ((p41 Bool) (p42 ADT<Int>) (p43 ADT<Int>)) (!
  (= p43 (get_ADT_p43<ADT<Int>> (C4<ADT<Int>> p41 p42 p43)))
  :pattern ((C4<ADT<Int>> p41 p42 p43))
  )))
(assert (= (ADT_tag<Int> (as C1<ADT<Int>>  ADT<Int>)) 0))
(assert (forall ((p21 Int) (p22 ADT<Int>)) (!
  (= (ADT_tag<Int> (C2<ADT<Int>> p21 p22)) 1)
  :pattern ((C2<ADT<Int>> p21 p22))
  )))
(assert (forall ((p31 Int)) (!
  (= (ADT_tag<Int> (C3<ADT<Int>> p31)) 2)
  :pattern ((C3<ADT<Int>> p31))
  )))
(assert (forall ((p41 Bool) (p42 ADT<Int>) (p43 ADT<Int>)) (!
  (= (ADT_tag<Int> (C4<ADT<Int>> p41 p42 p43)) 3)
  :pattern ((C4<ADT<Int>> p41 p42 p43))
  )))
(assert (= (ADT_tag<Int> (as C5<ADT<Int>>  ADT<Int>)) 4))
(assert (= (ADT_tag<Int> (as C6<ADT<Int>>  ADT<Int>)) 5))
(assert (forall ((t ADT<Int>)) (!
  (or
    (or
      (or
        (or
          (or
            (= t (as C1<ADT<Int>>  ADT<Int>))
            (= t (C2<ADT<Int>> (get_ADT_p21<Int> t) (get_ADT_p22<ADT<Int>> t))))
          (= t (C3<ADT<Int>> (get_ADT_p31<Int> t))))
        (=
          t
          (C4<ADT<Int>> (get_ADT_p41<Bool> t) (get_ADT_p42<ADT<Int>> t) (get_ADT_p43<ADT<Int>> t))))
      (= t (as C5<ADT<Int>>  ADT<Int>)))
    (= t (as C6<ADT<Int>>  ADT<Int>)))
  :pattern ((ADT_tag<Int> t))
  )))
(assert (forall ((p21 Bool) (p22 ADT<Bool>)) (!
  (= p21 (get_ADT_p21<Bool> (C2<ADT<Bool>> p21 p22)))
  :pattern ((C2<ADT<Bool>> p21 p22))
  )))
(assert (forall ((p21 Bool) (p22 ADT<Bool>)) (!
  (= p22 (get_ADT_p22<ADT<Bool>> (C2<ADT<Bool>> p21 p22)))
  :pattern ((C2<ADT<Bool>> p21 p22))
  )))
(assert (forall ((p31 Int)) (!
  (= p31 (get_ADT_p31<Int> (C3<ADT<Bool>> p31)))
  :pattern ((C3<ADT<Bool>> p31))
  )))
(assert (forall ((p41 Bool) (p42 ADT<Bool>) (p43 ADT<Int>)) (!
  (= p41 (get_ADT_p41<Bool> (C4<ADT<Bool>> p41 p42 p43)))
  :pattern ((C4<ADT<Bool>> p41 p42 p43))
  )))
(assert (forall ((p41 Bool) (p42 ADT<Bool>) (p43 ADT<Int>)) (!
  (= p42 (get_ADT_p42<ADT<Bool>> (C4<ADT<Bool>> p41 p42 p43)))
  :pattern ((C4<ADT<Bool>> p41 p42 p43))
  )))
(assert (forall ((p41 Bool) (p42 ADT<Bool>) (p43 ADT<Int>)) (!
  (= p43 (get_ADT_p43<ADT<Int>> (C4<ADT<Bool>> p41 p42 p43)))
  :pattern ((C4<ADT<Bool>> p41 p42 p43))
  )))
(assert (= (ADT_tag<Int> (as C1<ADT<Bool>>  ADT<Bool>)) 0))
(assert (forall ((p21 Bool) (p22 ADT<Bool>)) (!
  (= (ADT_tag<Int> (C2<ADT<Bool>> p21 p22)) 1)
  :pattern ((C2<ADT<Bool>> p21 p22))
  )))
(assert (forall ((p31 Int)) (!
  (= (ADT_tag<Int> (C3<ADT<Bool>> p31)) 2)
  :pattern ((C3<ADT<Bool>> p31))
  )))
(assert (forall ((p41 Bool) (p42 ADT<Bool>) (p43 ADT<Int>)) (!
  (= (ADT_tag<Int> (C4<ADT<Bool>> p41 p42 p43)) 3)
  :pattern ((C4<ADT<Bool>> p41 p42 p43))
  )))
(assert (= (ADT_tag<Int> (as C5<ADT<Bool>>  ADT<Bool>)) 4))
(assert (= (ADT_tag<Int> (as C6<ADT<Bool>>  ADT<Bool>)) 5))
(assert (forall ((t ADT<Bool>)) (!
  (or
    (or
      (or
        (or
          (or
            (= t (as C1<ADT<Bool>>  ADT<Bool>))
            (=
              t
              (C2<ADT<Bool>> (get_ADT_p21<Bool> t) (get_ADT_p22<ADT<Bool>> t))))
          (= t (C3<ADT<Bool>> (get_ADT_p31<Int> t))))
        (=
          t
          (C4<ADT<Bool>> (get_ADT_p41<Bool> t) (get_ADT_p42<ADT<Bool>> t) (get_ADT_p43<ADT<Int>> t))))
      (= t (as C5<ADT<Bool>>  ADT<Bool>)))
    (= t (as C6<ADT<Bool>>  ADT<Bool>)))
  :pattern ((ADT_tag<Int> t))
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
; ---------- encoding_2 ----------
(declare-const a@0@01 ADT<Bool>)
(declare-const a@1@01 ADT<Bool>)
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
; assert (ADT_tag(a): Int) == 0 ||
;   ((ADT_tag(a): Int) == 1 ||
;   ((ADT_tag(a): Int) == 2 ||
;   ((ADT_tag(a): Int) == 3 ||
;   ((ADT_tag(a): Int) == 4 || (ADT_tag(a): Int) == 5))))
; [eval] (ADT_tag(a): Int) == 0 || ((ADT_tag(a): Int) == 1 || ((ADT_tag(a): Int) == 2 || ((ADT_tag(a): Int) == 3 || ((ADT_tag(a): Int) == 4 || (ADT_tag(a): Int) == 5))))
; [eval] (ADT_tag(a): Int) == 0
; [eval] (ADT_tag(a): Int)
(push) ; 3
; [then-branch: 0 | ADT_tag[Int](a@1@01) == 0 | live]
; [else-branch: 0 | ADT_tag[Int](a@1@01) != 0 | live]
(push) ; 4
; [then-branch: 0 | ADT_tag[Int](a@1@01) == 0]
(assert (= (ADT_tag<Int> a@1@01) 0))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | ADT_tag[Int](a@1@01) != 0]
(assert (not (= (ADT_tag<Int> a@1@01) 0)))
; [eval] (ADT_tag(a): Int) == 1
; [eval] (ADT_tag(a): Int)
(push) ; 5
; [then-branch: 1 | ADT_tag[Int](a@1@01) == 1 | live]
; [else-branch: 1 | ADT_tag[Int](a@1@01) != 1 | live]
(push) ; 6
; [then-branch: 1 | ADT_tag[Int](a@1@01) == 1]
(assert (= (ADT_tag<Int> a@1@01) 1))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | ADT_tag[Int](a@1@01) != 1]
(assert (not (= (ADT_tag<Int> a@1@01) 1)))
; [eval] (ADT_tag(a): Int) == 2
; [eval] (ADT_tag(a): Int)
(push) ; 7
; [then-branch: 2 | ADT_tag[Int](a@1@01) == 2 | live]
; [else-branch: 2 | ADT_tag[Int](a@1@01) != 2 | live]
(push) ; 8
; [then-branch: 2 | ADT_tag[Int](a@1@01) == 2]
(assert (= (ADT_tag<Int> a@1@01) 2))
(pop) ; 8
(push) ; 8
; [else-branch: 2 | ADT_tag[Int](a@1@01) != 2]
(assert (not (= (ADT_tag<Int> a@1@01) 2)))
; [eval] (ADT_tag(a): Int) == 3
; [eval] (ADT_tag(a): Int)
(push) ; 9
; [then-branch: 3 | ADT_tag[Int](a@1@01) == 3 | live]
; [else-branch: 3 | ADT_tag[Int](a@1@01) != 3 | live]
(push) ; 10
; [then-branch: 3 | ADT_tag[Int](a@1@01) == 3]
(assert (= (ADT_tag<Int> a@1@01) 3))
(pop) ; 10
(push) ; 10
; [else-branch: 3 | ADT_tag[Int](a@1@01) != 3]
(assert (not (= (ADT_tag<Int> a@1@01) 3)))
; [eval] (ADT_tag(a): Int) == 4
; [eval] (ADT_tag(a): Int)
(push) ; 11
; [then-branch: 4 | ADT_tag[Int](a@1@01) == 4 | live]
; [else-branch: 4 | ADT_tag[Int](a@1@01) != 4 | live]
(push) ; 12
; [then-branch: 4 | ADT_tag[Int](a@1@01) == 4]
(assert (= (ADT_tag<Int> a@1@01) 4))
(pop) ; 12
(push) ; 12
; [else-branch: 4 | ADT_tag[Int](a@1@01) != 4]
(assert (not (= (ADT_tag<Int> a@1@01) 4)))
; [eval] (ADT_tag(a): Int) == 5
; [eval] (ADT_tag(a): Int)
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (not (= (ADT_tag<Int> a@1@01) 4)) (= (ADT_tag<Int> a@1@01) 4)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= (ADT_tag<Int> a@1@01) 3))
  (and
    (not (= (ADT_tag<Int> a@1@01) 3))
    (or (not (= (ADT_tag<Int> a@1@01) 4)) (= (ADT_tag<Int> a@1@01) 4)))))
(assert (or (not (= (ADT_tag<Int> a@1@01) 3)) (= (ADT_tag<Int> a@1@01) 3)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= (ADT_tag<Int> a@1@01) 2))
  (and
    (not (= (ADT_tag<Int> a@1@01) 2))
    (=>
      (not (= (ADT_tag<Int> a@1@01) 3))
      (and
        (not (= (ADT_tag<Int> a@1@01) 3))
        (or (not (= (ADT_tag<Int> a@1@01) 4)) (= (ADT_tag<Int> a@1@01) 4))))
    (or (not (= (ADT_tag<Int> a@1@01) 3)) (= (ADT_tag<Int> a@1@01) 3)))))
(assert (or (not (= (ADT_tag<Int> a@1@01) 2)) (= (ADT_tag<Int> a@1@01) 2)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= (ADT_tag<Int> a@1@01) 1))
  (and
    (not (= (ADT_tag<Int> a@1@01) 1))
    (=>
      (not (= (ADT_tag<Int> a@1@01) 2))
      (and
        (not (= (ADT_tag<Int> a@1@01) 2))
        (=>
          (not (= (ADT_tag<Int> a@1@01) 3))
          (and
            (not (= (ADT_tag<Int> a@1@01) 3))
            (or (not (= (ADT_tag<Int> a@1@01) 4)) (= (ADT_tag<Int> a@1@01) 4))))
        (or (not (= (ADT_tag<Int> a@1@01) 3)) (= (ADT_tag<Int> a@1@01) 3))))
    (or (not (= (ADT_tag<Int> a@1@01) 2)) (= (ADT_tag<Int> a@1@01) 2)))))
(assert (or (not (= (ADT_tag<Int> a@1@01) 1)) (= (ADT_tag<Int> a@1@01) 1)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= (ADT_tag<Int> a@1@01) 0))
  (and
    (not (= (ADT_tag<Int> a@1@01) 0))
    (=>
      (not (= (ADT_tag<Int> a@1@01) 1))
      (and
        (not (= (ADT_tag<Int> a@1@01) 1))
        (=>
          (not (= (ADT_tag<Int> a@1@01) 2))
          (and
            (not (= (ADT_tag<Int> a@1@01) 2))
            (=>
              (not (= (ADT_tag<Int> a@1@01) 3))
              (and
                (not (= (ADT_tag<Int> a@1@01) 3))
                (or
                  (not (= (ADT_tag<Int> a@1@01) 4))
                  (= (ADT_tag<Int> a@1@01) 4))))
            (or (not (= (ADT_tag<Int> a@1@01) 3)) (= (ADT_tag<Int> a@1@01) 3))))
        (or (not (= (ADT_tag<Int> a@1@01) 2)) (= (ADT_tag<Int> a@1@01) 2))))
    (or (not (= (ADT_tag<Int> a@1@01) 1)) (= (ADT_tag<Int> a@1@01) 1)))))
(assert (or (not (= (ADT_tag<Int> a@1@01) 0)) (= (ADT_tag<Int> a@1@01) 0)))
(push) ; 3
(assert (not (or
  (= (ADT_tag<Int> a@1@01) 0)
  (or
    (= (ADT_tag<Int> a@1@01) 1)
    (or
      (= (ADT_tag<Int> a@1@01) 2)
      (or
        (= (ADT_tag<Int> a@1@01) 3)
        (or (= (ADT_tag<Int> a@1@01) 4) (= (ADT_tag<Int> a@1@01) 5))))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (or
  (= (ADT_tag<Int> a@1@01) 0)
  (or
    (= (ADT_tag<Int> a@1@01) 1)
    (or
      (= (ADT_tag<Int> a@1@01) 2)
      (or
        (= (ADT_tag<Int> a@1@01) 3)
        (or (= (ADT_tag<Int> a@1@01) 4) (= (ADT_tag<Int> a@1@01) 5)))))))
; [exec]
; assert ((ADT_tag(a): Int) == 0) == (a == (C1(): ADT[Bool]))
; [eval] ((ADT_tag(a): Int) == 0) == (a == (C1(): ADT[Bool]))
; [eval] (ADT_tag(a): Int) == 0
; [eval] (ADT_tag(a): Int)
; [eval] a == (C1(): ADT[Bool])
; [eval] (C1(): ADT[Bool])
(push) ; 3
(assert (not (= (= (ADT_tag<Int> a@1@01) 0) (= a@1@01 (as C1<ADT<Bool>>  ADT<Bool>)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (= (ADT_tag<Int> a@1@01) 0) (= a@1@01 (as C1<ADT<Bool>>  ADT<Bool>))))
; [exec]
; assert (ADT_tag(a): Int) == 1 ==> a != (C1(): ADT[Bool])
; [eval] (ADT_tag(a): Int) == 1 ==> a != (C1(): ADT[Bool])
; [eval] (ADT_tag(a): Int) == 1
; [eval] (ADT_tag(a): Int)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= (ADT_tag<Int> a@1@01) 1))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (ADT_tag<Int> a@1@01) 1)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | ADT_tag[Int](a@1@01) == 1 | live]
; [else-branch: 5 | ADT_tag[Int](a@1@01) != 1 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 5 | ADT_tag[Int](a@1@01) == 1]
(assert (= (ADT_tag<Int> a@1@01) 1))
; [eval] a != (C1(): ADT[Bool])
; [eval] (C1(): ADT[Bool])
(pop) ; 4
(push) ; 4
; [else-branch: 5 | ADT_tag[Int](a@1@01) != 1]
(assert (not (= (ADT_tag<Int> a@1@01) 1)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not (= (ADT_tag<Int> a@1@01) 1)) (= (ADT_tag<Int> a@1@01) 1)))
(push) ; 3
(assert (not (=> (= (ADT_tag<Int> a@1@01) 1) (not (= a@1@01 (as C1<ADT<Bool>>  ADT<Bool>))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=> (= (ADT_tag<Int> a@1@01) 1) (not (= a@1@01 (as C1<ADT<Bool>>  ADT<Bool>)))))
; [exec]
; assert ((ADT_tag(a): Int) == 1) ==
;   (a ==
;   (C2((get_ADT_p21(a): Bool), (get_ADT_p22(a): ADT[Bool])): ADT[Bool]))
; [eval] ((ADT_tag(a): Int) == 1) == (a == (C2((get_ADT_p21(a): Bool), (get_ADT_p22(a): ADT[Bool])): ADT[Bool]))
; [eval] (ADT_tag(a): Int) == 1
; [eval] (ADT_tag(a): Int)
; [eval] a == (C2((get_ADT_p21(a): Bool), (get_ADT_p22(a): ADT[Bool])): ADT[Bool])
; [eval] (C2((get_ADT_p21(a): Bool), (get_ADT_p22(a): ADT[Bool])): ADT[Bool])
; [eval] (get_ADT_p21(a): Bool)
; [eval] (get_ADT_p22(a): ADT[Bool])
(push) ; 3
(assert (not (=
  (= (ADT_tag<Int> a@1@01) 1)
  (=
    a@1@01
    (C2<ADT<Bool>> (get_ADT_p21<Bool> a@1@01) (get_ADT_p22<ADT<Bool>> a@1@01))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (= (ADT_tag<Int> a@1@01) 1)
  (=
    a@1@01
    (C2<ADT<Bool>> (get_ADT_p21<Bool> a@1@01) (get_ADT_p22<ADT<Bool>> a@1@01)))))
(pop) ; 2
(pop) ; 1
