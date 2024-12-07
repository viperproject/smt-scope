(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:42:06
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/chalice/AVLTree.iterative.vpr
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
(declare-fun valid1%trigger ($Snap $Ref) Bool)
(declare-fun valid%trigger ($Snap $Ref) Bool)
(declare-fun validRest%trigger ($Snap $Ref) Bool)
(declare-fun rightValid%trigger ($Snap $Ref) Bool)
(declare-fun leftValid%trigger ($Snap $Ref) Bool)
(declare-fun leftOpen%trigger ($Snap $Ref) Bool)
(declare-fun rightOpen%trigger ($Snap $Ref) Bool)
(declare-fun udParentValid%trigger ($Snap $Ref) Bool)
(declare-fun udValid%trigger ($Snap $Ref) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ---------- valid1 ----------
(declare-const this@0@00 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@1@00 $Snap)
(assert (= $t@1@00 ($Snap.combine ($Snap.first $t@1@00) ($Snap.second $t@1@00))))
(assert (not (= this@0@00 $Ref.null)))
(assert (=
  ($Snap.second $t@1@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@1@00))
    ($Snap.second ($Snap.second $t@1@00)))))
; [eval] this.root1 != null
(push) ; 2
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@1@00)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@1@00)) $Ref.null))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | First:($t@1@00) != Null | live]
; [else-branch: 0 | First:($t@1@00) == Null | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 0 | First:($t@1@00) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@1@00)) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second $t@1@00))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@1@00)))
    ($Snap.second ($Snap.second ($Snap.second $t@1@00))))))
; [eval] this.root1 != null
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@1@00)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | First:($t@1@00) != Null | live]
; [else-branch: 1 | First:($t@1@00) == Null | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | First:($t@1@00) != Null]
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@1@00)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@1@00))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@1@00)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@1@00)))) $Snap.unit))
; [eval] this.root1 != null ==> this.root1.parent == null
; [eval] this.root1 != null
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@1@00)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | First:($t@1@00) != Null | live]
; [else-branch: 2 | First:($t@1@00) == Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 2 | First:($t@1@00) != Null]
; [eval] this.root1.parent == null
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@1@00)) $Ref.null))
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@1@00))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@1@00))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@1@00)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@1@00))))))))
; [eval] this.root1 != null
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@1@00)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | First:($t@1@00) != Null | live]
; [else-branch: 3 | First:($t@1@00) == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 3 | First:($t@1@00) != Null]
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@1@00)))))
  $Snap.unit))
; [eval] this.root1 != null ==> this.root1.root == this.root1
; [eval] this.root1 != null
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@1@00)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | First:($t@1@00) != Null | live]
; [else-branch: 4 | First:($t@1@00) == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 4 | First:($t@1@00) != Null]
; [eval] this.root1.root == this.root1
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@1@00)) $Ref.null))
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@1@00))))))
    ($SortWrappers.$SnapTo$Ref ($Snap.first $t@1@00)))))
(pop) ; 4
(pop) ; 3
(pop) ; 2
(push) ; 2
; [else-branch: 0 | First:($t@1@00) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@1@00)) $Ref.null))
(assert (= ($Snap.first ($Snap.second $t@1@00)) $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second $t@1@00))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@1@00)))
    ($Snap.second ($Snap.second ($Snap.second $t@1@00))))))
; [eval] this.root1 != null
; [then-branch: 5 | First:($t@1@00) != Null | dead]
; [else-branch: 5 | First:($t@1@00) == Null | live]
(push) ; 3
; [else-branch: 5 | First:($t@1@00) == Null]
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@1@00))) $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@1@00)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@1@00))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@1@00)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@1@00)))) $Snap.unit))
; [eval] this.root1 != null ==> this.root1.parent == null
; [eval] this.root1 != null
(push) ; 4
; [then-branch: 6 | First:($t@1@00) != Null | dead]
; [else-branch: 6 | First:($t@1@00) == Null | live]
(push) ; 5
; [else-branch: 6 | First:($t@1@00) == Null]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@1@00))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@1@00)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@1@00))))))))
; [eval] this.root1 != null
; [then-branch: 7 | First:($t@1@00) != Null | dead]
; [else-branch: 7 | First:($t@1@00) == Null | live]
(push) ; 4
; [else-branch: 7 | First:($t@1@00) == Null]
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@1@00)))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@1@00)))))
  $Snap.unit))
