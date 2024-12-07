(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:41:01
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/basic/disjunction_fast_20.vpr
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
(declare-fun Slow%trigger ($Snap $Ref) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ---------- Slow ----------
(declare-const this@0@00 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@1@00 $Snap)
(assert (= $t@1@00 ($Snap.combine ($Snap.first $t@1@00) ($Snap.second $t@1@00))))
(assert (not (= this@0@00 $Ref.null)))
(assert (= ($Snap.second $t@1@00) $Snap.unit))
; [eval] this.val == 0 || (this.val == 1 || (this.val == 2 || (this.val == 3 || (this.val == 4 || (this.val == 5 || (this.val == 6 || (this.val == 7 || (this.val == 8 || (this.val == 9 || (this.val == 10 || (this.val == 11 || (this.val == 12 || (this.val == 13 || (this.val == 14 || (this.val == 15 || (this.val == 16 || (this.val == 17 || (this.val == 18 || (this.val == 19 || true)))))))))))))))))))
; [eval] this.val == 0
(push) ; 2
; [then-branch: 0 | First:($t@1@00) == 0 | live]
; [else-branch: 0 | First:($t@1@00) != 0 | live]
(push) ; 3
; [then-branch: 0 | First:($t@1@00) == 0]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 0))
(pop) ; 3
(push) ; 3
; [else-branch: 0 | First:($t@1@00) != 0]
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 0)))
; [eval] this.val == 1
(push) ; 4
; [then-branch: 1 | First:($t@1@00) == 1 | live]
; [else-branch: 1 | First:($t@1@00) != 1 | live]
(push) ; 5
; [then-branch: 1 | First:($t@1@00) == 1]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 1))
(pop) ; 5
(push) ; 5
; [else-branch: 1 | First:($t@1@00) != 1]
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 1)))
; [eval] this.val == 2
(push) ; 6
; [then-branch: 2 | First:($t@1@00) == 2 | live]
; [else-branch: 2 | First:($t@1@00) != 2 | live]
(push) ; 7
; [then-branch: 2 | First:($t@1@00) == 2]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 2))
(pop) ; 7
(push) ; 7
; [else-branch: 2 | First:($t@1@00) != 2]
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 2)))
; [eval] this.val == 3
(push) ; 8
; [then-branch: 3 | First:($t@1@00) == 3 | live]
; [else-branch: 3 | First:($t@1@00) != 3 | live]
(push) ; 9
; [then-branch: 3 | First:($t@1@00) == 3]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 3))
(pop) ; 9
(push) ; 9
; [else-branch: 3 | First:($t@1@00) != 3]
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 3)))
; [eval] this.val == 4
(push) ; 10
; [then-branch: 4 | First:($t@1@00) == 4 | live]
; [else-branch: 4 | First:($t@1@00) != 4 | live]
(push) ; 11
; [then-branch: 4 | First:($t@1@00) == 4]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 4))
(pop) ; 11
(push) ; 11
; [else-branch: 4 | First:($t@1@00) != 4]
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 4)))
; [eval] this.val == 5
(push) ; 12
; [then-branch: 5 | First:($t@1@00) == 5 | live]
; [else-branch: 5 | First:($t@1@00) != 5 | live]
(push) ; 13
; [then-branch: 5 | First:($t@1@00) == 5]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 5))
(pop) ; 13
(push) ; 13
; [else-branch: 5 | First:($t@1@00) != 5]
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 5)))
; [eval] this.val == 6
(push) ; 14
; [then-branch: 6 | First:($t@1@00) == 6 | live]
; [else-branch: 6 | First:($t@1@00) != 6 | live]
(push) ; 15
; [then-branch: 6 | First:($t@1@00) == 6]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 6))
(pop) ; 15
(push) ; 15
; [else-branch: 6 | First:($t@1@00) != 6]
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 6)))
; [eval] this.val == 7
(push) ; 16
; [then-branch: 7 | First:($t@1@00) == 7 | live]
; [else-branch: 7 | First:($t@1@00) != 7 | live]
(push) ; 17
; [then-branch: 7 | First:($t@1@00) == 7]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 7))
(pop) ; 17
(push) ; 17
; [else-branch: 7 | First:($t@1@00) != 7]
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 7)))
; [eval] this.val == 8
(push) ; 18
; [then-branch: 8 | First:($t@1@00) == 8 | live]
; [else-branch: 8 | First:($t@1@00) != 8 | live]
(push) ; 19
; [then-branch: 8 | First:($t@1@00) == 8]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 8))
(pop) ; 19
(push) ; 19
; [else-branch: 8 | First:($t@1@00) != 8]
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 8)))
; [eval] this.val == 9
(push) ; 20
; [then-branch: 9 | First:($t@1@00) == 9 | live]
; [else-branch: 9 | First:($t@1@00) != 9 | live]
(push) ; 21
; [then-branch: 9 | First:($t@1@00) == 9]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 9))
(pop) ; 21
(push) ; 21
; [else-branch: 9 | First:($t@1@00) != 9]
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 9)))
; [eval] this.val == 10
(push) ; 22
; [then-branch: 10 | First:($t@1@00) == 10 | live]
; [else-branch: 10 | First:($t@1@00) != 10 | live]
(push) ; 23
; [then-branch: 10 | First:($t@1@00) == 10]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 10))
(pop) ; 23
(push) ; 23
; [else-branch: 10 | First:($t@1@00) != 10]
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 10)))
; [eval] this.val == 11
(push) ; 24
; [then-branch: 11 | First:($t@1@00) == 11 | live]
; [else-branch: 11 | First:($t@1@00) != 11 | live]
(push) ; 25
; [then-branch: 11 | First:($t@1@00) == 11]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 11))
(pop) ; 25
(push) ; 25
; [else-branch: 11 | First:($t@1@00) != 11]
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 11)))
; [eval] this.val == 12
(push) ; 26
; [then-branch: 12 | First:($t@1@00) == 12 | live]
; [else-branch: 12 | First:($t@1@00) != 12 | live]
(push) ; 27
; [then-branch: 12 | First:($t@1@00) == 12]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 12))
(pop) ; 27
(push) ; 27
; [else-branch: 12 | First:($t@1@00) != 12]
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 12)))
; [eval] this.val == 13
(push) ; 28
; [then-branch: 13 | First:($t@1@00) == 13 | live]
; [else-branch: 13 | First:($t@1@00) != 13 | live]
(push) ; 29
; [then-branch: 13 | First:($t@1@00) == 13]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 13))
(pop) ; 29
(push) ; 29
; [else-branch: 13 | First:($t@1@00) != 13]
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 13)))
; [eval] this.val == 14
(push) ; 30
; [then-branch: 14 | First:($t@1@00) == 14 | live]
; [else-branch: 14 | First:($t@1@00) != 14 | live]
(push) ; 31
; [then-branch: 14 | First:($t@1@00) == 14]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 14))
(pop) ; 31
(push) ; 31
; [else-branch: 14 | First:($t@1@00) != 14]
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 14)))
; [eval] this.val == 15
(push) ; 32
; [then-branch: 15 | First:($t@1@00) == 15 | live]
; [else-branch: 15 | First:($t@1@00) != 15 | live]
(push) ; 33
; [then-branch: 15 | First:($t@1@00) == 15]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 15))
(pop) ; 33
(push) ; 33
; [else-branch: 15 | First:($t@1@00) != 15]
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 15)))
; [eval] this.val == 16
(push) ; 34
; [then-branch: 16 | First:($t@1@00) == 16 | live]
; [else-branch: 16 | First:($t@1@00) != 16 | live]
(push) ; 35
; [then-branch: 16 | First:($t@1@00) == 16]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 16))
(pop) ; 35
(push) ; 35
; [else-branch: 16 | First:($t@1@00) != 16]
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 16)))
; [eval] this.val == 17
(push) ; 36
; [then-branch: 17 | First:($t@1@00) == 17 | live]
; [else-branch: 17 | First:($t@1@00) != 17 | live]
(push) ; 37
; [then-branch: 17 | First:($t@1@00) == 17]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 17))
(pop) ; 37
(push) ; 37
; [else-branch: 17 | First:($t@1@00) != 17]
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 17)))
; [eval] this.val == 18
(push) ; 38
; [then-branch: 18 | First:($t@1@00) == 18 | live]
; [else-branch: 18 | First:($t@1@00) != 18 | live]
(push) ; 39
; [then-branch: 18 | First:($t@1@00) == 18]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 18))
(pop) ; 39
(push) ; 39
; [else-branch: 18 | First:($t@1@00) != 18]
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 18)))
; [eval] this.val == 19
(push) ; 40
; [then-branch: 19 | First:($t@1@00) == 19 | live]
; [else-branch: 19 | First:($t@1@00) != 19 | live]
(push) ; 41
; [then-branch: 19 | First:($t@1@00) == 19]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 19))
(pop) ; 41
(push) ; 41
; [else-branch: 19 | First:($t@1@00) != 19]
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 19)))
(pop) ; 41
(pop) ; 40
; Joined path conditions
; Joined path conditions
(assert (or
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 19))
  (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 19)))
