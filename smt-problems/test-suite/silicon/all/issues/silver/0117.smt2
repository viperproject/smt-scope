(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:01:11
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silver/0117.vpr
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
; ---------- m1 ----------
(declare-const a@0@01 Int)
(declare-const b@1@01 Int)
(declare-const c@2@01 Bool)
(declare-const res@3@01 Bool)
(declare-const a@4@01 Int)
(declare-const b@5@01 Int)
(declare-const c@6@01 Bool)
(declare-const res@7@01 Bool)
(set-option :timeout 0)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@8@01 $Snap)
(assert (= $t@8@01 $Snap.unit))
; [eval] res == (a > b == c)
; [eval] a > b == c
; [eval] a > b
(assert (= res@7@01 (= (> a@4@01 b@5@01) c@6@01)))
(pop) ; 2
(push) ; 2
; [exec]
; res := a > b == c
; [eval] a > b == c
; [eval] a > b
(declare-const res@9@01 Bool)
(assert (= res@9@01 (= (> a@4@01 b@5@01) c@6@01)))
; [eval] res == (a > b == c)
; [eval] a > b == c
; [eval] a > b
(pop) ; 2
(pop) ; 1
; ---------- m2 ----------
(declare-const a@10@01 Int)
(declare-const b@11@01 Int)
(declare-const c@12@01 Bool)
(declare-const res@13@01 Bool)
(declare-const a@14@01 Int)
(declare-const b@15@01 Int)
(declare-const c@16@01 Bool)
(declare-const res@17@01 Bool)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@18@01 $Snap)
(assert (= $t@18@01 $Snap.unit))
; [eval] res == (a > b == c)
; [eval] a > b == c
; [eval] a > b
(assert (= res@17@01 (= (> a@14@01 b@15@01) c@16@01)))
(pop) ; 2
(push) ; 2
; [exec]
; res := c == a > b
; [eval] c == a > b
; [eval] a > b
(declare-const res@19@01 Bool)
(assert (= res@19@01 (= c@16@01 (> a@14@01 b@15@01))))
; [eval] res == (a > b == c)
; [eval] a > b == c
; [eval] a > b
(push) ; 3
(assert (not (= res@19@01 (= (> a@14@01 b@15@01) c@16@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= res@19@01 (= (> a@14@01 b@15@01) c@16@01)))
(pop) ; 2
(pop) ; 1
; ---------- m3 ----------
(declare-const a@20@01 Int)
(declare-const b@21@01 Int)
(declare-const c@22@01 Bool)
(declare-const res@23@01 Bool)
(declare-const a@24@01 Int)
(declare-const b@25@01 Int)
(declare-const c@26@01 Bool)
(declare-const res@27@01 Bool)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@28@01 $Snap)
(assert (= $t@28@01 $Snap.unit))
; [eval] res == (a <= b != c)
; [eval] a <= b != c
; [eval] a <= b
(assert (= res@27@01 (not (= (<= a@24@01 b@25@01) c@26@01))))
(pop) ; 2
(push) ; 2
; [exec]
; res := c != a <= b
; [eval] c != a <= b
; [eval] a <= b
(declare-const res@29@01 Bool)
(assert (= res@29@01 (not (= c@26@01 (<= a@24@01 b@25@01)))))
; [eval] res == (a <= b != c)
; [eval] a <= b != c
; [eval] a <= b
(push) ; 3
(assert (not (= res@29@01 (not (= (<= a@24@01 b@25@01) c@26@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= res@29@01 (not (= (<= a@24@01 b@25@01) c@26@01))))
(pop) ; 2
(pop) ; 1
; ---------- m4 ----------
(declare-const a@30@01 Bool)
(declare-const b@31@01 Bool)
(declare-const c@32@01 Bool)
(declare-const res@33@01 Bool)
(declare-const a@34@01 Bool)
(declare-const b@35@01 Bool)
(declare-const c@36@01 Bool)
(declare-const res@37@01 Bool)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@38@01 $Snap)
(assert (= $t@38@01 $Snap.unit))
; [eval] res == (a != (b != c))
; [eval] a != (b != c)
; [eval] b != c
(assert (= res@37@01 (not (= a@34@01 (not (= b@35@01 c@36@01))))))
(pop) ; 2
(push) ; 2
; [exec]
; res := a != (b != c)
; [eval] a != (b != c)
; [eval] b != c
(declare-const res@39@01 Bool)
(assert (= res@39@01 (not (= a@34@01 (not (= b@35@01 c@36@01))))))
; [eval] res == (a != (b != c))
; [eval] a != (b != c)
; [eval] b != c
(pop) ; 2
(pop) ; 1