; [eval] this.root1 != null ==> this.root1.root == this.root1
; [eval] this.root1 != null
(push) ; 5
; [then-branch: 8 | First:($t@1@00) != Null | dead]
; [else-branch: 8 | First:($t@1@00) == Null | live]
(push) ; 6
; [else-branch: 8 | First:($t@1@00) == Null]
(pop) ; 6
(pop) ; 5
; Joined path conditions
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- valid ----------
(declare-const this@2@00 $Ref)
(push) ; 1
(declare-const $t@3@00 $Snap)
(assert (= $t@3@00 ($Snap.combine ($Snap.first $t@3@00) ($Snap.second $t@3@00))))
(assert (=
  ($Snap.second $t@3@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@3@00))
    ($Snap.second ($Snap.second $t@3@00)))))
(pop) ; 1
; ---------- validRest ----------
(declare-const this@4@00 $Ref)
(push) ; 1
(declare-const $t@5@00 $Snap)
(assert (= $t@5@00 ($Snap.combine ($Snap.first $t@5@00) ($Snap.second $t@5@00))))
(assert (not (= this@4@00 $Ref.null)))
(assert (=
  ($Snap.second $t@5@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@5@00))
    ($Snap.second ($Snap.second $t@5@00)))))
(assert (=
  ($Snap.second ($Snap.second $t@5@00))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@5@00)))
    ($Snap.second ($Snap.second ($Snap.second $t@5@00))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@5@00)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@5@00))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@5@00)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@5@00))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@5@00)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@5@00))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@5@00)))))
  $Snap.unit))
; [eval] this.right != this.left || this.right == null
; [eval] this.right != this.left
(push) ; 2
; [then-branch: 9 | First:(Second:(Second:(Second:($t@5@00)))) != First:(Second:(Second:($t@5@00))) | live]
; [else-branch: 9 | First:(Second:(Second:(Second:($t@5@00)))) == First:(Second:(Second:($t@5@00))) | live]
(push) ; 3
; [then-branch: 9 | First:(Second:(Second:(Second:($t@5@00)))) != First:(Second:(Second:($t@5@00)))]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@5@00)))))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@5@00)))))))
(pop) ; 3
(push) ; 3
; [else-branch: 9 | First:(Second:(Second:(Second:($t@5@00)))) == First:(Second:(Second:($t@5@00)))]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@5@00)))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@5@00))))))
; [eval] this.right == null
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@5@00)))))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@5@00)))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@5@00)))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@5@00))))))))
(assert (or
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@5@00)))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@5@00))))))
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@5@00)))))
    $Ref.null)))
(pop) ; 1
; ---------- rightValid ----------
(declare-const this@6@00 $Ref)
(push) ; 1
(declare-const $t@7@00 $Snap)
(assert (= $t@7@00 ($Snap.combine ($Snap.first $t@7@00) ($Snap.second $t@7@00))))
(assert (not (= this@6@00 $Ref.null)))
(assert (=
  ($Snap.second $t@7@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@7@00))
    ($Snap.second ($Snap.second $t@7@00)))))
(assert (=
  ($Snap.second ($Snap.second $t@7@00))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@7@00)))
    ($Snap.second ($Snap.second ($Snap.second $t@7@00))))))
; [eval] this.right != null
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
; [then-branch: 10 | First:($t@7@00) != Null | live]
; [else-branch: 10 | First:($t@7@00) == Null | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 10 | First:($t@7@00) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@7@00)) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@7@00)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@7@00))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@7@00)))))))
; [eval] this.right != null
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@7@00)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | First:($t@7@00) != Null | live]
; [else-branch: 11 | First:($t@7@00) == Null | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 11 | First:($t@7@00) != Null]
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@7@00))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@7@00)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@7@00))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@7@00)))))
  $Snap.unit))
; [eval] this.right != null ==> this.right.parent == this
; [eval] this.right != null
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@7@00)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | First:($t@7@00) != Null | live]
; [else-branch: 12 | First:($t@7@00) == Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 12 | First:($t@7@00) != Null]
; [eval] this.right.parent == this
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@7@00)) $Ref.null))
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@7@00)))))
    this@6@00)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@7@00)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@7@00))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@7@00)))))))))
