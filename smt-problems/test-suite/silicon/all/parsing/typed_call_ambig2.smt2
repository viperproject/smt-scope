(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:06:15
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/parsing/typed_call_ambig2.vpr
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
(declare-sort huh 0)
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
(declare-fun $SortWrappers.huhTo$Snap (huh) $Snap)
(declare-fun $SortWrappers.$SnapTohuh ($Snap) huh)
(assert (forall ((x huh)) (!
    (= x ($SortWrappers.$SnapTohuh($SortWrappers.huhTo$Snap x)))
    :pattern (($SortWrappers.huhTo$Snap x))
    :qid |$Snap.$SnapTohuhTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.huhTo$Snap($SortWrappers.$SnapTohuh x)))
    :pattern (($SortWrappers.$SnapTohuh x))
    :qid |$Snap.huhTo$SnapTohuh|
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
(declare-fun myfun<Bool> (Bool) Bool)
(declare-fun MWSF_apply ($MWSF $Snap) $Snap)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
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
; var x: Ref
(declare-const x@0@01 $Ref)
; [exec]
; var y: Ref
(declare-const y@1@01 $Ref)
; [exec]
; inhale acc(x.f, write) && (acc(x.f, write) --* acc(y.f, write))
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01))))
(assert (not (= x@0@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert myfun((applying acc(x.f, write) --* acc(y.f, write) in
;     y.f == 0)) ||
;   true
; [eval] myfun((applying acc(x.f, write) --* acc(y.f, write) in y.f == 0)) || true
; [eval] myfun((applying acc(x.f, write) --* acc(y.f, write) in y.f == 0))
; [eval] (applying acc(x.f, write) --* acc(y.f, write) in y.f == 0)
(set-option :timeout 0)
(push) ; 3
(assert (not (= y@1@01 $Ref.null)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] y.f == 0
(pop) ; 3
; Joined path conditions
(assert (not (= y@1@01 $Ref.null)))
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | myfun[Bool](Second:($t@2@01)[First:($t@2@01)] == 0) | live]
; [else-branch: 0 | !(myfun[Bool](Second:($t@2@01)[First:($t@2@01)] == 0)) | live]
(push) ; 4
; [then-branch: 0 | myfun[Bool](Second:($t@2@01)[First:($t@2@01)] == 0)]
(assert (myfun<Bool> (=
  ($SortWrappers.$SnapToInt (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@2@01)) ($Snap.first $t@2@01)))
  0)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | !(myfun[Bool](Second:($t@2@01)[First:($t@2@01)] == 0))]
(assert (not
  (myfun<Bool> (=
    ($SortWrappers.$SnapToInt (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@2@01)) ($Snap.first $t@2@01)))
    0))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (myfun<Bool> (=
      ($SortWrappers.$SnapToInt (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@2@01)) ($Snap.first $t@2@01)))
      0)))
  (myfun<Bool> (=
    ($SortWrappers.$SnapToInt (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@2@01)) ($Snap.first $t@2@01)))
    0))))
(pop) ; 2
(pop) ; 1