(pop) ; 39
(pop) ; 38
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 18))
  (and
    (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 18))
    (or
      (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 19))
      (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 19)))))
(assert (or
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 18))
  (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 18)))
(pop) ; 37
(pop) ; 36
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 17))
  (and
    (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 17))
    (=>
      (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 18))
      (and
        (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 18))
        (or
          (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 19))
          (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 19))))
    (or
      (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 18))
      (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 18)))))
(assert (or
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 17))
  (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 17)))
(pop) ; 35
(pop) ; 34
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 16))
  (and
    (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 16))
    (=>
      (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 17))
      (and
        (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 17))
        (=>
          (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 18))
          (and
            (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 18))
            (or
              (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 19))
              (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 19))))
        (or
          (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 18))
          (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 18))))
    (or
      (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 17))
      (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 17)))))
(assert (or
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 16))
  (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 16)))
(pop) ; 33
(pop) ; 32
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 15))
  (and
    (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 15))
    (=>
      (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 16))
      (and
        (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 16))
        (=>
          (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 17))
          (and
            (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 17))
            (=>
              (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 18))
              (and
                (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 18))
                (or
                  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 19))
                  (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 19))))
            (or
              (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 18))
              (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 18))))
        (or
          (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 17))
          (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 17))))
    (or
      (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 16))
      (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 16)))))
(assert (or
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 15))
  (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 15)))
(pop) ; 31
(pop) ; 30
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 14))
  (and
    (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 14))
    (=>
      (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 15))
      (and
        (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 15))
        (=>
          (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 16))
          (and
            (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 16))
            (=>
              (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 17))
              (and
                (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 17))
                (=>
                  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 18))
                  (and
                    (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 18))
                    (or
                      (not
                        (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 19))
                      (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 19))))
                (or
                  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 18))
                  (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 18))))
            (or
              (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 17))
              (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 17))))
        (or
          (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 16))
          (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 16))))
    (or
      (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 15))
      (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 15)))))
(assert (or
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 14))
  (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 14)))