; [eval] this.right != null
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@7@00)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 13 | First:($t@7@00) != Null | live]
; [else-branch: 13 | First:($t@7@00) == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 13 | First:($t@7@00) != Null]
(push) ; 5
(set-option :timeout 10)
(assert (not (= this@6@00 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@7@00)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@7@00))))))
  $Snap.unit))
; [eval] this.right != null ==> this.right.root == this.root
; [eval] this.right != null
(set-option :timeout 0)
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@7@00)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 14 | First:($t@7@00) != Null | live]
; [else-branch: 14 | First:($t@7@00) == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 14 | First:($t@7@00) != Null]
; [eval] this.right.root == this.root
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@7@00)) $Ref.null))
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@7@00)))))))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@7@00))))))
(pop) ; 4
(pop) ; 3
(pop) ; 2
(push) ; 2
; [else-branch: 10 | First:($t@7@00) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@7@00)) $Ref.null))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@7@00))) $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@7@00)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@7@00))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@7@00)))))))
; [eval] this.right != null
; [then-branch: 15 | First:($t@7@00) != Null | dead]
; [else-branch: 15 | First:($t@7@00) == Null | live]
(push) ; 3
; [else-branch: 15 | First:($t@7@00) == Null]
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@7@00)))) $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@7@00))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@7@00)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@7@00))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@7@00)))))
  $Snap.unit))
; [eval] this.right != null ==> this.right.parent == this
; [eval] this.right != null
(push) ; 4
; [then-branch: 16 | First:($t@7@00) != Null | dead]
; [else-branch: 16 | First:($t@7@00) == Null | live]
(push) ; 5
; [else-branch: 16 | First:($t@7@00) == Null]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@7@00)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@7@00))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@7@00)))))))))
; [eval] this.right != null
; [then-branch: 17 | First:($t@7@00) != Null | dead]
; [else-branch: 17 | First:($t@7@00) == Null | live]
(push) ; 4
; [else-branch: 17 | First:($t@7@00) == Null]
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@7@00))))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@7@00))))))
  $Snap.unit))
; [eval] this.right != null ==> this.right.root == this.root
; [eval] this.right != null
(push) ; 5
; [then-branch: 18 | First:($t@7@00) != Null | dead]
; [else-branch: 18 | First:($t@7@00) == Null | live]
(push) ; 6
; [else-branch: 18 | First:($t@7@00) == Null]
(pop) ; 6
(pop) ; 5
; Joined path conditions
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- leftValid ----------
(declare-const this@8@00 $Ref)
(push) ; 1
(declare-const $t@9@00 $Snap)
(assert (= $t@9@00 ($Snap.combine ($Snap.first $t@9@00) ($Snap.second $t@9@00))))
(assert (not (= this@8@00 $Ref.null)))
(assert (=
  ($Snap.second $t@9@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@9@00))
    ($Snap.second ($Snap.second $t@9@00)))))
(assert (=
  ($Snap.second ($Snap.second $t@9@00))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@9@00)))
    ($Snap.second ($Snap.second ($Snap.second $t@9@00))))))
; [eval] this.left != null
(push) ; 2
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@9@00)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@9@00)) $Ref.null))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 19 | First:($t@9@00) != Null | live]
; [else-branch: 19 | First:($t@9@00) == Null | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 19 | First:($t@9@00) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@9@00)) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@9@00)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@9@00))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@9@00)))))))
; [eval] this.left != null
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@9@00)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 20 | First:($t@9@00) != Null | live]
; [else-branch: 20 | First:($t@9@00) == Null | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 20 | First:($t@9@00) != Null]
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@9@00))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@9@00)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@9@00))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@9@00)))))
  $Snap.unit))
; [eval] this.left != null ==> this.left.parent == this
; [eval] this.left != null
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@9@00)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 21 | First:($t@9@00) != Null | live]
; [else-branch: 21 | First:($t@9@00) == Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 21 | First:($t@9@00) != Null]
; [eval] this.left.parent == this
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@9@00)) $Ref.null))
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@9@00)))))
    this@8@00)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@9@00)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@9@00))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@9@00)))))))))
; [eval] this.left != null
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@9@00)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 22 | First:($t@9@00) != Null | live]
; [else-branch: 22 | First:($t@9@00) == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 22 | First:($t@9@00) != Null]
(push) ; 5
(set-option :timeout 10)
(assert (not (= this@8@00 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@9@00)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@9@00))))))
  $Snap.unit))
