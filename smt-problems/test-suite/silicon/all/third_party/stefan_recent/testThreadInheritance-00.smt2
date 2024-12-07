(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:08:23
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/third_party/stefan_recent/testThreadInheritance.vpr
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
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- Thread__run ----------
(declare-const diz@0@01 $Ref)
(declare-const current_thread_id@1@01 Int)
(declare-const sys__thrown@2@01 $Ref)
(declare-const diz@3@01 $Ref)
(declare-const current_thread_id@4@01 Int)
(declare-const sys__thrown@5@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 ($Snap.combine ($Snap.first $t@6@01) ($Snap.second $t@6@01))))
(assert (= ($Snap.first $t@6@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@3@01 $Ref.null)))
(assert (=
  ($Snap.second $t@6@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.second ($Snap.second $t@6@01)))))
(assert (= ($Snap.first ($Snap.second $t@6@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@4@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@7@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Thread__start ----------
(declare-const diz@8@01 $Ref)
(declare-const current_thread_id@9@01 Int)
(declare-const sys__thrown@10@01 $Ref)
(declare-const diz@11@01 $Ref)
(declare-const current_thread_id@12@01 Int)
(declare-const sys__thrown@13@01 $Ref)
(push) ; 1
(declare-const $t@14@01 $Snap)
(assert (= $t@14@01 ($Snap.combine ($Snap.first $t@14@01) ($Snap.second $t@14@01))))
(assert (= ($Snap.first $t@14@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@11@01 $Ref.null)))
(assert (=
  ($Snap.second $t@14@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@14@01))
    ($Snap.second ($Snap.second $t@14@01)))))
(assert (= ($Snap.first ($Snap.second $t@14@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@12@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@15@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Thread__join ----------
(declare-const diz@16@01 $Ref)
(declare-const current_thread_id@17@01 Int)
(declare-const p@18@01 $Perm)
(declare-const sys__thrown@19@01 $Ref)
(declare-const diz@20@01 $Ref)
(declare-const current_thread_id@21@01 Int)
(declare-const p@22@01 $Perm)
(declare-const sys__thrown@23@01 $Ref)
(push) ; 1
(declare-const $t@24@01 $Snap)
(assert (= $t@24@01 ($Snap.combine ($Snap.first $t@24@01) ($Snap.second $t@24@01))))
(assert (= ($Snap.first $t@24@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@20@01 $Ref.null)))
(assert (=
  ($Snap.second $t@24@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@24@01))
    ($Snap.second ($Snap.second $t@24@01)))))
(assert (= ($Snap.first ($Snap.second $t@24@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@21@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@25@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Thread__open_joinToken_at_Thread ----------
(declare-const diz@26@01 $Ref)
(declare-const current_thread_id@27@01 Int)
(declare-const p@28@01 $Perm)
(declare-const sys__thrown@29@01 $Ref)
(declare-const diz@30@01 $Ref)
(declare-const current_thread_id@31@01 Int)
(declare-const p@32@01 $Perm)
(declare-const sys__thrown@33@01 $Ref)
(push) ; 1
(declare-const $t@34@01 $Snap)
(assert (= $t@34@01 ($Snap.combine ($Snap.first $t@34@01) ($Snap.second $t@34@01))))
(assert (= ($Snap.first $t@34@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@30@01 $Ref.null)))
(assert (=
  ($Snap.second $t@34@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@34@01))
    ($Snap.second ($Snap.second $t@34@01)))))
(assert (= ($Snap.first ($Snap.second $t@34@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@31@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@34@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@34@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@34@01))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@35@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Thread__open_preFork_at_Thread ----------
(declare-const diz@36@01 $Ref)
(declare-const current_thread_id@37@01 Int)
(declare-const p@38@01 $Perm)
(declare-const sys__thrown@39@01 $Ref)
(declare-const diz@40@01 $Ref)
(declare-const current_thread_id@41@01 Int)
(declare-const p@42@01 $Perm)
(declare-const sys__thrown@43@01 $Ref)
(push) ; 1
(declare-const $t@44@01 $Snap)
(assert (= $t@44@01 ($Snap.combine ($Snap.first $t@44@01) ($Snap.second $t@44@01))))
(assert (= ($Snap.first $t@44@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@40@01 $Ref.null)))
(assert (=
  ($Snap.second $t@44@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@44@01))
    ($Snap.second ($Snap.second $t@44@01)))))
(assert (= ($Snap.first ($Snap.second $t@44@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@41@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@44@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@44@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@44@01))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@45@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Thread__open_postJoin_at_Thread ----------
(declare-const diz@46@01 $Ref)
(declare-const current_thread_id@47@01 Int)
(declare-const p@48@01 $Perm)
(declare-const sys__thrown@49@01 $Ref)
(declare-const diz@50@01 $Ref)
(declare-const current_thread_id@51@01 Int)
(declare-const p@52@01 $Perm)
(declare-const sys__thrown@53@01 $Ref)
(push) ; 1
(declare-const $t@54@01 $Snap)
(assert (= $t@54@01 ($Snap.combine ($Snap.first $t@54@01) ($Snap.second $t@54@01))))
(assert (= ($Snap.first $t@54@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@50@01 $Ref.null)))
(assert (=
  ($Snap.second $t@54@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@54@01))
    ($Snap.second ($Snap.second $t@54@01)))))
(assert (= ($Snap.first ($Snap.second $t@54@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@51@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@54@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@54@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@54@01))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@55@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Thread__Thread ----------
(declare-const current_thread_id@56@01 Int)
(declare-const sys__thrown@57@01 $Ref)
(declare-const sys__result@58@01 $Ref)
(declare-const current_thread_id@59@01 Int)
(declare-const sys__thrown@60@01 $Ref)
(declare-const sys__result@61@01 $Ref)
(push) ; 1
(declare-const $t@62@01 $Snap)
(assert (= $t@62@01 $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@59@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@63@01 $Snap)
(assert (= $t@63@01 ($Snap.combine ($Snap.first $t@63@01) ($Snap.second $t@63@01))))
(assert (= ($Snap.first $t@63@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@61@01 $Ref.null)))
(assert (=
  ($Snap.second $t@63@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@63@01))
    ($Snap.second ($Snap.second $t@63@01)))))
(assert (= ($Snap.first ($Snap.second $t@63@01)) $Snap.unit))
; [eval] type_of(sys__result) == class_Thread()
; [eval] type_of(sys__result)
; [eval] class_Thread()
(assert (= (type_of<TYPE> sys__result@61@01) (as class_Thread<TYPE>  TYPE)))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Thread__Thread_at_Thread ----------
(declare-const current_thread_id@64@01 Int)
(declare-const sys__thrown@65@01 $Ref)
(declare-const sys__result@66@01 $Ref)
(declare-const current_thread_id@67@01 Int)
(declare-const sys__thrown@68@01 $Ref)
(declare-const sys__result@69@01 $Ref)
(push) ; 1
(declare-const $t@70@01 $Snap)
(assert (= $t@70@01 $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@67@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@71@01 $Snap)
(assert (= $t@71@01 ($Snap.combine ($Snap.first $t@71@01) ($Snap.second $t@71@01))))
(assert (= ($Snap.first $t@71@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@69@01 $Ref.null)))
(assert (= ($Snap.second $t@71@01) $Snap.unit))
; [eval] type_of(sys__result) == class_Thread()
; [eval] type_of(sys__result)
; [eval] class_Thread()
(assert (= (type_of<TYPE> sys__result@69@01) (as class_Thread<TYPE>  TYPE)))
(pop) ; 2
(push) ; 2
; [exec]
; var diz: Ref
(declare-const diz@72@01 $Ref)
; [exec]
; diz := new()
(declare-const diz@73@01 $Ref)
(assert (not (= diz@73@01 $Ref.null)))
(assert (not (= diz@73@01 sys__result@69@01)))
(assert (not (= diz@73@01 sys__thrown@68@01)))
(assert (not (= diz@73@01 diz@72@01)))
; [exec]
; inhale type_of(diz) == class_Thread()
(declare-const $t@74@01 $Snap)
(assert (= $t@74@01 $Snap.unit))
; [eval] type_of(diz) == class_Thread()
; [eval] type_of(diz)
; [eval] class_Thread()
(assert (= (type_of<TYPE> diz@73@01) (as class_Thread<TYPE>  TYPE)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Thread__run_at_Thread ----------
(declare-const diz@75@01 $Ref)
(declare-const current_thread_id@76@01 Int)
(declare-const sys__thrown@77@01 $Ref)
(declare-const diz@78@01 $Ref)
(declare-const current_thread_id@79@01 Int)
(declare-const sys__thrown@80@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@81@01 $Snap)
(assert (= $t@81@01 ($Snap.combine ($Snap.first $t@81@01) ($Snap.second $t@81@01))))
(assert (= ($Snap.first $t@81@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@78@01 $Ref.null)))
(assert (=
  ($Snap.second $t@81@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@81@01))
    ($Snap.second ($Snap.second $t@81@01)))))
(assert (= ($Snap.first ($Snap.second $t@81@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@79@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@82@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Thread__start_at_Thread ----------
(declare-const diz@83@01 $Ref)
(declare-const current_thread_id@84@01 Int)
(declare-const sys__thrown@85@01 $Ref)
(declare-const diz@86@01 $Ref)
(declare-const current_thread_id@87@01 Int)
(declare-const sys__thrown@88@01 $Ref)
(push) ; 1
(declare-const $t@89@01 $Snap)
(assert (= $t@89@01 ($Snap.combine ($Snap.first $t@89@01) ($Snap.second $t@89@01))))
(assert (= ($Snap.first $t@89@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@86@01 $Ref.null)))
(assert (=
  ($Snap.second $t@89@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@89@01))
    ($Snap.second ($Snap.second $t@89@01)))))
(assert (= ($Snap.first ($Snap.second $t@89@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@87@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@90@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Thread__join_at_Thread ----------
(declare-const diz@91@01 $Ref)
(declare-const current_thread_id@92@01 Int)
(declare-const p@93@01 $Perm)
(declare-const sys__thrown@94@01 $Ref)
(declare-const diz@95@01 $Ref)
(declare-const current_thread_id@96@01 Int)
(declare-const p@97@01 $Perm)
(declare-const sys__thrown@98@01 $Ref)
(push) ; 1
(declare-const $t@99@01 $Snap)
(assert (= $t@99@01 ($Snap.combine ($Snap.first $t@99@01) ($Snap.second $t@99@01))))
(assert (= ($Snap.first $t@99@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@95@01 $Ref.null)))
(assert (=
  ($Snap.second $t@99@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@99@01))
    ($Snap.second ($Snap.second $t@99@01)))))
(assert (= ($Snap.first ($Snap.second $t@99@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@96@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@100@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Worker__run ----------
(declare-const diz@101@01 $Ref)
(declare-const current_thread_id@102@01 Int)
(declare-const sys__thrown@103@01 $Ref)
(declare-const diz@104@01 $Ref)
(declare-const current_thread_id@105@01 Int)
(declare-const sys__thrown@106@01 $Ref)
(push) ; 1
(declare-const $t@107@01 $Snap)
(assert (= $t@107@01 ($Snap.combine ($Snap.first $t@107@01) ($Snap.second $t@107@01))))
(assert (= ($Snap.first $t@107@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@104@01 $Ref.null)))
(assert (=
  ($Snap.second $t@107@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@107@01))
    ($Snap.second ($Snap.second $t@107@01)))))
(assert (= ($Snap.first ($Snap.second $t@107@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@105@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@108@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Worker__start ----------
(declare-const diz@109@01 $Ref)
(declare-const current_thread_id@110@01 Int)
(declare-const sys__thrown@111@01 $Ref)
(declare-const diz@112@01 $Ref)
(declare-const current_thread_id@113@01 Int)
(declare-const sys__thrown@114@01 $Ref)
(push) ; 1
(declare-const $t@115@01 $Snap)
(assert (= $t@115@01 ($Snap.combine ($Snap.first $t@115@01) ($Snap.second $t@115@01))))
(assert (= ($Snap.first $t@115@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@112@01 $Ref.null)))
(assert (=
  ($Snap.second $t@115@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@115@01))
    ($Snap.second ($Snap.second $t@115@01)))))
(assert (= ($Snap.first ($Snap.second $t@115@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@113@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@116@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Worker__join ----------
(declare-const diz@117@01 $Ref)
(declare-const current_thread_id@118@01 Int)
(declare-const p@119@01 $Perm)
(declare-const sys__thrown@120@01 $Ref)
(declare-const diz@121@01 $Ref)
(declare-const current_thread_id@122@01 Int)
(declare-const p@123@01 $Perm)
(declare-const sys__thrown@124@01 $Ref)
(push) ; 1
(declare-const $t@125@01 $Snap)
(assert (= $t@125@01 ($Snap.combine ($Snap.first $t@125@01) ($Snap.second $t@125@01))))
(assert (= ($Snap.first $t@125@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@121@01 $Ref.null)))
(assert (=
  ($Snap.second $t@125@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@125@01))
    ($Snap.second ($Snap.second $t@125@01)))))
(assert (= ($Snap.first ($Snap.second $t@125@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@122@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@126@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Worker__open_joinToken_at_Thread ----------
(declare-const diz@127@01 $Ref)
(declare-const current_thread_id@128@01 Int)
(declare-const p@129@01 $Perm)
(declare-const sys__thrown@130@01 $Ref)
(declare-const diz@131@01 $Ref)
(declare-const current_thread_id@132@01 Int)
(declare-const p@133@01 $Perm)
(declare-const sys__thrown@134@01 $Ref)
(push) ; 1
(declare-const $t@135@01 $Snap)
(assert (= $t@135@01 ($Snap.combine ($Snap.first $t@135@01) ($Snap.second $t@135@01))))
(assert (= ($Snap.first $t@135@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@131@01 $Ref.null)))
(assert (=
  ($Snap.second $t@135@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@135@01))
    ($Snap.second ($Snap.second $t@135@01)))))
(assert (= ($Snap.first ($Snap.second $t@135@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@132@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@135@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@135@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@135@01))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@136@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Worker__open_preFork_at_Thread ----------
(declare-const diz@137@01 $Ref)
(declare-const current_thread_id@138@01 Int)
(declare-const p@139@01 $Perm)
(declare-const sys__thrown@140@01 $Ref)
(declare-const diz@141@01 $Ref)
(declare-const current_thread_id@142@01 Int)
(declare-const p@143@01 $Perm)
(declare-const sys__thrown@144@01 $Ref)
(push) ; 1
(declare-const $t@145@01 $Snap)
(assert (= $t@145@01 ($Snap.combine ($Snap.first $t@145@01) ($Snap.second $t@145@01))))
(assert (= ($Snap.first $t@145@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@141@01 $Ref.null)))
(assert (=
  ($Snap.second $t@145@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@145@01))
    ($Snap.second ($Snap.second $t@145@01)))))
(assert (= ($Snap.first ($Snap.second $t@145@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@142@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@145@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@145@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@145@01))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@146@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Worker__open_postJoin_at_Thread ----------
(declare-const diz@147@01 $Ref)
(declare-const current_thread_id@148@01 Int)
(declare-const p@149@01 $Perm)
(declare-const sys__thrown@150@01 $Ref)
(declare-const diz@151@01 $Ref)
(declare-const current_thread_id@152@01 Int)
(declare-const p@153@01 $Perm)
(declare-const sys__thrown@154@01 $Ref)
(push) ; 1
(declare-const $t@155@01 $Snap)
(assert (= $t@155@01 ($Snap.combine ($Snap.first $t@155@01) ($Snap.second $t@155@01))))
(assert (= ($Snap.first $t@155@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@151@01 $Ref.null)))
(assert (=
  ($Snap.second $t@155@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@155@01))
    ($Snap.second ($Snap.second $t@155@01)))))
(assert (= ($Snap.first ($Snap.second $t@155@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@152@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@155@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@155@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@155@01))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@156@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Worker__Thread ----------
(declare-const current_thread_id@157@01 Int)
(declare-const sys__thrown@158@01 $Ref)
(declare-const sys__result@159@01 $Ref)
(declare-const current_thread_id@160@01 Int)
(declare-const sys__thrown@161@01 $Ref)
(declare-const sys__result@162@01 $Ref)
(push) ; 1
(declare-const $t@163@01 $Snap)
(assert (= $t@163@01 $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@160@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@164@01 $Snap)
(assert (= $t@164@01 ($Snap.combine ($Snap.first $t@164@01) ($Snap.second $t@164@01))))
(assert (= ($Snap.first $t@164@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@162@01 $Ref.null)))
(assert (=
  ($Snap.second $t@164@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@164@01))
    ($Snap.second ($Snap.second $t@164@01)))))
(assert (= ($Snap.first ($Snap.second $t@164@01)) $Snap.unit))
; [eval] type_of(sys__result) == class_Thread()
; [eval] type_of(sys__result)
; [eval] class_Thread()
(assert (= (type_of<TYPE> sys__result@162@01) (as class_Thread<TYPE>  TYPE)))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Worker__Thread_at_Thread ----------
(declare-const current_thread_id@165@01 Int)
(declare-const sys__thrown@166@01 $Ref)
(declare-const sys__result@167@01 $Ref)
(declare-const current_thread_id@168@01 Int)
(declare-const sys__thrown@169@01 $Ref)
(declare-const sys__result@170@01 $Ref)
(push) ; 1
(declare-const $t@171@01 $Snap)
(assert (= $t@171@01 $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@168@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@172@01 $Snap)
(assert (= $t@172@01 ($Snap.combine ($Snap.first $t@172@01) ($Snap.second $t@172@01))))
(assert (= ($Snap.first $t@172@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@170@01 $Ref.null)))
(assert (= ($Snap.second $t@172@01) $Snap.unit))
; [eval] type_of(sys__result) == class_Thread()
; [eval] type_of(sys__result)
; [eval] class_Thread()
(assert (= (type_of<TYPE> sys__result@170@01) (as class_Thread<TYPE>  TYPE)))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Worker__run_at_Thread ----------
(declare-const diz@173@01 $Ref)
(declare-const current_thread_id@174@01 Int)
(declare-const sys__thrown@175@01 $Ref)
(declare-const diz@176@01 $Ref)
(declare-const current_thread_id@177@01 Int)
(declare-const sys__thrown@178@01 $Ref)
(push) ; 1
(declare-const $t@179@01 $Snap)
(assert (= $t@179@01 ($Snap.combine ($Snap.first $t@179@01) ($Snap.second $t@179@01))))
(assert (= ($Snap.first $t@179@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@176@01 $Ref.null)))
(assert (=
  ($Snap.second $t@179@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@179@01))
    ($Snap.second ($Snap.second $t@179@01)))))
(assert (= ($Snap.first ($Snap.second $t@179@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@177@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@180@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Worker__start_at_Thread ----------
(declare-const diz@181@01 $Ref)
(declare-const current_thread_id@182@01 Int)
(declare-const sys__thrown@183@01 $Ref)
(declare-const diz@184@01 $Ref)
(declare-const current_thread_id@185@01 Int)
(declare-const sys__thrown@186@01 $Ref)
(push) ; 1
(declare-const $t@187@01 $Snap)
(assert (= $t@187@01 ($Snap.combine ($Snap.first $t@187@01) ($Snap.second $t@187@01))))
(assert (= ($Snap.first $t@187@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@184@01 $Ref.null)))
(assert (=
  ($Snap.second $t@187@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@187@01))
    ($Snap.second ($Snap.second $t@187@01)))))
(assert (= ($Snap.first ($Snap.second $t@187@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@185@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@188@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Worker__join_at_Thread ----------
(declare-const diz@189@01 $Ref)
(declare-const current_thread_id@190@01 Int)
(declare-const p@191@01 $Perm)
(declare-const sys__thrown@192@01 $Ref)
(declare-const diz@193@01 $Ref)
(declare-const current_thread_id@194@01 Int)
(declare-const p@195@01 $Perm)
(declare-const sys__thrown@196@01 $Ref)
(push) ; 1
(declare-const $t@197@01 $Snap)
(assert (= $t@197@01 ($Snap.combine ($Snap.first $t@197@01) ($Snap.second $t@197@01))))
(assert (= ($Snap.first $t@197@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@193@01 $Ref.null)))
(assert (=
  ($Snap.second $t@197@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@197@01))
    ($Snap.second ($Snap.second $t@197@01)))))
(assert (= ($Snap.first ($Snap.second $t@197@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@194@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@198@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Worker__open_preFork_at_Worker ----------
(declare-const diz@199@01 $Ref)
(declare-const current_thread_id@200@01 Int)
(declare-const p@201@01 $Perm)
(declare-const sys__thrown@202@01 $Ref)
(declare-const diz@203@01 $Ref)
(declare-const current_thread_id@204@01 Int)
(declare-const p@205@01 $Perm)
(declare-const sys__thrown@206@01 $Ref)
(push) ; 1
(declare-const $t@207@01 $Snap)
(assert (= $t@207@01 ($Snap.combine ($Snap.first $t@207@01) ($Snap.second $t@207@01))))
(assert (= ($Snap.first $t@207@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@203@01 $Ref.null)))
(assert (=
  ($Snap.second $t@207@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@207@01))
    ($Snap.second ($Snap.second $t@207@01)))))
(assert (= ($Snap.first ($Snap.second $t@207@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@204@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@207@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@207@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@207@01))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@208@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Worker__open_postJoin_at_Worker ----------
(declare-const diz@209@01 $Ref)
(declare-const current_thread_id@210@01 Int)
(declare-const p@211@01 $Perm)
(declare-const sys__thrown@212@01 $Ref)
(declare-const diz@213@01 $Ref)
(declare-const current_thread_id@214@01 Int)
(declare-const p@215@01 $Perm)
(declare-const sys__thrown@216@01 $Ref)
(push) ; 1
(declare-const $t@217@01 $Snap)
(assert (= $t@217@01 ($Snap.combine ($Snap.first $t@217@01) ($Snap.second $t@217@01))))
(assert (= ($Snap.first $t@217@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@213@01 $Ref.null)))
(assert (=
  ($Snap.second $t@217@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@217@01))
    ($Snap.second ($Snap.second $t@217@01)))))
(assert (= ($Snap.first ($Snap.second $t@217@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@214@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@217@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@217@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@217@01))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@218@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Worker__Worker ----------
(declare-const current_thread_id@219@01 Int)
(declare-const input@220@01 Int)
(declare-const sys__thrown@221@01 $Ref)
(declare-const sys__result@222@01 $Ref)
(declare-const current_thread_id@223@01 Int)
(declare-const input@224@01 Int)
(declare-const sys__thrown@225@01 $Ref)
(declare-const sys__result@226@01 $Ref)
(push) ; 1
(declare-const $t@227@01 $Snap)
(assert (= $t@227@01 $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@223@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@228@01 $Snap)
(assert (= $t@228@01 ($Snap.combine ($Snap.first $t@228@01) ($Snap.second $t@228@01))))
(assert (= ($Snap.first $t@228@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@226@01 $Ref.null)))
(assert (=
  ($Snap.second $t@228@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@228@01))
    ($Snap.second ($Snap.second $t@228@01)))))
(assert (= ($Snap.first ($Snap.second $t@228@01)) $Snap.unit))
; [eval] type_of(sys__result) == class_Worker()
; [eval] type_of(sys__result)
; [eval] class_Worker()
(assert (= (type_of<TYPE> sys__result@226@01) (as class_Worker<TYPE>  TYPE)))
(assert (=
  ($Snap.second ($Snap.second $t@228@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@228@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@228@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@228@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@228@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@228@01)))))))
(declare-const $k@229@01 $Perm)
(assert ($Perm.isReadVar $k@229@01))
(assert (<= $Perm.No $k@229@01))
(assert (<= $k@229@01 $Perm.Write))
(assert (=> (< $Perm.No $k@229@01) (not (= sys__result@226@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@228@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@228@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@228@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@228@01)))))
  $Snap.unit))
; [eval] sys__result.Worker__input == input
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@229@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@228@01)))))
  input@224@01))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Worker__Worker_at_Worker ----------
(declare-const current_thread_id@230@01 Int)
(declare-const input@231@01 Int)
(declare-const sys__thrown@232@01 $Ref)
(declare-const sys__result@233@01 $Ref)
(declare-const current_thread_id@234@01 Int)
(declare-const input@235@01 Int)
(declare-const sys__thrown@236@01 $Ref)
(declare-const sys__result@237@01 $Ref)
(push) ; 1
(declare-const $t@238@01 $Snap)
(assert (= $t@238@01 $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@234@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@239@01 $Snap)
(assert (= $t@239@01 ($Snap.combine ($Snap.first $t@239@01) ($Snap.second $t@239@01))))
(assert (= ($Snap.first $t@239@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@237@01 $Ref.null)))
(assert (=
  ($Snap.second $t@239@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@239@01))
    ($Snap.second ($Snap.second $t@239@01)))))
(assert (= ($Snap.first ($Snap.second $t@239@01)) $Snap.unit))
; [eval] type_of(sys__result) == class_Worker()
; [eval] type_of(sys__result)
; [eval] class_Worker()
(assert (= (type_of<TYPE> sys__result@237@01) (as class_Worker<TYPE>  TYPE)))
(assert (=
  ($Snap.second ($Snap.second $t@239@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@239@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@239@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@239@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@239@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@239@01)))))))
(declare-const $k@240@01 $Perm)
(assert ($Perm.isReadVar $k@240@01))
(assert (<= $Perm.No $k@240@01))
(assert (<= $k@240@01 $Perm.Write))
(assert (=> (< $Perm.No $k@240@01) (not (= sys__result@237@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@239@01))))
  $Snap.unit))
; [eval] sys__result.Worker__input == input
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@240@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@239@01)))))
  input@235@01))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; var diz: Ref
(declare-const diz@241@01 $Ref)
; [exec]
; var __flatten_3: Int
(declare-const __flatten_3@242@01 Int)
; [exec]
; var __flatten_11: Int
(declare-const __flatten_11@243@01 Int)
; [exec]
; diz := new(Worker__input, Worker__output)
(declare-const diz@244@01 $Ref)
(assert (not (= diz@244@01 $Ref.null)))
(declare-const Worker__input@245@01 Int)
(declare-const Worker__output@246@01 Int)
(assert (not (= diz@244@01 diz@241@01)))
(assert (not (= diz@244@01 sys__thrown@236@01)))
(assert (not (= diz@244@01 sys__result@237@01)))
; [exec]
; inhale type_of(diz) == class_Worker()
(declare-const $t@247@01 $Snap)
(assert (= $t@247@01 $Snap.unit))
; [eval] type_of(diz) == class_Worker()
; [eval] type_of(diz)
; [eval] class_Worker()
(assert (= (type_of<TYPE> diz@244@01) (as class_Worker<TYPE>  TYPE)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; __flatten_3 := input
; [exec]
; __flatten_11 := __flatten_3
; [exec]
; diz.Worker__input := __flatten_11
; [exec]
; fold acc(Worker__preFork_at_Thread(diz, write), write)
(assert (Worker__preFork_at_Thread%trigger $Snap.unit diz@244@01 $Perm.Write))
; [exec]
; fold acc(Worker__preFork_at_Worker(diz, write), write)
; [eval] p >= none
(declare-const $k@248@01 $Perm)
(assert ($Perm.isReadVar $k@248@01))
(assert (< $k@248@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@248@01)))
(assert (<= (- $Perm.Write $k@248@01) $Perm.Write))
(assert (=> (< $Perm.No (- $Perm.Write $k@248@01)) (not (= diz@244@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@248@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] p != none
(assert (Worker__preFork_at_Worker%trigger ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.IntTo$Snap input@235@01)
      ($Snap.combine $Snap.unit ($SortWrappers.IntTo$Snap Worker__output@246@01))))) diz@244@01 $Perm.Write))
; [exec]
; sys__result := diz
; [exec]
; assert sys__result != null &&
;   (type_of(sys__result) == class_Worker() &&
;   (acc(Worker__preFork_at_Worker(sys__result, write), write) &&
;   (acc(sys__result.Worker__input, wildcard) &&
;   sys__result.Worker__input == input)))
; [eval] sys__result != null
; [eval] type_of(sys__result) == class_Worker()
; [eval] type_of(sys__result)
; [eval] class_Worker()
(declare-const $k@249@01 $Perm)
(assert ($Perm.isReadVar $k@249@01))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= (- $Perm.Write $k@248@01) $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@249@01 (- $Perm.Write $k@248@01)))
(assert (<= $Perm.No (- (- $Perm.Write $k@248@01) $k@249@01)))
(assert (<= (- (- $Perm.Write $k@248@01) $k@249@01) $Perm.Write))
(assert (=>
  (< $Perm.No (- (- $Perm.Write $k@248@01) $k@249@01))
  (not (= diz@244@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@249@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] sys__result.Worker__input == input
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No (- $Perm.Write $k@248@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Worker__run_at_Worker ----------
(declare-const diz@250@01 $Ref)
(declare-const current_thread_id@251@01 Int)
(declare-const sys__thrown@252@01 $Ref)
(declare-const diz@253@01 $Ref)
(declare-const current_thread_id@254@01 Int)
(declare-const sys__thrown@255@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@256@01 $Snap)
(assert (= $t@256@01 ($Snap.combine ($Snap.first $t@256@01) ($Snap.second $t@256@01))))
(assert (= ($Snap.first $t@256@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@253@01 $Ref.null)))
(assert (=
  ($Snap.second $t@256@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@256@01))
    ($Snap.second ($Snap.second $t@256@01)))))
(assert (= ($Snap.first ($Snap.second $t@256@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@254@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@257@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; var __flatten_4: Int
(declare-const __flatten_4@258@01 Int)
; [exec]
; var __flatten_12: Int
(declare-const __flatten_12@259@01 Int)
; [exec]
; unfold acc(Worker__preFork_at_Worker(diz, write), write)
(assert (=
  ($Snap.second ($Snap.second $t@256@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@256@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@256@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@256@01))) $Snap.unit))
; [eval] p >= none
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@256@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@256@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@256@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@256@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@256@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@256@01))))))))
(declare-const $k@260@01 $Perm)
(assert ($Perm.isReadVar $k@260@01))
(assert (<= $Perm.No $k@260@01))
(assert (<= $k@260@01 $Perm.Write))
(assert (=> (< $Perm.No $k@260@01) (not (= diz@253@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@256@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@256@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@256@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@256@01))))))
  $Snap.unit))