(pop) ; 29
(pop) ; 28
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 13))
  (and
    (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 13))
    (=>
      (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 14))
      (and
        (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 14))
        (=>
          (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 15))
          (and
            (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 15))
            (=>
              (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 16))
              (and
                (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 16))
                (=>
                  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 17))
                  (and
                    (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 17))
                    (=>
                      (not
                        (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 18))
                      (and
                        (not
                          (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 18))
                        (or
                          (not
                            (=
                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                              19))
                          (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 19))))
                    (or
                      (not
                        (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 18))
                      (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 18))))
                (or
                  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 17))
                  (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 17))))
            (or
              (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 16))
              (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 16))))
        (or
          (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 15))
          (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 15))))
    (or
      (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 14))
      (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 14)))))
(assert (or
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 13))
  (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 13)))
(pop) ; 27
(pop) ; 26
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 12))
  (and
    (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 12))
    (=>
      (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 13))
      (and
        (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 13))
        (=>
          (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 14))
          (and
            (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 14))
            (=>
              (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 15))
              (and
                (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 15))
                (=>
                  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 16))
                  (and
                    (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 16))
                    (=>
                      (not
                        (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 17))
                      (and
                        (not
                          (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 17))
                        (=>
                          (not
                            (=
                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                              18))
                          (and
                            (not
                              (=
                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                18))
                            (or
                              (not
                                (=
                                  ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                  19))
                              (=
                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                19))))
                        (or
                          (not
                            (=
                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                              18))
                          (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 18))))
                    (or
                      (not
                        (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 17))
                      (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 17))))
                (or
                  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 16))
                  (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 16))))
            (or
              (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 15))
              (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 15))))
        (or
          (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 14))
          (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 14))))
    (or
      (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 13))
      (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 13)))))
(assert (or
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 12))
  (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 12)))
(pop) ; 25
(pop) ; 24
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 11))
  (and
    (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 11))
    (=>
      (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 12))
      (and
        (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 12))
        (=>
          (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 13))
          (and
            (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 13))
            (=>
              (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 14))
              (and
                (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 14))
                (=>
                  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 15))
                  (and
                    (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 15))
                    (=>
                      (not
                        (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 16))
                      (and
                        (not
                          (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 16))
                        (=>
                          (not
                            (=
                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                              17))
                          (and
                            (not
                              (=
                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                17))
                            (=>
                              (not
                                (=
                                  ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                  18))
                              (and
                                (not
                                  (=
                                    ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                    18))
                                (or
                                  (not
                                    (=
                                      ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                      19))
                                  (=
                                    ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                    19))))
                            (or
                              (not
                                (=
                                  ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                  18))
                              (=
                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                18))))
                        (or
                          (not
                            (=
                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                              17))
                          (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 17))))
                    (or
                      (not
                        (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 16))
                      (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 16))))
                (or
                  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 15))
                  (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 15))))
            (or
              (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 14))
              (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 14))))
        (or
          (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 13))
          (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 13))))
    (or
      (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 12))
      (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 12)))))
(assert (or
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 11))
  (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 11)))
(pop) ; 23
(pop) ; 22
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 10))
  (and
    (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 10))
    (=>
      (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 11))
      (and
        (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 11))
        (=>
          (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 12))
          (and
            (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 12))
            (=>
              (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 13))
              (and
                (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 13))
                (=>
                  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 14))
                  (and
                    (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 14))
                    (=>
                      (not
                        (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 15))
                      (and
                        (not
                          (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 15))
                        (=>
                          (not
                            (=
                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                              16))
                          (and
                            (not
                              (=
                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                16))
                            (=>
                              (not
                                (=
                                  ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                  17))
                              (and
                                (not
                                  (=
                                    ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                    17))
                                (=>
                                  (not
                                    (=
                                      ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                      18))
                                  (and
                                    (not
                                      (=
                                        ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                        18))
                                    (or
                                      (not
                                        (=
                                          ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                          19))
                                      (=
                                        ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                        19))))
                                (or
                                  (not
                                    (=
                                      ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                      18))
                                  (=
                                    ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                    18))))
                            (or
                              (not
                                (=
                                  ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                  17))
                              (=
                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                17))))
                        (or
                          (not
                            (=
                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                              16))
                          (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 16))))
                    (or
                      (not
                        (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 15))
                      (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 15))))
                (or
                  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 14))
                  (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 14))))
            (or
              (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 13))
              (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 13))))
        (or
          (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 12))
          (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 12))))
    (or
      (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 11))
      (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 11)))))
(assert (or
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 10))
  (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 10)))
(pop) ; 21
(pop) ; 20
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 9))
  (and
    (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 9))
    (=>
      (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 10))
      (and
        (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 10))
        (=>
          (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 11))
          (and
            (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 11))
            (=>
              (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 12))
              (and
                (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 12))
                (=>
                  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 13))
                  (and
                    (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 13))
                    (=>
                      (not
                        (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 14))
                      (and
                        (not
                          (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 14))
                        (=>
                          (not
                            (=
                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                              15))
                          (and
                            (not
                              (=
                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                15))
                            (=>
                              (not
                                (=
                                  ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                  16))
                              (and
                                (not
                                  (=
                                    ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                    16))
                                (=>
                                  (not
                                    (=
                                      ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                      17))
                                  (and
                                    (not
                                      (=
                                        ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                        17))
                                    (=>
                                      (not
                                        (=
                                          ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                          18))
                                      (and
                                        (not
                                          (=
                                            ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                            18))
                                        (or
                                          (not
                                            (=
                                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                              19))
                                          (=
                                            ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                            19))))
                                    (or
                                      (not
                                        (=
                                          ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                          18))
                                      (=
                                        ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                        18))))
                                (or
                                  (not
                                    (=
                                      ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                      17))
                                  (=
                                    ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                    17))))
                            (or
                              (not
                                (=
                                  ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                  16))
                              (=
                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                16))))
                        (or
                          (not
                            (=
                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                              15))
                          (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 15))))
                    (or
                      (not
                        (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 14))
                      (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 14))))
                (or
                  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 13))
                  (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 13))))
            (or
              (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 12))
              (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 12))))
        (or
          (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 11))
          (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 11))))
    (or
      (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 10))
      (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 10)))))
