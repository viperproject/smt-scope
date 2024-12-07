(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:28:56
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/termination/functions/expressions/exists.vpr
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
(declare-fun partiallyTerminating ($Snap Int) Bool)
(declare-fun partiallyTerminating%limited ($Snap Int) Bool)
(declare-fun partiallyTerminating%stateless (Int) Bool)
(declare-fun partiallyTerminating%precondition ($Snap Int) Bool)
(declare-fun nonTerminating ($Snap $Ref) Bool)
(declare-fun nonTerminating%limited ($Snap $Ref) Bool)
(declare-fun nonTerminating%stateless ($Ref) Bool)
(declare-fun nonTerminating%precondition ($Snap $Ref) Bool)
(declare-fun test2 ($Snap) Bool)
(declare-fun test2%limited ($Snap) Bool)
(declare-const test2%stateless Bool)
(declare-fun test2%precondition ($Snap) Bool)
(declare-fun test ($Snap $Ref) Bool)
(declare-fun test%limited ($Snap $Ref) Bool)
(declare-fun test%stateless ($Ref) Bool)
(declare-fun test%precondition ($Snap $Ref) Bool)
(declare-fun test4 ($Snap Int) Bool)
(declare-fun test4%limited ($Snap Int) Bool)
(declare-fun test4%stateless (Int) Bool)
(declare-fun test4%precondition ($Snap Int) Bool)
(declare-fun test5 ($Snap Int) Bool)
(declare-fun test5%limited ($Snap Int) Bool)
(declare-fun test5%stateless (Int) Bool)
(declare-fun test5%precondition ($Snap Int) Bool)
(declare-fun test3 ($Snap Int) Bool)
(declare-fun test3%limited ($Snap Int) Bool)
(declare-fun test3%stateless (Int) Bool)
(declare-fun test3%precondition ($Snap Int) Bool)
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
; ---------- FUNCTION partiallyTerminating----------
(declare-fun x@0@00 () Int)
(declare-fun result@1@00 () Bool)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@0@00 Int)) (!
  (= (partiallyTerminating%limited s@$ x@0@00) (partiallyTerminating s@$ x@0@00))
  :pattern ((partiallyTerminating s@$ x@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (x@0@00 Int)) (!
  (partiallyTerminating%stateless x@0@00)
  :pattern ((partiallyTerminating%limited s@$ x@0@00))
  :qid |quant-u-1|)))
; ---------- FUNCTION nonTerminating----------
(declare-fun x@2@00 () $Ref)
(declare-fun result@3@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  (= (nonTerminating%limited s@$ x@2@00) (nonTerminating s@$ x@2@00))
  :pattern ((nonTerminating s@$ x@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  (nonTerminating%stateless x@2@00)
  :pattern ((nonTerminating%limited s@$ x@2@00))
  :qid |quant-u-3|)))
; ---------- FUNCTION test2----------
(declare-fun result@4@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap)) (!
  (= (test2%limited s@$) (test2 s@$))
  :pattern ((test2 s@$))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap)) (!
  (as test2%stateless  Bool)
  :pattern ((test2%limited s@$))
  :qid |quant-u-5|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (exists x2: Int :: { partiallyTerminating(x2) } partiallyTerminating(x2))
(declare-const x2@13@00 Int)
(set-option :timeout 0)
(push) ; 2
; [eval] partiallyTerminating(x2)
(push) ; 3
(assert (partiallyTerminating%precondition $Snap.unit x2@13@00))
(pop) ; 3
; Joined path conditions
(assert (partiallyTerminating%precondition $Snap.unit x2@13@00))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (exists ((x2@13@00 Int)) (!
  (partiallyTerminating%precondition $Snap.unit x2@13@00)
  :pattern ((partiallyTerminating%limited $Snap.unit x2@13@00))
  :qid |prog./silicon/silver/src/test/resources/termination/functions/expressions/exists.vpr@20@5@20@47-aux|)))
(assert (forall ((x2@13@00 Int)) (!
  (partiallyTerminating%precondition $Snap.unit x2@13@00)
  :pattern ((partiallyTerminating%limited $Snap.unit x2@13@00))
  :qid |prog./silicon/silver/src/test/resources/termination/functions/expressions/exists.vpr@20@5@20@47|)))
(assert (=
  result@4@00
  (exists ((x2@13@00 Int)) (!
    (partiallyTerminating $Snap.unit x2@13@00)
    :pattern ((partiallyTerminating%limited $Snap.unit x2@13@00))
    :qid |prog./silicon/silver/src/test/resources/termination/functions/expressions/exists.vpr@20@5@20@47|))))