; [eval] p != none
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Worker__preFork_at_Worker%trigger ($Snap.second ($Snap.second $t@256@01)) diz@253@01 $Perm.Write))
; [exec]
; __flatten_4 := diz.Worker__input + 1
; [eval] diz.Worker__input + 1
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@260@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_4@261@01 Int)
(assert (=
  __flatten_4@261@01
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@256@01))))))
    1)))
; [exec]
; __flatten_12 := __flatten_4
; [exec]
; diz.Worker__output := __flatten_12
; [exec]
; fold acc(Worker__postJoin_at_Thread(diz, write), write)
(assert (Worker__postJoin_at_Thread%trigger $Snap.unit diz@253@01 $Perm.Write))
; [exec]
; fold acc(Worker__postJoin_at_Worker(diz, write), write)
; [eval] p >= none
(declare-const $k@262@01 $Perm)
(assert ($Perm.isReadVar $k@262@01))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@260@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@262@01 $k@260@01))
(assert (<= $Perm.No (- $k@260@01 $k@262@01)))
(assert (<= (- $k@260@01 $k@262@01) $Perm.Write))
(assert (=> (< $Perm.No (- $k@260@01 $k@262@01)) (not (= diz@253@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@262@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] p != none
; [eval] diz.Worker__output == diz.Worker__input + 1
; [eval] diz.Worker__input + 1
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@260@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Worker__postJoin_at_Worker%trigger ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@256@01)))))
      ($Snap.combine
        $Snap.unit
        ($Snap.combine ($SortWrappers.IntTo$Snap __flatten_4@261@01) $Snap.unit))))) diz@253@01 $Perm.Write))
