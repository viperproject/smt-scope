(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:08:57
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/third_party/stefan_recent/test_example1.vpr
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
; ////////// Symbols
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
; ---------- Main__main ----------
(declare-const diz@0@01 $Ref)
(declare-const current_thread_id@1@01 Int)
(declare-const diz@2@01 $Ref)
(declare-const current_thread_id@3@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(assert (= ($Snap.first $t@4@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@2@01 $Ref.null)))
(assert (= ($Snap.second $t@4@01) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@3@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var c: Ref
(declare-const c@5@01 $Ref)
; [exec]
; var __flatten_1: Ref
(declare-const __flatten_1@6@01 $Ref)
; [exec]
; var __flatten_2: Int
(declare-const __flatten_2@7@01 Int)
; [exec]
; var __flatten_8: Int
(declare-const __flatten_8@8@01 Int)
; [exec]
; __flatten_1 := Counter__Counter(current_thread_id)
; [eval] current_thread_id >= 0
(declare-const sys__result@9@01 $Ref)
(declare-const $t@10@01 $Snap)
(assert (= $t@10@01 ($Snap.combine ($Snap.first $t@10@01) ($Snap.second $t@10@01))))
(assert (= ($Snap.first $t@10@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@9@01 $Ref.null)))
(assert (=
  ($Snap.second $t@10@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@10@01))
    ($Snap.second ($Snap.second $t@10@01)))))
(assert (= ($Snap.second ($Snap.second $t@10@01)) $Snap.unit))
; [eval] sys__result.Counter__x == 0
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@10@01))) 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; c := __flatten_1
; [exec]
; __flatten_2 := 16
; [exec]
; __flatten_8 := __flatten_2
; [exec]
; c.Counter__x := __flatten_8
; [exec]
; Counter__incr(c, current_thread_id)
; [eval] diz != null
; [eval] current_thread_id >= 0
(declare-const $t@11@01 $Snap)
(assert (= $t@11@01 ($Snap.combine ($Snap.first $t@11@01) ($Snap.second $t@11@01))))
(assert (= ($Snap.second $t@11@01) $Snap.unit))
; [eval] diz.Counter__x == old(diz.Counter__x) + 1
; [eval] old(diz.Counter__x) + 1
; [eval] old(diz.Counter__x)
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@11@01)) 17))
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; assert c.Counter__x == 17
; [eval] c.Counter__x == 17
; [exec]
; Counter__incr(c, current_thread_id)
; [eval] diz != null
; [eval] current_thread_id >= 0
(declare-const $t@12@01 $Snap)
(assert (= $t@12@01 ($Snap.combine ($Snap.first $t@12@01) ($Snap.second $t@12@01))))
(assert (= ($Snap.second $t@12@01) $Snap.unit))
; [eval] diz.Counter__x == old(diz.Counter__x) + 1
; [eval] old(diz.Counter__x) + 1
; [eval] old(diz.Counter__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@12@01))
  (+ ($SortWrappers.$SnapToInt ($Snap.first $t@11@01)) 1)))
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; assert c.Counter__x == 17
; [eval] c.Counter__x == 17
(set-option :timeout 0)
(push) ; 3
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@12@01)) 17)))
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
; [eval] c.Counter__x == 17
(set-option :timeout 0)
(push) ; 3
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@12@01)) 17)))
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
; [eval] c.Counter__x == 17
(set-option :timeout 0)
(push) ; 3
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@12@01)) 17)))
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
; [eval] c.Counter__x == 17
(set-option :timeout 0)
(push) ; 3
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@12@01)) 17)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- Main__Main ----------
(declare-const current_thread_id@13@01 Int)
(declare-const sys__result@14@01 $Ref)
(declare-const current_thread_id@15@01 Int)
(declare-const sys__result@16@01 $Ref)
(push) ; 1
(declare-const $t@17@01 $Snap)
(assert (= $t@17@01 $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@15@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@18@01 $Snap)
(assert (= $t@18@01 $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@16@01 $Ref.null)))
(pop) ; 2
(push) ; 2
; [exec]
; var diz: Ref
(declare-const diz@19@01 $Ref)
; [exec]
; diz := new()
(declare-const diz@20@01 $Ref)
(assert (not (= diz@20@01 $Ref.null)))
(assert (not (= diz@20@01 sys__result@16@01)))
(assert (not (= diz@20@01 diz@19@01)))
; [exec]
; sys__result := diz
; [exec]
; assert sys__result != null
; [eval] sys__result != null
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Counter__incr ----------
(declare-const diz@21@01 $Ref)
(declare-const current_thread_id@22@01 Int)
(declare-const diz@23@01 $Ref)
(declare-const current_thread_id@24@01 Int)
(push) ; 1
(declare-const $t@25@01 $Snap)
(assert (= $t@25@01 ($Snap.combine ($Snap.first $t@25@01) ($Snap.second $t@25@01))))
(assert (= ($Snap.first $t@25@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@23@01 $Ref.null)))
(assert (=
  ($Snap.second $t@25@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@25@01))
    ($Snap.second ($Snap.second $t@25@01)))))
