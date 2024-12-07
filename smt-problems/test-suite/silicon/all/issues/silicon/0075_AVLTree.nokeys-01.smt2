(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:50:40
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0075_AVLTree.nokeys.vpr
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
(declare-fun headvalid%trigger ($Snap $Ref) Bool)
(declare-fun valid%trigger ($Snap $Ref) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ---------- headvalid ----------
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
; [eval] this.root != null
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
; [eval] this.root != null
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
; [eval] this.root != null
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@1@00)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | First:($t@1@00) != Null | live]
; [else-branch: 2 | First:($t@1@00) == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 2 | First:($t@1@00) != Null]
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
; [eval] this.root != null
; [then-branch: 3 | First:($t@1@00) != Null | dead]
; [else-branch: 3 | First:($t@1@00) == Null | live]
(push) ; 3
; [else-branch: 3 | First:($t@1@00) == Null]
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@1@00))) $Snap.unit))
; [eval] this.root != null
; [then-branch: 4 | First:($t@1@00) != Null | dead]
; [else-branch: 4 | First:($t@1@00) == Null | live]
(push) ; 4
; [else-branch: 4 | First:($t@1@00) == Null]
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@1@00))) $Snap.unit))
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- valid ----------
(declare-const this@2@00 $Ref)
(push) ; 1
(declare-const $t@3@00 $Snap)
(assert (= $t@3@00 ($Snap.combine ($Snap.first $t@3@00) ($Snap.second $t@3@00))))
(assert (not (= this@2@00 $Ref.null)))
(assert (=
  ($Snap.second $t@3@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@3@00))
    ($Snap.second ($Snap.second $t@3@00)))))
(assert (=
  ($Snap.second ($Snap.second $t@3@00))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@3@00)))
    ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@3@00)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@3@00))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))
; [eval] this.left != null
(push) ; 2
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@3@00))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@3@00))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | First:(Second:(Second:($t@3@00))) != Null | live]
; [else-branch: 5 | First:(Second:(Second:($t@3@00))) == Null | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 5 | First:(Second:(Second:($t@3@00))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@3@00))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))
; [eval] this.left != null
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@3@00))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | First:(Second:(Second:($t@3@00))) != Null | live]
; [else-branch: 6 | First:(Second:(Second:($t@3@00))) == Null | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 6 | First:(Second:(Second:($t@3@00))) != Null]
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  this@2@00
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))
; [eval] this.left != null
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@3@00))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | First:(Second:(Second:($t@3@00))) != Null | live]
; [else-branch: 7 | First:(Second:(Second:($t@3@00))) == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 7 | First:(Second:(Second:($t@3@00))) != Null]
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  this@2@00
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@3@00)))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))
  $Snap.unit))
; [eval] this.left != null ==> this.left.height > 0
; [eval] this.left != null
(set-option :timeout 0)
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@3@00))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | First:(Second:(Second:($t@3@00))) != Null | live]
; [else-branch: 8 | First:(Second:(Second:($t@3@00))) == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 8 | First:(Second:(Second:($t@3@00))) != Null]
; [eval] this.left.height > 0
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@3@00))))
      $Ref.null))
  (>
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))
    0)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))
; [eval] this.right != null
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | First:(Second:(Second:(Second:($t@3@00)))) != Null | live]
; [else-branch: 9 | First:(Second:(Second:(Second:($t@3@00)))) == Null | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 9 | First:(Second:(Second:(Second:($t@3@00)))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))
    $Ref.null)))
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@3@00))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))))
; [eval] this.right != null
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | First:(Second:(Second:(Second:($t@3@00)))) != Null | live]
; [else-branch: 10 | First:(Second:(Second:(Second:($t@3@00)))) == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 10 | First:(Second:(Second:(Second:($t@3@00)))) != Null]
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@3@00))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  this@2@00
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))))
; [eval] this.right != null
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | First:(Second:(Second:(Second:($t@3@00)))) != Null | live]
; [else-branch: 11 | First:(Second:(Second:(Second:($t@3@00)))) == Null | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 11 | First:(Second:(Second:(Second:($t@3@00)))) != Null]
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@3@00))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  this@2@00
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))
  $Snap.unit))