; [eval] this.left != null ==> this.left.root == this.root
; [eval] this.left != null
(set-option :timeout 0)
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@9@00)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 23 | First:($t@9@00) != Null | live]
; [else-branch: 23 | First:($t@9@00) == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 23 | First:($t@9@00) != Null]
; [eval] this.left.root == this.root
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@9@00)) $Ref.null))
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@9@00)))))))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@9@00))))))
(pop) ; 4
(pop) ; 3
(pop) ; 2
(push) ; 2
; [else-branch: 19 | First:($t@9@00) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@9@00)) $Ref.null))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@9@00))) $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@9@00)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@9@00))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@9@00)))))))
; [eval] this.left != null
; [then-branch: 24 | First:($t@9@00) != Null | dead]
; [else-branch: 24 | First:($t@9@00) == Null | live]
(push) ; 3
; [else-branch: 24 | First:($t@9@00) == Null]
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@9@00)))) $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@9@00))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@9@00)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@9@00))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@9@00)))))
  $Snap.unit))
; [eval] this.left != null ==> this.left.parent == this
; [eval] this.left != null
(push) ; 4
; [then-branch: 25 | First:($t@9@00) != Null | dead]
; [else-branch: 25 | First:($t@9@00) == Null | live]
(push) ; 5
; [else-branch: 25 | First:($t@9@00) == Null]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@9@00)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@9@00))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@9@00)))))))))
; [eval] this.left != null
; [then-branch: 26 | First:($t@9@00) != Null | dead]
; [else-branch: 26 | First:($t@9@00) == Null | live]
(push) ; 4
; [else-branch: 26 | First:($t@9@00) == Null]
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@9@00))))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@9@00))))))
  $Snap.unit))
; [eval] this.left != null ==> this.left.root == this.root
; [eval] this.left != null
(push) ; 5
; [then-branch: 27 | First:($t@9@00) != Null | dead]
; [else-branch: 27 | First:($t@9@00) == Null | live]
(push) ; 6
; [else-branch: 27 | First:($t@9@00) == Null]
(pop) ; 6
(pop) ; 5
; Joined path conditions
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- leftOpen ----------
(declare-const this@10@00 $Ref)
(push) ; 1
(declare-const $t@11@00 $Snap)
(assert (= $t@11@00 ($Snap.combine ($Snap.first $t@11@00) ($Snap.second $t@11@00))))
(assert (not (= this@10@00 $Ref.null)))
(assert (=
  ($Snap.second $t@11@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@11@00))
    ($Snap.second ($Snap.second $t@11@00)))))
(assert (=
  ($Snap.second ($Snap.second $t@11@00))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@11@00)))
    ($Snap.second ($Snap.second ($Snap.second $t@11@00))))))
; [eval] this.left != null
(push) ; 2
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@11@00)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@11@00)) $Ref.null))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 28 | First:($t@11@00) != Null | live]
; [else-branch: 28 | First:($t@11@00) == Null | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 28 | First:($t@11@00) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@11@00)) $Ref.null)))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@11@00))) $Snap.unit))
; [eval] this.left != null ==> this.left.parent == this
; [eval] this.left != null
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@11@00)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 29 | First:($t@11@00) != Null | live]
; [else-branch: 29 | First:($t@11@00) == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 29 | First:($t@11@00) != Null]
; [eval] this.left.parent == this
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@11@00)) $Ref.null))
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@11@00))))
    this@10@00)))
(pop) ; 2
(push) ; 2
; [else-branch: 28 | First:($t@11@00) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@11@00)) $Ref.null))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@11@00))) $Snap.unit))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@11@00))) $Snap.unit))
; [eval] this.left != null ==> this.left.parent == this
; [eval] this.left != null
(push) ; 3
; [then-branch: 30 | First:($t@11@00) != Null | dead]
; [else-branch: 30 | First:($t@11@00) == Null | live]
(push) ; 4
; [else-branch: 30 | First:($t@11@00) == Null]
(pop) ; 4
(pop) ; 3
; Joined path conditions
(pop) ; 2
(pop) ; 1
; ---------- rightOpen ----------
(declare-const this@12@00 $Ref)
(push) ; 1
(declare-const $t@13@00 $Snap)
(assert (= $t@13@00 ($Snap.combine ($Snap.first $t@13@00) ($Snap.second $t@13@00))))
(assert (not (= this@12@00 $Ref.null)))
(assert (=
  ($Snap.second $t@13@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@13@00))
    ($Snap.second ($Snap.second $t@13@00)))))
