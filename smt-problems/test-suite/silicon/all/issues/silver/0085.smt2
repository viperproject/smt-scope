(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:00:45
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silver/0085.vpr
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
; ---------- specialVariables ----------
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
; var resulter: Ref
(declare-const resulter@0@01 $Ref)
; [exec]
; resulter := new(foo)
(declare-const resulter@1@01 $Ref)
(assert (not (= resulter@1@01 $Ref.null)))
(declare-const foo@2@01 Int)
(assert (not (= resulter@1@01 resulter@0@01)))
; [exec]
; resulter.foo := 1
(pop) ; 2
(pop) ; 1
; ---------- types ----------
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
; var Inter: Ref
(declare-const Inter@3@01 $Ref)
; [exec]
; var Permer: Ref
(declare-const Permer@4@01 $Ref)
; [exec]
; var Booler: Ref
(declare-const Booler@5@01 $Ref)
; [exec]
; var Refer: Ref
(declare-const Refer@6@01 $Ref)
; [exec]
; Inter := new(foo)
(declare-const Inter@7@01 $Ref)
(assert (not (= Inter@7@01 $Ref.null)))
(declare-const foo@8@01 Int)
(assert (not (= Inter@7@01 Inter@3@01)))
(assert (not (= Inter@7@01 Refer@6@01)))
(assert (not (= Inter@7@01 Permer@4@01)))
(assert (not (= Inter@7@01 Booler@5@01)))
; [exec]
; Permer := new(foo)
(declare-const Permer@9@01 $Ref)
(assert (not (= Permer@9@01 $Ref.null)))
(declare-const foo@10@01 Int)
(assert (not (= Permer@9@01 Refer@6@01)))
(assert (not (= Permer@9@01 Permer@4@01)))
(assert (not (= Permer@9@01 Booler@5@01)))
(assert (not (= Permer@9@01 Inter@7@01)))
; [exec]
; Booler := new(foo)
(declare-const Booler@11@01 $Ref)
(assert (not (= Booler@11@01 $Ref.null)))
(declare-const foo@12@01 Int)
(assert (not (= Booler@11@01 Refer@6@01)))
(assert (not (= Booler@11@01 Permer@9@01)))
(assert (not (= Booler@11@01 Booler@5@01)))
(assert (not (= Booler@11@01 Inter@7@01)))
; [exec]
; Refer := new(foo)
(declare-const Refer@13@01 $Ref)
(assert (not (= Refer@13@01 $Ref.null)))
(declare-const foo@14@01 Int)
(assert (not (= Refer@13@01 Refer@6@01)))
(assert (not (= Refer@13@01 Permer@9@01)))
(assert (not (= Refer@13@01 Booler@11@01)))
(assert (not (= Refer@13@01 Inter@7@01)))
; [exec]
; Inter.foo := 1
(push) ; 3
(set-option :timeout 10)
(assert (not (= Permer@9@01 Inter@7@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= Booler@11@01 Inter@7@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= Refer@13@01 Inter@7@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; Permer.foo := 1
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= Inter@7@01 Permer@9@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= Booler@11@01 Permer@9@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= Refer@13@01 Permer@9@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; Booler.foo := 1
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= Permer@9@01 Booler@11@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= Inter@7@01 Booler@11@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= Refer@13@01 Booler@11@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; Refer.foo := 1
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= Booler@11@01 Refer@13@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= Permer@9@01 Refer@13@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= Inter@7@01 Refer@13@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- booleanConstants ----------
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
; var trueer: Ref
(declare-const trueer@15@01 $Ref)
; [exec]
; var falseer: Ref
(declare-const falseer@16@01 $Ref)
; [exec]
; trueer := new(foo)
(declare-const trueer@17@01 $Ref)
(assert (not (= trueer@17@01 $Ref.null)))
(declare-const foo@18@01 Int)
(assert (not (= trueer@17@01 falseer@16@01)))
(assert (not (= trueer@17@01 trueer@15@01)))
; [exec]
; falseer := new(foo)
(declare-const falseer@19@01 $Ref)
(assert (not (= falseer@19@01 $Ref.null)))
(declare-const foo@20@01 Int)
(assert (not (= falseer@19@01 falseer@16@01)))
(assert (not (= falseer@19@01 trueer@17@01)))
; [exec]
; trueer.foo := 1
(push) ; 3
(set-option :timeout 10)
(assert (not (= falseer@19@01 trueer@17@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; falseer.foo := 1
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= trueer@17@01 falseer@19@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- nulll ----------
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
; var nuller: Ref
(declare-const nuller@21@01 $Ref)
; [exec]
; nuller := new(foo)
(declare-const nuller@22@01 $Ref)
(assert (not (= nuller@22@01 $Ref.null)))
(declare-const foo@23@01 Int)
(assert (not (= nuller@22@01 nuller@21@01)))
; [exec]
; nuller.foo := 1
(pop) ; 2
(pop) ; 1
; ---------- declarationKeywords ----------
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
; var methoder: Ref
(declare-const methoder@24@01 $Ref)
; [exec]
; var functioner: Ref
(declare-const functioner@25@01 $Ref)
; [exec]
; var predicateer: Ref
(declare-const predicateer@26@01 $Ref)
; [exec]
; var programer: Ref
(declare-const programer@27@01 $Ref)
; [exec]
; var domainer: Ref
(declare-const domainer@28@01 $Ref)
; [exec]
; var axiomer: Ref
(declare-const axiomer@29@01 $Ref)
; [exec]
; var varer: Ref
(declare-const varer@30@01 $Ref)
; [exec]
; var returnser: Ref
(declare-const returnser@31@01 $Ref)
; [exec]
; var fielder: Ref
(declare-const fielder@32@01 $Ref)
; [exec]
; var defineer: Ref
(declare-const defineer@33@01 $Ref)
; [exec]
; methoder := new(foo)
(declare-const methoder@34@01 $Ref)
(assert (not (= methoder@34@01 $Ref.null)))
(declare-const foo@35@01 Int)
(assert (not (= methoder@34@01 programer@27@01)))
(assert (not (= methoder@34@01 fielder@32@01)))
(assert (not (= methoder@34@01 functioner@25@01)))
(assert (not (= methoder@34@01 returnser@31@01)))
(assert (not (= methoder@34@01 methoder@24@01)))
(assert (not (= methoder@34@01 domainer@28@01)))
(assert (not (= methoder@34@01 predicateer@26@01)))
(assert (not (= methoder@34@01 axiomer@29@01)))
(assert (not (= methoder@34@01 defineer@33@01)))
(assert (not (= methoder@34@01 varer@30@01)))
; [exec]
; functioner := new(foo)
(declare-const functioner@36@01 $Ref)
(assert (not (= functioner@36@01 $Ref.null)))
(declare-const foo@37@01 Int)
(assert (not (= functioner@36@01 programer@27@01)))
(assert (not (= functioner@36@01 fielder@32@01)))
(assert (not (= functioner@36@01 functioner@25@01)))
(assert (not (= functioner@36@01 returnser@31@01)))
(assert (not (= functioner@36@01 domainer@28@01)))
(assert (not (= functioner@36@01 predicateer@26@01)))
(assert (not (= functioner@36@01 axiomer@29@01)))
(assert (not (= functioner@36@01 defineer@33@01)))
(assert (not (= functioner@36@01 methoder@34@01)))
(assert (not (= functioner@36@01 varer@30@01)))
; [exec]
; predicateer := new(foo)
(declare-const predicateer@38@01 $Ref)
(assert (not (= predicateer@38@01 $Ref.null)))
(declare-const foo@39@01 Int)
(assert (not (= predicateer@38@01 programer@27@01)))
(assert (not (= predicateer@38@01 fielder@32@01)))
(assert (not (= predicateer@38@01 returnser@31@01)))
(assert (not (= predicateer@38@01 domainer@28@01)))
(assert (not (= predicateer@38@01 predicateer@26@01)))
(assert (not (= predicateer@38@01 axiomer@29@01)))
(assert (not (= predicateer@38@01 defineer@33@01)))
(assert (not (= predicateer@38@01 methoder@34@01)))
(assert (not (= predicateer@38@01 functioner@36@01)))
(assert (not (= predicateer@38@01 varer@30@01)))
; [exec]
; programer := new(foo)
(declare-const programer@40@01 $Ref)
(assert (not (= programer@40@01 $Ref.null)))
(declare-const foo@41@01 Int)
(assert (not (= programer@40@01 programer@27@01)))
(assert (not (= programer@40@01 fielder@32@01)))
(assert (not (= programer@40@01 returnser@31@01)))
(assert (not (= programer@40@01 domainer@28@01)))
(assert (not (= programer@40@01 axiomer@29@01)))
(assert (not (= programer@40@01 defineer@33@01)))
(assert (not (= programer@40@01 predicateer@38@01)))
(assert (not (= programer@40@01 methoder@34@01)))
(assert (not (= programer@40@01 functioner@36@01)))
(assert (not (= programer@40@01 varer@30@01)))
; [exec]
; domainer := new(foo)
(declare-const domainer@42@01 $Ref)
(assert (not (= domainer@42@01 $Ref.null)))
(declare-const foo@43@01 Int)
(assert (not (= domainer@42@01 fielder@32@01)))
(assert (not (= domainer@42@01 returnser@31@01)))
(assert (not (= domainer@42@01 domainer@28@01)))
(assert (not (= domainer@42@01 axiomer@29@01)))
(assert (not (= domainer@42@01 defineer@33@01)))
(assert (not (= domainer@42@01 predicateer@38@01)))
(assert (not (= domainer@42@01 methoder@34@01)))
(assert (not (= domainer@42@01 functioner@36@01)))
(assert (not (= domainer@42@01 varer@30@01)))
(assert (not (= domainer@42@01 programer@40@01)))
; [exec]
; axiomer := new(foo)
(declare-const axiomer@44@01 $Ref)
(assert (not (= axiomer@44@01 $Ref.null)))
(declare-const foo@45@01 Int)
(assert (not (= axiomer@44@01 fielder@32@01)))
(assert (not (= axiomer@44@01 returnser@31@01)))
(assert (not (= axiomer@44@01 axiomer@29@01)))
(assert (not (= axiomer@44@01 defineer@33@01)))
(assert (not (= axiomer@44@01 predicateer@38@01)))
(assert (not (= axiomer@44@01 methoder@34@01)))
(assert (not (= axiomer@44@01 functioner@36@01)))
(assert (not (= axiomer@44@01 varer@30@01)))
(assert (not (= axiomer@44@01 programer@40@01)))
(assert (not (= axiomer@44@01 domainer@42@01)))
; [exec]
; varer := new(foo)
(declare-const varer@46@01 $Ref)
(assert (not (= varer@46@01 $Ref.null)))
(declare-const foo@47@01 Int)
(assert (not (= varer@46@01 fielder@32@01)))
(assert (not (= varer@46@01 returnser@31@01)))
(assert (not (= varer@46@01 defineer@33@01)))
(assert (not (= varer@46@01 predicateer@38@01)))
(assert (not (= varer@46@01 methoder@34@01)))
(assert (not (= varer@46@01 functioner@36@01)))
(assert (not (= varer@46@01 varer@30@01)))
(assert (not (= varer@46@01 programer@40@01)))
(assert (not (= varer@46@01 domainer@42@01)))
(assert (not (= varer@46@01 axiomer@44@01)))
; [exec]
; returnser := new(foo)
(declare-const returnser@48@01 $Ref)
(assert (not (= returnser@48@01 $Ref.null)))
(declare-const foo@49@01 Int)
(assert (not (= returnser@48@01 fielder@32@01)))
(assert (not (= returnser@48@01 returnser@31@01)))
(assert (not (= returnser@48@01 defineer@33@01)))
(assert (not (= returnser@48@01 predicateer@38@01)))
(assert (not (= returnser@48@01 methoder@34@01)))
(assert (not (= returnser@48@01 functioner@36@01)))
(assert (not (= returnser@48@01 varer@46@01)))
(assert (not (= returnser@48@01 programer@40@01)))
(assert (not (= returnser@48@01 domainer@42@01)))
(assert (not (= returnser@48@01 axiomer@44@01)))
; [exec]
; fielder := new(foo)
(declare-const fielder@50@01 $Ref)
(assert (not (= fielder@50@01 $Ref.null)))
(declare-const foo@51@01 Int)
(assert (not (= fielder@50@01 fielder@32@01)))
(assert (not (= fielder@50@01 defineer@33@01)))
(assert (not (= fielder@50@01 predicateer@38@01)))
(assert (not (= fielder@50@01 returnser@48@01)))
(assert (not (= fielder@50@01 methoder@34@01)))
(assert (not (= fielder@50@01 functioner@36@01)))
(assert (not (= fielder@50@01 varer@46@01)))
(assert (not (= fielder@50@01 programer@40@01)))
(assert (not (= fielder@50@01 domainer@42@01)))
(assert (not (= fielder@50@01 axiomer@44@01)))
; [exec]
; defineer := new(foo)
(declare-const defineer@52@01 $Ref)
(assert (not (= defineer@52@01 $Ref.null)))
(declare-const foo@53@01 Int)
(assert (not (= defineer@52@01 defineer@33@01)))
(assert (not (= defineer@52@01 predicateer@38@01)))
(assert (not (= defineer@52@01 returnser@48@01)))
(assert (not (= defineer@52@01 methoder@34@01)))
(assert (not (= defineer@52@01 functioner@36@01)))
(assert (not (= defineer@52@01 fielder@50@01)))
(assert (not (= defineer@52@01 varer@46@01)))
(assert (not (= defineer@52@01 programer@40@01)))
(assert (not (= defineer@52@01 domainer@42@01)))
(assert (not (= defineer@52@01 axiomer@44@01)))
; [exec]
; methoder.foo := 1
(push) ; 3
(set-option :timeout 10)
(assert (not (= functioner@36@01 methoder@34@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= predicateer@38@01 methoder@34@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= programer@40@01 methoder@34@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= domainer@42@01 methoder@34@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= axiomer@44@01 methoder@34@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= varer@46@01 methoder@34@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= returnser@48@01 methoder@34@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= fielder@50@01 methoder@34@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= defineer@52@01 methoder@34@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; functioner.foo := 1
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= methoder@34@01 functioner@36@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= predicateer@38@01 functioner@36@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= programer@40@01 functioner@36@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= domainer@42@01 functioner@36@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= axiomer@44@01 functioner@36@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= varer@46@01 functioner@36@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= returnser@48@01 functioner@36@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= fielder@50@01 functioner@36@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= defineer@52@01 functioner@36@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; predicateer.foo := 1
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= functioner@36@01 predicateer@38@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= methoder@34@01 predicateer@38@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= programer@40@01 predicateer@38@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= domainer@42@01 predicateer@38@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= axiomer@44@01 predicateer@38@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= varer@46@01 predicateer@38@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= returnser@48@01 predicateer@38@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= fielder@50@01 predicateer@38@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= defineer@52@01 predicateer@38@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; programer.foo := 1
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= predicateer@38@01 programer@40@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= functioner@36@01 programer@40@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= methoder@34@01 programer@40@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= domainer@42@01 programer@40@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= axiomer@44@01 programer@40@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= varer@46@01 programer@40@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= returnser@48@01 programer@40@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= fielder@50@01 programer@40@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= defineer@52@01 programer@40@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; domainer.foo := 1
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= programer@40@01 domainer@42@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= predicateer@38@01 domainer@42@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= functioner@36@01 domainer@42@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= methoder@34@01 domainer@42@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= axiomer@44@01 domainer@42@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= varer@46@01 domainer@42@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= returnser@48@01 domainer@42@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= fielder@50@01 domainer@42@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= defineer@52@01 domainer@42@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; axiomer.foo := 1
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= domainer@42@01 axiomer@44@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= programer@40@01 axiomer@44@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= predicateer@38@01 axiomer@44@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= functioner@36@01 axiomer@44@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= methoder@34@01 axiomer@44@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= varer@46@01 axiomer@44@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= returnser@48@01 axiomer@44@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= fielder@50@01 axiomer@44@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= defineer@52@01 axiomer@44@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; varer.foo := 1
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= axiomer@44@01 varer@46@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= domainer@42@01 varer@46@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= programer@40@01 varer@46@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= predicateer@38@01 varer@46@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= functioner@36@01 varer@46@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= methoder@34@01 varer@46@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= returnser@48@01 varer@46@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= fielder@50@01 varer@46@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= defineer@52@01 varer@46@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; returnser.foo := 1
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= varer@46@01 returnser@48@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= axiomer@44@01 returnser@48@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= domainer@42@01 returnser@48@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= programer@40@01 returnser@48@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= predicateer@38@01 returnser@48@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= functioner@36@01 returnser@48@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= methoder@34@01 returnser@48@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= fielder@50@01 returnser@48@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= defineer@52@01 returnser@48@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; fielder.foo := 1
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= returnser@48@01 fielder@50@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= varer@46@01 fielder@50@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= axiomer@44@01 fielder@50@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= domainer@42@01 fielder@50@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= programer@40@01 fielder@50@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= predicateer@38@01 fielder@50@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= functioner@36@01 fielder@50@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= methoder@34@01 fielder@50@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= defineer@52@01 fielder@50@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; defineer.foo := 1
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= fielder@50@01 defineer@52@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= returnser@48@01 defineer@52@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= varer@46@01 defineer@52@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= axiomer@44@01 defineer@52@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= domainer@42@01 defineer@52@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= programer@40@01 defineer@52@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= predicateer@38@01 defineer@52@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= functioner@36@01 defineer@52@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= methoder@34@01 defineer@52@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- specifications ----------
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
; var requireser: Ref
(declare-const requireser@54@01 $Ref)
; [exec]
; var ensureser: Ref
(declare-const ensureser@55@01 $Ref)
; [exec]
; var invarianter: Ref
(declare-const invarianter@56@01 $Ref)
; [exec]
; requireser := new(foo)
(declare-const requireser@57@01 $Ref)
(assert (not (= requireser@57@01 $Ref.null)))
(declare-const foo@58@01 Int)
(assert (not (= requireser@57@01 ensureser@55@01)))
(assert (not (= requireser@57@01 invarianter@56@01)))
(assert (not (= requireser@57@01 requireser@54@01)))
; [exec]
; ensureser := new(foo)
(declare-const ensureser@59@01 $Ref)
(assert (not (= ensureser@59@01 $Ref.null)))
(declare-const foo@60@01 Int)
(assert (not (= ensureser@59@01 ensureser@55@01)))
(assert (not (= ensureser@59@01 invarianter@56@01)))
(assert (not (= ensureser@59@01 requireser@57@01)))
; [exec]
; invarianter := new(foo)
(declare-const invarianter@61@01 $Ref)
(assert (not (= invarianter@61@01 $Ref.null)))
(declare-const foo@62@01 Int)
(assert (not (= invarianter@61@01 invarianter@56@01)))
(assert (not (= invarianter@61@01 requireser@57@01)))
(assert (not (= invarianter@61@01 ensureser@59@01)))
; [exec]
; requireser.foo := 1
(push) ; 3
(set-option :timeout 10)
(assert (not (= ensureser@59@01 requireser@57@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= invarianter@61@01 requireser@57@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; ensureser.foo := 1
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= requireser@57@01 ensureser@59@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= invarianter@61@01 ensureser@59@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; invarianter.foo := 1
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ensureser@59@01 invarianter@61@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= requireser@57@01 invarianter@61@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- statements ----------
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
; var folder: Ref
(declare-const folder@63@01 $Ref)
; [exec]
; var unfolder: Ref
(declare-const unfolder@64@01 $Ref)
; [exec]
; var inhaleer: Ref
(declare-const inhaleer@65@01 $Ref)
; [exec]
; var exhaleer: Ref
(declare-const exhaleer@66@01 $Ref)
; [exec]
; var newer: Ref
(declare-const newer@67@01 $Ref)
; [exec]
; var asserter: Ref
(declare-const asserter@68@01 $Ref)
; [exec]
; var assumeer: Ref
(declare-const assumeer@69@01 $Ref)
; [exec]
; var gotoer: Ref
(declare-const gotoer@70@01 $Ref)
; [exec]
; folder := new(foo)
(declare-const folder@71@01 $Ref)
(assert (not (= folder@71@01 $Ref.null)))
(declare-const foo@72@01 Int)
(assert (not (= folder@71@01 exhaleer@66@01)))
(assert (not (= folder@71@01 newer@67@01)))
(assert (not (= folder@71@01 unfolder@64@01)))
(assert (not (= folder@71@01 gotoer@70@01)))
(assert (not (= folder@71@01 folder@63@01)))
(assert (not (= folder@71@01 inhaleer@65@01)))
(assert (not (= folder@71@01 assumeer@69@01)))
(assert (not (= folder@71@01 asserter@68@01)))
; [exec]
; unfolder := new(foo)
(declare-const unfolder@73@01 $Ref)
(assert (not (= unfolder@73@01 $Ref.null)))
(declare-const foo@74@01 Int)
(assert (not (= unfolder@73@01 exhaleer@66@01)))
(assert (not (= unfolder@73@01 newer@67@01)))
(assert (not (= unfolder@73@01 unfolder@64@01)))
(assert (not (= unfolder@73@01 gotoer@70@01)))
(assert (not (= unfolder@73@01 folder@71@01)))
(assert (not (= unfolder@73@01 inhaleer@65@01)))
(assert (not (= unfolder@73@01 assumeer@69@01)))
(assert (not (= unfolder@73@01 asserter@68@01)))
; [exec]
; inhaleer := new(foo)
(declare-const inhaleer@75@01 $Ref)
(assert (not (= inhaleer@75@01 $Ref.null)))
(declare-const foo@76@01 Int)
(assert (not (= inhaleer@75@01 exhaleer@66@01)))
(assert (not (= inhaleer@75@01 newer@67@01)))
(assert (not (= inhaleer@75@01 gotoer@70@01)))
(assert (not (= inhaleer@75@01 folder@71@01)))
(assert (not (= inhaleer@75@01 inhaleer@65@01)))
(assert (not (= inhaleer@75@01 unfolder@73@01)))
(assert (not (= inhaleer@75@01 assumeer@69@01)))
(assert (not (= inhaleer@75@01 asserter@68@01)))
; [exec]
; exhaleer := new(foo)
(declare-const exhaleer@77@01 $Ref)
(assert (not (= exhaleer@77@01 $Ref.null)))
(declare-const foo@78@01 Int)
(assert (not (= exhaleer@77@01 exhaleer@66@01)))
(assert (not (= exhaleer@77@01 newer@67@01)))
(assert (not (= exhaleer@77@01 gotoer@70@01)))
(assert (not (= exhaleer@77@01 inhaleer@75@01)))
(assert (not (= exhaleer@77@01 folder@71@01)))
(assert (not (= exhaleer@77@01 unfolder@73@01)))
(assert (not (= exhaleer@77@01 assumeer@69@01)))
(assert (not (= exhaleer@77@01 asserter@68@01)))
; [exec]
; newer := new(foo)
(declare-const newer@79@01 $Ref)
(assert (not (= newer@79@01 $Ref.null)))
(declare-const foo@80@01 Int)
(assert (not (= newer@79@01 newer@67@01)))
(assert (not (= newer@79@01 gotoer@70@01)))
(assert (not (= newer@79@01 exhaleer@77@01)))
(assert (not (= newer@79@01 inhaleer@75@01)))
(assert (not (= newer@79@01 folder@71@01)))
(assert (not (= newer@79@01 unfolder@73@01)))
(assert (not (= newer@79@01 assumeer@69@01)))
(assert (not (= newer@79@01 asserter@68@01)))
; [exec]
; asserter := new(foo)
(declare-const asserter@81@01 $Ref)
(assert (not (= asserter@81@01 $Ref.null)))
(declare-const foo@82@01 Int)
(assert (not (= asserter@81@01 gotoer@70@01)))
(assert (not (= asserter@81@01 exhaleer@77@01)))
(assert (not (= asserter@81@01 newer@79@01)))
(assert (not (= asserter@81@01 inhaleer@75@01)))
(assert (not (= asserter@81@01 folder@71@01)))
(assert (not (= asserter@81@01 unfolder@73@01)))
(assert (not (= asserter@81@01 assumeer@69@01)))
(assert (not (= asserter@81@01 asserter@68@01)))
; [exec]
; assumeer := new(foo)
(declare-const assumeer@83@01 $Ref)
(assert (not (= assumeer@83@01 $Ref.null)))
(declare-const foo@84@01 Int)
(assert (not (= assumeer@83@01 asserter@81@01)))
(assert (not (= assumeer@83@01 gotoer@70@01)))
(assert (not (= assumeer@83@01 exhaleer@77@01)))
(assert (not (= assumeer@83@01 newer@79@01)))
(assert (not (= assumeer@83@01 inhaleer@75@01)))
(assert (not (= assumeer@83@01 folder@71@01)))
(assert (not (= assumeer@83@01 unfolder@73@01)))
(assert (not (= assumeer@83@01 assumeer@69@01)))
; [exec]
; gotoer := new(foo)
(declare-const gotoer@85@01 $Ref)
(assert (not (= gotoer@85@01 $Ref.null)))
(declare-const foo@86@01 Int)
(assert (not (= gotoer@85@01 asserter@81@01)))
(assert (not (= gotoer@85@01 gotoer@70@01)))
(assert (not (= gotoer@85@01 exhaleer@77@01)))
(assert (not (= gotoer@85@01 newer@79@01)))
(assert (not (= gotoer@85@01 inhaleer@75@01)))
(assert (not (= gotoer@85@01 folder@71@01)))
(assert (not (= gotoer@85@01 unfolder@73@01)))
(assert (not (= gotoer@85@01 assumeer@83@01)))
; [exec]
; folder.foo := 1
(push) ; 3
(set-option :timeout 10)
(assert (not (= unfolder@73@01 folder@71@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= inhaleer@75@01 folder@71@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= exhaleer@77@01 folder@71@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= newer@79@01 folder@71@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= asserter@81@01 folder@71@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= assumeer@83@01 folder@71@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= gotoer@85@01 folder@71@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; unfolder.foo := 1
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= folder@71@01 unfolder@73@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= inhaleer@75@01 unfolder@73@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= exhaleer@77@01 unfolder@73@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= newer@79@01 unfolder@73@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= asserter@81@01 unfolder@73@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= assumeer@83@01 unfolder@73@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= gotoer@85@01 unfolder@73@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; inhaleer.foo := 1
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= unfolder@73@01 inhaleer@75@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= folder@71@01 inhaleer@75@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= exhaleer@77@01 inhaleer@75@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= newer@79@01 inhaleer@75@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= asserter@81@01 inhaleer@75@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= assumeer@83@01 inhaleer@75@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= gotoer@85@01 inhaleer@75@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; exhaleer.foo := 1
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= inhaleer@75@01 exhaleer@77@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= unfolder@73@01 exhaleer@77@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= folder@71@01 exhaleer@77@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= newer@79@01 exhaleer@77@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= asserter@81@01 exhaleer@77@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= assumeer@83@01 exhaleer@77@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= gotoer@85@01 exhaleer@77@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; newer.foo := 1
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= exhaleer@77@01 newer@79@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= inhaleer@75@01 newer@79@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= unfolder@73@01 newer@79@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= folder@71@01 newer@79@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= asserter@81@01 newer@79@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= assumeer@83@01 newer@79@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= gotoer@85@01 newer@79@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; asserter.foo := 1
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= newer@79@01 asserter@81@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= exhaleer@77@01 asserter@81@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= inhaleer@75@01 asserter@81@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= unfolder@73@01 asserter@81@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= folder@71@01 asserter@81@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= assumeer@83@01 asserter@81@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= gotoer@85@01 asserter@81@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; assumeer.foo := 1
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= asserter@81@01 assumeer@83@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= newer@79@01 assumeer@83@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= exhaleer@77@01 assumeer@83@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= inhaleer@75@01 assumeer@83@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= unfolder@73@01 assumeer@83@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= folder@71@01 assumeer@83@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= gotoer@85@01 assumeer@83@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; gotoer.foo := 1
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= assumeer@83@01 gotoer@85@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= asserter@81@01 gotoer@85@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= newer@79@01 gotoer@85@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= exhaleer@77@01 gotoer@85@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= inhaleer@75@01 gotoer@85@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= unfolder@73@01 gotoer@85@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= folder@71@01 gotoer@85@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- controlStructures ----------
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
; var whileer: Ref
(declare-const whileer@87@01 $Ref)
; [exec]
; var ifer: Ref
(declare-const ifer@88@01 $Ref)
; [exec]
; var elseifer: Ref
(declare-const elseifer@89@01 $Ref)
; [exec]
; var elseer: Ref
(declare-const elseer@90@01 $Ref)
; [exec]
; whileer := new(foo)
(declare-const whileer@91@01 $Ref)
(assert (not (= whileer@91@01 $Ref.null)))
(declare-const foo@92@01 Int)
(assert (not (= whileer@91@01 elseer@90@01)))
(assert (not (= whileer@91@01 ifer@88@01)))
(assert (not (= whileer@91@01 whileer@87@01)))
(assert (not (= whileer@91@01 elseifer@89@01)))
; [exec]
; ifer := new(foo)
(declare-const ifer@93@01 $Ref)
(assert (not (= ifer@93@01 $Ref.null)))
(declare-const foo@94@01 Int)
(assert (not (= ifer@93@01 elseer@90@01)))
(assert (not (= ifer@93@01 whileer@91@01)))
(assert (not (= ifer@93@01 ifer@88@01)))
(assert (not (= ifer@93@01 elseifer@89@01)))
; [exec]
; elseifer := new(foo)
(declare-const elseifer@95@01 $Ref)
(assert (not (= elseifer@95@01 $Ref.null)))
(declare-const foo@96@01 Int)
(assert (not (= elseifer@95@01 elseer@90@01)))
(assert (not (= elseifer@95@01 whileer@91@01)))
(assert (not (= elseifer@95@01 ifer@93@01)))
(assert (not (= elseifer@95@01 elseifer@89@01)))
; [exec]
; elseer := new(foo)
(declare-const elseer@97@01 $Ref)
(assert (not (= elseer@97@01 $Ref.null)))
(declare-const foo@98@01 Int)
(assert (not (= elseer@97@01 elseer@90@01)))
(assert (not (= elseer@97@01 whileer@91@01)))
(assert (not (= elseer@97@01 ifer@93@01)))
(assert (not (= elseer@97@01 elseifer@95@01)))
; [exec]
; whileer.foo := 1
(push) ; 3
(set-option :timeout 10)
(assert (not (= ifer@93@01 whileer@91@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= elseifer@95@01 whileer@91@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= elseer@97@01 whileer@91@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; ifer.foo := 1
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= whileer@91@01 ifer@93@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= elseifer@95@01 ifer@93@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= elseer@97@01 ifer@93@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; elseifer.foo := 1
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ifer@93@01 elseifer@95@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= whileer@91@01 elseifer@95@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= elseer@97@01 elseifer@95@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; elseer.foo := 1
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= elseifer@95@01 elseer@97@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ifer@93@01 elseer@97@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= whileer@91@01 elseer@97@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- specialFreshBlock ----------
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
; var fresher: Ref
(declare-const fresher@99@01 $Ref)
; [exec]
; var constraininger: Ref
(declare-const constraininger@100@01 $Ref)
; [exec]
; fresher := new(foo)
(declare-const fresher@101@01 $Ref)
(assert (not (= fresher@101@01 $Ref.null)))
(declare-const foo@102@01 Int)
(assert (not (= fresher@101@01 fresher@99@01)))
(assert (not (= fresher@101@01 constraininger@100@01)))
; [exec]
; constraininger := new(foo)
(declare-const constraininger@103@01 $Ref)
(assert (not (= constraininger@103@01 $Ref.null)))
(declare-const foo@104@01 Int)
(assert (not (= constraininger@103@01 fresher@101@01)))
(assert (not (= constraininger@103@01 constraininger@100@01)))
; [exec]
; fresher.foo := 1
(push) ; 3
(set-option :timeout 10)
(assert (not (= constraininger@103@01 fresher@101@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; constraininger.foo := 1
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= fresher@101@01 constraininger@103@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- sequences ----------
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
; var Seqer: Ref
(declare-const Seqer@105@01 $Ref)
; [exec]
; Seqer := new(foo)
(declare-const Seqer@106@01 $Ref)
(assert (not (= Seqer@106@01 $Ref.null)))
(declare-const foo@107@01 Int)
(assert (not (= Seqer@106@01 Seqer@105@01)))
; [exec]
; Seqer.foo := 1
(pop) ; 2
(pop) ; 1
; ---------- setsAndMultisets ----------
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
; var Seter: Ref
(declare-const Seter@108@01 $Ref)
; [exec]
; var Multiseter: Ref
(declare-const Multiseter@109@01 $Ref)
; [exec]
; var unioner: Ref
(declare-const unioner@110@01 $Ref)
; [exec]
; var intersectioner: Ref
(declare-const intersectioner@111@01 $Ref)
; [exec]
; var setminuser: Ref
(declare-const setminuser@112@01 $Ref)
; [exec]
; var subseter: Ref
(declare-const subseter@113@01 $Ref)
; [exec]
; Seter := new(foo)
(declare-const Seter@114@01 $Ref)
(assert (not (= Seter@114@01 $Ref.null)))
(declare-const foo@115@01 Int)
(assert (not (= Seter@114@01 intersectioner@111@01)))
(assert (not (= Seter@114@01 subseter@113@01)))
(assert (not (= Seter@114@01 Multiseter@109@01)))
(assert (not (= Seter@114@01 setminuser@112@01)))
(assert (not (= Seter@114@01 unioner@110@01)))
(assert (not (= Seter@114@01 Seter@108@01)))
; [exec]
; Multiseter := new(foo)
(declare-const Multiseter@116@01 $Ref)
(assert (not (= Multiseter@116@01 $Ref.null)))
(declare-const foo@117@01 Int)
(assert (not (= Multiseter@116@01 intersectioner@111@01)))
(assert (not (= Multiseter@116@01 Seter@114@01)))
(assert (not (= Multiseter@116@01 subseter@113@01)))
(assert (not (= Multiseter@116@01 Multiseter@109@01)))
(assert (not (= Multiseter@116@01 setminuser@112@01)))
(assert (not (= Multiseter@116@01 unioner@110@01)))
; [exec]
; unioner := new(foo)
(declare-const unioner@118@01 $Ref)
(assert (not (= unioner@118@01 $Ref.null)))
(declare-const foo@119@01 Int)
(assert (not (= unioner@118@01 intersectioner@111@01)))
(assert (not (= unioner@118@01 Seter@114@01)))
(assert (not (= unioner@118@01 subseter@113@01)))
(assert (not (= unioner@118@01 Multiseter@116@01)))
(assert (not (= unioner@118@01 setminuser@112@01)))
(assert (not (= unioner@118@01 unioner@110@01)))
; [exec]
; intersectioner := new(foo)
(declare-const intersectioner@120@01 $Ref)
(assert (not (= intersectioner@120@01 $Ref.null)))
(declare-const foo@121@01 Int)
(assert (not (= intersectioner@120@01 intersectioner@111@01)))
(assert (not (= intersectioner@120@01 Seter@114@01)))
(assert (not (= intersectioner@120@01 unioner@118@01)))
(assert (not (= intersectioner@120@01 subseter@113@01)))
(assert (not (= intersectioner@120@01 Multiseter@116@01)))
(assert (not (= intersectioner@120@01 setminuser@112@01)))
; [exec]
; setminuser := new(foo)
(declare-const setminuser@122@01 $Ref)
(assert (not (= setminuser@122@01 $Ref.null)))
(declare-const foo@123@01 Int)
(assert (not (= setminuser@122@01 Seter@114@01)))
(assert (not (= setminuser@122@01 unioner@118@01)))
(assert (not (= setminuser@122@01 subseter@113@01)))
(assert (not (= setminuser@122@01 Multiseter@116@01)))
(assert (not (= setminuser@122@01 setminuser@112@01)))
(assert (not (= setminuser@122@01 intersectioner@120@01)))
; [exec]
; subseter := new(foo)
(declare-const subseter@124@01 $Ref)
(assert (not (= subseter@124@01 $Ref.null)))
(declare-const foo@125@01 Int)
(assert (not (= subseter@124@01 Seter@114@01)))
(assert (not (= subseter@124@01 unioner@118@01)))
(assert (not (= subseter@124@01 subseter@113@01)))
(assert (not (= subseter@124@01 Multiseter@116@01)))
(assert (not (= subseter@124@01 intersectioner@120@01)))
(assert (not (= subseter@124@01 setminuser@122@01)))
; [exec]
; Seter.foo := 1
(push) ; 3
(set-option :timeout 10)
(assert (not (= Multiseter@116@01 Seter@114@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= unioner@118@01 Seter@114@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= intersectioner@120@01 Seter@114@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= setminuser@122@01 Seter@114@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= subseter@124@01 Seter@114@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; Multiseter.foo := 1
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= Seter@114@01 Multiseter@116@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= unioner@118@01 Multiseter@116@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= intersectioner@120@01 Multiseter@116@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= setminuser@122@01 Multiseter@116@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= subseter@124@01 Multiseter@116@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; unioner.foo := 1
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= Multiseter@116@01 unioner@118@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= Seter@114@01 unioner@118@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= intersectioner@120@01 unioner@118@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= setminuser@122@01 unioner@118@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= subseter@124@01 unioner@118@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; intersectioner.foo := 1
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= unioner@118@01 intersectioner@120@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= Multiseter@116@01 intersectioner@120@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= Seter@114@01 intersectioner@120@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= setminuser@122@01 intersectioner@120@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= subseter@124@01 intersectioner@120@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; setminuser.foo := 1
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= intersectioner@120@01 setminuser@122@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= unioner@118@01 setminuser@122@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= Multiseter@116@01 setminuser@122@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= Seter@114@01 setminuser@122@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= subseter@124@01 setminuser@122@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; subseter.foo := 1
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= setminuser@122@01 subseter@124@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= intersectioner@120@01 subseter@124@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= unioner@118@01 subseter@124@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= Multiseter@116@01 subseter@124@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= Seter@114@01 subseter@124@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- proverHintExpressions ----------
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
; var unfoldinger: Ref
(declare-const unfoldinger@126@01 $Ref)
; [exec]
; var iner: Ref
(declare-const iner@127@01 $Ref)
; [exec]
; unfoldinger := new(foo)
(declare-const unfoldinger@128@01 $Ref)
(assert (not (= unfoldinger@128@01 $Ref.null)))
(declare-const foo@129@01 Int)
(assert (not (= unfoldinger@128@01 unfoldinger@126@01)))
(assert (not (= unfoldinger@128@01 iner@127@01)))
; [exec]
; unfoldinger.foo := 1
; [exec]
; iner := new(foo)
(declare-const iner@130@01 $Ref)
(assert (not (= iner@130@01 $Ref.null)))
(declare-const foo@131@01 Int)
(assert (not (= iner@130@01 unfoldinger@128@01)))
(assert (not (= iner@130@01 iner@127@01)))
; [exec]
; iner.foo := 1
(push) ; 3
(set-option :timeout 10)
(assert (not (= unfoldinger@128@01 iner@130@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- oldExpression ----------
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
; var older: Ref
(declare-const older@132@01 $Ref)
; [exec]
; older := new(foo)
(declare-const older@133@01 $Ref)
(assert (not (= older@133@01 $Ref.null)))
(declare-const foo@134@01 Int)
(assert (not (= older@133@01 older@132@01)))
; [exec]
; older.foo := 1
(pop) ; 2
(pop) ; 1
; ---------- quantification ----------
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
; var foraller: Ref
(declare-const foraller@135@01 $Ref)
; [exec]
; var existser: Ref
(declare-const existser@136@01 $Ref)
; [exec]
; foraller := new(foo)
(declare-const foraller@137@01 $Ref)
(assert (not (= foraller@137@01 $Ref.null)))
(declare-const foo@138@01 Int)
(assert (not (= foraller@137@01 existser@136@01)))
(assert (not (= foraller@137@01 foraller@135@01)))
; [exec]
; foraller.foo := 1
; [exec]
; existser := new(foo)
(declare-const existser@139@01 $Ref)
(assert (not (= existser@139@01 $Ref.null)))
(declare-const foo@140@01 Int)
(assert (not (= existser@139@01 foraller@137@01)))
(assert (not (= existser@139@01 existser@136@01)))
; [exec]
; existser.foo := 1
(push) ; 3
(set-option :timeout 10)
(assert (not (= foraller@137@01 existser@139@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- permissionSyntax ----------
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
; var accer: Ref
(declare-const accer@141@01 $Ref)
; [exec]
; var wildcarder: Ref
(declare-const wildcarder@142@01 $Ref)
; [exec]
; var writer: Ref
(declare-const writer@143@01 $Ref)
; [exec]
; var noneer: Ref
(declare-const noneer@144@01 $Ref)
; [exec]
; var epsiloner: Ref
(declare-const epsiloner@145@01 $Ref)
; [exec]
; var permer: Ref
(declare-const permer@146@01 $Ref)
; [exec]
; accer := new(foo)
(declare-const accer@147@01 $Ref)
(assert (not (= accer@147@01 $Ref.null)))
(declare-const foo@148@01 Int)
(assert (not (= accer@147@01 accer@141@01)))
(assert (not (= accer@147@01 noneer@144@01)))
(assert (not (= accer@147@01 epsiloner@145@01)))
(assert (not (= accer@147@01 writer@143@01)))
(assert (not (= accer@147@01 permer@146@01)))
(assert (not (= accer@147@01 wildcarder@142@01)))
; [exec]
; accer.foo := 1
; [exec]
; wildcarder := new(foo)
(declare-const wildcarder@149@01 $Ref)
(assert (not (= wildcarder@149@01 $Ref.null)))
(declare-const foo@150@01 Int)
(assert (not (= wildcarder@149@01 accer@147@01)))
(assert (not (= wildcarder@149@01 noneer@144@01)))
(assert (not (= wildcarder@149@01 epsiloner@145@01)))
(assert (not (= wildcarder@149@01 writer@143@01)))
(assert (not (= wildcarder@149@01 permer@146@01)))
(assert (not (= wildcarder@149@01 wildcarder@142@01)))
; [exec]
; wildcarder.foo := 1
(push) ; 3
(set-option :timeout 10)
(assert (not (= accer@147@01 wildcarder@149@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; writer := new(foo)
(declare-const writer@151@01 $Ref)
(assert (not (= writer@151@01 $Ref.null)))
(declare-const foo@152@01 Int)
(assert (not (= writer@151@01 wildcarder@149@01)))
(assert (not (= writer@151@01 accer@147@01)))
(assert (not (= writer@151@01 noneer@144@01)))
(assert (not (= writer@151@01 epsiloner@145@01)))
(assert (not (= writer@151@01 writer@143@01)))
(assert (not (= writer@151@01 permer@146@01)))
; [exec]
; writer.foo := 1
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= wildcarder@149@01 writer@151@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= accer@147@01 writer@151@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; noneer := new(foo)
(declare-const noneer@153@01 $Ref)
(assert (not (= noneer@153@01 $Ref.null)))
(declare-const foo@154@01 Int)
(assert (not (= noneer@153@01 wildcarder@149@01)))
(assert (not (= noneer@153@01 writer@151@01)))
(assert (not (= noneer@153@01 accer@147@01)))
(assert (not (= noneer@153@01 noneer@144@01)))
(assert (not (= noneer@153@01 epsiloner@145@01)))
(assert (not (= noneer@153@01 permer@146@01)))
; [exec]
; noneer.foo := 1
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= writer@151@01 noneer@153@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= wildcarder@149@01 noneer@153@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= accer@147@01 noneer@153@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; epsiloner := new(foo)
(declare-const epsiloner@155@01 $Ref)
(assert (not (= epsiloner@155@01 $Ref.null)))
(declare-const foo@156@01 Int)
(assert (not (= epsiloner@155@01 wildcarder@149@01)))
(assert (not (= epsiloner@155@01 writer@151@01)))
(assert (not (= epsiloner@155@01 accer@147@01)))
(assert (not (= epsiloner@155@01 epsiloner@145@01)))
(assert (not (= epsiloner@155@01 permer@146@01)))
(assert (not (= epsiloner@155@01 noneer@153@01)))
; [exec]
; epsiloner.foo := 1
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= noneer@153@01 epsiloner@155@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= writer@151@01 epsiloner@155@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= wildcarder@149@01 epsiloner@155@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= accer@147@01 epsiloner@155@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; permer := new(foo)
(declare-const permer@157@01 $Ref)
(assert (not (= permer@157@01 $Ref.null)))
(declare-const foo@158@01 Int)
(assert (not (= permer@157@01 wildcarder@149@01)))
(assert (not (= permer@157@01 epsiloner@155@01)))
(assert (not (= permer@157@01 writer@151@01)))
(assert (not (= permer@157@01 accer@147@01)))
(assert (not (= permer@157@01 permer@146@01)))
(assert (not (= permer@157@01 noneer@153@01)))
; [exec]
; permer.foo := 1
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= epsiloner@155@01 permer@157@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= noneer@153@01 permer@157@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= writer@151@01 permer@157@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= wildcarder@149@01 permer@157@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= accer@147@01 permer@157@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- modifiers ----------
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
; var uniqueer: Ref
(declare-const uniqueer@159@01 $Ref)
; [exec]
; uniqueer := new(foo)
(declare-const uniqueer@160@01 $Ref)
(assert (not (= uniqueer@160@01 $Ref.null)))
(declare-const foo@161@01 Int)
(assert (not (= uniqueer@160@01 uniqueer@159@01)))
; [exec]
; uniqueer.foo := 1
(pop) ; 2
(pop) ; 1