(pop) ; 1
(assert (forall ((s@$ $Snap)) (!
  (=>
    (test2%precondition s@$)
    (=
      (test2 s@$)
      (exists ((x2 Int)) (!
        (partiallyTerminating $Snap.unit x2)
        :pattern ((partiallyTerminating%limited $Snap.unit x2))
        ))))
  :pattern ((test2 s@$))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap)) (!
  (=>
    (test2%precondition s@$)
    (forall ((x2 Int)) (!
      (partiallyTerminating%precondition $Snap.unit x2)
      :pattern ((partiallyTerminating%limited $Snap.unit x2))
      )))
  :pattern ((test2 s@$))
  :qid |quant-u-15|)))
; ---------- FUNCTION test----------
(declare-fun x@5@00 () $Ref)
(declare-fun result@6@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@5@00 $Ref)) (!
  (= (test%limited s@$ x@5@00) (test s@$ x@5@00))
  :pattern ((test s@$ x@5@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (x@5@00 $Ref)) (!
  (test%stateless x@5@00)
  :pattern ((test%limited s@$ x@5@00))
  :qid |quant-u-7|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (exists x2: Ref :: { nonTerminating(x2) } x == x2 && nonTerminating(x2))
(declare-const x2@14@00 $Ref)
(set-option :timeout 0)
(push) ; 2
; [eval] x == x2 && nonTerminating(x2)
; [eval] x == x2
(push) ; 3
; [then-branch: 0 | x@5@00 != x2@14@00 | live]
; [else-branch: 0 | x@5@00 == x2@14@00 | live]
(push) ; 4
; [then-branch: 0 | x@5@00 != x2@14@00]
(assert (not (= x@5@00 x2@14@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | x@5@00 == x2@14@00]
(assert (= x@5@00 x2@14@00))
; [eval] nonTerminating(x2)
(push) ; 5
(assert (nonTerminating%precondition $Snap.unit x2@14@00))
(pop) ; 5
; Joined path conditions
(assert (nonTerminating%precondition $Snap.unit x2@14@00))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (= x@5@00 x2@14@00)
  (and (= x@5@00 x2@14@00) (nonTerminating%precondition $Snap.unit x2@14@00))))
(assert (or (= x@5@00 x2@14@00) (not (= x@5@00 x2@14@00))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (exists ((x2@14@00 $Ref)) (!
  (and
    (=>
      (= x@5@00 x2@14@00)
      (and (= x@5@00 x2@14@00) (nonTerminating%precondition $Snap.unit x2@14@00)))
    (or (= x@5@00 x2@14@00) (not (= x@5@00 x2@14@00))))
  :pattern ((nonTerminating%limited $Snap.unit x2@14@00))
  :qid |prog./silicon/silver/src/test/resources/termination/functions/expressions/exists.vpr@12@5@12@52-aux|)))
(assert (forall ((x2@14@00 $Ref)) (!
  (=> (= x@5@00 x2@14@00) (nonTerminating%precondition $Snap.unit x2@14@00))
  :pattern ((nonTerminating%limited $Snap.unit x2@14@00))
  :qid |prog./silicon/silver/src/test/resources/termination/functions/expressions/exists.vpr@12@5@12@52|)))
(assert (=
  result@6@00
  (exists ((x2@14@00 $Ref)) (!
    (and (= x@5@00 x2@14@00) (nonTerminating $Snap.unit x2@14@00))
    :pattern ((nonTerminating%limited $Snap.unit x2@14@00))
    :qid |prog./silicon/silver/src/test/resources/termination/functions/expressions/exists.vpr@12@5@12@52|))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@5@00 $Ref)) (!
  (=>
    (test%precondition s@$ x@5@00)
    (=
      (test s@$ x@5@00)
      (exists ((x2 $Ref)) (!
        (and (= x@5@00 x2) (nonTerminating $Snap.unit x2))
        :pattern ((nonTerminating%limited $Snap.unit x2))
        ))))
  :pattern ((test s@$ x@5@00))
  :qid |quant-u-16|)))
(assert (forall ((s@$ $Snap) (x@5@00 $Ref)) (!
  (=>
    (test%precondition s@$ x@5@00)
    (forall ((x2 $Ref)) (!
      (=> (= x@5@00 x2) (nonTerminating%precondition $Snap.unit x2))
      :pattern ((nonTerminating%limited $Snap.unit x2))
      )))
  :pattern ((test s@$ x@5@00))
  :qid |quant-u-17|)))
; ---------- FUNCTION test4----------
(declare-fun x@7@00 () Int)
(declare-fun result@8@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@7@00 Int)) (!
  (= (test4%limited s@$ x@7@00) (test4 s@$ x@7@00))
  :pattern ((test4 s@$ x@7@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (x@7@00 Int)) (!
  (test4%stateless x@7@00)
  :pattern ((test4%limited s@$ x@7@00))
  :qid |quant-u-9|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (exists x2: Int :: x == x2) && partiallyTerminating(x)
; [eval] (exists x2: Int :: x == x2)
(declare-const x2@15@00 Int)
(set-option :timeout 0)
(push) ; 2
; [eval] x == x2
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 2
; [then-branch: 1 | !(QE x2@15@00 :: x@7@00 == x2@15@00) | live]
; [else-branch: 1 | QE x2@15@00 :: x@7@00 == x2@15@00 | live]
(push) ; 3
; [then-branch: 1 | !(QE x2@15@00 :: x@7@00 == x2@15@00)]
(assert (not
  (exists ((x2@15@00 Int)) (!
    (= x@7@00 x2@15@00)
    
    :qid |prog./silicon/silver/src/test/resources/termination/functions/expressions/exists.vpr@36@6@36@31|))))
(pop) ; 3
(push) ; 3
; [else-branch: 1 | QE x2@15@00 :: x@7@00 == x2@15@00]
(assert (exists ((x2@15@00 Int)) (!
  (= x@7@00 x2@15@00)
  
  :qid |prog./silicon/silver/src/test/resources/termination/functions/expressions/exists.vpr@36@6@36@31|)))
; [eval] partiallyTerminating(x)
(push) ; 4
(assert (partiallyTerminating%precondition $Snap.unit x@7@00))
(pop) ; 4
; Joined path conditions
(assert (partiallyTerminating%precondition $Snap.unit x@7@00))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=>
  (exists ((x2@15@00 Int)) (!
    (= x@7@00 x2@15@00)
    
    :qid |prog./silicon/silver/src/test/resources/termination/functions/expressions/exists.vpr@36@6@36@31|))
  (and
    (exists ((x2@15@00 Int)) (!
      (= x@7@00 x2@15@00)
      
      :qid |prog./silicon/silver/src/test/resources/termination/functions/expressions/exists.vpr@36@6@36@31|))
    (partiallyTerminating%precondition $Snap.unit x@7@00))))
(assert (or
  (exists ((x2@15@00 Int)) (!
    (= x@7@00 x2@15@00)
    
    :qid |prog./silicon/silver/src/test/resources/termination/functions/expressions/exists.vpr@36@6@36@31|))
  (not
    (exists ((x2@15@00 Int)) (!
      (= x@7@00 x2@15@00)
      
      :qid |prog./silicon/silver/src/test/resources/termination/functions/expressions/exists.vpr@36@6@36@31|)))))
(assert (=
  result@8@00
  (and
    (exists ((x2@15@00 Int)) (!
      (= x@7@00 x2@15@00)
      
      :qid |prog./silicon/silver/src/test/resources/termination/functions/expressions/exists.vpr@36@6@36@31|))
    (partiallyTerminating $Snap.unit x@7@00))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@7@00 Int)) (!
  (=>
    (test4%precondition s@$ x@7@00)
    (=
      (test4 s@$ x@7@00)
      (and
        (exists ((x2 Int)) 
          (= x@7@00 x2))
        (partiallyTerminating $Snap.unit x@7@00))))
  :pattern ((test4 s@$ x@7@00))
  :qid |quant-u-18|)))