(assert (=
  ($Snap.second ($Snap.second $t@13@00))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@13@00)))
    ($Snap.second ($Snap.second ($Snap.second $t@13@00))))))
; [eval] this.right != null
(push) ; 2
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@13@00)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@13@00)) $Ref.null))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 31 | First:($t@13@00) != Null | live]
; [else-branch: 31 | First:($t@13@00) == Null | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 31 | First:($t@13@00) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@13@00)) $Ref.null)))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@13@00))) $Snap.unit))
; [eval] this.right != null ==> this.right.parent == this
; [eval] this.right != null
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@13@00)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 32 | First:($t@13@00) != Null | live]
; [else-branch: 32 | First:($t@13@00) == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 32 | First:($t@13@00) != Null]
; [eval] this.right.parent == this
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@13@00)) $Ref.null))
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@13@00))))
    this@12@00)))
(pop) ; 2
(push) ; 2
; [else-branch: 31 | First:($t@13@00) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@13@00)) $Ref.null))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@13@00))) $Snap.unit))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@13@00))) $Snap.unit))
; [eval] this.right != null ==> this.right.parent == this
; [eval] this.right != null
(push) ; 3
; [then-branch: 33 | First:($t@13@00) != Null | dead]
; [else-branch: 33 | First:($t@13@00) == Null | live]
(push) ; 4
; [else-branch: 33 | First:($t@13@00) == Null]
(pop) ; 4
(pop) ; 3
; Joined path conditions
(pop) ; 2
(pop) ; 1
; ---------- udParentValid ----------
(declare-const this@14@00 $Ref)
(push) ; 1
(declare-const $t@15@00 $Snap)
(assert (= $t@15@00 ($Snap.combine ($Snap.first $t@15@00) ($Snap.second $t@15@00))))
(assert (not (= this@14@00 $Ref.null)))
(assert (=
  ($Snap.second $t@15@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@15@00))
    ($Snap.second ($Snap.second $t@15@00)))))
(assert (=
  ($Snap.second ($Snap.second $t@15@00))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@15@00)))
    ($Snap.second ($Snap.second ($Snap.second $t@15@00))))))
; [eval] this.parent != null
(push) ; 2
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@15@00)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@15@00)) $Ref.null))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 34 | First:($t@15@00) != Null | live]
; [else-branch: 34 | First:($t@15@00) == Null | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 34 | First:($t@15@00) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@15@00)) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@15@00)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@15@00))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@00)))))))
; [eval] this.parent != null
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@15@00)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 35 | First:($t@15@00) != Null | live]
; [else-branch: 35 | First:($t@15@00) == Null | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 35 | First:($t@15@00) != Null]
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@00))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@00)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@00))))))))
; [eval] this.parent != null
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@15@00)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 36 | First:($t@15@00) != Null | live]
; [else-branch: 36 | First:($t@15@00) == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 36 | First:($t@15@00) != Null]
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@00)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@00))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@00)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@00))))))
  $Snap.unit))
; [eval] this.parent != null ==> this.parent.leftDown == (this.parent.left == this)
; [eval] this.parent != null
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@15@00)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 37 | First:($t@15@00) != Null | live]
; [else-branch: 37 | First:($t@15@00) == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 37 | First:($t@15@00) != Null]
; [eval] this.parent.leftDown == (this.parent.left == this)
; [eval] this.parent.left == this
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@15@00)) $Ref.null))
  (=
    ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@15@00)))))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@00))))))
      this@14@00))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@00))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@00)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@00))))))))))
; [eval] this.parent != null
(push) ; 5
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@15@00)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 38 | First:($t@15@00) != Null | live]
; [else-branch: 38 | First:($t@15@00) == Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 38 | First:($t@15@00) != Null]
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@00)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@00))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@00)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@00))))))))
  $Snap.unit))
; [eval] this.parent != null ==> !this.parent.leftDown == (this.parent.right == this)
; [eval] this.parent != null
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@15@00)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 39 | First:($t@15@00) != Null | live]
; [else-branch: 39 | First:($t@15@00) == Null | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 39 | First:($t@15@00) != Null]
; [eval] !this.parent.leftDown == (this.parent.right == this)
; [eval] !this.parent.leftDown
; [eval] this.parent.right == this
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@15@00)) $Ref.null))
  (=
    (not
      ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@15@00))))))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@00))))))))
      this@14@00))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@00))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@00)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@00))))))))))))
