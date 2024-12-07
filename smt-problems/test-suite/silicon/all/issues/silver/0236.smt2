(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:03:44
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silver/0236.vpr
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
(declare-sort Option2<Bool> 0)
(declare-sort Option<Ref> 0)
(declare-sort Option<Bool> 0)
(declare-sort Option<Perm> 0)
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
(declare-fun $SortWrappers.Option2<Bool>To$Snap (Option2<Bool>) $Snap)
(declare-fun $SortWrappers.$SnapToOption2<Bool> ($Snap) Option2<Bool>)
(assert (forall ((x Option2<Bool>)) (!
    (= x ($SortWrappers.$SnapToOption2<Bool>($SortWrappers.Option2<Bool>To$Snap x)))
    :pattern (($SortWrappers.Option2<Bool>To$Snap x))
    :qid |$Snap.$SnapToOption2<Bool>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Option2<Bool>To$Snap($SortWrappers.$SnapToOption2<Bool> x)))
    :pattern (($SortWrappers.$SnapToOption2<Bool> x))
    :qid |$Snap.Option2<Bool>To$SnapToOption2<Bool>|
    )))
(declare-fun $SortWrappers.Option<Ref>To$Snap (Option<Ref>) $Snap)
(declare-fun $SortWrappers.$SnapToOption<Ref> ($Snap) Option<Ref>)
(assert (forall ((x Option<Ref>)) (!
    (= x ($SortWrappers.$SnapToOption<Ref>($SortWrappers.Option<Ref>To$Snap x)))
    :pattern (($SortWrappers.Option<Ref>To$Snap x))
    :qid |$Snap.$SnapToOption<Ref>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Option<Ref>To$Snap($SortWrappers.$SnapToOption<Ref> x)))
    :pattern (($SortWrappers.$SnapToOption<Ref> x))
    :qid |$Snap.Option<Ref>To$SnapToOption<Ref>|
    )))
(declare-fun $SortWrappers.Option<Bool>To$Snap (Option<Bool>) $Snap)
(declare-fun $SortWrappers.$SnapToOption<Bool> ($Snap) Option<Bool>)
(assert (forall ((x Option<Bool>)) (!
    (= x ($SortWrappers.$SnapToOption<Bool>($SortWrappers.Option<Bool>To$Snap x)))
    :pattern (($SortWrappers.Option<Bool>To$Snap x))
    :qid |$Snap.$SnapToOption<Bool>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Option<Bool>To$Snap($SortWrappers.$SnapToOption<Bool> x)))
    :pattern (($SortWrappers.$SnapToOption<Bool> x))
    :qid |$Snap.Option<Bool>To$SnapToOption<Bool>|
    )))
(declare-fun $SortWrappers.Option<Perm>To$Snap (Option<Perm>) $Snap)
(declare-fun $SortWrappers.$SnapToOption<Perm> ($Snap) Option<Perm>)
(assert (forall ((x Option<Perm>)) (!
    (= x ($SortWrappers.$SnapToOption<Perm>($SortWrappers.Option<Perm>To$Snap x)))
    :pattern (($SortWrappers.Option<Perm>To$Snap x))
    :qid |$Snap.$SnapToOption<Perm>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Option<Perm>To$Snap($SortWrappers.$SnapToOption<Perm> x)))
    :pattern (($SortWrappers.$SnapToOption<Perm> x))
    :qid |$Snap.Option<Perm>To$SnapToOption<Perm>|
    )))
; ////////// Symbols
(declare-fun Option_discr<Int> (Option<Bool>) Int)
(declare-const Option_None<Option<Bool>> Option<Bool>)
(declare-fun Option_Some<Option<Bool>> (Bool) Option<Bool>)
(declare-fun Option_discr<Int> (Option<Perm>) Int)
(declare-const Option_None<Option<Perm>> Option<Perm>)
(declare-fun Option_Some<Option<Perm>> ($Perm) Option<Perm>)
(declare-fun Option2_discr<Int> (Option2<Bool>) Int)
(declare-const Option2_None<Option2<Bool>> Option2<Bool>)
(declare-fun Option2_Some<Option2<Bool>> (Bool) Option2<Bool>)
(declare-fun Option_discr<Int> (Option<Ref>) Int)
(declare-const Option_None<Option<Ref>> Option<Ref>)
(declare-fun Option_Some<Option<Ref>> ($Ref) Option<Ref>)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (= (Option_discr<Int> (as Option_None<Option<Bool>>  Option<Bool>)) 0))
(assert (= (Option_discr<Int> (as Option_None<Option<Perm>>  Option<Perm>)) 0))
(assert (forall ((o Option2<Bool>)) (!
  (and
    (>= (Option2_discr<Int> o) 0)
    (= (Option2_discr<Int> (as Option2_None<Option2<Bool>>  Option2<Bool>)) 0))
  :pattern ((Option2_discr<Int> o))
  :qid |prog.ax_Option2_None_discr|)))