(pop) ; 2
(pop) ; 1
; ---------- Main__main ----------
(declare-const current_thread_id@263@01 Int)
(declare-const sys__thrown@264@01 $Ref)
(declare-const current_thread_id@265@01 Int)
(declare-const sys__thrown@266@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@267@01 $Snap)
(assert (= $t@267@01 $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@265@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var w: Ref
(declare-const w@268@01 $Ref)
; [exec]
; var __flatten_5: Ref
(declare-const __flatten_5@269@01 $Ref)
; [exec]
; sys__thrown, __flatten_5 := Worker__Worker(current_thread_id, 7)
; [eval] current_thread_id >= 0
(declare-const sys__thrown@270@01 $Ref)
(declare-const sys__result@271@01 $Ref)
(declare-const $t@272@01 $Snap)
(assert (= $t@272@01 ($Snap.combine ($Snap.first $t@272@01) ($Snap.second $t@272@01))))
(assert (= ($Snap.first $t@272@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@271@01 $Ref.null)))
(assert (=
  ($Snap.second $t@272@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@272@01))
    ($Snap.second ($Snap.second $t@272@01)))))
(assert (= ($Snap.first ($Snap.second $t@272@01)) $Snap.unit))
; [eval] type_of(sys__result) == class_Worker()
; [eval] type_of(sys__result)
; [eval] class_Worker()
(assert (= (type_of<TYPE> sys__result@271@01) (as class_Worker<TYPE>  TYPE)))
(assert (=
  ($Snap.second ($Snap.second $t@272@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@272@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@272@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@272@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@272@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@272@01)))))))
