(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:46:22
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/carbon/0049.vpr
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
(declare-sort GlobalKPermission 0)
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
(declare-fun $SortWrappers.GlobalKPermissionTo$Snap (GlobalKPermission) $Snap)
(declare-fun $SortWrappers.$SnapToGlobalKPermission ($Snap) GlobalKPermission)
(assert (forall ((x GlobalKPermission)) (!
    (= x ($SortWrappers.$SnapToGlobalKPermission($SortWrappers.GlobalKPermissionTo$Snap x)))
    :pattern (($SortWrappers.GlobalKPermissionTo$Snap x))
    :qid |$Snap.$SnapToGlobalKPermissionTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.GlobalKPermissionTo$Snap($SortWrappers.$SnapToGlobalKPermission x)))
    :pattern (($SortWrappers.$SnapToGlobalKPermission x))
    :qid |$Snap.GlobalKPermissionTo$SnapToGlobalKPermission|
    )))
; ////////// Symbols
(declare-const globalK$<Perm> $Perm)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun Cellwrite1$%trigger ($Snap $Ref) Bool)
(declare-fun Cellread1$%trigger ($Snap $Ref) Bool)
(declare-fun Cellread2$%trigger ($Snap $Ref) Bool)
; ////////// Uniqueness assumptions from domains
(assert true)
; ////////// Axioms
(assert (and
  (> (as globalK$<Perm>  $Perm) $Perm.No)
  (> $Perm.Write (as globalK$<Perm>  $Perm))))
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
; ---------- Cellb3$ ----------
(declare-const this@0@01 $Ref)
(declare-const k$@1@01 $Perm)
(declare-const this@2@01 $Ref)
(declare-const k$@3@01 $Perm)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(assert (= ($Snap.first $t@4@01) $Snap.unit))
; [eval] this != null
(assert (not (= this@2@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(Cellread1$(this), write)
; [eval] globalK$()
(push) ; 3
(assert (not (or
  (= (as globalK$<Perm>  $Perm) $Perm.No)
  (< $Perm.No (as globalK$<Perm>  $Perm)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No (as globalK$<Perm>  $Perm)))
(assert (<= (as globalK$<Perm>  $Perm) $Perm.Write))
(assert (=> (< $Perm.No (as globalK$<Perm>  $Perm)) (not (= this@2@01 $Ref.null))))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Cellread1$%trigger ($Snap.second $t@4@01) this@2@01))
; [exec]
; fold acc(Cellread2$(this), write)
(declare-const $k@5@01 $Perm)
(assert ($Perm.isReadVar $k@5@01))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= (as globalK$<Perm>  $Perm) $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@5@01 (as globalK$<Perm>  $Perm)))
(assert (<= $Perm.No (- (as globalK$<Perm>  $Perm) $k@5@01)))
(assert (<= (- (as globalK$<Perm>  $Perm) $k@5@01) $Perm.Write))
(assert (=>
  (< $Perm.No (- (as globalK$<Perm>  $Perm) $k@5@01))
  (not (= this@2@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@5@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Cellread2$%trigger ($Snap.second $t@4@01) this@2@01))
; [exec]
; fold acc(Cellread2$(this), write)
(declare-const $k@6@01 $Perm)
(assert ($Perm.isReadVar $k@6@01))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= (- (as globalK$<Perm>  $Perm) $k@5@01) $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@6@01 (- (as globalK$<Perm>  $Perm) $k@5@01)))
(assert (<= $Perm.No (- (- (as globalK$<Perm>  $Perm) $k@5@01) $k@6@01)))
(assert (<= (- (- (as globalK$<Perm>  $Perm) $k@5@01) $k@6@01) $Perm.Write))
(assert (=>
  (< $Perm.No (- (- (as globalK$<Perm>  $Perm) $k@5@01) $k@6@01))
  (not (= this@2@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@6@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; fold acc(Cellwrite1$(this), write)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (-
    (- (- (as globalK$<Perm>  $Perm) $k@5@01) $k@6@01)
    ($Perm.min (- (- (as globalK$<Perm>  $Perm) $k@5@01) $k@6@01) $Perm.Write))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (=
    (-
      $Perm.Write
      ($Perm.min (- (- (as globalK$<Perm>  $Perm) $k@5@01) $k@6@01) $Perm.Write))
    $Perm.No)
  (<
    (-
      $Perm.Write
      ($Perm.min (- (- (as globalK$<Perm>  $Perm) $k@5@01) $k@6@01) $Perm.Write))
    $Perm.No))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (-
    (- (- (as globalK$<Perm>  $Perm) $k@5@01) $k@6@01)
    ($Perm.min (- (- (as globalK$<Perm>  $Perm) $k@5@01) $k@6@01) $Perm.Write))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (=
    (-
      $Perm.Write
      ($Perm.min (- (- (as globalK$<Perm>  $Perm) $k@5@01) $k@6@01) $Perm.Write))
    $Perm.No)
  (<
    (-
      $Perm.Write
      ($Perm.min (- (- (as globalK$<Perm>  $Perm) $k@5@01) $k@6@01) $Perm.Write))
    $Perm.No))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (-
    (- (- (as globalK$<Perm>  $Perm) $k@5@01) $k@6@01)
    ($Perm.min (- (- (as globalK$<Perm>  $Perm) $k@5@01) $k@6@01) $Perm.Write))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (=
    (-
      $Perm.Write
      ($Perm.min (- (- (as globalK$<Perm>  $Perm) $k@5@01) $k@6@01) $Perm.Write))
    $Perm.No)
  (<
    (-
      $Perm.Write
      ($Perm.min (- (- (as globalK$<Perm>  $Perm) $k@5@01) $k@6@01) $Perm.Write))
    $Perm.No))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (-
    (- (- (as globalK$<Perm>  $Perm) $k@5@01) $k@6@01)
    ($Perm.min (- (- (as globalK$<Perm>  $Perm) $k@5@01) $k@6@01) $Perm.Write))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (=
    (-
      $Perm.Write
      ($Perm.min (- (- (as globalK$<Perm>  $Perm) $k@5@01) $k@6@01) $Perm.Write))
    $Perm.No)
  (<
    (-
      $Perm.Write
      ($Perm.min (- (- (as globalK$<Perm>  $Perm) $k@5@01) $k@6@01) $Perm.Write))
    $Perm.No))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