(assert (= (Option_discr<Int> (as Option_None<Option<Ref>>  Option<Ref>)) 0))
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
; assert (Option_discr((Option_None(): Option[Bool])): Int) == 0
; [eval] (Option_discr((Option_None(): Option[Bool])): Int) == 0
; [eval] (Option_discr((Option_None(): Option[Bool])): Int)
; [eval] (Option_None(): Option[Bool])
(push) ; 3
(assert (not (= (Option_discr<Int> (as Option_None<Option<Bool>>  Option<Bool>)) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Option_discr<Int> (as Option_None<Option<Bool>>  Option<Bool>)) 0))
; [exec]
; assert (Option_discr((Option_None(): Option[Ref])): Int) == 0
; [eval] (Option_discr((Option_None(): Option[Ref])): Int) == 0
; [eval] (Option_discr((Option_None(): Option[Ref])): Int)
; [eval] (Option_None(): Option[Ref])
(push) ; 3
(assert (not (= (Option_discr<Int> (as Option_None<Option<Ref>>  Option<Ref>)) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Option_discr<Int> (as Option_None<Option<Ref>>  Option<Ref>)) 0))
; [exec]
; assert (Option_discr((Option_None(): Option[Perm])): Int) == 1
; [eval] (Option_discr((Option_None(): Option[Perm])): Int) == 1
; [eval] (Option_discr((Option_None(): Option[Perm])): Int)
; [eval] (Option_None(): Option[Perm])
(push) ; 3
(assert (not (= (Option_discr<Int> (as Option_None<Option<Perm>>  Option<Perm>)) 1)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (Option_discr((Option_None(): Option[Perm])): Int) == 1
; [eval] (Option_discr((Option_None(): Option[Perm])): Int)
; [eval] (Option_None(): Option[Perm])
(set-option :timeout 0)
(push) ; 3
(assert (not (= (Option_discr<Int> (as Option_None<Option<Perm>>  Option<Perm>)) 1)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (Option_discr((Option_None(): Option[Perm])): Int) == 1
; [eval] (Option_discr((Option_None(): Option[Perm])): Int)
; [eval] (Option_None(): Option[Perm])
(set-option :timeout 0)
(push) ; 3
(assert (not (= (Option_discr<Int> (as Option_None<Option<Perm>>  Option<Perm>)) 1)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (Option_discr((Option_None(): Option[Perm])): Int) == 1
; [eval] (Option_discr((Option_None(): Option[Perm])): Int)
; [eval] (Option_None(): Option[Perm])
(set-option :timeout 0)
(push) ; 3
(assert (not (= (Option_discr<Int> (as Option_None<Option<Perm>>  Option<Perm>)) 1)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- m2 ----------
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
; assert (Option2_discr((Option2_None(): Option2[Bool])): Int) == 0
; [eval] (Option2_discr((Option2_None(): Option2[Bool])): Int) == 0
; [eval] (Option2_discr((Option2_None(): Option2[Bool])): Int)
; [eval] (Option2_None(): Option2[Bool])
(push) ; 3
(assert (not (= (Option2_discr<Int> (as Option2_None<Option2<Bool>>  Option2<Bool>)) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Option2_discr<Int> (as Option2_None<Option2<Bool>>  Option2<Bool>)) 0))
; [exec]
; assert (Option2_discr((Option2_None(): Option2[Bool])): Int) == 1
; [eval] (Option2_discr((Option2_None(): Option2[Bool])): Int) == 1
; [eval] (Option2_discr((Option2_None(): Option2[Bool])): Int)
; [eval] (Option2_None(): Option2[Bool])
(push) ; 3
(assert (not (= (Option2_discr<Int> (as Option2_None<Option2<Bool>>  Option2<Bool>)) 1)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (Option2_discr((Option2_None(): Option2[Bool])): Int) == 1
; [eval] (Option2_discr((Option2_None(): Option2[Bool])): Int)
; [eval] (Option2_None(): Option2[Bool])
(set-option :timeout 0)
(push) ; 3
(assert (not (= (Option2_discr<Int> (as Option2_None<Option2<Bool>>  Option2<Bool>)) 1)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (Option2_discr((Option2_None(): Option2[Bool])): Int) == 1
; [eval] (Option2_discr((Option2_None(): Option2[Bool])): Int)
; [eval] (Option2_None(): Option2[Bool])
(set-option :timeout 0)
(push) ; 3
(assert (not (= (Option2_discr<Int> (as Option2_None<Option2<Bool>>  Option2<Bool>)) 1)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (Option2_discr((Option2_None(): Option2[Bool])): Int) == 1
; [eval] (Option2_discr((Option2_None(): Option2[Bool])): Int)
; [eval] (Option2_None(): Option2[Bool])
(set-option :timeout 0)
(push) ; 3
(assert (not (= (Option2_discr<Int> (as Option2_None<Option2<Bool>>  Option2<Bool>)) 1)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