; [eval] this.right != null ==> this.right.height > 0
; [eval] this.right != null
(set-option :timeout 0)
(push) ; 8
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | First:(Second:(Second:(Second:($t@3@00)))) != Null | live]
; [else-branch: 12 | First:(Second:(Second:(Second:($t@3@00)))) == Null | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 12 | First:(Second:(Second:(Second:($t@3@00)))) != Null]
; [eval] this.right.height > 0
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))
      $Ref.null))
  (>
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))
    0)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))))
  $Snap.unit))
; [eval] this.height == ((this.left == null ? 0 : this.left.height) > (this.right == null ? 0 : this.right.height) ? (this.left == null ? 0 : this.left.height) + 1 : (this.right == null ? 0 : this.right.height) + 1)
; [eval] ((this.left == null ? 0 : this.left.height) > (this.right == null ? 0 : this.right.height) ? (this.left == null ? 0 : this.left.height) + 1 : (this.right == null ? 0 : this.right.height) + 1)
; [eval] (this.left == null ? 0 : this.left.height) > (this.right == null ? 0 : this.right.height)
; [eval] (this.left == null ? 0 : this.left.height)
; [eval] this.left == null
(push) ; 8
; [then-branch: 13 | First:(Second:(Second:($t@3@00))) == Null | dead]
; [else-branch: 13 | First:(Second:(Second:($t@3@00))) != Null | live]
(push) ; 9
; [else-branch: 13 | First:(Second:(Second:($t@3@00))) != Null]
(pop) ; 9
(pop) ; 8
; Joined path conditions
; [eval] (this.right == null ? 0 : this.right.height)
; [eval] this.right == null
(push) ; 8
; [then-branch: 14 | First:(Second:(Second:(Second:($t@3@00)))) == Null | dead]
; [else-branch: 14 | First:(Second:(Second:(Second:($t@3@00)))) != Null | live]
(push) ; 9
; [else-branch: 14 | First:(Second:(Second:(Second:($t@3@00)))) != Null]
(pop) ; 9
(pop) ; 8
; Joined path conditions
(push) ; 8
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (>
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (>
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 15 | First:(Second:(Second:(Second:(Second:(Second:(Second:($t@3@00))))))) > First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:($t@3@00))))))))))) | live]
; [else-branch: 15 | !(First:(Second:(Second:(Second:(Second:(Second:(Second:($t@3@00))))))) > First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:($t@3@00)))))))))))) | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 15 | First:(Second:(Second:(Second:(Second:(Second:(Second:($t@3@00))))))) > First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:($t@3@00)))))))))))]
(assert (>
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))))
; [eval] (this.left == null ? 0 : this.left.height) + 1
; [eval] (this.left == null ? 0 : this.left.height)
; [eval] this.left == null
(push) ; 10
; [then-branch: 16 | First:(Second:(Second:($t@3@00))) == Null | dead]
; [else-branch: 16 | First:(Second:(Second:($t@3@00))) != Null | live]
(push) ; 11
; [else-branch: 16 | First:(Second:(Second:($t@3@00))) != Null]
(pop) ; 11
(pop) ; 10
; Joined path conditions
(pop) ; 9
(push) ; 9
; [else-branch: 15 | !(First:(Second:(Second:(Second:(Second:(Second:(Second:($t@3@00))))))) > First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:($t@3@00))))))))))))]
(assert (not
  (>
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))))
; [eval] (this.right == null ? 0 : this.right.height) + 1
; [eval] (this.right == null ? 0 : this.right.height)
; [eval] this.right == null
(push) ; 10
; [then-branch: 17 | First:(Second:(Second:(Second:($t@3@00)))) == Null | dead]
; [else-branch: 17 | First:(Second:(Second:(Second:($t@3@00)))) != Null | live]
(push) ; 11
; [else-branch: 17 | First:(Second:(Second:(Second:($t@3@00)))) != Null]
(pop) ; 11
(pop) ; 10
; Joined path conditions
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (>
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))))
  (>
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@3@00)))
  (ite
    (>
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))
    (+
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))
      1)
    (+
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))
      1))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))))
  $Snap.unit))