(assert (= ($Snap.first ($Snap.second $t@25@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@24@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@26@01 $Snap)
(assert (= $t@26@01 ($Snap.combine ($Snap.first $t@26@01) ($Snap.second $t@26@01))))
(assert (= ($Snap.second $t@26@01) $Snap.unit))
; [eval] diz.Counter__x == old(diz.Counter__x) + 1
; [eval] old(diz.Counter__x) + 1
; [eval] old(diz.Counter__x)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@26@01))
  (+ ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@25@01))) 1)))
(pop) ; 2
(push) ; 2
; [exec]
; var __flatten_5: Int
(declare-const __flatten_5@27@01 Int)
; [exec]
; var __flatten_11: Int
(declare-const __flatten_11@28@01 Int)
; [exec]
; __flatten_5 := diz.Counter__x + 1
; [eval] diz.Counter__x + 1
(declare-const __flatten_5@29@01 Int)
(assert (=
  __flatten_5@29@01
  (+ ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@25@01))) 1)))
; [exec]
; __flatten_11 := __flatten_5
; [exec]
; diz.Counter__x := __flatten_11
; [eval] diz.Counter__x == old(diz.Counter__x) + 1
; [eval] old(diz.Counter__x) + 1
; [eval] old(diz.Counter__x)
(pop) ; 2
(pop) ; 1
; ---------- Counter__Counter ----------
(declare-const current_thread_id@30@01 Int)
(declare-const sys__result@31@01 $Ref)
(declare-const current_thread_id@32@01 Int)
(declare-const sys__result@33@01 $Ref)
(push) ; 1
(declare-const $t@34@01 $Snap)
(assert (= $t@34@01 $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@32@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@35@01 $Snap)
(assert (= $t@35@01 ($Snap.combine ($Snap.first $t@35@01) ($Snap.second $t@35@01))))
(assert (= ($Snap.first $t@35@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@33@01 $Ref.null)))
(assert (=
  ($Snap.second $t@35@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@35@01))
    ($Snap.second ($Snap.second $t@35@01)))))
(assert (= ($Snap.second ($Snap.second $t@35@01)) $Snap.unit))
; [eval] sys__result.Counter__x == 0
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@35@01))) 0))
(pop) ; 2
(push) ; 2
; [exec]
; var diz: Ref
(declare-const diz@36@01 $Ref)
; [exec]
; var __flatten_6: Int
(declare-const __flatten_6@37@01 Int)
; [exec]
; var __flatten_12: Int
(declare-const __flatten_12@38@01 Int)
; [exec]
; diz := new(Counter__x)
(declare-const diz@39@01 $Ref)
(assert (not (= diz@39@01 $Ref.null)))
(declare-const Counter__x@40@01 Int)
(assert (not (= diz@39@01 diz@36@01)))
(assert (not (= diz@39@01 sys__result@33@01)))
; [exec]
; __flatten_6 := 0
; [exec]
; __flatten_12 := __flatten_6
; [exec]
; diz.Counter__x := __flatten_12
; [exec]
; sys__result := diz
; [exec]
; assert sys__result != null &&
;   (acc(sys__result.Counter__x, write) && sys__result.Counter__x == 0)
; [eval] sys__result != null
; [eval] sys__result.Counter__x == 0
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