(assert (forall ((s@$ $Snap) (x@7@00 Int)) (!
  (=>
    (and (test4%precondition s@$ x@7@00) (exists ((x2 Int))  (= x@7@00 x2)))
    (partiallyTerminating%precondition $Snap.unit x@7@00))
  :pattern ((test4 s@$ x@7@00))
  :qid |quant-u-19|)))
; ---------- FUNCTION test5----------
(declare-fun x@9@00 () Int)
(declare-fun result@10@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@9@00 Int)) (!
  (= (test5%limited s@$ x@9@00) (test5 s@$ x@9@00))
  :pattern ((test5 s@$ x@9@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (x@9@00 Int)) (!
  (test5%stateless x@9@00)
  :pattern ((test5%limited s@$ x@9@00))
  :qid |quant-u-11|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (exists x2: Int :: x == x2 && x != x2) && partiallyTerminating(x)
; [eval] (exists x2: Int :: x == x2 && x != x2)
(declare-const x2@16@00 Int)
(set-option :timeout 0)
(push) ; 2
; [eval] x == x2 && x != x2
; [eval] x == x2
(push) ; 3
; [then-branch: 2 | x@9@00 != x2@16@00 | live]
; [else-branch: 2 | x@9@00 == x2@16@00 | live]
(push) ; 4
; [then-branch: 2 | x@9@00 != x2@16@00]
(assert (not (= x@9@00 x2@16@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 2 | x@9@00 == x2@16@00]
(assert (= x@9@00 x2@16@00))
; [eval] x != x2
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (= x@9@00 x2@16@00) (not (= x@9@00 x2@16@00))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 2
; [then-branch: 3 | !(QE x2@16@00 :: x@9@00 == x2@16@00 && x@9@00 != x2@16@00) | live]
; [else-branch: 3 | QE x2@16@00 :: x@9@00 == x2@16@00 && x@9@00 != x2@16@00 | live]
(push) ; 3
; [then-branch: 3 | !(QE x2@16@00 :: x@9@00 == x2@16@00 && x@9@00 != x2@16@00)]
(assert (not
  (exists ((x2@16@00 Int)) (!
    (and (= x@9@00 x2@16@00) (not (= x@9@00 x2@16@00)))
    
    :qid |prog./silicon/silver/src/test/resources/termination/functions/expressions/exists.vpr@43@6@43@42|))))
(pop) ; 3
(push) ; 3
; [else-branch: 3 | QE x2@16@00 :: x@9@00 == x2@16@00 && x@9@00 != x2@16@00]
(assert (exists ((x2@16@00 Int)) (!
  (and (= x@9@00 x2@16@00) (not (= x@9@00 x2@16@00)))
  
  :qid |prog./silicon/silver/src/test/resources/termination/functions/expressions/exists.vpr@43@6@43@42|)))
; [eval] partiallyTerminating(x)
(push) ; 4
(assert (partiallyTerminating%precondition $Snap.unit x@9@00))
(pop) ; 4
; Joined path conditions
(assert (partiallyTerminating%precondition $Snap.unit x@9@00))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=>
  (exists ((x2@16@00 Int)) (!
    (and (= x@9@00 x2@16@00) (not (= x@9@00 x2@16@00)))
    
    :qid |prog./silicon/silver/src/test/resources/termination/functions/expressions/exists.vpr@43@6@43@42|))
  (and
    (exists ((x2@16@00 Int)) (!
      (and (= x@9@00 x2@16@00) (not (= x@9@00 x2@16@00)))
      
      :qid |prog./silicon/silver/src/test/resources/termination/functions/expressions/exists.vpr@43@6@43@42|))
    (partiallyTerminating%precondition $Snap.unit x@9@00))))
(assert (or
  (exists ((x2@16@00 Int)) (!
    (and (= x@9@00 x2@16@00) (not (= x@9@00 x2@16@00)))
    
    :qid |prog./silicon/silver/src/test/resources/termination/functions/expressions/exists.vpr@43@6@43@42|))
  (not
    (exists ((x2@16@00 Int)) (!
      (and (= x@9@00 x2@16@00) (not (= x@9@00 x2@16@00)))
      
      :qid |prog./silicon/silver/src/test/resources/termination/functions/expressions/exists.vpr@43@6@43@42|)))))
(assert (=
  result@10@00
  (and
    (exists ((x2@16@00 Int)) (!
      (and (= x@9@00 x2@16@00) (not (= x@9@00 x2@16@00)))
      
      :qid |prog./silicon/silver/src/test/resources/termination/functions/expressions/exists.vpr@43@6@43@42|))
    (partiallyTerminating $Snap.unit x@9@00))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@9@00 Int)) (!
  (=>
    (test5%precondition s@$ x@9@00)
    (=
      (test5 s@$ x@9@00)
      (and
        (exists ((x2 Int)) 
          (and (= x@9@00 x2) (not (= x@9@00 x2))))
        (partiallyTerminating $Snap.unit x@9@00))))
  :pattern ((test5 s@$ x@9@00))
  :qid |quant-u-20|)))
(assert (forall ((s@$ $Snap) (x@9@00 Int)) (!
  (=>
    (and
      (test5%precondition s@$ x@9@00)
      (exists ((x2 Int)) 
        (and (= x@9@00 x2) (not (= x@9@00 x2)))))
    (partiallyTerminating%precondition $Snap.unit x@9@00))
  :pattern ((test5 s@$ x@9@00))
  :qid |quant-u-21|)))
; ---------- FUNCTION test3----------
(declare-fun x@11@00 () Int)
(declare-fun result@12@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ $Snap.unit))
; [eval] x == 42
(assert (= x@11@00 42))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@11@00 Int)) (!
  (= (test3%limited s@$ x@11@00) (test3 s@$ x@11@00))
  :pattern ((test3 s@$ x@11@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (x@11@00 Int)) (!
  (test3%stateless x@11@00)
  :pattern ((test3%limited s@$ x@11@00))
  :qid |quant-u-13|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ $Snap.unit))
(assert (= x@11@00 42))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (exists x2: Int :: { partiallyTerminating(x2) } x == x2 && partiallyTerminating(x2))
(declare-const x2@17@00 Int)
(set-option :timeout 0)
(push) ; 2
; [eval] x == x2 && partiallyTerminating(x2)
; [eval] x == x2
(push) ; 3
; [then-branch: 4 | x@11@00 != x2@17@00 | live]
; [else-branch: 4 | x@11@00 == x2@17@00 | live]
(push) ; 4
; [then-branch: 4 | x@11@00 != x2@17@00]
(assert (not (= x@11@00 x2@17@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 4 | x@11@00 == x2@17@00]
(assert (= x@11@00 x2@17@00))
; [eval] partiallyTerminating(x2)
(push) ; 5
(assert (partiallyTerminating%precondition $Snap.unit x2@17@00))
(pop) ; 5
; Joined path conditions
(assert (partiallyTerminating%precondition $Snap.unit x2@17@00))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (= x@11@00 x2@17@00)
  (and
    (= x@11@00 x2@17@00)
    (partiallyTerminating%precondition $Snap.unit x2@17@00))))
(assert (or (= x@11@00 x2@17@00) (not (= x@11@00 x2@17@00))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (exists ((x2@17@00 Int)) (!
  (and
    (=>
      (= x@11@00 x2@17@00)
      (and
        (= x@11@00 x2@17@00)
        (partiallyTerminating%precondition $Snap.unit x2@17@00)))
    (or (= x@11@00 x2@17@00) (not (= x@11@00 x2@17@00))))
  :pattern ((partiallyTerminating%limited $Snap.unit x2@17@00))
  :qid |prog./silicon/silver/src/test/resources/termination/functions/expressions/exists.vpr@28@5@28@58-aux|)))
(assert (forall ((x2@17@00 Int)) (!
  (=>
    (= x@11@00 x2@17@00)
    (partiallyTerminating%precondition $Snap.unit x2@17@00))
  :pattern ((partiallyTerminating%limited $Snap.unit x2@17@00))
  :qid |prog./silicon/silver/src/test/resources/termination/functions/expressions/exists.vpr@28@5@28@58|)))
(assert (=
  result@12@00
  (exists ((x2@17@00 Int)) (!
    (and (= x@11@00 x2@17@00) (partiallyTerminating $Snap.unit x2@17@00))
    :pattern ((partiallyTerminating%limited $Snap.unit x2@17@00))
    :qid |prog./silicon/silver/src/test/resources/termination/functions/expressions/exists.vpr@28@5@28@58|))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@11@00 Int)) (!
  (=>
    (test3%precondition s@$ x@11@00)
    (=
      (test3 s@$ x@11@00)
      (exists ((x2 Int)) (!
        (and (= x@11@00 x2) (partiallyTerminating $Snap.unit x2))
        :pattern ((partiallyTerminating%limited $Snap.unit x2))
        ))))
  :pattern ((test3 s@$ x@11@00))
  :qid |quant-u-22|)))
(assert (forall ((s@$ $Snap) (x@11@00 Int)) (!
  (=>
    (test3%precondition s@$ x@11@00)
    (forall ((x2 Int)) (!
      (=> (= x@11@00 x2) (partiallyTerminating%precondition $Snap.unit x2))
      :pattern ((partiallyTerminating%limited $Snap.unit x2))
      )))
  :pattern ((test3 s@$ x@11@00))
  :qid |quant-u-23|)))