; [eval] this.balanceFactor == (this.left == null ? 0 : this.left.height) - (this.right == null ? 0 : this.right.height)
; [eval] (this.left == null ? 0 : this.left.height) - (this.right == null ? 0 : this.right.height)
; [eval] (this.left == null ? 0 : this.left.height)
; [eval] this.left == null
(push) ; 8
; [then-branch: 18 | First:(Second:(Second:($t@3@00))) == Null | dead]
; [else-branch: 18 | First:(Second:(Second:($t@3@00))) != Null | live]
(push) ; 9
; [else-branch: 18 | First:(Second:(Second:($t@3@00))) != Null]
(pop) ; 9
(pop) ; 8
; Joined path conditions
; [eval] (this.right == null ? 0 : this.right.height)
; [eval] this.right == null
(push) ; 8
; [then-branch: 19 | First:(Second:(Second:(Second:($t@3@00)))) == Null | dead]
; [else-branch: 19 | First:(Second:(Second:(Second:($t@3@00)))) != Null | live]
(push) ; 9
; [else-branch: 19 | First:(Second:(Second:(Second:($t@3@00)))) != Null]
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))
  (-
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))))))
  $Snap.unit))
; [eval] this.balanceFactor <= 1
(assert (<=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))
  1))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))))))
  $Snap.unit))
; [eval] this.balanceFactor >= -1
; [eval] -1
(assert (>=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))
  (- 0 1)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))))))
  $Snap.unit))
; [eval] this.height > 0
(assert (> ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@3@00))) 0))
(pop) ; 7
(pop) ; 6
(pop) ; 5
(push) ; 5
; [else-branch: 9 | First:(Second:(Second:(Second:($t@3@00)))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))
  $Ref.null))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))))
; [eval] this.right != null
; [then-branch: 20 | First:(Second:(Second:(Second:($t@3@00)))) != Null | dead]
; [else-branch: 20 | First:(Second:(Second:(Second:($t@3@00)))) == Null | live]
(push) ; 6
; [else-branch: 20 | First:(Second:(Second:(Second:($t@3@00)))) == Null]
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))))
; [eval] this.right != null
; [then-branch: 21 | First:(Second:(Second:(Second:($t@3@00)))) != Null | dead]
; [else-branch: 21 | First:(Second:(Second:(Second:($t@3@00)))) == Null | live]
(push) ; 7
; [else-branch: 21 | First:(Second:(Second:(Second:($t@3@00)))) == Null]
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))
  $Snap.unit))
; [eval] this.right != null ==> this.right.height > 0
; [eval] this.right != null
(push) ; 8
; [then-branch: 22 | First:(Second:(Second:(Second:($t@3@00)))) != Null | dead]
; [else-branch: 22 | First:(Second:(Second:(Second:($t@3@00)))) == Null | live]
(push) ; 9
; [else-branch: 22 | First:(Second:(Second:(Second:($t@3@00)))) == Null]
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))))
  $Snap.unit))