; [eval] this.parent != null
(push) ; 6
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@15@00)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 40 | First:($t@15@00) != Null | live]
; [else-branch: 40 | First:($t@15@00) == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 40 | First:($t@15@00) != Null]
(push) ; 7
(set-option :timeout 10)
(assert (not (= this@14@00 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@15@00)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@00)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@00))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@00)))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@00))))))))))
  $Snap.unit))
; [eval] this.parent != null ==> this.root == this.parent.root
; [eval] this.parent != null
(set-option :timeout 0)
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@15@00)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 41 | First:($t@15@00) != Null | live]
; [else-branch: 41 | First:($t@15@00) == Null | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 41 | First:($t@15@00) != Null]
; [eval] this.root == this.parent.root
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@15@00)) $Ref.null))
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@15@00)))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@00)))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@00))))))))))
  $Snap.unit))
; [eval] this.parent == null ==> this.root == this
; [eval] this.parent == null
(push) ; 7
; [then-branch: 42 | First:($t@15@00) == Null | dead]
; [else-branch: 42 | First:($t@15@00) != Null | live]
(push) ; 8
; [else-branch: 42 | First:($t@15@00) != Null]
(pop) ; 8
(pop) ; 7
; Joined path conditions
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(push) ; 2
; [else-branch: 34 | First:($t@15@00) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@15@00)) $Ref.null))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@15@00))) $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@15@00)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@15@00))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@00)))))))
; [eval] this.parent != null
; [then-branch: 43 | First:($t@15@00) != Null | dead]
; [else-branch: 43 | First:($t@15@00) == Null | live]
(push) ; 3
; [else-branch: 43 | First:($t@15@00) == Null]
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@15@00))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@00))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@00)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@00))))))))
; [eval] this.parent != null
; [then-branch: 44 | First:($t@15@00) != Null | dead]
; [else-branch: 44 | First:($t@15@00) == Null | live]
(push) ; 4
; [else-branch: 44 | First:($t@15@00) == Null]
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@00)))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@00)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@00))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@00)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@00))))))
  $Snap.unit))
; [eval] this.parent != null ==> this.parent.leftDown == (this.parent.left == this)
; [eval] this.parent != null
(push) ; 5
; [then-branch: 45 | First:($t@15@00) != Null | dead]
; [else-branch: 45 | First:($t@15@00) == Null | live]
(push) ; 6
; [else-branch: 45 | First:($t@15@00) == Null]
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@00))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@00)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@00))))))))))
; [eval] this.parent != null
; [then-branch: 46 | First:($t@15@00) != Null | dead]
; [else-branch: 46 | First:($t@15@00) == Null | live]
(push) ; 5
; [else-branch: 46 | First:($t@15@00) == Null]
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@00)))))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@00)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@00))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@00)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@00))))))))
  $Snap.unit))
; [eval] this.parent != null ==> !this.parent.leftDown == (this.parent.right == this)
; [eval] this.parent != null
(push) ; 6
; [then-branch: 47 | First:($t@15@00) != Null | dead]
; [else-branch: 47 | First:($t@15@00) == Null | live]
(push) ; 7
; [else-branch: 47 | First:($t@15@00) == Null]
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@00))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@00)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@00))))))))))))
; [eval] this.parent != null
; [then-branch: 48 | First:($t@15@00) != Null | dead]
; [else-branch: 48 | First:($t@15@00) == Null | live]
(push) ; 6
; [else-branch: 48 | First:($t@15@00) == Null]
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@00)))))))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@00)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@00))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@00)))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@00))))))))))
  $Snap.unit))
; [eval] this.parent != null ==> this.root == this.parent.root
; [eval] this.parent != null
(push) ; 7
; [then-branch: 49 | First:($t@15@00) != Null | dead]
; [else-branch: 49 | First:($t@15@00) == Null | live]
(push) ; 8
; [else-branch: 49 | First:($t@15@00) == Null]
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@00))))))))))
  $Snap.unit))
