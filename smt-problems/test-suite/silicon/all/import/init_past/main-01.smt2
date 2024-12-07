(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:44:34
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/import/init_past/main.vpr
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
(declare-sort LibA 0)
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
(declare-fun $SortWrappers.LibATo$Snap (LibA) $Snap)
(declare-fun $SortWrappers.$SnapToLibA ($Snap) LibA)
(assert (forall ((x LibA)) (!
    (= x ($SortWrappers.$SnapToLibA($SortWrappers.LibATo$Snap x)))
    :pattern (($SortWrappers.LibATo$Snap x))
    :qid |$Snap.$SnapToLibATo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.LibATo$Snap($SortWrappers.$SnapToLibA x)))
    :pattern (($SortWrappers.$SnapToLibA x))
    :qid |$Snap.LibATo$SnapToLibA|
    )))
; ////////// Symbols
(declare-fun foo<Bool> (Int) Bool)
; Declaring symbols related to program functions (from program analysis)
(declare-fun LibB ($Snap Int Bool) Bool)
(declare-fun LibB%limited ($Snap Int Bool) Bool)
(declare-fun LibB%stateless (Int Bool) Bool)
(declare-fun LibB%precondition ($Snap Int Bool) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((n Int)) (!
  (= (foo<Bool> n) true)
  :pattern ((foo<Bool> n))
  :qid |prog.bar|)))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ---------- FUNCTION LibB----------
(declare-fun a@0@00 () Int)
(declare-fun b@1@00 () Bool)
(declare-fun result@2@00 () Bool)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
(assert (= ($Snap.second ($Snap.second s@$)) $Snap.unit))
; [eval] foo(1)
(assert (foo<Bool> 1))
(declare-const $t@3@00 $Snap)
(assert (= $t@3@00 $Snap.unit))
; [eval] result == (b || foo(a))
; [eval] b || foo(a)
(push) ; 2
; [then-branch: 0 | b@1@00 | live]
; [else-branch: 0 | !(b@1@00) | live]
(push) ; 3
; [then-branch: 0 | b@1@00]
(assert b@1@00)
(pop) ; 3
(push) ; 3
; [else-branch: 0 | !(b@1@00)]
(assert (not b@1@00))
; [eval] foo(a)
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or (not b@1@00) b@1@00))
(assert (= result@2@00 (or b@1@00 (foo<Bool> a@0@00))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (a@0@00 Int) (b@1@00 Bool)) (!
  (= (LibB%limited s@$ a@0@00 b@1@00) (LibB s@$ a@0@00 b@1@00))
  :pattern ((LibB s@$ a@0@00 b@1@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (a@0@00 Int) (b@1@00 Bool)) (!
  (LibB%stateless a@0@00 b@1@00)
  :pattern ((LibB%limited s@$ a@0@00 b@1@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (a@0@00 Int) (b@1@00 Bool)) (!
  (let ((result@2@00 (LibB%limited s@$ a@0@00 b@1@00))) (=>
    (LibB%precondition s@$ a@0@00 b@1@00)
    (= result@2@00 (or b@1@00 (foo<Bool> a@0@00)))))
  :pattern ((LibB%limited s@$ a@0@00 b@1@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (a@0@00 Int) (b@1@00 Bool)) (!
  (let ((result@2@00 (LibB%limited s@$ a@0@00 b@1@00))) true)
  :pattern ((LibB%limited s@$ a@0@00 b@1@00))
  :qid |quant-u-3|)))