; [eval] this.height == ((this.left == null ? 0 : this.left.height) > (this.right == null ? 0 : this.right.height) ? (this.left == null ? 0 : this.left.height) + 1 : (this.right == null ? 0 : this.right.height) + 1)
; [eval] ((this.left == null ? 0 : this.left.height) > (this.right == null ? 0 : this.right.height) ? (this.left == null ? 0 : this.left.height) + 1 : (this.right == null ? 0 : this.right.height) + 1)
; [eval] (this.left == null ? 0 : this.left.height) > (this.right == null ? 0 : this.right.height)
; [eval] (this.left == null ? 0 : this.left.height)
; [eval] this.left == null
(push) ; 8
; [then-branch: 23 | First:(Second:(Second:($t@3@00))) == Null | dead]
; [else-branch: 23 | First:(Second:(Second:($t@3@00))) != Null | live]
(push) ; 9
; [else-branch: 23 | First:(Second:(Second:($t@3@00))) != Null]
(pop) ; 9
(pop) ; 8
; Joined path conditions
; [eval] (this.right == null ? 0 : this.right.height)
; [eval] this.right == null
(push) ; 8
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 24 | First:(Second:(Second:(Second:($t@3@00)))) == Null | live]
; [else-branch: 24 | First:(Second:(Second:(Second:($t@3@00)))) != Null | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 24 | First:(Second:(Second:(Second:($t@3@00)))) == Null]
(pop) ; 9
(pop) ; 8
; Joined path conditions
(push) ; 8
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (>
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))
    0))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (>
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))
  0)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 25 | First:(Second:(Second:(Second:(Second:(Second:(Second:($t@3@00))))))) > 0 | live]
; [else-branch: 25 | !(First:(Second:(Second:(Second:(Second:(Second:(Second:($t@3@00))))))) > 0) | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 25 | First:(Second:(Second:(Second:(Second:(Second:(Second:($t@3@00))))))) > 0]
(assert (>
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))
  0))
; [eval] (this.left == null ? 0 : this.left.height) + 1
; [eval] (this.left == null ? 0 : this.left.height)
; [eval] this.left == null
(push) ; 10
; [then-branch: 26 | First:(Second:(Second:($t@3@00))) == Null | dead]
; [else-branch: 26 | First:(Second:(Second:($t@3@00))) != Null | live]
(push) ; 11
; [else-branch: 26 | First:(Second:(Second:($t@3@00))) != Null]
(pop) ; 11
(pop) ; 10
; Joined path conditions
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (>
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))
  0))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@3@00)))
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))
    1)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))))
  $Snap.unit))
; [eval] this.balanceFactor == (this.left == null ? 0 : this.left.height) - (this.right == null ? 0 : this.right.height)
; [eval] (this.left == null ? 0 : this.left.height) - (this.right == null ? 0 : this.right.height)
; [eval] (this.left == null ? 0 : this.left.height)
; [eval] this.left == null
(push) ; 8
; [then-branch: 27 | First:(Second:(Second:($t@3@00))) == Null | dead]
; [else-branch: 27 | First:(Second:(Second:($t@3@00))) != Null | live]
(push) ; 9
; [else-branch: 27 | First:(Second:(Second:($t@3@00))) != Null]
(pop) ; 9
(pop) ; 8
; Joined path conditions
; [eval] (this.right == null ? 0 : this.right.height)
; [eval] this.right == null
(push) ; 8
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 28 | First:(Second:(Second:(Second:($t@3@00)))) == Null | live]
; [else-branch: 28 | First:(Second:(Second:(Second:($t@3@00)))) != Null | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 28 | First:(Second:(Second:(Second:($t@3@00)))) == Null]
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))))))
  $Snap.unit))
; [eval] this.balanceFactor <= 1
(assert (<=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))
  1))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))))))
  $Snap.unit))
; [eval] this.balanceFactor >= -1
; [eval] -1
(assert (>=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))
  (- 0 1)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))))))
  $Snap.unit))
; [eval] this.height > 0
(assert (> ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@3@00))) 0))
(pop) ; 7
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(push) ; 2
; [else-branch: 5 | First:(Second:(Second:($t@3@00))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@3@00))))
  $Ref.null))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))