; [eval] this.parent == null ==> this.root == this
; [eval] this.parent == null
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@15@00)) $Ref.null))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 50 | First:($t@15@00) == Null | live]
; [else-branch: 50 | First:($t@15@00) != Null | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 50 | First:($t@15@00) == Null]
; [eval] this.root == this
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@15@00)) $Ref.null)
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@15@00)))
    this@14@00)))
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- udValid ----------
(declare-const this@16@00 $Ref)
(push) ; 1
(declare-const $t@17@00 $Snap)
(assert (= $t@17@00 ($Snap.combine ($Snap.first $t@17@00) ($Snap.second $t@17@00))))
(assert (not (= this@16@00 $Ref.null)))
(assert (=
  ($Snap.second $t@17@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@17@00))
    ($Snap.second ($Snap.second $t@17@00)))))
(assert (=
  ($Snap.second ($Snap.second $t@17@00))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@17@00)))
    ($Snap.second ($Snap.second ($Snap.second $t@17@00))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@17@00)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@00))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@17@00)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@17@00))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@17@00)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@17@00))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@17@00)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@17@00))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@17@00)))))))))
(push) ; 2
(set-option :timeout 10)
(assert (not (not ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@17@00))))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@17@00)))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 51 | First:(Second:($t@17@00)) | live]
; [else-branch: 51 | !(First:(Second:($t@17@00))) | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 51 | First:(Second:($t@17@00))]
(assert ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@17@00))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@17@00))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@17@00)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@17@00))))))))))
(push) ; 3
(set-option :timeout 10)
(assert (not (not ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@17@00))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 52 | First:(Second:($t@17@00)) | live]
; [else-branch: 52 | !(First:(Second:($t@17@00))) | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 52 | First:(Second:($t@17@00))]
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@17@00)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@17@00))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@17@00)))))))))))
; [eval] this.leftDown ==> false
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@17@00))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 53 | First:(Second:($t@17@00)) | live]
; [else-branch: 53 | !(First:(Second:($t@17@00))) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 53 | First:(Second:($t@17@00))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=> ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@17@00))) false))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 54 | First:(Second:($t@17@00)) ==> False | dead]
; [else-branch: 54 | !(First:(Second:($t@17@00)) ==> False) | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 54 | !(First:(Second:($t@17@00)) ==> False)]
(assert (not
  (=> ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@17@00))) false)))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@17@00))))))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@17@00))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@17@00)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@17@00))))))))))))
; [eval] this.leftDown ==> false
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (not ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@17@00))))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 55 | First:(Second:($t@17@00)) | live]
; [else-branch: 55 | !(First:(Second:($t@17@00))) | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 55 | First:(Second:($t@17@00))]
(pop) ; 6
(pop) ; 5
; Joined path conditions
; [then-branch: 56 | First:(Second:($t@17@00)) ==> False | dead]
; [else-branch: 56 | !(First:(Second:($t@17@00)) ==> False) | live]
(push) ; 5
; [else-branch: 56 | !(First:(Second:($t@17@00)) ==> False)]
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@17@00)))))))))
  $Snap.unit))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(push) ; 2
; [else-branch: 51 | !(First:(Second:($t@17@00)))]
(assert (not ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@17@00)))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@17@00))))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@17@00))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@17@00)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@17@00))))))))))
; [then-branch: 57 | First:(Second:($t@17@00)) | dead]
; [else-branch: 57 | !(First:(Second:($t@17@00))) | live]
(push) ; 3
; [else-branch: 57 | !(First:(Second:($t@17@00)))]
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@17@00)))))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@17@00)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@17@00))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@17@00)))))))))))
; [eval] this.leftDown ==> false
(push) ; 4
; [then-branch: 58 | First:(Second:($t@17@00)) | dead]
; [else-branch: 58 | !(First:(Second:($t@17@00))) | live]
(push) ; 5
; [else-branch: 58 | !(First:(Second:($t@17@00)))]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 59 | True | live]
; [else-branch: 59 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 59 | True]
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@17@00))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@17@00)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@17@00))))))))))))
; [eval] this.leftDown ==> false
(push) ; 5
; [then-branch: 60 | First:(Second:($t@17@00)) | dead]
; [else-branch: 60 | !(First:(Second:($t@17@00))) | live]
(push) ; 6
; [else-branch: 60 | !(First:(Second:($t@17@00)))]
(pop) ; 6
(pop) ; 5
; Joined path conditions
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 61 | True | live]
; [else-branch: 61 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 61 | True]
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