(declare-const $k@273@01 $Perm)
(assert ($Perm.isReadVar $k@273@01))
(assert (<= $Perm.No $k@273@01))
(assert (<= $k@273@01 $Perm.Write))
(assert (=> (< $Perm.No $k@273@01) (not (= sys__result@271@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@272@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@272@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@272@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@272@01)))))
  $Snap.unit))
; [eval] sys__result.Worker__input == input
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@273@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@272@01)))))
  7))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; w := __flatten_5
; [exec]
; assert w.Worker__input == 7
; [eval] w.Worker__input == 7
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@273@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; sys__thrown := Worker__start(w, current_thread_id)
; [eval] diz != null
; [eval] current_thread_id >= 0
(declare-const sys__thrown@274@01 $Ref)
(declare-const $t@275@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; sys__thrown := Worker__join(w, current_thread_id, write)
; [eval] diz != null
; [eval] current_thread_id >= 0
(declare-const sys__thrown@276@01 $Ref)
(declare-const $t@277@01 $Snap)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; assert w.Worker__input == 7
; [eval] w.Worker__input == 7
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@273@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; sys__thrown := Worker__open_postJoin_at_Worker(w, current_thread_id, write)
; [eval] diz != null
; [eval] current_thread_id >= 0
(declare-const sys__thrown@278@01 $Ref)
(declare-const $t@279@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; unfold acc(Worker__postJoin_at_Worker(w, write), write)
(assert (= $t@279@01 ($Snap.combine ($Snap.first $t@279@01) ($Snap.second $t@279@01))))
(assert (= ($Snap.first $t@279@01) $Snap.unit))
; [eval] p >= none
(assert (=
  ($Snap.second $t@279@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@279@01))
    ($Snap.second ($Snap.second $t@279@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@279@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@279@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@279@01))))))