(assert (or
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 9))
  (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 9)))
(pop) ; 19
(pop) ; 18
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 8))
  (and
    (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 8))
    (=>
      (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 9))
      (and
        (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 9))
        (=>
          (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 10))
          (and
            (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 10))
            (=>
              (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 11))
              (and
                (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 11))
                (=>
                  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 12))
                  (and
                    (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 12))
                    (=>
                      (not
                        (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 13))
                      (and
                        (not
                          (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 13))
                        (=>
                          (not
                            (=
                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                              14))
                          (and
                            (not
                              (=
                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                14))
                            (=>
                              (not
                                (=
                                  ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                  15))
                              (and
                                (not
                                  (=
                                    ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                    15))
                                (=>
                                  (not
                                    (=
                                      ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                      16))
                                  (and
                                    (not
                                      (=
                                        ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                        16))
                                    (=>
                                      (not
                                        (=
                                          ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                          17))
                                      (and
                                        (not
                                          (=
                                            ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                            17))
                                        (=>
                                          (not
                                            (=
                                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                              18))
                                          (and
                                            (not
                                              (=
                                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                18))
                                            (or
                                              (not
                                                (=
                                                  ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                  19))
                                              (=
                                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                19))))
                                        (or
                                          (not
                                            (=
                                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                              18))
                                          (=
                                            ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                            18))))
                                    (or
                                      (not
                                        (=
                                          ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                          17))
                                      (=
                                        ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                        17))))
                                (or
                                  (not
                                    (=
                                      ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                      16))
                                  (=
                                    ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                    16))))
                            (or
                              (not
                                (=
                                  ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                  15))
                              (=
                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                15))))
                        (or
                          (not
                            (=
                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                              14))
                          (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 14))))
                    (or
                      (not
                        (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 13))
                      (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 13))))
                (or
                  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 12))
                  (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 12))))
            (or
              (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 11))
              (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 11))))
        (or
          (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 10))
          (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 10))))
    (or
      (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 9))
      (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 9)))))
(assert (or
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 8))
  (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 8)))
(pop) ; 17
(pop) ; 16
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 7))
  (and
    (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 7))
    (=>
      (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 8))
      (and
        (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 8))
        (=>
          (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 9))
          (and
            (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 9))
            (=>
              (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 10))
              (and
                (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 10))
                (=>
                  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 11))
                  (and
                    (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 11))
                    (=>
                      (not
                        (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 12))
                      (and
                        (not
                          (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 12))
                        (=>
                          (not
                            (=
                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                              13))
                          (and
                            (not
                              (=
                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                13))
                            (=>
                              (not
                                (=
                                  ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                  14))
                              (and
                                (not
                                  (=
                                    ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                    14))
                                (=>
                                  (not
                                    (=
                                      ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                      15))
                                  (and
                                    (not
                                      (=
                                        ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                        15))
                                    (=>
                                      (not
                                        (=
                                          ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                          16))
                                      (and
                                        (not
                                          (=
                                            ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                            16))
                                        (=>
                                          (not
                                            (=
                                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                              17))
                                          (and
                                            (not
                                              (=
                                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                17))
                                            (=>
                                              (not
                                                (=
                                                  ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                  18))
                                              (and
                                                (not
                                                  (=
                                                    ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                    18))
                                                (or
                                                  (not
                                                    (=
                                                      ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                      19))
                                                  (=
                                                    ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                    19))))
                                            (or
                                              (not
                                                (=
                                                  ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                  18))
                                              (=
                                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                18))))
                                        (or
                                          (not
                                            (=
                                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                              17))
                                          (=
                                            ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                            17))))
                                    (or
                                      (not
                                        (=
                                          ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                          16))
                                      (=
                                        ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                        16))))
                                (or
                                  (not
                                    (=
                                      ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                      15))
                                  (=
                                    ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                    15))))
                            (or
                              (not
                                (=
                                  ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                  14))
                              (=
                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                14))))
                        (or
                          (not
                            (=
                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                              13))
                          (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 13))))
                    (or
                      (not
                        (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 12))
                      (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 12))))
                (or
                  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 11))
                  (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 11))))
            (or
              (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 10))
              (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 10))))
        (or
          (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 9))
          (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 9))))
    (or
      (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 8))
      (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 8)))))