; [eval] this.left != null
; [then-branch: 29 | First:(Second:(Second:($t@3@00))) != Null | dead]
; [else-branch: 29 | First:(Second:(Second:($t@3@00))) == Null | live]
(push) ; 3
; [else-branch: 29 | First:(Second:(Second:($t@3@00))) == Null]
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))
; [eval] this.left != null
; [then-branch: 30 | First:(Second:(Second:($t@3@00))) != Null | dead]
; [else-branch: 30 | First:(Second:(Second:($t@3@00))) == Null | live]
(push) ; 4
; [else-branch: 30 | First:(Second:(Second:($t@3@00))) == Null]
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))
  $Snap.unit))
; [eval] this.left != null ==> this.left.height > 0
; [eval] this.left != null
(push) ; 5
; [then-branch: 31 | First:(Second:(Second:($t@3@00))) != Null | dead]
; [else-branch: 31 | First:(Second:(Second:($t@3@00))) == Null | live]
(push) ; 6
; [else-branch: 31 | First:(Second:(Second:($t@3@00))) == Null]
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))
; [eval] this.right != null
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 32 | First:(Second:(Second:(Second:($t@3@00)))) != Null | live]
; [else-branch: 32 | First:(Second:(Second:(Second:($t@3@00)))) == Null | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 32 | First:(Second:(Second:(Second:($t@3@00)))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))))
; [eval] this.right != null
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 33 | First:(Second:(Second:(Second:($t@3@00)))) != Null | live]
; [else-branch: 33 | First:(Second:(Second:(Second:($t@3@00)))) == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 33 | First:(Second:(Second:(Second:($t@3@00)))) != Null]
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  this@2@00
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))))
; [eval] this.right != null
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 34 | First:(Second:(Second:(Second:($t@3@00)))) != Null | live]
; [else-branch: 34 | First:(Second:(Second:(Second:($t@3@00)))) == Null | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 34 | First:(Second:(Second:(Second:($t@3@00)))) != Null]
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  this@2@00
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))
  $Snap.unit))
; [eval] this.right != null ==> this.right.height > 0
; [eval] this.right != null
(set-option :timeout 0)
(push) ; 8
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 35 | First:(Second:(Second:(Second:($t@3@00)))) != Null | live]
; [else-branch: 35 | First:(Second:(Second:(Second:($t@3@00)))) == Null | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 35 | First:(Second:(Second:(Second:($t@3@00)))) != Null]
; [eval] this.right.height > 0
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))
      $Ref.null))
  (>
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))
    0)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))))
  $Snap.unit))
; [eval] this.height == ((this.left == null ? 0 : this.left.height) > (this.right == null ? 0 : this.right.height) ? (this.left == null ? 0 : this.left.height) + 1 : (this.right == null ? 0 : this.right.height) + 1)
; [eval] ((this.left == null ? 0 : this.left.height) > (this.right == null ? 0 : this.right.height) ? (this.left == null ? 0 : this.left.height) + 1 : (this.right == null ? 0 : this.right.height) + 1)
; [eval] (this.left == null ? 0 : this.left.height) > (this.right == null ? 0 : this.right.height)
; [eval] (this.left == null ? 0 : this.left.height)
; [eval] this.left == null
(push) ; 8
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@3@00))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 36 | First:(Second:(Second:($t@3@00))) == Null | live]
; [else-branch: 36 | First:(Second:(Second:($t@3@00))) != Null | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 36 | First:(Second:(Second:($t@3@00))) == Null]
(pop) ; 9
(pop) ; 8
; Joined path conditions
; [eval] (this.right == null ? 0 : this.right.height)
; [eval] this.right == null
(push) ; 8
; [then-branch: 37 | First:(Second:(Second:(Second:($t@3@00)))) == Null | dead]
; [else-branch: 37 | First:(Second:(Second:(Second:($t@3@00)))) != Null | live]
(push) ; 9
; [else-branch: 37 | First:(Second:(Second:(Second:($t@3@00)))) != Null]
(pop) ; 9
(pop) ; 8
; Joined path conditions
(push) ; 8
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (>
    0
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 38 | 0 > First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:($t@3@00))))))))))) | dead]
; [else-branch: 38 | !(0 > First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:($t@3@00)))))))))))) | live]
(set-option :timeout 0)
(push) ; 9
; [else-branch: 38 | !(0 > First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:($t@3@00))))))))))))]
(assert (not
  (>
    0
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))))
; [eval] (this.right == null ? 0 : this.right.height) + 1
; [eval] (this.right == null ? 0 : this.right.height)
; [eval] this.right == null
(push) ; 10
; [then-branch: 39 | First:(Second:(Second:(Second:($t@3@00)))) == Null | dead]
; [else-branch: 39 | First:(Second:(Second:(Second:($t@3@00)))) != Null | live]
(push) ; 11
; [else-branch: 39 | First:(Second:(Second:(Second:($t@3@00)))) != Null]
(pop) ; 11
(pop) ; 10
; Joined path conditions
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (not
  (>
    0
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@3@00)))
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))
    1)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))))
  $Snap.unit))
