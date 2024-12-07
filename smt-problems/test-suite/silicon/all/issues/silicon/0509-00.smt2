(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:57:21
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0509.vpr
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
(declare-fun len ($Snap $Ref) Int)
(declare-fun len%limited ($Snap $Ref) Int)
(declare-fun len%stateless ($Ref) Bool)
(declare-fun len%precondition ($Snap $Ref) Bool)
(declare-fun lookup ($Snap $Ref Int) Int)
(declare-fun lookup%limited ($Snap $Ref Int) Int)
(declare-fun lookup%stateless ($Ref Int) Bool)
(declare-fun lookup%precondition ($Snap $Ref Int) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun VecI32%trigger ($Snap $Ref) Bool)
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
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (= (len%limited s@$ x@0@00) (len s@$ x@0@00))
  :pattern ((len s@$ x@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (len%stateless x@0@00)
  :pattern ((len%limited s@$ x@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (let ((result@1@00 (len%limited s@$ x@0@00))) (=>
    (len%precondition s@$ x@0@00)
    (>= result@1@00 0)))
  :pattern ((len%limited s@$ x@0@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (let ((result@1@00 (len%limited s@$ x@0@00))) true)
  :pattern ((len%limited s@$ x@0@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (self@2@00 $Ref) (index@3@00 Int)) (!
  (= (lookup%limited s@$ self@2@00 index@3@00) (lookup s@$ self@2@00 index@3@00))
  :pattern ((lookup s@$ self@2@00 index@3@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (self@2@00 $Ref) (index@3@00 Int)) (!
  (lookup%stateless self@2@00 index@3@00)
  :pattern ((lookup%limited s@$ self@2@00 index@3@00))
  :qid |quant-u-3|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- store ----------
(declare-const self@0@01 $Ref)
(declare-const index@1@01 Int)
(declare-const value@2@01 Int)
(declare-const self@3@01 $Ref)
(declare-const index@4@01 Int)
(declare-const value@5@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 ($Snap.combine ($Snap.first $t@6@01) ($Snap.second $t@6@01))))
(assert (=
  ($Snap.second $t@6@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.second ($Snap.second $t@6@01)))))
(assert (= ($Snap.first ($Snap.second $t@6@01)) $Snap.unit))
; [eval] 0 <= index
(assert (<= 0 index@4@01))
(assert (= ($Snap.second ($Snap.second $t@6@01)) $Snap.unit))
; [eval] index < len(self)
; [eval] len(self)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (len%precondition ($Snap.first $t@6@01) self@3@01))
(pop) ; 2
; Joined path conditions
(assert (len%precondition ($Snap.first $t@6@01) self@3@01))
(assert (< index@4@01 (len ($Snap.first $t@6@01) self@3@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@7@01 $Snap)
(assert (= $t@7@01 ($Snap.combine ($Snap.first $t@7@01) ($Snap.second $t@7@01))))
(assert (=
  ($Snap.second $t@7@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@7@01))
    ($Snap.second ($Snap.second $t@7@01)))))
(assert (= ($Snap.first ($Snap.second $t@7@01)) $Snap.unit))
; [eval] len(self) == old(len(self))
; [eval] len(self)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (len%precondition ($Snap.first $t@7@01) self@3@01))
(pop) ; 3
; Joined path conditions
(assert (len%precondition ($Snap.first $t@7@01) self@3@01))
; [eval] old(len(self))
; [eval] len(self)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert (= (len ($Snap.first $t@7@01) self@3@01) (len ($Snap.first $t@6@01) self@3@01)))
(assert (=
  ($Snap.second ($Snap.second $t@7@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@7@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@7@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@7@01))) $Snap.unit))
; [eval] lookup(self, index) == value
; [eval] lookup(self, index)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= index
; [eval] index < len(self)
; [eval] len(self)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
; Joined path conditions
(set-option :timeout 0)
(push) ; 4
(assert (not (< index@4@01 (len ($Snap.first $t@7@01) self@3@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< index@4@01 (len ($Snap.first $t@7@01) self@3@01)))
(assert (lookup%precondition ($Snap.combine
  ($Snap.first $t@7@01)
  ($Snap.combine $Snap.unit $Snap.unit)) self@3@01 index@4@01))
(pop) ; 3
; Joined path conditions
(assert (and
  (< index@4@01 (len ($Snap.first $t@7@01) self@3@01))
  (lookup%precondition ($Snap.combine
    ($Snap.first $t@7@01)
    ($Snap.combine $Snap.unit $Snap.unit)) self@3@01 index@4@01)))
(assert (=
  (lookup ($Snap.combine
    ($Snap.first $t@7@01)
    ($Snap.combine $Snap.unit $Snap.unit)) self@3@01 index@4@01)
  value@5@01))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@7@01))) $Snap.unit))
; [eval] (forall i: Int :: { lookup(self, i) } 0 <= i && (i < len(self) && i != index) ==> lookup(self, i) == old(lookup(self, i)))
(declare-const i@8@01 Int)
(push) ; 3
; [eval] 0 <= i && (i < len(self) && i != index) ==> lookup(self, i) == old(lookup(self, i))
; [eval] 0 <= i && (i < len(self) && i != index)
; [eval] 0 <= i
(push) ; 4
; [then-branch: 0 | !(0 <= i@8@01) | live]
; [else-branch: 0 | 0 <= i@8@01 | live]
(push) ; 5
; [then-branch: 0 | !(0 <= i@8@01)]
(assert (not (<= 0 i@8@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | 0 <= i@8@01]
(assert (<= 0 i@8@01))
; [eval] i < len(self)
; [eval] len(self)
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
; Joined path conditions
(set-option :timeout 0)
(push) ; 6
; [then-branch: 1 | !(i@8@01 < len(First:($t@7@01), self@3@01)) | live]
; [else-branch: 1 | i@8@01 < len(First:($t@7@01), self@3@01) | live]
(push) ; 7
; [then-branch: 1 | !(i@8@01 < len(First:($t@7@01), self@3@01))]
(assert (not (< i@8@01 (len ($Snap.first $t@7@01) self@3@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 1 | i@8@01 < len(First:($t@7@01), self@3@01)]
(assert (< i@8@01 (len ($Snap.first $t@7@01) self@3@01)))
; [eval] i != index
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (< i@8@01 (len ($Snap.first $t@7@01) self@3@01))
  (not (< i@8@01 (len ($Snap.first $t@7@01) self@3@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@8@01)
  (and
    (<= 0 i@8@01)
    (or
      (< i@8@01 (len ($Snap.first $t@7@01) self@3@01))
      (not (< i@8@01 (len ($Snap.first $t@7@01) self@3@01)))))))
(assert (or (<= 0 i@8@01) (not (<= 0 i@8@01))))
(push) ; 4
; [then-branch: 2 | 0 <= i@8@01 && i@8@01 < len(First:($t@7@01), self@3@01) && i@8@01 != index@4@01 | live]
; [else-branch: 2 | !(0 <= i@8@01 && i@8@01 < len(First:($t@7@01), self@3@01) && i@8@01 != index@4@01) | live]
(push) ; 5
; [then-branch: 2 | 0 <= i@8@01 && i@8@01 < len(First:($t@7@01), self@3@01) && i@8@01 != index@4@01]
(assert (and
  (<= 0 i@8@01)
  (and
    (< i@8@01 (len ($Snap.first $t@7@01) self@3@01))
    (not (= i@8@01 index@4@01)))))
; [eval] lookup(self, i) == old(lookup(self, i))
; [eval] lookup(self, i)
(push) ; 6
; [eval] 0 <= index
; [eval] index < len(self)
; [eval] len(self)
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
; Joined path conditions
(assert (lookup%precondition ($Snap.combine
  ($Snap.first $t@7@01)
  ($Snap.combine $Snap.unit $Snap.unit)) self@3@01 i@8@01))
(pop) ; 6
; Joined path conditions
(assert (lookup%precondition ($Snap.combine
  ($Snap.first $t@7@01)
  ($Snap.combine $Snap.unit $Snap.unit)) self@3@01 i@8@01))
; [eval] old(lookup(self, i))
; [eval] lookup(self, i)
(set-option :timeout 0)
(push) ; 6
; [eval] 0 <= index
; [eval] index < len(self)
; [eval] len(self)
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
; Joined path conditions
(set-option :timeout 0)
(push) ; 7
(assert (not (< i@8@01 (len ($Snap.first $t@6@01) self@3@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (< i@8@01 (len ($Snap.first $t@6@01) self@3@01)))
(assert (lookup%precondition ($Snap.combine
  ($Snap.first $t@6@01)
  ($Snap.combine $Snap.unit $Snap.unit)) self@3@01 i@8@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (< i@8@01 (len ($Snap.first $t@6@01) self@3@01))
  (lookup%precondition ($Snap.combine
    ($Snap.first $t@6@01)
    ($Snap.combine $Snap.unit $Snap.unit)) self@3@01 i@8@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 2 | !(0 <= i@8@01 && i@8@01 < len(First:($t@7@01), self@3@01) && i@8@01 != index@4@01)]
(assert (not
  (and
    (<= 0 i@8@01)
    (and
      (< i@8@01 (len ($Snap.first $t@7@01) self@3@01))
      (not (= i@8@01 index@4@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (<= 0 i@8@01)
    (and
      (< i@8@01 (len ($Snap.first $t@7@01) self@3@01))
      (not (= i@8@01 index@4@01))))
  (and
    (<= 0 i@8@01)
    (< i@8@01 (len ($Snap.first $t@7@01) self@3@01))
    (not (= i@8@01 index@4@01))
    (lookup%precondition ($Snap.combine
      ($Snap.first $t@7@01)
      ($Snap.combine $Snap.unit $Snap.unit)) self@3@01 i@8@01)
    (< i@8@01 (len ($Snap.first $t@6@01) self@3@01))
    (lookup%precondition ($Snap.combine
      ($Snap.first $t@6@01)
      ($Snap.combine $Snap.unit $Snap.unit)) self@3@01 i@8@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@8@01)
      (and
        (< i@8@01 (len ($Snap.first $t@7@01) self@3@01))
        (not (= i@8@01 index@4@01)))))
  (and
    (<= 0 i@8@01)
    (and
      (< i@8@01 (len ($Snap.first $t@7@01) self@3@01))
      (not (= i@8@01 index@4@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@8@01 Int)) (!
  (and
    (=>
      (<= 0 i@8@01)
      (and
        (<= 0 i@8@01)
        (or
          (< i@8@01 (len ($Snap.first $t@7@01) self@3@01))
          (not (< i@8@01 (len ($Snap.first $t@7@01) self@3@01))))))
    (or (<= 0 i@8@01) (not (<= 0 i@8@01)))
    (=>
      (and
        (<= 0 i@8@01)
        (and
          (< i@8@01 (len ($Snap.first $t@7@01) self@3@01))
          (not (= i@8@01 index@4@01))))
      (and
        (<= 0 i@8@01)
        (< i@8@01 (len ($Snap.first $t@7@01) self@3@01))
        (not (= i@8@01 index@4@01))
        (lookup%precondition ($Snap.combine
          ($Snap.first $t@7@01)
          ($Snap.combine $Snap.unit $Snap.unit)) self@3@01 i@8@01)
        (< i@8@01 (len ($Snap.first $t@6@01) self@3@01))
        (lookup%precondition ($Snap.combine
          ($Snap.first $t@6@01)
          ($Snap.combine $Snap.unit $Snap.unit)) self@3@01 i@8@01)))
    (or
      (not
        (and
          (<= 0 i@8@01)
          (and
            (< i@8@01 (len ($Snap.first $t@7@01) self@3@01))
            (not (= i@8@01 index@4@01)))))
      (and
        (<= 0 i@8@01)
        (and
          (< i@8@01 (len ($Snap.first $t@7@01) self@3@01))
          (not (= i@8@01 index@4@01))))))
  :pattern ((lookup%limited ($Snap.combine
    ($Snap.first $t@7@01)
    ($Snap.combine $Snap.unit $Snap.unit)) self@3@01 i@8@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0509.vpr@19@11@20@43-aux|)))
(assert (forall ((i@8@01 Int)) (!
  (=>
    (and
      (<= 0 i@8@01)
      (and
        (< i@8@01 (len ($Snap.first $t@7@01) self@3@01))
        (not (= i@8@01 index@4@01))))
    (=
      (lookup ($Snap.combine
        ($Snap.first $t@7@01)
        ($Snap.combine $Snap.unit $Snap.unit)) self@3@01 i@8@01)
      (lookup ($Snap.combine
        ($Snap.first $t@6@01)
        ($Snap.combine $Snap.unit $Snap.unit)) self@3@01 i@8@01)))
  :pattern ((lookup%limited ($Snap.combine
    ($Snap.first $t@7@01)
    ($Snap.combine $Snap.unit $Snap.unit)) self@3@01 i@8@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0509.vpr@19@11@20@43|)))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- merge_sort_part ----------
(declare-const arr@9@01 $Ref)
(declare-const from@10@01 Int)
(declare-const until@11@01 Int)
(declare-const arr@12@01 $Ref)
(declare-const from@13@01 Int)
(declare-const until@14@01 Int)
(push) ; 1
(declare-const $t@15@01 $Snap)
(assert (= $t@15@01 ($Snap.combine ($Snap.first $t@15@01) ($Snap.second $t@15@01))))
(assert (=
  ($Snap.second $t@15@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@15@01))
    ($Snap.second ($Snap.second $t@15@01)))))
(assert (= ($Snap.first ($Snap.second $t@15@01)) $Snap.unit))
; [eval] 0 <= from
(assert (<= 0 from@13@01))
(assert (=
  ($Snap.second ($Snap.second $t@15@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@15@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@15@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@15@01))) $Snap.unit))
; [eval] from <= until
(assert (<= from@13@01 until@14@01))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@15@01))) $Snap.unit))
; [eval] until <= len(arr)
; [eval] len(arr)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (len%precondition ($Snap.first $t@15@01) arr@12@01))
(pop) ; 2
; Joined path conditions
(assert (len%precondition ($Snap.first $t@15@01) arr@12@01))
(assert (<= until@14@01 (len ($Snap.first $t@15@01) arr@12@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var mid: Int
(declare-const mid@16@01 Int)
; [exec]
; var left_copy: Ref
(declare-const left_copy@17@01 $Ref)
; [exec]
; var index: Int
(declare-const index@18@01 Int)
; [exec]
; var left_index: Int
(declare-const left_index@19@01 Int)
; [exec]
; var right_index: Int
(declare-const right_index@20@01 Int)
; [exec]
; var left_value: Int
(declare-const left_value@21@01 Int)
; [exec]
; inhale until - from > 1
(declare-const $t@22@01 $Snap)
(assert (= $t@22@01 $Snap.unit))
; [eval] until - from > 1
; [eval] until - from
(assert (> (- until@14@01 from@13@01) 1))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; mid := from + (until - from) / 2
; [eval] from + (until - from) / 2
; [eval] (until - from) / 2
; [eval] until - from
(declare-const mid@23@01 Int)
(assert (= mid@23@01 (+ from@13@01 (div (- until@14@01 from@13@01) 2))))
; [exec]
; index := from
; [exec]
; left_index := 0
; [exec]
; right_index := mid
; [exec]
; inhale acc(VecI32(left_copy), write)
(declare-const $t@24@01 $Snap)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= arr@12@01 left_copy@17@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int, j: Int ::
;     { lookup(arr, i), lookup(arr, j) }
;     right_index <= i && (i < j && j < until) ==>
;     lookup(arr, i) <= lookup(arr, j))
(declare-const $t@25@01 $Snap)
(assert (= $t@25@01 $Snap.unit))
; [eval] (forall i: Int, j: Int :: { lookup(arr, i), lookup(arr, j) } right_index <= i && (i < j && j < until) ==> lookup(arr, i) <= lookup(arr, j))
(declare-const i@26@01 Int)
(declare-const j@27@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] right_index <= i && (i < j && j < until) ==> lookup(arr, i) <= lookup(arr, j)
; [eval] right_index <= i && (i < j && j < until)
; [eval] right_index <= i
(push) ; 4
; [then-branch: 3 | !(mid@23@01 <= i@26@01) | live]
; [else-branch: 3 | mid@23@01 <= i@26@01 | live]
(push) ; 5
; [then-branch: 3 | !(mid@23@01 <= i@26@01)]
(assert (not (<= mid@23@01 i@26@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 3 | mid@23@01 <= i@26@01]
(assert (<= mid@23@01 i@26@01))
; [eval] i < j
(push) ; 6
; [then-branch: 4 | !(i@26@01 < j@27@01) | live]
; [else-branch: 4 | i@26@01 < j@27@01 | live]
(push) ; 7
; [then-branch: 4 | !(i@26@01 < j@27@01)]
(assert (not (< i@26@01 j@27@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 4 | i@26@01 < j@27@01]
(assert (< i@26@01 j@27@01))
; [eval] j < until
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (< i@26@01 j@27@01) (not (< i@26@01 j@27@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= mid@23@01 i@26@01)
  (and (<= mid@23@01 i@26@01) (or (< i@26@01 j@27@01) (not (< i@26@01 j@27@01))))))
(assert (or (<= mid@23@01 i@26@01) (not (<= mid@23@01 i@26@01))))
(push) ; 4
; [then-branch: 5 | mid@23@01 <= i@26@01 && i@26@01 < j@27@01 && j@27@01 < until@14@01 | live]
; [else-branch: 5 | !(mid@23@01 <= i@26@01 && i@26@01 < j@27@01 && j@27@01 < until@14@01) | live]
(push) ; 5
; [then-branch: 5 | mid@23@01 <= i@26@01 && i@26@01 < j@27@01 && j@27@01 < until@14@01]
(assert (and (<= mid@23@01 i@26@01) (and (< i@26@01 j@27@01) (< j@27@01 until@14@01))))
; [eval] lookup(arr, i) <= lookup(arr, j)
; [eval] lookup(arr, i)
(push) ; 6
; [eval] 0 <= index
(push) ; 7
(assert (not (<= 0 i@26@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 i@26@01))
; [eval] index < len(self)
; [eval] len(self)
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
; Joined path conditions
(set-option :timeout 0)
(push) ; 7
(assert (not (< i@26@01 (len ($Snap.first $t@15@01) arr@12@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (< i@26@01 (len ($Snap.first $t@15@01) arr@12@01)))
(assert (lookup%precondition ($Snap.combine
  ($Snap.first $t@15@01)
  ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 i@26@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (<= 0 i@26@01)
  (< i@26@01 (len ($Snap.first $t@15@01) arr@12@01))
  (lookup%precondition ($Snap.combine
    ($Snap.first $t@15@01)
    ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 i@26@01)))
; [eval] lookup(arr, j)
(push) ; 6
; [eval] 0 <= index
(push) ; 7
(assert (not (<= 0 j@27@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 j@27@01))
; [eval] index < len(self)
; [eval] len(self)
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
; Joined path conditions
(set-option :timeout 0)
(push) ; 7
(assert (not (< j@27@01 (len ($Snap.first $t@15@01) arr@12@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (< j@27@01 (len ($Snap.first $t@15@01) arr@12@01)))
(assert (lookup%precondition ($Snap.combine
  ($Snap.first $t@15@01)
  ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 j@27@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (<= 0 j@27@01)
  (< j@27@01 (len ($Snap.first $t@15@01) arr@12@01))
  (lookup%precondition ($Snap.combine
    ($Snap.first $t@15@01)
    ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 j@27@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 5 | !(mid@23@01 <= i@26@01 && i@26@01 < j@27@01 && j@27@01 < until@14@01)]
(assert (not
  (and (<= mid@23@01 i@26@01) (and (< i@26@01 j@27@01) (< j@27@01 until@14@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (<= mid@23@01 i@26@01) (and (< i@26@01 j@27@01) (< j@27@01 until@14@01)))
  (and
    (<= mid@23@01 i@26@01)
    (< i@26@01 j@27@01)
    (< j@27@01 until@14@01)
    (<= 0 i@26@01)
    (< i@26@01 (len ($Snap.first $t@15@01) arr@12@01))
    (lookup%precondition ($Snap.combine
      ($Snap.first $t@15@01)
      ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 i@26@01)
    (<= 0 j@27@01)
    (< j@27@01 (len ($Snap.first $t@15@01) arr@12@01))
    (lookup%precondition ($Snap.combine
      ($Snap.first $t@15@01)
      ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 j@27@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= mid@23@01 i@26@01)
      (and (< i@26@01 j@27@01) (< j@27@01 until@14@01))))
  (and (<= mid@23@01 i@26@01) (and (< i@26@01 j@27@01) (< j@27@01 until@14@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@26@01 Int) (j@27@01 Int)) (!
  (and
    (=>
      (<= mid@23@01 i@26@01)
      (and
        (<= mid@23@01 i@26@01)
        (or (< i@26@01 j@27@01) (not (< i@26@01 j@27@01)))))
    (or (<= mid@23@01 i@26@01) (not (<= mid@23@01 i@26@01)))
    (=>
      (and
        (<= mid@23@01 i@26@01)
        (and (< i@26@01 j@27@01) (< j@27@01 until@14@01)))
      (and
        (<= mid@23@01 i@26@01)
        (< i@26@01 j@27@01)
        (< j@27@01 until@14@01)
        (<= 0 i@26@01)
        (< i@26@01 (len ($Snap.first $t@15@01) arr@12@01))
        (lookup%precondition ($Snap.combine
          ($Snap.first $t@15@01)
          ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 i@26@01)
        (<= 0 j@27@01)
        (< j@27@01 (len ($Snap.first $t@15@01) arr@12@01))
        (lookup%precondition ($Snap.combine
          ($Snap.first $t@15@01)
          ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 j@27@01)))
    (or
      (not
        (and
          (<= mid@23@01 i@26@01)
          (and (< i@26@01 j@27@01) (< j@27@01 until@14@01))))
      (and
        (<= mid@23@01 i@26@01)
        (and (< i@26@01 j@27@01) (< j@27@01 until@14@01)))))
  :pattern ((lookup%limited ($Snap.combine
    ($Snap.first $t@15@01)
    ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 i@26@01) (lookup%limited ($Snap.combine
    ($Snap.first $t@15@01)
    ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 j@27@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0509.vpr@34@11@34@132-aux|)))
(assert (forall ((i@26@01 Int) (j@27@01 Int)) (!
  (=>
    (and
      (<= mid@23@01 i@26@01)
      (and (< i@26@01 j@27@01) (< j@27@01 until@14@01)))
    (<=
      (lookup ($Snap.combine
        ($Snap.first $t@15@01)
        ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 i@26@01)
      (lookup ($Snap.combine
        ($Snap.first $t@15@01)
        ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 j@27@01)))
  :pattern ((lookup%limited ($Snap.combine
    ($Snap.first $t@15@01)
    ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 i@26@01) (lookup%limited ($Snap.combine
    ($Snap.first $t@15@01)
    ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 j@27@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0509.vpr@34@11@34@132|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale left_index < len(left_copy)
(declare-const $t@28@01 $Snap)
(assert (= $t@28@01 $Snap.unit))
; [eval] left_index < len(left_copy)
; [eval] len(left_copy)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (len%precondition $t@24@01 left_copy@17@01))
(pop) ; 3
; Joined path conditions
(assert (len%precondition $t@24@01 left_copy@17@01))
(assert (< 0 (len $t@24@01 left_copy@17@01)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (forall i: Int, j: Int ::
;     { lookup(arr, i), lookup(arr, j) }
;     right_index <= i && (i < j && j < until) ==>
;     lookup(arr, i) <= lookup(arr, j))
; [eval] (forall i: Int, j: Int :: { lookup(arr, i), lookup(arr, j) } right_index <= i && (i < j && j < until) ==> lookup(arr, i) <= lookup(arr, j))
(declare-const i@29@01 Int)
(declare-const j@30@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] right_index <= i && (i < j && j < until) ==> lookup(arr, i) <= lookup(arr, j)
; [eval] right_index <= i && (i < j && j < until)
; [eval] right_index <= i
(push) ; 4
; [then-branch: 6 | !(mid@23@01 <= i@29@01) | live]
; [else-branch: 6 | mid@23@01 <= i@29@01 | live]
(push) ; 5
; [then-branch: 6 | !(mid@23@01 <= i@29@01)]
(assert (not (<= mid@23@01 i@29@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 6 | mid@23@01 <= i@29@01]
(assert (<= mid@23@01 i@29@01))
; [eval] i < j
(push) ; 6
; [then-branch: 7 | !(i@29@01 < j@30@01) | live]
; [else-branch: 7 | i@29@01 < j@30@01 | live]
(push) ; 7
; [then-branch: 7 | !(i@29@01 < j@30@01)]
(assert (not (< i@29@01 j@30@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 7 | i@29@01 < j@30@01]
(assert (< i@29@01 j@30@01))
; [eval] j < until
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (< i@29@01 j@30@01) (not (< i@29@01 j@30@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= mid@23@01 i@29@01)
  (and (<= mid@23@01 i@29@01) (or (< i@29@01 j@30@01) (not (< i@29@01 j@30@01))))))
(assert (or (<= mid@23@01 i@29@01) (not (<= mid@23@01 i@29@01))))
(push) ; 4
; [then-branch: 8 | mid@23@01 <= i@29@01 && i@29@01 < j@30@01 && j@30@01 < until@14@01 | live]
; [else-branch: 8 | !(mid@23@01 <= i@29@01 && i@29@01 < j@30@01 && j@30@01 < until@14@01) | live]
(push) ; 5
; [then-branch: 8 | mid@23@01 <= i@29@01 && i@29@01 < j@30@01 && j@30@01 < until@14@01]
(assert (and (<= mid@23@01 i@29@01) (and (< i@29@01 j@30@01) (< j@30@01 until@14@01))))
; [eval] lookup(arr, i) <= lookup(arr, j)
; [eval] lookup(arr, i)
(push) ; 6
; [eval] 0 <= index
(push) ; 7
(assert (not (<= 0 i@29@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 i@29@01))
; [eval] index < len(self)
; [eval] len(self)
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
; Joined path conditions
(set-option :timeout 0)
(push) ; 7
(assert (not (< i@29@01 (len ($Snap.first $t@15@01) arr@12@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (< i@29@01 (len ($Snap.first $t@15@01) arr@12@01)))
(assert (lookup%precondition ($Snap.combine
  ($Snap.first $t@15@01)
  ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 i@29@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (<= 0 i@29@01)
  (< i@29@01 (len ($Snap.first $t@15@01) arr@12@01))
  (lookup%precondition ($Snap.combine
    ($Snap.first $t@15@01)
    ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 i@29@01)))
; [eval] lookup(arr, j)
(push) ; 6
; [eval] 0 <= index
(push) ; 7
(assert (not (<= 0 j@30@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 j@30@01))
; [eval] index < len(self)
; [eval] len(self)
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
; Joined path conditions
(set-option :timeout 0)
(push) ; 7
(assert (not (< j@30@01 (len ($Snap.first $t@15@01) arr@12@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (< j@30@01 (len ($Snap.first $t@15@01) arr@12@01)))
(assert (lookup%precondition ($Snap.combine
  ($Snap.first $t@15@01)
  ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 j@30@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (<= 0 j@30@01)
  (< j@30@01 (len ($Snap.first $t@15@01) arr@12@01))
  (lookup%precondition ($Snap.combine
    ($Snap.first $t@15@01)
    ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 j@30@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 8 | !(mid@23@01 <= i@29@01 && i@29@01 < j@30@01 && j@30@01 < until@14@01)]
(assert (not
  (and (<= mid@23@01 i@29@01) (and (< i@29@01 j@30@01) (< j@30@01 until@14@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (<= mid@23@01 i@29@01) (and (< i@29@01 j@30@01) (< j@30@01 until@14@01)))
  (and
    (<= mid@23@01 i@29@01)
    (< i@29@01 j@30@01)
    (< j@30@01 until@14@01)
    (<= 0 i@29@01)
    (< i@29@01 (len ($Snap.first $t@15@01) arr@12@01))
    (lookup%precondition ($Snap.combine
      ($Snap.first $t@15@01)
      ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 i@29@01)
    (<= 0 j@30@01)
    (< j@30@01 (len ($Snap.first $t@15@01) arr@12@01))
    (lookup%precondition ($Snap.combine
      ($Snap.first $t@15@01)
      ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 j@30@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= mid@23@01 i@29@01)
      (and (< i@29@01 j@30@01) (< j@30@01 until@14@01))))
  (and (<= mid@23@01 i@29@01) (and (< i@29@01 j@30@01) (< j@30@01 until@14@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@29@01 Int) (j@30@01 Int)) (!
  (and
    (=>
      (<= mid@23@01 i@29@01)
      (and
        (<= mid@23@01 i@29@01)
        (or (< i@29@01 j@30@01) (not (< i@29@01 j@30@01)))))
    (or (<= mid@23@01 i@29@01) (not (<= mid@23@01 i@29@01)))
    (=>
      (and
        (<= mid@23@01 i@29@01)
        (and (< i@29@01 j@30@01) (< j@30@01 until@14@01)))
      (and
        (<= mid@23@01 i@29@01)
        (< i@29@01 j@30@01)
        (< j@30@01 until@14@01)
        (<= 0 i@29@01)
        (< i@29@01 (len ($Snap.first $t@15@01) arr@12@01))
        (lookup%precondition ($Snap.combine
          ($Snap.first $t@15@01)
          ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 i@29@01)
        (<= 0 j@30@01)
        (< j@30@01 (len ($Snap.first $t@15@01) arr@12@01))
        (lookup%precondition ($Snap.combine
          ($Snap.first $t@15@01)
          ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 j@30@01)))
    (or
      (not
        (and
          (<= mid@23@01 i@29@01)
          (and (< i@29@01 j@30@01) (< j@30@01 until@14@01))))
      (and
        (<= mid@23@01 i@29@01)
        (and (< i@29@01 j@30@01) (< j@30@01 until@14@01)))))
  :pattern ((lookup%limited ($Snap.combine
    ($Snap.first $t@15@01)
    ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 i@29@01) (lookup%limited ($Snap.combine
    ($Snap.first $t@15@01)
    ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 j@30@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0509.vpr@38@10@38@131-aux|)))
(assert (forall ((i@29@01 Int) (j@30@01 Int)) (!
  (=>
    (and
      (<= mid@23@01 i@29@01)
      (and (< i@29@01 j@30@01) (< j@30@01 until@14@01)))
    (and
      (lookup%precondition ($Snap.combine
        ($Snap.first $t@15@01)
        ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 i@29@01)
      (lookup%precondition ($Snap.combine
        ($Snap.first $t@15@01)
        ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 j@30@01)))
  :pattern ((lookup%limited ($Snap.combine
    ($Snap.first $t@15@01)
    ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 i@29@01) (lookup%limited ($Snap.combine
    ($Snap.first $t@15@01)
    ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 j@30@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0509.vpr@38@10@38@131_precondition|)))
(push) ; 3
(assert (not (forall ((i@29@01 Int) (j@30@01 Int)) (!
  (=>
    (and
      (=>
        (and
          (<= mid@23@01 i@29@01)
          (and (< i@29@01 j@30@01) (< j@30@01 until@14@01)))
        (and
          (lookup%precondition ($Snap.combine
            ($Snap.first $t@15@01)
            ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 i@29@01)
          (lookup%precondition ($Snap.combine
            ($Snap.first $t@15@01)
            ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 j@30@01)))
      (and
        (<= mid@23@01 i@29@01)
        (and (< i@29@01 j@30@01) (< j@30@01 until@14@01))))
    (<=
      (lookup ($Snap.combine
        ($Snap.first $t@15@01)
        ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 i@29@01)
      (lookup ($Snap.combine
        ($Snap.first $t@15@01)
        ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 j@30@01)))
  :pattern ((lookup%limited ($Snap.combine
    ($Snap.first $t@15@01)
    ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 i@29@01) (lookup%limited ($Snap.combine
    ($Snap.first $t@15@01)
    ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 j@30@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0509.vpr@38@10@38@131|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@29@01 Int) (j@30@01 Int)) (!
  (=>
    (and
      (<= mid@23@01 i@29@01)
      (and (< i@29@01 j@30@01) (< j@30@01 until@14@01)))
    (<=
      (lookup ($Snap.combine
        ($Snap.first $t@15@01)
        ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 i@29@01)
      (lookup ($Snap.combine
        ($Snap.first $t@15@01)
        ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 j@30@01)))
  :pattern ((lookup%limited ($Snap.combine
    ($Snap.first $t@15@01)
    ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 i@29@01) (lookup%limited ($Snap.combine
    ($Snap.first $t@15@01)
    ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 j@30@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0509.vpr@38@10@38@131|)))
; [exec]
; left_value := lookup(left_copy, left_index)
; [eval] lookup(left_copy, left_index)
(push) ; 3
; [eval] 0 <= index
; [eval] index < len(self)
; [eval] len(self)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
; Joined path conditions
(assert (lookup%precondition ($Snap.combine
  $t@24@01
  ($Snap.combine $Snap.unit $Snap.unit)) left_copy@17@01 0))
(pop) ; 3
; Joined path conditions
(assert (lookup%precondition ($Snap.combine
  $t@24@01
  ($Snap.combine $Snap.unit $Snap.unit)) left_copy@17@01 0))
(declare-const left_value@31@01 Int)
(assert (=
  left_value@31@01
  (lookup ($Snap.combine $t@24@01 ($Snap.combine $Snap.unit $Snap.unit)) left_copy@17@01 0)))
; [exec]
; store(arr, index, left_value)
; [eval] 0 <= index
; [eval] index < len(self)
; [eval] len(self)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (< from@13@01 (len ($Snap.first $t@15@01) arr@12@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< from@13@01 (len ($Snap.first $t@15@01) arr@12@01)))
(declare-const $t@32@01 $Snap)
(assert (= $t@32@01 ($Snap.combine ($Snap.first $t@32@01) ($Snap.second $t@32@01))))
(push) ; 3
(set-option :timeout 10)
(assert (not (= left_copy@17@01 arr@12@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@32@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@32@01))
    ($Snap.second ($Snap.second $t@32@01)))))
(assert (= ($Snap.first ($Snap.second $t@32@01)) $Snap.unit))
; [eval] len(self) == old(len(self))
; [eval] len(self)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (len%precondition ($Snap.first $t@32@01) arr@12@01))
(pop) ; 3
; Joined path conditions
(assert (len%precondition ($Snap.first $t@32@01) arr@12@01))
; [eval] old(len(self))
; [eval] len(self)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert (= (len ($Snap.first $t@32@01) arr@12@01) (len ($Snap.first $t@15@01) arr@12@01)))
(assert (=
  ($Snap.second ($Snap.second $t@32@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@32@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@32@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@32@01))) $Snap.unit))
; [eval] lookup(self, index) == value
; [eval] lookup(self, index)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= index
; [eval] index < len(self)
; [eval] len(self)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
; Joined path conditions
(set-option :timeout 0)
(push) ; 4
(assert (not (< from@13@01 (len ($Snap.first $t@32@01) arr@12@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< from@13@01 (len ($Snap.first $t@32@01) arr@12@01)))
(assert (lookup%precondition ($Snap.combine
  ($Snap.first $t@32@01)
  ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 from@13@01))
(pop) ; 3
; Joined path conditions
(assert (and
  (< from@13@01 (len ($Snap.first $t@32@01) arr@12@01))
  (lookup%precondition ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 from@13@01)))
(assert (=
  (lookup ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 from@13@01)
  left_value@31@01))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@32@01))) $Snap.unit))
; [eval] (forall i: Int :: { lookup(self, i) } 0 <= i && (i < len(self) && i != index) ==> lookup(self, i) == old(lookup(self, i)))
(declare-const i@33@01 Int)
(push) ; 3
; [eval] 0 <= i && (i < len(self) && i != index) ==> lookup(self, i) == old(lookup(self, i))
; [eval] 0 <= i && (i < len(self) && i != index)
; [eval] 0 <= i
(push) ; 4
; [then-branch: 9 | !(0 <= i@33@01) | live]
; [else-branch: 9 | 0 <= i@33@01 | live]
(push) ; 5
; [then-branch: 9 | !(0 <= i@33@01)]
(assert (not (<= 0 i@33@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 9 | 0 <= i@33@01]
(assert (<= 0 i@33@01))
; [eval] i < len(self)
; [eval] len(self)
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
; Joined path conditions
(set-option :timeout 0)
(push) ; 6
; [then-branch: 10 | !(i@33@01 < len(First:($t@32@01), arr@12@01)) | live]
; [else-branch: 10 | i@33@01 < len(First:($t@32@01), arr@12@01) | live]
(push) ; 7
; [then-branch: 10 | !(i@33@01 < len(First:($t@32@01), arr@12@01))]
(assert (not (< i@33@01 (len ($Snap.first $t@32@01) arr@12@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 10 | i@33@01 < len(First:($t@32@01), arr@12@01)]
(assert (< i@33@01 (len ($Snap.first $t@32@01) arr@12@01)))
; [eval] i != index
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (< i@33@01 (len ($Snap.first $t@32@01) arr@12@01))
  (not (< i@33@01 (len ($Snap.first $t@32@01) arr@12@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@33@01)
  (and
    (<= 0 i@33@01)
    (or
      (< i@33@01 (len ($Snap.first $t@32@01) arr@12@01))
      (not (< i@33@01 (len ($Snap.first $t@32@01) arr@12@01)))))))
(assert (or (<= 0 i@33@01) (not (<= 0 i@33@01))))
(push) ; 4
; [then-branch: 11 | 0 <= i@33@01 && i@33@01 < len(First:($t@32@01), arr@12@01) && i@33@01 != from@13@01 | live]
; [else-branch: 11 | !(0 <= i@33@01 && i@33@01 < len(First:($t@32@01), arr@12@01) && i@33@01 != from@13@01) | live]
(push) ; 5
; [then-branch: 11 | 0 <= i@33@01 && i@33@01 < len(First:($t@32@01), arr@12@01) && i@33@01 != from@13@01]
(assert (and
  (<= 0 i@33@01)
  (and
    (< i@33@01 (len ($Snap.first $t@32@01) arr@12@01))
    (not (= i@33@01 from@13@01)))))
; [eval] lookup(self, i) == old(lookup(self, i))
; [eval] lookup(self, i)
(push) ; 6
; [eval] 0 <= index
; [eval] index < len(self)
; [eval] len(self)
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
; Joined path conditions
(assert (lookup%precondition ($Snap.combine
  ($Snap.first $t@32@01)
  ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 i@33@01))
(pop) ; 6
; Joined path conditions
(assert (lookup%precondition ($Snap.combine
  ($Snap.first $t@32@01)
  ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 i@33@01))
; [eval] old(lookup(self, i))
; [eval] lookup(self, i)
(set-option :timeout 0)
(push) ; 6
; [eval] 0 <= index
; [eval] index < len(self)
; [eval] len(self)
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
; Joined path conditions
(set-option :timeout 0)
(push) ; 7
(assert (not (< i@33@01 (len ($Snap.first $t@15@01) arr@12@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (< i@33@01 (len ($Snap.first $t@15@01) arr@12@01)))
(assert (lookup%precondition ($Snap.combine
  ($Snap.first $t@15@01)
  ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 i@33@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (< i@33@01 (len ($Snap.first $t@15@01) arr@12@01))
  (lookup%precondition ($Snap.combine
    ($Snap.first $t@15@01)
    ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 i@33@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 11 | !(0 <= i@33@01 && i@33@01 < len(First:($t@32@01), arr@12@01) && i@33@01 != from@13@01)]
(assert (not
  (and
    (<= 0 i@33@01)
    (and
      (< i@33@01 (len ($Snap.first $t@32@01) arr@12@01))
      (not (= i@33@01 from@13@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (<= 0 i@33@01)
    (and
      (< i@33@01 (len ($Snap.first $t@32@01) arr@12@01))
      (not (= i@33@01 from@13@01))))
  (and
    (<= 0 i@33@01)
    (< i@33@01 (len ($Snap.first $t@32@01) arr@12@01))
    (not (= i@33@01 from@13@01))
    (lookup%precondition ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 i@33@01)
    (< i@33@01 (len ($Snap.first $t@15@01) arr@12@01))
    (lookup%precondition ($Snap.combine
      ($Snap.first $t@15@01)
      ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 i@33@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@33@01)
      (and
        (< i@33@01 (len ($Snap.first $t@32@01) arr@12@01))
        (not (= i@33@01 from@13@01)))))
  (and
    (<= 0 i@33@01)
    (and
      (< i@33@01 (len ($Snap.first $t@32@01) arr@12@01))
      (not (= i@33@01 from@13@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@33@01 Int)) (!
  (and
    (=>
      (<= 0 i@33@01)
      (and
        (<= 0 i@33@01)
        (or
          (< i@33@01 (len ($Snap.first $t@32@01) arr@12@01))
          (not (< i@33@01 (len ($Snap.first $t@32@01) arr@12@01))))))
    (or (<= 0 i@33@01) (not (<= 0 i@33@01)))
    (=>
      (and
        (<= 0 i@33@01)
        (and
          (< i@33@01 (len ($Snap.first $t@32@01) arr@12@01))
          (not (= i@33@01 from@13@01))))
      (and
        (<= 0 i@33@01)
        (< i@33@01 (len ($Snap.first $t@32@01) arr@12@01))
        (not (= i@33@01 from@13@01))
        (lookup%precondition ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 i@33@01)
        (< i@33@01 (len ($Snap.first $t@15@01) arr@12@01))
        (lookup%precondition ($Snap.combine
          ($Snap.first $t@15@01)
          ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 i@33@01)))
    (or
      (not
        (and
          (<= 0 i@33@01)
          (and
            (< i@33@01 (len ($Snap.first $t@32@01) arr@12@01))
            (not (= i@33@01 from@13@01)))))
      (and
        (<= 0 i@33@01)
        (and
          (< i@33@01 (len ($Snap.first $t@32@01) arr@12@01))
          (not (= i@33@01 from@13@01))))))
  :pattern ((lookup%limited ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 i@33@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0509.vpr@19@11@20@43-aux|)))
(assert (forall ((i@33@01 Int)) (!
  (=>
    (and
      (<= 0 i@33@01)
      (and
        (< i@33@01 (len ($Snap.first $t@32@01) arr@12@01))
        (not (= i@33@01 from@13@01))))
    (=
      (lookup ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 i@33@01)
      (lookup ($Snap.combine
        ($Snap.first $t@15@01)
        ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 i@33@01)))
  :pattern ((lookup%limited ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 i@33@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0509.vpr@19@11@20@43|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; assert (forall i: Int, j: Int ::
;     { lookup(arr, i), lookup(arr, j) }
;     right_index <= i && (i < j && j < until) ==>
;     lookup(arr, i) <= lookup(arr, j))
; [eval] (forall i: Int, j: Int :: { lookup(arr, i), lookup(arr, j) } right_index <= i && (i < j && j < until) ==> lookup(arr, i) <= lookup(arr, j))
(declare-const i@34@01 Int)
(declare-const j@35@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] right_index <= i && (i < j && j < until) ==> lookup(arr, i) <= lookup(arr, j)
; [eval] right_index <= i && (i < j && j < until)
; [eval] right_index <= i
(push) ; 4
; [then-branch: 12 | !(mid@23@01 <= i@34@01) | live]
; [else-branch: 12 | mid@23@01 <= i@34@01 | live]
(push) ; 5
; [then-branch: 12 | !(mid@23@01 <= i@34@01)]
(assert (not (<= mid@23@01 i@34@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 12 | mid@23@01 <= i@34@01]
(assert (<= mid@23@01 i@34@01))
; [eval] i < j
(push) ; 6
; [then-branch: 13 | !(i@34@01 < j@35@01) | live]
; [else-branch: 13 | i@34@01 < j@35@01 | live]
(push) ; 7
; [then-branch: 13 | !(i@34@01 < j@35@01)]
(assert (not (< i@34@01 j@35@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 13 | i@34@01 < j@35@01]
(assert (< i@34@01 j@35@01))
; [eval] j < until
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (< i@34@01 j@35@01) (not (< i@34@01 j@35@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= mid@23@01 i@34@01)
  (and (<= mid@23@01 i@34@01) (or (< i@34@01 j@35@01) (not (< i@34@01 j@35@01))))))
(assert (or (<= mid@23@01 i@34@01) (not (<= mid@23@01 i@34@01))))
(push) ; 4
; [then-branch: 14 | mid@23@01 <= i@34@01 && i@34@01 < j@35@01 && j@35@01 < until@14@01 | live]
; [else-branch: 14 | !(mid@23@01 <= i@34@01 && i@34@01 < j@35@01 && j@35@01 < until@14@01) | live]
(push) ; 5
; [then-branch: 14 | mid@23@01 <= i@34@01 && i@34@01 < j@35@01 && j@35@01 < until@14@01]
(assert (and (<= mid@23@01 i@34@01) (and (< i@34@01 j@35@01) (< j@35@01 until@14@01))))
; [eval] lookup(arr, i) <= lookup(arr, j)
; [eval] lookup(arr, i)
(push) ; 6
; [eval] 0 <= index
(push) ; 7
(assert (not (<= 0 i@34@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 i@34@01))
; [eval] index < len(self)
; [eval] len(self)
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
; Joined path conditions
(set-option :timeout 0)
(push) ; 7
(assert (not (< i@34@01 (len ($Snap.first $t@32@01) arr@12@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (< i@34@01 (len ($Snap.first $t@32@01) arr@12@01)))
(assert (lookup%precondition ($Snap.combine
  ($Snap.first $t@32@01)
  ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 i@34@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (<= 0 i@34@01)
  (< i@34@01 (len ($Snap.first $t@32@01) arr@12@01))
  (lookup%precondition ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 i@34@01)))
; [eval] lookup(arr, j)
(push) ; 6
; [eval] 0 <= index
(push) ; 7
(assert (not (<= 0 j@35@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 j@35@01))
; [eval] index < len(self)
; [eval] len(self)
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
; Joined path conditions
(set-option :timeout 0)
(push) ; 7
(assert (not (< j@35@01 (len ($Snap.first $t@32@01) arr@12@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (< j@35@01 (len ($Snap.first $t@32@01) arr@12@01)))
(assert (lookup%precondition ($Snap.combine
  ($Snap.first $t@32@01)
  ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 j@35@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (<= 0 j@35@01)
  (< j@35@01 (len ($Snap.first $t@32@01) arr@12@01))
  (lookup%precondition ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 j@35@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 14 | !(mid@23@01 <= i@34@01 && i@34@01 < j@35@01 && j@35@01 < until@14@01)]
(assert (not
  (and (<= mid@23@01 i@34@01) (and (< i@34@01 j@35@01) (< j@35@01 until@14@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (<= mid@23@01 i@34@01) (and (< i@34@01 j@35@01) (< j@35@01 until@14@01)))
  (and
    (<= mid@23@01 i@34@01)
    (< i@34@01 j@35@01)
    (< j@35@01 until@14@01)
    (<= 0 i@34@01)
    (< i@34@01 (len ($Snap.first $t@32@01) arr@12@01))
    (lookup%precondition ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 i@34@01)
    (<= 0 j@35@01)
    (< j@35@01 (len ($Snap.first $t@32@01) arr@12@01))
    (lookup%precondition ($Snap.combine
      ($Snap.first $t@32@01)
      ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 j@35@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= mid@23@01 i@34@01)
      (and (< i@34@01 j@35@01) (< j@35@01 until@14@01))))
  (and (<= mid@23@01 i@34@01) (and (< i@34@01 j@35@01) (< j@35@01 until@14@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@34@01 Int) (j@35@01 Int)) (!
  (and
    (=>
      (<= mid@23@01 i@34@01)
      (and
        (<= mid@23@01 i@34@01)
        (or (< i@34@01 j@35@01) (not (< i@34@01 j@35@01)))))
    (or (<= mid@23@01 i@34@01) (not (<= mid@23@01 i@34@01)))
    (=>
      (and
        (<= mid@23@01 i@34@01)
        (and (< i@34@01 j@35@01) (< j@35@01 until@14@01)))
      (and
        (<= mid@23@01 i@34@01)
        (< i@34@01 j@35@01)
        (< j@35@01 until@14@01)
        (<= 0 i@34@01)
        (< i@34@01 (len ($Snap.first $t@32@01) arr@12@01))
        (lookup%precondition ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 i@34@01)
        (<= 0 j@35@01)
        (< j@35@01 (len ($Snap.first $t@32@01) arr@12@01))
        (lookup%precondition ($Snap.combine
          ($Snap.first $t@32@01)
          ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 j@35@01)))
    (or
      (not
        (and
          (<= mid@23@01 i@34@01)
          (and (< i@34@01 j@35@01) (< j@35@01 until@14@01))))
      (and
        (<= mid@23@01 i@34@01)
        (and (< i@34@01 j@35@01) (< j@35@01 until@14@01)))))
  :pattern ((lookup%limited ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 i@34@01) (lookup%limited ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 j@35@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0509.vpr@43@10@43@131-aux|)))
(assert (forall ((i@34@01 Int) (j@35@01 Int)) (!
  (=>
    (and
      (<= mid@23@01 i@34@01)
      (and (< i@34@01 j@35@01) (< j@35@01 until@14@01)))
    (and
      (lookup%precondition ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 i@34@01)
      (lookup%precondition ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 j@35@01)))
  :pattern ((lookup%limited ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 i@34@01) (lookup%limited ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 j@35@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0509.vpr@43@10@43@131_precondition|)))
(push) ; 3
(assert (not (forall ((i@34@01 Int) (j@35@01 Int)) (!
  (=>
    (and
      (=>
        (and
          (<= mid@23@01 i@34@01)
          (and (< i@34@01 j@35@01) (< j@35@01 until@14@01)))
        (and
          (lookup%precondition ($Snap.combine
            ($Snap.first $t@32@01)
            ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 i@34@01)
          (lookup%precondition ($Snap.combine
            ($Snap.first $t@32@01)
            ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 j@35@01)))
      (and
        (<= mid@23@01 i@34@01)
        (and (< i@34@01 j@35@01) (< j@35@01 until@14@01))))
    (<=
      (lookup ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 i@34@01)
      (lookup ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 j@35@01)))
  :pattern ((lookup%limited ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 i@34@01) (lookup%limited ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 j@35@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0509.vpr@43@10@43@131|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@34@01 Int) (j@35@01 Int)) (!
  (=>
    (and
      (<= mid@23@01 i@34@01)
      (and (< i@34@01 j@35@01) (< j@35@01 until@14@01)))
    (<=
      (lookup ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 i@34@01)
      (lookup ($Snap.combine
        ($Snap.first $t@32@01)
        ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 j@35@01)))
  :pattern ((lookup%limited ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 i@34@01) (lookup%limited ($Snap.combine
    ($Snap.first $t@32@01)
    ($Snap.combine $Snap.unit $Snap.unit)) arr@12@01 j@35@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0509.vpr@43@10@43@131|)))
(pop) ; 2
(pop) ; 1