(assert (or
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 7))
  (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 7)))
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 6))
  (and
    (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 6))
    (=>
      (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 7))
      (and
        (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 7))
        (=>
          (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 8))
          (and
            (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 8))
            (=>
              (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 9))
              (and
                (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 9))
                (=>
                  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 10))
                  (and
                    (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 10))
                    (=>
                      (not
                        (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 11))
                      (and
                        (not
                          (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 11))
                        (=>
                          (not
                            (=
                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                              12))
                          (and
                            (not
                              (=
                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                12))
                            (=>
                              (not
                                (=
                                  ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                  13))
                              (and
                                (not
                                  (=
                                    ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                    13))
                                (=>
                                  (not
                                    (=
                                      ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                      14))
                                  (and
                                    (not
                                      (=
                                        ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                        14))
                                    (=>
                                      (not
                                        (=
                                          ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                          15))
                                      (and
                                        (not
                                          (=
                                            ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                            15))
                                        (=>
                                          (not
                                            (=
                                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                              16))
                                          (and
                                            (not
                                              (=
                                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                16))
                                            (=>
                                              (not
                                                (=
                                                  ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                  17))
                                              (and
                                                (not
                                                  (=
                                                    ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                    17))
                                                (=>
                                                  (not
                                                    (=
                                                      ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                      18))
                                                  (and
                                                    (not
                                                      (=
                                                        ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                        18))
                                                    (or
                                                      (not
                                                        (=
                                                          ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                          19))
                                                      (=
                                                        ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                        19))))
                                                (or
                                                  (not
                                                    (=
                                                      ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                      18))
                                                  (=
                                                    ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                    18))))
                                            (or
                                              (not
                                                (=
                                                  ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                  17))
                                              (=
                                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                17))))
                                        (or
                                          (not
                                            (=
                                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                              16))
                                          (=
                                            ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                            16))))
                                    (or
                                      (not
                                        (=
                                          ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                          15))
                                      (=
                                        ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                        15))))
                                (or
                                  (not
                                    (=
                                      ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                      14))
                                  (=
                                    ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                    14))))
                            (or
                              (not
                                (=
                                  ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                  13))
                              (=
                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                13))))
                        (or
                          (not
                            (=
                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                              12))
                          (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 12))))
                    (or
                      (not
                        (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 11))
                      (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 11))))
                (or
                  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 10))
                  (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 10))))
            (or
              (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 9))
              (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 9))))
        (or
          (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 8))
          (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 8))))
    (or
      (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 7))
      (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 7)))))
(assert (or
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 6))
  (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 6)))
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 5))
  (and
    (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 5))
    (=>
      (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 6))
      (and
        (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 6))
        (=>
          (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 7))
          (and
            (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 7))
            (=>
              (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 8))
              (and
                (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 8))
                (=>
                  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 9))
                  (and
                    (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 9))
                    (=>
                      (not
                        (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 10))
                      (and
                        (not
                          (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 10))
                        (=>
                          (not
                            (=
                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                              11))
                          (and
                            (not
                              (=
                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                11))
                            (=>
                              (not
                                (=
                                  ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                  12))
                              (and
                                (not
                                  (=
                                    ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                    12))
                                (=>
                                  (not
                                    (=
                                      ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                      13))
                                  (and
                                    (not
                                      (=
                                        ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                        13))
                                    (=>
                                      (not
                                        (=
                                          ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                          14))
                                      (and
                                        (not
                                          (=
                                            ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                            14))
                                        (=>
                                          (not
                                            (=
                                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                              15))
                                          (and
                                            (not
                                              (=
                                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                15))
                                            (=>
                                              (not
                                                (=
                                                  ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                  16))
                                              (and
                                                (not
                                                  (=
                                                    ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                    16))
                                                (=>
                                                  (not
                                                    (=
                                                      ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                      17))
                                                  (and
                                                    (not
                                                      (=
                                                        ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                        17))
                                                    (=>
                                                      (not
                                                        (=
                                                          ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                          18))
                                                      (and
                                                        (not
                                                          (=
                                                            ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                            18))
                                                        (or
                                                          (not
                                                            (=
                                                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                              19))
                                                          (=
                                                            ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                            19))))
                                                    (or
                                                      (not
                                                        (=
                                                          ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                          18))
                                                      (=
                                                        ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                        18))))
                                                (or
                                                  (not
                                                    (=
                                                      ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                      17))
                                                  (=
                                                    ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                    17))))
                                            (or
                                              (not
                                                (=
                                                  ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                  16))
                                              (=
                                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                16))))
                                        (or
                                          (not
                                            (=
                                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                              15))
                                          (=
                                            ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                            15))))
                                    (or
                                      (not
                                        (=
                                          ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                          14))
                                      (=
                                        ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                        14))))
                                (or
                                  (not
                                    (=
                                      ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                      13))
                                  (=
                                    ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                    13))))
                            (or
                              (not
                                (=
                                  ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                  12))
                              (=
                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                12))))
                        (or
                          (not
                            (=
                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                              11))
                          (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 11))))
                    (or
                      (not
                        (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 10))
                      (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 10))))
                (or
                  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 9))
                  (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 9))))
            (or
              (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 8))
              (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 8))))
        (or
          (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 7))
          (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 7))))
    (or
      (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 6))
      (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 6)))))