; [eval] this.balanceFactor == (this.left == null ? 0 : this.left.height) - (this.right == null ? 0 : this.right.height)
; [eval] (this.left == null ? 0 : this.left.height) - (this.right == null ? 0 : this.right.height)
; [eval] (this.left == null ? 0 : this.left.height)
; [eval] this.left == null
(push) ; 8
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@3@00))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 40 | First:(Second:(Second:($t@3@00))) == Null | live]
; [else-branch: 40 | First:(Second:(Second:($t@3@00))) != Null | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 40 | First:(Second:(Second:($t@3@00))) == Null]
(pop) ; 9
(pop) ; 8
; Joined path conditions
; [eval] (this.right == null ? 0 : this.right.height)
; [eval] this.right == null
(push) ; 8
; [then-branch: 41 | First:(Second:(Second:(Second:($t@3@00)))) == Null | dead]
; [else-branch: 41 | First:(Second:(Second:(Second:($t@3@00)))) != Null | live]
(push) ; 9
; [else-branch: 41 | First:(Second:(Second:(Second:($t@3@00)))) != Null]
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))
  (-
    0
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))))))
  $Snap.unit))
; [eval] this.balanceFactor <= 1
(assert (<=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))
  1))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))))))
  $Snap.unit))
; [eval] this.balanceFactor >= -1
; [eval] -1
(assert (>=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))
  (- 0 1)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))))))
  $Snap.unit))
; [eval] this.height > 0
(assert (> ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@3@00))) 0))
(pop) ; 7
(pop) ; 6
(pop) ; 5
(push) ; 5
; [else-branch: 32 | First:(Second:(Second:(Second:($t@3@00)))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))
  $Ref.null))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))))
; [eval] this.right != null
; [then-branch: 42 | First:(Second:(Second:(Second:($t@3@00)))) != Null | dead]
; [else-branch: 42 | First:(Second:(Second:(Second:($t@3@00)))) == Null | live]
(push) ; 6
; [else-branch: 42 | First:(Second:(Second:(Second:($t@3@00)))) == Null]
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))))
; [eval] this.right != null
; [then-branch: 43 | First:(Second:(Second:(Second:($t@3@00)))) != Null | dead]
; [else-branch: 43 | First:(Second:(Second:(Second:($t@3@00)))) == Null | live]
(push) ; 7
; [else-branch: 43 | First:(Second:(Second:(Second:($t@3@00)))) == Null]
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))
  $Snap.unit))
; [eval] this.right != null ==> this.right.height > 0
; [eval] this.right != null
(push) ; 8
; [then-branch: 44 | First:(Second:(Second:(Second:($t@3@00)))) != Null | dead]
; [else-branch: 44 | First:(Second:(Second:(Second:($t@3@00)))) == Null | live]
(push) ; 9
; [else-branch: 44 | First:(Second:(Second:(Second:($t@3@00)))) == Null]
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))))
  $Snap.unit))
