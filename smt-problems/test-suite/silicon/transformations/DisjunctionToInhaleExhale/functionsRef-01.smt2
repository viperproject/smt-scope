(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:29:55
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/transformations/DisjunctionToInhaleExhale/functionsRef.vpr
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
(declare-fun NonDet2 ($Snap Bool Bool) Bool)
(declare-fun NonDet2%limited ($Snap Bool Bool) Bool)
(declare-fun NonDet2%stateless (Bool Bool) Bool)
(declare-fun NonDet2%precondition ($Snap Bool Bool) Bool)
(declare-fun NonDet1 ($Snap Bool) Bool)
(declare-fun NonDet1%limited ($Snap Bool) Bool)
(declare-fun NonDet1%stateless (Bool) Bool)
(declare-fun NonDet1%precondition ($Snap Bool) Bool)
(declare-fun func ($Snap Bool) Bool)
(declare-fun func%limited ($Snap Bool) Bool)
(declare-fun func%stateless (Bool) Bool)
(declare-fun func%precondition ($Snap Bool) Bool)
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
; ---------- FUNCTION NonDet2----------
(declare-fun vari1@0@00 () Bool)
(declare-fun vari2@1@00 () Bool)
(declare-fun result@2@00 () Bool)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (vari1@0@00 Bool) (vari2@1@00 Bool)) (!
  (=
    (NonDet2%limited s@$ vari1@0@00 vari2@1@00)
    (NonDet2 s@$ vari1@0@00 vari2@1@00))
  :pattern ((NonDet2 s@$ vari1@0@00 vari2@1@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (vari1@0@00 Bool) (vari2@1@00 Bool)) (!
  (NonDet2%stateless vari1@0@00 vari2@1@00)
  :pattern ((NonDet2%limited s@$ vari1@0@00 vari2@1@00))
  :qid |quant-u-1|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(assert (= result@2@00 true))
(pop) ; 1
(assert (forall ((s@$ $Snap) (vari1@0@00 Bool) (vari2@1@00 Bool)) (!
  (=>
    (NonDet2%precondition s@$ vari1@0@00 vari2@1@00)
    (= (NonDet2 s@$ vari1@0@00 vari2@1@00) true))
  :pattern ((NonDet2 s@$ vari1@0@00 vari2@1@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (vari1@0@00 Bool) (vari2@1@00 Bool)) (!
  true
  :pattern ((NonDet2 s@$ vari1@0@00 vari2@1@00))
  :qid |quant-u-7|)))
; ---------- FUNCTION NonDet1----------
(declare-fun vari1@3@00 () Bool)
(declare-fun result@4@00 () Bool)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (vari1@3@00 Bool)) (!
  (= (NonDet1%limited s@$ vari1@3@00) (NonDet1 s@$ vari1@3@00))
  :pattern ((NonDet1 s@$ vari1@3@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (vari1@3@00 Bool)) (!
  (NonDet1%stateless vari1@3@00)
  :pattern ((NonDet1%limited s@$ vari1@3@00))
  :qid |quant-u-3|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(assert (= result@4@00 true))
(pop) ; 1
(assert (forall ((s@$ $Snap) (vari1@3@00 Bool)) (!
  (=> (NonDet1%precondition s@$ vari1@3@00) (= (NonDet1 s@$ vari1@3@00) true))
  :pattern ((NonDet1 s@$ vari1@3@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (vari1@3@00 Bool)) (!
  true
  :pattern ((NonDet1 s@$ vari1@3@00))
  :qid |quant-u-9|)))
; ---------- FUNCTION func----------
(declare-fun b@5@00 () Bool)
(declare-fun result@6@00 () Bool)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(declare-const $t@7@00 $Snap)
(assert (= $t@7@00 $Snap.unit))
; [eval] (exists k: Bool :: { NonDet1(k) } (NonDet1(k) ? true : b && (NonDet1(k) ? k : (exists m: Bool :: { NonDet2(k, m) } (NonDet2(k, m) ? true : m)))))
(declare-const k@8@00 Bool)
(push) ; 2
; [eval] (NonDet1(k) ? true : b && (NonDet1(k) ? k : (exists m: Bool :: { NonDet2(k, m) } (NonDet2(k, m) ? true : m))))
; [eval] NonDet1(k)
(push) ; 3
(assert (NonDet1%precondition $Snap.unit k@8@00))
(pop) ; 3
; Joined path conditions
(assert (NonDet1%precondition $Snap.unit k@8@00))
(push) ; 3
; [then-branch: 0 | NonDet1(_, k@8@00) | live]
; [else-branch: 0 | !(NonDet1(_, k@8@00)) | live]
(push) ; 4
; [then-branch: 0 | NonDet1(_, k@8@00)]
(assert (NonDet1 $Snap.unit k@8@00))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | !(NonDet1(_, k@8@00))]
(assert (not (NonDet1 $Snap.unit k@8@00)))
; [eval] b && (NonDet1(k) ? k : (exists m: Bool :: { NonDet2(k, m) } (NonDet2(k, m) ? true : m)))
(push) ; 5
; [then-branch: 1 | !(b@5@00) | live]
; [else-branch: 1 | b@5@00 | live]
(push) ; 6
; [then-branch: 1 | !(b@5@00)]
(assert (not b@5@00))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | b@5@00]
(assert b@5@00)
; [eval] (NonDet1(k) ? k : (exists m: Bool :: { NonDet2(k, m) } (NonDet2(k, m) ? true : m)))
; [eval] NonDet1(k)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
; [then-branch: 2 | NonDet1(_, k@8@00) | live]
; [else-branch: 2 | !(NonDet1(_, k@8@00)) | live]
(push) ; 8
; [then-branch: 2 | NonDet1(_, k@8@00)]
(assert (NonDet1 $Snap.unit k@8@00))
(pop) ; 8
(push) ; 8
; [else-branch: 2 | !(NonDet1(_, k@8@00))]
; [eval] (exists m: Bool :: { NonDet2(k, m) } (NonDet2(k, m) ? true : m))
(declare-const m@9@00 Bool)
(push) ; 9
; [eval] (NonDet2(k, m) ? true : m)
; [eval] NonDet2(k, m)
(push) ; 10
(assert (NonDet2%precondition $Snap.unit k@8@00 m@9@00))
(pop) ; 10
; Joined path conditions
(assert (NonDet2%precondition $Snap.unit k@8@00 m@9@00))
(push) ; 10
; [then-branch: 3 | NonDet2(_, k@8@00, m@9@00) | live]
; [else-branch: 3 | !(NonDet2(_, k@8@00, m@9@00)) | live]
(push) ; 11
; [then-branch: 3 | NonDet2(_, k@8@00, m@9@00)]
(assert (NonDet2 $Snap.unit k@8@00 m@9@00))
(pop) ; 11
(push) ; 11
; [else-branch: 3 | !(NonDet2(_, k@8@00, m@9@00))]
(assert (not (NonDet2 $Snap.unit k@8@00 m@9@00)))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (not (NonDet2 $Snap.unit k@8@00 m@9@00)) (NonDet2 $Snap.unit k@8@00 m@9@00)))
(pop) ; 9
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (exists ((m@9@00 Bool)) (!
  (and
    (NonDet2%precondition $Snap.unit k@8@00 m@9@00)
    (or
      (not (NonDet2 $Snap.unit k@8@00 m@9@00))
      (NonDet2 $Snap.unit k@8@00 m@9@00)))
  :pattern ((NonDet2%limited $Snap.unit k@8@00 m@9@00))
  :qid |prog./silicon/silver/src/test/resources/transformations/DisjunctionToInhaleExhale/functionsRef.vpr@15@30@16@52-aux|)))
(assert (forall ((m@9@00 Bool)) (!
  (NonDet2%precondition $Snap.unit k@8@00 m@9@00)
  :pattern ((NonDet2%limited $Snap.unit k@8@00 m@9@00))
  :qid |prog./silicon/silver/src/test/resources/transformations/DisjunctionToInhaleExhale/functionsRef.vpr@15@30@16@52|)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (NonDet1 $Snap.unit k@8@00))
  (and
    (exists ((m@9@00 Bool)) (!
      (and
        (NonDet2%precondition $Snap.unit k@8@00 m@9@00)
        (or
          (not (NonDet2 $Snap.unit k@8@00 m@9@00))
          (NonDet2 $Snap.unit k@8@00 m@9@00)))
      :pattern ((NonDet2%limited $Snap.unit k@8@00 m@9@00))
      :qid |prog./silicon/silver/src/test/resources/transformations/DisjunctionToInhaleExhale/functionsRef.vpr@15@30@16@52-aux|))
    (forall ((m@9@00 Bool)) (!
      (NonDet2%precondition $Snap.unit k@8@00 m@9@00)
      :pattern ((NonDet2%limited $Snap.unit k@8@00 m@9@00))
      :qid |prog./silicon/silver/src/test/resources/transformations/DisjunctionToInhaleExhale/functionsRef.vpr@15@30@16@52|)))))
(assert (or (not (NonDet1 $Snap.unit k@8@00)) (NonDet1 $Snap.unit k@8@00)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  b@5@00
  (and
    b@5@00
    (=>
      (not (NonDet1 $Snap.unit k@8@00))
      (and
        (exists ((m@9@00 Bool)) (!
          (and
            (NonDet2%precondition $Snap.unit k@8@00 m@9@00)
            (or
              (not (NonDet2 $Snap.unit k@8@00 m@9@00))
              (NonDet2 $Snap.unit k@8@00 m@9@00)))
          :pattern ((NonDet2%limited $Snap.unit k@8@00 m@9@00))
          :qid |prog./silicon/silver/src/test/resources/transformations/DisjunctionToInhaleExhale/functionsRef.vpr@15@30@16@52-aux|))
        (forall ((m@9@00 Bool)) (!
          (NonDet2%precondition $Snap.unit k@8@00 m@9@00)
          :pattern ((NonDet2%limited $Snap.unit k@8@00 m@9@00))
          :qid |prog./silicon/silver/src/test/resources/transformations/DisjunctionToInhaleExhale/functionsRef.vpr@15@30@16@52|))))
    (or (not (NonDet1 $Snap.unit k@8@00)) (NonDet1 $Snap.unit k@8@00)))))
(assert (or b@5@00 (not b@5@00)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (NonDet1 $Snap.unit k@8@00))
  (and
    (not (NonDet1 $Snap.unit k@8@00))
    (=>
      b@5@00
      (and
        b@5@00
        (=>
          (not (NonDet1 $Snap.unit k@8@00))
          (and
            (exists ((m@9@00 Bool)) (!
              (and
                (NonDet2%precondition $Snap.unit k@8@00 m@9@00)
                (or
                  (not (NonDet2 $Snap.unit k@8@00 m@9@00))
                  (NonDet2 $Snap.unit k@8@00 m@9@00)))
              :pattern ((NonDet2%limited $Snap.unit k@8@00 m@9@00))
              :qid |prog./silicon/silver/src/test/resources/transformations/DisjunctionToInhaleExhale/functionsRef.vpr@15@30@16@52-aux|))
            (forall ((m@9@00 Bool)) (!
              (NonDet2%precondition $Snap.unit k@8@00 m@9@00)
              :pattern ((NonDet2%limited $Snap.unit k@8@00 m@9@00))
              :qid |prog./silicon/silver/src/test/resources/transformations/DisjunctionToInhaleExhale/functionsRef.vpr@15@30@16@52|))))
        (or (not (NonDet1 $Snap.unit k@8@00)) (NonDet1 $Snap.unit k@8@00))))
    (or b@5@00 (not b@5@00)))))
(assert (or (not (NonDet1 $Snap.unit k@8@00)) (NonDet1 $Snap.unit k@8@00)))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (exists ((k@8@00 Bool)) (!
  (and
    (NonDet1%precondition $Snap.unit k@8@00)
    (=>
      (not (NonDet1 $Snap.unit k@8@00))
      (and
        (not (NonDet1 $Snap.unit k@8@00))
        (=>
          b@5@00
          (and
            b@5@00
            (=>
              (not (NonDet1 $Snap.unit k@8@00))
              (and
                (exists ((m@9@00 Bool)) (!
                  (and
                    (NonDet2%precondition $Snap.unit k@8@00 m@9@00)
                    (or
                      (not (NonDet2 $Snap.unit k@8@00 m@9@00))
                      (NonDet2 $Snap.unit k@8@00 m@9@00)))
                  :pattern ((NonDet2%limited $Snap.unit k@8@00 m@9@00))
                  :qid |prog./silicon/silver/src/test/resources/transformations/DisjunctionToInhaleExhale/functionsRef.vpr@15@30@16@52-aux|))
                (forall ((m@9@00 Bool)) (!
                  (NonDet2%precondition $Snap.unit k@8@00 m@9@00)
                  :pattern ((NonDet2%limited $Snap.unit k@8@00 m@9@00))
                  :qid |prog./silicon/silver/src/test/resources/transformations/DisjunctionToInhaleExhale/functionsRef.vpr@15@30@16@52|))))
            (or (not (NonDet1 $Snap.unit k@8@00)) (NonDet1 $Snap.unit k@8@00))))
        (or b@5@00 (not b@5@00))))
    (or (not (NonDet1 $Snap.unit k@8@00)) (NonDet1 $Snap.unit k@8@00)))
  :pattern ((NonDet1%limited $Snap.unit k@8@00))
  :qid |prog./silicon/silver/src/test/resources/transformations/DisjunctionToInhaleExhale/functionsRef.vpr@13@11@18@57-aux|)))
(assert (forall ((k@8@00 Bool)) (!
  (and
    (NonDet1%precondition $Snap.unit k@8@00)
    (ite
      (NonDet1 $Snap.unit k@8@00)
      true
      (=>
        b@5@00
        (and
          (NonDet1%precondition $Snap.unit k@8@00)
          (ite
            (NonDet1 $Snap.unit k@8@00)
            true
            (forall ((m@9@00 Bool)) (!
              (NonDet2%precondition $Snap.unit k@8@00 m@9@00)
              :pattern ((NonDet2%limited $Snap.unit k@8@00 m@9@00))
              :qid |prog./silicon/silver/src/test/resources/transformations/DisjunctionToInhaleExhale/functionsRef.vpr@15@30@16@52|)))))))
  :pattern ((NonDet1%limited $Snap.unit k@8@00))
  :qid |prog./silicon/silver/src/test/resources/transformations/DisjunctionToInhaleExhale/functionsRef.vpr@13@11@18@57|)))
(assert (exists ((k@8@00 Bool)) (!
  (ite
    (NonDet1 $Snap.unit k@8@00)
    true
    (and
      b@5@00
      (ite
        (NonDet1 $Snap.unit k@8@00)
        k@8@00
        (exists ((m@9@00 Bool)) (!
          (ite (NonDet2 $Snap.unit k@8@00 m@9@00) true m@9@00)
          :pattern ((NonDet2%limited $Snap.unit k@8@00 m@9@00))
          :qid |prog./silicon/silver/src/test/resources/transformations/DisjunctionToInhaleExhale/functionsRef.vpr@15@30@16@52|)))))
  :pattern ((NonDet1%limited $Snap.unit k@8@00))
  :qid |prog./silicon/silver/src/test/resources/transformations/DisjunctionToInhaleExhale/functionsRef.vpr@13@11@18@57|)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (b@5@00 Bool)) (!
  (= (func%limited s@$ b@5@00) (func s@$ b@5@00))
  :pattern ((func s@$ b@5@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (b@5@00 Bool)) (!
  (func%stateless b@5@00)
  :pattern ((func%limited s@$ b@5@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (b@5@00 Bool)) (!
  (let ((result@6@00 (func%limited s@$ b@5@00))) (=>
    (func%precondition s@$ b@5@00)
    (exists ((k Bool)) (!
      (ite
        (NonDet1 $Snap.unit k)
        true
        (and
          b@5@00
          (ite
            (NonDet1 $Snap.unit k)
            k
            (exists ((m Bool)) (!
              (ite (NonDet2 $Snap.unit k m) true m)
              :pattern ((NonDet2%limited $Snap.unit k m))
              )))))
      :pattern ((NonDet1%limited $Snap.unit k))
      ))))
  :pattern ((func%limited s@$ b@5@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (b@5@00 Bool)) (!
  (let ((result@6@00 (func%limited s@$ b@5@00))) (=>
    (func%precondition s@$ b@5@00)
    (forall ((k Bool)) (!
      (and
        (NonDet1%precondition $Snap.unit k)
        (ite
          (NonDet1 $Snap.unit k)
          true
          (=>
            b@5@00
            (and
              (NonDet1%precondition $Snap.unit k)
              (ite
                (NonDet1 $Snap.unit k)
                true
                (forall ((m Bool)) (!
                  (NonDet2%precondition $Snap.unit k m)
                  :pattern ((NonDet2%limited $Snap.unit k m))
                  )))))))
      :pattern ((NonDet1%limited $Snap.unit k))
      ))))
  :pattern ((func%limited s@$ b@5@00))
  :qid |quant-u-11|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(assert (= result@6@00 true))
; [eval] (exists k: Bool :: { NonDet1(k) } true || b && (k || (exists m: Bool :: true || m)))
(declare-const k@10@00 Bool)
(set-option :timeout 0)
(push) ; 2
; [eval] true || b && (k || (exists m: Bool :: true || m))
; [eval] NonDet1(k)
(push) ; 3
(assert (NonDet1%precondition $Snap.unit k@10@00))
(pop) ; 3
; Joined path conditions
(assert (NonDet1%precondition $Snap.unit k@10@00))
(assert (NonDet1%precondition $Snap.unit k@10@00))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (exists ((k@10@00 Bool)) (!
  (NonDet1%precondition $Snap.unit k@10@00)
  :pattern ((NonDet1 $Snap.unit k@10@00))
  :qid |prog./silicon/silver/src/test/resources/transformations/DisjunctionToInhaleExhale/functionsRef.vpr@13@11@18@57-aux|)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (b@5@00 Bool)) (!
  (=> (func%precondition s@$ b@5@00) (= (func s@$ b@5@00) true))
  :pattern ((func s@$ b@5@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (b@5@00 Bool)) (!
  true
  :pattern ((func s@$ b@5@00))
  :qid |quant-u-13|)))