(assert (or
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 5))
  (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 5)))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 4))
  (and
    (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 4))
    (=>
      (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 5))
      (and
        (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 5))
        (=>
          (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 6))
          (and
            (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 6))
            (=>
              (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 7))
              (and
                (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 7))
                (=>
                  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 8))
                  (and
                    (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 8))
                    (=>
                      (not
                        (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 9))
                      (and
                        (not
                          (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 9))
                        (=>
                          (not
                            (=
                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                              10))
                          (and
                            (not
                              (=
                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                10))
                            (=>
                              (not
                                (=
                                  ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                  11))
                              (and
                                (not
                                  (=
                                    ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                    11))
                                (=>
                                  (not
                                    (=
                                      ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                      12))
                                  (and
                                    (not
                                      (=
                                        ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                        12))
                                    (=>
                                      (not
                                        (=
                                          ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                          13))
                                      (and
                                        (not
                                          (=
                                            ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                            13))
                                        (=>
                                          (not
                                            (=
                                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                              14))
                                          (and
                                            (not
                                              (=
                                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                14))
                                            (=>
                                              (not
                                                (=
                                                  ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                  15))
                                              (and
                                                (not
                                                  (=
                                                    ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                    15))
                                                (=>
                                                  (not
                                                    (=
                                                      ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                      16))
                                                  (and
                                                    (not
                                                      (=
                                                        ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                        16))
                                                    (=>
                                                      (not
                                                        (=
                                                          ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                          17))
                                                      (and
                                                        (not
                                                          (=
                                                            ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                            17))
                                                        (=>
                                                          (not
                                                            (=
                                                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                              18))
                                                          (and
                                                            (not
                                                              (=
                                                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                18))
                                                            (or
                                                              (not
                                                                (=
                                                                  ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                  19))
                                                              (=
                                                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                19))))
                                                        (or
                                                          (not
                                                            (=
                                                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                              18))
                                                          (=
                                                            ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                            18))))
                                                    (or
                                                      (not
                                                        (=
                                                          ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                          17))
                                                      (=
                                                        ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                        17))))
                                                (or
                                                  (not
                                                    (=
                                                      ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                      16))
                                                  (=
                                                    ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                    16))))
                                            (or
                                              (not
                                                (=
                                                  ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                  15))
                                              (=
                                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                15))))
                                        (or
                                          (not
                                            (=
                                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                              14))
                                          (=
                                            ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                            14))))
                                    (or
                                      (not
                                        (=
                                          ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                          13))
                                      (=
                                        ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                        13))))
                                (or
                                  (not
                                    (=
                                      ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                      12))
                                  (=
                                    ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                    12))))
                            (or
                              (not
                                (=
                                  ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                  11))
                              (=
                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                11))))
                        (or
                          (not
                            (=
                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                              10))
                          (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 10))))
                    (or
                      (not
                        (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 9))
                      (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 9))))
                (or
                  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 8))
                  (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 8))))
            (or
              (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 7))
              (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 7))))
        (or
          (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 6))
          (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 6))))
    (or
      (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 5))
      (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 5)))))
(assert (or
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 4))
  (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 4)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 3))
  (and
    (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 3))
    (=>
      (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 4))
      (and
        (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 4))
        (=>
          (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 5))
          (and
            (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 5))
            (=>
              (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 6))
              (and
                (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 6))
                (=>
                  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 7))
                  (and
                    (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 7))
                    (=>
                      (not
                        (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 8))
                      (and
                        (not
                          (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 8))
                        (=>
                          (not
                            (=
                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                              9))
                          (and
                            (not
                              (=
                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                9))
                            (=>
                              (not
                                (=
                                  ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                  10))
                              (and
                                (not
                                  (=
                                    ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                    10))
                                (=>
                                  (not
                                    (=
                                      ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                      11))
                                  (and
                                    (not
                                      (=
                                        ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                        11))
                                    (=>
                                      (not
                                        (=
                                          ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                          12))
                                      (and
                                        (not
                                          (=
                                            ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                            12))
                                        (=>
                                          (not
                                            (=
                                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                              13))
                                          (and
                                            (not
                                              (=
                                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                13))
                                            (=>
                                              (not
                                                (=
                                                  ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                  14))
                                              (and
                                                (not
                                                  (=
                                                    ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                    14))
                                                (=>
                                                  (not
                                                    (=
                                                      ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                      15))
                                                  (and
                                                    (not
                                                      (=
                                                        ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                        15))
                                                    (=>
                                                      (not
                                                        (=
                                                          ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                          16))
                                                      (and
                                                        (not
                                                          (=
                                                            ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                            16))
                                                        (=>
                                                          (not
                                                            (=
                                                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                              17))
                                                          (and
                                                            (not
                                                              (=
                                                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                17))
                                                            (=>
                                                              (not
                                                                (=
                                                                  ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                  18))
                                                              (and
                                                                (not
                                                                  (=
                                                                    ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                    18))
                                                                (or
                                                                  (not
                                                                    (=
                                                                      ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                      19))
                                                                  (=
                                                                    ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                    19))))
                                                            (or
                                                              (not
                                                                (=
                                                                  ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                  18))
                                                              (=
                                                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                18))))
                                                        (or
                                                          (not
                                                            (=
                                                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                              17))
                                                          (=
                                                            ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                            17))))
                                                    (or
                                                      (not
                                                        (=
                                                          ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                          16))
                                                      (=
                                                        ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                        16))))
                                                (or
                                                  (not
                                                    (=
                                                      ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                      15))
                                                  (=
                                                    ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                    15))))
                                            (or
                                              (not
                                                (=
                                                  ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                  14))
                                              (=
                                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                14))))
                                        (or
                                          (not
                                            (=
                                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                              13))
                                          (=
                                            ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                            13))))
                                    (or
                                      (not
                                        (=
                                          ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                          12))
                                      (=
                                        ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                        12))))
                                (or
                                  (not
                                    (=
                                      ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                      11))
                                  (=
                                    ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                    11))))
                            (or
                              (not
                                (=
                                  ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                  10))
                              (=
                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                10))))
                        (or
                          (not
                            (=
                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                              9))
                          (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 9))))
                    (or
                      (not
                        (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 8))
                      (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 8))))
                (or
                  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 7))
                  (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 7))))
            (or
              (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 6))
              (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 6))))
        (or
          (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 5))
          (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 5))))
    (or
      (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 4))
      (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 4)))))