(declare-const $k@280@01 $Perm)
(assert ($Perm.isReadVar $k@280@01))
(declare-const $t@281@01 Int)
(assert (and
  (=>
    (< $Perm.No $k@273@01)
    (=
      $t@281@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@272@01)))))))
  (=>
    (< $Perm.No $k@280@01)
    (=
      $t@281@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@279@01))))))))
(assert (<= $Perm.No (+ $k@273@01 $k@280@01)))
(assert (<= (+ $k@273@01 $k@280@01) $Perm.Write))
(assert (=> (< $Perm.No (+ $k@273@01 $k@280@01)) (not (= sys__result@271@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@279@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@279@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@279@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@279@01))))
  $Snap.unit))
; [eval] p != none
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@279@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@279@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@279@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@279@01)))))
  $Snap.unit))
; [eval] diz.Worker__output == diz.Worker__input + 1
; [eval] diz.Worker__input + 1
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No (+ $k@273@01 $k@280@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@279@01))))))
  (+ $t@281@01 1)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Worker__postJoin_at_Worker%trigger $t@279@01 sys__result@271@01 $Perm.Write))
; [exec]
; assert w.Worker__output == 8
; [eval] w.Worker__output == 8
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@279@01))))))
  8)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@279@01))))))
  8))
(pop) ; 2
(pop) ; 1
; ---------- Main__Main ----------
(declare-const current_thread_id@282@01 Int)
(declare-const sys__thrown@283@01 $Ref)
(declare-const sys__result@284@01 $Ref)
(declare-const current_thread_id@285@01 Int)
(declare-const sys__thrown@286@01 $Ref)
(declare-const sys__result@287@01 $Ref)
(push) ; 1
(declare-const $t@288@01 $Snap)
(assert (= $t@288@01 $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@285@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@289@01 $Snap)
(assert (= $t@289@01 ($Snap.combine ($Snap.first $t@289@01) ($Snap.second $t@289@01))))
(assert (= ($Snap.first $t@289@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@287@01 $Ref.null)))
(assert (= ($Snap.second $t@289@01) $Snap.unit))
; [eval] type_of(sys__result) == class_Main()
; [eval] type_of(sys__result)
; [eval] class_Main()
(assert (= (type_of<TYPE> sys__result@287@01) (as class_Main<TYPE>  TYPE)))
(pop) ; 2
(push) ; 2
; [exec]
; var diz: Ref
(declare-const diz@290@01 $Ref)
; [exec]
; diz := new()
(declare-const diz@291@01 $Ref)
(assert (not (= diz@291@01 $Ref.null)))
(assert (not (= diz@291@01 diz@290@01)))
(assert (not (= diz@291@01 sys__thrown@286@01)))
(assert (not (= diz@291@01 sys__result@287@01)))
; [exec]
; inhale type_of(diz) == class_Main()
(declare-const $t@292@01 $Snap)
(assert (= $t@292@01 $Snap.unit))
; [eval] type_of(diz) == class_Main()
; [eval] type_of(diz)
; [eval] class_Main()
(assert (= (type_of<TYPE> diz@291@01) (as class_Main<TYPE>  TYPE)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; sys__result := diz
; [exec]
; assert sys__result != null && type_of(sys__result) == class_Main()
; [eval] sys__result != null
; [eval] type_of(sys__result) == class_Main()
; [eval] type_of(sys__result)
; [eval] class_Main()
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