; [eval] this.height == ((this.left == null ? 0 : this.left.height) > (this.right == null ? 0 : this.right.height) ? (this.left == null ? 0 : this.left.height) + 1 : (this.right == null ? 0 : this.right.height) + 1)
; [eval] ((this.left == null ? 0 : this.left.height) > (this.right == null ? 0 : this.right.height) ? (this.left == null ? 0 : this.left.height) + 1 : (this.right == null ? 0 : this.right.height) + 1)
; [eval] (this.left == null ? 0 : this.left.height) > (this.right == null ? 0 : this.right.height)
; [eval] (this.left == null ? 0 : this.left.height)
; [eval] this.left == null
(push) ; 8
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@3@00))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 45 | First:(Second:(Second:($t@3@00))) == Null | live]
; [else-branch: 45 | First:(Second:(Second:($t@3@00))) != Null | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 45 | First:(Second:(Second:($t@3@00))) == Null]
(pop) ; 9
(pop) ; 8
; Joined path conditions
; [eval] (this.right == null ? 0 : this.right.height)
; [eval] this.right == null
(push) ; 8
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 46 | First:(Second:(Second:(Second:($t@3@00)))) == Null | live]
; [else-branch: 46 | First:(Second:(Second:(Second:($t@3@00)))) != Null | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 46 | First:(Second:(Second:(Second:($t@3@00)))) == Null]
(pop) ; 9
(pop) ; 8
; Joined path conditions
(push) ; 8
; [then-branch: 47 | False | dead]
; [else-branch: 47 | True | live]
(push) ; 9
; [else-branch: 47 | True]
; [eval] (this.right == null ? 0 : this.right.height) + 1
; [eval] (this.right == null ? 0 : this.right.height)
; [eval] this.right == null
(push) ; 10
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 48 | First:(Second:(Second:(Second:($t@3@00)))) == Null | live]
; [else-branch: 48 | First:(Second:(Second:(Second:($t@3@00)))) != Null | dead]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 48 | First:(Second:(Second:(Second:($t@3@00)))) == Null]
(pop) ; 11
(pop) ; 10
; Joined path conditions
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@3@00))) 1))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))))
  $Snap.unit))
; [eval] this.balanceFactor == (this.left == null ? 0 : this.left.height) - (this.right == null ? 0 : this.right.height)
; [eval] (this.left == null ? 0 : this.left.height) - (this.right == null ? 0 : this.right.height)
; [eval] (this.left == null ? 0 : this.left.height)
; [eval] this.left == null
(push) ; 8
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@3@00))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 49 | First:(Second:(Second:($t@3@00))) == Null | live]
; [else-branch: 49 | First:(Second:(Second:($t@3@00))) != Null | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 49 | First:(Second:(Second:($t@3@00))) == Null]
(pop) ; 9
(pop) ; 8
; Joined path conditions
; [eval] (this.right == null ? 0 : this.right.height)
; [eval] this.right == null
(push) ; 8
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 50 | First:(Second:(Second:(Second:($t@3@00)))) == Null | live]
; [else-branch: 50 | First:(Second:(Second:(Second:($t@3@00)))) != Null | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 50 | First:(Second:(Second:(Second:($t@3@00)))) == Null]
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))
  0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))))))
  $Snap.unit))
; [eval] this.balanceFactor <= 1
(assert (<=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))
  1))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))))))
  $Snap.unit))
; [eval] this.balanceFactor >= -1
; [eval] -1
(assert (>=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00))))))
  (- 0 1)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@3@00)))))))))))))))))
  $Snap.unit))
; [eval] this.height > 0
(assert (> ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@3@00))) 0))
(pop) ; 7
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