(assert (or
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 3))
  (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 3)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 2))
  (and
    (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 2))
    (=>
      (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 3))
      (and
        (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 3))
        (=>
          (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 4))
          (and
            (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 4))
            (=>
              (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 5))
              (and
                (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 5))
                (=>
                  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 6))
                  (and
                    (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 6))
                    (=>
                      (not
                        (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 7))
                      (and
                        (not
                          (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 7))
                        (=>
                          (not
                            (=
                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                              8))
                          (and
                            (not
                              (=
                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                8))
                            (=>
                              (not
                                (=
                                  ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                  9))
                              (and
                                (not
                                  (=
                                    ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                    9))
                                (=>
                                  (not
                                    (=
                                      ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                      10))
                                  (and
                                    (not
                                      (=
                                        ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                        10))
                                    (=>
                                      (not
                                        (=
                                          ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                          11))
                                      (and
                                        (not
                                          (=
                                            ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                            11))
                                        (=>
                                          (not
                                            (=
                                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                              12))
                                          (and
                                            (not
                                              (=
                                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                12))
                                            (=>
                                              (not
                                                (=
                                                  ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                  13))
                                              (and
                                                (not
                                                  (=
                                                    ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                    13))
                                                (=>
                                                  (not
                                                    (=
                                                      ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                      14))
                                                  (and
                                                    (not
                                                      (=
                                                        ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                        14))
                                                    (=>
                                                      (not
                                                        (=
                                                          ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                          15))
                                                      (and
                                                        (not
                                                          (=
                                                            ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                            15))
                                                        (=>
                                                          (not
                                                            (=
                                                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                              16))
                                                          (and
                                                            (not
                                                              (=
                                                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                16))
                                                            (=>
                                                              (not
                                                                (=
                                                                  ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                  17))
                                                              (and
                                                                (not
                                                                  (=
                                                                    ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                    17))
                                                                (=>
                                                                  (not
                                                                    (=
                                                                      ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                      18))
                                                                  (and
                                                                    (not
                                                                      (=
                                                                        ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                        18))
                                                                    (or
                                                                      (not
                                                                        (=
                                                                          ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                          19))
                                                                      (=
                                                                        ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                        19))))
                                                                (or
                                                                  (not
                                                                    (=
                                                                      ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                      18))
                                                                  (=
                                                                    ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                    18))))
                                                            (or
                                                              (not
                                                                (=
                                                                  ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                  17))
                                                              (=
                                                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                17))))
                                                        (or
                                                          (not
                                                            (=
                                                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                              16))
                                                          (=
                                                            ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                            16))))
                                                    (or
                                                      (not
                                                        (=
                                                          ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                          15))
                                                      (=
                                                        ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                        15))))
                                                (or
                                                  (not
                                                    (=
                                                      ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                      14))
                                                  (=
                                                    ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                    14))))
                                            (or
                                              (not
                                                (=
                                                  ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                  13))
                                              (=
                                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                13))))
                                        (or
                                          (not
                                            (=
                                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                              12))
                                          (=
                                            ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                            12))))
                                    (or
                                      (not
                                        (=
                                          ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                          11))
                                      (=
                                        ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                        11))))
                                (or
                                  (not
                                    (=
                                      ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                      10))
                                  (=
                                    ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                    10))))
                            (or
                              (not
                                (=
                                  ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                  9))
                              (=
                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                9))))
                        (or
                          (not
                            (=
                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                              8))
                          (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 8))))
                    (or
                      (not
                        (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 7))
                      (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 7))))
                (or
                  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 6))
                  (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 6))))
            (or
              (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 5))
              (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 5))))
        (or
          (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 4))
          (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 4))))
    (or
      (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 3))
      (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 3)))))
(assert (or
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 2))
  (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 2)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 1))
  (and
    (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 1))
    (=>
      (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 2))
      (and
        (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 2))
        (=>
          (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 3))
          (and
            (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 3))
            (=>
              (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 4))
              (and
                (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 4))
                (=>
                  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 5))
                  (and
                    (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 5))
                    (=>
                      (not
                        (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 6))
                      (and
                        (not
                          (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 6))
                        (=>
                          (not
                            (=
                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                              7))
                          (and
                            (not
                              (=
                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                7))
                            (=>
                              (not
                                (=
                                  ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                  8))
                              (and
                                (not
                                  (=
                                    ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                    8))
                                (=>
                                  (not
                                    (=
                                      ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                      9))
                                  (and
                                    (not
                                      (=
                                        ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                        9))
                                    (=>
                                      (not
                                        (=
                                          ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                          10))
                                      (and
                                        (not
                                          (=
                                            ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                            10))
                                        (=>
                                          (not
                                            (=
                                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                              11))
                                          (and
                                            (not
                                              (=
                                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                11))
                                            (=>
                                              (not
                                                (=
                                                  ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                  12))
                                              (and
                                                (not
                                                  (=
                                                    ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                    12))
                                                (=>
                                                  (not
                                                    (=
                                                      ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                      13))
                                                  (and
                                                    (not
                                                      (=
                                                        ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                        13))
                                                    (=>
                                                      (not
                                                        (=
                                                          ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                          14))
                                                      (and
                                                        (not
                                                          (=
                                                            ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                            14))
                                                        (=>
                                                          (not
                                                            (=
                                                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                              15))
                                                          (and
                                                            (not
                                                              (=
                                                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                15))
                                                            (=>
                                                              (not
                                                                (=
                                                                  ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                  16))
                                                              (and
                                                                (not
                                                                  (=
                                                                    ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                    16))
                                                                (=>
                                                                  (not
                                                                    (=
                                                                      ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                      17))
                                                                  (and
                                                                    (not
                                                                      (=
                                                                        ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                        17))
                                                                    (=>
                                                                      (not
                                                                        (=
                                                                          ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                          18))
                                                                      (and
                                                                        (not
                                                                          (=
                                                                            ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                            18))
                                                                        (or
                                                                          (not
                                                                            (=
                                                                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                              19))
                                                                          (=
                                                                            ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                            19))))
                                                                    (or
                                                                      (not
                                                                        (=
                                                                          ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                          18))
                                                                      (=
                                                                        ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                        18))))
                                                                (or
                                                                  (not
                                                                    (=
                                                                      ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                      17))
                                                                  (=
                                                                    ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                    17))))
                                                            (or
                                                              (not
                                                                (=
                                                                  ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                  16))
                                                              (=
                                                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                16))))
                                                        (or
                                                          (not
                                                            (=
                                                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                              15))
                                                          (=
                                                            ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                            15))))
                                                    (or
                                                      (not
                                                        (=
                                                          ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                          14))
                                                      (=
                                                        ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                        14))))
                                                (or
                                                  (not
                                                    (=
                                                      ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                      13))
                                                  (=
                                                    ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                    13))))
                                            (or
                                              (not
                                                (=
                                                  ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                  12))
                                              (=
                                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                12))))
                                        (or
                                          (not
                                            (=
                                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                              11))
                                          (=
                                            ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                            11))))
                                    (or
                                      (not
                                        (=
                                          ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                          10))
                                      (=
                                        ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                        10))))
                                (or
                                  (not
                                    (=
                                      ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                      9))
                                  (=
                                    ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                    9))))
                            (or
                              (not
                                (=
                                  ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                  8))
                              (=
                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                8))))
                        (or
                          (not
                            (=
                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                              7))
                          (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 7))))
                    (or
                      (not
                        (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 6))
                      (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 6))))
                (or
                  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 5))
                  (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 5))))
            (or
              (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 4))
              (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 4))))
        (or
          (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 3))
          (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 3))))
    (or
      (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 2))
      (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 2)))))
