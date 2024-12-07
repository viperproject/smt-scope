(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:08:26
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/third_party/stefan_recent/testThreadInheritanceE1.vpr
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
(declare-sort TYPE 0)
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
(declare-fun $SortWrappers.TYPETo$Snap (TYPE) $Snap)
(declare-fun $SortWrappers.$SnapToTYPE ($Snap) TYPE)
(assert (forall ((x TYPE)) (!
    (= x ($SortWrappers.$SnapToTYPE($SortWrappers.TYPETo$Snap x)))
    :pattern (($SortWrappers.TYPETo$Snap x))
    :qid |$Snap.$SnapToTYPETo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.TYPETo$Snap($SortWrappers.$SnapToTYPE x)))
    :pattern (($SortWrappers.$SnapToTYPE x))
    :qid |$Snap.TYPETo$SnapToTYPE|
    )))
; ////////// Symbols
(declare-const class_Object<TYPE> TYPE)
(declare-const class_Thread<TYPE> TYPE)
(declare-const class_Worker<TYPE> TYPE)
(declare-const class_Main<TYPE> TYPE)
(declare-fun instanceof<Bool> (TYPE TYPE) Bool)
(declare-fun type_of<TYPE> ($Ref) TYPE)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun Thread__is_a_Thread%trigger ($Snap $Ref) Bool)
(declare-fun Thread__instance_of_Thread%trigger ($Snap $Ref) Bool)
(declare-fun Thread__joinToken%trigger ($Snap $Ref $Perm) Bool)
(declare-fun Thread__preFork%trigger ($Snap $Ref $Perm) Bool)
(declare-fun Thread__postJoin%trigger ($Snap $Ref $Perm) Bool)
(declare-fun Thread__joinToken_at_Thread%trigger ($Snap $Ref $Perm) Bool)
(declare-fun Thread__preFork_at_Thread%trigger ($Snap $Ref $Perm) Bool)
(declare-fun Thread__postJoin_at_Thread%trigger ($Snap $Ref $Perm) Bool)
(declare-fun Worker__is_a_Worker%trigger ($Snap $Ref) Bool)
(declare-fun Worker__instance_of_Worker%trigger ($Snap $Ref) Bool)
(declare-fun Worker__is_a_Thread%trigger ($Snap $Ref) Bool)
(declare-fun Worker__instance_of_Thread%trigger ($Snap $Ref) Bool)
(declare-fun Worker__joinToken%trigger ($Snap $Ref $Perm) Bool)
(declare-fun Worker__joinToken_at_Worker%trigger ($Snap $Ref $Perm) Bool)
(declare-fun Worker__preFork%trigger ($Snap $Ref $Perm) Bool)
(declare-fun Worker__postJoin%trigger ($Snap $Ref $Perm) Bool)
(declare-fun Worker__joinToken_at_Thread%trigger ($Snap $Ref $Perm) Bool)
(declare-fun Worker__preFork_at_Thread%trigger ($Snap $Ref $Perm) Bool)
(declare-fun Worker__postJoin_at_Thread%trigger ($Snap $Ref $Perm) Bool)
(declare-fun Worker__preFork_at_Worker%trigger ($Snap $Ref $Perm) Bool)
(declare-fun Worker__postJoin_at_Worker%trigger ($Snap $Ref $Perm) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((t TYPE)) (!
  (instanceof<Bool> (as class_Object<TYPE>  TYPE) t)
  :pattern ((instanceof<Bool> (as class_Object<TYPE>  TYPE) t))
  :qid |prog.object_top|)))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ---------- Thread__is_a_Thread ----------
