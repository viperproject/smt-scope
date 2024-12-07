(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:59:09
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/unofficial008.vpr
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
(declare-sort PyType 0)
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
(declare-fun $SortWrappers.PyTypeTo$Snap (PyType) $Snap)
(declare-fun $SortWrappers.$SnapToPyType ($Snap) PyType)
(assert (forall ((x PyType)) (!
    (= x ($SortWrappers.$SnapToPyType($SortWrappers.PyTypeTo$Snap x)))
    :pattern (($SortWrappers.PyTypeTo$Snap x))
    :qid |$Snap.$SnapToPyTypeTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.PyTypeTo$Snap($SortWrappers.$SnapToPyType x)))
    :pattern (($SortWrappers.$SnapToPyType x))
    :qid |$Snap.PyTypeTo$SnapToPyType|
    )))
; ////////// Symbols
(declare-fun isInt<Bool> ($Ref) Bool)
; Declaring symbols related to program functions (from program analysis)
(declare-fun get_idx_1 ($Snap $Ref) $Ref)
(declare-fun get_idx_1%limited ($Snap $Ref) $Ref)
(declare-fun get_idx_1%stateless ($Ref) Bool)
(declare-fun get_idx_1%precondition ($Snap $Ref) Bool)
(declare-fun get_idx ($Snap $Ref) $Ref)
(declare-fun get_idx%limited ($Snap $Ref) $Ref)
(declare-fun get_idx%stateless ($Ref) Bool)
(declare-fun get_idx%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun Packet%trigger ($Snap $Ref) Bool)
(declare-fun Path%trigger ($Snap $Ref) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ---------- FUNCTION get_idx_1----------
(declare-fun self@0@00 () $Ref)
(declare-fun result@1@00 () $Ref)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= self@0@00 $Ref.null)))
(declare-const $t@4@00 $Snap)
(assert (= $t@4@00 $Snap.unit))
; [eval] isInt(result)
(assert (isInt<Bool> result@1@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (self@0@00 $Ref)) (!
  (= (get_idx_1%limited s@$ self@0@00) (get_idx_1 s@$ self@0@00))
  :pattern ((get_idx_1 s@$ self@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (self@0@00 $Ref)) (!
  (get_idx_1%stateless self@0@00)
  :pattern ((get_idx_1%limited s@$ self@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (self@0@00 $Ref)) (!
  (let ((result@1@00 (get_idx_1%limited s@$ self@0@00))) (=>
    (get_idx_1%precondition s@$ self@0@00)
    (isInt<Bool> result@1@00)))
  :pattern ((get_idx_1%limited s@$ self@0@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (self@0@00 $Ref)) (!
  (let ((result@1@00 (get_idx_1%limited s@$ self@0@00))) true)
  :pattern ((get_idx_1%limited s@$ self@0@00))
  :qid |quant-u-5|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= self@0@00 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(Path(self.path), write) in self.path.idx)
(set-option :timeout 0)
(push) ; 2
(assert (Path%trigger ($Snap.second s@$) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null)))
(assert (= ($Snap.second ($Snap.second s@$)) $Snap.unit))
; [eval] isInt(self.idx)
(assert (isInt<Bool> ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))
(pop) ; 2
; Joined path conditions
(assert (and
  (Path%trigger ($Snap.second s@$) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
  (=
    ($Snap.second s@$)
    ($Snap.combine
      ($Snap.first ($Snap.second s@$))
      ($Snap.second ($Snap.second s@$))))
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null))
  (= ($Snap.second ($Snap.second s@$)) $Snap.unit)
  (isInt<Bool> ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))
(assert (= result@1@00 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))
; [eval] isInt(result)
(push) ; 2
(assert (not (isInt<Bool> result@1@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (isInt<Bool> result@1@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (self@0@00 $Ref)) (!
  (=>
    (get_idx_1%precondition s@$ self@0@00)
    (=
      (get_idx_1 s@$ self@0@00)
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))
  :pattern ((get_idx_1 s@$ self@0@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (self@0@00 $Ref)) (!
  true
  :pattern ((get_idx_1 s@$ self@0@00))
  :qid |quant-u-7|)))
; ---------- FUNCTION get_idx----------
(declare-fun self@2@00 () $Ref)
(declare-fun result@3@00 () $Ref)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const $t@5@00 $Snap)
(assert (= $t@5@00 $Snap.unit))
; [eval] isInt(result)
(assert (isInt<Bool> result@3@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (self@2@00 $Ref)) (!
  (= (get_idx%limited s@$ self@2@00) (get_idx s@$ self@2@00))
  :pattern ((get_idx s@$ self@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (self@2@00 $Ref)) (!
  (get_idx%stateless self@2@00)
  :pattern ((get_idx%limited s@$ self@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (self@2@00 $Ref)) (!
  (let ((result@3@00 (get_idx%limited s@$ self@2@00))) (=>
    (get_idx%precondition s@$ self@2@00)
    (isInt<Bool> result@3@00)))
  :pattern ((get_idx%limited s@$ self@2@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (self@2@00 $Ref)) (!
  (let ((result@3@00 (get_idx%limited s@$ self@2@00))) true)
  :pattern ((get_idx%limited s@$ self@2@00))
  :qid |quant-u-9|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(Packet(self), write) in get_idx_1(self))
(set-option :timeout 0)
(push) ; 2
(assert (Packet%trigger s@$ self@2@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= self@2@00 $Ref.null)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
; [eval] self.path != null
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | First:(s@$) != Null | live]
; [else-branch: 0 | First:(s@$) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | First:(s@$) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null)))
(assert (= ($Snap.second ($Snap.second s@$)) $Snap.unit))
; [eval] self.path != null
; [eval] get_idx_1(self)
(push) ; 4
(assert (get_idx_1%precondition ($Snap.combine
  ($Snap.first s@$)
  ($Snap.first ($Snap.second s@$))) self@2@00))
(pop) ; 4
; Joined path conditions
(assert (get_idx_1%precondition ($Snap.combine
  ($Snap.first s@$)
  ($Snap.first ($Snap.second s@$))) self@2@00))
(pop) ; 3
(push) ; 3
; [else-branch: 0 | First:(s@$) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
(assert (= ($Snap.second ($Snap.second s@$)) $Snap.unit))
; [eval] self.path != null
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null)))
; [eval] get_idx_1(self)
(push) ; 4
(check-sat)
; unsat
(pop) ; 4
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (and
  (Packet%trigger s@$ self@2@00)
  (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
  (not (= self@2@00 $Ref.null))
  (=
    ($Snap.second s@$)
    ($Snap.combine
      ($Snap.first ($Snap.second s@$))
      ($Snap.second ($Snap.second s@$))))))
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null))
  (and
    (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null))
    (= ($Snap.second ($Snap.second s@$)) $Snap.unit)
    (get_idx_1%precondition ($Snap.combine
      ($Snap.first s@$)
      ($Snap.first ($Snap.second s@$))) self@2@00))))
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null)))
(assert (=
  result@3@00
  (get_idx_1 ($Snap.combine ($Snap.first s@$) ($Snap.first ($Snap.second s@$))) self@2@00)))
; [eval] isInt(result)
(push) ; 2
(assert (not (isInt<Bool> result@3@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (isInt<Bool> result@3@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (self@2@00 $Ref)) (!
  (=>
    (get_idx%precondition s@$ self@2@00)
    (=
      (get_idx s@$ self@2@00)
      (get_idx_1 ($Snap.combine
        ($Snap.first s@$)
        ($Snap.first ($Snap.second s@$))) self@2@00)))
  :pattern ((get_idx s@$ self@2@00))
  :pattern ((get_idx%stateless self@2@00) (Packet%trigger s@$ self@2@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (self@2@00 $Ref)) (!
  (=>
    (get_idx%precondition s@$ self@2@00)
    (get_idx_1%precondition ($Snap.combine
      ($Snap.first s@$)
      ($Snap.first ($Snap.second s@$))) self@2@00))
  :pattern ((get_idx s@$ self@2@00))
  :qid |quant-u-11|)))
; ---------- Packet ----------
(declare-const self@6@00 $Ref)
(push) ; 1
(declare-const $t@7@00 $Snap)
(assert (= $t@7@00 ($Snap.combine ($Snap.first $t@7@00) ($Snap.second $t@7@00))))
(assert (not (= self@6@00 $Ref.null)))
(assert (=
  ($Snap.second $t@7@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@7@00))
    ($Snap.second ($Snap.second $t@7@00)))))
; [eval] self.path != null
(push) ; 2
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@7@00)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@7@00)) $Ref.null))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | First:($t@7@00) != Null | live]
; [else-branch: 1 | First:($t@7@00) == Null | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 1 | First:($t@7@00) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@7@00)) $Ref.null)))
(assert (= ($Snap.second ($Snap.second $t@7@00)) $Snap.unit))
; [eval] self.path != null
(pop) ; 2
(push) ; 2
; [else-branch: 1 | First:($t@7@00) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@7@00)) $Ref.null))
(assert (= ($Snap.first ($Snap.second $t@7@00)) $Snap.unit))
(assert (= ($Snap.second ($Snap.second $t@7@00)) $Snap.unit))
; [eval] self.path != null
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@7@00)) $Ref.null)))
(pop) ; 2
(pop) ; 1
; ---------- Path ----------
(declare-const self@8@00 $Ref)
(push) ; 1
(declare-const $t@9@00 $Snap)
(assert (= $t@9@00 ($Snap.combine ($Snap.first $t@9@00) ($Snap.second $t@9@00))))
(assert (not (= self@8@00 $Ref.null)))
(assert (= ($Snap.second $t@9@00) $Snap.unit))
; [eval] isInt(self.idx)
(assert (isInt<Bool> ($SortWrappers.$SnapTo$Ref ($Snap.first $t@9@00))))
(pop) ; 1