(assert (or
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 1))
  (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 1)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 0))
  (and
    (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 0))
    (=>
      (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 1))
      (and
        (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 1))
        (=>
          (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 2))
          (and
            (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 2))
            (=>
              (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 3))
              (and
                (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 3))
                (=>
                  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 4))
                  (and
                    (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 4))
                    (=>
                      (not
                        (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 5))
                      (and
                        (not
                          (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 5))
                        (=>
                          (not
                            (=
                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                              6))
                          (and
                            (not
                              (=
                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                6))
                            (=>
                              (not
                                (=
                                  ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                  7))
                              (and
                                (not
                                  (=
                                    ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                    7))
                                (=>
                                  (not
                                    (=
                                      ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                      8))
                                  (and
                                    (not
                                      (=
                                        ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                        8))
                                    (=>
                                      (not
                                        (=
                                          ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                          9))
                                      (and
                                        (not
                                          (=
                                            ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                            9))
                                        (=>
                                          (not
                                            (=
                                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                              10))
                                          (and
                                            (not
                                              (=
                                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                10))
                                            (=>
                                              (not
                                                (=
                                                  ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                  11))
                                              (and
                                                (not
                                                  (=
                                                    ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                    11))
                                                (=>
                                                  (not
                                                    (=
                                                      ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                      12))
                                                  (and
                                                    (not
                                                      (=
                                                        ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                        12))
                                                    (=>
                                                      (not
                                                        (=
                                                          ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                          13))
                                                      (and
                                                        (not
                                                          (=
                                                            ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                            13))
                                                        (=>
                                                          (not
                                                            (=
                                                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                              14))
                                                          (and
                                                            (not
                                                              (=
                                                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                14))
                                                            (=>
                                                              (not
                                                                (=
                                                                  ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                  15))
                                                              (and
                                                                (not
                                                                  (=
                                                                    ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                    15))
                                                                (=>
                                                                  (not
                                                                    (=
                                                                      ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                      16))
                                                                  (and
                                                                    (not
                                                                      (=
                                                                        ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                        16))
                                                                    (=>
                                                                      (not
                                                                        (=
                                                                          ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                          17))
                                                                      (and
                                                                        (not
                                                                          (=
                                                                            ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                            17))
                                                                        (=>
                                                                          (not
                                                                            (=
                                                                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                              18))
                                                                          (and
                                                                            (not
                                                                              (=
                                                                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                                18))
                                                                            (or
                                                                              (not
                                                                                (=
                                                                                  ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                                  19))
                                                                              (=
                                                                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                                19))))
                                                                        (or
                                                                          (not
                                                                            (=
                                                                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                              18))
                                                                          (=
                                                                            ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                            18))))
                                                                    (or
                                                                      (not
                                                                        (=
                                                                          ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                          17))
                                                                      (=
                                                                        ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                        17))))
                                                                (or
                                                                  (not
                                                                    (=
                                                                      ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                      16))
                                                                  (=
                                                                    ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                    16))))
                                                            (or
                                                              (not
                                                                (=
                                                                  ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                  15))
                                                              (=
                                                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                                15))))
                                                        (or
                                                          (not
                                                            (=
                                                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                              14))
                                                          (=
                                                            ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                            14))))
                                                    (or
                                                      (not
                                                        (=
                                                          ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                          13))
                                                      (=
                                                        ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                        13))))
                                                (or
                                                  (not
                                                    (=
                                                      ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                      12))
                                                  (=
                                                    ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                    12))))
                                            (or
                                              (not
                                                (=
                                                  ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                  11))
                                              (=
                                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                                11))))
                                        (or
                                          (not
                                            (=
                                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                              10))
                                          (=
                                            ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                            10))))
                                    (or
                                      (not
                                        (=
                                          ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                          9))
                                      (=
                                        ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                        9))))
                                (or
                                  (not
                                    (=
                                      ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                      8))
                                  (=
                                    ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                    8))))
                            (or
                              (not
                                (=
                                  ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                  7))
                              (=
                                ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                                7))))
                        (or
                          (not
                            (=
                              ($SortWrappers.$SnapToInt ($Snap.first $t@1@00))
                              6))
                          (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 6))))
                    (or
                      (not
                        (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 5))
                      (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 5))))
                (or
                  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 4))
                  (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 4))))
            (or
              (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 3))
              (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 3))))
        (or
          (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 2))
          (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 2))))
    (or
      (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 1))
      (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 1)))))
(assert (or
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 0))
  (= ($SortWrappers.$SnapToInt ($Snap.first $t@1@00)) 0)))
(pop) ; 1