(declare-const diz@0@00 $Ref)
; ---------- Thread__instance_of_Thread ----------
(declare-const diz@1@00 $Ref)
; ---------- Thread__joinToken ----------
(declare-const diz@2@00 $Ref)
(declare-const p@3@00 $Perm)
; ---------- Thread__preFork ----------
(declare-const diz@4@00 $Ref)
(declare-const p@5@00 $Perm)
; ---------- Thread__postJoin ----------
(declare-const diz@6@00 $Ref)
(declare-const p@7@00 $Perm)
; ---------- Thread__joinToken_at_Thread ----------
(declare-const diz@8@00 $Ref)
(declare-const p@9@00 $Perm)
; ---------- Thread__preFork_at_Thread ----------
(declare-const diz@10@00 $Ref)
(declare-const p@11@00 $Perm)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@12@00 $Snap)
(assert (= $t@12@00 $Snap.unit))
(pop) ; 1
; ---------- Thread__postJoin_at_Thread ----------
(declare-const diz@13@00 $Ref)
(declare-const p@14@00 $Perm)
(push) ; 1
(declare-const $t@15@00 $Snap)
(assert (= $t@15@00 $Snap.unit))
(pop) ; 1
; ---------- Worker__is_a_Worker ----------
(declare-const diz@16@00 $Ref)
; ---------- Worker__instance_of_Worker ----------
(declare-const diz@17@00 $Ref)
; ---------- Worker__is_a_Thread ----------
(declare-const diz@18@00 $Ref)
; ---------- Worker__instance_of_Thread ----------
(declare-const diz@19@00 $Ref)
; ---------- Worker__joinToken ----------
(declare-const diz@20@00 $Ref)
(declare-const p@21@00 $Perm)
; ---------- Worker__joinToken_at_Worker ----------
(declare-const diz@22@00 $Ref)
(declare-const p@23@00 $Perm)
(push) ; 1
(declare-const $t@24@00 $Snap)
(pop) ; 1
; ---------- Worker__preFork ----------
(declare-const diz@25@00 $Ref)
(declare-const p@26@00 $Perm)
; ---------- Worker__postJoin ----------
(declare-const diz@27@00 $Ref)
(declare-const p@28@00 $Perm)
; ---------- Worker__joinToken_at_Thread ----------
(declare-const diz@29@00 $Ref)
(declare-const p@30@00 $Perm)
; ---------- Worker__preFork_at_Thread ----------
(declare-const diz@31@00 $Ref)
(declare-const p@32@00 $Perm)
(push) ; 1
(declare-const $t@33@00 $Snap)
(assert (= $t@33@00 $Snap.unit))
(pop) ; 1
; ---------- Worker__postJoin_at_Thread ----------
(declare-const diz@34@00 $Ref)
(declare-const p@35@00 $Perm)
(push) ; 1
(declare-const $t@36@00 $Snap)
(assert (= $t@36@00 $Snap.unit))
(pop) ; 1
; ---------- Worker__preFork_at_Worker ----------
(declare-const diz@37@00 $Ref)
(declare-const p@38@00 $Perm)
(push) ; 1
(declare-const $t@39@00 $Snap)
(assert (= $t@39@00 ($Snap.combine ($Snap.first $t@39@00) ($Snap.second $t@39@00))))
(assert (= ($Snap.first $t@39@00) $Snap.unit))
; [eval] p >= none
(assert (>= p@38@00 $Perm.No))
(assert (=
  ($Snap.second $t@39@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@39@00))
    ($Snap.second ($Snap.second $t@39@00)))))
(assert (=
  ($Snap.second ($Snap.second $t@39@00))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@39@00)))
    ($Snap.second ($Snap.second ($Snap.second $t@39@00))))))
(declare-const $k@40@00 $Perm)
(assert ($Perm.isReadVar $k@40@00))
(assert (<= $Perm.No $k@40@00))
(assert (<= $k@40@00 $Perm.Write))
(assert (=> (< $Perm.No $k@40@00) (not (= diz@37@00 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@39@00)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@39@00))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@39@00)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@39@00))))
  $Snap.unit))
; [eval] p != none
(assert (not (= p@38@00 $Perm.No)))
(push) ; 2
(assert (not (or (= p@38@00 $Perm.No) (< $Perm.No p@38@00))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No p@38@00))
(assert (<= p@38@00 $Perm.Write))
(assert (=> (< $Perm.No p@38@00) (not (= diz@37@00 $Ref.null))))
(pop) ; 1
; ---------- Worker__postJoin_at_Worker ----------
(declare-const diz@41@00 $Ref)
(declare-const p@42@00 $Perm)
(push) ; 1
(declare-const $t@43@00 $Snap)
(assert (= $t@43@00 ($Snap.combine ($Snap.first $t@43@00) ($Snap.second $t@43@00))))
(assert (= ($Snap.first $t@43@00) $Snap.unit))
; [eval] p >= none
(assert (>= p@42@00 $Perm.No))
(assert (=
  ($Snap.second $t@43@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@43@00))
    ($Snap.second ($Snap.second $t@43@00)))))
(assert (=
  ($Snap.second ($Snap.second $t@43@00))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@43@00)))
    ($Snap.second ($Snap.second ($Snap.second $t@43@00))))))
(declare-const $k@44@00 $Perm)
(assert ($Perm.isReadVar $k@44@00))
(assert (<= $Perm.No $k@44@00))
(assert (<= $k@44@00 $Perm.Write))
(assert (=> (< $Perm.No $k@44@00) (not (= diz@41@00 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@43@00)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@43@00))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@43@00)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@43@00))))
  $Snap.unit))
; [eval] p != none
(assert (not (= p@42@00 $Perm.No)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@43@00))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@43@00)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@43@00))))))))
(push) ; 2
(assert (not (or (= p@42@00 $Perm.No) (< $Perm.No p@42@00))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No p@42@00))
(assert (<= p@42@00 $Perm.Write))
(assert (=> (< $Perm.No p@42@00) (not (= diz@41@00 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@43@00)))))
  $Snap.unit))
; [eval] diz.Worker__output == diz.Worker__input + 1
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No p@42@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [eval] diz.Worker__input + 1
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@44@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@43@00))))))
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@43@00))))
    1)))
(pop) ; 1
